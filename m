Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BDEEB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:40 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.978.1689139836208785284
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=NbjQF6fI;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90C571BF207
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139834;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=0OmfP6Vzt/LnrJLzAL8nxK6+EuCB6PITqP6rP67u4gA=;
	b=NbjQF6fIfD/iKUNsbE0H4hbXYT6G+e1QCdw32CUGLhGi4vCI8548sUKC1Q+MYSM1GiVdQO
	b+kolJpN2x50K4Bw1ifnqzCjOVaTQPXV5OXV3MHDyc4iIgyDreekLynV59klVJUFxWvPwp
	YqVpaAYsSFSz8JQTFQrWygoSiMUhhXu17e9gHHya54vsqY1cHPvhYzxXAtTcXHbPFm3/tF
	sopAM06ZYV1hlS6iv29MoIn1nRsxOOpF2ReTBQGg+bg/NW1C0hrVHfmWYgfUlSgnbZkj+u
	+D3n1h/00JIZblofXy+P3VP1zFGgRLBUVvnik/4yF00SPR1jXQZ3IUarEcQehg==
Content-Type: multipart/mixed; boundary="===============0667985619775369276=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-gevent: upgrading to 23.7.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103766
Message-Id: <20230712053040.79BDEEB64DD@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:40 +0000 (UTC)

--===============0667985619775369276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-gevent* to *23.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-gevent-upgrade-22.10.2-23.7.0.patch
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
From 5196beb64c0ab442ad2f408c990855114191c889 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:42:18 -0500
Subject: [PATCH] python3-gevent: upgrade 22.10.2 -> 23.7.0

---
 .../{python3-gevent_22.10.2.bb => python3-gevent_23.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_22.10.2.bb => python3-gevent_23.7.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb b/meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb
rename to meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb
index b9bf9130d..a82abcc09 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "1ca01da176ee37b3527a2702f7d40dbc9ffb8cfc7be5a03bfa4f9eec45e55c46"
+SRC_URI[sha256sum] = "d0d3630674c1b344b256a298ab1ff43220f840b12af768131b5d74e485924237"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============0667985619775369276==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-gevent-upgrade-22.10.2-23.7.0.patch"

From 5196beb64c0ab442ad2f408c990855114191c889 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 18:42:18 -0500
Subject: [PATCH] python3-gevent: upgrade 22.10.2 -> 23.7.0

---
 .../{python3-gevent_22.10.2.bb => python3-gevent_23.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_22.10.2.bb => python3-gevent_23.7.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb b/meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb
rename to meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb
index b9bf9130d..a82abcc09 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "1ca01da176ee37b3527a2702f7d40dbc9ffb8cfc7be5a03bfa4f9eec45e55c46"
+SRC_URI[sha256sum] = "d0d3630674c1b344b256a298ab1ff43220f840b12af768131b5d74e485924237"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============0667985619775369276==--

