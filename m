Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB52FC41535
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.5391.1699083060021198497
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T+DNEJMd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WEcjdwU0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b993dff7c-421dbc98-3730-494c-b83e-3a9b4b9e94b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zp94I+aTLRhWnFb6s7Df3mjc1phHXyj4hLTKOFRvyFs=;
	b=T+DNEJMdU/UQ0GdChkPtJVNMCLLVIjTHFxrEtuc6fUplYcDwHSg7XHhTBBFhRSCA
	KzgL+tasae+MhZUOCL1xSa2EZhC+YdkRi6Csb+l7qs7t3K1MuAL+K4f9aBP4yV7pcgl
	E1yrGNFJcKtjidZYt7jJHkCc8pRsNsuA8kEPQ+oI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zp94I+aTLRhWnFb6s7Df3mjc1phHXyj4hLTKOFRvyFs=;
	b=WEcjdwU0YMSbu0WEINza3Ho6Ij2VUofnLDe8y8lkoj06nglkXliPzTQ317D/IAue
	zzplHpF61va8YW8E7Mjm/yK566iSr0wnwM7ocS7ycWgstn2Tm5nUpehGLe5z1hamjLD
	et5aEAC1AaPwtxi8F0dOzSXN1SRZB+GPG/wh9yzs=
Content-Type: multipart/mixed; boundary="===============2985570517190267560=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libxfce4util: upgrading to 4.19.2 SUCCEEDED
Message-ID: <0101018b993dff7c-421dbc98-3730-494c-b83e-3a9b4b9e94b5-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106303

--===============2985570517190267560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxfce4util* to *4.19.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxfce4util-upgrade-4.18.1-4.19.2.patch
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
From 2460bd18ec984fa7e088a28b77f17bf6728743d4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:27:09 +0000
Subject: [PATCH] libxfce4util: upgrade 4.18.1 -> 4.19.2

