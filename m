Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6817CC07542
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5525.1699083060789137231
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WlwojSZ9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GaICthtQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b993dfd2c-c978ce47-d6d9-4137-adf2-95547297aa47-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083058;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2X4E5Mg3GDSD5pv6Vqv+JWyX/HMP2GBiiF1bvNMxSQo=;
	b=WlwojSZ92KNyjaHe8mxJrEaJgHLgO85hD9Cg55fC9EEgdloWdl9Dde8OluqDXBUT
	Edb+ltVpzgABiv9u9WdZjOiK4qrXuT+klUNML4gSkOGBRx0CCchNyoGlsy8ORVJ2IoD
	V8UXQL2ZRSGKHnMUcOKL8CyBOrDj/WfaDDfG0hts=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083058;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2X4E5Mg3GDSD5pv6Vqv+JWyX/HMP2GBiiF1bvNMxSQo=;
	b=GaICthtQx/44mlFD+CuEUchunonQLnwkuGPFGWnalgGdiGwP2vaDvSUeheHHVG/K
	PquGe7xXp02Ks/lJR0vAgbWE9yjKT9HCsoFQzgtEw2n/gP6EPR2UMtsJaZs14m6dbdC
	XQ6DOl1/w5NhSVoHkTZ4LP7UtZimWeTtz8TxPLeE=
Content-Type: multipart/mixed; boundary="===============6989097092972349431=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] catfish: upgrading to 4.18.0 SUCCEEDED
Message-ID: <0101018b993dfd2c-c978ce47-d6d9-4137-adf2-95547297aa47-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106326

--===============6989097092972349431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *catfish* to *4.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-catfish-upgrade-4.16.3-4.18.0.patch
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
From a6867e60dc922ec186aece97888f4a4c2142b833 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:12:29 +0000
Subject: [PATCH] catfish: upgrade 4.16.3 -> 4.18.0

