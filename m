Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004BACAC5BB
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 01:48:44 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.24008.1759715316438652341
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 18:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nxb87s9t;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-74f6974175dso49854187b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 18:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759715315; x=1760320115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYKd5YBIImoMcY2oGsQr9BeMyn75dVOF1GqC+d7uw1E=;
        b=Nxb87s9tHM2fHTh1fldgwwg8ZNJNb3Puooj7c2ERetAIn1o48zGhIePh/6aeJpImFH
         6SXIrQGZopJbdoS1NHO8Lnx/Qn3rtdjfIdsgHPRfBdcWtA9rQiRAYPjS9zb3mmUmVkcv
         VWGAvvLUojQi5WfrBI9LieKs1XOdMlb6v5NOu9fCR6yWJa/2yfqmroIYwau1lfv26apS
         RMJwnGiMR1MzFTnY0P8B2h1XRx1Y4frZ3/qz34ALAJlFo9/73lwYMVdk5szIt9pVmK51
         17uaVZ3OtiSIvXhsd8/i8c1hksyQcPM45f0nfvQHYTHhfKMOv91lRiu5ClnkGTmnNvy6
         NbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759715315; x=1760320115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYKd5YBIImoMcY2oGsQr9BeMyn75dVOF1GqC+d7uw1E=;
        b=oH7LNJhQsSm70AUrO+1M6UFWj+F/2plsaP1XUb70ej1842GJKshwRA/91reIx8gOXH
         Njzp/HlTBkUGyMojjHl7ldGRsphwM5brWSqpN9NhsrHQ27HbrKNGx4jz8Da1N+FS/1Hz
         BxDadJ1Y2jqZiPxExtBh7Wz5RUobdC2xEpR7RLgP9R1s4QzSE/KeK1leR19SBGoIBexE
         xPNyKs5ojDB4QT5IaPGBtb96ymZbjNoUJkBZI01CBU68QDEHDR+a21p+h7tq/nTqMqMA
         OuCA8FtW5okm85Rn0hPIX54+tDIt5h/1Xw/J+flLifXriGLMX7ikVRdQifgN/haUU62L
         4LYQ==
X-Gm-Message-State: AOJu0YzV51ZZ+DF4M0VRYL2sWUa6R7DI4tov9WM3xHM3sCEG7Y0GU8tk
	j55JzuqR3jInAJALPyrIbOya03rOmQ2XfSaw7ImPF7amBL/wEPQVD/4HAxiUd9Sf
X-Gm-Gg: ASbGncvglYx1Vv05q6QahlNx2SRJibmNZAn1TGy5HfG/Ay9lXpcaNFZLt3UjdnYQ9t9
	4+J/1hLfecH3e+lUTF9sEvD3PUhFjERo1LY5MEuXTAc174e+lfR+vRZY/PNCkXyYhChnY0j9TrK
	QvY8lasSuAz+olRPAbFTLkl9z76AgpiP+tfXDCVm3Vpl4QiSCWr+QfdGeqzywkVuS5wlTCAN2wd
	mYgU3sgiBj3bRGqGbLUo/vtdaDYhVs4dXc9+Bto3FF0VGXn5g3bG+3aMIhw01RKuo8K7Pim9t6Y
	GN3NWrer7og3p6A/HFevrt3rB+yxptpFxwJ/uaLNOMifdDjlKJts1kVA9EY34cGZco8gt/j1Q15
	LAXEbS+QThsIYnVaTgYyKLJvaJov6OCouzCAio9UR8Cm9F+fOnz8h
X-Google-Smtp-Source: AGHT+IEnYtsFgDo9ICb1gSd882GnkiGtqnZwJAP4q1XkedfkLQxh02K2YisO8ORKyFf05B/AqHaygQ==
X-Received: by 2002:a05:690c:7649:b0:77f:b23e:b587 with SMTP id 00721157ae682-77fb23f32eemr53518687b3.45.1759715315102;
        Sun, 05 Oct 2025 18:48:35 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81aad051sm39177337b3.0.2025.10.05.18.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 18:48:34 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 10/10] xfce4-mount-plugin: upgrade 1.1.5 -> 1.2.0
Date: Sun,  5 Oct 2025 21:47:27 -0400
Message-ID: <20251006014727.58960-10-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006014727.58960-1-schonm@gmail.com>
References: <20251006014727.58960-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 01:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120267

License-Change: checksum change reflectes the change of address of the Free Software Foundation.

Patch updated with new offsets where appropariate.

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-mount-plugin/-/tags/xfce4-mount-plugin-1.2.0
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-mount-plugin/-/tags/xfce4-mount-plugin-1.1.7
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-mount-plugin/-/tags/xfce4-mount-plugin-1.1.6

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...0001-check-for-fstab.h-during-configure.patch | 16 +++++++---------
 ...ugin_1.1.5.bb => xfce4-mount-plugin_1.2.0.bb} |  6 ++++--
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-xfce/recipes-panel-plugins/mount/{xfce4-mount-plugin_1.1.5.bb => xfce4-mount-plugin_1.2.0.bb} (59%)

diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
index 64f06cebb5..f0435238ac 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
@@ -23,16 +23,14 @@ diff --git a/configure.ac b/configure.ac
 index 375e64a..590b7ad 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -65,6 +65,9 @@ dnl param.h is part of libc6 on Linux, but important for old-style Unix and espe
- AC_CHECK_HEADERS([sys/param.h])
- AC_CHECK_HEADERS([sys/mount.h])
- 
+@@ -36,4 +36,7 @@ 
+ AC_PROG_INSTALL
+
 +dnl make musl happy
 +AC_CHECK_HEADERS([fstab.h])
 +
- dnl Add -traditional to output variable CC if using the GNU C compiler and ioctl does not work properly without -traditional. That usually happens when the fixed header files have not been installed on an old system. Leave here commented out to comment in if some older *NIX systems might require it as was recently written on the ML.
- dnl AC_PROG_GCC_TRADITIONAL
- 
+ dnl Initialize libtool
+ LT_PREREQ([2.2.6])
 diff --git a/panel-plugin/devices.c b/panel-plugin/devices.c
 index 797b079..d29df56 100644
 --- a/panel-plugin/devices.c
@@ -47,7 +45,7 @@ index 797b079..d29df56 100644
  #include <glib.h>
  #include <stdio.h>
  #include <stdlib.h>
-@@ -468,11 +470,12 @@ disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
+@@ -467,11 +469,12 @@ disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
  {
      GPtrArray * pdisks; /* to be returned */
      t_disk * pdisk;
@@ -61,7 +59,7 @@ index 797b079..d29df56 100644
      /* open fstab */
      if (setfsent()!=1)
      {
-@@ -526,7 +529,20 @@ disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
+@@ -529,7 +532,20 @@ disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
      } /* end for */
  
      endfsent(); /* close file */
diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.2.0.bb
similarity index 59%
rename from meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
rename to meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.2.0.bb
index f11e41f9bd..073b7cf86a 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.2.0.bb
@@ -2,10 +2,12 @@ SUMMARY = "Mount/umount utility for the xfce panel"
 HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-mount-plugin/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+XFCE_COMPRESS_TYPE = "xz"
 
 inherit xfce-panel-plugin
 
 SRC_URI += "file://0001-check-for-fstab.h-during-configure.patch"
 
-SRC_URI[sha256sum] = "584cd954929e542b3da0ff8d69e0325d8838dc39e7b32a509d1074ce3bb58ec2"
+SRC_URI[sha256sum] = "adef71a83078e7dc45997e57411f8c43080a0204159a8b8db2ade0a9877e7b4c"
-- 
2.43.0


