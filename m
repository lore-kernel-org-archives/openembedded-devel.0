Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEBDFF8863
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 13:04:32 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18293.1777208667580039314
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 06:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kMP0i41p;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b7adb38d65so31705015ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 06:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208667; x=1777813467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRaQJ1pKtPYxyXz2lWB+jghY3qu8OBl9InkPUKLOsko=;
        b=kMP0i41pzbnw7q0PKXtmg7WVPMkxTUYf+4YiBKR+m1XHLOiNmOh1irdsem6wec3Mwn
         jQ/FeyBptCzSX4irKg1oj8qv8WEvkNBiEbmgIMxCU9KKHd6+MVm+e/I3gUsdnpLQFfGP
         kZB4z8HjD0gGsfSovDVY/X26+ZDuPomliV1ck8ExGFyBFmN9/K24EyJBd24nuAg5NkM+
         1H/Ni4/bu7PC0JF2m88jlX6+NniIjLe0KI/7bBuvU5RXmT6AGoKoX4Ie24fXDFORI5N9
         X79WTqP5yVW1RP2SJzFdnlT9jgw54osM4D/fA/Khcjul/PCxyECWtxy6LO+ugiBquLg2
         /Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208667; x=1777813467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fRaQJ1pKtPYxyXz2lWB+jghY3qu8OBl9InkPUKLOsko=;
        b=Tm7FHMpqP5wtHAOqX6JeNjgx+yjgtp2W5vK8zD2oIg8JMivZM0CTnIRPz5pTxWQef8
         4mB3B7adB98GFmDR3l3Pvpdb+RHEEJnQbFHgfC5f28gWyTf4CSUnbHPQIwv1bSTLoHmC
         fjauOLk3PqkEa69HW9cpKRZn+XYYAgG5/1XVBe8mKY0muEZRBaT4lQfx19xaPaYdTq+c
         w8yDUL49M4/0L/BgB1/k2eSRJ77fMd9FAbUuEebht9TgvwJ2IAtjdeDQKi69fRWNxU7V
         4Xefe1G4SSXrEkFb1q0VXU4gxYBA9zNM2m799XammpDDHUc/cFLk+j5Uu9UvS62nAPQr
         YK6A==
X-Gm-Message-State: AOJu0YwBsWJh4LF2C5r90lEO/myAh1UcUVrNKFRFvPCYJ5oYy2a1yAZD
	ImdYHorQc5QLYtKItOjhxTMBHjtknPLATu3VOK0QYXspUtw77DIzIDaPb3Ji3IKN
X-Gm-Gg: AeBDieuqMxYPQhZ1rVtrf5a6IKgqbV0EMI31jl4oW9CJZNGA/DW+RkvHHQA+JE8Meib
	433PALNx0d9fqCuglcYOq+lunYjEGIswwGWkC0b0ZPcgTSiyJkguQDdveiY5Z2ve2Zqc14YkY09
	wfAdh65BTxwStQQYTb+HiRAeGdqvuT3QoD99IqRamp4mAtpJ3nlTScgkBpeNsjgAh/haWz412vH
	i7h0VbFxDEiJDdA1ZQ5xIKvZFswSoSaq62q9CPNn1KPIdGedkvOdt403VSgdEHPGMMGBpXY5pMZ
	ugcsk7isDPxE+MwTJs/Gp15sybPZJlcIB4VzWzk+kOguhqnyP/oVUSQetQfLezQqssUTr5ILqsA
	fbl0u7eLg+8UBYE7sblrPPUpEgnB0GuYrlyD0UGnY+aapLIqt6mBUFnuaNiOf9ruZUkqhGK2TQW
	Q7ZwXT8zl8GXe1pqT4W4ztFBO1kU9nh6S2i+XV1EbDCdLq9bs=
X-Received: by 2002:a17:903:fa3:b0:2b2:53f5:4627 with SMTP id d9443c01a7336-2b5f9e64dd5mr425740285ad.4.1777208666724;
        Sun, 26 Apr 2026 06:04:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm277490935ad.3.2026.04.26.06.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:04:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 9/9] opensc: patch CVE-2025-66215
Date: Mon, 27 Apr 2026 01:03:51 +1200
Message-ID: <20260426130351.793052-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
References: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 13:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126625

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-66215

Backport the patches referenced by the PR[1] mentioned in the nvd.
Dropped the formatting commit from the backport.

[1] https://github.com/OpenSC/OpenSC/pull/3436

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opensc/files/CVE-2025-66215-1.patch       | 29 +++++++++
 .../opensc/files/CVE-2025-66215-2.patch       | 37 +++++++++++
 .../opensc/files/CVE-2025-66215-3.patch       | 45 ++++++++++++++
 .../opensc/files/CVE-2025-66215-4.patch       | 62 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.25.1.bb   |  4 ++
 5 files changed, 177 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66215-1.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66215-2.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66215-3.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66215-4.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2025-66215-1.patch b/meta-oe/recipes-support/opensc/files/CVE-2025-66215-1.patch
