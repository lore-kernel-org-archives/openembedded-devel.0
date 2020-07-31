Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.14633.1596185511723286014
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 01:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06V8p3Nq018084
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 01:51:40 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 31 Jul
 2020 01:51:17 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH V2] samba: upgrade 4.10.15 -> 4.10.17
Date: Fri, 31 Jul 2020 16:51:09 +0800
Message-ID: <20200731085109.29271-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

This is a security release in order to address the following defects:

CVE-2020-10730: NULL pointer de-reference and use-after-free in Samba AD
                DC LDAP Server with ASQ, VLV and paged_results.
CVE-2020-10745: Parsing and packing of NBT and DNS packets can consume
                excessive CPU
CVE-2020-10760: LDAP Use-after-free in Samba AD DC Global Catalog with
                paged_results and VLV.
CVE-2020-14303: Empty UDP packet DoS in Samba AD DC nbtd.

Also backport 3 patches to fix build error with musl.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-util-Simplify-input-validation.patch | 59 ++++++++++++++
 ...n-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch | 79 +++++++++++++++++++
 ...larger-buffer-if-getpwuid_r-returns-.patch | 50 ++++++++++++
 .../{samba_4.10.15.bb => samba_4.10.17.bb}    |  7 +-
 4 files changed, 193 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.15.bb => samba_4.10.17.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch b/meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
