Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C00EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.954.1689139794164280076
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=SfaVjyFY;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.193, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE22C240004
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139792;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=5pVskPjLkerqJT51mAauO5QYLwU3FjDh1dSyT0EJfPk=;
	b=SfaVjyFYgRjobNzV6sMaRuflwCn1XHKTcj3QBscZVS+g7c1WTPDmocF2jCgQi1iaczbprd
	U3aGSH4eu6XGT2O/64y1HGk26rhuEzafR92GsdFB/fwDqqMKWME83+OZRVvOXv4dPFZFUq
	cG/y755upcVKTfyy4K9c9o/kfTCkSL0CXTk3fTb70Om6R0q1P1CRjn4Wvqq9RDxKGfuW4r
	1vIhejZYSOL47UQynSqzhHjeQdbjGrKiq/Iaq/EtOsA/R06B8FY9xLRRwGAY0XFDQl1Gmw
	l5TjWwNp/6qfuw5zAgfBEeF20cSt96HOYYpWm9ZW4wX7kiKg0/SKS/OWNXwFug==
Content-Type: multipart/mixed; boundary="===============5801931644224306731=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-bandit: upgrading to 1.7.5 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103746
Message-Id: <20230712053000.64C00EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:00 +0000 (UTC)

--===============5801931644224306731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-bandit* to *1.7.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-bandit-upgrade-1.7.4-1.7.5.patch
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
From 402fc96d7b589d9e22aca46789f0320134cf223b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:05:58 -0500
Subject: [PATCH] python3-bandit: upgrade 1.7.4 -> 1.7.5

---
 .../python/{python3-bandit_1.7.4.bb => python3-bandit_1.7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.4.bb => python3-bandit_1.7.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
index cfdbde968..5e2a7e8bc 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "2d63a8c573417bae338962d4b9b06fbc6080f74ecd955a092849e1e65c717bd2"
+SRC_URI[sha256sum] = "bdfc739baa03b880c2d15d0431b31c658ffc348e907fe197e54e0389dd59e11e"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.25.1


--===============5801931644224306731==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-bandit-upgrade-1.7.4-1.7.5.patch"

From 402fc96d7b589d9e22aca46789f0320134cf223b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:05:58 -0500
Subject: [PATCH] python3-bandit: upgrade 1.7.4 -> 1.7.5

---
 .../python/{python3-bandit_1.7.4.bb => python3-bandit_1.7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.4.bb => python3-bandit_1.7.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
index cfdbde968..5e2a7e8bc 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "2d63a8c573417bae338962d4b9b06fbc6080f74ecd955a092849e1e65c717bd2"
+SRC_URI[sha256sum] = "bdfc739baa03b880c2d15d0431b31c658ffc348e907fe197e54e0389dd59e11e"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.25.1


--===============5801931644224306731==--

