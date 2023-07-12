Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734D4C001DC
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.970.1689139824010161555
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=TJFHzJFM;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FD0F1BF204
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139822;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=Y53PAsMdmEZco/MlKYYj0kMRjfXYpGRN4YmJfrd4b5M=;
	b=TJFHzJFMMWHwMbf1v6ZKRQ36dHjag8mkTxb1Jd9IS64vic16wSBYHaCAkONj5Bq9CHsAxs
	7dJpWfqSSNtJpFkstJgfVojq0wuJ7HVuTJjFWHqyWxYyf8Rb+DlpwRTgo92V3dICJXujfc
	XL7DT5Ps3A9C5pDV0j8ra/R/FbNh+4f3Zr34629OCi+/apA5wh+PwJTgOLO11C/tQRbUHU
	rx1SkiEFSjgueXrxyVQD8XwaoJpsOjmXvoatVacL3Rt8YN9/YGdKvYAxvB+zVWz/cBBNVL
	KyxYvH1BtUOyAEh3RTKSRnAB9+katFeIWbMl0vJnlet69+VRc2pxzoi61Dt8Yg==
Content-Type: multipart/mixed; boundary="===============5014412631071082050=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-engineio: upgrading to 4.5.1 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103759
Message-Id: <20230712053030.734D4C001DC@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:30 +0000 (UTC)

--===============5014412631071082050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-engineio* to *4.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-engineio-upgrade-4.4.1-4.5.1.patch
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
From ce9fd4bff83c89f252c13f16b20ca346c12dcc58 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:05:11 -0500
Subject: [PATCH] python3-engineio: upgrade 4.4.1 -> 4.5.1

---
 .../{python3-engineio_4.4.1.bb => python3-engineio_4.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.4.1.bb => python3-engineio_4.5.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb b/meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb
index b20a6413f..d97248891 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "eb3663ecb300195926b526386f712dff84cd092c818fb7b62eeeda9160120c29"
+SRC_URI[sha256sum] = "b167a1b208fcdce5dbe96a61a6ca22391cfa6715d796c22de93e3adf9c07ae0c"
-- 
2.25.1


--===============5014412631071082050==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-engineio-upgrade-4.4.1-4.5.1.patch"

From ce9fd4bff83c89f252c13f16b20ca346c12dcc58 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:05:11 -0500
Subject: [PATCH] python3-engineio: upgrade 4.4.1 -> 4.5.1

---
 .../{python3-engineio_4.4.1.bb => python3-engineio_4.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.4.1.bb => python3-engineio_4.5.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb b/meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb
index b20a6413f..d97248891 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "eb3663ecb300195926b526386f712dff84cd092c818fb7b62eeeda9160120c29"
+SRC_URI[sha256sum] = "b167a1b208fcdce5dbe96a61a6ca22391cfa6715d796c22de93e3adf9c07ae0c"
-- 
2.25.1


--===============5014412631071082050==--

