Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A16CA600E
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:31:06 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2793.1791487855985957413
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 12:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jinmTBPz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261008193052bc87fa460600020757-vsfbj_@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261008193052bc87fa460600020757
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 08 Oct 2026 21:30:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=z+7yWw0HwTq5UrnM98SfYydnshNPd9k/S2LssdtV7dI=;
 b=jinmTBPzo4CmOlMAnj9WIi4MBVZXXOHN1pDq8r9IZowxrNT4Aj7X619x8Ialif6uI423+w
 /VzF2ah493moCfsKIlPrBiqIbwBsrVqVPz7bH3D0gRFsEcLAshaJ9m0dV2GO7JoVt7COXK8B
 h0UEHWHK0iCMqYGcGVQn1YQPSNth+LiXaYwjCBQn010IrEWyu6CmxEuTMv5nteUnOIKkIQrJ
 00gRFm89e0GOpA3v0WFNnwKgvl+mhb3CLtO62zKYG7Fd9rC98afoieF0MLaD1PF15qQFUCAs
 WHiEeOZNBm3Sn/rVx4t+L/w0tJvFrrwG+ACSe2ZIMJQlNR3ieJXxxy1g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][wrynose][PATCH 1/2] squid: upgrade 7.5 -> 7.6
Date: Thu,  8 Oct 2026 21:27:57 +0200
Message-ID: <20261008192758.1176465-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 19:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130676

From: Khem Raj <khem.raj@oss.qualcomm.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(From meta-oe rev: ed02dad69f6468204c160ae9597069bd01365f03)
Fixes CVE-2026-47729, CVE-2026-50012 and CVE-2026-61642.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-daemons/squid/{squid_7.5.bb => squid_7.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/squid/{squid_7.5.bb => squid_7.6.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/squid_7.5.bb b/meta-networking/recipes-daemons/squid/squid_7.6.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_7.5.bb
rename to meta-networking/recipes-daemons/squid/squid_7.6.bb
index 3364c1f746..637d1f6942 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.5.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.6.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "f6058907db0150d2f5d228482b5a9e5678920cf368ae0ccbcecceb2ff4c35106"
+SRC_URI[sha256sum] = "852178fdc37c5b0786a934fc990c7d2fffc82acf19b2284be209b96431d25992"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://errors/COPYRIGHT;md5=41d117978dbffedc893e8eeca12537d0 \

