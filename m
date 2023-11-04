Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F72C10F14
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2283.1699061894758132512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PCCy/w/A;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WDGYr+14;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b97fb0b2d-555a1298-74da-4a41-a80f-5a4608d8cac6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G21JrGZaD2m8G2/xOtZzFEm6yuXTcdfSAoYw8igjlY0=;
	b=PCCy/w/AEHQxbi1j3zWgnVTwhL9Wefk+yhjMC2CsJQvzEeV6m4cD77EObVGZSgq8
	YD8pL+IPb7grOXTubKnfPqz6/ViYZ8gbhNdqPd+3QeOWmGS0Mj1nYUuEYDKn0UygEmc
	wW30g1yJ5Pu+QwkgxOrXYwuHLkNPVXlDDRq4tFXE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G21JrGZaD2m8G2/xOtZzFEm6yuXTcdfSAoYw8igjlY0=;
	b=WDGYr+14bXDjhXfOtBl9+twHkrhTjtL8GH3YWfoeL5NWCohBgaeuxNeGwgUlb7de
	5xrUXP8X0GqMfd/kHJJHqC2HpQczgpSbW0JmEVzXSVB0dn7/hxsfwnuCKqr8SehrCHd
	Xcs0dnFKCk9uE3hhYlmIpGNdvqpUniW2Hju5qlw0=
Content-Type: multipart/mixed; boundary="===============5524351240418041769=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-email-validator: upgrading to 2.1.0 SUCCEEDED
Message-ID: <0101018b97fb0b2d-555a1298-74da-4a41-a80f-5a4608d8cac6-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106107

--===============5524351240418041769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-email-validator* to *2.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-email-validator-upgrade-2.0.0-2.1.0.patch
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
From 6a1ac0a6bbcd69ea5f3119398210fd3fde1a1cb4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:47:49 +0000
Subject: [PATCH] python3-email-validator: upgrade 2.0.0 -> 2.1.0

---
 ...mail-validator_2.0.0.bb => python3-email-validator_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-email-validator_2.0.0.bb => python3-email-validator_2.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_2.0.0.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-email-validator_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-email-validator_2.1.0.bb
index 74e08b82c..7daf548cb 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.1.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
 
-SRC_URI[sha256sum] = "f4904f4145c11f8de5897afbb8d7db4b465c57f13db1c8c106c16d02bceebd9a"
+SRC_URI[sha256sum] = "5f511cca8856bb03251d6292ba59e7f98978aae13fa5823ddd8bf885c56a6260"
 
 PYPI_PACKAGE = "email_validator"
 
-- 
2.39.2


--===============5524351240418041769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-email-validator: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-email-validator: SRC_URI changed from "https://files.pythonhosted.org/packages/source/e/email_validator/email_validator-2.0.0.tar.gz;downloadfilename=email_validator-2.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/e/email_validator/email_validator-2.1.0.tar.gz;downloadfilename=email_validator-2.1.0.tar.gz"
packages/core2-64-poky-linux/python3-email-validator: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-dbg: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-dbg: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-dev: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-dev: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-doc: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-doc: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-locale: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-locale: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-src: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-src: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-staticdev: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator-staticdev: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator: FILELIST: directory renamed /usr/lib/python3.11/site-packages/email_validator-2.0.0.dist-info -> /usr/lib/python3.11/site-packages/email_validator-2.1.0.dist-info, added "/usr/lib/python3.11/site-packages/email_validator/py.typed /usr/lib/python3.11/site-packages/email_validator/__pycache__/version.cpython-311.pyc /usr/lib/python3.11/site-packages/email_validator/version.py"
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator: PV changed from "2.0.0" to "2.1.0"
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator: PKGSIZE changed from 127928 to 130981 (+2%)
packages/core2-64-poky-linux/python3-email-validator/python3-email-validator: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
Changes to packages/core2-64-poky-linux/python3-email-validator (sysroot):
  /usr/lib/python3.11/site-packages/email_validator-2.0.0.dist-info moved to /usr/lib/python3.11/site-packages/email_validator-2.1.0.dist-info
  /usr/lib/python3.11/site-packages/email_validator/__pycache__/version.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/email_validator/py.typed was added
  /usr/lib/python3.11/site-packages/email_validator/version.py was added

--===============5524351240418041769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-email-validator/python3-email-validator: FILELIST: directory renamed /usr/lib/python3.11/site-packages/email_validator-2.0.0.dist-info -> /usr/lib/python3.11/site-packages/email_validator-2.1.0.dist-info, added "/usr/lib/python3.11/site-packages/email_validator/__pycache__/version.cpython-311.pyc /usr/lib/python3.11/site-packages/email_validator/py.typed /usr/lib/python3.11/site-packages/email_validator/version.py"
Changes to packages/core2-64-poky-linux/python3-email-validator (sysroot):
  /usr/lib/python3.11/site-packages/email_validator-2.0.0.dist-info moved to /usr/lib/python3.11/site-packages/email_validator-2.1.0.dist-info
  /usr/lib/python3.11/site-packages/email_validator/__pycache__/version.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/email_validator/py.typed was added
  /usr/lib/python3.11/site-packages/email_validator/version.py was added

--===============5524351240418041769==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-email-validator-upgrade-2.0.0-2.1.0.patch"

RnJvbSA2YTFhYzBhNmJiY2Q2OWVhNWYzMTE5Mzk4MjEwZmQzZmRlMWExY2I0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDo0Nzo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZW1haWwtdmFsaWRhdG9yOiB1cGdyYWRlIDIuMC4wIC0+IDIuMS4wCgotLS0KIC4uLm1h
aWwtdmFsaWRhdG9yXzIuMC4wLmJiID0+IHB5dGhvbjMtZW1haWwtdmFsaWRhdG9yXzIuMS4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWVtYWls
LXZhbGlkYXRvcl8yLjAuMC5iYiA9PiBweXRob24zLWVtYWlsLXZhbGlkYXRvcl8yLjEuMC5iYn0g
KDc4JSkKCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWVtYWlsLXZhbGlkYXRvcl8yLjAuMC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtZW1haWwtdmFsaWRhdG9yXzIuMS4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggNzglCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZW1haWwtdmFsaWRhdG9yXzIuMC4wLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWVtYWlsLXZhbGlkYXRvcl8yLjEuMC5iYgpp
bmRleCA3NGUwOGI4MmMuLjdkYWY1NDhjYiAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1lbWFpbC12YWxpZGF0b3JfMi4wLjAuYmIKKysrIGIv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1lbWFpbC12YWxpZGF0
b3JfMi4xLjAuYmIKQEAgLTMsNyArMyw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElD
RU5TRSA9ICJDQzAtMS4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
NjVkMzYxNjg1MmRiZjdiMWE2ZDRiNTNiMDA2MjYwMzIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJmNDkwNGY0MTQ1YzExZjhkZTU4OTdhZmJiOGQ3ZGI0YjQ2NWM1N2YxM2RiMWM4YzEwNmMxNmQw
MmJjZWViZDlhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVmNTExY2NhODg1NmJiMDMyNTFkNjI5
MmJhNTllN2Y5ODk3OGFhZTEzZmE1ODIzZGRkOGJmODg1YzU2YTYyNjAiCiAKIFBZUElfUEFDS0FH
RSA9ICJlbWFpbF92YWxpZGF0b3IiCiAKLS0gCjIuMzkuMgoK

--===============5524351240418041769==--

