Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB061C0015E
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:38:19 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.2134.1691221096153818563
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=eiUkES43;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D016EC0002
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221094;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=65GgxgumbcH/JRr8uOFt9PgybTCXeMJoDzUhvH0C2HA=;
	b=eiUkES43ZlbPFnTOZeGkmWxMNQjbGd/a1fcBCWM41ezwNcbGBsulQPz/b9593/BOCxVvSl
	rZEqNhphnqpbjZNJYaeVSGU67XIXsWXzK1pBzVXm6oX0LciiVVHBw++WslL2zTVBdLGUQn
	FjQzx0p4WLcZCDeb8zS9XOIsuAEjt9uc/JvFDmkc54c5yoFjAaOYImW1jikl1nWeokXZXF
	X6YLxJRVoVWQZYvm347JF/n1yu0qr53AeOj54rhrJoi6ZyNW0BkVYocjIUGvJNWeAbeMRk
	EfF/SoKwAymdQH232SFYuOiFGZSv3kmlrM13VqUsAKEbNRlUDWRd0C7dKhBfHQ==
Content-Type: multipart/mixed; boundary="===============9057087877260992873=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] sip: upgrading to 6.7.11 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104234
Message-Id: <20230805073819.DB061C0015E@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:38:19 +0000 (UTC)

--===============9057087877260992873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sip* to *6.7.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sip-upgrade-6.7.10-6.7.11.patch
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
From 5b0fca6d7dfa09da6f3bc5f5c6f8ced9529b8d81 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 21:13:22 -0500
Subject: [PATCH] sip: upgrade 6.7.10 -> 6.7.11

---
 meta-oe/recipes-devtools/sip/{sip_6.7.10.bb => sip_6.7.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.7.10.bb => sip_6.7.11.bb} (83%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.7.10.bb b/meta-oe/recipes-devtools/sip/sip_6.7.11.bb
similarity index 83%
rename from meta-oe/recipes-devtools/sip/sip_6.7.10.bb
rename to meta-oe/recipes-devtools/sip/sip_6.7.11.bb
index c141d8f58..66ec979ac 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.7.10.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.7.11.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "398aeb84ee03f3a953947cac70e60d3b02dceba3c4f4dd46c5383e9dbe3936bb"
+SRC_URI[sha256sum] = "f0dc3287a0b172e5664931c87847750d47e4fdcda4fe362b514af8edd655b469"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


--===============9057087877260992873==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-sip-upgrade-6.7.10-6.7.11.patch"

From 5b0fca6d7dfa09da6f3bc5f5c6f8ced9529b8d81 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 21:13:22 -0500
Subject: [PATCH] sip: upgrade 6.7.10 -> 6.7.11

---
 meta-oe/recipes-devtools/sip/{sip_6.7.10.bb => sip_6.7.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.7.10.bb => sip_6.7.11.bb} (83%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.7.10.bb b/meta-oe/recipes-devtools/sip/sip_6.7.11.bb
similarity index 83%
rename from meta-oe/recipes-devtools/sip/sip_6.7.10.bb
rename to meta-oe/recipes-devtools/sip/sip_6.7.11.bb
index c141d8f58..66ec979ac 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.7.10.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.7.11.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "398aeb84ee03f3a953947cac70e60d3b02dceba3c4f4dd46c5383e9dbe3936bb"
+SRC_URI[sha256sum] = "f0dc3287a0b172e5664931c87847750d47e4fdcda4fe362b514af8edd655b469"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


--===============9057087877260992873==--

