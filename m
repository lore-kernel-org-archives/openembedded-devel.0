Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B1CC16AB3
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2200.1699061894103646386
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JKM0d3dl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cTtbin34;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b97fb085d-a99fc5de-8f5e-4583-823d-b2ca31dd5ad7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RBUOwyxMFaQJjrQGPa5WUNFlMZolKLRgE1xWsfLw36M=;
	b=JKM0d3dlsVJMli6J9Ras4jtceiFLIWg2gerdSrq65Cc+csV+oj2gzn6HzDgOJ3Fo
	Fab3k0ORerYFtfbWZku3i77iWhTs/5xUOJk7+wgHv475isQKLpBp6V9Yqu8Ugu+Dvp9
	6sXrx9qN0wgVvbrwCm4Dn2VRRcs9vLxDUmj7PROY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RBUOwyxMFaQJjrQGPa5WUNFlMZolKLRgE1xWsfLw36M=;
	b=cTtbin34lWyQ7WaQOZiJwrhc5H5HbHGqxBm8Wn7ZoBWIgdSg9VnbQ7VfQOT7Fa0w
	w+ODaEyUmAiNnn1mQjjMU2qVkXE4QQwXPWoq0xy4PvAZHXI9TowUQlnNCQWNFk/yq03
	7lqfVhFjBg7mHbdn4FvIdLUZzkPgKP3dLjEPMZ7I=
Content-Type: multipart/mixed; boundary="===============1631002675774801367=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-cachetools: upgrading to 5.3.2 SUCCEEDED
Message-ID: <0101018b97fb085d-a99fc5de-8f5e-4583-823d-b2ca31dd5ad7-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106101

--===============1631002675774801367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cachetools* to *5.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cachetools-upgrade-5.3.1-5.3.2.patch
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
From 65c0dc3859fe51aa64736d96f1fd9621ac3f4adc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:23:13 +0000
Subject: [PATCH] python3-cachetools: upgrade 5.3.1 -> 5.3.2

---
 ...{python3-cachetools_5.3.1.bb => python3-cachetools_5.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_5.3.1.bb => python3-cachetools_5.3.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.3.1.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.3.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cachetools_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.3.2.bb
index 739e5a826..5946c267a 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.3.2.bb
@@ -27,6 +27,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "dce83f2d9b4e1f732a8cd44af8e8fab2dbe46201467fc98b3ef8f269092bf62b"
+SRC_URI[sha256sum] = "086ee420196f7b2ab9ca2db2520aca326318b68fe5ba8bc4d49cca91add450f2"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


--===============1631002675774801367==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cachetools-upgrade-5.3.1-5.3.2.patch"

RnJvbSA2NWMwZGMzODU5ZmU1MWFhNjQ3MzZkOTZmMWZkOTYyMWFjM2Y0YWRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDoyMzoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2FjaGV0b29sczogdXBncmFkZSA1LjMuMSAtPiA1LjMuMgoKLS0tCiAuLi57cHl0aG9u
My1jYWNoZXRvb2xzXzUuMy4xLmJiID0+IHB5dGhvbjMtY2FjaGV0b29sc181LjMuMi5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jYWNoZXRvb2xz
XzUuMy4xLmJiID0+IHB5dGhvbjMtY2FjaGV0b29sc181LjMuMi5iYn0gKDg5JSkKCmRpZmYgLS1n
aXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNhY2hldG9v
bHNfNS4zLjEuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWNhY2hldG9vbHNfNS4zLjIuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jYWNoZXRvb2xzXzUuMy4x
LmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWNhY2hldG9vbHNfNS4zLjIuYmIKaW5kZXggNzM5ZTVhODI2Li41OTQ2YzI2N2EgMTAwNjQ0Ci0t
LSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2FjaGV0b29s
c181LjMuMS5iYgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWNhY2hldG9vbHNfNS4zLjIuYmIKQEAgLTI3LDYgKzI3LDYgQEAgZG9faW5zdGFsbF9wdGVz
dCgpIHsKIAljcCAtcmYgJHtTfS90ZXN0cy8qICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLwogfQog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGNlODNmMmQ5YjRlMWY3MzJhOGNkNDRhZjhlOGZhYjJk
YmU0NjIwMTQ2N2ZjOThiM2VmOGYyNjkwOTJiZjYyYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIw
ODZlZTQyMDE5NmY3YjJhYjljYTJkYjI1MjBhY2EzMjYzMThiNjhmZTViYThiYzRkNDljY2E5MWFk
ZDQ1MGYyIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0tIAoyLjM5LjIK
Cg==

--===============1631002675774801367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cachetools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cachetools/cachetools-5.3.1.tar.gz;downloadfilename=cachetools-5.3.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/c/cachetools/cachetools-5.3.2.tar.gz;downloadfilename=cachetools-5.3.2.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-cachetools: PV changed from "5.3.1" to "5.3.2"
packages/core2-64-poky-linux/python3-cachetools: PKGV changed from 5.3.1 [default] to 5.3.2 [default]
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-dbg: PV changed from "5.3.1" to "5.3.2"
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-dbg: PKGV changed from 5.3.1 [default] to 5.3.2 [default]
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-dev: PV changed from "5.3.1" to "5.3.2"
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-dev: PKGV changed from 5.3.1 [default] to 5.3.2 [default]
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-doc: PV changed from "5.3.1" to "5.3.2"
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-doc: PKGV changed from 5.3.1 [default] to 5.3.2 [default]
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-locale: PV changed from "5.3.1" to "5.3.2"
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-locale: PKGV changed from 5.3.1 [default] to 5.3.2 [default]
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-ptest: PV changed from "5.3.1" to "5.3.2"
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-ptest: PKGV changed from 5.3.1 [default] to 5.3.2 [default]
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-src: PV changed from "5.3.1" to "5.3.2"
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-src: PKGV changed from 5.3.1 [default] to 5.3.2 [default]
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-staticdev: PV changed from "5.3.1" to "5.3.2"
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools-staticdev: PKGV changed from 5.3.1 [default] to 5.3.2 [default]
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools: PV changed from "5.3.1" to "5.3.2"
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools: PKGSIZE changed from 93008 to 93059 (+0%)
packages/core2-64-poky-linux/python3-cachetools/python3-cachetools: PKGV changed from 5.3.1 [default] to 5.3.2 [default]
Changes to packages/core2-64-poky-linux/python3-cachetools (sysroot):
  /usr/lib/python3.11/site-packages/cachetools-5.3.1.dist-info moved to /usr/lib/python3.11/site-packages/cachetools-5.3.2.dist-info

--===============1631002675774801367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cachetools (sysroot):
  /usr/lib/python3.11/site-packages/cachetools-5.3.1.dist-info moved to /usr/lib/python3.11/site-packages/cachetools-5.3.2.dist-info

--===============1631002675774801367==--

