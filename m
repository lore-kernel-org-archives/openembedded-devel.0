Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C59C05054
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.2203.1699061894630771382
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FzPdzIvj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ignhQ4YK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b97fb172d-0980d93c-fae6-428f-9350-010717302b6d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o62DZ7XBsH04Kc5auZ9d3f/C6TGmurZ/ydflLPQgdRI=;
	b=FzPdzIvjPGABZQ+MO10lkCSZUZZjQ4O+F0SjBifgVR2a6gHp0uUGyatJqa6x92vv
	soCWXjMdRmnLKp3iHDRhOh2zAtkULkfL+t/iX7LuWEaecB6cBhEEsfRVKiAGuDNXAKi
	hLCTdgWPd+i3Jk3gFwFkLrIrYtFO0jaDiQdueo0Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o62DZ7XBsH04Kc5auZ9d3f/C6TGmurZ/ydflLPQgdRI=;
	b=ignhQ4YKO6gnvfIzG+MXeB91r7VyucGUJx1b1goSIDvausuOo3zjWuBFqB7kjBi3
	Fq5nj5nZ+tYJhFgOgVFVeH4kCCJzxIKdrmkxfQdspfhiTuCE5PvEv0caAfuED3B+5mx
	KPyhavgtyTV41njAuVdC2cYtabNy0nzQGCGNYLGE=
Content-Type: multipart/mixed; boundary="===============5371588923742747076=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pymongo: upgrading to 4.6.0 SUCCEEDED
Message-ID: <0101018b97fb172d-0980d93c-fae6-428f-9350-010717302b6d-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106153

--===============5371588923742747076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pymongo* to *4.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pymongo-upgrade-4.5.0-4.6.0.patch
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
From 96d012ea27877af6753592d94a9eab01d968b40c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 00:01:21 +0000
Subject: [PATCH] python3-pymongo: upgrade 4.5.0 -> 4.6.0

---
 .../{python3-pymongo_4.5.0.bb => python3-pymongo_4.6.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.5.0.bb => python3-pymongo_4.6.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.5.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb
index 9ae3eef0c..18e29a17b 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "681f252e43b3ef054ca9161635f81b730f4d8cadd28b3f2b2004f5a72f853982"
+SRC_URI[sha256sum] = "fb1c56d891f9e34303c451998ef62ba52659648bb0d75b03c5e4ac223a3342c2"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============5371588923742747076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pymongo: PV changed from "4.5.0" to "4.6.0"
packages/core2-64-poky-linux/python3-pymongo: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pymongo/pymongo-4.5.0.tar.gz;downloadfilename=pymongo-4.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pymongo/pymongo-4.6.0.tar.gz;downloadfilename=pymongo-4.6.0.tar.gz"
packages/core2-64-poky-linux/python3-pymongo: PKGV changed from 4.5.0 [default] to 4.6.0 [default]
packages/core2-64-poky-linux/python3-pymongo/python3-bson: PKGSIZE changed from 634327 to 637379 (+0%)
packages/core2-64-poky-linux/python3-pymongo/python3-bson: PV changed from "4.5.0" to "4.6.0"
packages/core2-64-poky-linux/python3-pymongo/python3-bson: PKGV changed from 4.5.0 [default] to 4.6.0 [default]
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-dbg: PKGSIZE changed from 426336 to 429080 (+1%)
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-dbg: PV changed from "4.5.0" to "4.6.0"
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-dbg: PKGV changed from 4.5.0 [default] to 4.6.0 [default]
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-dev: PV changed from "4.5.0" to "4.6.0"
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-dev: PKGV changed from 4.5.0 [default] to 4.6.0 [default]
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-doc: PV changed from "4.5.0" to "4.6.0"
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-doc: PKGV changed from 4.5.0 [default] to 4.6.0 [default]
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-locale: PV changed from "4.5.0" to "4.6.0"
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-locale: PKGV changed from 4.5.0 [default] to 4.6.0 [default]
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-src: PKGSIZE changed from 178388 to 179772 (+1%)
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-src: PV changed from "4.5.0" to "4.6.0"
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-src: PKGV changed from 4.5.0 [default] to 4.6.0 [default]
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-staticdev: PV changed from "4.5.0" to "4.6.0"
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo-staticdev: PKGV changed from 4.5.0 [default] to 4.6.0 [default]
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo: PKGSIZE changed from 2805186 to 2826528 (+1%)
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo: PV changed from "4.5.0" to "4.6.0"
packages/core2-64-poky-linux/python3-pymongo/python3-pymongo: PKGV changed from 4.5.0 [default] to 4.6.0 [default]
Changes to packages/core2-64-poky-linux/python3-pymongo (sysroot):
  /usr/lib/python3.11/site-packages/pymongo-4.5.0.dist-info moved to /usr/lib/python3.11/site-packages/pymongo-4.6.0.dist-info

--===============5371588923742747076==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pymongo-upgrade-4.5.0-4.6.0.patch"

RnJvbSA5NmQwMTJlYTI3ODc3YWY2NzUzNTkyZDk0YTllYWIwMWQ5NjhiNDBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMDowMToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHltb25nbzogdXBncmFkZSA0LjUuMCAtPiA0LjYuMAoKLS0tCiAuLi4ve3B5dGhvbjMt
cHltb25nb180LjUuMC5iYiA9PiBweXRob24zLXB5bW9uZ29fNC42LjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weW1vbmdvXzQuNS4w
LmJiID0+IHB5dGhvbjMtcHltb25nb180LjYuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5bW9uZ29fNC41LjAuYmIg
Yi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5bW9uZ29fNC42
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW1vbmdvXzQuNS4wLmJiCnJlbmFtZSB0byBtZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5bW9uZ29fNC42LjAuYmIK
aW5kZXggOWFlM2VlZjBjLi4xOGUyOWExN2IgMTAwNjQ0Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHltb25nb180LjUuMC5iYgorKysgYi9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5bW9uZ29fNC42LjAuYmIKQEAg
LTgsNyArOCw3IEBAIEhPTUVQQUdFID0gImh0dHA6Ly9naXRodWIuY29tL21vbmdvZGIvbW9uZ28t
cHl0aG9uLWRyaXZlciIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjgxZjI1MmU0M2IzZWYwNTRjYTkxNjE2MzVmODFiNzMw
ZjRkOGNhZGQyOGIzZjJiMjAwNGY1YTcyZjg1Mzk4MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJm
YjFjNTZkODkxZjllMzQzMDNjNDUxOTk4ZWY2MmJhNTI2NTk2NDhiYjBkNzViMDNjNWU0YWMyMjNh
MzM0MmMyIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAKMi4zOS4yCgo=

--===============5371588923742747076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pymongo (sysroot):
  /usr/lib/python3.11/site-packages/pymongo-4.5.0.dist-info moved to /usr/lib/python3.11/site-packages/pymongo-4.6.0.dist-info

--===============5371588923742747076==--

