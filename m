Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2815BC001B2
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.4707.1699074741900331943
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IKtto7bo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pbGESd6X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b98bf13ae-e1d526b3-ff91-4ac6-b453-cdf8a42308d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TsTWJSjAFYqWIvX+KeXQRAC1qy6jJzOPJOsSB4LV0PE=;
	b=IKtto7bogzxjUCPVClAkaRU2iqzYT9c6bBLeaf3nNlJfxM0gXyXlJLHvrI00MrA9
	CZJk3m+gsw2wa06N/UjkXQCLLW2zAKg7qX7zPCAdOnU9/tg5em8IfO/eQvg0RR/T2dT
	RBgJfwogcxRBcIwNuQRM63Oj20Qf2Bwfx5w8YikY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TsTWJSjAFYqWIvX+KeXQRAC1qy6jJzOPJOsSB4LV0PE=;
	b=pbGESd6XpAP9uDlEr6zNTIOglfFHIzbRWPg+iKhrztOyNolz29byfhPG8NBk3pyg
	1MrAXjID16hJ2qo1fWtJ0aLuLTwz0Rg9Dt2SGd7DdRLyzqXfnYHS0YDrD9tTRGJxdwp
	ULNvygy4SQh0cHUOqy6dGA5xaKL7Q6bh4+ERop8c=
Content-Type: multipart/mixed; boundary="===============7043903858963953296=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gnome-text-editor: upgrading to 45.1 SUCCEEDED
Message-ID: <0101018b98bf13ae-e1d526b3-ff91-4ac6-b453-cdf8a42308d7-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106274

--===============7043903858963953296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnome-text-editor* to *45.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnome-text-editor-upgrade-45.0-45.1.patch
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
From 76d28ccfc92f1c25c280c2bc13121638a3ae7d67 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:32:42 +0000
Subject: [PATCH] gnome-text-editor: upgrade 45.0 -> 45.1

