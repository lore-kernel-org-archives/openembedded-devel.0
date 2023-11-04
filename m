Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DC1C04E85
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5518.1699083060510395695
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=C5pLeFGU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jnAc4w4p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b993e0207-a784f5b5-d1fb-43c7-a6b3-a95563b3fd3f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mFc6EHWsNb+9YmZZargK5/RRNbPUdveGw0C+i4u8N9A=;
	b=C5pLeFGUlf/B45SUkCiGnGLzK+JM6RXW/Toc1KKYXH51wI3gXEMVCMAUG2FZ5XCc
	1rDpP/I9omL7xQKQzGr9BQ3c6EVeDJJhxqPPk4xl/YOj/8pOROwhXeUszESJn1C/cqq
	oulyTkoyYX4RtP3xgSMYHgU0CCW09RqPOW+85go0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mFc6EHWsNb+9YmZZargK5/RRNbPUdveGw0C+i4u8N9A=;
	b=jnAc4w4pdlr3tOEVFAOXt4pp1B0di245UzZWlAarfiPg1xYwsrwgwDVvWdy6Wo2z
	wO6vEzNHYZ4n2f6rt4s7/3ix78AMxb3aivxUGR14SzRA//rZpWnJ55BhPOy3xKIN2p+
	Scd1RdiKkFUl3UXwF6NZgUk0shw7/tTxH5VPYawQ=
Content-Type: multipart/mixed; boundary="===============1812054016512303322=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-appfinder: upgrading to 4.19.1 SUCCEEDED
Message-ID: <0101018b993e0207-a784f5b5-d1fb-43c7-a6b3-a95563b3fd3f-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106314

--===============1812054016512303322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-appfinder* to *4.19.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-appfinder-upgrade-4.18.0-4.19.1.patch
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
From e024afdb27845c88c34a61e5e945b0e093a360b6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:58:30 +0000
Subject: [PATCH] xfce4-appfinder: upgrade 4.18.0 -> 4.19.1

