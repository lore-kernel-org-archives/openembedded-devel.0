Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7083C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:42 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6682.1714628967326746876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=slErVAFg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628972; x=1746164972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GBDlxhDFYdUHVnnxtf13XhFvqeYUDFLLzCkSEDhB8jY=;
  b=slErVAFgkuZIbBVCXbIU21yejsnwEhl2RQYG3UHURzotg8VAZGflozzx
   VxlTtuxldgMgGw0MqLTJPcmna4g9wOXSwVeGbfnlTVGDrgLVgACkfY3YW
   UvLVPwDJ5myVjtyu/bbukMGasEFuEwQ32GkaUlZMTN1IZyT6bqwz+mkTy
   X/U5vn6qBZSi1YCfURdg3P7Rynd9dhxlOhjUSMv3FK0WYMyQIoNqeaSQX
   K/Mz8t5S8u3dJtnHQLf3FkQLPtdyoIFRXf47fhywNqD3N0druDclJazkl
   68WFilmjCH9vn7+FOU3SIDYosmsg3Zlgal8ZZJJtBEdu6cQ/eDrdaaCz4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157281964"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157281964"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 51971D4C2E
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 432F1BF4B0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DD8E0217354
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:27 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8171B1A0002;
	Thu,  2 May 2024 13:49:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/30] python3-regex: upgrade 2023.04.16 -> 2024.4.28
Date: Thu,  2 May 2024 10:48:16 -0400
Message-Id: <20240502144829.241208-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-1.202400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvfghYDxv+lXeiG
	P450w+pP4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6iKW
	nzqBMugz+/5eE/wBJukk5SQjyeLU7121yZpWKvbv8Wfr9smS6bS7uwjEhRouKkTU7Wb8PAY5Og3
	Yv1qRLkGVHdmVT6vB9bjBuldNvkMkoq97WSHdFjfupJaud1uZCfRs6uIbkFVw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110221

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix bug of VERBOSE/X flag breaks \N escapes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2024.4.16.bb => python3-regex_2024.4.28.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2024.4.16.bb => python3-regex_2024.4.28.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2024.4.16.bb b/meta-python/recipes-devtools/python/python3-regex_2024.4.28.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2024.4.16.bb
rename to meta-python/recipes-devtools/python/python3-regex_2024.4.28.bb
index 18a6f3d65..62c850dcd 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2024.4.16.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2024.4.28.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fa454d26f2e87ad661c4f0c5a5fe4cf6aab1e307d1b94f16ffdfcb089ba685c0"
+SRC_URI[sha256sum] = "83ab366777ea45d58f72593adf35d36ca911ea8bd838483c1823b883a121b0e4"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1


