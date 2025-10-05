Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7376DCAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 10:50:39 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.8354.1759661430937601673
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 03:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fuOxj+kR;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-637e2b86240so6596534a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759661429; x=1760266229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BH/vL3WQH7pRIFIjBs3MjQXA2lvK/OOtg30s3Kv/j7w=;
        b=fuOxj+kR/TzFVj8axK3nsaZ4waKJJfDJcNoXvTNV39zbgSgOGZ7vADZ9nN+xXl9W71
         3yryJXP4rXx+A824iKQnlcRWF8HR39f7auGcgaTMlCJMfFY43/ljJuJaqGNa/IwBO7iw
         09iCbVGEN8d0wKDXWq9Lp+6DzvCIq/ZEYlMVJuQaYebxU4Q2Rg3fO48OHzIcc/tC3a0q
         RwXJrkAzbsnVV7HUxHd87McxYpuCjvvmYbThfj6Hq6b8owVylxPG8Pd++O0Ew1OLgANm
         WdysJGlxq1837eubFmGuE+/6WE81tHVrMdPiNFvqBHOS+TtnE8iWq/+HVzZ5DkfZ48R5
         ULMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759661429; x=1760266229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BH/vL3WQH7pRIFIjBs3MjQXA2lvK/OOtg30s3Kv/j7w=;
        b=IAhX0KYaWuTtcbPm+qiDMSsSicBPb9Jl3B0+YpwVn7J1ezfHj6ytvdkVcmI1buQPLL
         Zxxn5h6YOXl1D3XMJV/SaB/5totw5/uEjQ7ohBbKIzyPErf1re6rq56IXZ6nlsrsTlOM
         HsflpxX+crO11vutF2s6+sJjlXN0cb0fKz6lsON68k2S1hx0QqfI7caIFFMbaxYFWZHl
         C+OOt6M8FZUssclijYCSBaKMqEaQTyumj2U+Ooc+y+oTWWcwlMTlFQ9pGS5X9MAzkWOO
         n5zFWVgzKbHpO2BR5aYePEOOmFK1lOGxD4jMuRIFiOXKf2yb/0Obb88+Een8LdR5G5tF
         HbYA==
X-Gm-Message-State: AOJu0Yw0eNfynpkbjCjQmgQmkIiBo2HmjTUDlT0oj+EMOj75aF8jzoWg
	hzdiyq9XIeXAxkKDFscWHTpmBowez28vyi2vtJCb5LKN+GjSHBeOUABmhyg0kg==
X-Gm-Gg: ASbGnctLU1q9KgcDKAxD8483Jo/grtPaHK7xo5BO1atXz6rscBqjzs8l+g+5DHR1vuI
	6zgUze2moOp81CdfsS+WVFqvROK3Rb1fArWDKVvwOoW59mo3EILVNv3lFKAGX59WTRIoX0s8WK2
	dyekVolakJB7wEGlSLDeg+n7QWLLZs2+Eh1GJjEOgGrNBC6oXnwHn6JHXW6daqTMa53sHcdmCXE
	2UrvP/HvAvJ7xzUY2z2DbqWFkiE9U8lv6OChYBuSu/f0/XxyvbMdQslsJ6u9e54od2QmczC/fjy
	aNKJKEzljT63cLUp1oFwJYCe6Zpr/wk67YZjNxxeyALjlYD/ACSoDB+Ks13B8R/tm2rbg2Q4l58
	hAaZx8yhG8ZmGQpvAdrTL5IXqTJ3bXxjNdNlyKNB/XuTlP/vnFIvcohI=
X-Google-Smtp-Source: AGHT+IGogMsCcw5ouCx9FVmJcRbC537B5Qx2wrDGY8DGvcsAeIKKyG9eqns1bSJ85FwYATuxlwBAwA==
X-Received: by 2002:a05:6402:13ca:b0:637:98d4:9678 with SMTP id 4fb4d7f45d1cf-63939c29899mr9622371a12.33.1759661428669;
        Sun, 05 Oct 2025 03:50:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637880ffdf7sm8004098a12.28.2025.10.05.03.50.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 03:50:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] dovecot: patch CVE-2022-30550
Date: Sun,  5 Oct 2025 12:50:26 +0200
Message-ID: <20251005105026.3418497-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 10:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120245

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-30550

Pick the commit referenced in https://www.openwall.com/lists/oss-security/2022/07/08/1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...g-passdbs-with-identical-driver-args.patch | 137 ++++++++++++++++++
 .../recipes-support/dovecot/dovecot_2.3.14.bb |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
