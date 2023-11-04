Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B25C169C2
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.2284.1699061894839557639
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JI1AjRBz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TLb2laZH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b97fb0b77-9121c6f4-c273-4090-ae32-541bea6f16ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kS+2WXxu08VjVQCnUzWmQY5/CI0Ncv8zpHxWj49y1CI=;
	b=JI1AjRBzOStukvX7oUsjvmrsPMZWvYUo7TTiz4Insc73l4Z+Tz+dVyBKCu5w35nj
	ved31WSNS6RLt74mlgASYN0jBAZzXF1WvvHdsRkhfMswbktr7zIoc4Y/FaIQd1cNZ2+
	iwhecUQKbr2VQuTFrLzfuSnuKR+82/9l9CF0h0qY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kS+2WXxu08VjVQCnUzWmQY5/CI0Ncv8zpHxWj49y1CI=;
	b=TLb2laZHPY0SNEmUvGKguxBEV3Vj8Z+lEXRadS5aqfNfdwk7pGrPIzEGqMbN2yCu
	QwxXolPWe9rhdjZ9ryJ9kW/GGU88AEmY7wPrJxu9d2LFgdYQCP379IAakDGdX15tytR
	RcNvqqERiquDyY7EJvajUJTJkmNpsNgofPGLOPjA=
Content-Type: multipart/mixed; boundary="===============5228055593389806630=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-eth-account: upgrading to 0.10.0 SUCCEEDED
Message-ID: <0101018b97fb0b77-9121c6f4-c273-4090-ae32-541bea6f16ee-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106109

--===============5228055593389806630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-eth-account* to *0.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-eth-account-upgrade-0.9.0-0.10.0.patch
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
From a11c34fb2678307ef785369a715b59c2581d060e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:51:17 +0000
Subject: [PATCH] python3-eth-account: upgrade 0.9.0 -> 0.10.0

---
 ...thon3-eth-account_0.9.0.bb => python3-eth-account_0.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-account_0.9.0.bb => python3-eth-account_0.10.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.10.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-account_0.10.0.bb
index e33b7679c..1854e3bca 100644
--- a/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.10.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=16ffc86adf4293d4cfb204e77d62cfe6"
 
-SRC_URI[sha256sum] = "5f66ecb7bc52569924dfaf4a9add501b1c2a4901eec74e3c0598cd26d0971777"
+SRC_URI[sha256sum] = "474a2fccf7286230cf66502565f03b536921d7e1fdfceba198e42160e5ac4bc1"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============5228055593389806630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-eth-account: PV changed from "0.9.0" to "0.10.0"
packages/core2-64-poky-linux/python3-eth-account: SRC_URI changed from "https://files.pythonhosted.org/packages/source/e/eth-account/eth-account-0.9.0.tar.gz;downloadfilename=eth-account-0.9.0.tar.gz" to "https://files.pythonhosted.org/packages/source/e/eth-account/eth-account-0.10.0.tar.gz;downloadfilename=eth-account-0.10.0.tar.gz"
packages/core2-64-poky-linux/python3-eth-account: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-dbg: PV changed from "0.9.0" to "0.10.0"
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-dbg: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-dev: PV changed from "0.9.0" to "0.10.0"
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-dev: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-doc: PV changed from "0.9.0" to "0.10.0"
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-doc: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-locale: PV changed from "0.9.0" to "0.10.0"
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-locale: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-src: PV changed from "0.9.0" to "0.10.0"
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-src: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-staticdev: PV changed from "0.9.0" to "0.10.0"
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account-staticdev: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account: PV changed from "0.9.0" to "0.10.0"
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account: PKGSIZE changed from 431820 to 492974 (+14%)
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account: FILELIST: directory renamed /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info -> /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info, added "/usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/encoding_and_hashing.py /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/helpers.cpython-311.pyc /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/encoding_and_hashing.cpython-311.pyc /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__init__.py /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/helpers.py"
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
Changes to packages/core2-64-poky-linux/python3-eth-account (sysroot):
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info was added
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/encoding_and_hashing.py was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/helpers.py was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__init__.py was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__ was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/encoding_and_hashing.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/helpers.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info was removed
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info/WHEEL was removed

--===============5228055593389806630==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-eth-account-upgrade-0.9.0-0.10.0.patch"

RnJvbSBhMTFjMzRmYjI2NzgzMDdlZjc4NTM2OWE3MTViNTljMjU4MWQwNjBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDo1MToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZXRoLWFjY291bnQ6IHVwZ3JhZGUgMC45LjAgLT4gMC4xMC4wCgotLS0KIC4uLnRob24z
LWV0aC1hY2NvdW50XzAuOS4wLmJiID0+IHB5dGhvbjMtZXRoLWFjY291bnRfMC4xMC4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWV0aC1hY2Nv
dW50XzAuOS4wLmJiID0+IHB5dGhvbjMtZXRoLWFjY291bnRfMC4xMC4wLmJifSAoODMlKQoKZGlm
ZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZXRo
LWFjY291bnRfMC45LjAuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWV0aC1hY2NvdW50XzAuMTAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUg
ZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWV0aC1hY2Nv
dW50XzAuOS4wLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWV0aC1hY2NvdW50XzAuMTAuMC5iYgppbmRleCBlMzNiNzY3OWMuLjE4NTRlM2Jj
YSAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1ldGgtYWNjb3VudF8wLjkuMC5iYgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWV0aC1hY2NvdW50XzAuMTAuMC5iYgpAQCAtNCw3ICs0LDcgQEAgU0VD
VElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTE2ZmZjODZhZGY0MjkzZDRjZmIyMDRlNzdkNjJjZmU2Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWY2NmVjYjdiYzUyNTY5OTI0ZGZhZjRhOWFkZDUwMWIx
YzJhNDkwMWVlYzc0ZTNjMDU5OGNkMjZkMDk3MTc3NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0
NzRhMmZjY2Y3Mjg2MjMwY2Y2NjUwMjU2NWYwM2I1MzY5MjFkN2UxZmRmY2ViYTE5OGU0MjE2MGU1
YWM0YmMxIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAKMi4zOS4yCgo=

--===============5228055593389806630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-eth-account/python3-eth-account: FILELIST: directory renamed /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info -> /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info, added "/usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__init__.py /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/encoding_and_hashing.cpython-311.pyc /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/helpers.cpython-311.pyc /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/encoding_and_hashing.py /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/helpers.py"
packages/core2-64-poky-linux/python3-eth-account/python3-eth-account: PKGSIZE changed from 431820 to 492974 (+14%)
Changes to packages/core2-64-poky-linux/python3-eth-account (sysroot):
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info was added
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/eth_account-0.10.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/encoding_and_hashing.py was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/helpers.py was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__init__.py was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__ was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/encoding_and_hashing.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/helpers.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/eth_account/_utils/encode_typed_data/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info was removed
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/eth_account-0.9.0.dist-info/WHEEL was removed

--===============5228055593389806630==--

