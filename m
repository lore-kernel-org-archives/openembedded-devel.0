Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E20D29FA5
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.40136.1730874686379590766
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r4wdCUVO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874686; x=1762410686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=23tV/PBPmgXN8JXR+t+5MiZQ8K4Sz9/I8te/Z+v8sKI=;
  b=r4wdCUVO7zIFEahQLbSDN9hQPMRR7fbezQXUxZaighGPy3CpZVhjF+UM
   yCmEYH0dgD7iisov68enLvytB6PJN+tYmUgzV19NZZj2WTidYf+Se/uxJ
   s3CUAvNZHkIOl2XNyOqDIf1xahSxMYEAcT9sWLZ+8vQLItWMlPmGkttp9
   NAPhOkAE3hK+0qjGyIv7i7AQfTqRuLYwlKBrfIzxd2mLnRum3DWVrE+pT
   TqHYuLJmMivL3cFKJK3LNwFe7fOApUwtf5MR6M2HaDb84uRRu4le1Uuyj
   180JZ7yX8NXhyzVBq4Fkculy0jzRJ8o2IfsaDAPXh4J5dHgWFFk3MeKgu
   Q==;
X-CSE-ConnectionGUID: q+iutY6DTRqNxcvYW2CFdQ==
X-CSE-MsgGUID: 3Pl0cpyeTsmAFy61veQBdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="178487342"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="178487342"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:24 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B74B3C6846
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 032E0CFBC8
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 929C06B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 406891A000A;
	Wed,  6 Nov 2024 14:31:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/46] python3-grpcio: upgrade 1.66.2 -> 1.67.1
Date: Wed,  6 Nov 2024 14:30:40 +0800
Message-Id: <1730874660-2364-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--0.440100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yZXi1z8zt1TRAZn/4A9db2TL/AT90ZKK19nf
	JrUSEbFDJMPD8FR5f58F1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RFBDiQWqOMkVDb
	/0bU89feNGcu0Wzsud3nJBtmnUDGuB1Q7P5DZjXUSEYfcJF0pRX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07foJlcuVXWZJ31tBhyUTHWvmiQU9daF9DOM5OZG/u0xam+tBCiucBoiCObt1gdbGXZPQC
	NHj9tkq2vblc82bgmoesWZddhk9AkXCZa304ngp8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113711

From: Wang Mingyu <wangmy@fujitsu.com>

0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
refreshed for 1.67.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch | 4 ++--
 .../{python3-grpcio_1.66.2.bb => python3-grpcio_1.67.1.bb}    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.66.2.bb => python3-grpcio_1.67.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
index ff5a8f298..790ccccc9 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch
@@ -53,7 +53,7 @@ diff --git a/crypto/internal.h b/crypto/internal.h
 index f93c2e5..2fca2fb 100644
 --- a/crypto/internal.h
 +++ b/crypto/internal.h
-@@ -1193,7 +1193,7 @@ static inline uint64_t CRYPTO_rotr_u64(uint64_t value, int shift) {
+@@ -1206,7 +1206,7 @@ static inline uint64_t CRYPTO_rotr_u64(uint64_t value, int shift) {
  
  // CRYPTO_addc_* returns |x + y + carry|, and sets |*out_carry| to the carry
  // bit. |carry| must be zero or one.
@@ -62,7 +62,7 @@ index f93c2e5..2fca2fb 100644
  
  #define CRYPTO_GENERIC_ADDC(x, y, carry, out_carry) \
    (_Generic((x),                                    \
-@@ -1245,7 +1245,7 @@ static inline uint64_t CRYPTO_addc_u64(uint64_t x, uint64_t y, uint64_t carry,
+@@ -1258,7 +1258,7 @@ static inline uint64_t CRYPTO_addc_u64(uint64_t x, uint64_t y, uint64_t carry,
  
  // CRYPTO_subc_* returns |x - y - borrow|, and sets |*out_borrow| to the borrow
  // bit. |borrow| must be zero or one.
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.66.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.67.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.66.2.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.67.1.bb
index 7c5176736..c574033a1 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.66.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.67.1.bb
@@ -13,7 +13,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
            file://0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
            "
-SRC_URI[sha256sum] = "563588c587b75c34b928bc428548e5b00ea38c46972181a4d8b75ba7e3f24231"
+SRC_URI[sha256sum] = "3dc2ed4cabea4dc14d5e708c2b426205956077cc5de419b4d4079315017e9732"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.34.1


