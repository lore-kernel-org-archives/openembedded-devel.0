Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D3BC5472F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2882.1722934016964852790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eTSaSPhy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934023; x=1754470023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9NiILGdTPlb4s1wkuY6B+EFs7QlzP77ONz8xSCsQ6MY=;
  b=eTSaSPhybT7FXicE1WGbI660tXNEGkh0ckiF+ByrPp2PwJRa1esC4hZa
   N48nFYu3VPhCwPpQCbxydEizxVQ1Zw2naRVkGD3Vfrrxe6XH3OR6WXCng
   XN6tAbnRnCYplJ3em7POmvc0xkkr/KuTXvOAvgXb9dRGhc7eAUMfC76oN
   3WRspzwj4c0hwwg2zqEFlX76zQqpvdSs4iiD37uoQWRuRi7QuVUyD3j1S
   516J+8S0/IcyfZXumf1n9UPLmwBJYaGdfMQl9BgK1GUMRz01LSVRru2et
   DUx+jrmbjfJDStLJDVUk8tzzFrPJsVN8C8TO0oQubVvT+ZY9YQP3sbvLf
   g==;
X-CSE-ConnectionGUID: CZ0F7o05QpCEOBc8L7zjvA==
X-CSE-MsgGUID: eaJru4apRJG5BBRnu253CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="149361408"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="149361408"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:02 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F40E0C68E1
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 46096D50B5
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D4B58E5A19
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 82EDE1A000D;
	Tue,  6 Aug 2024 16:46:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/60] python3-incremental: upgrade 22.10.0 -> 24.7.2
Date: Tue,  6 Aug 2024 16:46:11 +0800
Message-Id: <1722933994-32549-37-git-send-email-wangmy@fujitsu.com>
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
	hIZpj4MuOhzOa6g8KrX40+5NlxyAwdv+ydygFTDQ9kkjNB+N0emvTf5qm6/1moMoxz6K+fZ/qzn
	YxpqpfRrPp1njrvp6+v63jJ005ph6vZkCQ7+HRHh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111554

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-incremental_22.10.0.bb => python3-incremental_24.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-incremental_22.10.0.bb => python3-incremental_24.7.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb b/meta-python/recipes-devtools/python/python3-incremental_24.7.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
rename to meta-python/recipes-devtools/python/python3-incremental_24.7.2.bb
index 007be032f..0ac76ff29 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-incremental_24.7.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/twisted/incremental"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15"
 
-SRC_URI[sha256sum] = "912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c65865045854c24c0bd0"
+SRC_URI[sha256sum] = "fb4f1d47ee60efe87d4f6f0ebb5f70b9760db2b2574c59c8e8912be4ebd464c9"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


