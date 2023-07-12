Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A6FC001DF
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:50 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.1036.1689139901632522011
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=mOBEkZj4;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 074801BF203
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139900;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=bitJVeD+kSrKHkhMZ324dCM0Lr3+53+5W8j3RRkpj+k=;
	b=mOBEkZj4ag19tZcft4qpH8mWa473UzuSFlpwH47uhIsiL/ELZA8cH2MCk59aVPX7RYFEp3
	68mCERfXDkRDGaaHWTACB8hTTCzJQJKqO5kCwAuLHhDu9OY41FW6TSG6ScDDY9dYosTi95
	Pjs7dL9YryLyY9u9teeqKuVJWPik207eG/6zSine0AbCBD/WO/satWO3oco2uicd5WquXU
	oA2GAaEwn4qv5KL3p6WYvT7vjr3QACv5AT1ME2psGXZyvf9fEYCLGmasH27caDj9JWl+ig
	HmbXS3XPNA7s56dQBdx2aZ727SEbOJd+BbwLJAM1kbLkgkCMLBjwuuJeQ3HrRQ==
Content-Type: multipart/mixed; boundary="===============3191751686950571467=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-sentry-sdk: upgrading to 1.28.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103805
Message-Id: <20230712053150.83A6FC001DF@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:50 +0000 (UTC)

--===============3191751686950571467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sentry-sdk* to *1.28.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sentry-sdk-upgrade-1.26.0-1.28.0.patch
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
From 8c337106c6ca4369af7172ceeca9e54c33781ed4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:40:41 -0500
Subject: [PATCH] python3-sentry-sdk: upgrade 1.26.0 -> 1.28.0

---
 ...ython3-sentry-sdk_1.26.0.bb => python3-sentry-sdk_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.26.0.bb => python3-sentry-sdk_1.28.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.28.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.28.0.bb
index 697f102a2..6ddfa62b9 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.28.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "760e4fb6d01c994110507133e08ecd4bdf4d75ee4be77f296a3579796cf73134"
+SRC_URI[sha256sum] = "2281ba98011cfa9bc9bb15c1074b6dd9f7fdfce94033cd25b50f18f078ffed4c"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


--===============3191751686950571467==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-sentry-sdk-upgrade-1.26.0-1.28.0.patch"

From 8c337106c6ca4369af7172ceeca9e54c33781ed4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:40:41 -0500
Subject: [PATCH] python3-sentry-sdk: upgrade 1.26.0 -> 1.28.0

---
 ...ython3-sentry-sdk_1.26.0.bb => python3-sentry-sdk_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.26.0.bb => python3-sentry-sdk_1.28.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.28.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.28.0.bb
index 697f102a2..6ddfa62b9 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.28.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "760e4fb6d01c994110507133e08ecd4bdf4d75ee4be77f296a3579796cf73134"
+SRC_URI[sha256sum] = "2281ba98011cfa9bc9bb15c1074b6dd9f7fdfce94033cd25b50f18f078ffed4c"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


--===============3191751686950571467==--

