Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CC2CC6B33
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 10:35:28 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36427.1792060527202113735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 03:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=b+jgPhSL;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afe75f055so278531f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 03:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792060525; x=1792665325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5JbIxBQcAIUEav+EdnvH/E3pRswWWe/oAFTfqpQdjU=;
        b=b+jgPhSLqBlMw8LpPv2pe/hr8GLUglanWoH7MDETGN/aqDmoSuwDIB7p433IQ8axfl
         sa0Yk3v2Q2s9Ljx9FtXYkrWRgYc/Ivfnel7SfDpts+LYwhK/Wi3KjyVPukpjmGfQZ4DV
         D6R+XuD5+Oz+i36K5LR6Vnei61RexFrmcPhks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060525; x=1792665325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5JbIxBQcAIUEav+EdnvH/E3pRswWWe/oAFTfqpQdjU=;
        b=N69rrRqKHVPv4ClS5OUjV6OdMfV97n3LRPSvch+RGk36Ry0mVNv7uWgDJ1tZX1c5Wl
         8HOXZRTxG5NnXsPb5u11ULIN0Ktbw7P4Mts9l9s7EXqwCcVJJQgsHpz8buDxhx66RyAl
         IcMcuh5eZXRH22nc6IPuLocQg5lt5c87CczSMF3THfqeb0UKwa64goBbw+z5pS7MH0SZ
         F6w+bYAz/BJZwq9euTLj0295vS6P3FhtF9Fx+hmyDKSdVUHKDuwWeM4xQtvv6+lIT7MT
         JKl4V+rZ+e2bJE6Fr/LW4V2f4szYdNTlpvFY7gdcu96pMCnfIU+gAsFhSnGcMdm9bzaZ
         oTgQ==
X-Gm-Message-State: AFq9FYKM8PDq7J7xPl9fTBbC4MmgAT816jYAhjT5XUvLoS4OHrMYOZHe
	uZlNkS7MYCQz4rp/MS7qS3SCFbCE0fE1w8kTiAc7NYzGtFjp1L2yO+zXXBQBuB8+Bl7aWby1eIy
	aN/zf
X-Gm-Gg: AYBFou2mADo/BLm8afpzS62MvithDqZPDnBDAvOncLCHonHNBd3qFe2VhkWZ99xNRy6
	r+B7ub7q4gfTZxiAxhzfckh519KXdWXGU9NspbU9y8wZA5M8P8mWCZS+pINdI9rmNia2OptW7B2
	vbEPBa+nbxdn5u5SC5kb08/JkBF9xA0dWzi9o5DR3Yh48hkpa0D1Y2z8q8pbrqK1w7vCdKJfce+
	aQnClEQfpAh+HlAoIO/upPHRvSg9VVGseNy7laJuQtqCvkYQ810Q4+A2sdumATn75IJmI85E6Tt
	QSCECLu3Xo4FNbwMuD2LS9SW/dpEeK1rH9IcOb42GzgaOB/4RBfAWo6hoyhBw+iUe6Q/apW/N44
	pPzr5ITpW/SM86oTqiIcJF7EUkUdLk5ckWY2yMnu17VnFZDJKw24X68caPPmPMSlM99ctXNDMPN
	zLAsLK9dhgKGnHKstgUzO+bcaWDpBf2SvG8ovUBbV177TLg5xyz/UKopi8gB5FJReWbkTTxnQGW
	hLqt/S+F3abJLhD6xuotoSh0T5sX5WWX8+dvn3MZERNmrnEv1sHVEhk/VCMeBm8usNZ7L9QCi1n
	EJkK9Z5zj8I2NG0RwDkjhaU=
X-Received: by 2002:a05:600c:83c7:b0:4a1:7733:5102 with SMTP id 5b1f17b1804b1-4a18e4a3fc8mr357638375e9.15.1792060525203;
        Thu, 15 Oct 2026 03:35:25 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd97ed6asm60904655e9.6.2026.10.15.03.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:35:24 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] zbar: Upgrade 0.23.93 -> 0.23.95
