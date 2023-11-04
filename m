Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9C7C05032
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2295.1699061897352205054
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Xot3AGl7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SFQFbK69;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b97fb1608-57533735-4814-445f-8277-0de9ed9ce3c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ve1z9bqt6U32hzwYlRC3SXn+oIpUdxcuxx1aR75doY8=;
	b=Xot3AGl70tMKxyMUaWYe7/lr1LbvPtddDioM2BmwxgaX9pFVrzu483VXfr3U8pqN
	uXIAfF+UrnqQprwLVCzU7QtxszZ514JhAz73uVv6acV3IBQN46UHdTtTz5X4jnRiX+3
	1kwvogyW+kxeoAgpyT5/tuPv6r8Xwsq6FywmICCU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ve1z9bqt6U32hzwYlRC3SXn+oIpUdxcuxx1aR75doY8=;
	b=SFQFbK69Z/i9cJwAaJHNy9BhHyNmocGPGzkKzHD92v9LN7+UTEghx04ABEhyHnje
	9Bt7YVNA8zWoz1JjH3EyyHQUStmQDitd5q13+WJxsvI6e77OmAnVH7lH9pK3GPoR7FM
	BPkQykefCY71eCM3/FpGCxoJqGCPu8mgPhzEMnLg=
Content-Type: multipart/mixed; boundary="===============6918856419150802024=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pyhamcrest: upgrading to 2.1.0 SUCCEEDED
Message-ID: <0101018b97fb1608-57533735-4814-445f-8277-0de9ed9ce3c8-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106152

--===============6918856419150802024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyhamcrest* to *2.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyhamcrest-upgrade-2.0.4-2.1.0.patch
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
From dba844598ef0d15cc3d2bf936e79c6269a9bed90 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 23:37:57 +0000
Subject: [PATCH] python3-pyhamcrest: upgrade 2.0.4 -> 2.1.0

