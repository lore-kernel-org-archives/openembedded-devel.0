Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76EEC16A69
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.2199.1699061893899708834
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FMkCdgWh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Sc6llefQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b97fb078d-bafae2a4-167f-4143-87fd-94e8b05871af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Oou0xYXqaPlj7mXB05wjIKKE/BiZWS7WcOCI249mFeI=;
	b=FMkCdgWhxlHwdESok8UiJgii0mfK4VdGrk4+H0dC/UxYgQwCd137t6QDJB6TURDq
	sYTlito/W8VFlxf+zWTyjoICcsqNgT9nIev5aH615p+rzaENAQ2FFKSYgVIIsAtlR6n
	YkltHF9+km70iyxouAD3qLWlRl8Cx/gb96EktqNs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Oou0xYXqaPlj7mXB05wjIKKE/BiZWS7WcOCI249mFeI=;
	b=Sc6llefQ5CkIMyMx39jd+x3AvfWMZCyyLD84oPfOrJpLRvZemAQnElqLLBnehEe8
	DeMld+lbjnGwDTEyaTGamoDCJj4Ocdd6shWxL5JZ2wEKWFaK8WOyCdEIxUcsZuLExV2
	4cOV1eyR0ItfuTBbm38C4aB6BwI+tB0xAoNKwT2s=
Content-Type: multipart/mixed; boundary="===============1458028518703950569=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-blinker: upgrading to 1.7.0 SUCCEEDED
Message-ID: <0101018b97fb078d-bafae2a4-167f-4143-87fd-94e8b05871af-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106100

--===============1458028518703950569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-blinker* to *1.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-blinker-upgrade-1.6.3-1.7.0.patch
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
From 90120818daa8f22a023717118a26fbbc4b5e8a8d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:19:41 +0000
Subject: [PATCH] python3-blinker: upgrade 1.6.3 -> 1.7.0

