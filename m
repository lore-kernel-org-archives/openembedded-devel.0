Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0F5C88E65
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 15:23:59 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.999.1789313026233200567
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 08:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=qpEoBY3U;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260913152348f9e6806da80002073c-3nzjlj@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260913152348f9e6806da80002073c
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Sep 2026 17:23:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5fDq8QiRVH+NnaUfeGqRY5Luy8gy3MBCxw5xfNQ2+Vk=;
 b=qpEoBY3Uk5HRSMZ8fIWHJX+nUbtzj0G4uutzkZizMOsg9L+g1t29FHjWyUFgdZcD32liqn
 4WH5MNYpqzbvcGvuWj8Xn2q65Rj+BMsLG/9G13fPmUpMuejdi9/WSxiRFYh3X/tryi18baSo
 vvtBu+14tM+bSiRGhY1DUYr77VMDV4CQbypUCF4OeCn1sTjoiS0wkaZiTCSMspuQn3J5bZ/K
 tlRz0Oqj0t6IQ/IR9ku2on12WCLp1IambjjbeKFWYcuja7ungHYNA++9Gc0qGuuiGKsQ2Yt+
 LmZlzuLej7tZHU2DgilUdbzRup3nAUXVzWnHmCDaAXm/zebWC6dgI+5g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 3/4] msgpack-cpp: fix upstream check
Date: Sun, 13 Sep 2026 17:22:52 +0200
Message-ID: <20260913152253.3201491-3-peter.marko@siemens.com>
In-Reply-To: <20260913152253.3201491-1-peter.marko@siemens.com>
References: <20260913152253.3201491-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 15:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129997

From: Peter Marko <peter.marko@siemens.com>

Without any prefix/suffix, it picks the highest version-like string.
Set REGEX to pick msgpack-cpp version.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/msgpack/msgpack-cpp_8.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_8.0.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_8.0.0.bb
index 87f11d279b..0d741c5212 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_8.0.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_8.0.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/msgpack/msgpack-c/releases/download/cpp-${PV}/msgp
 SRC_URI[sha256sum] = "4a3c0c0ac55ef4456c2d0b93c21b5d105aa3a8f21ef8fa9758550feaf989b92f"
 
 UPSTREAM_CHECK_URI = "https://github.com/msgpack/msgpack-c/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+) C++"
 
 S = "${UNPACKDIR}/msgpack-cxx-${PV}"
 

