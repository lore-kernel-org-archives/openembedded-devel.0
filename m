Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F362EC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 04:24:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.39254.1655785482118142759
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jun 2022 21:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=b2nt8JJK;
 spf=pass (domain: mvista.com, ip: 209.85.210.177,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id i64so11966430pfc.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jun 2022 21:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=af7tIwZ8YwQ7X8FmLGvf+1OWyvkjCzfrL6jxz/6kr+g=;
        b=b2nt8JJKc8dy6nGoW0/snVxJyKLxQOWj2HA9yrbxERPm7zxKPAPLMB0cCOEEejk5kC
         1oRg9F3/ikZ+xlKQylrka7QOMppDts4/p7Ix5cVKQtFbdD1Neu/nwHrIw1XkVc/9e+RP
         1n5NbiToPw0zgxt2lVdHXOsCP6icBmkLLZYSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=af7tIwZ8YwQ7X8FmLGvf+1OWyvkjCzfrL6jxz/6kr+g=;
        b=alehaCVyYFMdc50VJikWJvQikYnQQhrA/O2RKtntqoPAhh6Axkkfh6itikhNlegyzw
         9JUOeQwfoRurAvpxcEuBJVzRYL1qb9MpKKUApk6nZn/xvXizu3sJXvdMijbDyt2hUeMx
         A3K77G+kZYuwisua32qLkeqjGYBBpumcG1Bbb4emf7kCep1b4oMiQ2HIR6gZ1poiw5Bd
         WZ/h/vK/wVD9EDogOfCiFMuuR9JpHtFqBsxZjkpynEHnAD27RFKA1YVgeixqcJlttuUR
         XQp9VloLJXID1QeE0B4kbEMJ36WJE4KPjuof4hvCWWyFtBbJa71318xZk3qi/oFknllP
         /SVg==
X-Gm-Message-State: AJIora+zNJMSB1npSDyDelU3C/DrWWZXDuMUha8n8yq2atuUv+SRa8px
	mMEvQf6f9x9PTeq41p2qmEJ96UOJqZ2of7/v
X-Google-Smtp-Source: 
 AGRyM1t91SwWiXXGSnI5KxQjNIHcThmLK/pe4Vg+9Qr609fK7tMfIT45yDCvwyrLouVE46nfLTdudA==
X-Received: by 2002:a63:ae4a:0:b0:40c:2d48:5fda with SMTP id
 e10-20020a63ae4a000000b0040c2d485fdamr22228491pgp.434.1655785480907;
        Mon, 20 Jun 2022 21:24:40 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.226])
        by smtp.gmail.com with ESMTPSA id
 a6-20020a1709027e4600b0015e8d4eb218sm9441349pln.98.2022.06.20.21.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 21:24:40 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Tue, 21 Jun 2022 09:54:35 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] cyrus-sasl: CVE-2022-24407 failure
 to properly escape SQL input allows an attacker to execute arbitrary SQL
 commands
Date: Tue, 21 Jun 2022 09:54:34 +0530
Message-Id: <20220621042434.6667-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jun 2022 04:24:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97548

Source: https://github.com/cyrusimap/cyrus-sasl
MR: 118501
Type: Security Fix
Disposition: Backport from https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc
ChangeID: 5e0fc4c28d97b498128e4aa5d3e7c012e914ef51
Description:
       CVE-2022-24407 cyrus-sasl: failure to properly escape SQL input allows an attacker to execute arbitrary SQL commands.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../cyrus-sasl/CVE-2022-24407.patch           | 83 +++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.27.bb           |  1 +
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
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index db5f94444..3e7056d67 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/cyrusimap/cyrus-sasl;protocol=https;branch=master \
            file://0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch \
            file://0001-makeinit.sh-fix-parallel-build-issue.patch \
            file://CVE-2019-19906.patch \
+           file://CVE-2022-24407.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
-- 
2.25.1


