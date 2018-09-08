Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8704171C9B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 07:11:35 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s17-v6so7530771plp.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Sep 2018 00:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=brHDaFK+FDxXHhPaV1QYJMbU/l3xS12CfIIiYkXBnDY=;
	b=htqLBFr7JCEbR5ESPqOiHfw9W5LEF5LbP/gPT167zXWmuFqoyLqMCYW4V1Hptnh7mv
	OBGM6tAmr0qjpMRGLUR6SajYaZD+PPmCIIxJY7TTockRiNhgykluxt9FP+GKRlHSTDq+
	prxM5YUg79hY7Ccy2Atmms1NwNmF+vMF2nDyKEB5VBckXRTrdLYcSNQRBMBitfUXYKKV
	WFtJaXFx8hIfJlCCk/beeFGf6te7nTco7aQ0dE3ZFOfWK3Vqy8SbS18ZDEAA8GzX5/OK
	ywiU/RyOUPaZHaXT7/lx+Z0FtttXXkHuw2a00LRqPY3rW5K8oC7TvZadh+7HsZC7HCkW
	WyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=brHDaFK+FDxXHhPaV1QYJMbU/l3xS12CfIIiYkXBnDY=;
	b=UCNl/ekLM6p5xwjUxIcgD5na4vLxpsFae9l81FRffrr12DM8qkQ9eKMRMmSmb6EAYq
	KbFr0vsbYWorqHzO9cySKwkwDyG6pNGObHp9b/BYrvMv1+4RmkErdyN5GH5agAFcO/C3
	OTgdqojZTc8JiWVy6hmM3TkZP255DI4PFYz/jmeEV5uWXi/xRPKolCgWR0tHPaGKe7Gj
	PAhygxBLYeJ9jGgzqrRHELBYejjFXWiNe0m8gtUbVDf+mM9oERgR7RQ/xWU2t6wFkHBI
	XIC8vC6JCmer98bKqENXs5ZyEY3bMnEql3U2giz0bRRhOJXC3Nfr/OoTT4iXcquiXy5/
	LzKA==
X-Gm-Message-State: APzg51Cu1anRbiQMp+b6+AvUj0PR2lJ6kQG07jV7mS6HmJ9wyYkIyJNs
	okraxlWNDwKPHp0tqQlvi3upRzZ9
X-Google-Smtp-Source: ANB0VdaSvwv9Huj/lbR4FSbjBFO2+4ScRYVwR8zsBzeLtVdnHeZcRXStIc+7uZajmnj16LdDMV+MqA==
X-Received: by 2002:a17:902:c7:: with SMTP id
	a65-v6mr11523105pla.264.1536390695755; 
	Sat, 08 Sep 2018 00:11:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	a15-v6sm18702212pfe.32.2018.09.08.00.11.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Sep 2018 00:11:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Sep 2018 00:11:21 -0700
Message-Id: <20180908071125.28282-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-networking][PATCH 1/5] openhpi: Upgrade to 3.8.0
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
X-List-Received-Date: Sat, 08 Sep 2018 07:11:35 -0000

* Add patches to fix build with OpenSSL 1.1.x
* Forward patches and drop ones not needed anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-poke-at-build-host-s-etc-os-release.patch | 27 +++++
 .../0001-Fix-build-failures-with-gcc7.patch   | 49 ----------
 .../0001-ipmidirect-Replace-__STRING.patch    | 31 ------
 ...r-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch | 47 ---------
 .../recipes-daemons/openhpi/files/c++11.patch | 24 +++--
 .../openhpi/files/clang-c++11.patch           | 17 +---
 .../openhpi/files/cross_899198.patch          | 98 +++++++++++++++++++
 .../openhpi/files/no-md2.patch                | 37 +++++++
 .../openhpi/files/openhpi-3.6.1-ssl.patch     | 20 ++++
 .../files/openhpi-hpi-shell-thread-fix.patch  | 29 ------
 .../files/openhpi-libxml2-cross-compile.patch | 23 +++--
 .../files/openhpi-netsnmp-cross-compile.patch | 25 +++--
 ...-serial-tests-config-needed-by-ptest.patch | 19 ++--
 .../{openhpi_3.6.1.bb => openhpi_3.8.0.bb}    | 18 ++--
 14 files changed, 249 insertions(+), 215 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/0001-Do-not-poke-at-build-host-s-etc-os-release.patch
 delete mode 100644 meta-networking/recipes-daemons/openhpi/files/0001-Fix-build-failures-with-gcc7.patch
 delete mode 100644 meta-networking/recipes-daemons/openhpi/files/0001-ipmidirect-Replace-__STRING.patch
 delete mode 100644 meta-networking/recipes-daemons/openhpi/files/0001-plugins-Check-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/cross_899198.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/no-md2.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch
 delete mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch
 rename meta-networking/recipes-daemons/openhpi/{openhpi_3.6.1.bb => openhpi_3.8.0.bb} (91%)

