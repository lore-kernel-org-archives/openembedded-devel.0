Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAEB8FC619B
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 10:17:58 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.14996.1726827469113818778
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 03:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Z6sbqv/+;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso1453527a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1726827468; x=1727432268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z973f6/iXI6869qNf5sn8Dzgq6rr2z3LIDh+L7t/cJA=;
        b=Z6sbqv/+X6JooOLfyJdzkMdQkCPNgxWSo7vIp54Rl7R5ppegFsHR3jEoYTvq03iAko
         RbchTN815mxpxBQ6kWEL4UC3G6F5f14snjEJnoX5Iwu7bWCm/YiKuhKAfV09mqLLiH5u
         kFNOpyhY7xJsqBWDVj1pg26J0GaUanP18eo7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827468; x=1727432268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z973f6/iXI6869qNf5sn8Dzgq6rr2z3LIDh+L7t/cJA=;
        b=esRdVyH4bTdRRW8S/uqtUim8fuv7S3CtCVnCvIYeICZycyaKSozVsC8crGaDmaRAqo
         ugajICUcFsAnvWmOdbPOpDunGEEzsZTwdzTbAQfKBleGlJzpQY3XbNU2biZPBuy5PmLu
         3KK5Ts4+mfHUS4VEdfy2Qf39833yP5ndPj1VkW1pQVPZZwpCHl5wGacz7pdB4h6M4QoD
         rizHdM9tZf71UR5die7vP5Ql9vpe/pOjU36rsvWqq36R/ws2eBNkyCzsnZ7zJC67z8z8
         5f3zNXD7KJ412HH37kws6fhIF12ZfEHwf2V+MulIlMHwyXYVnkilDK+tFyZKJ8lupsaQ
         JXeQ==
X-Gm-Message-State: AOJu0Yz3P14DvTczVOtQ3azQGTzavQalKSOsRA9Y6wkuPKhbUw9BaHAW
	Y8XKGUoZ6WbPGwpglt+rK/cQ8VADTvPypGjpqLTKYT9RMSONFRrLqA8bczig7bgIGEhQWwTXByU
	W
X-Google-Smtp-Source: AGHT+IGt7RCbIwJCCOmjjDuwJY65SdZ/pWKc/3k7EggxNiXNG65PxP+1+vdVkWu+eJChbB2PSsx7NQ==
X-Received: by 2002:a05:6a21:9216:b0:1cf:506a:cdcc with SMTP id adf61e73a8af0-1d30cb65dedmr3320770637.43.1726827467972;
        Fri, 20 Sep 2024 03:17:47 -0700 (PDT)
Received: from MVIN00020.mvista.com ([223.185.50.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b9ad0esm9826259b3a.175.2024.09.20.03.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 03:17:47 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][kirkstone][PATCH] tgt: Security fix for CVE-2024-45751
Date: Fri, 20 Sep 2024 15:45:31 +0530
Message-Id: <20240920101531.106243-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 10:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112402

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/fujita/tgt/commit/abd8e0d987ab56013d360077202bf2aca20a42dd

Reference: https://ubuntu.com/security/CVE-2024-45751

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../tgt/files/CVE-2024-45751.patch            | 68 +++++++++++++++++++
 .../recipes-extended/tgt/tgt_git.bb           |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch

diff --git a/meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch b/meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch
new file mode 100644
index 000000000..e7f09c7e9
--- /dev/null
+++ b/meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch
@@ -0,0 +1,68 @@
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ usr/iscsi/chap.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/usr/iscsi/chap.c b/usr/iscsi/chap.c
+index aa0fc671..b89ecabd 100644
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
diff --git a/meta-networking/recipes-extended/tgt/tgt_git.bb b/meta-networking/recipes-extended/tgt/tgt_git.bb
index 42141cb72..28ea44893 100644
--- a/meta-networking/recipes-extended/tgt/tgt_git.bb
+++ b/meta-networking/recipes-extended/tgt/tgt_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/fujita/tgt.git;branch=master;protocol=https \
 	file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
         file://0001-usr-Makefile-WARNING-fix.patch \
         file://usr-Makefile-apply-LDFLAGS-to-all-executables.patch \
+        file://CVE-2024-45751.patch \
 "
 SRC_URI += "file://tgtd.init \
             file://tgtd.service \
-- 
2.25.1


