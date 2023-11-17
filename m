Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3717C072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 09:18:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.8262.1700212680766529349
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 01:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=PXObrf5/;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3316c6e299eso107677f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 01:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700212678; x=1700817478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/nMIFwnZHmndrIwCBs47Q5nsnRHabnp7jsXsYvrRXM=;
        b=PXObrf5/PsSWwElB+npVeNgY06AePMes3J4uhtCjtnOmOtYHTMFRp5P7SiDa2VkHYx
         XSPGWl0fDjvOM8X64Exl5eLWERjE4jmb+MltKvJv77wJP0r97eFCs2rdlPgM9T1idm+g
         IrCWVyAQl575VKIXfN84WJXSBGif1qbJOJd4ctSqYBfha0CUNYVLiko5OvBqD6Pk/p9m
         DEQbgJXlkCrTup1W+J+o4GqEgwzA0MNGKwJO66Riz/7oUeIoimvz3OIjQEBgzQYfy2Zr
         O6ySMuytg6g8jmGbcJot5YCxX4zr3+nRGB1jVQmczwwuvWDvnSC0LnYhLuatUmhTzghZ
         YdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212678; x=1700817478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/nMIFwnZHmndrIwCBs47Q5nsnRHabnp7jsXsYvrRXM=;
        b=oVKBFs8hv7sw6tGiQjDcpMUGlQy7eIPc494lNHvuV/CJNvX+SXnBgCbeLtCV4BWUIQ
         2bnMO8loH0IjwH7Ud8ysOBXp6wkcNOBjiko6kFSf2ISOpxWSoZaKX434cpXSm1Uajub9
         Stok+ZK74XBSZY6ZOndjgE/lltyzExGZUvvIjRbG5jiuYBT/jBHksUQcjXZnlQtyG3Gb
         asKT1E9OjaqKjl8bkdvxCahhi/z1ahw8W9TyugrLzvMIWsyozfVIDaYwcxxQpNr8TXJX
         IebLG8DBt9ai3lXoB/ZEVnbZlZZzYfm4FTzLjXV6rpBqFcl5if35eNSa8aMckRGR+M80
         pJmA==
X-Gm-Message-State: AOJu0Yyx5Hl3QYNgjEHFJcF0uOnHcNKr7SbRa99Wjsls+pHhZEdG/QYD
	G2KApMZtWBwrn/3yuU7Wker6CkFv4FEJG94RohY=
X-Google-Smtp-Source: AGHT+IEVe0BR+l4/4m/+7hWOEpPYraKKeBHk9vj+lWQPx2OTB2jukX3z3NZT+cfKgN5aNIVqd89jYQ==
X-Received: by 2002:adf:fb01:0:b0:32d:9d3d:3025 with SMTP id c1-20020adffb01000000b0032d9d3d3025mr10587436wrr.26.1700212678541;
        Fri, 17 Nov 2023 01:17:58 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id f12-20020adff44c000000b003313e4dddecsm1679132wrp.108.2023.11.17.01.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 01:17:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][kirkstone][PATCH 3/3] meta-oe: Drop broken BBCLASSEXTEND variants
Date: Fri, 17 Nov 2023 10:17:33 +0100
Message-Id: <20231117091733.450572-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231117091733.450572-1-yoann.congal@smile.fr>
References: <20231117091733.450572-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 09:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106863

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The command "bitbake universe -c fetch" currently throws a ton of warnings
as there are many 'impossible' dependencies.

In some cases these variants may never have worked and were just added by copy
and paste of recipes. In some cases they once clearly did work but became
broken somewhere along the way. Users may also be carrying local bbappend files
which add further BBCLASSEXTEND.

Having universe fetch work without warnings is desireable so clean up the broken
variants. Anyone actually needing something dropped here can propose adding it
and the correct functional dependencies back quite easily. This also then
ensures we're not carrying or fixing things nobody uses.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9962d57f7c235873de0a0bb192b5f56747762fc7)
Backport:
* Updated paths to follow PV changes
* Adapted modified recipes to the ones generating warnings
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb | 2 --
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb     | 2 --
 meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb | 2 +-
 meta-oe/recipes-devtools/unifex/unifex_git.bb         | 2 --
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb   | 2 +-
 meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb   | 2 --
 meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb   | 1 -
 7 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb
index 79d54038e..a33265063 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb
@@ -14,5 +14,3 @@ SRC_URI[sha256sum] = "848c4fe863806e506832f1ee85b8b68258f06eb19dad43dbeee16a2cfe
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
 inherit autotools pkgconfig
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index 86fde7ccf..ce9d758d9 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -30,8 +30,6 @@ PACKAGECONFIG[nss] = "-DCZMQ_WITH_NSS=ON,-DCZMQ_WITH_NSS=OFF,nss"
 PACKAGECONFIG[systemd] = "-DCZMQ_WITH_SYSTEMD=ON,-DCZMQ_WITH_SYSTEMD=OFF,systemd"
 PACKAGECONFIG[uuid] = "-DCZMQ_WITH_UUID=ON,-DCZMQ_WITH_UUID=OFF,util-linux"
 
-BBCLASSEXTEND = "nativesdk"
-
 do_install:append() {
         mkdir -p ${D}/${includedir}/${BPN}
         mv ${D}/${includedir}/sha1.h ${D}/${includedir}/${BPN}/.
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
index 29937e26d..be2c0f539 100644
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
@@ -29,4 +29,4 @@ EXTRA_OECMAKE += "-DHEAPTRACK_BUILD_GUI=OFF"
 COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:riscv64 = "null"
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/unifex/unifex_git.bb b/meta-oe/recipes-devtools/unifex/unifex_git.bb
index 85fe39b6d..f55d7e32c 100644
--- a/meta-oe/recipes-devtools/unifex/unifex_git.bb
+++ b/meta-oe/recipes-devtools/unifex/unifex_git.bb
@@ -20,5 +20,3 @@ EXTRA_OECMAKE += " \
     -DCMAKE_CXX_STANDARD=20 \
     -DUNIFEX_BUILD_EXAMPLES=OFF \
     "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index 42d2b4efb..1c090fdea 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -26,4 +26,4 @@ EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_LIB_DIR=${@d.getVar('baselib').replace('/',
 
 FILES:${PN} += "${libdir}/openjpeg*"
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb
index 6a05e98e3..d394b33de 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb
@@ -13,7 +13,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=64322fab5239f5c8d97cf6e0e14f1c62"
 
 DEPENDS += "libxaw libxkbfile"
 
-BBCLASSEXTEND = "native"
-
 SRC_URI[md5sum] = "502b14843f610af977dffc6cbf2102d5"
 SRC_URI[sha256sum] = "d2a18ab90275e8bca028773c44264d2266dab70853db4321bdbc18da75148130"
diff --git a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
index 30a1e089e..a9a8acf05 100644
--- a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
@@ -8,7 +8,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ea29dbee22324787c061f039e0529de"
 
 DEPENDS += "xbitmaps libxcursor"
-BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "5fe769c8777a6e873ed1305e4ce2c353"
 SRC_URI[sha256sum] = "10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c"
-- 
2.30.2


