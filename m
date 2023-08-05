Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC481C0015E
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:38:49 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.2153.1691221122875946243
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=kp2CXg2V;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.195, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EC5C60002
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221121;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=IyzAVdwPwnEq9qV2WTuP4msJHIhFRTdyWNV2SeGQ+QQ=;
	b=kp2CXg2VTieVxmR0qkHsLyT1u5MFBei26FVXx5lt7LPuPyyBD3SPlIWf+MMDGHymLy88Av
	wFmt08flAzdmwyGvtqvhpEVzCab2N8RrdgL0o5jOiiuWCs649LMW2sirqzTRtu2PswCZfS
	kOlf42PiowYikx7qteb2aRw8Ll02jfD+nFAv55A7PdPfhyXEDSN3dwWlQ758PGlNpx/B78
	1JL/1/dAomxSm6j/tIpfF2iSpA/p+XNPNDIpBUUhWPVd0NoSGZeRUpYjWYiGhBpbCQ+IrZ
	+Me0P124dgIX2OtcasuNs2cIHlKR5vX+ereRx/YrqSjq/Sb4/vNiN/+nBCJtJw==
Content-Type: multipart/mixed; boundary="===============4400405306666689501=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-django: upgrading to 4.2.4 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104243
Message-Id: <20230805073849.AC481C0015E@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:38:49 +0000 (UTC)

--===============4400405306666689501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-django* to *4.2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-django-upgrade-4.2.3-4.2.4.patch
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
From c0f1c4f38bccd986ec90af65e2ea0dc26caa57ca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 21:54:54 -0500
Subject: [PATCH] python3-django: upgrade 4.2.3 -> 4.2.4

---
 .../python/{python3-django_4.2.3.bb => python3-django_4.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.3.bb => python3-django_4.2.4.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb b/meta-python/recipes-devtools/python/python3-django_4.2.4.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.4.bb
index 4e3192744..c75c9d263 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.4.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "45a747e1c5b3d6df1b141b1481e193b033fd1fdbda3ff52677dc81afdaacbaed"
+SRC_URI[sha256sum] = "7e4225ec065e0f354ccf7349a22d209de09cc1c074832be9eb84c51c1799c432"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


--===============4400405306666689501==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-django-upgrade-4.2.3-4.2.4.patch"

From c0f1c4f38bccd986ec90af65e2ea0dc26caa57ca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 21:54:54 -0500
Subject: [PATCH] python3-django: upgrade 4.2.3 -> 4.2.4

---
 .../python/{python3-django_4.2.3.bb => python3-django_4.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.3.bb => python3-django_4.2.4.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb b/meta-python/recipes-devtools/python/python3-django_4.2.4.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.4.bb
index 4e3192744..c75c9d263 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.4.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "45a747e1c5b3d6df1b141b1481e193b033fd1fdbda3ff52677dc81afdaacbaed"
+SRC_URI[sha256sum] = "7e4225ec065e0f354ccf7349a22d209de09cc1c074832be9eb84c51c1799c432"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


--===============4400405306666689501==--

