Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.25420.1605712092184269011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g3Fgh1ch;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id fw15so371724pjb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+gLP4zME1gD/g9jWnXX354PleNz0wBU1rjZbsmJnM4U=;
        b=g3Fgh1chm8bYv3H9onOshjCZN0GaWdsQEdGFByBR7Robxd2daOTUo6PzKulWC6ZWGJ
         w/Z/+/8MoOBcB5glekD7XA6tVx4Wwh8XBnEpm17594Hrrl3ci7OnZTdGjBsPPGgtMmaM
         oEzCxfP7m4yxHMBb8VNtl19OKpX3QBAFPd4fSoKRqj0OPagvFfU+mxQmsfxXTxg7nLW8
         FJdqM/RVLkikT5A/AJ/O54Mt+Ypy7pS6IYG963yHw/IHjUwy1hIFtA//Rd6SMIDVVVxn
         gl26VMTCNsbKxQymWbEJl68fysP8PlNKVd89+2DHIsh5DRMvyeVEt/6lVSCG0L6Q3R1p
         wu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+gLP4zME1gD/g9jWnXX354PleNz0wBU1rjZbsmJnM4U=;
        b=UoCM4u7w0mIbZJHhwrxZF877Ln+8n3a52A+3JuTSLGdflsliDc8Q4pL8HbwYgP/khi
         VqRXs/tAwaV4m8peSoDF0x7BfWwMOcAn/LnL4bn5kJHDhCb2DNWG9RB27YUeahiCEcCn
         iGH7dcW7XXoIPvOUGcAgQBFY+OwuVqm5QS1Uij5doqiQlTfmaz3S8D31SmPGNP4UKqdC
         Ead0zCT9MkKHXLSinnheh/U1yz4or64a/BOY0S8hnlPm3snlkOpy6j72ems+t8YW+zka
         iIZyRvUWP8z1W8iYaM1V2XOBZPIlcWjAL8zX148VKdt1pTtoZznCOqoLMLeW7vDRZFrT
         WWXA==
X-Gm-Message-State: AOAM533LbKdgwCckjkfcJd7D5o9eIy31DhRsOine7ZABcIssz/vUsRu1
	f8hGOD2YUS8IrYsNJBx/xmRvlnOGpQ0=
X-Google-Smtp-Source: ABdhPJwxNwLJKwO03/xDjh2J6BNG8oFjd2AM6MazIV2OFaTuEpbNXDplTX7Kggxm2GfPHgxL/0JX2Q==
X-Received: by 2002:a17:90b:1c0e:: with SMTP id oc14mr384077pjb.142.1605712091329;
        Wed, 18 Nov 2020 07:08:11 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:10 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/17] samba: upgrade 4.10.17 -> 4.10.18
Date: Wed, 18 Nov 2020 07:07:48 -0800
Message-Id: <9c012d9aafdd3870e5cbd5795da7749d433f9a34.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Yi Zhao <yi.zhao@windriver.com>

This is security release in order to address CVE-2020-1472
(Unauthenticated domain takeover via netlogon ("ZeroLogon")).

See: https://www.samba.org/samba/history/samba-4.10.18.html

Also remove 3 backported patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bebdea8530652ff698885a3f55b0a650de319379)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-util-Simplify-input-validation.patch | 59 --------------
 ...n-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch | 79 -------------------
 ...larger-buffer-if-getpwuid_r-returns-.patch | 50 ------------
 .../{samba_4.10.17.bb => samba_4.10.18.bb}    |  7 +-
 4 files changed, 2 insertions(+), 193 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.17.bb => samba_4.10.18.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch b/meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
