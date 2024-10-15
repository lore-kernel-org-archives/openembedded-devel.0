Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BE9D1F9DA
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 21:59:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.9166.1729029586912734812
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 14:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IGvoU9Ay;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d41894a32so183457f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 14:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729029585; x=1729634385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IfqJQ1h5oH08TxHYzwIovuD5cjQPTE9Lcent8+0Pmzo=;
        b=IGvoU9AybPmDJfSxexAWeTPljXTXbUtrrIpoWwss0VoJI4o3RM7hmoJV+4uvF6HaBO
         WSutEVg010rpiK4FRgeqS2YJ2V7Nr6b4Ze7XSs7+XT99sFSDDfcWp9HrlIOyZSobcKLj
         kZksxt7hZzk70SX4/GtPSQkHF5ojaSrk2kND8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729029585; x=1729634385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfqJQ1h5oH08TxHYzwIovuD5cjQPTE9Lcent8+0Pmzo=;
        b=q+qlMCupOZ8mrPQu7W/0+7PaLPY1xaa82ZOoo6QjLuj9u1c+1712rqklAI/qEBaHz8
         FrZv0nhsLNp30vAPiRu4Hz7jRMHEXv+idZzgfyciqwOMc5Y/Z8gubWmWdNjThXj11Yk9
         TodDpaBvG3CP3rDzR0TVVJgYjh/iOMV86rTGB9znqIOYnTaLidS153DzzL/4HUWqw/5c
         8krA3G351NS/Hx+9SgSaHP4kPzGIoF5v7pRWMZRfHViA1HThvK5PJiF0+Z9ZBfOsJWrv
         rcCHj4v2SRk/LuX52PJuDkoNsOXFLG9ofbzrRE/Vl0gx2sNapXMYp0kEgfd4jL/xyhwZ
         lUmQ==
X-Gm-Message-State: AOJu0Yx/7+eslqdFpx3ehuwcG47BQFuATPi9Xwkby5OAVSCXHsqGeWSx
	9HiETnJuzEtA1mZQ3V7fYAWqCNCexYQKdm7UIHO8K7WJ+EK7Y4YcfaQq4KRFSZlP9QXxy2fPua+
	F
X-Google-Smtp-Source: AGHT+IH663VgNUQuFPkrvpwJOLbqzH9kxny7GizMhfakzMMgKv2fEZ132L/ZyUQ+ihuxfMMGlDUMug==
X-Received: by 2002:a5d:47aa:0:b0:374:b9ca:f1e8 with SMTP id ffacd0b85a97d-37d862fe835mr2054968f8f.20.1729029584565;
        Tue, 15 Oct 2024 14:59:44 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa90c60sm2634376f8f.62.2024.10.15.14.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 14:59:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-gnome][PATCH v2] gimp: fix gimptool buildpaths errors
Date: Tue, 15 Oct 2024 23:59:33 +0200
Message-Id: <20241015215933.1406192-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 21:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112930

From: Yoann Congal <yoann.congal@smile.fr>

gimptool is used in GIMP plugin compilation. It does need a CC
definition, provide it as the current CC with "--sysroot=..." removed.

gimptool also need the gimp .pc file which is in gimp-dev. Split
gimptool in its own package to avoid circular dependencies.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: Move from plain gimptool removal to this proposal
Tested by building a simple C plugin
---
 ...1-gimptool-allow-default-CC-override.patch | 85 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  | 21 +++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
