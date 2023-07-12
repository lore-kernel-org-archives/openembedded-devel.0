Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6925EEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:50 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.1040.1689139909522904694
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=eI2o0Pdo;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD73040004
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139908;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=u/XzHP6Vb8LLlIBB2q5zsrBBJgS1ESqomaNMSYKmHNk=;
	b=eI2o0PdofiBfJ8TmfQFEx+TpsMofNpiVK8qAbaVteoTTZBlmNOQ3Cy5g0hQXWNR/atO6f0
	tSEicPpK/oDgIzKpBvIdlZYt7ZXcxVHDGyFORVq9M4efVl7XyUmGY7mr7VzFNbkRibvqrW
	EldGywa2nQZt34JpSteq8rBRhRSGt4Co8npkZ/yoIugM6HluM1DqDwxlWoRFBFx/jCUI4M
	RsaWCowlCmbXWW14di3sKjpzUu5pJh5CMtn70uBrcjWSvDLquegc7TkFBXKUfQtBsGeNe9
	9lqivT9FYpQkBn38qmw+50NXjx5mcUS2PT4Q4w/kpZwTLifV0wyGu1GYtYVIsA==
Content-Type: multipart/mixed; boundary="===============5104220927099213867=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-sqlalchemy: upgrading to 2.0.18 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103809
Message-Id: <20230712053150.6925EEB64D9@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:50 +0000 (UTC)

--===============5104220927099213867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sqlalchemy* to *2.0.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sqlalchemy-upgrade-2.0.15-2.0.18.patch
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
From 6e2a69a8645818b127c46156cc673088a682d370 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:58:37 -0500
Subject: [PATCH] python3-sqlalchemy: upgrade 2.0.15 -> 2.0.18

---
 ...ython3-sqlalchemy_2.0.15.bb => python3-sqlalchemy_2.0.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.15.bb => python3-sqlalchemy_2.0.18.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.18.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.18.bb
index e6f0d6429..770d558d2 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.18.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "2e940a8659ef870ae10e0d9e2a6d5aaddf0ff6e91f7d0d7732afc9e8c4be9bbc"
+SRC_URI[sha256sum] = "1fb792051db66e09c200e7bc3bda3b1eb18a5b8eb153d2cedb2b14b56a68b8cb"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


--===============5104220927099213867==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-sqlalchemy-upgrade-2.0.15-2.0.18.patch"

From 6e2a69a8645818b127c46156cc673088a682d370 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:58:37 -0500
Subject: [PATCH] python3-sqlalchemy: upgrade 2.0.15 -> 2.0.18

---
 ...ython3-sqlalchemy_2.0.15.bb => python3-sqlalchemy_2.0.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.15.bb => python3-sqlalchemy_2.0.18.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.18.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.18.bb
index e6f0d6429..770d558d2 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.18.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "2e940a8659ef870ae10e0d9e2a6d5aaddf0ff6e91f7d0d7732afc9e8c4be9bbc"
+SRC_URI[sha256sum] = "1fb792051db66e09c200e7bc3bda3b1eb18a5b8eb153d2cedb2b14b56a68b8cb"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


--===============5104220927099213867==--

