Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web08.548.1617837375821025881
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 16:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BgBZrwoW;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so497469oto.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 16:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ef6e2SraPhlff/zF6C18+vcm5Xo2n7mrHfQZxV4G9T4=;
        b=BgBZrwoWnkpbcofvVnOOoCwLx1+GcjWifuP9tNaXOGAI5PYeH1EV8VyvvW2eoLLfRl
         3FPYRfagVCMLNokhg6gP+hDxP671U9CJQUDYiw2G6VPTcFR/sUuP9A+YILmww3BMuKC6
         yeVp8r7q91ON35xdVeHu4e1igW0/fYuWY/1JJSxVC8nu/0KqHlYSGnCodsfTH6hRSDUl
         FGe+loyK84tENzW8E19W+CKPslcTax8M3bhSD1g+tA1vEeVUZEXZWIg2yToaQmEu53Qg
         y8qEYOvascksq7/2bi80XWrYW5p1/EPyQGKYz0T5Sq+NTOoG3L9alMj5A+1TPR7q2V6q
         FFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ef6e2SraPhlff/zF6C18+vcm5Xo2n7mrHfQZxV4G9T4=;
        b=gVV6WGUiBGP0fCIuFy3RKS2hYTSSD+e3bZEW4roRKKC/dcT5QSbeEBZh0b5h5Vf+UA
         wUg/9AcCC5bfe6Yz0UTB72bKd0GgpE02/b8jfhvkyiTPalLn28PANFTdEFEgC81b+jfQ
         2scC2Ig3n6lsVLqAnGC+UJImUSGwnFOgxYJQ5Tgjqapw38kPik9dkkprcAji9ZDE+akM
         eUd+eeMdsKbRQcxfgo4YEcixxisVSddqvSvX7q2tCL+1/NMTyXMgFK0xok8n0J2fsaVX
         Pj3gVFZS0BkHuaUOgpC5/pvIc/y0N+i1TbG/FMbfexu7I5Se0Sy7Fdb66PK5qMmAhXiy
         AMBA==
X-Gm-Message-State: AOAM533w0B/iz/EmYPidy8YLcMmDWoi+PI4xS7xe3V27TijlD+2hJBah
	dS03W6PPejnvJOf1YM/M52OzJosRGGY=
X-Google-Smtp-Source: ABdhPJxQb8Vfh4VzoU5L47ZWPYbde7QR/z7XGJ5ZFd0IaNIhkQGVbxx963Ya6PwXs/d+IS1o2rJa5A==
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr5181046otb.128.1617837374681;
        Wed, 07 Apr 2021 16:16:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:d82f:cd1e:57b2:d04e? ([2601:202:4180:a5c0:d82f:cd1e:57b2:d04e])
        by smtp.gmail.com with ESMTPSA id f29sm5807668ots.22.2021.04.07.16.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 16:16:14 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH v2] iwd: Upgade to 1.13
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210405213825.3478004-1-raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <ea15a645-1cb5-22a9-881a-aa06806f42e9@gmail.com>
Date: Wed, 7 Apr 2021 16:16:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210405213825.3478004-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/5/21 2:38 PM, Khem Raj wrote:
> Fix out of tree builds
> Switch to tarball fetch
I am seeing this error on Ubuntu 20.x

checking for ell >= 0.39... no
configure: error: Embedded Linux library >= 0.39 is required

core master and hardknott are at 0.38

https://errors.yoctoproject.org/Errors/Details/575735/


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fix out of tree builds and switch to tarball fetcher
>
>  ...p_srcdir-instead-of-abs_srcdir-for-e.patch | 35 +++++++++++++++++++
>  .../iwd/{iwd_1.12.bb => iwd_1.13.bb}          |  6 ++--
>  2 files changed, 38 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
>  rename meta-oe/recipes-connectivity/iwd/{iwd_1.12.bb => iwd_1.13.bb} (85%)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
> new file mode 100644
> index 0000000000..63d617f3e1
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
> @@ -0,0 +1,35 @@
> +From 0532cddcec9c3abff1f3bc22d2fa50df03d55d17 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 5 Apr 2021 14:11:40 -0700
> +Subject: [PATCH] build: Use abs_top_srcdir instead of abs_srcdir for ell sources
> +
> +this makes it build when build dir is outside of sources dir
> +
> +Upstream-Status: Submitted [https://lists.01.org/hyperkitty/list/iwd@lists.01.org/message/SYX6Z7SUQHU7UWM6ECZTTJ6SPODIS6KB/]
> +---
> + Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -625,9 +625,10 @@ unit/tls-settings.8021x: unit/cert-ca.pe
> + BUILT_SOURCES = $(ell_built_sources) src/builtin.h
> + 
> + ell/shared: Makefile
> ++	$(AM_V_at)$(MKDIR_P) ell
> + 	$(AM_V_GEN)for f in $(ell_shared) ; do \
> + 		if [ ! -f $$f ] ; then \
> +-			$(LN_S) -t ell -f $(abs_srcdir)/../ell/$$f ; \
> ++			$(LN_S) -t ell -f $(abs_top_srcdir)/ell/$$f ; \
> + 		fi \
> + 	done > $@
> + 
> +@@ -635,7 +636,7 @@ ell/internal: Makefile
> + 	$(AM_V_at)$(MKDIR_P) ell
> + 	$(AM_V_GEN)for f in $(ell_headers) $(ell_sources) ; do \
> + 		if [ ! -f $$f ] ; then \
> +-			$(LN_S) -t ell -f $(abs_srcdir)/../ell/$$f ; \
> ++			$(LN_S) -t ell -f $(abs_top_srcdir)/ell/$$f ; \
> + 		fi \
> + 	done > $@
> + 
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.12.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
> similarity index 85%
> rename from meta-oe/recipes-connectivity/iwd/iwd_1.12.bb
> rename to meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
> index ccdc65ac6c..19d3a509ca 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_1.12.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
> @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
>  
>  DEPENDS = "ell"
>  
> -SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
> +SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
> +           file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
>            "
> -SRCREV = "bde3e0f6e3364e9c884b6b93a944d8138345b8e5"
> -S = "${WORKDIR}/git"
> +SRC_URI[sha256sum] = "b005f7ed0f0a96a2c6181c44560fc868533a18e7034bd4cb43ea0d40c21b4e7a"
>  
>  inherit autotools manpages pkgconfig python3native systemd
>  
>
> 
>

