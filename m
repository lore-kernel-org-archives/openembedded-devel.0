Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA21AC07EBD
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2279.1699061893519657876
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RjuhJNmK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MAEGQT28;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b97fb05dd-42bf89e2-ae35-446c-98da-1aa34ff9068b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gy0GTQnzZRf72nNAWSXjvMhCu0gNvrVOoIaF4AoeCZU=;
	b=RjuhJNmKrEM1ndrblQ+hvDkBU9MAAAxYOxJhINis/ABnh3gAERPTQ8Qhxq+ekQUV
	GLTzIdSAQ/5h3/Xw0QB13D6jSs9APRokrWaJE08UM1pOQZT8JDi9c4cyRcyhXqwQtH7
	X6hK/hq5bVu2BYnkH/ODE5Jd7rSG13gDWGh+E6vk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gy0GTQnzZRf72nNAWSXjvMhCu0gNvrVOoIaF4AoeCZU=;
	b=MAEGQT28KyzahIArJlCu9P+kx6sHw0a6uiq4ZlFeniW5pl9hF3evl8OoU09GEzk4
	XFTuQnjgpPRw/FIIYdwD/zjrJgIz0knAl+bP64G86L7jM5k4xmdaOnRqGvWECKRRZjr
	5ttivrmYTMPJ9jfLOxAL15rW/OqLA/WjRg2pHY9E=
Content-Type: multipart/mixed; boundary="===============1419425690219378888=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-asttokens: upgrading to 2.4.1 SUCCEEDED
Message-ID: <0101018b97fb05dd-42bf89e2-ae35-446c-98da-1aa34ff9068b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106097

--===============1419425690219378888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-asttokens* to *2.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-asttokens-upgrade-2.4.0-2.4.1.patch
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
From 7240fd05cb1abbf80f628fd79cdc971a9a50575c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:08:25 +0000
Subject: [PATCH] python3-asttokens: upgrade 2.4.0 -> 2.4.1

---
 .../{python3-asttokens_2.4.0.bb => python3-asttokens_2.4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.4.0.bb => python3-asttokens_2.4.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.4.0.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.4.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asttokens_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_2.4.1.bb
index 3942122d6..5cc4291f7 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.4.1.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2e0171b991b2c959acc6c49318049236844a5da1d65ba2672c4880c1c894834e"
+SRC_URI[sha256sum] = "b03869718ba9a6eb027e134bfdf69f38a236d681c83c160d510768af11254ba0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.39.2


--===============1419425690219378888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-asttokens: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/python3-asttokens: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/asttokens/asttokens-2.4.0.tar.gz;downloadfilename=asttokens-2.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/a/asttokens/asttokens-2.4.1.tar.gz;downloadfilename=asttokens-2.4.1.tar.gz"
packages/core2-64-poky-linux/python3-asttokens: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-dbg: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-dbg: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-dev: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-dev: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-doc: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-doc: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-locale: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-locale: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-src: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-src: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-staticdev: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens-staticdev: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens: PKGSIZE changed from 151140 to 151867 (+0%)
packages/core2-64-poky-linux/python3-asttokens/python3-asttokens: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
Changes to packages/core2-64-poky-linux/python3-asttokens (sysroot):
  /usr/lib/python3.11/site-packages/asttokens-2.4.0.dist-info moved to /usr/lib/python3.11/site-packages/asttokens-2.4.1.dist-info

--===============1419425690219378888==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-asttokens-upgrade-2.4.0-2.4.1.patch"

RnJvbSA3MjQwZmQwNWNiMWFiYmY4MGY2MjhmZDc5Y2RjOTcxYTlhNTA1NzVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDowODoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYXN0dG9rZW5zOiB1cGdyYWRlIDIuNC4wIC0+IDIuNC4xCgotLS0KIC4uLi97cHl0aG9u
My1hc3R0b2tlbnNfMi40LjAuYmIgPT4gcHl0aG9uMy1hc3R0b2tlbnNfMi40LjEuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWFzdHRva2Vuc18y
LjQuMC5iYiA9PiBweXRob24zLWFzdHRva2Vuc18yLjQuMS5iYn0gKDgyJSkKCmRpZmYgLS1naXQg
YS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFzdHRva2Vuc18y
LjQuMC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXN0
dG9rZW5zXzIuNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXN0dG9rZW5zXzIuNC4wLmJiCnJl
bmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFzdHRv
a2Vuc18yLjQuMS5iYgppbmRleCAzOTQyMTIyZDYuLjVjYzQyOTFmNyAxMDA2NDQKLS0tIGEvbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hc3R0b2tlbnNfMi40LjAu
YmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hc3R0
b2tlbnNfMi40LjEuYmIKQEAgLTcsNyArNyw3IEBAIFBZUElfUEFDS0FHRSA9ICJhc3R0b2tlbnMi
CiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIyZTAxNzFiOTkxYjJjOTU5YWNjNmM0OTMxODA0OTIzNjg0NGE1ZGExZDY1
YmEyNjcyYzQ4ODBjMWM4OTQ4MzRlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIwMzg2OTcxOGJh
OWE2ZWIwMjdlMTM0YmZkZjY5ZjM4YTIzNmQ2ODFjODNjMTYwZDUxMDc2OGFmMTEyNTRiYTAiCiAK
IERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29scy1zY20tbmF0aXZlIgogCi0tIAoyLjM5LjIK
Cg==

--===============1419425690219378888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-asttokens (sysroot):
  /usr/lib/python3.11/site-packages/asttokens-2.4.0.dist-info moved to /usr/lib/python3.11/site-packages/asttokens-2.4.1.dist-info

--===============1419425690219378888==--

