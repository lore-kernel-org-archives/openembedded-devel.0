Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A121C04A92
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4712.1699074742541115713
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Mq/mtigL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Mom72hZ2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b98bf16c0-3891fc83-1ff1-42ca-8efc-276960f9e9af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lUzjGkXZbNra4pHC+Yd8QpvxV1GgNcVIkfogK61pnUI=;
	b=Mq/mtigLTjKAE7Ua3bi+2V0gfzo421XZaiVfFYvrsQjHqUZhABGNBilctYcDoVjJ
	vuzEmy55otn18ts3OcqrtExRXBkjLsPoEK0M98SUk+j70eehjkPSOgpwFSR6nrExzip
	8VSYpCaK/UUc7AVOsj2zDblYth/ICgzrjo305Ryc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lUzjGkXZbNra4pHC+Yd8QpvxV1GgNcVIkfogK61pnUI=;
	b=Mom72hZ2i0Kld1qFtdPZsZmL5emgwao17IsEkOyJiCDRr0RsalgopTnoefyYQt4P
	czKtfEgJuERkQ837nA6XjIQhPP/VLjtusa2/saOkr88hFiUtCuKsNPBHVfdbsjoWqc/
	Sk7UrwPs/7oak0Hg2i9KWq0WhoA8sWKgHGENqEZU=
Content-Type: multipart/mixed; boundary="===============1809471728562423680=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libwacom: upgrading to 2.8.0 SUCCEEDED
Message-ID: <0101018b98bf16c0-3891fc83-1ff1-42ca-8efc-276960f9e9af-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106285

--===============1809471728562423680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwacom* to *2.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwacom-upgrade-2.6.0-2.8.0.patch
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
From 8d506f9a534986c982a8babb2aa34529f0018876 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:49:38 +0000
Subject: [PATCH] libwacom: upgrade 2.6.0 -> 2.8.0

