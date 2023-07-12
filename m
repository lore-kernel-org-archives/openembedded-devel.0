Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B18EC001DC
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:32:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.1000.1689139914449574906
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=C8BiJlWw;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.199, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFE97FF802
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139913;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=4zTGRTjJKWX1R2aK08njVYVP66jPxVjPfJBgplM3u0A=;
	b=C8BiJlWwWyd/nvYEuOAi2YEJtyAUolEhpuvG4whz03f16KFRP/6rh/F+TRt2Cu6+gDAbIi
	XJBOH1GmN4Xzp9ajdltoh4eodthG6QuDOoPMe2miXhdUWgqhsJXfTeoLLrBwKHr2c7KXd0
	63xgHXQNVwiSWaQvnxEIW0mtgwecBSwmL1qChm4aq2m/jJw9aMZiezdrz5W9SvE5RAzeNm
	OaKlCi5B1ESBvlkpdiGFK5Sl9zaqCfsLUIHwNHLOvfxmME19ZUKHif8DsSiU6i1gPNzdbC
	I0JpAC0XZdYHrUxM725VTQhlw1Dcr1B2VExM2KC7ABM93Z5CLhUmpj/JrC+HLQ==
Content-Type: multipart/mixed; boundary="===============6667142531038636347=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-tox: upgrading to 4.6.4 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103812
Message-Id: <20230712053200.7B18EC001DC@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:32:00 +0000 (UTC)

--===============6667142531038636347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-tox* to *4.6.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-tox-upgrade-4.6.3-4.6.4.patch
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
From 555adea530747f842b1585dc7e89c66a0b60df32 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:15:10 -0500
Subject: [PATCH] python3-tox: upgrade 4.6.3 -> 4.6.4

---
 .../python/{python3-tox_4.6.3.bb => python3-tox_4.6.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.6.3.bb => python3-tox_4.6.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.6.3.bb b/meta-python/recipes-devtools/python/python3-tox_4.6.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.6.3.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.6.4.bb
index ed8fc38b2..a8215a91b 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.6.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "9e2c5091a117d03b583c57c4c40aecd068099c17d40520e7b165e85c19334534"
+SRC_URI[sha256sum] = "5e2ad8845764706170d3dcaac171704513cc8a725655219acb62fe4380bdadda"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.25.1


--===============6667142531038636347==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-tox-upgrade-4.6.3-4.6.4.patch"

From 555adea530747f842b1585dc7e89c66a0b60df32 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:15:10 -0500
Subject: [PATCH] python3-tox: upgrade 4.6.3 -> 4.6.4

---
 .../python/{python3-tox_4.6.3.bb => python3-tox_4.6.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.6.3.bb => python3-tox_4.6.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.6.3.bb b/meta-python/recipes-devtools/python/python3-tox_4.6.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.6.3.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.6.4.bb
index ed8fc38b2..a8215a91b 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.6.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "9e2c5091a117d03b583c57c4c40aecd068099c17d40520e7b165e85c19334534"
+SRC_URI[sha256sum] = "5e2ad8845764706170d3dcaac171704513cc8a725655219acb62fe4380bdadda"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.25.1


--===============6667142531038636347==--

