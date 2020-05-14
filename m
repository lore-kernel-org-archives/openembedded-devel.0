Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.139.1589478005398390340
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 10:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OijuCJrf;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id n5so18978120wmd.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 10:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6ldpGyRE6JK0HIHLiSD7HNzRhwHjEmhLG5TGyG8xUY=;
        b=OijuCJrfHEbJkZ2w07YIs/v1xteybKoYxcq1+1f2lhSAqsgrIClPXmpqt+4YLBEefG
         sQvk4vJki591v8Rbr2Whqie13kGUpyhhs2ehP0IRwmgyTAUgyqhEglfYAOniRMihA/vT
         inqu5ljIfGyujai+n+6BwTxlyqM8Loy7GLc6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6ldpGyRE6JK0HIHLiSD7HNzRhwHjEmhLG5TGyG8xUY=;
        b=sBTsMNH9+I7+3yRSVvJRvKUpSK6fK5joKGH7/4csQ7rysfnFBFMA++pNAcR5Ncuyvj
         AkSpG0Ta8uby9I3lQQUE9RlmMFLj9VIQVZZRC+xej+BrUvb0bEyS7DW2GdBjCbAYuclW
         /u58xsQ3fHSc6XT/NwsBxNlkZcmZP1qcax+NfZRaxYxhbyYC0z9jO3IBqg4V4VlIFIIj
         umq23SghawHC/xNSUN9KyACuk4Hs8rDbBoJiAp0g3ygoEWxNtiQKrLZbcJft5qCS6i2d
         /65vcAXmCsmELHMVHydgVAuu9c3b9yTfui3wPXbwDOj9xfSp3ztbsb9xBQg3NsyxObDZ
         aiWg==
X-Gm-Message-State: AGi0PuZIhfxM6Qejn1pbDHa3PJ/vKnVpyyq9hoCsbnMUpaL18FjZBeuo
	bQhC9wXnv1yY69Zdi0hvgrd3PFhLgaVEoA==
X-Google-Smtp-Source: APiQypLGjVcTfAEMQOGlJXFnInDgXPZd9IF3+TkAb3kg2nEqi5RVT6f1GGRBq3QZvIQEFiRl565Ryg==
X-Received: by 2002:a1c:b354:: with SMTP id c81mr42232190wmf.136.1589478002769;
        Thu, 14 May 2020 10:40:02 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id w82sm12619475wmg.28.2020.05.14.10.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 10:40:02 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [meta-oe][PATCH] mplayer-common: Drop obsolete recipe
Date: Thu, 14 May 2020 18:39:59 +0100
Message-Id: <20200514173959.1075-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This recipe hasn't been changed in any meaningful way since it was
imported from oe-classic in 2011. There's no recipe for mplayer in
meta-oe these days so it's probably time to drop it.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta-oe/conf/layer.conf                       |  1 -
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 .../mplayer/mplayer-common.bb                 | 23 -------------------
 .../mplayer/mplayer-common/mplayer.conf       | 15 ------------
 4 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index adcec8302..5bf1f6cfd 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -43,7 +43,6 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 PREFERRED_RPROVIDER_libdevmapper = "lvm2"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-  mplayer-common \
   fbset-modes \
   gpsd-machine-conf \
   distro-feed-configs \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 8358e933d..0812da1af 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -210,7 +210,7 @@ RDEPENDS_packagegroup-meta-oe-multimedia ="\
     alsa-oss audiofile cdrkit id3lib \
     a2jmidid jack libass libburn libcdio libcdio-paranoia \
     libdvdread libmms libmodplug libopus live555 \
-    mplayer-common opus-tools \
+    opus-tools \
     sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol xsp", "", d)} \
     libmikmod \
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
deleted file mode 100644
index 829c3b243..000000000
--- a/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-# Copyright Matthias Hentges <devel@hentges.net> (c) 2006
-# License: MIT (see COPYING.MIT)
-
-SUMMARY = "Preconfigured mplayer preferences"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PV = "0.0.1"
-PR = "r1"
-
-SRC_URI = "file://mplayer.conf"
-
-# Yes, really /usr/etc!!!
-do_install() {
-    install -d "${D}/usr${sysconfdir}/mplayer"
-
-    install -m 0644 ${WORKDIR}/mplayer.conf "${D}/usr${sysconfdir}/mplayer"
-}
-
-FILES_${PN} = "/usr${sysconfdir}/mplayer"
-
-inherit allarch
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf b/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf
deleted file mode 100644
index 37ad65fa2..000000000
--- a/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-
-# You probably shouldn't touch these
-ac=mad,
-ao=alsa,
-
-# Required on SL-Cxxxx for correct rotation in the *VT*,
-# breaks rotation in X!
-# vf=rotate=1
-
-# Enable fullscreen display by default
-# fs=true
-
-# Drop frames to keep audio and video in sync
-framedrop=true
-
-- 
2.26.2

