Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (unknown [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 19BCB601A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 10:00:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,1034,1389740400"; d="scan'208";a="51049462"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 12 May 2014 12:00:51 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Mon, 12 May 2014 12:00:51 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Mon, 12 May 2014 12:00:51 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 May 2014 12:00:59 +0200
Message-ID: <1399888859-13112-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <CAMKF1srcr7c8ExfZkmo3b-VUMMPsZKT77N3ygqKVK_HwxXkC+w@mail.gmail.com>
References: <CAMKF1srcr7c8ExfZkmo3b-VUMMPsZKT77N3ygqKVK_HwxXkC+w@mail.gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] xdelta3: add optional lzma support
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
X-List-Received-Date: Mon, 12 May 2014 10:00:59 -0000
Content-Type: text/plain

Using PACKAGECONFIG. Disabled by default.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../files/with-liblzma-configure-option.patch      | 55 ++++++++++++++++++++++
 meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb    |  8 +++-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/xdelta/files/with-liblzma-configure-option.patch

diff --git a/meta-oe/recipes-support/xdelta/files/with-liblzma-configure-option.patch b/meta-oe/recipes-support/xdelta/files/with-liblzma-configure-option.patch
new file mode 100644
index 0000000..4b99290
--- /dev/null
+++ b/meta-oe/recipes-support/xdelta/files/with-liblzma-configure-option.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Pending, Submitted
+http://code.google.com/p/xdelta/issues/detail?id=178
+
+xdelta3: add --with-liblzma configure option
+
+As xdelta3 can be compiled with or without liblzma external library, make it configurable.
+Default is autodetect (unchanged behavior).
+
+Signed-off-by: Matthieu Crapet <mcrapet@gmail.com>
+---
+ configure.ac | 21 +++++++++++++++++++--
+ 1 file changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3b430d7..8c53ba8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -8,8 +8,6 @@ AM_INIT_AUTOMAKE([1.9 no-define foreign tar-ustar])
+ AX_CHECK_ALIGNED_ACCESS_REQUIRED
+ AC_PROG_CC
+ AC_PROG_CXX
+-AC_CHECK_HEADERS([lzma.h])
+-AC_CHECK_LIB(lzma, lzma_easy_buffer_encode)
+ AC_CHECK_SIZEOF(size_t)
+ #AM_PATH_PYTHON(,, [:])
+ #AM_CONDITIONAL([HAVE_PYTHON], [test "$PYTHON" != :])
+@@ -22,6 +20,25 @@ AC_ARG_ENABLE(debug-symbols,
+    AS_HELP_STRING(--enable-debug-symbols,[Build with debug symbols (default is NO)]),,enableval=no)
+ AM_CONDITIONAL([DEBUG_SYMBOLS], [test ${enableval} = "yes"])
+ 
++AC_ARG_WITH(
++    [liblzma],
++    [AC_HELP_STRING(
++        [--with-liblzma],
++        [build with liblzma support @<:@default=autodetect@:>@])],
++    [USE_LIBLZMA=$withval],
++    [USE_LIBLZMA=auto])
++
++if test "x$USE_LIBLZMA" != xno ; then
++    AC_CHECK_HEADERS([lzma.h],,[
++        if test "x$with_liblzma" = xyes ; then
++            AC_MSG_FAILURE([liblzma includes was not found])
++        fi])
++    AC_CHECK_LIB([lzma], [lzma_easy_buffer_encode],,[
++        if test "x$with_liblzma" = xyes ; then
++            AC_MSG_FAILURE([liblzma library was not found])
++        fi])
++fi
++
+ AC_CONFIG_HEADERS([config.h])
+ AC_CONFIG_FILES([Makefile])
+ AC_OUTPUT
+-- 
+1.8.5.4
+
diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
index 16a72ee..6160c81 100644
--- a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
+++ b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
@@ -8,8 +8,14 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://xdelta.googlecode.com/files/${BPN}-${PV}.tar.xz \
-           file://compilation-fix.patch"
+           file://compilation-fix.patch \
+           file://with-liblzma-configure-option.patch \
+"
 SRC_URI[md5sum] = "c3ae3286ce4193de8e03d5bcaccf3bc3"
 SRC_URI[sha256sum] = "3a86f29c95664fb44b8a40ff22d9bcc3e87aa8c01f0ff75931a7fa78ed3d2e55"
 
 inherit autotools
+
+# Optional secondary compression
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lzma] = "--with-liblzma,--without-liblzma,xz"
-- 
1.8.5.4


