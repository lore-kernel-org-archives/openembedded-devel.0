Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED52C18E0C
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.63887.1699041170414986106
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Oo8esmHT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RjFKmUhj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b96bed160-f857e74e-5a29-4040-b926-bc26a2487cae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f14P+hxZTm3zIbjvBoHexpJEZx2VE/BAK9hHHlFGFJM=;
	b=Oo8esmHTP0gIYcGVm2WM+LuaDld/NURSTgfuXguko6errPBYeZSuBYaOFAGSA3HB
	ygdtXVwgYoSoQs3hgNjJXjaK7xRj6+hnL/kO4bYHTkP/EF3TOpSqcpz2Wq/VPCPGWKg
	XD/YbKKJKZ3uhEKr3zS8xMZfXPeUG7VeCYx8Cxbo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f14P+hxZTm3zIbjvBoHexpJEZx2VE/BAK9hHHlFGFJM=;
	b=RjFKmUhjy0OD2Yz7drnfqvkLLR6qxbd56qGjPeoR27Nz0sekW1KGNa/77FsedfaQ
	Aq/w39p5PcxN81NfOYb1PPzx6carqoRHxTIYUVhlGNkb5NGmR0PYvPNFpLL//0Hlva/
	4KdU4huX+CVsRiP8zHLYdsC3BAup+p6tOHseLkFU=
Content-Type: multipart/mixed; boundary="===============8060618511026041108=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] lsscsi: upgrading to 030 SUCCEEDED
Message-ID: <0101018b96bed160-f857e74e-5a29-4040-b926-bc26a2487cae-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105986

--===============8060618511026041108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lsscsi* to *030* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lsscsi-upgrade-0.32-030.patch
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
From c443d4defd56732fa4c21cc336242730515bdedf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 15:22:03 +0000
Subject: [PATCH] lsscsi: upgrade 0.32 -> 030

---
 meta-oe/recipes-bsp/lsscsi/{lsscsi_0.32.bb => lsscsi_030.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_0.32.bb => lsscsi_030.bb} (71%)

diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
similarity index 71%
rename from meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
rename to meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
index 9e6eb7b72..9d3d7d806 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM="file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
 
-SRC_URI[sha256sum] = "0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e8029a1"
+SRC_URI[sha256sum] = "619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5518b15"
 
 inherit autotools
 
-S = "${WORKDIR}/lsscsi-${PV}"
+S = "${WORKDIR}/lsscsi-${PV}r154"
-- 
2.39.2


--===============8060618511026041108==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-lsscsi-upgrade-0.32-030.patch"

