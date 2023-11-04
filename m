Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D7DC07D5A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.2213.1699061897582108223
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fa2HlaNq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iXLn7Gd1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b97fb1a48-75f41c40-d4ba-42a5-8f37-02027f75cf88-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cn3v276Tkix8XVZGMlH5XYhGITk5xT5TLbmdNZv5wIM=;
	b=Fa2HlaNq3sdvauGCegNzkLgVSP9l//x+RWa5tWjes4dPebSgtiFHgXs9O78nMzP7
	bhMSV17AHQKPJ02TdvuFPKZtDzHRtzUL/dmGg6Leh2+gh2FfRxB63AEioR1zUoknwpu
	XQGLSbiIbEvrDmhczoURmtdoD7txml4Uj5MgBSpM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cn3v276Tkix8XVZGMlH5XYhGITk5xT5TLbmdNZv5wIM=;
	b=iXLn7Gd1QpepEDbQIIfIhX2DdNJaaGD0K6EymKrks2uTm7AMEmlyIonaivWYNlto
	6VQAVn33eXadGeytky1naC8U9lpw/Na15QWXaS5aYyTmuQz7T57f70WJAnugDHokm42
	vrdA9awcUim+02WnU+d+6V6fcweAtMfBZE+vdfJQ=
Content-Type: multipart/mixed; boundary="===============3735300415893385231=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-tornado: upgrading to 6.3.3 SUCCEEDED
Message-ID: <0101018b97fb1a48-75f41c40-d4ba-42a5-8f37-02027f75cf88-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106168

--===============3735300415893385231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-tornado* to *6.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-tornado-upgrade-6.3-6.3.3.patch
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
From f2f0297b4b0c21e6b5e19dc3ca2b1952bb7184c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 00:50:24 +0000
Subject: [PATCH] python3-tornado: upgrade 6.3 -> 6.3.3

---
 .../python/{python3-tornado_6.3.bb => python3-tornado_6.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.3.bb => python3-tornado_6.3.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.3.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.3.3.bb
index af5009b6a..c58742296 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.3.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d68f3192936ff2c4add04dc21a436a43b4408d466746b78bb2b9d0a53a18683f"
+SRC_URI[sha256sum] = "e7d8db41c0181c80d76c982aacc442c0783a2c54d6400fe028954201a2e032fe"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============3735300415893385231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-tornado: PV changed from "6.3" to "6.3.3"
packages/core2-64-poky-linux/python3-tornado: PKGV changed from 6.3 [default] to 6.3.3 [default]
packages/core2-64-poky-linux/python3-tornado: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/tornado/tornado-6.3.tar.gz;downloadfilename=tornado-6.3.tar.gz" to "https://files.pythonhosted.org/packages/source/t/tornado/tornado-6.3.3.tar.gz;downloadfilename=tornado-6.3.3.tar.gz"
packages/core2-64-poky-linux/python3-tornado/python3-tornado-dbg: PV changed from "6.3" to "6.3.3"
packages/core2-64-poky-linux/python3-tornado/python3-tornado-dbg: PKGV changed from 6.3 [default] to 6.3.3 [default]
packages/core2-64-poky-linux/python3-tornado/python3-tornado-dbg: PKGSIZE changed from 9056 to 9064 (+0%)
packages/core2-64-poky-linux/python3-tornado/python3-tornado-dev: PV changed from "6.3" to "6.3.3"
packages/core2-64-poky-linux/python3-tornado/python3-tornado-dev: PKGV changed from 6.3 [default] to 6.3.3 [default]
packages/core2-64-poky-linux/python3-tornado/python3-tornado-doc: PV changed from "6.3" to "6.3.3"
packages/core2-64-poky-linux/python3-tornado/python3-tornado-doc: PKGV changed from 6.3 [default] to 6.3.3 [default]
packages/core2-64-poky-linux/python3-tornado/python3-tornado-locale: PV changed from "6.3" to "6.3.3"
packages/core2-64-poky-linux/python3-tornado/python3-tornado-locale: PKGV changed from 6.3 [default] to 6.3.3 [default]
packages/core2-64-poky-linux/python3-tornado/python3-tornado-src: PV changed from "6.3" to "6.3.3"
packages/core2-64-poky-linux/python3-tornado/python3-tornado-src: PKGV changed from 6.3 [default] to 6.3.3 [default]
packages/core2-64-poky-linux/python3-tornado/python3-tornado-staticdev: PV changed from "6.3" to "6.3.3"
packages/core2-64-poky-linux/python3-tornado/python3-tornado-staticdev: PKGV changed from 6.3 [default] to 6.3.3 [default]
packages/core2-64-poky-linux/python3-tornado/python3-tornado-test: PV changed from "6.3" to "6.3.3"
packages/core2-64-poky-linux/python3-tornado/python3-tornado-test: PKGV changed from 6.3 [default] to 6.3.3 [default]
packages/core2-64-poky-linux/python3-tornado/python3-tornado-test: PKGSIZE changed from 1833751 to 1844963 (+1%)
packages/core2-64-poky-linux/python3-tornado/python3-tornado: PV changed from "6.3" to "6.3.3"
packages/core2-64-poky-linux/python3-tornado/python3-tornado: PKGV changed from 6.3 [default] to 6.3.3 [default]
packages/core2-64-poky-linux/python3-tornado/python3-tornado: PKGSIZE changed from 2069578 to 2073580 (+0%)
Changes to packages/core2-64-poky-linux/python3-tornado (sysroot):
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info was added
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info was removed
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info/WHEEL was removed

--===============3735300415893385231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-tornado (sysroot):
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info was added
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/tornado-6.3.3.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info was removed
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/tornado-6.3.dist-info/WHEEL was removed

--===============3735300415893385231==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-tornado-upgrade-6.3-6.3.3.patch"

RnJvbSBmMmYwMjk3YjRiMGMyMWU2YjVlMTlkYzNjYTJiMTk1MmJiNzE4NGMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMDo1MDoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdG9ybmFkbzogdXBncmFkZSA2LjMgLT4gNi4zLjMKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy10b3JuYWRvXzYuMy5iYiA9PiBweXRob24zLXRvcm5hZG9fNi4zLjMuYmJ9IHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdG9ybmFkb182LjMuYmIg
PT4gcHl0aG9uMy10b3JuYWRvXzYuMy4zLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdG9ybmFkb182LjMuYmIgYi9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRvcm5hZG9fNi4zLjMuYmIK
c2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy10b3JuYWRvXzYuMy5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10b3JuYWRvXzYuMy4zLmJiCmluZGV4IGFm
NTAwOWI2YS4uYzU4NzQyMjk2IDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXRvcm5hZG9fNi4zLmJiCisrKyBiL21ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdG9ybmFkb182LjMuMy5iYgpAQCAtNiw3ICs2LDcg
QEAgSE9NRVBBR0UgPSAiaHR0cDovL3d3dy50b3JuYWRvd2ViLm9yZy9lbi9zdGFibGUvIgogTElD
RU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJkNjhmMzE5MjkzNmZmMmM0YWRkMDRkYzIxYTQzNmE0M2I0NDA4ZDQ2Njc0NmI3OGJiMmI5
ZDBhNTNhMTg2ODNmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU3ZDhkYjQxYzAxODFjODBkNzZj
OTgyYWFjYzQ0MmMwNzgzYTJjNTRkNjQwMGZlMDI4OTU0MjAxYTJlMDMyZmUiCiAKIGluaGVyaXQg
cHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5LjIKCg==

--===============3735300415893385231==--

