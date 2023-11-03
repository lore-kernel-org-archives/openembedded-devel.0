Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5260CC25B45
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.62973.1699041165526848112
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a3PBCMJ7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lbR/24g0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b96bece06-5c0b0a8f-a16b-46ce-80a0-6d1736dedaec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f+a+iW9s8RaB8Rca3fjYMa1/Bw293+e7zmE40PeqF5c=;
	b=a3PBCMJ7V485CkTTCHrNxT/x32qewlKtMIGOJVbijTsZ65GDWSwb3Xz85MIChCjJ
	x/UWtgvT0cxYNCZB5X+Yfcb3EnTp/5icbzyym+ev04DgbALhdLIkTV5+FoqvBLyoch3
	880D3rFJhOYikD0En8BdIgR1Q6pjBo/DRL3AjJkc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f+a+iW9s8RaB8Rca3fjYMa1/Bw293+e7zmE40PeqF5c=;
	b=lbR/24g0/hEBX/hvTDZRftlxpn27Ps0gsRxiS6B0KUNdd4bheZVB1nM/wqGvQYVv
	zJewB9O9UpTgT+Gr1ZHXYL2udjyQ0qtGJh8nuvMkFo6CYjxBtb8S8D5Wi6SQtxCYsTw
	ToIhMrAjD5iz2NnE6HVfvigOg0SUGtLKWG3m5LTk=
Content-Type: multipart/mixed; boundary="===============6536605965205822849=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libreport: upgrading to 2.17.11 FAILED
Message-ID: <0101018b96bece06-5c0b0a8f-a16b-46ce-80a0-6d1736dedaec-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105962

--===============6536605965205822849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libreport* to *2.17.11* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libreport-upgrade-2.17.8-2.17.11.patch
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
From 266299140ccb76c59926f5369fb0ed3793d0fbe7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 14:32:22 +0000
Subject: [PATCH] libreport: upgrade 2.17.8 -> 2.17.11

