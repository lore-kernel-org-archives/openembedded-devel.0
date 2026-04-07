Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC53EDB7E5
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 09:52:52 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77624.1775555569189988525
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 02:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gDx00BFF;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so10953765e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 02:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775555567; x=1776160367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ne1AvBzyqORogGygIHHNihkmXzzc5mZ7Qgud3hcwc4c=;
        b=gDx00BFFa2fO6ENPZSl3iEdskiuhAxIs3gKoCEFDQVcxuFeJOu6pWZAwhobsiAhuQA
         /ly/+asJM9Mpa4V/5bTlvC+SUSOSAOrOsYTJldAe+8r5m8OMCNXzLtAbRoCraxljY4ft
         GYPFBnrW6Ywk6F5Nnv2smtOK8sQN4uuJnWa0GDslBnXMTPc4mVObsGAFppseia2b1MnT
         w0pYwKDQknm6+dV8JK4wOBLuN2V66I0yqblyyQvpL8vXi7CXk9/Q8GrYRIPWcxjdVDEf
         rwTo6zAGoC7gq27dumrYYBldl1PYRaWms6TDuI4M5y+40Uvu47m5AsIQIs8o7ER9FnY8
         AJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775555567; x=1776160367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ne1AvBzyqORogGygIHHNihkmXzzc5mZ7Qgud3hcwc4c=;
        b=mSzDL8IB1XaE6zCfcB1D8e4aqacJk/qOiSo7ka1nr052ug2AxsmeQw0gL86eNtCsdb
         Mw+Fn5oFSQ4CSOnownm9jkoQoV9IjyFvcCWKevKLPSlMnm6g2NYudS+tnySZLII9mThT
         ewcf599kyFN6b4iPCz0zgvrDUldyso7sv0qAqysYBgXWqsTqtzjCzO6UiyaVxvBgIExl
         uXWruF3Qkt0o5T3UPEc3W2zav7FXFr4jGE0qwt2+GEi+tUscqQzWPWUisvzI+C9Dve1N
         BnmkkdYZaXpAbbpkYTml/RhXvRaVwvHmJnblio1IjwigwSOXOIgMXNEqrcZOf1s0MTui
         3Hjw==
X-Gm-Message-State: AOJu0Yw6HQSf9udgqlH2E/j7quhOFwBcEzFuEgFodTlK+Aqiq6Ly9DSp
	UYQ3d18b8a0mk0EqMI7mQjPaXdkDafnaNoxiq7iE1loBUvyx4DRkBldS8o0CRg==
X-Gm-Gg: AeBDiesRDUUqK/P+yFEt4Yk4tQSSA4CDadA8ZVP+hW4T1vRX2flCHtPLD+kDTZkLDab
	Jdg/StA2ToU0Q4jsouZhgZnOp+zVvX+bl64ZEJldHSjU6kgoNxRHnbKgG+xb6UZGo0KFXtYzPvY
	7BM4hV/q9EwuoNbAArCtt4ifqcGciPEqlBKOtwJ9w4SKnh68PS7wbkStWmkR0KirOulBkKRGiY0
	FjJowDISf1dU5vB/06mY+7ntpSUPocU1pAe0R2ilFfZWAozCUCzgt6nUjm6i7D40vZc4riL8BjZ
	KSjJLAWWQwMNcUvOGp3zOO3d4pxDdJ3J8lmZAod87TiHGD7hqERPTtvVxxrR6IVL5w9OWKdBfPx
	p33ACDHM6mvIamMELLTo/OUToFJ0BZpq6MJqYSVMlzc6KXHghDbBA7PkjzqLCI5NnG0VK9DDCS/
	7EqrU5B9qFf6g603s3g3L1fY6HHADviSE=
X-Received: by 2002:a05:600c:4593:b0:488:9696:488a with SMTP id 5b1f17b1804b1-488997e7dc7mr266824145e9.30.1775555567329;
        Tue, 07 Apr 2026 02:52:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eccecasm113877725e9.34.2026.04.07.02.52.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:52:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 1/3] opensc: patch CVE-2025-49010
Date: Tue,  7 Apr 2026 11:52:43 +0200
Message-ID: <20260407095245.3971755-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 09:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126082

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-49010

Backport the patch that is referenced by the upstream wiki
page[1] that is related to this vulnerability.

[1]: https://github.com/OpenSC/OpenSC/wiki/CVE-2025-49010

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../opensc/opensc/CVE-2025-49010.patch        | 71 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.26.1.bb   |  4 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2025-49010.patch

diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2025-49010.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2025-49010.patch
new file mode 100644
index 0000000000..6d869d2983
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2025-49010.patch
@@ -0,0 +1,71 @@
+From 02cce9f62a3c28aac4bee4741817a864f1f76d24 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Thu, 22 May 2025 00:24:32 +0200
+Subject: [PATCH] fixed Stack-buffer-overflow WRITE in GET RESPONSE
+
+The do-while loop in apdu.c requires the output data to be set in any
+case, otherwise non existent data may be copied to the output data.
+
+fixes https://issues.oss-fuzz.com/issues/416351800
+fixes https://issues.oss-fuzz.com/issues/416295951
+
+CVE: CVE-2025-49010
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/953986f65db61871bbbff72788d861d67d5140c6]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libopensc/card-nqApplet.c | 11 ++++++-----
+ src/libopensc/iso7816.c       |  5 +++--
+ 2 files changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/src/libopensc/card-nqApplet.c b/src/libopensc/card-nqApplet.c
+index f9075b948..90706f4b1 100644
+--- a/src/libopensc/card-nqApplet.c
++++ b/src/libopensc/card-nqApplet.c
+@@ -190,9 +190,10 @@ static int nqapplet_finish(struct sc_card *card)
+ 	LOG_FUNC_RETURN(card->ctx, SC_SUCCESS);
+ }
+ 
+-static int nqapplet_get_response(struct sc_card *card, size_t *cb_resp, u8 *resp)
++static int
++nqapplet_get_response(struct sc_card *card, size_t *cb_resp, u8 *resp)
+ {
+-	struct sc_apdu apdu;
++	struct sc_apdu apdu = {0};
+ 	int rv;
+ 	size_t resplen;
+ 
+@@ -204,12 +205,12 @@ static int nqapplet_get_response(struct sc_card *card, size_t *cb_resp, u8 *resp
+ 
+ 	rv = sc_transmit_apdu(card, &apdu);
+ 	LOG_TEST_RET(card->ctx, rv, "APDU transmit failed");
+-	if (apdu.resplen == 0) {
+-		LOG_FUNC_RETURN(card->ctx, sc_check_sw(card, apdu.sw1, apdu.sw2));
+-	}
+ 
+ 	*cb_resp = apdu.resplen;
+ 
++	if (apdu.resplen == 0) {
++		LOG_FUNC_RETURN(card->ctx, sc_check_sw(card, apdu.sw1, apdu.sw2));
++	}
+ 	if (apdu.sw1 == 0x90 && apdu.sw2 == 0x00) {
+ 		rv = SC_SUCCESS;
+ 	} else if (apdu.sw1 == 0x61) {
+diff --git a/src/libopensc/iso7816.c b/src/libopensc/iso7816.c
+index e17549cd1..8535ea1a4 100644
+--- a/src/libopensc/iso7816.c
++++ b/src/libopensc/iso7816.c
+@@ -920,11 +920,12 @@ iso7816_get_response(struct sc_card *card, size_t *count, u8 *buf)
+ 
+ 	r = sc_transmit_apdu(card, &apdu);
+ 	LOG_TEST_RET(card->ctx, r, "APDU transmit failed");
+-	if (apdu.resplen == 0)
+-		LOG_FUNC_RETURN(card->ctx, sc_check_sw(card, apdu.sw1, apdu.sw2));
+ 
+ 	*count = apdu.resplen;
+ 
++	if (apdu.resplen == 0) {
++		LOG_FUNC_RETURN(card->ctx, sc_check_sw(card, apdu.sw1, apdu.sw2));
++	}
+ 	if (apdu.sw1 == 0x90 && apdu.sw2 == 0x00)
+ 		r = 0;					/* no more data to read */
+ 	else if (apdu.sw1 == 0x61)
diff --git a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
index 78258c965a..3aed590347 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 DEPENDS = "openssl"
 
 SRCREV = "043343d2df7b09d1938bc3dc313d86a96be457cc"
-SRC_URI = "git://github.com/OpenSC/OpenSC;branch=0.26.1;protocol=https"
+SRC_URI = "git://github.com/OpenSC/OpenSC;branch=0.26.1;protocol=https \
+           file://CVE-2025-49010.patch \
+           "
 
 CVE_STATUS[CVE-2024-8443] = "fixed-version: this is fixed since 0.26.0"
 

