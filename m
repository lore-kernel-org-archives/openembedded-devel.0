Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A79C83F21
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 10:54:25 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.33778.1752317657665720551
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 03:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YgMtB0N7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2025071210541149f8b0c4037904de01-64okxi@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025071210541149f8b0c4037904de01
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 12 Jul 2025 12:54:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=is4RysXYB++r9syya5Q9FMJUzji61ONABZzzBBSxyv8=;
 b=YgMtB0N7hwVqmQpMW9Zfd0pcuJs9uPDlk5JgiK7Ht/7YH/6S7OtfEo9QHrqmyytoQApLcr
 o6dosUOu1k7uhhDrJRoKIFTkfPZ9oaGtjrLPkxMYx0QPGBHSFbKf89InQMouRuz46MSBpDTL
 WRirbajHr5Jojzsl0J4Qvv03yE3tX6b7pmvDrDDPP/xiSdtDASVlIbDta1apZT67z704Zkj2
 ms1yuNPZ00VU/5HCMbzFwBmGB6GXfc1vfFU8qksoTsHrnabo4hUZBaSqhOru7A1S+y6cdXhP
 AK1k1Y0wJ53kpunvwPBg99mv+2WJ0dEDcxjodazoUnOPssF7GseInl/g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/2] spdlog: upgrade 1.15.0 -> 1.15.3
Date: Sat, 12 Jul 2025 12:53:16 +0200
Message-Id: <20250712105317.2524650-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 10:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118472

From: Peter Marko <peter.marko@siemens.com>

Fixes CVE-2025-6140 (in 1.15.2).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../spdlog/{spdlog_1.15.0.bb => spdlog_1.15.3.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.15.0.bb => spdlog_1.15.3.bb} (87%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.15.3.bb
similarity index 87%
rename from meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.15.3.bb
index 25d8249917..d03f01d3a8 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.15.3.bb
@@ -3,9 +3,8 @@ HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9573510928429ad0cbe5ba4de77546e9"
 
-PV .= "+git"
-SRCREV = "96a8f6250cbf4e8c76387c614f666710a2fa9bad"
-SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
+SRCREV = "6fa36017cfd5731d617e1a934f0e5ea9c4445b13"
+SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;tag=v${PV}"
 
 DEPENDS += "fmt"
 

