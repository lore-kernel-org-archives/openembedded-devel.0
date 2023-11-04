Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE29EC05055
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.5398.1699083060623678286
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dm4fXQHS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BzUFUtFQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b993e004a-5de6585c-0004-44f1-b914-82a06241dca6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EIXbXLnLp0zRRfvym7bbspDFLEgcWVMDf9EyDeHP8Gk=;
	b=dm4fXQHSQakEKAdesUzB5DVPjAEQ6dZ2x5V0DOfOmDg4ZgF52tX1A3TmnP3K1SF5
	LyhMlZwU9zbwCg7aSfp5OWeU3zT0MsrQeQpLW3gybL3JrXJUOdqqcaVcYWvqtPQ/e3O
	/R7fBvdSVaYNS+B+XUTlfI1U+AmrHJ4M9WPl/61g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EIXbXLnLp0zRRfvym7bbspDFLEgcWVMDf9EyDeHP8Gk=;
	b=BzUFUtFQWpcmCJLcW6cGpTSDGcTqFW/NO9/om2k9pftB7mMDdUBt2fqg36g+lVSs
	yYHeEtx9qwk813HLNc+6kjf5+C008Ia3kGuRgFatQxLK9EZ3g1KNhchHVECfbIYlB2o
	BOWf7pSMWTNBJ0XDAgAO0WtwIXVVZLsNgR+D0UPE=
Content-Type: multipart/mixed; boundary="===============1116776297019940069=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] thunar: upgrading to 4.19.0 SUCCEEDED
Message-ID: <0101018b993e004a-5de6585c-0004-44f1-b914-82a06241dca6-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106322

--===============1116776297019940069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *thunar* to *4.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-thunar-upgrade-4.18.4-4.19.0.patch
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
From afa5a866299641d6cbe4bd7be8fd77d37d676509 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:44:08 +0000
Subject: [PATCH] thunar: upgrade 4.18.4 -> 4.19.0

---
 .../recipes-xfce/thunar/{thunar_4.18.4.bb => thunar_4.19.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.18.4.bb => thunar_4.19.0.bb} (92%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.18.4.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb
similarity index 92%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.18.4.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb
index 921dba063..02e4ef956 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.18.4.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb
@@ -10,7 +10,7 @@ inherit xfce gobject-introspection features_check mime-xdg perlnative
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[sha256sum] = "c4463ce2fb1d628adce70a828e8b4de5fa0802236894d2c40f749471619bedcc"
+SRC_URI[sha256sum] = "684f1422c4d92b00db477ecaa2a0ed38ce688e2a567e5d70b7cf66fc6dd6fd18"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] = "--enable-pcre2,--disable-pcre2,libpcre2"
-- 
2.39.2


