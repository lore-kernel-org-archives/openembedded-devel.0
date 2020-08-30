Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.34546.1598805204595263194
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 09:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VzeakN8y;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id bh1so1874262plb.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2020 09:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kpurwKFNgh56DK/2/ehLxZ4wz5CKGIj671qDA2dr4OE=;
        b=VzeakN8ynn0ZsRIxmMy8LhIXnHKeF/48CdKtz3o3n7P1bVn6sVnURmr/Bscugx5gzk
         pHXWhx7YlVXyf+0ycaxQnC5lYlNHg0/4t3rKYjquJEzpqUO42TWM7L0Hr3c7shXFHWKW
         87OYu2kVoHI9gmt6LDJh6aL56eEvAn0nZtWYJa77XjymKm7dTLqZVDLkHbuq/Bj3Qq1o
         CrpSLEfEthCdK9Pm5QTAolr15owDcozLL/DiU+IdVuH35+rVy7XBgyd4xKBy85Q9Cvz/
         4VELDgKzs97O+kUh6MaEoIOs3kS439tPoMJswTPRoCfph9tRurKokhjiuNyBpqSEfDQR
         KU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kpurwKFNgh56DK/2/ehLxZ4wz5CKGIj671qDA2dr4OE=;
        b=WNOm2Q1cHPOp2uYovrt1Z8YQBUHzcgBKCCg8DIkzmpzXEC+b8/8oGHo19iUcS3VjGs
         H+ZcS3btmC+kaTbJH9lLI19b6sdI3P81gIr9djbith0nbP9cc27OU9E5ccdnxsB7m59u
         UsugY67U0zbzPoVJByVcXqM0amvPy7Y49UPa2GWVgt9DVZXiB9ZUcmDq4BcSagm9ue3k
         +qOfczw5pR2PBSuwMuk5rREqsELuKx/e3y+7UQ3TDedo3v1a6KveTyBvOY06ZOcYru/F
         /qYlGHYsdJaRE9GJ30nZvvBArinPRMTRBiKWWdgZWRXpx8KxIzdv2SKvDjmcBS4xc0O3
         1FSA==
X-Gm-Message-State: AOAM5328OcyyTQYMFmcH5aDlKOz44Hvp6UQYlLoLycqJnH9hq6tee3wH
	nbca/2dWbPc2q2tWExglJi4wEGdOphA=
X-Google-Smtp-Source: ABdhPJyFQfTgTESWY2bYCB9xA4a42FJM83llbH5/VrqMILrkT0Vy8fPIpVibIGDV33Nkitg3yCYFKg==
X-Received: by 2002:a17:902:8f87:: with SMTP id z7mr5919438plo.93.1598805203853;
        Sun, 30 Aug 2020 09:33:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:6d6c:bf93:376b:c693? ([2601:202:4180:a5c0:6d6c:bf93:376b:c693])
        by smtp.gmail.com with ESMTPSA id s1sm5110885pgh.47.2020.08.30.09.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2020 09:33:23 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] nss: fix postinst in do_rootfs for target
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <162F7E2FF7270601.30808@lists.openembedded.org>
 <20200828190134.2359034-1-Martin.Jansa@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <859104e0-9302-5673-018e-aa498333acce@gmail.com>
Date: Sun, 30 Aug 2020 09:33:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828190134.2359034-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/28/20 12:01 PM, Martin Jansa wrote:
> Partially revert "nss: fix postinst script for nativesdk build"
>
> This reverts commit 31552510b15c1c97aa6cbe180c2bb53d139efbcc.
>
> When running in do_rootfs we need to run shlibsign provided
> by nss-native, otherwise it fails when /usr/bin/shlibsign
> doesn't exist on host builder:

this fixes the issue I was seeing.

thanks.
>
> do_rootfs: Postinstall scriptlets of ['nss'] have failed. If the intention is to defer them to first boot,
> then please place them into pkg_postinst_ontarget_${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/nss/nss_3.54.bb | 26 ++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb b/meta-oe/recipes-support/nss/nss_3.54.bb
> index 882145c1ef..81b2538813 100644
> --- a/meta-oe/recipes-support/nss/nss_3.54.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.54.bb
> @@ -240,19 +240,19 @@ do_install_append_class-target() {
>  
>  PACKAGE_WRITE_DEPS += "nss-native"
>  pkg_postinst_${PN} () {
> -    if [ -n "$D" ]; then
> -        for I in $D${libdir}/lib*.chk; do
> -            DN=`dirname $I`
> -            BN=`basename $I .chk`
> -            FN=$DN/$BN.so
> -            ${bindir}/shlibsign -i $FN
> -            if [ $? -ne 0 ]; then
> -                exit 1
> -            fi
> -        done
> -    else
> -        ${bindir}/signlibs.sh
> -    fi
> +    for I in $D${libdir}/lib*.chk; do
> +        DN=`dirname $I`
> +        BN=`basename $I .chk`
> +        FN=$DN/$BN.so
> +        shlibsign -i $FN
> +        if [ $? -ne 0 ]; then
> +            echo "shlibsign -i $FN failed"
> +        fi
> +    done
> +}
> +
> +pkg_postinst_ontarget_${PN} () {
> +    ${bindir}/signlibs.sh
>  }
>  
>  PACKAGES =+ "${PN}-smime"
>
> 

