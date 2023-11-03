Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10A9C10F13
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.63859.1699041165176728042
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DEn8jJru;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=htVYrJ9u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b96bed4bc-d43306c3-deb1-4fad-8737-e15d03ce0f3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VJzFWXa5GmTOZpMvZu6T4rUhJZz949+e907CVNO5wfc=;
	b=DEn8jJru+gmobuRE+06YS5XQMzf7Wv+F/j/tJP4Kyh/qGuXfkF1WjH8utrFDtVU/
	4B7fUcp0CQO/NWNBhfXO1JGuP0AKqEEWGU7pmc0EUn1R8GGAK34k0hsifSY4SoC3oec
	2Z0sOePMTR3xuqll4fExK0nqH6IOtHe8v2NyfD7k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VJzFWXa5GmTOZpMvZu6T4rUhJZz949+e907CVNO5wfc=;
	b=htVYrJ9uAfhhqLvPy83aF5tC4dVSRruT1ViB0pDJn13ECCV5DR1bJcLjLVhA3e2y
	d9LZTemmHx44Q5a4oIxbuR6uwTEqVdFmX0eWrAmcvW94Jk/VOBFzSMinOIuFxSQOGJB
	iet3Aaa7F8avxzxHiSOSCdRgSkwt7Xgc2KJDZD/0=
Content-Type: multipart/mixed; boundary="===============2813810258874773141=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] modemmanager: upgrading to 1.23.1 SUCCEEDED
Message-ID: <0101018b96bed4bc-d43306c3-deb1-4fad-8737-e15d03ce0f3c-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105999

--===============2813810258874773141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *modemmanager* to *1.23.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-modemmanager-upgrade-1.22.0-1.23.1.patch
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
From ad32b52fe87e6edc3885802cbb85b8524e4c156a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 16:08:56 +0000
Subject: [PATCH] modemmanager: upgrade 1.22.0 -> 1.23.1

