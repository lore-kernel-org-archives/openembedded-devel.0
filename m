Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129EFCE7A88
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 14:40:53 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.40956.1695566444572465697
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 07:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BGNr2Zz3;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59f7f46b326so1040927b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695566443; x=1696171243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BwytzBtiHY11rH9Rhf5eIZk4S4XC9zLslMR1TNxpInk=;
        b=BGNr2Zz3ncQuLKOrPnySZboluS8mJ0kCf7zloRh/niGF1qiiRvpi3RWAWfmgDCYMSi
         LvDur+WomCuvIidHe13VrsU3m85Zz30xnjv5SZDO1XNetQ6BUbv8HMrO6zNPaSMG64Vh
         sogKpfgeoD17vnrKsDI9WBZRoS8SymWQ5NNjd3cdPK+0RNb6lN65OGTDkCitsKZau+gi
         cJjHZTHnUCFq4YJvGHQGeiZJPJhY2j1eX/Xs7aoiaC1zAznig085UCLTqBKPkeJWjb11
         xKhcYeLJ+KfNvFHa1WxOBUqD/vLw6/wPcpM71iAr+j/ksPHQbRR/gPgmHOKmFhhEmS8F
         uBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695566443; x=1696171243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwytzBtiHY11rH9Rhf5eIZk4S4XC9zLslMR1TNxpInk=;
        b=qU9roaCyTEtEgLHTrZ81jAlNkQaQebibs0+NmelfQDOD9xz+hnxxYoH0aIvVTVkooJ
         7t/W+WVRYNtfFXsjlcZX3MJMznOBMgQKvZwT2XlMujpXPK+megUTmxgIPqR8gPaOa61p
         IRTAu4Q1WKTuxL8t/j3KsmA5RZrmjPIWAq4gjq6DW0rIwHplKjOMJxQ5sTehB5V82xUm
         PHqJG/9lbmRtq8aQPkZnKmPPTyyAn+ARKr3kJXlaqJKpLBM3hmSWf8jmCXBWXYAytd6O
         e+/MJ8NK1NehUyzby+lP8glW9VQibEMIYCgkuj4cFe4D1QrFiS7nXTNQm6/Ow15SKgjj
         IEXA==
X-Gm-Message-State: AOJu0YxMBvvWxJLnHlo1oNwiNNjL7+OAUNRTyKIosaxZhcLFnpYkkEt6
	CW7/bnIKXFJOtOqMm9qQBaZJwBkJeEE=
X-Google-Smtp-Source: AGHT+IFLM2pytH4am9FLBwEsY+EIdnqGQmHpfVGCDt4SeVgOhrIhhVZPGC5KCu5FznAV5ImeM2JjWw==
X-Received: by 2002:a05:690c:4442:b0:59f:6440:957d with SMTP id gq2-20020a05690c444200b0059f6440957dmr2088589ywb.19.1695566443450;
        Sun, 24 Sep 2023 07:40:43 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10::29])
        by smtp.gmail.com with ESMTPSA id r76-20020a0de84f000000b0059beb468cb4sm1929350ywe.1.2023.09.24.07.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 07:40:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Lee Chee Yang <chee.yang.lee@intel.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 1/2] opensc: fix CVE-2023-2977
Date: Sun, 24 Sep 2023 10:40:41 -0400
Message-Id: <20230924144042.983178-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 14:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105107

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 44b00373094f845e71575d9d6f5c54b038f3a21a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../opensc/files/CVE-2023-2977.patch          | 54 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.23.0.bb   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch
new file mode 100644
index 0000000000..165fc316bf
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch
@@ -0,0 +1,54 @@
+CVE: CVE-2023-2977
+Upstream-Status: Backport [ https://github.com/OpenSC/OpenSC/commit/81944d1529202bd28359bede57c0a15deb65ba8a ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From 81944d1529202bd28359bede57c0a15deb65ba8a Mon Sep 17 00:00:00 2001
+From: fullwaywang <fullwaywang@tencent.com>
+Date: Mon, 29 May 2023 10:38:48 +0800
+Subject: [PATCH] pkcs15init: correct left length calculation to fix buffer
+ overrun bug. Fixes #2785
+
+---
+ src/pkcs15init/pkcs15-cardos.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/pkcs15init/pkcs15-cardos.c b/src/pkcs15init/pkcs15-cardos.c
+index 9715cf390f..f41f73c349 100644
+--- a/src/pkcs15init/pkcs15-cardos.c
++++ b/src/pkcs15init/pkcs15-cardos.c
+@@ -872,7 +872,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 	sc_apdu_t apdu;
+         u8        rbuf[SC_MAX_APDU_BUFFER_SIZE];
+         int       r;
+-	const u8  *p = rbuf, *q;
++	const u8  *p = rbuf, *q, *pp;
+ 	size_t    len, tlen = 0, ilen = 0;
+ 
+ 	sc_format_apdu(card, &apdu, SC_APDU_CASE_2_SHORT, 0xca, 0x01, 0x88);
+@@ -888,13 +888,13 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 		return 0;
+ 
+ 	while (len != 0) {
+-		p = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
+-		if (p == NULL)
++		pp = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
++		if (pp == NULL)
+ 			return 0;
+ 		if (card->type == SC_CARD_TYPE_CARDOS_M4_3)	{
+ 			/* the verifyRC package on CardOS 4.3B use Manufacturer ID 0x01	*/
+ 			/* and Package Number 0x07					*/
+-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x01, &ilen);
++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x01, &ilen);
+ 			if (q == NULL || ilen != 4)
+ 				return 0;
+ 			if (q[0] == 0x07)
+@@ -902,7 +902,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 		} else if (card->type == SC_CARD_TYPE_CARDOS_M4_4)	{
+ 			/* the verifyRC package on CardOS 4.4 use Manufacturer ID 0x03	*/
+ 			/* and Package Number 0x02					*/
+-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x03, &ilen);
++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x03, &ilen);
+ 			if (q == NULL || ilen != 4)
+ 				return 0;
+ 			if (q[0] == 0x02)
diff --git a/meta-oe/recipes-support/opensc/opensc_0.23.0.bb b/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
index f68107df87..b3fc1f0458 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
@@ -16,6 +16,7 @@ SRCREV = "5497519ea6b4af596628f8f8f2f904bacaa3148f"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://0001-pkcs11-tool-Fix-private-key-import.patch \
            file://0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch \
+           file://CVE-2023-2977.patch \
           "
 DEPENDS = "virtual/libiconv openssl"
 
-- 
2.34.1


