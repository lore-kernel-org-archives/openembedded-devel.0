Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D81FC4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.5389.1699083059819369307
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V+fZ+LQR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=djAEiDCU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b993dff68-98b49646-efac-46f6-a90d-a71fafa1ef1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l2EGO3JZhyT5zMyGJt1Tpyesg6nrYOMTt0TsoWlbPZY=;
	b=V+fZ+LQRGm0c9EgxlDZMLnoUqBxBoerLr4uUmAPtso81r4WhZfEdIv45EBkLMPQ1
	ouDgzkYJFql86hJKcLpNTLlrHJzvY1YEX3p7any88gZk1fBm2dumLc0oFWBcUZnWKo1
	dFdjPBEyBDue8e2Shmf0OvsoEqmFf/pD0ffyznyI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l2EGO3JZhyT5zMyGJt1Tpyesg6nrYOMTt0TsoWlbPZY=;
	b=djAEiDCUmlo1hbP5fsBN6EhScNmpFWCSaKn/q+b8nVjh5GtXicPW7o3WydCghhBH
	cTPXr+Ftc0FDoJmMGR72LUO/fy5cDBRJrjE7c9KLEh4bIrxvC8kS5F/94ARpZ6jkObu
	tuUKYkxyLDrcrM526D3FByj+xnTcCMAuhO/M5a+0=
Content-Type: multipart/mixed; boundary="===============4935255182914765472=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gigolo: upgrading to 0.5.3 SUCCEEDED
Message-ID: <0101018b993dff68-98b49646-efac-46f6-a90d-a71fafa1ef1b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106300

--===============4935255182914765472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gigolo* to *0.5.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gigolo-upgrade-0.5.2-0.5.3.patch
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
From b9fb03d05eede77563665710f165949231d5c0b0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:21:23 +0000
Subject: [PATCH] gigolo: upgrade 0.5.2 -> 0.5.3

