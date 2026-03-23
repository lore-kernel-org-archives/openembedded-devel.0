Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6BBF483E0
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 18:03:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1638.1774289025410459795
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 11:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dsSN8fBh;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso36633375e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774289024; x=1774893824; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2eV4lFwCO3Dw3UXm/cU49y3lxaZAPTMAgg2G2gdfrU=;
        b=dsSN8fBh/WCOCVGbMvk2VZGCB747R1UjMRgudDvjU09jKrdf0/X/ZabBDjinkwx8do
         3sFhDqYx+qd3qIjXNmukgbidVoWhY+qo1KOrxkh/thnBS10G67p0ePl2XFM6cE/0WN50
         DYB8KUg+HLmO+m5UUeARiFRRnBZtuPX8JqLJ05C0Szhl4EjIdITFNlebIahG7vAIzlMh
         +UNa3b1mVmxMocc/5dJUiZbgWCxa11iAHtKojQDRqhXmAkyKylIe2lOv4pN9DnTqvwlM
         ihOdhkcLaKMzmKajWKHU17IKjIrSeN/hb4w/lpNHY692BgCJC9FbtETaROJ2rr9xkRnS
         LJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774289024; x=1774893824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2eV4lFwCO3Dw3UXm/cU49y3lxaZAPTMAgg2G2gdfrU=;
        b=gAnitOuchZ0BLo761cjiwzlRzaGt2YkFzqP/bjt12GTFpIeJ6EGTda0QOV4QXoVizW
         qMMustqnEUHssCQbCP3EDoNE8PR1nv8cXNAHfyf6ncPREYMXvByUbN5LODmIvkSU+2zf
         87NplOnK/U9v0NA/nxpCNn8BArukvJoo+U1gzj90W3LMGn8DIs6ZRSA2N3kCl42lwrXy
         68zkThcw2AFqVOLtvXQF3UzobM1r7YMitzpCXUMxTr3S28ic6EYuDz9pQ+mzXmPii8H+
         I1mQvWU2xOITYbIEj00hprneiLHsxx+13ao+iTgaKobkM8+wrILyFGalh3PbB73FslFz
         Wyfg==
X-Forwarded-Encrypted: i=1; AJvYcCXJXAduzWV58UMB25O7zZYM+LXLz+tZNDiEo4kS7ozjQnf4RArPzIc7+ErhbvtmI8e6b6rABTNDSiUjkmQAAp3m5kI=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw9O1yh05g7+3E/U/zZBsRdw4I9jv4XeRY55nCB7gbztm1S/HZn
	szhQLTC1M4iROURgNGOnQBZGBQh2NywelqTfiHlW6n195lseg/+C1VE0
X-Gm-Gg: ATEYQzykk3TvjCXfYcI7QQR/+fLdqYXB0mvxgD5B2OcwHsjQSKZx4vu6GAxadYaR8VT
	BB29rRgp3Cwi1mMa4vXuI8XBlZvwFEbPu9svlXfup9eTCcWZNsj+UfSKLpm4v5Gxr5AJZ5pCSMO
	5NQDf7k7g4/un5YD+M9tMCrMlnaz4FRCk0zGD/93Ctd8ZHDgptBIqlcw1vyQr4FT7c4O3ubxD7Z
	k1dCF+EkBp4XUZJMb4yC0xOlYRxJEi0hdhWig772jE+QCeQJsPWMPt/xFqvEqqiTkooMJ8sP7NP
	YJIU3Q0JgvrgmnI13nDcr1ylUq+e6DgaQ07UwfHsPDEESlz1VRZvV1dI5gCmmM8cI0m9empYbOf
	Q0jm3RYTZkTTYq3ohTmuO5DyIF0PfeC+bdqzzsnQuZkn/8MKFWzcNvzgfQLPR/jVoT2chYL+u8w
	9T6mPDiFWB1Og8NA6C0W/8hTz+YwqkhiE=
X-Received: by 2002:a05:600c:4ed1:b0:485:f1d1:8f3d with SMTP id 5b1f17b1804b1-486fede5d12mr189309885e9.6.1774289023439;
        Mon, 23 Mar 2026 11:03:43 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6e9ce8sm492765e9.2.2026.03.23.11.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 11:03:42 -0700 (PDT)
