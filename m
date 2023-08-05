Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEFAEB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.2175.1691221196053096391
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Niyi2/gg;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BA411C0003
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221194;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=0SUnFIdCoHjP388JPxrljEZRzMcPnWJdkmqnl6tiqz8=;
	b=Niyi2/gg4zOlCNXaRjzlwTAwAIjWNKMAziYBeB9YxuYDUqSHU4ystthHgqyS37qYASy829
	f1v+Zfk73wdpH8Q8t1ti8qyfy9V7jBs5Xm1/qJSj8vH4GdKNIjdkMqHVV/Rtcvp/OsMtRW
	9jvLoVy8wAKYx1nYD0ktshdc9riI4vaW1J0FS3ISSATOsDV2nQt5R0DxsfTg+ykHigbBG9
	J5NZsWKbI2Y2Y2pLY6YsPABUHSqrZP/DzNzWC8BlHhDf9hN/dJRjRDWc8dUlxFM8pcNTyR
	QXAYKhV4XXgXev/KZSBch46Y5MHO9JUzq2Xp/FEiaQj78gphc5I/psr9dBD2rw==
Content-Type: multipart/mixed; boundary="===============0572513476985010017=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-yamlloader: upgrading to 1.3.2 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104282
Message-Id: <20230805073959.9DEFAEB64DD@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:59 +0000 (UTC)

--===============0572513476985010017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-yamlloader* to *1.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-yamlloader-upgrade-1.2.2-1.3.2.patch
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
From 8cc939809f1cd4883bcb2a107e6348ea3727a108 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:31:13 -0500
Subject: [PATCH] python3-yamlloader: upgrade 1.2.2 -> 1.3.2

---
 ...{python3-yamlloader_1.2.2.bb => python3-yamlloader_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_1.2.2.bb => python3-yamlloader_1.3.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
index 9fdba4911..030ad8812 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
 
-SRC_URI[sha256sum] = "35669fd7b9f8c6b38db861a51701542c42672b46e8ab63253486a8cb8377b687"
+SRC_URI[sha256sum] = "7dbd98421d8090c521655f1b06ca030067f29df5253a8878126bce3a90f56817"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


--===============0572513476985010017==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-yamlloader-upgrade-1.2.2-1.3.2.patch"

From 8cc939809f1cd4883bcb2a107e6348ea3727a108 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:31:13 -0500
Subject: [PATCH] python3-yamlloader: upgrade 1.2.2 -> 1.3.2

---
 ...{python3-yamlloader_1.2.2.bb => python3-yamlloader_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_1.2.2.bb => python3-yamlloader_1.3.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
index 9fdba4911..030ad8812 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
 
-SRC_URI[sha256sum] = "35669fd7b9f8c6b38db861a51701542c42672b46e8ab63253486a8cb8377b687"
+SRC_URI[sha256sum] = "7dbd98421d8090c521655f1b06ca030067f29df5253a8878126bce3a90f56817"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


--===============0572513476985010017==--

