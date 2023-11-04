Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9040EC05027
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.3562.1699067575009163689
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DxllPiXm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=S1KyrNK3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b9851b830-726185ce-3c89-40da-9eb0-4232d8b8fcf0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z70WnjMaahe2YkYW6K2RaTqthK8UIO4SCDtKQA6kCZs=;
	b=DxllPiXmKxSorSbhNra7aemf7zXaaUvyLeYvD3tsG5sNfU+ES8OYnYqmcsAZcIVn
	9Nx+hwUUCw2AKVSyImEaoPi5rdwxkUhSs+jZjTH6QpU5O+eR2iApNqqTTrtGWk1WhuW
	LwMCh66Tt47pgs261gTB2dStFt2nq3FpxxSHjTag=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z70WnjMaahe2YkYW6K2RaTqthK8UIO4SCDtKQA6kCZs=;
	b=S1KyrNK3+cM7kxAj3s9ABzM8cxZhUQ60PdN4w5/aHeHUXp3wPgoWDJqGHMb37OnE
	l1ISAkGbgMGSj6hRkMOP0id9NQnax8maXbxBGPvW2+ChwTtQDLCP1TF2qI7GojjdfT5
	9ndUUVHP6IUjcJhtzCusxIExbboOW2+Ze2UpMEu0=
Content-Type: multipart/mixed; boundary="===============7587771666440407895=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] networkmanager: upgrading to 1.44.2 SUCCEEDED
Message-ID: <0101018b9851b830-726185ce-3c89-40da-9eb0-4232d8b8fcf0-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106216

--===============7587771666440407895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *networkmanager* to *1.44.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-networkmanager-upgrade-1.44.0-1.44.2.patch
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
From 66327f0d9249758c958ee9799d4e07a4a5b225c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 02:31:52 +0000
Subject: [PATCH] networkmanager: upgrade 1.44.0 -> 1.44.2

