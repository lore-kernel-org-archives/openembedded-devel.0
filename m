Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA92C04FDE
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4706.1699074741577088348
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GU23eOyO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=T1shSFlw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b98bf190d-a7256544-ef70-4a7b-83c4-a4aff6142eb7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mqpPnH8HPtIJ9Q7rxyZ7U7SMdiSzWcCtsSOtkl8hrXo=;
	b=GU23eOyOvsH3yMLGyhNRl7mmEeF9aJxoTvrYZO++guPOJbVrQEEfUu/MNAfB4oXj
	JafMkI6ctqhBdBI/PDJov5I7od6iAch43M8Txhr3pGQHBHXQvGjKTwCnWiobOWrqhO0
	4KPJFvGuJTRw6MDYf61fwxfbFwc9h2GJUU5W5l90=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mqpPnH8HPtIJ9Q7rxyZ7U7SMdiSzWcCtsSOtkl8hrXo=;
	b=T1shSFlwiuOUdz7WROTrDU/qrMXHl1A0OwxJg5TmgekFh6uQC5WPZSdK7JPEkvLj
	EM/oHys3glIh1QzWQZ9E6KD4vXlrDYMIfT7u4fbLCRAF+nwRqy7XSApWA++h4qZxEM4
	jSczQYwyKFXRUYmpICT8Otkf58PeSdhiITDtLRAg=
Content-Type: multipart/mixed; boundary="===============0568658283728845154=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] network-manager-applet: upgrading to 1.34.0 SUCCEEDED
Message-ID: <0101018b98bf190d-a7256544-ef70-4a7b-83c4-a4aff6142eb7-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106291

--===============0568658283728845154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *network-manager-applet* to *1.34.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-network-manager-applet-upgrade-1.32.0-1.34.0.patch
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
From 2db45eb8bffec4b3f0811ccdb87e0207919137b0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:56:19 +0000
Subject: [PATCH] network-manager-applet: upgrade 1.32.0 -> 1.34.0