---
 .../{gnome-text-editor_45.0.bb => gnome-text-editor_45.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_45.0.bb => gnome-text-editor_45.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.0.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.0.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb
index 52bb92ee9..c1e8f3a99 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb
@@ -19,7 +19,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "47b3fbe4900eb204413d9af3ae8e0ecd06728d2ac15d02b1a050d02d47226bc1"
+SRC_URI[archive.sha256sum] = "6a86ec9920f466b6ed92695524d3b507b1e84272dafa5341d06a157de868af71"
 
 FILES:${PN} += " \
     ${datadir}/metainfo \
-- 
2.39.2


--===============7043903858963953296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-dbg: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-dbg: PKGSIZE changed from 2080696 to 2080856 (+0%)
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-dbg: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-dev: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-dev: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-doc: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-doc: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-help: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-help: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ab: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ab: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-be: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-be: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-bg: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-bg: PKGSIZE changed from 29273 to 29573 (+1%)
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-bg: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ca: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ca: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-cs: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-cs: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-da: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-da: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-de: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-de: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-el: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-el: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-en-gb: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-en-gb: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-eo: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-eo: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-es: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-es: PKGSIZE changed from 23360 to 23356 (-0%)
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-es: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-eu: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-eu: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-fa: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-fa: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-fi: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-fi: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-fr: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-fr: PKGSIZE changed from 23676 to 23850 (+1%)
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-fr: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-fur: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-fur: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-gl: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-gl: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-he: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-he: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-hr: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-hr: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-hu: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-hu: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-id: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-id: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ie: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ie: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-is: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-is: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-it: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-it: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ja: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ja: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ka: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ka: PKGSIZE changed from 25390 to 34910 (+37%)
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ka: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-kk: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-kk: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ko: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ko: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-lt: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-lt: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-lv: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-lv: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-nb: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-nb: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ne: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ne: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-nl: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-nl: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-oc: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-oc: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-pa: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-pa: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-pl: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-pl: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-pt-br: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-pt-br: PKGSIZE changed from 22996 to 23177 (+1%)
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-pt-br: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-pt: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-pt: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ro: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ro: PKGSIZE changed from 23361 to 23305 (-0%)
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ro: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ru: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ru: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-sk: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-sk: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-sl: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-sl: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-sr: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-sr: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-sv: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-sv: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-tr: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-tr: PKGSIZE changed from 22607 to 22626 (+0%)
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-tr: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-uk: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-uk: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-vi: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-vi: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-zh-cn: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-zh-cn: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-zh-tw: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-zh-tw: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-src: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-src: PKGSIZE changed from 1600397 to 1600745 (+0%)
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-src: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-staticdev: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-staticdev: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor: PKGSIZE changed from 606546 to 606885 (+0%)
packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor: PKGV changed from 45.0 [default] to 45.1 [default]
packages/core2-64-poky-linux/gnome-text-editor: SRC_URI changed from "https://download.gnome.org/sources//gnome-text-editor/45/gnome-text-editor-45.0.tar.xz;name=archive" to "https://download.gnome.org/sources//gnome-text-editor/45/gnome-text-editor-45.1.tar.xz;name=archive"
packages/core2-64-poky-linux/gnome-text-editor: PV changed from "45.0" to "45.1"
packages/core2-64-poky-linux/gnome-text-editor: PKGV changed from 45.0 [default] to 45.1 [default]

--===============7043903858963953296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gnome-text-editor/gnome-text-editor-locale-ka: PKGSIZE changed from 25390 to 34910 (+37%)

--===============7043903858963953296==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnome-text-editor-upgrade-45.0-45.1.patch"

RnJvbSA3NmQyOGNjZmM5MmYxYzI1YzI4MGMyYmMxMzEyMTYzOGEzYWU3ZDY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDozMjo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
b21lLXRleHQtZWRpdG9yOiB1cGdyYWRlIDQ1LjAgLT4gNDUuMQoKLS0tCiAuLi4ve2dub21lLXRl
eHQtZWRpdG9yXzQ1LjAuYmIgPT4gZ25vbWUtdGV4dC1lZGl0b3JfNDUuMS5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvZ25vbWUtdGV4dC1lZGl0b3Ive2dub21lLXRleHQtZWRp
dG9yXzQ1LjAuYmIgPT4gZ25vbWUtdGV4dC1lZGl0b3JfNDUuMS5iYn0gKDg0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvZ25vbWUtdGV4dC1lZGl0b3IvZ25vbWUtdGV4
dC1lZGl0b3JfNDUuMC5iYiBiL21ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9nbm9tZS10ZXh0LWVk
aXRvci9nbm9tZS10ZXh0LWVkaXRvcl80NS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFt
ZSBmcm9tIG1ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9nbm9tZS10ZXh0LWVkaXRvci9nbm9tZS10
ZXh0LWVkaXRvcl80NS4wLmJiCnJlbmFtZSB0byBtZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvZ25v
bWUtdGV4dC1lZGl0b3IvZ25vbWUtdGV4dC1lZGl0b3JfNDUuMS5iYgppbmRleCA1MmJiOTJlZTku
LmMxZThmM2E5OSAxMDA2NDQKLS0tIGEvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL2dub21lLXRl
eHQtZWRpdG9yL2dub21lLXRleHQtZWRpdG9yXzQ1LjAuYmIKKysrIGIvbWV0YS1nbm9tZS9yZWNp
cGVzLWdub21lL2dub21lLXRleHQtZWRpdG9yL2dub21lLXRleHQtZWRpdG9yXzQ1LjEuYmIKQEAg
LTE5LDcgKzE5LDcgQEAgaW5oZXJpdCBnbm9tZWJhc2UgZ3RrLWljb24tY2FjaGUgaXRzdG9vbCBn
bm9tZS1oZWxwIG1pbWUteGRnIGZlYXR1cmVzX2NoZWNrCiAKIFJFUVVJUkVEX0RJU1RST19GRUFU
VVJFUyA9ICJvcGVuZ2wiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjQ3YjNmYmU0
OTAwZWIyMDQ0MTNkOWFmM2FlOGUwZWNkMDY3MjhkMmFjMTVkMDJiMWEwNTBkMDJkNDcyMjZiYzEi
CitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI2YTg2ZWM5OTIwZjQ2NmI2ZWQ5MjY5NTUy
NGQzYjUwN2IxZTg0MjcyZGFmYTUzNDFkMDZhMTU3ZGU4NjhhZjcxIgogCiBGSUxFUzoke1BOfSAr
PSAiIFwKICAgICAke2RhdGFkaXJ9L21ldGFpbmZvIFwKLS0gCjIuMzkuMgoK

--===============7043903858963953296==--

