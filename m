Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1562EB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:38:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2141.1691221098736560450
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=PxSvVDEj;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F4BC1C0005
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221096;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=MAF+L9ABMMvQONl6KLd8axqGziPCV/Yg2yU0w6x/Yzk=;
	b=PxSvVDEjIjJAbbuduDzxpLyLDpgs9D+jmuNGmvpANaXvvP8G8v3c3IAvQCqn/mnKqxZZaK
	MMxSW4gsLg9dov4UgiT0vqxvxxv6t8V6vcjUBqwdmzsSPijXsm4ILEaGrcgpsYR9n7WMRf
	stwyQtmhnLe04NNDOH+1dFzIZ3Eao8Oq7zmhKVJi4ZtYv9O8T95tTuMk8ssVEXqHx42uxW
	Gan7DwRWp+hsE4ziDy1VflelSKsRxoPxkfAGU6a9w5XymRSgFDTLAu8040CmA2yu49YBBu
	3xHHpSuUkYTfgxNqWxdcEDugVr9RoT4sf8b/1oRlyFQBMUe/rLgsGoHGKK/O/A==
Content-Type: multipart/mixed; boundary="===============2359585604297671186=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-alembic: upgrading to 1.11.2 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104235
Message-Id: <20230805073829.B1562EB64DD@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:38:29 +0000 (UTC)

--===============2359585604297671186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-alembic* to *1.11.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-alembic-upgrade-1.11.1-1.11.2.patch
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
From 29edbe45640096081b9b50755d33107dc9237953 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 21:20:43 -0500
Subject: [PATCH] python3-alembic: upgrade 1.11.1 -> 1.11.2

---
 .../{python3-alembic_1.11.1.bb => python3-alembic_1.11.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.11.1.bb => python3-alembic_1.11.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb
index feb2c419b..6577e7f81 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6a810a6b012c88b33458fceb869aef09ac75d6ace5291915ba7fae44de372c01"
+SRC_URI[sha256sum] = "678f662130dc540dac12de0ea73de9f89caea9dbea138f60ef6263149bf84657"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.25.1


--===============2359585604297671186==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-alembic-upgrade-1.11.1-1.11.2.patch"

From 29edbe45640096081b9b50755d33107dc9237953 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 21:20:43 -0500
Subject: [PATCH] python3-alembic: upgrade 1.11.1 -> 1.11.2

---
 .../{python3-alembic_1.11.1.bb => python3-alembic_1.11.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.11.1.bb => python3-alembic_1.11.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb
index feb2c419b..6577e7f81 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6a810a6b012c88b33458fceb869aef09ac75d6ace5291915ba7fae44de372c01"
+SRC_URI[sha256sum] = "678f662130dc540dac12de0ea73de9f89caea9dbea138f60ef6263149bf84657"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.25.1


--===============2359585604297671186==--

