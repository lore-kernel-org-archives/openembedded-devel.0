Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EE6C2BA15
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 20:38:39 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.42019.1718570317707913365
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 13:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Fz7fnoMv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20240616203835b1678a6f97dc5602bc-m2vfrj@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20240616203835b1678a6f97dc5602bc
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 22:38:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=20JY5tUEdXYqaWKWJSJno9odTrZp38sXCyd2D7/ncAI=;
 b=Fz7fnoMv9C/aMjtA4J60Crst5sPShEgtzrAyAngV0BSyo4Nadkb/n1PoiLR/ZSqMrPTDXB
 XjDV/cxODgnBJ3KcpKF6NYE34Fd0xni9uXu0GWbr9bE1nw9GH177Gu/5GL/aGWsC6QzPlouO
 Ckmcx9KcYsyCsFF2lnLeVfuMOcMGY=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH v2 5/6] re2: remove dev dependencies from main package
Date: Sun, 16 Jun 2024 22:36:50 +0200
Message-Id: <20240616203651.856968-6-peter.marko@siemens.com>
In-Reply-To: <20240616203651.856968-1-peter.marko@siemens.com>
References: <20240616203651.856968-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 20:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110936

From: Peter Marko <peter.marko@siemens.com>

It's a bad idea to add dev dependencies to main package.
It's pulling build dependencies including toolchain items.

The dependencies "were needed" because main package contains
packageconfig file.
This can be fixed by correct packaging.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/re2/re2_2024.03.01.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
index 192fe265f1..6e5b32a945 100644
--- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
@@ -16,9 +16,6 @@ DEPENDS = "abseil-cpp ${@bb.utils.contains('PTEST_ENABLED', '1', 'gtest googlebe
 
 inherit cmake ptest
 RDEPENDS:${PN}-ptest += "cmake sed"
-RDEPENDS:${PN} += "abseil-cpp-dev"
-
-INSANE_SKIP:${PN} += "dev-deps"
 
 EXTRA_OECMAKE += " \
 	-DBUILD_SHARED_LIBS=ON \
@@ -39,6 +36,6 @@ FILES:${PN} = "${libdir}"
 INSANE_SKIP:${PN} += "dev-so"
 
 # Don't include so files in dev package
-FILES:${PN}-dev = "${includedir} ${libdir}/cmake"
+FILES:${PN}-dev = "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


