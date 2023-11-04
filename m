Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED792C00A5A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.5394.1699083060427429542
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TJIhGLze;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CDK6jcZE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b993e0180-0d5fb547-637a-4229-b782-37efbde96a14-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VXOnJWnH8LR2ZyHWtpxxUP1rLPmi7Vi5VUnJ9Rdel6E=;
	b=TJIhGLzemwSTF/mOn2g4x55NXYrkUFIDXs6iFS4p13OeiHNfdOGhmA5c3IcV9Dqz
	PTLUyMYqtjFHbDoOuxFJe4xtnxAonzAboV3SULO/ds3YHS2SR9xpmpkbdk3wGN5O6Xs
	8XSlyO5PdTGguM/615cQmoB9N/ZQD7Ey13KXIP5c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VXOnJWnH8LR2ZyHWtpxxUP1rLPmi7Vi5VUnJ9Rdel6E=;
	b=CDK6jcZEdW1iwGGU1LG12TusByIB25IzbH/q4FZ2IR+fG0v/v3IWHFX7dNo4d0E1
	Yigq+jryruVzrgLsqjXa6IKJtigmmFXg4Ot3fbWX4XWpt/GmGnVB4wZCWjUvcHwyy20
	5+BVNQKlPvTQe3qL01/eJwII0YlSvt7Wy8yws/JI=
Content-Type: multipart/mixed; boundary="===============1591732492506452718=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xarchiver: upgrading to 0.5.4.21 SUCCEEDED
Message-ID: <0101018b993e0180-0d5fb547-637a-4229-b782-37efbde96a14-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106310

--===============1591732492506452718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xarchiver* to *0.5.4.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xarchiver-upgrade-0.5.4.17-0.5.4.21.patch
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
From 7405e65f21725850c6eb93484bc0c4d1ded2ef59 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:55:29 +0000
Subject: [PATCH] xarchiver: upgrade 0.5.4.17 -> 0.5.4.21

---
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index ea7e8005e..e325e5d02 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+3 glib-2.0 xfce4-dev-tools-native intltool-native"
 
 SRC_URI = "git://github.com/ib/xarchiver.git;branch=master;protocol=https"
-SRCREV = "2f6c91e756678f0723305d8636e8e393c1eef32c"
-PV = "0.5.4.17"
+SRCREV = "55f923ebc623bcc8f53368543847350a23688189"
+PV = "0.5.4.21"
 S = "${WORKDIR}/git"
 
 inherit gettext pkgconfig autotools gtk-icon-cache features_check mime-xdg
-- 
2.39.2


--===============1591732492506452718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xarchiver: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver: PV changed from "0.5.4.17" to "0.5.4.21"
Changes to packages/core2-64-poky-linux/xarchiver (sysroot):
  /usr/share/icons/hicolor/32x32 was added
  /usr/share/icons/hicolor/32x32/apps was added
  /usr/share/icons/hicolor/32x32/apps/xarchiver.png was added
