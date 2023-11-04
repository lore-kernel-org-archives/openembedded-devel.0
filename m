Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D065EC4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:28 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4706.1699074741577088348
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aEsnnsz6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gxwHnGLi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b98bf1147-f2d12e44-744f-46f2-a6eb-438b39970d52-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074740;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z+L2o3QVl8Rldu4D7zrQ6ayNXkmdGTV0rlQQ32k5kiY=;
	b=aEsnnsz6EMsHI1P82SsDHCJYFSomY01lTaWclDUCfQUKFNpWrHeMxGg/W9DaBKRb
	FqFKhxt+I+WmFDfzaIMUH2WOt+HOuyO6qbojfBmVckexmIRQCRMVANS4NyIP4AgMS8q
	NYEaAE7WdGK1Abx1jvg2LJIICDYALtSbaIKYwNzE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074740;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z+L2o3QVl8Rldu4D7zrQ6ayNXkmdGTV0rlQQ32k5kiY=;
	b=gxwHnGLiLNpcLzjn6RtorH8K/Yf199iAGbsOaJaj2iq/dJrOE7Zh6AoPxCLMpvGe
	rzAX9kh1mp+YBE/DB4n3/urU5hREHYH90LYY7OlO9gQU4/tFzmKgLZMydc77GGu22J6
	GNoSktF18hryzdKnP7uvVax+Jxt5/GzQnsN28vJc=
Content-Type: multipart/mixed; boundary="===============4085208634645823588=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] evolution-data-server: upgrading to 3.50.1 SUCCEEDED
Message-ID: <0101018b98bf1147-f2d12e44-744f-46f2-a6eb-438b39970d52-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106273

--===============4085208634645823588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *evolution-data-server* to *3.50.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-evolution-data-server-upgrade-3.50.0-3.50.1.patch
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
From 80d484263d8bd8f628908171cbf9e6d538ccd181 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:23:59 +0000
Subject: [PATCH] evolution-data-server: upgrade 3.50.0 -> 3.50.1

---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 511cc04af..195b8cb85 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "c9f793d99ba188ef8cf2891b8062d7e570e3cba22b8cfc46eb561c6cecc81d3a"
-PV = "3.50.0"
+SRC_URI[archive.sha256sum] = "91f4ffc38a1b8d2fe8939834449ac541c0bff4a39b444edc2a9529344a28e98a"
+PV = "3.50.1"
-- 
2.39.2


--===============4085208634645823588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-dbg: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-dbg: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-dbg: PKGSIZE changed from 21608336 to 21608816 (+0%)
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-dev: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-dev: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-doc: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-doc: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-am: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-am: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ar: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ar: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-as: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-as: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ast: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ast: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-az: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-az: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-be: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-be: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-bg: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-bg: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-bn-in: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-bn-in: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-bn: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-bn: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-bs: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-bs: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ca+valencia: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ca+valencia: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ca: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ca: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-cs: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-cs: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-cy: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-cy: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-da: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-da: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-da: PKGSIZE changed from 144632 to 146496 (+1%)
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-de: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-de: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-dz: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-dz: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-el: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-el: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-en+shaw: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-en+shaw: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-en-au: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-en-au: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-en-ca: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-en-ca: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-en-gb: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-en-gb: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-eo: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-eo: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-es: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-es: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-et: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-et: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-eu: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-eu: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-fa: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-fa: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-fi: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-fi: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-fr: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-fr: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-fur: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-fur: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ga: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ga: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-gl: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-gl: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-gu: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-gu: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-he: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-he: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-hi: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-hi: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-hr: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-hr: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-hu: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-hu: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-id: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-id: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-is: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-is: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-it: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-it: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ja: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ja: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ka: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ka: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-kk: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-kk: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-km: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-km: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-kn: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-kn: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ko: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ko: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ku: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ku: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-lt: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-lt: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-lv: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-lv: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-mai: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-mai: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-mk: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-mk: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ml: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ml: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-mn: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-mn: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-mr: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-mr: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ms: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ms: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-nb: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-nb: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ne: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ne: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-nl: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-nl: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-nn: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-nn: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-oc: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-oc: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-or: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-or: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-pa: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-pa: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-pl: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-pl: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-pt-br: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-pt-br: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-pt: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-pt: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ro: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ro: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ru: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ru: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-rw: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-rw: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-si: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-si: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sk: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sk: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sl: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sl: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sq: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sq: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sr+latin: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sr+latin: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sr: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sr: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sv: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-sv: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ta: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ta: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-te: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-te: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-tg: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-tg: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-th: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-th: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-tr: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-tr: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ug: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-ug: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-uk: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-uk: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-vi: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-vi: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-wa: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-wa: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-xh: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-xh: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-zh-cn: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-zh-cn: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-zh-hk: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-zh-hk: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-zh-tw: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-locale-zh-tw: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-src: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-src: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-src: PKGSIZE changed from 16023272 to 16024328 (+0%)
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-staticdev: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server-staticdev: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server/evolution-data-server: PKGV changed from 3.50.0 [default] to 3.50.1 [default]
packages/core2-64-poky-linux/evolution-data-server: SRC_URI changed from "https://download.gnome.org/sources//evolution-data-server/3.50/evolution-data-server-3.50.0.tar.xz;name=archive file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch file://0004-call-native-helpers.patch file://iconv-detect.h" to "https://download.gnome.org/sources//evolution-data-server/3.50/evolution-data-server-3.50.1.tar.xz;name=archive file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch file://0004-call-native-helpers.patch file://iconv-detect.h"
packages/core2-64-poky-linux/evolution-data-server: PV changed from "3.50.0" to "3.50.1"
packages/core2-64-poky-linux/evolution-data-server: PKGV changed from 3.50.0 [default] to 3.50.1 [default]