Message-ID: <63363b44-df2a-4826-a72a-bc83732ad15b@gmail.com>
Date: Mon, 23 Mar 2026 19:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] image_types_sparse: switch ext*
 conversion to ext2simg_android
To: git-patches@bmwtechworks.in, openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
References: <20260323091500.1196198-1-git-patches@bmwtechworks.in>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260323091500.1196198-1-git-patches@bmwtechworks.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 18:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125524

On 3/23/26 10:15, Ashish Kumar Mishra via lists.openembedded.org wrote:

...SNIP...

> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 186ff9a488..b7ab46f12b 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -12,8 +12,16 @@
>  BBPATH .= ":${LAYERDIR}"
>  
>  # We have a recipes directory, add to BBFILES
> -BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
> +# Adding dynamic layers recipes
> +BBFILES += "\
> +    ${LAYERDIR}/recipes-*/*/*.bb \
> +    ${LAYERDIR}/recipes-*/*/*.bbappend \
> +    ${LAYERDIR}/dynamic-layers/selinux/recipes-*/*/*.bb \
> +    ${LAYERDIR}/dynamic-layers/selinux/recipes-*/*/*.bbappend \
> +"
>  

Sorry for not asking earlier... but why is this done actually? Only to
make it available without meta-selinux aswell? If so, then I think
instead the recipes (or a part of them maybe?) should be moved to the
main meta-oe folder. Changing BBFILES like this kind of defeats the
purpose of dynamic-layers.

Thinking a bit loudly, assuming that the above guess is correct about
the reason:
Question is, why do these recipes depend on meta-selinux? Do they really
depend? This is a question, not a challenge, I'm not that familiar with
these particular recipe. If they really do depend, then making this
BBFILES extension will cause broken recipes in the layer, possibly it
will fail.
If they don't depend, then there is no need for them to be in the
dynamic layer folder, they can become standard ones.


> +# Prefer android-tools from selinux dynamic layer (29.0.6) over the older version (5.1.1)
> +PREFERRED_VERSION:pn-android-tools = "29.0.6.r14%"

PREFERRED_VERSION should use weak assignment (?= or ??=), otherwise it
may shadow other user-preference. Alternatively, maybe you could check
the version/avalability of ext2simg_android in image_type_sparse
bbclass, and complain hard if it's wrong? That would put the version
selection on the user's shoulder. (Just an idea, no need to like it)


>  BBFILE_COLLECTIONS += "openembedded-layer"
>  BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
>  
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> index 74928ed171..39b8ef5fe8 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> @@ -166,6 +166,37 @@ do_install() {
>          install -d ${D}${bindir}
>          install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
>      fi
> +
> +    # e2fsprogs expecting headers in sparse/ subdirectory
> +    # to resolve the "Multiple shlib providers" conflict.
> +    rm -f ${D}${libdir}/android/libsparse.so*
> +    rm -f ${D}${libdir}/android/libbase.so*
> +    rm -f ${D}${libdir}/android/liblog.so*
> +
> +    if [ -d "${S}/system/core/libsparse/include/sparse" ]; then
> +        install -d ${D}${includedir}/sparse
> +        cp -r ${S}/system/core/libsparse/include/sparse/* ${D}${includedir}/sparse/
> +    else
> +        bberror "Sparse headers not found in ${S}/system/core/libsparse/include/sparse"
> +    fi
> +
> +    install -d ${D}${libdir}
> +    for lib in libsparse libbase liblog; do
> +        if [ -f "${S}/debian/out/system/core/${lib}.so" ]; then
> +            bbwarn "Installing ${lib} to sysroot"


One bbwarn escaped here.


> +            install -m 0755 ${S}/debian/out/system/core/${lib}.so ${D}${libdir}/${lib}.so.0
> +            ln -sf ${lib}.so.0 ${D}${libdir}/${lib}.so
> +        fi
> +    done
> +
> +    install -d ${D}${libdir}/android
> +    for lib in libsparse libbase liblog; do
> +        if [ -f "${D}${libdir}/${lib}.so.0" ]; then
> +            ln -sf ../${lib}.so.0 ${D}${libdir}/android/${lib}.so.0
> +            ln -sf ../${lib}.so ${D}${libdir}/android/${lib}.so
> +        fi
> +    done
> +
>  }
>  
>  PACKAGES =+ "${PN}-fstools ${PN}-adbd"