Date: Thu, 15 Oct 2026 13:35:22 +0300
Message-ID: <20261015103522.3606004-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 10:35:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131006

Upgrade to release 0.23.95:

- fix: undefined behavior (UBSan) warnings in QR decoder and
  scanner
- ci: address some issues for artifact generation

From 0.23.94:

- zbar now uses meson;
- ci was improved to allow unit tests on MacOS and Windows;
- Windows artifact now generate statically linked files;
- documentation updates.
- other minor changes to cleanup it a little bit after meson
  migration.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../zbar/{zbar_0.23.93.bb => zbar_0.23.95.bb} | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-support/zbar/{zbar_0.23.93.bb => zbar_0.23.95.bb} (65%)

diff --git a/meta-oe/recipes-support/zbar/zbar_0.23.93.bb b/meta-oe/recipes-support/zbar/zbar_0.23.95.bb
similarity index 65%
rename from meta-oe/recipes-support/zbar/zbar_0.23.93.bb
rename to meta-oe/recipes-support/zbar/zbar_0.23.95.bb
index 36a9a5c827..489615721a 100644
--- a/meta-oe/recipes-support/zbar/zbar_0.23.93.bb
+++ b/meta-oe/recipes-support/zbar/zbar_0.23.95.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5e9ee833a2118adc7d8b5ea38e5b1cef"
 
 SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https;tag=${PV}"
-SRCREV = "bb05ec54eec57f8397cb13fb9161372a281a1219"
+SRCREV = "dc19fcc7da58e8cf84ba1ec417e24b04609feb23"
 
 DEPENDS += "xmlto-native"
 
@@ -19,19 +19,17 @@ PACKAGECONFIG ??= "\
     video \
 "
 
-inherit autotools pkgconfig gettext \
+inherit meson pkgconfig gettext \
     ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gtk', 'gobject-introspection', '', d)}
 
-PACKAGECONFIG[x11] = ",, libxext libxv"
-PACKAGECONFIG[video] = "--enable-video, --disable-video, v4l-utils libv4l"
-PACKAGECONFIG[jpeg] = "--with-jpeg, --without-jpeg, jpeg"
-PACKAGECONFIG[python] = "--with-python=auto, --without-python, python3"
-PACKAGECONFIG[gtk] = "--with-gtk=auto, --without-gtk, gtk+3"
-PACKAGECONFIG[qt] = "--with-qt, --without-qt, qtbase qtbase-native qtx11extras qtsvg, qtbase"
-PACKAGECONFIG[imagemagick] = "--with-imagemagick, --without-imagemagick, imagemagick"
-
-EXTRA_OECONF += "--enable-pthread"
+PACKAGECONFIG[x11] = "-Dx11=enabled -Dxv=enabled -Dxshm=enabled,-Dx11=disabled -Dxv=disabled -Dxshm=disabled,libx11 libxext libxv"
+PACKAGECONFIG[video] = "-Dvideo=true,-Dvideo=false,v4l-utils libv4l"
+PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
+PACKAGECONFIG[python] = "-Dpython=python3,-Dpython=no,python3"
+PACKAGECONFIG[gtk] = "-Dgtk=gtk3,-Dgtk=no,gtk+3"
+PACKAGECONFIG[qt] = "-Dqt=true,-Dqt=false,qtbase qtbase-native qtx11extras qtsvg,qtbase"
+PACKAGECONFIG[imagemagick] = "-Dimagemagick=enabled -Dgraphicsmagick=disabled,-Dimagemagick=disabled -Dgraphicsmagick=disabled,imagemagick"
 
 FILES:${PN} += "${bindir} \
     ${@bb.utils.contains('DEPENDS', 'python3-native', '${libdir}', '', d)} \
-- 
2.47.3