new file mode 100644
index 0000000000..ac2926b5e6
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2025-66215-1.patch
@@ -0,0 +1,29 @@
+From 74a72d3a82d1f49d55ef822ededec74738a30ec4 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Wed, 4 Jun 2025 00:52:13 +0200
+Subject: [PATCH] fixed  Stack-buffer-overflow WRITE
+
+fixes https://issues.oss-fuzz.com/issues/421520684
+
+(cherry picked from commit eab4d17866bb457dd86d067b304294e9f6671d52)
+
+CVE: CVE-2025-66215
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/eab4d17866bb457dd86d067b304294e9f6671d52]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libopensc/card-oberthur.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libopensc/card-oberthur.c b/src/libopensc/card-oberthur.c
+index d5445f01a..a8aba7992 100644
+--- a/src/libopensc/card-oberthur.c
++++ b/src/libopensc/card-oberthur.c
+@@ -1135,7 +1135,7 @@ auth_compute_signature(struct sc_card *card, const unsigned char *in, size_t ile
+ 	apdu.lc = ilen;
+ 	apdu.le = olen > 256 ? 256 : olen;
+ 	apdu.resp = resp;
+-	apdu.resplen = olen;
++	apdu.resplen = SC_MAX_APDU_BUFFER_SIZE;
+ 
+ 	rv = sc_transmit_apdu(card, &apdu);
+ 	LOG_TEST_RET(card->ctx, rv, "APDU transmit failed");
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2025-66215-2.patch b/meta-oe/recipes-support/opensc/files/CVE-2025-66215-2.patch
new file mode 100644
index 0000000000..316ac974b2
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2025-66215-2.patch
@@ -0,0 +1,37 @@
+From 5f8c904577cce1a6e21f793ba4aab1c473ff4136 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Wed, 4 Jun 2025 01:07:56 +0200
+Subject: [PATCH] oberthur: fixed potential Stack-buffer-overflow WRITE
+
+(cherry picked from commit 3402a90d8c9be223d4cf6abe009a4707117d7972)
+
+CVE: CVE-2025-66215
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/3402a90d8c9be223d4cf6abe009a4707117d7972]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libopensc/card-oberthur.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/libopensc/card-oberthur.c b/src/libopensc/card-oberthur.c
+index a8aba7992..216640ebd 100644
+--- a/src/libopensc/card-oberthur.c
++++ b/src/libopensc/card-oberthur.c
+@@ -2246,14 +2246,16 @@ auth_read_record(struct sc_card *card, unsigned int nr_rec, unsigned int idx,
+ 	if (flags & SC_RECORD_BY_REC_NR)
+ 		apdu.p2 |= 0x04;
+ 
+-	apdu.le = count;
+-	apdu.resplen = count;
++	apdu.le = count > SC_MAX_APDU_BUFFER_SIZE ? SC_MAX_APDU_BUFFER_SIZE : count;
++	apdu.resplen = SC_MAX_APDU_BUFFER_SIZE;
+ 	apdu.resp = recvbuf;
+ 
+ 	rv = sc_transmit_apdu(card, &apdu);
+ 	LOG_TEST_RET(card->ctx, rv, "APDU transmit failed");
+ 	if (apdu.resplen == 0)
+ 		LOG_FUNC_RETURN(card->ctx, sc_check_sw(card, apdu.sw1, apdu.sw2));
++	if (count < apdu.resplen)
++		LOG_FUNC_RETURN(card->ctx, SC_ERROR_WRONG_LENGTH);
+ 	memcpy(buf, recvbuf, apdu.resplen);
+ 
+ 	rv = sc_check_sw(card, apdu.sw1, apdu.sw2);
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2025-66215-3.patch b/meta-oe/recipes-support/opensc/files/CVE-2025-66215-3.patch
new file mode 100644
index 0000000000..5857abe07f
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2025-66215-3.patch
@@ -0,0 +1,45 @@
+From 4db6d034c9566e903e4c1094beccaf05efc4e7e5 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Thu, 5 Jun 2025 13:18:15 +0200
+Subject: [PATCH] oberthur: use MIN where possible
+
+(cherry picked from commit a4bbf8a631537a4c0083b264095ed1cd36d307ab)
+
+CVE: CVE-2025-66215
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/a4bbf8a631537a4c0083b264095ed1cd36d307ab]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libopensc/card-oberthur.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/libopensc/card-oberthur.c b/src/libopensc/card-oberthur.c
+index 216640ebd..3e7a7b6b9 100644
+--- a/src/libopensc/card-oberthur.c
++++ b/src/libopensc/card-oberthur.c
+@@ -606,7 +606,7 @@ auth_list_files(struct sc_card *card, unsigned char *buf, size_t buflen)
+ 	if (apdu.resplen == 0x100 && rbuf[0]==0 && rbuf[1]==0)
+ 		LOG_FUNC_RETURN(card->ctx, 0);
+ 
+-	buflen = buflen < apdu.resplen ? buflen : apdu.resplen;
++	buflen = MIN(buflen, apdu.resplen);
+ 	memcpy(buf, rbuf, buflen);
+ 
+ 	LOG_FUNC_RETURN(card->ctx, (int)buflen);
+@@ -1133,7 +1133,7 @@ auth_compute_signature(struct sc_card *card, const unsigned char *in, size_t ile
+ 	apdu.datalen = ilen;
+ 	apdu.data = in;
+ 	apdu.lc = ilen;
+-	apdu.le = olen > 256 ? 256 : olen;
++	apdu.le = MIN(olen, 256);
+ 	apdu.resp = resp;
+ 	apdu.resplen = SC_MAX_APDU_BUFFER_SIZE;
+ 
+@@ -2246,7 +2246,7 @@ auth_read_record(struct sc_card *card, unsigned int nr_rec, unsigned int idx,
+ 	if (flags & SC_RECORD_BY_REC_NR)
+ 		apdu.p2 |= 0x04;
+ 
+-	apdu.le = count > SC_MAX_APDU_BUFFER_SIZE ? SC_MAX_APDU_BUFFER_SIZE : count;
++	apdu.le = MIN(count, SC_MAX_APDU_BUFFER_SIZE);
+ 	apdu.resplen = SC_MAX_APDU_BUFFER_SIZE;
+ 	apdu.resp = recvbuf;
+ 
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2025-66215-4.patch b/meta-oe/recipes-support/opensc/files/CVE-2025-66215-4.patch
new file mode 100644
index 0000000000..80816aa57b
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2025-66215-4.patch
@@ -0,0 +1,62 @@
+From 665871f38aee0d52eba923783d4606becc7628d0 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Thu, 5 Jun 2025 14:04:35 +0200
+Subject: [PATCH] oberthur: use SC_MAX_APDU_RESP_SIZE where possible
+
+(cherry picked from commit 56bc5e9575965461d99a274be45d71c18ab6eae0)
+
+CVE: CVE-2025-66215
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/56bc5e9575965461d99a274be45d71c18ab6eae0]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libopensc/card-oberthur.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/libopensc/card-oberthur.c b/src/libopensc/card-oberthur.c
+index 3e7a7b6b9..159b84aed 100644
+--- a/src/libopensc/card-oberthur.c
++++ b/src/libopensc/card-oberthur.c
+@@ -1133,7 +1133,7 @@ auth_compute_signature(struct sc_card *card, const unsigned char *in, size_t ile
+ 	apdu.datalen = ilen;
+ 	apdu.data = in;
+ 	apdu.lc = ilen;
+-	apdu.le = MIN(olen, 256);
++	apdu.le = MIN(olen, SC_MAX_APDU_RESP_SIZE);
+ 	apdu.resp = resp;
+ 	apdu.resplen = SC_MAX_APDU_BUFFER_SIZE;
+ 
+@@ -1180,14 +1180,14 @@ auth_decipher(struct sc_card *card, const unsigned char *in, size_t inlen,
+ 	}
+ 
+ 	_inlen = inlen;
+-	if (_inlen == 256)   {
++	if (_inlen == SC_MAX_APDU_RESP_SIZE)   {
+ 		apdu.cla |= 0x10;
+ 		apdu.data = in;
+ 		apdu.datalen = 8;
+ 		apdu.resp = resp;
+ 		apdu.resplen = SC_MAX_APDU_BUFFER_SIZE;
+ 		apdu.lc = 8;
+-		apdu.le = 256;
++		apdu.le = SC_MAX_APDU_RESP_SIZE;
+ 
+ 		rv = sc_transmit_apdu(card, &apdu);
+ 		sc_log(card->ctx, "rv %i", rv);
+@@ -1504,7 +1504,7 @@ auth_read_component(struct sc_card *card, enum SC_CARDCTL_OBERTHUR_KEY_TYPE type
+ {
+ 	struct sc_apdu apdu;
+ 	int rv;
+-	unsigned char resp[256];
++	unsigned char resp[SC_MAX_APDU_RESP_SIZE];
+ 
+ 	LOG_FUNC_CALLED(card->ctx);
+ 	sc_log(card->ctx, "num %i, outlen %"SC_FORMAT_LEN_SIZE_T"u, type %i",
+@@ -2160,7 +2160,7 @@ auth_read_binary(struct sc_card *card, unsigned int offset,
+ 	if (auth_current_ef->magic==SC_FILE_MAGIC &&
+ 			auth_current_ef->ef_structure == SC_CARDCTL_OBERTHUR_KEY_RSA_PUBLIC)   {
+ 		int jj;
+-		unsigned char resp[256];
++		unsigned char resp[SC_MAX_APDU_RESP_SIZE];
+ 		size_t resp_len, out_len;
+ 		struct sc_pkcs15_pubkey_rsa key;
+ 
diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
index 6772fe02f7..5f4382642c 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -20,6 +20,10 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=stable-0.25;protocol=https \
            file://CVE-2025-49010.patch \
            file://CVE-2025-66037.patch \
            file://CVE-2025-66038.patch \
+           file://CVE-2025-66215-1.patch \
+           file://CVE-2025-66215-2.patch \
+           file://CVE-2025-66215-3.patch \
+           file://CVE-2025-66215-4.patch \
          "
 DEPENDS = "virtual/libiconv openssl"
 

