Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F90C070C3
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5526.1699083060864012628
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cRwGQhDX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aUmj8bBy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b993e0064-4fff9abd-9194-4c5a-b1af-fc64eacdddbb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L4wRGvUWTlNUtL2g7zPkUhd1oCUG1e/vspNXdWlQgmc=;
	b=cRwGQhDXuUbLnaWcnrAUYAhVG9KhywU21ExK416171CnDzdbNRc9NRsyWpLfQux/
	aa59s+/GCRF8hLfcwuaY5uH713wP/0htn+v7QKRX0OqVyvNrC9VRjW/KywYM6S0bBuk
	wI5GWQs1qkAjfdeGVwwMTS0+X4ZY9IUao4IiNH48=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L4wRGvUWTlNUtL2g7zPkUhd1oCUG1e/vspNXdWlQgmc=;
	b=aUmj8bByMmiJrH8rREHtNTCCFrAlqsQk+NGVgORR/8GZnjANSchnBpBYR9w9MZeB
	U1VQfhiIFHftEYnST9Z8Ur/7NErmbWQFu7EVpXjsJxnWhRnHqXegQnOE8wKs7Xpb8tz
	34Kz+vQJdaYFeK3KaaEBa2bFNpPo9wiLSAEplKjc=
Content-Type: multipart/mixed; boundary="===============1335145217210967780=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] orage: upgrading to 4.18.0 SUCCEEDED
Message-ID: <0101018b993e0064-4fff9abd-9194-4c5a-b1af-fc64eacdddbb-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106331

--===============1335145217210967780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *orage* to *4.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-orage-upgrade-4.16.0-4.18.0.patch
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
From 52bffdb0d481ee9cc57969b5bb440601795f8ec8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:36:56 +0000
Subject: [PATCH] orage: upgrade 4.16.0 -> 4.18.0

