Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CE9CAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 10:33:19 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.8160.1759660396357898348
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 03:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2mW0SZj;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b48d8deafaeso784791566b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 03:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759660395; x=1760265195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1AkATbYUUCz0YOEKJn0R65DIKtwVQli80vFmmUmzoc=;
        b=V2mW0SZjLRIFlqIc0MK1PJSQTOER0jFfTM4etOPiuEuUSa4iRQzAXwS/TxBATlUeAa
         hGLanL7p0JGeoV2ProBDuL355gLwF1kJ8UqCOwWwrUYXsyIc/+uW5irWIkoZ5X11pN38
         Cri5T9ozEzNlCzZBIZSMdmSCvPFfmbx4/j6rx74PYjL8jAhH9z4BArHpWmd1vkU9XOI3
         Co0WroiePvNf/j85flF9ZLiwjBu/AneEag9dWMm7XEV5ZRBP914bfZJsxKzb8fJD1Eze
         pdnqpWbP9UIrOyO+1W0ZszFMcloKfxNUYShc5wIQY+36qfCpzUcYJ14v4Map2vqx58nJ
         dQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759660395; x=1760265195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1AkATbYUUCz0YOEKJn0R65DIKtwVQli80vFmmUmzoc=;
        b=VdLzFvsaBcaniMmLalHDUaQOLUgSvIW8Z3gEhcRdRfybD1hu1MJtnZsybDNrerxxjA
         h7eFHUWO0+DwZxaPsnKJp4WYxq+1z8xUe0U5Gb2wtuhBmuIgwK6PKbHsQmYt5zZfj/PB
         nbWhWQ6dqvUlzyMNbnjU0+UHGTdAA0kFenvsqgvtwzYCMRhoo+F3PusEMbKEuR0ts4IC
         KDUry8qqMH8CMJ1FN4Bb0S07dgASXYOw2k5784LehSNdvrGyxJwhshl9Og6o8JoZAAtq
         T09umpZFMp8dy43uEU1LC7gZMBuAGqpaut/I/f3n6smw2jqajolfbm7eczTesXxOWaG8
         g3+g==
X-Gm-Message-State: AOJu0Yy4FHSrBK8j10IsOyfKVmzUimlYhR38ELvhqrsatrPuNrD6/ENE
	YYsIEEVBxsqkygdRtmz0p5/4VjI8uMX1WG9/MoiDBxRf1nN1oVB7VGlWICPisw==
X-Gm-Gg: ASbGncuJqaTJi7grchjcK6eMBSs942oD/O7VQ1rPrIYjgmhQ+whDE/vU6NNkMCGi+K1
	ir3W937t/xijQBriinl2ZEt3t2eIKqvvn/kvy+iSE5qB4HzQRxe+ZteY3Rc17d7YZ5UX6K1htJN
	xzJwdFMzXgNYnMnqzdm/JJTo59XUA8doUnJ917cNCrQhFoaW/ebhGY+Xg+7PuVFBzyMJQeEu3Mn
	7B/UpZrDe5kCtGBwzT/UZJN331sxCj+5GXECWGFI+AGCt5chIa1KGt6UsObzTOhv0eBwQy5H69O
	yMA+zTVCC0qouDUl6birOjSdsonNP5YLWvsw2md8AzOd2wfdmZtMO+dBXhi5bDTLYEGDUHcJg98
	fh0IK2TFzvmUwajIw1KGCsoCEkUQH8dN//Ptjw2M66Paf1EcYPmSPZJGWs4forKIJtw==
X-Google-Smtp-Source: AGHT+IGmfVGkao9QVVa311R14w55IJ/gzz6zkJoVmMsfMlm/KqwZjjB33+kCW81AmAlmaTxgeX/LZA==
X-Received: by 2002:a17:907:868c:b0:b3d:d6be:4cbc with SMTP id a640c23a62f3a-b49c3449f39mr1085607366b.24.1759660394480;
        Sun, 05 Oct 2025 03:33:14 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83f5fsm886151466b.32.2025.10.05.03.33.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 03:33:14 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH] dovecot: patch CVE-2022-30550
Date: Sun,  5 Oct 2025 12:33:13 +0200
Message-ID: <20251005103313.1792781-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 10:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120244

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-30550

Pick the commit referenced in https://www.openwall.com/lists/oss-security/2022/07/08/1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...g-passdbs-with-identical-driver-args.patch | 137 ++++++++++++++++++
 .../recipes-support/dovecot/dovecot_2.3.21.bb |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
new file mode 100644
index 0000000000..2adbee491e
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
@@ -0,0 +1,137 @@
+From 30be738858f6e0b314717ea7ceb24fee165ce642 Mon Sep 17 00:00:00 2001
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
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
index 17fbd789b6..c626f26457 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
            file://dovecot.socket \
            file://0001-not-check-pandoc.patch \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
+           file://0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch \
            "
 SRC_URI[sha256sum] = "05b11093a71c237c2ef309ad587510721cc93bbee6828251549fc1586c36502d"
 

