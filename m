Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE03C41535
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:04 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.3426.1699067574251094579
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d5Wa9dWA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=I4TAekzh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b9851b4a0-ad4454fd-5ed8-4e80-b99b-e79ba0023a6e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UGdmUdr+F50LAA6MYnG4RuaVmameOpLx78/eP8YyTBU=;
	b=d5Wa9dWAXzOw67Dn7dWHPJVImptujedAf0B0SwbRlE7mYSwXWKy5GiqRMse400H/
	z7BeWSNIz1Sx8BSBLREeuUSY7RuZuT1p01GAEKyPuw1Lz8JwaqpUbrRNCxcs3zrYDHA
	QPQztM0B/BxP4QYcb9/s0bnGG1i7QvAoglpIBlOE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UGdmUdr+F50LAA6MYnG4RuaVmameOpLx78/eP8YyTBU=;
	b=I4TAekzhndf4vz14QT20Bm4FcNZ5UAQtLATX8IigtA2Ak/KmC7Wl3jP4wgsBgAnb
	tj45Wc5MQsBdJY4EBxyn4xN8/PRcd4jS3AxD/3PqvHNe2izhN10NMmo/xIG7CXd8M23
	3NJJR1E8twlXgBP2BmSBOtgilziR55u0kslUhyZA=
Content-Type: multipart/mixed; boundary="===============5870535428405669915=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] ipset: upgrading to 7.19 SUCCEEDED
Message-ID: <0101018b9851b4a0-ad4454fd-5ed8-4e80-b99b-e79ba0023a6e-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106198

--===============5870535428405669915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ipset* to *7.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ipset-upgrade-7.15-7.19.patch
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
From 366a43ea6462d4b39abd1397e76c6497f20b972d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 02:13:18 +0000
Subject: [PATCH] ipset: upgrade 7.15 -> 7.19

