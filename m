Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B6EC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 04:12:15 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.80497.1656994323191023596
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 21:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gPFs2Rop;
 spf=pass (domain: mvista.com, ip: 209.85.215.181,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id o18so9175989pgu.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 21:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfqrcgMINhCW0Q35v0g4IwVNf3rSUIwbLElQZzvL1YY=;
        b=gPFs2Rop5QR9CfNtBvli6577eR5SaCtYdxS5HAV92cSlFVbqCXA1E+NPVd+4JYGhTw
         pj5xw9cpKEbzqoVK+SF9N/dBUY8qDfpapoUqH6YbCazHb99i6rYuygZb4EKJabDDd726
         o8PtcjQXQXmqgpndO8lT/4TMeJb3DVfQUi0aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfqrcgMINhCW0Q35v0g4IwVNf3rSUIwbLElQZzvL1YY=;
        b=2rpIXzZn7HJnN+ABBsA7kmwQu67jHVsLrRetDaGO5pP+oN+TmsBcN/0ek+Srpuy5D7
         9thMSh5kpgHQ+ek4TpEZjLZEHHvpFFqvpw2U5t1sELrU0IZM0DNlNoTYTlNmoswaMe20
         rdLRCMsLx1RAh9p/V1kXNASNsBBxbMHABwCBxsEzlwHgIf1whfI0sch3I+i0UDilQwGH
         nrEuNG3itgSm/CemrzBuw6pqorGHtRbQ0V77A8EeJvFN8eAtA9n9pIX0pJECsY6lN3Nw
         PI01Efgd2K133Pbk0bsXsGGbVATOpSHolRQhyDWetyzSGMh452usL7qg9JDoqP7OKucY
         UzYw==
X-Gm-Message-State: AJIora9sBl+gsLGJJleqhZWTeh2QBODloRzApC59mAxQ+fiUpDl6kfe8
	1KIYqzIkt9qWWhjAtEZyEetG7imiguXXsA==
X-Google-Smtp-Source: 
 AGRyM1u7rCqFlA17h1A/LWEfWUZxL2+EJ5LjSvy72AB2OeVTUWtQYnsydLmv/GfYMVYFGzVK445ZYg==
X-Received: by 2002:a05:6a00:80d:b0:525:b61f:6df2 with SMTP id
 m13-20020a056a00080d00b00525b61f6df2mr38992292pfk.66.1656994322104;
        Mon, 04 Jul 2022 21:12:02 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.198])
        by smtp.gmail.com with ESMTPSA id
 a3-20020a1709027e4300b0016b8b35d725sm15268933pln.95.2022.07.04.21.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 21:12:01 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Tue, 05 Jul 2022 09:41:56 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH V2] cyrus-sasl: CVE-2022-24407
 failure to properly escape SQL input allows an attacker to execute arbitrary
 SQL commands
Date: Tue,  5 Jul 2022 09:41:54 +0530
Message-Id: <20220705041154.36232-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 04:12:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97701

Source: https://github.com/cyrusimap/cyrus-sasl
MR: 118497
Type: Security Fix
Disposition: Backport from https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc
ChangeID: 4736aae2b7d8986787b1666cfd6eecd590915120
Description:
       CVE-2022-24407 cyrus-sasl: failure to properly escape SQL input allows an attacker to execute arbitrary SQL commands.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../cyrus-sasl/CVE-2022-24407.patch           | 27 +++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.28.bb           |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
new file mode 100644
index 000000000..3d67f4741
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
@@ -0,0 +1,27 @@
+From 078f98ea154475d953ce5b7cd851732f4dc270a7 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 5 Jul 2022 09:31:07 +0530
+Subject: [PATCH] CVE-2022-24407
+
+Upstream-Status: Backport [https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc]
+CVE: CVE-2022-24407
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ plugins/sql.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/plugins/sql.c b/plugins/sql.c
+index 6ac81c2f..d90dbac9 100644
+--- a/plugins/sql.c
++++ b/plugins/sql.c
+@@ -1127,6 +1127,7 @@ static int sql_auxprop_lookup(void *glob_context,
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


