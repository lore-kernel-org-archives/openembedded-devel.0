Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.2393.1594406133481677861
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 11:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MYnOJU6R;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id k27so2898443pgm.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 11:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=zUjGzAw/NG5TfnpsQF0UoRNAwcMaocNNS0HKOM+/+cI=;
        b=MYnOJU6R2JL/Y2Y4Y41247Cwbt92Kb8Rwhmm+kHynixB7h18gyBt7riraLj8nysYqM
         j2UiSU+MiBgzAUAuYr78DPVq1sCRSZKZsich3uK+xY0mnfXwTHERgnGwMuJ+pTloD+fZ
         wXzAEtoT/+nOEvkqA2Nar0MKtdBigl1q/sRwT9d/Npn3sEGxVQrBzJ2LOkwSL+akLSa8
         7l0eQLkdl7NHQSk8yH/fxFOJ7S+r5u0JifGM1eABLlBLi5VNOgzznNKFSkO399uj3KTJ
         NDxAQCcRLyBHDrdKg1ATSJjSoCvyUMp8sgDNLm0e/bYu+6uZfkHi+d+QFYafEWVoue1R
         KzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zUjGzAw/NG5TfnpsQF0UoRNAwcMaocNNS0HKOM+/+cI=;
        b=e7zDl8ceabZIQkovtDbBru6sPUDsZ/RbsejmP9Cd4sPB9FC4P+Ea5Fk+FID2Us8t71
         YijyUuUIh3fAf/ECmTIdU7Yzu42hJ/5xQN1jiKcyBgMT5LA3vza8f2TS0T6+lEkhy7ZY
         YM464EeNQ+9Z0P5I2PGVfavOrdKL2WLX9y25gcHc0Pf7TJ6VxbNq0BQ3yHI/tW3sozw5
         Dous4psQfdds9B9hIXkBQNJURg9BXranH4WYei8mVjqrhj02M/6QLDoVRh6ryhFyDmdn
         bbK5E4IrWAoGMNBj/FRWG7qmQQhMRJF2XE4irS9hdzFxClzLd1MntNe8xZbP3UEIAbNp
         AdhQ==
X-Gm-Message-State: AOAM5316ggdC7Sh8efNdcltFonk8Kqnd6MzjyaGzwwhUzJXJHIbcGvTA
	PES/JuYKF6ll+2yUjwAnXwD6PU7ul4U=
X-Google-Smtp-Source: ABdhPJxCu0ILt9fZvOMExRN6UpVWUu+7GyNuoosa+A58iZ23jCqbBsIH4xP1RK30dosRDXInzbPjOA==
X-Received: by 2002:a63:29c8:: with SMTP id p191mr61755357pgp.333.1594406132566;
        Fri, 10 Jul 2020 11:35:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:2036:8379:4d57:501b? ([2601:646:9200:4e0:2036:8379:4d57:501b])
        by smtp.gmail.com with ESMTPSA id f6sm7305932pfe.174.2020.07.10.11.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 11:35:32 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 1/2] safestringlib: add recipe
To: Naveen Saini <naveen.kumar.saini@intel.com>,
 openembedded-devel@lists.openembedded.org
References: <20200710051601.11962-1-naveen.kumar.saini@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <c3dd7c20-08f3-a1b8-d0c2-3b2cf1a8da68@gmail.com>
Date: Fri, 10 Jul 2020 11:35:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710051601.11962-1-naveen.kumar.saini@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/9/20 10:16 PM, Naveen Saini wrote:
> The Secure Development Lifecycle (SDL) recommends banning certain
> C Library functions because they directly contribute to security
> vulnerabilities such as buffer overflows.
> 
> However routines for the manipulation of strings and memory buffers
> are common in software and firmware, and are essential to accomplish
> certain programming tasks.
> 
> Safer replacements for these functions that avoid or prevent serious
> security vulnerabilities (e.g. buffer overflows, string format attacks,
> conversion overflows/underflows, etc.) are available in the SafeString Library.
> 
> Ref:
> https://github.com/intel/safestringlib

We also carry recipe for safec https://github.com/rurban/safeclib
is this a replacement in some sense ?

> 
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>   .../safestringlib/safestringlib_git.bb        | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 meta-oe/recipes-support/safestringlib/safestringlib_git.bb
> 
> diff --git a/meta-oe/recipes-support/safestringlib/safestringlib_git.bb b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
> new file mode 100644
> index 000000000..3d54fc8d6
> --- /dev/null
> +++ b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Safe string operations and memory routines"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE&COPYING.txt;md5=edd6f8c4c1072d72645ae28cb04bdbce \
> +                    file://LICENSE;md5=54f68ba2c33474320fcc46b1f2d01249"
> +
> +SRC_URI = "git://github.com/intel/safestringlib.git;protocol=https \
> +        "
> +
> +PV = "1.0.0+git${SRCPV}"
> +SRCREV = "245c4b8cff1d2e7338b7f3a82828fc8e72b29549"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig cmake
> +
> +do_install() {
> +    install -d ${D}${libdir}
> +    install -d ${D}${includedir}
> +    install -m 0644 ${B}/libsafestring_shared.so ${D}${libdir}
> +    install -m 0644 ${B}/libsafestring_static.a ${D}${libdir}
> +    install -m 0644 ${S}/include/*.h ${D}${includedir}
> +}
> +
> +SOLIBS = ".so"
> +FILES_SOLIBSDEV = ""
> 
> 
> 
> 
