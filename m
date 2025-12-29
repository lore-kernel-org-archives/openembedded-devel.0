Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D1BE92737
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:52:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44424.1767019917847543638
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e+8vcaE/;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso40574805e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019916; x=1767624716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNqkLWwaQVF2sWtDCDHdH47N+OZoPQ2XuEL74CY2Zzg=;
        b=e+8vcaE/T+HUUyXzm0aU6/R6xjQVkF5ju6kMxE6odQ0ilnRT1IuPmttIZEMciDOa5E
         J+RfTkIbCWwSMQ3VC/WM/y4cZwKAxLoxjKOpMFnU+GlrkvN02yP7SPlQrXg1kiERTO60
         CdofNPquJ027psj5KfMkN2tEWc1gkF8/5IuDTR2Rr//BCADTeS9NFs3wJfTUGw3gMwve
         b0QRET6dmBzXnXo5knq7N8YgMGmUMvveyG3zGWhnRMZar2FRrRPnbbcHlTtXSNlswdki
         4lJdEOacYr+JanGfbMpVU7YcAucN9TYHooet4zo4ab89HIj9flBF/9Nv8dG7Lds/4MxN
         1ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019916; x=1767624716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNqkLWwaQVF2sWtDCDHdH47N+OZoPQ2XuEL74CY2Zzg=;
        b=CRxekAOqb99ilGPGKRGvxvhCLmy+c+8qeobqfj9oL8X7srGkQkMgZSzEJQf3tmUbvF
         SEb4CVBdXV1jRVL5Mh9H/T8Td1nj+M7vwqWzzJwXXNXlzbNKAKu2v1Yz8cHBJN4jVoVN
         GTsK2dOZWzusg45/ND/WAUqTAdzncjFN34Ioyp0DBB3rmwa4cTNT9hqYZkBWN2lvmeBF
         Qady9G9dHL2PkTT9GbNrAe9fAc+rVFZMC624beSfVGR/ZfgSgxUKK/TH6J3GoZdWwuPv
         zK2u+iGFXDeuzqKPOgg6KpMihPBOo2ncxBtjVmQL7CRBNADiXflfHqTvQfV6Y0QGOGdl
         HbCA==
X-Gm-Message-State: AOJu0YzDOBq3cUyK+K5OkKHd0SC/dXmJmcR4PGfEyNSmP8hu3vkMcNga
	3RoCdiXoCS303PmjVOgvMJLFKcF8tzsAcxLUiZLDRNPCGKJkRaM54/iXPXaYxQ==
X-Gm-Gg: AY/fxX7p4oiucZzqv0MerE/p12cqVYoI2IihZMDK9Gddnj+2wGVbGhyENsQLPcoSiVk
	mKBmT2Wbc989tD6FeGZF+K+JLyP9GsketVyL8C9hYHsmrtpjbzLvYZsD9bppP7GZTZb7Nr8hzkn
	JF9zbLmOA5xwtSEZ1eiBaQHUSXUysOa1B03J1JFoF45EDxnSHWhekWNfdejZmy4JJoCcUZiQlVh
	XOMg9Z21Fp1DBSDcbRZMl9XCQ7hltuiYQjAFPSigjl6pyjFdiSOhz9TuFyLtHBuwyKraeyuwiw2
	6eCE/bGy6hgSVDqnwcBmClydH+vEJx3IfU7sJGGiv39abxG7gnAGMWLRbPuqm6xWJ9TEYIz4Ms7
	ieHuVWoOFiqiXh2F1ggnmpqLm20IzMehMM/JjvVXTYBlqdkisi0e4dgOZvA2tTsdnSDr6rQKRr0
	Yklr+GC/wv
X-Google-Smtp-Source: AGHT+IGokBNYKqECivUGF9BbaMSJDqgqHsoFp+yzVqzy4IdQxzKLfWk2uEpalgqSId8AlESHCN9+jQ==
X-Received: by 2002:a05:600c:b99:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-47d195a6369mr338854215e9.36.1767019915949;
        Mon, 29 Dec 2025 06:51:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm59449884f8f.2.2025.12.29.06.51.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:51:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 05/11] dovecot: patch CVE-2025-30189