--===============4085208634645823588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4885 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 142 recipes from the core2-64 sysroot...done.
Removing 151 recipes from the qemux86_64 sysroot...done.
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
meta-webserver       = "tmp-auh-upgrades:5468e22a55525856005f92c1d1ca0fd1290779cf"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1193 Local 1184 Mirrors 0 Missed 9 Current 223 (99% match, 99% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 226 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb:do_create_spdx_setscene)
NOTE: Running setscene task 233 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_populate_lic_setscene)
NOTE: Running setscene task 234 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_create_spdx_setscene)
NOTE: Running setscene task 237 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 241 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 242 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 248 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 249 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 250 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 256 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb:do_create_spdx_setscene)
NOTE: recipe evolution-data-server-native-3.50.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nss-3.74-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk3-2.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gtk4-4.12.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe evolution-data-server-native-3.50.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 257 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_create_spdx_setscene)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 258 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 260 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_create_spdx_setscene)
NOTE: recipe nss-3.74-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 262 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 263 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.12.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 265 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb:do_packagedata_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe nss-3.74-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 267 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 276 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 281 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 282 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_create_spdx_setscene)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 283 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb:do_populate_sysroot_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 284 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.38.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 285 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_populate_sysroot_setscene)
NOTE: recipe nss-3.74-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 287 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nspr/nspr_4.35.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 292 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe evolution-data-server-native-3.50.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 293 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nss-3.74-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nspr-4.35-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk3-2.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/webkitgtk3/2.42.0/temp/log.do_packagedata_setscene.1332833
NOTE: Running setscene task 294 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 295 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb:do_package_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe evolution-data-server-native-3.50.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe evolution-data-server-3.50.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe nspr-4.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nss-3.74-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 298 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 300 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nspr/nspr_4.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 303 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_create_spdx_setscene)
NOTE: recipe evolution-data-server-native-3.50.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe nss-3.74-r0: task do_recipe_qa_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe nspr-4.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe evolution-data-server-3.50.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 318 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 319 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot_setscene)
NOTE: recipe evolution-data-server-native-3.50.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 321 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb:do_recipe_qa_setscene)
NOTE: recipe nss-3.74-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 324 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 325 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk3-2.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 342 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe nspr-4.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 344 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nspr/nspr_4.35.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 346 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nspr-4.35-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 359 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 372 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/db/db_5.3.28.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nspr-4.35-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 374 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 375 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: recipe libwpe-1.14.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe webkitgtk3-2.42.0-r0: task do_package_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 377 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 382 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/enchant/enchant2_2.6.1.bb:do_create_spdx_setscene)
NOTE: recipe db-1_5.3.28-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe db-1_5.3.28-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 384 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 388 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: recipe libwpe-1.14.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 389 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe enchant2-2.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 398 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 399 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 413 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libxslt/libxslt_1.1.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 414 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe db-1_5.3.28-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe db-1_5.3.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 480 of 1416 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ruby/ruby_3.2.2.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 487 of 1416 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ruby-native-3.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 564 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 569 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 574 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx_setscene)
NOTE: recipe db-1_5.3.28-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/db/db_5.3.28.bb:do_recipe_qa_setscene)
NOTE: recipe gperf-native-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ruby-native-3.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe db-1_5.3.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 604 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 611 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe db-1_5.3.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 612 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 615 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 616 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 619 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 622 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 626 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 646 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 659 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 665 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 678 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 682 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 685 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 687 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 689 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 694 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 1416 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 460 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 720 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 729 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-native-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 732 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_fetch: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 735 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 760 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 770 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 774 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 780 of 1416 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1141 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_unpack)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe evolution-data-server-3.50.1-r0: task do_unpack: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_unpack: Succeeded
NOTE: Running task 1242 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_patch)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_patch: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_patch: Succeeded
NOTE: Running task 1244 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_generate_toolchain_file)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk3-2.42.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 798 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/enchant/enchant2_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe webkitgtk3-2.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe enchant2-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk3-2.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 814 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/enchant/enchant2_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe enchant2-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 821 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnotify-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe enchant2-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 835 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libxslt/libxslt_1.1.38.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libxslt/libxslt_1.1.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe enchant2-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnotify-0.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/enchant/enchant2_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 850 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1258 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb:do_fetch)
NOTE: recipe libsecret-0.21.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe enchant2-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe enchant2-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk3-2.42.0-r0: task do_fetch: Started
NOTE: Running setscene task 862 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 864 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk3-2.42.0-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 866 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 873 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 874 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 876 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 877 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 879 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 886 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 888 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 889 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 891 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 899 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 900 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 901 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 903 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 906 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 909 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 912 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 914 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/aspell/aspell_0.60.8.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 918 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 920 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 923 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 926 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 927 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 928 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 937 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 938 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 939 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 940 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 941 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 943 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 951 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 952 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 954 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 955 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 956 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 962 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 963 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 965 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 967 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 969 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 975 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 981 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 982 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 986 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 990 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 991 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 993 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 995 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libxslt/libxslt_1.1.38.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 997 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 998 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-1.1.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1000 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1003 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1004 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libxslt-1.1.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1005 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1009 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1011 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1013 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1015 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1017 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1019 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1021 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1022 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1028 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1029 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1031 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1034 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1036 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1038 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1039 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1040 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1041 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1043 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1044 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1045 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1046 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1047 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1049 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1051 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1053 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1055 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1058 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1060 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1062 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1064 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1067 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1069 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1070 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1072 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1076 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1079 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1080 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1081 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1083 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1085 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1086 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1088 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1090 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1093 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1095 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1097 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1099 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1100 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1102 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1104 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1105 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1106 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1108 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1113 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1114 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1116 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1117 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1118 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1120 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1121 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1123 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1124 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1125 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1131 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1134 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1135 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1137 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1139 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1141 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1143 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1145 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1147 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1148 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1165 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1166 of 1416 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe nghttp2-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1168 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1175 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1177 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1183 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1186 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1188 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1190 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1191 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1416 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1195 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1196 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1197 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1685 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb:do_unpack)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gperf-native-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk3-2.42.0-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1200 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1201 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1202 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1203 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1205 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1216 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1217 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1218 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1219 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1221 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1222 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1223 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1225 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1226 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1229 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1231 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1232 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1237 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1238 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1242 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1244 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1246 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1247 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1248 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1252 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1254 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1257 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1258 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1259 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1260 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1263 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1264 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1265 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1266 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1267 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1268 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1269 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1270 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1272 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1273 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1275 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1276 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1277 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1279 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1281 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1283 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1286 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1287 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1290 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1293 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1299 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1301 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1303 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1305 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1306 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1308 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1311 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1314 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1316 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1318 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1320 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1322 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1323 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1324 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1325 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1327 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1328 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1329 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1330 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1331 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1332 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1333 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1336 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1339 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1342 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1345 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1346 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1347 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1350 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1352 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1353 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1355 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1357 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1358 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1359 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1361 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1366 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1368 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1370 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1371 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1373 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe webkitgtk3-2.42.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1375 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1376 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1378 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1379 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1381 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1383 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1384 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1385 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1388 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1389 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1391 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1397 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1398 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1400 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1403 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1405 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1406 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1408 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1416 of 1416 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3590 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb:do_packagedata)
NOTE: Running task 3609 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3778 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb:do_collect_spdx_deps)
NOTE: recipe webkitgtk3-2.42.0-r0: task do_packagedata: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk3-2.42.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe webkitgtk3-2.42.0-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk3-2.42.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3794 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb:do_create_spdx)
NOTE: recipe webkitgtk3-2.42.0-r0: task do_create_spdx: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3795 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_configure)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_configure: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_configure: Succeeded
NOTE: Running task 3796 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_compile)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_compile: Started
NOTE: recipe webkitgtk3-2.42.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3797 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_collect_spdx_deps)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe evolution-data-server-3.50.1-r0: task do_compile: Succeeded
NOTE: Running task 3798 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_install)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_install: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_install: Succeeded
NOTE: Running task 3799 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_package)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_package: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_package: Succeeded
NOTE: Running task 3801 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_packagedata)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_packagedata: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3802 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_create_spdx)
NOTE: Running task 3803 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_package_write_ipk)
NOTE: Running task 3804 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_package_write_deb)
NOTE: Running task 3805 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_package_write_rpm)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_create_spdx: Started
NOTE: Running task 3806 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_package_qa)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_package_write_ipk: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_package_write_deb: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_package_write_rpm: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_package_qa: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3807 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_create_runtime_spdx)
NOTE: recipe evolution-data-server-3.50.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe evolution-data-server-3.50.1-r0: task do_package_qa: Succeeded
NOTE: recipe evolution-data-server-3.50.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe evolution-data-server-3.50.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe evolution-data-server-3.50.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe evolution-data-server-3.50.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 3808 of 3808 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb:do_build)
NOTE: Tasks Summary: Attempted 3808 tasks of which 3785 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 58 ERROR messages, returning a non-zero exit code.
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-src went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-dbg went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-staticdev went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-dev went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-doc went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3 went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-ar went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-as went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-bg went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-ca went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-cs went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-da went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-de went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-el went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-en-ca went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-en-gb went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-eo went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-es went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-et went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-eu went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-fi went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-fr went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-gl went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-gu went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-he went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-hi went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-hr went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-hu went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-id went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-it went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-ja went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-ka went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-kn went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-ko went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-lt went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-lv went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-ml went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-mr went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-nb went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-nl went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-or went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-pa went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-pl went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-pt went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-pt-br went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-ro went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-ru went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-sl went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-sr went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-sr+latin went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-sv went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-ta went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-te went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-tr went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-uk went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-vi went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: QA Issue: Package version for package webkitgtk3-locale-zh-cn went backwards which would break package feeds (from 0:2.42.1-r0 to 0:2.42.0-r0) [version-going-backwards]
ERROR: webkitgtk3-2.42.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4085208634645823588==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-evolution-data-server-upgrade-3.50.0-3.50.1.patch"

