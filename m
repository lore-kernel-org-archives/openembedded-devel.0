Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE9CCD4F52
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:19:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.18544.1695377960065652485
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 03:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=T/JNkU7X;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695377961; x=1726913961;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GSBj/qQIB7N75MAawaHt87WtZc7+NVxTD0iMy8WOsnY=;
  b=T/JNkU7XMavT4tZuTyFBf6U7zenc/KOHhICQw2ja+SEvgfIButoXT1yi
   c+wJ8bf3a/QV1junFv2RJDGS+Rhsywst/4EIdjaCoI4PvOpui/Jdjm/H0
   TORn4IFpWMa2X6TQNiDUU0h3mH2TbTNS8dkzcDKWJ7eX6oyjgIqD9PUcZ
   ZlKJMi1J1MXWpIppW3Rzx09M+PU/vY7Pz9qX0EnndWgwz4dsun5MkPJyj
   4Yj+WyI4Pgi6teiwwEfPU/1sTDJNrrTOOCHp3zj2xz7Hhbp3+YTjYIom0
   jtRdRYYNuSBfuDeTvaXBjmJJxKNeQyY5iaAiyDWlT6gq/dkCbb6+VJKZ3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383542998"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383542998"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 03:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817729065"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="817729065"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2023 03:19:20 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/5] opensc: fix CVE-2023-2977
Date: Fri, 22 Sep 2023 17:59:39 +0800
Message-Id: <20230922095941.3958983-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230922095941.3958983-1-chee.yang.lee@intel.com>
References: <20230922095941.3958983-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 10:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105052

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
2.37.3


