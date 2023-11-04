Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37B6C0018A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5513.1699083059853803018
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Dl3OxUHD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RmbpWG2y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b993dfea6-f54524db-7530-4125-b89e-9c6e09f48f8a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8hMPARdrRlz0T+CeLkFZTJn/4kpE1gc8VYO/Xh3Hn2U=;
	b=Dl3OxUHDZ0ivJ+BQjiLiLnxg6SXfYDW3tHqA2E6DcibITBwYrd0aH3ptcdmpg4pG
	Om6Xp4+CBC5lwzp9RYxsxnWOXAD7TLv1SXiNYiT8QTkkcqUyofN1n23eKk1M+AJr5uE
	Iy6DMc01yvLbzGA29C7Cm0hcZN0JBsZdBvrI0fpE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8hMPARdrRlz0T+CeLkFZTJn/4kpE1gc8VYO/Xh3Hn2U=;
	b=RmbpWG2yrWJp1YorXYwd2jO5GzsmWnQA90LwkWZMD5G3cQ+4jMm3kdlhApNwX5vx
	Pybe4k3Xq4fQLhy8EV0sXb4Vh0OyR2+/XIkB1n1d8ycFS3Oisq933j48MHlj0GT3ojG
	CtkMb1wb8Ze2gl2KPY9GRlBSBL2dDsN/9tpwWFs4=
Content-Type: multipart/mixed; boundary="===============6457974630496008448=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libxfce4ui: upgrading to 4.19.3 SUCCEEDED
Message-ID: <0101018b993dfea6-f54524db-7530-4125-b89e-9c6e09f48f8a-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106302

--===============6457974630496008448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxfce4ui* to *4.19.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxfce4ui-upgrade-4.18.3-4.19.3.patch
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
From 45aca9ad1c1521fa190765785edda6254f6acdfe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:24:21 +0000
Subject: [PATCH] libxfce4ui: upgrade 4.18.3 -> 4.19.3

