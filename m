Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77401C001DF
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:20 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.936.1689139814676385770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=OufRRLbb;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.195, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1259060004
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139813;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=SWIY95FRwNu8Wy2kQ3S/LGL8fxpQRDgrlEQLGPnihok=;
	b=OufRRLbb0Jmt1LxdVWYFX5gp/ktUgGbdekiAsmun2nGIG/X7e73XYkrtEuNPvND1/GwsI1
	DgTMWZcq/XjECNz2+WbHmTdm0u75eC1V+Tr2XHHe8pdMaWiYut9s9qzKIqm9z3Aw0X/IH9
	fO82a6hmIZuOlN0n18Z0s+Y+yj27ikS2baPL6dE1D0DWbUouyCpqiSHZj2FrhOSCx4Y5qS
	up7699VAogfBEyaGgGJ/xy6j0y5whMeb9uhXpNOad4FCf7FtvxTd4O7raz/SMOElbQtzdL
	urAMPQFW4rqf11Qnw4W/awv+wuSgbGLvUiOOuUSGJiodRkjYNzcxzc9GVljnmw==
Content-Type: multipart/mixed; boundary="===============7201395758932767312=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-charset-normalizer: upgrading to 3.2.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103754
Message-Id: <20230712053020.77401C001DF@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:20 +0000 (UTC)

--===============7201395758932767312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-charset-normalizer* to *3.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-charset-normalizer-upgrade-3.1.0-3.2.0.patch
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
From 85fed9e693ce3e363b6a7adbe20b7958d67d81b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:39:48 -0500
Subject: [PATCH] python3-charset-normalizer: upgrade 3.1.0 -> 3.2.0

---
 ...-normalizer_3.1.0.bb => python3-charset-normalizer_3.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.1.0.bb => python3-charset-normalizer_3.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb
index 27bd625b4..0c2810c62 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "34e0a2f9c370eb95597aae63bf85eb5e96826d81e3dcf88b8886012906f509b5"
+SRC_URI[sha256sum] = "3bb3d25a8e6c0aedd251753a79ae98a093c7e7b471faa3aa9a93a81431987ace"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============7201395758932767312==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-charset-normalizer-upgrade-3.1.0-3.2.0.patch"

From 85fed9e693ce3e363b6a7adbe20b7958d67d81b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:39:48 -0500
Subject: [PATCH] python3-charset-normalizer: upgrade 3.1.0 -> 3.2.0

---
 ...-normalizer_3.1.0.bb => python3-charset-normalizer_3.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.1.0.bb => python3-charset-normalizer_3.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb
index 27bd625b4..0c2810c62 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "34e0a2f9c370eb95597aae63bf85eb5e96826d81e3dcf88b8886012906f509b5"
+SRC_URI[sha256sum] = "3bb3d25a8e6c0aedd251753a79ae98a093c7e7b471faa3aa9a93a81431987ace"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============7201395758932767312==--

