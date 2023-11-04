Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FE8C4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.2198.1699061893894955797
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NhIQeSLc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Um/viW5g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b97fb0848-38be25e3-d519-4073-af2b-a2f22c4fafa5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wMHbjpgSHLX09m9DmDCDg+tZ6voGCc7bCf9wC8quhqI=;
	b=NhIQeSLch5rcooLuS/FNMlgtxC+VxiskM5WVPr5ZSR+k1GLj41WT293Uzm0AvO/9
	DdJVkcUO24idjaXNGbXimhoS3M+kCIGB74d6chAHYDK39gn8A6vCYdO6KRcYJDeO6N4
	49p0XObGIroHrF6RyMOqoVBBg/0w7H6R3BCadshI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wMHbjpgSHLX09m9DmDCDg+tZ6voGCc7bCf9wC8quhqI=;
	b=Um/viW5gyQBJooGExpQfX1xPgxCpTOb2dDBurFHDP8Hjc0b/qKzX5ai3siNeg2wq
	dDYnJYiZ9ucRCjvgiuahOgnAXseliM8EcZOyVl6yor8UWMlzoT9QGTwvNiP99O6G2dh
	7LtU+xIXqHImPnuovSVZcnKmveBQQPOxo7/rbuTM=
Content-Type: multipart/mixed; boundary="===============6551127762837090547=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-bitstruct: upgrading to 8.19.0 SUCCEEDED
Message-ID: <0101018b97fb0848-38be25e3-d519-4073-af2b-a2f22c4fafa5-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106098

--===============6551127762837090547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-bitstruct* to *8.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-bitstruct-upgrade-8.18.0-8.19.0.patch
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
From 2cc4c289634a477312e0b23cd8b4b60152ee505e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:16:09 +0000
Subject: [PATCH] python3-bitstruct: upgrade 8.18.0 -> 8.19.0

---
 ...{python3-bitstruct_8.18.0.bb => python3-bitstruct_8.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.18.0.bb => python3-bitstruct_8.19.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.18.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.19.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.18.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.19.0.bb
index ee1ecd66b..6401322e2 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.19.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "91865b210a4bfa86817537c0d934fac97fe671717f08665dc134551cfed3be13"
+SRC_URI[sha256sum] = "d75ba9dded85c17e885a209a00eb8e248ee40762149f2f2a79360ca857467dac"
 
 PYPI_PACKAGE = "bitstruct"
 
-- 
2.39.2


--===============6551127762837090547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-bitstruct: PKGV changed from 8.18.0 [default] to 8.19.0 [default]
packages/core2-64-poky-linux/python3-bitstruct: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/bitstruct/bitstruct-8.18.0.tar.gz;downloadfilename=bitstruct-8.18.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/bitstruct/bitstruct-8.19.0.tar.gz;downloadfilename=bitstruct-8.19.0.tar.gz"
packages/core2-64-poky-linux/python3-bitstruct: PV changed from "8.18.0" to "8.19.0"
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-dbg: PKGV changed from 8.18.0 [default] to 8.19.0 [default]
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-dbg: PV changed from "8.18.0" to "8.19.0"
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-dev: PKGV changed from 8.18.0 [default] to 8.19.0 [default]
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-dev: PV changed from "8.18.0" to "8.19.0"
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-doc: PKGV changed from 8.18.0 [default] to 8.19.0 [default]
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-doc: PV changed from "8.18.0" to "8.19.0"
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-locale: PKGV changed from 8.18.0 [default] to 8.19.0 [default]
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-locale: PV changed from "8.18.0" to "8.19.0"
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-src: PKGV changed from 8.18.0 [default] to 8.19.0 [default]
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-src: PV changed from "8.18.0" to "8.19.0"
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-staticdev: PKGV changed from 8.18.0 [default] to 8.19.0 [default]
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct-staticdev: PV changed from "8.18.0" to "8.19.0"
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct: PKGV changed from 8.18.0 [default] to 8.19.0 [default]
packages/core2-64-poky-linux/python3-bitstruct/python3-bitstruct: PV changed from "8.18.0" to "8.19.0"
Changes to packages/core2-64-poky-linux/python3-bitstruct (sysroot):
  /usr/lib/python3.11/site-packages/bitstruct-8.18.0.dist-info moved to /usr/lib/python3.11/site-packages/bitstruct-8.19.0.dist-info

--===============6551127762837090547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-bitstruct (sysroot):
  /usr/lib/python3.11/site-packages/bitstruct-8.18.0.dist-info moved to /usr/lib/python3.11/site-packages/bitstruct-8.19.0.dist-info

--===============6551127762837090547==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-bitstruct-upgrade-8.18.0-8.19.0.patch"

RnJvbSAyY2M0YzI4OTYzNGE0NzczMTJlMGIyM2NkOGI0YjYwMTUyZWU1MDVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDoxNjowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYml0c3RydWN0OiB1cGdyYWRlIDguMTguMCAtPiA4LjE5LjAKCi0tLQogLi4ue3B5dGhv
bjMtYml0c3RydWN0XzguMTguMC5iYiA9PiBweXRob24zLWJpdHN0cnVjdF84LjE5LjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYml0c3RydWN0
XzguMTguMC5iYiA9PiBweXRob24zLWJpdHN0cnVjdF84LjE5LjAuYmJ9ICg3OSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaXRzdHJ1
Y3RfOC4xOC4wLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iaXRzdHJ1Y3RfOC4xOS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYml0c3RydWN0XzguMTgu
MC5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iaXRzdHJ1Y3RfOC4xOS4wLmJiCmluZGV4IGVlMWVjZDY2Yi4uNjQwMTMyMmUyIDEwMDY0NAot
LS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpdHN0cnVj
dF84LjE4LjAuYmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1iaXRzdHJ1Y3RfOC4xOS4wLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRw
czovL2dpdGh1Yi5jb20vZWVyaW1vcS9iaXRzdHJ1Y3QiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWQ5YWE0ZWMwN2RlNzhhYmFlMjFjNDkw
YzlmZmU2MWJkIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTE4NjViMjEwYTRiZmE4NjgxNzUz
N2MwZDkzNGZhYzk3ZmU2NzE3MTdmMDg2NjVkYzEzNDU1MWNmZWQzYmUxMyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJkNzViYTlkZGVkODVjMTdlODg1YTIwOWEwMGViOGUyNDhlZTQwNzYyMTQ5ZjJm
MmE3OTM2MGNhODU3NDY3ZGFjIgogCiBQWVBJX1BBQ0tBR0UgPSAiYml0c3RydWN0IgogCi0tIAoy
LjM5LjIKCg==

--===============6551127762837090547==--

