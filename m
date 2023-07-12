Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C79FC001DF
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.1020.1689139885043554841
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=fAkJIUuk;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A0011C0008
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139883;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=JkD8tBvC8xNG7CiBxr2xrNw14/USVV6LY6MTeoDRRbY=;
	b=fAkJIUuk0TS69UtX55kqcrp1QDnuuz0VJkXHtE2GtbCqt92itKFJzpaJmlBe+HjUm40tu/
	YKgO4/Kve76xTADZTyWAG+/HmA00nusbax3DEgRASdslmm6R48whWOGcKnbUOpKnGbjvTc
	pDgCPXA5icO548fwG6bwq5XPD4BgfQCK1PZqML3X7XtmNzlBAL8xvVWTbLSD3U/Np61AEM
	vEfkqj8ZcaYZcg82p3Bp0rpGH9seJgZy422rcxb+wav06guxlHK8ratidAK1RZ2O4p28XS
	A3k4XooBbM8pXVjLMtD0ZNZOanzcoVwGLoi+BdS5YOLhy8j+ADEKIUlulfQhZA==
Content-Type: multipart/mixed; boundary="===============4684859183956139648=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pymisp: upgrading to 2.4.173 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103795
Message-Id: <20230712053130.8C79FC001DF@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:30 +0000 (UTC)

--===============4684859183956139648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pymisp* to *2.4.173* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pymisp-upgrade-2.4.172-2.4.173.patch
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
From fc36f095f3b0e4059965db87cd9f68d940181e31 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 21:57:29 -0500
Subject: [PATCH] python3-pymisp: upgrade 2.4.172 -> 2.4.173

---
 .../{python3-pymisp_2.4.172.bb => python3-pymisp_2.4.173.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.172.bb => python3-pymisp_2.4.173.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
index 59ddac388..10cc52a7e 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "7d1d8b6f38f210b28934a206f9c1470542e9da7e"
+SRCREV = "ccae32ae716c143bea09954e860238e193bc78c6"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.25.1


--===============4684859183956139648==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pymisp-upgrade-2.4.172-2.4.173.patch"

From fc36f095f3b0e4059965db87cd9f68d940181e31 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 21:57:29 -0500
Subject: [PATCH] python3-pymisp: upgrade 2.4.172 -> 2.4.173

---
 .../{python3-pymisp_2.4.172.bb => python3-pymisp_2.4.173.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.172.bb => python3-pymisp_2.4.173.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
index 59ddac388..10cc52a7e 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "7d1d8b6f38f210b28934a206f9c1470542e9da7e"
+SRCREV = "ccae32ae716c143bea09954e860238e193bc78c6"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.25.1


--===============4684859183956139648==--

