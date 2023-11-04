Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA31C05022
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2286.1699061895185393105
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XVavCQmk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ts6+3mGu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b97fb1630-bdccf078-9dc4-4d92-b141-d2042be18f9a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RkYoxBkyX5QNMaR8AA4Z67JhBLY6Oxcgq3E6asqBZQI=;
	b=XVavCQmkO/E2ZHsjI3frPL2kOnIziA+VkM9XC131nGm4p3dxVsyzcJn0jNMI1k8f
	Z4QR5BQZMon4TWJHw4VyV/Aj9z6A8rk7VC7yMP+cdzUpFKVjQgmTcW2A6vQb8aIrmSW
	0eFRWAjdpeQ95NhhWwJWLZDmEScj57YBNqfuLprA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RkYoxBkyX5QNMaR8AA4Z67JhBLY6Oxcgq3E6asqBZQI=;
	b=Ts6+3mGu0lTLV1naRmbuPyoEtjR99aHJz1CDgI9pX/EYTp41AQbE1MALV4UxIC8E
	H8/NBX503gi3o+0zfwwa8xp0yaBYvsva+9LRjyEtwgHAeP4EGc+kw9omEwmKiBExAvs
	dEcyWk0C2mWsqm+ZKLSrfW0X4g8576vN1yr99Y2s=
Content-Type: multipart/mixed; boundary="===============1582120014704748783=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pyjwt: upgrading to 2.8.0 SUCCEEDED
Message-ID: <0101018b97fb1630-bdccf078-9dc4-4d92-b141-d2042be18f9a-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106158

--===============1582120014704748783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyjwt* to *2.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyjwt-upgrade-2.7.0-2.8.0.patch
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
From 6eff1eb9236803b2736b837bfcd44d62e4de1a8f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 23:43:18 +0000
Subject: [PATCH] python3-pyjwt: upgrade 2.7.0 -> 2.8.0

---
 .../python/{python3-pyjwt_2.7.0.bb => python3-pyjwt_2.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.7.0.bb => python3-pyjwt_2.8.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 3aa9b479a..92a8f44c6 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "bd6ca4a3c4285c1a2d4349e5a035fdf8fb94e04ccd0fcbe6ba289dae9cc3e074"
+SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.39.2


--===============1582120014704748783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyjwt: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/python3-pyjwt: SRC_URI changed from "https://files.pythonhosted.org/packages/source/P/PyJWT/PyJWT-2.7.0.tar.gz;downloadfilename=PyJWT-2.7.0.tar.gz" to "https://files.pythonhosted.org/packages/source/P/PyJWT/PyJWT-2.8.0.tar.gz;downloadfilename=PyJWT-2.8.0.tar.gz"
packages/core2-64-poky-linux/python3-pyjwt: PV changed from "2.7.0" to "2.8.0"
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-dbg: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-dbg: PV changed from "2.7.0" to "2.8.0"
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-dev: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-dev: PV changed from "2.7.0" to "2.8.0"
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-doc: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-doc: PV changed from "2.7.0" to "2.8.0"
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-locale: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-locale: PV changed from "2.7.0" to "2.8.0"
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-src: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-src: PV changed from "2.7.0" to "2.8.0"
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-staticdev: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt-staticdev: PV changed from "2.7.0" to "2.8.0"
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt: PKGSIZE changed from 176462 to 178306 (+1%)
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt: PKGV changed from 2.7.0 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/python3-pyjwt/python3-pyjwt: PV changed from "2.7.0" to "2.8.0"
Changes to packages/core2-64-poky-linux/python3-pyjwt (sysroot):
  /usr/lib/python3.11/site-packages/PyJWT-2.7.0.dist-info moved to /usr/lib/python3.11/site-packages/PyJWT-2.8.0.dist-info

--===============1582120014704748783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyjwt (sysroot):
  /usr/lib/python3.11/site-packages/PyJWT-2.7.0.dist-info moved to /usr/lib/python3.11/site-packages/PyJWT-2.8.0.dist-info

--===============1582120014704748783==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyjwt-upgrade-2.7.0-2.8.0.patch"

RnJvbSA2ZWZmMWViOTIzNjgwM2IyNzM2YjgzN2JmY2Q0NGQ2MmU0ZGUxYThmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMzo0MzoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlqd3Q6IHVwZ3JhZGUgMi43LjAgLT4gMi44LjAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1weWp3dF8yLjcuMC5iYiA9PiBweXRob24zLXB5and0XzIuOC4wLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlqd3RfMi43LjAuYmIg
PT4gcHl0aG9uMy1weWp3dF8yLjguMC5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5and0XzIuNy4wLmJiIGIvbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWp3dF8yLjguMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5and0XzIuNy4wLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5and0XzIuOC4wLmJiCmluZGV4IDNhYTliNDc5
YS4uOTJhOGY0NGM2IDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5and0XzIuNy4wLmJiCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlqd3RfMi44LjAuYmIKQEAgLTUsNyArNSw3IEBAIEhPTUVQ
QUdFID0gImh0dHA6Ly9naXRodWIuY29tL2pwYWRpbGxhL3B5and0IgogTElDRU5TRSA9ICJNSVQi
CiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1lNGI1NmQyYzk5NzNkOGNm
NTQ2NTU1NTViZTA2ZTU1MSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJkNmNhNGEzYzQyODVj
MWEyZDQzNDllNWEwMzVmZGY4ZmI5NGUwNGNjZDBmY2JlNmJhMjg5ZGFlOWNjM2UwNzQiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNTdlMjhkMTU2ZTNkNWMxMDA4OGUwYzY4YWJiOTBiZmFjM2RmODJi
NDBhNzFiZDBkYWEyMGM2NWNjZDVjMjNkZSIKIAogUFlQSV9QQUNLQUdFID0gIlB5SldUIgogaW5o
ZXJpdCBweXBpIHNldHVwdG9vbHMzCi0tIAoyLjM5LjIKCg==

--===============1582120014704748783==--