---
 .../libwacom/{libwacom_2.6.0.bb => libwacom_2.8.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libwacom/{libwacom_2.6.0.bb => libwacom_2.8.0.bb} (93%)

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.6.0.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
similarity index 93%
rename from meta-gnome/recipes-support/libwacom/libwacom_2.6.0.bb
rename to meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
index d96026241..8f45221ad 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.6.0.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
 
 SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https"
-SRCREV = "cb36c462763a321454d5c08fe974a3d7dec4ed1a"
+SRCREV = "f5b92814320d0a5745b50b7b36103843ad23e299"
 
 DEPENDS = " \
     libxml2-native \
-- 
2.39.2


--===============1809471728562423680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libwacom: PKGV changed from 2.6.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/libwacom: PV changed from "2.6.0" to "2.8.0"
packages/core2-64-poky-linux/libwacom/libwacom-dbg: PKGV changed from 2.6.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/libwacom/libwacom-dbg: PV changed from "2.6.0" to "2.8.0"
packages/core2-64-poky-linux/libwacom/libwacom-dbg: PKGSIZE changed from 169608 to 170632 (+1%)
packages/core2-64-poky-linux/libwacom/libwacom-dev: PKGV changed from 2.6.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/libwacom/libwacom-dev: PV changed from "2.6.0" to "2.8.0"
packages/core2-64-poky-linux/libwacom/libwacom-doc: PKGV changed from 2.6.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/libwacom/libwacom-doc: PV changed from "2.6.0" to "2.8.0"
packages/core2-64-poky-linux/libwacom/libwacom-locale: PKGV changed from 2.6.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/libwacom/libwacom-locale: PV changed from "2.6.0" to "2.8.0"
packages/core2-64-poky-linux/libwacom/libwacom-src: PKGV changed from 2.6.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/libwacom/libwacom-src: PV changed from "2.6.0" to "2.8.0"
packages/core2-64-poky-linux/libwacom/libwacom-src: PKGSIZE changed from 115462 to 115993 (+0%)
packages/core2-64-poky-linux/libwacom/libwacom-staticdev: PKGV changed from 2.6.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/libwacom/libwacom-staticdev: PV changed from "2.6.0" to "2.8.0"
packages/core2-64-poky-linux/libwacom/libwacom: PKGV changed from 2.6.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/libwacom/libwacom: PV changed from "2.6.0" to "2.8.0"
packages/core2-64-poky-linux/libwacom/libwacom: PKGSIZE changed from 690910 to 710188 (+3%)
packages/core2-64-poky-linux/libwacom/libwacom: FILELIST: added "/usr/share/libwacom/wacom-one-pen-m.tablet /usr/share/libwacom/wacom-one-pen-s.tablet /usr/share/libwacom/layouts/xp-pen-deco-pro-s-m-sw-mw.svg /usr/share/libwacom/elan-2d55.tablet /usr/share/libwacom/elan-22f7.tablet /usr/share/libwacom/isdv4-52d3.tablet /usr/share/libwacom/isdv4-52d5.tablet /usr/share/libwacom/elan-2c1b.tablet /usr/share/libwacom/layouts/xp-pen-deco-mw.svg /usr/share/libwacom/wacom-one-12.tablet /usr/share/libwacom/wacom-one-13.tablet /usr/share/libwacom/isdv4-2d1f-0040.tablet /usr/share/libwacom/xp-pen-deco-mw.tablet /usr/share/libwacom/xp-pen-deco-pro-sw.tablet /usr/share/libwacom/xp-pen-deco-mini7.tablet /usr/share/libwacom/xp-pen-deco-pro-mw.tablet /usr/share/libwacom/isdv4-121a.tablet"
Changes to packages/core2-64-poky-linux/libwacom (sysroot):
  /usr/share/libwacom/elan-22f7.tablet was added
  /usr/share/libwacom/elan-2c1b.tablet was added
  /usr/share/libwacom/elan-2d55.tablet was added
  /usr/share/libwacom/isdv4-121a.tablet was added
  /usr/share/libwacom/isdv4-2d1f-0040.tablet was added
  /usr/share/libwacom/isdv4-52d3.tablet was added
  /usr/share/libwacom/isdv4-52d5.tablet was added
  /usr/share/libwacom/layouts/xp-pen-deco-mw.svg was added
  /usr/share/libwacom/layouts/xp-pen-deco-pro-s-m-sw-mw.svg was added
  /usr/share/libwacom/wacom-one-12.tablet was added
  /usr/share/libwacom/wacom-one-13.tablet was added
  /usr/share/libwacom/wacom-one-pen-m.tablet was added
  /usr/share/libwacom/wacom-one-pen-s.tablet was added
  /usr/share/libwacom/xp-pen-deco-mini7.tablet was added
  /usr/share/libwacom/xp-pen-deco-mw.tablet was added
  /usr/share/libwacom/xp-pen-deco-pro-mw.tablet was added
  /usr/share/libwacom/xp-pen-deco-pro-sw.tablet was added

--===============1809471728562423680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libwacom/libwacom: FILELIST: added "/usr/share/libwacom/elan-22f7.tablet /usr/share/libwacom/elan-2c1b.tablet /usr/share/libwacom/elan-2d55.tablet /usr/share/libwacom/layouts/xp-pen-deco-mw.svg /usr/share/libwacom/wacom-one-pen-m.tablet /usr/share/libwacom/wacom-one-pen-s.tablet /usr/share/libwacom/layouts/xp-pen-deco-pro-s-m-sw-mw.svg /usr/share/libwacom/xp-pen-deco-mini7.tablet /usr/share/libwacom/xp-pen-deco-pro-mw.tablet /usr/share/libwacom/xp-pen-deco-pro-sw.tablet /usr/share/libwacom/isdv4-52d5.tablet /usr/share/libwacom/isdv4-52d3.tablet /usr/share/libwacom/isdv4-2d1f-0040.tablet /usr/share/libwacom/wacom-one-12.tablet /usr/share/libwacom/isdv4-121a.tablet /usr/share/libwacom/wacom-one-13.tablet /usr/share/libwacom/xp-pen-deco-mw.tablet"
Changes to packages/core2-64-poky-linux/libwacom (sysroot):
  /usr/share/libwacom/elan-22f7.tablet was added
  /usr/share/libwacom/elan-2c1b.tablet was added
  /usr/share/libwacom/elan-2d55.tablet was added
  /usr/share/libwacom/isdv4-121a.tablet was added
  /usr/share/libwacom/isdv4-2d1f-0040.tablet was added
  /usr/share/libwacom/isdv4-52d3.tablet was added
  /usr/share/libwacom/isdv4-52d5.tablet was added
  /usr/share/libwacom/layouts/xp-pen-deco-mw.svg was added
  /usr/share/libwacom/layouts/xp-pen-deco-pro-s-m-sw-mw.svg was added
  /usr/share/libwacom/wacom-one-12.tablet was added
  /usr/share/libwacom/wacom-one-13.tablet was added
  /usr/share/libwacom/wacom-one-pen-m.tablet was added
  /usr/share/libwacom/wacom-one-pen-s.tablet was added
  /usr/share/libwacom/xp-pen-deco-mini7.tablet was added
  /usr/share/libwacom/xp-pen-deco-mw.tablet was added
  /usr/share/libwacom/xp-pen-deco-pro-mw.tablet was added
  /usr/share/libwacom/xp-pen-deco-pro-sw.tablet was added

--===============1809471728562423680==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libwacom-upgrade-2.6.0-2.8.0.patch"

RnJvbSA4ZDUwNmY5YTUzNDk4NmM5ODJhOGJhYmIyYWEzNDUyOWYwMDE4ODc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDo0OTozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YndhY29tOiB1cGdyYWRlIDIuNi4wIC0+IDIuOC4wCgotLS0KIC4uLi9saWJ3YWNvbS97bGlid2Fj
b21fMi42LjAuYmIgPT4gbGlid2Fjb21fMi44LjAuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtZ25v
bWUvcmVjaXBlcy1zdXBwb3J0L2xpYndhY29tL3tsaWJ3YWNvbV8yLjYuMC5iYiA9PiBsaWJ3YWNv
bV8yLjguMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhLWdub21lL3JlY2lwZXMtc3VwcG9y
dC9saWJ3YWNvbS9saWJ3YWNvbV8yLjYuMC5iYiBiL21ldGEtZ25vbWUvcmVjaXBlcy1zdXBwb3J0
L2xpYndhY29tL2xpYndhY29tXzIuOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBm
cm9tIG1ldGEtZ25vbWUvcmVjaXBlcy1zdXBwb3J0L2xpYndhY29tL2xpYndhY29tXzIuNi4wLmJi
CnJlbmFtZSB0byBtZXRhLWdub21lL3JlY2lwZXMtc3VwcG9ydC9saWJ3YWNvbS9saWJ3YWNvbV8y
LjguMC5iYgppbmRleCBkOTYwMjYyNDEuLjhmNDUyMjFhZCAxMDA2NDQKLS0tIGEvbWV0YS1nbm9t
ZS9yZWNpcGVzLXN1cHBvcnQvbGlid2Fjb20vbGlid2Fjb21fMi42LjAuYmIKKysrIGIvbWV0YS1n
bm9tZS9yZWNpcGVzLXN1cHBvcnQvbGlid2Fjb20vbGlid2Fjb21fMi44LjAuYmIKQEAgLTgsNyAr
OCw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlO
RzttZDU9NDBhMjFmZmZiMzY3YzgyZjM5ZmQ5MWEzYjEzN2MzNmUiCiAKIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0aHViLmNvbS9saW51eHdhY29tL2xpYndhY29tLmdpdDticmFuY2g9bWFzdGVyO3Byb3Rv
Y29sPWh0dHBzIgotU1JDUkVWID0gImNiMzZjNDYyNzYzYTMyMTQ1NGQ1YzA4ZmU5NzRhM2Q3ZGVj
NGVkMWEiCitTUkNSRVYgPSAiZjViOTI4MTQzMjBkMGE1NzQ1YjUwYjdiMzYxMDM4NDNhZDIzZTI5
OSIKIAogREVQRU5EUyA9ICIgXAogICAgIGxpYnhtbDItbmF0aXZlIFwKLS0gCjIuMzkuMgoK

--===============1809471728562423680==--

