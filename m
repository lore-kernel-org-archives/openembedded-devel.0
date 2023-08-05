Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A14C04E69
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.2179.1691221184563920625
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Qj6NXUK/;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6573240002
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221182;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=l/RG1qTp5zZRniS6OQDMRmpZvzFc7dFbGhxv3zSFRrU=;
	b=Qj6NXUK//z/iTULa1+ZiZyuWIpDt6hmI7/MyxHynbprdkHQKIkHQ+XwdwBgF3JvJD8EoeS
	j6gnyHx3PF8RrEQaZ1ar0snSrCTkZRQ1RISIaImIPbKXewxs6BdAs8lI5BFtzoQugVwjOV
	4AoG7AW46KJHwhI/pvNHpLh94RWNXmceMB6uYHAclJc1b57dxRKJeBoqEP93wG5p7nHEMh
	Tv2UrgyLiW0KybkZ4flCI6/l5/RTZKiwB65ETACOI12RC6VGxTjaOfH6uEtYbsvWgg9Ij/
	zenzqE48H1VAES9+xGuB8sN4G/UXWY0gDExgKqcIWi/wn7dJD4AkRG2WSX1Kkg==
Content-Type: multipart/mixed; boundary="===============4540247738720533842=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-trustme: upgrading to 1.1.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104275
Message-Id: <20230805073949.B6A14C04E69@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:49 +0000 (UTC)

--===============4540247738720533842==
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
From 5826b2be17c80cab196e880868d0df8def5d7e66 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 01:17:55 -0500
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


--===============4540247738720533842==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-trustme-upgrade-0.9.0-1.1.0.patch"

From 5826b2be17c80cab196e880868d0df8def5d7e66 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 01:17:55 -0500
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


--===============4540247738720533842==--

