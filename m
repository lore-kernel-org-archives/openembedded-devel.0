Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1178EB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:39 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.2169.1691221178911678966
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Xg8gjkak;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.193, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49A23240008
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221177;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=8zuHyYqnrkpxpTMZYBpu1vUrtceKojc+Pt5J4Cil9Nk=;
	b=Xg8gjkakOInbrQv5EBz2UZWyg/B/+JnkZzIHuzJaGdgcYRAAd+ZxgcjvtDRvVRnIGyUTFp
	NoaaU0BlefeWAWE1Ru6WEueyD2ADm+o01Bz6Vqv9K1I/y/BywsWCc9Uyj0VQ4ater2pglk
	PvbAU1XuvabYpGS09S2HybUTmBn2S/rbVb9Zt91KD+XR22CttU26dNjuU0yav7Wwm9tjQx
	DPYtn3gM3fRyXvIvpyBsOvERHzzqUCpX1ZQGXMKbhxZDZ8Hfjaya3QsU68dw06ntnuwDoA
	uisIn2eGJHZJ62dgesCZ3wBdObTCj1vi3UjS8c9TQftNoIUPP7+LE54z78YajQ==
Content-Type: multipart/mixed; boundary="===============6795776114073978066=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-sentry-sdk: upgrading to 1.29.2 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104272
Message-Id: <20230805073939.A1178EB64DD@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:39 +0000 (UTC)

--===============6795776114073978066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sentry-sdk* to *1.29.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sentry-sdk-upgrade-1.26.0-1.29.2.patch
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
From f98dd5617b621b46f5d90cafba2bb64cf9fe45eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 01:00:20 -0500
Subject: [PATCH] python3-sentry-sdk: upgrade 1.26.0 -> 1.29.2

---
 ...ython3-sentry-sdk_1.26.0.bb => python3-sentry-sdk_1.29.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.26.0.bb => python3-sentry-sdk_1.29.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.29.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.29.2.bb
index 697f102a2..b3fea46c8 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.29.2.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "760e4fb6d01c994110507133e08ecd4bdf4d75ee4be77f296a3579796cf73134"
+SRC_URI[sha256sum] = "a99ee105384788c3f228726a88baf515fe7b5f1d2d0f215a03d194369f158df7"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


--===============6795776114073978066==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-sentry-sdk-upgrade-1.26.0-1.29.2.patch"

From f98dd5617b621b46f5d90cafba2bb64cf9fe45eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 01:00:20 -0500
Subject: [PATCH] python3-sentry-sdk: upgrade 1.26.0 -> 1.29.2

---
 ...ython3-sentry-sdk_1.26.0.bb => python3-sentry-sdk_1.29.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.26.0.bb => python3-sentry-sdk_1.29.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.29.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.29.2.bb
index 697f102a2..b3fea46c8 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.29.2.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "760e4fb6d01c994110507133e08ecd4bdf4d75ee4be77f296a3579796cf73134"
+SRC_URI[sha256sum] = "a99ee105384788c3f228726a88baf515fe7b5f1d2d0f215a03d194369f158df7"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


--===============6795776114073978066==--

