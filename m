Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016E9C44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 20:18:41 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2682.1784492310584649276
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 13:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GuSlIjdn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260719201828b01ef8fb0a00020718-dgu908@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260719201828b01ef8fb0a00020718
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 19 Jul 2026 22:18:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Vp6+v6uhyilIWMJXoM2a/5PuSqcXjaeRSfCdVmMkmBg=;
 b=GuSlIjdnrWBRt9vPGtv0sGBIebbyXpCeYlhYVDCuzjsoGshEs54Kjv4mD80j7wmFUJDyTT
 UCtHcUMBpGp30g/8figea6FqdNprNsH+WMxgWryLLGrFa4ja7CO+iXMdk/JcLJGBYLzYQENx
 PaWDWL5C3pJlSzHUE46E69QjkGxxfm/WG46fsNJUwP4AFA/aXGSRqtzFToECgirsp+U2M1hE
 5YbWyv0ku5yZ2NZ51ncSO0v59lGGNfXqnNPGqinQ3hdkm7uv9/ySnDTGuZx3Kt45N7Dc2hX0
 /WCEgAk8NKWW8ACy+y2265L32bvBRGrBiI2Tfkq+wb7HsDdtJsmIOxYQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [meta-oe][wrynose][PATCH 1/2] c-ares: upgrade 1.34.6 -> 1.34.8
Date: Sun, 19 Jul 2026 22:18:23 +0200
Message-ID: <20260719201824.446043-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 20:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128267

From: Jason Schonberg <schonm@gmail.com>

Version 1.34.8 is a bug fix (a regression that shipped with version 1.34.7)

Version  1.34.7 is a security fix addressing memory leaks, null pointer
  dereferences, denial of service, use after free etc.  Fixes CVE-2026-33630

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.8
Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.7

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(From meta-oe rev: 0770ef40431a8ff6add0b9b66bd67bc7415caa7b)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../c-ares/{c-ares_1.34.6.bb => c-ares_1.34.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.6.bb => c-ares_1.34.8.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
index c9c54a9fa0..df994c83ae 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5"
+SRC_URI[sha256sum] = "c222b6d681096f9444d2c4863d2c1174019e27cacca0a4a5c114d36dd7d7bf78"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""

