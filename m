Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12ED9C04A92
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.5396.1699083060505854180
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MpHuL8NU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pdibAtI0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b993e010c-4e9c6ece-f03a-48a1-9e9c-25e013b162fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v/C8HvCQrYjEbpnjZmenNMfGcBOiGzr9X6NCDsx5Uhk=;
	b=MpHuL8NUZnqfV9JmvC19WVYCfcaO/qVbiFaq/wdhDh3tVOfL/kFKSDQ3XS8N+E1D
	pnbqnuLV26Q4iOhOXiO3rT3HOiBDTlJh0jR8GJHo/PJNh/Q8KXMq6ocpC1jm3qt7qiY
	KSADJaxR5Sg00NkzdRJi1JGZ7uZBrLPetKOFeUKo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v/C8HvCQrYjEbpnjZmenNMfGcBOiGzr9X6NCDsx5Uhk=;
	b=pdibAtI0HyJDaPzyFmLlU8e01CGDwJJouRV57DujA/ZEL4y7JFdTJs0Qbi8m3iWd
	Vf6/buGXkncPnh3U5ezCUGrCFjrLFXSBbLCS9DMCPztjUtvJTnv75+DRP9YzP2FdZSL
	LlIlF2aoLotIZPIYH10Su9OXwvV85G9fxfrb1gdg=
Content-Type: multipart/mixed; boundary="===============8575333230428084239=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] thunar-archive-plugin: upgrading to 0.5.2 SUCCEEDED
Message-ID: <0101018b993e010c-4e9c6ece-f03a-48a1-9e9c-25e013b162fd-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106313

--===============8575333230428084239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *thunar-archive-plugin* to *0.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-thunar-archive-plugin-upgrade-0.5.1-0.5.2.patch
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
From 0ef691d2a93f53b470a70fed7d30fb6e86103b4b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:47:18 +0000
Subject: [PATCH] thunar-archive-plugin: upgrade 0.5.1 -> 0.5.2

---
 ...r-archive-plugin_0.5.1.bb => thunar-archive-plugin_0.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-thunar-plugins/archive/{thunar-archive-plugin_0.5.1.bb => thunar-archive-plugin_0.5.2.bb} (82%)

diff --git a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.1.bb b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.2.bb
similarity index 82%
rename from meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.1.bb
rename to meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.2.bb
index 044a39a3c..91b3efa83 100644
--- a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.1.bb
+++ b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
 
 inherit thunar-plugin
 
-SRC_URI[sha256sum] = "a81b3ab1d3cd77c7b3d6db15b37a3c12d65b06e373edc3c21083f02d605d8bed"
+SRC_URI[sha256sum] = "6379f877bcfc0ea85db9f43723b6fb317893050c712bd03c2ae3232fb9d5ade3"
 
 # install tap files in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF += "--libexecdir=${libdir}"
-- 
2.39.2


--===============8575333230428084239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/thunar-archive-plugin: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin: SRC_URI changed from "http://archive.xfce.org/src/thunar-plugins/thunar-archive-plugin/0.5/thunar-archive-plugin-0.5.1.tar.bz2" to "http://archive.xfce.org/src/thunar-plugins/thunar-archive-plugin/0.5/thunar-archive-plugin-0.5.2.tar.bz2"
packages/core2-64-poky-linux/thunar-archive-plugin: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-dbg: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-dbg: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-dev: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-dev: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-doc: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-doc: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-am: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-am: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ar: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ar: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ast: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ast: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-be: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-be: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-bg: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-bg: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ca: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ca: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-cs: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-cs: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-da: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-da: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-de: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-de: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-el: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-el: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-en-au: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-en-au: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-en-ca: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-en-ca: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-en-gb: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-en-gb: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-eo: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-eo: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-es: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-es: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-et: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-et: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-eu: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-eu: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-fa-ir: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-fa-ir: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-fi: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-fi: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-fr: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-fr: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-gl: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-gl: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-he: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-he: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hi: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hi: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hr: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hr: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hu: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hu: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hy-am: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hy-am: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hye-ru: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hye-ru: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hye: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-hye: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-id: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-id: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ie: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ie: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-is: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-is: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-it: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-it: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ja: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ja: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-kab: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-kab: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-kk: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-kk: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ko: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ko: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-lt: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-lt: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-lv: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-lv: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ms: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ms: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-nb: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-nb: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-nl: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-nl: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-nn: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-nn: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-oc: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-oc: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-pa: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-pa: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-pl: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-pl: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-pt-br: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-pt-br: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-pt: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-pt: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ro: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ro: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ru: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ru: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-sk: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-sk: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-sl: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-sl: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-sq: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-sq: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-sr: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-sr: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-sv: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-sv: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-th: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-th: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-tr: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-tr: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ug: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ug: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-uk: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-uk: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ur-pk: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ur-pk: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ur: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-ur: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-uz+latn: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-uz+latn: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-uz: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-uz: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-vi: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-vi: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-zh-cn: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-zh-cn: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-zh-tw: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-locale-zh-tw: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-src: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-src: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-src: PKGSIZE changed from 46888 to 47235 (+1%)
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-staticdev: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin-staticdev: PV changed from "0.5.1" to "0.5.2"
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin: PKGV changed from 0.5.1 [default] to 0.5.2 [default]
packages/core2-64-poky-linux/thunar-archive-plugin/thunar-archive-plugin: PV changed from "0.5.1" to "0.5.2"

