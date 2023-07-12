Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746A8C001DF
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.989.1689139895044128941
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Dq+bzpzj;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69C981C000A
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139893;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=6PyRIj7qhG7jukLmsM9xy1hMWb30GbEy2pcKhm2eZmU=;
	b=Dq+bzpzjGaTCBQ3JZzuOIqtOVubchl52xNzs/Pl5XC6Ur4FegQdgWOSIq/96WSfa9JBvJY
	1IrpkG+sn076jHlVy9YlbbB97S1T0tUSOrTXK9BC75Kjs4Nc11tmVYT2e9UhSIYvbOBCXE
	jUVTPEusj3/S6Ra+Wu03jQcZdE83Q00Zvj7/xCptKSd9l4Um1uft9ee5nAALJbq/dJEOcm
	kUgQTb8V98R7ZNg9uBi3SpuVV2J1rOAGc3YBEgdcm8692Jno/8MnRu8bYiACIKyGR8Qajo
	rdcLCQVzCN8O2iY+i1cc6wa9OsXCVhnFpMgd6c/SL2kkGQJwKDCiOe/ln0siFQ==
Content-Type: multipart/mixed; boundary="===============8516500337471827063=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-reedsolo: upgrading to 2.0.13 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103801
Message-Id: <20230712053140.746A8C001DF@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:40 +0000 (UTC)

--===============8516500337471827063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-reedsolo* to *2.0.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-reedsolo-upgrade-1.7.0-2.0.13.patch
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
From 6e27622a16b0462bd3a7ec8bf45feaaad1d7751d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:23:09 -0500
Subject: [PATCH] python3-reedsolo: upgrade 1.7.0 -> 2.0.13

---
 .../{python3-reedsolo_1.7.0.bb => python3-reedsolo_2.0.13.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-reedsolo/{python3-reedsolo_1.7.0.bb => python3-reedsolo_2.0.13.bb} (75%)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
similarity index 75%
rename from meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
rename to meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
index b6c40921c..bb5b973d8 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tomerfiliba/reedsolomon"
 LICENSE = "MIT-0 | Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
-SRC_URI[sha256sum] = "c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732"
+SRC_URI[sha256sum] = "71b4121c6860a55899435c552051a19d5f023c50358be4b1c0fa0c6e2f4ac717"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============8516500337471827063==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-reedsolo-upgrade-1.7.0-2.0.13.patch"

From 6e27622a16b0462bd3a7ec8bf45feaaad1d7751d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:23:09 -0500
Subject: [PATCH] python3-reedsolo: upgrade 1.7.0 -> 2.0.13

---
 .../{python3-reedsolo_1.7.0.bb => python3-reedsolo_2.0.13.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-reedsolo/{python3-reedsolo_1.7.0.bb => python3-reedsolo_2.0.13.bb} (75%)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
similarity index 75%
rename from meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
rename to meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
index b6c40921c..bb5b973d8 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tomerfiliba/reedsolomon"
 LICENSE = "MIT-0 | Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
-SRC_URI[sha256sum] = "c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732"
+SRC_URI[sha256sum] = "71b4121c6860a55899435c552051a19d5f023c50358be4b1c0fa0c6e2f4ac717"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============8516500337471827063==--

