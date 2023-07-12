Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0ACC001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:29:50 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.927.1689139788285869963
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=fMdok1U3;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 066111BF204
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139786;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=yvCdtruFKbiF6vbR6nV10yfGimsGPPJ4LbWo/x5Tjr8=;
	b=fMdok1U3B86KkqcnhvFZZJaeH+pA2DzQYJIZkSF9I776FCNPNI/r58oAQXhDjyLqsAQigq
	2SY5oMgN8+NO7n8xBBPSmofZZOUGVcXvt/aCAJQJXhDvki1ZwT+6ZRYpMBHdbxMj8ic+KB
	HElMMH6ntuMbVLMB8UEfEcOvOJ/72tvSjD8Mi6OuqfxgK92z5z5LwE3zR26cFr25suH/IA
	7+4/3dpwISewP1nmRar0nIB+ZQyAstvAZ2b7ZXPcab4nYwMuJ2ZxQWPOt+umy1tBv90y9E
	lJW/8IRv9OH09t/4oHEnMov7saV52Fb06ZW+SrEXj9JPJnLMRq21jEyT/EKsQA==
Content-Type: multipart/mixed; boundary="===============7334394850377649939=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-autobahn: upgrading to 23.6.2 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103744
Message-Id: <20230712052950.6E0ACC001B0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:29:50 +0000 (UTC)

--===============7334394850377649939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-autobahn* to *23.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-autobahn-upgrade-23.6.1-23.6.2.patch
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
From 6d28a9bb2293353b61cddb8e21e7e13923799583 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:54:17 -0500
Subject: [PATCH] python3-autobahn: upgrade 23.6.1 -> 23.6.2

---
 .../{python3-autobahn_23.6.1.bb => python3-autobahn_23.6.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_23.6.1.bb => python3-autobahn_23.6.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
index dc11b85da..54c8f23fc 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e2c2c2cc2915edc5321b0e6b1d3f5f8"
 
-SRC_URI[sha256sum] = "ce6e540402e3524ca46c55a1bc46255225969b5837ca792ea5415d21ac571034"
+SRC_URI[sha256sum] = "ec9421c52a2103364d1ef0468036e6019ee84f71721e86b36fe19ad6966c1181"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============7334394850377649939==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-autobahn-upgrade-23.6.1-23.6.2.patch"

From 6d28a9bb2293353b61cddb8e21e7e13923799583 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:54:17 -0500
Subject: [PATCH] python3-autobahn: upgrade 23.6.1 -> 23.6.2

---
 .../{python3-autobahn_23.6.1.bb => python3-autobahn_23.6.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_23.6.1.bb => python3-autobahn_23.6.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
index dc11b85da..54c8f23fc 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e2c2c2cc2915edc5321b0e6b1d3f5f8"
 
-SRC_URI[sha256sum] = "ce6e540402e3524ca46c55a1bc46255225969b5837ca792ea5415d21ac571034"
+SRC_URI[sha256sum] = "ec9421c52a2103364d1ef0468036e6019ee84f71721e86b36fe19ad6966c1181"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============7334394850377649939==--

