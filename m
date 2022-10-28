Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4601FFA3743
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 08:11:55 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web12.3841.1666944710412710309
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Oct 2022 01:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HBjbyanP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202210280811487ff5571d844d5414eb-3nv8jd@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202210280811487ff5571d844d5414eb
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 28 Oct 2022 10:11:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6VG2idKDPWJIbkPNdqHMDVJ/A+L8zcD5uY58Qb8Wdn0=;
 b=HBjbyanPdc91o5ebE+TDVC3zcZC0qZRlOUBaPDaoHRerXZtAvSRHNivo69Nv07Wx0Ia7nb
 8W3zQuq4hKlzuk9gFTKh4WLFz/gU+Q9/BHMkodN4FSWGi5SywIDxwzfHwEaLhFLKyBVAmPl/
 NTKYnGXsKU2aGm+EJMg69/uooL0H0=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/2] cpputest: add possibility to build extensions
Date: Fri, 28 Oct 2022 10:11:34 +0200
Message-Id: <20221028081134.15749-2-peter.marko@siemens.com>
In-Reply-To: <20221028081134.15749-1-peter.marko@siemens.com>
References: <20221028081134.15749-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 08:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99329

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
index 52c01f44e..f3590ee7b 100644
--- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
+++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
@@ -15,9 +15,11 @@ inherit cmake
 EXTRA_OECMAKE = "-DLONGLONG=ON \
                  -DC++11=ON \
                  -DTESTS=OFF \
-                 -DEXTENSIONS=OFF \
                  "
 
 ALLOW_EMPTY:${PN} = "1"
 
 FILES:${PN}-dev += "${libdir}/CppUTest/cmake/*"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[extensions] = "-DEXTENSIONS=ON,-DEXTENSIONS=OFF"
-- 
2.30.2


