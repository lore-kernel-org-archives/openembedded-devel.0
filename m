Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4770C001DE
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.2176.1691221197688426232
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=PWazm92o;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.199, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12CFCFF804
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221196;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=D8G7j3QYlNzdp6rKB67Ttnqt0abJ6TXvLHgSm9z4Ps0=;
	b=PWazm92oi2mHhNwUH0H6qPyV3lgsqrEyuy5H0jJsM9zCcVlcgoiJjsgX1qzMgFTtRmeojQ
	RP3fXc9tr4ktVk2mCC903hyVvZqUo4F7lxoCcDiACDwRz/XoVKwFMALtTWrV/Rw75UgH9r
	NcN1bMM36amKRqbKFRUBvYpmv2YtMl/hT96Gz2wSDekp10N8ac5erQGrySgEylV5K85Tfx
	dMKx++E6XSldV9DSmqDozVzMTIjTyXaNu2SJE8Hj4hT2TneJ/mxpNj6cFU97VmL8EHTiMo
	G0ZhRdoarnHTyUp9sY0/Imb5VsbfLJ2u5w9BdIDjMws9svhPG5ma68oQj3mZWQ==
Content-Type: multipart/mixed; boundary="===============8267633249587818813=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-zeroconf: upgrading to 0.74.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104283
Message-Id: <20230805073959.A4770C001DE@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:59 +0000 (UTC)

--===============8267633249587818813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zeroconf* to *0.74.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zeroconf-upgrade-0.71.4-0.74.0.patch
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
From c830013b185a819ce978606311c11d24043ace07 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:38:11 -0500
Subject: [PATCH] python3-zeroconf: upgrade 0.71.4 -> 0.74.0

---
 .../{python3-zeroconf_0.71.4.bb => python3-zeroconf_0.74.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.71.4.bb => python3-zeroconf_0.74.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.74.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.74.0.bb
index ce92c6478..1b53884f0 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.74.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "b988425f6bd0d4f11f05fa258a6c49d9f9956777e9af00ca98c4ed3f743bd677"
+SRC_URI[sha256sum] = "6e27cf68665604f867b93f5db57bb4f0fedbc5289b7aa467f1dca1ca233305d3"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============8267633249587818813==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-zeroconf-upgrade-0.71.4-0.74.0.patch"

From c830013b185a819ce978606311c11d24043ace07 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:38:11 -0500
Subject: [PATCH] python3-zeroconf: upgrade 0.71.4 -> 0.74.0

---
 .../{python3-zeroconf_0.71.4.bb => python3-zeroconf_0.74.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.71.4.bb => python3-zeroconf_0.74.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.74.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.74.0.bb
index ce92c6478..1b53884f0 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.74.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "b988425f6bd0d4f11f05fa258a6c49d9f9956777e9af00ca98c4ed3f743bd677"
+SRC_URI[sha256sum] = "6e27cf68665604f867b93f5db57bb4f0fedbc5289b7aa467f1dca1ca233305d3"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============8267633249587818813==--

