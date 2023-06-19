Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A3AEB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:41 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2319.1687157431976211060
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="100071982"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="100071982"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:29 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA2917E0C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:27 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D2AFFD88C0
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FBD42FC8457;
	Mon, 19 Jun 2023 15:50:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ujson: upgrade 5.7.0 -> 5.8.0
Date: Mon, 19 Jun 2023 14:48:24 +0800
Message-Id: <1687157308-17342-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10-4.507400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr5sPqcQkI8puU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN194/5X9VfCxYL/tox9XQkYkvBucr2+3cli+
	BaqMwTNrVuPnsbKmJliiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZLja8gsEi30p/nboQpFSw9tGSgOkpaBDf1THl++95aIpLNAVTUBaaKu0C4I5ORCRGkC4
	psljezLb2uTDL0oEK9vj4XTNyD5nWOCjzW1o6/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103376

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Added
--------
    Build wheel for Python 3.12 beta (built against 3.12.0b2)

Changed
--------
    Drop support for Python 3.7

Fixed
--------
    Include BSD-3-Clause and TCL license text

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ujson_5.7.0.bb => python3-ujson_5.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.7.0.bb => python3-ujson_5.8.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.7.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.8.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-ujson_5.7.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.8.0.bb
index 5c431fa00..9486435d7 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.8.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5418f0b03302d0a"
 
-SRC_URI[sha256sum] = "e788e5d5dcae8f6118ac9b45d0b891a0d55f7ac480eddcb7f07263f2bcf37b23"
+SRC_URI[sha256sum] = "78e318def4ade898a461b3d92a79f9441e7e0e4d2ad5419abed4336d702c7425"
 
 inherit pypi ptest setuptools3
 
-- 
2.34.1