--===============1116776297019940069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/thunar: SRC_URI changed from "http://archive.xfce.org/src/xfce/thunar/4.18/thunar-4.18.4.tar.bz2" to "http://archive.xfce.org/src/xfce/thunar/4.19/thunar-4.19.0.tar.bz2"
packages/core2-64-poky-linux/thunar: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-dbg: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-dbg: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-dbg: PKGSIZE changed from 4444256 to 4593248 (+3%)
packages/core2-64-poky-linux/thunar/thunar-dev: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-dev: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-dev: PKGSIZE changed from 308112 to 309470 (+0%)
packages/core2-64-poky-linux/thunar/thunar-doc: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-doc: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-am: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-am: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ar: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ar: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ar: PKGSIZE changed from 84203 to 83572 (-1%)
packages/core2-64-poky-linux/thunar/thunar-locale-ast: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ast: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ast: PKGSIZE changed from 57196 to 56802 (-1%)
packages/core2-64-poky-linux/thunar/thunar-locale-be: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-be: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-be: PKGSIZE changed from 98189 to 96439 (-2%)
packages/core2-64-poky-linux/thunar/thunar-locale-bg: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-bg: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-bg: PKGSIZE changed from 125971 to 131032 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-bn: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-bn: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-bn: PKGSIZE changed from 85165 to 84855 (-0%)
packages/core2-64-poky-linux/thunar/thunar-locale-ca: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ca: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ca: PKGSIZE changed from 70885 to 86630 (+22%)
packages/core2-64-poky-linux/thunar/thunar-locale-cs: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-cs: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-cs: PKGSIZE changed from 87665 to 99049 (+13%)
packages/core2-64-poky-linux/thunar/thunar-locale-da: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-da: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-da: PKGSIZE changed from 73375 to 94033 (+28%)
packages/core2-64-poky-linux/thunar/thunar-locale-de: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-de: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-de: PKGSIZE changed from 97841 to 102137 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-el: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-el: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-el: PKGSIZE changed from 126862 to 129712 (+2%)
packages/core2-64-poky-linux/thunar/thunar-locale-en-au: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-en-au: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-en-au: PKGSIZE changed from 57551 to 61941 (+8%)
packages/core2-64-poky-linux/thunar/thunar-locale-en-gb: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-en-gb: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-en-gb: PKGSIZE changed from 58149 to 92919 (+60%)
packages/core2-64-poky-linux/thunar/thunar-locale-eo: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-eo: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-eo: PKGSIZE changed from 45107 to 49182 (+9%)
packages/core2-64-poky-linux/thunar/thunar-locale-es: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-es: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-es: PKGSIZE changed from 99074 to 99167 (+0%)
packages/core2-64-poky-linux/thunar/thunar-locale-et: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-et: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-et: PKGSIZE changed from 83432 to 94219 (+13%)
packages/core2-64-poky-linux/thunar/thunar-locale-eu: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-eu: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-eu: PKGSIZE changed from 74951 to 82700 (+10%)
packages/core2-64-poky-linux/thunar/thunar-locale-fa-ir: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-fa-ir: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-fa-ir: PKGSIZE changed from 57242 to 63064 (+10%)
packages/core2-64-poky-linux/thunar/thunar-locale-fi: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-fi: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-fi: PKGSIZE changed from 74331 to 80180 (+8%)
packages/core2-64-poky-linux/thunar/thunar-locale-fr: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-fr: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-fr: PKGSIZE changed from 101001 to 105637 (+5%)
packages/core2-64-poky-linux/thunar/thunar-locale-gl: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-gl: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-gl: PKGSIZE changed from 92379 to 91171 (-1%)
packages/core2-64-poky-linux/thunar/thunar-locale-he: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-he: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-he: PKGSIZE changed from 106641 to 112046 (+5%)
packages/core2-64-poky-linux/thunar/thunar-locale-hr: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-hr: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-hr: PKGSIZE changed from 64858 to 72573 (+12%)
packages/core2-64-poky-linux/thunar/thunar-locale-hu: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-hu: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-hu: PKGSIZE changed from 69690 to 75900 (+9%)
packages/core2-64-poky-linux/thunar/thunar-locale-hy-am: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-hy-am: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-hy-am: PKGSIZE changed from 80022 to 85042 (+6%)
packages/core2-64-poky-linux/thunar/thunar-locale-hy: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-hy: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-hy: PKGSIZE changed from 72909 to 77963 (+7%)
packages/core2-64-poky-linux/thunar/thunar-locale-hye: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-hye: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-hye: PKGSIZE changed from 76873 to 81935 (+7%)
packages/core2-64-poky-linux/thunar/thunar-locale-id: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-id: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-id: PKGSIZE changed from 75011 to 86322 (+15%)
packages/core2-64-poky-linux/thunar/thunar-locale-ie: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ie: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ie: PKGSIZE changed from 73725 to 79978 (+8%)
packages/core2-64-poky-linux/thunar/thunar-locale-is: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-is: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-is: PKGSIZE changed from 54239 to 58709 (+8%)
packages/core2-64-poky-linux/thunar/thunar-locale-it: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-it: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-it: PKGSIZE changed from 96870 to 100923 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-ja: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ja: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ja: PKGSIZE changed from 105737 to 110157 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-kk: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-kk: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-kk: PKGSIZE changed from 118656 to 118602 (-0%)
packages/core2-64-poky-linux/thunar/thunar-locale-ko: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ko: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ko: PKGSIZE changed from 94959 to 95049 (+0%)
packages/core2-64-poky-linux/thunar/thunar-locale-lt: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-lt: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-lt: PKGSIZE changed from 89500 to 77570 (-13%)
packages/core2-64-poky-linux/thunar/thunar-locale-lv: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-lv: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-lv: PKGSIZE changed from 47656 to 52157 (+9%)
packages/core2-64-poky-linux/thunar/thunar-locale-ms: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ms: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ms: PKGSIZE changed from 75691 to 79498 (+5%)
packages/core2-64-poky-linux/thunar/thunar-locale-nb: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-nb: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-nb: PKGSIZE changed from 89446 to 93291 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-nl: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-nl: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-nl: PKGSIZE changed from 94814 to 99023 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-nn: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-nn: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-nn: PKGSIZE changed from 59797 to 65241 (+9%)
packages/core2-64-poky-linux/thunar/thunar-locale-oc: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-oc: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-oc: PKGSIZE changed from 72536 to 78632 (+8%)
packages/core2-64-poky-linux/thunar/thunar-locale-pa: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-pa: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-pl: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-pl: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-pl: PKGSIZE changed from 95723 to 100027 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-pt-br: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-pt-br: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-pt-br: PKGSIZE changed from 88864 to 100773 (+13%)
packages/core2-64-poky-linux/thunar/thunar-locale-pt: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-pt: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-pt: PKGSIZE changed from 96357 to 100318 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-ro: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ro: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ro: PKGSIZE changed from 60740 to 67530 (+11%)
packages/core2-64-poky-linux/thunar/thunar-locale-ru: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ru: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ru: PKGSIZE changed from 111160 to 99165 (-11%)
packages/core2-64-poky-linux/thunar/thunar-locale-si: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-si: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-sk: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-sk: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-sk: PKGSIZE changed from 65269 to 73467 (+13%)
packages/core2-64-poky-linux/thunar/thunar-locale-sl: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-sl: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-sl: PKGSIZE changed from 81676 to 65873 (-19%)
packages/core2-64-poky-linux/thunar/thunar-locale-sq: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-sq: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-sq: PKGSIZE changed from 95932 to 99845 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-sr: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-sr: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-sr: PKGSIZE changed from 120254 to 125484 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-sv: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-sv: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-sv: PKGSIZE changed from 88756 to 95936 (+8%)
packages/core2-64-poky-linux/thunar/thunar-locale-te: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-te: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-te: PKGSIZE changed from 53696 to 58784 (+9%)
packages/core2-64-poky-linux/thunar/thunar-locale-th: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-th: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-th: PKGSIZE changed from 104214 to 108813 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-tr: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-tr: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-tr: PKGSIZE changed from 92558 to 94732 (+2%)
packages/core2-64-poky-linux/thunar/thunar-locale-ug: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ug: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ug: PKGSIZE changed from 67210 to 67133 (-0%)
packages/core2-64-poky-linux/thunar/thunar-locale-uk: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-uk: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-uk: PKGSIZE changed from 105412 to 93847 (-11%)
packages/core2-64-poky-linux/thunar/thunar-locale-ur-pk: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ur-pk: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ur-pk: PKGSIZE changed from 53843 to 58373 (+8%)
packages/core2-64-poky-linux/thunar/thunar-locale-ur: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-ur: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-ur: PKGSIZE changed from 53826 to 58356 (+8%)
packages/core2-64-poky-linux/thunar/thunar-locale-vi: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-vi: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-vi: PKGSIZE changed from 61950 to 64945 (+5%)
packages/core2-64-poky-linux/thunar/thunar-locale-zh-cn: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-zh-cn: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-zh-cn: PKGSIZE changed from 86250 to 89977 (+4%)
packages/core2-64-poky-linux/thunar/thunar-locale-zh-hk: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-zh-hk: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-zh-hk: PKGSIZE changed from 51436 to 54707 (+6%)
packages/core2-64-poky-linux/thunar/thunar-locale-zh-tw: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-locale-zh-tw: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-locale-zh-tw: PKGSIZE changed from 87007 to 90879 (+4%)
packages/core2-64-poky-linux/thunar/thunar-src: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-src: FILELIST: directory renamed /usr/src/debug/thunar/4.18.4-r0/plugins/thunar-wallpaper -> /usr/src/debug/thunar/4.19.0-r0/plugins/thunar-wallpaper, directory renamed /usr/src/debug/thunar/4.18.4-r0/plugins/thunar-sbr -> /usr/src/debug/thunar/4.19.0-r0/plugins/thunar-sbr, directory renamed /usr/src/debug/thunar/4.18.4-r0/plugins/thunar-apr -> /usr/src/debug/thunar/4.19.0-r0/plugins/thunar-apr, directory renamed /usr/src/debug/thunar/4.18.4-r0/plugins/thunar-sendto-email -> /usr/src/debug/thunar/4.19.0-r0/plugins/thunar-sendto-email, directory renamed /usr/src/debug/thunar/4.18.4-r0/plugins/thunar-uca -> /usr/src/debug/thunar/4.19.0-r0/plugins/thunar-uca, directory renamed /usr/src/debug/thunar/4.18.4-r0/thunarx -> /usr/src/debug/thunar/4.19.0-r0/thunarx, directory renamed /usr/src/debug/thunar/4.18.4-r0/plugins/thunar-tpa -> /usr/src/debug/thunar/4.19.0-r0/plugins/thunar-tpa, removed "/usr/src/debug/thunar/4.18.4-r0/thunar/thunar-shortcuts
 -view.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-shortcuts-view.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-location-buttons.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-device.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-dbus-service.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-gio-extensions.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-thumbnailer-proxy.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-location-buttons.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-thumbnailer-proxy.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-dbus-service.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-gio-extensions.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-device.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-renamer-dialog.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-chooser-model.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-component.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-renamer-dialog.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-chooser-model.
 c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-component.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-icon-renderer.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-sendto-model.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-gdk-extensions.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-gtk-extensions.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-tree-model.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-column-model.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-gdk-extensions.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-gtk-extensions.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-icon-renderer.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-sendto-model.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-column-model.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-tree-model.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-details-view.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-thumbnail-cache.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-thumbnail-cache.h /usr/src/d
 ebug/thunar/4.18.4-r0/thunar/thunar-details-view.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-device-monitor.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-io-jobs-util.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-standard-view.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-dbus-freedesktop-interfaces.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-column-editor.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-io-jobs-util.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-standard-view.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-device-monitor.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-column-editor.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-dbus-freedesktop-interfaces.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-size-label.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-size-label.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-abstract-icon-view.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-util.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-location-entry
 .h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-abstract-icon-view.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-util.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-location-entry.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-view.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-thumbnailer.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-view.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-thumbnailer.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-shortcuts-icon-renderer.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-icon-factory.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-progress-view.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-shortcuts-icon-renderer.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-icon-factory.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-progress-view.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-job-operation.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-dnd.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-job-operation.h /usr/src/debug/thun
 ar/4.18.4-r0/thunar/thunar-dnd.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-chooser-button.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-folder.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-job.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-chooser-button.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-folder.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-job.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-icon-view.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-renamer-pair.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-renamer-pair.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-icon-view.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-progress-dialog.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-preferences-dialog.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-gobject-extensions.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-properties-dialog.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-preferences-dialog.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-progress-
 dialog.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-properties-dialog.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-gobject-extensions.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-menu.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-session-client.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-side-pane.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-location-button.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-pango-extensions.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-image.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-menu.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-session-client.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-image.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-pango-extensions.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-location-button.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-resources.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-side-pane.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-notify.h /usr/src/debug/thunar/4.18.4
 -r0/thunar/thunar-notify.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-simple-job.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-statusbar.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-thumbnail-cache-proxy.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-transfer-job.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-thumbnail-cache-proxy.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-statusbar.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-simple-job.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-transfer-job.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-ice.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-tree-pane.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-tree-view.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-ice.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-tree-pane.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-tree-view.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-file.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-io-scan-directory.h /usr/src/debug/thun
 ar/4.18.4-r0/thunar/thunar-shortcuts-model.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-file.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-io-scan-directory.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-shortcuts-model.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-compact-view.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-renamer-model.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-renamer-model.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-compact-view.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-enum-types.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-job-operation-history.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-abstract-dialog.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-application.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-enum-types.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-job-operation-history.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-abstract-dialog.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-application.c /usr/src/debug/th
 unar/4.18.4-r0/thunar/thunar-marshal.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-window.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-window.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-marshal.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-emblem-chooser.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-navigator.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-history.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-permissions-chooser.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-history.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-emblem-chooser.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-navigator.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-permissions-chooser.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-preferences.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-dialogs.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-shortcuts-pane.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-io-jobs.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-dialogs.c /usr/src/de
 bug/thunar/4.18.4-r0/thunar/thunar-preferences.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-io-jobs.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-shortcuts-pane.h /usr/src/debug/thunar/4.18.4-r0/thunar/main.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-chooser-dialog.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-text-renderer.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-renamer-progress.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-deep-count-job.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-chooser-dialog.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-deep-count-job.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-renamer-progress.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-text-renderer.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-location-bar.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-file-monitor.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-file-monitor.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-location-bar.c /usr/src/debug/thunar/4.18.4-r0/t
 hunar/thunar-dbus-service-infos.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-action-manager.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-browser.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-clipboard-manager.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-list-model.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-dbus-service-infos.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-list-model.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-clipboard-manager.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-action-manager.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-browser.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-toolbar-editor.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-toolbar-editor.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-user.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-path-entry.h /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-user.c /usr/src/debug/thunar/4.18.4-r0/thunar/thunar-path-entry.c", added "/usr/src/debug/thunar/4.19.0-r0/thunar/thunar-not
 ify.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-notify.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-simple-job.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-statusbar.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-thumbnail-cache-proxy.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-session-client.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-transfer-job.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-thumbnail-cache-proxy.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-statusbar.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-simple-job.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-transfer-job.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-ice.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-tree-pane.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-tree-view.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-ice.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-tree-view.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-tree-pane.c /usr/src/debug/thunar/4.19.0-r0/thunar/th
 unar-file.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-io-scan-directory.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-shortcuts-model.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-file.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-io-scan-directory.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-shortcuts-model.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-compact-view.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-renamer-model.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-renamer-model.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-compact-view.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-enum-types.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-job-operation-history.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-abstract-dialog.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-application.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-enum-types.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-job-operation-history.h /usr/src/debug/thunar/4.19.0-r0/thunar/thuna
 r-abstract-dialog.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-application.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-marshal.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-window.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-window.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-marshal.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-emblem-chooser.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-navigator.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-history.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-permissions-chooser.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-history.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-emblem-chooser.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-navigator.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-permissions-chooser.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-preferences.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-dialogs.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-shortcuts-pane.c /usr/src/debug/thunar/4.19
 .0-r0/thunar/thunar-io-jobs.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-dialogs.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-preferences.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-io-jobs.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-shortcuts-pane.h /usr/src/debug/thunar/4.19.0-r0/thunar/main.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-chooser-dialog.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-text-renderer.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-renamer-progress.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-deep-count-job.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-chooser-dialog.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-deep-count-job.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-renamer-progress.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-text-renderer.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-menu.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-location-bar.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-file-monitor.h /usr/
 src/debug/thunar/4.19.0-r0/thunar/thunar-file-monitor.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-location-bar.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-dbus-service-infos.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-action-manager.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-browser.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-clipboard-manager.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-list-model.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-dbus-service-infos.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-list-model.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-clipboard-manager.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-action-manager.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-browser.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-toolbar-editor.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-toolbar-editor.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-user.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-path-entry.h /usr/src/debug/thuna
 r/4.19.0-r0/thunar/thunar-user.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-path-entry.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-tree-view-model.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-tree-view-model.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-shortcuts-view.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-shortcuts-view.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-location-buttons.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-device.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-dbus-service.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-gio-extensions.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-thumbnailer-proxy.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-location-buttons.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-thumbnailer-proxy.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-dbus-service.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-device.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-gio-extensions.c /usr/src/debug/thunar/4.19.0-r0
 /thunar/thunar-renamer-dialog.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-chooser-model.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-component.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-renamer-dialog.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-chooser-model.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-component.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-icon-renderer.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-sendto-model.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-gdk-extensions.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-gtk-extensions.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-tree-model.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-column-model.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-gdk-extensions.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-gtk-extensions.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-icon-renderer.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-sendto-model.c /usr/src/debug/thunar/4.19.0-r0/thunar/thuna
 r-column-model.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-tree-model.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-details-view.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-thumbnail-cache.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-thumbnail-cache.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-details-view.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-device-monitor.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-io-jobs-util.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-standard-view.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-dbus-freedesktop-interfaces.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-column-editor.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-io-jobs-util.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-standard-view.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-device-monitor.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-column-editor.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-dbus-freedesktop-interfaces.h /usr/src/debug/thunar/4
 .19.0-r0/thunar/thunar-size-label.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-size-label.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-standard-view-model.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-standard-view-model.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-abstract-icon-view.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-util.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-location-entry.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-abstract-icon-view.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-util.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-location-entry.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-view.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-thumbnailer.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-view.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-thumbnailer.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-shortcuts-icon-renderer.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-icon-factory.c /usr/src/debug/thunar/4.19.0-r0/thunar/th
 unar-progress-view.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-shortcuts-icon-renderer.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-icon-factory.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-progress-view.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-job-operation.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-dnd.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-job-operation.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-dnd.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-chooser-button.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-folder.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-job.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-chooser-button.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-folder.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-job.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-icon-view.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-renamer-pair.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-renamer-pair.c /usr/src/debug/thunar/4.19.0-r0/t
 hunar/thunar-icon-view.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-progress-dialog.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-preferences-dialog.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-gobject-extensions.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-properties-dialog.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-preferences-dialog.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-progress-dialog.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-properties-dialog.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-gobject-extensions.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-menu.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-session-client.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-side-pane.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-location-button.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-pango-extensions.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-image.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-side-pane.c /usr/src/debug/thunar/4.19.0-
 r0/thunar/thunar-image.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-pango-extensions.c /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-location-button.h /usr/src/debug/thunar/4.19.0-r0/thunar/thunar-resources.c"
