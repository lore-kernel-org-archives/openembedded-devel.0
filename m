Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD73C02186
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.40068.1736843353793597239
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TVj44djo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843359; x=1768379359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7HoxJ/7kxAO70ZbTApbj24PwhBbObAiuWUum3X1YVzk=;
  b=TVj44djoTKBDwlKEC6rdekjLkJWsJNn+7T0DNOFNQd6eC3O7I3aGCRy0
   GIa5fVhUZyCOWQINsUGDP8c1KsBAMtOwjNS7R9otCEowllkdNEsmssQOY
   RQdwH2sY+GDjGWZ/b229rZ/St8cEwt8SLJbVE8q5hfzIPLxd5ewao76AX
   R5TgY1TGPfZV/sjaNt0apJso4VPM/hHgexARahkv+xcpFStAPkB07aao1
   Hy3ZGRXQeZKgBOFuvEe4y3SnDtn8bosQta2ubqxIZvfk42SVMn9aZgiQ7
   +A69w7kqJl1Qev+UHXlTQ6CFCRJOIzu0F4PWRo8HB0WVFnEb5Pyj58AkJ
   Q==;
X-CSE-ConnectionGUID: jBOrhfElQTqb/lAdzon7yQ==
X-CSE-MsgGUID: /ydG+mzgRHSJYBmKUMzTQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="188950544"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="188950544"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:12 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B59A2D480B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DDEBD4C39
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E9B26B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:10 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D10E11A000B;
	Tue, 14 Jan 2025 16:29:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/30] python3-mlcommons-loadgen: upgrade 5.0.4 -> 5.0.5
Date: Tue, 14 Jan 2025 16:28:40 +0800
Message-Id: <1736843329-4131-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--0.279500-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFT9VctQHlre/ngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDXboSFWXCl/v3WZ5lH6vKUfFU5uQOKh1+tI4C5Qbs+/1lS16qeTSs2rsirAXQCGjMeClZ
	ixB95YvewOU9RKaZn/x9tfNPIGf+mAcjH79gRLW1PJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114873

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...mons-loadgen_5.0.4.bb => python3-mlcommons-loadgen_5.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_5.0.4.bb => python3-mlcommons-loadgen_5.0.5.bb} (91%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.4.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.5.bb
similarity index 91%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.4.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.5.bb
index eda3f440ee..8e1f9dcd3d 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.4.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.5.bb
@@ -17,7 +17,7 @@ inherit setuptools3 pypi
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "f70fe2ff95732942254f8f5a754769337a9130a5d3e6920513db2c28af5631d0"
+SRC_URI[sha256sum] = "f6920307bc5f52fabee578be995c19443de33a4485907e34e1273b642c644ad7"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.43.0