---
 .../recipes-apps/gigolo/{gigolo_0.5.2.bb => gigolo_0.5.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/gigolo/{gigolo_0.5.2.bb => gigolo_0.5.3.bb} (77%)

diff --git a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.3.bb
similarity index 77%
rename from meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb
rename to meta-xfce/recipes-apps/gigolo/gigolo_0.5.3.bb
index 6b845ea61..4692f1829 100644
--- a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb
+++ b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.3.bb
@@ -7,4 +7,4 @@ DEPENDS = "gtk+3 intltool-native xfce4-dev-tools-native"
 
 inherit xfce-app
 
-SRC_URI[sha256sum] = "e34a1aa0755f9f6c234c7d24b23a6cecd6ef50741d79da3bb6f698a2281dbbc3"
+SRC_URI[sha256sum] = "d25984f65744665e2433335249f9547a38cead45440027af0c397ebf254d2fd0"
-- 
2.39.2


--===============4935255182914765472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gigolo/gigolo-dbg: PKGSIZE changed from 547840 to 546824 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-dbg: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-dbg: RRECOMMENDS: removed "libx11-dbg"
packages/core2-64-poky-linux/gigolo/gigolo-dbg: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-dev: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-dev: RRECOMMENDS: removed "libx11-dev"
packages/core2-64-poky-linux/gigolo/gigolo-dev: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-doc: PKGSIZE changed from 104206 to 107264 (+3%)
packages/core2-64-poky-linux/gigolo/gigolo-doc: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-doc: FILELIST: added "/usr/share/doc/gigolo/README.md"
packages/core2-64-poky-linux/gigolo/gigolo-doc: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-am: PKGSIZE changed from 3795 to 4473 (+18%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-am: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-am: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-ar: PKGSIZE changed from 11986 to 12915 (+8%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-ar: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-ar: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-ast: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-ast: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-be: PKGSIZE changed from 14112 to 13935 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-be: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-be: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-bg: PKGSIZE changed from 14464 to 14434 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-bg: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-bg: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-ca: PKGSIZE changed from 11833 to 11692 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-ca: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-ca: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-cs: PKGSIZE changed from 11879 to 11721 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-cs: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-cs: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-da: PKGSIZE changed from 11309 to 11296 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-da: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-da: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-de: PKGSIZE changed from 11988 to 11970 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-de: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-de: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-el: PKGSIZE changed from 14417 to 14431 (+0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-el: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-el: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-en-au: PKGSIZE changed from 10521 to 10510 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-en-au: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-en-au: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-en-ca: PKGSIZE changed from 9963 to 10699 (+7%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-en-ca: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-en-ca: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-eo: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-eo: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-es: PKGSIZE changed from 11728 to 11836 (+1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-es: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-es: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-et: PKGSIZE changed from 11567 to 11453 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-et: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-et: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-eu: PKGSIZE changed from 11530 to 11367 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-eu: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-eu: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-fi: PKGSIZE changed from 10856 to 10844 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-fi: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-fi: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-fr: PKGSIZE changed from 12061 to 12096 (+0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-fr: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-fr: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-gl: PKGSIZE changed from 11767 to 11614 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-gl: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-gl: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-he: PKGSIZE changed from 12572 to 12453 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-he: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-he: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-hr: PKGSIZE changed from 10970 to 11136 (+2%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-hr: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-hr: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-hu: PKGSIZE changed from 11697 to 11714 (+0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-hu: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-hu: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-hy-am: PKGSIZE changed from 12204 to 12175 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-hy-am: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-hy-am: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-hye: PKGSIZE changed from 12093 to 12104 (+0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-hye: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-hye: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-id: PKGSIZE changed from 11324 to 11158 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-id: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-id: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-ie: PKGSIZE changed from 9727 to 9765 (+0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-ie: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-ie: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-is: PKGSIZE changed from 11054 to 11052 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-is: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-is: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-it: PKGSIZE changed from 11862 to 11873 (+0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-it: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-it: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-ja: PKGSIZE changed from 12941 to 12910 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-ja: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-ja: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-kk: PKGSIZE changed from 5244 to 5940 (+13%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-kk: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-kk: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-ko: PKGSIZE changed from 11546 to 11858 (+3%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-ko: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-ko: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-lt: PKGSIZE changed from 11702 to 11661 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-lt: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-lt: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-lv: PKGSIZE changed from 9588 to 9517 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-lv: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-lv: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-ms: PKGSIZE changed from 10850 to 11084 (+2%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-ms: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-ms: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-nb: PKGSIZE changed from 11397 to 11354 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-nb: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-nb: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-nl: PKGSIZE changed from 11732 to 11715 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-nl: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-nl: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-oc: PKGSIZE changed from 11471 to 11522 (+0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-oc: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-oc: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-pl: PKGSIZE changed from 11843 to 11784 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-pl: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-pl: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-pt-br: PKGSIZE changed from 11644 to 11623 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-pt-br: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-pt-br: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-pt: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-pt: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-ru: PKGSIZE changed from 13840 to 14162 (+2%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-ru: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-ru: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-sk: PKGSIZE changed from 11688 to 11706 (+0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-sk: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-sk: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-sl: PKGSIZE changed from 11088 to 11051 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-sl: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-sl: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-sq: PKGSIZE changed from 11588 to 11550 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-sq: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-sq: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-sr: PKGSIZE changed from 14196 to 14156 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-sr: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-sr: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-sv: PKGSIZE changed from 11373 to 11261 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-sv: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-sv: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-te: PKGSIZE changed from 7269 to 7270 (+0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-te: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-te: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-th: PKGSIZE changed from 17001 to 17480 (+3%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-th: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-th: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-tr: PKGSIZE changed from 11720 to 11603 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-tr: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-tr: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-ug: PKGSIZE changed from 13460 to 13356 (-1%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-ug: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-ug: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-uk: PKGSIZE changed from 14257 to 14678 (+3%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-uk: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-uk: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-ur-pk: PKGSIZE changed from 9968 to 9940 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-ur-pk: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-ur-pk: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-ur: PKGSIZE changed from 9951 to 9923 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-ur: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-ur: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-zh-cn: PKGSIZE changed from 10910 to 10893 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-zh-cn: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-zh-cn: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-locale-zh-tw: PKGSIZE changed from 10836 to 10817 (-0%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-zh-tw: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-locale-zh-tw: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-src: PKGSIZE changed from 285868 to 286895 (+0%)
packages/core2-64-poky-linux/gigolo/gigolo-src: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-src: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo-staticdev: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo-staticdev: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo: PKGSIZE changed from 206996 to 193946 (-6%)
packages/core2-64-poky-linux/gigolo/gigolo: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo/gigolo: FILELIST: added "/usr/share/icons/hicolor/96x96/apps/org.xfce.gigolo.png /usr/share/icons/hicolor/64x64/apps/org.xfce.gigolo.png"
packages/core2-64-poky-linux/gigolo/gigolo: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-64-poky-linux/gigolo/gigolo: RDEPENDS: removed "libx11 (['>= 1.8.7'])"
packages/core2-64-poky-linux/gigolo: PACKAGES: added "gigolo-locale-en-gb"
packages/core2-64-poky-linux/gigolo: PV changed from "0.5.2" to "0.5.3"
packages/core2-64-poky-linux/gigolo: SRC_URI changed from "http://archive.xfce.org/src/apps/gigolo/0.5/gigolo-0.5.2.tar.bz2" to "http://archive.xfce.org/src/apps/gigolo/0.5/gigolo-0.5.3.tar.bz2"
packages/core2-64-poky-linux/gigolo: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
Changes to packages/core2-64-poky-linux/gigolo (sysroot):
  /usr/share/icons/hicolor/64x64 was added
  /usr/share/icons/hicolor/64x64/apps was added
  /usr/share/icons/hicolor/64x64/apps/org.xfce.gigolo.png was added
  /usr/share/icons/hicolor/96x96 was added
  /usr/share/icons/hicolor/96x96/apps was added
  /usr/share/icons/hicolor/96x96/apps/org.xfce.gigolo.png was added

--===============4935255182914765472==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gigolo-upgrade-0.5.2-0.5.3.patch"

RnJvbSBiOWZiMDNkMDVlZWRlNzc1NjM2NjU3MTBmMTY1OTQ5MjMxZDVjMGIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNToyMToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdp
Z29sbzogdXBncmFkZSAwLjUuMiAtPiAwLjUuMwoKLS0tCiAuLi4vcmVjaXBlcy1hcHBzL2dpZ29s
by97Z2lnb2xvXzAuNS4yLmJiID0+IGdpZ29sb18wLjUuMy5iYn0gICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLXhmY2Uv
cmVjaXBlcy1hcHBzL2dpZ29sby97Z2lnb2xvXzAuNS4yLmJiID0+IGdpZ29sb18wLjUuMy5iYn0g
KDc3JSkKCmRpZmYgLS1naXQgYS9tZXRhLXhmY2UvcmVjaXBlcy1hcHBzL2dpZ29sby9naWdvbG9f
MC41LjIuYmIgYi9tZXRhLXhmY2UvcmVjaXBlcy1hcHBzL2dpZ29sby9naWdvbG9fMC41LjMuYmIK
c2ltaWxhcml0eSBpbmRleCA3NyUKcmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMtYXBwcy9n
aWdvbG8vZ2lnb2xvXzAuNS4yLmJiCnJlbmFtZSB0byBtZXRhLXhmY2UvcmVjaXBlcy1hcHBzL2dp
Z29sby9naWdvbG9fMC41LjMuYmIKaW5kZXggNmI4NDVlYTYxLi40NjkyZjE4MjkgMTAwNjQ0Ci0t
LSBhL21ldGEteGZjZS9yZWNpcGVzLWFwcHMvZ2lnb2xvL2dpZ29sb18wLjUuMi5iYgorKysgYi9t
ZXRhLXhmY2UvcmVjaXBlcy1hcHBzL2dpZ29sby9naWdvbG9fMC41LjMuYmIKQEAgLTcsNCArNyw0
IEBAIERFUEVORFMgPSAiZ3RrKzMgaW50bHRvb2wtbmF0aXZlIHhmY2U0LWRldi10b29scy1uYXRp
dmUiCiAKIGluaGVyaXQgeGZjZS1hcHAKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImUzNGExYWEw
NzU1ZjlmNmMyMzRjN2QyNGIyM2E2Y2VjZDZlZjUwNzQxZDc5ZGEzYmI2ZjY5OGEyMjgxZGJiYzMi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDI1OTg0ZjY1NzQ0NjY1ZTI0MzMzMzUyNDlmOTU0N2Ez
OGNlYWQ0NTQ0MDAyN2FmMGMzOTdlYmYyNTRkMmZkMCIKLS0gCjIuMzkuMgoK

--===============4935255182914765472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gigolo/gigolo-dbg: RRECOMMENDS: removed "libx11-dbg"
packages/core2-64-poky-linux/gigolo/gigolo-dev: RRECOMMENDS: removed "libx11-dev"
packages/core2-64-poky-linux/gigolo/gigolo-doc: FILELIST: added "/usr/share/doc/gigolo/README.md"
packages/core2-64-poky-linux/gigolo/gigolo-locale-am: PKGSIZE changed from 3795 to 4473 (+18%)
packages/core2-64-poky-linux/gigolo/gigolo-locale-kk: PKGSIZE changed from 5244 to 5940 (+13%)
packages/core2-64-poky-linux/gigolo/gigolo: FILELIST: added "/usr/share/icons/hicolor/64x64/apps/org.xfce.gigolo.png /usr/share/icons/hicolor/96x96/apps/org.xfce.gigolo.png"
packages/core2-64-poky-linux/gigolo/gigolo: RDEPENDS: removed "libx11 (['>= 1.8.7'])"
packages/core2-64-poky-linux/gigolo: PACKAGES: added "gigolo-locale-en-gb"
Changes to packages/core2-64-poky-linux/gigolo (sysroot):
  /usr/share/icons/hicolor/64x64 was added
  /usr/share/icons/hicolor/64x64/apps was added
  /usr/share/icons/hicolor/64x64/apps/org.xfce.gigolo.png was added
  /usr/share/icons/hicolor/96x96 was added
  /usr/share/icons/hicolor/96x96/apps was added
  /usr/share/icons/hicolor/96x96/apps/org.xfce.gigolo.png was added

--===============4935255182914765472==--

