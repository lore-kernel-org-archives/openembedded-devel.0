Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F71C52D76
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2888.1722934023735823302
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YtGBKmd/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934024; x=1754470024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=smvnWDmBfrIhdNnAHjUMzX/d9RsT80fPiHnCk7b/ZiU=;
  b=YtGBKmd/VH5W7nfGTDUX7WKULPTFUC4lRT+rd8Nc717Ak18I98QsKBLc
   OotfygouMIcGwDgcbPyiMsVMnzI60BN3X5f7/izGHT7tcDWZA9wzmYLlY
   1lfMn3A2LOcqwnKWm3aVYjvf5b/6Hq8Kz/fqA46e4Mzz2gL68im+lRhHJ
   iWt8iFrnW/Er9xGWrJdO3t/VtsVUBBa1kKMoN+s2225+TpNSgmz0TmjFa
   srjGcyTTkNxfSAZlC+mi1PuEtiuhE4iIs8k/ueutRG/NAfpNIAne11eKq
   wypNQKyCuhk3zleOx8f+1J81Umszn2Diw+24Gap13K4r7U4o7w30WYOZo
   A==;
X-CSE-ConnectionGUID: tKL0xutFQZOPxMiMJGxgtw==
X-CSE-MsgGUID: xkhVuOe7Sr2kqUrkglYEWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="157332587"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="157332587"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:02 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 55582D994D
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 99373CFBB0
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31BE0401B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D52FC1A000D;
	Tue,  6 Aug 2024 16:46:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/60] python3-pymodbus: upgrade 3.6.9 -> 3.7.0
Date: Tue,  6 Aug 2024 16:46:17 +0800
Message-Id: <1722933994-32549-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrQiy0DOJygpmWgjN3pbuqhtP8OR7STU3o9s7uzICJWfYrG2RDPuEBQgQUc
	g/iYaPK2FG3Rj/zvDwLdbH746Fcj8WND11EZcjEh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111563

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.6.9.bb => python3-pymodbus_3.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.6.9.bb => python3-pymodbus_3.7.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.9.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.7.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.6.9.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.7.0.bb
index e33dbc02c..9e2885f5c 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "f4223b72c20cd00a2cf25f6ddb31ecb2c0587309111a55283b2f4a1ac115e4cc"
+SRC_URI[sha256sum] = "5c772babaa61a65ff908293faa668aedcd9d9e10f4bcf5c77a8fe51a6fd9ed47"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


