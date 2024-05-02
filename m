Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8908CC25B10
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:53 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6691.1714628986112840832
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xr7EiEPV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628988; x=1746164988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dm7sJqLySQbXjPxstlDy0aAvdfvKNqkQg/fAwmjxOQk=;
  b=Xr7EiEPVi1ddPXNmZyG163+jPDJjfUe/KJlFcne+AwlomMHn3HlaH27G
   HtN7c76vdpU1JXfVNPY5iF0qU3dRhZmaif1NDLbrhIMotBMCJy/KdKmRz
   U9tLBD8C53atWsrl3IUTJyb0ehFsXUIv2+XQiM22JG9mysrmsAoh8SOmp
   wOd5O5R7wKCRyavxwdiEpo9ARLen0WLtiXI/AW7id224mnJ4U0D5f1OLG
   s2/h0OmD5X8KS/4UStoadRWkpLwBA6lzpPKCyHRYMN9maSnkLTgdzpCZU
   F8VU8KGyxvFDp8i6j2S2kgQwJxormRQny7sCrOkosI09TK5sIx9rEkSA+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157231734"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157231734"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:36 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id ADDDBE8FC0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AE8CBBF4B0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D9C72008BCDC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:32 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E650A1A0002;
	Thu,  2 May 2024 13:49:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 26/30] ser2net: upgrade 4.6.1 -> 4.6.2
Date: Thu,  2 May 2024 10:48:25 -0400
Message-Id: <20240502144829.241208-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-7.416300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJwk5p7o69tnZcLewwAa76fIbyXNwz2gvs1/AFBKYcY9IFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UsjvNV98mpPPFwnV2m9VBHNzui9Rugb9PQyHilz6rGT6D/h
	VSfQpxK8pUB/z9mT6SIpX67aIKkdMt608HJ1ElKkNJHsgeOgyTIdfrJ12aY8E=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110240

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.6.1.bb => ser2net_4.6.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.1.bb => ser2net_4.6.2.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.1.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.2.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.6.1.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.6.2.bb
index e5ebafa54..21066b10f 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz \
     file://ser2net.service \
 "
 
-SRC_URI[sha256sum] = "78ffee19d9b97e93ae65b5cec072da2b7b947fc484e9ccb3f535702f36f6ed19"
+SRC_URI[sha256sum] = "63bafcd65bb9270a93b7d5cdde58ccf4d279603ff6d044ac4b484a257cda82ce"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.34.1


