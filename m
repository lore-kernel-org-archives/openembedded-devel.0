Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284ECD3B7DE
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 09:54:21 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4919.1765187650989629322
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 01:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nbaKfvE1;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so3327808f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 01:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765187649; x=1765792449; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tGSEGuur5/HPIZjUc6GsjJ4HTXA//I4h3H2JOBOTUbI=;
        b=nbaKfvE1oODS6iVEjNhMiulOLqvT82RQARJ6ktJRvfQs5cE6KuHMyCK9FfHY05yXOq
         7Zd/uQNIQlYS/1k0vffL8SiuZq454YFLWTIRcvbm6Sm/lXGjcGNFMUm8AdQPOcJ3J8h2
         CX+Vti4Ouz7ZGABSkn1WQvMEWVEX4GNeCnQuZF3uZNZIBQ3BDZmGcmHJs/oyZuHV2mL1
         KLPojyTE+WFy3Y2xesXk9SBdVtxq4liYtT1dvzoEL8MG6DhY4xTU0geZGTmj9ZDN7z4V
         3TTCfKfH7FMSJ3xwxNBk4cenNgPmTmy9TLFCZ436YQOUYZ1Mu9VbT/GQ12BrTLWbymWf
         hK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765187649; x=1765792449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGSEGuur5/HPIZjUc6GsjJ4HTXA//I4h3H2JOBOTUbI=;
        b=RQUfAWCyE58Gbq2g4fpUQENagjxAHLB+GAeYhbRPtuY2UwWYbAvjle/GHNTLdyatjf
         0g3IbuXHiyY2RmGjCe6ZRPGFU16v2vu6zSX1eW7XjdIaIB1CP3ilCuhqyWw7gQDy+VAH
         CRalQMDms/ugk40gmbVWMglHalRodHxxv8G/bTMPdKPSGxEPMKbaWeWXFeGPqsUPvCx/
         pobMEdQmTo/sJh1N70beAUwiIx21nOoTe3j1cLK6Ob7mNKTiqgt4e1QVzm/qRRekh/xR
         YOj0YOJy0Umn6KGbDM5fcmyL5YuAr0wGxYa2yE6CaNhnt4KVbx/GGpu9DFD6ZbGVFxoK
         ktIA==
X-Forwarded-Encrypted: i=1; AJvYcCWSr4rRdMI3krhaIUNLG+abIn75feXK4DBLALIajOmbg6qLhpscUn75LH835YgNrR2GRHtR/egW38yc4rrfHexlYNE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyrV6p9jExB80VQiOxDyESK/uLcsza1aUf2VRccMgbKzLJ0olDP
	Sk/L73uZxRv3fLhOvUlAEXTYPVJPzk7ty2X+LRMzf9WHXtW02kk9BMrk
X-Gm-Gg: ASbGncvy3bu5zYJnHXv6c4NQqFwK/kQAOCKZuii3mNyGBKUi2nrYZSYpHyKOob8yiL6
	Q5bOiipLTRQoSLJ7jDh/UjRhZhrKo6kOELBeA5sjiHnTsSAmDZuR7mfKQIb7txa7ONyzVSKb8Gd
	DC1K+Mryg1HVNUmpmq0Bh2biGtSk9+YUTnkMQvTtg4chpeyPbg2TEtTiTqPuJCcsLteyAzcEVkx
	v7P25lEYLPj4tII8R2dP71JIdTWPaIhWR4A2k8SfqKZPorpuhbsS7eghzsy17jN6sIDVoyB9kES
	zT0GHe9O3fKDNkuvRhDG9FNjmRT8EDKa0d4HXSfbHAoUmtaiz94JdCuZobkuO1vRIQSB5sdi64X
	2hiER0YLvjYEOTRfDTdeaMZ0Xb8w/vYQ3S6htQypdf2fVPuvi7x5kMF6fKpgVdwWq4rar1E+Ipf
	svI5a3rX2UgmmbFP7sc34=
