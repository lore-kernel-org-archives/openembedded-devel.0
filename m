Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E21C04E69
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.2175.1691221173800324939
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=SGCdzTSR;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.199, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28EA7FF807
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221172;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=I0bLtcjHBHFy5LykEKhz3PtTPtXmYniO/uoIsJViJkM=;
	b=SGCdzTSRyuvPERZniHLbZpatejwmGC3o12rMw7t2fFOoeUlUd7HNjLrZlyU2ab2PPvQoLr
	neA7J1QtvfJzLf+VEhjlgG+AllmezKF1/teMDP3mll2SoUd8O2+HsjMHUKOD1fFZISh/cV
	1DActSovdT8CySqDMuqbFQn54Slem1fkbgF8q1q/Vs/1WV5HVo2dc2c+PsB9tZwyfw1Lvj
	an1gSfhcMEq8YLbyVr2B7wC9yKqxlRwNplCwdSfhBt0NS0iVx01N6F5ZRzOZ90S+sSYncU
	pjaG7UO9adt4TuNLqv1I6+RDAamFbnERm/BlwQowF9cfNai+uYvjDgU5j5HhGw==
Content-Type: multipart/mixed; boundary="===============4212971734489957693=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-reedsolo: upgrading to 2.0.13 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104269
Message-Id: <20230805073939.B1E21C04E69@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:39 +0000 (UTC)

--===============4212971734489957693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-reedsolo* to *2.0.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-reedsolo-upgrade-1.7.0-2.0.13.patch
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
From cb9547bbb513952eac4478f4c19c5c37d6e721c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:43:21 -0500
Subject: [PATCH] python3-reedsolo: upgrade 1.7.0 -> 2.0.13

---
 .../{python3-reedsolo_1.7.0.bb => python3-reedsolo_2.0.13.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-reedsolo/{python3-reedsolo_1.7.0.bb => python3-reedsolo_2.0.13.bb} (75%)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
similarity index 75%
rename from meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
rename to meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
index b6c40921c..bb5b973d8 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tomerfiliba/reedsolomon"
 LICENSE = "MIT-0 | Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
-SRC_URI[sha256sum] = "c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732"
+SRC_URI[sha256sum] = "71b4121c6860a55899435c552051a19d5f023c50358be4b1c0fa0c6e2f4ac717"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============4212971734489957693==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-reedsolo-upgrade-1.7.0-2.0.13.patch"

From cb9547bbb513952eac4478f4c19c5c37d6e721c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:43:21 -0500
Subject: [PATCH] python3-reedsolo: upgrade 1.7.0 -> 2.0.13

---
 .../{python3-reedsolo_1.7.0.bb => python3-reedsolo_2.0.13.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-reedsolo/{python3-reedsolo_1.7.0.bb => python3-reedsolo_2.0.13.bb} (75%)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
similarity index 75%
rename from meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
rename to meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
index b6c40921c..bb5b973d8 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tomerfiliba/reedsolomon"
 LICENSE = "MIT-0 | Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
-SRC_URI[sha256sum] = "c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732"
+SRC_URI[sha256sum] = "71b4121c6860a55899435c552051a19d5f023c50358be4b1c0fa0c6e2f4ac717"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============4212971734489957693==--

