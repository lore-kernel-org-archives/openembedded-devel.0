Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B84C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5517.1699083060413892651
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HzXho0e/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UKLiA8U6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b993e03ef-2838cc5d-241a-4af5-87bb-05ececa7251b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IoWAGmGviCAV06xVwZ4pFlGa4QNTTz7cSsCTFWXf6a8=;
	b=HzXho0e/mHFmzcRkfVGCoYVYd2PQYAVennsB3J+300baqD2ygJlZx16HGCJxJoCM
	yVW5JDcDkiD0zH297KIpK5E/+vytZTztoD3Neq4sMXVhN8M5tTII9+KQp4vuvv+D+R/
	K8w947ZdN/rPNLgMsAtt9UHyo0JTOEa/l/dnmKQ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IoWAGmGviCAV06xVwZ4pFlGa4QNTTz7cSsCTFWXf6a8=;
	b=UKLiA8U6emZ+zv9yQ35XecK6URKC585XZBqDGPpotwgPmCBWSrIEybVjT5C+iwrn
	EMbN5Uvfl9V9RLdI4EUxSMrPSbCQVA6H3y1UbIobCCm91LnEqo6mUP3fu6kunsd/wZb
	WUQO7ebnDLgTWnT8pvJMeXZUHQ51DMvI0e2vNY8k=
Content-Type: multipart/mixed; boundary="===============7829805376200590766=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-pulseaudio-plugin: upgrading to 0.4.8 SUCCEEDED
Message-ID: <0101018b993e03ef-2838cc5d-241a-4af5-87bb-05ececa7251b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106320

--===============7829805376200590766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-pulseaudio-plugin* to *0.4.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-pulseaudio-plugin-upgrade-0.4.3-0.4.8.patch
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
From 2649deb0d0bf57af2b3fda2a7c1c711fe9d054e5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:45:11 +0000
Subject: [PATCH] xfce4-pulseaudio-plugin: upgrade 0.4.3 -> 0.4.8

