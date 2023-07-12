Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B396EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.969.1689139822367367197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=HxMrS1DW;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE1F6C0009
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139821;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=Lec0crtKDPurQW//4vwEp+x08tcISBTqcrQL76hn+Q4=;
	b=HxMrS1DWRKhkS8HsVe6RKAKlmt4d46X6JB/H2hJku+x3EpelqM+V+8QRZag/I5wB0gz0PU
	jjZGTg5c3wwS6PBeOm/CjSqVOgA7HYPG7w+1do+Vp5trKvGUTjj2frQAB+ghzJdpLCpA68
	npRw2i4QZbGXTxB0KjZ1/Z1FYMepg8vnMzzALiisIu3noJPNJAM8/qSq7wKs2mqcvm/bFJ
	qGRJHub31bWqjlN4WcKkGwDTa0YRHiFtIEZkPAU/vMfkaegAEISwMOqQA6DMshcatf/h3K
	rlo1J4riVdI76eqthcbcXVP+rmM2ESdxuXVSZuuwZAKwURQ7E6Du1xs761vWWg==
Content-Type: multipart/mixed; boundary="===============6923268456983715941=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-django: upgrading to 4.2.3 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103758
Message-Id: <20230712053030.7B396EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:30 +0000 (UTC)

--===============6923268456983715941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-django* to *4.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-django-upgrade-4.2.2-4.2.3.patch
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
From 4feee19ddc6325547b3ae4e8e72b67f72bf9109f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:59:01 -0500
Subject: [PATCH] python3-django: upgrade 4.2.2 -> 4.2.3

---
 .../python/{python3-django_4.2.2.bb => python3-django_4.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.2.bb => python3-django_4.2.3.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.2.bb b/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.3.bb
index da65eb9c3..4e3192744 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "2a6b6fbff5b59dd07bef10bcb019bee2ea97a30b2a656d51346596724324badf"
+SRC_URI[sha256sum] = "45a747e1c5b3d6df1b141b1481e193b033fd1fdbda3ff52677dc81afdaacbaed"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


--===============6923268456983715941==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-django-upgrade-4.2.2-4.2.3.patch"

From 4feee19ddc6325547b3ae4e8e72b67f72bf9109f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:59:01 -0500
Subject: [PATCH] python3-django: upgrade 4.2.2 -> 4.2.3

---
 .../python/{python3-django_4.2.2.bb => python3-django_4.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.2.bb => python3-django_4.2.3.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.2.bb b/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.3.bb
index da65eb9c3..4e3192744 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "2a6b6fbff5b59dd07bef10bcb019bee2ea97a30b2a656d51346596724324badf"
+SRC_URI[sha256sum] = "45a747e1c5b3d6df1b141b1481e193b033fd1fdbda3ff52677dc81afdaacbaed"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


--===============6923268456983715941==--

