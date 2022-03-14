Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B228CC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 15:28:02 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.27700.1647271681387017374
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 08:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pTfDmnAu;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id o26so14131088pgb.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=bUSV7LdV4PeMGaIDLL8x0PTVbN8Ik7di597mFIZz9Oo=;
        b=pTfDmnAuccJltqUMwdMKCj6y0otiPiw0QvvHL9xm28BpNKBxUEXSNVG0zns6ddICO0
         DdPb0C5427kSfidI0mbYebwn3q0HhSQ4VpiBp+6B9NFX5ZiXNe/fWNC1TyEW3aHUN1TU
         fCAZTFgCouMud4iSVpHnsrnMkWYsAL+ypjsDWTKDp+jGO+Ln3Ac0/EJkJfx3+Cm74H4W
         lUVhwA9dsFd4IZmRh4YhMCQNjVM2DVTMFG7RiIWtPA5+5PgnfuExCfNy6iK+GzAzZwtP
         oadsTOfdiADpTu6FEpyIXDz/OgCczh5cjdQi3sTgHeDz+LYqvs4pM0N9TIedS52hKR7w
         BcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=bUSV7LdV4PeMGaIDLL8x0PTVbN8Ik7di597mFIZz9Oo=;
        b=IzkQxjz/On/LHYBfnUFArz0elxySjh5KkxCPmEbSqozIWNRRkzFElg2PKFjnrnVCjv
         D5qiNaBa6U8btq8TwqCm8wsHlFbZufFaz5VQT/zsvRJmnHEmE/s0Aw8b8srS46tVcK3e
         QGtTqJ7q913P5Xmoex0JpxUZzbk5DDkc0L4aoKWahe+L1ovaJ033eQoC5pVMJnS1KfDt
         I27ZgXuzUNGPpvWQ0Ff+TRubJy58kOVFQ4eQc/32peeXvPK/ToKlPehBpYauvb9fylf9
         VD+yRaDkIQax24GGT0c+GGKUxPMzfydbRy1ybzg76U7NVfWfdfak0cmaKdSVMskHL5v8
         B+Hw==
X-Gm-Message-State: AOAM531OJPtsjMkCq6pjZhJTgRfM3Vbnqgav+mLFcMXyOI9oSK0IaIId
	pFL/Boeq63V6rjccSL8RTfE=
X-Google-Smtp-Source: 
 ABdhPJz4z7nAL+YdIBq+tjin68wt3xeV/J3yBg/npGkB7xti6aWdSeToymaewCQTWAK0xbQZ5qrxew==
X-Received: by 2002:a65:4003:0:b0:37f:f658:8fd1 with SMTP id
 f3-20020a654003000000b0037ff6588fd1mr20582709pgp.214.1647271680679;
        Mon, 14 Mar 2022 08:28:00 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:7868:20f5:ad4:48dd?
 ([2601:646:9200:a0f0:7868:20f5:ad4:48dd])
        by smtp.gmail.com with ESMTPSA id
 s15-20020a63af4f000000b0037c8875108dsm17484788pgo.45.2022.03.14.08.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 08:28:00 -0700 (PDT)
Message-ID: <62a2a3e4-bcc6-9287-d9e9-fdc73a27e68e@gmail.com>
Date: Mon, 14 Mar 2022 08:27:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [oe] [meta-oe][PATCH 1/6] zbar: Update 1.23.1 -> 1.23.92+4e0f618
Content-Language: en-US
To: Daniel Gomez <daniel@qtec.com>, openembedded-devel@lists.openembedded.org
Cc: dagmcr@gmail.com
References: <20220314085646.38283-1-daniel@qtec.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220314085646.38283-1-daniel@qtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 15:28:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95978

please rebase this patch on top of master-next and resend.

