Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9B1E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:28:55 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.138144.1734640134643274085
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:28:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=K6BX3rmK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241219202852315cd91551f20af53c-he6mgy@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241219202852315cd91551f20af53c
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:28:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8nbAoc/20xQfjyyA28I5Ummr1jXjPqN4Pm/zBnc5BKQ=;
 b=K6BX3rmKutj89b3ElS+FoICAmTSS+Eee4exackMps6unSqXRYt14oqwSN5CcfWG5hrHz8v
 r9+ytCcT/8ufOveb/yS52rxlMLbZlBEVyvaTZZUkJo68yKZrJzcOqwPYCm6/FAcul2PbnkYI
 yOGD02QZN7AXn+FNPWXuFdcS8Oe5h+kv++sphDicFqBmIlMAosTYFT0fbD8aJTmh2MNl/PW8
 xd80X0j72XZmA25TkaXrI7WS1HQTR2M6GkCiabo6vm5CQtvpTL45ztMpWFALtZZ6s7DIyy7z
 CTqtZXTWVEWFGH34qETF82COshOFsf80jGGvelxdBDOFlNyF6u2poZJw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 05/12] gattlib: mark CVE-2019-6498 as fixed
Date: Thu, 19 Dec 2024 21:27:31 +0100
Message-Id: <20241219202738.346121-6-peter.marko@siemens.com>
In-Reply-To: <20241219202738.346121-1-peter.marko@siemens.com>
References: <20241219202738.346121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114406

From: Peter Marko <peter.marko@siemens.com>

Our hash does not point to exact tag and CVE patch is already in.

We use: 33a8a275928b186381bb0aea0f9778e330e57ec3
Fix: https://github.com/labapart/gattlib/commit/60b813a770e42fdb0e85c1d2da7a55327784b8d6

git describe --tags --match=v0.2 33a8a275928b186381bb0aea0f9778e330e57ec3 60b813a770e42fdb0e85c1d2da7a55327784b8d6
v0.2-262-g33a8a27
v0.2-85-g60b813a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 7ad28d594d..0841dc2596 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -17,6 +17,8 @@ SRCREV = "33a8a275928b186381bb0aea0f9778e330e57ec3"
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS[CVE-2019-6498] = "fixed-version: patch is already included in sources"
+
 PACKAGECONFIG[examples] = "-DGATTLIB_BUILD_EXAMPLES=ON,-DGATTLIB_BUILD_EXAMPLES=OFF"
 
 # Set this to force use of DBus API if Bluez version is older than 5.42
-- 
2.30.2