---
 .../{python3-blinker_1.6.3.bb => python3-blinker_1.7.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-blinker_1.6.3.bb => python3-blinker_1.7.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.6.3.bb b/meta-python/recipes-devtools/python/python3-blinker_1.7.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-blinker_1.6.3.bb
rename to meta-python/recipes-devtools/python/python3-blinker_1.7.0.bb
index 4f0dead70..f1d8b4fa9 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.7.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=42cd19c88fc13d1307a4efd64ee90e4e"
 
-SRC_URI[sha256sum] = "152090d27c1c5c722ee7e48504b02d76502811ce02e1523553b4cf8c8b3d3a8d"
+SRC_URI[sha256sum] = "e6820ff6fa4e4d1d8e2747c2283749c3f547e4fee112b98555cdcdae32996182"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.39.2


--===============1458028518703950569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-blinker: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/blinker/blinker-1.6.3.tar.gz;downloadfilename=blinker-1.6.3.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/b/blinker/blinker-1.7.0.tar.gz;downloadfilename=blinker-1.7.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-blinker: PV changed from "1.6.3" to "1.7.0"
packages/core2-64-poky-linux/python3-blinker: PKGV changed from 1.6.3 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/python3-blinker/python3-blinker-dbg: PV changed from "1.6.3" to "1.7.0"
packages/core2-64-poky-linux/python3-blinker/python3-blinker-dbg: PKGV changed from 1.6.3 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/python3-blinker/python3-blinker-dev: PV changed from "1.6.3" to "1.7.0"
packages/core2-64-poky-linux/python3-blinker/python3-blinker-dev: PKGV changed from 1.6.3 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/python3-blinker/python3-blinker-doc: PV changed from "1.6.3" to "1.7.0"
packages/core2-64-poky-linux/python3-blinker/python3-blinker-doc: PKGV changed from 1.6.3 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/python3-blinker/python3-blinker-locale: PV changed from "1.6.3" to "1.7.0"
packages/core2-64-poky-linux/python3-blinker/python3-blinker-locale: PKGV changed from 1.6.3 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/python3-blinker/python3-blinker-ptest: PKGSIZE changed from 18698 to 18712 (+0%)
packages/core2-64-poky-linux/python3-blinker/python3-blinker-ptest: PV changed from "1.6.3" to "1.7.0"
packages/core2-64-poky-linux/python3-blinker/python3-blinker-ptest: PKGV changed from 1.6.3 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/python3-blinker/python3-blinker-src: PV changed from "1.6.3" to "1.7.0"
packages/core2-64-poky-linux/python3-blinker/python3-blinker-src: PKGV changed from 1.6.3 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/python3-blinker/python3-blinker-staticdev: PV changed from "1.6.3" to "1.7.0"
packages/core2-64-poky-linux/python3-blinker/python3-blinker-staticdev: PKGV changed from 1.6.3 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/python3-blinker/python3-blinker: PKGSIZE changed from 79548 to 77284 (-3%)
packages/core2-64-poky-linux/python3-blinker/python3-blinker: PV changed from "1.6.3" to "1.7.0"
packages/core2-64-poky-linux/python3-blinker/python3-blinker: PKGV changed from 1.6.3 [default] to 1.7.0 [default]
Changes to packages/core2-64-poky-linux/python3-blinker (sysroot):
  /usr/lib/python3.11/site-packages/blinker-1.6.3.dist-info moved to /usr/lib/python3.11/site-packages/blinker-1.7.0.dist-info

--===============1458028518703950569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-blinker (sysroot):
  /usr/lib/python3.11/site-packages/blinker-1.6.3.dist-info moved to /usr/lib/python3.11/site-packages/blinker-1.7.0.dist-info

--===============1458028518703950569==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-blinker-upgrade-1.6.3-1.7.0.patch"

RnJvbSA5MDEyMDgxOGRhYThmMjJhMDIzNzE3MTE4YTI2ZmJiYzRiNWU4YThkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDoxOTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmxpbmtlcjogdXBncmFkZSAxLjYuMyAtPiAxLjcuMAoKLS0tCiAuLi4ve3B5dGhvbjMt
Ymxpbmtlcl8xLjYuMy5iYiA9PiBweXRob24zLWJsaW5rZXJfMS43LjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1ibGlua2VyXzEuNi4z
LmJiID0+IHB5dGhvbjMtYmxpbmtlcl8xLjcuMC5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJsaW5rZXJfMS42LjMuYmIg
Yi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJsaW5rZXJfMS43
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ibGlua2VyXzEuNi4zLmJiCnJlbmFtZSB0byBtZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJsaW5rZXJfMS43LjAuYmIK
aW5kZXggNGYwZGVhZDcwLi5mMWQ4YjRmYTkgMTAwNjQ0Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmxpbmtlcl8xLjYuMy5iYgorKysgYi9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJsaW5rZXJfMS43LjAuYmIKQEAg
LTIsNyArMiw3IEBAIERFU0NSSVBUSU9OID0gIkZhc3QsIHNpbXBsZSBvYmplY3QtdG8tb2JqZWN0
IGFuZCBicm9hZGNhc3Qgc2lnbmFsaW5nLiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1PTQyY2QxOWM4OGZjMTNkMTMwN2E0ZWZkNjRl
ZTkwZTRlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTUyMDkwZDI3YzFjNWM3MjJlZTdlNDg1
MDRiMDJkNzY1MDI4MTFjZTAyZTE1MjM1NTNiNGNmOGM4YjNkM2E4ZCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJlNjgyMGZmNmZhNGU0ZDFkOGUyNzQ3YzIyODM3NDljM2Y1NDdlNGZlZTExMmI5ODU1
NWNkY2RhZTMyOTk2MTgyIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRf
bWV0YSBwdGVzdAogCi0tIAoyLjM5LjIKCg==

--===============1458028518703950569==--