RnJvbSA4MGQ0ODQyNjNkOGJkOGY2Mjg5MDgxNzFjYmY5ZTZkNTM4Y2NkMTgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDoyMzo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV2
b2x1dGlvbi1kYXRhLXNlcnZlcjogdXBncmFkZSAzLjUwLjAgLT4gMy41MC4xCgotLS0KIC4uLi9l
dm9sdXRpb24tZGF0YS1zZXJ2ZXIvZXZvbHV0aW9uLWRhdGEtc2VydmVyLmluYyAgICAgICAgICAg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL2V2b2x1dGlvbi1kYXRhLXNl
cnZlci9ldm9sdXRpb24tZGF0YS1zZXJ2ZXIuaW5jIGIvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21l
L2V2b2x1dGlvbi1kYXRhLXNlcnZlci9ldm9sdXRpb24tZGF0YS1zZXJ2ZXIuaW5jCmluZGV4IDUx
MWNjMDRhZi4uMTk1YjhjYjg1IDEwMDY0NAotLS0gYS9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUv
ZXZvbHV0aW9uLWRhdGEtc2VydmVyL2V2b2x1dGlvbi1kYXRhLXNlcnZlci5pbmMKKysrIGIvbWV0
YS1nbm9tZS9yZWNpcGVzLWdub21lL2V2b2x1dGlvbi1kYXRhLXNlcnZlci9ldm9sdXRpb24tZGF0
YS1zZXJ2ZXIuaW5jCkBAIC05LDUgKzksNSBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HO21kNT02YTZlNjg5ZDE5MjU1Y2YwNTU3ZjNmZTdkNzA2ODIxMiBcCiAKIGluaGVyaXQg
Z25vbWViYXNlIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbgogCi1TUkNfVVJJW2FyY2hpdmUuc2hh
MjU2c3VtXSA9ICJjOWY3OTNkOTliYTE4OGVmOGNmMjg5MWI4MDYyZDdlNTcwZTNjYmEyMmI4Y2Zj
NDZlYjU2MWM2Y2VjYzgxZDNhIgotUFYgPSAiMy41MC4wIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1
NnN1bV0gPSAiOTFmNGZmYzM4YTFiOGQyZmU4OTM5ODM0NDQ5YWM1NDFjMGJmZjRhMzliNDQ0ZWRj
MmE5NTI5MzQ0YTI4ZTk4YSIKK1BWID0gIjMuNTAuMSIKLS0gCjIuMzkuMgoK

--===============4085208634645823588==--

