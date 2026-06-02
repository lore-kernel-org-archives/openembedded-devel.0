Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CD6CD6E61
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:09:05 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21231.1780394939051557963
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pii+X2A0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394939; x=1811930939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4gyKv4IdYnXUuHxeE/uYktvoNLZV0cTPwsUa67k1giw=;
  b=pii+X2A08FHJcqDwXC3vpmjyQBFp4TnMrKEPNqX5hxFW5ldncIU0QDti
   IfvDCdTI1Gj1rZR+RJPCsQewSHNe6iGxrUDUD7ShYGOUZ5SMBzp36yOwB
   L0i34jjIQN4cftUMIQZh4cD35AZoS9sIBlQ/I8daFpYM3MnO3vgQp5kpR
   /5Sb0uxuGVe8dhMa6Lf2NrjBpbzmJCGocWBi7SnIJ/3oVTnTHL+sIzmn6
   b1ICPlJKYx1xXILXEbyPJsQDoBIjCpAe1Rc6C58gDMGRxow6U6q9wsnY6
   4mOQtid3c0xcj6b3ipc2PjINZoM5qXpGV9MDCpU50UF4cE2nBOnRIbboQ
   w==;
X-CSE-ConnectionGUID: L0ANbHkfRk6hJymdFg/+qQ==
X-CSE-MsgGUID: BnJfEJc0TJiAtR99rKR1yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242741702"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242741702"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:57 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 83E5C4DE5
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:57 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 33D0218026D4
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 54E641800587;
	Tue,  2 Jun 2026 10:08:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/38] python3-tox: upgrade 4.54.0 -> 4.55.0
Date: Tue,  2 Jun 2026 18:07:48 +0800
Message-ID: <20260602100755.2117-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127354

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- ci(schemastore): sync fork before pushing branch
- feat: Also pass TERMINFO when in an interactive shell
- fix(pip): skip constrain_package_deps when constraints is set

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.54.0.bb => python3-tox_4.55.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.54.0.bb => python3-tox_4.55.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.54.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.55.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.54.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.55.0.bb
index aed495622b..cbe7e1e442 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.54.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.55.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "21e36fd8256590379620848d0b03b52f4d541b65b749de1a17c3e616978dad58"
+SRC_URI[sha256sum] = "7ede1e1e70f8fe984f7985d7ca58a1e1c15fe9f8715897e38accc607c8de9f70"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