new file mode 100644
index 0000000000..7a5ebb6589
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
@@ -0,0 +1,137 @@
+From 9cc83ac206dba2de5ac92d4c5fbad5720f605631 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Mon, 9 May 2022 15:23:33 +0300
+Subject: [PATCH] auth: Fix handling passdbs with identical driver/args but
+ different mechanisms/username_filter
+
+The passdb was wrongly deduplicated in this situation, causing wrong
+mechanisms or username_filter setting to be used. This would be a rather
+unlikely configuration though.
+
+Fixed by moving mechanisms and username_filter from struct passdb_module
+to struct auth_passdb, which is where they should have been in the first
+place.
+
+CVE: CVE-2022-30550
+
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/7bad6a24160e34bce8f10e73dbbf9e5fbbcd1904]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/auth/auth-request.c |  6 +++---
+ src/auth/auth.c         | 18 ++++++++++++++++++
+ src/auth/auth.h         |  5 +++++
+ src/auth/passdb.c       | 15 ++-------------
+ src/auth/passdb.h       |  4 ----
+ 5 files changed, 28 insertions(+), 20 deletions(-)
+
+diff --git a/src/auth/auth-request.c b/src/auth/auth-request.c
+index 9151807..c4f5a0c 100644
+--- a/src/auth/auth-request.c
++++ b/src/auth/auth-request.c
+@@ -553,8 +553,8 @@ auth_request_want_skip_passdb(struct auth_request *request,
+ 			      struct auth_passdb *passdb)
+ {
+ 	/* if mechanism is not supported, skip */
+-	const char *const *mechs = passdb->passdb->mechanisms;
+-	const char *const *username_filter = passdb->passdb->username_filter;
++	const char *const *mechs = passdb->mechanisms;
++	const char *const *username_filter = passdb->username_filter;
+ 	const char *username;
+ 
+ 	username = request->fields.user;
+@@ -567,7 +567,7 @@ auth_request_want_skip_passdb(struct auth_request *request,
+ 		return TRUE;
+ 	}
+ 
+-	if (passdb->passdb->username_filter != NULL &&
++	if (passdb->username_filter != NULL &&
+ 	    !auth_request_username_accepted(username_filter, username)) {
+ 		auth_request_log_debug(request,
+ 				       request->mech != NULL ? AUTH_SUBSYS_MECH
+diff --git a/src/auth/auth.c b/src/auth/auth.c
+index 2b8d32a..324bd79 100644
+--- a/src/auth/auth.c
++++ b/src/auth/auth.c
+@@ -93,6 +93,24 @@ auth_passdb_preinit(struct auth *auth, const struct auth_passdb_settings *set,
+ 	auth_passdb->override_fields_tmpl =
+ 		passdb_template_build(auth->pool, set->override_fields);
+ 
++	if (*set->mechanisms == '\0') {
++		auth_passdb->mechanisms = NULL;
++	} else if (strcasecmp(set->mechanisms, "none") == 0) {
++		auth_passdb->mechanisms = (const char *const[]){ NULL };
++	} else {
++		auth_passdb->mechanisms =
++			(const char *const *)p_strsplit_spaces(auth->pool,
++				set->mechanisms, " ,");
++	}
++
++	if (*set->username_filter == '\0') {
++		auth_passdb->username_filter = NULL;
++	} else {
++		auth_passdb->username_filter =
++			(const char *const *)p_strsplit_spaces(auth->pool,
++				set->username_filter, " ,");
++	}
++
+ 	/* for backwards compatibility: */
+ 	if (set->pass)
+ 		auth_passdb->result_success = AUTH_DB_RULE_CONTINUE;
+diff --git a/src/auth/auth.h b/src/auth/auth.h
+index 3ca5a9b..6208e4d 100644
+--- a/src/auth/auth.h
++++ b/src/auth/auth.h
+@@ -41,6 +41,11 @@ struct auth_passdb {
+ 	struct passdb_template *default_fields_tmpl;
+ 	struct passdb_template *override_fields_tmpl;
+ 
++	/* Supported authentication mechanisms, NULL is all, {NULL} is none */
++	const char *const *mechanisms;
++	/* Username filter, NULL is no filter */
++	const char *const *username_filter;
++
+ 	enum auth_passdb_skip skip;
+ 	enum auth_db_rule result_success;
+ 	enum auth_db_rule result_failure;
+diff --git a/src/auth/passdb.c b/src/auth/passdb.c
+index 21fd385..4652015 100644
+--- a/src/auth/passdb.c
++++ b/src/auth/passdb.c
+@@ -226,19 +226,8 @@ passdb_preinit(pool_t pool, const struct auth_passdb_settings *set)
+ 	passdb->id = ++auth_passdb_id;
+ 	passdb->iface = *iface;
+ 	passdb->args = p_strdup(pool, set->args);
+-	if (*set->mechanisms == '\0') {
+-		passdb->mechanisms = NULL;
+-	} else if (strcasecmp(set->mechanisms, "none") == 0) {
+-		passdb->mechanisms = (const char *const[]){NULL};
+-	} else {
+-		passdb->mechanisms = (const char* const*)p_strsplit_spaces(pool, set->mechanisms, " ,");
+-	}
+-
+-	if (*set->username_filter == '\0') {
+-		passdb->username_filter = NULL;
+-	} else {
+-		passdb->username_filter = (const char* const*)p_strsplit_spaces(pool, set->username_filter, " ,");
+-	}
++	/* NOTE: if anything else than driver & args are added here,
++	   passdb_find() also needs to be updated. */
+ 	array_push_back(&passdb_modules, &passdb);
+ 	return passdb;
+ }
+diff --git a/src/auth/passdb.h b/src/auth/passdb.h
+index b405aa7..8f50050 100644
+--- a/src/auth/passdb.h
++++ b/src/auth/passdb.h
+@@ -63,10 +63,6 @@ struct passdb_module {
+ 	/* Default password scheme for this module.
+ 	   If default_cache_key is set, must not be NULL. */
+ 	const char *default_pass_scheme;
+-	/* Supported authentication mechanisms, NULL is all, [NULL] is none*/
+-	const char *const *mechanisms;
+-	/* Username filter, NULL is no filter */
+-	const char *const *username_filter;
+ 
+ 	/* If blocking is set to TRUE, use child processes to access
+ 	   this passdb. */
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
index 451edef9a0..4c55c0e081 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
            file://dovecot.socket \
            file://0001-not-check-pandoc.patch \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
+           file://0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch \
            "
 
 SRC_URI[md5sum] = "2f03532cec3280ae45a101a7a55ccef5"

