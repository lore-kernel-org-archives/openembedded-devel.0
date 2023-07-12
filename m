Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689F6EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:32:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.1046.1689139917689126441
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=oK48gDoe;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.195, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1565760005
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139916;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=NaHFwhwf52C//VBAlZm9K7odKzu5k1IcoV/+SJ0sJQY=;
	b=oK48gDoeksTdBdQT+F3/SbgyibDGRXYSnjg20zxqz3WbCe6jMmPeX4tMIqiuHFFwMEj8lT
	uqdnVK1a2N7VBg9VfOQXfiM54ll0wBSx6cjYOUNwQ2BM0WJQ1YpjaQCowdaLWJb4ByTvFW
	W5uuBvAgdPj9Kd5W/9noiJgf2adxgUJcZ2Jy8O7BAWPODFHEFRkH0yNwaa3JhwEyBmTGtY
	3Jt8CON5AP2gHbeKN3dQg1P+QMgdmGA8mDHNExg9uqjWr2LR0sjjZ3CdYgFyigpJkFKfTs
	t1vEdApA7r/PDTOKril3/39ThUEmSkvw9l9uBWmUdqEAKaklCmtXRij76f/K4w==
Content-Type: multipart/mixed; boundary="===============3201164459945601421=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-web3: upgrading to 6.5.0 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103814
Message-Id: <20230712053200.689F6EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:32:00 +0000 (UTC)

--===============3201164459945601421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-web3* to *6.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-web3-upgrade-6.3.0-6.5.0.patch
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
From a0146589c65db3a163693bd6d4c3a17acb971d42 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:31:30 -0500
Subject: [PATCH] python3-web3: upgrade 6.3.0 -> 6.5.0

---
 .../python/{python3-web3_6.3.0.bb => python3-web3_6.5.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.3.0.bb => python3-web3_6.5.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.5.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.5.0.bb
index 088bfd504..2d814de1d 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.5.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "d13f17d18eaacd87f7d233b4b2c70d1579b39573628b71ec996adfcd4dac9cab"
+SRC_URI[sha256sum] = "ebbce3caa0b50015d15a07f17d2a280abbb94a52c6994babb90f3a5482c97712"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============3201164459945601421==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-web3-upgrade-6.3.0-6.5.0.patch"

From a0146589c65db3a163693bd6d4c3a17acb971d42 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:31:30 -0500
Subject: [PATCH] python3-web3: upgrade 6.3.0 -> 6.5.0

---
 .../python/{python3-web3_6.3.0.bb => python3-web3_6.5.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.3.0.bb => python3-web3_6.5.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.5.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.5.0.bb
index 088bfd504..2d814de1d 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.5.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "d13f17d18eaacd87f7d233b4b2c70d1579b39573628b71ec996adfcd4dac9cab"
+SRC_URI[sha256sum] = "ebbce3caa0b50015d15a07f17d2a280abbb94a52c6994babb90f3a5482c97712"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============3201164459945601421==--