X-Google-Smtp-Source: AGHT+IHU3PY+eRsScxmSslEAs3vf/jGrxpLBMXMrjx/zL/12cm6BFHx11Vp/zvvREPCfgoJaxCDMPQ==
X-Received: by 2002:a05:6000:22c4:b0:42c:a420:e755 with SMTP id ffacd0b85a97d-42f89eee8afmr7798852f8f.23.1765187649132;
        Mon, 08 Dec 2025 01:54:09 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d352a52sm24957848f8f.38.2025.12.08.01.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 01:54:08 -0800 (PST)
Message-ID: <83e4a981-fdaf-47ec-9f4d-a8e05b3513e9@gmail.com>
Date: Mon, 8 Dec 2025 10:54:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-gnome][PATCH 2/2] gnome-control-center: upgrade 48.3 ->
 49.2.2
To: liuyd.fnst@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20251208091300.21039-1-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251208091300.21039-1-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 09:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122373

Doesn't gnome-control-center follow an "odd-versions-are-unstable"
versioning pattern, making this version to be kinda-beta?

On 12/8/25 10:13, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> Changelog:
> - Revert libgxdp updates
>
>   The libgxdp updates depend on changes in gsettings-desktop-schemas
>   that are part of the GNOME 50 cycle. Revert the pinned ref
>   to the one we had before, until we branch libgxdp for GNOME 49.
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...l-center_48.3.bb => gnome-control-center_49.2.2.bb} | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>  rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_48.3.bb => gnome-control-center_49.2.2.bb} (79%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_48.3.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb
> similarity index 79%
> rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_48.3.bb
> rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb
> index d8d5849534..9bb0228d50 100644
> --- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_48.3.bb
> +++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb
> @@ -32,19 +32,22 @@ DEPENDS = " \
>      udisks2 \
>      upower \
>      ${@' libxslt-native docbook-xsl-stylesheets-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''} \
> +    blueprint-compiler-native \
>  "
>  
>  inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext gi-docgen upstream-version-is-even bash-completion features_check
>  
>  REQUIRED_DISTRO_FEATURES += "opengl polkit pulseaudio systemd x11"
>  
> +SRC_URI = "https://download.gnome.org/sources/gnome-control-center/${@oe.utils.trim_version('${PV}', 1)}/gnome-control-center-${PV}.tar.xz"
> +SRC_URI[sha256sum] = "c23ae220d6c1237d285925de7801e0e36338b9cc1a8bb51c2e37e715e6b503ad"
> +
>  SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
> -SRC_URI[archive.sha256sum] = "c0698245a6420badd077c16ffb218860e457cd7300612718eabf9aba47222bae"
>  
> -PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
> +PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>  PACKAGECONFIG[cups] = ",,cups,cups system-config-printer cups-pk-helper"
>  PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"
> -PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false, wayland"
> +PACKAGECONFIG[x11] = "-Dx11=true, -Dx11=false, virtual/libx11"
>  PACKAGECONFIG[file-share] = ",,,gnome-user-share"
>  PACKAGECONFIG[media-share] = ",,,rygel-meta tumbler"
>  PACKAGECONFIG[malcontent] = "-Dmalcontent=true,-Dmalcontent=false,malcontent,malcontent-ui"
> @@ -54,6 +57,7 @@ EXTRA_OEMESON += "-Doe_sysroot=${STAGING_DIR_HOST}"
>  GIDOCGEN_MESON_OPTION = 'documentation'
>  
>  export XDG_DATA_DIRS = "${STAGING_DATADIR}"
> +export GI_TYPELIB_PATH = "${RECIPE_SYSROOT}${libdir}/girepository-1.0"
>  
>  FILES:${PN} += " \
>      ${datadir}/dbus-1 \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122371): https://lists.openembedded.org/g/openembedded-devel/message/122371
> Mute This Topic: https://lists.openembedded.org/mt/116673072/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


