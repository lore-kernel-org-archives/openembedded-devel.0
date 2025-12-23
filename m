Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2269FE6F063
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 07:24:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96579.1766474650001359693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 23:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y3+3gbI/;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4775ae77516so42188035e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 23:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766474648; x=1767079448; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1cn8Hna0WAwX2aWtL+tnzFjPA4F9y03qerjPSTuodo=;
        b=Y3+3gbI/aEvQcKlhOngcPJjjkdgqIXARXvE6+dDdltsAVfCuDzZUcsV0C0PWS2RjEH
         1V4NVc9bmxvDmBkYUwYoVRgt9dIGhdhkCy+cKs44gYOzY1kT8vHjMObsA7Do6MzkSc4x
         uk0FY23T/l51DK96fJ5u9pK8JqE0sPxdT7nRCCJuRoinNqZmUUjTUADI7nUbSUaTEOnW
         /5fXQ/veHaoV1qUQlycTYZs74trM2R1TJ1BCix0YIxz40ixvxMzKMMqgUy+X/t96e/+C
         +nhmgobF8tQC896mQGbXP6nDhAzZOU/4JlN+pl4YppRYx3bjmpghEAqckTGqYMsz0yr2
         O8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766474648; x=1767079448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1cn8Hna0WAwX2aWtL+tnzFjPA4F9y03qerjPSTuodo=;
        b=WM+9wIrsriKa/dZKvn37O9VPeEf4YVhQmzjUQm7hu27mK5zxxOQe8CPbygeSk1jnje
         xsaB1odhEOoVs6njCPqwRrQmqXQCmogA5YuGSFi1LqwWIpzzlnuur8JWdDjhzfB8Bm/R
         P53BpOHcN5YSScDYFfP8XSrDFSsOfb5U8OKh/AY9d15rAdD8+fytpZpcPTaoVoJ18wb6
         tVpqlj+Qd0Efx6gXJ4Zw4ItI3cnz1URFTW1muoYGZKN3R14FC40BVHcoZC2LOO3QuGMZ
         2NkGKcqzCEsmtrMzf7tkt0EEkjX2o6UU4oylWY9iVyqT0I7MIwP/MqL9LttwWNOr9j3i
         Uywg==
X-Forwarded-Encrypted: i=1; AJvYcCWkTEss9diQCJswfsvuP0K9zJU6S9F+xD5VDHXEkzoWD2rjy3rESHTZ0mSw9ZkkPLhv007nbmfzMy8U2qkbTmNv8HY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyw0KJzSk6Nk6/Xt345bv8zOhpKqyC/gK7RopmpUP9nH+N5tFAh
	NdVlwx9DCjyI2Am/XJkTS9dnPIWYY6P3sRSRCJuVKLyxN7Le8EO9QLdo
X-Gm-Gg: AY/fxX7yfNVVJo0Gp39VMR9YpS7fTQbUKUZPo31t6y9QyzsjIHkvJEhG+1t1doplUF4
	x96E2GcebzItg3/tYF/OrnQ1oX3wVdChaImgCzMyZPmk8DC7ZZaFFqaJIK44ZhnZE5O6Gt/2Eku
	TN1zBykzBRHXkDDsXoX3geE/k1/ntNb4WnRnFJb0fq3LqquqqqG+iiTdSPLjz4WvpDiad3EIUo/
	S4TcTPE3tmhH+p18cQdOHmccDfbwc2MhygItYPy4kHAyhraYD//eCKR/GTGrLYEnecTREtjEtD9
	CfLO1984zLYLuID7g0KM0A2+SDM4oBMYfU8IATjn3dijQAyaxk0458PSbhtrGS5xJgn5ZZ1ralL
	AyyNvPcdvR02BwU2qojo8vQpraZc+Yb0JPpYSgz/uCp7gq6LYeOvA0xfdambuDk/CENCU82ASPC
	irf224FT5tvTV/TLTrZerU02k/NGK4Ow==
X-Google-Smtp-Source: AGHT+IHcIDJhKpUWqCyufFeNYOLq4Yh5DHsVcerZU1i48xNKdEtzAbGTsN0FcG56VCA+uyAhcJs9zg==
X-Received: by 2002:a05:600c:8718:b0:479:1a0a:ebbe with SMTP id 5b1f17b1804b1-47d25082cc8mr88578415e9.14.1766474648073;
        Mon, 22 Dec 2025 23:24:08 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272e46fsm275268045e9.4.2025.12.22.23.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 23:24:07 -0800 (PST)
Message-ID: <eee72995-6e86-4d6c-aa98-8cd960865afe@gmail.com>
Date: Tue, 23 Dec 2025 08:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH 1/7] flatpak: upgrade 1.17.0 -> 1.17.2
To: liuyd.fnst@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 07:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122824

