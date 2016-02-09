Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5708773197
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 23:43:16 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id c10so1782801pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2016 15:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=mK+DZNBoy2s9FJTtA/PUlPPWD5D4JcfpaLbY09K/EMA=;
	b=efdSOKtlLeNG+jTPFhDP87Rx/ZiVGJRtrMS+Cg4qyzqB4GOBPlLK+rA/k8Rp+AWJLm
	piyNY/9aYCZjjjpMvvcHOWJOHD3iYbVE1TMwlu09ox409NHFGhidkmgecBwOpF9cSd1F
	F8/MRw1Ta6ElTOQHq+EqT/20KbI4HVKzjwqaohaVSU/EMG7mFM8Q1eiLabLCeMJygTGF
	ByrkURo4ps8oMCiUYFXugrrIW/Q33453T8GetzVufLCyZVd+CFlmwpE2kOiYZfJeZonE
	rNgEAsEWRiqPn7brXCu2C1q3Za5Cj8a8p3pUfJHvb1zNvrtfnmQKggl7+LL/gjyoL4gZ
	xnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mK+DZNBoy2s9FJTtA/PUlPPWD5D4JcfpaLbY09K/EMA=;
	b=Y6uWIu/bc+xfFxTXLPXIoX7e6Zat0zbSiWePzG/4uSuXX9r+oiN6QsG47CoGTQLDyJ
	+F9KDAEPUC5jeJJ8D465sdZx8Zpodk79mm5mj/AC7OqBOfP6U2s/+lv+nWSf7CJw+mMG
	iP8yrdJNjuM0RNI5ZAqST1ul7Pj93X2bA0gHdHe+Hq17bYbXvG6IoLDEX7Ga1Wxgx6ra
	uWhcpKIyJCxcEDi8y+YJWbX3qJUfzwJ5les9Ukn0mVpkZIt524Y579uimfib51HMOThp
	ujreKBf32m6trUJZyTaNSt3WCBF8m1Pl/U0yQnrL9dT/lLQ81Le0WeCQ/E8FiXGrS+BU
	WS+g==
X-Gm-Message-State: AG10YOQFzK1HyH/tGA3cavfVnIA4SKtDnQtoNhkvvWyCSe7WaPF/R954y3JerQKOMgsuPQ==
X-Received: by 10.98.17.92 with SMTP id z89mr54699427pfi.16.1455061396987;
	Tue, 09 Feb 2016 15:43:16 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id l14sm327601pfi.23.2016.02.09.15.43.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Feb 2016 15:43:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Feb 2016 15:43:12 -0800
Message-Id: <1455061392-28378-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] xdelta3: Package update to 3.0.11
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
X-List-Received-Date: Tue, 09 Feb 2016 23:43:16 -0000

removed two files as they got accecpted upstream
Update SRC_URI to location where this version exists

Includes security fix CVE-2014-9765
CVE-2014-9765 xdelta: buffer overflow in main_get_appheader
(fixed in 3.0.9 and after)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xdelta/files/compilation-fix.patch             | 29 ------------
 .../files/with-liblzma-configure-option.patch      | 55 ----------------------
 .../xdelta/{xdelta3_3.0.8.bb => xdelta3_3.0.11.bb} | 11 ++---
 3 files changed, 4 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xdelta/files/compilation-fix.patch
 delete mode 100644 meta-oe/recipes-support/xdelta/files/with-liblzma-configure-option.patch
 rename meta-oe/recipes-support/xdelta/{xdelta3_3.0.8.bb => xdelta3_3.0.11.bb} (60%)

