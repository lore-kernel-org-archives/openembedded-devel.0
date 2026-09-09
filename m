Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514C7C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 20:48:47 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1143.1788986921169971533
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 13:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sTr9AlQU;
 spf=pass (domain: gmail.com, ip: 74.125.225.76, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so584905f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986919; x=1789591719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L3V49nfvpQCwSHxFKtsmw+EO9HJ5IB4QZ3+DGUjXhsw=;
        b=sTr9AlQUI4bYMtZuPKHdMIpoAv11HRx6fC3qtQJejNbuJA8dZHEpN073kmGuWb4jIY
         qXTGwTN64nvLZ5luWcyRavvGt4RtpsBKJfjZN9sjo7mfg3TnRBrwXl1iHcTtxp7me4Js
         Q1mQ3o3ZuMpvCLMwcfcqtHjEsgqwgoJB1fpBWiKoSU8OjK5LyYpfwTilPG4Xf+NGBMgn
         YyIT1Rg/LoXafydkhGIq7SEu3HjKgsTgDwAIyDdVcIMbK/MuSJ4nc2UOtNlAQAqLMCwd
         lKWSODQixpjx92hBRKZNN6f0mBKyxpcrL2O9MJC5B7tVJ7EuPHdVSF7WqyhIqjoQkCJq
         9dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986919; x=1789591719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3V49nfvpQCwSHxFKtsmw+EO9HJ5IB4QZ3+DGUjXhsw=;
        b=QV4Y5+l+3NE4o00UEDoJP0PzvR0elNc+2wCmjMmreROC5K4xc+wv02V+LPfQByrsvd
         oiyuMhjt83ImA5Zrihe+yLZQcIfrTpoxUNDahA8hkZXULcmGJpN9kB2BwHUxPVj7riWO
         iwBrnMWxqRfMsQ2JtXjleQ1guQTCnMC7yocaTrGAewMTVF1aOpjTqWuzLqYD+4jxP3M5
         DuhE5HWStC5Q7uFs/NqN6PVJBxVoyr+xu13UUdZLm2u99mVpfuPQNVMWDhnSMg+qQuab
         cTnWtV5DEc+XwBPQ6XChYhh9b87Uy8/T9vQeUOui0+rompR/nxUTgvzn3I5OV1sxajPt
         SxUA==
X-Gm-Message-State: AFuF++l5dT42Ax7g6LRBeXvBBotuXEr7GPRLe184GCJvGrBGad8yZH+Y
	C1EFyuXg70e0fUUHhXwY3oWuHohOeRs0HG4aEeydI+TgLsqyOdiMgXFbxcFDsQ==
X-Gm-Gg: AYBFou2msnqY8ggd+W2pFWz/Ni9LqCI819SLRrA9q8eMHBNug4SyPVixz2mIYAgJkjE
	uToa8HxP2rd+bqSiHU+5dJ8e2d1kXLbNqDaGETIPR0Zk+PJ89jGTDAMYbASwU8tZ+8gAulWs/lx
	LB9q6hgvTLHjIC6XaWoXKXNRNm/kzb4NnHA1mmXAXzb8SWUJM1nSIQNe4m7xkD8PNOP3maHwG4S
	37h0qVw431c5Pn556H+GKbA7luCJ5vsDqihklc1ZrVs2koZ5O6Nk2n+MeTL5XDilltw7Fp0NK59
	4S6KvdmWSxm3Ju/SBlIf+zuNpFpc22myIvksr6UyUfO7CKuDY61byWP5WPifQJT71JYUSmU5dCb
	xgI425KHiO6wZyyW/bcE2hOrU4qhchIxfoKh2t1rgWKfNGPflWb7luCo4i0jpRhmpwOVbjsgiNz
	/sCMFA6NCf5RBwSE+f3hF1miZvD3a/Hw5v5+gK7nf7hVvPsJOc/VQWDBUm4129V1Jme3+39PLYf
	dej7NkOqL+eE0rrNz9bJyQErgo5TfuvGKFGWGETNiFf4b/V/J7H505XZo3ikVtX2iehgCB9hZxQ
X-Received: by 2002:a05:600c:1d9a:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49d258ef83amr74494025e9.6.1788986919138;
        Wed, 09 Sep 2026 13:48:39 -0700 (PDT)
Received: from localhost.localdomain ([176.88.90.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm17782475e9.2.2026.09.09.13.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:48:38 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] ntp: fix build with OpenSSL 4.0
Date: Wed,  9 Sep 2026 23:48:36 +0300
Message-ID: <20260909204836.344955-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 20:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129900

do_compile fails with:

  ntp_crypto.c:2035:23: error: invalid use of incomplete typedef
  'ASN1_TIME' {aka 'const struct asn1_string_st'}

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...crypto-use-the-ASN1_STRING-accessors.patch | 39 +++++++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p18.bb       |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/0001-ntp_crypto-use-the-ASN1_STRING-accessors.patch

diff --git a/meta-networking/recipes-support/ntp/ntp/0001-ntp_crypto-use-the-ASN1_STRING-accessors.patch b/meta-networking/recipes-support/ntp/ntp/0001-ntp_crypto-use-the-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..5d4633a41e
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/0001-ntp_crypto-use-the-ASN1_STRING-accessors.patch
@@ -0,0 +1,39 @@
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Sep 2026 23:30:00 +0300
+Subject: [PATCH] ntp_crypto: use the ASN1_STRING accessors
+
+ASN1_STRING is opaque in OpenSSL 4, so asn1time->length and data->data
+no longer compile. The accessors have been available since OpenSSL
+1.1.0, which this file already requires.
+
+Upstream-Status: Pending
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ ntpd/ntp_crypto.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+--- a/ntpd/ntp_crypto.c
++++ b/ntpd/ntp_crypto.c
+@@ -2032,9 +2032,9 @@
+ 	 * Also note that two-digit years less than 50 map to years greater than
+ 	 * 100. Dontcha love ASN.1? Better than MIL-188.
+ 	 */
+-	len = asn1time->length;
++	len = ASN1_STRING_length(asn1time);
+ 	REQUIRE(len < sizeof(v));
+-	(void)strncpy(v, (char *)(asn1time->data), len);
++	(void)strncpy(v, (const char *)ASN1_STRING_get0_data(asn1time), len);
+ 	REQUIRE(len >= 13);
+ 	temp = strtoul(v+len-3, NULL, 10);
+ 	pjd->second = temp;
+@@ -3551,8 +3551,8 @@
+ 		 */
+ 		case NID_subject_key_identifier:
+ 			data = X509_EXTENSION_get_data(ext);
+-			ret->grpkey = BN_bin2bn(&data->data[2],
+-			    data->length - 2, NULL);
++			ret->grpkey = BN_bin2bn(ASN1_STRING_get0_data(data) + 2,
++			    ASN1_STRING_length(data) - 2, NULL);
+ 			/* fall through */
+ 		default:
+ 			DPRINTF(1, ("cert_parse: %s\n",
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
index 334120814d..8479b6ce12 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://0001-ITS-10011-build-fix-compatibility-with-stricter-C99-.patch \
            file://0001-colcomp-sntp-libpkgver-colcomp.c-Convert-K-R-functio.patch \
            file://0001-Makefile.am-Don-t-build-deprecated-ntpdate.patch \
+           file://0001-ntp_crypto-use-the-ASN1_STRING-accessors.patch \
            file://ntpd \
            file://ntp.conf \
            file://ntpd.service \
-- 
2.43.0


