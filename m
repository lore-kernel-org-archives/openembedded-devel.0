Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A973D172B3
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 01:38:34 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43631.1769996307156133722
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 17:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bi88E+u/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769996307; x=1801532307;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KTfl64wjTJkXoD/fPAfdUSoRRu7xn35cS5E8Yix7BMU=;
  b=bi88E+u/1zzZiItm3lMlargy3vODgx3PbUAqTgl9ixW48KzlPumRmsWg
   /0oAsUUWh8uw9rCVSmLWs4i4TQ+3CwH4szn2AXhxlCIkqmgHfGdM7nTco
   /xu/UxhQn/5yVc2ZJWDDMvUbZ0OG2LlrjVKyLbjJGs/cgzlAvQJgkU6Rn
   FnWMWLGM08GbGJtaK2j7OXhroVlAnSscDmE2BeXw3B2zFvUiMC+2/0PGP
   xvdZ1oSpAOIVwnfmWMMLroD/EXTYSP5qN1Ns1Hu9CVnGsSlzjHQPWZ/fS
   7BCDMR4WS8Vvc7CmxjrVTGCxQcexltFwLxH1cCrbueKcoz7QwZEUqxIcR
   g==;
X-CSE-ConnectionGUID: U8sl8OO0TuqaK4HtKHmdKg==
X-CSE-MsgGUID: 34I0X5HpQiqYCUUP3sjAFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="228090916"
X-IronPort-AV: E=Sophos;i="6.21,267,1763391600"; 
   d="scan'208";a="228090916"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 10:38:25 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 4CB811000366
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Feb 2026 01:38:25 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 02BE1100039C
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Feb 2026 01:38:25 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id AF8B91400AD3
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Feb 2026 01:38:22 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-appdirs:Add HOMEPAGE
Date: Mon,  2 Feb 2026 09:38:14 +0800
Message-ID: <20260202013814.14500-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 01:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124043

Add HOMEPAGE in python3-appdirs.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
index bee0b7d815..c027e80b28 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
@@ -1,4 +1,5 @@
 SUMMARY = "A small Python module for determining appropriate + platform-specific dirs, e.g. a user data dir."
+HOMEPAGE = "https://github.com/ActiveState/appdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
 
-- 
2.43.0


