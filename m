Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654FECAC5A4
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 21:31:53 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.1562.1726608704319602294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 14:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=J9Gd6yuP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2024091721314091a73bc9f20977698f-strgl0@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2024091721314091a73bc9f20977698f
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 17 Sep 2024 23:31:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=b1pF9ezKx2LkgRQ+GiTZzPLD3gMIcNl6Li9GhRo47b0=;
 b=J9Gd6yuPd0Qt3dBVaMmNAD6uoGYfo5jjwwN2ACP74/vmWlUs0LrEcmuZXuDE2dRhjH2j+q
 8ijwfMQcZrEZCLC6/Eb4nYoFF350zgyY8QIbRAQU0c96p9GMvhTukBJ8Cx3mOtkiqbtyge/5
 gZfrxI1dVfcATGk/iHD4cPbuwshuRUkNAnLaXIFXdoBu9nZDdcKtrzUV11N/swn36jFQGuta
 AIEMC/HezutvIdgtT+KJntEPDavScOlD3VET1E0fhmiX8dEvqzo5drdiPbfHa3xlDm0+UBSp
 xStZm/NUzaj464xnmpUFS1b2J2gqh497xIbqucmngWnZYIkwvhCXeA5w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/3] python3: upgrade 3.12.4 -> 3.12.5
Date: Tue, 17 Sep 2024 23:30:42 +0200
Message-Id: <20240917213044.627091-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 21:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112349

From: Trevor Gamblin <tgamblin@baylibre.com>

Changelog: https://docs.python.org/release/3.12.5/whatsnew/changelog.html

(From OE-Core rev: d9e2ebd6b24b802d1d4cd38b3b910e068c308809)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/{python3_3.12.4.bb => python3_3.12.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.12.4.bb => python3_3.12.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.4.bb
rename to meta/recipes-devtools/python/python3_3.12.5.bb
index 3ac83166ac..5c3b7a92f8 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554"
+SRC_URI[sha256sum] = "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


