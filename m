Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.21055.1610905016620609802
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GxWBBcrF;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id b5so8221948pjl.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CCZzxafBNti8sBbQjuLDLSifM4tuWJlLitBEaYcssJw=;
        b=GxWBBcrFxk9VIAsTnvemyQreSVjJ3DD6t1B6GicXE0qB7N6xXF/8n1aT7A8BgCLBch
         NG4mvZZDgkoI3MoOBoRi4uZF1imnBAmBYvAKAVfD//TkfZQhM4ekjUY1BColvPMgGO7J
         WiPbJgwtBPqe9YtIG3JeZTvsvz5posfzDIKq5CleJd4PwmrAVUAOYbn2IeypIcaQuS1m
         Wk5hsc6h0jAVV2zt7I3rc9cN9iSiT+heT8aPU9Z0wJTsQSlTDQXZGe/tZlAzJ8Pha+r3
         CAwH9KEuBsabCvOIvXPy+Qopw4f+RceXh0DELltSm3k0VVxNdcFmNWluLjsFOB04ixOv
         qQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CCZzxafBNti8sBbQjuLDLSifM4tuWJlLitBEaYcssJw=;
        b=hCpWjpPvbXaZxpKmmVfY1fuImbSNep2u/li7monCsEjaUVzNoXXQRxfa5o0vDsU+eQ
         XnEpwBrBUIO3zXSgKn7mWLBtDZgOjlPXLGYCZQZY4NeDYEnOKSlzF372lPP8lLVrLhJs
         kpZwST/M7kafANYQA8+kKU/yApJpB98rAh0KULMqrXVCmMlkCYTCJvfdozxt2CBSJ92z
         Ug6vr/dZDSLpnTSQPRB6318QqPlRYkrpejrQhxt6/aBgBlrhayEsOKlbIktnTHdj6XDQ
         V+qdRKouoJYsuhjAukZ9pK/FgfCM9fGFK74z90OEUWeBWDykh9MYy4Gln4agd10uWtzE
         Y4mQ==
X-Gm-Message-State: AOAM531/mwDQUO2/HEbxPvo4akchN9XmUEqybFTJNcoAfJZ9djMc0/G+
	E+9P4T03E4MU6N3gF87E65a/3TFczI45/g==
X-Google-Smtp-Source: ABdhPJxDs0Ckd+OLhbUo6UNLcAyr8xuw94sM/3mkIfZZpHGUZSK3/PxZdTQKn/K/rBqilGrjtfvdPw==
X-Received: by 2002:a17:902:ba8d:b029:dc:bc0:4d5 with SMTP id k13-20020a170902ba8db02900dc0bc004d5mr22600891pls.75.1610905016031;
        Sun, 17 Jan 2021 09:36:56 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:55 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 16/31] pidgin-sipe: Do not add native libdir to pkgconfig search path
Date: Sun, 17 Jan 2021 09:36:21 -0800
Message-Id: <4cdd3b13d523385743c0f87ff5636edf906b2146.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

This works fine until valgrind is installed on build host but its not
selected as option to build in recipe, configure wrongly pokes at
/usr/lib and sees valgrind there and enables it but only to fail in
compile time where it does not find valgrind.h in recipe sysroot, since
OE's build environment add right guardrails to pkgconfig, there is no
need to add build staging area to pkgconfig search path which turns out
to be wrong for cross builds anyway

Fixes
../../../pidgin-sipe-1.25.0/src/core/sipe-cert-crypto-nss.c:34:10: fatal error: 'valgrind.h' file not found
         ^~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 99bc44010402c2d8211805e78f6d4df751cf00e0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-add-native-paths-to-pkgconfig-searc.patch | 36 +++++++++++++++++++
 .../pidgin/pidgin-sipe_1.25.0.bb              |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin-sipe/0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch
new file mode 100644
index 0000000000..1dc7ca3f17
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch
@@ -0,0 +1,36 @@
+From fedef3c0b1772cee97d7288bee7d5d50805a5964 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Dec 2020 08:56:04 -0800
+Subject: [PATCH] configure: Do not add native paths to pkgconfig search
+
+This does not work in cross environments, secondly in OE we already
+point pkkconfig into recipe sysroot where it will find all the
+dependencies therefore this setting is not needed
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0df85b0..2481153 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,12 +70,6 @@ AC_CHECK_HEADERS([])
+ dnl checks for library functions
+ AC_CHECK_FUNCS([])
+ 
+-dnl tell pkgconfig to look in the same prefix where we're installing this to,
+-dnl as that is likely where libpurple will be found if it is not in the default
+-dnl pkgconfig path
+-PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:${libdir}/pkgconfig"
+-export PKG_CONFIG_PATH
+-
+ dnl debug mode
+ AC_ARG_ENABLE(debug,
+ 	[AS_HELP_STRING([--enable-debug],
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
index 99fcf3c6d0..f6b4c7cee1 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
@@ -10,6 +10,7 @@ inherit autotools gettext pkgconfig
 SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
            file://0001-sipe-consider-64bit-time_t-when-printing.patch \
            file://0001-Align-structs-casts-with-time_t-elements-to-8byte-bo.patch \
+           file://0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch \
 "
 
 SRC_URI[md5sum] = "0e742f021dc8c3f17435aea05c3e0314"
-- 
2.17.1

