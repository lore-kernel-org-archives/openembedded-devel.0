Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4D7C4167D
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2194.1699061893058992672
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b/c3Nogy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IauSNf0C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b97fb040d-465e94cb-3bcf-49c7-887f-9bb29a003edb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W0/lUMh0JW2E3QDAzPDdDHjGVWMIk3/EjKeKtRBWAMM=;
	b=b/c3Nogy4iMypIfXah7U+jMUSv0tLdGf9Bs3CJGetg/xq5MDtLBTJEO3iR7Z4qLt
	X1O63dzLSKYjRw30WV9aIEyY2kuLbRPECNwQrg3xJAhi77iORnK8I1wvb4Rdihf2xSF
	cn5kBPFAODS4HIdPkl+NUYHXqc95PP6h+qT1naeI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W0/lUMh0JW2E3QDAzPDdDHjGVWMIk3/EjKeKtRBWAMM=;
	b=IauSNf0CJJ/PU/4QVr3vOiAczy3Z8yUPnrx4MlV1g5eVRMO+Qu3MWUYYiEngMVRL
	0HKBchXVrfxry6tZBZM+i5ee4UdIlb7Hy4piSca7xI1mWoXJatFHo2Uz6Wv/Inj+MZ0
	4NGh5JSAzdLq4apbDF9IX6snUCYV9ltY1i9U4WKA=
Content-Type: multipart/mixed; boundary="===============4638337308860830844=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-alembic: upgrading to 1.12.1 SUCCEEDED
Message-ID: <0101018b97fb040d-465e94cb-3bcf-49c7-887f-9bb29a003edb-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106094

--===============4638337308860830844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-alembic* to *1.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-alembic-upgrade-1.12.0-1.12.1.patch
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
From bc2820cc155b9de62ab06b0e1e979d9ec38e5a2e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 19:57:51 +0000
Subject: [PATCH] python3-alembic: upgrade 1.12.0 -> 1.12.1

---
 .../{python3-alembic_1.12.0.bb => python3-alembic_1.12.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.12.0.bb => python3-alembic_1.12.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.12.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.12.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.12.0.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.12.1.bb
index 78b888e9f..107546dbf 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.12.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8e7645c32e4f200675e69f0745415335eb59a3663f5feb487abfa0b30c45888b"
+SRC_URI[sha256sum] = "bca5877e9678b454706347bc10b97cb7d67f300320fa5c3a94423e8266e2823f"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.39.2


--===============4638337308860830844==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-alembic-upgrade-1.12.0-1.12.1.patch"

RnJvbSBiYzI4MjBjYzE1NWI5ZGU2MmFiMDZiMGUxZTk3OWQ5ZWMzOGU1YTJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxOTo1Nzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYWxlbWJpYzogdXBncmFkZSAxLjEyLjAgLT4gMS4xMi4xCgotLS0KIC4uLi97cHl0aG9u
My1hbGVtYmljXzEuMTIuMC5iYiA9PiBweXRob24zLWFsZW1iaWNfMS4xMi4xLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWFsZW1iaWNfMS4x
Mi4wLmJiID0+IHB5dGhvbjMtYWxlbWJpY18xLjEyLjEuYmJ9ICg4MSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hbGVtYmljXzEuMTIu
MC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYWxlbWJp
Y18xLjEyLjEuYmIKc2ltaWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hbGVtYmljXzEuMTIuMC5iYgpyZW5hbWUg
dG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hbGVtYmljXzEu
MTIuMS5iYgppbmRleCA3OGI4ODhlOWYuLjEwNzU0NmRiZiAxMDA2NDQKLS0tIGEvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hbGVtYmljXzEuMTIuMC5iYgorKysg
Yi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFsZW1iaWNfMS4x
Mi4xLmJiCkBAIC00LDcgKzQsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT1lMzAyM2IwNDJjYjYwMDJjYjM5ODM0NGI1MWM2NzA5MyIKIAogaW5oZXJpdCBweXBpIHNl
dHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZTc2NDVjMzJlNGYyMDA2NzVlNjlm
MDc0NTQxNTMzNWViNTlhMzY2M2Y1ZmViNDg3YWJmYTBiMzBjNDU4ODhiIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImJjYTU4NzdlOTY3OGI0NTQ3MDYzNDdiYzEwYjk3Y2I3ZDY3ZjMwMDMyMGZhNWMz
YTk0NDIzZTgyNjZlMjgyM2YiCiAKIFBZUElfUEFDS0FHRSA9ICJhbGVtYmljIgogCi0tIAoyLjM5
LjIKCg==

--===============4638337308860830844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-alembic: PV changed from "1.12.0" to "1.12.1"
packages/core2-64-poky-linux/python3-alembic: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/alembic/alembic-1.12.0.tar.gz;downloadfilename=alembic-1.12.0.tar.gz" to "https://files.pythonhosted.org/packages/source/a/alembic/alembic-1.12.1.tar.gz;downloadfilename=alembic-1.12.1.tar.gz"
packages/core2-64-poky-linux/python3-alembic: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/python3-alembic/python3-alembic-dbg: PV changed from "1.12.0" to "1.12.1"
packages/core2-64-poky-linux/python3-alembic/python3-alembic-dbg: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/python3-alembic/python3-alembic-dev: PV changed from "1.12.0" to "1.12.1"
packages/core2-64-poky-linux/python3-alembic/python3-alembic-dev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/python3-alembic/python3-alembic-doc: PV changed from "1.12.0" to "1.12.1"
packages/core2-64-poky-linux/python3-alembic/python3-alembic-doc: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/python3-alembic/python3-alembic-locale: PV changed from "1.12.0" to "1.12.1"
packages/core2-64-poky-linux/python3-alembic/python3-alembic-locale: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/python3-alembic/python3-alembic-src: PV changed from "1.12.0" to "1.12.1"
packages/core2-64-poky-linux/python3-alembic/python3-alembic-src: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/python3-alembic/python3-alembic-staticdev: PV changed from "1.12.0" to "1.12.1"
packages/core2-64-poky-linux/python3-alembic/python3-alembic-staticdev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-64-poky-linux/python3-alembic/python3-alembic: PV changed from "1.12.0" to "1.12.1"
packages/core2-64-poky-linux/python3-alembic/python3-alembic: PKGSIZE changed from 2030279 to 2036297 (+0%)
packages/core2-64-poky-linux/python3-alembic/python3-alembic: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
Changes to packages/core2-64-poky-linux/python3-alembic (sysroot):
  /usr/lib/python3.11/site-packages/alembic-1.12.0.dist-info moved to /usr/lib/python3.11/site-packages/alembic-1.12.1.dist-info

--===============4638337308860830844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-alembic (sysroot):
  /usr/lib/python3.11/site-packages/alembic-1.12.0.dist-info moved to /usr/lib/python3.11/site-packages/alembic-1.12.1.dist-info

--===============4638337308860830844==--

