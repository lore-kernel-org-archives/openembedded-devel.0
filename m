Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C96C0018C
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.5392.1699083060095099105
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eqKKbIzi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=po2JHDCw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b993e0010-f4761dd7-748e-46b7-9532-0249280bedfb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zNfsMrCE6xpJvvgvOQi4X0ndGR8bZ+xFB2rrPr/ZnAM=;
	b=eqKKbIzi40fNl3TfFBRPBTr1hmz1M+LHT5EQXZ58aQkKHkIX5gwKIdIjMounStrY
	/n+gCImoBuI8mzryfpZJLJuLZ5+9jfctz9EOwcojVqI4cXPxsD2gjfAiw+sfFcREXd6
	ZLP7Z/TMcKzNYI2vxb2RP5pqBTw8KW/aemIm8Mdw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zNfsMrCE6xpJvvgvOQi4X0ndGR8bZ+xFB2rrPr/ZnAM=;
	b=po2JHDCw+vwPwXHt55z5EdYn+CcqxBdgMmH24XX2Oglfzb12Bn1SYxeUN34UPZwu
	dD6R5FEkz6TsO5cdyFRY5Q+trPKNU0CaTw9ESGcFMMd0aPU8tzMdWi1Y3Nsra+ocTJM
	eGOcejHwUwZA2d6S4CUoM5uw79bBP7wN5Pk2y2C4=
Content-Type: multipart/mixed; boundary="===============6613551155577859309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] parole: upgrading to 4.18.0 SUCCEEDED
Message-ID: <0101018b993e0010-f4761dd7-748e-46b7-9532-0249280bedfb-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106304

--===============6613551155577859309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *parole* to *4.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-parole-upgrade-4.16.0-4.18.0.patch
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
From c9ce4478d6e93d52ac788bde79986c995d421b8c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:40:13 +0000
Subject: [PATCH] parole: upgrade 4.16.0 -> 4.18.0

