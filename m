Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73352CAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 10:29:29 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.8107.1759660167531205083
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 03:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A93javjA;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-637a2543127so6958317a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 03:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759660166; x=1760264966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vvi8FZn49MIr2eyYfH5EE7YArFLn/CI+in/GfCnDmKs=;
        b=A93javjAj3xWpVNjzedOqrDaWOFOWrH/3Vs7l/Fg77dRLznquP+otf6ReYrTZiLbuW
         9Nax2iqqW8tyJqmsupKoNOjc7Pa6CnokBdbk1UN+onJRyYiREAIM+oltN7E+8KycHihk
         d9O5+vAhOFsADrbm/z8Fh6z1bw1PYPOWCb6aJFHURYkwMoUaAgB3RVgadDTnYvfy/J/c
         J6UDnViMY21tbYJG5mmf3Sd9pKAvdn1OFNmXzcck2Sq7UL+PfRpPO4IasEOAByF357SP
         g4oiVh+wQ3nhvskqNZk+xc/6QDk9pmYuvI69tm4EJmewmK2un3QUMmNJcpxF21gNNR+a
         2aJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759660166; x=1760264966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vvi8FZn49MIr2eyYfH5EE7YArFLn/CI+in/GfCnDmKs=;
        b=hH4OOPy1CLyJP1Jh/SsTmZbyGkUwiBKG1GfPXb8itKVAkmoxK3tMht1TjN8C3/aG8D
         Cf1Gb8xtrzeRn1mPWdGyylNVHno3ybn8IGzig1FDrb7/GB8XqDJPPmFogr540BbS54rX
         1LaA9yVQz6tz/VyAdKa0l+neN9xNBbbzwEJOnHYumoM68/cpL5vJmtVjeVbO8ZBmnRcE
         7DiL0eY9mXpaTzQr51WyZdbPzlMd7+H+1tKITxadNE/vUdJC959DOfNDQapFUzBRQFY1
         cP9nBhYi54xqGxKS7orkd9vmlYtTgxFofC8GUz6pIxOw5ash49A6JjjDARtvkTKWIfE2
         jzng==
X-Gm-Message-State: AOJu0YyD7lg7Oy6fcdQuVBXEqwypFAuLXkNX5aWomJjlLLuNyHHFWcjz
	dAXMyQ4m5AfXY5Hq1u47McWNtbImVhrF+wjYovmqqvF0gjI5yw6TVGaBuBWmzg==
X-Gm-Gg: ASbGncsW/xUzA/afxvdKsSoYxNMHxJWqSHza4xmuE1j/Ap3MDSSYxxpCxB0BWaFtGf+
	o/S+E9nuRrF4HnxtEaDrSxMK3CxQlAFZM9pwcKSIB82KS2PotRzlE0rttG//2YsIGRBZ3fvW0Vf
	4eEtsYhtOArfhVVpiiYI/MM1u73U1Z1Q6NtzZIv1YVwIP9TngDqgr8HWycXLh3WkH6qMeQNEto5
	QG5OH8lIwxHZmp84rAaCBpxamJ1WAv6BNfngvISreAsyWaxt0ZosV+Qudzo7n0Q6lfsJj4IXobq
	jvVdJApihUJ6djy98tCtZnAVEZ7D3Tzklok4uFeugmW90hvXUpUIcMG1fkg+d2JSx0MAD7muiLt
	RsLXO08fGWFlFxZk54wiRRU0v1912VW0O6b8h4vlrTAovENy0H7LpLI4=
X-Google-Smtp-Source: AGHT+IFtEhS7UXw1QM/2GrnI0rlB+WOxZKUVIXR3/1LrR4bvlf8hfDo3az4kHWWpcQZo7XaplOZchQ==
X-Received: by 2002:a05:6402:42d6:b0:62f:5992:a64a with SMTP id 4fb4d7f45d1cf-639348f1287mr10302738a12.13.1759660165572;
        Sun, 05 Oct 2025 03:29:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378811236csm7837862a12.42.2025.10.05.03.29.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 03:29:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][walnascar][PATCH] dovecot: patch CVE-2022-30550
Date: Sun,  5 Oct 2025 12:29:23 +0200
Message-ID: <20251005102923.1753645-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 10:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120243

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-30550

Pick the commit referenced in https://www.openwall.com/lists/oss-security/2022/07/08/1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...g-passdbs-with-identical-driver-args.patch | 136 ++++++++++++++++++
 .../dovecot/dovecot_2.3.21.1.bb               |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
new file mode 100644
index 0000000000..81a098966c
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
@@ -0,0 +1,136 @@
+From 140a2643f1241c60848e3502db89e3e08703d85f Mon Sep 17 00:00:00 2001
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
+index 635ee20..fab655e 100644
+--- a/src/auth/auth-request.c
++++ b/src/auth/auth-request.c
+@@ -560,8 +560,8 @@ auth_request_want_skip_passdb(struct auth_request *request,
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
+@@ -574,7 +574,7 @@ auth_request_want_skip_passdb(struct auth_request *request,
+ 		return TRUE;
+ 	}
+ 
+-	if (passdb->passdb->username_filter != NULL &&
++	if (passdb->username_filter != NULL &&
+ 	    !auth_request_username_accepted(username_filter, username)) {
+ 		auth_request_log_debug(request,
+ 				       request->mech != NULL ? AUTH_SUBSYS_MECH
+diff --git a/src/auth/auth.c b/src/auth/auth.c
+index 845c43c..a5a4c81 100644
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
+index 9bc2b87..d3c61cc 100644
+--- a/src/auth/passdb.c
++++ b/src/auth/passdb.c
+@@ -224,19 +224,8 @@ passdb_preinit(pool_t pool, const struct auth_passdb_settings *set)
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
+index f9b33ea..f515b1d 100644
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
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
index 3177cdb1d7..34d4deb7a2 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
            file://0001-not-check-pandoc.patch \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
            file://1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch \
+           file://0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch \
            "
 SRC_URI[sha256sum] = "2d90a178c4297611088bf7daae5492a3bc3d5ab6328c3a032eb425d2c249097e"
 

