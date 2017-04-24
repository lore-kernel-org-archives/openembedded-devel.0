Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1563771DD9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:21 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 70so44278207ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KyTWabTFOueDChr4rB07OwCwzCNxzW2/cErZ6/CXc70=;
	b=LZsy77xwnb5HDLNzrilSnHOYmSyWfc0ZPhL0WIjQ70c9KIAz4NpVLTjrOQqb/g3aMY
	/qzH4Q4VqPP8nGDBlC9ZieCyEsl03X0Y/G4GGu1WgQLD/tO431V9SBaXJpRLUkl9th9q
	QuULmLKZccvwKunR4IZ0VRIT7maYrVEYI1O694CGDHxD//sfeZUjkk8w23EVREeAFDur
	+vpPW0aaFDBbPCqxmYR+rOwAxf/mj/qNkfJHsapQKuXafdLz1zB2b17LTjt1mOyHc1/A
	PoS9VJe4xCnesmz23rWBxJCDgM/xD3p0FiWIXk9neppOj/o9uoLMlcCPz/Ies7cHCyGC
	4Akw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KyTWabTFOueDChr4rB07OwCwzCNxzW2/cErZ6/CXc70=;
	b=QBPQA8vE8sO4AbnSNbXj25X4QfUQc9/0hEWnAByXWnFR2cOEwszvfsRFjavwq+6hEu
	vCEdLYZxpX3B8zWUKElc80MczYIGbLEqQDg6bC6AC7pynBmymm/+egEyinzV6JVuaAYe
	a5dd+4gglpw0xKklmviBV39ZzBaawgk/ZEpV2zdLY223CKTopxqktCZOavPM19c4KbO9
	7GCGW21MRrGsn4hwRzrovRCVfpgDsoHquVWL1ABejsK0L3oZxSd4EMlDd2LAyLk8Vwaf
	lhUtA4zdajcYL+xClv10YHVfG6vNdCk9iUCiw38j1KzKGk8lE4ckZalkQdnOOqZnoOFE
	o9ZQ==
X-Gm-Message-State: AN3rC/4RPGNbtcP+V59Z8KKxs78nlS44Ema+CXLnVLSqCwS4xNg6MTek
	vijaXqbOJWZrew==
X-Received: by 10.99.116.20 with SMTP id p20mr23059398pgc.74.1493011281986;
	Sun, 23 Apr 2017 22:21:21 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:47 -0700
Message-Id: <20170424052058.4952-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/17] collectd: Upgrade to 5.7.1
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:22 -0000

