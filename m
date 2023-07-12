Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8964BC3DA40
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:29:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.926.1689139777928650732
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=FjbNdO29;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B678DC0004
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139776;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=j2hdnNyPpQNcLAr4TWK2qk/QwVd4Um23Ne73pKLoDzs=;
	b=FjbNdO29BJYjpQVY97Ob4FwTRL2BaO6Nj1eVlD2HReM9aQgR/eVMZizzGxOTQRRXaoA94i
	2p21HBTz6y98NnGOp3B9+HRZvsBFOxQSFDPknEKijIWWdLIl9igCjooy3HGYBpETatH6QB
	+hYVKGR5z2VEz38akbMXosBraqHJ56FzTLwQyzIBEtpteStja0PmWEWfWbsuMpQ2RsMJrj
	1RrQ4uTEtwpuL3hDqsNcjXZxWQScJijdwLf4xMpUs3Yzz85YADmzrZc/AUfS7JStSjq4ek
	ic0JCcHDsrqf2GYuPHPXJplEyiKgdAEpcwHRfDr6fptFnZYghM3gE+CcTG0dSQ==
Content-Type: multipart/mixed; boundary="===============5359125421291895384=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-argcomplete: upgrading to 3.1.1 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103740
Message-Id: <20230712052940.8964BC3DA40@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:29:40 +0000 (UTC)

--===============5359125421291895384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-argcomplete* to *3.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-argcomplete-upgrade-3.1.0-3.1.1.patch
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
From fcff37a8cb8a8aa02dc8ea90fd7db632ce468830 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:29:03 -0500
Subject: [PATCH] python3-argcomplete: upgrade 3.1.0 -> 3.1.1

---
 ...ython3-argcomplete_3.1.0.bb => python3-argcomplete_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.1.0.bb => python3-argcomplete_3.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.1.1.bb
index 859ef7b10..504e7e2eb 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "3a81445fa51c9875c36789ae5386d5e95c5c43d503963a0029a747aea74de1e3"
+SRC_URI[sha256sum] = "6c4c563f14f01440aaffa3eae13441c5db2357b5eec639abe7c0b15334627dff"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.25.1


--===============5359125421291895384==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-argcomplete-upgrade-3.1.0-3.1.1.patch"

From fcff37a8cb8a8aa02dc8ea90fd7db632ce468830 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:29:03 -0500
Subject: [PATCH] python3-argcomplete: upgrade 3.1.0 -> 3.1.1

---
 ...ython3-argcomplete_3.1.0.bb => python3-argcomplete_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.1.0.bb => python3-argcomplete_3.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.1.1.bb
index 859ef7b10..504e7e2eb 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "3a81445fa51c9875c36789ae5386d5e95c5c43d503963a0029a747aea74de1e3"
+SRC_URI[sha256sum] = "6c4c563f14f01440aaffa3eae13441c5db2357b5eec639abe7c0b15334627dff"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.25.1


--===============5359125421291895384==--

