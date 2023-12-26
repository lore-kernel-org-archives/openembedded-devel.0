Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F74DC46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:37:00 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.76840.1703576218724055050
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="144473809"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="144473809"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:36:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 914A0C160C
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:36:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 93F09D605C
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:36:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34EE66B4C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:36:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E0A6D1A0072;
	Tue, 26 Dec 2023 15:36:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.5.2 -> 2.5.3
Date: Tue, 26 Dec 2023 15:36:49 +0800
Message-Id: <1703576209-13449-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.006
X-TMASE-Result: 10-0.873400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu6FTbg6ndROc4a
	vCMaKsA/4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ubsT
	aWd4cSvRdcKuEA3qv9nk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4dyf
	mt9CZv1ZPb04/k/wW0W+matsCJJ083MQi2Ls/dAf/eInqDU4FugIC0G3wgKSK6D8aiqEUPNUs13
	9cMT/dFfD40U/WDOzKCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107801

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-uprev pydantic-core to 2.14.6
-Fix memory leak with recursive definitions creating reference cycles

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_2.5.2.bb => python3-pydantic_2.5.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.5.2.bb => python3-pydantic_2.5.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
index 3750d49a9..4b764c087 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "ff177ba64c6faf73d7afa2e8cad38fd456c0dbe01c9954e71038001cd15a6edd"
+SRC_URI[sha256sum] = "b3ef57c62535b0941697cce638c08900d87fcb67e29cfa99e8a68f747f393f7a"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.34.1