---
 .../libreport/{libreport_2.17.8.bb => libreport_2.17.11.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libreport/{libreport_2.17.8.bb => libreport_2.17.11.bb} (96%)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb b/meta-oe/recipes-extended/libreport/libreport_2.17.11.bb
similarity index 96%
rename from meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
rename to meta-oe/recipes-extended/libreport/libreport_2.17.11.bb
index 1f2c55c69..1dffae08c 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.17.11.bb
@@ -19,7 +19,7 @@ SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
 "
 
 # 2.17.8
-SRCREV = "46a99a14adba7276e5697b7c613d918796792345"
+SRCREV = "d58110e1fc663c92ac3e36b166f114b6904796ff"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.2


--===============6536605965205822849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libreport: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-dbg: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-dbg: PKGSIZE changed from 1398888 to 1398984 (+0%)
packages/core2-64-poky-linux/libreport/libreport-dbg: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-dev: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-dev: PKGSIZE changed from 154867 to 154751 (-0%)
packages/core2-64-poky-linux/libreport/libreport-dev: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-doc: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-doc: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-af: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-af: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-ar: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-ar: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-as: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-as: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-ast: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-ast: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-bg: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-bg: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-bn-in: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-bn-in: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-bn: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-bn: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-bs: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-bs: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-ca: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-ca: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-cs: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-cs: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-da: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-da: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-de: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-de: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-el: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-el: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-en-gb: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-en-gb: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-eo: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-eo: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-es: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-es: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-et: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-et: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-eu: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-eu: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-fa: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-fa: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-fi: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-fi: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-fr: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-fr: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-fur: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-fur: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-gl: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-gl: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-gu: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-gu: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-he: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-he: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-hi: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-hi: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-hu: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-hu: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-ia: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-ia: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-id: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-id: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-it: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-it: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-ja: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-ja: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-ka: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-ka: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-kk: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-kk: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-km: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-km: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-kn: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-kn: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-ko: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-ko: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-lt: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-lt: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-lv: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-lv: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-ml: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-ml: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-mr: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-mr: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-nb: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-nb: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-nds: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-nds: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-nl: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-nl: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-nn: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-nn: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-or: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-or: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-pa: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-pa: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-pl: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-pl: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-pt-br: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-pt-br: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-pt: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-pt: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-ru: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-ru: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-si: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-si: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-sk: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-sk: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-sq: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-sq: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-sr-latn: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-sr-latn: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-sr: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-sr: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-sv: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-sv: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-ta: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-ta: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-te: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-te: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-tg: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-tg: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-th: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-th: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-tr: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-tr: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-uk: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-uk: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-ur: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-ur: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-vi: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-vi: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-zh-cn: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-zh-cn: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-zh-hk: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-zh-hk: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-locale-zh-tw: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-locale-zh-tw: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-src: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-src: PKGSIZE changed from 992046 to 991927 (-0%)
packages/core2-64-poky-linux/libreport/libreport-src: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport-staticdev: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport-staticdev: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/libreport: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/libreport: PKGSIZE changed from 3128963 to 3129327 (+0%)
packages/core2-64-poky-linux/libreport/libreport: PV changed from "2.17.8" to "2.17.11"
packages/core2-64-poky-linux/libreport/python3-libreport: PKGV changed from 2.17.8 [default] to 2.17.11 [default]
packages/core2-64-poky-linux/libreport/python3-libreport: PKGSIZE changed from 618538 to 621475 (+0%)
packages/core2-64-poky-linux/libreport/python3-libreport: PV changed from "2.17.8" to "2.17.11"

--===============6536605965205822849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4912 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 120 recipes from the core2-64 sysroot...done.
Removing 120 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'libreport'
libreport was skipped: missing required distro feature 'systemd' (not in DISTRO_FEATURES)
libreport was skipped: missing required distro feature 'systemd' (not in DISTRO_FEATURES)

--===============6536605965205822849==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libreport-upgrade-2.17.8-2.17.11.patch"

RnJvbSAyNjYyOTkxNDBjY2I3NmM1OTkyNmY1MzY5ZmIwZWQzNzkzZDBmYmU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNDozMjoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnJlcG9ydDogdXBncmFkZSAyLjE3LjggLT4gMi4xNy4xMQoKLS0tCiAuLi4vbGlicmVwb3J0L3ts
aWJyZXBvcnRfMi4xNy44LmJiID0+IGxpYnJlcG9ydF8yLjE3LjExLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
LW9lL3JlY2lwZXMtZXh0ZW5kZWQvbGlicmVwb3J0L3tsaWJyZXBvcnRfMi4xNy44LmJiID0+IGxp
YnJlcG9ydF8yLjE3LjExLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1l
eHRlbmRlZC9saWJyZXBvcnQvbGlicmVwb3J0XzIuMTcuOC5iYiBiL21ldGEtb2UvcmVjaXBlcy1l
eHRlbmRlZC9saWJyZXBvcnQvbGlicmVwb3J0XzIuMTcuMTEuYmIKc2ltaWxhcml0eSBpbmRleCA5
NiUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2xpYnJlcG9ydC9saWJyZXBv
cnRfMi4xNy44LmJiCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbGlicmVwb3J0
L2xpYnJlcG9ydF8yLjE3LjExLmJiCmluZGV4IDFmMmM1NWM2OS4uMWRmZmFlMDhjIDEwMDY0NAot
LS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbGlicmVwb3J0L2xpYnJlcG9ydF8yLjE3Ljgu
YmIKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2xpYnJlcG9ydC9saWJyZXBvcnRfMi4x
Ny4xMS5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1NYWtlZmls
ZS5hbS1yZW1vdmUtZG9jLWFuZC1hcGlkb2MucGF0Y2ggXAogIgogCiAjIDIuMTcuOAotU1JDUkVW
ID0gIjQ2YTk5YTE0YWRiYTcyNzZlNTY5N2I3YzYxM2Q5MTg3OTY3OTIzNDUiCitTUkNSRVYgPSAi
ZDU4MTEwZTFmYzY2M2M5MmFjM2UzNmIxNjZmMTE0YjY5MDQ3OTZmZiIKIAogVVBTVFJFQU1fQ0hF
Q0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCi0tIAoyLjM5LjIKCg==

--===============6536605965205822849==--

