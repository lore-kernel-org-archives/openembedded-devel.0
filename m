Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D200EB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:32:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.1045.1689139916071951475
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=MoEOoSie;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.193, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73A73240006
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139914;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=U0YcRCEUBVfzGFKCkGYQBF3Rad9iN4f0dee/6J1YFgg=;
	b=MoEOoSieDHTzg02RWdthY6GMCs5JVAJ4/xB76dmMro3eddKUWcr0/8v43lug0RIm3GCYbz
	MRVArtuEyO4p5/FfpIqtG3crcoemyzxNinasgq9Kb97tvbelxeGhBvdelM3JMeWcbJrWqQ
	+uvv3309G97/qrHpvP/YTiu/Rzdo7lpLSNs8nUoASbNO6gY0QUQeiZ+2z5aUTLroS2DbsV
	GesJY4r02WVNtTb9OlajKBki+r3G8oBumjbEBxRkQuf4sTCAoK17xn7CTTEu806xs+rbwE
	il95OGUek4u0hcNbtILBcQ2O5QhhCMEefHH3hXPDd75SzhetZ33a7ZVXGw/N6g==
Content-Type: multipart/mixed; boundary="===============1294381613591543701=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-trustme: upgrading to 1.1.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103813
Message-Id: <20230712053200.7D200EB64DD@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:32:00 +0000 (UTC)

--===============1294381613591543701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trustme* to *1.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trustme-upgrade-0.9.0-1.1.0.patch
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
From 474a50cde1e415490d33fa96e646cea99d6ef5cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:22:09 -0500
Subject: [PATCH] python3-trustme: upgrade 0.9.0 -> 1.1.0

---
 .../{python3-trustme_0.9.0.bb => python3-trustme_1.1.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-trustme_0.9.0.bb => python3-trustme_1.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
index 6f31aea0e..c451a67ec 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
@@ -5,8 +5,7 @@ AUTHOR = "Nathaniel J. Smith"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5a7af1a4b73e57431e25d15a2da745a"
 
-SRC_URI[md5sum] = "0e4d698e5aecaf8306cf440bf3dcbbe0"
-SRC_URI[sha256sum] = "5e07b23d70ceed64f3bb36ae4b9abc52354c16c98d45ab037bee2b5fbffe586c"
+SRC_URI[sha256sum] = "5375ad7fb427074bec956592e0d4ee2a4cf4da68934e1ba4bcf4217126bc45e6"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


--===============1294381613591543701==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-trustme-upgrade-0.9.0-1.1.0.patch"

From 474a50cde1e415490d33fa96e646cea99d6ef5cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:22:09 -0500
Subject: [PATCH] python3-trustme: upgrade 0.9.0 -> 1.1.0

---
 .../{python3-trustme_0.9.0.bb => python3-trustme_1.1.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-trustme_0.9.0.bb => python3-trustme_1.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
index 6f31aea0e..c451a67ec 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
@@ -5,8 +5,7 @@ AUTHOR = "Nathaniel J. Smith"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5a7af1a4b73e57431e25d15a2da745a"
 
-SRC_URI[md5sum] = "0e4d698e5aecaf8306cf440bf3dcbbe0"
-SRC_URI[sha256sum] = "5e07b23d70ceed64f3bb36ae4b9abc52354c16c98d45ab037bee2b5fbffe586c"
+SRC_URI[sha256sum] = "5375ad7fb427074bec956592e0d4ee2a4cf4da68934e1ba4bcf4217126bc45e6"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


--===============1294381613591543701==--

