Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5260C04FE0
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.2173.1691221172066569127
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=nOHTKrbW;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 724FB1BF204
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221170;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=wWBdqCHmKn7ghhLNMXNSuAxnq+u936l1+G+uoPBKt+s=;
	b=nOHTKrbWFsJGQu6STH+gXckGd7dl7ZZDfWuV2vt9h8c0JJgFOHTASy7WC95Pc5sMfKQBAt
	0Em5J30p99HOCoVgyiRgCysK317xPQ0p3Q5QVGDXRqw1kyTS+EHmXz0z6gKHb5Q/2k6MC/
	Aris6RdGsl6GB+i92Qd7M+pXVk5lbc4ME6HlGwBAivugLJnwH8+LG8jVJfIipn1rt+rvVb
	Mz5UCkExpB3jY63SnoSTA3FAVmpcj7rpIakrqGWSKAzWyxT/U2rMF3CuA30uE77Qaim1uW
	mVZo3JOP2+DvOTwZyfcR86KYozPjHf2DCZtk22cz7Qx+WyfNTxhx3EoZ+UaIqw==
Content-Type: multipart/mixed; boundary="===============1914174035703396033=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-rdflib: upgrading to 7.0.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104268
Message-Id: <20230805073939.B5260C04FE0@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:39 +0000 (UTC)

--===============1914174035703396033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-rdflib* to *7.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rdflib-upgrade-6.3.2-7.0.0.patch
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
From fc173b265c69ab9cf094f5d38bac01b4ae5598e7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:36:36 -0500
Subject: [PATCH] python3-rdflib: upgrade 6.3.2 -> 7.0.0

---
 .../python/{python3-rdflib_6.3.2.bb => python3-rdflib_7.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_6.3.2.bb => python3-rdflib_7.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb b/meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
index 1b4bb5a40..952c21011 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=37d489c0cefe52a17e1d5007e196464a"
 
-SRC_URI[sha256sum] = "72af591ff704f4caacea7ecc0c5a9056b8553e0489dd4f35a9bc52dbd41522e0"
+SRC_URI[sha256sum] = "9995eb8569428059b8c1affd26b25eac510d64f5043d9ce8c84e0d0036e995ae"
 
 inherit pypi python_poetry_core
 
-- 
2.25.1


--===============1914174035703396033==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-rdflib-upgrade-6.3.2-7.0.0.patch"

From fc173b265c69ab9cf094f5d38bac01b4ae5598e7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:36:36 -0500
Subject: [PATCH] python3-rdflib: upgrade 6.3.2 -> 7.0.0

---
 .../python/{python3-rdflib_6.3.2.bb => python3-rdflib_7.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_6.3.2.bb => python3-rdflib_7.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb b/meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
index 1b4bb5a40..952c21011 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=37d489c0cefe52a17e1d5007e196464a"
 
-SRC_URI[sha256sum] = "72af591ff704f4caacea7ecc0c5a9056b8553e0489dd4f35a9bc52dbd41522e0"
+SRC_URI[sha256sum] = "9995eb8569428059b8c1affd26b25eac510d64f5043d9ce8c84e0d0036e995ae"
 
 inherit pypi python_poetry_core
 
-- 
2.25.1


--===============1914174035703396033==--

