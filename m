Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C789C25B49
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.62989.1699041169230566323
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DsDXuNEb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HIhaZEeT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96becd15-9f17b56b-62c7-4b5e-ac63-ec925ab5ff58-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qG8+oFI7wyWQu564Z4YWVToUIXJFXYlAhWgsPqMbOhM=;
	b=DsDXuNEbl2bOytV+VXRkBAT6+meW/YbMSeFa2IwYIvWNe9mFmWHv5IzBABxI6HM0
	MaQR7PiumYs5QEeo8FpHZQcp1BEilAbkWPBg2ZTL1k7RQsGYMMxfQbo4piIr1IUKd4n
	vvlMkqGAKAFS7JUikSuaVck9EILNq0cCxb6cZiac=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qG8+oFI7wyWQu564Z4YWVToUIXJFXYlAhWgsPqMbOhM=;
	b=HIhaZEeT6fZZeddznw8CouFyQaZur99nqC5bBDAgUzGSNISoYKmQxZjqMEjODLHO
	6cS+vLjJGlz2dJ4bGMonYrqzXEbXmVYPdKZ7Xp2efWHPDAgBkL8UAfQwWC67SfSxGP6
	AYqJp+Z9IhyxDmftrG3Q7iqfo/DeJigT8hPZxp0M=
Content-Type: multipart/mixed; boundary="===============5135447873265887804=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libosinfo: upgrading to 1.11.0 SUCCEEDED
Message-ID: <0101018b96becd15-9f17b56b-62c7-4b5e-ac63-ec925ab5ff58-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105961

--===============5135447873265887804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libosinfo* to *1.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libosinfo-upgrade-1.10-1.11.0.patch
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
From d37c8b3a6cc3b5a3f99654ff4910b05bf37290c6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 14:17:17 +0000
Subject: [PATCH] libosinfo: upgrade 1.10 -> 1.11.0

