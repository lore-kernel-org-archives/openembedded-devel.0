Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F222C41513
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:38:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2156.1691221129172257562
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=K0d4Taor;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86AB61C0005
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221127;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=1rhZ/Glrjn4b+dIXeiRk4JRMnGWxJPNKyJwjlzjMn2w=;
	b=K0d4TaoreIRoODLWxwguTsEhjp13nIT87hNLweisLw9qBQiuLPsvZN0Z3qEEqLkvuTEyjd
	ZeAAjcJ9c3NuZ+8kZM2F+mXzBMDcHlHJlzd8ohQmDRybHDkip1mHVyWEC3PdLyoczmUcMp
	IirnuPwWQ/cDRC09cKDW4okuDJJJx2M1xWQ9c6Cy9naX4dgtetjKUdJaf5v9T+A3AUcdlT
	rtbVtSNxP8URQ9rT2MTAllbAXGYalyVN9DtzVhUJ7Qoh0xqxAUaI8AtKfo21Ro746h6cra
	YHhZ+bP/G6mdn8DjxFHrClGVwgtRpD9jI5XSRZrZVk0/kAB9hBhDB5CeYXfHNw==
Content-Type: multipart/mixed; boundary="===============4495270279377096246=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-googleapis-common-protos: upgrading to 1.60.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104246
Message-Id: <20230805073859.9F222C41513@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:38:59 +0000 (UTC)

--===============4495270279377096246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-googleapis-common-protos* to *1.60.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-googleapis-common-protos-upgrade-1.59.1-1.60.patch
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
From 915969d13507e195e703dabf7f2252c607dce4c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 22:21:21 -0500
Subject: [PATCH] python3-googleapis-common-protos: upgrade 1.59.1 -> 1.60.0

---
 ...tos_1.59.1.bb => python3-googleapis-common-protos_1.60.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.59.1.bb => python3-googleapis-common-protos_1.60.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb
index 802a43499..40ddf98a7 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b35d530fe825fb4227857bc47ad84c33c809ac96f312e13182bdeaa2abe1178a"
+SRC_URI[sha256sum] = "e73ebb404098db405ba95d1e1ae0aa91c3e15a71da031a2eeb6b2e23e7bc3708"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.25.1


--===============4495270279377096246==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-googleapis-common-protos-upgrade-1.59.1-1.60.patch"

From 915969d13507e195e703dabf7f2252c607dce4c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 22:21:21 -0500
Subject: [PATCH] python3-googleapis-common-protos: upgrade 1.59.1 -> 1.60.0

---
 ...tos_1.59.1.bb => python3-googleapis-common-protos_1.60.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.59.1.bb => python3-googleapis-common-protos_1.60.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb
index 802a43499..40ddf98a7 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.60.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b35d530fe825fb4227857bc47ad84c33c809ac96f312e13182bdeaa2abe1178a"
+SRC_URI[sha256sum] = "e73ebb404098db405ba95d1e1ae0aa91c3e15a71da031a2eeb6b2e23e7bc3708"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.25.1


--===============4495270279377096246==--

