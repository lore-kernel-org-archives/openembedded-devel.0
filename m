Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643D6EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.998.1689139858174253126
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Qrjz3MsA;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B80D1C0003
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139856;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=0blKlQcyWcyp1E9u0c9hsC3l/ggrTTBgF1E7P30jFX4=;
	b=Qrjz3MsAbWG10yYU+LhHT83q/tHBQLk5iyXPtDLwpAWF6QQ5v9ExixsTnAWyGmcGmpabXe
	0pY0crccDQD9PVxx8jOss5fA/QiGfA4t3TKvjS3sONUJhHBFNcbupCjtiGvbrLlTSaK9FV
	wc9X024OTAURZSOop4g0iU2PakGG2lYpv9amhbS0wohFoFslJaxg+sXrP397gyHMz7s4aQ
	KOvWOVHB2AnAcdHPYX96sDO+XLNY55ZPbbm+uCbE0eqqvHFqv0VAAiaUD73nxeZ2xljWr9
	4aqBANp+RfYsWC8wsPrB+OwkAexIYFyKSvHDuTdmws5J4bVgTwCmGSoJylIQeA==
Content-Type: multipart/mixed; boundary="===============4057687659077894184=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-mock: upgrading to 5.1.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103779
Message-Id: <20230712053100.643D6EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:00 +0000 (UTC)

--===============4057687659077894184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mock* to *5.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mock-upgrade-5.0.2-5.1.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 5b59c4bd4d04fa23f10f44fd1ec1291d3e160e9d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:12:40 -0500
Subject: [PATCH] python3-mock: upgrade 5.0.2 -> 5.1.0

---
 .../python/{python3-mock_5.0.2.bb => python3-mock_5.1.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mock_5.0.2.bb => python3-mock_5.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb b/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
index 6b511d82f..d9ecb9d4c 100644
--- a/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += " \
     python3-unittest \
 "
 
-SRC_URI[sha256sum] = "06f18d7d65b44428202b145a9a36e99c2ee00d1eb992df0caf881d4664377891"
+SRC_URI[sha256sum] = "5e96aad5ccda4718e0a229ed94b2024df75cc2d55575ba5762d31f5767b8767d"
-- 
2.25.1


--===============4057687659077894184==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-mock-upgrade-5.0.2-5.1.0.patch"

From 5b59c4bd4d04fa23f10f44fd1ec1291d3e160e9d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:12:40 -0500
Subject: [PATCH] python3-mock: upgrade 5.0.2 -> 5.1.0

---
 .../python/{python3-mock_5.0.2.bb => python3-mock_5.1.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mock_5.0.2.bb => python3-mock_5.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb b/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
index 6b511d82f..d9ecb9d4c 100644
--- a/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += " \
     python3-unittest \
 "
 
-SRC_URI[sha256sum] = "06f18d7d65b44428202b145a9a36e99c2ee00d1eb992df0caf881d4664377891"
+SRC_URI[sha256sum] = "5e96aad5ccda4718e0a229ed94b2024df75cc2d55575ba5762d31f5767b8767d"
-- 
2.25.1


--===============4057687659077894184==--

