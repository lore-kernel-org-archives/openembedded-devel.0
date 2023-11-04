Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392E9C05031
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.2206.1699061895005349776
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EdTrgRQb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Gn1lzWxN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b97fb178e-633ff341-834e-461a-bda3-11a5fa62046c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AOANWiUEt+Z5IKKcG75Gns0GRsY3BkrPD4QWGhy3LKU=;
	b=EdTrgRQbUSIstKaEQhl5AwOsl+Z4K7u1hQaAHheXDTZhbkyhNZ2nBa0dVmtE33+1
	oLMN1F3WjQoHXdDxIbhMX6FxAYgESeuZJct5FwzJKhjFPUPuircM3Jwdhcxh0QUGmuj
	Zqodtaa46NVOI3WlGto6ujkced6Orru+c9VmTkgw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AOANWiUEt+Z5IKKcG75Gns0GRsY3BkrPD4QWGhy3LKU=;
	b=Gn1lzWxN9kmL8umA8CLdlpyVs9vdKp0fSs2xGz3RDWDY3oCv1k37s90v1pXH3dlz
	SlLpQDQPGgBQEd4mpKCdfhT/fxwqg+OcSmHsSnV7E39Jafr0gNrHlSBEOYXQ5GTIwW8
	w9UZ5UJCi1FL0bh+QdDZooX52/Mgw0OREAvcoMZs=
Content-Type: multipart/mixed; boundary="===============2421425128874593074=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pytest-asyncio: upgrading to 0.22.0 SUCCEEDED
Message-ID: <0101018b97fb178e-633ff341-834e-461a-bda3-11a5fa62046c-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106157

--===============2421425128874593074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest-asyncio* to *0.22.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-asyncio-upgrade-0.21.1-0.22.0.patch
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
From a8ac65ad5b010c421930ee5aab2919080853c00f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 00:09:53 +0000
Subject: [PATCH] python3-pytest-asyncio: upgrade 0.21.1 -> 0.22.0

---
 ...ytest-asyncio_0.21.1.bb => python3-pytest-asyncio_0.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.21.1.bb => python3-pytest-asyncio_0.22.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.1.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.22.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.22.0.bb
index c96c0e080..8fa77ac05 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.22.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python,
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "40a7eae6dded22c7b604986855ea48400ab15b069ae38116e8c01238e9eeb64d"
+SRC_URI[sha256sum] = "01da1bf94ff0b969cc8d760104f7c1011903d0d658bdaef0bbae769660a7fbc4"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.2


--===============2421425128874593074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pytest-asyncio: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest-asyncio/pytest-asyncio-0.21.1.tar.gz;downloadfilename=pytest-asyncio-0.21.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest-asyncio/pytest-asyncio-0.22.0.tar.gz;downloadfilename=pytest-asyncio-0.22.0.tar.gz"
packages/core2-64-poky-linux/python3-pytest-asyncio: PV changed from "0.21.1" to "0.22.0"
packages/core2-64-poky-linux/python3-pytest-asyncio: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-dbg: PV changed from "0.21.1" to "0.22.0"
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-dbg: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-dev: PV changed from "0.21.1" to "0.22.0"
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-dev: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-doc: PV changed from "0.21.1" to "0.22.0"
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-doc: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-locale: PV changed from "0.21.1" to "0.22.0"
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-locale: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-src: PV changed from "0.21.1" to "0.22.0"
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-src: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-staticdev: PV changed from "0.21.1" to "0.22.0"
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio-staticdev: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio: PV changed from "0.21.1" to "0.22.0"
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio: PKGSIZE changed from 64685 to 90851 (+40%)
packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio: PKGV changed from 0.21.1 [default] to 0.22.0 [default]
Changes to packages/core2-64-poky-linux/python3-pytest-asyncio (sysroot):
  /usr/lib/python3.11/site-packages/pytest_asyncio-0.21.1.dist-info moved to /usr/lib/python3.11/site-packages/pytest_asyncio-0.22.0.dist-info

--===============2421425128874593074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pytest-asyncio/python3-pytest-asyncio: PKGSIZE changed from 64685 to 90851 (+40%)
Changes to packages/core2-64-poky-linux/python3-pytest-asyncio (sysroot):
  /usr/lib/python3.11/site-packages/pytest_asyncio-0.21.1.dist-info moved to /usr/lib/python3.11/site-packages/pytest_asyncio-0.22.0.dist-info

--===============2421425128874593074==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-asyncio-upgrade-0.21.1-0.22.0.patch"

RnJvbSBhOGFjNjVhZDViMDEwYzQyMTkzMGVlNWFhYjI5MTkwODA4NTNjMDBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMDowOTo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ZXN0LWFzeW5jaW86IHVwZ3JhZGUgMC4yMS4xIC0+IDAuMjIuMAoKLS0tCiAuLi55
dGVzdC1hc3luY2lvXzAuMjEuMS5iYiA9PiBweXRob24zLXB5dGVzdC1hc3luY2lvXzAuMjIuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weXRl
c3QtYXN5bmNpb18wLjIxLjEuYmIgPT4gcHl0aG9uMy1weXRlc3QtYXN5bmNpb18wLjIyLjAuYmJ9
ICg4MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weXRlc3QtYXN5bmNpb18wLjIxLjEuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdC1hc3luY2lvXzAuMjIuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5dGVzdC1hc3luY2lvXzAuMjEuMS5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3QtYXN5bmNpb18wLjIyLjAuYmIK
aW5kZXggYzk2YzBlMDgwLi44ZmE3N2FjMDUgMTAwNjQ0Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0LWFzeW5jaW9fMC4yMS4xLmJiCisrKyBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0LWFzeW5j
aW9fMC4yMi4wLmJiCkBAIC0zLDcgKzMsNyBAQCBERVNDUklQVElPTiA9ICJweXRlc3QtYXN5bmNp
byBpcyBhbiBBcGFjaGUyIGxpY2Vuc2VkIGxpYnJhcnksIHdyaXR0ZW4gaW4gUHl0aG9uLAogTElD
RU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9MTM2ZTRmNDlkYmYyOTk0MmM1NzJhM2E4ZjZlODhhNzciCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI0MGE3ZWFlNmRkZWQyMmM3YjYwNDk4Njg1NWVhNDg0MDBhYjE1YjA2OWFlMzgxMTZlOGMw
MTIzOGU5ZWViNjRkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAxZGExYmY5NGZmMGI5NjljYzhk
NzYwMTA0ZjdjMTAxMTkwM2QwZDY1OGJkYWVmMGJiYWU3Njk2NjBhN2ZiYzQiCiAKIGluaGVyaXQg
cHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLS0gCjIuMzkuMgoK

--===============2421425128874593074==--

