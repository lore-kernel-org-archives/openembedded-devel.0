Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.586.1608747728656051430
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Dec 2020 10:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YkI9PZL6;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id i5so121392pgo.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Dec 2020 10:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5B8sCqeM2cNLuvhCRjPb87olRspGyQs3Ip6INMzZkNI=;
        b=YkI9PZL6tDCc/CCJfvHIS12aK/GYRrzXgxBjmmRiT2ZYh4NMbHqMnjYA1AIsOqc24b
         dY9Z8F/mfb1wxPPkt5LOX+kqlDA9N3npsDrmJOiV+nHGyinhJvFXowSrcMWI5x/DfG3i
         ct7cXkuKbaxlm5C8j+N3ZITcrRwtNMZKKC74FiiEeVgfbq4u6bQ7d6thOOrTaG+2iERB
         AwiBsDd8Hak/GFLezxJfaB9KdnJZWupAaPETXYA+ZfZ8gEP6lWl36OSgDu5Cl2GbYI0S
         1lZzTm2HBocDpLAQWRtHSipZTnzsNFszphwN8xHvYnCNof56br1lqOVyc1wCLohSVncd
         7mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5B8sCqeM2cNLuvhCRjPb87olRspGyQs3Ip6INMzZkNI=;
        b=fOsjmGIKICFJAhdQau5HYYHV9sSpWwG5fPgSrL5wp2YtaU33DvjQMLyaB9JbbJDL0p
         VJmwW+IHndcsLFrnZKlciDOrqinsPjjBFOwXr6cfFOKJKVHt8yp4235AVH174JP0IqEn
         AQOJW9AoVRFOUMPQYOINz8Jk8uoYyTpb00r2leliJLs2P+KD9PArUH3HqFlxO2v+10db
         5ZfECWuunX3AzijLe6BJW9TfFxJefMCD1xcAsrpZiLsSab2IuLr3ggmZDocYPmIU1t3g
         Ez1gPpWl4OEdHhh2oRQIPHprZGfmW7BCtCJBIUKNkNaVRcg5vwB2/JvxW0VIEmhfzLlG
         Vh0A==
X-Gm-Message-State: AOAM532YRoLv0ZTZD6ueWucgucUpoxhlR9oXGUZ+QE6ZkZDJ3NbQ3EiX
	rOxKfFMEPC8fl3suvyIWhyKgNFhyMWkxcA==
X-Google-Smtp-Source: ABdhPJzhbe50qsYagZLoPXG157FnX+eLZ1XE4Dw9sAA74KHQ8cy0cq8YjjIUqJOVR/RAMXGBVx7Nxg==
X-Received: by 2002:a63:f158:: with SMTP id o24mr2958226pgk.245.1608747727773;
        Wed, 23 Dec 2020 10:22:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a8e7])
        by smtp.gmail.com with ESMTPSA id a131sm17936009pfd.171.2020.12.23.10.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 10:22:07 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] beep: Update to 1.4.9 in new repository
Date: Wed, 23 Dec 2020 10:22:04 -0800
Message-Id: <20201223182204.1873305-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Jonas <toertel@gmail.com>

The previous version 1.2.2 of beep was provided by
http://johnath.com/beep and was released in 2002. The latest version 1.3
was released 2010-07-13. On https://github.com/johnath/beep the
development stopped 2013-02-07.

In 2018 a developer worked on fixing CVE-2018-1000532 and realized that
fixing this would be more than just a simple patch. Because the original
repository was unmaintained for several years he created
https://github.com/spkr-beep/beep as the new home for beep.

Debian switched to the new beep with Buster.
    https://packages.debian.org/buster/beep

Alpine 3.11, Arch Linux, Fedora, and Ubuntu 20.04 also switched to the
same new beep.

Fix build with clang

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build with clang

 meta-oe/recipes-extended/beep/beep_1.2.2.bb   | 25 -----------------
 meta-oe/recipes-extended/beep/beep_1.4.9.bb   | 28 +++++++++++++++++++
 ...rror-as-it-fails-with-newer-clang-11.patch | 22 +++++++++++++++
 3 files changed, 50 insertions(+), 25 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/beep/beep_1.2.2.bb
 create mode 100644 meta-oe/recipes-extended/beep/beep_1.4.9.bb
 create mode 100644 meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch

diff --git a/meta-oe/recipes-extended/beep/beep_1.2.2.bb b/meta-oe/recipes-extended/beep/beep_1.2.2.bb
deleted file mode 100644
index cafc869645..0000000000
--- a/meta-oe/recipes-extended/beep/beep_1.2.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "beep is a command line tool for linux that beeps the PC speaker"
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-SRC_URI = "\
-    http://johnath.com/beep/beep-${PV}.tar.gz \
-    file://linux-input.patch \
-"
-
-SRC_URI[sha256sum] = "5c0445dac43950b7c7c3f235c6fb21f620ab3fd2f3aafaf09896e5730fcf49a1"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-EXTRA_OEMAKE += 'CC="${CC}"'
-EXTRA_OEMAKE += 'FLAGS="${CFLAGS} ${LDFLAGS}"'
-
-do_configure[noexec] = "1"
-
-do_compile() {
-   oe_runmake
-}
-
-do_install() {
-	install -Dm 0755 ${B}/${PN} ${D}${bindir}/${PN}
-}
diff --git a/meta-oe/recipes-extended/beep/beep_1.4.9.bb b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
new file mode 100644
index 0000000000..3a3631cd81
--- /dev/null
+++ b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
@@ -0,0 +1,28 @@
+SUMMARY = "beep allows you to have the PC speaker issue beeps and beep patterns"
+DESCRIPTION = "beep allows you to have the PC speaker issue beeps and beep \
+patterns with given frequencies, durations, and spacing."
+HOMEPAGE = "https://github.com/spkr-beep/beep"
+BUGTRACKER = "https://github.com/spkr-beep/beep/issues"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/spkr-beep/beep.git;protocol=https \
+           file://0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch \
+"
+SRCREV = "8b85ddd09f73b9fd7caa5679298781a57af194ac"
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = " \
+    COMPILER_gcc='${CC}' \
+    LINKER_gcc='${CC}' \
+"
+
+EXTRA_OEMAKE_append_toolchain-clang = " \
+    COMPILER_clang='${CC}' \
+    LINKER_clang='${CC}' \
+"
+
+do_install() {
+    oe_runmake install DESTDIR='${D}'
+}
diff --git a/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
new file mode 100644
index 0000000000..d528c994b9
--- /dev/null
+++ b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
@@ -0,0 +1,22 @@
+From 6b33adfa438e35b6a37cfb0364274370ef4f9fc1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 23 Dec 2020 18:00:59 +0000
+Subject: [PATCH] Do not use -Werror as it fails with newer clang 11+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ GNUmakefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -126,8 +126,6 @@ CFLAGS_clang += -Wall -Wextra
+ CFLAGS_clang += -Weverything
+ CFLAGS_clang += -Wno-padded
+ CFLAGS_clang += -std=gnu99 -pedantic
+-CFLAGS_clang += -Werror
+-CFLAGS_clang += -fsanitize=undefined
+ CFLAGS_clang += -O -g
+ LDFLAGS_clang =
+ LIBS_clang =
-- 
2.29.2

