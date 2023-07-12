Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682F9EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:20 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.1010.1689139869863979021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=lxVmbKmu;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.200, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FEB720003
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139868;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=Twdg7+y1L/FSBV+v2KqFz2mtvflyjriYP/186BYdq80=;
	b=lxVmbKmuVlnStrengTSlSYUEsohxOaQsHr+os8IFMYm3NVzS8pHr67ATQhYz50Gax5ywfU
	jpFY4izt1tha1FcF7pDvcy1N8F7kJ7NFvvN2IaMeeIDRU0A4e090YFGnzwu6+iI+OPGRhw
	GK97Kz8vpzcQk5/m0j8YP0zkB/lOChD33kWheXZJCzyG3gHfwdNIwiYIWypLdrYCiTfUw5
	F58dbO+zazmFGjsw3LG+PAaAquOcwJxyMKgjG7VnP+Uej8AWtsyqS9GWeVxkGpxEaZNcX5
	EVSm/xQSrY+tpClZMvU6I6cNxBcjW6H9bjCLbkxq8dYrEjT6HmLQOWMOErrnDQ==
Content-Type: multipart/mixed; boundary="===============1907746791456509197=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-platformdirs: upgrading to 3.8.1 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103786
Message-Id: <20230712053120.682F9EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:20 +0000 (UTC)

--===============1907746791456509197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-platformdirs* to *3.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-platformdirs-upgrade-3.8.0-3.8.1.patch
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
From 22e5067f92bec36b1b0e78937de2ac92467c6e66 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 21:03:53 -0500
Subject: [PATCH] python3-platformdirs: upgrade 3.8.0 -> 3.8.1

---
 ...hon3-platformdirs_3.8.0.bb => python3-platformdirs_3.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.8.0.bb => python3-platformdirs_3.8.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.8.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_3.8.1.bb
index 52fe07acf..e6748971e 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.8.1.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "b0cabcb11063d21a0b261d557acb0a9d2126350e63b70cdf7db6347baea456dc"
+SRC_URI[sha256sum] = "f87ca4fcff7d2b0f81c6a748a77973d7af0f4d526f98f308477c3c436c74d528"
 
 inherit pypi python_hatchling ptest
 
-- 
2.25.1


--===============1907746791456509197==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-platformdirs-upgrade-3.8.0-3.8.1.patch"

From 22e5067f92bec36b1b0e78937de2ac92467c6e66 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 21:03:53 -0500
Subject: [PATCH] python3-platformdirs: upgrade 3.8.0 -> 3.8.1

---
 ...hon3-platformdirs_3.8.0.bb => python3-platformdirs_3.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.8.0.bb => python3-platformdirs_3.8.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.8.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_3.8.1.bb
index 52fe07acf..e6748971e 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.8.1.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "b0cabcb11063d21a0b261d557acb0a9d2126350e63b70cdf7db6347baea456dc"
+SRC_URI[sha256sum] = "f87ca4fcff7d2b0f81c6a748a77973d7af0f4d526f98f308477c3c436c74d528"
 
 inherit pypi python_hatchling ptest
 
-- 
2.25.1


--===============1907746791456509197==--

