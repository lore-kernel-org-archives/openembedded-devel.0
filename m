Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AF8EB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:50 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.953.1689139844696579391
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=ByLTvO3m;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.195, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 193AD60002
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139843;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=gRG3UsATzhYnQRoQ659kw8uvYNFf7lk/ihnxVOfYPw4=;
	b=ByLTvO3m25M6avheOdJISLbN3njG7GDXlkrDg/ZaXM4YJBgQmwUjMsTSjqAC6bGjMYdyKT
	qB0NDuTfnfLpuDIXtrhhPAGmED56Unb/eomRTstbnY9A5yD/1/2kGaG5qRky+peAt5lGrt
	cGvLKLowszZhbijS+VxVqQNllXEECCHstuNckyKtwsQREskrPr19FtamRJ9u0HsBYKmR+F
	460LBAFULdkzC47pgtUoJ6MV1hVBPez2SHVGkgaVJNf1DC0Btjoj7muDr7L+LfPYht8gzr
	scCGL1E796+ZZjWLvvHlU8ZwmbCYXvuWJbBcoBoX3iTCwuERQRaflRRQJpoRnQ==
Content-Type: multipart/mixed; boundary="===============1577741390432397011=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-ipython: upgrading to 8.14.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103771
Message-Id: <20230712053050.78AF8EB64DD@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:50 +0000 (UTC)

--===============1577741390432397011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-ipython* to *8.14.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ipython-upgrade-8.12.0-8.14.0.patch
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
From 81049d4db4aacbca84b426b8129c4717f9dc5af2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 19:21:45 -0500
Subject: [PATCH] python3-ipython: upgrade 8.12.0 -> 8.14.0

---
 .../{python3-ipython_8.12.0.bb => python3-ipython_8.14.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.12.0.bb => python3-ipython_8.14.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
index 0cfc80ec9..83af99a4a 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "a950236df04ad75b5bc7f816f9af3d74dc118fd42f2ff7e80e8e60ca1f182e2d"
+SRC_URI[sha256sum] = "1d197b907b6ba441b692c48cf2a3a2de280dc0ac91a3405b39349a50272ca0a1"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.25.1


--===============1577741390432397011==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-ipython-upgrade-8.12.0-8.14.0.patch"

From 81049d4db4aacbca84b426b8129c4717f9dc5af2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 19:21:45 -0500
Subject: [PATCH] python3-ipython: upgrade 8.12.0 -> 8.14.0

---
 .../{python3-ipython_8.12.0.bb => python3-ipython_8.14.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.12.0.bb => python3-ipython_8.14.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
index 0cfc80ec9..83af99a4a 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "a950236df04ad75b5bc7f816f9af3d74dc118fd42f2ff7e80e8e60ca1f182e2d"
+SRC_URI[sha256sum] = "1d197b907b6ba441b692c48cf2a3a2de280dc0ac91a3405b39349a50272ca0a1"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.25.1


--===============1577741390432397011==--