---
 ...{python3-pyhamcrest_2.0.4.bb => python3-pyhamcrest_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyhamcrest_2.0.4.bb => python3-pyhamcrest_2.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.4.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
index 4ee84531e..bfa4e0a69 100644
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hamcrest/PyHamcrest"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=79391bf1501c898472d043f36e960612"
 
-SRC_URI[sha256sum] = "b5d9ce6b977696286cf232ce2adf8969b4d0b045975b0936ac9005e84e67e9c1"
+SRC_URI[sha256sum] = "c6acbec0923d0cb7e72c22af1926f3e7c97b8e8d69fc7498eabacaf7c975bd9c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.2


--===============6918856419150802024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyhamcrest: PKGV changed from 2.0.4 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-pyhamcrest: PV changed from "2.0.4" to "2.1.0"
packages/core2-64-poky-linux/python3-pyhamcrest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyhamcrest/pyhamcrest-2.0.4.tar.gz;downloadfilename=pyhamcrest-2.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyhamcrest/pyhamcrest-2.1.0.tar.gz;downloadfilename=pyhamcrest-2.1.0.tar.gz"
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-dbg: PKGV changed from 2.0.4 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-dbg: PV changed from "2.0.4" to "2.1.0"
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-dev: PKGV changed from 2.0.4 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-dev: PV changed from "2.0.4" to "2.1.0"
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-doc: PKGV changed from 2.0.4 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-doc: PV changed from "2.0.4" to "2.1.0"
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-locale: PKGV changed from 2.0.4 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-locale: PV changed from "2.0.4" to "2.1.0"
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-src: PKGV changed from 2.0.4 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-src: PV changed from "2.0.4" to "2.1.0"
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-staticdev: PKGV changed from 2.0.4 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest-staticdev: PV changed from "2.0.4" to "2.1.0"
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest: PKGV changed from 2.0.4 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest: PV changed from "2.0.4" to "2.1.0"
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest: PKGSIZE changed from 289869 to 302024 (+4%)
packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pyhamcrest-2.0.4.dist-info/licenses -> /usr/lib/python3.11/site-packages/pyhamcrest-2.1.0.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/pyhamcrest-2.0.4.dist-info -> /usr/lib/python3.11/site-packages/pyhamcrest-2.1.0.dist-info, added "/usr/lib/python3.11/site-packages/hamcrest/core/core/future.py /usr/lib/python3.11/site-packages/hamcrest/core/core/__pycache__/future.cpython-311.pyc"
Changes to packages/core2-64-poky-linux/python3-pyhamcrest (sysroot):
  /usr/lib/python3.11/site-packages/pyhamcrest-2.0.4.dist-info moved to /usr/lib/python3.11/site-packages/pyhamcrest-2.1.0.dist-info
  /usr/lib/python3.11/site-packages/hamcrest/core/core/future.py was added
  /usr/lib/python3.11/site-packages/hamcrest/core/core/__pycache__/future.cpython-311.pyc was added

--===============6918856419150802024==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyhamcrest-upgrade-2.0.4-2.1.0.patch"

RnJvbSBkYmE4NDQ1OThlZjBkMTVjYzNkMmJmOTM2ZTc5YzYyNjlhOWJlZDkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMzozNzo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHloYW1jcmVzdDogdXBncmFkZSAyLjAuNCAtPiAyLjEuMAoKLS0tCiAuLi57cHl0aG9u
My1weWhhbWNyZXN0XzIuMC40LmJiID0+IHB5dGhvbjMtcHloYW1jcmVzdF8yLjEuMC5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWhhbWNyZXN0
XzIuMC40LmJiID0+IHB5dGhvbjMtcHloYW1jcmVzdF8yLjEuMC5iYn0gKDg0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5aGFtY3Jl
c3RfMi4wLjQuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5aGFtY3Jlc3RfMi4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NCUKcmVuYW1lIGZyb20gbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWhhbWNyZXN0XzIuMC40
LmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5aGFtY3Jlc3RfMi4xLjAuYmIKaW5kZXggNGVlODQ1MzFlLi5iZmE0ZTBhNjkgMTAwNjQ0Ci0t
LSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHloYW1jcmVz
dF8yLjAuNC5iYgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5aGFtY3Jlc3RfMi4xLjAuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9oYW1jcmVzdC9QeUhhbWNyZXN0IgogTElDRU5TRSA9ICJCU0QtMy1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NzkzOTFiZjE1
MDFjODk4NDcyZDA0M2YzNmU5NjA2MTIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiNWQ5Y2U2
Yjk3NzY5NjI4NmNmMjMyY2UyYWRmODk2OWI0ZDBiMDQ1OTc1YjA5MzZhYzkwMDVlODRlNjdlOWMx
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImM2YWNiZWMwOTIzZDBjYjdlNzJjMjJhZjE5MjZmM2U3
Yzk3YjhlOGQ2OWZjNzQ5OGVhYmFjYWY3Yzk3NWJkOWMiCiAKIGluaGVyaXQgcHlwaSBweXRob25f
c2V0dXB0b29sc19idWlsZF9tZXRhCiAKLS0gCjIuMzkuMgoK

--===============6918856419150802024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pyhamcrest/python3-pyhamcrest: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pyhamcrest-2.0.4.dist-info -> /usr/lib/python3.11/site-packages/pyhamcrest-2.1.0.dist-info, directory renamed /usr/lib/python3.11/site-packages/pyhamcrest-2.0.4.dist-info/licenses -> /usr/lib/python3.11/site-packages/pyhamcrest-2.1.0.dist-info/licenses, added "/usr/lib/python3.11/site-packages/hamcrest/core/core/future.py /usr/lib/python3.11/site-packages/hamcrest/core/core/__pycache__/future.cpython-311.pyc"
Changes to packages/core2-64-poky-linux/python3-pyhamcrest (sysroot):
  /usr/lib/python3.11/site-packages/pyhamcrest-2.0.4.dist-info moved to /usr/lib/python3.11/site-packages/pyhamcrest-2.1.0.dist-info
  /usr/lib/python3.11/site-packages/hamcrest/core/core/future.py was added
  /usr/lib/python3.11/site-packages/hamcrest/core/core/__pycache__/future.cpython-311.pyc was added

--===============6918856419150802024==--