---
 .../{networkmanager_1.44.0.bb => networkmanager_1.44.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.44.0.bb => networkmanager_1.44.2.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.2.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.2.bb
index 8d1c877ba..2158cdebb 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.2.bb
@@ -33,7 +33,7 @@ SRC_URI = " \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "edca09637d182f806b3b12d8c5623d7badbd73ccca1ae63be20d2f298779fb9f"
+SRC_URI[sha256sum] = "4b58bf3ac57e2cefb5652efd0945eb0b4bc36a63d92a61ab471d8bb2c9a420e1"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.39.2


--===============7587771666440407895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/networkmanager: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager: SRC_URI changed from "https://download.gnome.org/sources//NetworkManager/1.44/NetworkManager-1.44.0.tar.xz file://networkmanager.initd file://enable-dhcpcd.conf file://enable-iwd.conf" to "https://download.gnome.org/sources//NetworkManager/1.44/NetworkManager-1.44.2.tar.xz file://networkmanager.initd file://enable-dhcpcd.conf file://enable-iwd.conf"
packages/core2-64-poky-linux/networkmanager: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/libnm: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/libnm: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-adsl: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-adsl: FILES: removed "/usr/lib/NetworkManager/1.44.0/libnm-device-plugin-adsl.so", added "/usr/lib/NetworkManager/1.44.2/libnm-device-plugin-adsl.so"
packages/core2-64-poky-linux/networkmanager/networkmanager-adsl: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-bluetooth: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-bluetooth: FILES: removed "/usr/lib/NetworkManager/1.44.0/libnm-device-plugin-bluetooth.so", added "/usr/lib/NetworkManager/1.44.2/libnm-device-plugin-bluetooth.so"
packages/core2-64-poky-linux/networkmanager/networkmanager-bluetooth: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-cloud-setup: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-cloud-setup: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-daemon: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-daemon: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-dbg: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-dbg: PKGSIZE changed from 42654208 to 42661376 (+0%)
packages/core2-64-poky-linux/networkmanager/networkmanager-dbg: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-dev: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-dev: PKGSIZE changed from 4434933 to 4435172 (+0%)
packages/core2-64-poky-linux/networkmanager/networkmanager-dev: FILES: removed "/usr/lib/NetworkManager/1.44.0/*.la", added "/usr/lib/NetworkManager/1.44.2/*.la"
packages/core2-64-poky-linux/networkmanager/networkmanager-dev: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-doc: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-doc: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-as: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-as: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-be+latin: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-be+latin: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-bg: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-bg: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-bn-in: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-bn-in: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-bs: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-bs: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ca: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ca: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-cs: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-cs: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-da: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-da: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-de: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-de: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-dz: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-dz: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-el: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-el: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-en-ca: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-en-ca: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-en-gb: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-en-gb: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-eo: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-eo: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-es: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-es: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-et: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-et: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-eu: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-eu: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-fi: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-fi: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-fr: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-fr: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-gd: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-gd: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-gl: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-gl: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-gu: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-gu: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-he: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-he: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-hi: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-hi: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-hr: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-hr: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-hu: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-hu: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-id: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-id: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-it: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-it: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ja: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ja: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ka: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ka: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-kn: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-kn: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ko: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ko: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ku: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ku: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-lt: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-lt: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-lv: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-lv: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-mk: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-mk: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ml: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ml: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-mr: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-mr: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-nb: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-nb: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ne: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ne: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-nl: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-nl: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-oc: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-oc: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-or: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-or: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-pa: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-pa: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-pl: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-pl: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-pt-br: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-pt-br: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-pt: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-pt: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ro: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ro: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ru: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ru: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-rw: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-rw: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sk: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sk: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sl: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sl: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sq: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sq: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sr+latin: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sr+latin: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sr: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sr: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sv: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-sv: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ta: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-ta: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-te: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-te: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-th: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-th: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-tr: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-tr: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-uk: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-uk: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-vi: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-vi: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-wa: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-wa: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-zh-cn: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-zh-cn: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-zh-hk: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-zh-hk: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-zh-tw: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-locale-zh-tw: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-nmcli-bash-completion: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-nmcli-bash-completion: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-nmcli: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-nmcli: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-nmtui: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-nmtui: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-ovs: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-ovs: FILES: removed "/usr/lib/NetworkManager/1.44.0/libnm-device-plugin-ovs.so", added "/usr/lib/NetworkManager/1.44.2/libnm-device-plugin-ovs.so"
packages/core2-64-poky-linux/networkmanager/networkmanager-ovs: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-ppp: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-ppp: FILES: removed "/usr/lib/NetworkManager/1.44.0/libnm-ppp-plugin.so", added "/usr/lib/NetworkManager/1.44.2/libnm-ppp-plugin.so"
packages/core2-64-poky-linux/networkmanager/networkmanager-ppp: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-src: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-src: PKGSIZE changed from 22092153 to 22095338 (+0%)
packages/core2-64-poky-linux/networkmanager/networkmanager-src: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-staticdev: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-staticdev: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-wifi: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-wifi: FILES: removed "/usr/lib/NetworkManager/1.44.0/libnm-device-plugin-wifi.so", added "/usr/lib/NetworkManager/1.44.2/libnm-device-plugin-wifi.so"
packages/core2-64-poky-linux/networkmanager/networkmanager-wifi: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager-wwan: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager-wwan: FILES: removed "/usr/lib/NetworkManager/1.44.0/libnm-device-plugin-wwan.so /usr/lib/NetworkManager/1.44.0/libnm-wwan.so", added "/usr/lib/NetworkManager/1.44.2/libnm-device-plugin-wwan.so /usr/lib/NetworkManager/1.44.2/libnm-wwan.so"
packages/core2-64-poky-linux/networkmanager/networkmanager-wwan: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
packages/core2-64-poky-linux/networkmanager/networkmanager: PV changed from "1.44.0" to "1.44.2"
packages/core2-64-poky-linux/networkmanager/networkmanager: PKGV changed from 1.44.0 [default] to 1.44.2 [default]
Changes to packages/core2-64-poky-linux/networkmanager (sysroot):
  /usr/lib/NetworkManager/1.44.0 moved to /usr/lib/NetworkManager/1.44.2

--===============7587771666440407895==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-networkmanager-upgrade-1.44.0-1.44.2.patch"

RnJvbSA2NjMyN2YwZDkyNDk3NThjOTU4ZWU5Nzk5ZDRlMDdhNGE1YjIyNWMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMjozMTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5l
dHdvcmttYW5hZ2VyOiB1cGdyYWRlIDEuNDQuMCAtPiAxLjQ0LjIKCi0tLQogLi4uL3tuZXR3b3Jr
bWFuYWdlcl8xLjQ0LjAuYmIgPT4gbmV0d29ya21hbmFnZXJfMS40NC4yLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L25ldHdvcmttYW5hZ2VyL3tuZXR3
b3JrbWFuYWdlcl8xLjQ0LjAuYmIgPT4gbmV0d29ya21hbmFnZXJfMS40NC4yLmJifSAoOTklKQoK
ZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZXR3b3Jr
bWFuYWdlci9uZXR3b3JrbWFuYWdlcl8xLjQ0LjAuYmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBl
cy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXJfMS40NC4yLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9uZXR3b3JrbWFuYWdlci9uZXR3b3JrbWFuYWdlcl8xLjQ0LjAuYmIKcmVuYW1l
IHRvIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZXR3b3JrbWFuYWdlci9u
ZXR3b3JrbWFuYWdlcl8xLjQ0LjIuYmIKaW5kZXggOGQxYzg3N2JhLi4yMTU4Y2RlYmIgMTAwNjQ0
Ci0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZXR3b3JrbWFuYWdl
ci9uZXR3b3JrbWFuYWdlcl8xLjQ0LjAuYmIKKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L25ldHdvcmttYW5hZ2VyL25ldHdvcmttYW5hZ2VyXzEuNDQuMi5iYgpAQCAt
MzMsNyArMzMsNyBAQCBTUkNfVVJJID0gIiBcCiAiCiBTUkNfVVJJOmFwcGVuZDpsaWJjLW11c2wg
PSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdsZC1pcy1sbGQnLCAn
IGZpbGU6Ly8wMDAxLWxpbmtlci1zY3JpcHRzLURvLW5vdC1leHBvcnQtX0lPX3N0ZGluX3VzZWQu
cGF0Y2gnLCAnJywgZCl9IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWRjYTA5NjM3ZDE4MmY4
MDZiM2IxMmQ4YzU2MjNkN2JhZGJkNzNjY2NhMWFlNjNiZTIwZDJmMjk4Nzc5ZmI5ZiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI0YjU4YmYzYWM1N2UyY2VmYjU2NTJlZmQwOTQ1ZWIwYjRiYzM2YTYz
ZDkyYTYxYWI0NzFkOGJiMmM5YTQyMGUxIgogCiBTID0gIiR7V09SS0RJUn0vTmV0d29ya01hbmFn
ZXItJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============7587771666440407895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/networkmanager (sysroot):
  /usr/lib/NetworkManager/1.44.0 moved to /usr/lib/NetworkManager/1.44.2

--===============7587771666440407895==--

