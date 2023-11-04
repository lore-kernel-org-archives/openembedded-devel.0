Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DD4C10F29
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.2204.1699061894841012170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U6+Yjxau;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mzsSb3DV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b97fb0a46-73b40311-4dbc-40d6-b408-2412f5891a64-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G9JGoxeCZZ0mmQS+at0UuObCWt/ZOXBkP1HEkewYYAA=;
	b=U6+YjxauVX2JZXDv/hnHhdMVCbKRxZYSeT0iXs4nqxaoH7FJNbEV5Nrw4KcQbRPl
	zC1F4jbF7KjmUULrfg3xJKtjuhrComLxmk/n1FcJN4DDDhg+pjUXUeeZTmJSKCVP088
	lBqdgpXQL3qcQcCWWNEzAsMlWPp92Ud6yDhaKYew=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G9JGoxeCZZ0mmQS+at0UuObCWt/ZOXBkP1HEkewYYAA=;
	b=mzsSb3DVI8ctekOUX4X5khuwkIkMsrog05Fu2LaWGJg6s+iyBEP7w93Djq0rVXTD
	dE+bGzePk0tYcalUPsFIM/TMEh0uGKpM9go1WwMgJ8zVC+W9pCDA8U7w6YCr5ItQDYn
	blTJIv9LAzo5v4ljK985GlMhJKIMfRkBCyu0suzc=
Content-Type: multipart/mixed; boundary="===============6494867919622509548=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-charset-normalizer: upgrading to 3.3.2 SUCCEEDED
Message-ID: <0101018b97fb0a46-73b40311-4dbc-40d6-b408-2412f5891a64-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106108

--===============6494867919622509548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-charset-normalizer* to *3.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-charset-normalizer-upgrade-3.3.0-3.3.2.patch
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
From b17b6fb0525be9c21cfd7ea422b68a2178c25fd5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:33:58 +0000
Subject: [PATCH] python3-charset-normalizer: upgrade 3.3.0 -> 3.3.2

---
 ...-normalizer_3.3.0.bb => python3-charset-normalizer_3.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.3.0.bb => python3-charset-normalizer_3.3.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.0.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
index 8502be7b4..666cb5dc3 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "63563193aec44bce707e0c5ca64ff69fa72ed7cf34ce6e11d5127555756fd2f6"
+SRC_URI[sha256sum] = "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============6494867919622509548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-charset-normalizer: PKGV changed from 3.3.0 [default] to 3.3.2 [default]
packages/core2-64-poky-linux/python3-charset-normalizer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/charset-normalizer/charset-normalizer-3.3.0.tar.gz;downloadfilename=charset-normalizer-3.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/c/charset-normalizer/charset-normalizer-3.3.2.tar.gz;downloadfilename=charset-normalizer-3.3.2.tar.gz"
packages/core2-64-poky-linux/python3-charset-normalizer: PV changed from "3.3.0" to "3.3.2"
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-dbg: PKGV changed from 3.3.0 [default] to 3.3.2 [default]
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-dbg: PV changed from "3.3.0" to "3.3.2"
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-dev: PKGV changed from 3.3.0 [default] to 3.3.2 [default]
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-dev: PV changed from "3.3.0" to "3.3.2"
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-doc: PKGV changed from 3.3.0 [default] to 3.3.2 [default]
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-doc: PV changed from "3.3.0" to "3.3.2"
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-locale: PKGV changed from 3.3.0 [default] to 3.3.2 [default]
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-locale: PV changed from "3.3.0" to "3.3.2"
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-src: PKGV changed from 3.3.0 [default] to 3.3.2 [default]
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-src: PV changed from "3.3.0" to "3.3.2"
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-staticdev: PKGV changed from 3.3.0 [default] to 3.3.2 [default]
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer-staticdev: PV changed from "3.3.0" to "3.3.2"
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer: PKGV changed from 3.3.0 [default] to 3.3.2 [default]
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer: PKGSIZE changed from 321453 to 326834 (+2%)
packages/core2-64-poky-linux/python3-charset-normalizer/python3-charset-normalizer: PV changed from "3.3.0" to "3.3.2"
Changes to packages/core2-64-poky-linux/python3-charset-normalizer (sysroot):
  /usr/lib/python3.11/site-packages/charset_normalizer-3.3.0.dist-info moved to /usr/lib/python3.11/site-packages/charset_normalizer-3.3.2.dist-info

--===============6494867919622509548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-charset-normalizer (sysroot):
  /usr/lib/python3.11/site-packages/charset_normalizer-3.3.0.dist-info moved to /usr/lib/python3.11/site-packages/charset_normalizer-3.3.2.dist-info

--===============6494867919622509548==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-charset-normalizer-upgrade-3.3.0-3.3.2.patch"

RnJvbSBiMTdiNmZiMDUyNWJlOWMyMWNmZDdlYTQyMmI2OGEyMTc4YzI1ZmQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDozMzo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2hhcnNldC1ub3JtYWxpemVyOiB1cGdyYWRlIDMuMy4wIC0+IDMuMy4yCgotLS0KIC4u
Li1ub3JtYWxpemVyXzMuMy4wLmJiID0+IHB5dGhvbjMtY2hhcnNldC1ub3JtYWxpemVyXzMuMy4y
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNo
YXJzZXQtbm9ybWFsaXplcl8zLjMuMC5iYiA9PiBweXRob24zLWNoYXJzZXQtbm9ybWFsaXplcl8z
LjMuMi5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWNoYXJzZXQtbm9ybWFsaXplcl8zLjMuMC5iYiBiL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2hhcnNldC1ub3JtYWxpemVyXzMuMy4y
LmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2hhcnNldC1ub3JtYWxpemVyXzMuMy4wLmJiCnJlbmFt
ZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNoYXJzZXQt
bm9ybWFsaXplcl8zLjMuMi5iYgppbmRleCA4NTAyYmU3YjQuLjY2NmNiNWRjMyAxMDA2NDQKLS0t
IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jaGFyc2V0LW5v
cm1hbGl6ZXJfMy4zLjAuYmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jaGFyc2V0LW5vcm1hbGl6ZXJfMy4zLjIuYmIKQEAgLTMsNyArMyw3IEBAIEhP
TUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9vdXNyZXQvY2hhcnNldF9ub3JtYWxpemVyIgog
TElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0w
OTc0YTM5MDgyNzA4NzI4N2RiMzk5MjhmN2M1MjRiNSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjYzNTYzMTkzYWVjNDRiY2U3MDdlMGM1Y2E2NGZmNjlmYTcyZWQ3Y2YzNGNlNmUxMWQ1MTI3NTU1
NzU2ZmQyZjYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjMwYzNjYjMzYjI0NDU0YTgyZmFlY2Fm
MDFiMTljMTg1NjJiMWU4OTU1OGZiNmM1NmRlNGQ5MTE4YTAzMmZkNSIKIAogaW5oZXJpdCBweXBp
IHNldHVwdG9vbHMzCiAKLS0gCjIuMzkuMgoK

--===============6494867919622509548==--