packages/core2-64-poky-linux/thunar/thunar-src: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar-src: PKGSIZE changed from 4688615 to 4902875 (+5%)
packages/core2-64-poky-linux/thunar/thunar-staticdev: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar-staticdev: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar: PV changed from "4.18.4" to "4.19.0"
packages/core2-64-poky-linux/thunar/thunar: PKGV changed from 4.18.4 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/thunar/thunar: PKGSIZE changed from 1386903 to 1429604 (+3%)

--===============1116776297019940069==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-thunar-upgrade-4.18.4-4.19.0.patch"

RnJvbSBhZmE1YTg2NjI5OTY0MWQ2Y2JlNGJkN2JlOGZkNzdkMzdkNjc2NTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNTo0NDowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRo
dW5hcjogdXBncmFkZSA0LjE4LjQgLT4gNC4xOS4wCgotLS0KIC4uLi9yZWNpcGVzLXhmY2UvdGh1
bmFyL3t0aHVuYXJfNC4xOC40LmJiID0+IHRodW5hcl80LjE5LjAuYmJ9ICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEteGZj
ZS9yZWNpcGVzLXhmY2UvdGh1bmFyL3t0aHVuYXJfNC4xOC40LmJiID0+IHRodW5hcl80LjE5LjAu
YmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS90aHVuYXIvdGh1
bmFyXzQuMTguNC5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXhmY2UvdGh1bmFyL3RodW5hcl80LjE5
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMt
eGZjZS90aHVuYXIvdGh1bmFyXzQuMTguNC5iYgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMt
eGZjZS90aHVuYXIvdGh1bmFyXzQuMTkuMC5iYgppbmRleCA5MjFkYmEwNjMuLjAyZTRlZjk1NiAx
MDA2NDQKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS90aHVuYXIvdGh1bmFyXzQuMTguNC5i
YgorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3RodW5hci90aHVuYXJfNC4xOS4wLmJiCkBA
IC0xMCw3ICsxMCw3IEBAIGluaGVyaXQgeGZjZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZmVhdHVy
ZXNfY2hlY2sgbWltZS14ZGcgcGVybG5hdGl2ZQogIyBjYWlybyB3b3VsZCBhdCBsZWFzdCBuZWVk
ZWQgdG8gYmUgYnVpbHQgd2l0aCB4bGliLgogQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0dU
SzNESVNUUk9GRUFUVVJFU30iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNDQ2M2NlMmZiMWQ2
MjhhZGNlNzBhODI4ZThiNGRlNWZhMDgwMjIzNjg5NGQyYzQwZjc0OTQ3MTYxOWJlZGNjIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjY4NGYxNDIyYzRkOTJiMDBkYjQ3N2VjYWEyYTBlZDM4Y2U2ODhl
MmE1NjdlNWQ3MGI3Y2Y2NmZjNmRkNmZkMTgiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIke0BiYi51
dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICd4MTEnLCBkKX0iCiBQQUNLQUdFQ09ORklH
W3BjcmVdID0gIi0tZW5hYmxlLXBjcmUyLC0tZGlzYWJsZS1wY3JlMixsaWJwY3JlMiIKLS0gCjIu
MzkuMgoK

