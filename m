Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F83C25B53
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.63868.1699041166053805877
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JSgcca/I;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=K34lr2/c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96becbea-af78c3ab-070d-4441-8afc-294bd192e2fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f57+Zysds7oeuJJgS99VbUYw5NWn9A+rwnu8ZywSCBY=;
	b=JSgcca/IFruQ6Th1gBS9hlbaj32gjU2s/AmB+Zu+qQmw3Sb/YQOFcnPZ7NMMdCJ5
	8LMmsWTO6necjmPObi//jbz0F7ZQufXdDhO4UOUduqu7CBJ9+GPbCKKjQSDR7CqHbj8
	M5gZArKKAf0sa8Y7n+eICOgvAPQk6HhbDXVTwWSk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f57+Zysds7oeuJJgS99VbUYw5NWn9A+rwnu8ZywSCBY=;
	b=K34lr2/cH7C28/jFo1Z5RGS6pKj6jkZuaRaq3/1w7RZ4Tt+xMdPnCyK6bm/9GOL5
	wKskQoqnWZ1wB5oSUU1EI4nw/Z+PPqPAD3aTSqVOHWo/T1XYkqICeBoKAOwJ3BmUKRB
	s230pIfKnRbDw4BpV9DHupmu+uhhCkCkr26/GX6Q=
Content-Type: multipart/mixed; boundary="===============6810363838312325769=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libbpf: upgrading to 1.2.2 SUCCEEDED
Message-ID: <0101018b96becbea-af78c3ab-070d-4441-8afc-294bd192e2fe-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105952

--===============6810363838312325769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libbpf* to *1.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libbpf-upgrade-1.2.0-1.2.2.patch
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
From 38899db289ff150f2b41952d2ef73678e960bf57 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 13:42:25 +0000
Subject: [PATCH] libbpf: upgrade 1.2.0 -> 1.2.2

