Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D20C27C43
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10787.1715677833427102751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dAE1mwYL;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677835; x=1747213835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pVwpa7bep8EJtDcHNL8M1uhWKiC5lfclQ0OMcd/wQMM=;
  b=dAE1mwYLIitQkl/WyY3pfwc2iDCQivSPBojIYGsnuulFYdFriseNMdYH
   i+JObQPSeSX5HjB31xXZit07O9TEgoYpQe8E1570s38cdEsE0B+ZswxmY
   HrKx8h7cK6l91JQUX6kbHs07EjMZtJBpccbvRZTFJeVOtpYvkXvqaluAM
   b9TcpATYD1cJW1KUW1M29VvhYK6GXNe1a84Ro5Hfz4nkwsyhaO2g2NTv2
   naq6A0haI3Jamc+e4fOBYC0LeXFEE2MVUeT8hESyIJ1bO6DLvJ3eB3IK7
   fUiva/7dBBY/CNOkbZaX9otrWyAqUt8D6+eM+Ws4HOqO8MFlaI2VlssAA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="137527401"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="137527401"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:34 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B13B8DC145
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E8B02BF4A3
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C7BA20076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 28E781A000B;
	Tue, 14 May 2024 17:10:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/44] python3-filelock: upgrade 3.13.4 -> 3.14.0
Date: Tue, 14 May 2024 17:09:53 +0800
Message-Id: <1715677817-2223-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-1.796700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrG3SoAWcU42VQZ//SkC0u0r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AGAD6h6FZmEV42zm1Zi+MJ1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO28bR
	Ued1HGAvQ0qhp/HLd0LSFEl+93N7ZrPJpBJ9A1cQOIKk3TNjcIse9GZu09iZ6PDKURgebvgDZcT
	/8nzYziba/Z5xrBt1A2h621xUWo2/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110365

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 feat: blocking parameter on lock constructor with tests and docs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.13.4.bb => python3-filelock_3.14.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.13.4.bb => python3-filelock_3.14.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb b/meta-python/recipes-devtools/python/python3-filelock_3.14.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.14.0.bb
index 4d6d19551..d94ad4bf3 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.14.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "d13f466618bfde72bd2c18255e269f72542c6e70e7bac83a0232d6b1cc5c8cf4"
+SRC_URI[sha256sum] = "6ea72da3be9b8c82afd3edcf99f2fffbb5076335a5ae4d03248bb5b6c3eae78a"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


