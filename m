Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C646C05020
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:49 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.63858.1699041164963085182
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZR8naTuj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TsY9VPdt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b96bec5d9-30e827d0-67b7-4918-bdd1-1e4d2879dd24-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=midtmPgethzggOr683CFeYkhsXVCy2SA6GlH/zW5cOc=;
	b=ZR8naTujde95ytz8hrnBCWWdoi9BZxMZakxtjTeRvdXTcTAFdDNF4596iax6oUJw
	Hyu8//0dTGFw+3i28rTQpFpGinoYl4MgX2wL38D9jx3tcxZ/IkcuP190Vkq32L8Qj1p
	9GtO6tdTXrd9IVUuQJA3jkl+xbgb/auJDQz+yh84=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=midtmPgethzggOr683CFeYkhsXVCy2SA6GlH/zW5cOc=;
	b=TsY9VPdtF+xnYiyWZEWGRBnBO5bAD0TRiwWkABi4cG1mK172GzToEl+//0dy6BP2
	z7uO1czUvZw4vXfnp1FxbdQK5A3hXQTpWQo6wuyseJTwvWXm7HRnapsRtcA1Wv1Fhqv
	1VExV9wf5w/1wKBoLH5OFezRxImPR7kmA/U/z9zs=
Content-Type: multipart/mixed; boundary="===============4052143896496303688=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] geos: upgrading to 3.12.0beta2 SUCCEEDED
Message-ID: <0101018b96bec5d9-30e827d0-67b7-4918-bdd1-1e4d2879dd24-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105921

--===============4052143896496303688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *geos* to *3.12.0beta2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-geos-upgrade-3.12.0-3.12.0beta2.patch
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
From 44935dbd8ea98c3846fad098e6f6632a20713ac0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 12:37:48 +0000
Subject: [PATCH] geos: upgrade 3.12.0 -> 3.12.0beta2

