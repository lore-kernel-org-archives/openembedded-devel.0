Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.7761.1588330922680977551
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 04:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fx+SVIeL;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: robert.berger.oe.devel@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id i10so11106443wrv.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PsBPNYvrin3dPp4UEaY3fCqBPrZ8k5WGxjQsEkr/nn8=;
        b=fx+SVIeL+Z1KwJg+d3Ds2yzRjd0Mnz4YIRYXD2bIS2JVaqHA3nOTatT6Go8aZ2U+OG
         aSlrZ27gkrZps60Lq1tAYrI/gs7pFjOY2xa2oPJVpBr5OTYCwWZJqQ+37CcYL/5m29yQ
         WrBI1yDsHrKJNj88uWrFjJb33oZgWk9BsTv84MX3ODwcHBU2nG+lEF5F3C4b8NdYEZZl
         uQQTZ9S3Z9GjcEuk4aHhdAXCxffkYph+T0rs1EnPulP3RiHNey7OIuplBKTEgU823NAR
         NVYuJb+3KMISmYWa08n00v8m6evjfzKoVeDP7k7x78RWsnPeFI12z7nYtziV9I8UGxs4
         Wh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PsBPNYvrin3dPp4UEaY3fCqBPrZ8k5WGxjQsEkr/nn8=;
        b=qEMlSKRC5555ChV+IHODNYs420EUI/OxEICC+9kgbupa3RIG+qbzhsXjUcdl0BL5y1
         T3Ju5rIrcRKWdsrDa7lArrPCWguQl1V3mYXuvgib4Ya8FFwocB+ixZ632YCi7lMPGHcf
         0o8W3CeRpcKQrTotCabwrZq8U5EnVyz0Ksa62L+U8bF+goyZKPsH8ZoLhapyNlZwckc2
         s9r7lt6je3H295XQ5iTVqDvy2FB7izLcG8erNtvDL8dsQtnq4/bR7X4pPTR1dmafMT6O
         uuH3rBE4YuLzne0/Rjps8B4G7acomAs594f0LIsBVvHYzyFHnicZR3hQXdgJ8faFlt1T
         bMSQ==
X-Gm-Message-State: AGi0PuYcCzdqNKnjGQ1dNwr8Efa576GEblY+La9J5TwIq1RIShAUUF7U
	RVdFumhJw7GnxEVbUpHQjco0pQlm
X-Google-Smtp-Source: APiQypJXxUkln9zGzJTrBMlAsym0/KRD/g2e5RIlDgTLVxD4tSWw1KNoRN17u6n3x8+opawPB/5XWA==
X-Received: by 2002:a5d:554a:: with SMTP id g10mr3984453wrw.204.1588330920831;
        Fri, 01 May 2020 04:02:00 -0700 (PDT)
Return-Path: <robert.berger.oe.devel@gmail.com>
Received: from [192.168.42.52] (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id b82sm3728672wmh.1.2020.05.01.04.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 04:02:00 -0700 (PDT)
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
Message-ID: <ee879f4e-3388-6734-ca7f-a5957af98639@gmail.com>
Date: Fri, 1 May 2020 14:01:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430211745.GC410632@pcleri>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Please see my comments in-line.

On 01/05/2020 00:17, Richard Leitner wrote:
>>
>> Like this I should be able to retrieve the host gcc version dynamically and
>> be able to add and remove CFLAGS e.g. depending on the major version of the
>> host gcc.
> 
> If I understand you correctly we have something like this already [3].
> Used for example at [4].
> 
> Or did I got something wrong?

I think this is along the lines of what I want.

... but ...

Why do we need to use "custom" meta-java stuff instead of what's already 
available from OE out of the box?

HOST_COMPILER_MAJOR="${@oe.utils.get_host_compiler_version(d)[1].split(".", 
2)[0]}"
CFLAGS_append = " ${@oe.utils.conditional('HOST_COMPILER_MAJOR', '9', 
'-Wno-error=format-overflow', '', d)}"

works for me.

... and ...

It looks like your and my build environment with gcc-9 (RH) and gcc-9 
(UB) behave differently?

This is totally crazy. Not only do we have a host compiler dependency 
with meta-java, but also 9.2 vs. 9.3 and maybe RH and UB hacked 
different things there?

Also we are just turning off warnings/errors, in this case buffer 
overflows, instead of fixing them, which is not good as well. So the 
problem might also be in some library/header or so. But I guess with 
OpenJDK to fix those it's another cup of tea.

... or ...

somewhere magic host CFLAGS are being added.

... one more thing ...

Do you think it should work on one of those distros out of the box, so I 
can try to reproduce what you have on my end?

https://github.com/RobertBerger/yocto-dockerfiles/tree/master/dockerfiles

How is meta-java usually tested?

> 
> regards;rl
> 

Regards,

Robert