---
 .../recipes-filter/ipset/{ipset_7.15.bb => ipset_7.19.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/ipset/{ipset_7.15.bb => ipset_7.19.bb} (87%)

diff --git a/meta-networking/recipes-filter/ipset/ipset_7.15.bb b/meta-networking/recipes-filter/ipset/ipset_7.19.bb
similarity index 87%
rename from meta-networking/recipes-filter/ipset/ipset_7.15.bb
rename to meta-networking/recipes-filter/ipset/ipset_7.19.bb
index 0e928a30f..bb4319f36 100644
--- a/meta-networking/recipes-filter/ipset/ipset_7.15.bb
+++ b/meta-networking/recipes-filter/ipset/ipset_7.19.bb
@@ -10,7 +10,7 @@ SECTION = "base"
 DEPENDS = "libtool libmnl"
 
 SRC_URI = "http://ftp.netfilter.org/pub/ipset/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "0a5545aaadb640142c1f888d366a78ddf8724799967fa20686a70053bd621751"
+SRC_URI[sha256sum] = "9bc1fba48d65786e3e0b63dc6b669a866823d77840c6990c0c6b23078ec2c4d6"
 
 inherit autotools pkgconfig module-base
 
-- 
2.39.2


--===============5870535428405669915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86_64-poky-linux/ipset/ipset-dbg: PKGSIZE changed from 354392 to 360344 (+2%)
packages/qemux86_64-poky-linux/ipset/ipset-dbg: FILELIST: removed "/usr/lib/.debug/libipset.so.13.3.0", added "/usr/lib/.debug/libipset.so.13.4.0"
packages/qemux86_64-poky-linux/ipset/ipset-dbg: PKGV changed from 7.15 [default] to 7.19 [default]
packages/qemux86_64-poky-linux/ipset/ipset-dbg: PV changed from "7.15" to "7.19"
packages/qemux86_64-poky-linux/ipset/ipset-dev: PKGSIZE changed from 51293 to 51574 (+1%)
packages/qemux86_64-poky-linux/ipset/ipset-dev: PKGV changed from 7.15 [default] to 7.19 [default]
packages/qemux86_64-poky-linux/ipset/ipset-dev: PV changed from "7.15" to "7.19"
packages/qemux86_64-poky-linux/ipset/ipset-doc: PKGSIZE changed from 57761 to 59238 (+3%)
packages/qemux86_64-poky-linux/ipset/ipset-doc: PKGV changed from 7.15 [default] to 7.19 [default]
packages/qemux86_64-poky-linux/ipset/ipset-doc: PV changed from "7.15" to "7.19"
packages/qemux86_64-poky-linux/ipset/ipset-locale: PKGV changed from 7.15 [default] to 7.19 [default]
packages/qemux86_64-poky-linux/ipset/ipset-locale: PV changed from "7.15" to "7.19"
packages/qemux86_64-poky-linux/ipset/ipset-src: PKGSIZE changed from 514140 to 526883 (+2%)
packages/qemux86_64-poky-linux/ipset/ipset-src: PKGV changed from 7.15 [default] to 7.19 [default]
packages/qemux86_64-poky-linux/ipset/ipset-src: PV changed from "7.15" to "7.19"
packages/qemux86_64-poky-linux/ipset/ipset-staticdev: PKGV changed from 7.15 [default] to 7.19 [default]
packages/qemux86_64-poky-linux/ipset/ipset-staticdev: PV changed from "7.15" to "7.19"
packages/qemux86_64-poky-linux/ipset/ipset: PKGSIZE changed from 225441 to 231457 (+3%)
packages/qemux86_64-poky-linux/ipset/ipset: FILELIST: removed "/usr/lib/libipset.so.13.3.0", added "/usr/lib/libipset.so.13.4.0"
packages/qemux86_64-poky-linux/ipset/ipset: PKGV changed from 7.15 [default] to 7.19 [default]
packages/qemux86_64-poky-linux/ipset/ipset: PV changed from "7.15" to "7.19"
packages/qemux86_64-poky-linux/ipset: PKGV changed from 7.15 [default] to 7.19 [default]
packages/qemux86_64-poky-linux/ipset: SRC_URI changed from "http://ftp.netfilter.org/pub/ipset/ipset-7.15.tar.bz2" to "http://ftp.netfilter.org/pub/ipset/ipset-7.19.tar.bz2"
packages/qemux86_64-poky-linux/ipset: PV changed from "7.15" to "7.19"
Changes to packages/qemux86_64-poky-linux/ipset (sysroot):
  /usr/lib/libipset.so.13 changed symlink target from libipset.so.13.3.0 to libipset.so.13.4.0
  /usr/lib/libipset.so changed symlink target from libipset.so.13.3.0 to libipset.so.13.4.0
  /usr/lib/libipset.so.13.3.0 moved to /usr/lib/libipset.so.13.4.0

--===============5870535428405669915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/qemux86_64-poky-linux/ipset/ipset: FILELIST: removed "/usr/lib/libipset.so.13.3.0", added "/usr/lib/libipset.so.13.4.0"
Changes to packages/qemux86_64-poky-linux/ipset (sysroot):
  /usr/lib/libipset.so.13 changed symlink target from libipset.so.13.3.0 to libipset.so.13.4.0
  /usr/lib/libipset.so changed symlink target from libipset.so.13.3.0 to libipset.so.13.4.0
  /usr/lib/libipset.so.13.3.0 moved to /usr/lib/libipset.so.13.4.0

--===============5870535428405669915==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ipset-upgrade-7.15-7.19.patch"

RnJvbSAzNjZhNDNlYTY0NjJkNGIzOWFiZDEzOTdlNzZjNjQ5N2YyMGI5NzJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMjoxMzoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlw
c2V0OiB1cGdyYWRlIDcuMTUgLT4gNy4xOQoKLS0tCiAuLi4vcmVjaXBlcy1maWx0ZXIvaXBzZXQv
e2lwc2V0XzcuMTUuYmIgPT4gaXBzZXRfNy4xOS5iYn0gICAgICAgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLW5ldHdvcmtp
bmcvcmVjaXBlcy1maWx0ZXIvaXBzZXQve2lwc2V0XzcuMTUuYmIgPT4gaXBzZXRfNy4xOS5iYn0g
KDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1maWx0ZXIvaXBzZXQv
aXBzZXRfNy4xNS5iYiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWZpbHRlci9pcHNldC9pcHNl
dF83LjE5LmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEtbmV0d29ya2lu
Zy9yZWNpcGVzLWZpbHRlci9pcHNldC9pcHNldF83LjE1LmJiCnJlbmFtZSB0byBtZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1maWx0ZXIvaXBzZXQvaXBzZXRfNy4xOS5iYgppbmRleCAwZTkyOGEzMGYu
LmJiNDMxOWYzNiAxMDA2NDQKLS0tIGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZmlsdGVyL2lw
c2V0L2lwc2V0XzcuMTUuYmIKKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZmlsdGVyL2lw
c2V0L2lwc2V0XzcuMTkuYmIKQEAgLTEwLDcgKzEwLDcgQEAgU0VDVElPTiA9ICJiYXNlIgogREVQ
RU5EUyA9ICJsaWJ0b29sIGxpYm1ubCIKIAogU1JDX1VSSSA9ICJodHRwOi8vZnRwLm5ldGZpbHRl
ci5vcmcvcHViL2lwc2V0LyR7QlB9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGE1
NTQ1YWFhZGI2NDAxNDJjMWY4ODhkMzY2YTc4ZGRmODcyNDc5OTk2N2ZhMjA2ODZhNzAwNTNiZDYy
MTc1MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5YmMxZmJhNDhkNjU3ODZlM2UwYjYzZGM2YjY2
OWE4NjY4MjNkNzc4NDBjNjk5MGMwYzZiMjMwNzhlYzJjNGQ2IgogCiBpbmhlcml0IGF1dG90b29s
cyBwa2djb25maWcgbW9kdWxlLWJhc2UKIAotLSAKMi4zOS4yCgo=

--===============5870535428405669915==--

