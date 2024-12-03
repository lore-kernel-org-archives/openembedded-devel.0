Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5998DE6C5E3
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8209.1733185022119642583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j4H1u8vV;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185023; x=1764721023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SJmn84qxwMBKMtgRpZt4KT+tb+OP/tM5BBC6gm+Il1E=;
  b=j4H1u8vVb/PVD2MT4sBGexLyjM+Xo/YEmfHHzuaEu5RKDGVKyl7+xyqp
   lMlvKQyuElVpQxA4UO3VQJvONTaBXWxtKWM2lWVNx8BNx66j9dyKlfOrq
   Wz2XTzksRlUXHC3D3sXIhfMRUmJZ16ZCH2VrBMwhEHuKkM1eoRaTPDeWb
   sJg9kkn3+SeME/hhL6o8KNs5mxzGaLmnelSMXD7K0tH3Aq7NV4O4RLEus
   ih2B1Qpploj+T4lLs96r6PoeaBf1n7Z5pPsK8ODqjvEYmoQfRS3i4OE0k
   JjNdrJnr3If1tdQSsnjs02lHjm9aPUgUgRCehW3elR5BQb0BrvKv2Ja+0
   A==;
X-CSE-ConnectionGUID: 9iO53eKPRkm3uZMFNs/6DQ==
X-CSE-MsgGUID: nJPgWbY6SDmRRRZBnvD7zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="161323083"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="161323083"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F0CD5D6EAF
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BF697CF7D9
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5793D20071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EABB51A0003;
	Tue,  3 Dec 2024 08:16:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/34] python3-mlcommons-loadgen: upgrade 4.0.1 -> 4.1.29
Date: Tue,  3 Dec 2024 08:16:26 +0800
Message-Id: <1733184999-27041-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--1.021400-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4BslLiOW+0ytoH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoqu/6lvVfpZrngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDUqAb99krij1ZVSpSg4mFrXudzL6AxH6hETc/P2nZuz9ex6BMdiDS6GZBxP7mSla8bNc0
	0TaQOCTeH2sPZw2/ScN4oQ42gKYpiCV7SgdjlG21PJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114164

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ons-loadgen_4.0.1.bb => python3-mlcommons-loadgen_4.1.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_4.0.1.bb => python3-mlcommons-loadgen_4.1.29.bb} (90%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.0.1.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.1.29.bb
similarity index 90%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.0.1.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.1.29.bb
index 06eedaea52..93969c1490 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.0.1.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.1.29.bb
@@ -16,7 +16,7 @@ inherit setuptools3 pypi
 
 PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "0e7059b289ea2aabb3e9ad1179bbce89703294570ee59c07cf30d52f1b38f732"
+SRC_URI[sha256sum] = "99d404bbaa6dc3106db608a1c28b6fdcb317b12994aac8a85d81a13bb644802a"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.34.1


