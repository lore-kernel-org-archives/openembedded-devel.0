Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3909.1794729110589466956
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Yq7lGbem;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2983093eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729110; x=1795333910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DwzgbyzQ7pHqcAtvBs1rMpu+0wGt6vhcjK1/4muVbEA=;
        b=Yq7lGbemhXRf92W/KEZcoIdEQSSgYGzk6ZKiUX0q7xJjf/mOG8D3PixRKvml/GhQxN
         OfMawBL3xCkIRsQIxSmMOErfiPVS8fB3wapeSNEd9IBD9ITe9X+aZi0ho+Y4ncmxX4DC
         NcBs0icY72Cnw22pT1cYGpwT1+wDuPi/VTpffE8MDPFwam5jeDBt7olJDhv821DDAoqs
         eGiZHgtV1vfJVJpzNF56OJCt4oVIaEmM+dLrGu22fn40pynmJaFzhXzLg5xQCeOUGoOE
         AnOaV+0ZCSWg4WoLgAwLcUiOV062WmKHm3uaZQmrZLPhmODDF078b7bTcAHz0aNZXLxK
         3OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729110; x=1795333910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DwzgbyzQ7pHqcAtvBs1rMpu+0wGt6vhcjK1/4muVbEA=;
        b=sqYOO40sOkcifqc1OBh9mKcuDgEiXpnII3rdsWk6vgKwR1LiXHwmWeEcBzdhEyDAc2
         SyqJuokmPGABIpTV9E9j/aSO4MQ2H3PJAL4oRaQS7wUkfKUAx8uRSgUvuJ8oxwNMp4e/
         l9TzVfAA4svpC0wsTfW0ouC7/wjuZOfCC0ENlaz3fM/D7YQjIJTjlkYDw+6xHDe6juYb
         7MGQqSAPUyh3IwLG/AYzQxpNXGihIiVViQfh9jO3rEj8FnLVKznMBjbaf8sERQ1MGfEk
         F1pbVUyU3Fo8q5cmCMMupqo55rWzSYhSh1s+XvIZeYVyhP4VF2t7CV89hMHaCiP3Wea9
         PL0g==
X-Gm-Message-State: APuU4Z8HZNBePtmhnwrPlvkHk0D78+wYnBZhQR8gHGS+tE+5KAT0zg/Z
	NK6vwyG0D9x5Uns+STA8u0bpcSjMKsO4yC4AI0Tykb3ehpYrZSH0QzEFihdxEz5t
X-Gm-Gg: AYBFou227T+dBg3hiORakJ0nndH/c0Daz5M2g7AlGCo7aJo22Y+hD39vBT1JD5/BYDr
	Y0kq8/gCmf3bOxNBYOkVDKRE76N8iWzkt+LNdiK7TCFrJApees0IssZHgcriUP7Og1OI3sT5u8r
	h9Vv3bo+MFQm4Fxo6JqIhdUdnipn5JVSruTIzSaK9/bg5rDllimYnJSJG6qY7HocPcP/A3rxMGU
	56j6AXsFrJxQr/jvIWIXIjqqrhCIFkLJtCXH/bbxHUi0/5g6IwVyfPekNA1koiExJ1Mml9+MmRs
	SILGal1208AwDmAF70fHAPuZxgV0kfSD9OvkP0fm3IlYZtrSX6MzkabRfcvnmya+pnTcQ0fz72A
	NorKwoMHwkN/eiWYgHLwaEH6qeKQm9THrgKvTuqRwienufIzrM2AqdgerM983Zk0bBapWG+5+SH
	K39p9IcTt8xuAaASI+G651WSNRbR/IZvAS33mOR2v5pZLOBN3K44cq58mVFG0/HOJlZ+IwB/BFb
	ujquT6vAEvHyaE8E8QzhP/pXIxUBKmhNrHNIQWfuQaP3uOFSJGuq6rSQFfmTCCLvm7WGxYQMNd1
	m30N3XAWMg2Gcz3XS5SCaqN9zWyAu26Jcs+aNmqtP+1Yks6BD4bMeUUaWfvx6UMYIN/Se9YguVg
	/65u+8nfGHUfK6rQi+qvCwDULRUrXHiY5sytLWp195xQCi4BsdxbcJWygfjxlA+icx8zZwoGQsO
	gHJt4wxWSlN0stB8EszcXKP0E2vFTREILn8JhsBRYEYGnGhpttaEblXkudRJPtsl1rBX/wo7zUM
	uLTN9bS6XNyWB4zdEbSikZ1XWSJsHrW2QhuOTO7MQI6AV2HmKriKbizIal3O74vaKqnaK1WuttX
	2h1n
X-Received: by 2002:a05:7301:6184:20b0:36e:a179:85f2 with SMTP id 5a478bee46e88-379675fea57mr6750799eec.23.1794729109775;
        Sat, 14 Nov 2026 23:51:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 91/96] libabigail: Fix host include path use in configure
Date: Sat, 14 Nov 2026 23:49:09 -0800
Message-ID: <20261115074918.2932593-91-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132361
Content-Type: text/plain; charset="utf-8"

configure in 3.0 adds -I$EU_INCLUDEDIR (pkg-config --variable, not
sysroot-prefixed) and -I${prefix}/include to CPPFLAGS for the elfutils
header checks, i.e. -I/usr/include when cross compiling. This triggers
the configure-unsafe QA error with gcc, and makes the
_ELFUTILS_THREAD_SAFE check read the build host's elfutils/version.h.