On 12/23/25 07:10, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> 1. Changelog:
>     https://github.com/flatpak/flatpak/releases/tag/1.17.2
>
> 2. Update 0001-flatpak-pc-add-pc_sysrootdir.patch for 1.17.2
>
> 3. Remove http_backend related options as they were removed in 1.17.2
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  .../flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch   | 11 +++++++----
>  .../flatpak/{flatpak_1.17.0.bb => flatpak_1.17.2.bb}  |  7 ++-----
>  2 files changed, 9 insertions(+), 9 deletions(-)
>  rename meta-oe/recipes-extended/flatpak/{flatpak_1.17.0.bb => flatpak_1.17.2.bb} (90%)
>
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch b/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
> index 08d5625fa7..6207ae617b 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
> +++ b/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
> @@ -7,22 +7,25 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
>  ---
>  Upstream-Status: Inappropriate [oe-specific]
>  
> +Update for 1.17.2.
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/meson.build b/meson.build
> -index 4a0b865e..5f69b1d9 100644
> +index e97b8cef..5c8de55f 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -509,7 +509,7 @@ pkgconfig_variables += 'exec_prefix=${prefix}'
> +@@ -515,7 +515,7 @@ pkgconfig_variables += 'exec_prefix=${prefix}'
>   pkgconfig_variables += 'datadir=' + ('${prefix}' / get_option('datadir'))
>   
>   pkgconfig_variables += 'datarootdir=' + ('${prefix}' / get_option('datadir'))
>  -pkgconfig_variables += 'interfaces_dir=${datadir}/dbus-1/interfaces/'
>  +pkgconfig_variables += 'interfaces_dir=${pc_sysrootdir}${datadir}/dbus-1/interfaces/'
> - pkgconfig_variables += 'httpbackend=' + get_option('http_backend')
>   
>   pkgconfig.generate(
> +   libflatpak,
>  -- 
> -2.34.1
> +2.43.0
>  
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb
> similarity index 90%
> rename from meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb
> rename to meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb
> index a51937ea72..b5803e00a4 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb
> @@ -4,11 +4,11 @@ LICENSE = "LGPL-2.1-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  
>  SRC_URI = " \
> -    git://github.com/flatpak/flatpak;protocol=https;branch=main \
> +    git://github.com/flatpak/flatpak;protocol=https;branch=main;tag=${PV} \
>      file://0001-flatpak-pc-add-pc_sysrootdir.patch \
>  "
>  
> -SRCREV = "0835c0272f3a0389f97b02cad4b208f80fec99ed"
> +SRCREV = "20599618d623630f7aa38d61a2bb81d86fb25f09"
>  
>  
>  inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native mime features_check useradd
> @@ -49,11 +49,9 @@ GTKDOC_MESON_OPTION = 'gtkdoc'
>  GTKDOC_MESON_ENABLE_FLAG = 'enabled'
>  GTKDOC_MESON_DISABLE_FLAG = 'disabled'
>  
> -PACKAGECONFIG[curl] = "-Dhttp_backend=curl,,curl"

Didn't curl turn into an unconditional dependency, which should be
always present now? (Or maybe it is pulled in indirectly by another
dependency?)

>  PACKAGECONFIG[dconf] = "-Ddconf=enabled,-Ddconf=disabled,dconf"
>  PACKAGECONFIG[docbook_docs] = "-Ddocbook_docs=enabled,-Ddocbook_docs=disabled,xmlto-native"
>  PACKAGECONFIG[man] = "-Dman=enabled,-Dman=disabled,libxslt-native"
> -PACKAGECONFIG[soup] = "-Dhttp_backend=soup,,libsoup-2.4"
>  PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,xauth socat-native"
>  PACKAGECONFIG[xauth] = "-Dxauth=enabled,-Dxauth=disabled,xauth"
>  PACKAGECONFIG[seccomp] = "-Dseccomp=enabled,-Dseccomp=disabled,libseccomp"
> @@ -62,7 +60,6 @@ PACKAGECONFIG[selinux] = "-Dselinux_module=enabled,-Dselinux_module=disabled,lib
>  PACKAGECONFIG[wayland-security-context] = "-Dwayland_security_context=enabled,-Dwayland_security_context=disabled,wayland wayland-native wayland-protocols"
>  
>  PACKAGECONFIG ?= " \
> -    curl \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xauth', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-security-context', '', d)} \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122817): https://lists.openembedded.org/g/openembedded-devel/message/122817
> Mute This Topic: https://lists.openembedded.org/mt/116912723/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


