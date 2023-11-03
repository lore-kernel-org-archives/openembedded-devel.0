Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C4EC05054
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.63227.1699041739439180303
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gs5Ww1WT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iu5Un482;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96c7803b-0a523f05-2bf3-4cd2-8548-08e867d83de7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5NdFucdqdMxzJ/YZFxDGOEDRol81bR+uGfkaKNRhbig=;
	b=gs5Ww1WTsB90abXBmJCUv6YwEeuwugHOC09KAvFNdM3BnW2x3o1TVmALi1qeWqZQ
	PeVEwPmN0rFzFZ/v2gCY5uQWqnDTqyIfpB46wFsoTgP86lD12FQmDkKeT9xa4HU2Das
	qjx3Q8bfmgTIWfj29Wc45R5chMmLup3fMlvaGw9Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5NdFucdqdMxzJ/YZFxDGOEDRol81bR+uGfkaKNRhbig=;
	b=iu5Un482IutMqMZxx/6l9AIfLtLD942FEmoCmHXJgi+O4n7BMY8fbfvDOTKNin9/
	zMREoDy3vjT29NvgjNNWXURmO5fWFkBfPCLSOGLFlKRS0O624R0GQEG/HP6rAHUATUJ
	EM65mkqwNqDxmJ5bKmuGsSTkPvUD25ADYVhUgwMY=
Content-Type: multipart/mixed; boundary="===============0297313834193707755=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] webkitgtk3: upgrading to 2.42.1 SUCCEEDED
Message-ID: <0101018b96c7803b-0a523f05-2bf3-4cd2-8548-08e867d83de7-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106072

--===============0297313834193707755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk3* to *2.42.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-webkitgtk3-upgrade-2.42.0-2.42.1.patch
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
From 4fef3204dd19167373c24c6703ab6c1dc838d41e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 19:17:37 +0000
Subject: [PATCH] webkitgtk3: upgrade 2.42.0 -> 2.42.1