---
 .../{xfce4-appfinder_4.18.0.bb => xfce4-appfinder_4.19.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.18.0.bb => xfce4-appfinder_4.19.1.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.18.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.1.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.18.0.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.1.bb
index 06dc0a200..0fea41c77 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.1.bb
@@ -8,6 +8,6 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "962a98d7b327d2073ed4cd0f78bce7945ed51b97d52fd60196e8b02ef819c18c"
+SRC_URI[sha256sum] = "d8bd2a1dd9d193eb25e8e5e68b1beae3578a46d1c5eeee30bec7dabbf4330648"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.39.2


--===============1812054016512303322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-appfinder: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder: SRC_URI changed from "http://archive.xfce.org/src/xfce/xfce4-appfinder/4.18/xfce4-appfinder-4.18.0.tar.bz2" to "http://archive.xfce.org/src/xfce/xfce4-appfinder/4.19/xfce4-appfinder-4.19.1.tar.bz2"
packages/core2-64-poky-linux/xfce4-appfinder: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-dbg: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-dbg: PKGSIZE changed from 338256 to 348904 (+3%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-dbg: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-dev: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-dev: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-doc: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-doc: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-am: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-am: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ar: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ar: PKGSIZE changed from 8095 to 8174 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ar: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ast: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ast: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-be: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-be: PKGSIZE changed from 10351 to 10443 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-be: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-bg: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-bg: PKGSIZE changed from 11543 to 12350 (+7%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-bg: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-bn: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-bn: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ca: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ca: PKGSIZE changed from 8689 to 9411 (+8%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ca: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-cs: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-cs: PKGSIZE changed from 8517 to 8600 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-cs: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-da: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-da: PKGSIZE changed from 8470 to 8538 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-da: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-de: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-de: PKGSIZE changed from 8904 to 9501 (+7%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-de: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-el: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-el: PKGSIZE changed from 11507 to 12246 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-el: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-en-au: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-en-au: PKGSIZE changed from 7096 to 7185 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-en-au: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-en-ca: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-en-ca: PKGSIZE changed from 8021 to 8337 (+4%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-en-ca: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-en-gb: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-en-gb: PKGSIZE changed from 6807 to 8875 (+30%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-en-gb: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-eo: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-eo: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-es: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-es: PKGSIZE changed from 8975 to 9081 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-es: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-et: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-et: PKGSIZE changed from 8719 to 9229 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-et: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-eu: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-eu: PKGSIZE changed from 8573 to 8642 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-eu: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-fi: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-fi: PKGSIZE changed from 7484 to 7568 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-fi: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-fr: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-fr: PKGSIZE changed from 9250 to 9893 (+7%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-fr: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-gl: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-gl: PKGSIZE changed from 8650 to 8731 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-gl: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-he: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-he: PKGSIZE changed from 9672 to 10205 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-he: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hi: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hi: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hr: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hr: PKGSIZE changed from 7434 to 7500 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hr: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hu: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hu: PKGSIZE changed from 8045 to 8149 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hu: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hy-am: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hy-am: PKGSIZE changed from 10663 to 10794 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hy-am: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hye: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hye: PKGSIZE changed from 9464 to 9596 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-hye: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-id: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-id: PKGSIZE changed from 8582 to 8655 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-id: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ie: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ie: PKGSIZE changed from 8141 to 8202 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ie: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-is: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-is: PKGSIZE changed from 7341 to 7443 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-is: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-it: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-it: PKGSIZE changed from 8853 to 9473 (+7%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-it: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ja: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ja: PKGSIZE changed from 10013 to 10677 (+7%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ja: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-kk: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-kk: PKGSIZE changed from 10947 to 11025 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-kk: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ko: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ko: PKGSIZE changed from 8943 to 9859 (+10%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ko: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-lt: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-lt: PKGSIZE changed from 8929 to 9503 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-lt: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-lv: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-lv: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ms: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ms: PKGSIZE changed from 8500 to 8558 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ms: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-nb: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-nb: PKGSIZE changed from 8556 to 9075 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-nb: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-nl: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-nl: PKGSIZE changed from 8948 to 9520 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-nl: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-nn: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-nn: PKGSIZE changed from 6057 to 6136 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-nn: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-oc: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-oc: PKGSIZE changed from 9119 to 9186 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-oc: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-pa: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-pa: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-pl: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-pl: PKGSIZE changed from 8742 to 9309 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-pl: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-pt-br: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-pt-br: PKGSIZE changed from 8979 to 9562 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-pt-br: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-pt: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-pt: PKGSIZE changed from 8789 to 9412 (+7%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-pt: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ro: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ro: PKGSIZE changed from 6804 to 6871 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ro: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ru: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ru: PKGSIZE changed from 11172 to 11890 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ru: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-si: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-si: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sk: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sk: PKGSIZE changed from 7984 to 8068 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sk: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sl: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sl: PKGSIZE changed from 8558 to 9038 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sl: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sq: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sq: PKGSIZE changed from 8979 to 9585 (+7%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sq: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sr: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sr: PKGSIZE changed from 10950 to 11633 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sr: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sv: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sv: PKGSIZE changed from 8613 to 9136 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-sv: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-te: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-te: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-th: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-th: PKGSIZE changed from 12641 to 12775 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-th: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-tr: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-tr: PKGSIZE changed from 8760 to 9289 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-tr: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ug: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ug: PKGSIZE changed from 7813 to 7896 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ug: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-uk: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-uk: PKGSIZE changed from 11024 to 11710 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-uk: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ur-pk: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ur-pk: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ur: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ur: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-vi: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-vi: PKGSIZE changed from 4977 to 5063 (+2%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-vi: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-zh-cn: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-zh-cn: PKGSIZE changed from 8260 to 8778 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-zh-cn: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-zh-hk: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-zh-hk: PKGSIZE changed from 7881 to 7938 (+1%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-zh-hk: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-zh-tw: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-zh-tw: PKGSIZE changed from 8215 to 8719 (+6%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-zh-tw: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-src: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-src: PKGSIZE changed from 306269 to 317414 (+4%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-src: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-staticdev: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-staticdev: PKGV changed from 4.18.0 [default] to 4.19.1 [default]
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder: PV changed from "4.18.0" to "4.19.1"
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder: PKGSIZE changed from 244574 to 249511 (+2%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder: PKGV changed from 4.18.0 [default] to 4.19.1 [default]

--===============1812054016512303322==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-appfinder-upgrade-4.18.0-4.19.1.patch"

RnJvbSBlMDI0YWZkYjI3ODQ1Yzg4YzM0YTYxZTVlOTQ1YjBlMDkzYTM2MGI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNTo1ODozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LWFwcGZpbmRlcjogdXBncmFkZSA0LjE4LjAgLT4gNC4xOS4xCgotLS0KIC4uLi97eGZjZTQt
YXBwZmluZGVyXzQuMTguMC5iYiA9PiB4ZmNlNC1hcHBmaW5kZXJfNC4xOS4xLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtYXBwZmluZGVyL3t4ZmNlNC1hcHBmaW5kZXJf
NC4xOC4wLmJiID0+IHhmY2U0LWFwcGZpbmRlcl80LjE5LjEuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1hcHBmaW5kZXIveGZjZTQtYXBwZmluZGVy
XzQuMTguMC5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtYXBwZmluZGVyL3hmY2U0
LWFwcGZpbmRlcl80LjE5LjEuYmIKc2ltaWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0
YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1hcHBmaW5kZXIveGZjZTQtYXBwZmluZGVyXzQuMTgu
MC5iYgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1hcHBmaW5kZXIveGZj
ZTQtYXBwZmluZGVyXzQuMTkuMS5iYgppbmRleCAwNmRjMGEyMDAuLjBmZWE0MWM3NyAxMDA2NDQK
LS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1hcHBmaW5kZXIveGZjZTQtYXBwZmlu
ZGVyXzQuMTguMC5iYgorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hmY2U0LWFwcGZpbmRl
ci94ZmNlNC1hcHBmaW5kZXJfNC4xOS4xLmJiCkBAIC04LDYgKzgsNiBAQCBpbmhlcml0IHhmY2Ug
ZmVhdHVyZXNfY2hlY2sKIAogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIngxMSIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjk2MmE5OGQ3YjMyN2QyMDczZWQ0Y2QwZjc4YmNlNzk0NWVkNTFi
OTdkNTJmZDYwMTk2ZThiMDJlZjgxOWMxOGMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDhiZDJh
MWRkOWQxOTNlYjI1ZThlNWU2OGIxYmVhZTM1NzhhNDZkMWM1ZWVlZTMwYmVjN2RhYmJmNDMzMDY0
OCIKIAogRklMRVM6JHtQTn0gKz0gIiR7ZGF0YWRpcn0vbWV0YWluZm8iCi0tIAoyLjM5LjIKCg==

--===============1812054016512303322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-en-gb: PKGSIZE changed from 6807 to 8875 (+30%)
packages/core2-64-poky-linux/xfce4-appfinder/xfce4-appfinder-locale-ko: PKGSIZE changed from 8943 to 9859 (+10%)

--===============1812054016512303322==--

