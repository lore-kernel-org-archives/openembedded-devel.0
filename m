Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353B8C072DD
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5533.1699083061164944603
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KPiEUkyg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=G4/YBVe9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b993e049a-9c486840-f505-4556-82d0-31782f2a65a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=H0J2RHwAi6zB8kDKUHCU0WRf76HGEdgNmijoha6Q9xI=;
	b=KPiEUkygTc3SDHoojVuUFhAzw3c03VF14kUAjBBp0HDqDpwUoisfgKIuM5AT7c7O
	8Ho19/cKcESID8GHR148kqhe1YJGziwD7EuiWtdxpA/qsyqZCjCYcW1/b4FPsPOlq0Y
	2YYuBk7pG2gjuuayrniXS6FAn2wQSuYvLR/drgpE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=H0J2RHwAi6zB8kDKUHCU0WRf76HGEdgNmijoha6Q9xI=;
	b=G4/YBVe962TNh8V2zCr7Gw7O6WnqGGalFThNJXMRzPuymi9LKHvRhCYTynvKKNRL
	sAQDwdBoS42r0mR6XjFiSfOW/PGZ9CtClQMyYAFrCzhfKxzaNxy4kzHIdGbNlMD7Wsn
	2geuPc+uEg1T1apVufZLr0vwdu4T9qc3kD7Tfrh8=
Content-Type: multipart/mixed; boundary="===============5676632348828711998=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-systemload-plugin: upgrading to 1.3.2 SUCCEEDED
Message-ID: <0101018b993e049a-9c486840-f505-4556-82d0-31782f2a65a1-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106341

--===============5676632348828711998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-systemload-plugin* to *1.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-systemload-plugin-upgrade-1.3.1-1.3.2.patch
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
From 3d304c41ae7d5ccee1e8f78cf14c93017bf5c22c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:57:35 +0000
Subject: [PATCH] xfce4-systemload-plugin: upgrade 1.3.1 -> 1.3.2

