Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F22C0032E
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5517.1699083060413892651
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dSrQShmS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=C2yma1Zd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b993e0162-5c6fb3f6-b18d-4d40-817e-014ffbae016b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2zRAhZz19qRTVmAJ98wAq7QjHi8BJ3Ebi/esD58yPbY=;
	b=dSrQShmS6aPEKWyVv6VmfsPbS3fDVFNPWCLae5FcrMVqkL4Qw3EPGuMW4KBl+DfS
	mvbNhmGotkuijpkAugQql/3ytgNpv+Jy+g4wDEnFAMpgPTMHZMraNIFluQfpXnbptHz
	f/QNyuDSTZw8Md9m4iyuNVbskol3k01qqgMwUT3U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2zRAhZz19qRTVmAJ98wAq7QjHi8BJ3Ebi/esD58yPbY=;
	b=C2yma1Zd5E8ZkZVfVQrk/FqjopXs9Gh7PHb1gmWZZ2P519xi/RlWlAUngV3gaOos
	1D4JeUNC3ZgSlI4RE7fKGKXqR20+mVOYzREmKz9ygdnvB9mTX+9R+ESM2jPAGddNvlj
	i1zLAFTbeEmIcR+AC2E4yGId0ISS5sj9Z8kVDopA=
Content-Type: multipart/mixed; boundary="===============2055795676073476464=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-calculator-plugin: upgrading to 0.7.2 SUCCEEDED
Message-ID: <0101018b993e0162-5c6fb3f6-b18d-4d40-817e-014ffbae016b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106309

--===============2055795676073476464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-calculator-plugin* to *0.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-calculator-plugin-upgrade-0.7.1-0.7.2.patch
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
From ff3cf5bc53dcf070598546e8c6363f69f00cf7c3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:04:43 +0000
Subject: [PATCH] xfce4-calculator-plugin: upgrade 0.7.1 -> 0.7.2

---
 ...culator-plugin_0.7.1.bb => xfce4-calculator-plugin_0.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/calculator/{xfce4-calculator-plugin_0.7.1.bb => xfce4-calculator-plugin_0.7.2.bb} (75%)

diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.2.bb
similarity index 75%
rename from meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
rename to meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.2.bb
index 8fd2bd0d2..0c464930e 100644
--- a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
+++ b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.2.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=909430f63fddd63f120ba29e8979f65c"
 
 inherit xfce-panel-plugin gtk-icon-cache
 
-SRC_URI[sha256sum] = "e4016a03c3ef4ebddd97e4135f5e304f80677033c98e19644b9989ec6f5ada81"
+SRC_URI[sha256sum] = "d1f622bea41a90c1686bf9f13c488ab28e995e2762b84712dea9027e0c94028b"
-- 
2.39.2