---
 .../parole/{parole_4.16.0.bb => parole_4.18.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-multimedia/parole/{parole_4.16.0.bb => parole_4.18.0.bb} (90%)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb b/meta-xfce/recipes-multimedia/parole/parole_4.18.0.bb
similarity index 90%
rename from meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb
rename to meta-xfce/recipes-multimedia/parole/parole_4.18.0.bb
index 04aabe0c7..e2c7a012c 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_4.18.0.bb
@@ -16,7 +16,7 @@ DEPENDS += " \
     taglib \
 "
 
-SRC_URI[sha256sum] = "0d305ad8ccd3974d6b632f74325b1b8a39304c905c6b405b70f52c4cfd55a7e7"
+SRC_URI[sha256sum] = "bbe52fbc4d3abe30f6c79fc7ac57bd9de9cf74ce1a79b508a1d7de83dc4f3771"
 
 RDEPENDS:${PN} += "gstreamer1.0-plugins-good"
 
-- 
2.39.2


--===============6613551155577859309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-parole-upgrade-4.16.0-4.18.0.patch"

RnJvbSBjOWNlNDQ3OGQ2ZTkzZDUyYWM3ODhiZGU3OTk4NmM5OTVkNDIxYjhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNTo0MDoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
cm9sZTogdXBncmFkZSA0LjE2LjAgLT4gNC4xOC4wCgotLS0KIC4uLi9wYXJvbGUve3Bhcm9sZV80
LjE2LjAuYmIgPT4gcGFyb2xlXzQuMTguMC5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEteGZj
ZS9yZWNpcGVzLW11bHRpbWVkaWEvcGFyb2xlL3twYXJvbGVfNC4xNi4wLmJiID0+IHBhcm9sZV80
LjE4LjAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMtbXVsdGltZWRp
YS9wYXJvbGUvcGFyb2xlXzQuMTYuMC5iYiBiL21ldGEteGZjZS9yZWNpcGVzLW11bHRpbWVkaWEv
cGFyb2xlL3Bhcm9sZV80LjE4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20g
bWV0YS14ZmNlL3JlY2lwZXMtbXVsdGltZWRpYS9wYXJvbGUvcGFyb2xlXzQuMTYuMC5iYgpyZW5h
bWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMtbXVsdGltZWRpYS9wYXJvbGUvcGFyb2xlXzQuMTguMC5i
YgppbmRleCAwNGFhYmUwYzcuLmUyYzdhMDEyYyAxMDA2NDQKLS0tIGEvbWV0YS14ZmNlL3JlY2lw
ZXMtbXVsdGltZWRpYS9wYXJvbGUvcGFyb2xlXzQuMTYuMC5iYgorKysgYi9tZXRhLXhmY2UvcmVj
aXBlcy1tdWx0aW1lZGlhL3Bhcm9sZS9wYXJvbGVfNC4xOC4wLmJiCkBAIC0xNiw3ICsxNiw3IEBA
IERFUEVORFMgKz0gIiBcCiAgICAgdGFnbGliIFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjBkMzA1YWQ4Y2NkMzk3NGQ2YjYzMmY3NDMyNWIxYjhhMzkzMDRjOTA1YzZiNDA1YjcwZjUyYzRj
ZmQ1NWE3ZTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmJlNTJmYmM0ZDNhYmUzMGY2Yzc5ZmM3
YWM1N2JkOWRlOWNmNzRjZTFhNzliNTA4YTFkN2RlODNkYzRmMzc3MSIKIAogUkRFUEVORFM6JHtQ
Tn0gKz0gImdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2QiCiAKLS0gCjIuMzkuMgoK

--===============6613551155577859309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/parole: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole: SRC_URI changed from "http://archive.xfce.org/src/apps/parole/4.16/parole-4.16.0.tar.bz2" to "http://archive.xfce.org/src/apps/parole/4.18/parole-4.18.0.tar.bz2"
packages/core2-64-poky-linux/parole/parole-dbg: PKGSIZE changed from 1418544 to 1421128 (+0%)
packages/core2-64-poky-linux/parole/parole-dbg: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-dbg: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-dev: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-dev: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-doc: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-doc: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-ar: PKGSIZE changed from 17999 to 17105 (-5%)
packages/core2-64-poky-linux/parole/parole-locale-ar: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-ar: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-ast: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-ast: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-be: PKGSIZE changed from 30454 to 30969 (+2%)
packages/core2-64-poky-linux/parole/parole-locale-be: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-be: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-bg: PKGSIZE changed from 30098 to 31742 (+5%)
packages/core2-64-poky-linux/parole/parole-locale-bg: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-bg: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-ca: PKGSIZE changed from 24697 to 24699 (+0%)
packages/core2-64-poky-linux/parole/parole-locale-ca: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-ca: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-cs: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-cs: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-da: PKGSIZE changed from 22701 to 23530 (+4%)
packages/core2-64-poky-linux/parole/parole-locale-da: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-da: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-de: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-de: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-el: PKGSIZE changed from 24339 to 32391 (+33%)
packages/core2-64-poky-linux/parole/parole-locale-el: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-el: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-en-au: PKGSIZE changed from 21272 to 20567 (-3%)
packages/core2-64-poky-linux/parole/parole-locale-en-au: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-en-au: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-en-gb: PKGSIZE changed from 21786 to 21031 (-3%)
packages/core2-64-poky-linux/parole/parole-locale-en-gb: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-en-gb: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-es: PKGSIZE changed from 25289 to 25307 (+0%)
packages/core2-64-poky-linux/parole/parole-locale-es: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-es: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-et: PKGSIZE changed from 23174 to 24166 (+4%)
packages/core2-64-poky-linux/parole/parole-locale-et: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-et: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-eu: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-eu: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-fi: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-fi: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-fr: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-fr: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-gl: PKGSIZE changed from 23586 to 24782 (+5%)
packages/core2-64-poky-linux/parole/parole-locale-gl: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-gl: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-he: PKGSIZE changed from 26336 to 26351 (+0%)
packages/core2-64-poky-linux/parole/parole-locale-he: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-he: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-hr: PKGSIZE changed from 23070 to 22459 (-3%)
packages/core2-64-poky-linux/parole/parole-locale-hr: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-hr: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-hu: PKGSIZE changed from 23737 to 22999 (-3%)
packages/core2-64-poky-linux/parole/parole-locale-hu: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-hu: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-hy-am: PKGSIZE changed from 29352 to 28450 (-3%)
packages/core2-64-poky-linux/parole/parole-locale-hy-am: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-hy-am: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-hye: PKGSIZE changed from 29346 to 28432 (-3%)
packages/core2-64-poky-linux/parole/parole-locale-hye: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-hye: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-id: PKGSIZE changed from 22624 to 23478 (+4%)
packages/core2-64-poky-linux/parole/parole-locale-id: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-id: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-ie: PKGSIZE changed from 18836 to 18108 (-4%)
packages/core2-64-poky-linux/parole/parole-locale-ie: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-ie: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-is: PKGSIZE changed from 22830 to 22054 (-3%)
packages/core2-64-poky-linux/parole/parole-locale-is: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-is: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-it: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-it: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-ja: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-ja: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-kk: PKGSIZE changed from 16952 to 18199 (+7%)
packages/core2-64-poky-linux/parole/parole-locale-kk: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-kk: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-ko: PKGSIZE changed from 24014 to 25114 (+5%)
packages/core2-64-poky-linux/parole/parole-locale-ko: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-ko: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-lt: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-lt: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-lv: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-lv: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-ms: PKGSIZE changed from 22391 to 23285 (+4%)
packages/core2-64-poky-linux/parole/parole-locale-ms: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-ms: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-nb: PKGSIZE changed from 23346 to 23335 (-0%)
packages/core2-64-poky-linux/parole/parole-locale-nb: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-nb: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-nl: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-nl: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-nn: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-nn: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-oc: PKGSIZE changed from 15472 to 15073 (-3%)
packages/core2-64-poky-linux/parole/parole-locale-oc: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-oc: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-pl: PKGSIZE changed from 24153 to 25103 (+4%)
packages/core2-64-poky-linux/parole/parole-locale-pl: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-pl: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-pt-br: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-pt-br: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-pt: PKGSIZE changed from 24336 to 24341 (+0%)
packages/core2-64-poky-linux/parole/parole-locale-pt: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-pt: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-ru: PKGSIZE changed from 29808 to 31938 (+7%)
packages/core2-64-poky-linux/parole/parole-locale-ru: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-ru: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-sk: PKGSIZE changed from 22118 to 22025 (-0%)
packages/core2-64-poky-linux/parole/parole-locale-sk: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-sk: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-sl: PKGSIZE changed from 22784 to 23647 (+4%)
packages/core2-64-poky-linux/parole/parole-locale-sl: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-sl: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-sq: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-sq: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-sr: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-sr: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-sv: PKGSIZE changed from 22273 to 23427 (+5%)
packages/core2-64-poky-linux/parole/parole-locale-sv: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-sv: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-te: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-te: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-th: PKGSIZE changed from 32877 to 34350 (+4%)
packages/core2-64-poky-linux/parole/parole-locale-th: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-th: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-tr: PKGSIZE changed from 23709 to 23702 (-0%)
packages/core2-64-poky-linux/parole/parole-locale-tr: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-tr: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-ug: PKGSIZE changed from 12501 to 11865 (-5%)
packages/core2-64-poky-linux/parole/parole-locale-ug: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-ug: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-uk: PKGSIZE changed from 28786 to 30547 (+6%)
packages/core2-64-poky-linux/parole/parole-locale-uk: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-uk: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-zh-cn: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-zh-cn: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-locale-zh-tw: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-locale-zh-tw: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-src: PKGSIZE changed from 922062 to 922749 (+0%)
packages/core2-64-poky-linux/parole/parole-src: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-src: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole-staticdev: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole-staticdev: PKGV changed from 4.16.0 [default] to 4.18.0 [default]
packages/core2-64-poky-linux/parole/parole: PKGSIZE changed from 850609 to 867361 (+2%)
packages/core2-64-poky-linux/parole/parole: PV changed from "4.16.0" to "4.18.0"
packages/core2-64-poky-linux/parole/parole: PKGV changed from 4.16.0 [default] to 4.18.0 [default]

--===============6613551155577859309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/parole/parole-locale-el: PKGSIZE changed from 24339 to 32391 (+33%)

--===============6613551155577859309==--

