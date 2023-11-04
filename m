Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA39C001B2
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.5514.1699083060114412560
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KWAL0Ctj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hQ0q6+ex;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b993dffae-2833d150-6718-4539-8519-861521acb341-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=50XMXP9J2JR1GxLxRQk6krKAiji3Xp20NzWj2jNFepg=;
	b=KWAL0Ctj1YaZcdNqxtnqwd/dqdDMhLkYm4TmNnEohvwlc0mzGPc1if2l+obPsraR
	FFbCPUA0OTZvg+nsxwB689qwox6PtAP0m2Fa2gnv50nYjaB7eE86t1JjKxZD0pU+sG7
	erh+GzJFOlpfkJpcafwKE8zW3T2SpVlP0oyfrbg4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=50XMXP9J2JR1GxLxRQk6krKAiji3Xp20NzWj2jNFepg=;
	b=hQ0q6+exXqom/b9Dmx0Ot7jgO3eJZG1Zf+LD3PYpABqblS4U5P2osrGgjqwZJvMD
	XypTdltuEwv9cWUPdQjf+57Os5sgukLl7O+2e4/+Klt+tg8hygQk6TZzlj040XS3mIs
	MWDhKG0dFdtpHIpuDQUjsUFtS2YbLC8HzmoP3fcI=
Content-Type: multipart/mixed; boundary="===============8798499552729539859=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] menulibre: upgrading to 2.3.2 SUCCEEDED
Message-ID: <0101018b993dffae-2833d150-6718-4539-8519-861521acb341-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106305

--===============8798499552729539859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *menulibre* to *2.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-menulibre-upgrade-2.2.3-2.3.2.patch
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
From a5ca988ce3d6e3eb07f11fb0947c5653c3cf4d4e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:29:58 +0000
Subject: [PATCH] menulibre: upgrade 2.2.3 -> 2.3.2

