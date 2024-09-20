Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA7FCF58CD
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 05:38:37 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.11426.1726810714753683909
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Sep 2024 22:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OSovLLYM;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d8abac30ddso1497055a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 22:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1726810714; x=1727415514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Qusd3tFiJzwdO+SYllsuzu0/7/s/JfAMQm0wMO4Wyg=;
        b=OSovLLYMeCEBTq8v917IWdNsU0bcLs7S4AP55oZbpCTc+7pbq4UQIAJzOJGYWxwNJS
         VzKrvML6WkJcUYtLo/vYHR/BcUoblhhjFJ7dlFQWlT9cro4f8CGun0kX9gstGiIIj6ql
         YPYOx5Sx7XR4PQiQUL9Pvs9zwpVNHsKar5bAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726810714; x=1727415514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Qusd3tFiJzwdO+SYllsuzu0/7/s/JfAMQm0wMO4Wyg=;
        b=Gp1s1+Jt2sjv7u13AXFEyWJ8LxTRRKqPHQ9e0EjB8wfDaNiYnB0G/QxoahUl2E/0DH
         be5eS8xi4yL32qdUGj4Lj7jbgcHAImz7bISkDbthkjBnTAD93R1t6RFx7AdUhhRo7Avb
         I14AOrZco9AgfMQvEOB+nF4b+BBzFbgHDw8lAobb92fKAaOvy5c1VqPkix0DIbRKMN5S
         Yg45Ww+AhOmO/eNZCOulqKSosmRrgzWqN+9kgVeBIAINzldWPubD2CR0/B5mosEgf20Y
         Gt/oY0ER3KAk+2WrFcIt37fdiPpgep56XKDHJ6nY4AlGXKrWFa/D2rFP5aO5VI1vcwKt
         ojAg==
X-Gm-Message-State: AOJu0YyXXCDPDzbGTDdrPXa5JLOaffehMfn8xs+8sHF9BQzqJzlXhlUI
	oSn7oCDz2aPz1D43LrIBS/BpYI0Mz+8JqmuSqLAD6hNTkb/zoCB8mturMjeyw2im5eC6N7lvxzR
	V
X-Google-Smtp-Source: AGHT+IF9aF12CylvLew1VPGqXQE8JbFcjzt+3bzrnMTwWHUr9VXpFnI2hzOwE34JMUQOE4juJMJvnA==
X-Received: by 2002:a17:90b:4c05:b0:2d8:8681:44ba with SMTP id 98e67ed59e1d1-2dd7f3e4699mr2354637a91.15.1726810713877;
        Thu, 19 Sep 2024 22:38:33 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd7f95b31fsm889999a91.51.2024.09.19.22.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 22:38:33 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][scarthgap][PATCH] tgt: fix CVE-2024-45751
Date: Fri, 20 Sep 2024 11:08:25 +0530
Message-Id: <20240920053825.154315-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 05:38:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112392

Upstream-Status: Backport from https://github.com/fujita/tgt/commit/abd8e0d987ab56013d360077202bf2aca20a42dd

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../tgt/files/CVE-2024-45751.patch            | 71 +++++++++++++++++++
 .../recipes-extended/tgt/tgt_1.0.90.bb        |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch

diff --git a/meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch b/meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch
new file mode 100644
index 0000000000..2de9ae9b28
--- /dev/null
+++ b/meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch
@@ -0,0 +1,71 @@
+From abd8e0d987ab56013d360077202bf2aca20a42dd Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Tue, 3 Sep 2024 16:14:58 +0200
+Subject: [PATCH] chap: Use proper entropy source
+
+The challenge sent to the initiator is based on a poor
+source of randomness, it uses rand() without seeding it by srand().
+So the glibc PRNG is always seeded with 1 and as a consequence the
+sequence of challenges is always the same.
+
+An attacker which is able to monitor network traffic can apply a replay
+attack to bypass the CHAP authentication.  All the attacker has to do
+is waiting for the server or the service to restart and replay with a
+previously record CHAP session which fits into the sequence.
+
+To overcome the issue, use getrandom() to query the kernel random
+number generator.
+Also always send a challenge of length CHAP_CHALLENGE_MAX, there is no
+benefit in sending a variable length challenge.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+
+Upstream-Status: Backport [https://github.com/fujita/tgt/commit/abd8e0d987ab56013d360077202bf2aca20a42dd]
+CVE: CVE-2024-45751
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ usr/iscsi/chap.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/usr/iscsi/chap.c b/usr/iscsi/chap.c
+index aa0fc67..b89ecab 100644
+--- a/usr/iscsi/chap.c
++++ b/usr/iscsi/chap.c
+@@ -28,6 +28,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/random.h>
+ 
+ #include "iscsid.h"
+ #include "tgtd.h"
+@@ -359,22 +360,19 @@ static int chap_initiator_auth_create_challenge(struct iscsi_connection *conn)
+ 	sprintf(text, "%u", (unsigned char)conn->auth.chap.id);
+ 	text_key_add(conn, "CHAP_I", text);
+ 
+-	/*
+-	 * FIXME: does a random challenge length provide any benefits security-
+-	 * wise, or should we rather always use the max. allowed length of
+-	 * 1024 for the (unencoded) challenge?
+-	 */
+-	conn->auth.chap.challenge_size = (rand() % (CHAP_CHALLENGE_MAX / 2)) + CHAP_CHALLENGE_MAX / 2;
++	conn->auth.chap.challenge_size = CHAP_CHALLENGE_MAX;
+ 
+ 	conn->auth.chap.challenge = malloc(conn->auth.chap.challenge_size);
+ 	if (!conn->auth.chap.challenge)
+ 		return CHAP_TARGET_ERROR;
+ 
++	if (getrandom(conn->auth.chap.challenge, conn->auth.chap.challenge_size, 0) != conn->auth.chap.challenge_size)
++		return CHAP_TARGET_ERROR;
++
+ 	p = text;
+ 	strcpy(p, "0x");
+ 	p += 2;
+ 	for (i = 0; i < conn->auth.chap.challenge_size; i++) {
+-		conn->auth.chap.challenge[i] = rand();
+ 		sprintf(p, "%.2hhx", conn->auth.chap.challenge[i]);
+ 		p += 2;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
index 35995f7876..f70f77f540 100644
--- a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
+++ b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/fujita/tgt.git;branch=master;protocol=https \
         file://0001-usr-Makefile-WARNING-fix.patch \
         file://usr-Makefile-apply-LDFLAGS-to-all-executables.patch \
         file://musl-__wordsize.patch \
+        file://CVE-2024-45751.patch \
 "
 SRC_URI += "file://tgtd.init \
             file://tgtd.service \
-- 
2.25.1


