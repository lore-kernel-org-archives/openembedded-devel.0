Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471EEC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 05:56:03 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.52001.1656395762240510608
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 22:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=F3cxsqRs;
 spf=pass (domain: mvista.com, ip: 209.85.216.49,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id go6so11602543pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 22:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=91VYe9Kd6IfHs8fToYTfll1bpc3uPXD8BDbG58C0ams=;
        b=F3cxsqRswuPbsvYnu1JYpbPlT4icfptIj+zOgM7nfc3zX6gpTmHIEhXGq9Uur7Igyn
         RfEo/0JXHcI9yPhZpm5UCb1IdXSgcADOC9D59L/S4mYDYkxhQPaZkj5+lqz9SH1Brn5H
         eF7IqrfVQdx2l/O+BsOvtKMHv7X4cEpt86TuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=91VYe9Kd6IfHs8fToYTfll1bpc3uPXD8BDbG58C0ams=;
        b=o7QczmaUesOtQPTUU/vFrRewJYV5Di+tpmjwOBSJQu026q1yZnrfckIV7oqwZ7Ob4E
         3uNMJH6SJzfftsmUzAzb5yPXOKkvSCTlHRUModF5QgUGdyAY2bKIe/SAMSDir4zVXnJS
         ghBxzJ2wxTQH19FYsY6klHr9r4gd0MqtJOiKb+K4QoX/9aJyY43QNf5+5dwqcmeK1vD2
         L5+yJ6VKHevLb3YPUdqLqWew8l4Pld23JEoG8BIalDUMVrHbtdmGCpRPThDkPozSl6iT
         Mg3B4avWtf0uz9KakLhZEa76xXvb0bTxLUTqabDOczrUHKF2Ctfd47Q08JN4+fcDzqCv
         FyFg==
X-Gm-Message-State: AJIora9AC7cieMvqVANIrEKPhF3Dw3OI4v8hpJCaKKGPHe92ZnxQK83h
	BcwR1l+Dnf5lWZ+Cs0BOREDkzCt/KAp1jA==
X-Google-Smtp-Source: 
 AGRyM1seGiLhqnZsCcSxY9IOx02KLwZ8Lo3zcypzwlXG5BkENmHGWVBd/hmQzjPg5UyeDCXYD4e4dw==
X-Received: by 2002:a17:902:cf12:b0:169:f241:65ae with SMTP id
 i18-20020a170902cf1200b00169f24165aemr1982884plg.107.1656395761392;
        Mon, 27 Jun 2022 22:56:01 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.142])
        by smtp.gmail.com with ESMTPSA id
 w6-20020a17090aaf8600b001eee7950428sm2708160pjq.44.2022.06.27.22.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 22:56:01 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Tue, 28 Jun 2022 11:25:56 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] cyrus-sasl: CVE-2022-24407
 failure to properly escape SQL input allows an attacker to execute arbitrary
 SQL commands
Date: Tue, 28 Jun 2022 11:25:54 +0530
Message-Id: <20220628055554.10496-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jun 2022 05:56:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97602

Source: https://github.com/cyrusimap/cyrus-sasl
MR: 118497
Type: Security Fix
Disposition: Backport from https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc
ChangeID: 4736aae2b7d8986787b1666cfd6eecd590915120
Description:
       CVE-2022-24407 cyrus-sasl: failure to properly escape SQL input allows an attacker to execute arbitrary SQL commands.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../cyrus-sasl/CVE-2022-24407.patch           | 83 +++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.28.bb           |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
new file mode 100644
index 000000000..0ddea03c6
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
@@ -0,0 +1,83 @@
+From 906b863c5308567086c6437ce17335b1922a78d1 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 15 Jun 2022 10:44:50 +0530
+Subject: [PATCH] CVE-2022-24407
+
+Upstream-Status: Backport [https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc]
+CVE: CVE-2022-24407
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ plugins/sql.c | 26 +++++++++++++++++++++++---
+ 1 file changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/plugins/sql.c b/plugins/sql.c
+index 95f5f707..5d20759b 100644
+--- a/plugins/sql.c
++++ b/plugins/sql.c
+@@ -1150,6 +1150,7 @@ static int sql_auxprop_store(void *glob_context,
+     char *statement = NULL;
+     char *escap_userid = NULL;
+     char *escap_realm = NULL;
++    char *escap_passwd = NULL;
+     const char *cmd;
+     
+     sql_settings_t *settings;
+@@ -1221,6 +1222,11 @@ static int sql_auxprop_store(void *glob_context,
+ 			    "Unable to begin transaction\n");
+     }
+     for (cur = to_store; ret == SASL_OK && cur->name; cur++) {
++	/* Free the buffer, current content is from previous loop. */
++	if (escap_passwd) {
++	    sparams->utils->free(escap_passwd);
++	    escap_passwd = NULL;
++	}
+ 
+ 	if (cur->name[0] == '*') {
+ 	    continue;
+@@ -1242,19 +1248,32 @@ static int sql_auxprop_store(void *glob_context,
+ 	}
+ 	sparams->utils->free(statement);
+ 
++	if (cur->values[0]) {
++	    escap_passwd = (char *)sparams->utils->malloc(strlen(cur->values[0])*2+1);
++	    if (!escap_passwd) {
++		ret = SASL_NOMEM;
++		break;
++	    }
++	    settings->sql_engine->sql_escape_str(escap_passwd, cur->values[0]);
++	}
++
+ 	/* create a statement that we will use */
+ 	statement = sql_create_statement(cmd, cur->name, escap_userid,
+ 					 escap_realm,
+-					 cur->values && cur->values[0] ?
+-					 cur->values[0] : SQL_NULL_VALUE,
++					 escap_passwd ?
++					 escap_passwd : SQL_NULL_VALUE,
+ 					 sparams->utils);
++	if (!statement) {
++	    ret = SASL_NOMEM;
++	    break;
++	}
+ 	
+ 	{
+ 	    char *log_statement =
+ 		sql_create_statement(cmd, cur->name,
+ 				     escap_userid,
+ 				     escap_realm,
+-				     cur->values && cur->values[0] ?
++				     escap_passwd ?
+ 				     "<omitted>" : SQL_NULL_VALUE,
+ 				     sparams->utils);
+ 	    sparams->utils->log(sparams->utils->conn, SASL_LOG_DEBUG,
+@@ -1287,6 +1306,7 @@ static int sql_auxprop_store(void *glob_context,
+   done:
+     if (escap_userid) sparams->utils->free(escap_userid);
+     if (escap_realm) sparams->utils->free(escap_realm);
++    if (escap_passwd) sparams->utils->free(escap_passwd);
+     if (conn) settings->sql_engine->sql_close(conn);
+     if (userid) sparams->utils->free(userid);
+     if (realm) sparams->utils->free(realm);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
index 98899dfd5..e344733ef 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/cyrusimap/cyrus-sasl;protocol=https;branch=cyrus-sas
            file://saslauthd.service \
            file://saslauthd.conf \
            file://CVE-2019-19906.patch \
+	   file://CVE-2022-24407.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
-- 
2.25.1


