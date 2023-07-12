Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650D4EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.951.1689139839710952565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=nE0dR3d1;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.193, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A815240006
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139838;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=0bz6C8OGfGBg0RD5CFsVO6r7zRL6LLi5JaG34acwD/w=;
	b=nE0dR3d1B2y01FQ5S70dU4CXYepgJlUpSmehL1y78UCzAsaJkDys2ZG25/vH2om6ynyfox
	H7lNqdAnQ1haiePQsM7ZoEGZ3Qz37S7lbHSfXZ3jGasIv9Q/0BTTmZ0NtfmEcAXb7Z6JBO
	msj2//to295Ckg+nfpzrxhEco1P8r8L78oLWXKsy/swp7s/fIhOm+2BJoUhhe953mkbpzY
	V33K7Jq/d+Si2uuhadg1ROCArDh/7ohR/v3KL+y5GIjv4zy5H6kaRq6NKDop3bHXa1CZZS
	LyU5V/oJwefsu7MphmXbGfWhXcOY7AE8tGQLjpTuAPENkhw2Fvmso+6/rb3eCA==
Content-Type: multipart/mixed; boundary="===============7287006325656801885=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-google-auth: upgrading to 2.22.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103768
Message-Id: <20230712053040.650D4EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:40 +0000 (UTC)

--===============7287006325656801885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-google-auth* to *2.22.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-google-auth-upgrade-2.21.0-2.22.0.patch
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
From 27dbf103074e8b4def9958a1062dbefc4fe47ad6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 19:05:54 -0500
Subject: [PATCH] python3-google-auth: upgrade 2.21.0 -> 2.22.0

---
 ...hon3-google-auth_2.21.0.bb => python3-google-auth_2.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.21.0.bb => python3-google-auth_2.22.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
index ab32ec479..ff3f422f3 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b28e8048e57727e7cf0e5bd8e7276b212aef476654a09511354aa82753b45c66"
+SRC_URI[sha256sum] = "164cba9af4e6e4e40c3a4f90a1a6c12ee56f14c0b4868d1ca91b32826ab334ce"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


--===============7287006325656801885==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-google-auth-upgrade-2.21.0-2.22.0.patch"

From 27dbf103074e8b4def9958a1062dbefc4fe47ad6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 19:05:54 -0500
Subject: [PATCH] python3-google-auth: upgrade 2.21.0 -> 2.22.0

---
 ...hon3-google-auth_2.21.0.bb => python3-google-auth_2.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.21.0.bb => python3-google-auth_2.22.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
index ab32ec479..ff3f422f3 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b28e8048e57727e7cf0e5bd8e7276b212aef476654a09511354aa82753b45c66"
+SRC_URI[sha256sum] = "164cba9af4e6e4e40c3a4f90a1a6c12ee56f14c0b4868d1ca91b32826ab334ce"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


--===============7287006325656801885==--

