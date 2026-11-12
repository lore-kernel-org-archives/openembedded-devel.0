Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8001.1794465779783035446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=g7Gs/m3p;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb628232d2so2329531a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465779; x=1795070579; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RXKMKwlwo0PraL/xpm5puUd7WZH5ttwfhvMS+Q7mnug=;
        b=g7Gs/m3pxuUHqFkiVX42IHihutNP74y7WvnyalY1IULjfCivBTRaCNaj+qoICkp5yD
         x0qddrEAyaPoaSSx9Bo4n67paPU9hP/3PsaLKeFERJpV9kFWH+KCih5U1Sqto1/3hyQH
         P5jWPIHJSy3lgYRC0cW3d0waMxkH+xdKSD6z1nVh9qCNV5o/GVIls/Km/tDdq0uNItYC
         q0xDqPMqcMt9MU+Rnh9Vyo7cOVLyWEY65rPtbwRvthC1gafVTxld5LY6fqkmV0R52bZz
         cHr1yt6wV6fcgDWpRuiF/8ZMxIpyv9yFsfKOqHN8oKNVevxBnDvBMaN6OFEwYAEcpzCa
         P+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465779; x=1795070579;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXKMKwlwo0PraL/xpm5puUd7WZH5ttwfhvMS+Q7mnug=;
        b=T3XXBoVH85rO1ZKiLLWPVn1rknLxY9S1oJ45HnazrDB3yQq1RE+ng3B5e8zpJxsVtD
         CTGQ+0ClC3JNYS1vsd9I2pi2zAjDD6T3fTluc0iQntG2iOXE6FdqN8mO1yyMhyJiQe26
         v5aNNlFCX7IfzhDBXnOjJk4PiADJRLUdXG2GBNX7XkUxQfReV/sfE5RjS89NSIdxkNO3
         am4W+bM3kdPm2yDR/z1y1REbJZnyeOfDgKaLR3xmQX0fAmGs4eT1YipY4bcBrQm/bHeZ
         QvpRWaIhbaJcNAKKg05pPP7Lw3ZahO4V5ofdiCw1vgzFjRW2wxLXAB4//ZaTVMIFPZvG
         gfZQ==
X-Gm-Message-State: APuU4Z+N5rZHWb9Iuurq+m3bpyHQytqWipRaQYivZjCrk2QiT2GhoGp/
	HK/CiocMVMpxdj08B7PwdjEfEtpR8Pdh0tQovLCnqjQIPHLyixuMhZWZQeaF/hquzoE=
X-Gm-Gg: AYBFou1purA9CcRk9dVU1JdULs5KeX9vi4SjkbWmIfg0EUcjFDhGildcR8FVRhTTUg0
	TV8lrom+BkKXCYI44iArknqfU1iiL5TfIJ0+8u2CLLme+R3/6XWWFfTUlEoLxI+T1AnLGSQsOpK
	naVr7jgqDKIBYcDm78F96v11uiZt7kzIn0KgMzNi5mOZajvoZOOe1Kp9wlikQH+KDwEIExgp/r2
	nrJW4FE8101fu7vvXSI1mw1kwbVaAU09x7a/Z/DDWSWy3PVG7HqY+pQNHK5xxPpd5NIK+ienOfL
	4zqSccE5sDoXiBP8Jg1hX6y+nWvwMzp2xS9SbNE4NdFngcLx9ddG8mjtUKViwxQxxEe8VJuXvpu
	DQWlwb+x7qrb6eQL4wVu+EZYQgpDxNNbn7GR0FpDN0nP26nU7IsEAzudReOLWcxeuDF2fgqteFS
	4xs5fRW4ykcLLzEbcy2rOPERkhRl8I2bEThn7OLUuP1Qjc3ac112S/6bwQU9BjwQn/RcHAWxzRk
	xpV/gxiPA3tC4lZviHpBuT1hideuKqEE5ySJkiCG/NlAFX0YAquIJO+umhf/CrXpETPSo2XEXGp
	ccfGCmiKNd+T6P6aS5cvEomcgpW6EbpF6l+JskSHVFtJE06FSdqFZY8g5aSBldRD9beXrfpZSmo
	gQDik9PTVomMgnDL7QnYsgkv/bGJDFCMZKAgQkBfAq+X18m7ZAdG52TEAfxZ1FD0N7jiEK9RRAv
	UVN3KHBS0Q0YA+Dt4AbnJBaUZ2CqV80hsUb8ZleCkgCgOACGE4ICgCXiZ3WGQnRzUYtLW0EOte8
	r2VmSfKqRETR7SvbhgDR9VS7I7fVPRNUkweWLusB8tlpFZSw2evckfJyUSlScafA5z4eVq1M5Fe
	gES6