---
 .../libosinfo/{libosinfo_1.10.bb => libosinfo_1.11.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libosinfo/{libosinfo_1.10.bb => libosinfo_1.11.0.bb} (95%)

diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
similarity index 95%
rename from meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
rename to meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
index d724c52ea..16e0cf8f7 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
 	file://0001-meson.build-allow-crosscompiling-gir.patch \
 "
 
-SRCREV = "f503ff7a9e13963bcf396776bce0b209a819ba9b"
+SRCREV = "ca9dd5b810dc04ea38048ae9be491654c8596ef9"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============5135447873265887804==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libosinfo-upgrade-1.10-1.11.0.patch"

RnJvbSBkMzdjOGIzYTZjYzNiNWEzZjk5NjU0ZmY0OTEwYjA1YmYzNzI5MGM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNDoxNzoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym9zaW5mbzogdXBncmFkZSAxLjEwIC0+IDEuMTEuMAoKLS0tCiAuLi4vbGlib3NpbmZvL3tsaWJv
c2luZm9fMS4xMC5iYiA9PiBsaWJvc2luZm9fMS4xMS4wLmJifSAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLW9l
L3JlY2lwZXMtc3VwcG9ydC9saWJvc2luZm8ve2xpYm9zaW5mb18xLjEwLmJiID0+IGxpYm9zaW5m
b18xLjExLjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQv
bGlib3NpbmZvL2xpYm9zaW5mb18xLjEwLmJiIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGli
b3NpbmZvL2xpYm9zaW5mb18xLjExLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlib3NpbmZvL2xpYm9zaW5mb18xLjEwLmJiCnJl
bmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJvc2luZm8vbGlib3NpbmZvXzEuMTEu
MC5iYgppbmRleCBkNzI0YzUyZWEuLjE2ZTBjZjhmNyAxMDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNp
cGVzLXN1cHBvcnQvbGlib3NpbmZvL2xpYm9zaW5mb18xLjEwLmJiCisrKyBiL21ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L2xpYm9zaW5mby9saWJvc2luZm9fMS4xMS4wLmJiCkBAIC0xMCw3ICsxMCw3
IEBAIFNSQ19VUkkgPSAiIFwKIAlmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC1hbGxvdy1jcm9zc2Nv
bXBpbGluZy1naXIucGF0Y2ggXAogIgogCi1TUkNSRVYgPSAiZjUwM2ZmN2E5ZTEzOTYzYmNmMzk2
Nzc2YmNlMGIyMDlhODE5YmE5YiIKK1NSQ1JFViA9ICJjYTlkZDViODEwZGMwNGVhMzgwNDhhZTli
ZTQ5MTY1NGM4NTk2ZWY5IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============5135447873265887804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libosinfo: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo: PACKAGES: added "libosinfo-locale-ka"
packages/core2-64-poky-linux/libosinfo/libosinfo-dbg: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-dbg: FILELIST: removed "/usr/lib/.debug/libosinfo-1.0.so.0.1010.0", added "/usr/lib/.debug/libosinfo-1.0.so.0.1011.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-dbg: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-dbg: PKGSIZE changed from 1052192 to 1028144 (-2%)
packages/core2-64-poky-linux/libosinfo/libosinfo-dev: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-dev: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-dev: PKGSIZE changed from 827082 to 827091 (+0%)
packages/core2-64-poky-linux/libosinfo/libosinfo-doc: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-doc: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-ca: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-ca: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-cs: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-cs: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-cs: PKGSIZE changed from 12971 to 15532 (+20%)
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-de: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-de: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-de: PKGSIZE changed from 12143 to 15898 (+31%)
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-es: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-es: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-eu: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-eu: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-fi: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-fi: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-fi: PKGSIZE changed from 10696 to 10726 (+0%)
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-fr: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-fr: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-fr: PKGSIZE changed from 16570 to 16635 (+0%)
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-fur: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-fur: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-fur: PKGSIZE changed from 10671 to 15937 (+49%)
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-id: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-id: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-it: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-it: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-ja: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-ja: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-ko: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-ko: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-ko: PKGSIZE changed from 15901 to 15454 (-3%)
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-pl: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-pl: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-pt-br: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-pt-br: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-pt-pt: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-pt-pt: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-ru: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-ru: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-si: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-si: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-tr: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-tr: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-uk: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-uk: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-src: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-src: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo-src: PKGSIZE changed from 806211 to 806696 (+0%)
packages/core2-64-poky-linux/libosinfo/libosinfo-staticdev: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo-staticdev: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo: PKGV changed from 1.10 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/libosinfo/libosinfo: FILELIST: removed "/usr/lib/libosinfo-1.0.so.0.1010.0", added "/usr/lib/libosinfo-1.0.so.0.1011.0"
packages/core2-64-poky-linux/libosinfo/libosinfo: PV changed from "1.10" to "1.11.0"
packages/core2-64-poky-linux/libosinfo/libosinfo: PKGSIZE changed from 446473 to 425849 (-5%)
Changes to packages/core2-64-poky-linux/libosinfo (sysroot):
  /usr/lib/libosinfo-1.0.so.0 changed symlink target from libosinfo-1.0.so.0.1010.0 to libosinfo-1.0.so.0.1011.0
  /usr/lib/libosinfo-1.0.so.0.1010.0 moved to /usr/lib/libosinfo-1.0.so.0.1011.0

--===============5135447873265887804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libosinfo: PACKAGES: added "libosinfo-locale-ka"
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-cs: PKGSIZE changed from 12971 to 15532 (+20%)
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-de: PKGSIZE changed from 12143 to 15898 (+31%)
packages/core2-64-poky-linux/libosinfo/libosinfo-locale-fur: PKGSIZE changed from 10671 to 15937 (+49%)
packages/core2-64-poky-linux/libosinfo/libosinfo: FILELIST: removed "/usr/lib/libosinfo-1.0.so.0.1010.0", added "/usr/lib/libosinfo-1.0.so.0.1011.0"
Changes to packages/core2-64-poky-linux/libosinfo (sysroot):
  /usr/lib/libosinfo-1.0.so.0 changed symlink target from libosinfo-1.0.so.0.1010.0 to libosinfo-1.0.so.0.1011.0
  /usr/lib/libosinfo-1.0.so.0.1010.0 moved to /usr/lib/libosinfo-1.0.so.0.1011.0

--===============5135447873265887804==--

