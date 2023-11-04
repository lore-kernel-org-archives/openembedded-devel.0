Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDB8C0723F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.5399.1699083060737771572
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WQoK4f02;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AAaVZWxi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b993e02b2-47164026-1f46-4a11-b213-431e7ba2c631-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bgtLjlHaPCSEjaJhtOraXYQn0utjtnprXSM8lor9e6E=;
	b=WQoK4f02XPw9peB5AnzqryBG5TekLlnzHP4Rtlvuo8w1YVpC8yQEcq43B59mOAmd
	KDP1fJi2JR58dleCCdXbNvu1/XyWZeclo8m0Dw5afWujjkX1VD290qxeP40ZJ9LP3Ys
	gbEjvPrwlhxfike2TcTIOsAYisI3zpFuouZZa9PQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bgtLjlHaPCSEjaJhtOraXYQn0utjtnprXSM8lor9e6E=;
	b=AAaVZWxi1hD9p20nZFATBIEI4e8C0P0Jvau3l0oFadqxCUDl9oeegtq0GXQRTIkO
	ZPw+Dhdq+5azOdLHbr0SY6a1UXp+YVc13dp1PJi+rX8xUq0q3ahHF91F2asOTwRLG1I
	YcjZGOu0WZp7Fd3Rg6lYm6Dk+jldZ/RmmavWqfIk=
Content-Type: multipart/mixed; boundary="===============0793871240179792245=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-cpugraph-plugin: upgrading to 1.2.8 SUCCEEDED
Message-ID: <0101018b993e02b2-47164026-1f46-4a11-b213-431e7ba2c631-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106324

--===============0793871240179792245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-cpugraph-plugin* to *1.2.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-cpugraph-plugin-upgrade-1.2.7-1.2.8.patch
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
From 8007c2b36c724f0177e0a6c2e4c68633e7af3f6c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:09:57 +0000
Subject: [PATCH] xfce4-cpugraph-plugin: upgrade 1.2.7 -> 1.2.8

---
 ...-cpugraph-plugin_1.2.7.bb => xfce4-cpugraph-plugin_1.2.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.2.7.bb => xfce4-cpugraph-plugin_1.2.8.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.7.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.8.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.7.bb
rename to meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.8.bb
index e23188d30..8e5817561 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.7.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.8.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "68a651e278ed7186964e455b69b15da77f8d56257e5c3d6adf783b3ee9337405"
+SRC_URI[sha256sum] = "bfb438ce21f37d57241b2596d72aa4bf47587cd5a8833fc30a9599616f75d4bf"
-- 
2.39.2


