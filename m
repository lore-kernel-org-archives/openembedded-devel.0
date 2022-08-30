Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0476C0502A
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:42 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.8678.1661843666714321084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eqK6ekmt;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id jm11so10228971plb.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zSDH60LIzHWsQ7Tt2pWBxvWc/p5R66sROf5LdTU3lQ0=;
        b=eqK6ekmt3VVCxPTgV/DwPxQqP2YYZzG35LsZHE4EKy6zASCSKIJEZIfdD1poakfOy6
         sixBujmiMairfJpP3OB62L4WpUJr3VHj8VivLl8FgYWlvWcwW3ZSIeAAdsQyEl7KQSfe
         4cxMrzo6/H1hIVKvBU/p6HcHVy+hSH0jp+IRh3p/q8wCVxvFfTz/3ExmzXNuuBa9wAzF
         9S2r0iBNZHjAWhhqtX8qDoxKucBKlbfolYLnTVHxkQ6Wtde75sub+XM3QJ4XOq0KF6ay
         v7iADt+vXrG6B0Utv3r6VxoPx9Q3HfTk5ShOVmF0VJVtEDTwV4YIC58UFWXBdPdds0Rt
         6R/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zSDH60LIzHWsQ7Tt2pWBxvWc/p5R66sROf5LdTU3lQ0=;
        b=zyX3ohvdbb5yGs0P/mlJHM6oOxTe8LMZ1klKw+sCimse5IaiezHnr+jZkXSriNr4Nz
         HKdpa8XYUSjWMNQ0ObocuOtvZRswRK9V3WhtJwQzZWCtysA6CMHm6IJabeHx26lp6VTi
         XPYSJhzV46RcoKNtdzfcOQSWpXZ9TArJcLmiwGPuKhDgP0KhVLJCeGBGU9e9dCov5if0
         y6f8J805EkI+SpMzMtN3f8RVJg08gtYXAvTHBbN2d5M6Oq4wU0T0QsDccradvYlVVbGP
         3mmWJSd1lIQt4FmQQvWsPDub/9cmsdhdYuWAZ1P15Q53NhwMxn0MPEViBXpM1Bw/QabP
         +eiA==
X-Gm-Message-State: ACgBeo1oeon+MCgRC3gjzUbYEn/KbapjNTS7JhZf/BaKDJ+qDARZ7pii
	sUBChEoFe3bOOyBksOm+87D91jbw2lWRzg==
X-Google-Smtp-Source: 
 AA6agR6MqcW8EBwAdUQHA2xoSLoxq7MzFZdsxJl4ARG35/YY0lOhMFh/I6C2g0frqe3naaDLCeuNJg==
X-Received: by 2002:a17:903:2311:b0:174:7160:77e0 with SMTP id
 d17-20020a170903231100b00174716077e0mr14079959plh.154.1661843673677;
        Tue, 30 Aug 2022 00:14:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 20/21] openl2tp: Provide prototype for
 l2tp_api_rpc_check_request
Date: Tue, 30 Aug 2022 00:14:12 -0700
Message-Id: <20220830071413.3887189-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98557

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...c-Add-missing-prototype-for-l2tp_api.patch | 28 ++++++++++++
 ...yacc-Add-missing-function-prototypes.patch | 45 +++++++++++++++++++
 .../openl2tp/openl2tp_1.8.bb                  |  2 +
 3 files changed, 75 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_rpc_server.c-Add-missing-prototype-for-l2tp_api.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0001-lex-yacc-Add-missing-function-prototypes.patch

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_rpc_server.c-Add-missing-prototype-for-l2tp_api.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_rpc_server.c-Add-missing-prototype-for-l2tp_api.patch
new file mode 100644
index 0000000000..d9aed8804a
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_rpc_server.c-Add-missing-prototype-for-l2tp_api.patch
@@ -0,0 +1,28 @@
+From ded84ed583e9b0617bc35ab1798032d18b873144 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 23:30:02 -0700
+Subject: [PATCH] l2tp_rpc_server.c: Add missing prototype for
+ l2tp_api_rpc_check_request
+
+Upstream-Status: Inappropriate [no upstream]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 0815b31..2fa5b2f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -236,6 +236,7 @@ endif
+ 			-$(RM) $@ $@.tmp
+ 			$(RPCGEN) $(RPCGENFLAGS) -m -o $@.tmp $<
+ 			cat $@.tmp | sed -e 's/switch (rqstp->rq_proc) {/if (l2tp_api_rpc_check_request(transp) < 0) return; switch (rqstp->rq_proc) {/' > $@
++			sed -i '21i int l2tp_api_rpc_check_request(SVCXPRT *xprt);' $@
+ 
+ %_client.c:		%.x
+ 			-$(RM) $@
+-- 
+2.37.2
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-lex-yacc-Add-missing-function-prototypes.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-lex-yacc-Add-missing-function-prototypes.patch
new file mode 100644
index 0000000000..8c21a742e0
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-lex-yacc-Add-missing-function-prototypes.patch
@@ -0,0 +1,45 @@
+From 2bfdd02d288de92ff118bf41b54c135a6a318c19 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 23:42:11 -0700
+Subject: [PATCH] lex/yacc: Add missing function prototypes
+
+Fixes build with clang15
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ l2tp_config_parse.y | 3 +++
+ l2tp_config_token.l | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/l2tp_config_parse.y b/l2tp_config_parse.y
+index 4baf1e0..15392d0 100644
+--- a/l2tp_config_parse.y
++++ b/l2tp_config_parse.y
+@@ -29,6 +29,9 @@ static struct l2tp_api_session_msg_data session;
+ 
+ extern void l2tp_log(int level, char *fmt, ...);
+ extern void yyfatal(const char *s);
++extern const char *l2tp_strerror(int error);
++extern int yylex (void);
++extern void yyerror(const char *s);
+ 
+ %}
+ 
+diff --git a/l2tp_config_token.l b/l2tp_config_token.l
+index 9016af6..43b8f0a 100644
+--- a/l2tp_config_token.l
++++ b/l2tp_config_token.l
+@@ -15,6 +15,9 @@
+ #include "l2tp_config_types.h"
+ #include "l2tp_config_parse.h"
+ 
++extern void l2tp_log(int level, char *fmt, ...);
++extern const char *l2tp_strerror(int error);
++
+ void yyfatal(const char *s);
+ void yyerror(const char *s);
+ 
+-- 
+2.37.2
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 15cebf40f1..183c0066df 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -35,6 +35,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://run-ptest \
            file://fix_linux_4.15_compile.patch \
            file://0002-user-ipv6-structures.patch \
+           file://0001-l2tp_rpc_server.c-Add-missing-prototype-for-l2tp_api.patch \
+           file://0001-lex-yacc-Add-missing-function-prototypes.patch \
            "
 SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
 SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
-- 
2.37.2