---
 .../{libxfce4util_4.18.1.bb => libxfce4util_4.19.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.18.1.bb => libxfce4util_4.19.2.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.2.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.2.bb
index 683f6c337..b54501cac 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.2.bb
@@ -6,4 +6,4 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce gtk-doc gobject-introspection vala
 
-SRC_URI[sha256sum] = "8a52063a5adc66252238cad9ee6997909b59983ed21c77eb83c5e67829d1b01f"
+SRC_URI[sha256sum] = "d4c7eb021d1c9408190bcfb92c7ce26f51e994674ac3c3b8a119270c1e900ac4"
-- 
2.39.2


--===============2985570517190267560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxfce4util: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util: SRC_URI changed from "http://archive.xfce.org/src/xfce/libxfce4util/4.18/libxfce4util-4.18.1.tar.bz2" to "http://archive.xfce.org/src/xfce/libxfce4util/4.19/libxfce4util-4.19.2.tar.bz2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-dbg: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-dbg: PKGSIZE changed from 224040 to 278344 (+24%)
packages/core2-64-poky-linux/libxfce4util/libxfce4util-dbg: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-dev: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-dev: FILELIST: added "/usr/include/xfce4/libxfce4util/xfce-systemd.h /usr/include/xfce4/libxfce4util/xfce-consolekit.h"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-dev: PKGSIZE changed from 182204 to 234582 (+29%)
packages/core2-64-poky-linux/libxfce4util/libxfce4util-dev: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-doc: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-doc: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-am: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-am: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ar: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ar: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ast: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ast: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-az: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-az: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-be: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-be: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-bg: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-bg: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-bn: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-bn: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ca: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ca: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-cs: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-cs: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-cy: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-cy: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-da: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-da: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-de: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-de: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-el: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-el: PKGSIZE changed from 8644 to 8608 (-0%)
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-el: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-en-au: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-en-au: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-en-gb: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-en-gb: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-es: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-es: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-et: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-et: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-eu: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-eu: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-fi: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-fi: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-fr: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-fr: PKGSIZE changed from 6694 to 6752 (+1%)
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-fr: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-gl: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-gl: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-he: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-he: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hi: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hi: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hr: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hr: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hu: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hu: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hy-am: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hy-am: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hy: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hy: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hye: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-hye: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-id: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-id: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ie: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ie: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-is: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-is: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-it: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-it: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ja: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ja: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ka: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ka: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-kk: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-kk: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ko: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ko: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-lt: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-lt: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-lv: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-lv: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ms: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ms: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-nb: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-nb: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-nl: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-nl: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-nn: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-nn: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-oc: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-oc: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-pa: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-pa: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-pl: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-pl: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-pt-br: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-pt-br: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-pt: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-pt: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ro: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ro: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ru: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ru: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-si: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-si: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-sk: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-sk: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-sl: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-sl: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-sq: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-sq: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-sr: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-sr: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-sv: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-sv: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-th: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-th: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-tr: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-tr: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ug: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ug: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-uk: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-uk: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ur-pk: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ur-pk: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ur: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-ur: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-uz: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-uz: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-zh-cn: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-zh-cn: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-zh-hk: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-zh-hk: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-zh-tw: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-locale-zh-tw: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-src: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-src: FILELIST: directory renamed /usr/src/debug/libxfce4util/4.18.1-r0/xfce4-kiosk-query -> /usr/src/debug/libxfce4util/4.19.2-r0/xfce4-kiosk-query, removed "/usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/libxfce4util-config.h /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/libxfce4util-config.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-rc-config.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-rc-private.h /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-license.h /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-rc.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-rc.h /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-gio-extensions.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-license.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-resource.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-kiosk.h /usr/src/debug/libxfce4util/4.18.1-r0/libxfc
 e4util/xfce-miscutils.h /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-kiosk.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-resource.h /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/libxfce4util-alias.h /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-miscutils.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-rc-simple.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-i18n.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-string.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-posix-signal-handler.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-fileutils.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-posix-signal-handler.h /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/xfce-utf8.c /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/libxfce4util-private.h /usr/src/debug/libxfce4util/4.18.1-r0/libxfce4util/libxfce4util-private.c", added "/usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/libxfce4u
 til-config.h /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-consolekit.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/libxfce4util-config.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-rc-config.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-rc-private.h /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-license.h /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-rc.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-rc.h /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-gio-extensions.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-license.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-resource.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-kiosk.h /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-miscutils.h /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-kiosk.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-resource.h /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4ut
 il/libxfce4util-alias.h /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-miscutils.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-rc-simple.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-i18n.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-string.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-posix-signal-handler.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-fileutils.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-posix-signal-handler.h /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-utf8.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-systemd.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/libxfce4util-private.h /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-consolekit.h /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/libxfce4util-private.c /usr/src/debug/libxfce4util/4.19.2-r0/libxfce4util/xfce-systemd.h"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-src: PKGSIZE changed from 199355 to 244564 (+23%)
packages/core2-64-poky-linux/libxfce4util/libxfce4util-src: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util-staticdev: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-staticdev: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/libxfce4util/libxfce4util: PV changed from "4.18.1" to "4.19.2"
packages/core2-64-poky-linux/libxfce4util/libxfce4util: PKGSIZE changed from 95277 to 113997 (+20%)
packages/core2-64-poky-linux/libxfce4util/libxfce4util: PKGV changed from 4.18.1 [default] to 4.19.2 [default]
Changes to packages/core2-64-poky-linux/libxfce4util (sysroot):
  /usr/include/xfce4/libxfce4util/xfce-consolekit.h was added
  /usr/include/xfce4/libxfce4util/xfce-systemd.h was added

--===============2985570517190267560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxfce4util/libxfce4util-dbg: PKGSIZE changed from 224040 to 278344 (+24%)
packages/core2-64-poky-linux/libxfce4util/libxfce4util-dev: PKGSIZE changed from 182204 to 234582 (+29%)
packages/core2-64-poky-linux/libxfce4util/libxfce4util-dev: FILELIST: added "/usr/include/xfce4/libxfce4util/xfce-systemd.h /usr/include/xfce4/libxfce4util/xfce-consolekit.h"
packages/core2-64-poky-linux/libxfce4util/libxfce4util-src: PKGSIZE changed from 199355 to 244564 (+23%)
packages/core2-64-poky-linux/libxfce4util/libxfce4util: PKGSIZE changed from 95277 to 113997 (+20%)
Changes to packages/core2-64-poky-linux/libxfce4util (sysroot):
  /usr/include/xfce4/libxfce4util/xfce-consolekit.h was added
  /usr/include/xfce4/libxfce4util/xfce-systemd.h was added

--===============2985570517190267560==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxfce4util-upgrade-4.18.1-4.19.2.patch"

RnJvbSAyNDYwYmQxOGVjOTg0ZmE3ZTA4OGEyOGI3N2YxN2JmNjcyODc0M2Q0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNToyNzowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhmY2U0dXRpbDogdXBncmFkZSA0LjE4LjEgLT4gNC4xOS4yCgotLS0KIC4uLi97bGlieGZjZTR1
dGlsXzQuMTguMS5iYiA9PiBsaWJ4ZmNlNHV0aWxfNC4xOS4yLmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEteGZjZS9yZWNpcGVzLXhmY2UvbGlieGZjZTR1dGlsL3tsaWJ4ZmNlNHV0aWxfNC4xOC4xLmJi
ID0+IGxpYnhmY2U0dXRpbF80LjE5LjIuYmJ9ICg3NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNl
L3JlY2lwZXMteGZjZS9saWJ4ZmNlNHV0aWwvbGlieGZjZTR1dGlsXzQuMTguMS5iYiBiL21ldGEt
eGZjZS9yZWNpcGVzLXhmY2UvbGlieGZjZTR1dGlsL2xpYnhmY2U0dXRpbF80LjE5LjIuYmIKc2lt
aWxhcml0eSBpbmRleCA3NSUKcmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMteGZjZS9saWJ4
ZmNlNHV0aWwvbGlieGZjZTR1dGlsXzQuMTguMS5iYgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lw
ZXMteGZjZS9saWJ4ZmNlNHV0aWwvbGlieGZjZTR1dGlsXzQuMTkuMi5iYgppbmRleCA2ODNmNmMz
MzcuLmI1NDUwMWNhYyAxMDA2NDQKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS9saWJ4ZmNl
NHV0aWwvbGlieGZjZTR1dGlsXzQuMTguMS5iYgorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy14ZmNl
L2xpYnhmY2U0dXRpbC9saWJ4ZmNlNHV0aWxfNC4xOS4yLmJiCkBAIC02LDQgKzYsNCBAQCBERVBF
TkRTID0gImludGx0b29sLW5hdGl2ZSB4ZmNlNC1kZXYtdG9vbHMtbmF0aXZlIGdsaWItMi4wIgog
CiBpbmhlcml0IHhmY2UgZ3RrLWRvYyBnb2JqZWN0LWludHJvc3BlY3Rpb24gdmFsYQogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiOGE1MjA2M2E1YWRjNjYyNTIyMzhjYWQ5ZWU2OTk3OTA5YjU5OTgz
ZWQyMWM3N2ViODNjNWU2NzgyOWQxYjAxZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkNGM3ZWIw
MjFkMWM5NDA4MTkwYmNmYjkyYzdjZTI2ZjUxZTk5NDY3NGFjM2MzYjhhMTE5MjcwYzFlOTAwYWM0
IgotLSAKMi4zOS4yCgo=

--===============2985570517190267560==--

