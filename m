Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13960C07CA9
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.2285.1699061895183596183
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RvL1Q0Yj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SHdG/27e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b97fb1294-6f3ff064-265c-4663-a85f-ffa5fe49c57e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CSk3hC4IXy49tUmho7X0gOqShZVJVqqnsFeRuyCqp5s=;
	b=RvL1Q0Yj3DWIuKmd+QN78RnEoJSUD63y2NUMVpOsLCA4e+xBQnZglF+Psm6ZCz/j
	y9pk6EAewyI6KZjLO1SGwMUtSJqwrKzpPWgLVOt+ty9Y6xh/K1bNjJMfM33Y3Fe9WDH
	DF+Mi3+cXTRF1k2MA+dVW7TgGm0OOdiFpxEg4nXQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CSk3hC4IXy49tUmho7X0gOqShZVJVqqnsFeRuyCqp5s=;
	b=SHdG/27ejzxRYFPOAm2dzuCYMUNCyegQdtKvsW3vGIYPZ+zIMUjzI3aOlKs2pXVa
	Sr1zuQhbQBqgab5CxXeOv4g/vq8ASWfW9qR9NwBx35IbouhFB6AyZpSBeB0fmIQVf6g
	kUWnNQbaU3TIdRHVQOxhbziaXSfM74WftfPFXB7c=
Content-Type: multipart/mixed; boundary="===============3194903892495737784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-meson-python: upgrading to 0.15.0 SUCCEEDED
Message-ID: <0101018b97fb1294-6f3ff064-265c-4663-a85f-ffa5fe49c57e-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106131

--===============3194903892495737784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-meson-python* to *0.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-meson-python-upgrade-0.14.0-0.15.0.patch
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
From 82ac46f2e13aa1b20ed84da70f54ea287485ff57 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 22:51:55 +0000
Subject: [PATCH] python3-meson-python: upgrade 0.14.0 -> 0.15.0

---
 ...n3-meson-python_0.14.0.bb => python3-meson-python_0.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-meson-python_0.14.0.bb => python3-meson-python_0.15.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-meson-python_0.14.0.bb b/meta-python/recipes-devtools/python/python3-meson-python_0.15.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-meson-python_0.14.0.bb
rename to meta-python/recipes-devtools/python/python3-meson-python_0.15.0.bb
index d6ee64b01..c4b01a383 100644
--- a/meta-python/recipes-devtools/python/python3-meson-python_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-meson-python_0.15.0.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "b96866690326544dfe452583753ac3f43313227e9fd9416701a8df90af212234"
+SRC_URI[sha256sum] = "fddb73eecd49e89c1c41c87937cd89c2d0b65a1c63ba28238681d4bd9484d26f"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 
-- 
2.39.2


--===============3194903892495737784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-meson-python: PKGV changed from 0.14.0 [default] to 0.15.0 [default]
packages/core2-64-poky-linux/python3-meson-python: PV changed from "0.14.0" to "0.15.0"
packages/core2-64-poky-linux/python3-meson-python: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.14.0.tar.gz;downloadfilename=meson_python-0.14.0.tar.gz" to "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.15.0.tar.gz;downloadfilename=meson_python-0.15.0.tar.gz"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-dbg: PV changed from "0.14.0" to "0.15.0"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-dbg: PKGV changed from 0.14.0 [default] to 0.15.0 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-dev: PV changed from "0.14.0" to "0.15.0"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-dev: PKGV changed from 0.14.0 [default] to 0.15.0 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-doc: PV changed from "0.14.0" to "0.15.0"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-doc: PKGV changed from 0.14.0 [default] to 0.15.0 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-locale: PV changed from "0.14.0" to "0.15.0"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-locale: PKGV changed from 0.14.0 [default] to 0.15.0 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-src: PV changed from "0.14.0" to "0.15.0"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-src: PKGV changed from 0.14.0 [default] to 0.15.0 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-staticdev: PV changed from "0.14.0" to "0.15.0"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-staticdev: PKGV changed from 0.14.0 [default] to 0.15.0 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python: PV changed from "0.14.0" to "0.15.0"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python: PKGSIZE changed from 185274 to 184742 (-0%)
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python: PKGV changed from 0.14.0 [default] to 0.15.0 [default]
Changes to packages/core2-64-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.11/site-packages/meson_python-0.14.0.dist-info moved to /usr/lib/python3.11/site-packages/meson_python-0.15.0.dist-info

--===============3194903892495737784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.11/site-packages/meson_python-0.14.0.dist-info moved to /usr/lib/python3.11/site-packages/meson_python-0.15.0.dist-info

--===============3194903892495737784==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-meson-python-upgrade-0.14.0-0.15.0.patch"

RnJvbSA4MmFjNDZmMmUxM2FhMWIyMGVkODRkYTcwZjU0ZWEyODc0ODVmZjU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMjo1MTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWVzb24tcHl0aG9uOiB1cGdyYWRlIDAuMTQuMCAtPiAwLjE1LjAKCi0tLQogLi4ubjMt
bWVzb24tcHl0aG9uXzAuMTQuMC5iYiA9PiBweXRob24zLW1lc29uLXB5dGhvbl8wLjE1LjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWVzb24t
cHl0aG9uXzAuMTQuMC5iYiA9PiBweXRob24zLW1lc29uLXB5dGhvbl8wLjE1LjAuYmJ9ICg4NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1tZXNvbi1weXRob25fMC4xNC4wLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tZXNvbi1weXRob25fMC4xNS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODUl
CnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bWVzb24tcHl0aG9uXzAuMTQuMC5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1tZXNvbi1weXRob25fMC4xNS4wLmJiCmluZGV4IGQ2ZWU2NGIw
MS4uYzRiMDFhMzgzIDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjE0LjAuYmIKKysrIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tZXNvbi1weXRob25fMC4xNS4wLmJiCkBAIC0x
MSw3ICsxMSw3IEBAIERFUEVORFMgPSAiIFwKIFBZUElfUEFDS0FHRSA9ICJtZXNvbl9weXRob24i
CiAKIGluaGVyaXQgcHlwaSBweXRob25fbWVzb25weQotU1JDX1VSSVtzaGEyNTZzdW1dID0gImI5
Njg2NjY5MDMyNjU0NGRmZTQ1MjU4Mzc1M2FjM2Y0MzMxMzIyN2U5ZmQ5NDE2NzAxYThkZjkwYWYy
MTIyMzQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmRkYjczZWVjZDQ5ZTg5YzFjNDFjODc5Mzdj
ZDg5YzJkMGI2NWExYzYzYmEyODIzODY4MWQ0YmQ5NDg0ZDI2ZiIKIAogREVQRU5EUzpyZW1vdmU6
Y2xhc3MtbmF0aXZlID0gInB5dGhvbjMtbWVzb24tcHl0aG9uLW5hdGl2ZSIKIAotLSAKMi4zOS4y
Cgo=

--===============3194903892495737784==--