--===============1116776297019940069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4895 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 105 recipes from the core2-64 sysroot...done.
Removing 116 recipes from the qemux86_64 sysroot...done.
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
meta-webserver       = "tmp-auh-upgrades:776cedd70030f598b23459e71e1afac90df860af"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 972 Local 957 Mirrors 0 Missed 15 Current 299 (98% match, 98% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 305 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb:do_create_spdx_setscene)
NOTE: Running setscene task 314 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 316 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 317 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 318 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssh/openssh_9.5p1.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 331 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 333 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 371 of 1271 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgphoto2-2.5.31-r0: task do_create_spdx_setscene: Started
NOTE: recipe thunar-4.19.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe thunar-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gsettings-desktop-schemas-44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssh-9.5p1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml-parser-perl-native-2.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe thunar-4.19.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe thunar-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 505 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgphoto2-2.5.31-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 506 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 511 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 516 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 518 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml-parser-perl-native-2.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 524 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 530 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_packagedata_setscene)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 531 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssh-9.5p1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe thunar-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 436 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_write_config)
NOTE: recipe libnotify-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_packagedata_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgphoto2-2.5.31-r0: task do_packagedata_setscene: Started
NOTE: recipe libgphoto2-2.5.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gsettings-desktop-schemas-44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gsettings-desktop-schemas-44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gvfs-1.52.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe thunar-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 450 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb:do_fetch)
NOTE: recipe gvfs-1.52.0-r0: task do_write_config: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe gvfs-1.52.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 539 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_recipe_qa_setscene)
NOTE: recipe exo-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 540 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 541 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx_setscene)
NOTE: recipe gvfs-1.52.0-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe thunar-4.19.0-r0: task do_fetch: Started
NOTE: recipe thunar-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 452 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgphoto2-2.5.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfce4ui-4.18.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gvfs-1.52.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgphoto2-2.5.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 549 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libexif/libexif_0.6.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libexif/libexif_0.6.24.bb:do_populate_sysroot_setscene)
NOTE: recipe thunar-4.19.0-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gvfs-1.52.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 457 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_fetch)
NOTE: recipe libgphoto2-2.5.31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libexif-0.6.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libexif-0.6.24-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 557 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfce4ui-4.18.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 561 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 570 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 571 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgphoto2-2.5.31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 572 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe gvfs-1.52.0-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gvfs-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 573 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 576 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libwnck3-43.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwnck3-43.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 578 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb:do_recipe_qa_setscene)
NOTE: recipe libexif-0.6.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe exo-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 584 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_create_spdx_setscene)
NOTE: recipe libexif-0.6.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe exo-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 588 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libexif/libexif_0.6.24.bb:do_recipe_qa_setscene)
NOTE: recipe garcon-4.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xfce4-panel-4.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 590 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 591 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwnck3-43.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 625 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe startup-notification-0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libexif-0.6.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 627 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 628 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 629 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe exo-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 631 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libexif-0.6.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe thunar-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 647 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 653 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 656 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 657 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 658 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe exo-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe garcon-4.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 678 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe libwnck3-43.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 686 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: recipe libxfce4ui-4.18.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 687 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfce4ui-4.18.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 689 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: recipe libxres-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwnck3-43.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe exo-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 707 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe garcon-4.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa_setscene)
NOTE: recipe libxres-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libwnck3-43.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxres-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfce4ui-4.18.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 724 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: recipe libxres-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 736 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 737 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfce4ui-4.18.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxres-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 747 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libxres-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfce4ui-4.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 750 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_packagedata_setscene)
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe startup-notification-0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 758 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xfconf-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 759 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-dev-tools-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe startup-notification-0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xfconf-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 771 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxfce4util-4.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfce4util-4.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 775 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 779 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1183 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb:do_patch)
NOTE: Running task 1188 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_unpack)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe thunar-4.19.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe gvfs-1.52.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe thunar-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe gvfs-1.52.0-r0: task do_unpack: Succeeded
NOTE: Running task 1218 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_patch)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gvfs-1.52.0-r0: task do_patch: Started
NOTE: recipe gvfs-1.52.0-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 821 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 823 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 827 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 831 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 836 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 839 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 842 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 869 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 873 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 874 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 875 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 877 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 878 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 879 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 880 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 883 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 884 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 886 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 888 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 890 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 894 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 896 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 897 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 902 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 906 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 907 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 912 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 915 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 917 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 921 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 924 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 926 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 927 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 929 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 930 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 931 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 932 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 935 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 936 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 941 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 945 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 948 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 953 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 955 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 958 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 961 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 963 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 968 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 969 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 971 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 973 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 975 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 982 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 984 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 985 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 986 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 989 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 997 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 999 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1000 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1004 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1005 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1007 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1009 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1010 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1012 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1017 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1018 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1026 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1032 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1035 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1038 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1040 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1043 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1045 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1047 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1050 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1053 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1055 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1066 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1067 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1068 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1071 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1073 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1074 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1075 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1076 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1078 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1080 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1081 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1082 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1083 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1085 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1086 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1087 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1091 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1092 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1095 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1098 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1099 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1101 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1102 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1103 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1106 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1107 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1108 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1109 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1110 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1114 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1115 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1116 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1117 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1118 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1119 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1120 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1121 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1124 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1125 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1126 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1128 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1129 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1130 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1132 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1133 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1136 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1138 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1140 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1142 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1145 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1147 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1150 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1152 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1158 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1160 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1161 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1163 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1168 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1169 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1171 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1173 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1175 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1176 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1177 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1178 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1180 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1182 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1183 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1184 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1185 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1186 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1187 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1188 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1195 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1197 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1199 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1201 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1202 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1205 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1207 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1208 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1210 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1212 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1213 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1214 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1216 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1221 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1224 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1226 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1228 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1230 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1231 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1233 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1234 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1236 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1238 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1239 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1240 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1241 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1242 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1244 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1252 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1253 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1255 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1258 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1260 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1261 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1263 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1271 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3378 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3389 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3421 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe thunar-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3444 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_collect_spdx_deps)
NOTE: recipe gvfs-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe thunar-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gvfs-1.52.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gvfs-1.52.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gvfs-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3445 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_configure)
NOTE: recipe gvfs-1.52.0-r0: task do_configure: Started
NOTE: recipe thunar-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe thunar-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3446 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb:do_configure)
NOTE: recipe thunar-4.19.0-r0: task do_configure: Started
NOTE: recipe gvfs-1.52.0-r0: task do_configure: Succeeded
NOTE: Running task 3447 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_compile)
NOTE: recipe gvfs-1.52.0-r0: task do_compile: Started
NOTE: recipe gvfs-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 3448 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_install)
NOTE: recipe gvfs-1.52.0-r0: task do_install: Started
NOTE: recipe gvfs-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 3449 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_package)
NOTE: recipe gvfs-1.52.0-r0: task do_package: Started
NOTE: recipe thunar-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 3450 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb:do_compile)
NOTE: recipe thunar-4.19.0-r0: task do_compile: Started
NOTE: recipe gvfs-1.52.0-r0: task do_package: Succeeded
NOTE: Running task 3451 of 3466 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_packagedata)
NOTE: recipe gvfs-1.52.0-r0: task do_packagedata: Started
NOTE: recipe gvfs-1.52.0-r0: task do_packagedata: Failed
NOTE: recipe thunar-4.19.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3451 tasks of which 3433 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104054250.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104054250.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_packagedata
Summary: There were 91 ERROR messages, returning a non-zero exit code.
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-src went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-dbg went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfsd-ftp went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfsd-sftp went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfsd-trash went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-staticdev went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-dev went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-doc went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-bash-completion went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ab went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-af went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ar went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-as went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ast went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-be went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-be+latin went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-bg went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-bn went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-bn-in went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-bs went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ca went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ca+valencia went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-cs went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-da went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-de went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-el went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-en+shaw went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-en-gb went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-eo went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-es went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-et went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-eu went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-fa went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-fi went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-fr went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-fur went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ga went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-gl went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-gu went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-he went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-hi went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-hr went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-hu went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-id went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ie went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-it went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ja went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ka went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-kk went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-kn went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ko went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ku went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-lt went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-lv went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-mai went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-mk went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ml went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-mr went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ms went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-nb went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-nds went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ne went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-nl went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-nn went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-oc went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-or went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-pa went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-pl went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-pt went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-pt-br went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ro went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ru went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-sk went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-sl went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-sq went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-sr went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-sr+latin went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-sv went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ta went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-te went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-tg went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-th went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-tr went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-ug went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-uk went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-vi went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-zh-cn went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-zh-hk went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: QA Issue: Package version for package gvfs-locale-zh-tw went backwards which would break package feeds (from 0:1.52.1-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: gvfs-1.52.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/gvfs/1.52.0/temp/log.do_packagedata.2031307
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb:do_packagedata) failed with exit code '1'