Drop upstreamed patches or backports
Fix build with gcc7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...replace-deprecated-readdir_r-with-readdir.patch |  66 -----------
 .../0001-conditionally-check-libvirt.patch         |  47 ++++----
 ...heck-for-Wno-error-format-truncation-comp.patch | 121 +++++++++++++++++++++
 .../collectd/0001-redefine-the-dependence.patch    |  28 -----
 .../collectd/collectd/CVE-2016-6254.patch          |  55 ----------
 .../collectd/collectd/collectd-version.patch       |  29 -----
 .../collectd/collectd/no-gcrypt-badpath.patch      |  63 ++++++-----
 .../{collectd_5.5.0.bb => collectd_5.7.1.bb}       |  11 +-
 8 files changed, 185 insertions(+), 235 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-collectd-replace-deprecated-readdir_r-with-readdir.patch
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
 delete mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-redefine-the-dependence.patch
 delete mode 100644 meta-oe/recipes-extended/collectd/collectd/CVE-2016-6254.patch
 delete mode 100644 meta-oe/recipes-extended/collectd/collectd/collectd-version.patch
 rename meta-oe/recipes-extended/collectd/{collectd_5.5.0.bb => collectd_5.7.1.bb} (91%)

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-collectd-replace-deprecated-readdir_r-with-readdir.patch b/meta-oe/recipes-extended/collectd/collectd/0001-collectd-replace-deprecated-readdir_r-with-readdir.patch
deleted file mode 100644
index f3d53f26e..000000000
--- a/meta-oe/recipes-extended/collectd/collectd/0001-collectd-replace-deprecated-readdir_r-with-readdir.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Subject: [PATCH] collectd: replace deprecated readdir_r() with readdir()
-
-* Replace the usage of readdir_r() with readdir()
-  to address a compilation error under glibc 2.24
-  due to the deprecation of readdir_r
-
-| ../../collectd-5.5.0/src/vserver.c: In function 'vserver_read':
-| ../../collectd-5.5.0/src/vserver.c:167:3: error: 'readdir_r' is deprecated [-Werror=deprecated-declarations]
-|    status = readdir_r (proc, (struct dirent *) dirent_buffer, &dent);
-|    ^~~~~~
-| In file included from /buildarea4/myu2/build/prj_test_20160722/bitbake_build/tmp/sysroots/qemux86/usr/include/features.h:368:0,
-|                  from /buildarea4/myu2/build/prj_test_20160722/bitbake_build/tmp/sysroots/qemux86/usr/include/stdio.h:27,
-|                  from ../../collectd-5.5.0/src/daemon/collectd.h:34,
-|                  from ../../collectd-5.5.0/src/vserver.c:29:
-| /buildarea4/myu2/build/prj_test_20160722/bitbake_build/tmp/sysroots/qemux86/usr/include/dirent.h:189:12: note: declared here
-|  extern int __REDIRECT (readdir_r,
-|             ^
-
-  [1]https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=7584a3f96de88d5eefe5d6c634515278cbfbf052;hp=8d9c92017d85f23ba6a2b3614b2f2bcf1820d6f0
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/vserver.c | 15 ++++-----------
- 1 file changed, 4 insertions(+), 11 deletions(-)
-
-diff --git a/src/vserver.c b/src/vserver.c
-index bd2e867..2e4e715 100644
---- a/src/vserver.c
-+++ b/src/vserver.c
-@@ -131,15 +131,8 @@ static derive_t vserver_get_sock_bytes(const char *s)
- 
- static int vserver_read (void)
- {
--#if NAME_MAX < 1024
--# define DIRENT_BUFFER_SIZE (sizeof (struct dirent) + 1024 + 1)
--#else
--# define DIRENT_BUFFER_SIZE (sizeof (struct dirent) + NAME_MAX + 1)
--#endif
--
- 	DIR 			*proc;
--	struct dirent 	*dent; /* 42 */
--	char dirent_buffer[DIRENT_BUFFER_SIZE];
-+	struct dirent 	*dent = NULL; /* 42 */
- 
- 	errno = 0;
- 	proc = opendir (PROCDIR);
-@@ -164,11 +157,11 @@ static int vserver_read (void)
- 
- 		int status;
- 
--		status = readdir_r (proc, (struct dirent *) dirent_buffer, &dent);
--		if (status != 0)
-+		dent = readdir (proc);
-+		if (dent == NULL && errno != 0)
- 		{
- 			char errbuf[4096];
--			ERROR ("vserver plugin: readdir_r failed: %s",
-+			ERROR ("vserver plugin: readdir failed: %s",
- 					sstrerror (errno, errbuf, sizeof (errbuf)));
- 			closedir (proc);
- 			return (-1);
--- 
-2.8.2
-
diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch b/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch
index d0a58041f..1ceacd8c4 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch
@@ -9,31 +9,28 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  configure.ac | 14 ++++++++------
  1 file changed, 8 insertions(+), 6 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 923498e..7206095 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4778,12 +4778,14 @@ then
- 		with_libxml2="no (pkg-config doesn't know libxml-2.0)"
- 	fi
+Index: collectd-5.7.1/configure.ac
+===================================================================
+--- collectd-5.7.1.orig/configure.ac
++++ collectd-5.7.1/configure.ac
+@@ -5556,12 +5556,14 @@ else
+ 	with_libxml2="no (pkg-config doesn't know libxml-2.0)"
+ fi
  
--	$PKG_CONFIG --exists libvirt 2>/dev/null
--	if test "$?" = "0"
--	then
--		with_libvirt="yes"
--	else
--		with_libvirt="no (pkg-config doesn't know libvirt)"
-+	if test "x$enable_libvirt" = "xyes"; then
-+		$PKG_CONFIG --exists libvirt 2>/dev/null
-+		if test "$?" = "0"
-+		then
-+			with_libvirt="yes"
-+		else
-+			with_libvirt="no (pkg-config doesn't know libvirt)"
-+		fi
- 	fi
+-$PKG_CONFIG --exists libvirt 2>/dev/null
+-if test "$?" = "0"
+-then
+-	with_libvirt="yes"
+-else
+-	with_libvirt="no (pkg-config doesn't know libvirt)"
++if test "x$enable_libvirt" = "xyes"; then
++	$PKG_CONFIG --exists libvirt 2>/dev/null
++	if test "$?" = "0"
++	then
++		with_libvirt="yes"
++	else
++		with_libvirt="no (pkg-config doesn't know libvirt)"
++	fi
  fi
  if test "x$with_libxml2" = "xyes"
--- 
-1.9.1
-
+ then
diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch b/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
new file mode 100644
index 000000000..70b0983e4
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
@@ -0,0 +1,121 @@
+From 14d469bc82c758116aef7d549abd49c131b4170f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Apr 2017 11:54:57 -0700
+Subject: [PATCH] configure: Check for -Wno-error=format-truncation compiler
+ option
+
+If this option is supported by compiler then disable it ( gcc7+)
+Fixes
+client.c:834:23: error: '%s' directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Werror=format-truncation=]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                |  3 +-
+ m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 76 insertions(+), 1 deletion(-)
+ create mode 100644 m4/ax_check_compile_flag.m4
+
+diff --git a/configure.ac b/configure.ac
+index 8854542..f3a6b57 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4,7 +4,6 @@ AC_INIT([collectd],[m4_esyscmd(./version-gen.sh)])
+ AC_CONFIG_SRCDIR(src/target_set.c)
+ AC_CONFIG_HEADERS(src/config.h)
+ AC_CONFIG_AUX_DIR([libltdl/config])
+-
+ dnl older automake's default of ARFLAGS=cru is noisy on newer binutils;
+ dnl we don't really need the 'u' even in older toolchains.  Then there is
+ dnl older libtool, which spelled it AR_FLAGS
+@@ -6688,6 +6687,8 @@ then
+         AM_CFLAGS="$AM_CFLAGS -Werror"
+         AM_CXXFLAGS="$AM_CXXFLAGS -Werror"
+ fi
++AX_CHECK_COMPILE_FLAG([-Werror=format-truncation],[AM_CFLAGS="$AM_CFLAGS -Wno-error=format-truncation" AM_CXXFLAGS="$AM_CXXFLAGS -Wno-error=format-truncation"])
++
+ AC_SUBST([AM_CFLAGS])
+ AC_SUBST([AM_CXXFLAGS])
+ 
+diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
+new file mode 100644
+index 0000000..dcabb92
+--- /dev/null
++++ b/m4/ax_check_compile_flag.m4
+@@ -0,0 +1,74 @@
++# ===========================================================================
++#  https://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_CHECK_COMPILE_FLAG(FLAG, [ACTION-SUCCESS], [ACTION-FAILURE], [EXTRA-FLAGS], [INPUT])
++#
++# DESCRIPTION
++#
++#   Check whether the given FLAG works with the current language's compiler
++#   or gives an error.  (Warnings, however, are ignored)
++#
++#   ACTION-SUCCESS/ACTION-FAILURE are shell commands to execute on
++#   success/failure.
++#
++#   If EXTRA-FLAGS is defined, it is added to the current language's default
++#   flags (e.g. CFLAGS) when the check is done.  The check is thus made with
++#   the flags: "CFLAGS EXTRA-FLAGS FLAG".  This can for example be used to
++#   force the compiler to issue an error when a bad flag is given.
++#
++#   INPUT gives an alternative input source to AC_COMPILE_IFELSE.
++#
++#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION. Please keep this
++#   macro in sync with AX_CHECK_{PREPROC,LINK}_FLAG.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
++#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
++#
++#   This program is free software: you can redistribute it and/or modify it
++#   under the terms of the GNU General Public License as published by the
++#   Free Software Foundation, either version 3 of the License, or (at your
++#   option) any later version.
++#
++#   This program is distributed in the hope that it will be useful, but
++#   WITHOUT ANY WARRANTY; without even the implied warranty of
++#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
++#   Public License for more details.
++#
++#   You should have received a copy of the GNU General Public License along
++#   with this program. If not, see <https://www.gnu.org/licenses/>.
++#
++#   As a special exception, the respective Autoconf Macro's copyright owner
++#   gives unlimited permission to copy, distribute and modify the configure
++#   scripts that are the output of Autoconf when processing the Macro. You
++#   need not follow the terms of the GNU General Public License when using
++#   or distributing such scripts, even though portions of the text of the
++#   Macro appear in them. The GNU General Public License (GPL) does govern
++#   all other use of the material that constitutes the Autoconf Macro.
++#
++#   This special exception to the GPL applies to versions of the Autoconf
++#   Macro released by the Autoconf Archive. When you make and distribute a
++#   modified version of the Autoconf Macro, you may extend this special
++#   exception to the GPL to apply to your modified version as well.
++
++#serial 5
++
++AC_DEFUN([AX_CHECK_COMPILE_FLAG],
++[AC_PREREQ(2.64)dnl for _AC_LANG_PREFIX and AS_VAR_IF
++AS_VAR_PUSHDEF([CACHEVAR],[ax_cv_check_[]_AC_LANG_ABBREV[]flags_$4_$1])dnl
++AC_CACHE_CHECK([whether _AC_LANG compiler accepts $1], CACHEVAR, [
++  ax_check_save_flags=$[]_AC_LANG_PREFIX[]FLAGS
++  _AC_LANG_PREFIX[]FLAGS="$[]_AC_LANG_PREFIX[]FLAGS $4 $1"
++  AC_COMPILE_IFELSE([m4_default([$5],[AC_LANG_PROGRAM()])],
++    [AS_VAR_SET(CACHEVAR,[yes])],
++    [AS_VAR_SET(CACHEVAR,[no])])
++  _AC_LANG_PREFIX[]FLAGS=$ax_check_save_flags])
++AS_VAR_IF(CACHEVAR,yes,
++  [m4_default([$2], :)],
++  [m4_default([$3], :)])
++AS_VAR_POPDEF([CACHEVAR])dnl
++])dnl AX_CHECK_COMPILE_FLAGS
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-redefine-the-dependence.patch b/meta-oe/recipes-extended/collectd/collectd/0001-redefine-the-dependence.patch
deleted file mode 100644
index ef6afad9b..000000000
--- a/meta-oe/recipes-extended/collectd/collectd/0001-redefine-the-dependence.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-[PATCH] define the collectd dependence
-
-Upstream-Status: Pending
-
-libavltree.la libcommon.la libheap.la are created dynamically, and in LDADD,
-but not in DEPENDENCIES
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- src/daemon/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/daemon/Makefile.am b/src/daemon/Makefile.am
-index 10860ec..7f826e3 100644
---- a/src/daemon/Makefile.am
-+++ b/src/daemon/Makefile.am
-@@ -49,7 +49,7 @@ collectd_CPPFLAGS =  $(AM_CPPFLAGS) $(LTDLINCL)
- collectd_CFLAGS = $(AM_CFLAGS)
- collectd_LDFLAGS = -export-dynamic
- collectd_LDADD = libavltree.la libcommon.la libheap.la -lm
--collectd_DEPENDENCIES =
-+collectd_DEPENDENCIES = libavltree.la libcommon.la libheap.la
- 
- # Link to these libraries..
- if BUILD_WITH_LIBRT
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-extended/collectd/collectd/CVE-2016-6254.patch b/meta-oe/recipes-extended/collectd/collectd/CVE-2016-6254.patch
deleted file mode 100644
index bc85b4c0e..000000000
--- a/meta-oe/recipes-extended/collectd/collectd/CVE-2016-6254.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From dd8483a4beb6f61521d8b32c726523bbea21cd92 Mon Sep 17 00:00:00 2001
-From: Florian Forster <octo@collectd.org>
-Date: Tue, 19 Jul 2016 10:00:37 +0200
-Subject: [PATCH] network plugin: Fix heap overflow in parse_packet().
-
-Emilien Gaspar has identified a heap overflow in parse_packet(), the
-function used by the network plugin to parse incoming network packets.
-
-This is a vulnerability in collectd, though the scope is not clear at
-this point. At the very least specially crafted network packets can be
-used to crash the daemon. We can't rule out a potential remote code
-execution though.
-
-Fixes: CVE-2016-6254
-
-cherry picked from upstream commit b589096f
-
-Upstream Status: Backport
-
-Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
----
- src/network.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/network.c b/src/network.c
-index 551bd5c..cb979b2 100644
---- a/src/network.c
-+++ b/src/network.c
-@@ -1444,6 +1444,7 @@ static int parse_packet (sockent_t *se, /* {{{ */
- 				printed_ignore_warning = 1;
- 			}
- 			buffer = ((char *) buffer) + pkg_length;
-+			buffer_size -= (size_t) pkg_length;
- 			continue;
- 		}
- #endif /* HAVE_LIBGCRYPT */
-@@ -1471,6 +1472,7 @@ static int parse_packet (sockent_t *se, /* {{{ */
- 				printed_ignore_warning = 1;
- 			}
- 			buffer = ((char *) buffer) + pkg_length;
-+			buffer_size -= (size_t) pkg_length;
- 			continue;
- 		}
- #endif /* HAVE_LIBGCRYPT */
-@@ -1612,6 +1614,7 @@ static int parse_packet (sockent_t *se, /* {{{ */
- 			DEBUG ("network plugin: parse_packet: Unknown part"
- 					" type: 0x%04hx", pkg_type);
- 			buffer = ((char *) buffer) + pkg_length;
-+			buffer_size -= (size_t) pkg_length;
- 		}
- 	} /* while (buffer_size > sizeof (part_header_t)) */
- 
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-extended/collectd/collectd/collectd-version.patch b/meta-oe/recipes-extended/collectd/collectd/collectd-version.patch
deleted file mode 100644
index 86c3f65b7..000000000
--- a/meta-oe/recipes-extended/collectd/collectd/collectd-version.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Don't pick up version string from parent git repository
-
-If the collectd source is extracted from a tarball underneath a
-directory structure that includes another git repository, that
-repository will be picked up by "git describe" which is not
-desirable. Check whether collectd itself is a git repository and just
-use the default version if not.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/version-gen.sh b/version-gen.sh
-index b09be8e..2671066 100755
---- a/version-gen.sh
-+++ b/version-gen.sh
-@@ -2,8 +2,10 @@
- 
- DEFAULT_VERSION="5.5.0.git"
- 
--VERSION="`git describe 2> /dev/null | grep collectd | sed -e 's/^collectd-//'`"
--
-+VERSION=""
-+if test -d .git ; then
-+	VERSION="`git describe 2> /dev/null | grep collectd | sed -e 's/^collectd-//'`"
-+fi
- if test -z "$VERSION"; then
- 	VERSION="$DEFAULT_VERSION"
- fi
diff --git a/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch b/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
index 0e876ae85..1fde6a071 100644
--- a/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
@@ -1,30 +1,43 @@
-Disable defaulting of GCRYPT_LDFLAGS to -L/usr/lib
-
-Prevents "unsafe for cross compilation" warnings that cause
-do_qa_configure to fail.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-Index: collectd-5.4.1/configure.ac
+Index: collectd-5.7.1/configure.ac
 ===================================================================