new file mode 100644
index 000000000..e724c04bc
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
@@ -0,0 +1,59 @@
+From f9d9ba6cd06aca053c747c399ba700db80b1623c Mon Sep 17 00:00:00 2001
+From: Martin Schwenke <martin@meltin.net>
+Date: Tue, 9 Jun 2020 11:52:50 +1000
+Subject: [PATCH 1/3] util: Simplify input validation
+
+It appears that snprintf(3) is being used for input validation.
+However, this seems like overkill because it causes szPath to be
+copied an extra time.  The mostly likely protections being sought
+here, according to https://cwe.mitre.org/data/definitions/20.html,
+look to be DoS attacks involving CPU and memory usage.  A simpler
+check that uses strnlen(3) can mitigate against both of these and is
+simpler.
+
+Signed-off-by: Martin Schwenke <martin@meltin.net>
+Reviewed-by: Volker Lendecke <vl@samba.org>
+Reviewed-by: Bjoern Jacke <bjacke@samba.org>
+(cherry picked from commit 922bce2668994dd2a5988c17060f977e9bb0c229)
+
+Upstream-Status:Backport
+[https://gitlab.com/samba-team/samba/-/commit/f9d9ba6cd06aca053c747c399ba700db80b1623c]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ lib/util/util_paths.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/lib/util/util_paths.c b/lib/util/util_paths.c
+index c0ee5c32c30..dec91772d9e 100644
+--- a/lib/util/util_paths.c
++++ b/lib/util/util_paths.c
+@@ -69,21 +69,20 @@ static char *get_user_home_dir(TALLOC_CTX *mem_ctx)
+ 	struct passwd pwd = {0};
+ 	struct passwd *pwdbuf = NULL;
+ 	char buf[NSS_BUFLEN_PASSWD] = {0};
++	size_t len;
+ 	int rc;
+ 
+ 	rc = getpwuid_r(getuid(), &pwd, buf, NSS_BUFLEN_PASSWD, &pwdbuf);
+ 	if (rc != 0 || pwdbuf == NULL ) {
+-		int len_written;
+ 		const char *szPath = getenv("HOME");
+ 		if (szPath == NULL) {
+ 			return NULL;
+ 		}
+-		len_written = snprintf(buf, sizeof(buf), "%s", szPath);
+-		if (len_written >= sizeof(buf) || len_written < 0) {
+-			/* Output was truncated or an error. */
++		len = strnlen(szPath, PATH_MAX);
++		if (len >= PATH_MAX) {
+ 			return NULL;
+ 		}
+-		return talloc_strdup(mem_ctx, buf);
++		return talloc_strdup(mem_ctx, szPath);
+ 	}
+ 
+ 	return talloc_strdup(mem_ctx, pwd.pw_dir);
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch b/meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
new file mode 100644
index 000000000..dcd79044a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
@@ -0,0 +1,79 @@
+From 57bd719af1f138f44f71b2078995452582da0da6 Mon Sep 17 00:00:00 2001
+From: Martin Schwenke <martin@meltin.net>
+Date: Fri, 5 Jun 2020 21:52:23 +1000
+Subject: [PATCH 2/3] util: Fix build on FreeBSD by avoiding NSS_BUFLEN_PASSWD
+
+NSS_BUFLEN_PASSWD is not defined on FreeBSD.  Use
+sysconf(_SC_GETPW_R_SIZE_MAX) instead, as per POSIX.
+
+Use a dynamically allocated buffer instead of trying to cram all of
+the logic into the declarations.  This will come in useful later
+anyway.
+
+Signed-off-by: Martin Schwenke <martin@meltin.net>
+Reviewed-by: Volker Lendecke <vl@samba.org>
+Reviewed-by: Bjoern Jacke <bjacke@samba.org>
+(cherry picked from commit 847208cd8ac68c4c7d1dae63767820db1c69292b)
+
+Upstream-Status:Backport
+[https://gitlab.com/samba-team/samba/-/commit/57bd719af1f138f44f71b2078995452582da0da6]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ lib/util/util_paths.c | 27 ++++++++++++++++++++++-----
+ 1 file changed, 22 insertions(+), 5 deletions(-)
+
+diff --git a/lib/util/util_paths.c b/lib/util/util_paths.c
+index dec91772d9e..9bc6df37e5d 100644
+--- a/lib/util/util_paths.c
++++ b/lib/util/util_paths.c
+@@ -68,24 +68,41 @@ static char *get_user_home_dir(TALLOC_CTX *mem_ctx)
+ {
+ 	struct passwd pwd = {0};
+ 	struct passwd *pwdbuf = NULL;
+-	char buf[NSS_BUFLEN_PASSWD] = {0};
++	char *buf = NULL;
++	char *out = NULL;
++	long int initlen;
+ 	size_t len;
+ 	int rc;
+ 
+-	rc = getpwuid_r(getuid(), &pwd, buf, NSS_BUFLEN_PASSWD, &pwdbuf);
++	initlen = sysconf(_SC_GETPW_R_SIZE_MAX);
++	if (initlen == -1) {
++		len = 1024;
++	} else {
++		len = (size_t)initlen;
++	}
++	buf = talloc_size(mem_ctx, len);
++	if (buf == NULL) {
++		return NULL;
++	}
++
++	rc = getpwuid_r(getuid(), &pwd, buf, len, &pwdbuf);
+ 	if (rc != 0 || pwdbuf == NULL ) {
+ 		const char *szPath = getenv("HOME");
+ 		if (szPath == NULL) {
+-			return NULL;
++			goto done;
+ 		}
+ 		len = strnlen(szPath, PATH_MAX);
+ 		if (len >= PATH_MAX) {
+ 			return NULL;
+ 		}
+-		return talloc_strdup(mem_ctx, szPath);
++		out = talloc_strdup(mem_ctx, szPath);
++		goto done;
+ 	}
+ 
+-	return talloc_strdup(mem_ctx, pwd.pw_dir);
++	out = talloc_strdup(mem_ctx, pwd.pw_dir);
++done:
++	TALLOC_FREE(buf);
++	return out;
+ }
+ 
+ char *path_expand_tilde(TALLOC_CTX *mem_ctx, const char *d)
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch b/meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
new file mode 100644
index 000000000..53a3f6781
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
@@ -0,0 +1,50 @@
+From 016e08ca07f86af9e0131a908a2df116bcb9a48e Mon Sep 17 00:00:00 2001
+From: Martin Schwenke <martin@meltin.net>
+Date: Fri, 5 Jun 2020 22:05:42 +1000
+Subject: [PATCH 3/3] util: Reallocate larger buffer if getpwuid_r() returns
+ ERANGE
+
+Signed-off-by: Martin Schwenke <martin@meltin.net>
+Reviewed-by: Volker Lendecke <vl@samba.org>
+Reviewed-by: Bjoern Jacke <bjacke@samba.org>
+
+Autobuild-User(master): Martin Schwenke <martins@samba.org>
+Autobuild-Date(master): Tue Jun  9 21:07:24 UTC 2020 on sn-devel-184
+
+(cherry picked from commit ddac6b2eb4adaec8fc5e25ca07387d2b9417764c)
+
+Upstream-Status:Backport
+[https://gitlab.com/samba-team/samba/-/commit/016e08ca07f86af9e0131a908a2df116bcb9a48e]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ lib/util/util_paths.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/lib/util/util_paths.c b/lib/util/util_paths.c
+index 9bc6df37e5d..72cc0aab8de 100644
+--- a/lib/util/util_paths.c
++++ b/lib/util/util_paths.c
+@@ -86,6 +86,19 @@ static char *get_user_home_dir(TALLOC_CTX *mem_ctx)
+ 	}
+ 
+ 	rc = getpwuid_r(getuid(), &pwd, buf, len, &pwdbuf);
++	while (rc == ERANGE) {
++		size_t newlen = 2 * len;
++		if (newlen < len) {
++			/* Overflow */
++			goto done;
++		}
++		len = newlen;
++		buf = talloc_realloc_size(mem_ctx, buf, len);
++		if (buf == NULL) {
++			goto done;
++		}
++		rc = getpwuid_r(getuid(), &pwd, buf, len, &pwdbuf);
++	}
+ 	if (rc != 0 || pwdbuf == NULL ) {
+ 		const char *szPath = getenv("HOME");
+ 		if (szPath == NULL) {
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
index 01250cb43..3ae5afbe9 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
@@ -28,6 +28,9 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0002-util_sec.c-Move-__thread-variable-to-global-scope.patch \
            file://0001-Add-options-to-configure-the-use-of-libbsd.patch \
            file://0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch \
+           file://0001-util-Simplify-input-validation.patch \
+           file://0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch \
+           file://0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
@@ -36,8 +39,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "67e9f6b8c5140475641bf5121c93b3d4"
-SRC_URI[sha256sum] = "0b8b62558b62fbb121015f28f40fae0f07522710b6bef77c508b51bb6914ced9"
+SRC_URI[md5sum] = "f69cac9ba5035ee60257520a209a0a83"
+SRC_URI[sha256sum] = "03dc9758e7bfa2faf7cdeb45b4d40997e2ee16a41e71996aa666bc069e70ba3e"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.17.1