new file mode 100644
index 0000000000..b04a16cec7
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
@@ -0,0 +1,85 @@
+From 7e5b986cb7797a6535fe2471b9a5fb7c00821f51 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Sun, 13 Oct 2024 01:00:10 +0200
+Subject: [PATCH] gimptool: allow default CC override
+
+From: Yoann Congal <yoann.congal@smile.fr>
+
+In OE, CC contains sysroot path. Storing CC in binary then leads to
+non-reproducibility.
+
+This commit add a new configure option "--with-default-cc='cmd'" for
+force the CC stored in gimptool to a reproducible value.
+
+Upstream-Status: Inappropriate [does not apply on master (upstream has moved to meson)]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ app-tools/Makefile.am |  2 +-
+ configure.ac          | 13 +++++++++++++
+ tools/Makefile.am     |  2 +-
+ tools/gimptool.c      |  2 +-
+ 4 files changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/app-tools/Makefile.am b/app-tools/Makefile.am
+index a7cd4ce..81a3a00 100644
+--- a/app-tools/Makefile.am
++++ b/app-tools/Makefile.am
+@@ -67,7 +67,7 @@ AM_CPPFLAGS = \
+ 	-DMANDIR=\""$(mandir)"\"				\
+ 	-DGIMPPLUGINDIR=\""$(gimpplugindir)"\"			\
+ 	-DGIMPDATADIR=\""$(gimpdatadir)"\"			\
+-	-DCC=\""$(CC)"\"					\
++	-DDEFAULT_CC=\""@DEFAULT_CC@"\"				\
+ 	-DGIMPDIR=\""$(gimpdir)"\"				\
+ 	-DGIMP_PLUGIN_VERSION=\""$(GIMP_PLUGIN_VERSION)"\"	\
+ 	-I$(top_srcdir)						\
+diff --git a/configure.ac b/configure.ac
+index a88b7cc..d90b6db 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2457,6 +2457,19 @@ fi
+ AM_CONDITIONAL(DESKTOP_DATADIR, test "x$with_desktop_dir" != xno)
+ AC_SUBST(DESKTOP_DATADIR)
+ 
++######################
++# Determine default CC
++######################
++
++AC_ARG_WITH(default-cc, [ --with-default-cc="cmd" default CC to print in gimptool (default=CC)])
++
++if test "x$with_default_cc" != x; then
++  DEFAULT_CC=$with_default_cc
++else
++  DEFAULT_CC=CC
++fi
++
++AC_SUBST(DEFAULT_CC)
+ 
+ #####################
+ # Check for XML tools
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 420b9b1..ccabde8 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -87,7 +87,7 @@ AM_CPPFLAGS = \
+ 	-DMANDIR=\""$(mandir)"\"				\
+ 	-DGIMPPLUGINDIR=\""$(gimpplugindir)"\"			\
+ 	-DGIMPDATADIR=\""$(gimpdatadir)"\"			\
+-	-DCC=\""$(CC)"\"					\
++	-DDEFAULT_CC=\""@DEFAULT_CC@"\"				\
+ 	-DGIMPDIR=\""$(gimpdir)"\"				\
+ 	-DGIMP_PLUGIN_VERSION=\""$(GIMP_PLUGIN_VERSION)"\"	\
+ 	-I$(top_srcdir)						\
+diff --git a/tools/gimptool.c b/tools/gimptool.c
+index 21fc043..bbf3fa5 100644
+--- a/tools/gimptool.c
++++ b/tools/gimptool.c
+@@ -280,7 +280,7 @@ find_out_env_flags (void)
+   else if (msvc_syntax)
+     env_cc = "cl -MD";
+   else
+-    env_cc = CC;
++    env_cc = DEFAULT_CC;
+ 
+   if (g_ascii_strncasecmp (env_cc, "cl", 2)    == 0 &&
+       g_ascii_strncasecmp (env_cc, "clang", 5) != 0)
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index a17e03b103..0272e05e96 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch \
            file://0001-file-tiff-load-fix-mismatching-variable-type.patch \
            file://0001-metadata-shut-up-a-weird-warning.patch \
+           file://0001-gimptool-allow-default-CC-override.patch \
            "
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 
@@ -74,6 +75,26 @@ FILES:${PN}  += "${datadir}/metainfo"
 
 RDEPENDS:${PN} += "mypaint-brushes-1.0"
 
+
+# gimptool
+
+# gimptool needs a CC definition, use current CC without sysroot
+python __anonymous() {
+    import shlex
+    CC_WITHOUT_SYSROOT = shlex.join(filter(lambda x: not x.startswith("--sysroot="), shlex.split(d.getVar("CC"))))
+    d.setVar("CC_WITHOUT_SYSROOT", CC_WITHOUT_SYSROOT)
+}
+EXTRA_OECONF += "--with-default-cc='${CC_WITHOUT_SYSROOT}'"
+
+# Split gimptool in its own package
+PACKAGE_BEFORE_PN += "${PN}-gimptool"
+FILES:${PN}-gimptool += "${bindir}/gimptool-2.0"
+
+# gimptool depends on gimp .pc file being installed and tools to build the plugin.
+RDEPENDS:${PN}-gimptool += "${PN}-dev packagegroup-core-buildessential"
+INSANE_SKIP:${PN}-gimptool += "dev-deps"
+
+
 CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
 CVE_STATUS[CVE-2009-0581] = "cpe-incorrect: The current version (2.10.38) is not affected."
 CVE_STATUS[CVE-2009-0723] = "cpe-incorrect: The current version (2.10.38) is not affected."

