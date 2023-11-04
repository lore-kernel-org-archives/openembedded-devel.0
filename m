Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29119C05020
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.2213.1699061897582108223
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bWRAo0M6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=avtUzWlW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b97fb1758-08ab3099-3440-4056-90b6-d7eddace65ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uqPTZPr0wtnRTYGCP8YcPTPD1dcl8AEIFqaA1+vgFq0=;
	b=bWRAo0M6rDcFqJFT4FrfBUWBwP68A0SdbxEmwn3/Kmo7vxbUlDwjtXwu3sNtHNt+
	+spwrzaFns0CCn2Q20QpglXYstzDlHuudAU5FCJhV7zOdPVmx3of4UeXJsr94d4KBJv
	wvB18hUvyvUaxmyhtIG5VJEVNonoB7RCLxiU8C7c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uqPTZPr0wtnRTYGCP8YcPTPD1dcl8AEIFqaA1+vgFq0=;
	b=avtUzWlWWv1Et+uVGxF9fv9G/eYH9/4kcs4HXPvmoLXZa6asm19DeW+Nf6EJHx8x
	XJq3ZdHDhckeWloP/379rHDxDk2Vqmq/gdFnsnV3rsFdFozTHo2aFtsXF7C0WP4OBQY
	KuPq/OwysHooGhsU2W1Am+yLbTXpygonSPCnkI8o=
Content-Type: multipart/mixed; boundary="===============7247701487726782121=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pyperf: upgrading to 2.6.2 SUCCEEDED
Message-ID: <0101018b97fb1758-08ab3099-3440-4056-90b6-d7eddace65ec-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106159

--===============7247701487726782121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyperf* to *2.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyperf-upgrade-2.6.1-2.6.2.patch
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
From 57dbc31ec0ae7d1ccb29b6b87f2399dc02c456b2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 00:05:59 +0000
Subject: [PATCH] python3-pyperf: upgrade 2.6.1 -> 2.6.2

---
 .../python/{python3-pyperf_2.6.1.bb => python3-pyperf_2.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.6.1.bb => python3-pyperf_2.6.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.6.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.6.2.bb
index c63e75cf2..3f284f245 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.6.2.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "171aea69b8efde61210e512166d8764e7765a9c7678b768052174b01f349f247"
+SRC_URI[sha256sum] = "64d8fadce6a74f478f29832c1eaa2a04856655ebff17292d5237fc8317c3a3c5"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
-- 
2.39.2


--===============7247701487726782121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyperf: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/python3-pyperf: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyperf/pyperf-2.6.1.tar.gz;downloadfilename=pyperf-2.6.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyperf/pyperf-2.6.2.tar.gz;downloadfilename=pyperf-2.6.2.tar.gz"
packages/core2-64-poky-linux/python3-pyperf: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-dbg: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-dbg: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-dev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-dev: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-doc: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-doc: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-locale: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-locale: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-src: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-src: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-staticdev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf-staticdev: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/python3-pyperf/python3-pyperf: PKGSIZE changed from 1212296 to 1212742 (+0%)
Changes to packages/core2-64-poky-linux/python3-pyperf (sysroot):
  /usr/lib/python3.11/site-packages/pyperf-2.6.1.dist-info moved to /usr/lib/python3.11/site-packages/pyperf-2.6.2.dist-info

--===============7247701487726782121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyperf (sysroot):
  /usr/lib/python3.11/site-packages/pyperf-2.6.1.dist-info moved to /usr/lib/python3.11/site-packages/pyperf-2.6.2.dist-info

--===============7247701487726782121==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyperf-upgrade-2.6.1-2.6.2.patch"

RnJvbSA1N2RiYzMxZWMwYWU3ZDFjY2IyOWI2Yjg3ZjIzOTlkYzAyYzQ1NmIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMDowNTo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlwZXJmOiB1cGdyYWRlIDIuNi4xIC0+IDIuNi4yCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHlwZXJmXzIuNi4xLmJiID0+IHB5dGhvbjMtcHlwZXJmXzIuNi4yLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5cGVyZl8yLjYuMS5i
YiA9PiBweXRob24zLXB5cGVyZl8yLjYuMi5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cGVyZl8yLjYuMS5iYiBiL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwZXJmXzIuNi4yLmJi
CnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwZXJmXzIuNi4xLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cGVyZl8yLjYuMi5iYgppbmRleCBj
NjNlNzVjZjIuLjNmMjg0ZjI0NSAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1weXBlcmZfMi42LjEuYmIKKysrIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXBlcmZfMi42LjIuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgRmVhdHVyZXM6IFwKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NzhiYzJlNmU4N2M4YzYxMjcyOTM3Yjg3OWU2ZGMyZjgiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIxNzFhZWE2OWI4ZWZkZTYxMjEwZTUxMjE2NmQ4NzY0ZTc3NjVh
OWM3Njc4Yjc2ODA1MjE3NGIwMWYzNDlmMjQ3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY0ZDhm
YWRjZTZhNzRmNDc4ZjI5ODMyYzFlYWEyYTA0ODU2NjU1ZWJmZjE3MjkyZDUyMzdmYzgzMTdjM2Ez
YzUiCiAKIERFUEVORFMgKz0gIiR7UFlUSE9OX1BOfS1zaXgtbmF0aXZlIgogCi0tIAoyLjM5LjIK
Cg==

--===============7247701487726782121==--

