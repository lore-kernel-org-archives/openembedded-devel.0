Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DF6C0015E
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2180.1691221185685982618
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=hSRV3Ri3;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11E5E1C0005
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221184;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=hcUgtoA8/AbJ3tnqa6EQ641r4jSMtIccKNjFORecPSs=;
	b=hSRV3Ri31feddP2eI41hTcbDVJvwk30ifLM+w+PXAZeX/pXgN3m3AxEwGqRxYzayoCoHaB
	EgxSNZY2yKmNkWf8JbrIdcan4izIo1VoUZl0klgNrAEKAyCCSmbdDsI8K4tGCMYg0IV0dV
	3N6wrHWM6BFtVKOO8kld87haV0s1U8CljKzjICDaJMTJvMKQyozpcFNnlAGI6TuZlGjPxp
	hBQsiHFQ9lAl25ri2eY6XMtC9ktpaT0jS4PKaK5uO88UBRL+MVl4RnwooKyqSnMwFxXiTT
	1biFelhj3TVf/Q1ZBPgLl0THyxtpaBISvChJcb7CcaoQfAExKhlmIp5dY0OscQ==
Content-Type: multipart/mixed; boundary="===============7511510158976883514=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-web3: upgrading to 6.8.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104276
Message-Id: <20230805073949.B0DF6C0015E@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:49 +0000 (UTC)

--===============7511510158976883514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-web3* to *6.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-web3-upgrade-6.7.0-6.8.0.patch
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
From 2b8cc59411a876d00a31a6fa5af660a04620a902 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 01:28:23 -0500
Subject: [PATCH] python3-web3: upgrade 6.7.0 -> 6.8.0

---
 .../python/{python3-web3_6.7.0.bb => python3-web3_6.8.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.7.0.bb => python3-web3_6.8.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.7.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.8.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-web3_6.7.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.8.0.bb
index c84263967..3b144e6fc 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.8.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "dc05e4130ed2e1e67a18a6f012cd3095440f37c0b8334038071d5510176debb5"
+SRC_URI[sha256sum] = "5db6ed63bca526a5542d9a84778c8b549199009b9f71079ff53a7b82dadf0d0b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============7511510158976883514==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-web3-upgrade-6.7.0-6.8.0.patch"

From 2b8cc59411a876d00a31a6fa5af660a04620a902 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 01:28:23 -0500
Subject: [PATCH] python3-web3: upgrade 6.7.0 -> 6.8.0

---
 .../python/{python3-web3_6.7.0.bb => python3-web3_6.8.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.7.0.bb => python3-web3_6.8.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.7.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.8.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-web3_6.7.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.8.0.bb
index c84263967..3b144e6fc 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.8.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "dc05e4130ed2e1e67a18a6f012cd3095440f37c0b8334038071d5510176debb5"
+SRC_URI[sha256sum] = "5db6ed63bca526a5542d9a84778c8b549199009b9f71079ff53a7b82dadf0d0b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============7511510158976883514==--

