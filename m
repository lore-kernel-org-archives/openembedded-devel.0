Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA3BC001DB
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.5390.1699083059847365898
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Qh5DEBX1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Os+00pRk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b993e0068-ef68c7ff-0b54-49ec-9afa-9bbe7088099b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YKKDaFXYbIWoHi6ZW4Zoju3bW8w4eBspHF16E8wE99s=;
	b=Qh5DEBX1umiABcOB/T2WUHojnXsSMQS0BK/GbtQshSibg5221e+yns+0zYkg13xG
	eUmb62ydpOFEwsVFo2sMHnrLOV2d6BpuFi7spXMJy28qp/bgXS//MU1Tl7noVQ7tDXe
	vjKljiomrXZ1A8WCrdYoMackVFAsbpUlUP6FUZuQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YKKDaFXYbIWoHi6ZW4Zoju3bW8w4eBspHF16E8wE99s=;
	b=Os+00pRktnt7lp8lPMD0SysCETFPvaqnapQnboUqwri8jVvoMCl3lDPNkFrAzgl7
	p5Ytv8v39u7hjwJ7bCDXTWaUOwYQB1TNJ/fwF5l3WCXQRbwmto3gyWdUOPQzwnRdEja
	hbCa67TDzN5cDD17S3kjr907ZgMxCNrd9xfNVpAk=
Content-Type: multipart/mixed; boundary="===============6688577230632837781=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] mousepad: upgrading to 0.6.1 SUCCEEDED
Message-ID: <0101018b993e0068-ef68c7ff-0b54-49ec-9afa-9bbe7088099b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106306

--===============6688577230632837781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mousepad* to *0.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mousepad-upgrade-0.5.9-0.6.1.patch
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
From 607a48508d0fb6db11c0d7bfa9230b00508fbe1b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:33:05 +0000
Subject: [PATCH] mousepad: upgrade 0.5.9 -> 0.6.1

---
 .../mousepad/{mousepad_0.5.9.bb => mousepad_0.6.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.5.9.bb => mousepad_0.6.1.bb} (84%)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.9.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb
similarity index 84%
rename from meta-xfce/recipes-apps/mousepad/mousepad_0.5.9.bb
rename to meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb
index 1be015bfb..dc75a4b22 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.9.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "gtk+3 gtksourceview4 xfconf xfce4-dev-tools-native"
 
 inherit xfce-app gsettings mime-xdg
 
-SRC_URI[sha256sum] = "f108a8c167ec5727266ab67666f10dbd60e972d56ea03944302fdabb2167f473"
+SRC_URI[sha256sum] = "560c5436c7bc7de33fbf3e9f6cc545280772ad898dfb73257d86533880ffff36"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[spell] = "--enable-plugin-gspell,--disable-plugin-gspell,gspell"
-- 
2.39.2