---- collectd-5.4.1.orig/configure.ac	2014-09-03 01:20:22.062084244 -0700
-+++ collectd-5.4.1/configure.ac	2014-09-03 01:20:22.058084244 -0700
-@@ -1867,11 +1867,11 @@
- 		GCRYPT_CPPFLAGS=`"$with_libgcrypt_config" --cflags 2>/dev/null`
- 	fi
+--- collectd-5.7.1.orig/configure.ac
++++ collectd-5.7.1/configure.ac
+@@ -2305,7 +2305,7 @@ AC_ARG_WITH(libgcrypt, [AS_HELP_STRING([
+ 	 with_libgcrypt="yes"
+  else if test -f "$withval/bin/gcrypt-config" && test -x "$withval/bin/gcrypt-config"
+  then
+-	 with_libgcrypt_config="$withval/bin/gcrypt-config"
++	 with_libgcrypt_config="$withval/bin/pkg-config"
+ 	 with_libgcrypt="yes"
+  else if test -d "$withval"
+  then
+@@ -2313,12 +2313,12 @@ AC_ARG_WITH(libgcrypt, [AS_HELP_STRING([
+ 	 GCRYPT_LDFLAGS="$GCRYPT_LDFLAGS -L$withval/lib"
+ 	 with_libgcrypt="yes"
+  else
+-	 with_libgcrypt_config="gcrypt-config"
++	 with_libgcrypt_config="pkg-config"
+ 	 with_libgcrypt="$withval"
+  fi; fi; fi
+ ],
+ [
+- with_libgcrypt_config="libgcrypt-config"
++ with_libgcrypt_config="pkg-config"
+  with_libgcrypt="yes"
+ ])
  
--	if test "x$GCRYPT_LDFLAGS" = "x"
--	then
--		gcrypt_exec_prefix=`"$with_libgcrypt_config" --exec-prefix 2>/dev/null`
--		GCRYPT_LDFLAGS="-L$gcrypt_exec_prefix/lib"
--	fi
-+#	if test "x$GCRYPT_LDFLAGS" = "x"
-+#	then
-+#		gcrypt_exec_prefix=`"$with_libgcrypt_config" --exec-prefix 2>/dev/null`
-+#		GCRYPT_LDFLAGS="-L$gcrypt_exec_prefix/lib"
-+#	fi
+@@ -2326,12 +2326,12 @@ if test "x$with_libgcrypt" = "xyes" && t
+ then
+ 	if test "x$GCRYPT_CPPFLAGS" = "x"
+ 	then
+-		GCRYPT_CPPFLAGS=`"$with_libgcrypt_config" --cflags 2>/dev/null`
++		GCRYPT_CPPFLAGS=`"$with_libgcrypt_config" --cflags libgcrypt 2>/dev/null`
+ 	fi
  
  	if test "x$GCRYPT_LIBS" = "x"
  	then
+-		GCRYPT_LIBS=`"$with_libgcrypt_config" --libs 2>/dev/null`
++		GCRYPT_LIBS=`"$with_libgcrypt_config" --lib libgcrypt 2>/dev/null`
+ 	fi
+ fi
+ 
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.7.1.bb
similarity index 91%
rename from meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
rename to meta-oe/recipes-extended/collectd/collectd_5.7.1.bb
index 59732db81..b7789c7ca 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.7.1.bb
@@ -6,18 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1bd21f19f7f0c61a7be8ecacb0e28854"
 DEPENDS = "rrdtool curl libpcap libxml2 yajl libgcrypt libtool lvm2"
 
 SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
-           file://no-gcrypt-badpath.patch \
-           file://collectd-version.patch \
-           file://0001-redefine-the-dependence.patch  \
            file://collectd.init \
            file://collectd.service \
+           file://no-gcrypt-badpath.patch \
            file://0001-conditionally-check-libvirt.patch \
-           file://0001-collectd-replace-deprecated-readdir_r-with-readdir.patch \
-           file://CVE-2016-6254.patch \
            file://0001-fix-to-build-with-glibc-2.25.patch \
+           file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
 "
-SRC_URI[md5sum] = "c39305ef5514b44238b0d31f77e29e6a"
-SRC_URI[sha256sum] = "847684cf5c10de1dc34145078af3fcf6e0d168ba98c14f1343b1062a4b569e88"
+SRC_URI[md5sum] = "dc36141ed3058c4919bbd54b87c07873"
+SRC_URI[sha256sum] = "7edd3643c0842215553b2421d5456f4e9a8a58b07e216b40a7e8e91026d8e501"
 
 inherit autotools pythonnative update-rc.d pkgconfig systemd
 
-- 
2.12.2


