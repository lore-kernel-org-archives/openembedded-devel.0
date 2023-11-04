Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EC5C04E88
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.5397.1699083060602192854
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RqMDvoLY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OYF1jW5S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b993e0216-635e3d21-f555-4e5d-ab80-d7a5a3e596e8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NIm/MzJRyuLZJd8HG8l7/uWSk7hMqj1r9p0Pv74Fy6c=;
	b=RqMDvoLYtdE1pyCKhDR6Z49kB1QUWlH3csWjuNH3a3DqfJy5n/owfp1eKJGdqV6j
	hTRIzYNwDdLFFnpK5OEFJhhuPsnMXUuevfVGmuobbXDjze9P8FFSJl401/GCXAk+5E+
	0QA3yZDbOOrCAM+nUCd4c7tIS55NGViaio05DJW8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NIm/MzJRyuLZJd8HG8l7/uWSk7hMqj1r9p0Pv74Fy6c=;
	b=OYF1jW5S62AUz/lm+p13udsx/k/OoIfPlgIZhpuEZ8goJksAKTB8NuKslyF6+QLA
	OblDw898+0JEATR+oZjBK3mzXdL8O8VTQvwfemKyvq1kc27DZzickczW2utD/d/zdGs
	u9O68Q+5HIn5GBpeLjpyU0aAOHw/lKsTTxuUMfYg=
Content-Type: multipart/mixed; boundary="===============0686782792978051943=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-datetime-plugin: upgrading to 0.8.3 SUCCEEDED
Message-ID: <0101018b993e0216-635e3d21-f555-4e5d-ab80-d7a5a3e596e8-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106316

--===============0686782792978051943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-datetime-plugin* to *0.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-datetime-plugin-upgrade-0.8.1-0.8.3.patch
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
From eff3d3351b6e8db69a69a5f6dcea8abe5595cd39 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:13:01 +0000
Subject: [PATCH] xfce4-datetime-plugin: upgrade 0.8.1 -> 0.8.3