--===============2055795676073476464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-calculator-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-calculator-plugin/0.7/xfce4-calculator-plugin-0.7.1.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-calculator-plugin/0.7/xfce4-calculator-plugin-0.7.2.tar.bz2"
packages/core2-64-poky-linux/xfce4-calculator-plugin: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin: PACKAGES: added "xfce4-calculator-plugin-locale-en-gb"
packages/core2-64-poky-linux/xfce4-calculator-plugin: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-dbg: PKGSIZE changed from 80792 to 80152 (-1%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-dbg: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-dbg: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-dev: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-dev: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-doc: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-doc: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-be: PKGSIZE changed from 1875 to 1787 (-5%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-be: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-be: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-bg: PKGSIZE changed from 1796 to 1688 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-bg: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-bg: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ca: PKGSIZE changed from 1515 to 1423 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ca: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ca: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-cs: PKGSIZE changed from 1577 to 1487 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-cs: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-cs: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-da: PKGSIZE changed from 1426 to 1336 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-da: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-da: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-de: PKGSIZE changed from 1483 to 1390 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-de: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-de: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-en-au: PKGSIZE changed from 1342 to 1283 (-4%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-en-au: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-en-au: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-en-ca: PKGSIZE changed from 1342 to 1356 (+1%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-en-ca: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-en-ca: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-es: PKGSIZE changed from 1485 to 1442 (-3%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-es: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-es: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-et: PKGSIZE changed from 1513 to 1423 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-et: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-et: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-eu: PKGSIZE changed from 1474 to 1384 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-eu: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-eu: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-fa-ir: PKGSIZE changed from 1497 to 1425 (-5%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-fa-ir: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-fa-ir: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-fi: PKGSIZE changed from 1348 to 1277 (-5%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-fi: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-fi: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-fr: PKGSIZE changed from 1554 to 1516 (-2%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-fr: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-fr: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-gl: PKGSIZE changed from 1503 to 1412 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-gl: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-gl: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-he: PKGSIZE changed from 1683 to 1577 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-he: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-he: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hi: PKGSIZE changed from 1709 to 1628 (-5%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hi: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hi: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hr: PKGSIZE changed from 1449 to 1460 (+1%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hr: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hr: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hu: PKGSIZE changed from 1420 to 1354 (-5%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hu: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hu: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hy-am: PKGSIZE changed from 1654 to 1557 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hy-am: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hy-am: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hye: PKGSIZE changed from 1657 to 1560 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hye: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-hye: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-id: PKGSIZE changed from 1466 to 1376 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-id: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-id: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ie: PKGSIZE changed from 1323 to 1257 (-5%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ie: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ie: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-is: PKGSIZE changed from 1378 to 1305 (-5%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-is: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-is: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-it: PKGSIZE changed from 1537 to 1487 (-3%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-it: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-it: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ja: PKGSIZE changed from 1458 to 1368 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ja: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ja: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ko: PKGSIZE changed from 1340 to 1352 (+1%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ko: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ko: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-lt: PKGSIZE changed from 1619 to 1522 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-lt: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-lt: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ms: PKGSIZE changed from 1309 to 1335 (+2%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ms: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ms: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-nb: PKGSIZE changed from 1501 to 1398 (-7%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-nb: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-nb: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-nl: PKGSIZE changed from 1494 to 1401 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-nl: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-nl: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-pl: PKGSIZE changed from 1619 to 1531 (-5%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-pl: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-pl: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-pt-br: PKGSIZE changed from 1508 to 1470 (-3%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-pt-br: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-pt-br: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-pt: PKGSIZE changed from 1475 to 1443 (-2%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-pt: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-pt: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ru: PKGSIZE changed from 1844 to 1754 (-5%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ru: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-ru: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sk: PKGSIZE changed from 1583 to 1488 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sk: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sk: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sl: PKGSIZE changed from 1508 to 1418 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sl: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sl: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sq: PKGSIZE changed from 1471 to 1396 (-5%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sq: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sq: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sr: PKGSIZE changed from 1787 to 1675 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sr: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sr: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sv: PKGSIZE changed from 1463 to 1373 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sv: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-sv: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-tr: PKGSIZE changed from 1490 to 1404 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-tr: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-tr: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-uk: PKGSIZE changed from 1878 to 1908 (+2%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-uk: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-uk: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-zh-cn: PKGSIZE changed from 1423 to 1330 (-7%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-zh-cn: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-zh-cn: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-zh-tw: PKGSIZE changed from 1431 to 1341 (-6%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-zh-tw: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-locale-zh-tw: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-src: PKGSIZE changed from 45891 to 45941 (+0%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-src: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-src: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-staticdev: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin-staticdev: PKGV changed from 0.7.1 [default] to 0.7.2 [default]
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin: PKGSIZE changed from 84528 to 95300 (+13%)
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin: PV changed from "0.7.1" to "0.7.2"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin: PKGV changed from 0.7.1 [default] to 0.7.2 [default]

--===============2055795676073476464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-calculator-plugin: PACKAGES: added "xfce4-calculator-plugin-locale-en-gb"
packages/core2-64-poky-linux/xfce4-calculator-plugin/xfce4-calculator-plugin: PKGSIZE changed from 84528 to 95300 (+13%)

--===============2055795676073476464==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-calculator-plugin-upgrade-0.7.1-0.7.2.patch"

RnJvbSBmZjNjZjViYzUzZGNmMDcwNTk4NTQ2ZThjNjM2M2Y2OWYwMGNmN2MzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjowNDo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LWNhbGN1bGF0b3ItcGx1Z2luOiB1cGdyYWRlIDAuNy4xIC0+IDAuNy4yCgotLS0KIC4uLmN1
bGF0b3ItcGx1Z2luXzAuNy4xLmJiID0+IHhmY2U0LWNhbGN1bGF0b3ItcGx1Z2luXzAuNy4yLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvY2FsY3VsYXRvci97eGZjZTQt
Y2FsY3VsYXRvci1wbHVnaW5fMC43LjEuYmIgPT4geGZjZTQtY2FsY3VsYXRvci1wbHVnaW5fMC43
LjIuYmJ9ICg3NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lu
cy9jYWxjdWxhdG9yL3hmY2U0LWNhbGN1bGF0b3ItcGx1Z2luXzAuNy4xLmJiIGIvbWV0YS14ZmNl
L3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9jYWxjdWxhdG9yL3hmY2U0LWNhbGN1bGF0b3ItcGx1Z2lu
XzAuNy4yLmJiCnNpbWlsYXJpdHkgaW5kZXggNzUlCnJlbmFtZSBmcm9tIG1ldGEteGZjZS9yZWNp
cGVzLXBhbmVsLXBsdWdpbnMvY2FsY3VsYXRvci94ZmNlNC1jYWxjdWxhdG9yLXBsdWdpbl8wLjcu
MS5iYgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9jYWxjdWxhdG9y
L3hmY2U0LWNhbGN1bGF0b3ItcGx1Z2luXzAuNy4yLmJiCmluZGV4IDhmZDJiZDBkMi4uMGM0NjQ5
MzBlIDEwMDY0NAotLS0gYS9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL2NhbGN1bGF0
b3IveGZjZTQtY2FsY3VsYXRvci1wbHVnaW5fMC43LjEuYmIKKysrIGIvbWV0YS14ZmNlL3JlY2lw
ZXMtcGFuZWwtcGx1Z2lucy9jYWxjdWxhdG9yL3hmY2U0LWNhbGN1bGF0b3ItcGx1Z2luXzAuNy4y
LmJiCkBAIC01LDQgKzUsNCBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT05MDk0MzBmNjNmZGRkNjNmMTIwYmEyOWU4OTc5ZjY1YyIKIAogaW5oZXJpdCB4ZmNlLXBhbmVs
LXBsdWdpbiBndGstaWNvbi1jYWNoZQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTQwMTZhMDNj
M2VmNGViZGRkOTdlNDEzNWY1ZTMwNGY4MDY3NzAzM2M5OGUxOTY0NGI5OTg5ZWM2ZjVhZGE4MSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkMWY2MjJiZWE0MWE5MGMxNjg2YmY5ZjEzYzQ4OGFiMjhl
OTk1ZTI3NjJiODQ3MTJkZWE5MDI3ZTBjOTQwMjhiIgotLSAKMi4zOS4yCgo=

--===============2055795676073476464==--

