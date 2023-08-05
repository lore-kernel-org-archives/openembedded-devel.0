Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91BAC00528
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.2178.1691221182398603707
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=d4OTXzYr;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C31841BF204
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221181;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=QUZU0cAKupv7hX1uduQxsRHh+5DCrplrfl4qMdbTS4E=;
	b=d4OTXzYrf0t73deXWQ94cQY02ODr0qWysD63PxD48yGXnU8KNkrcCfiztybWwGU7h5F4c0
	A9/qK3GcoyX+3jyWPlbOXir5juKvCFB+oXvpWSIti2Gyw1Ik5DbMtKEoY4+ZYwgfZwakJF
	TUejrWKO05aXiroTW8mNIlAg8HjpRfpsfdzX8v+3uqs0xrczqAklIatv4NG98oy1YY6Y1S
	Pr1ub7jX2brK1r1irL9BCXgZkQLn5rCGO08rLZvJfGOgXPx5VwkeKLRvWaR8GQQDS3eeu2
	BU7k/o2Fqc9pHgBwwItQe53zuUL108EjRRaXUD2txFUOIvXcW+LO8YOCfqfTpQ==
Content-Type: multipart/mixed; boundary="===============4757185629507679477=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-tornado: upgrading to 6.3.2 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104274
Message-Id: <20230805073949.B91BAC00528@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:49 +0000 (UTC)

--===============4757185629507679477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-tornado* to *6.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-tornado-upgrade-6.3-6.3.2.patch
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
From 333208313d2ac142f89461774e4400c862f98ceb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 01:10:50 -0500
Subject: [PATCH] python3-tornado: upgrade 6.3 -> 6.3.2

---
 .../python/{python3-tornado_6.3.bb => python3-tornado_6.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.3.bb => python3-tornado_6.3.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
index af5009b6a..c0bebf083 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d68f3192936ff2c4add04dc21a436a43b4408d466746b78bb2b9d0a53a18683f"
+SRC_URI[sha256sum] = "4b927c4f19b71e627b13f3db2324e4ae660527143f9e1f2e2fb404f3a187e2ba"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============4757185629507679477==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-tornado-upgrade-6.3-6.3.2.patch"

From 333208313d2ac142f89461774e4400c862f98ceb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 01:10:50 -0500
Subject: [PATCH] python3-tornado: upgrade 6.3 -> 6.3.2

---
 .../python/{python3-tornado_6.3.bb => python3-tornado_6.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.3.bb => python3-tornado_6.3.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
index af5009b6a..c0bebf083 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.3.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d68f3192936ff2c4add04dc21a436a43b4408d466746b78bb2b9d0a53a18683f"
+SRC_URI[sha256sum] = "4b927c4f19b71e627b13f3db2324e4ae660527143f9e1f2e2fb404f3a187e2ba"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============4757185629507679477==--

