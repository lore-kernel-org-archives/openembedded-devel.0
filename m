Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CA3EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:29:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.950.1689139779033405731
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=EBd0vLlG;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D139C0005
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139777;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=OH6vbxA+XL5LBzQ/UL2M2uAND7uS+wvVkO3PzXVfH4Y=;
	b=EBd0vLlG+17TAfK6NW+otQqxowTIN2Ah+wWV8WB8JY4e+l5AhRT16245/FMP2e3oKR7KTj
	muOb7i1iwI7j6lYTcA8ubSQ8HmhrRxumwv+tsxFf2MuX5mOJxSCBNiO8bJ2Gjc/k4FYHck
	pdZxTEo3fPxNJteZ2RAuzBV/7p1t4jEJ5n18rpayCT4VNH6WLPGOrB0Pb09MFKF/CGO/6f
	qgKV77P2jsTU1qMT0h0n/Wy6M/+7RHYuFaYKLyOFeaTzjVYzJXwlchKomSdWYZsgelhAoD
	NgfCOJgapf1va2esZUmcq1bNG0TxvYMt3i6+91W12nfp/vI+eCSosLd3mStfgw==
Content-Type: multipart/mixed; boundary="===============1975117399129245176=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-arpeggio: upgrading to 2.0.2 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103741
Message-Id: <20230712052940.86CA3EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:29:40 +0000 (UTC)

--===============1975117399129245176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-arpeggio* to *2.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-arpeggio-upgrade-2.0.0-2.0.2.patch
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
From 2b8cdd0b33270bcac4f996de3e53bac62a131a0d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:35:21 -0500
Subject: [PATCH] python3-arpeggio: upgrade 2.0.0 -> 2.0.2

---
 .../{python3-arpeggio_2.0.0.bb => python3-arpeggio_2.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-arpeggio_2.0.0.bb => python3-arpeggio_2.0.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
index 96d6de6a6..1a48a88c2 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/Arpeggio/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb"
 
-SRC_URI[sha256sum] = "d6b03839019bb8a68785f9292ee6a36b1954eb84b925b84a6b8a5e1e26d3ed3d"
+SRC_URI[sha256sum] = "c790b2b06e226d2dd468e4fbfb5b7f506cec66416031fde1441cf1de2a0ba700"
 
 PYPI_PACKAGE = "Arpeggio"
 inherit pypi setuptools3
-- 
2.25.1


--===============1975117399129245176==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-arpeggio-upgrade-2.0.0-2.0.2.patch"

From 2b8cdd0b33270bcac4f996de3e53bac62a131a0d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:35:21 -0500
Subject: [PATCH] python3-arpeggio: upgrade 2.0.0 -> 2.0.2

---
 .../{python3-arpeggio_2.0.0.bb => python3-arpeggio_2.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-arpeggio_2.0.0.bb => python3-arpeggio_2.0.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
index 96d6de6a6..1a48a88c2 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/Arpeggio/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb"
 
-SRC_URI[sha256sum] = "d6b03839019bb8a68785f9292ee6a36b1954eb84b925b84a6b8a5e1e26d3ed3d"
+SRC_URI[sha256sum] = "c790b2b06e226d2dd468e4fbfb5b7f506cec66416031fde1441cf1de2a0ba700"
 
 PYPI_PACKAGE = "Arpeggio"
 inherit pypi setuptools3
-- 
2.25.1


--===============1975117399129245176==--

