Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B91C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 03:19:43 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.9061.1719544778239741345
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 20:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h4sVeo0h;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719544778; x=1751080778;
  h=from:to:cc:subject:date:message-id;
  bh=8EC4iri7tS2fq2F/GocJekLtawraMxdD8MBLGTX6NLE=;
  b=h4sVeo0hTiUp9IxOkZflP/vGKTFoEInAtfKU60i9i48OCKIrczp17XZF
   VsBHg4zRCjjJLMV2w+x2ecjRBRgWnZ5CN5ymCANj30ykzUpjE4jTX2mJc
   QQ/VgxZbSTF7g1ghOnVKDoqifmkt7nCVoT6pyrJE5M1MQR5br2hYEjQSW
   Jfr6iOhxVWJREepWJVkn4bnsYpo2tZQlFF/kCrDUI8Fh5OaQ7uIC+ATog
   WoXPtYX0+vBqR8MIKkh43/2mfirtkhyivrZwKGoeHPtjn0sYJ157Bj9qa
   jILWJmcdc803BTcAuL+FgWRSeedV8oOBLz3VVJA3bE/Xnpg4w21jLweXQ
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="165283530"
X-IronPort-AV: E=Sophos;i="6.09,167,1716217200"; 
   d="scan'208";a="165283530"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 12:19:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 87233D8001
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C5362D7010
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 52A6E6B4C7
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 003561A0002;
	Fri, 28 Jun 2024 11:19:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [[PATCH] 1/4] ncftp: : fix build failure with gcc-14
Date: Fri, 28 Jun 2024 11:19:24 +0800
Message-Id: <1719544767-17994-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28486.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28486.004
X-TMASE-Result: 10--1.527200-10.000000
X-TMASE-MatchedRID: I1wtkSt6/wIE6DEyiw1BXPLeH1FBnhK0wTlc9CcHMZerwqxtE531VIpb
	wG9fIuITxwQuI4XqDt6svKI2PiWDPeVHGbcDbAq6FEUknJ/kEl5jFT88f69nG/oLR4+zsDTtjoc
	zmuoPCq05l8HgkvZCybOpXXa0qbTEXqzG090vAEHqrYDIX2P1TdcwLejW39Kg60gHsdnDr/f1PP
	1vBESs71bilQR0ZlxK9evgCvCrqAwdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhFTP3QRDAbYw
	Clu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 03:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111134

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
index 15bb00a3a..4b781781a 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b8711344bef
 
 inherit autotools-brokensep pkgconfig
 
-CFLAGS += "-DNO_SSLv2 -D_FILE_OFFSET_BITS=64 -Wall"
+CFLAGS += "-DNO_SSLv2 -D_FILE_OFFSET_BITS=64 -Wall -Wno-error=incompatible-pointer-types"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[ccdv] = "--enable-ccdv,--disable-ccdv,,"
-- 
2.34.1