---
 .../catfish/{catfish_4.16.3.bb => catfish_4.18.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/catfish/{catfish_4.16.3.bb => catfish_4.18.0.bb} (91%)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb b/meta-xfce/recipes-apps/catfish/catfish_4.18.0.bb
similarity index 91%
rename from meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
rename to meta-xfce/recipes-apps/catfish/catfish_4.18.0.bb
index 249c8e1bd..6b9392872 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.18.0.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
 DEPENDS += "python3-distutils-extra-native"
 
-SRC_URI[sha256sum] = "e9a99a62d10981391508dd43f3cbfa2d50a69bd6b7d1eeef7d30ba4c673dcfda"
+SRC_URI[sha256sum] = "fdae9b73cc754a50716bb04b958aa31dbd7e94047068b7207f2ae313a7d58b99"
 
 FILES:${PN} += "${datadir}/metainfo"
 
-- 
2.39.2


--===============6989097092972349431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/catfish/catfish-dbg: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-dbg: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-dev: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-dev: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-doc: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-doc: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-doc: PKGSIZE changed from 28862 to 31644 (+10%)
packages/core2-64-poky-linux/catfish/catfish-locale-af: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-af: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-ar: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-ar: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-ar: PKGSIZE changed from 20324 to 20317 (-0%)
packages/core2-64-poky-linux/catfish/catfish-locale-be: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-be: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-be: PKGSIZE changed from 22552 to 22554 (+0%)
packages/core2-64-poky-linux/catfish/catfish-locale-bg: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-bg: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-bg: PKGSIZE changed from 25764 to 27333 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-ca: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-ca: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-ca: PKGSIZE changed from 18025 to 18028 (+0%)
packages/core2-64-poky-linux/catfish/catfish-locale-cs: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-cs: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-cs: PKGSIZE changed from 17856 to 17855 (-0%)
packages/core2-64-poky-linux/catfish/catfish-locale-da: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-da: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-da: PKGSIZE changed from 18464 to 18390 (-0%)
packages/core2-64-poky-linux/catfish/catfish-locale-de: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-de: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-de: PKGSIZE changed from 19492 to 20638 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-el: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-el: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-el: PKGSIZE changed from 26115 to 28361 (+9%)
packages/core2-64-poky-linux/catfish/catfish-locale-en-au: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-en-au: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-en-au: PKGSIZE changed from 13102 to 13110 (+0%)
packages/core2-64-poky-linux/catfish/catfish-locale-eo: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-eo: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-es: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-es: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-es: PKGSIZE changed from 19888 to 21034 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-et: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-et: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-et: PKGSIZE changed from 10353 to 15892 (+54%)
packages/core2-64-poky-linux/catfish/catfish-locale-eu: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-eu: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-eu: PKGSIZE changed from 18726 to 18755 (+0%)
packages/core2-64-poky-linux/catfish/catfish-locale-fi: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-fi: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-fi: PKGSIZE changed from 12171 to 12170 (-0%)
packages/core2-64-poky-linux/catfish/catfish-locale-fr: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-fr: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-fr: PKGSIZE changed from 20602 to 21823 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-gl: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-gl: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-gl: PKGSIZE changed from 19338 to 19334 (-0%)
packages/core2-64-poky-linux/catfish/catfish-locale-he: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-he: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-he: PKGSIZE changed from 20898 to 22070 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-hr: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-hr: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-hr: PKGSIZE changed from 10131 to 10125 (-0%)
packages/core2-64-poky-linux/catfish/catfish-locale-hu: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-hu: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-hu: PKGSIZE changed from 16295 to 16324 (+0%)
packages/core2-64-poky-linux/catfish/catfish-locale-hy-am: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-hy-am: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-hy-am: PKGSIZE changed from 16966 to 16996 (+0%)
packages/core2-64-poky-linux/catfish/catfish-locale-hye: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-hye: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-hye: PKGSIZE changed from 21195 to 21162 (-0%)
packages/core2-64-poky-linux/catfish/catfish-locale-id: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-id: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-id: PKGSIZE changed from 19035 to 19911 (+5%)
packages/core2-64-poky-linux/catfish/catfish-locale-ie: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-ie: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-ie: PKGSIZE changed from 10163 to 11366 (+12%)
packages/core2-64-poky-linux/catfish/catfish-locale-is: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-is: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-is: PKGSIZE changed from 8014 to 8025 (+0%)
packages/core2-64-poky-linux/catfish/catfish-locale-it: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-it: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-it: PKGSIZE changed from 19330 to 20489 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-ja: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-ja: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-ja: PKGSIZE changed from 21774 to 23113 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-kab: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-kab: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-ko: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-ko: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-ko: PKGSIZE changed from 17662 to 21086 (+19%)
packages/core2-64-poky-linux/catfish/catfish-locale-ku: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-ku: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-lt: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-lt: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-lt: PKGSIZE changed from 19346 to 20475 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-lv: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-lv: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-ml: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-ml: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-ms: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-ms: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-ms: PKGSIZE changed from 16758 to 18929 (+13%)
packages/core2-64-poky-linux/catfish/catfish-locale-nb: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-nb: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-nb: PKGSIZE changed from 17972 to 19039 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-nl: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-nl: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-nl: PKGSIZE changed from 19528 to 20626 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-nn: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-nn: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-nn: PKGSIZE changed from 7416 to 7351 (-1%)
packages/core2-64-poky-linux/catfish/catfish-locale-pl: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-pl: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-pl: PKGSIZE changed from 19403 to 20558 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-pt-br: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-pt-br: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-pt-br: PKGSIZE changed from 18181 to 20574 (+13%)
packages/core2-64-poky-linux/catfish/catfish-locale-pt: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-pt: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-pt: PKGSIZE changed from 19626 to 20792 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-ru: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-ru: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-ru: PKGSIZE changed from 22812 to 26263 (+15%)
packages/core2-64-poky-linux/catfish/catfish-locale-si: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-si: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-sk: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-sk: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-sk: PKGSIZE changed from 12458 to 20688 (+66%)
packages/core2-64-poky-linux/catfish/catfish-locale-sl: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-sl: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-sl: PKGSIZE changed from 17678 to 19106 (+8%)
packages/core2-64-poky-linux/catfish/catfish-locale-sq: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-sq: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-sq: PKGSIZE changed from 20097 to 21233 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-sr: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-sr: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-sr: PKGSIZE changed from 24153 to 25659 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-sv: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-sv: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-sv: PKGSIZE changed from 18084 to 19519 (+8%)
packages/core2-64-poky-linux/catfish/catfish-locale-th: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-th: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-th: PKGSIZE changed from 27630 to 27675 (+0%)
packages/core2-64-poky-linux/catfish/catfish-locale-tr: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-tr: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-tr: PKGSIZE changed from 17714 to 20120 (+14%)
packages/core2-64-poky-linux/catfish/catfish-locale-uk: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-uk: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-uk: PKGSIZE changed from 18541 to 25813 (+39%)
packages/core2-64-poky-linux/catfish/catfish-locale-zh-cn: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-zh-cn: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-zh-cn: PKGSIZE changed from 17590 to 18639 (+6%)
packages/core2-64-poky-linux/catfish/catfish-locale-zh-tw: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-locale-zh-tw: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-locale-zh-tw: PKGSIZE changed from 17547 to 18584 (+6%)
packages/core2-64-poky-linux/catfish/catfish-src: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-src: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish-staticdev: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish-staticdev: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish/catfish: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish/catfish: FILELIST: directory renamed /usr/lib/python3.11/site-packages/catfish-4.16.3.dist-info -> /usr/lib/python3.11/site-packages/catfish-4.18.0.dist-info, added "/usr/lib/python3.11/site-packages/catfish_lib/__pycache__/FiletypeLists.cpython-311.pyc /usr/lib/python3.11/site-packages/catfish_lib/FiletypeLists.py"
packages/core2-64-poky-linux/catfish/catfish: PKGSIZE changed from 992821 to 1061206 (+7%)
packages/core2-64-poky-linux/catfish: PKGV changed from 4.16.3 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/catfish: SRC_URI changed from "http://archive.xfce.org/src/apps/catfish/4.16/catfish-4.16.3.tar.bz2" to "http://archive.xfce.org/src/apps/catfish/4.18/catfish-4.18.0.tar.bz2"
packages/core2-64-poky-linux/catfish: PV changed from "4.16.3" to "4.18.0"
packages/core2-64-poky-linux/catfish: PACKAGES: added "catfish-locale-en-gb catfish-locale-kk"
Changes to packages/core2-64-poky-linux/catfish (sysroot):
  /usr/lib/python3.11/site-packages/catfish-4.16.3.dist-info moved to /usr/lib/python3.11/site-packages/catfish-4.18.0.dist-info
  /usr/lib/python3.11/site-packages/catfish_lib/FiletypeLists.py was added
  /usr/lib/python3.11/site-packages/catfish_lib/__pycache__/FiletypeLists.cpython-311.pyc was added

--===============6989097092972349431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/catfish/catfish-locale-et: PKGSIZE changed from 10353 to 15892 (+54%)
packages/core2-64-poky-linux/catfish/catfish-locale-ie: PKGSIZE changed from 10163 to 11366 (+12%)
packages/core2-64-poky-linux/catfish/catfish-locale-ko: PKGSIZE changed from 17662 to 21086 (+19%)
packages/core2-64-poky-linux/catfish/catfish-locale-ms: PKGSIZE changed from 16758 to 18929 (+13%)
packages/core2-64-poky-linux/catfish/catfish-locale-pt-br: PKGSIZE changed from 18181 to 20574 (+13%)
packages/core2-64-poky-linux/catfish/catfish-locale-ru: PKGSIZE changed from 22812 to 26263 (+15%)
packages/core2-64-poky-linux/catfish/catfish-locale-sk: PKGSIZE changed from 12458 to 20688 (+66%)
packages/core2-64-poky-linux/catfish/catfish-locale-tr: PKGSIZE changed from 17714 to 20120 (+14%)
packages/core2-64-poky-linux/catfish/catfish-locale-uk: PKGSIZE changed from 18541 to 25813 (+39%)
packages/core2-64-poky-linux/catfish/catfish: FILELIST: directory renamed /usr/lib/python3.11/site-packages/catfish-4.16.3.dist-info -> /usr/lib/python3.11/site-packages/catfish-4.18.0.dist-info, added "/usr/lib/python3.11/site-packages/catfish_lib/FiletypeLists.py /usr/lib/python3.11/site-packages/catfish_lib/__pycache__/FiletypeLists.cpython-311.pyc"
packages/core2-64-poky-linux/catfish: PACKAGES: added "catfish-locale-kk catfish-locale-en-gb"
Changes to packages/core2-64-poky-linux/catfish (sysroot):
  /usr/lib/python3.11/site-packages/catfish-4.16.3.dist-info moved to /usr/lib/python3.11/site-packages/catfish-4.18.0.dist-info
  /usr/lib/python3.11/site-packages/catfish_lib/FiletypeLists.py was added
  /usr/lib/python3.11/site-packages/catfish_lib/__pycache__/FiletypeLists.cpython-311.pyc was added

--===============6989097092972349431==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-catfish-upgrade-4.16.3-4.18.0.patch"

RnJvbSBhNjg2N2U2MGRjOTIyZWMxODZhZWNlOTc4ODhmNGE0YzIxNDJiODMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNToxMjoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNh
dGZpc2g6IHVwZ3JhZGUgNC4xNi4zIC0+IDQuMTguMAoKLS0tCiAuLi4vY2F0ZmlzaC97Y2F0Zmlz
aF80LjE2LjMuYmIgPT4gY2F0ZmlzaF80LjE4LjAuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLXhm
Y2UvcmVjaXBlcy1hcHBzL2NhdGZpc2gve2NhdGZpc2hfNC4xNi4zLmJiID0+IGNhdGZpc2hfNC4x
OC4wLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLWFwcHMvY2F0Zmlz
aC9jYXRmaXNoXzQuMTYuMy5iYiBiL21ldGEteGZjZS9yZWNpcGVzLWFwcHMvY2F0ZmlzaC9jYXRm
aXNoXzQuMTguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhLXhmY2Uv
cmVjaXBlcy1hcHBzL2NhdGZpc2gvY2F0ZmlzaF80LjE2LjMuYmIKcmVuYW1lIHRvIG1ldGEteGZj
ZS9yZWNpcGVzLWFwcHMvY2F0ZmlzaC9jYXRmaXNoXzQuMTguMC5iYgppbmRleCAyNDljOGUxYmQu
LjZiOTM5Mjg3MiAxMDA2NDQKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMtYXBwcy9jYXRmaXNoL2Nh
dGZpc2hfNC4xNi4zLmJiCisrKyBiL21ldGEteGZjZS9yZWNpcGVzLWFwcHMvY2F0ZmlzaC9jYXRm
aXNoXzQuMTguMC5iYgpAQCAtOSw3ICs5LDcgQEAgUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0g
ImdvYmplY3QtaW50cm9zcGVjdGlvbi1kYXRhIgogCiBERVBFTkRTICs9ICJweXRob24zLWRpc3R1
dGlscy1leHRyYS1uYXRpdmUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlOWE5OWE2MmQxMDk4
MTM5MTUwOGRkNDNmM2NiZmEyZDUwYTY5YmQ2YjdkMWVlZWY3ZDMwYmE0YzY3M2RjZmRhIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImZkYWU5YjczY2M3NTRhNTA3MTZiYjA0Yjk1OGFhMzFkYmQ3ZTk0
MDQ3MDY4YjcyMDdmMmFlMzEzYTdkNThiOTkiCiAKIEZJTEVTOiR7UE59ICs9ICIke2RhdGFkaXJ9
L21ldGFpbmZvIgogCi0tIAoyLjM5LjIKCg==

--===============6989097092972349431==--

