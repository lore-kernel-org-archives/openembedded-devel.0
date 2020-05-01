Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.5611.1588317364754043769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 00:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Oga0JL4G;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: robert.berger.oe.devel@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id e16so5398919wra.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 00:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mRJqWv42iu36DZdkv8V9ixV0SeGwRR2aNaV3GA9g/so=;
        b=Oga0JL4GjkYhgg6nTFlK+RIabhxbK/qt4IwyRLGrjaSUWu6rgrKUtssR0ugSmI5/UW
         qBqJjxzWo0Knj2gQCSTX83xFr9kcaN3mbq8/lsciPUzdTA3wIk6FbGfEkC1FTvdToG0r
         5nkXefeA2GVUIKy67zZUZGtZzL8slRELqqd6iQxQi8bkY0Ig4hR3T0LOoPaxFZDI05T7
         KihnwW48o/nEdbF9FuNwEfbWLK102hN7l+CBFkvmvb8gVHXS8QurQ73K/5jZmS/pEKAQ
         8GTO3wc6i/gHc8AWrgaHceCK0ISAOFMyhdGMjcBSkppVLsnMge6cqk8DRrh+tDklMw13
         0FPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mRJqWv42iu36DZdkv8V9ixV0SeGwRR2aNaV3GA9g/so=;
        b=FoantQ8eA+kBQC3t/Dqqg63YpC5bcu32Kb2MlrKiE1xarZxISVC3OpPo/zTCob9X69
         Cbs88R7uUJjCvuQRqd/AzfDDNbCtNxIRLhVzIRqk2RCtYLYN23HEeCyQAINdgXyodgju
         t6M3B6/L6r0mTY06t8ajR7FiERmk7jWiCXmN4h4cLsBXBUuLASWhBC8g7LxBbLGk9SSX
         u3tojlbGVIbZmERniKTz2hrbiHrxwICkDIa/ZhRRr3ICSYKjXKD9p2v/p4+jwzkYRkOP
         MocW8G1T9w4vhBB7KyHipp19Xdyx/jW+hdEWHRe/QmhRGQHncJCcaRLJs7MNVAeJc8y9
         IH1Q==
X-Gm-Message-State: AGi0PuZMudKhjohFNfXjJOhwnURXd3vU3CFnZAN/73WljGlsqD+Kc6Mx
	UxiK2AWYfUPM9GXXb+z+WoBAgZtB
X-Google-Smtp-Source: APiQypLHe6WrDU3FYCM2c6Y6UaKkaaO8zXtuMRZ80tUEzeqyRqbNf+rsE6SR+HKwq0KmI2yJY9SNqQ==
X-Received: by 2002:adf:bb4e:: with SMTP id x14mr2607610wrg.63.1588317362881;
        Fri, 01 May 2020 00:16:02 -0700 (PDT)
Return-Path: <robert.berger.oe.devel@gmail.com>
Received: from [192.168.42.52] (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id y70sm2848791wmc.36.2020.05.01.00.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 00:16:02 -0700 (PDT)
Subject: Re: [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
To: Richard Leitner <richard.leitner@skidata.com>
Cc: oecore.mailinglist@gmail.com, openembedded-devel@lists.openembedded.org
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
 <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
 <20200429130233.GB249641@pcleri>
 <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
 <cbc9dc58-61a7-8133-698c-6570f85f85f6@gmail.com>
 <20200430211745.GC410632@pcleri>
From: "Robert Berger" <robert.berger.oe.devel@gmail.com>
Message-ID: <8b4c6481-29ee-4e94-5754-2b5f5592e0d6@gmail.com>
Date: Fri, 1 May 2020 10:16:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430211745.GC410632@pcleri>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

What do you think about this fix? [1]

[1] 
https://github.com/RobertBerger/meta-java/commit/3db52ddcb7771e989cf39048a7b084d040d6b5b0

I am still building and testing, but it looks like this allows me to 
successfully build a jdk for x86 which runs in an x86 container with gcc-9.

It conditionally adds the required CLFAGS.

I will run a few more tests and see if it works as expected also for 
older gcc versions. When I tried last time I was only able to create a 
jdk with gcc-9 and whatever was on master-next which was also able to 
run without crashing. I am curious if with the new version something 
changed.

Run like in:

root@f1e0f8e7ef93:/# java -version
openjdk version "1.8.0_252-internal"
OpenJDK Runtime Environment (build 1.8.0_252-internal-ga)
OpenJDK 64-Bit Server VM (build 25.252-bga, mixed mode)

Regards,

Robert
