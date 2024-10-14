Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA020CFC50B
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.50332.1728896159138399377
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q27wvmeO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896160; x=1760432160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Gt3MP4hNGwvnYX6AX915W5L95UwNBHtSuh2vd9Et+Ro=;
  b=q27wvmeOzN+6+Pbn2oFJWxxtSO1Ss7MrGMYzhZyn41PO+QHiSabW+IbZ
   7f0CR8bNQzKV9nfV4SXP19XQeu2uxJCrJ1jlsBPB7ATz9sERApE6FILH+
   XokJQQ2f7doJYLsycdW9jyJmrAvnBHtyciM9WWSEdw6YtUpRFPG4pB3xN
   Ng275vU8vj4W3A35fZ/02eNm3rVCjOVUwW8GVTfgqhMRvR/47JlK2IZep
   UpgbYwjlL+QiUPfOoiOjQR8Zta85F+RhEUdjHddtqvEOzhqjkDPB6AtTN
   bS3utFaZZzeKzdLkCz+S39JS0bkx8LS5n28wbW6niNXfGqtb98fyS3NPv
   w==;
X-CSE-ConnectionGUID: 2UkmkW7pSLGLdGv8ZOTTow==
X-CSE-MsgGUID: ge7CkuwHT32I/Wje0uhReg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176692989"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176692989"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:59 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 64CAAD6473
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BF92D9CAC
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E47E20071A00
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EB5D11A01ED;
	Mon, 14 Oct 2024 16:55:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/54] opentelemetry-cpp: upgrade 1.16.1 -> 1.17.0
Date: Mon, 14 Oct 2024 16:54:33 +0800
Message-Id: <1728896115-2944-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--1.445900-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSDxtY59xKFYFE89
	3SeL1XuD4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat05450C6WJNXTpiZGL
	AK9L4bSaM64yzWHFaGawnY0RVRjvrHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4Rps
	l5wIGJhoUX3wfHz5xMdK4AmdPrMOwl+e/BSg4WHbAm7mX/0fnLSAiYAfH54H5KGu0QuPacxrMWf
	eicjX3wh/wXwign2seCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112858

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/open-telemetry/opentelemetry-cpp/releases/tag/v1.17.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{opentelemetry-cpp_1.16.1.bb => opentelemetry-cpp_1.17.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/opentelemetry/{opentelemetry-cpp_1.16.1.bb => opentelemetry-cpp_1.17.0.bb} (95%)

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb
similarity index 95%
rename from meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb
rename to meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb
index 1d86f1abc..04e43d99c 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "nlohmann-json"
 
 SRC_URI = "git://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main \
            file://0001-Fix-build-with-clang-19.patch"
-SRCREV = "baecbb95bd63df53e0af16e87bc683967962c5f8"
+SRCREV = "fa0a5200ddbe9ae6f487a228e658aedc102dab56"
 
 S = "${WORKDIR}/git"
 inherit cmake pkgconfig lib_package
-- 
2.34.1


