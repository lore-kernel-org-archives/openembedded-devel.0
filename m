Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A662C3DA40
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.942.1689139825637170476
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=hsofH3rD;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.195, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0915560007
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139824;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=KjwEh7vDt9/l4AX20JpfP6L8l8FKj5BafpO/mhRobv4=;
	b=hsofH3rDSVHsLb/ZRL5Xw9ydNKitkIOEejQbWpMzeVg3fUbyvkIvIOmW1hnXb+nd8WcGWX
	20AG8MhA0sNh7Zv4OCXnXRiGuzboKojDj7QvlAv10bnah2HYtaZU3LqqfxAuAwdjjfvUvq
	IaWMNeuPj8IWhSsB3dK1J++ofDox2MNmdLhS3K31jg3rGNRdLE7luq5s5n0CHeSJy986RH
	OC9fH7vSb4ymFoX9rg4yPvCainwVoa0inx7ReX1euxaw0ckJWr2FIKt946ZcbEDxHs9gzl
	+vtn8x0BhAnvlVmfiUJWqJp5YrFG/alS1Z7aIdCTPFYsH+NKth97zuWSq5q8NA==
Content-Type: multipart/mixed; boundary="===============7743635875847393278=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-eth-utils: upgrading to 2.2.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103760
Message-Id: <20230712053030.6A662C3DA40@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:30 +0000 (UTC)

--===============7743635875847393278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-eth-utils* to *2.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-eth-utils-upgrade-2.1.1-2.2.0.patch
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
From df73a56beece97ab3c5cb164a10f931ba63aa71c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:11:43 -0500
Subject: [PATCH] python3-eth-utils: upgrade 2.1.1 -> 2.2.0

---
 .../{python3-eth-utils_2.1.1.bb => python3-eth-utils_2.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_2.1.1.bb => python3-eth-utils_2.2.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_2.1.1.bb b/meta-python/recipes-devtools/python/python3-eth-utils_2.2.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-eth-utils_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_2.2.0.bb
index 896800a42..ce2dcb0d4 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_2.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "7cccfb0b0749431d0d001e327e9a7289bf07308316a73850ae3895020e5682f4"
+SRC_URI[sha256sum] = "7f1a9e10400ee332432a778c321f446abaedb8f538df550e7c9964f446f7e265"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============7743635875847393278==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-eth-utils-upgrade-2.1.1-2.2.0.patch"

From df73a56beece97ab3c5cb164a10f931ba63aa71c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:11:43 -0500
Subject: [PATCH] python3-eth-utils: upgrade 2.1.1 -> 2.2.0

---
 .../{python3-eth-utils_2.1.1.bb => python3-eth-utils_2.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_2.1.1.bb => python3-eth-utils_2.2.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_2.1.1.bb b/meta-python/recipes-devtools/python/python3-eth-utils_2.2.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-eth-utils_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_2.2.0.bb
index 896800a42..ce2dcb0d4 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_2.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "7cccfb0b0749431d0d001e327e9a7289bf07308316a73850ae3895020e5682f4"
+SRC_URI[sha256sum] = "7f1a9e10400ee332432a778c321f446abaedb8f538df550e7c9964f446f7e265"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============7743635875847393278==--

