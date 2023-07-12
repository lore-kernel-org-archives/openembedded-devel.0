Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CD7EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:29:50 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.951.1689139783121991314
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=eJDjtqtA;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4950740007
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139780;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=v++QGqAfbteHsA0gdhQDTwmgQed0Izorl50XV4cI9oo=;
	b=eJDjtqtAmDGtQiSHkT9rdtHxz4ImEmCquF9al4ODhP3OmCwDNOEvFxMTEXbNxCk68uRNhP
	Qy3CTWVCoDg5mpThnsEIHtDs4WpXSVgX7OCsdNW/yXnrfZ8shwm2owDDbNoZxoJWhr26QV
	U5wlImv922UPtsoyCrddGZYfIdFoix1fkxhJp19ZfocknYxuRxz+DkllEZz7plQ7rcbZwG
	j7qnAgXie4mtUPG3eElowRb5dj6TCCMilL+8IvRRAn23nlmrY6cbsmNoE5iEQxfjNqEe4k
	Ttav9M5G0vwazwS1Yhvx1+sH3uR+QQ/tzLzFHAIurE8B24LiVK8dA+whU+RUPA==
Content-Type: multipart/mixed; boundary="===============6697398631996021087=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-astroid: upgrading to 2.15.6 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103742
Message-Id: <20230712052950.63CD7EB64D9@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:29:50 +0000 (UTC)

--===============6697398631996021087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-astroid* to *2.15.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-astroid-upgrade-2.15.5-2.15.6.patch
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
From ea652dbf24be28e7b804a9daf5c53f9b1cc10ee8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:41:42 -0500
Subject: [PATCH] python3-astroid: upgrade 2.15.5 -> 2.15.6

---
 .../{python3-astroid_2.15.5.bb => python3-astroid_2.15.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.15.5.bb => python3-astroid_2.15.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
index 7c859107c..7325eb13f 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1039262575027b441137ab4a62a793a9b43defb42c32d5670f38686207cd780f"
+SRC_URI[sha256sum] = "903f024859b7c7687d7a7f3a3f73b17301f8e42dfd9cc9df9d4418172d3e2dbd"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


--===============6697398631996021087==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-astroid-upgrade-2.15.5-2.15.6.patch"

From ea652dbf24be28e7b804a9daf5c53f9b1cc10ee8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:41:42 -0500
Subject: [PATCH] python3-astroid: upgrade 2.15.5 -> 2.15.6

---
 .../{python3-astroid_2.15.5.bb => python3-astroid_2.15.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.15.5.bb => python3-astroid_2.15.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
index 7c859107c..7325eb13f 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1039262575027b441137ab4a62a793a9b43defb42c32d5670f38686207cd780f"
+SRC_URI[sha256sum] = "903f024859b7c7687d7a7f3a3f73b17301f8e42dfd9cc9df9d4418172d3e2dbd"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


--===============6697398631996021087==--

