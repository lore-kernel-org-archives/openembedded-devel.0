Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9046AC07545
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.5400.1699083060778957985
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D9Uz2W3i;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rsIeqBOM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b993e0310-a518a95d-8346-424b-9842-caccf16cac07-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OPf9AKC39cg+I2FIXlVdtof+uaCOkZnYGQsBIDDvx9U=;
	b=D9Uz2W3icF4+oxYW10+0Fd9OUc20nHQmKqgEbC3wirdwy+2MZQkqHOyDlmd876X8
	GNHBQOqRCZwW0n1KPLCIjkL0c+p59gk36clTawHSu4goeMhFK4VJqOPkZRNbUmpuYFI
	pvZYJWGGBG4wxKlyb7/hxDghxBosGR9D/zbUh9cU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OPf9AKC39cg+I2FIXlVdtof+uaCOkZnYGQsBIDDvx9U=;
	b=rsIeqBOMrk87sumDhyIrfSQPrZ56AP83k4rZkW67tFjqpZSZr/cmGcJHPQ5CzsgN
	7w2MNPd07VLriF8wAyB3kT+NDyZVMFmeq27+SEfNsEmur6YgLIzKep64rxvgiraljIV
	0LwYgbmlq8kqy8rEauAzaWJ2aiX2SGqJ+aozhbo8=
Content-Type: multipart/mixed; boundary="===============1760019046310268381=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-fsguard-plugin: upgrading to 1.1.3 SUCCEEDED
Message-ID: <0101018b993e0310-a518a95d-8346-424b-9842-caccf16cac07-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106328

--===============1760019046310268381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-fsguard-plugin* to *1.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-fsguard-plugin-upgrade-1.1.2-1.1.3.patch
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
From 0b44c5dfe24662139be18cf066ac38e6d6d53fd0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:18:13 +0000
Subject: [PATCH] xfce4-fsguard-plugin: upgrade 1.1.2 -> 1.1.3

---
 ...e4-fsguard-plugin_1.1.2.bb => xfce4-fsguard-plugin_1.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.1.2.bb => xfce4-fsguard-plugin_1.1.3.bb} (79%)

diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb
similarity index 79%
rename from meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb
rename to meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb
index 5585a4f0a..380d2e19e 100644
--- a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb
+++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3434d79d62df09abf5f78bb76d6cd21b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "67d8e6a219a7117c59693adbc59c39a6eba31e3f18a5499189ef4ef28b554105"
+SRC_URI[sha256sum] = "84ef8bb4752292d64c0ef101badf7b14448790bfa0a85de644dbfa22986ec258"
-- 
2.39.2


--===============1760019046310268381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-fsguard-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-fsguard-plugin/1.1/xfce4-fsguard-plugin-1.1.2.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-fsguard-plugin/1.1/xfce4-fsguard-plugin-1.1.3.tar.bz2"
packages/core2-64-poky-linux/xfce4-fsguard-plugin: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-dbg: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-dbg: PKGSIZE changed from 54256 to 54976 (+1%)
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-dbg: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-dev: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-dev: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-doc: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-doc: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ar: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ar: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ast: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ast: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-be: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-be: PKGSIZE changed from 2163 to 2165 (+0%)
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-be: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-bg: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-bg: PKGSIZE changed from 2236 to 2277 (+2%)
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-bg: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ca: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ca: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-cs: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-cs: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-da: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-da: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-de: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-de: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-el: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-el: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-en-au: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-en-au: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-en-ca: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-en-ca: PKGSIZE changed from 1695 to 1685 (-1%)
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-en-ca: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-en-gb: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-en-gb: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-es: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-es: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-et: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-et: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-eu: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-eu: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-fi: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-fi: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-fr: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-fr: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-gl: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-gl: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-he: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-he: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-hr: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-hr: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-hu: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-hu: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-hye: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-hye: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-id: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-id: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ie: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ie: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-is: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-is: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-it: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-it: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ja: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ja: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-kk: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-kk: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ko: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ko: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-lt: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-lt: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-lv: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-lv: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ms: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ms: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-nb: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-nb: PKGSIZE changed from 1711 to 1700 (-1%)
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-nb: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-nl: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-nl: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-nn: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-nn: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-oc: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-oc: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-pa: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-pa: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-pl: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-pl: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-pt-br: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-pt-br: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-pt: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-pt: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ru: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ru: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-sk: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-sk: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-sl: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-sl: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-sq: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-sq: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-sr: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-sr: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-sv: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-sv: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-th: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-th: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-tr: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-tr: PKGSIZE changed from 1761 to 1768 (+0%)
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-tr: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ug: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ug: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-uk: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-uk: PKGSIZE changed from 2490 to 2489 (-0%)
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-uk: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ur-pk: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ur-pk: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ur: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-ur: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-vi: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-vi: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-zh-cn: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-zh-cn: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-zh-tw: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-locale-zh-tw: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-src: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-src: PKGSIZE changed from 31696 to 32092 (+1%)
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-src: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-staticdev: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin-staticdev: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin: PKGSIZE changed from 153582 to 153569 (-0%)
packages/core2-64-poky-linux/xfce4-fsguard-plugin/xfce4-fsguard-plugin: PV changed from "1.1.2" to "1.1.3"