deleted file mode 100644
index e724c04bcd2..00000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From f9d9ba6cd06aca053c747c399ba700db80b1623c Mon Sep 17 00:00:00 2001
-From: Martin Schwenke <martin@meltin.net>
-Date: Tue, 9 Jun 2020 11:52:50 +1000
-Subject: [PATCH 1/3] util: Simplify input validation
-
-It appears that snprintf(3) is being used for input validation.
-However, this seems like overkill because it causes szPath to be
-copied an extra time.  The mostly likely protections being sought
-here, according to https://cwe.mitre.org/data/definitions/20.html,
-look to be DoS attacks involving CPU and memory usage.  A simpler
-check that uses strnlen(3) can mitigate against both of these and is
-simpler.
-
-Signed-off-by: Martin Schwenke <martin@meltin.net>
-Reviewed-by: Volker Lendecke <vl@samba.org>
-Reviewed-by: Bjoern Jacke <bjacke@samba.org>
-(cherry picked from commit 922bce2668994dd2a5988c17060f977e9bb0c229)
-
-Upstream-Status:Backport
-[https://gitlab.com/samba-team/samba/-/commit/f9d9ba6cd06aca053c747c399ba700db80b1623c]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- lib/util/util_paths.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/lib/util/util_paths.c b/lib/util/util_paths.c
-index c0ee5c32c30..dec91772d9e 100644
---- a/lib/util/util_paths.c
-+++ b/lib/util/util_paths.c
-@@ -69,21 +69,20 @@ static char *get_user_home_dir(TALLOC_CTX *mem_ctx)
- 	struct passwd pwd = {0};
- 	struct passwd *pwdbuf = NULL;
- 	char buf[NSS_BUFLEN_PASSWD] = {0};
-+	size_t len;
- 	int rc;
- 
- 	rc = getpwuid_r(getuid(), &pwd, buf, NSS_BUFLEN_PASSWD, &pwdbuf);
- 	if (rc != 0 || pwdbuf == NULL ) {
--		int len_written;
- 		const char *szPath = getenv("HOME");
- 		if (szPath == NULL) {
- 			return NULL;
- 		}
--		len_written = snprintf(buf, sizeof(buf), "%s", szPath);
--		if (len_written >= sizeof(buf) || len_written < 0) {
--			/* Output was truncated or an error. */
-+		len = strnlen(szPath, PATH_MAX);
-+		if (len >= PATH_MAX) {
- 			return NULL;
- 		}
--		return talloc_strdup(mem_ctx, buf);
-+		return talloc_strdup(mem_ctx, szPath);
- 	}
- 
- 	return talloc_strdup(mem_ctx, pwd.pw_dir);
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch b/meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
deleted file mode 100644
index dcd79044ae9..00000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 57bd719af1f138f44f71b2078995452582da0da6 Mon Sep 17 00:00:00 2001
-From: Martin Schwenke <martin@meltin.net>
-Date: Fri, 5 Jun 2020 21:52:23 +1000
-Subject: [PATCH 2/3] util: Fix build on FreeBSD by avoiding NSS_BUFLEN_PASSWD
-
-NSS_BUFLEN_PASSWD is not defined on FreeBSD.  Use
-sysconf(_SC_GETPW_R_SIZE_MAX) instead, as per POSIX.
-
-Use a dynamically allocated buffer instead of trying to cram all of
-the logic into the declarations.  This will come in useful later
-anyway.
-
-Signed-off-by: Martin Schwenke <martin@meltin.net>
-Reviewed-by: Volker Lendecke <vl@samba.org>
-Reviewed-by: Bjoern Jacke <bjacke@samba.org>
-(cherry picked from commit 847208cd8ac68c4c7d1dae63767820db1c69292b)
-
-Upstream-Status:Backport
-[https://gitlab.com/samba-team/samba/-/commit/57bd719af1f138f44f71b2078995452582da0da6]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- lib/util/util_paths.c | 27 ++++++++++++++++++++++-----
- 1 file changed, 22 insertions(+), 5 deletions(-)
-
-diff --git a/lib/util/util_paths.c b/lib/util/util_paths.c
-index dec91772d9e..9bc6df37e5d 100644
---- a/lib/util/util_paths.c
-+++ b/lib/util/util_paths.c
-@@ -68,24 +68,41 @@ static char *get_user_home_dir(TALLOC_CTX *mem_ctx)
- {
- 	struct passwd pwd = {0};
- 	struct passwd *pwdbuf = NULL;
--	char buf[NSS_BUFLEN_PASSWD] = {0};
-+	char *buf = NULL;
-+	char *out = NULL;
-+	long int initlen;
- 	size_t len;
- 	int rc;
- 
--	rc = getpwuid_r(getuid(), &pwd, buf, NSS_BUFLEN_PASSWD, &pwdbuf);
-+	initlen = sysconf(_SC_GETPW_R_SIZE_MAX);
-+	if (initlen == -1) {
-+		len = 1024;
-+	} else {
-+		len = (size_t)initlen;
-+	}
-+	buf = talloc_size(mem_ctx, len);
-+	if (buf == NULL) {
-+		return NULL;
-+	}
-+
-+	rc = getpwuid_r(getuid(), &pwd, buf, len, &pwdbuf);
- 	if (rc != 0 || pwdbuf == NULL ) {
- 		const char *szPath = getenv("HOME");
- 		if (szPath == NULL) {
--			return NULL;
-+			goto done;
- 		}
- 		len = strnlen(szPath, PATH_MAX);
- 		if (len >= PATH_MAX) {
- 			return NULL;
- 		}
--		return talloc_strdup(mem_ctx, szPath);
-+		out = talloc_strdup(mem_ctx, szPath);
-+		goto done;
- 	}
- 
--	return talloc_strdup(mem_ctx, pwd.pw_dir);
-+	out = talloc_strdup(mem_ctx, pwd.pw_dir);
-+done:
-+	TALLOC_FREE(buf);
-+	return out;
- }
- 
- char *path_expand_tilde(TALLOC_CTX *mem_ctx, const char *d)
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch b/meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
deleted file mode 100644
index 53a3f67814a..00000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 016e08ca07f86af9e0131a908a2df116bcb9a48e Mon Sep 17 00:00:00 2001
-From: Martin Schwenke <martin@meltin.net>
-Date: Fri, 5 Jun 2020 22:05:42 +1000
-Subject: [PATCH 3/3] util: Reallocate larger buffer if getpwuid_r() returns
- ERANGE
-
-Signed-off-by: Martin Schwenke <martin@meltin.net>
-Reviewed-by: Volker Lendecke <vl@samba.org>
-Reviewed-by: Bjoern Jacke <bjacke@samba.org>
-
-Autobuild-User(master): Martin Schwenke <martins@samba.org>
-Autobuild-Date(master): Tue Jun  9 21:07:24 UTC 2020 on sn-devel-184
-
-(cherry picked from commit ddac6b2eb4adaec8fc5e25ca07387d2b9417764c)
-
-Upstream-Status:Backport
-[https://gitlab.com/samba-team/samba/-/commit/016e08ca07f86af9e0131a908a2df116bcb9a48e]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- lib/util/util_paths.c | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/lib/util/util_paths.c b/lib/util/util_paths.c
-index 9bc6df37e5d..72cc0aab8de 100644
---- a/lib/util/util_paths.c
-+++ b/lib/util/util_paths.c
-@@ -86,6 +86,19 @@ static char *get_user_home_dir(TALLOC_CTX *mem_ctx)
- 	}
- 
- 	rc = getpwuid_r(getuid(), &pwd, buf, len, &pwdbuf);
-+	while (rc == ERANGE) {
-+		size_t newlen = 2 * len;
-+		if (newlen < len) {
-+			/* Overflow */
-+			goto done;
-+		}
-+		len = newlen;
-+		buf = talloc_realloc_size(mem_ctx, buf, len);
-+		if (buf == NULL) {
-+			goto done;
-+		}
-+		rc = getpwuid_r(getuid(), &pwd, buf, len, &pwdbuf);
-+	}
- 	if (rc != 0 || pwdbuf == NULL ) {
- 		const char *szPath = getenv("HOME");
- 		if (szPath == NULL) {
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
index 3ae5afbe956..b5085c913bc 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
@@ -28,9 +28,6 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0002-util_sec.c-Move-__thread-variable-to-global-scope.patch \
            file://0001-Add-options-to-configure-the-use-of-libbsd.patch \
            file://0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch \
-           file://0001-util-Simplify-input-validation.patch \
-           file://0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch \
-           file://0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
@@ -39,8 +36,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "f69cac9ba5035ee60257520a209a0a83"
-SRC_URI[sha256sum] = "03dc9758e7bfa2faf7cdeb45b4d40997e2ee16a41e71996aa666bc069e70ba3e"
+SRC_URI[md5sum] = "f006a3d1876113e4a049015969d20fe6"
+SRC_URI[sha256sum] = "7dcfc2aaaac565b959068788e6a43fc79ce2a03e7d523f5843f7a9fddffc7c2c"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.17.1

