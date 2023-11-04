Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3321C05054
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.5394.1699083060427429542
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B147+Tj7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ko8+RNaM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b993e04d9-12b48b0d-7674-4833-a179-a98fce47882b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MsHdWU6mYIX7i7KwtDLKXFVeaYMbEcOBV4dpN3IRd7g=;
	b=B147+Tj7Ul03rEICw+HHhdb73GOwKzStFwdgBhzIXvhBdJM5RLFQF40qwtWQLYgA
	T/JGWu3SsRr1+baBS0FxMXw7BuVK3mKNXCr5Mi4ye5SDNT3LjJtDQ98eLY4jqSFKIga
	+buW6ULm5rWd9PLKEjbEbpZHA16F7fsVa2Vrj3zM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MsHdWU6mYIX7i7KwtDLKXFVeaYMbEcOBV4dpN3IRd7g=;
	b=ko8+RNaMa3SlqUwJ5LlKCRpnij+phIfynYDvhoLAVGPUPJ0qaz4no9AsD1MW4ImU
	ytL2jrna1ICu3y8skUhbx9uPof/wM00QKo4CbPENEkMt/Yql6Hsi0pI9S9FB4Y/f2Wc
	IAuijXk7PGe7ktWhkdIh0VLepvz0SAWkCN0tiMUM=
Content-Type: multipart/mixed; boundary="===============6445483233405875194=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-screenshooter: upgrading to 1.10.4 SUCCEEDED
Message-ID: <0101018b993e04d9-12b48b0d-7674-4833-a179-a98fce47882b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106332

--===============6445483233405875194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-screenshooter* to *1.10.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-screenshooter-upgrade-1.10.3-1.10.4.patch
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
From d98919f843cd1b701f1171a8c2f755857207e4f4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:50:18 +0000
Subject: [PATCH] xfce4-screenshooter: upgrade 1.10.3 -> 1.10.4