--===============1760019046310268381==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-fsguard-plugin-upgrade-1.1.2-1.1.3.patch"

RnJvbSAwYjQ0YzVkZmUyNDY2MjEzOWJlMThjZjA2NmFjMzhlNmQ2ZDUzZmQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjoxODoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LWZzZ3VhcmQtcGx1Z2luOiB1cGdyYWRlIDEuMS4yIC0+IDEuMS4zCgotLS0KIC4uLmU0LWZz
Z3VhcmQtcGx1Z2luXzEuMS4yLmJiID0+IHhmY2U0LWZzZ3VhcmQtcGx1Z2luXzEuMS4zLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvZnNndWFyZC97eGZjZTQtZnNndWFy
ZC1wbHVnaW5fMS4xLjIuYmIgPT4geGZjZTQtZnNndWFyZC1wbHVnaW5fMS4xLjMuYmJ9ICg3OSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9mc2d1YXJkL3hm
Y2U0LWZzZ3VhcmQtcGx1Z2luXzEuMS4yLmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1
Z2lucy9mc2d1YXJkL3hmY2U0LWZzZ3VhcmQtcGx1Z2luXzEuMS4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggNzklCnJlbmFtZSBmcm9tIG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvZnNndWFy
ZC94ZmNlNC1mc2d1YXJkLXBsdWdpbl8xLjEuMi5iYgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lw
ZXMtcGFuZWwtcGx1Z2lucy9mc2d1YXJkL3hmY2U0LWZzZ3VhcmQtcGx1Z2luXzEuMS4zLmJiCmlu
ZGV4IDU1ODVhNGYwYS4uMzgwZDJlMTllIDEwMDY0NAotLS0gYS9tZXRhLXhmY2UvcmVjaXBlcy1w
YW5lbC1wbHVnaW5zL2ZzZ3VhcmQveGZjZTQtZnNndWFyZC1wbHVnaW5fMS4xLjIuYmIKKysrIGIv
bWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9mc2d1YXJkL3hmY2U0LWZzZ3VhcmQtcGx1
Z2luXzEuMS4zLmJiCkBAIC01LDQgKzUsNCBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HO21kNT0zNDM0ZDc5ZDYyZGYwOWFiZjVmNzhiYjc2ZDZjZDIxYiIKIAogaW5oZXJpdCB4
ZmNlLXBhbmVsLXBsdWdpbgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjdkOGU2YTIxOWE3MTE3
YzU5NjkzYWRiYzU5YzM5YTZlYmEzMWUzZjE4YTU0OTkxODllZjRlZjI4YjU1NDEwNSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4NGVmOGJiNDc1MjI5MmQ2NGMwZWYxMDFiYWRmN2IxNDQ0ODc5MGJm
YTBhODVkZTY0NGRiZmEyMjk4NmVjMjU4IgotLSAKMi4zOS4yCgo=

--===============1760019046310268381==--

