Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EECCC7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:27:07 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.13894.1684816022645359175
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SxwFCqV5;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64d1e96c082so3824086b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816022; x=1687408022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZOpiU6T78LCc/YT7YZiG2GunQS4liHQmZoG8X+fDPY=;
        b=SxwFCqV5FXcejYjtkYAzba7HDjG0kcvczyrVaQ4D4ojf/GoxQbwYlIDZ1e99mPVWpF
         rz4t2mh25cRD5fZEgWo0SHPylm5Umdfzwl5IS3d8uTTucftQ57j/5Ii2HPACh7nle4rG
         IJ+JwH1+mPgWzC0c51zvUUFF+ny+8opWOHzhOZMt+5vtFt+bP3nOAVgl4agKAcfohHq9
         4rrAywm3636Q71iK262FLF1IESKCApriXBcQYGZz9Gl0y0CAaXi2MZhkatAROHaqS5E8
         uRsGESVR4rviUNTwX2ZVajssF9/JSnJJXDzKEn731fIa3/JEkVsJjM14Gnpej5DxjOnS
         t5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816022; x=1687408022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZOpiU6T78LCc/YT7YZiG2GunQS4liHQmZoG8X+fDPY=;
        b=kXS6RdJ5YFDgAQgbDvaS9QTlYvN2qFzAiXUmnVjPyLUU44MvxeUEFjml2CMcY/Uw1H
         ei7YDVoMh8g5aU/0pXGrtv1/TK6DJkqgouGYRnFi2HG539BDQQSKQIYWRx+dsLiBN3MI
         6fU4gHtN+KqOBzZpid4wda6dbaO6GzodFpFCsyd/g66IuSk03T8ORDhPSUp0uhymSo3G
         I8gtAbcFnj5RD3itvjiG3dtj/bIPpPtbGN2yJEP5NTElUmaYGDpJcVl8vyJyCLAgWPUC
         Ln24lJ1R/y7NmiAhHIpR/2Iv0ltQzoNCrCVcqIIvyS0C0tW14khrrpRw8/m5jDXDERnG
         UZNQ==
X-Gm-Message-State: AC+VfDxwu1KYYPw2jSeEcnmfkfZYlqlflmvpmv6ETb+oi1riOywR5+T5
	t14xvTD3QN5/VgXV3iCT1PWS9TCL7WI=
X-Google-Smtp-Source: ACHHUZ6YOtaQSTKD+ArKVlCqXIkdYZLYe4nV9XIiT3mhsZcXq+W2Tb0NEVnfDQGtEWYvD+euJIo94Q==
X-Received: by 2002:a05:6a00:1404:b0:62a:4503:53ba with SMTP id l4-20020a056a00140400b0062a450353bamr15620785pfu.26.1684816021623;
        Mon, 22 May 2023 21:27:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b0064d2c7ac49fsm4844332pfo.31.2023.05.22.21.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:27:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 03/11] nbdkit: Remove buildpaths from binaries
Date: Mon, 22 May 2023 21:26:50 -0700
Message-Id: <20230523042658.4159559-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523042658.4159559-1-raj.khem@gmail.com>
References: <20230523042658.4159559-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102718

Drop unused patch 0001-server-Fix-build-when-printf-is-a-macro.patch

Fixes
WARNING: nbdkit-1.33.11-r0 do_package_qa: QA Issue: File /usr/lib/nbdkit/plugins/nbdkit-cc-plugin.so in package nbdkit contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...void-absolute-buildpaths-in-binaries.patch | 38 ++++++++++++++++++
 ...ver-Fix-build-when-printf-is-a-macro.patch | 39 -------------------
 .../recipes-support/nbdkit/nbdkit_1.33.11.bb  |  2 +-
 3 files changed, 39 insertions(+), 40 deletions(-)
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch
 delete mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch b/meta-networking/recipes-support/nbdkit/nbdkit/0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch
new file mode 100644
index 0000000000..75377dfb80
--- /dev/null
+++ b/meta-networking/recipes-support/nbdkit/nbdkit/0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch
@@ -0,0 +1,38 @@
+From 1ccbd8fdbd2e367a702e48c8703b2f010d067b23 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 May 2023 18:16:24 -0700
+Subject: [PATCH] plugins: Avoid absolute buildpaths in binaries
+
+plugins seems to add CC to the plugins shared objects via compiler
+cmdline which ends up in real code. Therefore scrub buildpaths from CC
+and CFLAGS before passing them to plugin's build.
+
+Upstream-Status: Submitted [https://gitlab.com/nbdkit/nbdkit/-/merge_requests/30]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/cc/Makefile.am | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/plugins/cc/Makefile.am b/plugins/cc/Makefile.am
+index df8b5d15..80586a17 100644
+--- a/plugins/cc/Makefile.am
++++ b/plugins/cc/Makefile.am
+@@ -44,9 +44,12 @@ nbdkit_cc_plugin_la_SOURCES = \
+ 	$(top_srcdir)/include/nbdkit-plugin.h \
+ 	$(NULL)
+ 
++workdir := $(shell dirname $(abs_top_builddir))
++cc_no_sysroot := $(shell echo \"$(CC)\"|sed -e 's#$(workdir)#<WORKDIR>#g')
++cflags_no_sysroot := $(shell echo \"$(CFLAGS)\"|sed -e 's#$(workdir)#<WORKDIR>#g')
+ nbdkit_cc_plugin_la_CPPFLAGS = \
+-	-DCC="\"$(CC)\"" \
+-	-DCFLAGS="\"$(CFLAGS)\"" \
++	-DCC=\"$(cc_no_sysroot)\" \
++	-DCFLAGS=\"$(cflags_no_sysroot)\" \
+ 	-I$(top_srcdir)/include \
+ 	-I$(top_builddir)/include \
+ 	-I$(top_srcdir)/common/include \
+-- 
+2.40.1
+
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch b/meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch
deleted file mode 100644
index c7ec41eb9a..0000000000
--- a/meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 28f07715ab4d670ce81e12776bbece043305bd83 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Apr 2020 15:08:39 -0700
-Subject: [PATCH] server: Fix build when printf is a macro
-
-clang complains on x86 when building
-
-main.c:116:2: error: embedding a #include directive within macro arguments is not supported
- ^
-
-convert nesting include into a string assignment, to same effect but
-making it compatible with clang as well
-
-Upstream-Status: Submitted [https://github.com/libguestfs/nbdkit/pull/3]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- server/main.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/server/main.c b/server/main.c
-index 748122f..c0ac874 100644
---- a/server/main.c
-+++ b/server/main.c
-@@ -112,9 +112,10 @@ static void
- usage (void)
- {
-   /* --{short,long}-options remain undocumented */
--  printf (
-+  char const *opt_list =
- #include "synopsis.c"
--  );
-+	  ;
-+  printf ("%s\n", opt_list);
-   printf ("\n"
-           "Please read the nbdkit(1) manual page for full usage.\n");
- }
--- 
-2.26.0
-
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
index 32d4270d18..cdf2677f13 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
@@ -10,7 +10,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
-"
+           file://0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch"
 SRCREV = "6c02c6a469d62a047f230b0ccf03f72328312d2b"
 
 S = "${WORKDIR}/git"
-- 
2.40.1


