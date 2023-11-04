Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F63EC072A4
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.2197.1699061893831492029
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X2IXr8U8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OniEhuRM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b97fb0fd1-97c2366a-928d-436c-8e30-0a2ae53ee9aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P+o5tz/LXp+GfK68OxhamV3n5A1+5HcXOjOl51T8tI4=;
	b=X2IXr8U8ALH1JMkyjxxZlC1GfgAdOo/oVwFmiBBHNMxgSgIwvyvthez1+DXre8ni
	hQeqbQ8NNl/OhQ9gqWAZs81SDDP0bpas7Xe/O/GP0eCqcbBOtPNUiGKFLm8Hn7xdOX+
	nZ2rzgbcd7LfVixDueRhK1yF9dry5HL237tlLxCM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P+o5tz/LXp+GfK68OxhamV3n5A1+5HcXOjOl51T8tI4=;
	b=OniEhuRMmYOPHfVHWHzF1P64rllfI7WYYOieAeILlQNwFi+IhKkNv7JTvzWCreuv
	jC8Yl0udVIK+JzHQOzsksLTAQfUYCLSbtWooSNY9447HHFBM4DQezDuo7L+6q0SM9ir
	541n4duNR01jUU3DwQVID1O5yxdnwd9bVg3bIy2Y=
Content-Type: multipart/mixed; boundary="===============5208705084311952526=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-imageio: upgrading to 2.31.6 SUCCEEDED
Message-ID: <0101018b97fb0fd1-97c2366a-928d-436c-8e30-0a2ae53ee9aa-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106121

--===============5208705084311952526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-imageio* to *2.31.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-imageio-upgrade-2.31.5-2.31.6.patch
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
From 2dc4b6b3ce48347a5e88a8bb91e2604c0641dde3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 21:54:47 +0000
Subject: [PATCH] python3-imageio: upgrade 2.31.5 -> 2.31.6

---
 .../{python3-imageio_2.31.5.bb => python3-imageio_2.31.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.31.5.bb => python3-imageio_2.31.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.31.5.bb b/meta-python/recipes-devtools/python/python3-imageio_2.31.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.31.5.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.31.6.bb
index 4efea1dad..b471275aa 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.31.5.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.31.6.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "d8e53f9cd4054880276a3dac0a28c85ba7874084856a55a0294a8ae6ed7f3a8e"
+SRC_URI[sha256sum] = "721f238896a9a99a77b73f06f42fc235d477d5d378cdf34dd0bee1e408b4742c"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============5208705084311952526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-imageio: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/imageio/imageio-2.31.5.tar.gz;downloadfilename=imageio-2.31.5.tar.gz" to "https://files.pythonhosted.org/packages/source/i/imageio/imageio-2.31.6.tar.gz;downloadfilename=imageio-2.31.6.tar.gz"
packages/core2-64-poky-linux/python3-imageio: PKGV changed from 2.31.5 [default] to 2.31.6 [default]
packages/core2-64-poky-linux/python3-imageio: PV changed from "2.31.5" to "2.31.6"
packages/core2-64-poky-linux/python3-imageio/python3-imageio-dbg: PKGV changed from 2.31.5 [default] to 2.31.6 [default]
packages/core2-64-poky-linux/python3-imageio/python3-imageio-dbg: PV changed from "2.31.5" to "2.31.6"
packages/core2-64-poky-linux/python3-imageio/python3-imageio-dev: PKGV changed from 2.31.5 [default] to 2.31.6 [default]
packages/core2-64-poky-linux/python3-imageio/python3-imageio-dev: PV changed from "2.31.5" to "2.31.6"
packages/core2-64-poky-linux/python3-imageio/python3-imageio-doc: PKGV changed from 2.31.5 [default] to 2.31.6 [default]
packages/core2-64-poky-linux/python3-imageio/python3-imageio-doc: PV changed from "2.31.5" to "2.31.6"
packages/core2-64-poky-linux/python3-imageio/python3-imageio-locale: PKGV changed from 2.31.5 [default] to 2.31.6 [default]
packages/core2-64-poky-linux/python3-imageio/python3-imageio-locale: PV changed from "2.31.5" to "2.31.6"
packages/core2-64-poky-linux/python3-imageio/python3-imageio-src: PKGV changed from 2.31.5 [default] to 2.31.6 [default]
packages/core2-64-poky-linux/python3-imageio/python3-imageio-src: PV changed from "2.31.5" to "2.31.6"
packages/core2-64-poky-linux/python3-imageio/python3-imageio-staticdev: PKGV changed from 2.31.5 [default] to 2.31.6 [default]
packages/core2-64-poky-linux/python3-imageio/python3-imageio-staticdev: PV changed from "2.31.5" to "2.31.6"
packages/core2-64-poky-linux/python3-imageio/python3-imageio: PKGSIZE changed from 2508627 to 2508635 (+0%)
packages/core2-64-poky-linux/python3-imageio/python3-imageio: PKGV changed from 2.31.5 [default] to 2.31.6 [default]
packages/core2-64-poky-linux/python3-imageio/python3-imageio: PV changed from "2.31.5" to "2.31.6"
Changes to packages/core2-64-poky-linux/python3-imageio (sysroot):
  /usr/lib/python3.11/site-packages/imageio-2.31.5.dist-info moved to /usr/lib/python3.11/site-packages/imageio-2.31.6.dist-info

--===============5208705084311952526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-imageio (sysroot):
  /usr/lib/python3.11/site-packages/imageio-2.31.5.dist-info moved to /usr/lib/python3.11/site-packages/imageio-2.31.6.dist-info

--===============5208705084311952526==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-imageio-upgrade-2.31.5-2.31.6.patch"

RnJvbSAyZGM0YjZiM2NlNDgzNDdhNWU4OGE4YmI5MWUyNjA0YzA2NDFkZGUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMTo1NDo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaW1hZ2VpbzogdXBncmFkZSAyLjMxLjUgLT4gMi4zMS42CgotLS0KIC4uLi97cHl0aG9u
My1pbWFnZWlvXzIuMzEuNS5iYiA9PiBweXRob24zLWltYWdlaW9fMi4zMS42LmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWltYWdlaW9fMi4z
MS41LmJiID0+IHB5dGhvbjMtaW1hZ2Vpb18yLjMxLjYuYmJ9ICg4MSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbWFnZWlvXzIuMzEu
NS5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1hZ2Vp
b18yLjMxLjYuYmIKc2ltaWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbWFnZWlvXzIuMzEuNS5iYgpyZW5hbWUg
dG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbWFnZWlvXzIu
MzEuNi5iYgppbmRleCA0ZWZlYTFkYWQuLmI0NzEyNzVhYSAxMDA2NDQKLS0tIGEvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbWFnZWlvXzIuMzEuNS5iYgorKysg
Yi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWltYWdlaW9fMi4z
MS42LmJiCkBAIC01LDcgKzUsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0Ug
PSAiQlNELTItQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
MjRjYjlhMzY3YTllNjQxYjQ1OWEwMWM0ZDE1MjU2YmEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJkOGU1M2Y5Y2Q0MDU0ODgwMjc2YTNkYWMwYTI4Yzg1YmE3ODc0MDg0ODU2YTU1YTAyOTRhOGFl
NmVkN2YzYThlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcyMWYyMzg4OTZhOWE5OWE3N2I3M2Yw
NmY0MmZjMjM1ZDQ3N2Q1ZDM3OGNkZjM0ZGQwYmVlMWU0MDhiNDc0MmMiCiAKIGluaGVyaXQgcHlw
aSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5LjIKCg==

--===============5208705084311952526==--

