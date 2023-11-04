Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E53DC0729B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4053.1699071647515424795
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gNE9iWCK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hsna9n8d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b988fdbfe-3d09549b-714b-47bc-84f2-55e7c2e32509-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gU0vEqsVcNMDSRTBqDtoVlMMJe7uG+f9dkyqgsM75ms=;
	b=gNE9iWCKW07wenybSpjrkoPGzEU0+m7IeTubhHCo+oxvPfEvEMTOF+Z2QQhebq1O
	dnD4YNcaWsIWpN1CEovtZi/UEkTPg+BUTdY/TALgCyl2gKAotpYjhzJBHuVlZisvtOw
	RoA8fECywNEPazxs9CA7d/Iulo31L7O/3IXdl/rg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gU0vEqsVcNMDSRTBqDtoVlMMJe7uG+f9dkyqgsM75ms=;
	b=Hsna9n8dKC0qM5ftQX2SEMNY+MLAFBb30XiHZrYHS1PUZhHFIr7DrA/ViTLa6nc9
	eSIbLj1h/Etw5HV73VfT420ZNBkXaQ/l/3ORNw6e3QJoiUU4fvWzNEzUgtxWMIBThwJ
	0li0sCT7DHKHTinyCI98SQDgyfGNAA1Qswwnw5dE=
Content-Type: multipart/mixed; boundary="===============3586090048377736888=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libdc1394: upgrading to 2.2.7 SUCCEEDED
Message-ID: <0101018b988fdbfe-3d09549b-714b-47bc-84f2-55e7c2e32509-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106250

--===============3586090048377736888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdc1394* to *2.2.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdc1394-upgrade-2.2.6-2.2.7.patch
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
From c39953877b11281855403b4ba72a504f597ccdc8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:40:09 +0000
Subject: [PATCH] libdc1394: upgrade 2.2.6 -> 2.2.7

