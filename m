Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156E4CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 15:11:41 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.41265.1697209895105059785
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 08:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KcGP6LFD;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5079fa1bbf8so266187e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697209893; x=1697814693; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OV38NgrThciTOQ5T7DVW4m/EvjRYwfKOuJZj8BXJTvQ=;
        b=KcGP6LFDCqaRTKDyAbu1sr1aLHtewpf1gV8z3EQdqUOaQfEiDEyHg31r44lmpujLa8
         Td5J71wS+IOULzIc7L6Ij2TFOrF+yVzn5dyGgXeAQgVF0qW6dP47lTDHl0odOAIetUlM
         FZ3/akdoKY9lz2Hyv7lbUfxUc6pSn7ejms3vKg9+xzuhXRQfSQ4imCLhXPZJWs0fxMM2
         o8JBMUbp/DcsFmXinGsFyUbROdrjgZZQ+m1qg/RW8OBr9Gaa1B84EHQ+u+g7dR/MWuLq
         S3km7nzRwmETaqCAxJ2p09JMnOrXiORlvKQyvbIzeOTyTTK3tfYafTdfaS0U1PDUU6ap
         m43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697209893; x=1697814693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OV38NgrThciTOQ5T7DVW4m/EvjRYwfKOuJZj8BXJTvQ=;
        b=uMQF8jJ5oIGB6K4bn/GueKqXVK2eRHINRVnMvgKRiouekJeIQEuFx50bsohCa4fgfF
         vFDHew6qQlCrMkiNb0+++6AwL3twr9LBpCBwRwkGLz9mXQhsIFDYy+/nz8y+I0GGz95X
         w0tc7PettbdjgDaF5UH1Upg79a/FXx3ryAKVFvJTdhc1McM1Lz3txClOFjRgMymniuXb
         q4j3T9HWcO3Xff4vYa8c93t7eXKxzudIdhgu0jv7XuN8EipX33ivb6Y+WXkMQZWBa0Jv
         mN/q6atRPNB9uCbu3tLf977hAstDTLRHrPvtjOnod/Umf6B4b5rXObuX7a4srnPwWjbM
         sqTA==
X-Gm-Message-State: AOJu0YztVwwxMjCirekNa/FaRS1dCOZd+f8gih7+vS3hgvnKHQybXhYY
	nWs5pQNIYccjL9CHs03pLuv/7Q==
X-Google-Smtp-Source: AGHT+IFrYsXP5LBBYYfeSYJhDvPRHszbOwnspVxAn9jRPV4mpTQISPHyICiLWkxvKqAxAxTWxA22dw==
X-Received: by 2002:a05:6512:31c9:b0:503:261d:eab8 with SMTP id j9-20020a05651231c900b00503261deab8mr26716136lfe.28.1697209893207;
        Fri, 13 Oct 2023 08:11:33 -0700 (PDT)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhpt-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::199])
        by smtp.gmail.com with ESMTPSA id v7-20020ac258e7000000b00505a5ea726asm158279lfo.309.2023.10.13.08.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:11:32 -0700 (PDT)
Date: Fri, 13 Oct 2023 18:11:30 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-networking][PATCH v3] mbedtls: upgrade 3.4.1 -> 3.5.0
Message-ID: <ZSleIrUqnRrK001W@nuoska>
References: <20231013140719.344880-1-beniaminsandu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013140719.344880-1-beniaminsandu@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 15:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105477

Hi,

On Fri, Oct 13, 2023 at 03:07:19PM +0100, Beniamin Sandu wrote:
> * Includes security fix for CVE-2023-43615 - Buffer overread in TLS stream cipher suites
> * Includes security fix for CVE-2023-45199 - Buffer overflow in TLS handshake parsing with ECDH
> * Includes aesce compilation fixes

Thanks, looks very good now!

Cheers,

-Mikko

> Full changelog: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.5.0
> 
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  ...cify-an-arch-version-when-enabling-c.patch | 33 ------------------
>  ...t-target-attribute-when-building-wit.patch | 34 -------------------
>  .../{mbedtls_3.4.1.bb => mbedtls_3.5.0.bb}    |  4 +--
>  3 files changed, 1 insertion(+), 70 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
>  delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.4.1.bb => mbedtls_3.5.0.bb} (93%)
> 
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
> deleted file mode 100644
> index 44d74754c..000000000
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
> -From: Beniamin Sandu <beniaminsandu@gmail.com>
> -Date: Sun, 25 Jun 2023 19:58:08 +0300
> -Subject: [PATCH] aesce: do not specify an arch version when enabling crypto
> - instructions
> -
> -Building mbedtls with different aarch64 tuning variations revealed
> -that we should use the crypto extensions without forcing a particular
> -architecture version or core, as that can create issues.
> -
> -Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/471a975942dec76bf0ccb92b6c6da055385683fb]
> -
> -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ----
> - library/aesce.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/library/aesce.c b/library/aesce.c
> -index fe056dc4c..843de3973 100644
> ---- a/library/aesce.c
> -+++ b/library/aesce.c
> -@@ -60,7 +60,7 @@
> - #           error "A more recent GCC is required for MBEDTLS_AESCE_C"
> - #       endif
> - #       pragma GCC push_options
> --#       pragma GCC target ("arch=armv8-a+crypto")
> -+#       pragma GCC target ("+crypto")
> - #       define MBEDTLS_POP_TARGET_PRAGMA
> - #   else
> - #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
> --- 
> -2.25.1
> -
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
> deleted file mode 100644
> index c8f6cb750..000000000
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
> -From: Beniamin Sandu <beniaminsandu@gmail.com>
> -Date: Mon, 26 Jun 2023 12:07:21 +0300
> -Subject: [PATCH] aesce: use correct target attribute when building with clang
> -
> -Seems clang has its own issues when it comes to crypto extensions,
> -and right now the best way to avoid them is to accurately enable
> -the needed instructions instead of the broad crypto feature.
> -
> -E.g.: https://github.com/llvm/llvm-project/issues/61645
> -
> -Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/aa4f6219014d863bed51453e5261178adc66be34]
> -
> -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ----
> - library/aesce.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/library/aesce.c b/library/aesce.c
> -index 843de3973..7bea088ba 100644
> ---- a/library/aesce.c
> -+++ b/library/aesce.c
> -@@ -53,7 +53,7 @@
> - #       if __clang_major__ < 4
> - #           error "A more recent Clang is required for MBEDTLS_AESCE_C"
> - #       endif
> --#       pragma clang attribute push (__attribute__((target("crypto"))), apply_to=function)
> -+#       pragma clang attribute push (__attribute__((target("aes"))), apply_to=function)
> - #       define MBEDTLS_POP_TARGET_PRAGMA
> - #   elif defined(__GNUC__)
> - #       if __GNUC__ < 6
> --- 
> -2.25.1
> -
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
> similarity index 93%
> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
> index a6f8583b2..1fd187ab2 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
> @@ -23,10 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SECTION = "libs"
>  
>  S = "${WORKDIR}/git"
> -SRCREV = "72718dd87e087215ce9155a826ee5a66cfbe9631"
> +SRCREV = "1ec69067fa1351427f904362c1221b31538c8b57"
>  SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
> -	file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch \
> -	file://0002-aesce-use-correct-target-attribute-when-building-wit.patch \
>  	file://run-ptest"
>  
>  inherit cmake update-alternatives ptest
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105470): https://lists.openembedded.org/g/openembedded-devel/message/105470
> Mute This Topic: https://lists.openembedded.org/mt/101940558/7159507
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


