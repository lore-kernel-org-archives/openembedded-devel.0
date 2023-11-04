Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F95AC072AB
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5532.1699083061149673689
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Jydy0Gbq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hb+2fZxh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b993e054d-9066b34d-f9d0-4170-a280-5560247636ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dd9MrFYKe/S/skN1l/7jK8+2OyafDd+/uKkJmkYahIk=;
	b=Jydy0GbqV9QytTMVIz/xszNYKIJ3jb97nosd1XeeQmaaD+0Ud+g1DqdAONek9IFg
	GXFdALNI48a9Rt8reyDP5ceNd8ZIiE4qn8MnhOBNag86Z32Ne9BaFNLUp+mkO6WSPQJ
	mv7zAlJnUohDrQuKnV7EWR/6+lCIwueS5Iuo5uhE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dd9MrFYKe/S/skN1l/7jK8+2OyafDd+/uKkJmkYahIk=;
	b=hb+2fZxhRtM6t45X/CFhc92N+6TfVlbPTYHX30kw2M0WVr/DI3NgpxsqKR1HedpT
	UAqFBMiDg1HY2aqAThyX4xsySPkhGsvJPJqp57rUez8e/aUuPH/N78Q59kl91Eat4QN
	MOAHj0DaDc8bO5rFJjtA/ubDJJqhrTUY8oBuJaYc=
Content-Type: multipart/mixed; boundary="===============2087805685316228784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-time-out-plugin: upgrading to 1.1.3 SUCCEEDED
Message-ID: <0101018b993e054d-9066b34d-f9d0-4170-a280-5560247636ec-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106339

--===============2087805685316228784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-time-out-plugin* to *1.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-time-out-plugin-upgrade-1.1.2-1.1.3.patch
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
From 16a8c26f202267970258e016a0ad564ef66358f9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:05:26 +0000
Subject: [PATCH] xfce4-time-out-plugin: upgrade 1.1.2 -> 1.1.3

---
 ...-time-out-plugin_1.1.2.bb => xfce4-time-out-plugin_1.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1.1.2.bb => xfce4-time-out-plugin_1.1.3.bb} (77%)

diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.3.bb
similarity index 77%
rename from meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb
rename to meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.3.bb
index 5b7f62471..9fa287a1c 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.3.bb
@@ -6,4 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "3dd8eba694ff3ba5c25bd7f5cd70dc22175fb2c0a759213f05ab8f0e629d82d4"
+SRC_URI[sha256sum] = "5a1ca36361e95ec718bbd887ea5be6a270ab458d1c2d672186721522a7228ee8"
-- 
2.39.2