diff --git a/meta-oe/recipes-support/xdelta/files/compilation-fix.patch b/meta-oe/recipes-support/xdelta/files/compilation-fix.patch
deleted file mode 100644
index 377a043..0000000
--- a/meta-oe/recipes-support/xdelta/files/compilation-fix.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Pending
-http://code.google.com/p/xdelta/issues/detail?id=174
-
-Compilation fix:
-<code>
-| testing/regtest.cc:763:3: error: no matching function for call to 'max(xoff_t, size_t&)'
-</code>
-
-Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
----
- testing/regtest.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testing/regtest.cc b/testing/regtest.cc
-index 12b712e..b63a1f9 100644
---- a/testing/regtest.cc
-+++ b/testing/regtest.cc
-@@ -12,7 +12,7 @@ public:
-     Options() : encode_srcwin_maxsz(1<<20), 
- 		block_size(Constants::BLOCK_SIZE),
- 		size_known(false) { }
--    size_t encode_srcwin_maxsz;
-+    xoff_t encode_srcwin_maxsz;
-     size_t block_size;
-     bool size_known;
-   };
--- 
-1.8.5.4
-
diff --git a/meta-oe/recipes-support/xdelta/files/with-liblzma-configure-option.patch b/meta-oe/recipes-support/xdelta/files/with-liblzma-configure-option.patch
deleted file mode 100644
index 4b99290..0000000
--- a/meta-oe/recipes-support/xdelta/files/with-liblzma-configure-option.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Pending, Submitted
-http://code.google.com/p/xdelta/issues/detail?id=178
-
-xdelta3: add --with-liblzma configure option
-
-As xdelta3 can be compiled with or without liblzma external library, make it configurable.
-Default is autodetect (unchanged behavior).
-
-Signed-off-by: Matthieu Crapet <mcrapet@gmail.com>
----
- configure.ac | 21 +++++++++++++++++++--
- 1 file changed, 19 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3b430d7..8c53ba8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -8,8 +8,6 @@ AM_INIT_AUTOMAKE([1.9 no-define foreign tar-ustar])
- AX_CHECK_ALIGNED_ACCESS_REQUIRED
- AC_PROG_CC
- AC_PROG_CXX
--AC_CHECK_HEADERS([lzma.h])
--AC_CHECK_LIB(lzma, lzma_easy_buffer_encode)
- AC_CHECK_SIZEOF(size_t)
- #AM_PATH_PYTHON(,, [:])
- #AM_CONDITIONAL([HAVE_PYTHON], [test "$PYTHON" != :])
-@@ -22,6 +20,25 @@ AC_ARG_ENABLE(debug-symbols,
-    AS_HELP_STRING(--enable-debug-symbols,[Build with debug symbols (default is NO)]),,enableval=no)
- AM_CONDITIONAL([DEBUG_SYMBOLS], [test ${enableval} = "yes"])
- 
-+AC_ARG_WITH(
-+    [liblzma],
-+    [AC_HELP_STRING(
-+        [--with-liblzma],
-+        [build with liblzma support @<:@default=autodetect@:>@])],
-+    [USE_LIBLZMA=$withval],
-+    [USE_LIBLZMA=auto])
-+
-+if test "x$USE_LIBLZMA" != xno ; then
-+    AC_CHECK_HEADERS([lzma.h],,[
-+        if test "x$with_liblzma" = xyes ; then
-+            AC_MSG_FAILURE([liblzma includes was not found])
-+        fi])
-+    AC_CHECK_LIB([lzma], [lzma_easy_buffer_encode],,[
-+        if test "x$with_liblzma" = xyes ; then
-+            AC_MSG_FAILURE([liblzma library was not found])
-+        fi])
-+fi
-+
- AC_CONFIG_HEADERS([config.h])
- AC_CONFIG_FILES([Makefile])
- AC_OUTPUT
--- 
-1.8.5.4
-
diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb b/meta-oe/recipes-support/xdelta/xdelta3_3.0.11.bb
similarity index 60%
rename from meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
rename to meta-oe/recipes-support/xdelta/xdelta3_3.0.11.bb
index baa92e4..9669d9b 100644
--- a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
+++ b/meta-oe/recipes-support/xdelta/xdelta3_3.0.11.bb
@@ -6,13 +6,10 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-
-SRC_URI = "http://xdelta.googlecode.com/files/${BPN}-${PV}.tar.xz \
-           file://compilation-fix.patch \
-           file://with-liblzma-configure-option.patch \
-"
-SRC_URI[md5sum] = "c3ae3286ce4193de8e03d5bcaccf3bc3"
-SRC_URI[sha256sum] = "3a86f29c95664fb44b8a40ff22d9bcc3e87aa8c01f0ff75931a7fa78ed3d2e55"
+SRC_URI = "https://github.com/jmacd/xdelta-devel/releases/download/v${PV}/${BPN}-${PV}.tar.gz  \
+          "
+SRC_URI[md5sum] = "445d8be2ac512113d5ca601ae8359626"
+SRC_URI[sha256sum] = "0ccc9751ceaa4d90d6b06938a4deddb481816f5d9284bd07d2e728609cb300aa"
 
 inherit autotools
 
-- 
2.3.5


