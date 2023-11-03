Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3F3C07D5B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:50 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.62973.1699041165526848112
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eic5NXXu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aWpFfxGn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b96bec093-1ae60332-7bbd-49c7-9429-453cc7e277bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zx2vDEaadgIlIwQII0Zb6eHxyUqfn9f2481d8AqmuY4=;
	b=eic5NXXuJ1bSrCXqEDlfBBKtv/r5m6xDi4JChbmjwlx/1XRqavZdLgMsaohI1v1Q
	2k3haU6mmQ/mCB4/XVVs1rKsR4JOdHWxuN2ryrJh2jDqoguSjPObRyW3cb5YeVAM7d9
	vlNfei0ImJ8sgRP87wTfCkNogCcL60/2M9xEs9tA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zx2vDEaadgIlIwQII0Zb6eHxyUqfn9f2481d8AqmuY4=;
	b=aWpFfxGnoEe+O1f4nATN28X5uDAfSzupN5WkGl2g9nSucNh94lse+v4gYbwlRj2h
	jyNcN2dIVqv57Yqb5lbK6yS4ySmSkEWQfbbnx8bcNZ4yXw5/0R1GXyIUpwOeQsEB0zA
	OJVPPOpJpXTKmbAV73rRWBQlVE5g0Pr+pDdOU7qk=
Content-Type: multipart/mixed; boundary="===============3426041510882764261=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] ctags: upgrading to 6.0.20231029.0 SUCCEEDED
Message-ID: <0101018b96bec093-1ae60332-7bbd-49c7-9429-453cc7e277bd-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:45 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105893

--===============3426041510882764261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ctags* to *6.0.20231029.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ctags-upgrade-6.0.20231001.0-6.0.20231029.0.patch
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
From 41ca8bf4cedcc33c9ad5762efb7b1412316185e7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 12:02:27 +0000
Subject: [PATCH] ctags: upgrade 6.0.20231001.0 -> 6.0.20231029.0

---
 .../ctags/{ctags_6.0.20231001.0.bb => ctags_6.0.20231029.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20231001.0.bb => ctags_6.0.20231029.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20231001.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20231029.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20231001.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20231029.0.bb
index c1ec9e8e8..823cc5a51 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20231001.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20231029.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "0aa6d047ffd78c3baff508a53f4a176d97a28b5b"
+SRCREV = "35abbb13491d0906af78d1ec13116292fa5015f1"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============3426041510882764261==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ctags-upgrade-6.0.20231001.0-6.0.20231029.0.patch"

RnJvbSA0MWNhOGJmNGNlZGNjMzNjOWFkNTc2MmVmYjdiMTQxMjMxNjE4NWU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMjowMjoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN0
YWdzOiB1cGdyYWRlIDYuMC4yMDIzMTAwMS4wIC0+IDYuMC4yMDIzMTAyOS4wCgotLS0KIC4uLi9j
dGFncy97Y3RhZ3NfNi4wLjIwMjMxMDAxLjAuYmIgPT4gY3RhZ3NfNi4wLjIwMjMxMDI5LjAuYmJ9
ICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jdGFncy97Y3RhZ3NfNi4wLjIwMjMxMDAx
LjAuYmIgPT4gY3RhZ3NfNi4wLjIwMjMxMDI5LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL2N0YWdzL2N0YWdzXzYuMC4yMDIzMTAwMS4wLmJiIGIvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL2N0YWdzL2N0YWdzXzYuMC4yMDIzMTAyOS4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jdGFn
cy9jdGFnc182LjAuMjAyMzEwMDEuMC5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLWRldnRv
b2xzL2N0YWdzL2N0YWdzXzYuMC4yMDIzMTAyOS4wLmJiCmluZGV4IGMxZWM5ZThlOC4uODIzY2M1
YTUxIDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY3RhZ3MvY3RhZ3NfNi4w
LjIwMjMxMDAxLjAuYmIKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2N0YWdzL2N0YWdz
XzYuMC4yMDIzMTAyOS4wLmJiCkBAIC0xNCw3ICsxNCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PTA2MzZlNzNmZjAyMTVlOGQ2NzJkYzRjMzJjMzE3YmIzIgogCiBp
bmhlcml0IGF1dG90b29scy1icm9rZW5zZXAgcGtnY29uZmlnIG1hbnBhZ2VzCiAKLVNSQ1JFViA9
ICIwYWE2ZDA0N2ZmZDc4YzNiYWZmNTA4YTUzZjRhMTc2ZDk3YTI4YjViIgorU1JDUkVWID0gIjM1
YWJiYjEzNDkxZDA5MDZhZjc4ZDFlYzEzMTE2MjkyZmE1MDE1ZjEiCiBTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vdW5pdmVyc2FsLWN0YWdzL2N0YWdzO2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9
aHR0cHMiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjM5LjIKCg==

--===============3426041510882764261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ctags/ctags-dbg: PV changed from "6.0.20231001.0" to "6.0.20231029.0"
packages/core2-64-poky-linux/ctags/ctags-dbg: PKGV changed from 6.0.20231001.0 [default] to 6.0.20231029.0 [default]
packages/core2-64-poky-linux/ctags/ctags-dbg: PKGSIZE changed from 14272800 to 14289584 (+0%)
packages/core2-64-poky-linux/ctags/ctags-dev: PV changed from "6.0.20231001.0" to "6.0.20231029.0"
packages/core2-64-poky-linux/ctags/ctags-dev: PKGV changed from 6.0.20231001.0 [default] to 6.0.20231029.0 [default]
packages/core2-64-poky-linux/ctags/ctags-doc: PV changed from "6.0.20231001.0" to "6.0.20231029.0"
packages/core2-64-poky-linux/ctags/ctags-doc: PKGV changed from 6.0.20231001.0 [default] to 6.0.20231029.0 [default]
packages/core2-64-poky-linux/ctags/ctags-locale: PV changed from "6.0.20231001.0" to "6.0.20231029.0"
packages/core2-64-poky-linux/ctags/ctags-locale: PKGV changed from 6.0.20231001.0 [default] to 6.0.20231029.0 [default]
packages/core2-64-poky-linux/ctags/ctags-src: PV changed from "6.0.20231001.0" to "6.0.20231029.0"
packages/core2-64-poky-linux/ctags/ctags-src: PKGV changed from 6.0.20231001.0 [default] to 6.0.20231029.0 [default]
packages/core2-64-poky-linux/ctags/ctags-src: PKGSIZE changed from 5955370 to 5961846 (+0%)
packages/core2-64-poky-linux/ctags/ctags-staticdev: PV changed from "6.0.20231001.0" to "6.0.20231029.0"
packages/core2-64-poky-linux/ctags/ctags-staticdev: PKGV changed from 6.0.20231001.0 [default] to 6.0.20231029.0 [default]
packages/core2-64-poky-linux/ctags/ctags: PV changed from "6.0.20231001.0" to "6.0.20231029.0"
packages/core2-64-poky-linux/ctags/ctags: PKGV changed from 6.0.20231001.0 [default] to 6.0.20231029.0 [default]
packages/core2-64-poky-linux/ctags/ctags: PKGSIZE changed from 3922344 to 3926952 (+0%)
packages/core2-64-poky-linux/ctags: PKGV changed from 6.0.20231001.0 [default] to 6.0.20231029.0 [default]
packages/core2-64-poky-linux/ctags: PV changed from "6.0.20231001.0" to "6.0.20231029.0"

--===============3426041510882764261==--

