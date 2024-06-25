Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B15C3271F
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.167243.1719305852355562853
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Us7SzKPf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305853; x=1750841853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=u/Vjo77VOBPbIqs2zFSs6t16IFJkosuXoR6SFZMsX4s=;
  b=Us7SzKPfUmbdWaNYPStBIwVFjKIFY5tyZSKQUoqSCZrDBc5bu4ZyEYqW
   qtzEMNnIN5FFQdsPixI6rtEfq6Hn8C/jbu4Q8p8JPEq9JpG1Jh3gbH7/h
   xu69X6F/gWGPbFHAeynf/p/lbistW4wB0GfM+XeyT1KgBbAtmYKeu6ve+
   IZzKAK2fwZnF/FA9lmPDHf1hgSUUBYs7rPqxLTZbgnQxxe2PqMYsdE1Z8
   Lk0/k2OY9SH1NAnogETCs1QKJOip9SUypXYFZvdlrg+2Tc31NcAGFjLPS
   gWEzngKp9qQVG8j7PSt29mPS94BiwtfonlOmNK1C0wfsHzO1vSxQ5dFr3
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="166699643"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="166699643"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:31 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 232B5E428A
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 69E05CFAB0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E8ABE4107B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 96FB61A000C;
	Tue, 25 Jun 2024 16:57:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/57] python3-prompt-toolkit: upgrade 3.0.45 -> 3.0.47
Date: Tue, 25 Jun 2024 16:56:15 +0800
Message-Id: <1719305790-11484-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-4.968800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQrcxrzwsv5uXs5nqGvDCfOr1gUu9f1F/z64
	8Qdzidzk4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0548icqvB+icULOOp
	5xxUy7oaBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5oIM
	8sFfm1vgNmE9fDw22tdgCarCLz1Pz7EYWPgRTeTXQSQx1Y7XqczD/fke+pkcGlJ5RkP6jJTpeS4
	HG8UytDrem/Bf42fO2CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111055

From: Wang Mingyu <wangmy@fujitsu.com>

New features:
-------------
Allow passing exception classes for KeyboardInterrupt and EOFError in PromptSession.

Fixes:
----------
Compute padding parameters for Box widget lazily.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rompt-toolkit_3.0.45.bb => python3-prompt-toolkit_3.0.47.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.45.bb => python3-prompt-toolkit_3.0.47.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.45.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.47.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.45.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.47.bb
index e02aafdb9..9997785dc 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.45.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.47.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "07c60ee4ab7b7e90824b61afa840c8f5aad2d46b3e2e10acc33d8ecc94a49089"
+SRC_URI[sha256sum] = "1e1b29cb58080b1e69f207c893a1a7bf16d127a5c30c9d17a25a5d77792e5360"
 
 inherit pypi setuptools3
 
-- 
2.34.1


