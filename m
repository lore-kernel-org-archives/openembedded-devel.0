Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C471099B29
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:15:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18382.1774026915645146109
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MgqDkJcA;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so2282817f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774026914; x=1774631714; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dGkg8KeXjvMfCbiiSkfy/GgT6D5J1Zn++0Fubjf2fQY=;
        b=MgqDkJcAuAlc3NMzCBEA0OtZiNdXhYu3Dv0KUFpv/9PwF2E+7SJTzWs00zffnqve1O
         nIy3gdZ43qOfghDpwx77ZxwgQoADa8eydOzeosCgj+H0J0W4lqu7it5BS5Pcvst+sl9P
         cSRO4kLlz/InsrP0eZ7WjGb6r69HBUYjZc+t6YprBOEBXCYdj5ljKGZJzJ+ztVOgYszH
         ly3wBc7/f1r8SD0uO5VpCwL3e/fskOJoERWHFsUFdobfNDjNBPpGp+a/d5PfBaEsU86v
         X3v5S2o+nG27scWpyl9DkYwCJRcZywuNqPGpOW85nBtnWD8/G9vNOR4WId+4syUUKl+G
         ndoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026914; x=1774631714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGkg8KeXjvMfCbiiSkfy/GgT6D5J1Zn++0Fubjf2fQY=;
        b=JtvRHX19BOWBHR1lcnODnAkaa62DbG9RctpxRMNzdLQiQ0richhw7HfkufhKHD6rCu
         Cl17R+eiJUi4xwHBwJLrbDIdlaZxI66PpJNGCKkczLvfRh3I7/rlbfmtztRzYjDqmHOA
         2bUKkor3Al5O4QgGXeNl50Aqg4XBqFmRU7Wpwenoa18MndtFe1/pbjtErDRbUHjbx+v6
         X/aNyZBkwApqZ2zdYojfl65fD+s+DH3oHNGmIiLa7F1bMgRqLrFBIimtWL1LtP3Bbtjb
         jRCMl8DGG4BajgjYCod0RtXMfqU4Dq5VyjbhLrRg5FsJ1S5zeLs9F9MmjB4xbp8O7YU8
         /T5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUt1PSO3465V0arRT5GLRZxxdjNyCmy8pO40FsHHgPWSP8d6pBEicfc/jqktHzGhT5mz5zUnT+T2JA2TqQ9hO3IBeI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwEF+y4FOY07qkX1EluwrkM2zbKZrW/Ouy4BWMY+NhiaDG48D9U
	GKpAO2CpMXshEY1e4dF7vesv/ZipHxtGxyVTvS9fGyPC0EuMydHBKsmq
X-Gm-Gg: ATEYQzyAXDADsmZ32dZY5ThWgod8mlc22B0S+SBSDatIP+UC325wNHeZFlPb6iMSdkZ
	abEeSkPdlPtifhk++0TTZZX/X1xnqMUIkhOpVXN4CGdh74qHz4IiaA41ndoMFhHBQMh9KKqbgXU
	VF4PDuR+8bNre27cwRVodev00IleBizvMCfLG4EjQZ3D6aff7skJEQwY9bAhIXl+tZzeIBLhZii
	cnIc90CZpmuJbeDEkD1qRZHd9He2K2ToG11HwAvTlxtlJnCSQneWtjidjdSuhrzQG7xi/VB3t7V
	RXT4xzDPUZsLHPKsbTPoYpL7iJjjHMqxndQsI9I8X6sDCHwjtfKKxZZHIZRt3XRXg00hybVzvcs
	V8UEtRNvdCkRw6DXYEQefEPajmYc9IXBoyWzfBqG85JvI3L1JOwJeYUQElUGwRRb13CGlNgq8ko
	Nfv2Oy5wLbm4x1rk/DByg+qPCspYIt6kU=
X-Received: by 2002:a05:600c:a408:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-486fe8a2aa6mr49546395e9.1.1774026913863;
        Fri, 20 Mar 2026 10:15:13 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe82a030sm79851845e9.10.2026.03.20.10.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:15:13 -0700 (PDT)
Message-ID: <469aa0e4-f34f-4afd-90f0-b066c070babd@gmail.com>
Date: Fri, 20 Mar 2026 18:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][PATCH 5/8] lilibgedit-gtksourceview: Upgrade to
 299.6.0
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
 <20260320170155.1413929-5-khem.raj@oss.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260320170155.1413929-5-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 17:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125451

Typo in the recipe name in the summary: lilibgedit vs libgedit

On 3/20/26 18:01, Khem Raj via lists.openembedded.org wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...urceview_299.4.0.bb => libgedit-gtksourceview_299.6.0.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-gnome/recipes-gnome/gedit/{libgedit-gtksourceview_299.4.0.bb => libgedit-gtksourceview_299.6.0.bb} (75%)
> 
> diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.4.0.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb
> similarity index 75%
> rename from meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.4.0.bb
> rename to meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb
> index 0d67471280..119a75b2bb 100644
> --- a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.4.0.bb
> +++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb
> @@ -1,13 +1,14 @@
>  SUMMARY = "Gedit Technology - Source code editing widget"
>  SECTION = "gnome"
>  LICENSE = "LGPL-2.1-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> +LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=310c7c93cf5181c6b0cc8229a1f3c6f6"
> 
>  DEPENDS = "glib-2.0 gtk+3 libxml2"
> 
>  inherit gobject-introspection features_check gtk-doc gnomebase
> 
> -SRC_URI[archive.sha256sum] = "20c17ff89e2031aed5dc1107fe9a93fd50f92b569be2954b119c86f9e2fd85d6"
> +SRC_URI = "git://gitlab.gnome.org/World/gedit/libgedit-gtksourceview.git;protocol=https;branch=main"
> +SRCREV = "a7bdc39f9fbc10c49ea7468ac1e5bf77385da0c0"
> 
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125446): https://lists.openembedded.org/g/openembedded-devel/message/125446
> Mute This Topic: https://lists.openembedded.org/mt/118421467/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