---
 .../libxfce4ui/{libxfce4ui_4.18.3.bb => libxfce4ui_4.19.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.18.3.bb => libxfce4ui_4.19.3.bb} (92%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
similarity index 92%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
index 417858c98..e53d01d00 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
@@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # TODO: Check if 0001-... can go
 SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[sha256sum] = "afa3a46eeed3ab612d2f7e1308edaf5819f6c33ccc16c13080efabd58f010abd"
+SRC_URI[sha256sum] = "16815eef494ba9bac9c854e95c205c0bc5568c8022c31604348f9edadb02f227"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 EXTRA_OECONF += "--disable-vala"
-- 
2.39.2


--===============6457974630496008448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxfce4ui: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui: PACKAGES: added "libxfce4ui-locale-fa-ir"
packages/core2-64-poky-linux/libxfce4ui: SRC_URI changed from "http://archive.xfce.org/src/xfce/libxfce4ui/4.18/libxfce4ui-4.18.3.tar.bz2 file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch" to "http://archive.xfce.org/src/xfce/libxfce4ui/4.19/libxfce4ui-4.19.3.tar.bz2 file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-dbg: PKGSIZE changed from 597424 to 599792 (+0%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-dbg: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-dbg: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-dev: PKGSIZE changed from 274021 to 274232 (+0%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-dev: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-dev: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-doc: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-doc: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-glade: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-glade: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-am: PKGSIZE changed from 8251 to 8233 (-0%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-am: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-am: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ar: PKGSIZE changed from 21324 to 21175 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ar: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ar: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ast: PKGSIZE changed from 14333 to 11820 (-18%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ast: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ast: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-az: PKGSIZE changed from 18937 to 18787 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-az: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-az: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-be: PKGSIZE changed from 23375 to 23244 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-be: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-be: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-bg: PKGSIZE changed from 26471 to 26306 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-bg: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-bg: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-bn: PKGSIZE changed from 11431 to 11245 (-2%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-bn: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-bn: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ca: PKGSIZE changed from 18883 to 19556 (+4%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ca: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ca: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-cs: PKGSIZE changed from 19489 to 19367 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-cs: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-cs: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-cy: PKGSIZE changed from 18167 to 18062 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-cy: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-cy: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-da: PKGSIZE changed from 18005 to 18403 (+2%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-da: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-da: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-de: PKGSIZE changed from 19853 to 19739 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-de: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-de: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-el: PKGSIZE changed from 25818 to 26337 (+2%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-el: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-el: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-en-au: PKGSIZE changed from 12570 to 12487 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-en-au: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-en-au: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-en-gb: PKGSIZE changed from 11561 to 18027 (+56%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-en-gb: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-en-gb: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-es: PKGSIZE changed from 19803 to 19681 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-es: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-es: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-et: PKGSIZE changed from 18676 to 18556 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-et: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-et: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-eu: PKGSIZE changed from 18308 to 18199 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-eu: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-eu: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-fi: PKGSIZE changed from 14196 to 17194 (+21%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-fi: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-fi: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-fr: PKGSIZE changed from 20543 to 20415 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-fr: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-fr: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-gl: PKGSIZE changed from 18889 to 18801 (-0%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-gl: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-gl: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-he: PKGSIZE changed from 20992 to 20846 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-he: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-he: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hr: PKGSIZE changed from 14972 to 15702 (+5%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hr: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hr: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hu: PKGSIZE changed from 17903 to 19157 (+7%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hu: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hu: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hy-am: PKGSIZE changed from 17279 to 17079 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hy-am: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hy-am: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hy: PKGSIZE changed from 17097 to 16901 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hy: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hy: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hye: PKGSIZE changed from 18906 to 18739 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hye: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-hye: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-id: PKGSIZE changed from 18424 to 18320 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-id: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-id: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ie: PKGSIZE changed from 13660 to 13495 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ie: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ie: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-is: PKGSIZE changed from 13242 to 13157 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-is: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-is: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-it: PKGSIZE changed from 19675 to 19559 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-it: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-it: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ja: PKGSIZE changed from 22141 to 22004 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ja: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ja: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ka: PKGSIZE changed from 13563 to 13460 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ka: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ka: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-kk: PKGSIZE changed from 24350 to 24178 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-kk: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-kk: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ko: PKGSIZE changed from 19065 to 19271 (+1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ko: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ko: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-lt: PKGSIZE changed from 19331 to 19195 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-lt: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-lt: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-lv: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-lv: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ms: PKGSIZE changed from 13705 to 13608 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ms: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ms: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-nb: PKGSIZE changed from 18795 to 18678 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-nb: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-nb: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-nl: PKGSIZE changed from 19178 to 19051 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-nl: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-nl: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-nn: PKGSIZE changed from 11989 to 11852 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-nn: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-nn: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-oc: PKGSIZE changed from 20186 to 20073 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-oc: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-oc: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-pa: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-pa: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-pl: PKGSIZE changed from 19994 to 19880 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-pl: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-pl: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-pt-br: PKGSIZE changed from 19671 to 19554 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-pt-br: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-pt-br: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-pt: PKGSIZE changed from 19401 to 19285 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-pt: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-pt: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ro: PKGSIZE changed from 14338 to 14189 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ro: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ro: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ru: PKGSIZE changed from 24822 to 24713 (-0%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ru: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ru: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-si: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-si: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sk: PKGSIZE changed from 14539 to 19052 (+31%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sk: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sk: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sl: PKGSIZE changed from 18379 to 18590 (+1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sl: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sl: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sq: PKGSIZE changed from 19551 to 19438 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sq: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sq: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sr: PKGSIZE changed from 24128 to 23965 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sr: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sr: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sv: PKGSIZE changed from 18802 to 18695 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sv: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sv: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-te: PKGSIZE changed from 12260 to 12117 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-te: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-te: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-th: PKGSIZE changed from 27276 to 27084 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-th: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-th: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-tr: PKGSIZE changed from 19246 to 19125 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-tr: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-tr: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ug: PKGSIZE changed from 15060 to 14915 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ug: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ug: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-uk: PKGSIZE changed from 24125 to 24439 (+1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-uk: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-uk: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ur-pk: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ur-pk: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ur: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ur: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-vi: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-vi: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-zh-cn: PKGSIZE changed from 17372 to 17246 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-zh-cn: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-zh-cn: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-zh-hk: PKGSIZE changed from 13147 to 13023 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-zh-hk: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-zh-hk: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-zh-tw: PKGSIZE changed from 17919 to 17803 (-1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-zh-tw: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-zh-tw: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-src: PKGSIZE changed from 553675 to 556762 (+1%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-src: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-src: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-staticdev: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-staticdev: PV changed from "4.18.3" to "4.19.3"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui: PKGSIZE changed from 396130 to 396425 (+0%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui: PKGV changed from 4.18.3 [default] to 4.19.3 [default]
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui: PV changed from "4.18.3" to "4.19.3"

--===============6457974630496008448==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxfce4ui-upgrade-4.18.3-4.19.3.patch"

RnJvbSA0NWFjYTlhZDFjMTUyMWZhMTkwNzY1Nzg1ZWRkYTYyNTRmNmFjZGZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNToyNDoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhmY2U0dWk6IHVwZ3JhZGUgNC4xOC4zIC0+IDQuMTkuMwoKLS0tCiAuLi4vbGlieGZjZTR1aS97
bGlieGZjZTR1aV80LjE4LjMuYmIgPT4gbGlieGZjZTR1aV80LjE5LjMuYmJ9ICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
LXhmY2UvcmVjaXBlcy14ZmNlL2xpYnhmY2U0dWkve2xpYnhmY2U0dWlfNC4xOC4zLmJiID0+IGxp
YnhmY2U0dWlfNC4xOS4zLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVz
LXhmY2UvbGlieGZjZTR1aS9saWJ4ZmNlNHVpXzQuMTguMy5iYiBiL21ldGEteGZjZS9yZWNpcGVz
LXhmY2UvbGlieGZjZTR1aS9saWJ4ZmNlNHVpXzQuMTkuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDky
JQpyZW5hbWUgZnJvbSBtZXRhLXhmY2UvcmVjaXBlcy14ZmNlL2xpYnhmY2U0dWkvbGlieGZjZTR1
aV80LjE4LjMuYmIKcmVuYW1lIHRvIG1ldGEteGZjZS9yZWNpcGVzLXhmY2UvbGlieGZjZTR1aS9s
aWJ4ZmNlNHVpXzQuMTkuMy5iYgppbmRleCA0MTc4NThjOTguLmU1M2QwMWQwMCAxMDA2NDQKLS0t
IGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS9saWJ4ZmNlNHVpL2xpYnhmY2U0dWlfNC4xOC4zLmJi
CisrKyBiL21ldGEteGZjZS9yZWNpcGVzLXhmY2UvbGlieGZjZTR1aS9saWJ4ZmNlNHVpXzQuMTku
My5iYgpAQCAtMTIsNyArMTIsNyBAQCBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJ
U1RST0ZFQVRVUkVTfSIKIAogIyBUT0RPOiBDaGVjayBpZiAwMDAxLS4uLiBjYW4gZ28KIFNSQ19V
UkkgKz0gImZpbGU6Ly8wMDAxLWxpYnhmY2U0a2JkLXByaXZhdGUteGZjZTQta2V5Ym9hcmQtc2hv
cnRjdXRzLnhtbC1maXgucGF0Y2giCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWZhM2E0NmVlZWQz
YWI2MTJkMmY3ZTEzMDhlZGFmNTgxOWY2YzMzY2NjMTZjMTMwODBlZmFiZDU4ZjAxMGFiZCIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIxNjgxNWVlZjQ5NGJhOWJhYzljODU0ZTk1YzIwNWMwYmM1NTY4
YzgwMjJjMzE2MDQzNDhmOWVkYWRiMDJmMjI3IgogCiBFWFRSQV9PRUNPTkYgKz0gIi0td2l0aC12
ZW5kb3ItaW5mbz0ke0RJU1RST30iCiBFWFRSQV9PRUNPTkYgKz0gIi0tZGlzYWJsZS12YWxhIgot
LSAKMi4zOS4yCgo=

--===============6457974630496008448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxfce4ui: PACKAGES: added "libxfce4ui-locale-fa-ir"
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-ast: PKGSIZE changed from 14333 to 11820 (-18%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-en-gb: PKGSIZE changed from 11561 to 18027 (+56%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-fi: PKGSIZE changed from 14196 to 17194 (+21%)
packages/core2-64-poky-linux/libxfce4ui/libxfce4ui-locale-sk: PKGSIZE changed from 14539 to 19052 (+31%)

--===============6457974630496008448==--