---
 .../webkitgtk/{webkitgtk3_2.42.0.bb => webkitgtk3_2.42.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.0.bb => webkitgtk3_2.42.1.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb
index f682cd9f0..9aabfb123 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
            "
-SRC_URI[sha256sum] = "828f95935861fae583fb8f2ae58cf64c63c178ae2b7c2d6f73070813ad64ed1b"
+SRC_URI[sha256sum] = "6f41fac9989d3ee51c08c48de1d439cdeddecbc757e34b6180987d99b16d2499"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.39.2


--===============0297313834193707755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/webkitgtk3: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3: SRC_URI changed from "https://www.webkitgtk.org/releases/webkitgtk-2.42.0.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0d3344e17d258106617b0e6d783d073b188a2548.patch file://no-musttail-arm.patch" to "https://www.webkitgtk.org/releases/webkitgtk-2.42.1.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0d3344e17d258106617b0e6d783d073b188a2548.patch file://no-musttail-arm.patch"
packages/core2-64-poky-linux/webkitgtk3: PV changed from "2.42.0" to "2.42.1"
Changes to packages/core2-64-poky-linux/webkitgtk3 (sysroot):
  /usr/lib/libjavascriptcoregtk-4.1.so.0 changed symlink target from libjavascriptcoregtk-4.1.so.0.4.9 to libjavascriptcoregtk-4.1.so.0.4.10
  /usr/lib/libwebkit2gtk-4.1.so.0 changed symlink target from libwebkit2gtk-4.1.so.0.12.3 to libwebkit2gtk-4.1.so.0.12.4
  /usr/lib/libwebkit2gtk-4.1.so.0.12.3 moved to /usr/lib/libwebkit2gtk-4.1.so.0.12.4
  /usr/lib/libjavascriptcoregtk-4.1.so.0.4.10 was added
  /usr/lib/libjavascriptcoregtk-4.1.so.0.4.9 was removed
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-dbg: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-dbg: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-dbg: PKGSIZE changed from 726269120 to 726326496 (+0%)
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-dbg: FILELIST: removed "/usr/lib/.debug/libjavascriptcoregtk-4.1.so.0.4.9 /usr/lib/.debug/libwebkit2gtk-4.1.so.0.12.3", added "/usr/lib/.debug/libjavascriptcoregtk-4.1.so.0.4.10 /usr/lib/.debug/libwebkit2gtk-4.1.so.0.12.4"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-dev: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-dev: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-doc: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-doc: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ar: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ar: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-as: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-as: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-bg: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-bg: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ca: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ca: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-cs: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-cs: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-da: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-da: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-de: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-de: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-el: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-el: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-en-ca: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-en-ca: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-en-gb: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-en-gb: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-eo: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-eo: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-es: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-es: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-et: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-et: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-eu: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-eu: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-fi: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-fi: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-fr: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-fr: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-gl: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-gl: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-gu: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-gu: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-he: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-he: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-hi: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-hi: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-hr: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-hr: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-hu: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-hu: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-id: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-id: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-it: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-it: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ja: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ja: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ka: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ka: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-kn: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-kn: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ko: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ko: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-lt: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-lt: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-lv: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-lv: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ml: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ml: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-mr: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-mr: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-nb: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-nb: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-nl: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-nl: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-or: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-or: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-pa: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-pa: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-pl: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-pl: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-pt-br: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-pt-br: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-pt: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-pt: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ro: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ro: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ru: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ru: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-sl: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-sl: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-sr+latin: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-sr+latin: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-sr: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-sr: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-sv: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-sv: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ta: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-ta: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-te: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-te: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-tr: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-tr: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-uk: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-uk: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-vi: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-vi: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-zh-cn: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-locale-zh-cn: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-src: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-src: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-src: PKGSIZE changed from 212684495 to 212691656 (+0%)
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-staticdev: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3-staticdev: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3: PKGSIZE changed from 108251076 to 108263365 (+0%)
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3: FILELIST: removed "/usr/lib/libwebkit2gtk-4.1.so.0.12.3 /usr/lib/libjavascriptcoregtk-4.1.so.0.4.9", added "/usr/lib/libwebkit2gtk-4.1.so.0.12.4 /usr/lib/libjavascriptcoregtk-4.1.so.0.4.10"

--===============0297313834193707755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/webkitgtk3 (sysroot):
  /usr/lib/libjavascriptcoregtk-4.1.so.0 changed symlink target from libjavascriptcoregtk-4.1.so.0.4.9 to libjavascriptcoregtk-4.1.so.0.4.10
  /usr/lib/libwebkit2gtk-4.1.so.0 changed symlink target from libwebkit2gtk-4.1.so.0.12.3 to libwebkit2gtk-4.1.so.0.12.4
  /usr/lib/libwebkit2gtk-4.1.so.0.12.3 moved to /usr/lib/libwebkit2gtk-4.1.so.0.12.4
  /usr/lib/libjavascriptcoregtk-4.1.so.0.4.10 was added
  /usr/lib/libjavascriptcoregtk-4.1.so.0.4.9 was removed
packages/core2-64-poky-linux/webkitgtk3/webkitgtk3: FILELIST: removed "/usr/lib/libwebkit2gtk-4.1.so.0.12.3 /usr/lib/libjavascriptcoregtk-4.1.so.0.4.9", added "/usr/lib/libjavascriptcoregtk-4.1.so.0.4.10 /usr/lib/libwebkit2gtk-4.1.so.0.12.4"

--===============0297313834193707755==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webkitgtk3-upgrade-2.42.0-2.42.1.patch"

RnJvbSA0ZmVmMzIwNGRkMTkxNjczNzNjMjRjNjcwM2FiNmMxZGM4MzhkNDFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxOToxNzozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
YmtpdGd0azM6IHVwZ3JhZGUgMi40Mi4wIC0+IDIuNDIuMQoKLS0tCiAuLi4vd2Via2l0Z3RrL3t3
ZWJraXRndGszXzIuNDIuMC5iYiA9PiB3ZWJraXRndGszXzIuNDIuMS5iYn0gICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
LW9lL3JlY2lwZXMtc3VwcG9ydC93ZWJraXRndGsve3dlYmtpdGd0azNfMi40Mi4wLmJiID0+IHdl
YmtpdGd0azNfMi40Mi4xLmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1z
dXBwb3J0L3dlYmtpdGd0ay93ZWJraXRndGszXzIuNDIuMC5iYiBiL21ldGEtb2UvcmVjaXBlcy1z
dXBwb3J0L3dlYmtpdGd0ay93ZWJraXRndGszXzIuNDIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk5
JQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC93ZWJraXRndGsvd2Via2l0Z3Rr
M18yLjQyLjAuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3dlYmtpdGd0ay93
ZWJraXRndGszXzIuNDIuMS5iYgppbmRleCBmNjgyY2Q5ZjAuLjlhYWJmYjEyMyAxMDA2NDQKLS0t
IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvd2Via2l0Z3RrL3dlYmtpdGd0azNfMi40Mi4wLmJi
CisrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3dlYmtpdGd0ay93ZWJraXRndGszXzIuNDIu
MS5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LndlYmtpdGd0ay5v
cmcvcmVsZWFzZXMvd2Via2l0Z3RrLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8w
ZDMzNDRlMTdkMjU4MTA2NjE3YjBlNmQ3ODNkMDczYjE4OGEyNTQ4LnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovL25vLW11c3R0YWlsLWFybS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI4MjhmOTU5MzU4NjFmYWU1ODNmYjhmMmFlNThjZjY0YzYzYzE3OGFlMmI3
YzJkNmY3MzA3MDgxM2FkNjRlZDFiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZmNDFmYWM5OTg5
ZDNlZTUxYzA4YzQ4ZGUxZDQzOWNkZWRkZWNiYzc1N2UzNGI2MTgwOTg3ZDk5YjE2ZDI0OTkiCiAK
IGluaGVyaXQgY21ha2UgcGtnY29uZmlnIGdvYmplY3QtaW50cm9zcGVjdGlvbiBwZXJsbmF0aXZl
IGZlYXR1cmVzX2NoZWNrIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbiBnaS1kb2NnZW4KIAotLSAK
Mi4zOS4yCgo=

--===============0297313834193707755==--

