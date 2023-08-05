Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3261C001DE
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:38:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.2151.1691221121609512323
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=XAHnDe89;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.200, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F37F20005
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221119;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=8BlrzTSeAnA3ylOmCKVGC/hehzQ8IPwNJvtpy/lm1Js=;
	b=XAHnDe89sur1oWvVKylhZpjnE4m0ImAly/X7a6VjN2VuAzU0USvegqNzbIb33w/CE9j9u1
	joIEPq/mlGmCh5JLDqlg6CjpDgSAgLhe4qm4iAUWIrMncyhPk2ZcuomNcngpcx7HoRRuXH
	rJcga30PdO6LzLeszRStwN7shVuwFEV0OVyyZ+NVQKzv0S66Rw7lNbKYtUFcPvPsHUZ3s7
	vhqOqjBCSCjwVNdjCVzVp7NpUV7YVHwpGYHxC34kcqmBIdwklGqUHcZ/2wCgAA0/hNyU3M
	616XU9guAUGSsx92dPJUGhvz3LfBYLkZue57uClQnBIJk0zI32FJbhVaSOFpqg==
Content-Type: multipart/mixed; boundary="===============5570590851868165224=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-distlib: upgrading to 0.3.7 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104242
Message-Id: <20230805073849.A3261C001DE@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:38:49 +0000 (UTC)

--===============5570590851868165224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-distlib* to *0.3.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-distlib-upgrade-0.3.6-0.3.7.patch
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
From 075a8f55c586d5eed1f2832720eb1455c5ca7d42 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 21:44:26 -0500
Subject: [PATCH] python3-distlib: upgrade 0.3.6 -> 0.3.7

---
 .../{python3-distlib_0.3.6.bb => python3-distlib_0.3.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-distlib_0.3.6.bb => python3-distlib_0.3.7.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb b/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb
rename to meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb
index ffffece56..1d9d53e27 100644
--- a/meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/distlib"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc"
 
-SRC_URI[sha256sum] = "14bad2d9b04d3a36127ac97f30b12a19268f211063d8f8ee4f47108896e11b46"
+SRC_URI[sha256sum] = "9dafe54b34a028eafd95039d5e5d4851a13734540f1331060d31c9916e7147a8"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_setuptools_build_meta
-- 
2.25.1


--===============5570590851868165224==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-distlib-upgrade-0.3.6-0.3.7.patch"

From 075a8f55c586d5eed1f2832720eb1455c5ca7d42 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 21:44:26 -0500
Subject: [PATCH] python3-distlib: upgrade 0.3.6 -> 0.3.7

---
 .../{python3-distlib_0.3.6.bb => python3-distlib_0.3.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-distlib_0.3.6.bb => python3-distlib_0.3.7.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb b/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb
rename to meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb
index ffffece56..1d9d53e27 100644
--- a/meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/distlib"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc"
 
-SRC_URI[sha256sum] = "14bad2d9b04d3a36127ac97f30b12a19268f211063d8f8ee4f47108896e11b46"
+SRC_URI[sha256sum] = "9dafe54b34a028eafd95039d5e5d4851a13734540f1331060d31c9916e7147a8"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_setuptools_build_meta
-- 
2.25.1


--===============5570590851868165224==--

