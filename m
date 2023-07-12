Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851B8C001DF
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:32:00 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.998.1689139912823559813
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=BjfvKQZ+;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E151E0003
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139911;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=LvkztEkwcEPd6c8zmigIJOae4sG1gYr+zVnvHyYW1ys=;
	b=BjfvKQZ+niWtzR2xqzPk0qH8gCSyXPPuV9Xna8BT5KPRasvq59Vt4etPbYeHuQrrFFf4qO
	3rcuu0QxaEnze8klLqw52qLYkF/tDR1f80U2FROq5wDYAPDbedFHOeUpYwMDSbHmDmHbyf
	UBbY6IlQgffq7IkfqwPWbQN3pXh1wr//3smiN/Yxijdl+0DKRayAlWYfGo5kkhdeToWAcD
	cwaDgsBYQbum8qbXTMmL9gg7mvZLgolnru5GfGJ/6fb7ELRclgdTJTehIsRpstJLcjsxek
	FjA2fVDe8O7MM2qjh+mgbeqPFji4/wBp9euu4YK0SyEmIRap+rtDyDuM8WUMRg==
Content-Type: multipart/mixed; boundary="===============5660795991044010105=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-tornado: upgrading to 6.3.2 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103811
Message-Id: <20230712053200.851B8C001DF@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:32:00 +0000 (UTC)

--===============5660795991044010105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-tornado* to *6.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-tornado-upgrade-6.3-6.3.2.patch
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
From 5eae863b6f8ee968f85c7ceb09d554793933a844 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:08:15 -0500
Subject: [PATCH] python3-tornado: upgrade 6.3 -> 6.3.2

---
 .../python/{python3-tornado_6.3.bb => python3-tornado_6.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.3.bb => python3-tornado_6.3.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
index af5009b6a..c0bebf083 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d68f3192936ff2c4add04dc21a436a43b4408d466746b78bb2b9d0a53a18683f"
+SRC_URI[sha256sum] = "4b927c4f19b71e627b13f3db2324e4ae660527143f9e1f2e2fb404f3a187e2ba"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============5660795991044010105==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-tornado-upgrade-6.3-6.3.2.patch"

From 5eae863b6f8ee968f85c7ceb09d554793933a844 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:08:15 -0500
Subject: [PATCH] python3-tornado: upgrade 6.3 -> 6.3.2

---
 .../python/{python3-tornado_6.3.bb => python3-tornado_6.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.3.bb => python3-tornado_6.3.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
index af5009b6a..c0bebf083 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d68f3192936ff2c4add04dc21a436a43b4408d466746b78bb2b9d0a53a18683f"
+SRC_URI[sha256sum] = "4b927c4f19b71e627b13f3db2324e4ae660527143f9e1f2e2fb404f3a187e2ba"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============5660795991044010105==--

