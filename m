Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.57.1626800116131186165
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 09:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XZQlqvPh;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id c1so16256663pfc.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+To5OfYCzP8h1eW/dgoSvYXUZr3C+lO7blZDb+xRfMQ=;
        b=XZQlqvPhl41PzHrf/pdKx2MPYqQRAuv7hj+GWzHR+0jL61YZJSsVxK9qKx1q40gq+r
         h7qOycreYa1o5MA6m1UjmBpBMbyvtTIqVd+1bCbh62FXQ+FulL5vualKQO33pcXVcUcG
         8eSjNa/Ex0nRxPu4VAyzF0xNYbkeyWEq1LEFMaXN8nheSDmwAojLsrS/fvhjOFVnm8xy
         G4PvpiRdLQGD+kclY0x9Cpg5543VTfllHcNlN5ovAGswNlUksBKzn4rtGp3Ennj8sUjB
         YJ8mEaCwnzgV+5TDOrmqVemXoxUHI2LaeOUKRIyrfmhG3REc+4LQ3sgwVkBczUeJIpmu
         BNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+To5OfYCzP8h1eW/dgoSvYXUZr3C+lO7blZDb+xRfMQ=;
        b=ZksJtYr0L1T1orFTil7yCeWAwh0Ef8WCM9rEeBIVHWNQO/2PGAjexzPQO188zFmY/2
         Gf0vEpC+feaF1NCNC46UscYq1ZtuMZqXIvgtJmd1HiH4l04cnU3Kcvi3ddTXUQkL30q2
         ksM8USrEalaKOPHZ/7h3EWHqpupJ3F+NkJPiDDKr5Cn6KnKYR3/G+LuOLzM1RpQz5JHP
         HVUYycEZ/NimzqAvpVL/ZQGugX9k3VL6ivBb1RWFNTyxhTn309MB0AHGM7GxNcFzJxk6
         hHAMf+eikSoD9lE50yA8TBh0dud9krhmeT5VFRzxHBqnUqHYbcEVxTGOum98a+BR0VEt
         NS+Q==
X-Gm-Message-State: AOAM530W9IOHjADzviL0HjUsoopvSH9YXJb1iX8/VMpM5A3ik6aJz438
	Xyx8oK4E3zy3e1bVF0fZVav9402rzTr87A==
X-Google-Smtp-Source: ABdhPJwgqq0HJGe8Vz5Vqxqj8jp96nr7u/ahR09iT8iajoPNDcOXCd3tVcj1BBLqvBrV623isIsYkg==
X-Received: by 2002:a65:638e:: with SMTP id h14mr31779866pgv.330.1626800115126;
        Tue, 20 Jul 2021 09:55:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:d8a1:9261:489d:7116? ([2601:646:9200:a0f0:d8a1:9261:489d:7116])
        by smtp.gmail.com with ESMTPSA id x10sm26032986pgj.73.2021.07.20.09.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 09:55:14 -0700 (PDT)
Subject: Re: [oe] [meta-networking][PATCH] nghttp2 Use the built-in options for removing pack tools
To: ed@tanous.net, openembedded-devel@lists.openembedded.org
References: <20210720035647.893435-1-ed@tanous.net>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <12a32f2f-d1fe-6bab-d94e-baf6387d2e51@gmail.com>
Date: Tue, 20 Jul 2021 09:55:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210720035647.893435-1-ed@tanous.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/19/21 8:56 PM, ed@tanous.net wrote:
> From: Ed Tanous <ed@tanous.net>
> 
> For distros that want to use the ENABLE_LIB_ONLY option, the rm call in
> the do_install_append() will fail, because ENABLE_HPACK_TOOLS (set
> implicitly as part of ENABLE_LIB_ONLY) removes those two binaries from
> the build, so they then can't be removed again.  It appears that nghttp2
> has added explicit options for this use case, so this commit sets
> ENABLE_HPACK_TOOLS=OFF, which not only allows for the option to be
> overridden in other meta layers, also allows a simplified use of
> ENABLE_LIB_ONLY in meta layers that don't want to ship any of the
> binaries.
> 

this is already applied to master via
https://git.openembedded.org/meta-openembedded/commit/?id=df8ecfeacfc84a34a0696a48f3a1dc6d83496271

so is it that you are proposing it for release branches.
if so then indicate that in patch header.

> Signed-off-by: Ed Tanous <ed@tanous.net>
> ---
>   meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
> index 959cccf35..08b855262 100644
> --- a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
> +++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
> @@ -18,11 +18,7 @@ PACKAGECONFIG[manpages] = ""
>   
>   # examples are never installed, and don't need to be built in the
>   # first place
> -EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=ON"
> -
> -do_install_append() {
> -	rm ${D}${bindir}/deflatehd ${D}${bindir}/inflatehd
> -}
> +EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=ON -DENABLE_HPACK_TOOLS=OFF"
>   
>   PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
>   
> 
> 
> 
> 
> 