X-Received: by 2002:a17:90b:2884:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3b182f83739mr4366390a91.64.1794465779142;
        Wed, 11 Nov 2026 22:42:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 24/24] nbdkit: Remove stale 1.33.11 recipe
Date: Wed, 11 Nov 2026 22:42:24 -0800
Message-ID: <20261112064225.2410019-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132193
Content-Type: text/plain; charset="utf-8"

nbdkit_1.33.11.bb and its patch were left behind next to the current
recipe and are never selected since the newer version is preferred.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...void-absolute-buildpaths-in-binaries.patch | 38 -------------------
 .../recipes-support/nbdkit/nbdkit_1.33.11.bb  | 32 ----------------
 2 files changed, 70 deletions(-)
 delete mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch
 delete mode 100644 meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch b/meta-networking/recipes-support/nbdkit/nbdkit/0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch
deleted file mode 100644
index 75377dfb80..0000000000
--- a/meta-networking/recipes-support/nbdkit/nbdkit/0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 1ccbd8fdbd2e367a702e48c8703b2f010d067b23 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 22 May 2023 18:16:24 -0700
-Subject: [PATCH] plugins: Avoid absolute buildpaths in binaries
-
-plugins seems to add CC to the plugins shared objects via compiler
-cmdline which ends up in real code. Therefore scrub buildpaths from CC
-and CFLAGS before passing them to plugin's build.
-
-Upstream-Status: Submitted [https://gitlab.com/nbdkit/nbdkit/-/merge_requests/30]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- plugins/cc/Makefile.am | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/plugins/cc/Makefile.am b/plugins/cc/Makefile.am
-index df8b5d15..80586a17 100644
---- a/plugins/cc/Makefile.am
-+++ b/plugins/cc/Makefile.am
-@@ -44,9 +44,12 @@ nbdkit_cc_plugin_la_SOURCES = \
- 	$(top_srcdir)/include/nbdkit-plugin.h \
- 	$(NULL)
- 
-+workdir := $(shell dirname $(abs_top_builddir))
-+cc_no_sysroot := $(shell echo \"$(CC)\"|sed -e 's#$(workdir)#<WORKDIR>#g')
-+cflags_no_sysroot := $(shell echo \"$(CFLAGS)\"|sed -e 's#$(workdir)#<WORKDIR>#g')
- nbdkit_cc_plugin_la_CPPFLAGS = \
--	-DCC="\"$(CC)\"" \
--	-DCFLAGS="\"$(CFLAGS)\"" \
-+	-DCC=\"$(cc_no_sysroot)\" \
-+	-DCFLAGS=\"$(cflags_no_sysroot)\" \
- 	-I$(top_srcdir)/include \
- 	-I$(top_builddir)/include \
- 	-I$(top_srcdir)/common/include \
--- 
-2.40.1
-
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
deleted file mode 100644
index 1c9db1e956..0000000000
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "nbdkit is a toolkit for creating NBD servers."
-DESCRIPTION = "NBD — Network Block Device — is a protocol \
-for accessing Block Devices (hard disks and disk-like things) \
-over a Network. \
-\
-nbdkit is a toolkit for creating NBD servers."
-
-HOMEPAGE = "https://github.com/libguestfs/nbdkit"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
-
-SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
-           file://0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch"
-SRCREV = "6c02c6a469d62a047f230b0ccf03f72328312d2b"
-
-
-DEPENDS = "curl xz e2fsprogs zlib"
-
-# autotools-brokensep is needed as nbdkit does not support build in external directory
-inherit pkgconfig python3native perlnative bash-completion autotools-brokensep
-
-# Those are required to build standalone
-EXTRA_OECONF = " --without-libvirt --without-libguestfs --disable-perl"
-
-# Disable some extended support (not desired for small embedded systems)
-#EXTRA_OECONF += " --disable-python"
-#EXTRA_OECONF += " --disable-ocaml"
-#EXTRA_OECONF += " --disable-rust"
-#EXTRA_OECONF += " --disable-ruby"
-#EXTRA_OECONF += " --disable-tcl"
-#EXTRA_OECONF += " --disable-lua"
-#EXTRA_OECONF += " --disable-vddk"
