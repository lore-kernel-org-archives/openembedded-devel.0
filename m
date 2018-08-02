Return-Path: <prvs=7451dbc88=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 069FE78DF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 08:44:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,434,1526335200"; 
   d="scan'208";a="1586621"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Aug 2018 10:45:06 +0200
Message-ID: <20180802084506.2992-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-oe][PATCH] pam-plugin-ccreds: remove local patches
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
X-List-Received-Date: Thu, 02 Aug 2018 08:44:55 -0000
Content-Type: text/plain

As our patches were merged upstream [1]  we can savely remove them and
use the new upstream revision.

[1] https://github.com/PADL/pam_ccreds/pull/1

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 ...ke-sure-we-don-t-overflow-the-data-buffer.patch | 29 -------
 .../0002-add-minimum_uid-option.patch              | 97 ----------------------
 ...03-Set-EXTENSION_SO-for-all-linux-targets.patch | 40 ---------
 .../recipes-extended/pam/pam-plugin-ccreds_11.bb   | 11 +--
 4 files changed, 3 insertions(+), 174 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch
 delete mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch
 delete mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-for-all-linux-targets.patch

diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch
deleted file mode 100644
index d7f8f5a96..000000000
--- a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 59a95494002ce57ace17d676544101e88a55265d Mon Sep 17 00:00:00 2001
-From: Nicolas Boullis <nicolas.boullis@ecp.fr>
-Date: Mon, 23 Mar 2009 10:46:44 +0100
-Subject: [PATCH 1/3] make sure we don't overflow the data buffer
-
-This patch was taken from Debian's libpam-ccreds v10-6 source:
-	0001-make-sure-we-don-t-overflow-the-data-buffer.patch
-
-Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
----
- cc_db.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cc_db.c b/cc_db.c
-index c0e0488..9371c4d 100644
---- a/cc_db.c
-+++ b/cc_db.c
-@@ -199,7 +199,7 @@ int pam_cc_db_get(void *_db, const char *keyname, size_t keylength,
- 		return (rc == DB_NOTFOUND) ? PAM_AUTHINFO_UNAVAIL : PAM_SERVICE_ERR;
- 	}
- 
--	if (val.size < *size) {
-+	if (val.size > *size) {
- 		return PAM_BUF_ERR;
- 	}
- 
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch
deleted file mode 100644
index adc464924..000000000
--- a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 21e3ab24836c5087f3531d2d3270242cea857a79 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
-Date: Thu, 13 May 2010 12:36:26 +0200
-Subject: [PATCH 2/3] add minimum_uid option
-
-Closes: #580037
-
-This patch was taken from Debian's libpam-ccreds v10-6 source:
-	0002-add-minimum_uid-option.patch
-
-Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
----
- cc_pam.c | 39 +++++++++++++++++++++++++++++++++++++++
- 1 file changed, 39 insertions(+)
-
-diff --git a/cc_pam.c b/cc_pam.c
-index d096117..56776aa 100644
---- a/cc_pam.c
-+++ b/cc_pam.c
-@@ -20,6 +20,7 @@
- #include <errno.h>
- #include <limits.h>
- #include <syslog.h>
-+#include <pwd.h>
- 
- #include "cc_private.h"
- 
-@@ -45,6 +46,30 @@ PAM_EXTERN int pam_sm_acct_mgmt(pam_handle_t *pamh,
- 				int flags, int argc, const char **argv);
- #endif
- 
-+
-+/*
-+ * Given the PAM arguments and the user we're authenticating, see if we should
-+ * ignore that user because they're root or have a low-numbered UID and we
-+ * were configured to ignore such users.  Returns true if we should ignore
-+ * them, false otherwise.
-+ */
-+static int
-+_pamcc_should_ignore(const char *username, int minimum_uid)
-+{
-+	struct passwd *pwd;
-+
-+	if (minimum_uid > 0) {
-+		pwd = getpwnam(username);
-+		if (pwd != NULL && pwd->pw_uid < (unsigned long) minimum_uid) {
-+			syslog(LOG_DEBUG, "ignoring low-UID user (%lu < %d)",
-+				(unsigned long) pwd->pw_uid, minimum_uid);
-+			return 1;
-+		}
-+	}
-+	return 0;
-+}
-+
-+
- static int _pam_sm_interact(pam_handle_t *pamh,
- 			    int flags,
- 			    const char **authtok)
-@@ -291,7 +316,9 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh,
- 	unsigned int sm_flags = 0, sm_action = 0;
- 	const char *ccredsfile = NULL;
- 	const char *action = NULL;
-+	const char *name = NULL;
- 	int (*selector)(pam_handle_t *, int, unsigned int, const char *);
-+	int minimum_uid = 0;
- 
- 	for (i = 0; i < argc; i++) {
- 		if (strcmp(argv[i], "use_first_pass") == 0)
-@@ -300,6 +327,8 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh,
- 			sm_flags |= SM_FLAGS_TRY_FIRST_PASS;
- 		else if (strcmp(argv[i], "service_specific") == 0)
- 			sm_flags |= SM_FLAGS_SERVICE_SPECIFIC;
-+		else if (strncmp(argv[i], "minimum_uid=", sizeof("minimum_uid=") - 1) == 0)
-+			minimum_uid = atoi(argv[i] + sizeof("minimum_uid=") - 1);
- 		else if (strncmp(argv[i], "ccredsfile=", sizeof("ccredsfile=") - 1) == 0)
- 			ccredsfile = argv[i] + sizeof("ccredsfile=") - 1;
- 		else if (strncmp(argv[i], "action=", sizeof("action=") - 1) == 0)
-@@ -321,6 +350,16 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh,
- 		syslog(LOG_ERR, "pam_ccreds: invalid action \"%s\"", action);
- 	}
- 
-+	rc = pam_get_user(pamh, &name, NULL);
-+	if (rc != PAM_SUCCESS || name == NULL) {
-+		if (rc == PAM_CONV_AGAIN)
-+			return PAM_INCOMPLETE;
-+		else
-+			return PAM_SERVICE_ERR;
-+	}
-+	if (_pamcc_should_ignore(name, minimum_uid))
-+		return PAM_USER_UNKNOWN;
-+
- 	switch (sm_action) {
- 	case SM_ACTION_VALIDATE_CCREDS:
- 		selector = _pam_sm_validate_cached_credentials;
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-for-all-linux-targets.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-for-all-linux-targets.patch
deleted file mode 100644
index 988c37442..000000000
--- a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-for-all-linux-targets.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 2b137b0364c57505a95cb498660e3b97b557540d Mon Sep 17 00:00:00 2001
-From: Richard Leitner <richard.leitner@skidata.com>
-Date: Fri, 1 Jun 2018 13:24:15 +0200
-Subject: [PATCH 3/3] Set EXTENSION_SO for all linux* targets
-
-As EXTENSION_SO gets already set for linux and linux-gnu targets we
-should set it for all linux* targets. This is done by introducing a new
-"LINUX" value for the "TARGET_OS" helper variable.
-
-Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
----
- configure.in | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 0dbdf79..3829d9f 100644
---- a/configure.in
-+++ b/configure.in
-@@ -35,7 +35,8 @@ hpux*) pam_ccreds_so_LD="/bin/ld"
-   TARGET_OS="HPUX" ;;
- solaris*) pam_ccreds_so_LD="/usr/ccs/bin/ld"
-   pam_ccreds_so_LDFLAGS="-B dynamic -M \$(srcdir)/exports.solaris -G -B group -lc" ;;
--linux*) pam_ccreds_so_LDFLAGS="-shared -Wl,-Bdynamic -Wl,--version-script,\$(srcdir)/exports.linux" ;;
-+linux*) pam_ccreds_so_LDFLAGS="-shared -Wl,-Bdynamic -Wl,--version-script,\$(srcdir)/exports.linux"
-+  TARGET_OS="LINUX" ;;
- *) pam_ccreds_so_LDFLAGS="-shared" ;;
- esac
- 
-@@ -43,7 +44,7 @@ AC_SUBST(pam_ccreds_so_LD)
- AC_SUBST(pam_ccreds_so_LDFLAGS)
- 
- AM_CONDITIONAL(USE_NATIVE_LINKER, test -n "$pam_ccreds_so_LD")
--AM_CONDITIONAL(EXTENSION_SO, test "$target_os" = "linux" -o "$target_os" = "linux-gnu")
-+AM_CONDITIONAL(EXTENSION_SO, test "$TARGET_OS" = "LINUX")
- AM_CONDITIONAL(EXTENSION_1, test "$TARGET_OS" = "HPUX")
- 
- if test -z "$use_gcrypt"; then
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
index 9a21d9045..95d879dc6 100644
--- a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
@@ -9,14 +9,9 @@ DEPENDS = "libpam openssl db"
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRCREV = "376bb189ceb3a113954f1012c45be7ff09e148ba"
-
-SRC_URI = " \
-    git://github.com/PADL/pam_ccreds \
-    file://0001-make-sure-we-don-t-overflow-the-data-buffer.patch \
-    file://0002-add-minimum_uid-option.patch \
-    file://0003-Set-EXTENSION_SO-for-all-linux-targets.patch \
-"
+SRCREV = "e2145df09469bf84878e4729b4ecd814efb797d1"
+
+SRC_URI = "git://github.com/PADL/pam_ccreds"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