---
 .../geos/{geos_3.12.0.bb => geos_3.12.0beta2.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/geos/{geos_3.12.0.bb => geos_3.12.0beta2.bb} (88%)

diff --git a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb b/meta-oe/recipes-navigation/geos/geos_3.12.0beta2.bb
similarity index 88%
rename from meta-oe/recipes-navigation/geos/geos_3.12.0.bb
rename to meta-oe/recipes-navigation/geos/geos_3.12.0beta2.bb
index 95cb29775..e4e1b9db2 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.12.0beta2.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "d96db96011259178a35555a0f6d6e75a739e52a495a6b2aa5efb3d75390fbc39"
+SRC_URI[sha256sum] = "249c63c6f07ec827377e94a90b99a97d39e655aff180cfa71b50381d8e209382"
 
 inherit cmake pkgconfig binconfig
 
-- 
2.39.2


--===============4052143896496303688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/geos/geos-c1: PV changed from "3.12.0" to "3.12.0beta2"
packages/core2-64-poky-linux/geos/geos-c1: PKGV changed from 3.12.0 [default] to 3.12.0beta2 [default]
packages/core2-64-poky-linux/geos/geos-dbg: PKGSIZE changed from 84827672 to 84830568 (+0%)
packages/core2-64-poky-linux/geos/geos-dbg: PV changed from "3.12.0" to "3.12.0beta2"
packages/core2-64-poky-linux/geos/geos-dbg: PKGV changed from 3.12.0 [default] to 3.12.0beta2 [default]
packages/core2-64-poky-linux/geos/geos-dev: PKGSIZE changed from 3037611 to 3037651 (+0%)
packages/core2-64-poky-linux/geos/geos-dev: PV changed from "3.12.0" to "3.12.0beta2"
packages/core2-64-poky-linux/geos/geos-dev: PKGV changed from 3.12.0 [default] to 3.12.0beta2 [default]
packages/core2-64-poky-linux/geos/geos-doc: PV changed from "3.12.0" to "3.12.0beta2"
packages/core2-64-poky-linux/geos/geos-doc: PKGV changed from 3.12.0 [default] to 3.12.0beta2 [default]
packages/core2-64-poky-linux/geos/geos-locale: PV changed from "3.12.0" to "3.12.0beta2"
packages/core2-64-poky-linux/geos/geos-locale: PKGV changed from 3.12.0 [default] to 3.12.0beta2 [default]
packages/core2-64-poky-linux/geos/geos-src: PKGSIZE changed from 5415230 to 5415245 (+0%)
packages/core2-64-poky-linux/geos/geos-src: PV changed from "3.12.0" to "3.12.0beta2"
packages/core2-64-poky-linux/geos/geos-src: PKGV changed from 3.12.0 [default] to 3.12.0beta2 [default]
packages/core2-64-poky-linux/geos/geos-staticdev: PV changed from "3.12.0" to "3.12.0beta2"
packages/core2-64-poky-linux/geos/geos-staticdev: PKGV changed from 3.12.0 [default] to 3.12.0beta2 [default]
packages/core2-64-poky-linux/geos/geos: PV changed from "3.12.0" to "3.12.0beta2"
packages/core2-64-poky-linux/geos/geos: PKGV changed from 3.12.0 [default] to 3.12.0beta2 [default]
packages/core2-64-poky-linux/geos/geoslib: PV changed from "3.12.0" to "3.12.0beta2"
packages/core2-64-poky-linux/geos/geoslib: PKGV changed from 3.12.0 [default] to 3.12.0beta2 [default]
packages/core2-64-poky-linux/geos/geoslib: FILES: removed "/usr/lib/libgeos-3.12.0.so", added "/usr/lib/libgeos-3.12.0beta2.so"
packages/core2-64-poky-linux/geos: PV changed from "3.12.0" to "3.12.0beta2"
packages/core2-64-poky-linux/geos: PKGV changed from 3.12.0 [default] to 3.12.0beta2 [default]
packages/core2-64-poky-linux/geos: SRC_URI changed from "http://download.osgeo.org/geos/geos-3.12.0.tar.bz2" to "http://download.osgeo.org/geos/geos-3.12.0beta2.tar.bz2"

--===============4052143896496303688==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-geos-upgrade-3.12.0-3.12.0beta2.patch"

RnJvbSA0NDkzNWRiZDhlYTk4YzM4NDZmYWQwOThlNmY2NjMyYTIwNzEzYWMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMjozNzo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdl
b3M6IHVwZ3JhZGUgMy4xMi4wIC0+IDMuMTIuMGJldGEyCgotLS0KIC4uLi9nZW9zL3tnZW9zXzMu
MTIuMC5iYiA9PiBnZW9zXzMuMTIuMGJldGEyLmJifSAgICAgICAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEt
b2UvcmVjaXBlcy1uYXZpZ2F0aW9uL2dlb3Mve2dlb3NfMy4xMi4wLmJiID0+IGdlb3NfMy4xMi4w
YmV0YTIuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLW5hdmlnYXRpb24v
Z2Vvcy9nZW9zXzMuMTIuMC5iYiBiL21ldGEtb2UvcmVjaXBlcy1uYXZpZ2F0aW9uL2dlb3MvZ2Vv
c18zLjEyLjBiZXRhMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhLW9l
L3JlY2lwZXMtbmF2aWdhdGlvbi9nZW9zL2dlb3NfMy4xMi4wLmJiCnJlbmFtZSB0byBtZXRhLW9l
L3JlY2lwZXMtbmF2aWdhdGlvbi9nZW9zL2dlb3NfMy4xMi4wYmV0YTIuYmIKaW5kZXggOTVjYjI5
Nzc1Li5lNGUxYjlkYjIgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1uYXZpZ2F0aW9uL2dl
b3MvZ2Vvc18zLjEyLjAuYmIKKysrIGIvbWV0YS1vZS9yZWNpcGVzLW5hdmlnYXRpb24vZ2Vvcy9n
ZW9zXzMuMTIuMGJldGEyLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNFTlNFID0gIkxHUEwtMi4xLW9y
LWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1Mzgw
Y2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2Rvd25sb2FkLm9z
Z2VvLm9yZy8ke0JQTn0vJHtCUH0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkOTZk
Yjk2MDExMjU5MTc4YTM1NTU1YTBmNmQ2ZTc1YTczOWU1MmE0OTVhNmIyYWE1ZWZiM2Q3NTM5MGZi
YzM5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI0OWM2M2M2ZjA3ZWM4MjczNzdlOTRhOTBiOTlh
OTdkMzllNjU1YWZmMTgwY2ZhNzFiNTAzODFkOGUyMDkzODIiCiAKIGluaGVyaXQgY21ha2UgcGtn
Y29uZmlnIGJpbmNvbmZpZwogCi0tIAoyLjM5LjIKCg==

--===============4052143896496303688==--

