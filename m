Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8BFC27C6E
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9820.1717664811634325247
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r4ZuoueZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664811; x=1749200811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RkWGukVUBBRtDSIuR7vdNs7zhLvUoNIswIbXta+Wcuc=;
  b=r4ZuoueZdw5hA1616TCfssup/F4wB3BmxnBZFDjJCLTzgx8iyIQ2QguN
   sHW8tUgWlMmwTKxHQmS7lwGPMoMyLLk7aDSKIou6yhLuTWnuRKioIYorU
   Y0Eq8+z7SuvESPbFe66YpmZW59NkIMFfwesIt6FyRKB5IF+2oB7UNuUbX
   CHXAG17VWiCt2F5TgTFtTD+bBGbzdG1ijTlOf5Y2jqRvGyav5ZSODj3nE
   pBRsdcbcc6/H7RSAaD1XxUNXXMCUONsTbLKVe+zmpQ0er4kTzXEDCSV6r
   skW8OrinJ4TOHZTuOVl6nV5HL5fKsHsQVtzGCtxQLtlpZYffBFV48zBbH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="150462564"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="150462564"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:48 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BC20ED29EA
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 16F53BF3FC
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 91FA8E2B24
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 39D451A000A;
	Thu,  6 Jun 2024 17:06:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/36] botan: upgrade 3.2.0 -> 3.4.0
Date: Thu,  6 Jun 2024 17:06:01 +0800
Message-Id: <1717664795-13902-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--4.511700-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yUIIxwDaU5mregIHHX2L4YyQ09taPgt9LOYp
	TKzMAZQPL5x8cZMx53M+X36xH4Nh5YtUtJ9UYBX7YPyK201ebhuDy+T4Lu/PHlKFxY7/zfGidEt
	jEUEwUtYKx6jkYhVsxglJ/ieHRHSnH0no+S2NlEWqh5pv1eDPz6EetkTb5Lzrt4xTaPp6ap+DO8
	/8WI7RRjOkND1zmU/a/+id/YMBDOh00KsGnOJIkHV7tdtvoibaN5dqZcIK7Vg0kS9L8/F4KGKFL
	qZhp2Q7oTssFGSH7W3mn3xyPJAJoh2P280ZiGmRuce7gFxhKa3zndiJkHFMhEJM+4R8AHk7hEzI
	3+mkzieOkHND8Cj8HGJwCsb/Z8alHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAULREWZqsnqEw97s9
	oTjP4yHJHTzPuELbm+k1R7kw0j3lhp551kztV925wieP4xgpAkPe7kPZqMyOMMck/xXg/IC+QaC
	/oaUBD7H2fVekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110710

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add Ed448 signatures and X448 key exchange
- X.509 certificate verification now can optionally ignore the expiration date of root certificates.
- Support for "hybrid" EC point encoding is now deprecated.
- Support for creating EC_Group objects with parameters larger than 521 bits is now deprecated
- Add new build options to disable deprecated features, and to enable experimental features.
- Fix a bug affecting use of SIV and CCM ciphers in the FFI interface.
- Add new FFI interface botan_cipher_requires_entire_message
- Internal refactorings of the mp layer to support a new elliptic curve library.
- Use a new method for constant time division in Kyber to avoid a possible side channel where the compiler inserts use of a variable time division.
- Refactor test RNG usage to improve reproducibility.
- Add std::span interfaces to BigInt
- Refactorings and improvements to low level load/store utility functions.
- Fix the amalgamation build on ARM64
- Add Mac ARM based CI build
- Fix a thread serialization bug that caused sporadic test failures.
- Update GH Actions to v4
- Add examples of password based encryption and HTTPS+ASIO client.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-crypto/botan/{botan_3.2.0.bb => botan_3.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.2.0.bb => botan_3.4.0.bb} (93%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.2.0.bb b/meta-oe/recipes-crypto/botan/botan_3.4.0.bb
similarity index 93%
rename from meta-oe/recipes-crypto/botan/botan_3.2.0.bb
rename to meta-oe/recipes-crypto/botan/botan_3.4.0.bb
index 5eff2d383..8cd1aa64c 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=f5254d3abe90ec5bb82c5694ff751546"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "049c847835fcf6ef3a9e206b33de05dd38999c325e247482772a5598d9e5ece3"
+SRC_URI[sha256sum] = "71843afcc0a2c585f8f33fa304f0b58ae4b9c5d8306f894667b3746044277557"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.34.1