packages/core2-64-poky-linux/xarchiver/xarchiver-dbg: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-dbg: PKGSIZE changed from 870832 to 918264 (+5%)
packages/core2-64-poky-linux/xarchiver/xarchiver-dbg: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-dev: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-dev: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-doc: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-doc: PKGSIZE changed from 1981 to 2201 (+11%)
packages/core2-64-poky-linux/xarchiver/xarchiver-doc: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ar: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ar: PKGSIZE changed from 20531 to 18091 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ar: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ast: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ast: PKGSIZE changed from 18835 to 16363 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ast: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-bg: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-bg: PKGSIZE changed from 24785 to 33473 (+35%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-bg: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ca: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ca: PKGSIZE changed from 18556 to 16296 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ca: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-cs: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-cs: PKGSIZE changed from 18522 to 16088 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-cs: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-da: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-da: PKGSIZE changed from 17848 to 15639 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-da: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-de: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-de: PKGSIZE changed from 26148 to 27661 (+6%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-de: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-dz: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-dz: PKGSIZE changed from 12205 to 10358 (-15%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-dz: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-el: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-el: PKGSIZE changed from 25064 to 21951 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-el: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-en-gb: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-en-gb: PKGSIZE changed from 23844 to 25324 (+6%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-en-gb: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-es: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-es: PKGSIZE changed from 26034 to 27276 (+5%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-es: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-eu: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-eu: PKGSIZE changed from 25047 to 23049 (-8%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-eu: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-fi: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-fi: PKGSIZE changed from 17447 to 15375 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-fi: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-fr: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-fr: PKGSIZE changed from 25641 to 27272 (+6%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-fr: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-gl: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-gl: PKGSIZE changed from 18681 to 16289 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-gl: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-he: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-he: PKGSIZE changed from 20620 to 17876 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-he: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-hr: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-hr: PKGSIZE changed from 14828 to 13083 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-hr: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-hu: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-hu: PKGSIZE changed from 18986 to 16510 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-hu: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-id: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-id: PKGSIZE changed from 17904 to 15616 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-id: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-it: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-it: PKGSIZE changed from 18880 to 26939 (+43%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-it: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ja: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ja: PKGSIZE changed from 20825 to 18351 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ja: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-kk: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-kk: PKGSIZE changed from 14439 to 13497 (-7%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-kk: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ku: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ku: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-lt: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-lt: PKGSIZE changed from 25560 to 27131 (+6%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-lt: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-lv: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-lv: PKGSIZE changed from 18327 to 16067 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-lv: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ms: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ms: PKGSIZE changed from 15595 to 13372 (-14%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ms: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-nb: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-nb: PKGSIZE changed from 17411 to 15287 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-nb: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-nl: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-nl: PKGSIZE changed from 18460 to 26984 (+46%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-nl: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pa: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pa: PKGSIZE changed from 5751 to 5303 (-8%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pa: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pl: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pl: PKGSIZE changed from 18707 to 26815 (+43%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pl: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pt-br: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pt-br: PKGSIZE changed from 24051 to 21516 (-11%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pt-br: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pt-pt: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pt-pt: PKGSIZE changed from 18455 to 26804 (+45%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pt-pt: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ro: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ro: PKGSIZE changed from 18743 to 16458 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ro: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ru: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ru: PKGSIZE changed from 31119 to 33235 (+7%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ru: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-si: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-si: PKGSIZE changed from 26732 to 23397 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-si: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sk: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sk: PKGSIZE changed from 18744 to 16309 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sk: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sq: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sq: PKGSIZE changed from 17147 to 14854 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sq: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sr: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sr: PKGSIZE changed from 20732 to 17782 (-14%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sr: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sv: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sv: PKGSIZE changed from 18118 to 15883 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sv: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-te: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-te: PKGSIZE changed from 9015 to 8828 (-2%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-te: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-th: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-th: PKGSIZE changed from 23587 to 20059 (-15%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-th: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-tr: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-tr: PKGSIZE changed from 18191 to 26183 (+44%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-tr: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ug: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ug: PKGSIZE changed from 19457 to 17163 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ug: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-uk: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-uk: PKGSIZE changed from 31194 to 28242 (-9%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-uk: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ur: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ur: PKGSIZE changed from 21415 to 18672 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ur: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-vi: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-vi: PKGSIZE changed from 16953 to 14567 (-14%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-vi: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-zh-cn: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-zh-cn: PKGSIZE changed from 17719 to 17773 (+0%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-zh-cn: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-zh-tw: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-zh-tw: PKGSIZE changed from 17356 to 15219 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-zh-tw: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-src: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-src: FILELIST: directory renamed /usr/src/debug/xarchiver/0.5.4.17-r0/src/xdgmime -> /usr/src/debug/xarchiver/0.5.4.21-r0/src/xdgmime, removed "/usr/src/debug/xarchiver/0.5.4.17-r0/src/utf8-fnmatch.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/rpm.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/lha.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/arj.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/arj.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/lha.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/rpm.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/utf8-fnmatch.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/date_utils.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/mime.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/new_dialog.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/add_dialog.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/pref_dialog.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/date_utils.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/new_dialog.h /usr/src/debug/xarchiver/0.5.4.17-r0/s
 rc/pref_dialog.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/add_dialog.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/mime.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/archive.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/interface.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/rar.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/interface.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/archive.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/support.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/rar.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/extract_dialog.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/main.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/gzip_et_al.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/extract_dialog.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/gzip_et_al.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/main.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/ar.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/ar.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/unar.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/cpio.c /usr/src/debug/xa
 rchiver/0.5.4.17-r0/src/7zip.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/socket.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/tar.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/window.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/unar.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/tar.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/7zip.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/cpio.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/socket.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/window.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/open-with-dlg.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/string_utils.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/exe.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/zip.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/open-with-dlg.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/zip.h /usr/src/debug/xarchiver/0.5.4.17-r0/src/exe.c /usr/src/debug/xarchiver/0.5.4.17-r0/src/string_utils.h", added "/usr/src/debug/xarchiver/0.5.4.21-r0/src/gzip_et_al.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/iso.h /usr
 /src/debug/xarchiver/0.5.4.21-r0/src/socket.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/extract_dialog.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/string_utils.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/gzip_et_al.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/utf8-fnmatch.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/window.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/extract_dialog.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/socket.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/iso.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/string_utils.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/utf8-fnmatch.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/add_dialog.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/new_dialog.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/window.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/add_dialog.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/new_dialog.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/ar.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/zpaq.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/archive.c
  /usr/src/debug/xarchiver/0.5.4.21-r0/src/exe.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/archive.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/support.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/ar.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/zpaq.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/exe.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/pref_dialog.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/pref_dialog.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/unar.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/date_utils.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/rar.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/lha.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/open-with-dlg.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/rar.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/date_utils.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/squashfs.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/unar.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/open-with-dlg.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/lha.c /usr/src/debug/xarchiver/0.5.4.21-r0/s
 rc/squashfs.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/tar.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/main.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/rpm.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/tar.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/main.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/rpm.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/zip.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/interface.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/arj.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/cpio.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/mime.c /usr/src/debug/xarchiver/0.5.4.21-r0/src/zip.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/mime.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/cpio.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/arj.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/interface.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/7zip.h /usr/src/debug/xarchiver/0.5.4.21-r0/src/7zip.c"
packages/core2-64-poky-linux/xarchiver/xarchiver-src: PKGSIZE changed from 668686 to 709950 (+6%)
packages/core2-64-poky-linux/xarchiver/xarchiver-src: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver-staticdev: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver-staticdev: PV changed from "0.5.4.17" to "0.5.4.21"
packages/core2-64-poky-linux/xarchiver/xarchiver: PKGV changed from 0.5.4.17 [default] to 0.5.4.21 [default]
packages/core2-64-poky-linux/xarchiver/xarchiver: FILELIST: added "/usr/share/icons/hicolor/32x32/apps/xarchiver.png /usr/share/pixmaps/xarchiver/xarchiver-select.png"
packages/core2-64-poky-linux/xarchiver/xarchiver: PKGSIZE changed from 312701 to 339259 (+8%)
packages/core2-64-poky-linux/xarchiver/xarchiver: PV changed from "0.5.4.17" to "0.5.4.21"

--===============1591732492506452718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/xarchiver (sysroot):
  /usr/share/icons/hicolor/32x32 was added
  /usr/share/icons/hicolor/32x32/apps was added
  /usr/share/icons/hicolor/32x32/apps/xarchiver.png was added
packages/core2-64-poky-linux/xarchiver/xarchiver-doc: PKGSIZE changed from 1981 to 2201 (+11%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ar: PKGSIZE changed from 20531 to 18091 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ast: PKGSIZE changed from 18835 to 16363 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-bg: PKGSIZE changed from 24785 to 33473 (+35%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ca: PKGSIZE changed from 18556 to 16296 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-cs: PKGSIZE changed from 18522 to 16088 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-da: PKGSIZE changed from 17848 to 15639 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-dz: PKGSIZE changed from 12205 to 10358 (-15%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-el: PKGSIZE changed from 25064 to 21951 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-fi: PKGSIZE changed from 17447 to 15375 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-gl: PKGSIZE changed from 18681 to 16289 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-he: PKGSIZE changed from 20620 to 17876 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-hr: PKGSIZE changed from 14828 to 13083 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-hu: PKGSIZE changed from 18986 to 16510 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-id: PKGSIZE changed from 17904 to 15616 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-it: PKGSIZE changed from 18880 to 26939 (+43%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ja: PKGSIZE changed from 20825 to 18351 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-lv: PKGSIZE changed from 18327 to 16067 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ms: PKGSIZE changed from 15595 to 13372 (-14%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-nb: PKGSIZE changed from 17411 to 15287 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-nl: PKGSIZE changed from 18460 to 26984 (+46%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pl: PKGSIZE changed from 18707 to 26815 (+43%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pt-br: PKGSIZE changed from 24051 to 21516 (-11%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-pt-pt: PKGSIZE changed from 18455 to 26804 (+45%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ro: PKGSIZE changed from 18743 to 16458 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-si: PKGSIZE changed from 26732 to 23397 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sk: PKGSIZE changed from 18744 to 16309 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sq: PKGSIZE changed from 17147 to 14854 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sr: PKGSIZE changed from 20732 to 17782 (-14%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-sv: PKGSIZE changed from 18118 to 15883 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-th: PKGSIZE changed from 23587 to 20059 (-15%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-tr: PKGSIZE changed from 18191 to 26183 (+44%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ug: PKGSIZE changed from 19457 to 17163 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-ur: PKGSIZE changed from 21415 to 18672 (-13%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-vi: PKGSIZE changed from 16953 to 14567 (-14%)
packages/core2-64-poky-linux/xarchiver/xarchiver-locale-zh-tw: PKGSIZE changed from 17356 to 15219 (-12%)
packages/core2-64-poky-linux/xarchiver/xarchiver: FILELIST: added "/usr/share/icons/hicolor/32x32/apps/xarchiver.png /usr/share/pixmaps/xarchiver/xarchiver-select.png"

--===============1591732492506452718==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xarchiver-upgrade-0.5.4.17-0.5.4.21.patch"

RnJvbSA3NDA1ZTY1ZjIxNzI1ODUwYzZlYjkzNDg0YmMwYzRkMWRlZDJlZjU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNTo1NToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhh
cmNoaXZlcjogdXBncmFkZSAwLjUuNC4xNyAtPiAwLjUuNC4yMQoKLS0tCiBtZXRhLXhmY2UvcmVj
aXBlcy1hcHBzL3hhcmNoaXZlci94YXJjaGl2ZXJfZ2l0LmJiIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEt
eGZjZS9yZWNpcGVzLWFwcHMveGFyY2hpdmVyL3hhcmNoaXZlcl9naXQuYmIgYi9tZXRhLXhmY2Uv
cmVjaXBlcy1hcHBzL3hhcmNoaXZlci94YXJjaGl2ZXJfZ2l0LmJiCmluZGV4IGVhN2U4MDA1ZS4u
ZTMyNWU1ZDAyIDEwMDY0NAotLS0gYS9tZXRhLXhmY2UvcmVjaXBlcy1hcHBzL3hhcmNoaXZlci94
YXJjaGl2ZXJfZ2l0LmJiCisrKyBiL21ldGEteGZjZS9yZWNpcGVzLWFwcHMveGFyY2hpdmVyL3hh
cmNoaXZlcl9naXQuYmIKQEAgLTgsOCArOCw4IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogREVQRU5EUyA9
ICJndGsrMyBnbGliLTIuMCB4ZmNlNC1kZXYtdG9vbHMtbmF0aXZlIGludGx0b29sLW5hdGl2ZSIK
IAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2liL3hhcmNoaXZlci5naXQ7YnJhbmNoPW1h
c3Rlcjtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICIyZjZjOTFlNzU2Njc4ZjA3MjMzMDVkODYz
NmU4ZTM5M2MxZWVmMzJjIgotUFYgPSAiMC41LjQuMTciCitTUkNSRVYgPSAiNTVmOTIzZWJjNjIz
YmNjOGY1MzM2ODU0Mzg0NzM1MGEyMzY4ODE4OSIKK1BWID0gIjAuNS40LjIxIgogUyA9ICIke1dP
UktESVJ9L2dpdCIKIAogaW5oZXJpdCBnZXR0ZXh0IHBrZ2NvbmZpZyBhdXRvdG9vbHMgZ3RrLWlj
b24tY2FjaGUgZmVhdHVyZXNfY2hlY2sgbWltZS14ZGcKLS0gCjIuMzkuMgoK

--===============1591732492506452718==--

