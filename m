Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2EFECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 10:59:56 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web12.4862.1666954786624809721
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Oct 2022 03:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PlN6BKMa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202210281059430d59f2a000345a49b5-inmmkd@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202210281059430d59f2a000345a49b5
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 28 Oct 2022 12:59:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=eIKJTwPqtqwP39iH1OObY+GHt+bWurivRdwJFasOdxg=;
 b=PlN6BKMarmtwq9R6goTwGmXsmgFY+y9ICPmXSk2+RNu3WHj493Tw8G6wX3VulN3bCa18nt
 /azzyxiF1yc7o9/QTTBrmM6Xj/nus6lNm3SiPFNLNu1wO4J+gCANVp9jAt3E4hAOvy62UcWe
 ClTtvlvyQkqB6D81vjGfOwVf7tj4E=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 1/2] cpputest: remove dev package dependency
Date: Fri, 28 Oct 2022 12:59:09 +0200
Message-Id: <20221028105910.22397-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 10:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99331

The main package is empty so it was not possible to install
  dev package to sdk as it depends on main package.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
index 921143a74..d923e7ac9 100644
--- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
+++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
@@ -18,4 +18,6 @@ EXTRA_OECMAKE = "-DLONGLONG=ON \
                  -DEXTENSIONS=OFF \
                  "
 
+DEV_PKG_DEPENDENCY = ""
+
 FILES:${PN}-dev += "${libdir}/CppUTest/cmake/*"
-- 
2.30.2