---
 .../{modemmanager_1.22.0.bb => modemmanager_1.23.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.22.0.bb => modemmanager_1.23.1.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb
index 95884f44c..794e60a47 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb
@@ -12,8 +12,8 @@ inherit gnomebase gettext systemd gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
 
-SRCREV = "03f786ce66360d67c669f4f122f8aa458e6f01ea"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=mm-1-22"
+SRCREV = "29f8154ef762c173a14199c85ce0bbd4ce188abe"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============2813810258874773141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/modemmanager: SRC_URI changed from "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=mm-1-22" to "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=main"
packages/core2-64-poky-linux/modemmanager: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-bash-completion: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-bash-completion: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-dbg: PKGSIZE changed from 13531752 to 13622368 (+1%)
packages/core2-64-poky-linux/modemmanager/modemmanager-dbg: FILELIST: added "/usr/lib/ModemManager/.debug/libmm-plugin-mtk-legacy.so"
packages/core2-64-poky-linux/modemmanager/modemmanager-dbg: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-dbg: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-dev: PKGSIZE changed from 5799543 to 5809745 (+0%)
packages/core2-64-poky-linux/modemmanager/modemmanager-dev: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-dev: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-doc: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-doc: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-ca: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-ca: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-cs: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-cs: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-da: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-da: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-de: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-de: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-fi: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-fi: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-fr: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-fr: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-fur: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-fur: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-gl: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-gl: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-he: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-he: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-hu: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-hu: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-id: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-id: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-it: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-it: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-ka: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-ka: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-lt: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-lt: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-nl: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-nl: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-pl: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-pl: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-pt-br: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-pt-br: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-ru: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-ru: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-sk: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-sk: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-sv: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-sv: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-tr: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-tr: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-uk: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-uk: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-zh-cn: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-locale-zh-cn: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-src: PKGSIZE changed from 12820194 to 12891496 (+1%)
packages/core2-64-poky-linux/modemmanager/modemmanager-src: FILELIST: directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/x22x -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/x22x, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/ublox -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/ublox, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/libqcdm/src -> /usr/src/debug/modemmanager/1.23.1-r0/libqcdm/src, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/linktop -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/linktop, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/cinterion -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/cinterion, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/pantech -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/pantech, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/simtech -> /usr/src/debug/modemmanager/1.23.1-r0/src/p
 lugins/simtech, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/novatel -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/novatel, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/fibocom -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/fibocom, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/foxconn -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/foxconn, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/gosuncn -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/gosuncn, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/iridium -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/iridium, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/thuraya -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/thuraya, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/anydata -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/anydata, directory renam
 ed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/generic -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/generic, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/quectel -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/quectel, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/dlink -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/dlink, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/wavecom -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/wavecom, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/samsung -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/samsung, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/haier -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/haier, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/motorola -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/motorola, directory renamed /usr/src/debug/modemmanager/1.22.0
 -r0/cli -> /usr/src/debug/modemmanager/1.23.1-r0/cli, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/longcheer -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/longcheer, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/libmm-glib/generated -> /usr/src/debug/modemmanager/1.23.1-r0/libmm-glib/generated, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/zte -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/zte, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src -> /usr/src/debug/modemmanager/1.23.1-r0/src, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/option -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/option, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/intel -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/intel, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/include -> /usr/src/debug/modemmanager/1.23.1-r0/include, directory renamed /usr/src/debug/modemman
 ager/1.22.0-r0/libmm-glib/generated/tests -> /usr/src/debug/modemmanager/1.23.1-r0/libmm-glib/generated/tests, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/telit -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/telit, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/kerneldevice -> /usr/src/debug/modemmanager/1.23.1-r0/src/kerneldevice, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/sierra -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/sierra, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/xmm -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/xmm, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/icera -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/icera, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/altair -> /usr/src/debug/modem
 manager/1.23.1-r0/src/plugins/altair, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/dell -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/dell, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/huawei -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/huawei, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/nokia -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/nokia, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/libmm-glib -> /usr/src/debug/modemmanager/1.23.1-r0/libmm-glib, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/via -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/via, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/broadmobi -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/broadmobi, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/qcom-soc -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/qcom-soc, directory renamed /usr/sr
 c/debug/modemmanager/1.22.0-r0/src/plugins/tplink -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/tplink, directory renamed /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/mbm -> /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/mbm, removed "/usr/src/debug/modemmanager/1.22.0-r0/src/plugins/mtk/mm-broadband-modem-mtk.h /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/mtk/mm-broadband-modem-mtk.c /usr/src/debug/modemmanager/1.22.0-r0/src/plugins/mtk/mm-plugin-mtk.c", added "/usr/src/debug/modemmanager/1.23.1-r0/src/plugins/mtk/mm-plugin-mtk.c /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/mtk/mm-broadband-modem-mtk-legacy.h /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/mtk/mm-plugin-mtk-legacy.c /usr/src/debug/modemmanager/1.23.1-r0/src/plugins/mtk/mm-broadband-modem-mtk-legacy.c"
packages/core2-64-poky-linux/modemmanager/modemmanager-src: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-src: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager-staticdev: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager-staticdev: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/modemmanager/modemmanager: PKGSIZE changed from 5859213 to 5900206 (+1%)
packages/core2-64-poky-linux/modemmanager/modemmanager: FILELIST: removed "/usr/lib/udev/rules.d/77-mm-mtk-port-types.rules", added "/usr/lib/ModemManager/libmm-plugin-mtk-legacy.so /usr/lib/udev/rules.d/77-mm-mtk-legacy-port-types.rules"
packages/core2-64-poky-linux/modemmanager/modemmanager: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/modemmanager/modemmanager: PV changed from "1.22.0" to "1.23.1"
Changes to packages/core2-64-poky-linux/modemmanager (sysroot):
  /usr/lib/ModemManager/libmm-plugin-mtk-legacy.so was added
  /usr/lib/udev/rules.d/77-mm-mtk-legacy-port-types.rules was added
  /usr/lib/udev/rules.d/77-mm-mtk-port-types.rules was removed

--===============2813810258874773141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4919 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 60 recipes from the core2-64 sysroot...done.
Removing 61 recipes from the qemux86_64 sysroot...done.
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
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:646c7029bfb2484b84f3028894ef68aed0b84d54"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 513 Local 497 Mirrors 0 Missed 16 Current 178 (96% match, 97% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 191 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 195 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 196 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 197 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 198 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 199 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 207 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 208 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 211 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 212 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 213 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 214 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 691 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libxslt/libxslt_1.1.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 309 of 691 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libxslt/libxslt_1.1.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libmbim-1.30.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmbim-1.30.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libqmi-1.34.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-native-1.1.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-native-1.1.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libqmi-1.34.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 317 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 318 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 319 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/libmbim/1.30.0/temp/log.do_packagedata_setscene.3909477
NOTE: recipe bash-completion-2.11-r0: task do_package_write_deb_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 342 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 343 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libmbim-1.30.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libqmi-1.34.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-native-1.1.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libqmi-1.34.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 344 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 347 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 352 of 691 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libxslt/libxslt_1.1.38.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 354 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 359 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: Running task 317 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_fetch)
NOTE: Running task 319 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_fetch)
NOTE: Running task 320 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_write_config)
NOTE: Running task 323 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_write_config: Started
NOTE: recipe libqmi-1.34.0-r0: task do_fetch: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_fetch: Started
NOTE: recipe libqmi-1.34.0-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 365 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libqmi-1.34.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 366 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 383 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: recipe modemmanager-1.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 359 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_unpack)
NOTE: recipe libqmi-1.34.0-r0: task do_fetch: Succeeded
NOTE: Running task 360 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 389 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libqmi-1.34.0-r0: task do_unpack: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmbim-1.30.0-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 398 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 404 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 415 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 424 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 427 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 428 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 374 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 431 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libmbim-1.30.0-r0: task do_package_setscene: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 439 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 440 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 383 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 443 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 444 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 446 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 447 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 451 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmbim-1.30.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libqmi-1.34.0-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 454 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmbim-1.30.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 385 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 456 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 460 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libmbim-1.30.0-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 471 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 472 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 479 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmbim-1.30.0-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 394 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmbim-1.30.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 491 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 494 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 841 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 866 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 886 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_patch)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 891 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_patch)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 524 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libqmi-1.34.0-r0: task do_patch: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmbim-1.30.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 937 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libqmi-1.34.0-r0: task do_patch: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 956 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 535 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 540 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 543 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 559 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1085 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 569 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 577 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 584 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 600 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 612 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 618 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 643 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 648 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 677 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 691 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1711 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1765 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb:do_packagedata)
NOTE: Running task 1777 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libmbim-1.30.0-r0: task do_packagedata: Started
NOTE: Running task 1840 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb:do_collect_spdx_deps)
NOTE: recipe libqmi-1.34.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmbim-1.30.0-r0: task do_packagedata: Succeeded
NOTE: recipe libmbim-1.30.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: recipe libmbim-1.30.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1883 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb:do_create_spdx)
NOTE: recipe libmbim-1.30.0-r0: task do_create_spdx: Started
NOTE: recipe libqmi-1.34.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1884 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_configure)
NOTE: recipe libqmi-1.34.0-r0: task do_configure: Started
NOTE: recipe libmbim-1.30.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1885 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_collect_spdx_deps)
NOTE: recipe libqmi-1.34.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libqmi-1.34.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libqmi-1.34.0-r0: task do_configure: Succeeded
NOTE: Running task 1886 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_compile)
NOTE: recipe libqmi-1.34.0-r0: task do_compile: Started
NOTE: recipe libqmi-1.34.0-r0: task do_compile: Succeeded
NOTE: Running task 1887 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_install)
NOTE: recipe libqmi-1.34.0-r0: task do_install: Started
NOTE: recipe libqmi-1.34.0-r0: task do_install: Succeeded
NOTE: Running task 1888 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_package)
NOTE: Running task 1889 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_populate_sysroot)
NOTE: recipe libqmi-1.34.0-r0: task do_package: Started
NOTE: recipe libqmi-1.34.0-r0: task do_populate_sysroot: Started
NOTE: recipe libqmi-1.34.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1890 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe modemmanager-1.23.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1891 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_configure)
NOTE: recipe modemmanager-1.23.1-r0: task do_configure: Started
NOTE: recipe libqmi-1.34.0-r0: task do_package: Succeeded
NOTE: Running task 1892 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_packagedata)
NOTE: recipe libqmi-1.34.0-r0: task do_packagedata: Started
NOTE: recipe libqmi-1.34.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1893 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb:do_create_spdx)
NOTE: recipe libqmi-1.34.0-r0: task do_create_spdx: Started
NOTE: recipe libqmi-1.34.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1894 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_collect_spdx_deps)
NOTE: recipe modemmanager-1.23.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_configure: Succeeded
NOTE: Running task 1895 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_compile)
NOTE: recipe modemmanager-1.23.1-r0: task do_compile: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_install)
NOTE: recipe modemmanager-1.23.1-r0: task do_install: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_install: Succeeded
NOTE: Running task 1897 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_package)
NOTE: Running task 1898 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_populate_sysroot)
NOTE: recipe modemmanager-1.23.1-r0: task do_populate_sysroot: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_package: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_package: Succeeded
NOTE: Running task 1899 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_packagedata)
NOTE: recipe modemmanager-1.23.1-r0: task do_packagedata: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1900 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_create_spdx)
NOTE: Running task 1901 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_package_write_ipk)
NOTE: Running task 1902 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_package_write_deb)
NOTE: Running task 1903 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_package_write_rpm)
NOTE: Running task 1904 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_package_qa)
NOTE: recipe modemmanager-1.23.1-r0: task do_create_spdx: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_package_write_ipk: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_package_write_deb: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_package_write_rpm: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_package_qa: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1905 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_create_runtime_spdx)
NOTE: recipe modemmanager-1.23.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe modemmanager-1.23.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_package_qa: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe modemmanager-1.23.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1906 of 1906 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.23.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1906 tasks of which 1861 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: libmbim-1.30.0-r0 do_packagedata_setscene: QA Issue: Package version for package libmbim-src went backwards which would break package feeds (from 0:1.31.1-r0 to 0:1.30.0-r0) [version-going-backwards]
ERROR: libmbim-1.30.0-r0 do_packagedata_setscene: QA Issue: Package version for package libmbim-dbg went backwards which would break package feeds (from 0:1.31.1-r0 to 0:1.30.0-r0) [version-going-backwards]
ERROR: libmbim-1.30.0-r0 do_packagedata_setscene: QA Issue: Package version for package libmbim-staticdev went backwards which would break package feeds (from 0:1.31.1-r0 to 0:1.30.0-r0) [version-going-backwards]
ERROR: libmbim-1.30.0-r0 do_packagedata_setscene: QA Issue: Package version for package libmbim-dev went backwards which would break package feeds (from 0:1.31.1-r0 to 0:1.30.0-r0) [version-going-backwards]
ERROR: libmbim-1.30.0-r0 do_packagedata_setscene: QA Issue: Package version for package libmbim-doc went backwards which would break package feeds (from 0:1.31.1-r0 to 0:1.30.0-r0) [version-going-backwards]
ERROR: libmbim-1.30.0-r0 do_packagedata_setscene: QA Issue: Package version for package libmbim-locale went backwards which would break package feeds (from 0:1.31.1-r0 to 0:1.30.0-r0) [version-going-backwards]
ERROR: libmbim-1.30.0-r0 do_packagedata_setscene: QA Issue: Package version for package libmbim went backwards which would break package feeds (from 0:1.31.1-r0 to 0:1.30.0-r0) [version-going-backwards]
ERROR: libmbim-1.30.0-r0 do_packagedata_setscene: QA Issue: Package version for package libmbim-bash-completion went backwards which would break package feeds (from 0:1.31.1-r0 to 0:1.30.0-r0) [version-going-backwards]
ERROR: libmbim-1.30.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2813810258874773141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/modemmanager/modemmanager: FILELIST: removed "/usr/lib/udev/rules.d/77-mm-mtk-port-types.rules", added "/usr/lib/udev/rules.d/77-mm-mtk-legacy-port-types.rules /usr/lib/ModemManager/libmm-plugin-mtk-legacy.so"
Changes to packages/core2-64-poky-linux/modemmanager (sysroot):
  /usr/lib/ModemManager/libmm-plugin-mtk-legacy.so was added
  /usr/lib/udev/rules.d/77-mm-mtk-legacy-port-types.rules was added
  /usr/lib/udev/rules.d/77-mm-mtk-port-types.rules was removed

