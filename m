Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7754EC43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 03:38:12 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.305.1783741083068644276
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2026 20:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hiMVSC36;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca80d708489so941287a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 20:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783741082; x=1784345882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaqnmnZ0T+c3hTtqlaID3T5WwRVHPVO/ZX9w/flmJDM=;
        b=hiMVSC36ORSYhtIKMSZ4cESfhJ4U4zhDfd1g73beSvvx7l6EAUsRK7j9ftwRAyv5O7
         JSb0EM9rU7meIJmn89cfPizC9QZWsy9N1WtrVHcjQg/L6UKxEtDrr0X+t2PmZc+rVII8
         mOMAsNI6/VoYAb0wkW889ozNQAuehufCBClxWJ5A6lWRkGtgv4B9drPmff86Bw5fcgPV
         63LWVH63jHvMETqjZymFKh/zWm+3iFGxMKt2IbUi8/KjC8BGfYKnWnuibqfBF+vEqGyY
         X8UR4uY6fOmwVaUVjiqp3Gql3U+CL4xAAtX6wNu6/HrXpsbxwd5YWpur/9z1KTMOZMhY
         /dRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783741082; x=1784345882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaqnmnZ0T+c3hTtqlaID3T5WwRVHPVO/ZX9w/flmJDM=;
        b=IAxmr2NT0Y88eZf9IjJw5RSXgiF3/Sm0quT22Pdy22ZZ9KqKG64/VLAKBwSzdEaoAi
         WH0pEZib/iSt9NmZ/X/IRc5QR7xSwslDbcsmhvNEeMTyY0mMjGceM7VZpdMFhKhLtG8d
         2m2YDbR5MxTQYtLmWLJhizSelcaE7kloFJO9s+B4q3Vn/z0A3pg9umKr17jQ5TVriAVV
         EQkHgWHtqD2EtAWSRNM+vCoxKGw+t/ZlgKptpdLFwVh2y721Um4INsVcW9fgiBuQFhfy
         aqAJN0Hq55U9p9xwaeVBQ0w08yzvD12iWMKodOVoG9yOPEkfR6y0XJhgsy+60f/UJy/S
         FoPg==
X-Gm-Message-State: AOJu0Yx1+LcxHVn2/0K5F0JCxubaCUsCV2n+T9b2QCggIPdAepAUy5Ag
	M9MzGLwkg6eXiS5xQrY0IqGYH3sFVRcWMYlxzodbGt20wRNfedrWnkZlZ8FG712qWXit9A==
X-Gm-Gg: AfdE7ck3i5hkX1Xht7VuRSv1spy+oKy8t4A7nXZb2+P+SGr0iswReRaDtaijAu/55X7
	mM74YGBi5dAIYLpnWR95dH9vs/dq/ElSQgHtjoRotx2BNGSe5SnvrIw0+cWsEaNaDu9CCRYTItH
	/Twfypj6iQKK16AVCMdvD179CidLB/WxHEB8/Oe8679QQ8I/oVLdaVfeOZhrmo0uGBCpnl64tA6
	8ox6jLPpUWBZ3SlBqjaV/W7Nnq8mlnuEL8Y7sbM4VNILvgPb1p1zMaXcStJgtBYvBchQkh/yx7r
	oHI2oKmnHMLiTGkf2HofcVVEIDtyWXYR+bi3bhbPE9AVA3V1JT338V7+6CQ5cb5i5P5vH04wI5u
	CFnIYZPghM1NlGtuyZ9wiu4C2Tv6Kx5AFxNHQv6v2JpJN2Llr6MPGefsjJgIYPfkAZoxWFVAXxZ
	Kzw5Rj0Cl3NJ+HBDcKN72EQ9tMYNMKLXgoU00pSCFm0tCAKb6/sJKazceyd6m8Sk31PWQ2/JUbR
	mLlXeOYx+J2Y0lHSeGjJqe4A4GH5M0MW1wBM648gI45Pcz8/2juXvXLvzkF+T/f/rLRE4eFb02C
	Vhcy+3Fkw74RpvrdqqgFik2VDQzspBAjXophdtVs
X-Received: by 2002:a05:6a20:3ca5:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3c0f091831emr8659366637.12.1783741082100;
        Fri, 10 Jul 2026 20:38:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6080dsm30306037eec.17.2026.07.10.20.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:38:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/2] uim: fix cross-build segfault by loading native plugins in uim-module-manager
Date: Fri, 10 Jul 2026 20:37:56 -0700
Message-ID: <20260711033756.981930-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260711033756.981930-1-khem.raj@oss.qualcomm.com>
References: <20260711033756.981930-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Jul 2026 03:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128135

