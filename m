Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58E6371957
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2018 02:43:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w482hreJ004361
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 May 2018 19:43:53 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 7 May 2018 19:43:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <akuster808@gmail.com>
Date: Tue, 8 May 2018 10:51:40 +0800
Message-ID: <1525747900-27423-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-gnome] meta-gnome: add libuser 0.62
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
X-List-Received-Date: Tue, 08 May 2018 02:43:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Since oe-core removed libuser, add it which required by usermode

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libuser/libuser/0001-Check-for-issetugid.patch | 62 ++++++++++++++++++++++
 ...es.c-parse_field-fix-string-formating-in-.patch | 34 ++++++++++++
 .../libuser/0002-remove-unused-execinfo.h.patch    | 27 ++++++++++
 meta-gnome/recipes-support/libuser/libuser_0.62.bb | 35 ++++++++++++
 4 files changed, 158 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libuser/libuser/0001-Check-for-issetugid.patch
 create mode 100644 meta-gnome/recipes-support/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch
 create mode 100644 meta-gnome/recipes-support/libuser/libuser/0002-remove-unused-execinfo.h.patch
 create mode 100644 meta-gnome/recipes-support/libuser/libuser_0.62.bb

diff --git a/meta-gnome/recipes-support/libuser/libuser/0001-Check-for-issetugid.patch b/meta-gnome/recipes-support/libuser/libuser/0001-Check-for-issetugid.patch
new file mode 100644
index 0000000..79756b9
--- /dev/null
+++ b/meta-gnome/recipes-support/libuser/libuser/0001-Check-for-issetugid.patch
@@ -0,0 +1,62 @@
+From d0537cb7f2dc5877700ad78dfd191515379d4edc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 02:22:51 +0000
+Subject: [PATCH 1/2] Check for issetugid()
+
+If secure version of getenv is not there then we can use
+issetugid() as aid to call getenv()
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac |  1 +
+ lib/config.c | 12 +++++++++++-
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1ded1a2..ee19e1f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -125,6 +125,7 @@ AC_TYPE_OFF_T
+ AC_TYPE_SIZE_T
+ 
+ AC_CHECK_FUNCS([__secure_getenv secure_getenv])
++AC_CHECK_FUNCS([issetugid])
+ 
+ # Modify CFLAGS after all tests are run (some of them could fail because
+ # of the -Werror).
+diff --git a/lib/config.c b/lib/config.c
+index 29e7120..30f9daf 100644
+--- a/lib/config.c
++++ b/lib/config.c
+@@ -44,8 +44,10 @@
+ #  define safe_getenv(string) secure_getenv(string)
+ #elif defined(HAVE___SECURE_GETENV)
+ #  define safe_getenv(string) __secure_getenv(string)
++#elif defined(HAVE_ISSETUGID)
++#  define safe_getenv(string) safe_getenv_issetugid(string)
+ #else
+-#  error Neither secure_getenv not __secure_getenv are available
++#  error None of secure_getenv, __secure_getenv, or issetugid is available
+ #endif
+ 
+ struct config_config {
+@@ -59,6 +61,14 @@ struct config_key {
+ 	GList *values;
+ };
+ 
++static const char*
++safe_getenv_issetugid(const char* name)
++{
++	if (issetugid ())
++		return 0;
++	return getenv (name);
++}
++
+ /* Compare two section names */
+ static int
+ compare_section_names(gconstpointer a, gconstpointer b)
+-- 
+2.7.0
+
diff --git a/meta-gnome/recipes-support/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch b/meta-gnome/recipes-support/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch
new file mode 100644
index 0000000..7c47df2
--- /dev/null
+++ b/meta-gnome/recipes-support/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch
@@ -0,0 +1,34 @@
+From a4857911ece5ebfcdef42aee4c070eb216f39597 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Fri, 13 May 2016 11:40:13 -0500
+Subject: [PATCH] modules/files.c: parse_field fix string formating in
+ g_warnings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[YOCTO #9547]
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+Upstream-Status: Pending
+---
+ modules/files.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/files.c b/modules/files.c
+index 4ef0a57..35eafc9 100644
+--- a/modules/files.c
++++ b/modules/files.c
+@@ -534,7 +534,7 @@ parse_field(const struct format_specifier *format, GValue *value,
+ 						 string, &err);
+ 	if (ret == FALSE) {
+ 		g_assert(err != NULL);
+-		g_warning(lu_strerror(err));
++		g_warning(lu_strerror(err), NULL);
+ 		lu_error_free(&err);
+ 	}
+ 	return ret;
+-- 
+2.1.4
+
diff --git a/meta-gnome/recipes-support/libuser/libuser/0002-remove-unused-execinfo.h.patch b/meta-gnome/recipes-support/libuser/libuser/0002-remove-unused-execinfo.h.patch
new file mode 100644
index 0000000..4bc0219
--- /dev/null
+++ b/meta-gnome/recipes-support/libuser/libuser/0002-remove-unused-execinfo.h.patch
@@ -0,0 +1,27 @@
+From 4b2f81f307ffeac12956e5c16e894e5ebb937ea5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 02:26:00 +0000
+Subject: [PATCH 2/2] remove unused execinfo.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ lib/error.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/lib/error.c b/lib/error.c
+index a5ec30a..443e601 100644
+--- a/lib/error.c
++++ b/lib/error.c
+@@ -18,7 +18,6 @@
+ #include <config.h>
+ #include <sys/types.h>
+ #include <errno.h>
+-#include <execinfo.h>
+ #include <libintl.h>
+ #include <stdarg.h>
+ #include <stdlib.h>
+-- 
+2.7.0
+
diff --git a/meta-gnome/recipes-support/libuser/libuser_0.62.bb b/meta-gnome/recipes-support/libuser/libuser_0.62.bb
new file mode 100644
index 0000000..7ec54eb
--- /dev/null
+++ b/meta-gnome/recipes-support/libuser/libuser_0.62.bb
@@ -0,0 +1,35 @@
+SUMMARY = "user and group account administration library"
+DESCRIPTION = "The libuser library implements a standardized interface for manipulating and administering user \
+and group accounts"
+HOMEPAGE = "https://pagure.io/libuser"
+BUGTRACKER = "https://pagure.io/libuser/issues"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://lib/user.h;endline=19;md5=76b301f63c39fa992062395efbdc9558 \
+                    file://samples/testuser.c;endline=19;md5=3b87fa660fa3f4a6bb31d624afe30ba1"
+
+SECTION = "base"
+
+SRC_URI = "https://releases.pagure.org/libuser/libuser-${PV}.tar.xz \
+           file://0001-Check-for-issetugid.patch \
+           file://0002-remove-unused-execinfo.h.patch \
+           file://0001-modules-files.c-parse_field-fix-string-formating-in-.patch \
+           "
+
+SRC_URI[md5sum] = "63e5e5c551e99dc5302b40b80bd6d4f2"
+SRC_URI[sha256sum] = "a58ff4fabb01a25043b142185a33eeea961109dd60d4b40b6a9df4fa3cace20b"
+
+DEPENDS = "popt libpam glib-2.0 python3"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
+
+inherit autotools gettext python3native python3-dir pkgconfig gtk-doc
+
+EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+
+PACKAGES += "${PN}-python "
+
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+
-- 
2.7.4


