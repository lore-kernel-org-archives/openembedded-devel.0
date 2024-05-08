Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42189C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 11:17:12 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.9606.1715167021349999078
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 04:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZY+y119A;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20240508111657655a5b83c53dabe3f0-og867v@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20240508111657655a5b83c53dabe3f0
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 08 May 2024 13:16:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=CLqM3NryKxUVqmfsNjBsoLiAL7hjlVMBoo4Bbnu2IuQ=;
 b=ZY+y119AQgtck5pcZ/RgCptO6QDMXDV84IkuQDQ54jRUetD0hfhNN9IGY3sJQKSwhpT12w
 EXIt+xAEf4X25uJkVNTPJuGgwYodv8zfgRrXryzjMOD9Qn+OxlaiPBFyWolupgydkRv8NuKE
 CC65YfjpOw5T4wSs5WQ51wrRHT1jA=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][master][PATCH] re2: remove dev dependencies from main package
Date: Wed,  8 May 2024 13:16:09 +0200
Message-Id: <20240508111609.4157976-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 11:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110275

From: Peter Marko <peter.marko@siemens.com>

It's a bad idea to add dev dependencies to main package.
It's pulling build dependencies including toolchain items.

The dependencies "were needed" because main package contains
packageconfig file.
This can be fixed by correct packaging.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/re2/re2_2024.03.01.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
index 192fe265f..6e5b32a94 100644
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


