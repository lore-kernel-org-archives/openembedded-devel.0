Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id EAFE0790A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 03:17:29 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id w8-v6so88617pgs.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 20:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UZI4W3rt2GSFE9kxCfthz9v5st8NNWQdtM4GlMhThxI=;
	b=L0KBX3uJ5nYKyQpWQOYPLmmZpZkfxVRhKw4FK3magJH1UTC9FFtvTTfPFSxJUn8aXJ
	GXfYcPMkWB4tKxIlE48zwXWid7CBE/SLTJcawFqZMoeTlCRh+Xx1g/G7Wptn+86K312N
	qByscUIj+tHdCKXATkvdVBmdEjB00s1kpeCXafuQMVmw+ept0lLobJCwNmDybBvH+t38
	wdjGnWbG9OVEIDSM55kQfBVfg7HomZaHYXXeIBjoY3QmmqC0NMt8aBOOAVEQnvBU4hKv
	0dMLc9zzYWkwV7bR1D5rKmGZ/LQYD8K1FO2w+2C2U0ZCu+CnzHaD+xbX1tJi97FS2iG/
	R3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UZI4W3rt2GSFE9kxCfthz9v5st8NNWQdtM4GlMhThxI=;
	b=Fgj1rgO7tq4jmrLHIstJ5q1RNG2xIS/ptyjUGHKj9qnZFgHdFlUAvVu96HC78O5gLW
	/kFTBgms3N1AWIRngyyKFsWTtmvh56jwpZJOeo5aLUDuQF7C3n0cdl5p595T99bFtIBa
	lxJYbG0FFhH49dmnUCjYz/ADEYRufXxaYowlYvhCEPqfmY2z0yQf/JkzA1FjnI5vimEj
	YS9u5sf5+ybhjgYhXK9fQDfp84WeG6930IWXhU9+s8YtzsD0DaKFw1hL9BgDKKb2gLQf
	6XXi4Jk4W9T+aPYdP6FkGFIBy28qumC6dvWJcRYiqCPW42TJcSPfADOAoLmQeLgR3+Sc
	brag==
X-Gm-Message-State: APzg51AKkM0u519mHjjC7Al4ck0XbXj5ll1caLbSEkjLfsG+G00BEqNX
	zJOyPpGs1oE02/ZVAVR+pV3gv6oZ
X-Google-Smtp-Source: ANB0VdanHNZlYqYfAcDXbJHLp1bq8I+R5R/2zozMO2J+AW6qaXQbkQ4HmN3yZseSkENdlLWzrJk3JQ==
X-Received: by 2002:a62:f208:: with SMTP id
	m8-v6mr4021608pfh.222.1535512650217; 
	Tue, 28 Aug 2018 20:17:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	z19-v6sm10411764pgi.33.2018.08.28.20.17.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 20:17:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2018 20:17:20 -0700
Message-Id: <20180829031720.26437-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180829031720.26437-1-raj.khem@gmail.com>
References: <20180829031720.26437-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] open-vm-tools: Upgrade to 10.3.0
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
X-List-Received-Date: Wed, 29 Aug 2018 03:17:30 -0000

License-update: Copyright year and formatting changes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ns-about-glibc-being-only-libc-imple.patch |  45 --
 ...001-Use-off64_t-instead-of-__off64_t.patch |  31 ++
 ...ible-pointer-types-and-Wno-error-add.patch |  31 --
 .../open-vm-tools/use-tirpc.patch             | 481 ------------------
 ...ools_10.2.5.bb => open-vm-tools_10.3.0.bb} |   8 +-
 5 files changed, 34 insertions(+), 562 deletions(-)
 delete mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Use-off64_t-instead-of-__off64_t.patch
 delete mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Add-Wno-incompatible-pointer-types-and-Wno-error-add.patch
 delete mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/use-tirpc.patch
 rename meta-oe/recipes-support/open-vm-tools/{open-vm-tools_10.2.5.bb => open-vm-tools_10.3.0.bb} (92%)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch
deleted file mode 100644
index 9773b4a949..0000000000
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From a0983d84185f04c4e40778fe951fde4439894882 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Jul 2017 07:37:03 -0700
-Subject: [PATCH 01/11] Remove assumptions about glibc being only libc
- implementation on linux
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- open-vm-tools/lib/file/fileIOPosix.c      | 2 +-
- open-vm-tools/lib/include/vm_basic_defs.h | 2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-Index: open-vm-tools/lib/file/fileIOPosix.c
-===================================================================
---- open-vm-tools.orig/lib/file/fileIOPosix.c
-+++ open-vm-tools/lib/file/fileIOPosix.c
-@@ -205,7 +205,7 @@ static AlignedPool alignedPool;
-  * are not available in any header file.
-  */
- 
--#if defined(__linux__) && !defined(__ANDROID__)
-+#if defined(__linux__) && defined(__GLIBC__)
-    #if defined(_FILE_OFFSET_BITS) && (_FILE_OFFSET_BITS == 64)
-       /*
-        * We want preadv/pwritev. But due to FOB=64, the symbols are -64.
-Index: open-vm-tools/lib/include/vm_basic_defs.h
-===================================================================
---- open-vm-tools.orig/lib/include/vm_basic_defs.h
-+++ open-vm-tools/lib/include/vm_basic_defs.h
-@@ -571,6 +571,7 @@ typedef int pid_t;
- #if defined __linux__ && !defined __KERNEL__ && !defined MODULE && \
-                          !defined VMM && !defined FROBOS && !defined __ANDROID__
- #include <features.h>
-+#if __GLIBC__
- #if __GLIBC_PREREQ(2, 1) && !defined GLIBC_VERSION_21
- #define GLIBC_VERSION_21
- #endif
-@@ -590,6 +591,7 @@ typedef int pid_t;
- #define GLIBC_VERSION_212
- #endif
- #endif
-+#endif
- 
- /*
-  * Convenience definitions of unicode characters.
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Use-off64_t-instead-of-__off64_t.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Use-off64_t-instead-of-__off64_t.patch
new file mode 100644
index 0000000000..432496f27f
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Use-off64_t-instead-of-__off64_t.patch
@@ -0,0 +1,31 @@
+From 43d859f9d5eecdc0fdc1a6bf539bcde4a152e6f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 27 Aug 2018 23:22:21 -0700
+Subject: [PATCH] Use off64_t instead of __off64_t
+
+Fixes
+unknown type name '__off64_t'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/file/fileIOPosix.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/file/fileIOPosix.c b/lib/file/fileIOPosix.c
+index 23108279..bcd2ddc5 100644
+--- a/lib/file/fileIOPosix.c
++++ b/lib/file/fileIOPosix.c
+@@ -206,10 +206,10 @@ static AlignedPool alignedPool;
+        * the symbols (and anyone building XOPEN<700 gets nothing).
+        */
+       extern ssize_t preadv64(int fd, const struct iovec *iov, int iovcnt,
+-                          __off64_t offset) __attribute__ ((weak));
++                          off64_t offset) __attribute__ ((weak));
+ 
+       extern ssize_t pwritev64(int fd, const struct iovec *iov, int iovcnt,
+-                          __off64_t offset) __attribute__ ((weak));
++                          off64_t offset) __attribute__ ((weak));
+    #else
+       #error "Large file support unavailable. Aborting."
+    #endif
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Add-Wno-incompatible-pointer-types-and-Wno-error-add.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Add-Wno-incompatible-pointer-types-and-Wno-error-add.patch
deleted file mode 100644
index 010516761f..0000000000
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Add-Wno-incompatible-pointer-types-and-Wno-error-add.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From cdb0b3c898c6b6b6c8259d9ddb8b00163ac5e419 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Jul 2017 09:43:18 -0700
-Subject: [PATCH 04/11] Add -Wno-incompatible-pointer-types and
- -Wno-error=address
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- open-vm-tools/lib/dynxdr/Makefile.am | 2 +-
- open-vm-tools/lib/file/Makefile.am   | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-Index: open-vm-tools/lib/dynxdr/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/dynxdr/Makefile.am
-+++ open-vm-tools/lib/dynxdr/Makefile.am
-@@ -20,4 +20,4 @@ noinst_LTLIBRARIES = libDynxdr.la
- libDynxdr_la_SOURCES = 
- libDynxdr_la_SOURCES += dynxdr.c
- libDynxdr_la_SOURCES += xdrutil.c
--
-+libDynxdr_la_CPPFLAGS = -Wno-incompatible-pointer-types
-Index: open-vm-tools/lib/file/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/file/Makefile.am
-+++ open-vm-tools/lib/file/Makefile.am
-@@ -27,3 +27,4 @@ libFile_la_SOURCES += fileLockPrimitive.
- libFile_la_SOURCES += fileLockPosix.c
- libFile_la_SOURCES += fileTempPosix.c
- libFile_la_SOURCES += fileTemp.c
-+libFile_la_CPPFLAGS = -Wno-error=address
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/use-tirpc.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/use-tirpc.patch
deleted file mode 100644
index a6bb92486f..0000000000
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/use-tirpc.patch
+++ /dev/null
@@ -1,481 +0,0 @@
-Index: open-vm-tools/configure.ac
-===================================================================
---- open-vm-tools.orig/configure.ac
-+++ open-vm-tools/configure.ac
-@@ -586,6 +586,11 @@ AC_ARG_WITH([xml2],
-    [enable_vgauth=no],
-    [with_xml2=yes])
- 
-+AC_ARG_WITH([tirpc],
-+   [AS_HELP_STRING([--without-tirpc],
-+     [compiles without tirpc support.])],
-+   [with_tirpc="$withval"],
-+   [with_tirpc="auto"])
- 
- # Make sure we are building with openssl 1.0.1 and above so that
- # we use only TLSv1_2.
-@@ -1067,10 +1072,45 @@ if test "$enable_caf" = "yes"; then
- 
- fi
- 
-+have_tirpc="no"
-+if test "x$with_tirpc" != "xno"; then
-+    AC_VMW_CHECK_LIB([libtirpc],
-+                     [TIRPC],
-+                     [libtirpc],
-+                     [],
-+                     [],
-+                     [],
-+                     [],
-+                     [have_tirpc="yes"],
-+                     [have_tirpc="no"])
-+fi
-+
-+if test "$with_tirpc" = "no"; then
-+   use_tirpc="no"
-+elif test "$with_tirpc" = "auto"; then
-+   use_tirpc=$have_tirpc
-+elif test "$with_tirpc" = "yes"; then
-+   if test "$have_tirpc" = "no"; then
-+      AC_MSG_ERROR([libtirpc is required, but not found.])
-+   else
-+      use_tirpc="yes"
-+   fi
-+fi 
-+
-+if test "$use_tirpc" = "yes"; then
-+   AC_MSG_NOTICE([Building with libtirpc])
-+else
-+   AC_MSG_NOTICE([Building without libtirpc])
-+fi
-+
- AC_PATH_PROG(
-    [RPCGEN],
-    [rpcgen],
--   [ AC_MSG_ERROR([rpcgen not found. Please install the libc devel package.]) ])
-+   [not_found])
-+
-+if test "$RPCGEN" = "not_found"; then
-+   AC_MSG_ERROR([rpcgen not found. Please install libc-devel or libc-rpcgen package.])
-+fi
- 
- ###
- ### Headers
-@@ -1411,6 +1451,7 @@ AM_CONDITIONAL(HAVE_MKDTEMP, test "$have
- AM_CONDITIONAL(HAVE_UDEV, test "$have_udev" = "yes")
- AM_CONDITIONAL(ENABLE_RESOLUTIONKMS, test "x$enable_resolutionkms" = "xyes")
- AM_CONDITIONAL(VGAUTH_USE_CXX, test "$with_icu" = "yes" -o "$use_xmlsec1" != "yes")
-+AM_CONDITIONAL(HAVE_TIRPC, test "$use_tirpc" = "yes")
- 
- if test "$have_xsm" != "yes"; then
- AC_DEFINE([NO_XSM], 1, [])
-@@ -1459,6 +1500,13 @@ if test "$os" = "solaris"; then
-    XDR_LIBS="-lnsl -lrpcsvc"
- fi
- 
-+# In newer Linux distros Sun RPC has been removed from libc
-+XDR_CPPFLAGS=
-+if test "$os" = "linux" -a "$use_tirpc" = "yes"; then
-+   XDR_CPPFLAGS="-DUSE_TIRPC $TIRPC_CPPFLAGS"
-+   XDR_LIBS="$TIRPC_LIBS"
-+fi
-+
- # Installation directories for core services plugins.
- TEST_PLUGIN_INSTALLDIR=$datadir/open-vm-tools/tests
- COMMON_PLUGIN_INSTALLDIR=$libdir/open-vm-tools/plugins/common
-@@ -1497,6 +1545,7 @@ AC_SUBST([PLUGIN_LDFLAGS])
- AC_SUBST([VMTOOLS_CPPFLAGS])
- AC_SUBST([VMTOOLS_LIBS])
- AC_SUBST([RPCGENFLAGS])
-+AC_SUBST([XDR_CPPFLAGS])
- AC_SUBST([XDR_LIBS])
- AC_SUBST([TEST_PLUGIN_INSTALLDIR])
- AC_SUBST([COMMON_PLUGIN_INSTALLDIR])
-Index: open-vm-tools/lib/dynxdr/dynxdr.c
-===================================================================
---- open-vm-tools.orig/lib/dynxdr/dynxdr.c
-+++ open-vm-tools/lib/dynxdr/dynxdr.c
-@@ -1,5 +1,5 @@
- /*********************************************************
-- * Copyright (C) 2008-2017 VMware, Inc. All rights reserved.
-+ * Copyright (C) 2008-2018 VMware, Inc. All rights reserved.
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms of the GNU Lesser General Public License as published
-@@ -55,7 +55,7 @@ typedef struct DynXdrData {
-  * Mac OS X, FreeBSD and Solaris don't take a const parameter to the
-  * "x_getpostn" function.
-  */
--#if defined(__APPLE__) || defined(__FreeBSD__) || defined(sun)
-+#if defined(__APPLE__) || defined(__FreeBSD__) || defined(sun) || defined(USE_TIRPC)
- #  define DYNXDR_GETPOS_CONST
- #else
- #  define DYNXDR_GETPOS_CONST const
-@@ -172,7 +172,11 @@ DynXdrSetPos(XDR *xdrs, // IN
- }
- 
- 
--#if defined(__GLIBC__) || (defined(sun) && (defined(_LP64) || defined(_KERNEL)))
-+#if !defined(USE_TIRPC) &&    \
-+     defined(__GLIBC__) ||    \
-+     (defined(sun) &&         \
-+        (defined(_LP64) ||    \
-+           defined(_KERNEL)))
- /*
-  *-----------------------------------------------------------------------------
-  *
-@@ -322,11 +326,11 @@ DynXdr_Create(XDR *in)  // IN
-       DynXdrSetPos,     /* x_setpostn */
-       DynXdrInline,     /* x_inline */
-       NULL,             /* x_destroy */
--#if defined(__GLIBC__)
-+#if defined(__APPLE__) || defined (USE_TIRPC)
-+      NULL,             /* x_control */
-+#elif defined(__GLIBC__)
-       NULL,             /* x_getint32 */
-       DynXdrPutInt32,   /* x_putint32 */
--#elif defined(__APPLE__)
--      NULL,             /* x_control */
- #elif defined(sun) && (defined(_LP64) || defined(_KERNEL))
-       NULL,             /* x_control */
-       NULL,             /* x_getint32 */
-Index: open-vm-tools/lib/dynxdr/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/dynxdr/Makefile.am
-+++ open-vm-tools/lib/dynxdr/Makefile.am
-@@ -1,5 +1,5 @@
- ################################################################################
--### Copyright (C) 2008-2016 VMware, Inc.  All rights reserved.
-+### Copyright (C) 2008-2018 VMware, Inc.  All rights reserved.
- ###
- ### This program is free software; you can redistribute it and/or modify
- ### it under the terms of version 2 of the GNU General Public License as
-@@ -20,4 +20,7 @@ noinst_LTLIBRARIES = libDynxdr.la
- libDynxdr_la_SOURCES = 
- libDynxdr_la_SOURCES += dynxdr.c
- libDynxdr_la_SOURCES += xdrutil.c
--libDynxdr_la_CPPFLAGS = -Wno-incompatible-pointer-types
-+
-+libDynxdr_la_CPPFLAGS = @XDR_CPPFLAGS@ -Wno-incompatible-pointer-types
-+libDynxdr_la_LIBADD = @XDR_LIBS@
-+
-Index: open-vm-tools/lib/guestRpc/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/guestRpc/Makefile.am
-+++ open-vm-tools/lib/guestRpc/Makefile.am
-@@ -1,5 +1,5 @@
- ################################################################################
--### Copyright (C) 2008-2016 VMware, Inc.  All rights reserved.
-+### Copyright (C) 2008-2018 VMware, Inc.  All rights reserved.
- ###
- ### This program is free software; you can redistribute it and/or modify
- ### it under the terms of version 2 of the GNU General Public License as
-@@ -20,6 +20,10 @@ noinst_LTLIBRARIES = libGuestRpc.la
- libGuestRpc_la_SOURCES =
- libGuestRpc_la_SOURCES += nicinfo_xdr.c
- 
-+libGuestRpc_la_CPPFLAGS = @XDR_CPPFLAGS@
-+
-+libGuestRpc_la_LIBADD = @XDR_LIBS@
-+
- # XXX: Autoreconf complains about this and recommends using AM_CFLAGS instead.
- # Problem is, $(CFLAGS) is appended to the compiler command line after AM_CFLAGS
- # and after libGuestRpc_la_CFLAGS, so "-Wall -Werror" will override this flag.
-Index: open-vm-tools/lib/netUtil/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/netUtil/Makefile.am
-+++ open-vm-tools/lib/netUtil/Makefile.am
-@@ -1,5 +1,5 @@
- ################################################################################
--### Copyright (C) 2007-2016 VMware, Inc.  All rights reserved.
-+### Copyright (C) 2007-2018 VMware, Inc.  All rights reserved.
- ###
- ### This program is free software; you can redistribute it and/or modify
- ### it under the terms of version 2 of the GNU General Public License as
-@@ -20,3 +20,6 @@ noinst_LTLIBRARIES = libNetUtil.la
- libNetUtil_la_SOURCES =
- libNetUtil_la_SOURCES += netUtilLinux.c
- 
-+libNetUtil_la_CPPFLAGS = @XDR_CPPFLAGS@
-+
-+libNetUtil_la_LIBADD = @XDR_LIBS@
-Index: open-vm-tools/lib/nicInfo/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/nicInfo/Makefile.am
-+++ open-vm-tools/lib/nicInfo/Makefile.am
-@@ -1,5 +1,5 @@
- ################################################################################
--### Copyright (C) 2014-2016 VMware, Inc.  All rights reserved.
-+### Copyright (C) 2014-2018 VMware, Inc.  All rights reserved.
- ###
- ### This program is free software; you can redistribute it and/or modify
- ### it under the terms of version 2 of the GNU General Public License as
-@@ -25,6 +25,9 @@ libNicInfo_la_SOURCES += nicInfoPosix.c
- 
- libNicInfo_la_CPPFLAGS =
- libNicInfo_la_CPPFLAGS += @GLIB2_CPPFLAGS@
-+libNicInfo_la_CPPFLAGS += @XDR_CPPFLAGS@
-+
-+libNicInfo_la_LIBADD = @XDR_LIBS@
- 
- AM_CFLAGS = $(DNET_CPPFLAGS)
- if USE_SLASH_PROC
-Index: open-vm-tools/lib/rpcChannel/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/rpcChannel/Makefile.am
-+++ open-vm-tools/lib/rpcChannel/Makefile.am
-@@ -1,5 +1,5 @@
- ################################################################################
--### Copyright (C) 2009-2016 VMware, Inc.  All rights reserved.
-+### Copyright (C) 2009-2018 VMware, Inc.  All rights reserved.
- ###
- ### This program is free software; you can redistribute it and/or modify
- ### it under the terms of version 2 of the GNU General Public License as
-@@ -27,3 +27,6 @@ endif
- 
- libRpcChannel_la_CPPFLAGS =
- libRpcChannel_la_CPPFLAGS += @VMTOOLS_CPPFLAGS@
-+libRpcChannel_la_CPPFLAGS += @XDR_CPPFLAGS@
-+
-+libRpcChannel_la_LIBADD = @XDR_LIBS@
-Index: open-vm-tools/lib/slashProc/net.c
-===================================================================
---- open-vm-tools.orig/lib/slashProc/net.c
-+++ open-vm-tools/lib/slashProc/net.c
-@@ -1,5 +1,5 @@
- /*********************************************************
-- * Copyright (C) 2009-2016 VMware, Inc. All rights reserved.
-+ * Copyright (C) 2009-2018 VMware, Inc. All rights reserved.
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms of the GNU Lesser General Public License as published
-@@ -36,7 +36,6 @@
- #include "panic.h"
- #include "slashProc.h"
- #include "slashProcNetInt.h"
--#include "netutil.h"
- 
- 
- /*
-Index: open-vm-tools/libguestlib/Makefile.am
-===================================================================
---- open-vm-tools.orig/libguestlib/Makefile.am
-+++ open-vm-tools/libguestlib/Makefile.am
-@@ -1,5 +1,5 @@
- ################################################################################
--### Copyright (C) 2007-2016 VMware, Inc.  All rights reserved.
-+### Copyright (C) 2007-2018 VMware, Inc.  All rights reserved.
- ###
- ### This program is free software; you can redistribute it and/or modify
- ### it under the terms of version 2 of the GNU General Public License as
-@@ -22,6 +22,7 @@ AM_CFLAGS += -I$(top_srcdir)/include
- 
- libguestlib_la_LIBADD =
- libguestlib_la_LIBADD += @VMTOOLS_LIBS@
-+libguestlib_la_LIBADD += @XDR_LIBS@
- 
- libguestlib_la_SOURCES =
- libguestlib_la_SOURCES += guestlibV3_xdr.c
-@@ -56,6 +57,7 @@ CFLAGS += -Wno-unused
- libguestlib_la_CPPFLAGS =
- libguestlib_la_CPPFLAGS += -DVMTOOLS_USE_GLIB
- libguestlib_la_CPPFLAGS += @GLIB2_CPPFLAGS@
-+libguestlib_la_CPPFLAGS += @XDR_CPPFLAGS@
- 
- EXTRA_DIST = vmguestlib.pc.in
- 
-Index: open-vm-tools/services/plugins/dndcp/Makefile.am
-===================================================================
---- open-vm-tools.orig/services/plugins/dndcp/Makefile.am
-+++ open-vm-tools/services/plugins/dndcp/Makefile.am
-@@ -1,5 +1,5 @@
- ################################################################################
--### Copyright (C) 2009-2016 VMware, Inc.  All rights reserved.
-+### Copyright (C) 2009-2018 VMware, Inc.  All rights reserved.
- ###
- ### This program is free software; you can redistribute it and/or modify
- ### it under the terms of version 2 of the GNU General Public License as
-@@ -28,6 +28,7 @@ libdndcp_la_CPPFLAGS += -I$(top_srcdir)/
- libdndcp_la_CPPFLAGS += -I$(top_srcdir)/services/plugins/dndcp/stringxx
- libdndcp_la_CPPFLAGS += -I$(top_srcdir)/services/plugins/dndcp/xutils
- libdndcp_la_CPPFLAGS += -I$(top_srcdir)/include
-+libdndcp_la_CPPFLAGS += @XDR_CPPFLAGS@
- 
- # Passing C++ related flags to CPPFLAGS generates error.
- # So, we need to pass these to C++ compilation only.
-@@ -45,6 +46,7 @@ libdndcp_la_LIBADD += @GTKMM_LIBS@
- libdndcp_la_LIBADD += @VMTOOLS_LIBS@
- libdndcp_la_LIBADD += @HGFS_LIBS@
- libdndcp_la_LIBADD += $(top_builddir)/lib/hgfsUri/hgfsUriPosix.lo
-+libdndcp_la_LIBADD += @XDR_LIBS@
- 
- libdndcp_la_SOURCES =
- 
-Index: open-vm-tools/services/plugins/guestInfo/Makefile.am
-===================================================================
---- open-vm-tools.orig/services/plugins/guestInfo/Makefile.am
-+++ open-vm-tools/services/plugins/guestInfo/Makefile.am
-@@ -1,5 +1,5 @@
- ################################################################################
--### Copyright (C) 2009-2017 VMware, Inc.  All rights reserved.
-+### Copyright (C) 2009-2018 VMware, Inc.  All rights reserved.
- ###
- ### This program is free software; you can redistribute it and/or modify
- ### it under the terms of version 2 of the GNU General Public License as
-@@ -22,6 +22,7 @@ plugin_LTLIBRARIES = libguestInfo.la
- 
- libguestInfo_la_CPPFLAGS =
- libguestInfo_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
-+libguestInfo_la_CPPFLAGS += @XDR_CPPFLAGS@
- 
- libguestInfo_la_LDFLAGS =
- libguestInfo_la_LDFLAGS += @PLUGIN_LDFLAGS@
-Index: open-vm-tools/services/plugins/resolutionKMS/resolutionKMS.c
-===================================================================
---- open-vm-tools.orig/services/plugins/resolutionKMS/resolutionKMS.c
-+++ open-vm-tools/services/plugins/resolutionKMS/resolutionKMS.c
-@@ -1,5 +1,5 @@
- /*********************************************************
-- * Copyright (C) 2008-2017 VMware, Inc. All rights reserved.
-+ * Copyright (C) 2008-2018 VMware, Inc. All rights reserved.
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms of the GNU Lesser General Public License as published
-@@ -29,16 +29,13 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- 
-+#include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
- 
- #include "vmware.h"
--#include "debug.h"
--#include "rpcout.h"
--#include "str.h"
- #include "strutil.h"
- 
--#include "xdrutil.h"
- #include "vmware/guestrpc/tclodefs.h"
- #include "vmware/tools/plugin.h"
- #include "vmware/tools/utils.h"
-Index: open-vm-tools/services/plugins/resolutionSet/resolutionSet.c
-===================================================================
---- open-vm-tools.orig/services/plugins/resolutionSet/resolutionSet.c
-+++ open-vm-tools/services/plugins/resolutionSet/resolutionSet.c
-@@ -1,5 +1,5 @@
- /*********************************************************
-- * Copyright (C) 2008-2017 VMware, Inc. All rights reserved.
-+ * Copyright (C) 2008-2018 VMware, Inc. All rights reserved.
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms of the GNU Lesser General Public License as published
-@@ -34,7 +34,6 @@
- 
- #include "resolutionInt.h"
- 
--#include "xdrutil.h"
- #include "vmware/guestrpc/tclodefs.h"
- #include "vmware/tools/plugin.h"
- #include "vmware/tools/utils.h"
-Index: open-vm-tools/services/plugins/vix/Makefile.am
-===================================================================
---- open-vm-tools.orig/services/plugins/vix/Makefile.am
-+++ open-vm-tools/services/plugins/vix/Makefile.am
-@@ -1,5 +1,5 @@
- ################################################################################
--### Copyright (C) 2009-2016 VMware, Inc.  All rights reserved.
-+### Copyright (C) 2009-2018 VMware, Inc.  All rights reserved.
- ###
- ### This program is free software; you can redistribute it and/or modify
- ### it under the terms of version 2 of the GNU General Public License as
-@@ -20,6 +20,7 @@ plugin_LTLIBRARIES = libvix.la
- 
- libvix_la_CPPFLAGS =
- libvix_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
-+libvix_la_CPPFLAGS += @XDR_CPPFLAGS@
- libvix_la_CPPFLAGS += -I$(top_srcdir)/vgauth/public
- 
- libvix_la_LDFLAGS =
-@@ -32,6 +33,7 @@ libvix_la_LIBADD += @HGFS_LIBS@
- libvix_la_LIBADD += $(top_builddir)/lib/auth/libAuth.la
- libvix_la_LIBADD += $(top_builddir)/lib/foundryMsg/libFoundryMsg.la
- libvix_la_LIBADD += $(top_builddir)/lib/impersonate/libImpersonate.la
-+libvix_la_LIBADD += @XDR_LIBS@
- if ENABLE_VGAUTH
-    libvix_la_LIBADD += $(top_builddir)/vgauth/lib/libvgauth.la
- endif
-Index: open-vm-tools/services/plugins/vix/vixTools.c
-===================================================================
---- open-vm-tools.orig/services/plugins/vix/vixTools.c
-+++ open-vm-tools/services/plugins/vix/vixTools.c
-@@ -91,7 +91,6 @@
- #include "str.h"
- #include "file.h"
- #include "err.h"
--#include "guestInfo.h"  // MAX_VALUE_LEN
- #include "hostinfo.h"
- #include "guest_os.h"
- #include "guest_msg_def.h"
-Index: open-vm-tools/services/plugins/vmbackup/Makefile.am
-===================================================================
---- open-vm-tools.orig/services/plugins/vmbackup/Makefile.am
-+++ open-vm-tools/services/plugins/vmbackup/Makefile.am
-@@ -1,5 +1,5 @@
- ################################################################################
--### Copyright (C) 2009-2017 VMware, Inc.  All rights reserved.
-+### Copyright (C) 2009-2018 VMware, Inc.  All rights reserved.
- ###
- ### This program is free software; you can redistribute it and/or modify
- ### it under the terms of version 2 of the GNU General Public License as
-@@ -20,6 +20,7 @@ plugin_LTLIBRARIES = libvmbackup.la
- 
- libvmbackup_la_CPPFLAGS =
- libvmbackup_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
-+libvmbackup_la_CPPFLAGS += @XDR_CPPFLAGS@
- 
- libvmbackup_la_LDFLAGS =
- libvmbackup_la_LDFLAGS += @PLUGIN_LDFLAGS@
-@@ -27,6 +28,7 @@ libvmbackup_la_LDFLAGS += @PLUGIN_LDFLAG
- libvmbackup_la_LIBADD =
- libvmbackup_la_LIBADD += @GOBJECT_LIBS@
- libvmbackup_la_LIBADD += @VMTOOLS_LIBS@
-+libvmbackup_la_LIBADD += @XDR_LIBS@
- 
- libvmbackup_la_SOURCES =
- libvmbackup_la_SOURCES += nullProvider.c
-Index: open-vm-tools/services/plugins/vmbackup/stateMachine.c
-===================================================================
---- open-vm-tools.orig/services/plugins/vmbackup/stateMachine.c
-+++ open-vm-tools/services/plugins/vmbackup/stateMachine.c
-@@ -35,7 +35,6 @@
- 
- #include "vmBackupInt.h"
- 
--#include "dynxdr.h"
- #include <glib-object.h>
- #include <gmodule.h>
- #include "guestApp.h"
-Index: open-vm-tools/toolbox/Makefile.am
-===================================================================
---- open-vm-tools.orig/toolbox/Makefile.am
-+++ open-vm-tools/toolbox/Makefile.am
-@@ -1,5 +1,5 @@
- ################################################################################
--### Copyright (C) 2007-2016 VMware, Inc.  All rights reserved.
-+### Copyright (C) 2007-2018 VMware, Inc.  All rights reserved.
- ###
- ### This program is free software; you can redistribute it and/or modify
- ### it under the terms of version 2 of the GNU General Public License as
-@@ -20,9 +20,11 @@ bin_PROGRAMS = vmware-toolbox-cmd
- vmware_toolbox_cmd_LDADD =
- vmware_toolbox_cmd_LDADD += ../libguestlib/libguestlib.la
- vmware_toolbox_cmd_LDADD += @VMTOOLS_LIBS@
-+vmware_toolbox_cmd_LDADD += @XDR_LIBS@
- 
- vmware_toolbox_cmd_CPPFLAGS =
- vmware_toolbox_cmd_CPPFLAGS += @VMTOOLS_CPPFLAGS@
-+vmware_toolbox_cmd_CPPFLAGS += @XDR_CPPFLAGS@
- 
- vmware_toolbox_cmd_SOURCES =
- vmware_toolbox_cmd_SOURCES += toolbox-cmd.c
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.2.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.0.bb
similarity index 92%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.2.5.bb
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.0.bb
index 820c95bbd0..478d762cfb 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.2.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.0.bb
@@ -14,7 +14,7 @@ HOMEPAGE = "https://github.com/vmware/open-vm-tools"
 SECTION = "vmware-tools"
 
 LICENSE = "LGPL-2.0 & GPL-2.0 & BSD & CDDL-1.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e5000bc3c5a39b6e66579d72cc32b45a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=559317809c5444fb39ceaf6ac45c43ac"
 LICENSE_modules/freebsd/vmblock = "BSD"
 LICENSE_modules/freebsd/vmmemctl = "GPL-2.0"
 LICENSE_modules/freebsd/vmxnet = "GPL-2.0"
@@ -27,20 +27,18 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
            file://vmtoolsd.init \
            file://0001-configure.ac-don-t-use-dnet-config.patch \
            file://0002-add-include-sys-sysmacros.h.patch \
-           file://0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch \
-           file://0004-Add-Wno-incompatible-pointer-types-and-Wno-error-add.patch \
            file://0005-Use-configure-test-for-struct-timespec.patch \
            file://0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch \
            file://0007-Use-configure-to-test-for-feature-instead-of-platfor.patch \
            file://0011-Use-configure-test-for-sys-stat.h-include.patch \
-           file://use-tirpc.patch \
            file://fix-subdir-objects-configure-error.patch \
            file://0001-include-poll.h-instead-of-sys-poll.h.patch \
            file://0002-Rename-poll.h-to-vm_poll.h.patch \
            file://0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch \
            file://0004-Use-uintmax_t-for-handling-rlim_t.patch \
+           file://0001-Use-off64_t-instead-of-__off64_t.patch \
            "
-SRCREV = "380a3d9747999e8bcbcbcd03b1402b702770db79"
+SRCREV = "2147df6aabe639fc5ff423ed791a8e7f02bf8d0a"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
-- 
2.18.0