--===============2087805685316228784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-time-out-plugin: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin: PACKAGES: added "xfce4-time-out-plugin-locale-en-gb"
packages/core2-64-poky-linux/xfce4-time-out-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-time-out-plugin/1.1/xfce4-time-out-plugin-1.1.2.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-time-out-plugin/1.1/xfce4-time-out-plugin-1.1.3.tar.bz2"
packages/core2-64-poky-linux/xfce4-time-out-plugin: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-dbg: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-dbg: PKGSIZE changed from 147480 to 148168 (+0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-dbg: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-dev: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-dev: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-doc: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-doc: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ar: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ar: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ast: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ast: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-be: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-be: PKGSIZE changed from 3490 to 3481 (-0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-be: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-bg: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-bg: PKGSIZE changed from 3382 to 3539 (+5%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-bg: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ca: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ca: PKGSIZE changed from 2961 to 2963 (+0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ca: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-cs: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-cs: PKGSIZE changed from 2890 to 3026 (+5%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-cs: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-da: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-da: PKGSIZE changed from 2725 to 2775 (+2%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-da: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-de: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-de: PKGSIZE changed from 2956 to 3101 (+5%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-de: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-el: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-el: PKGSIZE changed from 3411 to 3705 (+9%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-el: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-en-au: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-en-au: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-en-ca: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-en-ca: PKGSIZE changed from 2615 to 2729 (+4%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-en-ca: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-eo: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-eo: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-es: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-es: PKGSIZE changed from 3023 to 3100 (+3%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-es: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-et: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-et: PKGSIZE changed from 2692 to 2813 (+4%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-et: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-eu: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-eu: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-fi: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-fi: PKGSIZE changed from 2681 to 2673 (-0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-fi: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-fr: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-fr: PKGSIZE changed from 2983 to 3065 (+3%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-fr: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-gl: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-gl: PKGSIZE changed from 2973 to 2972 (-0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-gl: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-he: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-he: PKGSIZE changed from 2991 to 3121 (+4%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-he: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hr: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hr: PKGSIZE changed from 2766 to 2764 (-0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hr: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hu: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hu: PKGSIZE changed from 2763 to 2783 (+1%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hu: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hy-am: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hy-am: PKGSIZE changed from 3289 to 3275 (-0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hy-am: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hye: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hye: PKGSIZE changed from 3333 to 3318 (-0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-hye: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-id: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-id: PKGSIZE changed from 2653 to 2819 (+6%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-id: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ie: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ie: PKGSIZE changed from 2662 to 2685 (+1%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ie: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-is: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-is: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-it: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-it: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ja: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ja: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-kk: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-kk: PKGSIZE changed from 3273 to 3465 (+6%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-kk: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ko: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ko: PKGSIZE changed from 2690 to 2825 (+5%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ko: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-lt: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-lt: PKGSIZE changed from 2953 to 3083 (+4%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-lt: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-lv: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-lv: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ms: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ms: PKGSIZE changed from 2506 to 2705 (+8%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ms: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-nb: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-nb: PKGSIZE changed from 2977 to 2966 (-0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-nb: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-nl: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-nl: PKGSIZE changed from 2676 to 2802 (+5%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-nl: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-oc: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-oc: PKGSIZE changed from 2477 to 2525 (+2%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-oc: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-pl: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-pl: PKGSIZE changed from 2941 to 3078 (+5%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-pl: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-pt-br: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-pt-br: PKGSIZE changed from 2927 to 2959 (+1%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-pt-br: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-pt: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-pt: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ru: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ru: PKGSIZE changed from 3547 to 3795 (+7%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ru: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sk: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sk: PKGSIZE changed from 2910 to 3045 (+5%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sk: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sl: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sl: PKGSIZE changed from 2876 to 2862 (-0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sl: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sq: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sq: PKGSIZE changed from 2685 to 2811 (+5%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sq: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sr: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sr: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sv: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sv: PKGSIZE changed from 2642 to 2769 (+5%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-sv: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-tr: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-tr: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ug: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ug: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-uk: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-uk: PKGSIZE changed from 3592 to 3760 (+5%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-uk: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ur-pk: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ur-pk: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ur: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-ur: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-zh-cn: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-zh-cn: PKGSIZE changed from 2685 to 2781 (+4%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-zh-cn: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-zh-tw: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-locale-zh-tw: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-src: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-src: PKGSIZE changed from 95978 to 96434 (+0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-src: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-staticdev: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin-staticdev: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin: PKGSIZE changed from 75394 to 75456 (+0%)
packages/core2-64-poky-linux/xfce4-time-out-plugin/xfce4-time-out-plugin: PV changed from "1.1.2" to "1.1.3"

--===============2087805685316228784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-time-out-plugin: PACKAGES: added "xfce4-time-out-plugin-locale-en-gb"

--===============2087805685316228784==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-time-out-plugin-upgrade-1.1.2-1.1.3.patch"

RnJvbSAxNmE4YzI2ZjIwMjI2Nzk3MDI1OGUwMTZhMGFkNTY0ZWY2NjM1OGY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzowNToyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXRpbWUtb3V0LXBsdWdpbjogdXBncmFkZSAxLjEuMiAtPiAxLjEuMwoKLS0tCiAuLi4tdGlt
ZS1vdXQtcGx1Z2luXzEuMS4yLmJiID0+IHhmY2U0LXRpbWUtb3V0LXBsdWdpbl8xLjEuMy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3RpbWUtb3V0L3t4ZmNlNC10aW1l
LW91dC1wbHVnaW5fMS4xLjIuYmIgPT4geGZjZTQtdGltZS1vdXQtcGx1Z2luXzEuMS4zLmJifSAo
NzclKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvdGltZS1v
dXQveGZjZTQtdGltZS1vdXQtcGx1Z2luXzEuMS4yLmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMtcGFu
ZWwtcGx1Z2lucy90aW1lLW91dC94ZmNlNC10aW1lLW91dC1wbHVnaW5fMS4xLjMuYmIKc2ltaWxh
cml0eSBpbmRleCA3NyUKcmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lu
cy90aW1lLW91dC94ZmNlNC10aW1lLW91dC1wbHVnaW5fMS4xLjIuYmIKcmVuYW1lIHRvIG1ldGEt
eGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvdGltZS1vdXQveGZjZTQtdGltZS1vdXQtcGx1Z2lu
XzEuMS4zLmJiCmluZGV4IDViN2Y2MjQ3MS4uOWZhMjg3YTFjIDEwMDY0NAotLS0gYS9tZXRhLXhm
Y2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3RpbWUtb3V0L3hmY2U0LXRpbWUtb3V0LXBsdWdpbl8x
LjEuMi5iYgorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3RpbWUtb3V0L3hm
Y2U0LXRpbWUtb3V0LXBsdWdpbl8xLjEuMy5iYgpAQCAtNiw0ICs2LDQgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NTk1MzBiZGYzMzY1OWIyOWU3M2Q0YWRiOWY5ZjY1
NTIiCiAKIGluaGVyaXQgeGZjZS1wYW5lbC1wbHVnaW4KIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjNkZDhlYmE2OTRmZjNiYTVjMjViZDdmNWNkNzBkYzIyMTc1ZmIyYzBhNzU5MjEzZjA1YWI4ZjBl
NjI5ZDgyZDQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWExY2EzNjM2MWU5NWVjNzE4YmJkODg3
ZWE1YmU2YTI3MGFiNDU4ZDFjMmQ2NzIxODY3MjE1MjJhNzIyOGVlOCIKLS0gCjIuMzkuMgoK

--===============2087805685316228784==--

