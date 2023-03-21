Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47282C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 17:20:18 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.20077.1679419213878993462
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Mar 2023 10:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BmLx6yUx;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id bz27so7010831qtb.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 10:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679419213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WbdDe/d2dneVf83jiaHgjSr9g/0wRcecF06cY7AKqCk=;
        b=BmLx6yUxhhJ2b56PgiJ+/o8aUeV6QNYn0O6FylpuWJKgwnkvyHl4L37HijZ2z88xei
         9pgzIRhknM/OKrJaxGehqG/6ncnCyzpRuCjp3sXO7/Br9tXnU8nCun1lLaHe+Rp7SiY6
         Vwmz05rX+cLx+f7DKJxq7v4RFlxBHloa34zgGJqe3Ytt0TrytpUcnkj68VdiCyWKAYdD
         fbVMcQkgTnUWhOEqrL4iyonYccGpd6YlBWX4v91BUtLJ2xHC4RBh+6XNCogfNe1pJsTd
         tQt3qbSl/82JNBuzQyGZgg66EficZ2uypMarkUViJUkgdECVbWEDR1pvvWVPIkTciRcB
         FCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679419213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WbdDe/d2dneVf83jiaHgjSr9g/0wRcecF06cY7AKqCk=;
        b=o6xZXC5s4SXYwUSZxGwxIT+BDQXqR9NPzjWI0dCsKES/jQRXoNSw9a5MOwNtbiYw84
         d3WInbozRZsGRzbvaDQtpAzT7JnMuClOb8H21ziRaSFgSSgIil9ReVGfnu0Y6aFglhxW
         kQNNShlhnHOFbiNGMIwMiPAHWJCgJzzoVGDGDiskySHw3jgAA/IsJZI5OVf4EyLsntvh
         5aKlLj9ywFNaIxKZpkv3/ZMEmPLLERMcEsddlyJl8izLRU22fbe2ATzqn0N7+iAChhUR
         AQqVlSXxfiGv8G0zPVL6JDrRPcZwrxxY5Gfx76CB/xjvg0CShx9E8hZwwggwstPGyRKy
         UlXA==
X-Gm-Message-State: AO0yUKWmBQrNvb1ORy7lmm5r4PrBf8D9kinBk4c5Fj4kmPIkQPyAlo6n
	LbAFv4KEqRUY+dtMbhDy/fY=
X-Google-Smtp-Source: AK7set+YHZSpLsV2h2IkevCRWtLa74W6/4NEtarMtxwr7UvrYW5XAAMnX8M8lrH3ujHFmv4YbstW+A==
X-Received: by 2002:a05:622a:18aa:b0:3d8:fd72:b4b5 with SMTP id v42-20020a05622a18aa00b003d8fd72b4b5mr1316992qtc.31.1679419212802;
        Tue, 21 Mar 2023 10:20:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:6ffe:c97b:cba5:c767? ([2600:1700:9190:ba10:6ffe:c97b:cba5:c767])
        by smtp.gmail.com with ESMTPSA id w8-20020ac86b08000000b003e3874dd784sm586070qts.27.2023.03.21.10.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 10:20:12 -0700 (PDT)
Message-ID: <b491353b-5339-d17c-f919-f4125ee417b4@gmail.com>
Date: Tue, 21 Mar 2023 13:20:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-oe][dunfell][PATCH] apache2: upgrade 2.4.55 -> 2.4.56
Content-Language: en-US
To: valeria.petrov@spinetix.com,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>
References: <20230314112819.24301-1-valeria.petrov@spinetix.com>
 <ZR0P278MB0379DBFD903B4461D7CE40F8F1829@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <ZR0P278MB0379DBFD903B4461D7CE40F8F1829@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 17:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101621



On 3/18/23 2:22 PM, Valeria Petrov via lists.openembedded.org wrote:
> Ping.
>
> Thanks,

The other earlier branches need updated first. Those should land this 
week if not sooner.

- armin
> -----Original Message-----
> From: Valeria Petrov
> Sent: Tuesday, 14 March 2023 12:30
> To: openembedded-devel@lists.openembedded.org
> Cc: Wang Mingyu <wangmy@fujitsu.com>; Khem Raj <raj.khem@gmail.com>
> Subject: [meta-oe][dunfell][PATCH] apache2: upgrade 2.4.55 -> 2.4.56
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> ==========
> -  rotatelogs: Add -T flag to allow subsequent rotated logfiles to be
>     truncated without the initial logfile being truncated.
>
> -  mod_ldap: LDAPConnectionPoolTTL should accept negative values in order to
>     allow connections of any age to be reused. Up to now, a negative value
>     was handled as an error when parsing the configuration file.  PR 66421.
>
> -  mod_proxy_ajp: Report an error if the AJP backend sends an invalid number
>     of headers.
>
> -  mod_md:
>     - Enabling ED25519 support and certificate transparency information when
>       building with libressl v3.5.0 and newer.
>     - MDChallengeDns01 can now be configured for individual domains.
>     - Fixed a bug that caused the challenge
>       teardown not being invoked as it should.
>
> -  mod_http2: client resets of HTTP/2 streams led to unwanted 500 errors
>     reported in access logs and error documents. The processing of the
>     reset was correct, only unneccesary reporting was caused.
>
> -  mod_proxy_uwsgi: Stricter backend HTTP response parsing/validation.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../apache2/{apache2_2.4.55.bb => apache2_2.4.56.bb}            | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.55.bb => apache2_2.4.56.bb} (99%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
> similarity index 99%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
> index 88cef0ef83..1ad222ace4 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
> @@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
>              "
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
> -SRC_URI[sha256sum] = "11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac"
> +SRC_URI[sha256sum] = "d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c"
>   
>   S = "${WORKDIR}/httpd-${PV}"
>   
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101596): https://lists.openembedded.org/g/openembedded-devel/message/101596
> Mute This Topic: https://lists.openembedded.org/mt/97603103/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


