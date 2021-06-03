
def measure(label, n=10, &block)

    elapsed_accum = 0.0
    elapsed2_accum = 0.0

    (0...n).each do
        tic = Time.utc
        block.call
        toc = Time.utc
        elapsed_ms = (toc - tic).total_nanoseconds / 1e6 #  converts seconds to millisecs
        elapsed_accum += elapsed_ms
        elapsed2_accum += (elapsed_ms * elapsed_ms)
    end

    mean = elapsed_accum / n
    mean2 = elapsed2_accum / n
    std = Math.sqrt( mean2 - mean*mean )
    puts "#{label} time taken: %.3f ± %.3f ms (#{n} runs)\n" % [mean, std ] # mean2, mean * mean]
end
