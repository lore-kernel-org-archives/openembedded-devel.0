Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56FDFF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 13:04:22 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18289.1777208658648178521
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 06:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D/kC5T5Q;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so8666933a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 06:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208658; x=1777813458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cKITANQvp9RKO6UfOOy3O4CDjDMlXkgSEuwUWN9qCI=;
        b=D/kC5T5Q5yxAkew51Jl5Tl+kDRrVsUmjil71dklY0S/bGPRgmUeIV33vdeIChHPbYZ
         6C8DYLTqDC0odgP495b860Hr6uPRmJ6qHV1jbFomlEzTUDPSmLe4BQ6hOq1kKgPlst/Z
         Zx4+iC2O5QWEsrrZF7NiLAZdpxjWT+83WyLVzX2cR/seVen7RUrPU4NMEbK9Ya05bCzL
         0r5qnN4nFWD6idvGvhJAto7W29ATJgZfcX+0vJPlucdINQGOqxO3SvdShLFBwyBJnUGX
         aQpZJjnCN3AXHUd9B7e4RepkgS2A+Q+XMF59Sc9DfR3xirCQt6k12kkNS+4yOATpwstj
         1S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208658; x=1777813458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1cKITANQvp9RKO6UfOOy3O4CDjDMlXkgSEuwUWN9qCI=;
        b=WnwmW/DIo4ojWRklKWiGhsSqbu23YqyJcohg3WDrQ3Fcj+OVu9RFAL4F3k2fqloac3
         UOSS8LxSbj1QyFKjHyilF4IjnvptM8GGHWJei9BlE6OejP9Nt2boJcpb/nec1bKFaZt1
         d1pML4vu4Yje9sr/T0iSmnyrTwxFGtxZG+ecgpjzlBe7aJ25xbATIFVEuNnrqGk/MSVU
         BaCdwo8VlZdM7+vpHmt5vr4muZtvauAh84FOQo0Ep3c9NGSWGCMeXBdnjEbnUbQ954Fq
         62T2naaIyeWPgCZY52L342PqxOd/PlQrmTyGji/8N9ljcuPhVeX4d+06OFkbxn3vHl6A
         i8lQ==
X-Gm-Message-State: AOJu0YxOxpsk3w2H9eE2yohLmWiH3FKT3Jl53p/sv4NEaJkuUBK/C+hY
	wsWr/Xg3Gf5HOztvzaPRfYhQ31hC+GBRsjxq5lncsHRcPioKZY22NaHYUUhdHYUI
X-Gm-Gg: AeBDieuXY/d/lIPe4PNJByZqA2FMdnrgY/sn62gc0mi6BW6RLaVB0kj8EpJHC8RxZOP
	OZMzuFYDniHUj2JrS3h4CyR+LhXnQurlJx/dvbJ/uWTgUf0bYlwiJkv+zh1R6uKlF7vajj2I6h9
	Rmr9zHuA7Mw+9Lb9ClJu3CADHDgONqc5B02VDAGF4JSC6VH1VSj0RE3eclveEVihjYNBKAuwYAv
	zCBZtpWZnGhzPxOfyQdYLxS09ZAwg8NPe6wzbKOiEZqh58VbZ+uKaByCfbD55QdiPOF0l40p/83
	s5H5iBWnoDG5p/h36S2tzc6QQOOnTLtRKupx4WOPuTZHIfTy6dyiYZnM4NgpCFFziXHlv/Foiqj
	SJM4//NUcIOCJTcOOnSUVBOce9ajiaSbgqCGlYYzKlOSo5FluwV68iU207Rtuz4HztnA6vEZQaO
	CIXDzHb29lghjbVFeAQNi8m2G8clOqdsTh+osf4Jmg5JwmOg8=
X-Received: by 2002:a17:90b:1a8d:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-361403fa894mr39382703a91.12.1777208657829;
        Sun, 26 Apr 2026 06:04:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm277490935ad.3.2026.04.26.06.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:04:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 6/9] opensc: patch CVE-2025-49010
Date: Mon, 27 Apr 2026 01:03:48 +1200
Message-ID: <20260426130351.793052-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
References: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 13:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126622

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-49010

Backport the patch referenced by the wiki[1] mentioned in the nvd.

[1] https://github.com/OpenSC/OpenSC/wiki/CVE-2025-49010

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opensc/files/CVE-2025-49010.patch         | 72 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.25.1.bb   |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-49010.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2025-49010.patch b/meta-oe/recipes-support/opensc/files/CVE-2025-49010.patch
new file mode 100644
index 0000000000..a0ac9fdad9
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2025-49010.patch
@@ -0,0 +1,72 @@
+From fd4c54b4571b2e1593a8331906b5f0ca2aa39283 Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 953986f65db61871bbbff72788d861d67d5140c6)
+CVE: CVE-2025-49010
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/953986f65db61871bbbff72788d861d67d5140c6]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
+index 2fea84078..dc2f03c00 100644
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
diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
index e41c457fa8..bcdf5900ea 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=stable-0.25;protocol=https \
            file://0001-PR-Fixes-for-uninitialized-memory-issues.patch \
            file://CVE-2024-8443-0001.patch \
            file://CVE-2024-8443-0002.patch \
+           file://CVE-2025-49010.patch \
          "
 DEPENDS = "virtual/libiconv openssl"
 