--===============1116776297019940069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/thunar/thunar-locale-ca: PKGSIZE changed from 70885 to 86630 (+22%)
packages/core2-64-poky-linux/thunar/thunar-locale-cs: PKGSIZE changed from 87665 to 99049 (+13%)
packages/core2-64-poky-linux/thunar/thunar-locale-da: PKGSIZE changed from 73375 to 94033 (+28%)
packages/core2-64-poky-linux/thunar/thunar-locale-en-gb: PKGSIZE changed from 58149 to 92919 (+60%)
packages/core2-64-poky-linux/thunar/thunar-locale-et: PKGSIZE changed from 83432 to 94219 (+13%)
packages/core2-64-poky-linux/thunar/thunar-locale-eu: PKGSIZE changed from 74951 to 82700 (+10%)
packages/core2-64-poky-linux/thunar/thunar-locale-fa-ir: PKGSIZE changed from 57242 to 63064 (+10%)
packages/core2-64-poky-linux/thunar/thunar-locale-hr: PKGSIZE changed from 64858 to 72573 (+12%)
packages/core2-64-poky-linux/thunar/thunar-locale-id: PKGSIZE changed from 75011 to 86322 (+15%)
packages/core2-64-poky-linux/thunar/thunar-locale-lt: PKGSIZE changed from 89500 to 77570 (-13%)
packages/core2-64-poky-linux/thunar/thunar-locale-pt-br: PKGSIZE changed from 88864 to 100773 (+13%)
packages/core2-64-poky-linux/thunar/thunar-locale-ro: PKGSIZE changed from 60740 to 67530 (+11%)
packages/core2-64-poky-linux/thunar/thunar-locale-ru: PKGSIZE changed from 111160 to 99165 (-11%)
packages/core2-64-poky-linux/thunar/thunar-locale-sk: PKGSIZE changed from 65269 to 73467 (+13%)
packages/core2-64-poky-linux/thunar/thunar-locale-sl: PKGSIZE changed from 81676 to 65873 (-19%)
packages/core2-64-poky-linux/thunar/thunar-locale-uk: PKGSIZE changed from 105412 to 93847 (-11%)

--===============1116776297019940069==--

