Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EADBC4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.5388.1699083059369335187
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EBYHofXz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kpc/sV7u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b993dfd39-e6b3da95-6587-4e7b-ba74-ce8d9f3800f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083058;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=e98IZTOfSv/TsFReFJq4JqKK640EBRTc1MFwsvCgg6g=;
	b=EBYHofXzKmscRSvQlwk36k1VBcg6nnGBR9Q8daxiG2JicloGZl2lgOS7SKOp7Cu8
	PmDftKyI/eH+YqSio0zIep9e3f/qFWOtxpyNSo4rPUWMVg/03kGJYbr3oNR1/EdCxLW
	Z48j1jZ7CY0Lo5LhSicWAJLLhxEJ+SLIyc2FZCVI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083058;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=e98IZTOfSv/TsFReFJq4JqKK640EBRTc1MFwsvCgg6g=;
	b=kpc/sV7uNIUXHg80INcI9I8/rFnGnP47mypeNZir77EwSSXd2IDj4kdQcd9KYFHz
	nUtk5VpHbhYBpEWriGdKQz4tVIsaO66UKHBCuaRGyqMGJigZcSbk1I5Ly+AScNq3nQX
	cBposRfot2R9EG3ke5ei8MUb6rdhj0JqUidejZhI=
Content-Type: multipart/mixed; boundary="===============5978907238153361398=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] exo: upgrading to 4.19.0 SUCCEEDED
Message-ID: <0101018b993dfd39-e6b3da95-6587-4e7b-ba74-ce8d9f3800f9-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106299

--===============5978907238153361398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *exo* to *4.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-exo-upgrade-4.18.0-4.19.0.patch
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
From 70b01774cc33f2d92ddff58b14565594cad573a2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:15:32 +0000
Subject: [PATCH] exo: upgrade 4.18.0 -> 4.19.0

