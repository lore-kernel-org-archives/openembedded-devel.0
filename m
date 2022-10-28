Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45157ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 08:11:55 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web09.3922.1666944709540915673
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Oct 2022 01:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DJzYrnFH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20221028081147ee84cd8ef07d6a25d0-glfdgi@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20221028081147ee84cd8ef07d6a25d0
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 28 Oct 2022 10:11:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rulYMsVgSUX+IIVJkCHseSwPtRmQ6q0C9XxE8+zg04Y=;
 b=DJzYrnFHr+58wsRLymWA1ZlGNxlG9wnG7JgTsbktXnuC4yAVTNJIxIfx+644p6723qBU5Q
 h43KmFYbappU6JxLSrWE/OGF39w3z6qLRXMIVVl//IcFAHxFs+vYcxFtKM0qxGPFrdJiRCDV
 MhtyTvI68XAHY8Lhe5In0eXsYSQng=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/2] cpputest: allow empty main package
Date: Fri, 28 Oct 2022 10:11:33 +0200
Message-Id: <20221028081134.15749-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 08:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99328

iThe main package is empty so it was not possible to install
  dev package to sdk as it depends on main package.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
index 921143a74..52c01f44e 100644
--- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
+++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
@@ -18,4 +18,6 @@ EXTRA_OECMAKE = "-DLONGLONG=ON \
                  -DEXTENSIONS=OFF \
                  "
 
+ALLOW_EMPTY:${PN} = "1"
+
 FILES:${PN}-dev += "${libdir}/CppUTest/cmake/*"
-- 
2.30.2