---
 .../libdc1394/{libdc1394_2.2.6.bb => libdc1394_2.2.7.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libdc1394/{libdc1394_2.2.6.bb => libdc1394_2.2.7.bb} (84%)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
similarity index 84%
rename from meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
rename to meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
index 952ba603b..8cac780d6 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
@@ -14,8 +14,7 @@ DEPENDS += "libusb1 libraw1394 libsdl \
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://install_examples.patch \
           "
-SRC_URI[md5sum] = "9fad67bbff08fe2818d5ec81802ec89f"
-SRC_URI[sha256sum] = "2b905fc9aa4eec6bdcf6a2ae5f5ba021232739f5be047dec8fe8dd6049c10fed"
+SRC_URI[sha256sum] = "537ceb78dd3cef271a183f4a176191d1cecf85f025520e6bd3758b0e19e6609f"
 inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-doxygen-doc --disable-examples"
-- 
2.39.2


--===============3586090048377736888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libdc1394: PKGV changed from 2.2.6 [default] to 2.2.7 [default]
packages/core2-64-poky-linux/libdc1394: SRC_URI changed from "https://downloads.sourceforge.net/libdc1394/libdc1394-2.2.6.tar.gz file://install_examples.patch" to "https://downloads.sourceforge.net/libdc1394/libdc1394-2.2.7.tar.gz file://install_examples.patch"
packages/core2-64-poky-linux/libdc1394: PV changed from "2.2.6" to "2.2.7"
packages/core2-64-poky-linux/libdc1394/libdc1394-dbg: PKGV changed from 2.2.6 [default] to 2.2.7 [default]
packages/core2-64-poky-linux/libdc1394/libdc1394-dbg: PV changed from "2.2.6" to "2.2.7"
packages/core2-64-poky-linux/libdc1394/libdc1394-dbg: FILELIST: removed "/usr/lib/.debug/libdc1394.so.25.0.0", added "/usr/lib/.debug/libdc1394.so.26.0.1"
packages/core2-64-poky-linux/libdc1394/libdc1394-dev: PKGV changed from 2.2.6 [default] to 2.2.7 [default]
packages/core2-64-poky-linux/libdc1394/libdc1394-dev: PV changed from "2.2.6" to "2.2.7"
packages/core2-64-poky-linux/libdc1394/libdc1394-doc: PKGV changed from 2.2.6 [default] to 2.2.7 [default]
packages/core2-64-poky-linux/libdc1394/libdc1394-doc: PV changed from "2.2.6" to "2.2.7"
packages/core2-64-poky-linux/libdc1394/libdc1394-locale: PKGV changed from 2.2.6 [default] to 2.2.7 [default]
packages/core2-64-poky-linux/libdc1394/libdc1394-locale: PV changed from "2.2.6" to "2.2.7"
packages/core2-64-poky-linux/libdc1394/libdc1394-src: PKGV changed from 2.2.6 [default] to 2.2.7 [default]
packages/core2-64-poky-linux/libdc1394/libdc1394-src: PV changed from "2.2.6" to "2.2.7"
packages/core2-64-poky-linux/libdc1394/libdc1394-staticdev: PKGV changed from 2.2.6 [default] to 2.2.7 [default]
packages/core2-64-poky-linux/libdc1394/libdc1394-staticdev: PV changed from "2.2.6" to "2.2.7"
packages/core2-64-poky-linux/libdc1394/libdc1394: PKG changed from libdc1394-25 to libdc1394-26
packages/core2-64-poky-linux/libdc1394/libdc1394: PKGV changed from 2.2.6 [default] to 2.2.7 [default]
packages/core2-64-poky-linux/libdc1394/libdc1394: PV changed from "2.2.6" to "2.2.7"
packages/core2-64-poky-linux/libdc1394/libdc1394: FILELIST: removed "/usr/lib/libdc1394.so.25 /usr/lib/libdc1394.so.25.0.0", added "/usr/lib/libdc1394.so.26 /usr/lib/libdc1394.so.26.0.1"
Changes to packages/core2-64-poky-linux/libdc1394 (sysroot):
  /usr/lib/libdc1394.so changed symlink target from libdc1394.so.25.0.0 to libdc1394.so.26.0.1
  /usr/lib/libdc1394.so.25.0.0 moved to /usr/lib/libdc1394.so.26.0.1
  /usr/lib/libdc1394.so.25 moved to /usr/lib/libdc1394.so.26

--===============3586090048377736888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libdc1394/libdc1394: FILELIST: removed "/usr/lib/libdc1394.so.25.0.0 /usr/lib/libdc1394.so.25", added "/usr/lib/libdc1394.so.26.0.1 /usr/lib/libdc1394.so.26"
packages/core2-64-poky-linux/libdc1394/libdc1394: PKG changed from libdc1394-25 to libdc1394-26
Changes to packages/core2-64-poky-linux/libdc1394 (sysroot):
  /usr/lib/libdc1394.so changed symlink target from libdc1394.so.25.0.0 to libdc1394.so.26.0.1
  /usr/lib/libdc1394.so.25.0.0 moved to /usr/lib/libdc1394.so.26.0.1
  /usr/lib/libdc1394.so.25 moved to /usr/lib/libdc1394.so.26

--===============3586090048377736888==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdc1394-upgrade-2.2.6-2.2.7.patch"

RnJvbSBjMzk5NTM4NzdiMTEyODE4NTU0MDNiNGJhNzJhNTA0ZjU5N2NjZGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzo0MDowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmRjMTM5NDogdXBncmFkZSAyLjIuNiAtPiAyLjIuNwoKLS0tCiAuLi4vbGliZGMxMzk0L3tsaWJk
YzEzOTRfMi4yLjYuYmIgPT4gbGliZGMxMzk0XzIuMi43LmJifSAgICAgICB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1t
dWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJkYzEzOTQve2xpYmRjMTM5NF8yLjIuNi5i
YiA9PiBsaWJkYzEzOTRfMi4yLjcuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1tdWx0aW1l
ZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJkYzEzOTQvbGliZGMxMzk0XzIuMi42LmJiIGIvbWV0
YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJkYzEzOTQvbGliZGMxMzk0XzIuMi43
LmJiCnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFtZSBmcm9tIG1ldGEtbXVsdGltZWRpYS9yZWNp
cGVzLW11bHRpbWVkaWEvbGliZGMxMzk0L2xpYmRjMTM5NF8yLjIuNi5iYgpyZW5hbWUgdG8gbWV0
YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJkYzEzOTQvbGliZGMxMzk0XzIuMi43
LmJiCmluZGV4IDk1MmJhNjAzYi4uOGNhYzc4MGQ2IDEwMDc1NQotLS0gYS9tZXRhLW11bHRpbWVk
aWEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYmRjMTM5NC9saWJkYzEzOTRfMi4yLjYuYmIKKysrIGIv
bWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJkYzEzOTQvbGliZGMxMzk0XzIu
Mi43LmJiCkBAIC0xNCw4ICsxNCw3IEBAIERFUEVORFMgKz0gImxpYnVzYjEgbGlicmF3MTM5NCBs
aWJzZGwgXAogU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vJHtCUE59LyR7QlB9LnRh
ci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9pbnN0YWxsX2V4YW1wbGVzLnBhdGNoIFwKICAgICAg
ICAgICAiCi1TUkNfVVJJW21kNXN1bV0gPSAiOWZhZDY3YmJmZjA4ZmUyODE4ZDVlYzgxODAyZWM4
OWYiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmI5MDVmYzlhYTRlZWM2YmRjZjZhMmFlNWY1YmEw
MjEyMzI3MzlmNWJlMDQ3ZGVjOGZlOGRkNjA0OWMxMGZlZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI1MzdjZWI3OGRkM2NlZjI3MWExODNmNGExNzYxOTFkMWNlY2Y4NWYwMjU1MjBlNmJkMzc1OGIw
ZTE5ZTY2MDlmIgogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnCiAKIEVYVFJBX09FQ09ORiAr
PSAiLS1kaXNhYmxlLWRveHlnZW4tZG9jIC0tZGlzYWJsZS1leGFtcGxlcyIKLS0gCjIuMzkuMgoK

--===============3586090048377736888==--

