Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F192AC433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:40 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.25680.1651346320121049950
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cQHGIIha;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id s137so8896039pgs.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4yagthuZ5mI7PA+yLwacr8sqRc3DsJO9LURdHSJ3l0g=;
        b=cQHGIIhaHO8KEOqj7x6d0QjAnIGmGLK+p/eojo8iY1/6ObfyVloPtx7f9FJCUqHJgm
         lvDJ9GE5F/zLe2lOa8O3epYnrMXr+sWNGgV1bs6LGgJqcPY9GL/BuTsLGEorahsouWQ/
         52QFvwVUzcvTIKkCZvuTAROhvczRoLH48pbtJJM/VKY3cRyiYChAvffrW9BSGHo8MIjp
         OIFvRTcH3ev+IQtaCtwPB+M9IQrzbb0MlY06tLQUAiMDkx/8ahYG+J88R7aR3xkygVnT
         Q2LDuP1Cu7DMeDc7wy5hjO73Sj0OQpxPMqzXaTq9l7Ai+g0l8+HwYHTlilC52f5heoxc
         H4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4yagthuZ5mI7PA+yLwacr8sqRc3DsJO9LURdHSJ3l0g=;
        b=Go8XeRPJruqIA+OlbfW+RAH2NhOdAoRUvEOcsAM9lni5vKjAtC/NOBZV4PgpYZRcTB
         +fSMyoxz00bdwkGbrgik6tu+boHYIDS5J4vd0DlQ+sI+TPHh296FrTcuvscB+BsL1HBg
         QPo/bCEF6upfhL6Aa+V/5bxIBjQgNlToBbJxrG1I5/XSE22krZtKzV71VezZxWD9uafg
         U2wBee9Ulpz0xUkIUEwXQu9SqzV4SzNIj6Mrdz5JWSh+yg6d8k7jqIWDKk1EXxZKlQyT
         HwEPul+rB8c2dEz9NScFIPyoOrJ83kNcMEjQf4AlpY1G/FJ4CzmgA0giFQpi3k5uOaG4
         V8rQ==
X-Gm-Message-State: AOAM53207wA26qVmB0svvH/S6jB7zJTLjeRh7F99uokxtNkHmExs+fw+
	2MmVw1ISrzTwJ5vnHnU0NtQ51z2+Vw9CPw==
X-Google-Smtp-Source: 
 ABdhPJw+5EeAQ3csMQd2I2R5Jo0PevEJUsdiford4bLmRjfEqapl698pONSaocJgkDB0C+ObqMWLXQ==
X-Received: by 2002:a62:1788:0:b0:50d:dc1f:70b0 with SMTP id
 130-20020a621788000000b0050ddc1f70b0mr777492pfx.48.1651346319276;
        Sat, 30 Apr 2022 12:18:39 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 09/39] linux-atm: Add knob to root prefix
Date: Sat, 30 Apr 2022 12:17:49 -0700
Message-Id: 
 <a39af1ef90834eeb9dc894c9b9b4d3241017447d.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96876

From: Khem Raj <raj.khem@gmail.com>

Fixes build with usrmerge

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d69c0da9d2ad86a5d57e7359eaba8fe26c1ed820)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux-atm/0001-make-Add-PREFIX-knob.patch | 31 +++++++++++++++++++
 .../linux-atm/linux-atm_2.5.2.bb              |  7 ++---
 2 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch
new file mode 100644
index 0000000000..9c83ef0af4
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch
@@ -0,0 +1,31 @@
+From 94cb952207e44a5c29578c9c56912190a5422876 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Apr 2022 09:41:51 -0700
+Subject: [PATCH] make: Add PREFIX knob
+
+This will be used to pass appropriate root prefix which is different
+when using usrmerge
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/extra/Makefile.am | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+--- a/src/extra/Makefile.am
++++ b/src/extra/Makefile.am
+@@ -8,10 +8,10 @@ BUILT_SOURCES = pca200e.bin pca200e_ecd.
+ CLEANFILES = pca200e.bin pca200e_ecd.bin2 sba200e_ecd.bin2
+ 
+ install-exec-hook:
+-	$(MKDIR_P) $(DESTDIR)/lib/firmware
+-	$(INSTALL_DATA) $(builddir)/pca200e.bin $(DESTDIR)/lib/firmware
+-	$(INSTALL_DATA) $(builddir)/pca200e_ecd.bin2 $(DESTDIR)/lib/firmware
+-	$(INSTALL_DATA) $(builddir)/sba200e_ecd.bin2 $(DESTDIR)/lib/firmware
++	$(MKDIR_P) $(DESTDIR)$(ROOTPREFIX)/lib/firmware
++	$(INSTALL_DATA) $(builddir)/pca200e.bin $(DESTDIR)$(ROOTPREFIX)/lib/firmware
++	$(INSTALL_DATA) $(builddir)/pca200e_ecd.bin2 $(DESTDIR)$(ROOTPREFIX)/lib/firmware
++	$(INSTALL_DATA) $(builddir)/sba200e_ecd.bin2 $(DESTDIR)$(ROOTPREFIX)/lib/firmware
+ 
+ %.bin %.bin2: %.data
+ 	objcopy -Iihex $< -Obinary $@.gz
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index effd7502ff..bb79b78568 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -13,11 +13,11 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${P
            file://0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch \
            file://0001-IFNAMSIZ-is-defined-in-net-if.h.patch \
            file://0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch \
+           file://0001-make-Add-PREFIX-knob.patch \
 "
 
 SRC_URI:append:libc-musl = " file://musl-no-on_exit.patch"
 
-SRC_URI[md5sum] = "d49499368c3cf15f73a05d9bce8824a8"
 SRC_URI[sha256sum] = "9645481a2b16476b59220aa2d6bc5bc41043f291326c9b37581018fbd16dd53a"
 
 LIC_FILES_CHKSUM = "\
@@ -27,7 +27,6 @@ file://COPYING.LGPL;md5=6e29c688d912da12b66b73e32b03d812"
 
 inherit autotools pkgconfig
 
-# The firmware is explicitly put under /lib when installed.
-#
+EXTRA_OEMAKE += "ROOTPREFIX=${root_prefix}"
 
-FILES:${PN} += "/lib/firmware"
+FILES:${PN} += "${nonarch_base_libdir}/firmware"
-- 
2.25.1