---
 ...anager-applet_1.32.0.bb => network-manager-applet_1.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.32.0.bb => network-manager-applet_1.34.0.bb} (91%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb
similarity index 91%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb
index 058aeb58d..5ce1b9b14 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb
@@ -11,7 +11,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[archive.sha256sum] = "a2b5affa1505ad43902959fdbe09e5bcec57b11ed333fa60458ffb9c62efba38"
+SRC_URI[archive.sha256sum] = "ab368e470f6b161fc8b834bc97912b7e79af92b8cd7ea399c2d400ce89aba5a8"
 
 # We don't not have ubuntu's appindicator (yet?)
 EXTRA_OEMESON = "-Dappindicator=no"
-- 
2.39.2


--===============0568658283728845154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/network-manager-applet: SRC_URI changed from "https://download.gnome.org/sources//network-manager-applet/1.32/network-manager-applet-1.32.0.tar.xz;name=archive" to "https://download.gnome.org/sources//network-manager-applet/1.34/network-manager-applet-1.34.0.tar.xz;name=archive"
packages/core2-64-poky-linux/network-manager-applet: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-dbg: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-dbg: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-dbg: PKGSIZE changed from 2106688 to 2106784 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-dev: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-dev: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-doc: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-doc: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-af: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-af: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-af: PKGSIZE changed from 7557 to 7563 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-an: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-an: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-an: PKGSIZE changed from 15127 to 15133 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ar: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ar: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ar: PKGSIZE changed from 16428 to 16434 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-as: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-as: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-as: PKGSIZE changed from 44584 to 44590 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ast: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ast: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ast: PKGSIZE changed from 18186 to 18192 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-be+latin: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-be+latin: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-be+latin: PKGSIZE changed from 7950 to 7956 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-be: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-be: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-be: PKGSIZE changed from 100637 to 100148 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-bg: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-bg: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-bg: PKGSIZE changed from 38899 to 38905 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-bn-in: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-bn-in: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-bn-in: PKGSIZE changed from 27378 to 27384 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-bs: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-bs: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-bs: PKGSIZE changed from 29950 to 29956 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ca+valencia: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ca+valencia: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ca+valencia: PKGSIZE changed from 31131 to 31137 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ca: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ca: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ca: PKGSIZE changed from 82142 to 84002 (+2%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-crh: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-crh: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-crh: PKGSIZE changed from 27005 to 27011 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-cs: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-cs: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-cs: PKGSIZE changed from 81038 to 81686 (+1%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-da: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-da: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-da: PKGSIZE changed from 81415 to 81087 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-de: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-de: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-de: PKGSIZE changed from 85470 to 85890 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-dz: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-dz: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-dz: PKGSIZE changed from 3747 to 3753 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-el: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-el: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-el: PKGSIZE changed from 39788 to 39794 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-en-ca: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-en-ca: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-en-ca: PKGSIZE changed from 1781 to 1787 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-en-gb: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-en-gb: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-en-gb: PKGSIZE changed from 25727 to 25733 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-eo: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-eo: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-eo: PKGSIZE changed from 26439 to 26445 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-es: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-es: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-es: PKGSIZE changed from 83433 to 83368 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-et: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-et: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-et: PKGSIZE changed from 26601 to 26607 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-eu: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-eu: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-eu: PKGSIZE changed from 81940 to 81606 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-fa: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-fa: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-fa: PKGSIZE changed from 25829 to 25835 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-fi: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-fi: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-fi: PKGSIZE changed from 59718 to 59724 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-fr: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-fr: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-fr: PKGSIZE changed from 85920 to 85561 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-gd: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-gd: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-gd: PKGSIZE changed from 51597 to 51603 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-gl: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-gl: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-gl: PKGSIZE changed from 65499 to 65155 (-1%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-gu: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-gu: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-gu: PKGSIZE changed from 37355 to 37361 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-he: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-he: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-he: PKGSIZE changed from 48264 to 48270 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-hi: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-hi: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-hi: PKGSIZE changed from 38437 to 38443 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-hr: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-hr: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-hr: PKGSIZE changed from 81759 to 81437 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-hu: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-hu: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-hu: PKGSIZE changed from 78394 to 78015 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-id: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-id: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-id: PKGSIZE changed from 79203 to 78889 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ie: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ie: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ie: PKGSIZE changed from 16376 to 16382 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-is: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-is: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-is: PKGSIZE changed from 50048 to 50054 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-it: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-it: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-it: PKGSIZE changed from 80491 to 82637 (+3%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ja: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ja: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ja: PKGSIZE changed from 90337 to 89939 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ka: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ka: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ka: PKGSIZE changed from 29127 to 29133 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-kk: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-kk: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-kk: PKGSIZE changed from 55352 to 55358 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-km: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-km: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-km: PKGSIZE changed from 47630 to 47636 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-kn: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-kn: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-kn: PKGSIZE changed from 27852 to 27858 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ko: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ko: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ko: PKGSIZE changed from 30143 to 30149 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ku: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ku: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ku: PKGSIZE changed from 5718 to 5724 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-lt: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-lt: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-lt: PKGSIZE changed from 82237 to 81904 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-lv: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-lv: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-lv: PKGSIZE changed from 73396 to 73073 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-mk: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-mk: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-mk: PKGSIZE changed from 23426 to 23432 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ml: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ml: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ml: PKGSIZE changed from 48009 to 48015 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-mr: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-mr: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-mr: PKGSIZE changed from 27692 to 27698 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ms: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ms: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ms: PKGSIZE changed from 18257 to 18263 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-nb: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-nb: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-nb: PKGSIZE changed from 57308 to 57314 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ne: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ne: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ne: PKGSIZE changed from 2996 to 3002 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-nl: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-nl: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-nl: PKGSIZE changed from 83048 to 82708 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-nn: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-nn: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-nn: PKGSIZE changed from 19603 to 19609 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-oc: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-oc: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-oc: PKGSIZE changed from 56863 to 56820 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-or: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-or: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-or: PKGSIZE changed from 27299 to 27305 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pa: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pa: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pa: PKGSIZE changed from 71705 to 71639 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pl: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pl: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pl: PKGSIZE changed from 83885 to 84325 (+1%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pt-br: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pt-br: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pt-br: PKGSIZE changed from 81784 to 81455 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pt: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pt: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-pt: PKGSIZE changed from 83130 to 83540 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ro: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ro: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ro: PKGSIZE changed from 25723 to 25729 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ru: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ru: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ru: PKGSIZE changed from 108173 to 107685 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-rw: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-rw: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-rw: PKGSIZE changed from 481 to 487 (+1%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sk: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sk: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sk: PKGSIZE changed from 56763 to 56769 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sl: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sl: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sl: PKGSIZE changed from 59864 to 59598 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sq: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sq: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sq: PKGSIZE changed from 510 to 516 (+1%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sr+latin: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sr+latin: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sr+latin: PKGSIZE changed from 66329 to 65967 (-1%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sr: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sr: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sr: PKGSIZE changed from 102066 to 101640 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sv: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sv: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-sv: PKGSIZE changed from 81932 to 82311 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ta: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ta: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ta: PKGSIZE changed from 32588 to 32594 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-te: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-te: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-te: PKGSIZE changed from 35967 to 35973 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-tg: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-tg: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-tg: PKGSIZE changed from 14823 to 14829 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-th: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-th: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-th: PKGSIZE changed from 30768 to 30774 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-tr: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-tr: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-tr: PKGSIZE changed from 83372 to 83782 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ug: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ug: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ug: PKGSIZE changed from 33474 to 33480 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-uk: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-uk: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-uk: PKGSIZE changed from 107686 to 108221 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ur: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ur: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-ur: PKGSIZE changed from 15263 to 15269 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-vi: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-vi: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-vi: PKGSIZE changed from 30296 to 30302 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-wa: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-wa: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-wa: PKGSIZE changed from 513 to 519 (+1%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-zh-cn: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-zh-cn: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-zh-cn: PKGSIZE changed from 75250 to 75809 (+1%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-zh-hk: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-zh-hk: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-zh-hk: PKGSIZE changed from 27927 to 27933 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-zh-tw: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-zh-tw: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-locale-zh-tw: PKGSIZE changed from 71354 to 71287 (-0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-src: FILELIST: directory renamed /usr/src/debug/network-manager-applet/1.32.0-r0/src/utils -> /usr/src/debug/network-manager-applet/1.34.0-r0/src/utils, directory renamed /usr/src/debug/network-manager-applet/1.32.0-r0/shared/nm-utils -> /usr/src/debug/network-manager-applet/1.34.0-r0/shared/nm-utils, directory renamed /usr/src/debug/network-manager-applet/1.32.0-r0/src -> /usr/src/debug/network-manager-applet/1.34.0-r0/src, directory renamed /usr/src/debug/network-manager-applet/1.32.0-r0/src/wireless-security -> /usr/src/debug/network-manager-applet/1.34.0-r0/src/wireless-security, removed "/usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-infiniband.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-team-port.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-general.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-
 editor/page-bridge-port.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-ip-tunnel.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-infiniband.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-8021x-security.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-ip-tunnel.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-bridge-port.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-general.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-team-port.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ip6-routes-dialog.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-ip4.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-bluetooth.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/nm-connection-list.h /usr/sr
 c/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ce-utils.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/nm-connection-list.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-bluetooth.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-ip4.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ip6-routes-dialog.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ce-utils.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-ppp.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-ip6.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/vpn-helpers.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-ip6.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/main.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-ppp.c /usr/src
 /debug/network-manager-applet/1.32.0-r0/src/connection-editor/vpn-helpers.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-master.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/connection-helpers.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-vpn.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-ethernet.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ip4-routes-dialog.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ce-polkit.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-vpn.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-wifi-security.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/connection-helpers.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-master.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connecti
 on-editor/ce-polkit.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ip4-routes-dialog.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-ethernet.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-wifi-security.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-dcb.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ce-resources.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-dcb.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ce-polkit-button.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-wireguard.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-proxy.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ce-page.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/nm-connection-editor.h /usr/src/debug/network-manage
 r-applet/1.32.0-r0/src/connection-editor/page-wireguard.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ce-polkit-button.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/nm-connection-editor.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ce-page.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-proxy.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ppp-auth-methods-dialog.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-bond.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-team.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-vlan.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-macsec.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-wifi.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-bond.h /usr
 /src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-team.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-vlan.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-wifi.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/ppp-auth-methods-dialog.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-macsec.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-bridge.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-mobile.c /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-dsl.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-8021x-security.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-mobile.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-editor/page-bridge.h /usr/src/debug/network-manager-applet/1.32.0-r0/src/connection-edi
 tor/page-dsl.c", added "/usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-infiniband.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-team-port.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-general.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-bridge-port.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-ip-tunnel.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-infiniband.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-ip-tunnel.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-bridge-port.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-general.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-team-port.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ip6-routes-dialog.c /usr/src/de
 bug/network-manager-applet/1.34.0-r0/src/connection-editor/page-ip4.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-bluetooth.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/nm-connection-list.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ce-utils.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/nm-connection-list.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-bluetooth.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-ip4.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ip6-routes-dialog.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ce-utils.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-ppp.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-ip6.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/vpn-he
 lpers.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-ip6.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/main.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-ppp.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-bridge.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/vpn-helpers.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/connection-helpers.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-vpn.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-ethernet.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ip4-routes-dialog.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ce-polkit.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-vpn.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/p
 age-wifi-security.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/connection-helpers.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ce-polkit.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ip4-routes-dialog.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-ethernet.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-wifi-security.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-dcb.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ce-resources.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-dcb.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ce-polkit-button.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-wireguard.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-proxy.h /usr/src/debug/network-manager-
 applet/1.34.0-r0/src/connection-editor/ce-page.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/nm-connection-editor.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-wireguard.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ce-polkit-button.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/nm-connection-editor.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ce-page.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-proxy.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-controller.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ppp-auth-methods-dialog.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-bond.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-team.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-
 vlan.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-macsec.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-wifi.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-bond.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-team.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-controller.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-vlan.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-wifi.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-macsec.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/ppp-auth-methods-dialog.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-bridge.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-mobile.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connecti
 on-editor/page-dsl.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-8021x-security.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-mobile.h /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-8021x-security.c /usr/src/debug/network-manager-applet/1.34.0-r0/src/connection-editor/page-dsl.c"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-src: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-src: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-src: PKGSIZE changed from 3841057 to 3842900 (+0%)
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-staticdev: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet-staticdev: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet: PV changed from "1.32.0" to "1.34.0"
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet: PKGV changed from 1.32.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/network-manager-applet/network-manager-applet: PKGSIZE changed from 1355026 to 1355113 (+0%)

--===============0568658283728845154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4889 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3052 cached, 3 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 144 recipes from the core2-64 sysroot...done.
Removing 155 recipes from the qemux86_64 sysroot...done.
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
meta-webserver       = "tmp-auh-upgrades:5f45245fc81263f18c0ae4ddc90a8737f5af8af4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1285 Local 1269 Mirrors 0 Missed 16 Current 312 (98% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 5 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 324 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 327 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 328 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 329 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 333 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-support/dnsmasq/dnsmasq_2.89.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 337 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 342 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 343 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dnsmasq-2.89-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx_setscene: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnma-1.10.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nftables-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libnma-1.10.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 353 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_create_spdx_setscene)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 354 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 355 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_recipe_qa_setscene)
NOTE: recipe wpa-supplicant-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_create_spdx_setscene)
NOTE: recipe networkmanager-1.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nftables-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 362 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_packagedata_setscene)
NOTE: recipe dnsmasq-2.89-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 364 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/jansson/jansson_2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_create_spdx_setscene)
NOTE: Running setscene task 378 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 379 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 380 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 381 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata_setscene: Started
NOTE: recipe gcr-4.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnma-1.10.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe gcr-4.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe jansson-2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe nss-3.74-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnftnl-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe networkmanager-1.44.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 386 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnma-1.10.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 389 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe gcr-4.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 399 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nss-3.74-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb:do_create_spdx_setscene)
NOTE: recipe jansson-2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 406 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 407 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnftnl-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe gcr-4.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_packagedata_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.12.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.12.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 643 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 646 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 688 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 717 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/networkmanager/1.44.0/temp/log.do_packagedata_setscene.1582616
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 747 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 757 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 774 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe gcr-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Started
NOTE: recipe p11-kit-0.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 545 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_fetch)
NOTE: recipe gcr-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 573 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_fetch)
NOTE: Running task 576 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_write_config)
NOTE: Running task 582 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_write_config)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 804 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe libnma-1.10.6-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe p11-kit-0.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnma-1.10.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 822 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 823 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_fetch: Started
NOTE: recipe libnma-1.10.6-r0: task do_write_config: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_write_config: Started
NOTE: recipe gtk4-4.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnma-1.10.6-r0: task do_write_config: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 838 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe networkmanager-1.44.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 850 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 852 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 855 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 862 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 869 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 870 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 874 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 877 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 881 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 885 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 887 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 888 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 915 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 919 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1339 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_unpack)
NOTE: Running task 1371 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 921 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 922 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 929 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 930 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 933 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libnma-1.10.6-r0: task do_unpack: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe networkmanager-1.44.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 935 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnma-1.10.6-r0: task do_unpack: Succeeded
NOTE: Running setscene task 936 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe networkmanager-1.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 939 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 940 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 941 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_populate_sysroot_setscene)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/newt/libnewt_0.52.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 943 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/newt/libnewt_0.52.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libndp-1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 949 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libndp-1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 950 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nss-3.74-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 952 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 954 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe nss-3.74-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libnewt-0.52.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libnewt-0.52.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 956 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libndp-1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe networkmanager-1.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 959 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: recipe nss-3.74-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nspr/nspr_4.35.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 962 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libndp-1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 964 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb:do_recipe_qa_setscene)
NOTE: recipe nss-3.74-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 967 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nspr/nspr_4.35.bb:do_populate_sysroot_setscene)
NOTE: recipe libnewt-0.52.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nss/nss_3.74.bb:do_recipe_qa_setscene)
NOTE: recipe networkmanager-1.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 971 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe nspr-4.35-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libndp-1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nspr-4.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nss-3.74-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 976 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 978 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libndp-1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 981 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nss-3.74-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe nspr-4.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 983 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 985 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 987 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 988 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libnewt-0.52.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/newt/libnewt_0.52.23.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 992 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/slang/slang_2.3.3.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 993 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/slang/slang_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nspr-4.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/nspr/nspr_4.35.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 997 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1000 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe libnewt-0.52.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe slang-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe slang-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nspr-4.35-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1007 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1010 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnewt-0.52.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1012 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe nspr-4.35-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1016 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1018 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1022 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe slang-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1026 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe slang-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1028 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/slang/slang_2.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1029 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1031 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1032 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1034 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1037 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe slang-2.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1040 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1041 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1042 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1045 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1046 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe slang-2.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1047 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1053 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1056 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1059 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1060 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1062 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1065 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1066 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1068 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1070 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1071 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1073 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1075 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1076 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1078 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1080 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1081 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1082 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1084 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1086 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1088 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1089 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1090 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1091 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1093 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1095 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1097 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1099 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: recipe consolekit-0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1100 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1102 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1103 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1104 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1105 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1107 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1110 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1111 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe consolekit-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1113 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1114 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1116 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1120 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: recipe consolekit-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1121 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1122 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1124 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1126 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1127 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1128 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1130 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1131 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1133 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1134 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1135 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1136 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1137 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-glib-0.112-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1139 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1141 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1143 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1144 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1146 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1149 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1151 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1152 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1153 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1154 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1156 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1157 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1160 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1161 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1164 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1165 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1167 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1168 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1171 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1173 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1176 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1178 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1179 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1181 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1182 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1184 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1185 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1187 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1189 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1191 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1194 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1196 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1197 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1198 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1201 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1202 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1204 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1205 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1209 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1212 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1213 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1214 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1216 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1218 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1220 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1221 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1223 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1226 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1228 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1231 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1234 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1236 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1237 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libnl/libnl_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1238 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libnl/libnl_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1240 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1241 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1243 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1245 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1248 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1250 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1251 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1253 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1254 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1255 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1256 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1258 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1260 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1262 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1264 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1265 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1266 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1267 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1268 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1270 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1273 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1275 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libnl/libnl_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1278 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre_8.45.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1281 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1282 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1284 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1286 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1288 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1291 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1293 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1294 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1296 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1297 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1299 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre-8.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1300 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1302 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1304 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1306 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1307 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1310 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1311 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1312 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1313 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1314 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1315 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1317 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1318 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1320 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1321 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1322 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1324 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1326 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1328 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1329 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1333 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1335 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1336 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1340 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1341 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1352 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1354 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1384 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1385 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1386 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1388 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1390 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1392 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1393 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1395 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1397 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: Running setscene task 1399 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1400 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1401 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1403 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1405 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1406 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1407 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1409 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1420 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1425 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1428 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1430 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1432 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2064 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_patch)
NOTE: Running task 2068 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_patch)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1434 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1435 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe network-manager-applet-1.34.0-r0: task do_patch: Started
NOTE: recipe libnma-1.10.6-r0: task do_patch: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnma-1.10.6-r0: task do_patch: Succeeded
NOTE: recipe network-manager-applet-1.34.0-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1438 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1439 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1440 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1441 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1442 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1444 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1445 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1446 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1447 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1448 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1449 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1450 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1451 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1453 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1455 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1456 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1457 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1458 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1460 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1461 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1462 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1464 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1466 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1467 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1470 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1472 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1479 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1481 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1484 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1487 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1489 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1490 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1493 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1495 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1497 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1499 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1501 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1502 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1503 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1504 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1506 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1507 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1508 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1509 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1510 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1511 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1512 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1514 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1518 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1520 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1523 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1526 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1527 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1528 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1531 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1533 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1534 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1536 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1538 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1539 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1544 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1549 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1551 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1552 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1554 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1556 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1557 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1559 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1560 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1562 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1564 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1565 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1566 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1568 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1570 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1572 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1578 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1579 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1581 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1584 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1586 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1587 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1589 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1597 of 1597 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4056 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_packagedata)
NOTE: Running task 4076 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe networkmanager-1.44.0-r0: task do_packagedata: Started
NOTE: recipe libnma-1.10.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4313 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_collect_spdx_deps)
NOTE: Running task 4314 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_package_write_ipk)
NOTE: Running task 4315 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_package_write_deb)
NOTE: Running task 4316 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_package_write_rpm)
NOTE: recipe libnma-1.10.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_package_write_ipk: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_package_write_deb: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_package_write_rpm: Started
NOTE: recipe libnma-1.10.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4317 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_configure)
NOTE: recipe libnma-1.10.6-r0: task do_configure: Started
NOTE: recipe libnma-1.10.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnma-1.10.6-r0: task do_configure: Succeeded
NOTE: Running task 4318 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_compile)
NOTE: recipe libnma-1.10.6-r0: task do_compile: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe networkmanager-1.44.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnma-1.10.6-r0: task do_compile: Succeeded
NOTE: Running task 4319 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_install)
NOTE: recipe libnma-1.10.6-r0: task do_install: Started
NOTE: recipe libnma-1.10.6-r0: task do_install: Succeeded
NOTE: Running task 4320 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_package)
NOTE: Running task 4321 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_populate_sysroot)
NOTE: recipe libnma-1.10.6-r0: task do_package: Started
NOTE: recipe libnma-1.10.6-r0: task do_populate_sysroot: Started
NOTE: recipe libnma-1.10.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4322 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4323 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_configure)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_configure: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe network-manager-applet-1.34.0-r0: task do_configure: Succeeded
NOTE: Running task 4324 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_compile)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_compile: Started
NOTE: recipe libnma-1.10.6-r0: task do_package: Succeeded
NOTE: Running task 4325 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_packagedata)
NOTE: recipe libnma-1.10.6-r0: task do_packagedata: Started
NOTE: recipe libnma-1.10.6-r0: task do_packagedata: Succeeded
NOTE: Running task 4326 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb:do_create_spdx)
NOTE: recipe libnma-1.10.6-r0: task do_create_spdx: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_compile: Succeeded
NOTE: Running task 4327 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_install)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_install: Started
NOTE: recipe libnma-1.10.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 4328 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_collect_spdx_deps)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_install: Succeeded
NOTE: Running task 4329 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_package)
NOTE: Running task 4330 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_populate_sysroot)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe network-manager-applet-1.34.0-r0: task do_package: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_populate_sysroot: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe network-manager-applet-1.34.0-r0: task do_package: Succeeded
NOTE: Running task 4331 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_packagedata)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_packagedata: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4332 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_create_spdx)
NOTE: Running task 4333 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_package_write_ipk)
NOTE: Running task 4334 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_package_write_deb)
NOTE: Running task 4335 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_package_write_rpm)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_create_spdx: Started
NOTE: Running task 4336 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_package_qa)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_package_write_ipk: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_package_write_deb: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_package_write_rpm: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_package_qa: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4337 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_create_runtime_spdx)
NOTE: recipe network-manager-applet-1.34.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe network-manager-applet-1.34.0-r0: task do_package_qa: Succeeded
NOTE: recipe network-manager-applet-1.34.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe network-manager-applet-1.34.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe network-manager-applet-1.34.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe network-manager-applet-1.34.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 4338 of 4338 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb:do_build)
NOTE: Tasks Summary: Attempted 4338 tasks of which 4302 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 85 ERROR messages, returning a non-zero exit code.
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-src went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-dbg went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnm went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-adsl went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-bluetooth went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-cloud-setup went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-nmcli went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-nmcli-bash-completion went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-nmtui went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-wifi went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-wwan went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-ovs went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-ppp went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-daemon went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-staticdev went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-dev went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-doc went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-as went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-be+latin went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-bg went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-bn-in went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-bs went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-ca went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-cs went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-da went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-de went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-dz went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-el went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-en-ca went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-en-gb went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-eo went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-es went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-et went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-eu went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-fi went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-fr went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-gd went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-gl went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-gu went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-he went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-hi went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-hr went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-hu went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-id went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-it went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-ja went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-ka went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-kn went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-ko went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-ku went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-lt went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-lv went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-mk went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-ml went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-mr went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-nb went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-ne went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-nl went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-oc went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-or went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-pa went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-pl went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-pt went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-pt-br went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-ro went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-ru went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-rw went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-sk went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-sl went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-sq went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-sr went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-sr+latin went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-sv went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-ta went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-te went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-th went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-tr went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-uk went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-vi went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-wa went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-zh-cn went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-zh-hk went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package networkmanager-locale-zh-tw went backwards which would break package feeds (from 0:1.44.2-r0 to 0:1.44.0-r0) [version-going-backwards]
ERROR: networkmanager-1.44.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0568658283728845154==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-network-manager-applet-upgrade-1.32.0-1.34.0.patch"

