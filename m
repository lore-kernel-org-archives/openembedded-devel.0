Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D649FC04E69
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 05:09:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.1189.1690780160255688121
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 22:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=QeUwybAP;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.193, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FD9C240004
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1690780158;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=2Jot/M7bMm89DvI25cF4Koh76M4WN82vzIJdtiuNn6M=;
	b=QeUwybAPnTKZxaCI9IuK0M2b45ieNWuqyTR4t+9QdZq/DvKTs8qDx+k8OcDpNdx4/d1/XQ
	QYMSGcCfJMW/6MyYPeEUHf9B8R1lPmhPMLUcsx2MQ+4Gqxe7haZUJoJjyB9epO74HMiOnq
	DNyH5ICHL/49FrRyj3KeZ3x0zTE9KGRcPPiXsmQOMLHpKv7BCDTzIsy+m4Hr1uL098yxzE
	Ea2U1igM8OuM6/vRCbFbffBYrkZ+1O6XGrd0jVr+uesi5g60d4TnsGRx//+9UN9SreBHPS
	ktG6NUHCViokStrS0zLlNU8/BGwa17GIi55V/espt+heN01dIhaS3RYiXNYF9g==
Content-Type: multipart/mixed; boundary="===============4658856995340787414=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-marshmallow: upgrading to 3.20.1 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104107
Message-Id: <20230731050924.D649FC04E69@smtp.lore.kernel.org>
Date: Mon, 31 Jul 2023 05:09:24 +0000 (UTC)

--===============4658856995340787414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-marshmallow* to *3.20.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-marshmallow-upgrade-3.19.0-3.20.1.patch
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
From 9d4ce13d23c371beb8b9cd020b6eebed19c0d793 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sun, 30 Jul 2023 21:50:20 -0500
Subject: [PATCH] python3-marshmallow: upgrade 3.19.0 -> 3.20.1

---
 ...hon3-marshmallow_3.19.0.bb => python3-marshmallow_3.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.19.0.bb => python3-marshmallow_3.20.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb
index 91f6462b3..5024b2512 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "git://github.com/marshmallow-code/marshmallow.git;protocol=https;branch=dev"
 
-SRCREV = "78edf5582ee325bba99f097cb7167ef73b6f84d8"
+SRCREV = "dda9a8014dfe1bcb35e21307cfd5a8e19615a284"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


--===============4658856995340787414==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-marshmallow-upgrade-3.19.0-3.20.1.patch"

From 9d4ce13d23c371beb8b9cd020b6eebed19c0d793 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sun, 30 Jul 2023 21:50:20 -0500
Subject: [PATCH] python3-marshmallow: upgrade 3.19.0 -> 3.20.1

---
 ...hon3-marshmallow_3.19.0.bb => python3-marshmallow_3.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.19.0.bb => python3-marshmallow_3.20.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb
index 91f6462b3..5024b2512 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "git://github.com/marshmallow-code/marshmallow.git;protocol=https;branch=dev"
 
-SRCREV = "78edf5582ee325bba99f097cb7167ef73b6f84d8"
+SRCREV = "dda9a8014dfe1bcb35e21307cfd5a8e19615a284"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


--===============4658856995340787414==--