---
 .../libbpf/{libbpf_1.2.0.bb => libbpf_1.2.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.2.0.bb => libbpf_1.2.2.bb} (91%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.2.2.bb
similarity index 91%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.2.2.bb
index a8e1e5c0c..8dbf7933b 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.2.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
-SRCREV = "fbd60dbff51c870f5e80a17c4f2fd639eb80af90"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-v1.2.2-bugfix"
+SRCREV = "1728e3e4bef0e138ea95ffe62163eb9a6ac6fa32"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
-- 
2.39.2


--===============6810363838312325769==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libbpf-upgrade-1.2.0-1.2.2.patch"

RnJvbSAzODg5OWRiMjg5ZmYxNTBmMmI0MTk1MmQyZWY3MzY3OGU5NjBiZjU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMzo0MjoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmJwZjogdXBncmFkZSAxLjIuMCAtPiAxLjIuMgoKLS0tCiAuLi4vbGliYnBmL3tsaWJicGZfMS4y
LjAuYmIgPT4gbGliYnBmXzEuMi4yLmJifSAgICAgICAgICAgICAgIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEtb2Uv
cmVjaXBlcy1rZXJuZWwvbGliYnBmL3tsaWJicGZfMS4yLjAuYmIgPT4gbGliYnBmXzEuMi4yLmJi
fSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1rZXJuZWwvbGliYnBmL2xpYmJw
Zl8xLjIuMC5iYiBiL21ldGEtb2UvcmVjaXBlcy1rZXJuZWwvbGliYnBmL2xpYmJwZl8xLjIuMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMta2VybmVs
L2xpYmJwZi9saWJicGZfMS4yLjAuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1rZXJuZWwv
bGliYnBmL2xpYmJwZl8xLjIuMi5iYgppbmRleCBhOGUxZTVjMGMuLjhkYmY3OTMzYiAxMDA2NDQK
LS0tIGEvbWV0YS1vZS9yZWNpcGVzLWtlcm5lbC9saWJicGYvbGliYnBmXzEuMi4wLmJiCisrKyBi
L21ldGEtb2UvcmVjaXBlcy1rZXJuZWwvbGliYnBmL2xpYmJwZl8xLjIuMi5iYgpAQCAtOCw4ICs4
LDggQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vLi4vTElDRU5TRS5MR1BMLTIuMTttZDU9
YjM3MDg4Nzk4MGRiNWRkNDA2NTliNTA5MDkyMzgKIAogREVQRU5EUyA9ICJ6bGliIGVsZnV0aWxz
IgogCi1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGliYnBmL2xpYmJwZi5naXQ7cHJvdG9j
b2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVNSQ1JFViA9ICJmYmQ2MGRiZmY1MWM4NzBmNWU4MGEx
N2M0ZjJmZDYzOWViODBhZjkwIgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2xpYmJwZi9s
aWJicGYuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1saWJicGYtdjEuMi4yLWJ1Z2ZpeCIKK1NS
Q1JFViA9ICIxNzI4ZTNlNGJlZjBlMTM4ZWE5NWZmZTYyMTYzZWI5YTZhYzZmYTMyIgogCiBQQUNL
QUdFX0FSQ0ggPSAiJHtNQUNISU5FX0FSQ0h9IgogQ09NUEFUSUJMRV9IT1NUID0gIih4ODZfNjR8
aS44Nnxhcm18YWFyY2g2NHxyaXNjdjY0fHBvd2VycGN8cG93ZXJwYzY0fG1pcHM2NCkuKi1saW51
eCIKLS0gCjIuMzkuMgoK

--===============6810363838312325769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86_64-poky-linux/libbpf: SRC_URI changed from "git://github.com/libbpf/libbpf.git;protocol=https;branch=master" to "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-v1.2.2-bugfix"
packages/qemux86_64-poky-linux/libbpf: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/qemux86_64-poky-linux/libbpf: PV changed from "1.2.0" to "1.2.2"
packages/qemux86_64-poky-linux/libbpf/libbpf-dbg: FILELIST: removed "/usr/lib/.debug/libbpf.so.1.2.0", added "/usr/lib/.debug/libbpf.so.1.2.2"
packages/qemux86_64-poky-linux/libbpf/libbpf-dbg: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/qemux86_64-poky-linux/libbpf/libbpf-dbg: PKGSIZE changed from 1216368 to 1216824 (+0%)
packages/qemux86_64-poky-linux/libbpf/libbpf-dbg: PV changed from "1.2.0" to "1.2.2"
packages/qemux86_64-poky-linux/libbpf/libbpf-dev: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/qemux86_64-poky-linux/libbpf/libbpf-dev: PV changed from "1.2.0" to "1.2.2"
packages/qemux86_64-poky-linux/libbpf/libbpf-doc: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/qemux86_64-poky-linux/libbpf/libbpf-doc: PV changed from "1.2.0" to "1.2.2"
packages/qemux86_64-poky-linux/libbpf/libbpf-locale: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/qemux86_64-poky-linux/libbpf/libbpf-locale: PV changed from "1.2.0" to "1.2.2"
packages/qemux86_64-poky-linux/libbpf/libbpf-src: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/qemux86_64-poky-linux/libbpf/libbpf-src: PKGSIZE changed from 1035885 to 1037077 (+0%)
packages/qemux86_64-poky-linux/libbpf/libbpf-src: PV changed from "1.2.0" to "1.2.2"
packages/qemux86_64-poky-linux/libbpf/libbpf-staticdev: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/qemux86_64-poky-linux/libbpf/libbpf-staticdev: PKGSIZE changed from 2279256 to 2279624 (+0%)
packages/qemux86_64-poky-linux/libbpf/libbpf-staticdev: PV changed from "1.2.0" to "1.2.2"
packages/qemux86_64-poky-linux/libbpf/libbpf: FILELIST: removed "/usr/lib/libbpf.so.1.2.0", added "/usr/lib/libbpf.so.1.2.2"
packages/qemux86_64-poky-linux/libbpf/libbpf: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/qemux86_64-poky-linux/libbpf/libbpf: PV changed from "1.2.0" to "1.2.2"
Changes to packages/qemux86_64-poky-linux/libbpf (sysroot):
  /usr/lib/libbpf.so.1 changed symlink target from libbpf.so.1.2.0 to libbpf.so.1.2.2
  /usr/lib/libbpf.so.1.2.0 moved to /usr/lib/libbpf.so.1.2.2

--===============6810363838312325769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/qemux86_64-poky-linux/libbpf/libbpf: FILELIST: removed "/usr/lib/libbpf.so.1.2.0", added "/usr/lib/libbpf.so.1.2.2"
Changes to packages/qemux86_64-poky-linux/libbpf (sysroot):
  /usr/lib/libbpf.so.1 changed symlink target from libbpf.so.1.2.0 to libbpf.so.1.2.2
  /usr/lib/libbpf.so.1.2.0 moved to /usr/lib/libbpf.so.1.2.2

--===============6810363838312325769==--