---
 ...-datetime-plugin_0.8.1.bb => xfce4-datetime-plugin_0.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/datetime/{xfce4-datetime-plugin_0.8.1.bb => xfce4-datetime-plugin_0.8.3.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
rename to meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
index c029ac1c0..f292a6dea 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "e9f6f15be29ceb5c45718006b46dbd19b89981617d0768b2ef942b5a70af2540"
+SRC_URI[sha256sum] = "6b2eeb79fb586868737426cbd2a4cd43c7f8c58507d8a2f578e0150187cc00b0"
-- 
2.39.2


--===============0686782792978051943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-datetime-plugin: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-datetime-plugin/0.8/xfce4-datetime-plugin-0.8.1.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-datetime-plugin/0.8/xfce4-datetime-plugin-0.8.3.tar.bz2"
packages/core2-64-poky-linux/xfce4-datetime-plugin: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-dbg: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-dbg: PKGSIZE changed from 72480 to 72184 (-0%)
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-dbg: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-dev: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-dev: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-doc: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-doc: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-am: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-am: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ar: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ar: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ast: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ast: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-be: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-be: PKGSIZE changed from 1869 to 1871 (+0%)
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-be: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-bg: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-bg: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ca: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ca: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-cs: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-cs: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-da: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-da: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-de: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-de: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-el: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-el: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-en-au: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-en-au: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-en-ca: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-en-ca: PKGSIZE changed from 1461 to 1451 (-1%)
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-en-ca: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-en-gb: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-en-gb: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-es: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-es: PKGSIZE changed from 1543 to 1537 (-0%)
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-es: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-et: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-et: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-eu: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-eu: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-fa-ir: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-fa-ir: PKGSIZE changed from 1033 to 1353 (+31%)
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-fa-ir: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-fi: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-fi: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-fr: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-fr: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-gl: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-gl: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-he: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-he: PKGSIZE changed from 1637 to 1667 (+2%)
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-he: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-hr: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-hr: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-hu: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-hu: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-hy-am: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-hy-am: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-hye: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-hye: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-id: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-id: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ie: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ie: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-is: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-is: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-it: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-it: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ja: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ja: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-kk: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-kk: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ko: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ko: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-lt: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-lt: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-lv: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-lv: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ms: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ms: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-nb: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-nb: PKGSIZE changed from 1484 to 1473 (-1%)
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-nb: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-nl: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-nl: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-nn: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-nn: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-oc: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-oc: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-pa: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-pa: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-pl: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-pl: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-pt-br: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-pt-br: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-pt: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-pt: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ro: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ro: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ru: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ru: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-sk: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-sk: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-sl: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-sl: PKGSIZE changed from 1505 to 1538 (+2%)
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-sl: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-sq: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-sq: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-sr: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-sr: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-sv: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-sv: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-th: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-th: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-tr: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-tr: PKGSIZE changed from 1494 to 1501 (+0%)
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-tr: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ug: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ug: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-uk: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-uk: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ur-pk: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ur-pk: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ur: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-ur: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-uz: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-uz: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-zh-cn: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-zh-cn: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-zh-tw: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-zh-tw: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-src: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-src: PKGSIZE changed from 47759 to 47624 (-0%)
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-src: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-staticdev: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-staticdev: PV changed from "0.8.1" to "0.8.3"
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin: PKGV changed from 0.8.1 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin: PKGSIZE changed from 40713 to 40796 (+0%)
packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin: PV changed from "0.8.1" to "0.8.3"

--===============0686782792978051943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-datetime-plugin/xfce4-datetime-plugin-locale-fa-ir: PKGSIZE changed from 1033 to 1353 (+31%)

--===============0686782792978051943==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-datetime-plugin-upgrade-0.8.1-0.8.3.patch"

RnJvbSBlZmYzZDMzNTFiNmU4ZGI2OWE2OWE1ZjZkY2VhOGFiZTU1OTVjZDM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjoxMzowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LWRhdGV0aW1lLXBsdWdpbjogdXBncmFkZSAwLjguMSAtPiAwLjguMwoKLS0tCiAuLi4tZGF0
ZXRpbWUtcGx1Z2luXzAuOC4xLmJiID0+IHhmY2U0LWRhdGV0aW1lLXBsdWdpbl8wLjguMy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL2RhdGV0aW1lL3t4ZmNlNC1kYXRl
dGltZS1wbHVnaW5fMC44LjEuYmIgPT4geGZjZTQtZGF0ZXRpbWUtcGx1Z2luXzAuOC4zLmJifSAo
NzYlKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvZGF0ZXRp
bWUveGZjZTQtZGF0ZXRpbWUtcGx1Z2luXzAuOC4xLmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMtcGFu
ZWwtcGx1Z2lucy9kYXRldGltZS94ZmNlNC1kYXRldGltZS1wbHVnaW5fMC44LjMuYmIKc2ltaWxh
cml0eSBpbmRleCA3NiUKcmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lu
cy9kYXRldGltZS94ZmNlNC1kYXRldGltZS1wbHVnaW5fMC44LjEuYmIKcmVuYW1lIHRvIG1ldGEt
eGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvZGF0ZXRpbWUveGZjZTQtZGF0ZXRpbWUtcGx1Z2lu
XzAuOC4zLmJiCmluZGV4IGMwMjlhYzFjMC4uZjI5MmE2ZGVhIDEwMDY0NAotLS0gYS9tZXRhLXhm
Y2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL2RhdGV0aW1lL3hmY2U0LWRhdGV0aW1lLXBsdWdpbl8w
LjguMS5iYgorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL2RhdGV0aW1lL3hm
Y2U0LWRhdGV0aW1lLXBsdWdpbl8wLjguMy5iYgpAQCAtNSw0ICs1LDQgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NTk1MzBiZGYzMzY1OWIyOWU3M2Q0YWRiOWY5ZjY1
NTIiCiAKIGluaGVyaXQgeGZjZS1wYW5lbC1wbHVnaW4KIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImU5ZjZmMTViZTI5Y2ViNWM0NTcxODAwNmI0NmRiZDE5Yjg5OTgxNjE3ZDA3NjhiMmVmOTQyYjVh
NzBhZjI1NDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmIyZWViNzlmYjU4Njg2ODczNzQyNmNi
ZDJhNGNkNDNjN2Y4YzU4NTA3ZDhhMmY1NzhlMDE1MDE4N2NjMDBiMCIKLS0gCjIuMzkuMgoK

--===============0686782792978051943==--