---
 ...eaudio-plugin_0.4.3.bb => xfce4-pulseaudio-plugin_0.4.8.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.4.3.bb => xfce4-pulseaudio-plugin_0.4.8.bb} (74%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.3.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.8.bb
similarity index 74%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.3.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.8.bb
index 5168efe1f..c01b4966f 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.3.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.8.bb
@@ -8,8 +8,7 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "dbus-glib pulseaudio"
 
-SRC_URI[md5sum] = "3d86032acb9364d47e0a144350c63e1a"
-SRC_URI[sha256sum] = "5a518237e2137341d8ca6584938950525e20c28a0177e30ecaea3ba8e7a2615b"
+SRC_URI[sha256sum] = "bd742b207c39c221e91c57c9c9be2839eb802d1b1ee01a02b7427cd02d3f0348"
 
 PACKAGECONFIG ??= "libnotify"
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.39.2


--===============7829805376200590766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-pulseaudio-plugin: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-pulseaudio-plugin/0.4/xfce4-pulseaudio-plugin-0.4.3.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-pulseaudio-plugin/0.4/xfce4-pulseaudio-plugin-0.4.8.tar.bz2"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin: PACKAGES: added "xfce4-pulseaudio-plugin-locale-en-gb xfce4-pulseaudio-plugin-locale-ar xfce4-pulseaudio-plugin-locale-en-ca xfce4-pulseaudio-plugin-locale-hye"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-dbg: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-dbg: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-dbg: PKGSIZE changed from 463064 to 491888 (+6%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-dev: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-dev: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-doc: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-doc: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-be: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-be: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-be: PKGSIZE changed from 4528 to 3769 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-bg: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-bg: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-bg: PKGSIZE changed from 4557 to 5997 (+32%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ca: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ca: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ca: PKGSIZE changed from 3685 to 4349 (+18%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-cs: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-cs: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-cs: PKGSIZE changed from 3646 to 3084 (-15%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-da: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-da: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-da: PKGSIZE changed from 3438 to 4366 (+27%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-de: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-de: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-de: PKGSIZE changed from 3615 to 4601 (+27%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-el: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-el: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-el: PKGSIZE changed from 4537 to 5474 (+21%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-en-au: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-en-au: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-en-au: PKGSIZE changed from 3394 to 2831 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-es: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-es: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-es: PKGSIZE changed from 3696 to 3738 (+1%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-eu: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-eu: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-eu: PKGSIZE changed from 3566 to 2945 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-fi: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-fi: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-fi: PKGSIZE changed from 3598 to 2975 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-fr: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-fr: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-fr: PKGSIZE changed from 3607 to 4655 (+29%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ga: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ga: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ga: PKGSIZE changed from 3013 to 2896 (-4%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-gl: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-gl: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-gl: PKGSIZE changed from 3599 to 3038 (-16%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-he: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-he: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-he: PKGSIZE changed from 3877 to 4722 (+22%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hr: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hr: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hr: PKGSIZE changed from 3622 to 3021 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hu: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hu: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hu: PKGSIZE changed from 3634 to 2989 (-18%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hy-am: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hy-am: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hy-am: PKGSIZE changed from 4582 to 3772 (-18%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-id: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-id: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-id: PKGSIZE changed from 2663 to 4171 (+57%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ie: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ie: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ie: PKGSIZE changed from 3496 to 2899 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-is: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-is: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-is: PKGSIZE changed from 3619 to 3020 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-it: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-it: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-it: PKGSIZE changed from 3627 to 4709 (+30%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ja: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ja: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ja: PKGSIZE changed from 3869 to 4967 (+28%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-kk: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-kk: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-kk: PKGSIZE changed from 4430 to 4105 (-7%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ko: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ko: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ko: PKGSIZE changed from 3599 to 4522 (+26%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-lt: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-lt: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-lt: PKGSIZE changed from 3672 to 4654 (+27%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ms: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ms: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ms: PKGSIZE changed from 3434 to 2867 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-nb: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-nb: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-nb: PKGSIZE changed from 3460 to 4342 (+25%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-nl: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-nl: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-nl: PKGSIZE changed from 3557 to 4494 (+26%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-oc: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-oc: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-oc: PKGSIZE changed from 2452 to 2559 (+4%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pl: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pl: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pl: PKGSIZE changed from 3727 to 4773 (+28%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pt-br: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pt-br: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pt-br: PKGSIZE changed from 3600 to 4602 (+28%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pt: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pt: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pt: PKGSIZE changed from 3524 to 4626 (+31%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ru: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ru: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ru: PKGSIZE changed from 4513 to 5894 (+31%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sk: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sk: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sk: PKGSIZE changed from 3743 to 3426 (-8%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sl: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sl: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sl: PKGSIZE changed from 3555 to 4473 (+26%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sq: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sq: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sq: PKGSIZE changed from 3514 to 4436 (+26%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sr: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sr: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sr: PKGSIZE changed from 4255 to 5461 (+28%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sv: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sv: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sv: PKGSIZE changed from 3414 to 4251 (+25%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-th: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-th: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-th: PKGSIZE changed from 5176 to 4287 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-tr: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-tr: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-tr: PKGSIZE changed from 3560 to 3558 (-0%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-uk: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-uk: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-uk: PKGSIZE changed from 4552 to 5850 (+29%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-zh-cn: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-zh-cn: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-zh-cn: PKGSIZE changed from 3284 to 4189 (+28%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-zh-tw: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-zh-tw: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-zh-tw: PKGSIZE changed from 3341 to 4235 (+27%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-src: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-src: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-src: PKGSIZE changed from 287364 to 328271 (+14%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-staticdev: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-staticdev: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin: PKGV changed from 0.4.3 [default] to 0.4.8 [default]
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin: PV changed from "0.4.3" to "0.4.8"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin: PKGSIZE changed from 203825 to 228766 (+12%)

--===============7829805376200590766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-pulseaudio-plugin: PACKAGES: added "xfce4-pulseaudio-plugin-locale-hye xfce4-pulseaudio-plugin-locale-en-ca xfce4-pulseaudio-plugin-locale-ar xfce4-pulseaudio-plugin-locale-en-gb"
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-be: PKGSIZE changed from 4528 to 3769 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-bg: PKGSIZE changed from 4557 to 5997 (+32%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ca: PKGSIZE changed from 3685 to 4349 (+18%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-cs: PKGSIZE changed from 3646 to 3084 (-15%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-da: PKGSIZE changed from 3438 to 4366 (+27%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-de: PKGSIZE changed from 3615 to 4601 (+27%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-el: PKGSIZE changed from 4537 to 5474 (+21%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-en-au: PKGSIZE changed from 3394 to 2831 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-eu: PKGSIZE changed from 3566 to 2945 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-fi: PKGSIZE changed from 3598 to 2975 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-fr: PKGSIZE changed from 3607 to 4655 (+29%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-gl: PKGSIZE changed from 3599 to 3038 (-16%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-he: PKGSIZE changed from 3877 to 4722 (+22%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hr: PKGSIZE changed from 3622 to 3021 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hu: PKGSIZE changed from 3634 to 2989 (-18%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-hy-am: PKGSIZE changed from 4582 to 3772 (-18%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-id: PKGSIZE changed from 2663 to 4171 (+57%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ie: PKGSIZE changed from 3496 to 2899 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-is: PKGSIZE changed from 3619 to 3020 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-it: PKGSIZE changed from 3627 to 4709 (+30%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ja: PKGSIZE changed from 3869 to 4967 (+28%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ko: PKGSIZE changed from 3599 to 4522 (+26%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-lt: PKGSIZE changed from 3672 to 4654 (+27%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ms: PKGSIZE changed from 3434 to 2867 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-nb: PKGSIZE changed from 3460 to 4342 (+25%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-nl: PKGSIZE changed from 3557 to 4494 (+26%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pl: PKGSIZE changed from 3727 to 4773 (+28%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pt-br: PKGSIZE changed from 3600 to 4602 (+28%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-pt: PKGSIZE changed from 3524 to 4626 (+31%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-ru: PKGSIZE changed from 4513 to 5894 (+31%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sl: PKGSIZE changed from 3555 to 4473 (+26%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sq: PKGSIZE changed from 3514 to 4436 (+26%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sr: PKGSIZE changed from 4255 to 5461 (+28%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-sv: PKGSIZE changed from 3414 to 4251 (+25%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-th: PKGSIZE changed from 5176 to 4287 (-17%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-uk: PKGSIZE changed from 4552 to 5850 (+29%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-zh-cn: PKGSIZE changed from 3284 to 4189 (+28%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-locale-zh-tw: PKGSIZE changed from 3341 to 4235 (+27%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin-src: PKGSIZE changed from 287364 to 328271 (+14%)
packages/core2-64-poky-linux/xfce4-pulseaudio-plugin/xfce4-pulseaudio-plugin: PKGSIZE changed from 203825 to 228766 (+12%)

--===============7829805376200590766==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-pulseaudio-plugin-upgrade-0.4.3-0.4.8.patch"

RnJvbSAyNjQ5ZGViMGQwYmY1N2FmMmIzZmRhMmE3YzFjNzExZmU5ZDA1NGU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjo0NToxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXB1bHNlYXVkaW8tcGx1Z2luOiB1cGdyYWRlIDAuNC4zIC0+IDAuNC44CgotLS0KIC4uLmVh
dWRpby1wbHVnaW5fMC40LjMuYmIgPT4geGZjZTQtcHVsc2VhdWRpby1wbHVnaW5fMC40LjguYmJ9
IHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3B1bHNlYXVkaW8ve3hmY2U0
LXB1bHNlYXVkaW8tcGx1Z2luXzAuNC4zLmJiID0+IHhmY2U0LXB1bHNlYXVkaW8tcGx1Z2luXzAu
NC44LmJifSAoNzQlKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdp
bnMvcHVsc2VhdWRpby94ZmNlNC1wdWxzZWF1ZGlvLXBsdWdpbl8wLjQuMy5iYiBiL21ldGEteGZj
ZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvcHVsc2VhdWRpby94ZmNlNC1wdWxzZWF1ZGlvLXBsdWdp
bl8wLjQuOC5iYgpzaW1pbGFyaXR5IGluZGV4IDc0JQpyZW5hbWUgZnJvbSBtZXRhLXhmY2UvcmVj
aXBlcy1wYW5lbC1wbHVnaW5zL3B1bHNlYXVkaW8veGZjZTQtcHVsc2VhdWRpby1wbHVnaW5fMC40
LjMuYmIKcmVuYW1lIHRvIG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvcHVsc2VhdWRp
by94ZmNlNC1wdWxzZWF1ZGlvLXBsdWdpbl8wLjQuOC5iYgppbmRleCA1MTY4ZWZlMWYuLmMwMWI0
OTY2ZiAxMDA2NDQKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9wdWxzZWF1
ZGlvL3hmY2U0LXB1bHNlYXVkaW8tcGx1Z2luXzAuNC4zLmJiCisrKyBiL21ldGEteGZjZS9yZWNp
cGVzLXBhbmVsLXBsdWdpbnMvcHVsc2VhdWRpby94ZmNlNC1wdWxzZWF1ZGlvLXBsdWdpbl8wLjQu
OC5iYgpAQCAtOCw4ICs4LDcgQEAgUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gInB1bHNlYXVk
aW8geDExIgogCiBERVBFTkRTICs9ICJkYnVzLWdsaWIgcHVsc2VhdWRpbyIKIAotU1JDX1VSSVtt
ZDVzdW1dID0gIjNkODYwMzJhY2I5MzY0ZDQ3ZTBhMTQ0MzUwYzYzZTFhIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjVhNTE4MjM3ZTIxMzczNDFkOGNhNjU4NDkzODk1MDUyNWUyMGMyOGEwMTc3ZTMw
ZWNhZWEzYmE4ZTdhMjYxNWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmQ3NDJiMjA3YzM5YzIy
MWU5MWM1N2M5YzliZTI4MzllYjgwMmQxYjFlZTAxYTAyYjc0MjdjZDAyZDNmMDM0OCIKIAogUEFD
S0FHRUNPTkZJRyA/Pz0gImxpYm5vdGlmeSIKIFBBQ0tBR0VDT05GSUdbbGlibm90aWZ5XSA9ICIt
LWVuYWJsZS1saWJub3RpZnksLS1kaXNhYmxlLWxpYm5vdGlmeSxsaWJub3RpZnkiCi0tIAoyLjM5
LjIKCg==

--===============7829805376200590766==--