---
 .../recipes-apps/orage/{orage_4.16.0.bb => orage_4.18.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/orage/{orage_4.16.0.bb => orage_4.18.0.bb} (87%)

diff --git a/meta-xfce/recipes-apps/orage/orage_4.16.0.bb b/meta-xfce/recipes-apps/orage/orage_4.18.0.bb
similarity index 87%
rename from meta-xfce/recipes-apps/orage/orage_4.16.0.bb
rename to meta-xfce/recipes-apps/orage/orage_4.18.0.bb
index d10cdaac4..83a65885a 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.16.0.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.18.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "gtk+ xfce4-panel libical popt"
 
 inherit xfce-app mime-xdg
 
-SRC_URI[sha256sum] = "26111a3b6a2007c82f1e0a1e0591b774a0b132f3a7f1cde53d9be661b2f11700"
+SRC_URI[sha256sum] = "6313b49b26cfa39fc5e99468f3fbcfe0fa1c0f3f74273f03674f1a7d6141a3ec"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.39.2


--===============1335145217210967780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/orage: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage: SRC_URI changed from "http://archive.xfce.org/src/apps/orage/4.16/orage-4.16.0.tar.bz2" to "http://archive.xfce.org/src/apps/orage/4.18/orage-4.18.0.tar.bz2"
packages/core2-64-poky-linux/orage: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-dbg: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-dbg: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-dbg: PKGSIZE changed from 1275064 to 871048 (-32%)
packages/core2-64-poky-linux/orage/orage-dbg: FILELIST: removed "/usr/lib/xfce4/panel/plugins/.debug/liborageclock.so /usr/bin/.debug/globaltime"
packages/core2-64-poky-linux/orage/orage-dbg: RRECOMMENDS: removed "gdk-pixbuf-dbg cairo-gobject-dbg xfce4-panel-gtk3-dbg libice-dbg harfbuzz-dbg libsm-dbg at-spi2-core-dbg libx11-dbg"
packages/core2-64-poky-linux/orage/orage-dev: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-dev: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-dev: RRECOMMENDS: removed "libice-dev harfbuzz-dev at-spi2-core-dev libsm-dev xfce4-panel-gtk3-dev cairo-gobject-dev libx11-dev"
packages/core2-64-poky-linux/orage/orage-doc: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-doc: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-am: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-am: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-am: PKGSIZE changed from 38547 to 32243 (-16%)
packages/core2-64-poky-linux/orage/orage-locale-ar: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-ar: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-ar: PKGSIZE changed from 64768 to 53581 (-17%)
packages/core2-64-poky-linux/orage/orage-locale-ast: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-ast: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-ast: PKGSIZE changed from 62115 to 52245 (-16%)
packages/core2-64-poky-linux/orage/orage-locale-be: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-be: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-be: PKGSIZE changed from 86112 to 72939 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-bg: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-bg: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-bg: PKGSIZE changed from 91046 to 78039 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-ca: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-ca: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-ca: PKGSIZE changed from 70900 to 60020 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-cs: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-cs: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-cs: PKGSIZE changed from 71071 to 62066 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-da: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-da: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-da: PKGSIZE changed from 68478 to 59332 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-de: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-de: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-de: PKGSIZE changed from 71150 to 61463 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-el: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-el: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-el: PKGSIZE changed from 62976 to 51178 (-19%)
packages/core2-64-poky-linux/orage/orage-locale-en-au: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-en-au: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-en-au: PKGSIZE changed from 66644 to 56869 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-en-gb: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-en-gb: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-en-gb: PKGSIZE changed from 53229 to 44024 (-17%)
packages/core2-64-poky-linux/orage/orage-locale-eo: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-eo: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-eo: PKGSIZE changed from 25754 to 25669 (-0%)
packages/core2-64-poky-linux/orage/orage-locale-es: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-es: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-es: PKGSIZE changed from 72136 to 62182 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-et: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-et: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-et: PKGSIZE changed from 58981 to 61076 (+4%)
packages/core2-64-poky-linux/orage/orage-locale-eu: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-eu: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-eu: PKGSIZE changed from 51815 to 41904 (-19%)
packages/core2-64-poky-linux/orage/orage-locale-fi: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-fi: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-fi: PKGSIZE changed from 69367 to 58962 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-fr: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-fr: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-fr: PKGSIZE changed from 73966 to 63500 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-gl: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-gl: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-gl: PKGSIZE changed from 70287 to 59696 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-he: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-he: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-he: PKGSIZE changed from 79685 to 70166 (-12%)
packages/core2-64-poky-linux/orage/orage-locale-hr: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-hr: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-hr: PKGSIZE changed from 68072 to 58119 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-hu: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-hu: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-hu: PKGSIZE changed from 71546 to 60869 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-hy-am: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-hy-am: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-hy-am: PKGSIZE changed from 85299 to 71829 (-16%)
packages/core2-64-poky-linux/orage/orage-locale-id: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-id: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-id: PKGSIZE changed from 69612 to 59583 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-is: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-is: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-is: PKGSIZE changed from 55520 to 48229 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-it: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-it: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-it: PKGSIZE changed from 70878 to 62010 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-ja: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-ja: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-ja: PKGSIZE changed from 81163 to 70601 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-kk: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-kk: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-kk: PKGSIZE changed from 32586 to 31637 (-3%)
packages/core2-64-poky-linux/orage/orage-locale-ko: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-ko: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-ko: PKGSIZE changed from 72860 to 64182 (-12%)
packages/core2-64-poky-linux/orage/orage-locale-lt: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-lt: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-lt: PKGSIZE changed from 72509 to 62572 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-lv: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-lv: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-lv: PKGSIZE changed from 52011 to 42231 (-19%)
packages/core2-64-poky-linux/orage/orage-locale-ms: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-ms: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-ms: PKGSIZE changed from 67710 to 59327 (-12%)
packages/core2-64-poky-linux/orage/orage-locale-nb: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-nb: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-nb: PKGSIZE changed from 68962 to 59720 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-nl: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-nl: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-nl: PKGSIZE changed from 70997 to 61395 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-nn: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-nn: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-nn: PKGSIZE changed from 43150 to 35401 (-18%)
packages/core2-64-poky-linux/orage/orage-locale-oc: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-oc: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-oc: PKGSIZE changed from 70471 to 59947 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-pa: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-pa: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-pl: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-pl: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-pl: PKGSIZE changed from 70945 to 61386 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-pt-br: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-pt-br: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-pt-br: PKGSIZE changed from 71508 to 61021 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-pt: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-pt: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-pt: PKGSIZE changed from 71245 to 61483 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-ro: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-ro: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-ro: PKGSIZE changed from 35890 to 31362 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-ru: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-ru: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-ru: PKGSIZE changed from 87708 to 76717 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-si: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-si: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-sk: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-sk: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-sk: PKGSIZE changed from 71289 to 60935 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-sq: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-sq: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-sq: PKGSIZE changed from 71838 to 61745 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-sr: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-sr: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-sr: PKGSIZE changed from 89416 to 76817 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-sv: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-sv: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-sv: PKGSIZE changed from 69058 to 60475 (-12%)
packages/core2-64-poky-linux/orage/orage-locale-th: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-th: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-th: PKGSIZE changed from 98860 to 83626 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-tr: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-tr: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-tr: PKGSIZE changed from 70512 to 60907 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-ug: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-ug: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-ug: PKGSIZE changed from 62916 to 51004 (-19%)
packages/core2-64-poky-linux/orage/orage-locale-uk: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-uk: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-uk: PKGSIZE changed from 89582 to 76163 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-ur-pk: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-ur-pk: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-ur-pk: PKGSIZE changed from 53653 to 44200 (-18%)
packages/core2-64-poky-linux/orage/orage-locale-ur: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-ur: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-ur: PKGSIZE changed from 53600 to 44147 (-18%)
packages/core2-64-poky-linux/orage/orage-locale-vi: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-vi: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-vi: PKGSIZE changed from 32318 to 30849 (-5%)
packages/core2-64-poky-linux/orage/orage-locale-zh-cn: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-zh-cn: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-zh-cn: PKGSIZE changed from 68396 to 60329 (-12%)
packages/core2-64-poky-linux/orage/orage-locale-zh-tw: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-locale-zh-tw: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-locale-zh-tw: PKGSIZE changed from 69634 to 60671 (-13%)
packages/core2-64-poky-linux/orage/orage-src: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-src: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage-src: PKGSIZE changed from 973166 to 819997 (-16%)
packages/core2-64-poky-linux/orage/orage-src: FILELIST: removed "/usr/src/debug/orage/4.16.0-r0/src/parameters_internal.h /usr/src/debug/orage/4.16.0-r0/src/timezone_selection.c /usr/src/debug/orage/4.16.0-r0/panel-plugin/timezone_selection.c /usr/src/debug/orage/4.16.0-r0/src/reminder.c /usr/src/debug/orage/4.16.0-r0/src/reminder.h /usr/src/debug/orage/4.16.0-r0/panel-plugin/timezone_selection.h /usr/src/debug/orage/4.16.0-r0/src/timezone_selection.h /usr/src/debug/orage/4.16.0-r0/src/day-view.h /usr/src/debug/orage/4.16.0-r0/src/mainbox.c /usr/src/debug/orage/4.16.0-r0/src/orage-css.c /usr/src/debug/orage/4.16.0-r0/src/mainbox.h /usr/src/debug/orage/4.16.0-r0/src/timezone_names.c /usr/src/debug/orage/4.16.0-r0/src/day-view.c /usr/src/debug/orage/4.16.0-r0/src/orage-css.h /usr/src/debug/orage/4.16.0-r0/src/ical-archive.c /usr/src/debug/orage/4.16.0-r0/src/functions.h /usr/src/debug/orage/4.16.0-r0/src/functions.c /usr/src/debug/orage/4.16.0-r0/src/tz_zoneinfo_read.c /usr/src/debug/o
 rage/4.16.0-r0/src/ical-internal.h /usr/src/debug/orage/4.16.0-r0/panel-plugin/xfce4-orageclock-plugin.h /usr/src/debug/orage/4.16.0-r0/src/interface.h /usr/src/debug/orage/4.16.0-r0/src/tz_zoneinfo_read.h /usr/src/debug/orage/4.16.0-r0/panel-plugin/xfce4-orageclock-plugin.c /usr/src/debug/orage/4.16.0-r0/src/interface.c /usr/src/debug/orage/4.16.0-r0/globaltime/timezone_selection.c /usr/src/debug/orage/4.16.0-r0/src/tray_icon.h /usr/src/debug/orage/4.16.0-r0/src/tray_icon.c /usr/src/debug/orage/4.16.0-r0/globaltime/timezone_selection.h /usr/src/debug/orage/4.16.0-r0/src/about-xfcalendar.c /usr/src/debug/orage/4.16.0-r0/src/event-list.h /usr/src/debug/orage/4.16.0-r0/globaltime/globaltime.h /usr/src/debug/orage/4.16.0-r0/src/event-list.c /usr/src/debug/orage/4.16.0-r0/panel-plugin/oc_config.c /usr/src/debug/orage/4.16.0-r0/src/about-xfcalendar.h /usr/src/debug/orage/4.16.0-r0/globaltime/globaltime.c /usr/src/debug/orage/4.16.0-r0/src/appointment.c /usr/src/debug/orage/4.16.0-r0/glob
 altime/gt_parfile.c /usr/src/debug/orage/4.16.0-r0/globaltime/gt_prefs.c /usr/src/debug/orage/4.16.0-r0/src/appointment.h /usr/src/debug/orage/4.16.0-r0/src/main.c /usr/src/debug/orage/4.16.0-r0/src/ical-expimp.c /usr/src/debug/orage/4.16.0-r0/src/ical-code.c /usr/src/debug/orage/4.16.0-r0/src/parameters.h /usr/src/debug/orage/4.16.0-r0/src/ical-code.h /usr/src/debug/orage/4.16.0-r0/src/parameters.c", added "/usr/src/debug/orage/4.18.0-r0/src/ical-archive.c /usr/src/debug/orage/4.18.0-r0/src/orage-rc-file.c /usr/src/debug/orage/4.18.0-r0/src/interface.h /usr/src/debug/orage/4.18.0-r0/src/ical-expimp.c /usr/src/debug/orage/4.18.0-r0/src/orage-css.c /usr/src/debug/orage/4.18.0-r0/src/mainbox.h /usr/src/debug/orage/4.18.0-r0/src/interface.c /usr/src/debug/orage/4.18.0-r0/src/orage-rc-file.h /usr/src/debug/orage/4.18.0-r0/src/mainbox.c /usr/src/debug/orage/4.18.0-r0/src/orage-css.h /usr/src/debug/orage/4.18.0-r0/src/ical-expimp.h /usr/src/debug/orage/4.18.0-r0/src/parameters_internal.h 
 /usr/src/debug/orage/4.18.0-r0/src/parameters.c /usr/src/debug/orage/4.18.0-r0/src/parameters.h /usr/src/debug/orage/4.18.0-r0/src/about-xfcalendar.c /usr/src/debug/orage/4.18.0-r0/src/orage-alarm-structure.h /usr/src/debug/orage/4.18.0-r0/src/about-xfcalendar.h /usr/src/debug/orage/4.18.0-r0/src/orage-alarm-structure.c /usr/src/debug/orage/4.18.0-r0/src/main.c /usr/src/debug/orage/4.18.0-r0/src/day-view.h /usr/src/debug/orage/4.18.0-r0/src/day-view.c /usr/src/debug/orage/4.18.0-r0/src/ical-code.h /usr/src/debug/orage/4.18.0-r0/src/event-list.c /usr/src/debug/orage/4.18.0-r0/src/reminder.c /usr/src/debug/orage/4.18.0-r0/src/orage-application.h /usr/src/debug/orage/4.18.0-r0/src/event-list.h /usr/src/debug/orage/4.18.0-r0/src/orage-application.c /usr/src/debug/orage/4.18.0-r0/src/reminder.h /usr/src/debug/orage/4.18.0-r0/src/xfical_exception.c /usr/src/debug/orage/4.18.0-r0/src/tray_icon.c /usr/src/debug/orage/4.18.0-r0/src/functions.h /usr/src/debug/orage/4.18.0-r0/src/appointment.c
  /usr/src/debug/orage/4.18.0-r0/src/xfical_exception.h /usr/src/debug/orage/4.18.0-r0/src/appointment.h /usr/src/debug/orage/4.18.0-r0/src/ical-internal.h /usr/src/debug/orage/4.18.0-r0/src/functions.c /usr/src/debug/orage/4.18.0-r0/src/tray_icon.h /usr/src/debug/orage/4.18.0-r0/src/ical-code.c /usr/src/debug/orage/4.18.0-r0/src/timezone_selection.h /usr/src/debug/orage/4.18.0-r0/src/tz_zoneinfo_read.c /usr/src/debug/orage/4.18.0-r0/src/timezone_names.c /usr/src/debug/orage/4.18.0-r0/src/timezone_selection.c /usr/src/debug/orage/4.18.0-r0/src/tz_zoneinfo_read.h"
packages/core2-64-poky-linux/orage/orage-staticdev: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage-staticdev: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/orage: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/orage: PKGSIZE changed from 1440504 to 925446 (-36%)
packages/core2-64-poky-linux/orage/orage: FILELIST: removed "/usr/bin/globaltime /usr/share/icons/hicolor/48x48/apps/org.xfce.orage.globaltime.png /usr/share/applications/org.xfce.orage.globaltime.desktop /usr/share/icons/hicolor/160x160/apps/org.xfce.orage_ice.xpm /usr/share/icons/hicolor/160x160/apps/org.xfce.orage_sun.xpm /usr/share/icons/hicolor/160x160/apps/org.xfce.orage_round.xpm /usr/share/icons/hicolor/scalable/apps/org.xfce.orage.globaltime.svg /usr/share/icons/hicolor/160x160/apps/org.xfce.orage.xpm", added "/usr/share/dbus-1/services/org.xfce.orage.service"
packages/core2-64-poky-linux/orage/orage: RDEPENDS: removed "gdk-pixbuf (['>= 2.42.10']) libx11 (['>= 1.8.7'])", added "gdk-pixbuf"
Changes to packages/core2-64-poky-linux/orage (sysroot):
  /usr/share/dbus-1 was added
  /usr/share/dbus-1/services was added
  /usr/share/dbus-1/services/org.xfce.orage.service was added
  /usr/lib was removed
  /usr/lib/xfce4 was removed
  /usr/lib/xfce4/panel was removed
  /usr/lib/xfce4/panel/plugins was removed
  /usr/lib/xfce4/panel/plugins/liborageclock.so was removed
  /usr/share/icons/hicolor/160x160 was removed
  /usr/share/icons/hicolor/160x160/apps was removed
  /usr/share/icons/hicolor/160x160/apps/org.xfce.orage_ice.xpm was removed
  /usr/share/icons/hicolor/160x160/apps/org.xfce.orage_round.xpm was removed
  /usr/share/icons/hicolor/160x160/apps/org.xfce.orage_sun.xpm was removed
  /usr/share/icons/hicolor/160x160/apps/org.xfce.orage.xpm was removed
  /usr/share/icons/hicolor/48x48/apps/org.xfce.orage.globaltime.png was removed
  /usr/share/icons/hicolor/scalable/apps/org.xfce.orage.globaltime.svg was removed
  /usr/share/xfce4 was removed
  /usr/share/xfce4/panel was removed
  /usr/share/xfce4/panel/plugins was removed
  /usr/share/xfce4/panel/plugins/org.xfce.orage.clock-plugin.desktop was removed
packages/core2-64-poky-linux/orage/xfce4-orageclock-plugin: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/orage/xfce4-orageclock-plugin: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/orage/xfce4-orageclock-plugin: PKGSIZE changed from 79572 to 0 (-100%)
packages/core2-64-poky-linux/orage/xfce4-orageclock-plugin: FILELIST: removed all items "/usr/lib/xfce4/panel/plugins/liborageclock.so /usr/share/xfce4/panel/plugins/org.xfce.orage.clock-plugin.desktop"
packages/core2-64-poky-linux/orage/xfce4-orageclock-plugin: RDEPENDS: removed all items "harfbuzz (['>= 8.2.1']) cairo-gobject (['>= 1.16.0']) libxfce4util (['>= 4.18.1']) at-spi2-core (['>= 2.50.0']) gtk+3 (['>= 3.24.38']) gdk-pixbuf (['>= 2.42.10']) pango (['>= 1.51.0']) libice (['>= 1.1.1']) xfce4-panel-gtk3 (['>= 4.18.3']) libx11 (['>= 1.8.7']) cairo (['>= 1.16.0']) glib-2.0 (['>= 2.78.0']) libsm (['>= 1.2.4']) glibc (['>= 2.38+git0+750a45a783']) libxfce4ui (['>= 4.18.3'])"

--===============1335145217210967780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4893 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 107 recipes from the core2-64 sysroot...done.
Removing 107 recipes from the qemux86_64 sysroot...done.
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
meta-webserver       = "tmp-auh-upgrades:597075c124a6e7047fc8542fe90f889e5b1791a7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 904 Local 895 Mirrors 0 Missed 9 Current 299 (99% match, 99% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 302 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb:do_create_spdx_setscene)
NOTE: Running setscene task 309 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 311 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 313 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 314 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 326 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 328 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orage-4.18.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe gtk+-2.24.33-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+-2.24.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe orage-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe orage-4.18.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orage-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 504 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+-2.24.33-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xfce4-panel-4.18.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 508 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx_setscene)
NOTE: Running setscene task 520 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 521 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe orage-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+-2.24.33-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+-2.24.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe orage-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx_setscene: Started
NOTE: Running task 450 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_fetch)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orage-4.18.0-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orage-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 458 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_unpack)
NOTE: recipe libnotify-0.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 538 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 571 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe orage-4.18.0-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xfce4-panel-4.18.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 638 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libwnck3-43.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orage-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libwnck3-43.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe garcon-4.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+-2.24.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb:do_recipe_qa_setscene)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 650 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe exo-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe garcon-4.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+-2.24.33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwnck3-43.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+-2.24.33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 652 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwnck3-43.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxres-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxres-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 661 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/garcon/4.18.1/temp/log.do_packagedata_setscene.1945270
NOTE: recipe libwnck3-43.0-r0: task do_recipe_qa_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 662 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/exo/4.18.0/temp/log.do_packagedata_setscene.1945268
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwnck3-43.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxres-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxres-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_package_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 667 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxres-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1079 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_patch)
NOTE: recipe libxres-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orage-4.18.0-r0: task do_patch: Started
NOTE: recipe orage-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe exo-4.18.0-r0: task do_package_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_package_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 683 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe garcon-4.18.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 690 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 691 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa_setscene)
NOTE: recipe garcon-4.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfce4ui-4.18.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/libxfce4ui/4.18.3/temp/log.do_packagedata_setscene.1947657
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 696 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_package_setscene)
NOTE: recipe libxfce4ui-4.18.3-r0: task do_package_setscene: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 698 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 699 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe xfconf-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe startup-notification-0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe startup-notification-0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe startup-notification-0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe xfconf-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfce4util-4.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfce4util-4.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfce4util-4.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 744 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 766 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 773 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 777 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 788 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 790 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 791 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 802 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 818 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 825 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 827 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 835 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 837 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 839 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 840 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 841 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 848 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 861 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 864 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 869 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 871 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 872 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 873 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 875 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 876 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 880 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 881 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 886 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 889 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 893 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 899 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 900 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 906 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 910 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 911 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 912 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 914 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 916 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 919 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 921 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 923 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 928 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 930 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 931 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 933 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 938 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 939 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 940 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 942 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 944 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 945 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 958 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 963 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 968 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 971 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 982 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 983 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 984 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 987 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 991 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1003 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1006 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1007 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1010 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1011 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1012 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1015 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1016 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1017 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1019 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1023 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1024 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1031 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1033 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1034 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1035 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1039 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1041 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1044 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1045 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1046 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1047 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1050 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1053 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1054 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1055 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1057 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1058 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1059 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1060 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1061 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1062 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1063 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1064 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1065 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1069 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1072 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1075 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1076 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1077 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1079 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1082 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1083 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1085 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1088 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1090 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1096 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1098 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1102 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1104 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1107 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1109 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1110 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1111 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1112 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1114 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1115 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1116 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1117 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1118 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1119 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1120 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1124 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1127 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1129 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1132 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1133 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1134 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
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
NOTE: Running setscene task 1137 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1139 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1140 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1142 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1144 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1145 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1146 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1148 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1153 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1155 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1156 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1158 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1160 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1162 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1163 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1165 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1166 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1168 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1170 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1171 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1172 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1173 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1174 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1176 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1184 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1186 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1187 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1190 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1192 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1195 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1203 of 1203 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3166 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_packagedata)
NOTE: Running task 3240 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfce4ui-4.18.3-r0: task do_packagedata: Started
NOTE: recipe orage-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3270 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_packagedata)
NOTE: Running task 3271 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_packagedata)
NOTE: recipe exo-4.18.0-r0: task do_packagedata: Started
NOTE: recipe garcon-4.18.1-r0: task do_packagedata: Started
NOTE: recipe orage-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3275 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_configure)
NOTE: recipe orage-4.18.0-r0: task do_configure: Started
NOTE: recipe garcon-4.18.1-r0: task do_packagedata: Succeeded
NOTE: recipe exo-4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3282 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_collect_spdx_deps)
NOTE: recipe orage-4.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe orage-4.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orage-4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 3283 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_compile)
NOTE: recipe orage-4.18.0-r0: task do_compile: Started
NOTE: recipe orage-4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 3284 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_install)
NOTE: recipe orage-4.18.0-r0: task do_install: Started
NOTE: recipe orage-4.18.0-r0: task do_install: Succeeded
NOTE: Running task 3285 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_package)
NOTE: Running task 3286 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_populate_sysroot)
NOTE: recipe orage-4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe orage-4.18.0-r0: task do_package: Started
NOTE: recipe orage-4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orage-4.18.0-r0: task do_package: Succeeded
NOTE: Running task 3287 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_packagedata)
NOTE: recipe orage-4.18.0-r0: task do_packagedata: Started
NOTE: recipe orage-4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3288 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_create_spdx)
NOTE: Running task 3289 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_package_write_ipk)
NOTE: Running task 3290 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_package_write_deb)
NOTE: recipe orage-4.18.0-r0: task do_create_spdx: Started
NOTE: Running task 3291 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_package_write_rpm)
NOTE: Running task 3292 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_package_qa)
NOTE: recipe orage-4.18.0-r0: task do_package_write_ipk: Started
NOTE: recipe orage-4.18.0-r0: task do_package_write_deb: Started
NOTE: recipe orage-4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe orage-4.18.0-r0: task do_package_qa: Started
NOTE: recipe orage-4.18.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3293 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_create_runtime_spdx)
NOTE: recipe orage-4.18.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe orage-4.18.0-r0: task do_package_qa: Succeeded
NOTE: recipe orage-4.18.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe orage-4.18.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe orage-4.18.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe orage-4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3294 of 3294 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/orage/orage_4.18.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3294 tasks of which 3273 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There were 221 ERROR messages, returning a non-zero exit code.
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-src went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-src went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-dbg went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-dbg went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-staticdev went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-staticdev went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-dev went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-dev went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-doc went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-doc went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-am went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-am went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ar went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ast went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-ar went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-az went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-ast went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-az-az went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-be went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-be went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-bg went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-bg went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-bn went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-bn went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ca went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-ca went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-cs went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-cs went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-cy went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-cy went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-da went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-da went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-de went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-de went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-el went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-el went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-en-au went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-en-au went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-en-gb went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-eo went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-en-gb went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-es went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-es went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-et went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-et went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-eu went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-eu went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-fi went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-fa-ir went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-fi went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-fr went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-fr went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-gl went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-gl went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-he went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-he went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-hi went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-hr went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-hr went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-hu went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-hu went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-hy went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-hy went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-hy-am went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-hy-am went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-hye went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-hye went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-id went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-id went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ie went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-ie went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-is went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-is went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-it went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-it went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-ja went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ja went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-ka went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ka went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-kab went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-kk went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-kab went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-ko went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-lt went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-kk went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-lv went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-ms went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-kn went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-nb went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-nl went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ko went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-nn went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-oc went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-lt went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-pa went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-pl went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-lv went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-pt went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-pt-br went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ms went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-ro went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-nb went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-nl went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-ru went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-nn went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-sk went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-oc went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-sl went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-sq went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-pa went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-pl went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-sr went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-pt went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-sv went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-pt-br went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-te went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ro went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ru went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-th went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-tr went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-si went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-sk went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-ug went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-sl went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-uk went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-sq went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-uz went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-sr went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-uz+latn went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-sv went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-zh-cn went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-te went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-zh-hk went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-th went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: QA Issue: Package version for package garcon-locale-zh-tw went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.1-r0) [version-going-backwards]
ERROR: garcon-4.18.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-tr went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ug went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-uk went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ur went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-ur-pk went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-vi went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-zh-cn went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-zh-hk went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: QA Issue: Package version for package exo-locale-zh-tw went backwards which would break package feeds (from 0:4.19.0-r0 to 0:4.18.0-r0) [version-going-backwards]
ERROR: exo-4.18.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-src went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-dbg went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-staticdev went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-dev went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-doc went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-glade went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-am went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ar went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ast went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-az went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-be went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-bg went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-bn went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ca went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-cs went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-cy went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-da went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-de went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-el went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-en-au went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-en-gb went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-es went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-et went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-eu went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-fi went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-fr went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-gl went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-he went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-hr went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-hu went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-hy went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-hy-am went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-hye went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-id went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ie went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-is went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-it went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ja went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ka went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-kk went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ko went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-lt went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-lv went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ms went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-nb went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-nl went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-nn went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-oc went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-pa went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-pl went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-pt went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-pt-br went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ro went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ru went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-si went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-sk went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-sl went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-sq went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-sr went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-sv went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-te went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-th went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-tr went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ug went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-uk went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ur went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-ur-pk went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-vi went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-zh-cn went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-zh-hk went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxfce4ui-locale-zh-tw went backwards which would break package feeds (from 0:4.19.3-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: libxfce4ui-4.18.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1335145217210967780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/orage/orage-dbg: RRECOMMENDS: removed "cairo-gobject-dbg libx11-dbg libice-dbg harfbuzz-dbg libsm-dbg at-spi2-core-dbg gdk-pixbuf-dbg xfce4-panel-gtk3-dbg"
packages/core2-64-poky-linux/orage/orage-dbg: PKGSIZE changed from 1275064 to 871048 (-32%)
packages/core2-64-poky-linux/orage/orage-dev: RRECOMMENDS: removed "libsm-dev libice-dev libx11-dev cairo-gobject-dev harfbuzz-dev xfce4-panel-gtk3-dev at-spi2-core-dev"
packages/core2-64-poky-linux/orage/orage-locale-am: PKGSIZE changed from 38547 to 32243 (-16%)
packages/core2-64-poky-linux/orage/orage-locale-ar: PKGSIZE changed from 64768 to 53581 (-17%)
packages/core2-64-poky-linux/orage/orage-locale-ast: PKGSIZE changed from 62115 to 52245 (-16%)
packages/core2-64-poky-linux/orage/orage-locale-be: PKGSIZE changed from 86112 to 72939 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-bg: PKGSIZE changed from 91046 to 78039 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-ca: PKGSIZE changed from 70900 to 60020 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-cs: PKGSIZE changed from 71071 to 62066 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-da: PKGSIZE changed from 68478 to 59332 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-de: PKGSIZE changed from 71150 to 61463 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-el: PKGSIZE changed from 62976 to 51178 (-19%)
packages/core2-64-poky-linux/orage/orage-locale-en-au: PKGSIZE changed from 66644 to 56869 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-en-gb: PKGSIZE changed from 53229 to 44024 (-17%)
packages/core2-64-poky-linux/orage/orage-locale-es: PKGSIZE changed from 72136 to 62182 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-eu: PKGSIZE changed from 51815 to 41904 (-19%)
packages/core2-64-poky-linux/orage/orage-locale-fi: PKGSIZE changed from 69367 to 58962 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-fr: PKGSIZE changed from 73966 to 63500 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-gl: PKGSIZE changed from 70287 to 59696 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-he: PKGSIZE changed from 79685 to 70166 (-12%)
packages/core2-64-poky-linux/orage/orage-locale-hr: PKGSIZE changed from 68072 to 58119 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-hu: PKGSIZE changed from 71546 to 60869 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-hy-am: PKGSIZE changed from 85299 to 71829 (-16%)
packages/core2-64-poky-linux/orage/orage-locale-id: PKGSIZE changed from 69612 to 59583 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-is: PKGSIZE changed from 55520 to 48229 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-it: PKGSIZE changed from 70878 to 62010 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-ja: PKGSIZE changed from 81163 to 70601 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-ko: PKGSIZE changed from 72860 to 64182 (-12%)
packages/core2-64-poky-linux/orage/orage-locale-lt: PKGSIZE changed from 72509 to 62572 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-lv: PKGSIZE changed from 52011 to 42231 (-19%)
packages/core2-64-poky-linux/orage/orage-locale-ms: PKGSIZE changed from 67710 to 59327 (-12%)
packages/core2-64-poky-linux/orage/orage-locale-nb: PKGSIZE changed from 68962 to 59720 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-nl: PKGSIZE changed from 70997 to 61395 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-nn: PKGSIZE changed from 43150 to 35401 (-18%)
packages/core2-64-poky-linux/orage/orage-locale-oc: PKGSIZE changed from 70471 to 59947 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-pl: PKGSIZE changed from 70945 to 61386 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-pt-br: PKGSIZE changed from 71508 to 61021 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-pt: PKGSIZE changed from 71245 to 61483 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-ro: PKGSIZE changed from 35890 to 31362 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-ru: PKGSIZE changed from 87708 to 76717 (-13%)
packages/core2-64-poky-linux/orage/orage-locale-sk: PKGSIZE changed from 71289 to 60935 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-sq: PKGSIZE changed from 71838 to 61745 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-sr: PKGSIZE changed from 89416 to 76817 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-sv: PKGSIZE changed from 69058 to 60475 (-12%)
packages/core2-64-poky-linux/orage/orage-locale-th: PKGSIZE changed from 98860 to 83626 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-tr: PKGSIZE changed from 70512 to 60907 (-14%)
packages/core2-64-poky-linux/orage/orage-locale-ug: PKGSIZE changed from 62916 to 51004 (-19%)
packages/core2-64-poky-linux/orage/orage-locale-uk: PKGSIZE changed from 89582 to 76163 (-15%)
packages/core2-64-poky-linux/orage/orage-locale-ur-pk: PKGSIZE changed from 53653 to 44200 (-18%)
packages/core2-64-poky-linux/orage/orage-locale-ur: PKGSIZE changed from 53600 to 44147 (-18%)
packages/core2-64-poky-linux/orage/orage-locale-zh-cn: PKGSIZE changed from 68396 to 60329 (-12%)
packages/core2-64-poky-linux/orage/orage-locale-zh-tw: PKGSIZE changed from 69634 to 60671 (-13%)
packages/core2-64-poky-linux/orage/orage-src: PKGSIZE changed from 973166 to 819997 (-16%)
packages/core2-64-poky-linux/orage/orage: FILELIST: removed "/usr/share/icons/hicolor/160x160/apps/org.xfce.orage_ice.xpm /usr/share/icons/hicolor/scalable/apps/org.xfce.orage.globaltime.svg /usr/share/icons/hicolor/160x160/apps/org.xfce.orage_round.xpm /usr/share/icons/hicolor/160x160/apps/org.xfce.orage.xpm /usr/share/icons/hicolor/48x48/apps/org.xfce.orage.globaltime.png /usr/share/applications/org.xfce.orage.globaltime.desktop /usr/bin/globaltime /usr/share/icons/hicolor/160x160/apps/org.xfce.orage_sun.xpm", added "/usr/share/dbus-1/services/org.xfce.orage.service"
packages/core2-64-poky-linux/orage/orage: RDEPENDS: removed "gdk-pixbuf (['>= 2.42.10']) libx11 (['>= 1.8.7'])", added "gdk-pixbuf"
packages/core2-64-poky-linux/orage/orage: PKGSIZE changed from 1440504 to 925446 (-36%)
Changes to packages/core2-64-poky-linux/orage (sysroot):
  /usr/share/dbus-1 was added
  /usr/share/dbus-1/services was added
  /usr/share/dbus-1/services/org.xfce.orage.service was added
  /usr/lib was removed
  /usr/lib/xfce4 was removed
  /usr/lib/xfce4/panel was removed
  /usr/lib/xfce4/panel/plugins was removed
  /usr/lib/xfce4/panel/plugins/liborageclock.so was removed
  /usr/share/icons/hicolor/160x160 was removed
  /usr/share/icons/hicolor/160x160/apps was removed
  /usr/share/icons/hicolor/160x160/apps/org.xfce.orage_ice.xpm was removed
  /usr/share/icons/hicolor/160x160/apps/org.xfce.orage_round.xpm was removed
  /usr/share/icons/hicolor/160x160/apps/org.xfce.orage_sun.xpm was removed
  /usr/share/icons/hicolor/160x160/apps/org.xfce.orage.xpm was removed
  /usr/share/icons/hicolor/48x48/apps/org.xfce.orage.globaltime.png was removed
  /usr/share/icons/hicolor/scalable/apps/org.xfce.orage.globaltime.svg was removed
  /usr/share/xfce4 was removed
  /usr/share/xfce4/panel was removed
  /usr/share/xfce4/panel/plugins was removed
  /usr/share/xfce4/panel/plugins/org.xfce.orage.clock-plugin.desktop was removed
packages/core2-64-poky-linux/orage/xfce4-orageclock-plugin: FILELIST: removed all items "/usr/lib/xfce4/panel/plugins/liborageclock.so /usr/share/xfce4/panel/plugins/org.xfce.orage.clock-plugin.desktop"
packages/core2-64-poky-linux/orage/xfce4-orageclock-plugin: RDEPENDS: removed all items "glib-2.0 (['>= 2.78.0']) libxfce4util (['>= 4.18.1']) gdk-pixbuf (['>= 2.42.10']) libx11 (['>= 1.8.7']) at-spi2-core (['>= 2.50.0']) libxfce4ui (['>= 4.18.3']) xfce4-panel-gtk3 (['>= 4.18.3']) glibc (['>= 2.38+git0+750a45a783']) harfbuzz (['>= 8.2.1']) gtk+3 (['>= 3.24.38']) libsm (['>= 1.2.4']) cairo-gobject (['>= 1.16.0']) pango (['>= 1.51.0']) libice (['>= 1.1.1']) cairo (['>= 1.16.0'])"
packages/core2-64-poky-linux/orage/xfce4-orageclock-plugin: PKGSIZE changed from 79572 to 0 (-100%)

--===============1335145217210967780==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-orage-upgrade-4.16.0-4.18.0.patch"

RnJvbSA1MmJmZmRiMGQ0ODFlZTljYzU3OTY5YjViYjQ0MDYwMTc5NWY4ZWM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNTozNjo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9y
YWdlOiB1cGdyYWRlIDQuMTYuMCAtPiA0LjE4LjAKCi0tLQogLi4uL3JlY2lwZXMtYXBwcy9vcmFn
ZS97b3JhZ2VfNC4xNi4wLmJiID0+IG9yYWdlXzQuMTguMC5iYn0gICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS14ZmNl
L3JlY2lwZXMtYXBwcy9vcmFnZS97b3JhZ2VfNC4xNi4wLmJiID0+IG9yYWdlXzQuMTguMC5iYn0g
KDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhLXhmY2UvcmVjaXBlcy1hcHBzL29yYWdlL29yYWdlXzQu
MTYuMC5iYiBiL21ldGEteGZjZS9yZWNpcGVzLWFwcHMvb3JhZ2Uvb3JhZ2VfNC4xOC4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEteGZjZS9yZWNpcGVzLWFwcHMvb3Jh
Z2Uvb3JhZ2VfNC4xNi4wLmJiCnJlbmFtZSB0byBtZXRhLXhmY2UvcmVjaXBlcy1hcHBzL29yYWdl
L29yYWdlXzQuMTguMC5iYgppbmRleCBkMTBjZGFhYzQuLjgzYTY1ODg1YSAxMDA2NDQKLS0tIGEv
bWV0YS14ZmNlL3JlY2lwZXMtYXBwcy9vcmFnZS9vcmFnZV80LjE2LjAuYmIKKysrIGIvbWV0YS14
ZmNlL3JlY2lwZXMtYXBwcy9vcmFnZS9vcmFnZV80LjE4LjAuYmIKQEAgLTYsNyArNiw3IEBAIERF
UEVORFMgPSAiZ3RrKyB4ZmNlNC1wYW5lbCBsaWJpY2FsIHBvcHQiCiAKIGluaGVyaXQgeGZjZS1h
cHAgbWltZS14ZGcKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI2MTExYTNiNmEyMDA3YzgyZjFl
MGExZTA1OTFiNzc0YTBiMTMyZjNhN2YxY2RlNTNkOWJlNjYxYjJmMTE3MDAiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNjMxM2I0OWIyNmNmYTM5ZmM1ZTk5NDY4ZjNmYmNmZTBmYTFjMGYzZjc0Mjcz
ZjAzNjc0ZjFhN2Q2MTQxYTNlYyIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIm5vdGlmeSIKIFBBQ0tB
R0VDT05GSUdbbm90aWZ5XSA9ICItLWVuYWJsZS1saWJub3RpZnksLS1kaXNhYmxlLWxpYm5vdGlm
eSxsaWJub3RpZnkiCi0tIAoyLjM5LjIKCg==

--===============1335145217210967780==--

