Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B51AC3DA40
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.1014.1689139875033352315
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Hnej0AgY;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A480E0003
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139873;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=1yAec5IX/HEL7OgpwT7byMYDhjJ0EoIYW+n+CcdI6sE=;
	b=Hnej0AgYKXw6u2qTWqQb7sjnBsb6v2/cD6EYRxW/LTuT6B50l9T27Msnzi/mz0RyR1FTKE
	4R7S2CRFEyiHcrxrlSy+2fME8ckqgidOwHdwQX19qK/VCTujV8SW5aSt8Erkn5VTRpwaHl
	IjWLLTcfKeNXjzYQ379QD0WEsxs1h7r+8HSpl1uEy/3g7J3e5CYSy6mJqSTwRBdqO+6iON
	jVEQ0OD9QAK/c/zQmOt0KOFJaAyBohKtENCzxOcfq1EfdG8zwy0bOmCa85dOLTgmXRCvwG
	N1Hj2JtAavnBFoQOT/wJSKz8mhwuS/+53JihNvTYKFqS+XBoAuAc3vgN92dbRw==
Content-Type: multipart/mixed; boundary="===============6474575666178617620=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-protobuf: upgrading to 4.23.4 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103789
Message-Id: <20230712053120.7B51AC3DA40@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:20 +0000 (UTC)

--===============6474575666178617620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-protobuf* to *4.23.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-protobuf-upgrade-4.23.3-4.23.4.patch
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
From 812973bf8c6e72c2944deb4e83269cc57b5b5440 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 21:20:58 -0500
Subject: [PATCH] python3-protobuf: upgrade 4.23.3 -> 4.23.4

---
 .../{python3-protobuf_4.23.3.bb => python3-protobuf_4.23.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.23.3.bb => python3-protobuf_4.23.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.23.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.23.4.bb
index 84fa9f866..8474a43d6 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.23.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7a92beb30600332a52cdadbedb40d33fd7c8a0d7f549c440347bc606fb3fe34b"
+SRC_URI[sha256sum] = "ccd9430c0719dce806b93f89c91de7977304729e55377f872a92465d548329a9"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


--===============6474575666178617620==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-protobuf-upgrade-4.23.3-4.23.4.patch"

From 812973bf8c6e72c2944deb4e83269cc57b5b5440 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 21:20:58 -0500
Subject: [PATCH] python3-protobuf: upgrade 4.23.3 -> 4.23.4

---
 .../{python3-protobuf_4.23.3.bb => python3-protobuf_4.23.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.23.3.bb => python3-protobuf_4.23.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.23.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.23.4.bb
index 84fa9f866..8474a43d6 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.23.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7a92beb30600332a52cdadbedb40d33fd7c8a0d7f549c440347bc606fb3fe34b"
+SRC_URI[sha256sum] = "ccd9430c0719dce806b93f89c91de7977304729e55377f872a92465d548329a9"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


--===============6474575666178617620==--

