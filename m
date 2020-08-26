Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.6850.1598422855516245281
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 23:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QMnlGzHo;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id mt12so403113pjb.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 23:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=tH7I4NblecGUVEK/dEPvmSxZAtiCnyWigTWCSDuJY1Q=;
        b=QMnlGzHo9K8XNeJQePv9SW1VphNJGVe5eu6IwYKw6beuTLH3ndkb0FzIWqqRGdIGuk
         GSmcMRheNOGnrenkok8KLHCW7pw9nLj9QRIsBcvNYkaDd6dpPSnyALPTnlNBO8QyrcTZ
         MFIf2Z8oJ2LVF/h4tGopRQ3r6Gf1EZmne3s5mf3W4misbANxe1B5zHXY5PsrWoNODupf
         gb9LjNiD4+A5VH1RTALzUC1cJuwuoi+CvG/jm2txe1BKg31a3w/YHhY8/Z/A+H+RLpnP
         4L2uss05OjZVwt9xpiAnxGZfxzyFBqpyGtib7kMqonWk7qT9slZKqSkK2uTEEXXr5GhV
         8Gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tH7I4NblecGUVEK/dEPvmSxZAtiCnyWigTWCSDuJY1Q=;
        b=I2YHST4z4D83nKQC8b6zGGabLHTbTnHfGmSth60PYPR1fdCibpGEhzGGuTcrtuPiPg
         wtR4FdpNskHHVFBAX2uNumlaaadEChS6ppssJXT6Ly9lZSqGSFHorBNLheYilow7i8lA
         OqxCfwW8PBdjqh0j+WvhR1+ergohsUzg84aklY65LqObYzLYO4NhveOD2lZuqJnSCfLC
         KalLfxzaPhd6EnJImvbptYV4F1QfedhnZt4UdPiqGj9GXzbA7jM4J/6bp5ukfNFZvbFx
         dFyBIgRsyNn+wrCe0nAvO/vWmly8RxNl1FuC9xjRSGAr4duBOZCJrjzlqYy5RwVmVopJ
         323g==
X-Gm-Message-State: AOAM532ZN7CuKUc5l7sxnd52A3olMu/2zQRg9MmJaAVkKUCceXdqGvmt
	ifZh53uPPo4PDMXNbQu9JCNfZmHmS5wDIw==
X-Google-Smtp-Source: ABdhPJxAOgxqg1T+LjdDBwgIS/k9gL2WKHWJKIMkFLocKMrt+iky2dBp8DzoVbGAzMUr2049Hp/etw==
X-Received: by 2002:a17:90a:450d:: with SMTP id u13mr4437623pjg.99.1598422854499;
        Tue, 25 Aug 2020 23:20:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e8b6:ed97:4b5a:9e46? ([2601:646:9200:4e0:e8b6:ed97:4b5a:9e46])
        by smtp.gmail.com with ESMTPSA id t5sm975890pji.51.2020.08.25.23.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 23:20:53 -0700 (PDT)
Subject: Re: [oe][meta-oe][patch] openocd: Update to latest git version
To: Marc <marc@cpdesign.com.au>, openembedded-devel@lists.openembedded.org
References: <20200825110103.15581-1-marc@cpdesign.com.au>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <764789f3-5b02-bfdb-7801-03e92b5183d8@gmail.com>
Date: Tue, 25 Aug 2020 23:20:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825110103.15581-1-marc@cpdesign.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Marc

Can you rebase this on top of latest master and resend please ?

On 8/25/20 4:01 AM, Marc wrote:
> The 0001-Do-not-include-sysctrl.h-with-glibc.patch is no longer needed,
> and is thus removed.
> 
> Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
> ---
>   meta-oe/recipes-devtools/openocd/openocd_git.bb | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> index e95f1cfa5..4f6aaa8a6 100644
> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> @@ -9,14 +9,13 @@ SRC_URI = " \
>       git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl \
>       git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
>       git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
> -    file://0001-Do-not-include-syscrtl.h-with-glibc.patch \
>   "
>   
>   SRCREV_FORMAT = "openocd"
> -SRCREV_openocd = "ded67990255cc1e63c77832ffd6e6bef9120873d"
> +SRCREV_openocd = "d46f28c2ea2611f5fbbc679a5eed253d3dcd2fe3"
>   SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
> -SRCREV_jimtcl = "dc4ba7770d580800634f90b67a24e077b4a26d98"
> -SRCREV_libjaylink = "cfccbc9d6763733f1d14dff3c2dc5b75aaef136b"
> +SRCREV_jimtcl = "0aa0fb4e3a38d38a49de9eb585d93d63a370dcf6"
> +SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
>   
>   PV = "0.10+gitr${SRCPV}"
>   S = "${WORKDIR}/git"
> 
> 
> 
> 
