Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E7EC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 21:56:24 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.3179.1675976996550491980
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Feb 2023 13:09:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WPQ2YvMx;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: fntoth@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id m2so10353950ejb.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 13:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/W4hrnIFLsp5d2IeYFqiJcT85Ffwd687BfeJM4ZB9s=;
        b=WPQ2YvMxSwS7XZcxhO/gwhBuOLmOPXyDXCPN5/gtfMqyoztS0u+0SKr7r/sVnwbKcL
         SMKFAK6ytZw8Lu3k6Ck4r/AtpvUJa0vJ8coT8L/VpDbzU/VXQR54XzgOXTKzOtQazGut
         88hpp+8TtZdXIEpIw2aam8vfUfFobH2mWopNbDoEUzDuCd5h8MvYpAUHj94WeReVnW+J
         pFT++nqyEJe4hxsNXHOI4z6Ik9iXtTkgspRtJN7NqJ56c0XtwQ/1WSec0MYVmvAC/vYv
         4Xht9L43UUUqMRl/cxBhNIH2hVupjfRaEeRRlZHhs36iQ3B6kLfWg+G7ofm09kj9ZT7I
         CmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/W4hrnIFLsp5d2IeYFqiJcT85Ffwd687BfeJM4ZB9s=;
        b=vEMdfGQ7pTjqFnjUSqQ2B7tHDq4a0kU5JNvvuRfZdENtr11TxIQqVon8BinMr3EEar
         dI2I7hNQyoA2BqKAPmv96p4J69TRZyiqq7L59nIdjm3O990ZiuIZuQhjiPqOUqyi/NkB
         bsqyzFX+Q6P35fndH0E22/rBiy0WY15L7Wwe3Q9UoNkQ4QGC9WgcdVbmpRzsZvSL1Bpg
         lhkDM8ezsRbdN10KoYiLu4+YE/lPfz3FNy+yQGqXzAp17FeQAsF8hw50t771MViTyvag
         wnEa+IPmAMHsIzuqU68ozj/PY3VRfxL5lcg08aeP7d2TBOKR5BaNK8S8BPNWi0Sdx3IG
         Pu0g==
X-Gm-Message-State: AO0yUKXTzIh0y3wdTYolGwiRNDW1Km+1SRb1tO/wVi55EyiYBiX2uIa9
	rlaMsAPn4iPPaEtohkwvTfk=
X-Google-Smtp-Source: AK7set+/KWZlCSFJzFNDuuv+JJGsjrwDzLne8jo/rARtPXyYshErZKVRv+KhoRB2ogs+u8TMZpjA3g==
X-Received: by 2002:a17:907:7657:b0:88d:7823:458b with SMTP id kj23-20020a170907765700b0088d7823458bmr12886944ejc.48.1675976994992;
        Thu, 09 Feb 2023 13:09:54 -0800 (PST)
Received: from ?IPV6:2a02:a466:68ed:1:2b89:6fc5:741:25f9? (2a02-a466-68ed-1-2b89-6fc5-741-25f9.fixed6.kpn.net. [2a02:a466:68ed:1:2b89:6fc5:741:25f9])
        by smtp.gmail.com with ESMTPSA id z22-20020a17090655d600b00871f66bf354sm1335930ejp.204.2023.02.09.13.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 13:09:54 -0800 (PST)
Message-ID: <e1afbab4-9f99-a252-c596-9b865711ccf6@gmail.com>
Date: Thu, 9 Feb 2023 22:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [meta-oe][PATCH] libgpiod: fix python bindings build
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230125081731.6157-1-brgl@bgdev.pl>
From: "Ferry Toth" <fntoth@gmail.com>
In-Reply-To: <20230125081731.6157-1-brgl@bgdev.pl>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 21:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101013

Op 25-01-2023 om 09:17 schreef Bartosz Golaszewski:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> It seems that automake's AM_PATH_PYTHON() macro no longer sets the
> $PYTHON variable. This means the python bindings build for libgpiod has
> been broken for some time. As we know which version we're using -

I have in my conf file:
# Build python bindings for libgpiod
PACKAGECONFIG:append:pn-libgpiod = " python3"

and it work ok on Kirkstone which builds automake-native 1.16.5.
Which version is causing you trouble?

> python3 - let's hardcode it in configure.ac. For now add a patch that's
> been merged upstream and once a new bugfix release is out, we'll remove
> it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   ...-don-t-expect-automake-to-set-PYTHON.patch | 37 +++++++++++++++++++
>   .../libgpiod/libgpiod_1.6.3.bb                |  1 +
>   2 files changed, 38 insertions(+)
>   create mode 100644 meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch
> 
> diff --git a/meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch b/meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch
> new file mode 100644
> index 000000000..a3dc38188
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch
> @@ -0,0 +1,37 @@
> +From 3c461786feb1d5aa1ed2a911942a5f9fbc8b8086 Mon Sep 17 00:00:00 2001
> +From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +Date: Tue, 24 Jan 2023 17:38:43 +0100
> +Subject: [libgpiod v1.6.x][PATCH] build: don't expect automake to set $PYTHON
> +
> +It seems that the implementation of AM_PATH_PYTHON() changed in automake
> +recently and no longer sets $PYTHON variable which breaks the build on
> +some systems.
> +
> +We know we use python3 so use python3-config explicitly.
> +
> +Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +---
> +Upstream-Status: Accepted
> +
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 3149384..0460810 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -204,9 +204,9 @@ then
> + 		AC_MSG_ERROR([python3-config not found - needed for python bindings])
> + 	fi
> + 	AS_IF([test -z "$PYTHON_CPPFLAGS"],
> +-		[AC_SUBST(PYTHON_CPPFLAGS, [`$PYTHON-config --includes`])])
> ++		[AC_SUBST(PYTHON_CPPFLAGS, [`python3-config --includes`])])
> + 	AS_IF([test -z "$PYTHON_LIBS"],
> +-		[AC_SUBST(PYTHON_LIBS, [`$PYTHON-config --libs`])])
> ++		[AC_SUBST(PYTHON_LIBS, [`python3-config --libs`])])
> + fi
> +
> + AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
> +--
> +2.37.2
> +
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> index 3e6e5d567..5164e7e02 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
>   SRC_URI = " \
>       https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz \
>       file://run-ptest \
> +    file://0001-build-don-t-expect-automake-to-set-PYTHON.patch \
>   "
>   
>   SRC_URI[md5sum] = "28e79f6f70fee1da9079558d8b7b3736"
> 
> 
> 
> 
> 


