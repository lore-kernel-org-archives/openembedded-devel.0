Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BB2C001DD
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.2206.1699061895005349776
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QiSZqB4q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cOAvPPaw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b97fb1b3f-cf40703d-1f61-4f49-9ba0-7b3ffbf67dda-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=87rtAKpA+aZUK20wK2g6UHnqos5NuQKR6vZvvSC7eO4=;
	b=QiSZqB4qTYvIUGRjUyVuVT5gVhROiAep1v8eZUH3U2uYUuC8tPJu9SvTHoeFcuY3
	T/oNRA2BeHUytVkgX8/83LaLJH/JvdU4seBBdxes9rMuoJFFMnS2pzkvCijBlErXhGj
	1bep4EaZI22f2B0lzWMLx4dLZ+X6Iu3Q25ILr3l0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=87rtAKpA+aZUK20wK2g6UHnqos5NuQKR6vZvvSC7eO4=;
	b=cOAvPPawvtAGXaHNrL30RlbudGJg4DAyuoXSR2l4ML3cTTR6WS1BjKOzmn+W9qWR
	7+yMugueRTImbmo8blrzjimU9FLF6h8gMn5vdorI6bnbscaiPbX3WYjJfiqpuisGmK7
	pM7ycONbLsEEgUiDfiYtsl2+/BTHhdhJ9AUo1CzE=
Content-Type: multipart/mixed; boundary="===============3973087484931878324=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-trustme: upgrading to 1.1.0 SUCCEEDED
Message-ID: <0101018b97fb1b3f-cf40703d-1f61-4f49-9ba0-7b3ffbf67dda-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106172

--===============3973087484931878324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trustme* to *1.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trustme-upgrade-0.9.0-1.1.0.patch
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
From 0e19e016b5548f868ed0fe3f5cef10df06ee46ce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 00:57:21 +0000
Subject: [PATCH] python3-trustme: upgrade 0.9.0 -> 1.1.0

