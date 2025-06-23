Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C66C83028
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.13712.1750662716556235409
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E1cK5Yev;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662716; x=1782198716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XiV1tF5C68ZI9LXq1tgIPi9ih6q2x/eflS+OIURfjao=;
  b=E1cK5YevzUUa94bUZGEDeaOzXIS2Q0fLV/Q33LIMZgbqTTitRSZ3vrgA
   d47SqbrE1Dd0UgbqehdLi1Clb9Qk1vj3cdO8IsxvD3iZugI+tyRilofvI
   s3RSVe/vvaVptO3Jl6H6VWFt77QIOqmPwp5GVa7PEiAh00I8gfTVjL75X
   33AtJfYjQg0ZkUenCEeZl4OUt4FRo5ZAiz8V6ofZicwT0k4XK79PVnJAg
   QsoDUbu4dHXDDDv+hdSS9whaboPTpaIuHw3uP4lLFTleJd4bZzmDFKiDd
   FIoGvGeSmehM2fPbGydAGtgbku9X3zAnyUOX9Egrx1FT7q9C+M0g1AT8k
   g==;
X-CSE-ConnectionGUID: XInX8RDkQ5aIDQn+8pTeyQ==
X-CSE-MsgGUID: 0xQd/FifTYewOhZkXBWGMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="182501868"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="182501868"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:54 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DF0FE0ABE
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1086D4E07
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:51 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 65D7B1A0071;
	Mon, 23 Jun 2025 15:11:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/30] python3-mlcommons-loadgen: upgrade 5.0.17 -> 5.0.22
Date: Mon, 23 Jun 2025 15:11:23 +0800
Message-ID: <20250623071138.402-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118047

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ns-loadgen_5.0.17.bb => python3-mlcommons-loadgen_5.0.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_5.0.17.bb => python3-mlcommons-loadgen_5.0.22.bb} (91%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.17.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.22.bb
similarity index 91%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.17.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.22.bb
index 641ca6d3c2..841753625a 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.17.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.22.bb
@@ -17,7 +17,7 @@ inherit setuptools3 pypi
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "06410ee545d6959221c7b66e3f3c536c305b3a833dd5f691642f1764d556b990"
+SRC_URI[sha256sum] = "debcae3d1f45d774e76d557805d4dbac5ebc4ff7e0fa91a13a8b4d1a5b537d87"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.43.0


