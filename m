Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3F0C074FD
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.5531.1699083061065611752
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N/Sb17uF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oIRFO3HX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b993e0329-c7034b9d-5aa3-4ca1-8aee-68f941720395-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kGdu7NApWISDFcFnkql2Q0n2ZABv3/7MfM4IYXnpWlE=;
	b=N/Sb17uFNKho913XrxFZrHBAWa3tQ2aSh1427zQIeIuheZNKS3P4nVOwanxJlZNL
	YNfry6byVue8uL1qyIP7Ek8Pdo8oFK5fuycaymxfRsBqNXGz4ml2AHsQzigApKWhRK6
	6uyG17IcBbUOKlN7uezDeqXc12O4IC8EZ1pcVWYM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kGdu7NApWISDFcFnkql2Q0n2ZABv3/7MfM4IYXnpWlE=;
	b=oIRFO3HX8j0UEy/RmE2OqcjV6RImmrxVvVyLdm62ihC4IMm6qccHipEnXOa2jCNA
	blwRR4vJC/8xAMud3L4dTSgEY5jjSVsJ6oHDnyw6pLSRBm+G4azvTfA5usyL7/h7h48
	y1LsSzJ2i5lqL2+hh/gbUAgSkdgFZoK1sT3rMVRQ=
Content-Type: multipart/mixed; boundary="===============7390806546549012861=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-mpc-plugin: upgrading to 0.5.3 SUCCEEDED
Message-ID: <0101018b993e0329-c7034b9d-5aa3-4ca1-8aee-68f941720395-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106338

--===============7390806546549012861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-mpc-plugin* to *0.5.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-mpc-plugin-upgrade-0.5.2-0.5.3.patch
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
From 47434a7ed64c52c5085b04e53d51d13c9709706c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:28:44 +0000
Subject: [PATCH] xfce4-mpc-plugin: upgrade 0.5.2 -> 0.5.3

