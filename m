Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEBEE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:50:16 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.138544.1734641410256811100
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:50:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=hUEUi0RU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20241219205008e494c64005ec29978f-bit7dd@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20241219205008e494c64005ec29978f
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:50:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8nbAoc/20xQfjyyA28I5Ummr1jXjPqN4Pm/zBnc5BKQ=;
 b=hUEUi0RUqDTsN4TchhGTx9Yr8I6bs97TcT4NfpG0gHOEJMptS0NDrhSa/GYUAN95vVxxFr
 z7+y8/TMoJau83oRcGWMVH4FU7HQqD+wh6Dbt1JkBaW6S17LwDiUduHqvDjyUFownqK2BEt0
 +JL5LIF+B+jDQjM60VuaWPNHgkv95uPVmI+A6hNBRvSFdEwvnoao0z38l+eMeUAJbMkqz3IC
 UKqrf7lJspPSk9LZW/qLyof3u/mV1PjBU5y7a4aMPtjcC39c4w/9sd7twIPegnkz5oex9Eka
 PS3rbEXryhjhk8UD2LJ2b2w9AXm2QWGOkwjGbJ1x/kw0rpGV1UQpGRrA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 05/12] gattlib: mark CVE-2019-6498 as fixed
Date: Thu, 19 Dec 2024 21:48:54 +0100
Message-Id: <20241219204901.347009-6-peter.marko@siemens.com>
In-Reply-To: <20241219204901.347009-1-peter.marko@siemens.com>
References: <20241219204901.347009-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114421

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