---
 meta-xfce/recipes-xfce/exo/{exo_4.18.0.bb => exo_4.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/exo/{exo_4.18.0.bb => exo_4.19.0.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb b/meta-xfce/recipes-xfce/exo/exo_4.19.0.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/exo/exo_4.18.0.bb
rename to meta-xfce/recipes-xfce/exo/exo_4.19.0.bb
index b339b181f..48044240a 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.19.0.bb
@@ -15,7 +15,7 @@ SRC_URI += " \
     file://exo-no-tests-0.8.patch \
 "
 
-SRC_URI[sha256sum] = "4f2c61d045a888cdb64297fd0ae20cc23da9b97ffb82562ed12806ed21da7d55"
+SRC_URI[sha256sum] = "a0124108c197efcc576a6deeface381416dc7137b6a7e7dfa3060fad62509fb7"
 
 # Note: python bindings did not work in oe-dev and are about to be moved to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
-- 
2.39.2


--===============5978907238153361398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/exo/exo-dbg: PKGSIZE changed from 1024552 to 1027104 (+0%)
packages/core2-64-poky-linux/exo/exo-dbg: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-dbg: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-dev: PKGSIZE changed from 71192 to 71428 (+0%)
packages/core2-64-poky-linux/exo/exo-dev: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-dev: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-doc: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-doc: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-am: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-am: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ar: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ar: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ast: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ast: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-az-az: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-az-az: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-az: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-az: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-be: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-be: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-bg: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-bg: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-bn: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-bn: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ca: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ca: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-cs: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-cs: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-cy: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-cy: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-da: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-da: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-de: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-de: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-el: PKGSIZE changed from 18664 to 18607 (-0%)
packages/core2-64-poky-linux/exo/exo-locale-el: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-el: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-en-au: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-en-au: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-en-gb: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-en-gb: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-es: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-es: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-et: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-et: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-eu: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-eu: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-fa-ir: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-fa-ir: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-fi: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-fi: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-fr: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-fr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-gl: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-gl: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-he: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-he: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-hr: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-hr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-hu: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-hu: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-hy-am: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-hy-am: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-hy: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-hy: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-hye: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-hye: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-id: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-id: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ie: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ie: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-is: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-is: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-it: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-it: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ja: PKGSIZE changed from 15886 to 15905 (+0%)
packages/core2-64-poky-linux/exo/exo-locale-ja: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ja: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ka: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ka: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-kab: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-kab: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-kk: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-kk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-kn: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-kn: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ko: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ko: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-lt: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-lt: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-lv: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-lv: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ms: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ms: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-nb: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-nb: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-nl: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-nl: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-nn: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-nn: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-oc: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-oc: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-pa: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-pa: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-pl: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-pl: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-pt-br: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-pt-br: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-pt: PKGSIZE changed from 14070 to 14071 (+0%)
packages/core2-64-poky-linux/exo/exo-locale-pt: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-pt: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ro: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ro: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ru: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ru: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-si: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-si: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-sk: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-sk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-sl: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-sl: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-sq: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-sq: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-sr: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-sr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-sv: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-sv: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-te: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-te: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-th: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-th: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-tr: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-tr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ug: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ug: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-uk: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-uk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ur-pk: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ur-pk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-ur: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-ur: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-vi: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-vi: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-zh-cn: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-zh-cn: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-zh-hk: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-zh-hk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-locale-zh-tw: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-locale-zh-tw: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-src: PKGSIZE changed from 901217 to 902357 (+0%)
packages/core2-64-poky-linux/exo/exo-src: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-src: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo-staticdev: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo-staticdev: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo/exo: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo/exo: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/exo: PV changed from "4.18.0" to "4.19.0"
packages/core2-64-poky-linux/exo: SRC_URI changed from "http://archive.xfce.org/src/xfce/exo/4.18/exo-4.18.0.tar.bz2 file://exo-no-tests-0.8.patch" to "http://archive.xfce.org/src/xfce/exo/4.19/exo-4.19.0.tar.bz2 file://exo-no-tests-0.8.patch"
packages/core2-64-poky-linux/exo: PKGV changed from 4.18.0 [default] to 4.19.0 [default]

--===============5978907238153361398==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-exo-upgrade-4.18.0-4.19.0.patch"

RnJvbSA3MGIwMTc3NGNjMzNmMmQ5MmRkZmY1OGIxNDU2NTU5NGNhZDU3M2EyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNToxNTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV4
bzogdXBncmFkZSA0LjE4LjAgLT4gNC4xOS4wCgotLS0KIG1ldGEteGZjZS9yZWNpcGVzLXhmY2Uv
ZXhvL3tleG9fNC4xOC4wLmJiID0+IGV4b180LjE5LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS14ZmNlL3JlY2lw
ZXMteGZjZS9leG8ve2V4b180LjE4LjAuYmIgPT4gZXhvXzQuMTkuMC5iYn0gKDkwJSkKCmRpZmYg
LS1naXQgYS9tZXRhLXhmY2UvcmVjaXBlcy14ZmNlL2V4by9leG9fNC4xOC4wLmJiIGIvbWV0YS14
ZmNlL3JlY2lwZXMteGZjZS9leG8vZXhvXzQuMTkuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpy
ZW5hbWUgZnJvbSBtZXRhLXhmY2UvcmVjaXBlcy14ZmNlL2V4by9leG9fNC4xOC4wLmJiCnJlbmFt
ZSB0byBtZXRhLXhmY2UvcmVjaXBlcy14ZmNlL2V4by9leG9fNC4xOS4wLmJiCmluZGV4IGIzMzli
MTgxZi4uNDgwNDQyNDBhIDEwMDY0NAotLS0gYS9tZXRhLXhmY2UvcmVjaXBlcy14ZmNlL2V4by9l
eG9fNC4xOC4wLmJiCisrKyBiL21ldGEteGZjZS9yZWNpcGVzLXhmY2UvZXhvL2V4b180LjE5LjAu
YmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vZXhvLW5vLXRl
c3RzLTAuOC5wYXRjaCBcCiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZjJjNjFkMDQ1YTg4
OGNkYjY0Mjk3ZmQwYWUyMGNjMjNkYTliOTdmZmI4MjU2MmVkMTI4MDZlZDIxZGE3ZDU1IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImEwMTI0MTA4YzE5N2VmY2M1NzZhNmRlZWZhY2UzODE0MTZkYzcx
MzdiNmE3ZTdkZmEzMDYwZmFkNjI1MDlmYjciCiAKICMgTm90ZTogcHl0aG9uIGJpbmRpbmdzIGRp
ZCBub3Qgd29yayBpbiBvZS1kZXYgYW5kIGFyZSBhYm91dCB0byBiZSBtb3ZlZCB0bwogIyBweXhm
Y2Ugc2VlIGh0dHA6Ly9jb21tZW50cy5nbWFuZS5vcmcvZ21hbmUuY29tcC5kZXNrdG9wLnhmY2Uu
ZGV2ZWwudmVyc2lvbjQvMTk1NjAKLS0gCjIuMzkuMgoK

--===============5978907238153361398==--