--===============8575333230428084239==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-thunar-archive-plugin-upgrade-0.5.1-0.5.2.patch"

RnJvbSAwZWY2OTFkMmE5M2Y1M2I0NzBhNzBmZWQ3ZDMwZmI2ZTg2MTAzYjRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNTo0NzoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRo
dW5hci1hcmNoaXZlLXBsdWdpbjogdXBncmFkZSAwLjUuMSAtPiAwLjUuMgoKLS0tCiAuLi5yLWFy
Y2hpdmUtcGx1Z2luXzAuNS4xLmJiID0+IHRodW5hci1hcmNoaXZlLXBsdWdpbl8wLjUuMi5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhLXhmY2UvcmVjaXBlcy10aHVuYXItcGx1Z2lucy9hcmNoaXZlL3t0aHVuYXItYXJj
aGl2ZS1wbHVnaW5fMC41LjEuYmIgPT4gdGh1bmFyLWFyY2hpdmUtcGx1Z2luXzAuNS4yLmJifSAo
ODIlKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXRodW5hci1wbHVnaW5zL2FyY2hp
dmUvdGh1bmFyLWFyY2hpdmUtcGx1Z2luXzAuNS4xLmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMtdGh1
bmFyLXBsdWdpbnMvYXJjaGl2ZS90aHVuYXItYXJjaGl2ZS1wbHVnaW5fMC41LjIuYmIKc2ltaWxh
cml0eSBpbmRleCA4MiUKcmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMtdGh1bmFyLXBsdWdp
bnMvYXJjaGl2ZS90aHVuYXItYXJjaGl2ZS1wbHVnaW5fMC41LjEuYmIKcmVuYW1lIHRvIG1ldGEt
eGZjZS9yZWNpcGVzLXRodW5hci1wbHVnaW5zL2FyY2hpdmUvdGh1bmFyLWFyY2hpdmUtcGx1Z2lu
XzAuNS4yLmJiCmluZGV4IDA0NGEzOWEzYy4uOTFiM2VmYTgzIDEwMDY0NAotLS0gYS9tZXRhLXhm
Y2UvcmVjaXBlcy10aHVuYXItcGx1Z2lucy9hcmNoaXZlL3RodW5hci1hcmNoaXZlLXBsdWdpbl8w
LjUuMS5iYgorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy10aHVuYXItcGx1Z2lucy9hcmNoaXZlL3Ro
dW5hci1hcmNoaXZlLXBsdWdpbl8wLjUuMi5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGNmNjZhNDk4NDEyMDAwN2M5ODgxY2M4NzFjZjQ5
ZGIiCiAKIGluaGVyaXQgdGh1bmFyLXBsdWdpbgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTgx
YjNhYjFkM2NkNzdjN2IzZDZkYjE1YjM3YTNjMTJkNjViMDZlMzczZWRjM2MyMTA4M2YwMmQ2MDVk
OGJlZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2Mzc5Zjg3N2JjZmMwZWE4NWRiOWY0MzcyM2I2
ZmIzMTc4OTMwNTBjNzEyYmQwM2MyYWUzMjMyZmI5ZDVhZGUzIgogCiAjIGluc3RhbGwgdGFwIGZp
bGVzIGluICR7bGliZGlyfS90aHVuYXItYXJjaGl2ZS1wbHVnaW4KIEVYVFJBX09FQ09ORiArPSAi
LS1saWJleGVjZGlyPSR7bGliZGlyfSIKLS0gCjIuMzkuMgoK

--===============8575333230428084239==--

