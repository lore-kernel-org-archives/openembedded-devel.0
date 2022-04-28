Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB35AC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 18:09:29 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.365.1651169364584073222
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 11:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gPttvwZo;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id j6so4883457pfe.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 11:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ZJvao6bIO1GPbIV42kKv/RQ+RKIzL53aVuTuHPh5b4=;
        b=gPttvwZoZHE+Tv/Lha2/PPojdYLrEEHqwhro6YfNuE9Wy23yoI0h6CypaC7rFzwn5Y
         2DKmm0MJh6whqKCmEXGr0DBcGWP5xGpYjOzewa2cpg02EwtN1nCTpS7kBnJ2g/XBIAdf
         A5qEfEWxIbr43OUPeJQjGjVcfgeS9w8yprCNI7xBppVt533oZL8Zw+FtbxdnlADktjv8
         0WUB/px/H7D7gYVFNUSzO4oCNnhBtVA7qjkWrI7ewOHRFyJui573gnfYWRvGhdBDU5ee
         kaRk0w/8ujDqTQ7i2rCJW16fYPz4BIbZc2Hky/rSjHqSrCqoYzv4zL4E763z3RjJZB7+
         cH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ZJvao6bIO1GPbIV42kKv/RQ+RKIzL53aVuTuHPh5b4=;
        b=2y/+hA6psQievpW2f8YEPI595/JyttAhPQuWI7jjuYmIZncR/wQ0aj2zzIWMytv0G2
         s3CMKZOvntfk+oU/pbbkTctxNYpNXkWnf3pj8SROfZi1Q1FBbHh1P/dBGXlzPAh0BkND
         pBCX5ixGJZl5QR9H8zYcCDJ+Qd6xpTs0vI0sS4xZHvfbVW/APXPoiK3ho6p0bRivEP+Q
         EKqOTbtm7U+B62i771Of+DcxND0XxqqIEy9rbBlFzU8g7GpRoRm6BCpXS1b2wNZ7VQd0
         iC0P+ZA2wfEbgLApl/CN+ULnhlNg5iB2P+cT9nR/B/EMXXyoFe6YYhcqmGWGS6sOZMVs
         UeJg==
X-Gm-Message-State: AOAM530XrOVxb0cUTOcsThn4AVdttyNATu25bYsR2Nidb9ecFWlrFD9B
	Mp3btRbFnHsIWoy7E0O3C0NHC/ETNEc=
X-Google-Smtp-Source: 
 ABdhPJzHzSXxAwc1EK8r10ujUoMsS4I6oc7yuPoMiOTN7yqYymAGBp02Y53NpMDyWfMIOh2ZHPtSXA==
X-Received: by 2002:a63:554c:0:b0:3c1:65f2:5543 with SMTP id
 f12-20020a63554c000000b003c165f25543mr5662116pgm.4.1651169363771;
        Thu, 28 Apr 2022 11:09:23 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:b03c:3cc:dc2d:de8e])
        by smtp.gmail.com with ESMTPSA id
 v126-20020a622f84000000b004fa666a1327sm487309pfv.102.2022.04.28.11.09.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 11:09:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] meta-oe-image: fix build depends
Date: Thu, 28 Apr 2022 11:09:22 -0700
Message-Id: <20220428180922.955456-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 18:09:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96845

add only when various DISTRO_FEATURES are enabled

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bb    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 055e80cf18..d3f90bd83c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -98,7 +98,7 @@ RDEPENDS:packagegroup-meta-oe-bsp ="\
     acpitool \
     cpufrequtils \
     edac-utils \
-    firmwared \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "firmwared", "", d)} \
     flashrom \
     fwupd \
     fwupd-efi \
@@ -618,12 +618,12 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     surf \
     tesseract-lang \
     tesseract \
-    tigervnc \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "tigervnc", "", d)} \
     tslib \
     unclutter-xfixes \
     libvdpau \
     xcursorgen \
-    xscreensaver \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "", d)} \
     yad \
     parallel-deqp-runner \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
@@ -736,7 +736,7 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     anthy \
     atop \
     ace-cloud-editor \
-    driverctl \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "driverctl", "", d)} \
     frame \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis", "", d)} \
     grail \
-- 
2.25.1


