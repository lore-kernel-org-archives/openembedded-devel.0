Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 47C3A6002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 07:57:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0M7v5vM005700
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 23:57:05 -0800 (PST)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 21 Jan 2014 23:57:04 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Jan 2014 15:57:01 +0800
Message-ID: <1390377421-27374-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] samba: add PACKAGECONFIG for libunwind
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2014 07:57:04 -0000
Content-Type: text/plain

Also add --enable-libunwind option for samba source3, otherwise, it will
be auto-detected from sysroot, which will lead implicit results.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 .../samba/samba-3.6.8/configure-libunwind.patch    |   82 ++++++++++++++++++++
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |    4 +
 2 files changed, 86 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.8/configure-libunwind.patch

diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/configure-libunwind.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.8/configure-libunwind.patch
new file mode 100644
index 0000000..9a2cb00
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba-3.6.8/configure-libunwind.patch
@@ -0,0 +1,82 @@
+samba: add --enable-libunwind option
+
+Upstream-Status: Pending
+
+This let the end user explicitly enable/disable libunwind support.
+---
+ configure |   28 ++++++++++++++++++++++++++--
+ 1 file changed, 26 insertions(+), 2 deletions(-)
+
+diff -urpN a/source3/configure b/source3/configure
+--- a/source3/configure
++++ b/source3/configure
+@@ -1007,6 +1007,7 @@ with_included_iniparser
+ with_static_modules
+ with_shared_modules
+ enable_dmalloc
++enable_libunwind
+ '
+       ac_precious_vars='build_alias
+ host_alias
+@@ -1670,6 +1671,7 @@ Optional Features:
+   --enable-avahi          Enable Avahi support (default=auto)
+   --enable-pthreadpool    Enable pthreads pool helper support (default=no)
+   --enable-dmalloc        Enable heap debugging [default=no]
++  --enable-libunwind      Enable libunwind support if available (default=no)
+ 
+ Optional Packages:
+   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
+@@ -16458,7 +16460,7 @@ done
+ 
+ 
+ # Find a method of generating a stack trace
+-for ac_header in execinfo.h libexc.h libunwind.h
++for ac_header in execinfo.h libexc.h
+ do :
+   as_ac_Header=`$as_echo "ac_cv_header_$ac_header" | $as_tr_sh`
+ ac_fn_c_check_header_mongrel "$LINENO" "$ac_header" "$as_ac_Header" "$ac_includes_default"
+@@ -16684,6 +16686,13 @@ fi
+ 
+ LIBS="$save_LIBS"
+ 
++# Check whether --enable-libunwind was given.
++if test "${enable_libunwind+set}" = set; then :
++  enableval=$enable_libunwind;
++fi
++
++if test "x$enable_libunwind" != xno
++then
+ # Note that all the libunwind symbols in the API are defined to internal
+ # platform-specific version, so we must include libunwind.h before checking
+ # any of them.
+@@ -16691,6 +16700,21 @@ LIBS="$save_LIBS"
+ $as_echo_n "checking for libunwind... " >&6; }
+ save_LIBS=$LIBS
+ 
++# Check for libunwind.h present
++for ac_header in libunwind.h
++do :
++  as_ac_Header=`$as_echo "ac_cv_header_$ac_header" | $as_tr_sh`
++ac_fn_c_check_header_mongrel "$LINENO" "$ac_header" "$as_ac_Header" "$ac_includes_default"
++eval as_val=\$$as_ac_Header
++   if test "x$as_val" = x""yes; then :
++  cat >>confdefs.h <<_ACEOF
++#define `$as_echo "HAVE_$ac_header" | $as_tr_cpp` 1
++_ACEOF
++
++fi
++
++done
++
+ UNWIND_ARCH="unknown"
+ if test x"$UNAME_I" != x"unknown"; then
+ 	UNWIND_ARCH="$UNAME_I"
+@@ -16877,7 +16901,7 @@ fi
+ rm -f core conftest.err conftest.$ac_objext \
+     conftest$ac_exeext conftest.$ac_ext
+ fi
+-
++fi
+ 
+ 
+ for ac_func in _dup _dup2 _opendir _readdir _seekdir _telldir _closedir
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index 255c0b4..20b609d 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -29,12 +29,16 @@ SRC_URI += "\
     file://only_export_public_symbols.patch;patchdir=.. \
     file://configure-disable-getaddrinfo-cross.patch;patchdir=.. \
     file://configure-disable-core_pattern-cross-check.patch;patchdir=.. \
+    file://configure-libunwind.patch;patchdir=.. \
 "
 SRC_URI[md5sum] = "fbb245863eeef2fffe172df779a217be"
 SRC_URI[sha256sum] = "4f5a171a8d902c6b4f822ed875c51eb8339196d9ccf0ecd7f6521c966b3514de"
 
 S = "${WORKDIR}/samba-${PV}/source3"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
+
 EXTRA_OECONF += "\
     ac_cv_path_PYTHON=/not/exist \
     ac_cv_path_PYTHON_CONFIG=/not/exist \
-- 
1.7.1


