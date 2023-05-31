Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377D7C7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:33 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.11444.1685531595251556044
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RZhKtY5L;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-568af2f6454so23652827b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531608; x=1688123608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPwSEPOGYtw/dLrvj1COA6lOEV53miMt/tpd3us4eSs=;
        b=RZhKtY5LZqs4unsnbBfvVqjU4g0kICIF3ReT5bzt2wZMh/YJ0827ilCvTH46eCTdJA
         8fQk8/rixJpQRzxq2ZrxKQjDTtRV/0K7fx840EF/ey3jCYw/dBOBNLKG7Sk+gxvL+e2P
         0YHSo5Cl8FHYrZwaqAoFseJERgYO8lza6SWG3g7eL8kNlk8ZGps6ve++BESAxvH52avl
         gUTzt959TZqMtreRcaCBsijn1GoMWWDqdBqu4lyo5a+no+M1pwryCkGsBtgcQCW2vFKd
         W0ZmAAjQYBVd6qFkwaKW5WnaeDKdhZhtsKbo+1o6C+g7tyqsmjoAtEdhchgF09dyaMZE
         5pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531608; x=1688123608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPwSEPOGYtw/dLrvj1COA6lOEV53miMt/tpd3us4eSs=;
        b=SfkVh36/UAJM6gqLn6RdadjCfcEzfKTf2OdFqrRlDK8BHzJcDcfG74coSHalDv+ie1
         6dueqhRw8/sWZZlWE3W2V4S/Vp6mpew1MJNDLKN+aBCLqRDpK70bMcC7p8Uwz3U355m+
         ujElDoWE7Jz/WSx0lPAqHDzIa2VKrs1SqiQB0tVnP9QHe8/ZKPQVYjv05Ns3FDRlBb/u
         sGBhzep6UYGNj4GY7K35/k+SyBGyg3N7DXDJWVyHUYJQOHeQtM2voGYTFTO5prV+m5qG
         bxrT8xnz6kyy8kKCy5svE8BaomfcJv00PwvzqQMdpa9h7ROr5CNQhxtcoyXvjMT5wrAR
         bnXw==
X-Gm-Message-State: AC+VfDyL7b73U6kw+cLQRV7/7bdaK0sMAlsdo3H7lBJ5zZEXBcMNDDr3
	MhnBbPQSStk3AN7Q0Ke5Ve0BNX6jUws=
X-Google-Smtp-Source: ACHHUZ5YpL/TSw47uPgrrwxu8a2hpJRPCiGy951MUbN25doSc0IXWLFbLb31zT0tccs4OFM1Lac9Tg==
X-Received: by 2002:a81:a184:0:b0:568:a85f:80c1 with SMTP id y126-20020a81a184000000b00568a85f80c1mr5500301ywg.39.1685531607761;
        Wed, 31 May 2023 04:13:27 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 19/36] nbdkit: Remove buildpaths from binaries
Date: Wed, 31 May 2023 07:12:52 -0400
Message-Id: <20230531111309.2454603-19-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103048

From: Khem Raj <raj.khem@gmail.com>

Drop unused patch 0001-server-Fix-build-when-printf-is-a-macro.patch

Fixes
WARNING: nbdkit-1.33.11-r0 do_package_qa: QA Issue: File /usr/lib/nbdkit/plugins/nbdkit-cc-plugin.so in package nbdkit contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit da331ae8f1fccf3b542526f1caaa3834261434fa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


