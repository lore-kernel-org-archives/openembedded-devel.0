Return-Path: <prvs=6867199e8=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB2F71E5A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 08:00:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,475,1520895600"; 
   d="scan'208";a="1477594"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jun 2018 10:00:45 +0200
Message-ID: <20180604080045.1153-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: dev@g0hl1n.net
Subject: [meta-oe][PATCH v2] pam-plugin-ccreds: add recipe
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
X-List-Received-Date: Mon, 04 Jun 2018 08:00:46 -0000
Content-Type: text/plain

Add version 11 of the pam-plugin-ccreds with the debian patches and a
fix for *.so symlink creation applied.

Upstreaming of these patches was requested by following pull-request:
	https://github.com/PADL/pam_ccreds/pull/1

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
Changes v2:
	+ fix [dev-so] QA Issue
	+ add note on "upstream status" in commit message
---
 ...ke-sure-we-don-t-overflow-the-data-buffer.patch | 29 +++++++
 .../0002-add-minimum_uid-option.patch              | 97 ++++++++++++++++++++++
 ...03-Set-EXTENSION_SO-for-all-linux-targets.patch | 40 +++++++++
 .../recipes-extended/pam/pam-plugin-ccreds_11.bb   | 27 ++++++
 4 files changed, 193 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch
 create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch
 create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-for-all-linux-targets.patch
 create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb

diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch
new file mode 100644
index 000000000..d7f8f5a96
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch
@@ -0,0 +1,29 @@
+From 59a95494002ce57ace17d676544101e88a55265d Mon Sep 17 00:00:00 2001
+From: Nicolas Boullis <nicolas.boullis@ecp.fr>
+Date: Mon, 23 Mar 2009 10:46:44 +0100
+Subject: [PATCH 1/3] make sure we don't overflow the data buffer
+
+This patch was taken from Debian's libpam-ccreds v10-6 source:
+	0001-make-sure-we-don-t-overflow-the-data-buffer.patch
+
+Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ cc_db.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cc_db.c b/cc_db.c
+index c0e0488..9371c4d 100644
+--- a/cc_db.c
++++ b/cc_db.c
+@@ -199,7 +199,7 @@ int pam_cc_db_get(void *_db, const char *keyname, size_t keylength,
+ 		return (rc == DB_NOTFOUND) ? PAM_AUTHINFO_UNAVAIL : PAM_SERVICE_ERR;
+ 	}
+ 
+-	if (val.size < *size) {
++	if (val.size > *size) {
+ 		return PAM_BUF_ERR;
+ 	}
+ 
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch
new file mode 100644
index 000000000..adc464924
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch
@@ -0,0 +1,97 @@
+From 21e3ab24836c5087f3531d2d3270242cea857a79 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
+Date: Thu, 13 May 2010 12:36:26 +0200
+Subject: [PATCH 2/3] add minimum_uid option
+
+Closes: #580037
+
+This patch was taken from Debian's libpam-ccreds v10-6 source:
+	0002-add-minimum_uid-option.patch
+
+Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ cc_pam.c | 39 +++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 39 insertions(+)
+
+diff --git a/cc_pam.c b/cc_pam.c
+index d096117..56776aa 100644
+--- a/cc_pam.c
++++ b/cc_pam.c
+@@ -20,6 +20,7 @@
+ #include <errno.h>
+ #include <limits.h>
+ #include <syslog.h>
++#include <pwd.h>
+ 
+ #include "cc_private.h"
+ 
+@@ -45,6 +46,30 @@ PAM_EXTERN int pam_sm_acct_mgmt(pam_handle_t *pamh,
+ 				int flags, int argc, const char **argv);
+ #endif
+ 
++
++/*
++ * Given the PAM arguments and the user we're authenticating, see if we should
++ * ignore that user because they're root or have a low-numbered UID and we
++ * were configured to ignore such users.  Returns true if we should ignore
++ * them, false otherwise.
++ */
++static int
++_pamcc_should_ignore(const char *username, int minimum_uid)
++{
++	struct passwd *pwd;
++
++	if (minimum_uid > 0) {
++		pwd = getpwnam(username);
++		if (pwd != NULL && pwd->pw_uid < (unsigned long) minimum_uid) {
++			syslog(LOG_DEBUG, "ignoring low-UID user (%lu < %d)",
++				(unsigned long) pwd->pw_uid, minimum_uid);
++			return 1;
++		}
++	}
++	return 0;
++}
++
++
+ static int _pam_sm_interact(pam_handle_t *pamh,
+ 			    int flags,
+ 			    const char **authtok)
+@@ -291,7 +316,9 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh,
+ 	unsigned int sm_flags = 0, sm_action = 0;
+ 	const char *ccredsfile = NULL;
+ 	const char *action = NULL;
++	const char *name = NULL;
+ 	int (*selector)(pam_handle_t *, int, unsigned int, const char *);
++	int minimum_uid = 0;
+ 
+ 	for (i = 0; i < argc; i++) {
+ 		if (strcmp(argv[i], "use_first_pass") == 0)
+@@ -300,6 +327,8 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh,
+ 			sm_flags |= SM_FLAGS_TRY_FIRST_PASS;
+ 		else if (strcmp(argv[i], "service_specific") == 0)
+ 			sm_flags |= SM_FLAGS_SERVICE_SPECIFIC;
++		else if (strncmp(argv[i], "minimum_uid=", sizeof("minimum_uid=") - 1) == 0)
++			minimum_uid = atoi(argv[i] + sizeof("minimum_uid=") - 1);
+ 		else if (strncmp(argv[i], "ccredsfile=", sizeof("ccredsfile=") - 1) == 0)
+ 			ccredsfile = argv[i] + sizeof("ccredsfile=") - 1;
+ 		else if (strncmp(argv[i], "action=", sizeof("action=") - 1) == 0)
+@@ -321,6 +350,16 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh,
+ 		syslog(LOG_ERR, "pam_ccreds: invalid action \"%s\"", action);
+ 	}
+ 
++	rc = pam_get_user(pamh, &name, NULL);
++	if (rc != PAM_SUCCESS || name == NULL) {
++		if (rc == PAM_CONV_AGAIN)
++			return PAM_INCOMPLETE;
++		else
++			return PAM_SERVICE_ERR;
++	}
++	if (_pamcc_should_ignore(name, minimum_uid))
++		return PAM_USER_UNKNOWN;
++
+ 	switch (sm_action) {
+ 	case SM_ACTION_VALIDATE_CCREDS:
+ 		selector = _pam_sm_validate_cached_credentials;
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-for-all-linux-targets.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-for-all-linux-targets.patch
new file mode 100644
index 000000000..988c37442
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-for-all-linux-targets.patch
@@ -0,0 +1,40 @@
+From 2b137b0364c57505a95cb498660e3b97b557540d Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Fri, 1 Jun 2018 13:24:15 +0200
+Subject: [PATCH 3/3] Set EXTENSION_SO for all linux* targets
+
+As EXTENSION_SO gets already set for linux and linux-gnu targets we
+should set it for all linux* targets. This is done by introducing a new
+"LINUX" value for the "TARGET_OS" helper variable.
+
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ configure.in | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 0dbdf79..3829d9f 100644
+--- a/configure.in
++++ b/configure.in
+@@ -35,7 +35,8 @@ hpux*) pam_ccreds_so_LD="/bin/ld"
+   TARGET_OS="HPUX" ;;
+ solaris*) pam_ccreds_so_LD="/usr/ccs/bin/ld"
+   pam_ccreds_so_LDFLAGS="-B dynamic -M \$(srcdir)/exports.solaris -G -B group -lc" ;;
+-linux*) pam_ccreds_so_LDFLAGS="-shared -Wl,-Bdynamic -Wl,--version-script,\$(srcdir)/exports.linux" ;;
++linux*) pam_ccreds_so_LDFLAGS="-shared -Wl,-Bdynamic -Wl,--version-script,\$(srcdir)/exports.linux"
++  TARGET_OS="LINUX" ;;
+ *) pam_ccreds_so_LDFLAGS="-shared" ;;
+ esac
+ 
+@@ -43,7 +44,7 @@ AC_SUBST(pam_ccreds_so_LD)
+ AC_SUBST(pam_ccreds_so_LDFLAGS)
+ 
+ AM_CONDITIONAL(USE_NATIVE_LINKER, test -n "$pam_ccreds_so_LD")
+-AM_CONDITIONAL(EXTENSION_SO, test "$target_os" = "linux" -o "$target_os" = "linux-gnu")
++AM_CONDITIONAL(EXTENSION_SO, test "$TARGET_OS" = "LINUX")
+ AM_CONDITIONAL(EXTENSION_1, test "$TARGET_OS" = "HPUX")
+ 
+ if test -z "$use_gcrypt"; then
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
new file mode 100644
index 000000000..9a21d9045
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
@@ -0,0 +1,27 @@
+SUMMARY = "PAM cached credentials module"
+HOMEPAGE = "https://www.padl.com/OSS/pam_ccreds.html"
+SECTION = "libs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "libpam openssl db"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
+
+SRCREV = "376bb189ceb3a113954f1012c45be7ff09e148ba"
+
+SRC_URI = " \
+    git://github.com/PADL/pam_ccreds \
+    file://0001-make-sure-we-don-t-overflow-the-data-buffer.patch \
+    file://0002-add-minimum_uid-option.patch \
+    file://0003-Set-EXTENSION_SO-for-all-linux-targets.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+EXTRA_OECONF += "--libdir=${base_libdir} "
+
+FILES_${PN} += "${base_libdir}/security/pam*"
-- 
2.11.0