---
 ...e4-screenshooter_1.10.3.bb => xfce4-screenshooter_1.10.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.10.3.bb => xfce4-screenshooter_1.10.4.bb} (87%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.3.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.4.bb
similarity index 87%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.3.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.4.bb
index 10427dab3..7c2ecd30d 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.4.bb
@@ -7,7 +7,7 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 glib-2.0 libsoup
 
 inherit xfce-app perlnative
 
-SRC_URI[sha256sum] = "a454159847becfeca274a5b58c0e5817d4a260a29345a37bbc3b4ff46f8f3818"
+SRC_URI[sha256sum] = "a2f199687e54e16a936d5636d660d42b6b9a5d548cdd0f04bd69213554806494"
 
 do_compile:prepend() {
     mkdir -p lib
-- 
2.39.2


--===============6445483233405875194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-screenshooter: SRC_URI changed from "http://archive.xfce.org/src/apps/xfce4-screenshooter/1.10/xfce4-screenshooter-1.10.3.tar.bz2" to "http://archive.xfce.org/src/apps/xfce4-screenshooter/1.10/xfce4-screenshooter-1.10.4.tar.bz2"
packages/core2-64-poky-linux/xfce4-screenshooter: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-dbg: PKGSIZE changed from 645464 to 650920 (+1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-dbg: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-dbg: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-dev: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-dev: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-doc: PKGSIZE changed from 1688 to 1806 (+7%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-doc: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-doc: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ar: PKGSIZE changed from 6107 to 5997 (-2%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ar: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ar: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ast: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ast: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-be: PKGSIZE changed from 11894 to 11754 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-be: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-be: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-bg: PKGSIZE changed from 16006 to 16607 (+4%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-bg: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-bg: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ca: PKGSIZE changed from 9054 to 8923 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ca: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ca: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-cs: PKGSIZE changed from 12761 to 12266 (-4%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-cs: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-cs: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-da: PKGSIZE changed from 10291 to 10174 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-da: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-da: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-de: PKGSIZE changed from 13059 to 13424 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-de: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-de: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-el: PKGSIZE changed from 13684 to 15940 (+16%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-el: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-el: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-en-au: PKGSIZE changed from 7277 to 7193 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-en-au: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-en-au: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-en-gb: PKGSIZE changed from 5201 to 12430 (+139%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-en-gb: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-en-gb: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-es: PKGSIZE changed from 12692 to 12234 (-4%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-es: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-es: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-et: PKGSIZE changed from 12106 to 11657 (-4%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-et: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-et: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-eu: PKGSIZE changed from 12502 to 12029 (-4%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-eu: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-eu: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-fa-ir: PKGSIZE changed from 11250 to 11106 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-fa-ir: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-fa-ir: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-fi: PKGSIZE changed from 7832 to 7711 (-2%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-fi: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-fi: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-fr: PKGSIZE changed from 13338 to 13756 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-fr: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-fr: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-gl: PKGSIZE changed from 10324 to 10190 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-gl: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-gl: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-he: PKGSIZE changed from 13620 to 14037 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-he: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-he: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hr: PKGSIZE changed from 7520 to 7391 (-2%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hr: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hr: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hu: PKGSIZE changed from 7613 to 7527 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hu: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hu: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hy-am: PKGSIZE changed from 8874 to 8788 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hy-am: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hy-am: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hye: PKGSIZE changed from 8873 to 8787 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hye: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-hye: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-id: PKGSIZE changed from 11682 to 11555 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-id: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-id: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ie: PKGSIZE changed from 5576 to 5493 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ie: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ie: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-is: PKGSIZE changed from 7529 to 7446 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-is: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-is: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-it: PKGSIZE changed from 12680 to 13026 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-it: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-it: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ja: PKGSIZE changed from 14157 to 14596 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ja: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ja: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ka: PKGSIZE changed from 10700 to 10574 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ka: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ka: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-kk: PKGSIZE changed from 5379 to 5220 (-3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-kk: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-kk: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ko: PKGSIZE changed from 12612 to 12978 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ko: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ko: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-lt: PKGSIZE changed from 12687 to 13068 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-lt: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-lt: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-lv: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-lv: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ms: PKGSIZE changed from 10317 to 10200 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ms: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ms: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-nb: PKGSIZE changed from 11932 to 11495 (-4%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-nb: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-nb: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-nl: PKGSIZE changed from 12772 to 13180 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-nl: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-nl: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-nn: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-nn: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-oc: PKGSIZE changed from 8162 to 8022 (-2%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-oc: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-oc: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-pa: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-pa: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-pl: PKGSIZE changed from 12858 to 13269 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-pl: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-pl: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-pt-br: PKGSIZE changed from 12652 to 13060 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-pt-br: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-pt-br: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-pt: PKGSIZE changed from 12597 to 12989 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-pt: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-pt: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ro: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ro: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ru: PKGSIZE changed from 16100 to 16603 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ru: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ru: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-si: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-si: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sk: PKGSIZE changed from 12624 to 12137 (-4%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sk: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sk: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sl: PKGSIZE changed from 11660 to 12490 (+7%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sl: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sl: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sq: PKGSIZE changed from 12599 to 12971 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sq: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sq: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sr: PKGSIZE changed from 15612 to 16157 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sr: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sr: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sv: PKGSIZE changed from 12285 to 12637 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sv: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-sv: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-te: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-te: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-th: PKGSIZE changed from 14730 to 14564 (-1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-th: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-th: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-tr: PKGSIZE changed from 12420 to 12792 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-tr: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-tr: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ug: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ug: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-uk: PKGSIZE changed from 13303 to 16140 (+21%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-uk: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-uk: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ur-pk: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ur-pk: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ur: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-ur: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-vi: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-vi: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-zh-cn: PKGSIZE changed from 11424 to 11783 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-zh-cn: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-zh-cn: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-zh-tw: PKGSIZE changed from 11826 to 12199 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-zh-tw: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-zh-tw: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-src: FILELIST: directory renamed /usr/src/debug/xfce4-screenshooter/1.10.3-r0/panel-plugin -> /usr/src/debug/xfce4-screenshooter/1.10.4-r0/panel-plugin, directory renamed /usr/src/debug/xfce4-screenshooter/1.10.3-r0/src -> /usr/src/debug/xfce4-screenshooter/1.10.4-r0/src, removed "/usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-marshal.c /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-dialogs.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-marshal.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-dialogs.c /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-simple-job.c /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-imgur-dialog.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-utils.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-imgur-dialog.c /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/scr
 eenshooter-simple-job.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-utils.c /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-custom-actions.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-job-callbacks.c /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-custom-actions.c /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-job-callbacks.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-actions.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-imgur-dialog_ui.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-global.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-job.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-capture.c /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-actions.c /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-capture.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-job.c /
 usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-imgur.h /usr/src/debug/xfce4-screenshooter/1.10.3-r0/lib/screenshooter-imgur.c", added "/usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-global.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-custom-actions.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-simple-job.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-custom-actions.c /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-simple-job.c /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-imgur.c /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-imgur-dialog_ui.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-dialogs.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-imgur.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-dialogs.c /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-format.c /usr/src/debug/xfce4-s
 creenshooter/1.10.4-r0/lib/screenshooter-actions.c /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-format.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-actions.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-job-callbacks.c /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-marshal.c /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-marshal.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-job-callbacks.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-job.c /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-job.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-utils.c /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-imgur-dialog.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-capture.c /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-imgur-dialog.c /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshoo
 ter-utils.h /usr/src/debug/xfce4-screenshooter/1.10.4-r0/lib/screenshooter-capture.h"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-src: PKGSIZE changed from 263029 to 270300 (+3%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-src: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-src: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-staticdev: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-staticdev: PKGV changed from 1.10.3 [default] to 1.10.4 [default]
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter: PKGSIZE changed from 317833 to 319615 (+1%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter: PV changed from "1.10.3" to "1.10.4"
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter: PKGV changed from 1.10.3 [default] to 1.10.4 [default]

--===============6445483233405875194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-el: PKGSIZE changed from 13684 to 15940 (+16%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-en-gb: PKGSIZE changed from 5201 to 12430 (+139%)
packages/core2-64-poky-linux/xfce4-screenshooter/xfce4-screenshooter-locale-uk: PKGSIZE changed from 13303 to 16140 (+21%)

--===============6445483233405875194==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-screenshooter-upgrade-1.10.3-1.10.4.patch"

RnJvbSBkOTg5MTlmODQzY2QxYjcwMWYxMTcxYThjMmY3NTU4NTcyMDdlNGY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjo1MDoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXNjcmVlbnNob290ZXI6IHVwZ3JhZGUgMS4xMC4zIC0+IDEuMTAuNAoKLS0tCiAuLi5lNC1z
Y3JlZW5zaG9vdGVyXzEuMTAuMy5iYiA9PiB4ZmNlNC1zY3JlZW5zaG9vdGVyXzEuMTAuNC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhLXhmY2UvcmVjaXBlcy1hcHBzL3hmY2U0LXNjcmVlbnNob290ZXIve3hmY2U0LXNj
cmVlbnNob290ZXJfMS4xMC4zLmJiID0+IHhmY2U0LXNjcmVlbnNob290ZXJfMS4xMC40LmJifSAo
ODclKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLWFwcHMveGZjZTQtc2NyZWVuc2hv
b3Rlci94ZmNlNC1zY3JlZW5zaG9vdGVyXzEuMTAuMy5iYiBiL21ldGEteGZjZS9yZWNpcGVzLWFw
cHMveGZjZTQtc2NyZWVuc2hvb3Rlci94ZmNlNC1zY3JlZW5zaG9vdGVyXzEuMTAuNC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhLXhmY2UvcmVjaXBlcy1hcHBzL3hmY2U0
LXNjcmVlbnNob290ZXIveGZjZTQtc2NyZWVuc2hvb3Rlcl8xLjEwLjMuYmIKcmVuYW1lIHRvIG1l
dGEteGZjZS9yZWNpcGVzLWFwcHMveGZjZTQtc2NyZWVuc2hvb3Rlci94ZmNlNC1zY3JlZW5zaG9v
dGVyXzEuMTAuNC5iYgppbmRleCAxMDQyN2RhYjMuLjdjMmVjZDMwZCAxMDA2NDQKLS0tIGEvbWV0
YS14ZmNlL3JlY2lwZXMtYXBwcy94ZmNlNC1zY3JlZW5zaG9vdGVyL3hmY2U0LXNjcmVlbnNob290
ZXJfMS4xMC4zLmJiCisrKyBiL21ldGEteGZjZS9yZWNpcGVzLWFwcHMveGZjZTQtc2NyZWVuc2hv
b3Rlci94ZmNlNC1zY3JlZW5zaG9vdGVyXzEuMTAuNC5iYgpAQCAtNyw3ICs3LDcgQEAgREVQRU5E
UyA9ICJ4ZmNlNC1wYW5lbCBsaWJ4ZmNlNHV0aWwgbGlieGZjZTR1aSBnZGstcGl4YnVmIGd0aysz
IGdsaWItMi4wIGxpYnNvdXAKIAogaW5oZXJpdCB4ZmNlLWFwcCBwZXJsbmF0aXZlCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJhNDU0MTU5ODQ3YmVjZmVjYTI3NGE1YjU4YzBlNTgxN2Q0YTI2MGEy
OTM0NWEzN2JiYzNiNGZmNDZmOGYzODE4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEyZjE5OTY4
N2U1NGUxNmE5MzZkNTYzNmQ2NjBkNDJiNmI5YTVkNTQ4Y2RkMGYwNGJkNjkyMTM1NTQ4MDY0OTQi
CiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsKICAgICBta2RpciAtcCBsaWIKLS0gCjIuMzkuMgoK

--===============6445483233405875194==--

