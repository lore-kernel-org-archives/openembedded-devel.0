Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F64C25B54
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.62986.1699041168460482837
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Zz8zYq0j;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oDuGiiIA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bec977-489a8b5c-0cda-4ad1-86c4-970b6d47244c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jSuPiJH7RH5RJjukmPl5gGPTcpY9zfnVfzaAyuKGDAs=;
	b=Zz8zYq0jiF01spC7bHW3gmND+Uuc2fl8KLd/xUlhiU20qjzQ7G+p5Hm9mjwLVxoZ
	D/gXaa5WhU7SwYMXXZs4LiDogex7j8JbXuh/qTy752fqIwjH+p4ydsJ+tYAXDyzwPRe
	+w5EOkhBZAoDTXleRBMMWn3YHViw1+yBjU8KF6kg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jSuPiJH7RH5RJjukmPl5gGPTcpY9zfnVfzaAyuKGDAs=;
	b=oDuGiiIAvEJ8RZzCon6q+4UgvRK7Gj1lrdnzNB9jXsKW7VfnlN5n27w2F2g+VoW2
	2IHAN8gSf4qQwm27CpEnqGEIscdLZOMUY2ZUtx9qn0DHulc6ThvHm5rvCHHOso0RBQi
	R8XPImEayL/e/lPk5UWrxYicDTseWPUNlobs1Huc=
Content-Type: multipart/mixed; boundary="===============7342242481798530943=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.375 SUCCEEDED
Message-ID: <0101018b96bec977-489a8b5c-0cda-4ad1-86c4-970b6d47244c-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105946

--===============7342242481798530943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hwdata* to *0.375* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.370-0.375.patch
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
From 08de037ac379d30197b4a67900d52b12a776d6b6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 13:10:42 +0000
Subject: [PATCH] hwdata: upgrade 0.370 -> 0.375

---
 .../recipes-support/hwdata/{hwdata_0.370.bb => hwdata_0.375.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.370.bb => hwdata_0.375.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.370.bb b/meta-oe/recipes-support/hwdata/hwdata_0.375.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.370.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.375.bb
index 56d425377..b83406973 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.370.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.375.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "21cb47beb1716545b25dfe8ae1b9e079c73b85d9"
+SRCREV = "b9ba5bc9eecbeeff441806695b227c3c3de4755c"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============7342242481798530943==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.370-0.375.patch"

RnJvbSAwOGRlMDM3YWMzNzlkMzAxOTdiNGE2NzkwMGQ1MmIxMmE3NzZkNmI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMzoxMDo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
ZGF0YTogdXBncmFkZSAwLjM3MCAtPiAwLjM3NQoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L2h3
ZGF0YS97aHdkYXRhXzAuMzcwLmJiID0+IGh3ZGF0YV8wLjM3NS5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLW9lL3Jl
Y2lwZXMtc3VwcG9ydC9od2RhdGEve2h3ZGF0YV8wLjM3MC5iYiA9PiBod2RhdGFfMC4zNzUuYmJ9
ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0
YV8wLjM3MC5iYiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4zNzUu
YmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLXN1cHBv
cnQvaHdkYXRhL2h3ZGF0YV8wLjM3MC5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLXN1cHBv
cnQvaHdkYXRhL2h3ZGF0YV8wLjM3NS5iYgppbmRleCA1NmQ0MjUzNzcuLmI4MzQwNjk3MyAxMDA2
NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM3MC5iYgor
KysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzc1LmJiCkBAIC01
LDcgKzUsNyBAQCBTRUNUSU9OID0gIlN5c3RlbS9CYXNlIgogTElDRU5TRSA9ICJHUEwtMi4wLW9y
LWxhdGVyIHwgWEZyZWU4Ni0xLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAotU1JDUkVWID0gIjIxY2I0
N2JlYjE3MTY1NDViMjVkZmU4YWUxYjllMDc5YzczYjg1ZDkiCitTUkNSRVYgPSAiYjliYTViYzll
ZWNiZWVmZjQ0MTgwNjY5NWIyMjdjM2MzZGU0NzU1YyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS92Y3Job25lay8ke0JQTn0uZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCiAK
IFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjM5LjIKCg==

--===============7342242481798530943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.370 [default] to 0.375 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.370" to "0.375"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.370 [default] to 0.375 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.370" to "0.375"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.370 [default] to 0.375 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.370" to "0.375"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.370 [default] to 0.375 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.370" to "0.375"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.370 [default] to 0.375 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.370" to "0.375"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.370 [default] to 0.375 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.370" to "0.375"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.370 [default] to 0.375 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.370" to "0.375"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 9171746 to 9309304 (+1%)
packages/all-poky-linux/hwdata: PKGV changed from 0.370 [default] to 0.375 [default]
packages/all-poky-linux/hwdata: PV changed from "0.370" to "0.375"

--===============7342242481798530943==--