--===============2813810258874773141==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-modemmanager-upgrade-1.22.0-1.23.1.patch"

RnJvbSBhZDMyYjUyZmU4N2U2ZWRjMzg4NTgwMmNiYjg1Yjg1MjRlNGMxNTZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNjowODo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1v
ZGVtbWFuYWdlcjogdXBncmFkZSAxLjIyLjAgLT4gMS4yMy4xCgotLS0KIC4uLi97bW9kZW1tYW5h
Z2VyXzEuMjIuMC5iYiA9PiBtb2RlbW1hbmFnZXJfMS4yMy4xLmJifSAgICAgICAgfCA0ICsrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2RlbW1hbmFnZXIve21vZGVtbWFuYWdlcl8x
LjIyLjAuYmIgPT4gbW9kZW1tYW5hZ2VyXzEuMjMuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vZGVtbWFuYWdlci9tb2RlbW1hbmFnZXJfMS4y
Mi4wLmJiIGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2RlbW1hbmFnZXIvbW9kZW1t
YW5hZ2VyXzEuMjMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhLW9l
L3JlY2lwZXMtY29ubmVjdGl2aXR5L21vZGVtbWFuYWdlci9tb2RlbW1hbmFnZXJfMS4yMi4wLmJi
CnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vZGVtbWFuYWdlci9tb2Rl
bW1hbmFnZXJfMS4yMy4xLmJiCmluZGV4IDk1ODg0ZjQ0Yy4uNzk0ZTYwYTQ3IDEwMDY0NAotLS0g
YS9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vZGVtbWFuYWdlci9tb2RlbW1hbmFnZXJf
MS4yMi4wLmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9kZW1tYW5hZ2Vy
L21vZGVtbWFuYWdlcl8xLjIzLjEuYmIKQEAgLTEyLDggKzEyLDggQEAgaW5oZXJpdCBnbm9tZWJh
c2UgZ2V0dGV4dCBzeXN0ZW1kIGdvYmplY3QtaW50cm9zcGVjdGlvbiBiYXNoLWNvbXBsZXRpb24K
IAogREVQRU5EUyA9ICJnbGliLTIuMCBsaWJndWRldiBsaWJ4c2x0LW5hdGl2ZSBkYnVzIgogCi1T
UkNSRVYgPSAiMDNmNzg2Y2U2NjM2MGQ2N2M2NjlmNGYxMjJmOGFhNDU4ZTZmMDFlYSIKLVNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tb2JpbGUtYnJvYWRiYW5kL01vZGVt
TWFuYWdlci5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1tLTEtMjIiCitTUkNSRVYgPSAiMjlm
ODE1NGVmNzYyYzE3M2ExNDE5OWM4NWNlMGJiZDRjZTE4OGFiZSIKK1NSQ19VUkkgPSAiZ2l0Oi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tb2JpbGUtYnJvYWRiYW5kL01vZGVtTWFuYWdlci5naXQ7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0g
CjIuMzkuMgoK

--===============2813810258874773141==--