---
 ...temload-plugin_1.3.1.bb => xfce4-systemload-plugin_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.3.1.bb => xfce4-systemload-plugin_1.3.2.bb} (83%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.1.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb
similarity index 83%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.1.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb
index 151ce3849..46fd47c12 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.1.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb
@@ -9,4 +9,4 @@ PACKAGECONFIG ?= "network power"
 PACKAGECONFIG[power] = ",,upower"
 PACKAGECONFIG[network] = ",,libgtop"
 
-SRC_URI[sha256sum] = "56d1007801d52d7c2b5a13bb54745f6d7f06fda28b49ce936145633068817652"
+SRC_URI[sha256sum] = "bb303fc3020e053ad1fa0b8fcbf0d7681c5563bb8f649357d6a95a577802b072"
-- 
2.39.2


--===============5676632348828711998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-systemload-plugin: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-systemload-plugin/1.3/xfce4-systemload-plugin-1.3.1.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-systemload-plugin/1.3/xfce4-systemload-plugin-1.3.2.tar.bz2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-dbg: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-dbg: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-dbg: PKGSIZE changed from 108160 to 150136 (+39%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-dbg: RRECOMMENDS: added "libstdc++-dbg libgcc-dbg"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-dev: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-dev: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-dev: RRECOMMENDS: added "libgcc-dev libstdc++-dev"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-doc: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-doc: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ar: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ar: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ar: PKGSIZE changed from 2280 to 1931 (-15%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ast: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ast: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-be: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-be: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-be: PKGSIZE changed from 2825 to 3198 (+13%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-bg: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-bg: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-bg: PKGSIZE changed from 3065 to 3221 (+5%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ca: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ca: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ca: PKGSIZE changed from 2418 to 2158 (-11%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-cs: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-cs: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-cs: PKGSIZE changed from 2456 to 2688 (+9%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-da: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-da: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-da: PKGSIZE changed from 2179 to 2550 (+17%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-de: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-de: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-de: PKGSIZE changed from 2330 to 2704 (+16%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-el: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-el: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-el: PKGSIZE changed from 2571 to 2414 (-6%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-en-au: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-en-au: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-en-au: PKGSIZE changed from 2008 to 1904 (-5%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-en-ca: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-en-ca: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-en-ca: PKGSIZE changed from 2005 to 1901 (-5%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-en-gb: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-en-gb: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-en-gb: PKGSIZE changed from 1599 to 1501 (-6%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-es: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-es: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-es: PKGSIZE changed from 2562 to 2727 (+6%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-et: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-et: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-et: PKGSIZE changed from 2261 to 2636 (+17%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-eu: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-eu: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-eu: PKGSIZE changed from 2150 to 2512 (+17%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-fi: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-fi: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-fi: PKGSIZE changed from 2150 to 2032 (-5%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-fr: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-fr: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-fr: PKGSIZE changed from 2432 to 2729 (+12%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-gl: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-gl: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-gl: PKGSIZE changed from 2352 to 2591 (+10%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-he: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-he: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-he: PKGSIZE changed from 2649 to 2900 (+9%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-hr: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-hr: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-hr: PKGSIZE changed from 2297 to 2244 (-2%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-hu: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-hu: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-hu: PKGSIZE changed from 2267 to 2077 (-8%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-hye: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-hye: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-hye: PKGSIZE changed from 2572 to 2383 (-7%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-id: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-id: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-id: PKGSIZE changed from 2134 to 2502 (+17%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ie: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ie: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ie: PKGSIZE changed from 2080 to 1965 (-6%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-is: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-is: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-is: PKGSIZE changed from 2152 to 2038 (-5%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-it: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-it: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-it: PKGSIZE changed from 2458 to 2740 (+11%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ja: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ja: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ja: PKGSIZE changed from 2640 to 2794 (+6%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ko: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ko: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ko: PKGSIZE changed from 2084 to 2511 (+20%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-lt: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-lt: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-lt: PKGSIZE changed from 2563 to 2928 (+14%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-lv: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-lv: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ms: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ms: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ms: PKGSIZE changed from 2019 to 2491 (+23%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-nb: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-nb: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-nb: PKGSIZE changed from 2413 to 2532 (+5%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-nl: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-nl: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-nl: PKGSIZE changed from 2222 to 2572 (+16%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-oc: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-oc: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-oc: PKGSIZE changed from 1920 to 2084 (+9%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-pl: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-pl: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-pl: PKGSIZE changed from 2636 to 2768 (+5%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-pt-br: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-pt-br: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-pt: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-pt: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-pt: PKGSIZE changed from 2463 to 2588 (+5%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ru: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ru: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ru: PKGSIZE changed from 2823 to 3144 (+11%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sk: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sk: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sk: PKGSIZE changed from 2633 to 2788 (+6%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sl: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sl: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sl: PKGSIZE changed from 2497 to 2801 (+12%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sq: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sq: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sq: PKGSIZE changed from 2284 to 2656 (+16%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sr: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sr: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sr: PKGSIZE changed from 2894 to 3320 (+15%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sv: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sv: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sv: PKGSIZE changed from 2380 to 2606 (+9%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-th: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-th: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-th: PKGSIZE changed from 3023 to 3432 (+14%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-tr: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-tr: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-tr: PKGSIZE changed from 2292 to 2629 (+15%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ug: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ug: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ug: PKGSIZE changed from 1709 to 1616 (-5%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-uk: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-uk: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-uk: PKGSIZE changed from 3151 to 3558 (+13%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ur-pk: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ur-pk: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ur: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ur: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-vi: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-vi: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-zh-cn: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-zh-cn: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-zh-cn: PKGSIZE changed from 2356 to 2483 (+5%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-zh-tw: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-zh-tw: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-src: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-src: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-src: FILELIST: removed "/usr/src/debug/xfce4-systemload-plugin/1.3.1-r0/panel-plugin/cpu.c /usr/src/debug/xfce4-systemload-plugin/1.3.1-r0/panel-plugin/network.c /usr/src/debug/xfce4-systemload-plugin/1.3.1-r0/panel-plugin/settings.c /usr/src/debug/xfce4-systemload-plugin/1.3.1-r0/panel-plugin/cpu.h /usr/src/debug/xfce4-systemload-plugin/1.3.1-r0/panel-plugin/settings.h /usr/src/debug/xfce4-systemload-plugin/1.3.1-r0/panel-plugin/network.h /usr/src/debug/xfce4-systemload-plugin/1.3.1-r0/panel-plugin/memswap.h /usr/src/debug/xfce4-systemload-plugin/1.3.1-r0/panel-plugin/uptime.h /usr/src/debug/xfce4-systemload-plugin/1.3.1-r0/panel-plugin/memswap.c /usr/src/debug/xfce4-systemload-plugin/1.3.1-r0/panel-plugin/systemload.c /usr/src/debug/xfce4-systemload-plugin/1.3.1-r0/panel-plugin/uptime.c", added "/usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/plugin.h /usr/src/debug/xfce4-systemload-plugin/1.3
 .2-r0/panel-plugin/cpu.h /usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/settings.h /usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/plugin.c /usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/network.h /usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/network.cc /usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/cpu.cc /usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/memswap.cc /usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/memswap.h /usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/uptime.h /usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/uptime.cc /usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/systemload.cc /usr/src/debug/xfce4-systemload-plugin/1.3.2-r0/panel-plugin/settings.cc"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-src: PKGSIZE changed from 103575 to 108512 (+5%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-staticdev: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-staticdev: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin: RDEPENDS: added "libstdc++ (['>= 13.2.0']) libgcc (['>= 13.2.0'])"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin: PKGSIZE changed from 76177 to 80276 (+5%)

--===============5676632348828711998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-dbg: PKGSIZE changed from 108160 to 150136 (+39%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-dbg: RRECOMMENDS: added "libstdc++-dbg libgcc-dbg"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-dev: RRECOMMENDS: added "libgcc-dev libstdc++-dev"
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ar: PKGSIZE changed from 2280 to 1931 (-15%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-be: PKGSIZE changed from 2825 to 3198 (+13%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ca: PKGSIZE changed from 2418 to 2158 (-11%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-da: PKGSIZE changed from 2179 to 2550 (+17%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-de: PKGSIZE changed from 2330 to 2704 (+16%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-et: PKGSIZE changed from 2261 to 2636 (+17%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-eu: PKGSIZE changed from 2150 to 2512 (+17%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-fr: PKGSIZE changed from 2432 to 2729 (+12%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-gl: PKGSIZE changed from 2352 to 2591 (+10%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-id: PKGSIZE changed from 2134 to 2502 (+17%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-it: PKGSIZE changed from 2458 to 2740 (+11%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ko: PKGSIZE changed from 2084 to 2511 (+20%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-lt: PKGSIZE changed from 2563 to 2928 (+14%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ms: PKGSIZE changed from 2019 to 2491 (+23%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-nl: PKGSIZE changed from 2222 to 2572 (+16%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-ru: PKGSIZE changed from 2823 to 3144 (+11%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sl: PKGSIZE changed from 2497 to 2801 (+12%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sq: PKGSIZE changed from 2284 to 2656 (+16%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-sr: PKGSIZE changed from 2894 to 3320 (+15%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-th: PKGSIZE changed from 3023 to 3432 (+14%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-tr: PKGSIZE changed from 2292 to 2629 (+15%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin-locale-uk: PKGSIZE changed from 3151 to 3558 (+13%)
packages/core2-64-poky-linux/xfce4-systemload-plugin/xfce4-systemload-plugin: RDEPENDS: added "libgcc (['>= 13.2.0']) libstdc++ (['>= 13.2.0'])"

--===============5676632348828711998==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-systemload-plugin-upgrade-1.3.1-1.3.2.patch"

RnJvbSAzZDMwNGM0MWFlN2Q1Y2NlZTFlOGY3OGNmMTRjOTMwMTdiZjVjMjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjo1NzozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXN5c3RlbWxvYWQtcGx1Z2luOiB1cGdyYWRlIDEuMy4xIC0+IDEuMy4yCgotLS0KIC4uLnRl
bWxvYWQtcGx1Z2luXzEuMy4xLmJiID0+IHhmY2U0LXN5c3RlbWxvYWQtcGx1Z2luXzEuMy4yLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvc3lzdGVtbG9hZC97eGZjZTQt
c3lzdGVtbG9hZC1wbHVnaW5fMS4zLjEuYmIgPT4geGZjZTQtc3lzdGVtbG9hZC1wbHVnaW5fMS4z
LjIuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lu
cy9zeXN0ZW1sb2FkL3hmY2U0LXN5c3RlbWxvYWQtcGx1Z2luXzEuMy4xLmJiIGIvbWV0YS14ZmNl
L3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9zeXN0ZW1sb2FkL3hmY2U0LXN5c3RlbWxvYWQtcGx1Z2lu
XzEuMy4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEteGZjZS9yZWNp
cGVzLXBhbmVsLXBsdWdpbnMvc3lzdGVtbG9hZC94ZmNlNC1zeXN0ZW1sb2FkLXBsdWdpbl8xLjMu
MS5iYgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9zeXN0ZW1sb2Fk
L3hmY2U0LXN5c3RlbWxvYWQtcGx1Z2luXzEuMy4yLmJiCmluZGV4IDE1MWNlMzg0OS4uNDZmZDQ3
YzEyIDEwMDY0NAotLS0gYS9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3N5c3RlbWxv
YWQveGZjZTQtc3lzdGVtbG9hZC1wbHVnaW5fMS4zLjEuYmIKKysrIGIvbWV0YS14ZmNlL3JlY2lw
ZXMtcGFuZWwtcGx1Z2lucy9zeXN0ZW1sb2FkL3hmY2U0LXN5c3RlbWxvYWQtcGx1Z2luXzEuMy4y
LmJiCkBAIC05LDQgKzksNCBAQCBQQUNLQUdFQ09ORklHID89ICJuZXR3b3JrIHBvd2VyIgogUEFD
S0FHRUNPTkZJR1twb3dlcl0gPSAiLCx1cG93ZXIiCiBQQUNLQUdFQ09ORklHW25ldHdvcmtdID0g
IiwsbGliZ3RvcCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU2ZDEwMDc4MDFkNTJkN2MyYjVh
MTNiYjU0NzQ1ZjZkN2YwNmZkYTI4YjQ5Y2U5MzYxNDU2MzMwNjg4MTc2NTIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiYmIzMDNmYzMwMjBlMDUzYWQxZmEwYjhmY2JmMGQ3NjgxYzU1NjNiYjhmNjQ5
MzU3ZDZhOTVhNTc3ODAyYjA3MiIKLS0gCjIuMzkuMgoK

--===============5676632348828711998==--