On 3/14/22 1:56 AM, Daniel Gomez wrote:
> - Drop patches already upstream.
> - Remove duplicated PACKAGECONFIG variable.
> - Update to master: Version 1.23.92+4e0f618.
> 
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>   .../0001-qt-Create-subdir-in-Makefile.patch   | 35 ----------------
>   ...02-zbarcam-Create-subdir-in-Makefile.patch | 40 -------------------
>   meta-oe/recipes-support/zbar/zbar_git.bb      | 12 ++----
>   3 files changed, 4 insertions(+), 83 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
>   delete mode 100644 meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
> 
> diff --git a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> deleted file mode 100644
> index d7ca15207..000000000
> --- a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 9c67f377477a07495a712f478eabfa8d33164c45 Mon Sep 17 00:00:00 2001
> -From: Daniel Gomez <dagmcr@gmail.com>
> -Date: Sun, 17 Jan 2021 23:32:51 +0100
> -Subject: [PATCH 1/2] qt: Create subdir in Makefile
> -
> -Create builddir/qt subdir when --with-qt5 is enabled.
> -
> -Fixes the following error:
> -
> -moc -Iqt -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB
> --I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
> --I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
> --I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
> --I../git/include ../git/include/zbar/QZBar.h -o qt/moc_QZBar.cpp
> -moc: Cannot create qt/moc_QZBar.cpp
> -make: *** [Makefile:2459: qt/moc_QZBar.cpp] Error 1
> -
> -Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
> ----
> - qt/Makefile.am.inc | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/qt/Makefile.am.inc b/qt/Makefile.am.inc
> -index b099c2b..c98fbeb 100644
> ---- a/qt/Makefile.am.inc
> -+++ b/qt/Makefile.am.inc
> -@@ -15,4 +15,5 @@ qt/moc_%.cpp: qt/%.h
> - 	$(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
> -
> - qt/moc_%.cpp: include/zbar/%.h
> -+	@$(mkdir_p) qt 2>/dev/null
> - 	$(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
> ---
> -2.29.2
> -
> diff --git a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
> deleted file mode 100644
> index a1c27b8b4..000000000
> --- a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From fe751929ccc8fd75e350ed6db9d28d04bd31fc79 Mon Sep 17 00:00:00 2001
> -From: Daniel Gomez <dagmcr@gmail.com>
> -Date: Sun, 17 Jan 2021 23:33:19 +0100
> -Subject: [PATCH 2/2] zbarcam: Create subdir in Makefile
> -
> -Create builddir/zbarcam when --with-qt5 is enabled.
> -
> -Fixes the following error:
> -
> -moc -i -Izbarcam -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB
> --DQT_CORE_LIB
> --I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
> --I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtX11Extras
> --I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
> --I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
> --I../git/include ../git/zbarcam/zbarcam-qt.cpp -o
> -zbarcam/moc_zbarcam_qt.h
> -moc: Cannot create zbarcam/moc_zbarcam_qt.h
> -make: *** [Makefile:2438: zbarcam/moc_zbarcam_qt.h] Error 1
> -
> -Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
> ----
> - zbarcam/Makefile.am.inc | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/zbarcam/Makefile.am.inc b/zbarcam/Makefile.am.inc
> -index b6de82c..e90c50c 100644
> ---- a/zbarcam/Makefile.am.inc
> -+++ b/zbarcam/Makefile.am.inc
> -@@ -28,6 +28,7 @@ DISTCLEANFILES += $(nodist_zbarcam_zbarcam_qt_SOURCES) zbarcam/moc_zbarcam_qt.h
> -
> -
> - zbarcam/moc_zbarcam_qt.h: zbarcam/zbarcam-qt.cpp
> -+	@$(mkdir_p) zbarcam 2>/dev/null
> - 	$(MOC) -i $(zbarcam_zbarcam_qt_CPPFLAGS) $< -o $@
> - endif
> -
> ---
> -2.29.2
> -
> diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-support/zbar/zbar_git.bb
> index 17084f830..5d7d7e173 100644
> --- a/meta-oe/recipes-support/zbar/zbar_git.bb
> +++ b/meta-oe/recipes-support/zbar/zbar_git.bb
> @@ -9,23 +9,19 @@ SECTION = "graphics"
>   LICENSE = "LGPL-2.1-only"
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5e9ee833a2118adc7d8b5ea38e5b1cef"
> 
> -SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https \
> -    file://0001-qt-Create-subdir-in-Makefile.patch \
> -    file://0002-zbarcam-Create-subdir-in-Makefile.patch \
> -"
> -SRCREV = "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
> +SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https"
> +SRCREV = "4e0f618b54af060fc3516acfb34b6023ed064620"
> 
>   S = "${WORKDIR}/git"
> -PV = "0.23.1+git${SRCPV}"
> +PV = "0.23.92+git${SRCPV}"
> 
>   DEPENDS += "xmlto-native"
> 
>   PACKAGECONFIG ??= "\
>       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +    video python3 \
>   "
> 
> -PACKAGECONFIG ??= "video python3"
> -
>   inherit autotools pkgconfig gettext \
>       ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)} \
>       ${@bb.utils.contains('PACKAGECONFIG', 'gtk3', 'gobject-introspection',	'', d)} \
> --
> 2.34.1
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95972): https://lists.openembedded.org/g/openembedded-devel/message/95972
> Mute This Topic: https://lists.openembedded.org/mt/89769362/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