---
 .../{python3-trustme_0.9.0.bb => python3-trustme_1.1.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-trustme_0.9.0.bb => python3-trustme_1.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
index 6622f6220..e925712f3 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://pypi.org/project/trustme"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5a7af1a4b73e57431e25d15a2da745a"
 
-SRC_URI[md5sum] = "0e4d698e5aecaf8306cf440bf3dcbbe0"
-SRC_URI[sha256sum] = "5e07b23d70ceed64f3bb36ae4b9abc52354c16c98d45ab037bee2b5fbffe586c"
+SRC_URI[sha256sum] = "5375ad7fb427074bec956592e0d4ee2a4cf4da68934e1ba4bcf4217126bc45e6"
 
 inherit pypi setuptools3 ptest
 
-- 
2.39.2


--===============3973087484931878324==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trustme-upgrade-0.9.0-1.1.0.patch"

RnJvbSAwZTE5ZTAxNmI1NTQ4Zjg2OGVkMGZlM2Y1Y2VmMTBkZjA2ZWU0NmNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMDo1NzoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJ1c3RtZTogdXBncmFkZSAwLjkuMCAtPiAxLjEuMAoKLS0tCiAuLi4ve3B5dGhvbjMt
dHJ1c3RtZV8wLjkuMC5iYiA9PiBweXRob24zLXRydXN0bWVfMS4xLjAuYmJ9ICAgICB8IDMgKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdHJ1c3RtZV8wLjku
MC5iYiA9PiBweXRob24zLXRydXN0bWVfMS4xLjAuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cnVzdG1lXzAuOS4wLmJi
IGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cnVzdG1lXzEu
MS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJ1c3RtZV8wLjkuMC5iYgpyZW5hbWUgdG8gbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cnVzdG1lXzEuMS4wLmJi
CmluZGV4IDY2MjJmNjIyMC4uZTkyNTcxMmYzIDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRydXN0bWVfMC45LjAuYmIKKysrIGIvbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cnVzdG1lXzEuMS4wLmJiCkBA
IC00LDggKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvdHJ1c3Rt
ZSIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PWQ1YTdhZjFhNGI3M2U1NzQzMWUyNWQxNWEyZGE3NDVhIgogCi1TUkNfVVJJW21k
NXN1bV0gPSAiMGU0ZDY5OGU1YWVjYWY4MzA2Y2Y0NDBiZjNkY2JiZTAiCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNWUwN2IyM2Q3MGNlZWQ2NGYzYmIzNmFlNGI5YWJjNTIzNTRjMTZjOThkNDVhYjAz
N2JlZTJiNWZiZmZlNTg2YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1Mzc1YWQ3ZmI0MjcwNzRi
ZWM5NTY1OTJlMGQ0ZWUyYTRjZjRkYTY4OTM0ZTFiYTRiY2Y0MjE3MTI2YmM0NWU2IgogCiBpbmhl
cml0IHB5cGkgc2V0dXB0b29sczMgcHRlc3QKIAotLSAKMi4zOS4yCgo=

--===============3973087484931878324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trustme: PKGV changed from 0.9.0 [default] to 1.1.0 [default]
packages/core2-64-poky-linux/python3-trustme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trustme/trustme-0.9.0.tar.gz;downloadfilename=trustme-0.9.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trustme/trustme-1.1.0.tar.gz;downloadfilename=trustme-1.1.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-trustme: PV changed from "0.9.0" to "1.1.0"
packages/core2-64-poky-linux/python3-trustme/python3-trustme-dbg: PKGV changed from 0.9.0 [default] to 1.1.0 [default]
packages/core2-64-poky-linux/python3-trustme/python3-trustme-dbg: PV changed from "0.9.0" to "1.1.0"
packages/core2-64-poky-linux/python3-trustme/python3-trustme-dev: PKGV changed from 0.9.0 [default] to 1.1.0 [default]
packages/core2-64-poky-linux/python3-trustme/python3-trustme-dev: PV changed from "0.9.0" to "1.1.0"
packages/core2-64-poky-linux/python3-trustme/python3-trustme-doc: PKGV changed from 0.9.0 [default] to 1.1.0 [default]
packages/core2-64-poky-linux/python3-trustme/python3-trustme-doc: PV changed from "0.9.0" to "1.1.0"
packages/core2-64-poky-linux/python3-trustme/python3-trustme-locale: PKGV changed from 0.9.0 [default] to 1.1.0 [default]
packages/core2-64-poky-linux/python3-trustme/python3-trustme-locale: PV changed from "0.9.0" to "1.1.0"
packages/core2-64-poky-linux/python3-trustme/python3-trustme-ptest: PKGV changed from 0.9.0 [default] to 1.1.0 [default]
packages/core2-64-poky-linux/python3-trustme/python3-trustme-ptest: PV changed from "0.9.0" to "1.1.0"
packages/core2-64-poky-linux/python3-trustme/python3-trustme-ptest: PKGSIZE changed from 23025 to 22100 (-4%)
packages/core2-64-poky-linux/python3-trustme/python3-trustme-src: PKGV changed from 0.9.0 [default] to 1.1.0 [default]
packages/core2-64-poky-linux/python3-trustme/python3-trustme-src: PV changed from "0.9.0" to "1.1.0"
packages/core2-64-poky-linux/python3-trustme/python3-trustme-staticdev: PKGV changed from 0.9.0 [default] to 1.1.0 [default]
packages/core2-64-poky-linux/python3-trustme/python3-trustme-staticdev: PV changed from "0.9.0" to "1.1.0"
packages/core2-64-poky-linux/python3-trustme/python3-trustme: PKGV changed from 0.9.0 [default] to 1.1.0 [default]
packages/core2-64-poky-linux/python3-trustme/python3-trustme: PV changed from "0.9.0" to "1.1.0"
packages/core2-64-poky-linux/python3-trustme/python3-trustme: PKGSIZE changed from 72696 to 72250 (-1%)
Changes to packages/core2-64-poky-linux/python3-trustme (sysroot):
  /usr/lib/python3.11/site-packages/trustme-0.9.0.dist-info moved to /usr/lib/python3.11/site-packages/trustme-1.1.0.dist-info

--===============3973087484931878324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trustme (sysroot):
  /usr/lib/python3.11/site-packages/trustme-0.9.0.dist-info moved to /usr/lib/python3.11/site-packages/trustme-1.1.0.dist-info

--===============3973087484931878324==--

