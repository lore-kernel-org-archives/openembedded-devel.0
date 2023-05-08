Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C48CC7EE2E
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:18:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.103806.1683541114562419478
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wvozvAmu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541112; i=@fujitsu.com;
	bh=TotX/VTb14rWpXYexW471XG1/dHT0sBya/BsnP4juUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=wvozvAmuVZZoDtQMCd3QswHdlVoFRMSz48g4SXJK/Sx84kWTxrI3/a7hkkH69BgpC
	 VG3pVXefljfYcA//LxmRYJlGsh2QZ4Kn62HzpxDit/ZyWK8rFrxH2zHckCgDwLNGop
	 6VeZ3V3rR5uoE+E4nuBSdtFxhA1x65UYevyLcGcqC4MrxKHzciOAnKNC4LYnDaUjP8
	 a+qUQSNKqHHkFR1hMGPPomoX1hS+Xgl+SPs0riiuGlmRyk39ueKG+rgGD0na2HMbBi
	 w30HbvGci3LQa3hns0sLwGW47Z1/XaHzU3DUdKifWH5VzdArzdPXPay/qXeJJD08vV
	 A8bxhvcPZAzMg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpFtxJiL
  FYP0tYYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPW1v+MBX1cFQ9XN7M2MC7l7GLk4hAS2Mgo
  0fljBzOEM41JYtO5O4xdjJwcbAISEtP3nmQHsUUEdCU+fpgLFmcWUJGYMfkIE4gtLOAr0bx1P
  guIzSKgKnHl5TQwm1fASaJpyXJmEFtCQEFiysP3YDangLNE86wbYDVCQDWvt7RC1ahJXD23iX
  kCI88CRoZVjKbFqUVlqUW6JnpJRZnpGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW
  5yTkpenmpJZsYgSGRUswQuYPx/s6/eocYJTmYlER5TQ+GpQjxJeWnVGYkFmfEF5XmpBYfYpTh
  4FCS4G3bFpEiJFiUmp5akZaZAwxPmLQEB4+SCK/sEaA0b3FBYm5xZjpE6hSjopQ4779TQAkBk
  ERGaR5cGywmLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5r0MMoUnM68EbvoroMVMQIv9L4
  eDLC5JREhJNTCpT+j/nuR2L5wv9cD+q/8uS0XJ9GiX7P2mq1l8u+f15Gd/GIu13NPNbJjUyu4
  07+RutTio+//h9eonmXc2rL/x6WdPZby9eV7mO+nYIr6Tn3mTCuXfrje2v58yfUb67z1HVmYK
  R8y7Xfv0CLfRvfa/LzR3VL3oUTBOX3UwLTtpxx+jy9ppLt26JzSPPHfMDLxysne+cNDiFQ8cJ
  OM4pn8Pv7is6qO6pX7y8UkOEtLO0o//q8n/rX10UXLmnGtWYVGrBb+lbVOur5Gd4LeLp8FKPU
  B/xYfUJ/F5nU8bGrQLnU0iDiw8GPNwdsTa5+cnP5OvcLxuJ1h/OO3mux3mmrsm1tWqFTIKay1
  ruhejdUqJpTgj0VCLuag4EQBLi/YHBAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-591.messagelabs.com!1683541112!499369!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18855 invoked from network); 8 May 2023 10:18:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:18:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id EC43A1D2;
	Mon,  8 May 2023 11:18:31 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1EBBB1C2;
	Mon,  8 May 2023 11:18:30 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.15.3 -> 2.15.4
Date: Mon,  8 May 2023 18:18:18 +0800
Message-Id: <1683541101-25407-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541101-25407-1-git-send-email-wangmy@fujitsu.com>
References: <1683541101-25407-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102407

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add visitor function for TryStar to AsStringVisitor and add TryStar to astroid.nodes.ALL_NODE_CLASSES.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.15.3.bb => python3-astroid_2.15.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.15.3.bb => python3-astroid_2.15.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.15.3.bb b/meta-python/recipes-devtools/python/python3-astroid_2.15.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_2.15.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.15.4.bb
index bcde069381..60537289ed 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.15.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.15.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "44224ad27c54d770233751315fa7f74c46fa3ee0fab7beef1065f99f09897efe"
+SRC_URI[sha256sum] = "c81e1c7fbac615037744d067a9bb5f9aeb655edf59b63ee8b59585475d6f80d8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


