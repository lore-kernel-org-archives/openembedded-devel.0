Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A8FEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:32:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.1057.1689139925839823395
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=EgRzAXrS;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39EBBC0004
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139924;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=6ruxffs5h9ppVNvdmSfDDJEElkIt54fU8pjnMk9/Kfo=;
	b=EgRzAXrS4kFJsX1EL1GFDUoVjIyUMSIZSsFP7ScB/baDVOCQqy8/8cQ/owsH79T1rL3Qd8
	N4SsMJnCwpfh2g40mPQAtSULbqgEIhDuSd1R0IbQ3ZxeX2U4jjnmpHr4ccQqy7eryCXyfL
	O/DCqZKMBTwPeEufHyuD+GwyceL8xn7pXTZCM0MpSnLjYkhU+XSLwhURBs84+9TogYPiIV
	tYS+CNaBMKrncutOqRdKBoKJ0x6tbVT5XL0yUMT6wYAILFtbnO6KtHGoJSUb5fjTr0Wkr3
	sWldtT1f4/b5FLnbaljJhzCQoS3f84l2EZau29A9ynlNYzeUx4d9ufeuG3qOOA==
Content-Type: multipart/mixed; boundary="===============5450554696973840668=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-zeroconf: upgrading to 0.71.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103819
Message-Id: <20230712053210.68A8FEB64D9@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:32:10 +0000 (UTC)

--===============5450554696973840668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zeroconf* to *0.71.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zeroconf-upgrade-0.70.0-0.71.0.patch
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
From 159bdc65fa72a0c8a9ea44b1e5100be7eb1f86e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Wed, 12 Jul 2023 00:29:30 -0500
Subject: [PATCH] python3-zeroconf: upgrade 0.70.0 -> 0.71.0

---
 .../{python3-zeroconf_0.70.0.bb => python3-zeroconf_0.71.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.70.0.bb => python3-zeroconf_0.71.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.70.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.71.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.70.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.71.0.bb
index 63be3fe12..78bdfc6f0 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.71.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "f95ef3643612b1a874cc3b4216d9cb895a0337bf602901f760c3c6027a38d64a"
+SRC_URI[sha256sum] = "c3040b3ad60f77fd29ca90b013c99aa7a0266eab9e4953106fc6f5fc8ba5641a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============5450554696973840668==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-zeroconf-upgrade-0.70.0-0.71.0.patch"

From 159bdc65fa72a0c8a9ea44b1e5100be7eb1f86e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Wed, 12 Jul 2023 00:29:30 -0500
Subject: [PATCH] python3-zeroconf: upgrade 0.70.0 -> 0.71.0

---
 .../{python3-zeroconf_0.70.0.bb => python3-zeroconf_0.71.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.70.0.bb => python3-zeroconf_0.71.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.70.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.71.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.70.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.71.0.bb
index 63be3fe12..78bdfc6f0 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.71.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "f95ef3643612b1a874cc3b4216d9cb895a0337bf602901f760c3c6027a38d64a"
+SRC_URI[sha256sum] = "c3040b3ad60f77fd29ca90b013c99aa7a0266eab9e4953106fc6f5fc8ba5641a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============5450554696973840668==--

