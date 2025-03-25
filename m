Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127EAC36019
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.61533.1742893341762466579
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mSg5baAd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893343; x=1774429343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GIm0MtDJZM9KsZinC/0Qf+r6SeXzYAHEr9l3RKrza9o=;
  b=mSg5baAd0NF3cPhqZe8c9B2v5NUyuVumeeV/9MB3cVWgnhDLsuc1sUuO
   btDfFqdNe+8rRYqAzC83+9QGu51T2CQqeMiQmH35K5qtLnxCqNZReqfWa
   FgcFCE/qefePU+qi5EL3ZB0qnAzUVqItirR/lof/oBSVcrfm8crpm+dst
   zh5UKn1tTGTXO3cpNIFGpIlYpJF1qhHkb/CHwbr43zCx+R90eRUg5/17Y
   OloVdfV0fovZPPW34B6N3nQvP3hK1D5a1XjpDpmGXu/UT74cRnnBaZjbt
   YR6wFmxxs2ADCddVIduQ/6Af/cD031YYOtGxHxEtK9Hgp1tB45OPAIsaT
   w==;
X-CSE-ConnectionGUID: mXpPvTIqQZal4mMNClsH8A==
X-CSE-MsgGUID: FuSdjvppREGlceDF0NKGww==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194202343"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194202343"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C95ABC2270
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D044D72BC
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 504931A009B;
	Tue, 25 Mar 2025 17:02:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/45] python3-psycopg: upgrade 3.2.5 -> 3.2.6
Date: Tue, 25 Mar 2025 17:01:41 +0800
Message-Id: <1742893312-3809-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116259

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix connection semantic when using target_session_attrs=prefer-standby

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.2.5.bb => python3-psycopg_3.2.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.5.bb => python3-psycopg_3.2.6.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.5.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.6.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.5.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.6.bb
index fb8135ae82..036e737b36 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.5.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.6.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "f5f750611c67cb200e85b408882f29265c66d1de7f813add4f8125978bfd70e8"
+SRC_URI[sha256sum] = "16fa094efa2698f260f2af74f3710f781e4a6f226efe9d1fd0c37f384639ed8a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