--===============6688577230632837781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mousepad: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad: SRC_URI changed from "http://archive.xfce.org/src/apps/mousepad/0.5/mousepad-0.5.9.tar.bz2" to "http://archive.xfce.org/src/apps/mousepad/0.6/mousepad-0.6.1.tar.bz2"
packages/core2-64-poky-linux/mousepad: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-dbg: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-dbg: PKGSIZE changed from 939568 to 952304 (+1%)
packages/core2-64-poky-linux/mousepad/mousepad-dbg: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-dev: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-dev: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-doc: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-doc: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-ar: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-ar: PKGSIZE changed from 21601 to 21539 (-0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-ar: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-ast: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-ast: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-be: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-be: PKGSIZE changed from 35262 to 34801 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-be: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-bg: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-bg: PKGSIZE changed from 42764 to 42956 (+0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-bg: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-ca: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-ca: PKGSIZE changed from 26783 to 26518 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-ca: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-cs: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-cs: PKGSIZE changed from 28867 to 30859 (+7%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-cs: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-da: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-da: PKGSIZE changed from 31617 to 31234 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-da: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-de: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-de: PKGSIZE changed from 33263 to 33428 (+0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-de: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-el: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-el: PKGSIZE changed from 39679 to 43271 (+9%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-el: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-en-au: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-en-au: PKGSIZE changed from 18195 to 18171 (-0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-en-au: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-en-gb: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-en-gb: PKGSIZE changed from 18219 to 18174 (-0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-en-gb: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-es: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-es: PKGSIZE changed from 33596 to 33206 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-es: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-et: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-et: PKGSIZE changed from 32473 to 32340 (-0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-et: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-eu: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-eu: PKGSIZE changed from 30625 to 30222 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-eu: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-fa-ir: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-fa-ir: PKGSIZE changed from 18611 to 19128 (+3%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-fa-ir: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-fi: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-fi: PKGSIZE changed from 20586 to 29409 (+43%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-fi: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-fr: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-fr: PKGSIZE changed from 34043 to 34454 (+1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-fr: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-gl: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-gl: PKGSIZE changed from 30417 to 30006 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-gl: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-he: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-he: PKGSIZE changed from 33969 to 34827 (+3%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-he: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-hr: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-hr: PKGSIZE changed from 21686 to 21513 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-hr: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-hu: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-hu: PKGSIZE changed from 20465 to 24744 (+21%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-hu: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-hy-am: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-hy-am: PKGSIZE changed from 23127 to 23083 (-0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-hy-am: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-hye: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-hye: PKGSIZE changed from 24254 to 24084 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-hye: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-id: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-id: PKGSIZE changed from 29805 to 29386 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-id: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-ie: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-ie: PKGSIZE changed from 19640 to 19474 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-ie: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-is: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-is: PKGSIZE changed from 18682 to 18635 (-0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-is: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-it: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-it: PKGSIZE changed from 32923 to 33198 (+1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-it: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-ja: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-ja: PKGSIZE changed from 36311 to 36443 (+0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-ja: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-kk: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-kk: PKGSIZE changed from 25837 to 40392 (+56%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-kk: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-ko: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-ko: PKGSIZE changed from 26312 to 33378 (+27%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-ko: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-lt: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-lt: PKGSIZE changed from 32027 to 33279 (+4%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-lt: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-ms: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-ms: PKGSIZE changed from 18901 to 18767 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-ms: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-nb: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-nb: PKGSIZE changed from 31205 to 31343 (+0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-nb: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-nl: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-nl: PKGSIZE changed from 32259 to 32472 (+1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-nl: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-nn: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-nn: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-oc: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-oc: PKGSIZE changed from 16483 to 16912 (+3%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-oc: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-pl: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-pl: PKGSIZE changed from 32928 to 33141 (+1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-pl: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-pt-br: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-pt-br: PKGSIZE changed from 31374 to 32433 (+3%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-pt-br: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-pt: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-pt: PKGSIZE changed from 32921 to 33199 (+1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-pt: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-ro: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-ro: PKGSIZE changed from 15834 to 15761 (-0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-ro: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-ru: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-ru: PKGSIZE changed from 39982 to 42318 (+6%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-ru: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-sk: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-sk: PKGSIZE changed from 29383 to 29186 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-sk: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-sl: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-sl: PKGSIZE changed from 31800 to 31948 (+0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-sl: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-sq: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-sq: PKGSIZE changed from 33181 to 33310 (+0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-sq: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-sr: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-sr: PKGSIZE changed from 39412 to 41034 (+4%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-sr: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-sv: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-sv: PKGSIZE changed from 30362 to 31386 (+3%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-sv: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-te: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-te: PKGSIZE changed from 17084 to 8728 (-49%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-te: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-th: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-th: PKGSIZE changed from 43547 to 43051 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-th: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-tr: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-tr: PKGSIZE changed from 32070 to 32236 (+1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-tr: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-ug: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-ug: PKGSIZE changed from 19100 to 19002 (-1%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-ug: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-uk: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-uk: PKGSIZE changed from 34422 to 41248 (+20%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-uk: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-zh-cn: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-zh-cn: PKGSIZE changed from 30172 to 30296 (+0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-zh-cn: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-locale-zh-tw: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-locale-zh-tw: PKGSIZE changed from 30349 to 30490 (+0%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-zh-tw: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-src: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-src: PKGSIZE changed from 1126640 to 1179843 (+5%)
packages/core2-64-poky-linux/mousepad/mousepad-src: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad-staticdev: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad-staticdev: PV changed from "0.5.9" to "0.6.1"
packages/core2-64-poky-linux/mousepad/mousepad: FILELIST: removed "/usr/share/polkit-1/actions/org.xfce.mousepad.policy"
packages/core2-64-poky-linux/mousepad/mousepad: PKGV changed from 0.5.9 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/mousepad/mousepad: PKGSIZE changed from 579459 to 594503 (+3%)
packages/core2-64-poky-linux/mousepad/mousepad: PV changed from "0.5.9" to "0.6.1"
Changes to packages/core2-64-poky-linux/mousepad (sysroot):
  /usr/share/polkit-1 was removed
  /usr/share/polkit-1/actions was removed
  /usr/share/polkit-1/actions/org.xfce.mousepad.policy was removed

--===============6688577230632837781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4892 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 95 recipes from the core2-64 sysroot...done.
Removing 100 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:1e39a461be5f9d1b51126057ef1932a8b655fddb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 866 Local 866 Mirrors 0 Missed 0 Current 302 (100% match, 100% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 303 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb:do_create_runtime_spdx_setscene)
NOTE: Running setscene task 304 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 305 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 306 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 307 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 309 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 313 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 314 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe mousepad-0.6.1-r0: task do_create_runtime_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mousepad-0.6.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe mousepad-0.6.1-r0: task do_package_qa_setscene: Started
NOTE: recipe mousepad-0.6.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe mousepad-0.6.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mousepad-0.6.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe mousepad-0.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe mousepad-0.6.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe mousepad-0.6.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe mousepad-0.6.1-r0: task do_create_runtime_spdx_setscene: Succeeded
NOTE: Running setscene task 495 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mousepad-0.6.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mousepad-0.6.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mousepad-0.6.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe mousepad-0.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 497 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe mousepad-0.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mousepad-0.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 503 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mousepad-0.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mousepad-0.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 658 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe mousepad-0.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtksourceview4-4.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtksourceview4-4.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mousepad-0.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xfconf-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa_setscene)
NOTE: recipe gtksourceview4-4.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 683 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfce4util-4.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtksourceview4-4.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe xfconf-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtksourceview4-4.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtksourceview4-4.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/libxfce4util/4.18.1/temp/log.do_packagedata_setscene.1905299
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 688 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_package_setscene)
NOTE: recipe libxfce4util-4.18.1-r0: task do_package_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 690 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 691 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 709 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 735 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 738 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 742 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 762 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 764 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 765 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 772 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 783 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 785 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 789 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 790 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 792 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 798 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 809 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 815 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 820 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 822 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 825 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 830 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 831 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 833 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 841 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 843 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 848 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 854 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 857 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 862 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 864 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 870 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 881 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 882 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 884 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 891 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 893 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 897 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 899 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 902 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 903 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 907 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 912 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 914 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 915 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 917 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 919 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 927 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 932 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 934 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 937 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 939 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 940 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 942 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 944 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 957 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 958 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 961 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 963 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 965 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 966 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 972 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 973 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 974 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 977 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 985 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 986 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 987 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 988 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 989 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 996 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1005 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1007 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1010 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1012 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1014 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1015 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1017 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1019 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1022 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1023 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1025 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1029 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1031 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1033 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1035 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1041 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1043 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1044 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1046 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1047 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1049 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1051 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1053 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1054 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1057 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1058 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1059 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1061 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1063 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1065 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1066 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1067 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1069 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1071 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1072 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1073 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1075 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1077 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1078 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1079 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1081 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1083 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1086 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1088 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1091 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1092 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1093 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1096 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1099 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1102 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1104 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1105 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1107 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1109 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1110 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1120 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1122 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1123 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1125 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1127 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1128 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1130 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1131 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1133 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1135 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1136 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1137 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1138 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1140 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1142 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1149 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1151 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1157 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1162 of 1168 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3109 of 3219 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_packagedata)
NOTE: recipe libxfce4util-4.18.1-r0: task do_packagedata: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_packagedata: Succeeded
NOTE: Running noexec task 3219 of 3219 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3219 tasks of which 3217 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 72 ERROR messages, returning a non-zero exit code.
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-src went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-dbg went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-staticdev went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-dev went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-doc went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-am went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ar went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ast went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-az went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-be went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-bg went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-bn went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ca went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-cs went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-cy went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-da went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-de went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-el went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-en-au went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-en-gb went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-es went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-et went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-eu went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-fi went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-fr went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-gl went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-he went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-hi went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-hr went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-hu went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-hy went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-hy-am went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-hye went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-id went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ie went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-is went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-it went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ja went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ka went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-kk went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ko went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-lt went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-lv went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ms went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-nb went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-nl went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-nn went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-oc went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-pa went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-pl went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-pt went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-pt-br went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ro went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ru went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-si went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-sk went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-sl went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-sq went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-sr went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-sv went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-th went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-tr went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ug went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-uk went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ur went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-ur-pk went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-uz went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-zh-cn went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-zh-hk went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4util-locale-zh-tw went backwards which would break package feeds (from 0:4.19.2-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: libxfce4util-4.18.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6688577230632837781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mousepad/mousepad-locale-fi: PKGSIZE changed from 20586 to 29409 (+43%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-hu: PKGSIZE changed from 20465 to 24744 (+21%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-kk: PKGSIZE changed from 25837 to 40392 (+56%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-ko: PKGSIZE changed from 26312 to 33378 (+27%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-te: PKGSIZE changed from 17084 to 8728 (-49%)
packages/core2-64-poky-linux/mousepad/mousepad-locale-uk: PKGSIZE changed from 34422 to 41248 (+20%)
packages/core2-64-poky-linux/mousepad/mousepad: FILELIST: removed "/usr/share/polkit-1/actions/org.xfce.mousepad.policy"
Changes to packages/core2-64-poky-linux/mousepad (sysroot):
  /usr/share/polkit-1 was removed
  /usr/share/polkit-1/actions was removed
  /usr/share/polkit-1/actions/org.xfce.mousepad.policy was removed

--===============6688577230632837781==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mousepad-upgrade-0.5.9-0.6.1.patch"

RnJvbSA2MDdhNDg1MDhkMGZiNmRiMTFjMGQ3YmZhOTIzMGIwMDUwOGZiZTFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNTozMzowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1v
dXNlcGFkOiB1cGdyYWRlIDAuNS45IC0+IDAuNi4xCgotLS0KIC4uLi9tb3VzZXBhZC97bW91c2Vw
YWRfMC41LjkuYmIgPT4gbW91c2VwYWRfMC42LjEuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEteGZj
ZS9yZWNpcGVzLWFwcHMvbW91c2VwYWQve21vdXNlcGFkXzAuNS45LmJiID0+IG1vdXNlcGFkXzAu
Ni4xLmJifSAoODQlKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLWFwcHMvbW91c2Vw
YWQvbW91c2VwYWRfMC41LjkuYmIgYi9tZXRhLXhmY2UvcmVjaXBlcy1hcHBzL21vdXNlcGFkL21v
dXNlcGFkXzAuNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFtZSBmcm9tIG1ldGEteGZj
ZS9yZWNpcGVzLWFwcHMvbW91c2VwYWQvbW91c2VwYWRfMC41LjkuYmIKcmVuYW1lIHRvIG1ldGEt
eGZjZS9yZWNpcGVzLWFwcHMvbW91c2VwYWQvbW91c2VwYWRfMC42LjEuYmIKaW5kZXggMWJlMDE1
YmZiLi5kYzc1YTRiMjIgMTAwNjQ0Ci0tLSBhL21ldGEteGZjZS9yZWNpcGVzLWFwcHMvbW91c2Vw
YWQvbW91c2VwYWRfMC41LjkuYmIKKysrIGIvbWV0YS14ZmNlL3JlY2lwZXMtYXBwcy9tb3VzZXBh
ZC9tb3VzZXBhZF8wLjYuMS5iYgpAQCAtNyw3ICs3LDcgQEAgREVQRU5EUyA9ICJndGsrMyBndGtz
b3VyY2V2aWV3NCB4ZmNvbmYgeGZjZTQtZGV2LXRvb2xzLW5hdGl2ZSIKIAogaW5oZXJpdCB4ZmNl
LWFwcCBnc2V0dGluZ3MgbWltZS14ZGcKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYxMDhhOGMx
NjdlYzU3MjcyNjZhYjY3NjY2ZjEwZGJkNjBlOTcyZDU2ZWEwMzk0NDMwMmZkYWJiMjE2N2Y0NzMi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTYwYzU0MzZjN2JjN2RlMzNmYmYzZTlmNmNjNTQ1Mjgw
NzcyYWQ4OThkZmI3MzI1N2Q4NjUzMzg4MGZmZmYzNiIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiIK
IFBBQ0tBR0VDT05GSUdbc3BlbGxdID0gIi0tZW5hYmxlLXBsdWdpbi1nc3BlbGwsLS1kaXNhYmxl
LXBsdWdpbi1nc3BlbGwsZ3NwZWxsIgotLSAKMi4zOS4yCgo=

--===============6688577230632837781==--