diff --git a/meta-networking/recipes-daemons/openhpi/files/0001-Do-not-poke-at-build-host-s-etc-os-release.patch b/meta-networking/recipes-daemons/openhpi/files/0001-Do-not-poke-at-build-host-s-etc-os-release.patch
new file mode 100644
index 0000000000..ab9b25fed0
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/0001-Do-not-poke-at-build-host-s-etc-os-release.patch
@@ -0,0 +1,27 @@
+From 2bc5c6367a7f70ca5bff177ec95bcad3b1c2b66b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 6 Sep 2018 18:15:10 -0700
+Subject: [PATCH] Do not poke at build host's /etc/os-release
+
+During cross compile we are interested in target distro and not host
+distro therefore do not check for it.
+
+Upstream-Status: Inappropriate [Cross compile specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: openhpi-3.8.0/configure.ac
+===================================================================
+--- openhpi-3.8.0.orig/configure.ac
++++ openhpi-3.8.0/configure.ac
+@@ -194,7 +194,6 @@ AC_SUBST(JSON_C_LIB)
+ AC_SUBST(JSON_C_INCLUDE)
+ AC_CHECK_LIB([rabbitmq],[amqp_new_connection],[RABBITMQ_LIB=-lrabbitmq],[RABBITMQ_LIB=])
+ AC_SUBST(RABBITMQ_LIB)
+-AC_CHECK_FILE([/etc/os-release],[DISTRO=`grep "^ID=" /etc/os-release | awk -F"\"" '{ print $2 }'`])
+ 
+ AC_CHECK_HEADERS([amqp.h],[have_rabbitmq=yes],[have_rabbitmq=no])
+ 
diff --git a/meta-networking/recipes-daemons/openhpi/files/0001-Fix-build-failures-with-gcc7.patch b/meta-networking/recipes-daemons/openhpi/files/0001-Fix-build-failures-with-gcc7.patch
deleted file mode 100644
index 4f493f7b8f..0000000000
--- a/meta-networking/recipes-daemons/openhpi/files/0001-Fix-build-failures-with-gcc7.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 398c6db66c643ed6133cc2b028ab1e27a17c5295 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 1 May 2017 19:10:09 +0000
-Subject: [PATCH] Fix build failures with gcc7
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- plugins/ipmidirect/ipmi_mc_vendor.cpp | 2 +-
- plugins/ipmidirect/ipmi_resource.cpp  | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/plugins/ipmidirect/ipmi_mc_vendor.cpp b/plugins/ipmidirect/ipmi_mc_vendor.cpp
-index 2c6c090..557771c 100644
---- a/plugins/ipmidirect/ipmi_mc_vendor.cpp
-+++ b/plugins/ipmidirect/ipmi_mc_vendor.cpp
-@@ -322,7 +322,7 @@ cIpmiMcVendor::CreateResources( cIpmiDomain *domain, cIpmiMc *source_mc, cIpmiSd
-       if ( addr.m_channel != source_mc->GetChannel() ) 
-           stdlog << "WARNING : SDR channel " << addr.m_channel << " NOT equal to MC channel " << source_mc->GetChannel() << "\n";
- 
--       if ( FindOrCreateResource( domain, source_mc, fru_id, sdr, sdrs ) == false ) {
-+       if ( !FindOrCreateResource( domain, source_mc, fru_id, sdr, sdrs ) ) {
- 	    return false;
- 	}
-      }
-diff --git a/plugins/ipmidirect/ipmi_resource.cpp b/plugins/ipmidirect/ipmi_resource.cpp
-index c438e74..2552673 100644
---- a/plugins/ipmidirect/ipmi_resource.cpp
-+++ b/plugins/ipmidirect/ipmi_resource.cpp
-@@ -73,7 +73,7 @@ cIpmiResource::SendCommandReadLock( const cIpmiMsg &msg, cIpmiMsg &rsp,
- 
-   domain->ReadLock();
- 
--  if ( domain->VerifyResource( resource ) == false )
-+  if ( !domain->VerifyResource( resource ) )
-        return SA_ERR_HPI_NOT_PRESENT;
- 
-   return rv;
-@@ -91,7 +91,7 @@ cIpmiResource::SendCommandReadLock( cIpmiRdr *rdr, const cIpmiMsg &msg, cIpmiMsg
-   
-   domain->ReadLock();
-   
--  if ( domain->VerifyRdr( rdr ) == false )
-+  if ( !domain->VerifyRdr( rdr ) )
-        return SA_ERR_HPI_NOT_PRESENT;
- 
-   return rv;
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/openhpi/files/0001-ipmidirect-Replace-__STRING.patch b/meta-networking/recipes-daemons/openhpi/files/0001-ipmidirect-Replace-__STRING.patch
deleted file mode 100644
index 4d56f6535c..0000000000
--- a/meta-networking/recipes-daemons/openhpi/files/0001-ipmidirect-Replace-__STRING.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From be40b3f11460cf495bbbef45692e7763afda0c2b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 14 Sep 2017 17:56:31 -0700
-Subject: [PATCH] ipmidirect: Replace __STRING
-
-__STRING is not universally available e.g.
-musl does not define it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- plugins/ipmidirect/t/test.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/plugins/ipmidirect/t/test.h b/plugins/ipmidirect/t/test.h
-index 8d71381..978d5ff 100644
---- a/plugins/ipmidirect/t/test.h
-+++ b/plugins/ipmidirect/t/test.h
-@@ -22,7 +22,7 @@ TestFunction( const char *str, const char *file, int line, bool expr )
- }
- 
- 
--#define Test(expr) TestFunction( __STRING(expr), __FILE__, __LINE__, expr )
-+#define Test(expr) TestFunction( #expr, __FILE__, __LINE__, expr )
- 
- 
- static int
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-daemons/openhpi/files/0001-plugins-Check-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch b/meta-networking/recipes-daemons/openhpi/files/0001-plugins-Check-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch
deleted file mode 100644
index 0f033ac855..0000000000
--- a/meta-networking/recipes-daemons/openhpi/files/0001-plugins-Check-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From be665d9513cca7e8b64c79ae424cf44ac166b052 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 14 Sep 2017 17:07:58 -0700
-Subject: [PATCH] plugins: Check for PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
- before use
-
-musl does not define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
-so we can not assume that all Linux systems support PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
-its a glibc specific define so check for it being defined before using it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- plugins/dynamic_simulator/thread.cpp | 2 +-
- plugins/ipmidirect/thread.cpp        | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/plugins/dynamic_simulator/thread.cpp b/plugins/dynamic_simulator/thread.cpp
-index d663be0..9210fd7 100644
---- a/plugins/dynamic_simulator/thread.cpp
-+++ b/plugins/dynamic_simulator/thread.cpp
-@@ -229,7 +229,7 @@ cThread::Exit( void *rv )
- /**
-  * Constructor
-  **/
--#if ( defined(__sun) && defined(__SVR4) ) || defined(__FreeBSD__)
-+#ifndef PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
- cThreadLock::cThreadLock()
- {
-   pthread_mutexattr_t attr;
-diff --git a/plugins/ipmidirect/thread.cpp b/plugins/ipmidirect/thread.cpp
-index 5c52557..48e83fa 100644
---- a/plugins/ipmidirect/thread.cpp
-+++ b/plugins/ipmidirect/thread.cpp
-@@ -167,7 +167,7 @@ cThread::Exit( void *rv )
- //                  cThreadLock
- //////////////////////////////////////////////////
- 
--#if ( defined(__sun) && defined(__SVR4) ) || defined(__FreeBSD__)
-+#ifndef PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
- cThreadLock::cThreadLock()
- {
-   pthread_mutexattr_t attr;
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-daemons/openhpi/files/c++11.patch b/meta-networking/recipes-daemons/openhpi/files/c++11.patch
index 0549d59777..5eff86b4d5 100644
--- a/meta-networking/recipes-daemons/openhpi/files/c++11.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/c++11.patch
@@ -1,11 +1,21 @@
-Index: openhpi-3.6.1/configure.ac
-===================================================================
---- openhpi-3.6.1.orig/configure.ac
-+++ openhpi-3.6.1/configure.ac
-@@ -44,6 +44,7 @@ AC_PROG_CPP
- AC_PROG_INSTALL
- AC_PROG_LN_S
+From ed51168dfd6844deeaebf7d5f6c65898aafb6299 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 27 Aug 2017 12:12:04 -0700
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index c29a31f..f7fe0f7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -46,6 +46,7 @@ AC_PROG_LN_S
  AC_PROG_MAKE_SET
+ AC_PROG_AWK
+ AC_PROG_GREP
 +AX_CXX_COMPILE_STDCXX_11([noext],[mandatory])
  
  enabled_non32bit="no"
diff --git a/meta-networking/recipes-daemons/openhpi/files/clang-c++11.patch b/meta-networking/recipes-daemons/openhpi/files/clang-c++11.patch
index 9b35a0cced..7958a07c67 100644
--- a/meta-networking/recipes-daemons/openhpi/files/clang-c++11.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/clang-c++11.patch
@@ -1,3 +1,7 @@
+Support build with Clang
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Index: openhpi-3.6.1/plugins/dynamic_simulator/new_sim.cpp
 ===================================================================
 --- openhpi-3.6.1.orig/plugins/dynamic_simulator/new_sim.cpp
@@ -1273,16 +1277,3 @@ Index: openhpi-3.6.1/plugins/ipmidirect/ipmi.cpp
  
  static SaErrorT
  IpmiResetWatchdog(void *hnd,
-Index: openhpi-3.6.1/plugins/ipmidirect/ipmi_auth.h
-===================================================================
---- openhpi-3.6.1.orig/plugins/ipmidirect/ipmi_auth.h
-+++ openhpi-3.6.1/plugins/ipmidirect/ipmi_auth.h
-@@ -32,7 +32,7 @@ class cIpmiAuthSg
- {
- public:
-   void *data; /* NULL to terminate. */
--  int   len;
-+  unsigned int   len;
- };
- 
- 
diff --git a/meta-networking/recipes-daemons/openhpi/files/cross_899198.patch b/meta-networking/recipes-daemons/openhpi/files/cross_899198.patch
new file mode 100644
index 0000000000..3161140df9
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/cross_899198.patch
@@ -0,0 +1,98 @@
+From: Helmut Grohne <helmut@subdivi.de>
+Subject: fix cross compilation
+
+The OH_SET_SIZES macro relies on the usual autoconf sizeof cache variables
+during cross compilation, but it never ensure that they are initialized.
+
+pkg-config must be called with $ac_tool_prefix and PKG_PROG_PKG_CONFIG takes
+care of that. Setting PKG_CONFIG_PATH breaks the pkg-config-cross-wrapper.
+Don't do that.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: openhpi-3.8.0/acinclude.m4
+===================================================================
+--- openhpi-3.8.0.orig/acinclude.m4
++++ openhpi-3.8.0/acinclude.m4
+@@ -22,30 +22,39 @@ AC_DEFUN([OH_SET_SIZES],
+ 
+     if test "x$cross_compiling" != "xno"; then
+         if test "x$OH_SIZEOF_UCHAR" = x; then
++	    AC_CHECK_SIZEOF([unsigned char])
+             OH_SIZEOF_UCHAR=$ac_cv_sizeof_uchar
+         fi
+         if test "x$OH_SIZEOF_USHORT" = x; then
++	    AC_CHECK_SIZEOF([unsigned short])
+             OH_SIZEOF_USHORT=$ac_cv_sizeof_ushort
+         fi
+         if test "x$OH_SIZEOF_UINT" = x; then
++	    AC_CHECK_SIZEOF([unsigned int])
+             OH_SIZEOF_UINT=$ac_cv_sizeof_uint
+         fi
+         if test "x$OH_SIZEOF_CHAR" = x; then
++	    AC_CHECK_SIZEOF([char])
+             OH_SIZEOF_CHAR=$ac_cv_sizeof_char
+         fi
+         if test "x$OH_SIZEOF_SHORT" = x; then
++	    AC_CHECK_SIZEOF([short])
+             OH_SIZEOF_SHORT=$ac_cv_sizeof_short
+         fi
+         if test "x$OH_SIZEOF_INT" = x; then
++	    AC_CHECK_SIZEOF([int])
+             OH_SIZEOF_INT=$ac_cv_sizeof_int
+         fi
+         if test "x$OH_SIZEOF_LLONG" = x; then
++	    AC_CHECK_SIZEOF([long long])
+             OH_SIZEOF_LLONG=$ac_cv_sizeof_longlong
+         fi
+         if test "x$OH_SIZEOF_FLOAT" = x; then
++	    AC_CHECK_SIZEOF([float])
+             OH_SIZEOF_FLOAT=$ac_cv_sizeof_float
+         fi
+         if test "x$OH_SIZEOF_DOUBLE" = x; then
++	    AC_CHECK_SIZEOF([double])
+             OH_SIZEOF_DOUBLE=$ac_cv_sizeof_double
+         fi
+     else
+Index: openhpi-3.8.0/configure.ac
+===================================================================
+--- openhpi-3.8.0.orig/configure.ac
++++ openhpi-3.8.0/configure.ac
+@@ -87,9 +87,9 @@ have_rtas_lib=no
+ 
+ dnl Check for GLIB
+ 
+-AC_CHECK_PROG([found_pkg_config],[pkg-config],[yes])
++PKG_PROG_PKG_CONFIG
+ 
+-if test "x$found_pkg_config" != "xyes"; then
++if test "x$PKG_CONFIG" = "x"; then
+     OH_CHECK_FAIL(pkg-config,pkg-config)
+ fi
+ PKG_CFG_SETPATH
+@@ -105,7 +105,7 @@ GLIB=glib-2.0
+ GTHREAD=gthread-2.0
+ GMODULE=gmodule-2.0
+ 
+-if pkg-config --atleast-version $GLIB_REQUIRED_VERSION $GLIB; then
++if $PKG_CONFIG --atleast-version $GLIB_REQUIRED_VERSION $GLIB; then
+    :
+ else
+    AC_MSG_ERROR([
+@@ -268,12 +268,12 @@ dnl
+ dnl We really need to make ipmi enablement be contigent on OpenIPMI
+ dnl
+ 
+-if PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig pkg-config --atleast-version 1.4.20 OpenIPMI; then
++if $PKG_CONFIG --atleast-version 1.4.20 OpenIPMI; then
+     have_openipmi=yes
+     AC_CHECK_LIB([OpenIPMI], [ipmi_smi_setup_con], [have_openipmi=yes])
+-    OPENIPMI_CFLAGS=`PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig pkg-config --cflags OpenIPMI`
++    OPENIPMI_CFLAGS=`$PKG_CONFIG --cflags OpenIPMI`
+     AC_SUBST(OPENIPMI_CFLAGS)
+-    OPENIPMI_LIBS=`PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig pkg-config --libs OpenIPMI`
++    OPENIPMI_LIBS=`$PKG_CONFIG --libs OpenIPMI`
+     AC_SUBST(OPENIPMI_LIBS)
+ fi
+ 
diff --git a/meta-networking/recipes-daemons/openhpi/files/no-md2.patch b/meta-networking/recipes-daemons/openhpi/files/no-md2.patch
new file mode 100644
index 0000000000..c4dd23e790
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/no-md2.patch
@@ -0,0 +1,37 @@
+Description: Fix FTBFS with OpenSSL 1.1 by honouring OPENSSL_NO_MD2
+Author: Adrian Bunk <bunk@debian.org>
+Bug-Debian: https://bugs.debian.org/859543
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: openhpi-3.8.0/plugins/ipmidirect/ipmi_auth.cpp
+===================================================================
+--- openhpi-3.8.0.orig/plugins/ipmidirect/ipmi_auth.cpp
++++ openhpi-3.8.0/plugins/ipmidirect/ipmi_auth.cpp
+@@ -21,6 +21,7 @@
+ #include "ipmi_auth.h"
+ #include <string.h>
+ #include <errno.h>
++#include <openssl/opensslconf.h>
+ 
+ 
+ cIpmiAuth *
+@@ -32,7 +33,7 @@ IpmiAuthFactory( tIpmiAuthType type )
+             return new cIpmiAuthNone;
+ 
+        case eIpmiAuthTypeMd2:
+-#ifdef HAVE_OPENSSL_MD2_H
++#if defined(HAVE_OPENSSL_MD2_H) && !defined(OPENSSL_NO_MD2)
+             return new cIpmiAuthMd2;
+ #else
+             break;
+@@ -78,7 +79,7 @@ cIpmiAuthNone::Check( cIpmiAuthSg /*d*/[
+ }
+ 
+ 
+-#ifdef HAVE_OPENSSL_MD2_H
++#if defined(HAVE_OPENSSL_MD2_H) && !defined(OPENSSL_NO_MD2)
+ #include <openssl/md2.h>
+ 
+ 
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch
new file mode 100644
index 0000000000..ca522bcc67
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch
@@ -0,0 +1,20 @@
+Link with libssl
+
+fixed build with openssl-1.1.x
+
+Taken from Fedora
+https://src.fedoraproject.org/rpms/openhpi/c/be77f5484b0206f8946a85b29424ea10bf863063
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Unknown
+
+diff -up openhpi-3.6.1/ssl/Makefile.am.than openhpi-3.6.1/ssl/Makefile.am
+--- openhpi-3.6.1/ssl/Makefile.am.than	2017-02-21 12:21:12.114814698 -0500
++++ openhpi-3.6.1/ssl/Makefile.am	2017-02-21 12:22:44.576454262 -0500
+@@ -19,5 +19,5 @@ lib_LTLIBRARIES		= libopenhpi_ssl.la
+ libopenhpi_ssl_la_SOURCES = oh_ssl.c oh_ssl.h
+ 
+ libopenhpi_ssl_la_LDFLAGS = -version-info @HPI_LIB_VERSION@
+-libopenhpi_ssl_la_LIBADD  = @CRYPTO_LIB@
++libopenhpi_ssl_la_LIBADD  = -lssl @CRYPTO_LIB@
+ 
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch
deleted file mode 100644
index cc21ff8c79..0000000000
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-commit e9f9a73c9dba8dd59f3d6c3acd9988ec8361d55a
-Author: Aws Ismail <aws.ismail@windriver.com>
-Date:   Mon Dec 17 16:23:45 2012 -0500
-
-    Correct dangling g_thread_exit in session.c
-    
-    hpi_shell's session.c has its progress_bar
-    thread created using pthread_create but
-    exited using g_thread_exit. Use pthread_exit
-    instead to avoid unpredictable GLIB thread
-    errors.
-    
-    Upstream-Status: Pending
-    
-    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
-
-Index: openhpi-3.6.1/hpi_shell/session.c
-===================================================================
---- openhpi-3.6.1.orig/hpi_shell/session.c
-+++ openhpi-3.6.1/hpi_shell/session.c
-@@ -73,7 +73,7 @@ static void* progress_bar(void *unused)
- 		if (i < (PROGRESS_BUF_SIZE - mes_len - 1)) i++;
- 		t++;
- 	};
--        g_thread_exit(0);
-+        pthread_exit(0);
- 	return (void *)1;
- }
- 
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch
index c848b35027..160eeede69 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch
@@ -1,4 +1,7 @@
-Fix libxml2 for cross-compiling
+From afe545e77f9d841b7777d859e7e8108492fece96 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 26 Apr 2017 16:22:00 +0800
+Subject: [PATCH] Fix libxml2 for cross-compiling
 
 Use proper XML2_INCLUDE path when cross-compiling
 
@@ -6,16 +9,20 @@ Upstream-Status: Pending
 
 Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
 
-Index: openhpi-3.6.1/configure.ac
-===================================================================
---- openhpi-3.6.1.orig/configure.ac
-+++ openhpi-3.6.1/configure.ac
-@@ -177,7 +177,7 @@ AC_CHECK_HEADERS([openssl/md2.h openssl/
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6242cbf..4fb6b69 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -179,7 +179,7 @@ AC_CHECK_HEADERS([openssl/md2.h openssl/md5.h openssl/bio.h openssl/ssl.h openss
  
  dnl xml is used for XML-based communication in ilo2_ribcl and oa_soap
  AC_CHECK_LIB([xml2],[xmlParseMemory],[XML2_LIB=-lxml2],[XML2_LIB=])
--AC_CHECK_HEADERS([libxml2/libxml/xmlexports.h],[XML2_INCLUDE="-I/usr/include/libxml2"],[XML2_INCLUDE])
-+AC_CHECK_HEADERS([libxml2/libxml/xmlexports.h],[XML2_INCLUDE="$XML2_INCLUDE"],[XML2_INCLUDE])
+-AC_CHECK_HEADERS([libxml2/libxml/xmlexports.h],[XML2_INCLUDE="-I/usr/include/libxml2"],[XML2_INCLUDE=])
++AC_CHECK_HEADERS([libxml2/libxml/xmlexports.h],[XML2_INCLUDE="$XML2_INCLUDE"],[XML2_INCLUDE=])
  AC_SUBST(XML2_LIB)
  AC_SUBST(XML2_INCLUDE)
  
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-netsnmp-cross-compile.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-netsnmp-cross-compile.patch
index 95b0abc913..293c8d91f5 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-netsnmp-cross-compile.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-netsnmp-cross-compile.patch
@@ -13,36 +13,33 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
  configure    | 4 ++--
  2 files changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/acinclude.m4 b/acinclude.m4
-index 82c33f6..727e461 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
+Index: openhpi-3.8.0/acinclude.m4
+===================================================================
+--- openhpi-3.8.0.orig/acinclude.m4
++++ openhpi-3.8.0/acinclude.m4
 @@ -160,8 +160,8 @@ AC_DEFUN([OH_CHECK_NETSNMP],
      ],
      [
          have_netsnmp=yes
--        SNMPFLAGS=`${net_snmp_config:-net-snmp-config} --cflags | perl -p -e 's/-O\S*//g'`
+-        SNMPFLAGS=`${net_snmp_config:-net-snmp-config} --cflags | perl -p -e 's/ -O\S*//g'`
 -        SNMPLIBS=`${net_snmp_config:-net-snmp-config} --libs`
 +        SNMPFLAGS=""
 +        SNMPLIBS=""
          AC_MSG_RESULT(yes)
      ],
      [AC_MSG_RESULT(no.  No SNMP based plugins can be built!)])
-diff --git a/configure b/configure
-index 00067bc..36b913c 100755
---- a/configure
-+++ b/configure
-@@ -15949,8 +15949,8 @@ _ACEOF
+Index: openhpi-3.8.0/configure
+===================================================================
+--- openhpi-3.8.0.orig/configure
++++ openhpi-3.8.0/configure
+@@ -16062,8 +16062,8 @@ _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
          have_netsnmp=yes
--        SNMPFLAGS=`${net_snmp_config:-net-snmp-config} --cflags | perl -p -e 's/-O\S*//g'`
+-        SNMPFLAGS=`${net_snmp_config:-net-snmp-config} --cflags | perl -p -e 's/ -O\S*//g'`
 -        SNMPLIBS=`${net_snmp_config:-net-snmp-config} --libs`
 +        SNMPFLAGS=""
 +        SNMPLIBS=""
          { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
  $as_echo "yes" >&6; }
  
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch
index 3e09180d4d..472318b808 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch
@@ -1,4 +1,4 @@
-From 36fbaa27e7299f63c1324b0ad22b970e9365d6a7 Mon Sep 17 00:00:00 2001
+From 5e0ae172586f5aeb270a8f9b012dd3e36536a2a9 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 24 Dec 2014 10:54:59 +0800
 Subject: [PATCH] openhpi: use serial-tests config needed by ptest
@@ -9,17 +9,18 @@ serial-tests is required to generate those targets.
 Upstream-Status: Inappropriate [default automake behavior incompatible with ptest]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
- configure.ac |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: openhpi-3.6.1/configure.ac
-===================================================================
---- openhpi-3.6.1.orig/configure.ac
-+++ openhpi-3.6.1/configure.ac
-@@ -7,7 +7,7 @@ dnl   various hacks by Sean Dague <http:
+diff --git a/configure.ac b/configure.ac
+index 89d8104..c29a31f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -7,7 +7,7 @@ dnl   various hacks by Sean Dague <http://dague.net/sean> 4/23/03
  AC_PREREQ(2.57)
- AC_INIT(openhpi, 3.6.1)
+ AC_INIT(openhpi, 3.8.0)
  AC_CONFIG_SRCDIR(openhpi.spec.in)
 -AM_INIT_AUTOMAKE([1.8])
 +AM_INIT_AUTOMAKE([1.8 serial-tests])
diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
similarity index 91%
rename from meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
rename to meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index 596578e118..741b04cdd2 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -20,7 +20,8 @@ SECTION = "net"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e3c772a32386888ccb5ae1c0ba95f1a4"
 
-DEPENDS = "net-snmp libxml2 ncurses openssl glib-2.0 popt e2fsprogs autoconf-archive-native"
+DEPENDS = "net-snmp libxml2 ncurses openssl glib-2.0 popt e2fsprogs \
+           autoconf-archive-native os-release"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://openhpi.init \
@@ -32,23 +33,22 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://openhpi-glib-cross-compile.patch \
            file://openhpi-linkfix.patch \
            file://openhpi-fix-host-gcc.patch \
-           file://openhpi-hpi-shell-thread-fix.patch \
            file://openhpi-fix-testfail-errors.patch \
            file://openhpi-add-libnetsnmp-when-link.patch \
            file://openhpi-invalide-session.patch \
            file://openhpi-use-serial-tests-config-needed-by-ptest.patch \
            file://openhpi-fix-alignment-issue.patch \
-           file://0001-Fix-build-failures-with-gcc7.patch \
            file://c++11.patch \
            file://clang-c++11.patch \
            file://fix-narrowing-warning.patch \
-           file://0001-plugins-Check-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch \
-           file://0001-ipmidirect-Replace-__STRING.patch \
            file://0001-session-close-socket.patch \
+           file://openhpi-3.6.1-ssl.patch \
+           file://0001-Do-not-poke-at-build-host-s-etc-os-release.patch \
+           file://cross_899198.patch \
+           file://no-md2.patch \
            "
-
-SRC_URI[md5sum] = "4718b16e0f749b5ad214a9b04f45dd23"
-SRC_URI[sha256sum] = "e0a810cb401c4bdcfc9551f2e6afd5a8ca4b411f5ee3bc60c19f82fd6e84a3dc"
+SRC_URI[md5sum] = "fffda3deea8a0d3671a72eea9d13a4df"
+SRC_URI[sha256sum] = "c94332a29160dd75cb799c027e614690c00263b0fabed87417707bec04c38723"
 
 inherit autotools pkgconfig ptest update-rc.d systemd
 
@@ -64,6 +64,8 @@ PACKAGECONFIG[sysfs] = "--enable-sysfs,--disable-sysfs,sysfsutils,"
 PACKAGECONFIG[libgcrypt] = "--enable-encryption,--disable-encryption,libgcrypt,"
 PACKAGECONFIG[non32bit] = "--enable-non32bit-int,--disable-non32bit-int,,"
 
+export DISTRO
+
 do_install_append () {
     install -m 0755 -d ${D}${sysconfdir}/${BPN}
     install -m 0755 ${S}/openhpiclient.conf.example ${D}${sysconfdir}/${BPN}/openhpiclient.conf
-- 
2.18.0


