Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E783C001DB
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2281.1699061894488854594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D+WKLozl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=V9EKt+qE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b97fb1b93-9cd7d6ac-2e13-4df8-a76e-d6f1c416c8a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f0EHcpF04FZz04UCvXCLkVeo9pVHcKKPjmuYf0/qdyo=;
	b=D+WKLozlFR8Pxg6Y5xdZbuvL8539wtF7aIzKWD18p7uTpu8+QeEFiFFj5SBbt5p6
	XASFOqkVwEtfnWy7uJqnfAt84GH6HOSh1+tNDU40kv7TwjCfU78GTXxXPVl1nDxZIBH
	pmLht7M9itvmt36iHuJAN3pcQKMAsiDQ6lKY5ZJs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f0EHcpF04FZz04UCvXCLkVeo9pVHcKKPjmuYf0/qdyo=;
	b=V9EKt+qE8RdP3klHc1m7M8LH/PuNN4YQ6AJaQ43Ev2a40TfmYXvP/ajnXDNooWp9
	bStkV0HrLOwMHGGKJJimJbTse0cJiVczH+6PxCcobxVBjsyVBf102RbDfo0JB4WuF57
	Im/HVPNdqBJ1c43cIlJBFYyfYZXVKLptOanDhfjE=
Content-Type: multipart/mixed; boundary="===============1829787561747718702=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-tzlocal: upgrading to 5.2 SUCCEEDED
Message-ID: <0101018b97fb1b93-9cd7d6ac-2e13-4df8-a76e-d6f1c416c8a3-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106173

--===============1829787561747718702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-tzlocal* to *5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-tzlocal-upgrade-5.1-5.2.patch
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
From 6acac031bb05e45b1c1e4321775682a90c2a9ca7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 01:03:00 +0000
Subject: [PATCH] python3-tzlocal: upgrade 5.1 -> 5.2

---
 .../python/{python3-tzlocal_5.1.bb => python3-tzlocal_5.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_5.1.bb => python3-tzlocal_5.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_5.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-tzlocal_5.1.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_5.2.bb
index 2f69000b3..866a7a78c 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "a5ccb2365b295ed964e0a98ad076fe10c495591e75505d34f154d60a7f1ed722"
+SRC_URI[sha256sum] = "8d399205578f1a9342816409cc1e46a93ebd5755e39ea2d85334bea911bf0e6e"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.2


--===============1829787561747718702==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-tzlocal-upgrade-5.1-5.2.patch"

RnJvbSA2YWNhYzAzMWJiMDVlNDViMWMxZTQzMjE3NzU2ODJhOTBjMmE5Y2E3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMTowMzowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHpsb2NhbDogdXBncmFkZSA1LjEgLT4gNS4yCgotLS0KIC4uLi9weXRob24ve3B5dGhv
bjMtdHpsb2NhbF81LjEuYmIgPT4gcHl0aG9uMy10emxvY2FsXzUuMi5iYn0gICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXR6bG9jYWxfNS4xLmJiID0+
IHB5dGhvbjMtdHpsb2NhbF81LjIuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10emxvY2FsXzUuMS5iYiBiL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHpsb2NhbF81LjIuYmIKc2ltaWxh
cml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy10emxvY2FsXzUuMS5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10emxvY2FsXzUuMi5iYgppbmRleCAyZjY5MDAwYjMu
Ljg2NmE3YTc4YyAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy10emxvY2FsXzUuMS5iYgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXR6bG9jYWxfNS4yLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFH
RSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvdHpsb2NhbC8iCiBMSUNFTlNFID0gIk1JVCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT01N2UwYmQ2MTY0M2Q4
MWQwNTY4M2NkY2U2NWIxMWQxMCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE1Y2NiMjM2NWIy
OTVlZDk2NGUwYTk4YWQwNzZmZTEwYzQ5NTU5MWU3NTUwNWQzNGYxNTRkNjBhN2YxZWQ3MjIiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOGQzOTkyMDU1NzhmMWE5MzQyODE2NDA5Y2MxZTQ2YTkzZWJk
NTc1NWUzOWVhMmQ4NTMzNGJlYTkxMWJmMGU2ZSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1
cHRvb2xzX2J1aWxkX21ldGEKIAotLSAKMi4zOS4yCgo=

--===============1829787561747718702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-tzlocal: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/python3-tzlocal: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/python3-tzlocal: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/tzlocal/tzlocal-5.1.tar.gz;downloadfilename=tzlocal-5.1.tar.gz" to "https://files.pythonhosted.org/packages/source/t/tzlocal/tzlocal-5.2.tar.gz;downloadfilename=tzlocal-5.2.tar.gz"
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-dbg: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-dbg: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-dev: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-dev: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-doc: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-doc: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-locale: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-locale: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-src: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-src: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-staticdev: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal-staticdev: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal: FILELIST: removed "/usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/top_level.txt /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/RECORD /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/zip-safe /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/METADATA /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/WHEEL", added "/usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info/top_level.txt /usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info/RECORD /usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info/METADATA /usr/lib/python3.11/site-packages/tzlocal/py.typed /usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info/WHEEL"
packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal: PKGSIZE changed from 122072 to 113213 (-7%)
Changes to packages/core2-64-poky-linux/python3-tzlocal (sysroot):
  /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info moved to /usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info
  /usr/lib/python3.11/site-packages/tzlocal/py.typed was added
  /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/zip-safe was removed

--===============1829787561747718702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-tzlocal/python3-tzlocal: FILELIST: removed "/usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/METADATA /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/zip-safe /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/top_level.txt /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/WHEEL /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/RECORD", added "/usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info/METADATA /usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info/top_level.txt /usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info/WHEEL /usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/tzlocal/py.typed /usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info/RECORD"
Changes to packages/core2-64-poky-linux/python3-tzlocal (sysroot):
  /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info moved to /usr/lib/python3.11/site-packages/tzlocal-5.2.dist-info
  /usr/lib/python3.11/site-packages/tzlocal/py.typed was added
  /usr/lib/python3.11/site-packages/tzlocal-5.1.dist-info/zip-safe was removed

--===============1829787561747718702==--