The target build runs uim-module-manager (from uim-native, via PATH) to
generate scm/installed-modules.scm. Module registration makes the tool
uim_init() and dlopen the uim C plugins found in LIBUIM_PLUGIN_LIB_DIR,
which scm/Makefile hardcodes to the target build's uim/.libs. The native
uim-module-manager therefore loads target objects (and, transitively, the
target libuim) into the native process, which crashes do_compile when the
build host ABI differs from the target:

  make[1]: *** [Makefile:869: installed-modules.scm] Segmentation fault

seen building for x86-64-v3-poky-linux on an x86-64 host.

Make LIBUIM_PLUGIN_LIB_DIR overridable in scm/Makefile.am and point it at
the native plugin directory (${STAGING_LIBDIR_NATIVE}/uim/plugin) for the
target build, so the native tool loads compatible native plugins. The
generated installed-modules.scm is architecture independent, so the result
is unchanged. The native build is unaffected (the patch and override are
class-target only).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../uim/uim/uim-module-manager.patch          | 34 ++++++++++++++-----
 meta-oe/recipes-support/uim/uim_1.9.6.bb      |  7 ++++
 2 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/uim/uim/uim-module-manager.patch b/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
index 0e2fb687b6..ea3a959ea7 100644
--- a/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
+++ b/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
@@ -1,21 +1,39 @@
-From d61495d3fb039842b82df44184c67eb3c1256136 Mon Sep 17 00:00:00 2001
-From: Bian Naimeng <biannm@cn.fujitsu.com>
-Date: Fri, 26 Jun 2015 12:57:48 +0900
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 Jul 2026 00:00:00 +0000
+Subject: [PATCH] uim: run the native uim-module-manager against native plugins

----
-Upstream-Status: Pending
+When cross compiling, scm/Makefile runs uim-module-manager to generate
+installed-modules.scm. Use the uim-module-manager from PATH (provided by
+uim-native) instead of the freshly cross-built one, and make its plugin
+search directory (LIBUIM_PLUGIN_LIB_DIR) overridable. Registration makes
+the tool dlopen the uim C plugins; if that points at the target .libs the
+native tool loads target objects and segfaults on a build host whose ABI
+differs from the target (e.g. x86-64 host, x86-64-v3 target). The recipe
+overrides UIM_PLUGIN_LIB_DIR to the native plugin directory.
+
+This extends the original scm/Makefile.am change by Bian Naimeng
+<biannm@cn.fujitsu.com>.

- scm/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+Upstream-Status: Inappropriate [cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scm/Makefile.am | 3 ++-
+ 1 file changed, 3 insertions(+), 2 deletions(-)

 --- a/scm/Makefile.am
 +++ b/scm/Makefile.am
-@@ -115,7 +115,7 @@ if EXPAT
+@@ -115,11 +115,12 @@
    module_names += "yahoo-jp"
  endif

 -UIM_MODULE_MANAGER = $(top_builddir)/uim/uim-module-manager
++UIM_PLUGIN_LIB_DIR = $(abs_top_builddir)/uim/.libs
 +UIM_MODULE_MANAGER = uim-module-manager
  UIM_MODULE_MANAGER_ENV = \
          LIBUIM_SYSTEM_SCM_FILES=$(abs_top_srcdir)/sigscheme/lib \
          LIBUIM_SCM_FILES=$(abs_srcdir) \
+-        LIBUIM_PLUGIN_LIB_DIR=$(abs_top_builddir)/uim/.libs \
++        LIBUIM_PLUGIN_LIB_DIR=$(UIM_PLUGIN_LIB_DIR) \
+         UIM_DISABLE_NOTIFY=1
+
+ loader.scm: installed-modules.scm
diff --git a/meta-oe/recipes-support/uim/uim_1.9.6.bb b/meta-oe/recipes-support/uim/uim_1.9.6.bb
index 6e6ed522d8..ac2e1118f4 100644
--- a/meta-oe/recipes-support/uim/uim_1.9.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.9.6.bb
@@ -43,6 +43,13 @@ EXTRA_OECONF += "--disable-emacs \

 CONFIGUREOPTS:remove:class-target = "--disable-silent-rules"

+# The target build runs the native uim-module-manager (from uim-native) to
+# generate installed-modules.scm. Registration dlopens the uim C plugins, so
+# point the loader at the native plugin directory; otherwise the native tool
+# loads the target plugins and crashes on hosts whose ABI differs from the
+# target. See uim-module-manager.patch.
+EXTRA_OEMAKE:append:class-target = " UIM_PLUGIN_LIB_DIR=${STAGING_LIBDIR_NATIVE}/uim/plugin"
+
 # https://github.com/uim/uim/issues/44
 PARALLEL_MAKE = ""