---
 .../menulibre/{menulibre_2.2.3.bb => menulibre_2.3.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/menulibre/{menulibre_2.2.3.bb => menulibre_2.3.2.bb} (94%)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.3.2.bb
similarity index 94%
rename from meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
rename to meta-xfce/recipes-apps/menulibre/menulibre_2.3.2.bb
index 609caf346..7491b509c 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.3.2.bb
@@ -13,7 +13,7 @@ inherit setuptools3_legacy gtk-icon-cache features_check
 REQUIRED_DISTRO_FEATURES = "x11 gobject-introspection-data"
 
 SRC_URI = "git://github.com/bluesabre/menulibre.git;protocol=https;branch=master"
-SRCREV = "86ee9ad7568128fe9555e54799933b2d3762331a"
+SRCREV = "94bef4060714fa65c7246c25b87410b52a149f94"
 S = "${WORKDIR}/git"
 
 do_compile[noexec] = "1"
-- 
2.39.2


--===============8798499552729539859==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-menulibre-upgrade-2.2.3-2.3.2.patch"

RnJvbSBhNWNhOTg4Y2UzZDZlM2ViMDdmMTFmYjA5NDdjNTY1M2MzY2Y0ZDRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNToyOTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
bnVsaWJyZTogdXBncmFkZSAyLjIuMyAtPiAyLjMuMgoKLS0tCiAuLi4vbWVudWxpYnJlL3ttZW51
bGlicmVfMi4yLjMuYmIgPT4gbWVudWxpYnJlXzIuMy4yLmJifSAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLXhm
Y2UvcmVjaXBlcy1hcHBzL21lbnVsaWJyZS97bWVudWxpYnJlXzIuMi4zLmJiID0+IG1lbnVsaWJy
ZV8yLjMuMi5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhLXhmY2UvcmVjaXBlcy1hcHBzL21l
bnVsaWJyZS9tZW51bGlicmVfMi4yLjMuYmIgYi9tZXRhLXhmY2UvcmVjaXBlcy1hcHBzL21lbnVs
aWJyZS9tZW51bGlicmVfMi4zLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20g
bWV0YS14ZmNlL3JlY2lwZXMtYXBwcy9tZW51bGlicmUvbWVudWxpYnJlXzIuMi4zLmJiCnJlbmFt
ZSB0byBtZXRhLXhmY2UvcmVjaXBlcy1hcHBzL21lbnVsaWJyZS9tZW51bGlicmVfMi4zLjIuYmIK
aW5kZXggNjA5Y2FmMzQ2Li43NDkxYjUwOWMgMTAwNjQ0Ci0tLSBhL21ldGEteGZjZS9yZWNpcGVz
LWFwcHMvbWVudWxpYnJlL21lbnVsaWJyZV8yLjIuMy5iYgorKysgYi9tZXRhLXhmY2UvcmVjaXBl
cy1hcHBzL21lbnVsaWJyZS9tZW51bGlicmVfMi4zLjIuYmIKQEAgLTEzLDcgKzEzLDcgQEAgaW5o
ZXJpdCBzZXR1cHRvb2xzM19sZWdhY3kgZ3RrLWljb24tY2FjaGUgZmVhdHVyZXNfY2hlY2sKIFJF
UVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJ4MTEgZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ibHVlc2FicmUvbWVudWxpYnJlLmdpdDtw
cm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgotU1JDUkVWID0gIjg2ZWU5YWQ3NTY4MTI4ZmU5
NTU1ZTU0Nzk5OTMzYjJkMzc2MjMzMWEiCitTUkNSRVYgPSAiOTRiZWY0MDYwNzE0ZmE2NWM3MjQ2
YzI1Yjg3NDEwYjUyYTE0OWY5NCIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGRvX2NvbXBpbGVb
bm9leGVjXSA9ICIxIgotLSAKMi4zOS4yCgo=

--===============8798499552729539859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/menulibre: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-dbg: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-dbg: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-dev: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-dev: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-doc: PKGSIZE changed from 13894 to 17638 (+27%)
packages/core2-64-poky-linux/menulibre/menulibre-doc: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-doc: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-ar: PKGSIZE changed from 18849 to 18846 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-ar: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-ar: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-br: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-br: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-ca: PKGSIZE changed from 18969 to 20107 (+6%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-ca: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-ca: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-cs: PKGSIZE changed from 12595 to 12592 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-cs: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-cs: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-da: PKGSIZE changed from 15860 to 15857 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-da: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-da: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-de: PKGSIZE changed from 17322 to 17319 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-de: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-de: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-el: PKGSIZE changed from 17229 to 17226 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-el: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-el: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-en-au: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-en-au: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-en-gb: PKGSIZE changed from 14807 to 14801 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-en-gb: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-en-gb: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-eo: PKGSIZE changed from 3251 to 3248 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-eo: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-eo: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-es: PKGSIZE changed from 19102 to 20309 (+6%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-es: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-es: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-eu: PKGSIZE changed from 8032 to 8029 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-eu: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-eu: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-fi: PKGSIZE changed from 14963 to 19561 (+31%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-fi: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-fi: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-fr: PKGSIZE changed from 16248 to 19527 (+20%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-fr: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-fr: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-fy: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-fy: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-gl: PKGSIZE changed from 15138 to 15135 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-gl: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-gl: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-he: PKGSIZE changed from 8080 to 8077 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-he: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-he: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-hr: PKGSIZE changed from 8374 to 8371 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-hr: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-hr: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-is: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-is: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-it: PKGSIZE changed from 12588 to 19890 (+58%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-it: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-it: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-ja: PKGSIZE changed from 17122 to 17119 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-ja: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-ja: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-kk: PKGSIZE changed from 9257 to 9254 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-kk: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-kk: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-ko: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-ko: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-lt: PKGSIZE changed from 18907 to 26901 (+42%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-lt: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-lt: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-ml: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-ml: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-ms+arab: PKGSIZE changed from 22279 to 31265 (+40%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-ms+arab: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-ms+arab: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-ms: PKGSIZE changed from 18493 to 25988 (+41%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-ms: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-ms: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-nb: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-nb: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-nl: PKGSIZE changed from 18610 to 26162 (+41%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-nl: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-nl: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-pl: PKGSIZE changed from 16867 to 26370 (+56%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-pl: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-pl: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-pt-br: PKGSIZE changed from 6451 to 9997 (+55%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-pt-br: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-pt-br: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-pt-pt: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-pt-pt: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-pt: PKGSIZE changed from 12914 to 12911 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-pt: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-pt: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-ru: PKGSIZE changed from 20065 to 25895 (+29%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-ru: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-ru: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-si: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-si: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-sk: PKGSIZE changed from 12969 to 12966 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-sk: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-sk: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-sl: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-sl: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-sr: PKGSIZE changed from 19420 to 19417 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-sr: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-sr: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-sv: PKGSIZE changed from 12840 to 26542 (+107%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-sv: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-sv: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-tr: PKGSIZE changed from 15466 to 19805 (+28%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-tr: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-tr: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-uk: PKGSIZE changed from 19172 to 19169 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-uk: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-uk: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-zh-cn: PKGSIZE changed from 15760 to 15757 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-zh-cn: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-zh-cn: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-zh-hk: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-zh-hk: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-locale-zh-tw: PKGSIZE changed from 6576 to 6573 (-0%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-zh-tw: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-locale-zh-tw: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-src: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-src: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre-staticdev: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre-staticdev: PV changed from "2.2.3" to "2.3.2"
packages/core2-64-poky-linux/menulibre/menulibre: PKGSIZE changed from 1211152 to 1374213 (+13%)
packages/core2-64-poky-linux/menulibre/menulibre: FILELIST: directory renamed /usr/lib/python3.11/site-packages/menulibre-2.2.3-py3.11.egg-info -> /usr/lib/python3.11/site-packages/menulibre-2.3.2-py3.11.egg-info, removed "/usr/share/menulibre/ui/MenulibreWindow.ui /usr/lib/python3.11/site-packages/menulibre/MenulibreIconSelection.py /usr/share/menulibre/metainfo/menulibre.appdata.xml.in /usr/lib/python3.11/site-packages/menulibre/MenulibreLog.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/MenulibreIconSelection.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/MenulibreLog.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/menulibre/ApplicationEditor.py /usr/lib/python3.11/site-packages/menulibre/SwitchEntry.py /usr/lib/python3.11/site-packages/menulibre/Section.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/ParsingErrorsDialog.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/FilenameLabel.py /usr/lib/python3.11/site-p
 ackages/menulibre/PathEntry.py /usr/lib/python3.11/site-packages/menulibre/TextEntry.py /usr/lib/python3.11/site-packages/menulibre/IconEntry.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/Toolbar.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/StartupWmClassEntry.py /usr/lib/python3.11/site-packages/menulibre/CommandEditor.py /usr/lib/python3.11/site-packages/menulibre/AdvancedPage.py /usr/lib/python3.11/site-packages/__pycache__/uninstall.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/IconEntry.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/StartupWmClassEntry.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/ApplicationEditor.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/CategoryEditor.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/Toolbar.py /usr/lib/python3.11/site-packages/uninstall.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/Sec
 tion.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/TextEntryButton.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/ActionEditor.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/CategoryEditor.py /usr/lib/python3.11/site-packages/menulibre/Headerbar.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/PathEntry.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/LabelWithHidingButton.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/FilenameLabel.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/FileHandler.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/FieldLabel.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/ActionEditor.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/Headerbar.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/TextEntryButton.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/AdvancedPage.cpytho
 n-311.pyc /usr/lib/python3.11/site-packages/menulibre/LabelWithHidingButton.py /usr/lib/python3.11/site-packages/menulibre/FieldLabel.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/SwitchEntry.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/ParsingErrorsDialog.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/TextEntry.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/FileHandler.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/CommandEditor.cpython-311.pyc"
packages/core2-64-poky-linux/menulibre/menulibre: PKGV changed from 2.2.3 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/menulibre/menulibre: PV changed from "2.2.3" to "2.3.2"
Changes to packages/core2-64-poky-linux/menulibre (sysroot):
  /usr/lib/python3.11/site-packages/menulibre-2.2.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/menulibre-2.3.2-py3.11.egg-info
  /usr/lib/python3.11/site-packages/menulibre/ActionEditor.py was added
  /usr/lib/python3.11/site-packages/menulibre/AdvancedPage.py was added
  /usr/lib/python3.11/site-packages/menulibre/ApplicationEditor.py was added
  /usr/lib/python3.11/site-packages/menulibre/CategoryEditor.py was added
  /usr/lib/python3.11/site-packages/menulibre/CommandEditor.py was added
  /usr/lib/python3.11/site-packages/menulibre/FieldLabel.py was added
  /usr/lib/python3.11/site-packages/menulibre/FileHandler.py was added
  /usr/lib/python3.11/site-packages/menulibre/FilenameLabel.py was added
  /usr/lib/python3.11/site-packages/menulibre/Headerbar.py was added
  /usr/lib/python3.11/site-packages/menulibre/IconEntry.py was added
  /usr/lib/python3.11/site-packages/menulibre/LabelWithHidingButton.py was added
  /usr/lib/python3.11/site-packages/menulibre/ParsingErrorsDialog.py was added
  /usr/lib/python3.11/site-packages/menulibre/PathEntry.py was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/ActionEditor.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/AdvancedPage.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/ApplicationEditor.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/CategoryEditor.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/CommandEditor.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/FieldLabel.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/FileHandler.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/FilenameLabel.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/Headerbar.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/IconEntry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/LabelWithHidingButton.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/ParsingErrorsDialog.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/PathEntry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/Section.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/StartupWmClassEntry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/SwitchEntry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/TextEntryButton.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/TextEntry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/Toolbar.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/Section.py was added
  /usr/lib/python3.11/site-packages/menulibre/StartupWmClassEntry.py was added
  /usr/lib/python3.11/site-packages/menulibre/SwitchEntry.py was added
  /usr/lib/python3.11/site-packages/menulibre/TextEntryButton.py was added
  /usr/lib/python3.11/site-packages/menulibre/TextEntry.py was added
  /usr/lib/python3.11/site-packages/menulibre/Toolbar.py was added
  /usr/lib/python3.11/site-packages/__pycache__ was added
  /usr/lib/python3.11/site-packages/__pycache__/uninstall.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/uninstall.py was added
  /usr/lib/python3.11/site-packages/menulibre/MenulibreIconSelection.py was removed
  /usr/lib/python3.11/site-packages/menulibre/MenulibreLog.py was removed
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/MenulibreIconSelection.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/MenulibreLog.cpython-311.pyc was removed
  /usr/share/menulibre/metainfo was removed
  /usr/share/menulibre/metainfo/menulibre.appdata.xml.in was removed
  /usr/share/menulibre/ui was removed
  /usr/share/menulibre/ui/MenulibreWindow.ui was removed

--===============8798499552729539859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/menulibre/menulibre-doc: PKGSIZE changed from 13894 to 17638 (+27%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-fi: PKGSIZE changed from 14963 to 19561 (+31%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-fr: PKGSIZE changed from 16248 to 19527 (+20%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-it: PKGSIZE changed from 12588 to 19890 (+58%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-lt: PKGSIZE changed from 18907 to 26901 (+42%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-ms+arab: PKGSIZE changed from 22279 to 31265 (+40%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-ms: PKGSIZE changed from 18493 to 25988 (+41%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-nl: PKGSIZE changed from 18610 to 26162 (+41%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-pl: PKGSIZE changed from 16867 to 26370 (+56%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-pt-br: PKGSIZE changed from 6451 to 9997 (+55%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-ru: PKGSIZE changed from 20065 to 25895 (+29%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-sv: PKGSIZE changed from 12840 to 26542 (+107%)
packages/core2-64-poky-linux/menulibre/menulibre-locale-tr: PKGSIZE changed from 15466 to 19805 (+28%)
packages/core2-64-poky-linux/menulibre/menulibre: PKGSIZE changed from 1211152 to 1374213 (+13%)
packages/core2-64-poky-linux/menulibre/menulibre: FILELIST: directory renamed /usr/lib/python3.11/site-packages/menulibre-2.2.3-py3.11.egg-info -> /usr/lib/python3.11/site-packages/menulibre-2.3.2-py3.11.egg-info, removed "/usr/lib/python3.11/site-packages/menulibre/MenulibreLog.py /usr/share/menulibre/metainfo/menulibre.appdata.xml.in /usr/share/menulibre/ui/MenulibreWindow.ui /usr/lib/python3.11/site-packages/menulibre/MenulibreIconSelection.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/MenulibreLog.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/MenulibreIconSelection.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/menulibre/__pycache__/IconEntry.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/IconEntry.py /usr/lib/python3.11/site-packages/menulibre/PathEntry.py /usr/lib/python3.11/site-packages/menulibre/TextEntry.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/Section.cpython-311.pyc /usr/lib/python3.11/site-
 packages/menulibre/__pycache__/Toolbar.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/PathEntry.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/ApplicationEditor.py /usr/lib/python3.11/site-packages/menulibre/Section.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/CommandEditor.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/ParsingErrorsDialog.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/FilenameLabel.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/ActionEditor.py /usr/lib/python3.11/site-packages/menulibre/Headerbar.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/Headerbar.cpython-311.pyc /usr/lib/python3.11/site-packages/__pycache__/uninstall.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/TextEntryButton.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/TextEntryButton.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/Toolbar.py
  /usr/lib/python3.11/site-packages/menulibre/FilenameLabel.py /usr/lib/python3.11/site-packages/menulibre/SwitchEntry.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/TextEntry.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/FieldLabel.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/LabelWithHidingButton.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/CategoryEditor.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/ApplicationEditor.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/SwitchEntry.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/ActionEditor.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/StartupWmClassEntry.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/__pycache__/FileHandler.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/CommandEditor.py /usr/lib/python3.11/site-packages/menulibre/StartupWmClassEntry.py /usr/lib/python3.
 11/site-packages/menulibre/AdvancedPage.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/FieldLabel.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/LabelWithHidingButton.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/CategoryEditor.cpython-311.pyc /usr/lib/python3.11/site-packages/menulibre/ParsingErrorsDialog.py /usr/lib/python3.11/site-packages/menulibre/__pycache__/AdvancedPage.cpython-311.pyc /usr/lib/python3.11/site-packages/uninstall.py /usr/lib/python3.11/site-packages/menulibre/FileHandler.py"
Changes to packages/core2-64-poky-linux/menulibre (sysroot):
  /usr/lib/python3.11/site-packages/menulibre-2.2.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/menulibre-2.3.2-py3.11.egg-info
  /usr/lib/python3.11/site-packages/menulibre/ActionEditor.py was added
  /usr/lib/python3.11/site-packages/menulibre/AdvancedPage.py was added
  /usr/lib/python3.11/site-packages/menulibre/ApplicationEditor.py was added
  /usr/lib/python3.11/site-packages/menulibre/CategoryEditor.py was added
  /usr/lib/python3.11/site-packages/menulibre/CommandEditor.py was added
  /usr/lib/python3.11/site-packages/menulibre/FieldLabel.py was added
  /usr/lib/python3.11/site-packages/menulibre/FileHandler.py was added
  /usr/lib/python3.11/site-packages/menulibre/FilenameLabel.py was added
  /usr/lib/python3.11/site-packages/menulibre/Headerbar.py was added
  /usr/lib/python3.11/site-packages/menulibre/IconEntry.py was added
  /usr/lib/python3.11/site-packages/menulibre/LabelWithHidingButton.py was added
  /usr/lib/python3.11/site-packages/menulibre/ParsingErrorsDialog.py was added
  /usr/lib/python3.11/site-packages/menulibre/PathEntry.py was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/ActionEditor.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/AdvancedPage.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/ApplicationEditor.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/CategoryEditor.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/CommandEditor.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/FieldLabel.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/FileHandler.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/FilenameLabel.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/Headerbar.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/IconEntry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/LabelWithHidingButton.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/ParsingErrorsDialog.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/PathEntry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/Section.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/StartupWmClassEntry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/SwitchEntry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/TextEntryButton.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/TextEntry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/Toolbar.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/menulibre/Section.py was added
  /usr/lib/python3.11/site-packages/menulibre/StartupWmClassEntry.py was added
  /usr/lib/python3.11/site-packages/menulibre/SwitchEntry.py was added
  /usr/lib/python3.11/site-packages/menulibre/TextEntryButton.py was added
  /usr/lib/python3.11/site-packages/menulibre/TextEntry.py was added
  /usr/lib/python3.11/site-packages/menulibre/Toolbar.py was added
  /usr/lib/python3.11/site-packages/__pycache__ was added
  /usr/lib/python3.11/site-packages/__pycache__/uninstall.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/uninstall.py was added
  /usr/lib/python3.11/site-packages/menulibre/MenulibreIconSelection.py was removed
  /usr/lib/python3.11/site-packages/menulibre/MenulibreLog.py was removed
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/MenulibreIconSelection.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/menulibre/__pycache__/MenulibreLog.cpython-311.pyc was removed
  /usr/share/menulibre/metainfo was removed
  /usr/share/menulibre/metainfo/menulibre.appdata.xml.in was removed
  /usr/share/menulibre/ui was removed
  /usr/share/menulibre/ui/MenulibreWindow.ui was removed

--===============8798499552729539859==--