--===============0793871240179792245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-cpugraph-plugin: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin: PACKAGES: added "xfce4-cpugraph-plugin-locale-en-ca"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-cpugraph-plugin/1.2/xfce4-cpugraph-plugin-1.2.7.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-cpugraph-plugin/1.2/xfce4-cpugraph-plugin-1.2.8.tar.bz2"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
Changes to packages/core2-64-poky-linux/xfce4-cpugraph-plugin (sysroot):
  /usr/share/icons/hicolor/24x24 was added
  /usr/share/icons/hicolor/24x24/apps was added
  /usr/share/icons/hicolor/24x24/apps/org.xfce.panel.cpugraph.png was added
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-dbg: PKGSIZE changed from 2341656 to 2557280 (+9%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-dbg: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-dbg: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-dbg: RRECOMMENDS: added "xfconf-dbg"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-dev: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-dev: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-dev: RRECOMMENDS: added "xfconf-dev"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-doc: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-doc: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ar: PKGSIZE changed from 2978 to 2945 (-1%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ar: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ar: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ast: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ast: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-be: PKGSIZE changed from 5402 to 5271 (-2%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-be: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-be: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-bg: PKGSIZE changed from 5610 to 5868 (+5%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-bg: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-bg: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ca: PKGSIZE changed from 2882 to 4603 (+60%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ca: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ca: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-cs: PKGSIZE changed from 4679 to 4553 (-3%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-cs: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-cs: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-da: PKGSIZE changed from 4338 to 4225 (-3%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-da: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-da: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-de: PKGSIZE changed from 4497 to 4707 (+5%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-de: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-de: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-el: PKGSIZE changed from 2987 to 2870 (-4%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-el: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-el: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-en-au: PKGSIZE changed from 2241 to 2222 (-1%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-en-au: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-en-au: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-en-gb: PKGSIZE changed from 2246 to 4421 (+97%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-en-gb: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-en-gb: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-es: PKGSIZE changed from 4531 to 4490 (-1%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-es: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-es: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-et: PKGSIZE changed from 2583 to 2459 (-5%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-et: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-et: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-eu: PKGSIZE changed from 4332 to 4217 (-3%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-eu: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-eu: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-fi: PKGSIZE changed from 2334 to 2310 (-1%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-fi: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-fi: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-fr: PKGSIZE changed from 4602 to 4906 (+7%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-fr: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-fr: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-gl: PKGSIZE changed from 4050 to 3967 (-2%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-gl: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-gl: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-he: PKGSIZE changed from 5324 to 5473 (+3%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-he: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-he: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hr: PKGSIZE changed from 2491 to 2391 (-4%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hr: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hr: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hu: PKGSIZE changed from 2421 to 2358 (-3%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hu: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hu: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hy-am: PKGSIZE changed from 2886 to 2837 (-2%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hy-am: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hy-am: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hye: PKGSIZE changed from 2880 to 2831 (-2%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hye: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-hye: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-id: PKGSIZE changed from 4274 to 4158 (-3%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-id: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-id: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ie: PKGSIZE changed from 2319 to 2262 (-2%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ie: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ie: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-is: PKGSIZE changed from 2323 to 2292 (-1%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-is: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-is: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-it: PKGSIZE changed from 4396 to 4709 (+7%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-it: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-it: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ja: PKGSIZE changed from 4618 to 4844 (+5%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ja: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ja: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-kk: PKGSIZE changed from 2682 to 2656 (-1%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-kk: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-kk: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ko: PKGSIZE changed from 3977 to 4509 (+13%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ko: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ko: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-lt: PKGSIZE changed from 4620 to 4824 (+4%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-lt: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-lt: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-lv: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-lv: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ms: PKGSIZE changed from 4233 to 4108 (-3%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ms: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ms: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-nb: PKGSIZE changed from 4272 to 4468 (+5%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-nb: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-nb: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-nl: PKGSIZE changed from 4382 to 4594 (+5%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-nl: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-nl: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-oc: PKGSIZE changed from 2443 to 2357 (-4%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-oc: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-oc: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-pa: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-pa: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-pl: PKGSIZE changed from 4664 to 4901 (+5%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-pl: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-pl: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-pt-br: PKGSIZE changed from 4448 to 4706 (+6%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-pt-br: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-pt-br: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-pt: PKGSIZE changed from 4530 to 4726 (+4%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-pt: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-pt: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ro: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ro: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ru: PKGSIZE changed from 5791 to 6100 (+5%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ru: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ru: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sk: PKGSIZE changed from 4636 to 4765 (+3%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sk: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sk: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sl: PKGSIZE changed from 4459 to 4617 (+4%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sl: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sl: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sq: PKGSIZE changed from 4203 to 4421 (+5%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sq: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sq: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sr: PKGSIZE changed from 5419 to 5702 (+5%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sr: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sr: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sv: PKGSIZE changed from 4330 to 4505 (+4%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sv: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-sv: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-th: PKGSIZE changed from 5502 to 5417 (-2%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-th: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-th: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-tr: PKGSIZE changed from 4441 to 4574 (+3%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-tr: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-tr: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ug: PKGSIZE changed from 2597 to 2502 (-4%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ug: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ug: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-uk: PKGSIZE changed from 5847 to 5978 (+2%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-uk: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-uk: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ur-pk: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ur-pk: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ur: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ur: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-vi: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-vi: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-zh-cn: PKGSIZE changed from 4114 to 4277 (+4%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-zh-cn: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-zh-cn: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-zh-tw: PKGSIZE changed from 4095 to 4319 (+5%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-zh-tw: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-zh-tw: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-src: PKGSIZE changed from 168025 to 183240 (+9%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-src: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-src: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-staticdev: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-staticdev: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin: PKGSIZE changed from 220245 to 235756 (+7%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin: FILELIST: added "/usr/share/icons/hicolor/24x24/apps/org.xfce.panel.cpugraph.png"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin: RDEPENDS: added "xfconf (['>= 4.18.0'])"

--===============0793871240179792245==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-cpugraph-plugin-upgrade-1.2.7-1.2.8.patch"

RnJvbSA4MDA3YzJiMzZjNzI0ZjAxNzdlMGE2YzJlNGM2ODYzM2U3YWYzZjZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjowOTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LWNwdWdyYXBoLXBsdWdpbjogdXBncmFkZSAxLjIuNyAtPiAxLjIuOAoKLS0tCiAuLi4tY3B1
Z3JhcGgtcGx1Z2luXzEuMi43LmJiID0+IHhmY2U0LWNwdWdyYXBoLXBsdWdpbl8xLjIuOC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL2NwdWdyYXBoL3t4ZmNlNC1jcHVn
cmFwaC1wbHVnaW5fMS4yLjcuYmIgPT4geGZjZTQtY3B1Z3JhcGgtcGx1Z2luXzEuMi44LmJifSAo
NzYlKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvY3B1Z3Jh
cGgveGZjZTQtY3B1Z3JhcGgtcGx1Z2luXzEuMi43LmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMtcGFu
ZWwtcGx1Z2lucy9jcHVncmFwaC94ZmNlNC1jcHVncmFwaC1wbHVnaW5fMS4yLjguYmIKc2ltaWxh
cml0eSBpbmRleCA3NiUKcmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lu
cy9jcHVncmFwaC94ZmNlNC1jcHVncmFwaC1wbHVnaW5fMS4yLjcuYmIKcmVuYW1lIHRvIG1ldGEt
eGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvY3B1Z3JhcGgveGZjZTQtY3B1Z3JhcGgtcGx1Z2lu
XzEuMi44LmJiCmluZGV4IGUyMzE4OGQzMC4uOGU1ODE3NTYxIDEwMDY0NAotLS0gYS9tZXRhLXhm
Y2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL2NwdWdyYXBoL3hmY2U0LWNwdWdyYXBoLXBsdWdpbl8x
LjIuNy5iYgorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL2NwdWdyYXBoL3hm
Y2U0LWNwdWdyYXBoLXBsdWdpbl8xLjIuOC5iYgpAQCAtNSw0ICs1LDQgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NDE1NjU0ZjU5ZDhmYTcwZmU0ZWFjMmMzZjg2Yzhm
NWUiCiAKIGluaGVyaXQgeGZjZS1wYW5lbC1wbHVnaW4KIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjY4YTY1MWUyNzhlZDcxODY5NjRlNDU1YjY5YjE1ZGE3N2Y4ZDU2MjU3ZTVjM2Q2YWRmNzgzYjNl
ZTkzMzc0MDUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmZiNDM4Y2UyMWYzN2Q1NzI0MWIyNTk2
ZDcyYWE0YmY0NzU4N2NkNWE4ODMzZmMzMGE5NTk5NjE2Zjc1ZDRiZiIKLS0gCjIuMzkuMgoK

--===============0793871240179792245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-cpugraph-plugin: PACKAGES: added "xfce4-cpugraph-plugin-locale-en-ca"
Changes to packages/core2-64-poky-linux/xfce4-cpugraph-plugin (sysroot):
  /usr/share/icons/hicolor/24x24 was added
  /usr/share/icons/hicolor/24x24/apps was added
  /usr/share/icons/hicolor/24x24/apps/org.xfce.panel.cpugraph.png was added
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-dbg: RRECOMMENDS: added "xfconf-dbg"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-dev: RRECOMMENDS: added "xfconf-dev"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ca: PKGSIZE changed from 2882 to 4603 (+60%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-en-gb: PKGSIZE changed from 2246 to 4421 (+97%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin-locale-ko: PKGSIZE changed from 3977 to 4509 (+13%)
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin: RDEPENDS: added "xfconf (['>= 4.18.0'])"
packages/core2-64-poky-linux/xfce4-cpugraph-plugin/xfce4-cpugraph-plugin: FILELIST: added "/usr/share/icons/hicolor/24x24/apps/org.xfce.panel.cpugraph.png"

--===============0793871240179792245==--

