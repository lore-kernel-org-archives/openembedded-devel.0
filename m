Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB30C04FDF
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:29 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.2167.1691221161616424327
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=NnT2J8d1;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0960E0003
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221160;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=7nTMBdBLWQFySm6P0DJ1Izqqjz7/gJgsFJ8KvBlkwU4=;
	b=NnT2J8d1DeyOndFyjcOPypmpCX2tbewYUyJBPLPexqiP35pyuStlEWpmlSthYrrE/61GhQ
	XX3Q536N/YtvO6IEo6vRmlhuyWJGCFOndmImUYZqI3RXHxR2V4/PKMMuYxgLQJZ+/ev+dP
	8ZilLOHjxUhmWBau4fFgoQoMNrJTHyX36wu3QRE8uZIOIPdIORZHndY3XbRefX6bd7EvCb
	3t/fosG901PrZJ7dX6mk8KW8N+Ro8FybJmYS8MW4ScKPw0vdgbOJ9cjoXV4zO0TGJrp6kS
	EKjGNo0xY+8pj7NS5ivx+VR7VwRzMzoafqd1yxnzR+xxRaGaWAPTK7amWTyM0g==
Content-Type: multipart/mixed; boundary="===============4415446805089655037=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pyflakes: upgrading to 3.1.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104262
Message-Id: <20230805073929.BFB30C04FDF@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:29 +0000 (UTC)

--===============4415446805089655037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyflakes* to *3.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyflakes-upgrade-3.0.1-3.1.0.patch
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
From 329bd088162df202a188f97ab80119721d1a5752 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:05:31 -0500
Subject: [PATCH] python3-pyflakes: upgrade 3.0.1 -> 3.1.0

---
 .../{python3-pyflakes_3.0.1.bb => python3-pyflakes_3.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_3.0.1.bb => python3-pyflakes_3.1.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb b/meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb
index 2e3a3474a..11f11b776 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyCQA/pyflakes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "ec8b276a6b60bd80defed25add7e439881c19e64850afd9b346283d4165fd0fd"
+SRC_URI[sha256sum] = "a0aae034c444db0071aa077972ba4768d40c830d9539fd45bf4cd3f8f6992efc"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============4415446805089655037==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pyflakes-upgrade-3.0.1-3.1.0.patch"

From 329bd088162df202a188f97ab80119721d1a5752 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:05:31 -0500
Subject: [PATCH] python3-pyflakes: upgrade 3.0.1 -> 3.1.0

---
 .../{python3-pyflakes_3.0.1.bb => python3-pyflakes_3.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_3.0.1.bb => python3-pyflakes_3.1.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb b/meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb
index 2e3a3474a..11f11b776 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyCQA/pyflakes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "ec8b276a6b60bd80defed25add7e439881c19e64850afd9b346283d4165fd0fd"
+SRC_URI[sha256sum] = "a0aae034c444db0071aa077972ba4768d40c830d9539fd45bf4cd3f8f6992efc"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============4415446805089655037==--