RnJvbSBjNDQzZDRkZWZkNTY3MzJmYTRjMjFjYzMzNjI0MjczMDUxNWJkZWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNToyMjowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxz
c2NzaTogdXBncmFkZSAwLjMyIC0+IDAzMAoKLS0tCiBtZXRhLW9lL3JlY2lwZXMtYnNwL2xzc2Nz
aS97bHNzY3NpXzAuMzIuYmIgPT4gbHNzY3NpXzAzMC5iYn0gfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1vZS9yZWNp
cGVzLWJzcC9sc3Njc2kve2xzc2NzaV8wLjMyLmJiID0+IGxzc2NzaV8wMzAuYmJ9ICg3MSUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWJzcC9sc3Njc2kvbHNzY3NpXzAuMzIuYmIgYi9t
ZXRhLW9lL3JlY2lwZXMtYnNwL2xzc2NzaS9sc3Njc2lfMDMwLmJiCnNpbWlsYXJpdHkgaW5kZXgg
NzElCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1ic3AvbHNzY3NpL2xzc2NzaV8wLjMyLmJi
CnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtYnNwL2xzc2NzaS9sc3Njc2lfMDMwLmJiCmluZGV4
IDllNmViN2I3Mi4uOWQzZDdkODA2IDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtYnNwL2xz
c2NzaS9sc3Njc2lfMC4zMi5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtYnNwL2xzc2NzaS9sc3Nj
c2lfMDMwLmJiCkBAIC02LDggKzYsOCBAQCBMSUNfRklMRVNfQ0hLU1VNPSJmaWxlOi8vQ09QWUlO
RzttZDU9MDYzNmU3M2ZmMDIxNWU4ZDY3MmRjNGMzMmMzMTdiYjMiCiAKIFNSQ19VUkkgPSAiaHR0
cDovL3NnLmRhbm55LmN6L3Njc2kvJHtCUH0udGd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MGE4MDBlOWU5NGRjYTJhYjcwMmQ2NWQ3Mjc3N2FlOGNhZTA3OGUzZDc0ZDBiY2JlZDY0YmEwODQ5
ZTgwMjlhMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MTlhMjE4NzQwNWYwMmM1ZjU3NjgyZjM0
NzhiZmZjNzUzMjY4MDNjZDA4ODM5ZTM5ZDQzNDI1MGM1NTE4YjE1IgogCiBpbmhlcml0IGF1dG90
b29scwogCi1TID0gIiR7V09SS0RJUn0vbHNzY3NpLSR7UFZ9IgorUyA9ICIke1dPUktESVJ9L2xz
c2NzaS0ke1BWfXIxNTQiCi0tIAoyLjM5LjIKCg==

--===============8060618511026041108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lsscsi: PV changed from "0.32" to "030"
packages/core2-64-poky-linux/lsscsi: PKGV changed from 0.32 [default] to 030 [default]
packages/core2-64-poky-linux/lsscsi: SRC_URI changed from "http://sg.danny.cz/scsi/lsscsi-0.32.tgz" to "http://sg.danny.cz/scsi/lsscsi-030.tgz"
packages/core2-64-poky-linux/lsscsi/lsscsi-dbg: PV changed from "0.32" to "030"
packages/core2-64-poky-linux/lsscsi/lsscsi-dbg: PKGV changed from 0.32 [default] to 030 [default]
packages/core2-64-poky-linux/lsscsi/lsscsi-dbg: PKGSIZE changed from 227392 to 227424 (+0%)
packages/core2-64-poky-linux/lsscsi/lsscsi-dev: PV changed from "0.32" to "030"
packages/core2-64-poky-linux/lsscsi/lsscsi-dev: PKGV changed from 0.32 [default] to 030 [default]
packages/core2-64-poky-linux/lsscsi/lsscsi-doc: PV changed from "0.32" to "030"
packages/core2-64-poky-linux/lsscsi/lsscsi-doc: PKGV changed from 0.32 [default] to 030 [default]
packages/core2-64-poky-linux/lsscsi/lsscsi-doc: PKGSIZE changed from 28064 to 26054 (-7%)
packages/core2-64-poky-linux/lsscsi/lsscsi-locale: PV changed from "0.32" to "030"
packages/core2-64-poky-linux/lsscsi/lsscsi-locale: PKGV changed from 0.32 [default] to 030 [default]
packages/core2-64-poky-linux/lsscsi/lsscsi-src: PV changed from "0.32" to "030"
packages/core2-64-poky-linux/lsscsi/lsscsi-src: PKGV changed from 0.32 [default] to 030 [default]
packages/core2-64-poky-linux/lsscsi/lsscsi-src: PKGSIZE changed from 205675 to 200852 (-2%)
packages/core2-64-poky-linux/lsscsi/lsscsi-staticdev: PV changed from "0.32" to "030"
packages/core2-64-poky-linux/lsscsi/lsscsi-staticdev: PKGV changed from 0.32 [default] to 030 [default]
packages/core2-64-poky-linux/lsscsi/lsscsi: PV changed from "0.32" to "030"
packages/core2-64-poky-linux/lsscsi/lsscsi: PKGV changed from 0.32 [default] to 030 [default]

--===============8060618511026041108==--