---
 .../{xfce4-mpc-plugin_0.5.2.bb => xfce4-mpc-plugin_0.5.3.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-multimedia/xfce4-mpc-plugin/{xfce4-mpc-plugin_0.5.2.bb => xfce4-mpc-plugin_0.5.3.bb} (76%)

diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb
similarity index 76%
rename from meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb
rename to meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb
index 4a7ed93eb..cd868c243 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb
@@ -14,5 +14,4 @@ LICENSE_FLAGS = "commercial"
 # for now we recommend our own mpd-server
 RRECOMMENDS:${PN} = "mpd"
 
-SRC_URI[md5sum] = "26a1e8658df2b51967dc2250e23f467d"
-SRC_URI[sha256sum] = "eefe78b7b6b95312b3a52814b7f632dc92970c1b3e9535de616315749bf67760"
+SRC_URI[sha256sum] = "0467fb4d1acd982d3c3e0b89cb41019946850524ff19ed0f658a8d56c7b7664d"
-- 
2.39.2


--===============7390806546549012861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-mpc-plugin: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-mpc-plugin/0.5/xfce4-mpc-plugin-0.5.2.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-mpc-plugin/0.5/xfce4-mpc-plugin-0.5.3.tar.bz2"
packages/core2-64-poky-linux/xfce4-mpc-plugin: PACKAGES: added "xfce4-mpc-plugin-locale-et xfce4-mpc-plugin-locale-sl xfce4-mpc-plugin-locale-hye xfce4-mpc-plugin-locale-en-ca"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-dbg: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-dbg: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-dbg: PKGSIZE changed from 74008 to 79664 (+8%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-dev: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-dev: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-doc: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-doc: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ar: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ar: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ast: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ast: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-be: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-be: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-be: PKGSIZE changed from 2558 to 2457 (-4%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-bg: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-bg: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-bg: PKGSIZE changed from 2670 to 3409 (+28%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ca: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ca: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ca: PKGSIZE changed from 2307 to 2188 (-5%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-cs: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-cs: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-cs: PKGSIZE changed from 2356 to 1853 (-21%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-da: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-da: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-da: PKGSIZE changed from 2181 to 1663 (-24%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-de: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-de: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-de: PKGSIZE changed from 2255 to 2794 (+24%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-el: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-el: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-el: PKGSIZE changed from 2255 to 2515 (+12%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-en-au: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-en-au: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-en-au: PKGSIZE changed from 2174 to 2074 (-5%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-en-gb: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-en-gb: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-en-gb: PKGSIZE changed from 1723 to 2680 (+56%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-es: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-es: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-es: PKGSIZE changed from 2309 to 2115 (-8%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-eu: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-eu: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-eu: PKGSIZE changed from 2205 to 1657 (-25%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-fi: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-fi: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-fr: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-fr: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-fr: PKGSIZE changed from 2243 to 2830 (+26%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-gl: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-gl: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-gl: PKGSIZE changed from 2267 to 1729 (-24%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-he: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-he: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-he: PKGSIZE changed from 2379 to 2146 (-10%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-hr: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-hr: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-hr: PKGSIZE changed from 2315 to 2206 (-5%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-hu: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-hu: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-hu: PKGSIZE changed from 2244 to 2141 (-5%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-hy-am: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-hy-am: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-hy-am: PKGSIZE changed from 2750 to 2608 (-5%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-id: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-id: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-id: PKGSIZE changed from 2059 to 1674 (-19%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ie: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ie: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ie: PKGSIZE changed from 2194 to 2102 (-4%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-is: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-is: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-is: PKGSIZE changed from 2281 to 2176 (-5%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-it: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-it: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-it: PKGSIZE changed from 2308 to 2977 (+29%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ja: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ja: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ja: PKGSIZE changed from 2419 to 3077 (+27%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ko: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ko: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ko: PKGSIZE changed from 2319 to 2085 (-10%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-lt: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-lt: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-lt: PKGSIZE changed from 2351 to 2915 (+24%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-lv: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-lv: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ms: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ms: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ms: PKGSIZE changed from 2167 to 1676 (-23%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-nb: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-nb: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-nb: PKGSIZE changed from 2175 to 1918 (-12%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-nl: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-nl: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-nl: PKGSIZE changed from 2254 to 2810 (+25%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-oc: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-oc: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-pl: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-pl: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-pl: PKGSIZE changed from 2340 to 2895 (+24%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-pt-br: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-pt-br: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-pt-br: PKGSIZE changed from 2332 to 2123 (-9%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-pt: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-pt: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-pt: PKGSIZE changed from 2200 to 2842 (+29%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ru: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ru: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ru: PKGSIZE changed from 2594 to 3385 (+30%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sk: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sk: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sk: PKGSIZE changed from 2408 to 2074 (-14%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sq: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sq: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sq: PKGSIZE changed from 2199 to 2711 (+23%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sr: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sr: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sr: PKGSIZE changed from 2713 to 3452 (+27%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sv: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sv: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sv: PKGSIZE changed from 2130 to 2723 (+28%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-th: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-th: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-th: PKGSIZE changed from 2893 to 3211 (+11%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-tr: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-tr: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-tr: PKGSIZE changed from 2217 to 2002 (-10%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ug: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ug: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ug: PKGSIZE changed from 2123 to 2130 (+0%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-uk: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-uk: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-uk: PKGSIZE changed from 2713 to 2528 (-7%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ur-pk: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ur-pk: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ur: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ur: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-zh-cn: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-zh-cn: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-zh-cn: PKGSIZE changed from 2186 to 1943 (-11%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-zh-tw: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-zh-tw: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-zh-tw: PKGSIZE changed from 2187 to 2743 (+25%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-src: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-src: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-src: PKGSIZE changed from 33572 to 37717 (+12%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-staticdev: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-staticdev: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin: PKGSIZE changed from 43751 to 48266 (+10%)

--===============7390806546549012861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4906 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 106 recipes from the core2-64 sysroot...done.
Removing 146 recipes from the qemux86_64 sysroot...done.
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
meta-webserver       = "tmp-auh-upgrades:05320772b80a803f75ddc54fd673b1f603049e12"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1154 Local 1145 Mirrors 0 Missed 9 Current 298 (99% match, 99% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 299 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 300 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 301 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 305 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 312 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 314 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 317 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpd-11.8.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpd-11.8.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe mpd-0.23.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpd-0.23.12-r0: task do_package_write_deb_setscene: Started
NOTE: recipe mpd-0.23.12-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe mpd-0.23.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libmpd-11.8.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 496 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe mpd-0.23.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 549 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpd-11.8.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xfce4-panel-4.18.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpd-11.8.17-r0: task do_packagedata_setscene: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 444 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_fetch)
NOTE: recipe libmpd-11.8.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxfce4ui-4.18.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_fetch: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 449 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_unpack)
NOTE: recipe libmpd-11.8.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpd-0.23.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_unpack: Started
NOTE: recipe libmpd-11.8.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxfce4util-4.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 565 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 566 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_recipe_qa_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwnck3-43.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwnck3-43.0-r0: task do_packagedata_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpd-0.23.12-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpd-0.23.12-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 577 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb:do_packagedata_setscene)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 578 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 611 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libwnck3-43.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe exo-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe garcon-4.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpd-0.23.12-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpd-0.23.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 666 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/fmt/fmt_10.1.1.bb:do_packagedata_setscene)
NOTE: recipe garcon-4.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe exo-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libupnp-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe fluidsynth-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libao-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe jack-1.19.22-r0: task do_packagedata_setscene: Started
NOTE: recipe yajl-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openal-soft-1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe faad2-2.10.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libcdio-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmms-0.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmodplug-0.8.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wavpack-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libopus-1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fmt-10.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwnck3-43.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_recipe_qa_setscene)
NOTE: recipe exo-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe yajl-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe garcon-4.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 680 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_packagedata_setscene)
NOTE: recipe libopus-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libupnp-1.14.6-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/fluidsynth/2.3.2/temp/log.do_packagedata_setscene.2373367
NOTE: recipe faad2-2.10.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmms-0.6.4-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe fmt-10.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb:do_package_setscene)
NOTE: recipe libmodplug-0.8.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wavpack-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcdio-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwnck3-43.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openal-soft-1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libao-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe jack-1.19.22-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwnck3-43.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfce4ui-4.18.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 715 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/boost/boost_1.83.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libxres-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxres-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ffmpeg-6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe boost-1.83.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 769 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfce4ui-4.18.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxres-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxres-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa_setscene)
NOTE: recipe libxfce4ui-4.18.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe ffmpeg-6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxres-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe boost-1.83.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxres-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfce4ui-4.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe startup-notification-0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe startup-notification-0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fluidsynth-2.3.2-r0: task do_package_setscene: Started
NOTE: Running setscene task 823 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 824 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xfconf-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 833 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xfconf-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 836 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 839 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe startup-notification-0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe fluidsynth-2.3.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libxfce4util-4.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 845 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fluidsynth-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fluidsynth-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1216 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_patch)
NOTE: recipe libxfce4util-4.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 870 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_patch: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxfce4util-4.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 878 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 882 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 888 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ell/ell_0.59.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 916 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 917 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 919 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 920 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 922 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 923 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 924 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 926 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.59-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ell-0.59-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 930 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 938 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 940 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 944 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 951 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 955 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 960 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 962 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 963 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 965 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 967 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 968 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 974 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 976 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 978 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 979 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 992 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 996 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 997 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 998 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1000 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1001 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1003 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1004 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1007 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1012 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1013 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1014 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1023 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1025 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1031 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1033 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1034 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1036 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1037 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1038 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1039 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1040 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1042 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1043 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1045 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1046 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1048 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1050 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1058 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1059 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1060 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1061 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1064 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1065 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1066 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1068 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1069 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1071 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1072 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1074 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1075 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1076 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1077 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1079 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1080 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1081 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1084 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1085 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1086 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1089 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1092 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1094 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1096 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1098 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1101 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1103 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1105 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1107 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1108 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1109 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1112 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1114 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1115 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1117 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1120 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1121 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1123 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1124 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1126 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1127 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1130 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1132 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1135 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1137 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1139 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1141 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1143 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1145 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1148 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1149 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1151 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1153 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1155 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1157 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1159 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1160 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1161 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1163 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1166 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1167 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1169 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1171 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1173 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1175 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1177 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1178 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1179 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1180 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1183 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1184 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1185 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1187 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1189 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1190 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1191 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1193 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1197 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1198 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1199 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1200 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1202 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1206 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1229 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1232 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1234 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1236 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1238 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1240 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1242 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1244 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1246 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1247 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1249 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1250 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1252 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1253 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1254 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1258 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1259 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1260 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1261 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1262 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1264 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1265 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1266 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1267 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1269 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1270 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1271 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1273 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1274 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1276 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1277 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1278 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1279 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1280 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1281 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1283 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1284 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1285 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1286 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1287 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1292 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1294 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1296 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1298 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1300 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1302 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1304 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1306 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1307 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1309 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1311 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1312 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1314 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1315 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1317 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1318 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1319 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1321 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1324 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1326 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1328 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1329 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1332 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1333 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1335 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1337 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1342 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1344 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1347 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1348 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1349 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1350 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1352 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1353 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1354 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1355 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1356 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1359 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1360 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1362 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1364 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1367 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1369 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1372 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1375 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1376 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1377 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1381 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1383 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1386 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1388 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1389 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1391 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1393 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1394 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1395 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1397 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1402 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1404 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1405 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1407 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1409 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1411 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1412 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1414 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1415 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1417 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1419 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1420 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1421 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1422 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1423 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1425 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1433 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1435 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1436 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1439 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1441 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1442 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1444 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1452 of 1452 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3732 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb:do_packagedata)
NOTE: Running task 3743 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3821 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_collect_spdx_deps)
NOTE: recipe fluidsynth-2.3.2-r0: task do_packagedata: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe fluidsynth-2.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3871 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_configure)
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_configure: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_configure: Succeeded
NOTE: Running task 3872 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_compile)
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_compile: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_compile: Succeeded
NOTE: Running task 3873 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_install)
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_install: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_install: Succeeded
NOTE: Running task 3874 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_package)
NOTE: Running task 3875 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_populate_sysroot)
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_package: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_package: Succeeded
NOTE: Running task 3876 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_packagedata)
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_packagedata: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3877 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_create_spdx)
NOTE: Running task 3878 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_package_write_ipk)
NOTE: Running task 3879 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_package_write_deb)
NOTE: Running task 3880 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_package_write_rpm)
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_create_spdx: Started
NOTE: Running task 3881 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_package_qa)
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_package_write_ipk: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_package_write_deb: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_package_write_rpm: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_package_qa: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3882 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_create_runtime_spdx)
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_package_qa: Succeeded
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xfce4-mpc-plugin-0.5.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3883 of 3883 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3883 tasks of which 3864 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: fluidsynth-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package fluidsynth-src went backwards which would break package feeds (from 0:2.3.4-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: fluidsynth-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package fluidsynth-dbg went backwards which would break package feeds (from 0:2.3.4-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: fluidsynth-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package fluidsynth-staticdev went backwards which would break package feeds (from 0:2.3.4-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: fluidsynth-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package fluidsynth-dev went backwards which would break package feeds (from 0:2.3.4-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: fluidsynth-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package fluidsynth-doc went backwards which would break package feeds (from 0:2.3.4-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: fluidsynth-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package fluidsynth-locale went backwards which would break package feeds (from 0:2.3.4-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: fluidsynth-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package fluidsynth-bin went backwards which would break package feeds (from 0:2.3.4-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: fluidsynth-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package fluidsynth went backwards which would break package feeds (from 0:2.3.4-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: fluidsynth-2.3.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7390806546549012861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-mpc-plugin: PACKAGES: added "xfce4-mpc-plugin-locale-sl xfce4-mpc-plugin-locale-et xfce4-mpc-plugin-locale-en-ca xfce4-mpc-plugin-locale-hye"
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-bg: PKGSIZE changed from 2670 to 3409 (+28%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-cs: PKGSIZE changed from 2356 to 1853 (-21%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-da: PKGSIZE changed from 2181 to 1663 (-24%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-de: PKGSIZE changed from 2255 to 2794 (+24%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-el: PKGSIZE changed from 2255 to 2515 (+12%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-en-gb: PKGSIZE changed from 1723 to 2680 (+56%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-eu: PKGSIZE changed from 2205 to 1657 (-25%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-fr: PKGSIZE changed from 2243 to 2830 (+26%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-gl: PKGSIZE changed from 2267 to 1729 (-24%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-id: PKGSIZE changed from 2059 to 1674 (-19%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-it: PKGSIZE changed from 2308 to 2977 (+29%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ja: PKGSIZE changed from 2419 to 3077 (+27%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ko: PKGSIZE changed from 2319 to 2085 (-10%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-lt: PKGSIZE changed from 2351 to 2915 (+24%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ms: PKGSIZE changed from 2167 to 1676 (-23%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-nb: PKGSIZE changed from 2175 to 1918 (-12%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-nl: PKGSIZE changed from 2254 to 2810 (+25%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-pl: PKGSIZE changed from 2340 to 2895 (+24%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-pt: PKGSIZE changed from 2200 to 2842 (+29%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-ru: PKGSIZE changed from 2594 to 3385 (+30%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sk: PKGSIZE changed from 2408 to 2074 (-14%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sq: PKGSIZE changed from 2199 to 2711 (+23%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sr: PKGSIZE changed from 2713 to 3452 (+27%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-sv: PKGSIZE changed from 2130 to 2723 (+28%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-th: PKGSIZE changed from 2893 to 3211 (+11%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-zh-cn: PKGSIZE changed from 2186 to 1943 (-11%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-locale-zh-tw: PKGSIZE changed from 2187 to 2743 (+25%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin-src: PKGSIZE changed from 33572 to 37717 (+12%)
packages/core2-64-poky-linux/xfce4-mpc-plugin/xfce4-mpc-plugin: PKGSIZE changed from 43751 to 48266 (+10%)

--===============7390806546549012861==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-mpc-plugin-upgrade-0.5.2-0.5.3.patch"

RnJvbSA0NzQzNGE3ZWQ2NGM1MmM1MDg1YjA0ZTUzZDUxZDEzYzk3MDk3MDZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjoyODo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LW1wYy1wbHVnaW46IHVwZ3JhZGUgMC41LjIgLT4gMC41LjMKCi0tLQogLi4uL3t4ZmNlNC1t
cGMtcGx1Z2luXzAuNS4yLmJiID0+IHhmY2U0LW1wYy1wbHVnaW5fMC41LjMuYmJ9ICAgfCAzICst
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEteGZjZS9yZWNpcGVzLW11bHRpbWVkaWEveGZjZTQtbXBjLXBsdWdpbi97eGZjZTQtbXBj
LXBsdWdpbl8wLjUuMi5iYiA9PiB4ZmNlNC1tcGMtcGx1Z2luXzAuNS4zLmJifSAoNzYlKQoKZGlm
ZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLW11bHRpbWVkaWEveGZjZTQtbXBjLXBsdWdpbi94
ZmNlNC1tcGMtcGx1Z2luXzAuNS4yLmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMtbXVsdGltZWRpYS94
ZmNlNC1tcGMtcGx1Z2luL3hmY2U0LW1wYy1wbHVnaW5fMC41LjMuYmIKc2ltaWxhcml0eSBpbmRl
eCA3NiUKcmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMtbXVsdGltZWRpYS94ZmNlNC1tcGMt
cGx1Z2luL3hmY2U0LW1wYy1wbHVnaW5fMC41LjIuYmIKcmVuYW1lIHRvIG1ldGEteGZjZS9yZWNp
cGVzLW11bHRpbWVkaWEveGZjZTQtbXBjLXBsdWdpbi94ZmNlNC1tcGMtcGx1Z2luXzAuNS4zLmJi
CmluZGV4IDRhN2VkOTNlYi4uY2Q4NjhjMjQzIDEwMDY0NAotLS0gYS9tZXRhLXhmY2UvcmVjaXBl
cy1tdWx0aW1lZGlhL3hmY2U0LW1wYy1wbHVnaW4veGZjZTQtbXBjLXBsdWdpbl8wLjUuMi5iYgor
KysgYi9tZXRhLXhmY2UvcmVjaXBlcy1tdWx0aW1lZGlhL3hmY2U0LW1wYy1wbHVnaW4veGZjZTQt
bXBjLXBsdWdpbl8wLjUuMy5iYgpAQCAtMTQsNSArMTQsNCBAQCBMSUNFTlNFX0ZMQUdTID0gImNv
bW1lcmNpYWwiCiAjIGZvciBub3cgd2UgcmVjb21tZW5kIG91ciBvd24gbXBkLXNlcnZlcgogUlJF
Q09NTUVORFM6JHtQTn0gPSAibXBkIgogCi1TUkNfVVJJW21kNXN1bV0gPSAiMjZhMWU4NjU4ZGYy
YjUxOTY3ZGMyMjUwZTIzZjQ2N2QiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWVmZTc4YjdiNmI5
NTMxMmIzYTUyODE0YjdmNjMyZGM5Mjk3MGMxYjNlOTUzNWRlNjE2MzE1NzQ5YmY2Nzc2MCIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIwNDY3ZmI0ZDFhY2Q5ODJkM2MzZTBiODljYjQxMDE5OTQ2ODUw
NTI0ZmYxOWVkMGY2NThhOGQ1NmM3Yjc2NjRkIgotLSAKMi4zOS4yCgo=

--===============7390806546549012861==--