RnJvbSAyZGI0NWViOGJmZmVjNGIzZjA4MTFjY2RiODdlMDIwNzkxOTEzN2IwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDo1NjoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5l
dHdvcmstbWFuYWdlci1hcHBsZXQ6IHVwZ3JhZGUgMS4zMi4wIC0+IDEuMzQuMAoKLS0tCiAuLi5h
bmFnZXItYXBwbGV0XzEuMzIuMC5iYiA9PiBuZXR3b3JrLW1hbmFnZXItYXBwbGV0XzEuMzQuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhLWdub21lL3JlY2lwZXMtY29ubmVjdGl2aXR5L25ldHdvcmstbWFuYWdlci1h
cHBsZXQve25ldHdvcmstbWFuYWdlci1hcHBsZXRfMS4zMi4wLmJiID0+IG5ldHdvcmstbWFuYWdl
ci1hcHBsZXRfMS4zNC4wLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEtZ25vbWUvcmVjaXBl
cy1jb25uZWN0aXZpdHkvbmV0d29yay1tYW5hZ2VyLWFwcGxldC9uZXR3b3JrLW1hbmFnZXItYXBw
bGV0XzEuMzIuMC5iYiBiL21ldGEtZ25vbWUvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29yay1t
YW5hZ2VyLWFwcGxldC9uZXR3b3JrLW1hbmFnZXItYXBwbGV0XzEuMzQuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhLWdub21lL3JlY2lwZXMtY29ubmVjdGl2aXR5L25l
dHdvcmstbWFuYWdlci1hcHBsZXQvbmV0d29yay1tYW5hZ2VyLWFwcGxldF8xLjMyLjAuYmIKcmVu
YW1lIHRvIG1ldGEtZ25vbWUvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29yay1tYW5hZ2VyLWFw
cGxldC9uZXR3b3JrLW1hbmFnZXItYXBwbGV0XzEuMzQuMC5iYgppbmRleCAwNThhZWI1OGQuLjVj
ZTFiOWIxNCAxMDA2NDQKLS0tIGEvbWV0YS1nbm9tZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZXR3
b3JrLW1hbmFnZXItYXBwbGV0L25ldHdvcmstbWFuYWdlci1hcHBsZXRfMS4zMi4wLmJiCisrKyBi
L21ldGEtZ25vbWUvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29yay1tYW5hZ2VyLWFwcGxldC9u
ZXR3b3JrLW1hbmFnZXItYXBwbGV0XzEuMzQuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBBTllfT0Zf
RElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVTfSIKIAogU1JDX1VSSTphcHBl
bmQ6bGliYy1tdXNsID0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAn
bGQtaXMtbGxkJywgJyBmaWxlOi8vMDAwMS1saW5rZXItc2NyaXB0cy1Eby1ub3QtZXhwb3J0LV9J
T19zdGRpbl91c2VkLnBhdGNoJywgJycsIGQpfSIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1
bV0gPSAiYTJiNWFmZmExNTA1YWQ0MzkwMjk1OWZkYmUwOWU1YmNlYzU3YjExZWQzMzNmYTYwNDU4
ZmZiOWM2MmVmYmEzOCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImFiMzY4ZTQ3MGY2
YjE2MWZjOGI4MzRiYzk3OTEyYjdlNzlhZjkyYjhjZDdlYTM5OWMyZDQwMGNlODlhYmE1YTgiCiAK
ICMgV2UgZG9uJ3Qgbm90IGhhdmUgdWJ1bnR1J3MgYXBwaW5kaWNhdG9yICh5ZXQ/KQogRVhUUkFf
T0VNRVNPTiA9ICItRGFwcGluZGljYXRvcj1ubyIKLS0gCjIuMzkuMgoK

--===============0568658283728845154==--