Date: Mon, 29 Dec 2025 15:51:46 +0100
Message-ID: <20251229145152.489068-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145152.489068-1-skandigraun@gmail.com>
References: <20251229145152.489068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122984

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-30189

Pick the patches referenced by the advisory[1] from the Full Disclosure list.

[1]: https://seclists.org/fulldisclosure/2025/Oct/29

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../dovecot/dovecot/CVE-2025-30189-1.patch    | 128 ++++++++++++++++++
 .../dovecot/dovecot/CVE-2025-30189-2.patch    |  51 +++++++
 .../dovecot/dovecot/CVE-2025-30189-3.patch    |  36 +++++
 .../dovecot/dovecot/CVE-2025-30189-4.patch    |  72 ++++++++++
 .../dovecot/dovecot/CVE-2025-30189-5.patch    |  31 +++++
 .../dovecot/dovecot/CVE-2025-30189-6.patch    |  88 ++++++++++++
 .../dovecot/dovecot/CVE-2025-30189-7.patch    |  76 +++++++++++
 .../dovecot/dovecot_2.4.1-4.bb                |   7 +
 8 files changed, 489 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-1.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-2.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-3.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-4.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-5.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-6.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-7.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-1.patch b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-1.patch
new file mode 100644
index 0000000000..ee0d181b1e
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-1.patch
@@ -0,0 +1,128 @@
+From 2bd173264093021372506a89793456dcc42f4248 Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Fri, 25 Jul 2025 08:16:52 +0300
+Subject: [PATCH] auth: Use AUTH_CACHE_KEY_USER instead of per-database
+ constants
+
+Fixes cache key issue where users would end up overwriting
+each other in cache due to cache key being essentially static
+string because we no longer support %u.
+
+Forgotten in 2e298e7ee98b6df61cf85117f000290d60a473b8
+
+CVE: CVE-2025-30189
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/a70ce7d3e2f983979e971414c5892c4e30197231]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/auth/auth-settings.h  | 2 ++
+ src/auth/passdb-bsdauth.c | 4 +---
+ src/auth/passdb-oauth2.c  | 2 +-
+ src/auth/passdb-pam.c     | 3 ++-
+ src/auth/passdb-passwd.c  | 3 +--
+ src/auth/userdb-passwd.c  | 3 +--
+ 6 files changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/src/auth/auth-settings.h b/src/auth/auth-settings.h
+index 1d420ec..90aba17 100644
+--- a/src/auth/auth-settings.h
++++ b/src/auth/auth-settings.h
+@@ -1,6 +1,8 @@
+ #ifndef AUTH_SETTINGS_H
+ #define AUTH_SETTINGS_H
+ 
++#define AUTH_CACHE_KEY_USER "%{user}"
++
+ struct master_service;
+ struct master_service_settings_output;
+ 
+diff --git a/src/auth/passdb-bsdauth.c b/src/auth/passdb-bsdauth.c
+index 6829267..1b86da4 100644
+--- a/src/auth/passdb-bsdauth.c
++++ b/src/auth/passdb-bsdauth.c
+@@ -14,8 +14,6 @@
+ #include <login_cap.h>
+ #include <bsd_auth.h>
+ 
+-#define BSDAUTH_CACHE_KEY "%u"
+-
+ struct passdb_bsdauth_settings {
+ 	pool_t pool;
+ };
+@@ -104,7 +102,7 @@ bsdauth_preinit(pool_t pool, struct event *event,
+ 			 &post_set, error_r) < 0)
+ 		return -1;
+ 	module->default_cache_key = auth_cache_parse_key_and_fields(
+-		pool, BSDAUTH_CACHE_KEY, &post_set->fields, "bsdauth");
++		pool, AUTH_CACHE_KEY_USER, &post_set->fields, "bsdauth");
+ 
+ 	settings_free(post_set);
+ 	*module_r = module;
+diff --git a/src/auth/passdb-oauth2.c b/src/auth/passdb-oauth2.c
+index 96d902d..91fed06 100644
+--- a/src/auth/passdb-oauth2.c
++++ b/src/auth/passdb-oauth2.c
+@@ -53,7 +53,7 @@ oauth2_preinit(pool_t pool, struct event *event, struct passdb_module **module_r
+ 	if (db_oauth2_init(event, TRUE, &module->db, error_r) < 0)
+ 		return -1;
+ 	module->module.default_pass_scheme = "PLAIN";
+-	module->module.default_cache_key = "%u";
++	module->module.default_cache_key = AUTH_CACHE_KEY_USER;
+ 	*module_r = &module->module;
+ 	return 0;
+ }
+diff --git a/src/auth/passdb-pam.c b/src/auth/passdb-pam.c
+index 2acbceb..fdf0f57 100644
+--- a/src/auth/passdb-pam.c
++++ b/src/auth/passdb-pam.c
+@@ -415,7 +415,8 @@ static int pam_preinit(pool_t pool, struct event *event,
+ 	module = p_new(pool, struct pam_passdb_module, 1);
+ 	module->module.default_cache_key =
+ 		auth_cache_parse_key_and_fields(pool,
+-						t_strdup_printf("%%u/%s", set->service_name),
++						t_strdup_printf("%"AUTH_CACHE_KEY_USER"\t%s",
++								set->service_name),
+ 						&post_set->fields, "pam");
+ 	module->requests_left = set->max_requests;
+ 	module->pam_setcred = set->setcred;
+diff --git a/src/auth/passdb-passwd.c b/src/auth/passdb-passwd.c
+index 1300315..22e2eae 100644
+--- a/src/auth/passdb-passwd.c
++++ b/src/auth/passdb-passwd.c
+@@ -10,7 +10,6 @@
+ #include "safe-memset.h"
+ #include "ipwd.h"
+ 
+-#define PASSWD_CACHE_KEY "%u"
+ #define PASSWD_PASS_SCHEME "CRYPT"
+ 
+ #undef DEF
+@@ -142,7 +141,7 @@ static int passwd_preinit(pool_t pool, struct event *event,
+ 			 &post_set, error_r) < 0)
+ 		return -1;
+ 	module->default_cache_key = auth_cache_parse_key_and_fields(pool,
+-								    PASSWD_CACHE_KEY,
++								    AUTH_CACHE_KEY_USER,
+ 								    &post_set->fields,
+ 								    "passwd");
+ 	settings_free(post_set);
+diff --git a/src/auth/userdb-passwd.c b/src/auth/userdb-passwd.c
+index 5241129..14cf90a 100644
+--- a/src/auth/userdb-passwd.c
++++ b/src/auth/userdb-passwd.c
+@@ -9,7 +9,6 @@
+ #include "ipwd.h"
+ #include "time-util.h"
+ 
+-#define USER_CACHE_KEY "%u"
+ #define PASSWD_SLOW_WARN_MSECS (10*1000)
+ #define PASSWD_SLOW_MASTER_WARN_MSECS 50
+ #define PASSDB_SLOW_MASTER_WARN_COUNT_INTERVAL 100
+@@ -225,7 +224,7 @@ static int passwd_preinit(pool_t pool, struct event *event ATTR_UNUSED,
+ 	struct passwd_userdb_module *module =
+ 		p_new(pool, struct passwd_userdb_module, 1);
+ 
+-	module->module.default_cache_key = USER_CACHE_KEY;
++	module->module.default_cache_key = AUTH_CACHE_KEY_USER;
+ 	*module_r = &module->module;
+ 	return 0;
+ }
diff --git a/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-2.patch b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-2.patch
new file mode 100644
index 0000000000..fa1f6fc756
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-2.patch
@@ -0,0 +1,51 @@
+From ca932f18061b643c19bae839ba3990bb16e51837 Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Wed, 30 Jul 2025 09:42:20 +0300
+Subject: [PATCH] auth: auth-cache - Refactor auth_cache_parse_key_and_fields()
+
+Call auth_cache_parse_key_exclude() at the function end,
+simplifies next commit.
+
+CVE: CVE-2025-30189
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/c45ce2c073c9439a9d6366016cb4d41059d737f0]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/auth/auth-cache.c | 24 +++++++++++-------------
+ 1 file changed, 11 insertions(+), 13 deletions(-)
+
+diff --git a/src/auth/auth-cache.c b/src/auth/auth-cache.c
+index 360ad8b..3ccd45f 100644
+--- a/src/auth/auth-cache.c
++++ b/src/auth/auth-cache.c
+@@ -129,20 +129,18 @@ char *auth_cache_parse_key_and_fields(pool_t pool, const char *query,
+ 				      const ARRAY_TYPE(const_string) *fields,
+ 				      const char *exclude_driver)
+ {
+-	if (array_is_empty(fields))
+-		return auth_cache_parse_key_exclude(pool, query, exclude_driver);
+-
+-	string_t *full_query = t_str_new(128);
+-	str_append(full_query, query);
+-
+-	unsigned int i, count;
+-	const char *const *str = array_get(fields, &count);
+-	for (i = 0; i < count; i += 2) {
+-		str_append_c(full_query, '\t');
+-		str_append(full_query, str[i + 1]);
++	if (!array_is_empty(fields)) {
++		unsigned int i, count;
++		const char *const *str = array_get(fields, &count);
++		string_t *full_query = t_str_new(128);
++		str_append(full_query, query);
++		for (i = 0; i < count; i += 2) {
++			str_append_c(full_query, '\t');
++			str_append(full_query, str[i + 1]);
++		}
++		query = str_c(full_query);
+ 	}
+-	return auth_cache_parse_key_exclude(pool, str_c(full_query),
+-					    exclude_driver);
++	return auth_cache_parse_key_exclude(pool, query, exclude_driver);
+ }
+ 
+ static void
diff --git a/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-3.patch b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-3.patch
new file mode 100644
index 0000000000..069a4e724f
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-3.patch
@@ -0,0 +1,36 @@
+From 74c526047ffcecc40485df784294b27cedf66136 Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Fri, 25 Jul 2025 11:48:43 +0300
+Subject: [PATCH] auth: auth-cache - Deduplicate auth_cache_parse_key() to use
+ auth_cache_parse_key_and_fields()
+
+Simplifies following commit
+
+CVE: CVE-2025-30189
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/759ee1af848480987d012de2f7135160156724b6]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/auth/auth-cache.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/auth/auth-cache.c b/src/auth/auth-cache.c
+index 3ccd45f..ad8cbe5 100644
+--- a/src/auth/auth-cache.c
++++ b/src/auth/auth-cache.c
+@@ -122,14 +122,14 @@ static char *auth_cache_parse_key_exclude(pool_t pool, const char *query,
+ 
+ char *auth_cache_parse_key(pool_t pool, const char *query)
+ {
+-	return auth_cache_parse_key_exclude(pool, query, NULL);
++	return auth_cache_parse_key_and_fields(pool, query, NULL, NULL);
+ }
+ 
+ char *auth_cache_parse_key_and_fields(pool_t pool, const char *query,
+ 				      const ARRAY_TYPE(const_string) *fields,
+ 				      const char *exclude_driver)
+ {
+-	if (!array_is_empty(fields)) {
++	if (fields != NULL && !array_is_empty(fields)) {
+ 		unsigned int i, count;
+ 		const char *const *str = array_get(fields, &count);
+ 		string_t *full_query = t_str_new(128);
diff --git a/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-4.patch b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-4.patch
new file mode 100644
index 0000000000..367debca52
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-4.patch
@@ -0,0 +1,72 @@
+From e0a7cb4b1e0ccdc95a717567818d924ce2888ca3 Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Fri, 25 Jul 2025 11:51:16 +0300
+Subject: [PATCH] auth: auth-cache - Change auth_cache_parse_key_exclude() to
+ return error
+
+Simplifies following commit
+
+CVE: CVE-2025-30189
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/d12bb78b5a235f31c9d5a655bd223c28d44bcadb]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/auth/auth-cache.c | 25 ++++++++++++++++++-------
+ 1 file changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/src/auth/auth-cache.c b/src/auth/auth-cache.c
+index ad8cbe5..407e5d4 100644
+--- a/src/auth/auth-cache.c
++++ b/src/auth/auth-cache.c
+@@ -64,8 +64,10 @@ static void auth_cache_key_add_tab_idx(string_t *str, unsigned int i)
+ 	str_append_c(str, '}');
+ }
+ 
+-static char *auth_cache_parse_key_exclude(pool_t pool, const char *query,
+-					  const char *exclude_driver)
++static int auth_cache_parse_key_exclude(pool_t pool, const char *query,
++					const char *exclude_driver,
++					char **cache_key_r,
++					const char **error_r)
+ {
+ 	string_t *str;
+ 	bool key_seen[AUTH_REQUEST_VAR_TAB_COUNT];
+@@ -76,9 +78,9 @@ static char *auth_cache_parse_key_exclude(pool_t pool, const char *query,
+ 
+ 	struct var_expand_program *prog;
+ 	if (var_expand_program_create(query, &prog, &error) < 0) {
+-		e_debug(auth_event, "auth-cache: var_expand_program_create('%s') failed: %s",
+-			query, error);
+-		return p_strdup(pool, "");
++		*error_r = t_strdup_printf("var_expand_program_create(%s) failed: %s",
++					   query, error);
++		return -1;
+ 	}
+ 
+ 	const char *const *vars = var_expand_program_variables(prog);
+@@ -117,7 +119,8 @@ static char *auth_cache_parse_key_exclude(pool_t pool, const char *query,
+ 
+ 	var_expand_program_free(&prog);
+ 
+-	return p_strdup(pool, str_c(str));
++	*cache_key_r = p_strdup(pool, str_c(str));
++	return 0;
+ }
+ 
+ char *auth_cache_parse_key(pool_t pool, const char *query)
+@@ -140,7 +143,15 @@ char *auth_cache_parse_key_and_fields(pool_t pool, const char *query,
+ 		}
+ 		query = str_c(full_query);
+ 	}
+-	return auth_cache_parse_key_exclude(pool, query, exclude_driver);
++
++	char *cache_key;
++	const char *error;
++	if (auth_cache_parse_key_exclude(pool, query, exclude_driver,
++					 &cache_key, &error) < 0) {
++		e_debug(auth_event, "auth-cache: %s", error);
++		cache_key = p_strdup(pool, "");
++	}
++	return cache_key;
+ }
+ 
+ static void
diff --git a/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-5.patch b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-5.patch
new file mode 100644
index 0000000000..8a7692efe2
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-5.patch
@@ -0,0 +1,31 @@
+From b2d817db6c2a7229c9e3c4ccf8565acdd6f9a4c0 Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Fri, 25 Jul 2025 11:52:36 +0300
+Subject: [PATCH] auth: auth-cache - Treat cache key parsing errors as fatals
+
+Avoids accidentically turning off caching
+
+CVE: CVE-2025-30189
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/20d15baa071747f91176eb3115235aa8c78a3d11]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/auth/auth-cache.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/src/auth/auth-cache.c b/src/auth/auth-cache.c
+index 407e5d4..be56934 100644
+--- a/src/auth/auth-cache.c
++++ b/src/auth/auth-cache.c
+@@ -147,10 +147,8 @@ char *auth_cache_parse_key_and_fields(pool_t pool, const char *query,
+ 	char *cache_key;
+ 	const char *error;
+ 	if (auth_cache_parse_key_exclude(pool, query, exclude_driver,
+-					 &cache_key, &error) < 0) {
+-		e_debug(auth_event, "auth-cache: %s", error);
+-		cache_key = p_strdup(pool, "");
+-	}
++					 &cache_key, &error) < 0)
++		i_fatal("auth-cache: %s", error);
+ 	return cache_key;
+ }
+ 
diff --git a/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-6.patch b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-6.patch
new file mode 100644
index 0000000000..58537ed768
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-6.patch
@@ -0,0 +1,88 @@
+From 73bf352efaf3ab5f685bc3b34c6780dca79b9318 Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Fri, 25 Jul 2025 11:41:03 +0300
+Subject: [PATCH] auth: auth-cache - Require cache key to contain at least one
+ variable
+
+CVE: CVE-2025-30189
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/0172f8e8c55aff42c688633b2891cf157641366b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/auth/auth-cache.c      |  7 +++++++
+ src/auth/test-auth-cache.c | 37 ++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 43 insertions(+), 1 deletion(-)
+
+diff --git a/src/auth/auth-cache.c b/src/auth/auth-cache.c
+index be56934..32959f5 100644
+--- a/src/auth/auth-cache.c
++++ b/src/auth/auth-cache.c
+@@ -86,6 +86,13 @@ static int auth_cache_parse_key_exclude(pool_t pool, const char *query,
+ 	const char *const *vars = var_expand_program_variables(prog);
+ 	str = t_str_new(32);
+ 
++	if (*vars == NULL && *query != '\0') {
++		var_expand_program_free(&prog);
++		*error_r = t_strdup_printf("%s: Cache key must contain at least one variable",
++					   query);
++		return -1;
++	}
++
+ 	for (; *vars != NULL; vars++) {
+ 		/* ignore any providers */
+ 		if (strchr(*vars, ':') != NULL &&
+diff --git a/src/auth/test-auth-cache.c b/src/auth/test-auth-cache.c
+index 46836de..b36d83e 100644
+--- a/src/auth/test-auth-cache.c
++++ b/src/auth/test-auth-cache.c
+@@ -97,7 +97,35 @@ static void test_auth_cache_parse_key(void)
+ 						 tests[i].in);
+ 		test_assert_strcmp_idx(cache_key, tests[i].out, i);
+ 	}
++
++	test_end();
++}
++
++static enum fatal_test_state test_cache_key_missing_variable(unsigned int i)
++{
++	if (i == 0)
++		test_begin("auth cache missing variable");
++
++	/* ensure that we do not accept static string */
++	static const struct {
++		const char *in, *out;
++	} tests_bad[] = {
++		{ "%u", "auth-cache: %u: Cache key must contain at least one variable" },
++		{ "foobar", "auth-cache: foobar: Cache key must contain at least one variable" },
++		{ "%{test", "auth-cache: var_expand_program_create(%{test) " \
++			    "failed: syntax error, unexpected end of file, " \
++			    "expecting CCBRACE or PIPE" },
++	};
++
++	if (i < N_ELEMENTS(tests_bad)) {
++		test_expect_fatal_string(tests_bad[i].out);
++		(void)auth_cache_parse_key(pool_datastack_create(),
++					   tests_bad[i].in);
++		return FATAL_TEST_FAILURE;
++	}
++
+ 	test_end();
++	return FATAL_TEST_FINISHED;
+ }
+ 
+ int main(void)
+@@ -108,7 +136,14 @@ int main(void)
+ 		test_auth_cache_parse_key,
+ 		NULL
+ 	};
+-	int ret = test_run(test_functions);
++
++	static test_fatal_func_t *const fatal_functions[] = {
++		test_cache_key_missing_variable,
++		NULL,
++	};
++
++	int ret = test_run_with_fatals(test_functions, fatal_functions);
++
+ 	event_unref(&auth_event);
+ 	return ret;
+ }
diff --git a/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-7.patch b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-7.patch
new file mode 100644
index 0000000000..2e00c79e91
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-7.patch
@@ -0,0 +1,76 @@
+From f9f3daf58d2fb43e3bb68bead0309ed41a6b6c40 Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Fri, 25 Jul 2025 12:00:57 +0300
+Subject: [PATCH] auth: auth-cache - Drop auth_cache_parse_key()
+
+It's only used by tests and can now just call
+auth_cache_parse_key_and_fields().
+
+CVE: CVE-2025-30189
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/34caed79b76a7b82a2a9c94cf35371bec6c2b826]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/auth/auth-cache.c      | 5 -----
+ src/auth/auth-cache.h      | 6 ++----
+ src/auth/test-auth-cache.c | 8 ++++----
+ 3 files changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/src/auth/auth-cache.c b/src/auth/auth-cache.c
+index 32959f5..82cc0d5 100644
+--- a/src/auth/auth-cache.c
++++ b/src/auth/auth-cache.c
+@@ -130,11 +130,6 @@ static int auth_cache_parse_key_exclude(pool_t pool, const char *query,
+ 	return 0;
+ }
+ 
+-char *auth_cache_parse_key(pool_t pool, const char *query)
+-{
+-	return auth_cache_parse_key_and_fields(pool, query, NULL, NULL);
+-}
+-
+ char *auth_cache_parse_key_and_fields(pool_t pool, const char *query,
+ 				      const ARRAY_TYPE(const_string) *fields,
+ 				      const char *exclude_driver)
+diff --git a/src/auth/auth-cache.h b/src/auth/auth-cache.h
+index 9bdb918..d63621b 100644
+--- a/src/auth/auth-cache.h
++++ b/src/auth/auth-cache.h
+@@ -16,10 +16,8 @@ struct auth_cache_node {
+ struct auth_cache;
+ struct auth_request;
+ 
+-/* Parses all %x variables from query and compresses them into tab-separated
+-   list, so it can be used as a cache key. */
+-char *auth_cache_parse_key(pool_t pool, const char *query);
+-/* Same as auth_cache_parse_key(), but add also variables from "fields",
++/* Parses all %variables from query and compresses them into tab-separated
++   list, so it can be used as a cache key. Adds also variables from "fields",
+    except variables prefixed with <exclude_driver>":" */
+ char *auth_cache_parse_key_and_fields(pool_t pool, const char *query,
+ 				      const ARRAY_TYPE(const_string) *fields,
+diff --git a/src/auth/test-auth-cache.c b/src/auth/test-auth-cache.c
+index b36d83e..f58c21f 100644
+--- a/src/auth/test-auth-cache.c
++++ b/src/auth/test-auth-cache.c
+@@ -93,8 +93,8 @@ static void test_auth_cache_parse_key(void)
+ 	test_begin("auth cache parse key");
+ 
+ 	for (i = 0; i < N_ELEMENTS(tests); i++) {
+-		cache_key = auth_cache_parse_key(pool_datastack_create(),
+-						 tests[i].in);
++		cache_key = auth_cache_parse_key_and_fields(pool_datastack_create(),
++							    tests[i].in, NULL, NULL);
+ 		test_assert_strcmp_idx(cache_key, tests[i].out, i);
+ 	}
+ 
+@@ -119,8 +119,8 @@ static enum fatal_test_state test_cache_key_missing_variable(unsigned int i)
+ 
+ 	if (i < N_ELEMENTS(tests_bad)) {
+ 		test_expect_fatal_string(tests_bad[i].out);
+-		(void)auth_cache_parse_key(pool_datastack_create(),
+-					   tests_bad[i].in);
++		(void)auth_cache_parse_key_and_fields(pool_datastack_create(),
++						      tests_bad[i].in, NULL, NULL);
+ 		return FATAL_TEST_FAILURE;
+ 	}
+ 
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
index 40cf991ae1..09583f1694 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
@@ -15,6 +15,13 @@ SRC_URI = "http://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
            file://dovecot.socket \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
            file://fix-musl-compilation.patch \
+           file://CVE-2025-30189-1.patch \
+           file://CVE-2025-30189-2.patch \
+           file://CVE-2025-30189-3.patch \
+           file://CVE-2025-30189-4.patch \
+           file://CVE-2025-30189-5.patch \
+           file://CVE-2025-30189-6.patch \
+           file://CVE-2025-30189-7.patch \
            "
 SRC_URI[sha256sum] = "fb188603f419ed7aaa07794a8692098c3ec2660bb9c67d0efe24948cbb32ae00"
 

