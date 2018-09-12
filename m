Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6433079567
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 00:19:00 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id d1-v6so79517pgo.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 17:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fXTAjaCzMCShTzI9GIfLV5PEh7ZuewCsbnOxfT/wJE0=;
	b=Wrc6srwanD9HacGB8801TwbmY41QZNeDU2rVXvYoDLG5/jHyWUz9zyXg7FFVCucf8/
	0u73WvG35HfFLMdnsGJf6oav8eQC0mcgMEwf5nQV7O316xudItn3GJXZ4fF43eB7EVtx
	rJQKEuAa8KDh0ocPOj6SSxPDkggm6rDfbY3hvMgtsA63EYVRan4fmKltYlXdCUeVygFM
	rnYDrcmcH/Lk+joKH/5L6CnoN2yX0FU4Zu9mIjdO2k7kFmojopA7CQ0cSwNzd28j7gp/
	d7rhDaq8WOsI5iOb5QIsD5Ab+hCK0OAG4zUZ3E8PXlFDxpYKgGiikuy89aenxlPhHx8O
	er9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fXTAjaCzMCShTzI9GIfLV5PEh7ZuewCsbnOxfT/wJE0=;
	b=dgPaNFRW3pRyTXfpwn5jiov28QVjTyPzS2ogCvUUmyCpBQTGoBFFdnXrd/YZ3FDsSW
	HPJzNZD2kSlhhmMUrWGtV3btn8p7gwoIT/bMr4aPd1YseeHcVCgexWTio4c4bBf7M2dn
	emSY1mT96mr0ZeQyWsJ8nHnqSGwpLtgrEllbTK21x/FIgs1OMDdhOZGh/MN25b7d3xTs
	KDVzCm1sUkcaBuBqb5cN5THWCPW45BEZ5yXyCK3dR9qGlXyBO9vi6hJT0cKACTEae1TT
	6oOlc+AAOsSUNidRc58pjP0a2wmd1f8Uu6FepN2vQObIYTmG/mNLBfh0bAMEiWd8POVR
	f1YA==
X-Gm-Message-State: APzg51CADcB2fAllO40ZlrTULUhjtiO5ICKFUvzN7NHij2u71CqBm7tX
	Np/s96Y3hzTMjP57Tk6Yf040KP+W
X-Google-Smtp-Source: ANB0VdbVC71+UZjM1YvK3MbF6J7vnar8t31z35pyYUdtQtkRk0krekCB+WHFaTabW2Ver0/iqxOEMA==
X-Received: by 2002:a62:3001:: with SMTP id
	w1-v6mr32150014pfw.19.1536711541007; 
	Tue, 11 Sep 2018 17:19:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	g25-v6sm39781692pfd.23.2018.09.11.17.19.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 17:19:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2018 17:18:51 -0700
Message-Id: <20180912001851.7181-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912001851.7181-1-raj.khem@gmail.com>
References: <20180912001851.7181-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 2/2] klibc: Fix build with security flags
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2018 00:19:00 -0000

Drop -Os which is also causing the relro
Fixes
| x86_64-bec-linux-musl-ld.bfd: discarded output section: `.got.plt'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 ...libc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch | 28 +++++++++++++++++++
 .../recipes-devtools/klibc/klibc.inc          |  9 +++---
 2 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
new file mode 100644
index 0000000000..94818e3669
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
@@ -0,0 +1,28 @@
+From cdc6edc2cfcd0ce88d6e66654d605dad303b1a75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Sep 2018 17:03:36 -0700
+Subject: [PATCH] klibc/Kbuild: Accept EXTRA_KLIBCAFLAGS
+
+For passing additional assembler flags
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usr/klibc/Kbuild | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/usr/klibc/Kbuild b/usr/klibc/Kbuild
+index 98caf2e9..b34521e0 100644
+--- a/usr/klibc/Kbuild
++++ b/usr/klibc/Kbuild
+@@ -168,7 +168,8 @@ $(SOHASH): $(SOLIB) $(SOLIB).hash
+ targets += interp.o
+ 
+ quiet_cmd_interp = BUILD   $@
+-      cmd_interp = $(KLIBCCC) $(klibccflags) -D__ASSEMBLY__     \
++      cmd_interp = $(KLIBCCC) $(klibccflags) $(EXTRA_KLIBCAFLAGS) \
++                             -D__ASSEMBLY__     \
+                              -DLIBDIR=\"$(SHLIBDIR)\"         \
+ 			     -DSOHASH=\"$(SOLIBHASH)\" \
+ 			     -c -o $@ $<
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index f0b20bc7fd..3d25e96cd4 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -21,9 +21,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
            file://0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch \
            file://0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch \
            file://0001-arm-Do-not-set-a-fallback-march-and-mtune.patch \
-           file://0001-klibc_2.0.4-add-kexec_file_load-syscall.patch  \
+           file://0001-klibc_2.0.4-add-kexec_file_load-syscall.patch \
            file://0001-klibc-add-getrandom-syscall.patch \
-"
+           file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
+           "
 
 ARMPATCHES ?= ""
 
@@ -31,7 +32,6 @@ ARMPATCHES_arm = "file://klibc-config-eabi.patch \
                   file://armv4-fix-v4bx.patch \
                  "
 
-
 S = "${WORKDIR}/git"
 
 PARALLEL_MAKE = ""
@@ -44,9 +44,10 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'INSTALLDIR=${libdir}/klibc' \
                 'SHLIBDIR=${libdir}' \
                 '${KLIBCTHUMB}' \
-                'KLIBCOPTFLAGS=${TUNE_CCARGS} -Os' \
+                'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
                  V=1 \
                 "
+EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack" EXTRA_KLIBCLDFLAGS="-z noexecstack"'
 
 export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
 KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
-- 
2.18.0


