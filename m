Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B632C0015E
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.2160.1691221148972384369
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=jPopE3pW;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.199, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AFF1FF807
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221147;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=mD+VGklq8gHAKcQRxWc5VFFWBNCLGrUrtLe56GmF300=;
	b=jPopE3pWyQf/ZFYCv8pxhKocBKg7qyI/Pr9SIc0ID7A2MjwaSU/nm+QjtG+2AQvyFnrJYC
	huaJXMfmwbXfLZmplnPlZvPoz+Wp/CvEnIIhGfTytwb8uvWl2scmZ/2axwUjwj6SCwJPEm
	kKRfSyA25B80katp2wtArwdH7Ib2jcEOYZNmJmTg704BegMVqvHBJymBtP545NLv2WMACt
	alzf/+3pfjWKscScJzT2u9Saerm7N/s0rdtFH+ZLZ91v1vhkBunydTzTaZQ18O/+ardXzk
	v+/daZgwvfnbGjdlWJt7ij/xmod9gwGmEM/BsAxR9J5mKVw5/+Oo9iujUh19Cw==
Content-Type: multipart/mixed; boundary="===============1408486845107276157=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-platformdirs: upgrading to 3.10.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104255
Message-Id: <20230805073909.9B632C0015E@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:09 +0000 (UTC)

--===============1408486845107276157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-platformdirs* to *3.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-platformdirs-upgrade-3.9.1-3.10.0.patch
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
From 8e52050a0d5a402f828d9aa6f00730f9d64f8992 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:32:37 -0500
Subject: [PATCH] python3-platformdirs: upgrade 3.9.1 -> 3.10.0

---
 ...on3-platformdirs_3.9.1.bb => python3-platformdirs_3.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.9.1.bb => python3-platformdirs_3.10.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb
index c52d9d216..264b06d67 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "1b42b450ad933e981d56e59f1b97495428c9bd60698baab9f3eb3d00d5822421"
+SRC_URI[sha256sum] = "b45696dab2d7cc691a3226759c0d3b00c47c8b6e293d96f6436f733303f77f6d"
 
 inherit pypi python_hatchling ptest
 
-- 
2.25.1


--===============1408486845107276157==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-platformdirs-upgrade-3.9.1-3.10.0.patch"

From 8e52050a0d5a402f828d9aa6f00730f9d64f8992 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:32:37 -0500
Subject: [PATCH] python3-platformdirs: upgrade 3.9.1 -> 3.10.0

---
 ...on3-platformdirs_3.9.1.bb => python3-platformdirs_3.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.9.1.bb => python3-platformdirs_3.10.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb
index c52d9d216..264b06d67 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "1b42b450ad933e981d56e59f1b97495428c9bd60698baab9f3eb3d00d5822421"
+SRC_URI[sha256sum] = "b45696dab2d7cc691a3226759c0d3b00c47c8b6e293d96f6436f733303f77f6d"
 
 inherit pypi python_hatchling ptest
 
-- 
2.25.1


--===============1408486845107276157==--

