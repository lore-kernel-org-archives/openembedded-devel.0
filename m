Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CBAC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:35:24 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.28460.1701160516917187138
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="140702722"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="140702722"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:35:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F002D64B8
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:35:12 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A60BC113C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:35:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A2AA2FC80DE;
	Tue, 28 Nov 2023 17:35:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mypy: upgrade 1.7.0 -> 1.7.1
Date: Tue, 28 Nov 2023 16:32:27 +0800
Message-Id: <1701160347-28222-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrYbvh4+nefvlFA6x4b3Q1k4ZDiwdpz0eW8N77t8k4JWnl49pjeGjcUkdYl
	jWbs6xfbtAZBvymoON/3JhDkCrb9bJ6cAn9hm8Mx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107082

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mypy_1.7.0.bb => python3-mypy_1.7.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_1.7.0.bb => python3-mypy_1.7.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.7.0.bb b/meta-python/recipes-devtools/python/python3-mypy_1.7.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.7.1.bb
index 432cefcbf..90301f3cc 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.7.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d62fd8f8648cb018e52857347e340b9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1e280b5697202efa698372d2f39e9a6713a0395a756b1c6bd48995f8d72690dc"
+SRC_URI[sha256sum] = "fcb6d9afb1b6208b4c712af0dafdc650f518836065df0d4fb1d800f5d6773db2"
 
 BBCLASSEXTEND = "native"
 
-- 
2.34.1


