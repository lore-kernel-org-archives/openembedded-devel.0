Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AD5C0018A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2196.1699061893494096279
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QNEUKLdB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=p+qmbUMC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b97fb05a3-783a5e02-3850-41e1-b1fc-110f5ff36c43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z7jKwCRgEVhw+ff1UlnORIdr4933gCX5mW0FVZNCWls=;
	b=QNEUKLdBFHhEL6D5XOZkoj+vVQmmlGy7YLCz8I6Ezzz2dfnSj45wMJxuQRsnAiKB
	nETBJio3ekFmKRr7k28xDvH0gvIu2pVezuCOXASoAS5PRWE4eJmE6uzodE600ftdsZ9
	08+OJp2osGLEqADyzRtHm3514wLKrAuznyJn2DzQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z7jKwCRgEVhw+ff1UlnORIdr4933gCX5mW0FVZNCWls=;
	b=p+qmbUMCgkQiqJ8uS+Q6IRFYiW4Q56T1o9k6adxf4EWPaNltG/Zv6OcrTf6T9W9S
	qWYT+14mETJjKfyLSrxaarEr9IZL8sHm7TsyhUMNyyQy0aOpGRCkJJA2FrfECEpvqc1
	Evg2pj7Fer0YXatC8eUtfWTLXdJiqWp838OMDFzs=
Content-Type: multipart/mixed; boundary="===============5664274321356533838=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-argcomplete: upgrading to 3.1.4 SUCCEEDED
Message-ID: <0101018b97fb05a3-783a5e02-3850-41e1-b1fc-110f5ff36c43-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106096

--===============5664274321356533838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-argcomplete* to *3.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-argcomplete-upgrade-3.1.2-3.1.4.patch
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
From 31e67e06b4b2e1d1e7970ef847d66b024cb9a63a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:01:21 +0000
Subject: [PATCH] python3-argcomplete: upgrade 3.1.2 -> 3.1.4

---
 ...ython3-argcomplete_3.1.2.bb => python3-argcomplete_3.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.1.2.bb => python3-argcomplete_3.1.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.2.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.1.4.bb
index fb66f3da5..0b69efaff 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "d5d1e5efd41435260b8f85673b74ea2e883affcbec9f4230c582689e8e78251b"
+SRC_URI[sha256sum] = "72558ba729e4c468572609817226fb0a6e7e9a0a7d477b882be168c0b4a62b94"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.39.2


--===============5664274321356533838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-argcomplete: PV changed from "3.1.2" to "3.1.4"
packages/core2-64-poky-linux/python3-argcomplete: PKGV changed from 3.1.2 [default] to 3.1.4 [default]
packages/core2-64-poky-linux/python3-argcomplete: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/argcomplete/argcomplete-3.1.2.tar.gz;downloadfilename=argcomplete-3.1.2.tar.gz" to "https://files.pythonhosted.org/packages/source/a/argcomplete/argcomplete-3.1.4.tar.gz;downloadfilename=argcomplete-3.1.4.tar.gz"
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-dbg: PV changed from "3.1.2" to "3.1.4"
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-dbg: PKGV changed from 3.1.2 [default] to 3.1.4 [default]
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-dev: PV changed from "3.1.2" to "3.1.4"
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-dev: PKGV changed from 3.1.2 [default] to 3.1.4 [default]
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-doc: PV changed from "3.1.2" to "3.1.4"
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-doc: PKGV changed from 3.1.2 [default] to 3.1.4 [default]
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-locale: PV changed from "3.1.2" to "3.1.4"
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-locale: PKGV changed from 3.1.2 [default] to 3.1.4 [default]
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-src: PV changed from "3.1.2" to "3.1.4"
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-src: PKGV changed from 3.1.2 [default] to 3.1.4 [default]
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-staticdev: PV changed from "3.1.2" to "3.1.4"
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete-staticdev: PKGV changed from 3.1.2 [default] to 3.1.4 [default]
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete: PV changed from "3.1.2" to "3.1.4"
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete: PKGSIZE changed from 209609 to 209427 (-0%)
packages/core2-64-poky-linux/python3-argcomplete/python3-argcomplete: PKGV changed from 3.1.2 [default] to 3.1.4 [default]

--===============5664274321356533838==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-argcomplete-upgrade-3.1.2-3.1.4.patch"

RnJvbSAzMWU2N2UwNmI0YjJlMWQxZTc5NzBlZjg0N2Q2NmIwMjRjYjlhNjNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDowMToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYXJnY29tcGxldGU6IHVwZ3JhZGUgMy4xLjIgLT4gMy4xLjQKCi0tLQogLi4ueXRob24z
LWFyZ2NvbXBsZXRlXzMuMS4yLmJiID0+IHB5dGhvbjMtYXJnY29tcGxldGVfMy4xLjQuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYXJnY29tcGxl
dGVfMy4xLjIuYmIgPT4gcHl0aG9uMy1hcmdjb21wbGV0ZV8zLjEuNC5iYn0gKDgzJSkKCmRpZmYg
LS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFyZ2Nv
bXBsZXRlXzMuMS4yLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1hcmdjb21wbGV0ZV8zLjEuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJv
bSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFyZ2NvbXBsZXRl
XzMuMS4yLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWFyZ2NvbXBsZXRlXzMuMS40LmJiCmluZGV4IGZiNjZmM2RhNS4uMGI2OWVmYWZmIDEw
MDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFy
Z2NvbXBsZXRlXzMuMS4yLmJiCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtYXJnY29tcGxldGVfMy4xLjQuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdF
ID0gImh0dHBzOi8vZ2l0aHViLmNvbS9raXNseXVrL2FyZ2NvbXBsZXRlIgogTElDRU5TRSA9ICJB
cGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1PTJl
ZTQxMTEyYTQ0ZmU3MDE0ZGNlMzNlMjY0NjhiYTkzIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZDVkMWU1ZWZkNDE0MzUyNjBiOGY4NTY3M2I3NGVhMmU4ODNhZmZjYmVjOWY0MjMwYzU4MjY4OWU4
ZTc4MjUxYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3MjU1OGJhNzI5ZTRjNDY4NTcyNjA5ODE3
MjI2ZmIwYTZlN2U5YTBhN2Q0NzdiODgyYmUxNjhjMGI0YTYyYjk0IgogCiBQWVBJX1BBQ0tBR0Ug
PSAiYXJnY29tcGxldGUiCiAKLS0gCjIuMzkuMgoK

--===============5664274321356533838==--

