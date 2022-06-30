Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC451C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 04:01:58 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.20611.1656561706748793595
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hIG2fkw8;
 spf=pass (domain: mvista.com, ip: 209.85.210.169,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id a15so16914384pfv.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6WB18s2pgOu4lrYOb07tr42L+jmLAuqShNtBzvxWs+w=;
        b=hIG2fkw8JRGVcxkRqxSPcodS6m1ySBoP3vSNbRWWu6uMnSTA8xT/Yon3KOeRHdQnd8
         R3GwjRoldHNLVnJLEuAnvzfgk+q6RGpIDG1NjPMB6ri6FH2BcLGm3hhbdLUI2A2Iv2nB
         3zphiLmpXGP/TiE9jjofKN6QTuq3EvZGycmCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6WB18s2pgOu4lrYOb07tr42L+jmLAuqShNtBzvxWs+w=;
        b=hTSCuBukG6wzlSaOHgsjXudBW/QKAfFv2ahWX3v2ytahrqMJmUT4mRWGAexrTRZo1w
         zuG9GyaD1AR3z3m1ld9ky862bxGdeS+e4kWTVnggQOgYrsg+NtSfndl8rza4J1/hzQXP
         68KmbgGk3CcIHbR1SIqFx/dg0JK5/avFamsy2sPoW6sExbJ/dx4J0JoRRzjbGen2EID2
         Il+4uES469KVJ7wWKQfF/0jh7U1SlRQfy80/gUX2eaVAI14C0dMPI2rjCDVTymVefZB3
         htIUWyf3UUv+KlOFQOgldQeAiqlSwlx/OfcsfVHk3WIbUh7HhXdPsTPbbMHAK9YcMTuM
         BpAQ==
X-Gm-Message-State: AJIora9X/rS3zWqFrMarhU+aj1F2julqc+KZjcc2Zuw+xptF8B4/d2S+
	NTF2mMHLlRtoePtfLojJUtRjZOhr6QnfPw==
X-Google-Smtp-Source: 
 AGRyM1tfPD+LQ6olzcqpDdvPnZK5bIRvDfFMhULs8xBwJb7F0IQWtzMArPXC/uTagnn/J0pGfR6PpA==
X-Received: by 2002:a05:6a00:16c3:b0:528:1ed:22ef with SMTP id
 l3-20020a056a0016c300b0052801ed22efmr4550587pfc.0.1656561705842;
        Wed, 29 Jun 2022 21:01:45 -0700 (PDT)
Received: from MVIN00024 ([27.121.101.82])
        by smtp.gmail.com with ESMTPSA id
 2-20020a170902e9c200b00168ba5ac8adsm12225637plk.163.2022.06.29.21.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 21:01:45 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Thu, 30 Jun 2022 09:31:40 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][master][PATCH] cyrus-sasl: CVE-2022-24407 failure to
 properly escape SQL  input allows an attacker to execute arbitrary SQL
 commands
Date: Thu, 30 Jun 2022 09:31:38 +0530
Message-Id: <20220630040138.6776-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 04:01:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97633

Backport from https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc
CVE-2022-24407 cyrus-sasl: failure to properly escape SQL input allows an attacker to execute arbitrary SQL commands.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../cyrus-sasl/CVE-2022-24407.patch           | 83 +++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.28.bb           |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch

diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
new file mode 100644
index 000000000..0ddea03c6
--- /dev/null
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
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
diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
index 98899dfd5..0b2ce3639 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/cyrusimap/cyrus-sasl;protocol=https;branch=cyrus-sas
            file://saslauthd.service \
            file://saslauthd.conf \
            file://CVE-2019-19906.patch \
+           file://CVE-2022-24407.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
-- 
2.25.1