Use the pkg-config ELF_CFLAGS/DW_CFLAGS instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...g-config-cflags-for-elfutils-header-.patch | 68 +++++++++++++++++++
 .../libabigail/libabigail_3.0.bb              |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/libabigail/libabigail/0002-configure-Use-pkg-config-cflags-for-elfutils-header-.patch

diff --git a/meta-oe/recipes-devtools/libabigail/libabigail/0002-configure-Use-pkg-config-cflags-for-elfutils-header-.patch b/meta-oe/recipes-devtools/libabigail/libabigail/0002-configure-Use-pkg-config-cflags-for-elfutils-header-.patch
new file mode 100644
index 0000000000..ebdc340118
--- /dev/null
+++ b/meta-oe/recipes-devtools/libabigail/libabigail/0002-configure-Use-pkg-config-cflags-for-elfutils-header-.patch
@@ -0,0 +1,68 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 14 Nov 2026 00:06:03 -0800
+Subject: [PATCH] configure: Use pkg-config cflags for elfutils header checks
+
+The elfutils header/declaration checks prepend -I$EU_INCLUDEDIR and
+-I${prefix}/include to CPPFLAGS.  EU_INCLUDEDIR comes from
+"pkg-config --variable=includedir", which is not prefixed with the
+sysroot, so both expand to -I/usr/include when cross compiling and the
+checks look at the build host headers instead of the target sysroot.
+
+Use $ELF_CFLAGS and $DW_CFLAGS from PKG_CHECK_MODULES instead.  These
+already point at the elfutils found via --with-elfutils or
+PKG_CONFIG_PATH, and pkg-config applies PKG_CONFIG_SYSROOT_DIR to them.
+
+	* configure.ac: Use $ELF_CFLAGS $DW_CFLAGS rather than
+	-I$EU_INCLUDEDIR and -I${prefix}/include when checking for
+	elfutils headers and declarations.
+
+Upstream-Status: Submitted [https://inbox.sourceware.org/libabigail/20261114080604.2989291-1-khem.raj@oss.qualcomm.com/]
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ configure.ac | 17 ++++-------------
+ 1 file changed, 4 insertions(+), 13 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a8509d7a..64fef76f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1105,7 +1105,7 @@ dnl By default, look for elfutils in the default system prefix.
+ if test x$ENABLE_MULTITHREADING != xno; then
+    saved_CPPFLAGS="$CPPFLAGS"
+
+-   CPPFLAGS="-I$EU_INCLUDEDIR $CPPFLAGS"
++   CPPFLAGS="$ELF_CFLAGS $DW_CFLAGS $CPPFLAGS"
+    AC_CHECK_HEADER([elfutils/version.h],
+ 		   [HAS_ELFUTILS_VERSION=yes],
+ 		   [AC_MSG_NOTICE([could not find elfutils/version.h])])
+@@ -1210,15 +1210,8 @@ AM_CONDITIONAL([CTF_READER],[test "x$ENABLE_CTF" = "xyes"])
+ AM_CONDITIONAL([BTF_READER],[test "x$ENABLE_BTF" = "xyes"])
+ AM_CONDITIONAL([ENABLE_LIBABIGAIL_MULTITHREADING],[test "x$ENABLE_MULTITHREADING" = "xyes"])
+
+-use_prefixed_includedir=""
+-if test x$prefix != x; then
+-  use_prefixed_includedir=$prefix
+-fi
+-
+-if test x$use_prefixed_includedir != x; then
+-  saved_CPPFLAGS="$CPPFLAGS"
+-  CPPFLAGS="-I${prefix}/include $CPPFLAGS"
+-fi
++saved_CPPFLAGS="$CPPFLAGS"
++CPPFLAGS="$ELF_CFLAGS $DW_CFLAGS $CPPFLAGS"
+
+ dnl Check if several decls and constant are defined in dependant
+ dnl libraries
+@@ -1796,9 +1789,7 @@ if test x$HAS_DW_FORM_strx1 = xyes -a \
+ 	     [Define to 1 if dwarf.h has the DW_FORM_strx enumerators])
+ fi
+
+-if test x$use_prefixed_includedir != x; then
+-  CPPFLAGS="$saved_CPPFLAGS"
+-fi
++CPPFLAGS="$saved_CPPFLAGS"
+
+
+ dnl Set large files support
diff --git a/meta-oe/recipes-devtools/libabigail/libabigail_3.0.bb b/meta-oe/recipes-devtools/libabigail/libabigail_3.0.bb
index 9dbecacf79..ebae94f5d7 100644
--- a/meta-oe/recipes-devtools/libabigail/libabigail_3.0.bb
+++ b/meta-oe/recipes-devtools/libabigail/libabigail_3.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"

 SRC_URI = "http://mirrors.kernel.org/sourceware/${BPN}/${BP}.tar.xz \
            file://0001-Link-tools-with-argp-standalone-when-the-C-library-l.patch \
+           file://0002-configure-Use-pkg-config-cflags-for-elfutils-header-.patch \
            "
 SRC_URI[sha256sum] = "d34ea7c4b150f61e22edb1d16157e12c43fd18f8e8f09abce053d82ccaf92e06"

