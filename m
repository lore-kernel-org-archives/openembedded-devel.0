Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E9CC00528
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:29 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.2166.1691221163302320168
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=bFGMdmnK;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A818BC0003
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221161;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=UuEHfb6G+JVQN1rYgLJk/6HTGg2XxX9896VZ8DctSWY=;
	b=bFGMdmnK5i6Wgy7koylV9nuWclm2PWe77xnaIatfDk/8sxknnkZiyfcw3HdYKkXWCX20Qk
	MYML3vaM6xPBPUMh7l+GfO/pORSk7V3BYD1n3aIJpJMtAveUygvvY7/GlDYwhMFKzHes+H
	PQFzQc2+tZAhxyOMOIBJY9x0yBexCH/qRo8b6VNYKixGsj5JsBQkayg6ufeAiy19D/rHJL
	rhP3gtHOhIeMCuK1OBpHpFLweoVaaAHJmBcflCAP8lxiiexHn2jwkjUdJ4TNOj51haAFpp
	XGk2+qgch7cp9ZLPl8H+I8cb9nVtCMUCc/Y82LqYs90zEA8YIWj24pkcc59U0g==
Content-Type: multipart/mixed; boundary="===============3031402474886091273=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pyjwt: upgrading to 2.8.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104263
Message-Id: <20230805073929.B6E9CC00528@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:29 +0000 (UTC)

--===============3031402474886091273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyjwt* to *2.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyjwt-upgrade-2.7.0-2.8.0.patch
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
From 1dbbf2116cb472890a49e364873c1c1b27697e6a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:12:11 -0500
Subject: [PATCH] python3-pyjwt: upgrade 2.7.0 -> 2.8.0

---
 .../python/{python3-pyjwt_2.7.0.bb => python3-pyjwt_2.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.7.0.bb => python3-pyjwt_2.8.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 3aa9b479a..92a8f44c6 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "bd6ca4a3c4285c1a2d4349e5a035fdf8fb94e04ccd0fcbe6ba289dae9cc3e074"
+SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.25.1


--===============3031402474886091273==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pyjwt-upgrade-2.7.0-2.8.0.patch"

From 1dbbf2116cb472890a49e364873c1c1b27697e6a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:12:11 -0500
Subject: [PATCH] python3-pyjwt: upgrade 2.7.0 -> 2.8.0

---
 .../python/{python3-pyjwt_2.7.0.bb => python3-pyjwt_2.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.7.0.bb => python3-pyjwt_2.8.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 3aa9b479a..92a8f44c6 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "bd6ca4a3c4285c1a2d4349e5a035fdf8fb94e04ccd0fcbe6ba289dae9cc3e074"
+SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.25.1


--===============3031402474886091273==--

