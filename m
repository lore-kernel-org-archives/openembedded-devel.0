Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.4928.1619259897770853162
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 03:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AXNlQiEM;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id m9so38083271wrx.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 03:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Dywojth3an6HubA0342jZDEJATi1VfVxbFwUxpwzk4=;
        b=AXNlQiEMvyzn01i8yYSqqdQPVEaJME7PI2pijyEKRi5b7pboabfpCh1P4hqh84Zaf3
         88lpIn0Mck6ow8oFT3B1G0GuaQ/R6/1XfCYT+MEBkEgBRS+hck14q9BtfiOQC2KD82/H
         5kUPkYVu0eXDVB4v0DkkkoSo+eg9BjJFG251t52lRSCG2fh2Lbn3fit/xQG0TF41tXsn
         RD3zon5+VkomAwOxbbgqYMc3mr4PWZsL0vIMM01rzlMb/o+V0cBKDQGXDMBiG40FUeep
         JN3EFGsK2HB9IyPsqDvSD+nZQO/ArCW6T7d82yek1CnyL3HwKuzdCCDwcEqrA7Z3RJRz
         oTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Dywojth3an6HubA0342jZDEJATi1VfVxbFwUxpwzk4=;
        b=Wu7Bf2qUDWtbctB3cjw1ilRBytcttgWxxKvA+iGOke/A5OZAg2Lko7UD9IrIJNPXHI
         of9Jy1Igj3s4L7eScXLpxVGoMLXWxPL8kKBR+qCLmLQNjJlWA/J8jZv3VAcAS58fldng
         GKZXLBDSd+NokWP+sPgZbjbFAwU7hIOhBy9tOF+hy0m9EWsTHzcCxjrh2YUXgzZn6U9J
         D0Vy53UGg/wG/rPrso37N4O5hnEXi5nhrJg96orfa8p6yOkRMx4nvYNUFwWnxkJSPXaz
         1XStAPykLf6AGhTKuEV0IQu8Bgx2ZURDEgupDLNAkHfLi4Sr34okh377y8rfZklrrEmO
         30sg==
X-Gm-Message-State: AOAM530z4yhH1STDxHsLCU2E6fLd/TO1IzitPGZnYrlQA+GnoAVP1/6E
	0z6GbYAG2npGtEPTqZL24dlCZURZVFbIxg==
X-Google-Smtp-Source: ABdhPJy4MWqI8pTM1WT6GDiH0Wu1/9uj/lJQM+f5TaXm/eADfujXi/cCUCAvHAKmKPoNX0Fb91oCYw==
X-Received: by 2002:adf:f787:: with SMTP id q7mr10251650wrp.351.1619259896002;
        Sat, 24 Apr 2021 03:24:56 -0700 (PDT)
Return-Path: <peron.clem@gmail.com>
Received: from localhost.localdomain (2a01cb0003ba9b00a6f3a45bd9dcd3ff.ipv6.abo.wanadoo.fr. [2a01:cb00:3ba:9b00:a6f3:a45b:d9dc:d3ff])
        by smtp.gmail.com with ESMTPSA id g3sm1937629wrx.78.2021.04.24.03.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 03:24:55 -0700 (PDT)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] [RFC] gator: Add new package
Date: Sat, 24 Apr 2021 12:24:51 +0200
Message-Id: <20210424102451.885867-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To communicate with the target device, Streamline requires the
gator daemon, gatord, to be running on the device.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../gator/0001-gator-don-t-strip-debug.patch  | 24 +++++++++++++++++++
 meta-oe/recipes-devtools/gator/gator_7.5.0.bb | 22 +++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch
 create mode 100644 meta-oe/recipes-devtools/gator/gator_7.5.0.bb

diff --git a/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch
new file mode 100644
index 000000000000..8e59fffa1fc2
--- /dev/null
+++ b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch
@@ -0,0 +1,24 @@
+From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <cpe@outsight.tech>
+Date: Fri, 16 Apr 2021 15:27:16 +0200
+Subject: [PATCH] gator: don't strip debug
+
+---
+ daemon/Makefile | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/daemon/Makefile b/daemon/Makefile
+index ba5f29cfeb10..6807948310f9 100644
+--- a/daemon/Makefile
++++ b/daemon/Makefile
+@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | cut -f1 -d.` \>= 5),1)
+ 	CXXFLAGS += -fno-sized-deallocation
+ endif
+ 
+-# -s strips the binary of debug info
+-LDFLAGS     += -s
+ LDLIBS      += -lrt -lm -pthread
+ TARGET      := $(OBJ_DIR)gatord
+ ESCAPE_EXE  := $(OBJ_DIR)escape/escape
+-- 
+2.25.1
diff --git a/meta-oe/recipes-devtools/gator/gator_7.5.0.bb b/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
new file mode 100644
index 000000000000..8e15b1ca5fc5
--- /dev/null
+++ b/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "DS-5 Streamine Gator daemon"
+DESCRIPTION = "Target-side daemon gathering data for ARM Streamline Performance Analyzer."
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LICENSE_libsensors = "LGPL-2.1-or-later"
+
+SRCREV = "6088d3533146d7b7c9700b8e396292053240b25f"
+SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=master \
+	   file://0001-gator-don-t-strip-debug.patch;patchdir=.. \
+	  "
+
+S = "${WORKDIR}/git/daemon"
+
+EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOURCE -DETCDIR=\"${sysconfdir}\"' \
+    'LDFLAGS=${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=${TARGET_PREFIX}' \
+    'CXXFLAGS=${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC='${CC}' CXX='${CXX}'"
+
+do_install() {
+	install -d ${D}${sbindir}
+	install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
+}
-- 
2.25.1

