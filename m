Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B57EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.933.1689139807777144637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=mVP/EfIY;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C2D4E0005
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139806;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=47KeVTP6Xo+0zWFTDt0SqrEXixOShjhLZIXKxhaiFPs=;
	b=mVP/EfIYzp0xDSZm4mQpzGqDzTCDqhLylfd3/pPALSRbwJg8RSCdHP8wX/0cbE6drq7kAP
	HMkVC/f8l2IdBN8UQsJJ2j1pdUxZgV8UaPC3xWZUUziOkOa03F+p+Mxnb0Zh5c8/pLrHdN
	iplGx52GH58smcAU98Yn7kyZh4J3uqHTUOY9VWmg5a7iELjSd24AtfRg3FAPk2T0AwHBef
	Ru5cKnEDpIoNbRmDFBoJAkqStZ+V46jdzc6HPHSzDnjyyJt+/w0dj2AsR+3XfWQxj51pYj
	wnUNUHr38C6fAjatjHQqJtbbxh4g7uYCGfk4eG8rgypW2DLM8ux4h4GORlg7LQ==
Content-Type: multipart/mixed; boundary="===============8397093489099329781=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-bitarray: upgrading to 2.7.6 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103750
Message-Id: <20230712053010.63B57EB64D9@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:10 +0000 (UTC)

--===============8397093489099329781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-bitarray* to *2.7.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-bitarray-upgrade-2.7.3-2.7.6.patch
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
From 2d10e5a58f2cd60ddc3ed418acf62b7c8bfe9f47 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:22:12 -0500
Subject: [PATCH] python3-bitarray: upgrade 2.7.3 -> 2.7.6

---
 .../{python3-bitarray_2.7.3.bb => python3-bitarray_2.7.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.7.3.bb => python3-bitarray_2.7.6.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb
index f766692a0..b27480057 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "f71256a32609b036adad932e1228b66a6b4e2cae6be397e588ddc0babd9a78b9"
+SRC_URI[sha256sum] = "3807f9323c308bc3f9b58cbe5d04dc28f34ac32d852999334da96b42f64b5356"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


--===============8397093489099329781==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-bitarray-upgrade-2.7.3-2.7.6.patch"

From 2d10e5a58f2cd60ddc3ed418acf62b7c8bfe9f47 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:22:12 -0500
Subject: [PATCH] python3-bitarray: upgrade 2.7.3 -> 2.7.6

---
 .../{python3-bitarray_2.7.3.bb => python3-bitarray_2.7.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.7.3.bb => python3-bitarray_2.7.6.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb
index f766692a0..b27480057 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "f71256a32609b036adad932e1228b66a6b4e2cae6be397e588ddc0babd9a78b9"
+SRC_URI[sha256sum] = "3807f9323c308bc3f9b58cbe5d04dc28f34ac32d852999334da96b42f64b5356"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


--===============8397093489099329781==--

