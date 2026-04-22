Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFB5F9B5F3
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 22:09:35 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15.1776895773469546996
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 15:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M+PYAAK5;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: philip.balister@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50e5dbd8e0eso35292231cf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 15:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776895772; x=1777500572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nnUUQ2Cw2Bgt/R0T3rfstfvUAlzE9nYZz2eLckcyrUo=;
        b=M+PYAAK5MfkF9saOcEwDzZ0iDsi+6IlfYprhQOZ+ctBEcWQoxsru5zvYXQJ7h8Cf+F
         sNl7HpBtpu0C2UUbbA2tdHl3aEqnW829BEBtijAnkaXMVibDZA+K0Whfj2h5VjL8+VSn
         UWa/GUsk/G4gR4z+u+68yKiJKNI4Gioe9ZCDESoO/DQGcQnfaOrmuXlVW7R/T06/Qw7s
         9hcl95l9H/g9zQAR/D/j+J4mu1HCgVL7j7hWg+O1tw/Qg1+HtHwClvifocQzmWawlo3f
         q5etnFHafJ9e4k0Lj/2vyq/QPL8DZFn2UESA1eSoXIaDVV7H+tKMYSuTrXEKvQOIo/x7
         GUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776895772; x=1777500572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnUUQ2Cw2Bgt/R0T3rfstfvUAlzE9nYZz2eLckcyrUo=;
        b=ImmOiINQJJvhgAVMqqQqZ/a+3nLNFNo394aoeUjhAk7Vt3OUX2CTEmVbpjTJBxm8af
         pqC/+sN+Y4D3Xh/f62EubZoXdIjPG1FgWwY51fY+6dNLsBVRjKf1VMt/FFRJYEqmMSI5
         MdUWkw6RW3629pW5YH01yUnYplI3xKJ4rQ4kI1DucYsXsybyX7CLgihkotxWoR4nnv8O
         iWgXRPxZ95AABk4iH/K2wl9gQZ5eTfxm7LkcRSh9uY8u60V7lxOug2FxYG4NM65NOBKT
         syk8oa8QcFuq+5ABI41LCc4j/D/F8cQB2ELRGtiHpbcqQrsJFyYQfZ7zTAvt8pYt4/YH
         dHHw==
X-Gm-Message-State: AOJu0Yw1EizNadSccg9zSQpDIoB5sgVPcHFab9r2hyk50gY4Di0vL/4h
	RLTiwD2x7s/Tt3nBZo8k/US74ETB1P0j1GFMWrAeXMtKe7Kh2ABdNmjsrhR5kQ==
X-Gm-Gg: AeBDieuNKaTDxrgo+1rli7vxmT59q32k7gj7jvysUi+I+5gVf0VkZaCFtjmUGC4YbTM
	RFYdeY1HwbuJYn2h4PP/anobfbBPtCAti8uZqm6SzDIWBqpenGDHFPcYTdcPuMba5thYp8/YD+2
	iUGGjxRTaz1or5yK6ztxEg6kCLDba85QE+9YmTvprKZy78oiR2BMuxsdAIc2nOTyuQNOfsPHfVL
	Hglv87wx9M1Sp4aPYv/PmYMXEEG0R1rC/pE3H99ismQhHPAdyQ0dCxyJQj8tyfxHzG8U5GOInBU
	IywCwaacqhYofbleCWJjqnFrKe+a/zc2UXZ2XTxWPBQMDOdDYVq/TV6C8zEuqq7Tl3YDgp40ZJP
	9XE8/qwvNRvy6IFexIiTZC8RIs48q8tvtoO0UovFiqlzIizQP9BODWYMecOxDGJQxtWAPa3jL5p
	6eMjDdt6VwHhxa2y5T+DkE8wlK8w22BaCuN/53tBV4dbYLAFfIt+QvgyERl0+OEW5fRLs=
X-Received: by 2002:a05:622a:5516:b0:50f:b904:454 with SMTP id d75a77b69052e-50fb90405f0mr118511361cf.11.1776895771486;
        Wed, 22 Apr 2026 15:09:31 -0700 (PDT)
Received: from bushey.hsd1.va.comcast.net ([2601:5c0:c200:483f:8478:e47c:fbe6:4bdc])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e5a34be56sm95091861cf.25.2026.04.22.15.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 15:09:30 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>
Subject: [meta-oe][PATCH] fftw_3.3.11.bb: Update version.
Date: Wed, 22 Apr 2026 18:09:22 -0400
Message-ID: <20260422220922.1697938-1-philip@balister.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 22:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126559

Apr 21st, 2026
New API fftw_copy_plan()
Support for SVE SIMD instructions.
Support for LoongArch LSX and LASX SIMD instructions.
Support for Apple ARM, RISCV, and LoongArch cycle counters.

The patch is needed to remove build system paths creeping in
via the compiler define. Enabling the cycle counters needs a
kernel module to permit access from user space. We need to add
SVE (and other architectures) support to the recipe.

Signed-off-by: Philip Balister <philip@balister.org>
---
 ...ove-the-CC-and-CFLAGS-from-the-build.patch | 31 +++++++++++++++++++
 .../fftw/{fftw_3.3.10.bb => fftw_3.3.11.bb}   |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-and-CFLAGS-from-the-build.patch
 rename meta-oe/recipes-support/fftw/{fftw_3.3.10.bb => fftw_3.3.11.bb} (95%)

diff --git a/meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-and-CFLAGS-from-the-build.patch b/meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-and-CFLAGS-from-the-build.patch
new file mode 100644
index 0000000000..5b52377940
--- /dev/null
+++ b/meta-oe/recipes-support/fftw/fftw/0001-Remove-the-CC-and-CFLAGS-from-the-build.patch
@@ -0,0 +1,31 @@
+From f65d89c082fa4b886f9f5aaa08f4defd5fd0e207 Mon Sep 17 00:00:00 2001
+From: Philip Balister <philip@balister.org>
+Date: Wed, 22 Apr 2026 16:52:47 -0400
+Subject: [PATCH] Remove the CC and CFLAGS from the build.
+
+With 3.3.11, this started injecting build system paths into binaries.
+
+Upstream-Status: Inappropriate [I didn't try hard enough to figure out what changed]
+
+Signed-off-by: Philip Balister <philip@balister.org>
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 616cdcc4..bd7edbf2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -793,7 +793,7 @@ fi
+ 
+ dnl -----------------------------------------------------------------------
+ 
+-AC_DEFINE_UNQUOTED(FFTW_CC, "$CC $CFLAGS", [C compiler name and flags])
++AC_DEFINE_UNQUOTED(FFTW_CC, "", [C compiler name and flags])
+ 
+ AC_CONFIG_FILES([
+    Makefile
+-- 
+2.53.0
+
diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
similarity index 95%
rename from meta-oe/recipes-support/fftw/fftw_3.3.10.bb
rename to meta-oe/recipes-support/fftw/fftw_3.3.11.bb
index 52122b9c0c..dd6dce206b 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
@@ -6,10 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SRC_URI = " \
     http://www.fftw.org/fftw-${PV}.tar.gz \
     file://0001-NEON-autodetection-segfaults-assume-neon-present.patch \
+    file://0001-Remove-the-CC-and-CFLAGS-from-the-build.patch \
     file://install-bench.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467"
+SRC_URI[sha256sum] = "5630c24cdeb33b131612f7eb4b1a9934234754f9f388ff8617458d0be6f239a1"
 
 UPSTREAM_CHECK_URI = "http://www.fftw.org/download.html"
 
-- 
2.53.0


