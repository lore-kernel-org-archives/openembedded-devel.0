Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28ACC41513
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:19 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.2163.1691221158019014041
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=RUG4GEa3;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67BE41BF204
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221156;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=HbE3T1WFLgWOSXtvTPG7DvT7r84IVDSezYrI+T8hQ8g=;
	b=RUG4GEa3jiUvxAKUHYcSewCjnej5i8LFMyEm61XSu4bbPwR0Am132GIhxpdGjxUSwb9dO5
	rPeAWRmKrPd8p6NiW6qn+/VURI6DvhLj0gpm8uOIYpkTuPDNpF/S4/jjzOtlYkXS8KIDOI
	S1dCD2bslbtMvE0pnpO0bigl9zLhlKzLixn0YaG1u4f7e5O+k4sKR0lQ0Ba4dUserxxa1Z
	yRfeJgxn9Rh1HnR4c5vTrSYqj8nXrqzSlA7thIRwXgmgNA8vq84+L0hobe2/GDhdtqnoEJ
	hiMhlHzIXbhTL5k6e9ZT662ykbHUOsu1guksGCXXaDOeRqHenOK7AmlTLdjNTw==
Content-Type: multipart/mixed; boundary="===============0848981425647486514=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pycodestyle: upgrading to 2.11.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104260
Message-Id: <20230805073919.A28ACC41513@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:19 +0000 (UTC)

--===============0848981425647486514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycodestyle* to *2.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycodestyle-upgrade-2.10.0-2.11.0.patch
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
From 8aa647eede1d36353585b71e78a1726fd1d90417 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:55:04 -0500
Subject: [PATCH] python3-pycodestyle: upgrade 2.10.0 -> 2.11.0

---
 ...hon3-pycodestyle_2.10.0.bb => python3-pycodestyle_2.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.10.0.bb => python3-pycodestyle_2.11.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb
index b29fd4861..9a8d1076f 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "347187bdb476329d98f695c213d7295a846d1152ff4fe9bacb8a9590b8ee7053"
+SRC_URI[sha256sum] = "259bcc17857d8a8b3b4a2327324b79e5f020a13c16074670f9c8c8f872ea76d0"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============0848981425647486514==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pycodestyle-upgrade-2.10.0-2.11.0.patch"

From 8aa647eede1d36353585b71e78a1726fd1d90417 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:55:04 -0500
Subject: [PATCH] python3-pycodestyle: upgrade 2.10.0 -> 2.11.0

---
 ...hon3-pycodestyle_2.10.0.bb => python3-pycodestyle_2.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.10.0.bb => python3-pycodestyle_2.11.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb
index b29fd4861..9a8d1076f 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "347187bdb476329d98f695c213d7295a846d1152ff4fe9bacb8a9590b8ee7053"
+SRC_URI[sha256sum] = "259bcc17857d8a8b3b4a2327324b79e5f020a13c16074670f9c8c8f872ea76d0"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============0848981425647486514==--

