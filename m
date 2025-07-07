Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73D6C83F1A
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.55569.1751879234060672811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rUKuIJJh;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879240; x=1783415240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o44/ghE0mVaqNcR2ouaGaK8QQ2g06kQ0Ucss/te1Gs0=;
  b=rUKuIJJhSrymnPc3ORCxDDK78PFLcQ4laotmaAuUjUMHEfpzcF2n7FfA
   evJ/oEBd898AWgCfgNNhYtBoeSA/Pmljatkh0fIJIAKbJJjDEBa9Z8gjC
   MH8fTU+aGEnyKaEwvpGJ7yrPeZXi6rc4/nEMKe+jcPxTR9qOKfm/IwLgI
   ldpThchj0fEArtsYnBSYo/TdPQyMurThKaSMrgfMuZqzX/ToYjR76ycUb
   GK0oS/MCw91VF08hz6n+mV05agvSNPOESzPIVz3QAltKCOLEgF02Be4G2
   r5GKgz9Fvf08rLZdfyLz22i2sr8DSRrLKauEetSV2+t/OiuqKMakGGAXE
   w==;
X-CSE-ConnectionGUID: ZsIEj+ceSGGLytGSePTmog==
X-CSE-MsgGUID: /83AwmjQRv+oFARq3IV9/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="192895263"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="192895263"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:19 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3EF021000348
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:19 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id B869110000FA
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C3ECBF3C5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:18 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A10DF1A0074;
	Mon,  7 Jul 2025 17:07:17 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/35] python3-pyais: upgrade 2.9.4 -> 2.11.1
Date: Mon,  7 Jul 2025 17:06:48 +0800
Message-ID: <20250707090656.1216-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118271

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* apply fix from https://gitlab.com/holado_framework/python
* pyais now handles type 16 messages shorter than 96 bit correctly
* breaking: added two classes for type 16 - 'isinstance(msg, MessageType16)' checks will need updating
* apply fixes from https://gitlab.com/holado_framework/python
* closes: https://github.com/M0r13n/pyais/issues/183
* renamed custom 'JSONEncoder' to 'AISJSONEncoder' to avoid confusion with 'json.JSONEncoder'
* refactored main.py ('ais-decode') for better error handling
* added examples/ais-encode

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_2.9.4.bb => python3-pyais_2.11.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_2.9.4.bb => python3-pyais_2.11.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb b/meta-python/recipes-devtools/python/python3-pyais_2.11.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
rename to meta-python/recipes-devtools/python/python3-pyais_2.11.1.bb
index 53996cc231..5cafa44efb 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.11.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master"
 
 PV .= "+git"
-SRCREV = "e7780f743b03c5e6ecc651fdeb209fa94e0e0250"
+SRCREV = "b86b35e29b1f442d9bd20ce5ece4f4db8fb3dab5"
 
 
 inherit python_setuptools_build_meta ptest-python-pytest
-- 
2.43.0


