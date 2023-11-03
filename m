Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE52C25B4E
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.63864.1699041165701040906
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TfOwycpR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Wdhn6RTF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96becb6e-a6e3f31a-17fd-41a4-b8dc-453bedc492c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gic4wREouEoYN3OwdaXpfLzm7qN7FzW8l/BzGNjZ+ts=;
	b=TfOwycpR1lQdW4kHL7tVGtTzVpRflXEXlCdUaFOLxwHK9aDNB9xcBWwEcCHVakAL
	h8HJhRPt04cvfGYXwwh1AtiC5ycMIv0cwY1egojhaiUdqLVIYiHAPFqKkUNt0YnZIG7
	oE6NSL4UDN1JlwPNSECCdyf1K0n4MlZdjCZ8oorg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gic4wREouEoYN3OwdaXpfLzm7qN7FzW8l/BzGNjZ+ts=;
	b=Wdhn6RTF+4pCxFItsTqxXByK4vBSKKRXNVD+pMLh3tzQZcX1phfx4X5m9q2S9sPL
	eW8Gx0xHTtk0txJX/WUr6I0JVRBiLDfT5r+ic0dAPNMKRefJ9ANJxjOKe5h06lVPCwN
	MXVFZPYO7P0IRqYJHkt0O3hJRLCe1je1COP+UNKs=
Content-Type: multipart/mixed; boundary="===============2091748021314489781=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] lastlog2: upgrading to 1.2.0 SUCCEEDED
Message-ID: <0101018b96becb6e-a6e3f31a-17fd-41a4-b8dc-453bedc492c8-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105957

--===============2091748021314489781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lastlog2* to *1.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lastlog2-upgrade-1.1.0-1.2.0.patch
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
From e72b7fdb05de99954f2673c32b00e45596b3febf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 13:36:05 +0000
Subject: [PATCH] lastlog2: upgrade 1.1.0 -> 1.2.0

---
 .../lastlog2/{lastlog2_1.1.0.bb => lastlog2_1.2.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/lastlog2/{lastlog2_1.1.0.bb => lastlog2_1.2.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb b/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb
rename to meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
index 757af0073..43deac383 100644
--- a/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb
+++ b/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
 SECTION = "libs"
 
-SRCREV = "585153a577788c590370d20e40263b61238dfab3"
+SRCREV = "6138dff6f2a5216065fa4833a223b56d98cb62f3"
 
 SRC_URI = "git://github.com/thkukuk/lastlog2.git;branch=main;protocol=https \
            file://0001-remove-lto-to-fix-link-error-of-clang.patch \
-- 
2.39.2


--===============2091748021314489781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lastlog2/lastlog2-dbg: PKGSIZE changed from 69632 to 70072 (+1%)
packages/core2-64-poky-linux/lastlog2/lastlog2-dbg: PV changed from "1.1.0" to "1.2.0"
packages/core2-64-poky-linux/lastlog2/lastlog2-dbg: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/lastlog2/lastlog2-dbg: FILELIST: removed "/usr/lib/.debug/liblastlog2.so.1", added "/usr/lib/.debug/liblastlog2.so.1.2.0"
packages/core2-64-poky-linux/lastlog2/lastlog2-dev: PKGSIZE changed from 2751 to 2887 (+5%)
packages/core2-64-poky-linux/lastlog2/lastlog2-dev: PV changed from "1.1.0" to "1.2.0"
packages/core2-64-poky-linux/lastlog2/lastlog2-dev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/lastlog2/lastlog2-doc: PV changed from "1.1.0" to "1.2.0"
packages/core2-64-poky-linux/lastlog2/lastlog2-doc: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/lastlog2/lastlog2-locale: PV changed from "1.1.0" to "1.2.0"
packages/core2-64-poky-linux/lastlog2/lastlog2-locale: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/lastlog2/lastlog2-src: PKGSIZE changed from 36048 to 36436 (+1%)
packages/core2-64-poky-linux/lastlog2/lastlog2-src: PV changed from "1.1.0" to "1.2.0"
packages/core2-64-poky-linux/lastlog2/lastlog2-src: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/lastlog2/lastlog2-staticdev: PV changed from "1.1.0" to "1.2.0"
packages/core2-64-poky-linux/lastlog2/lastlog2-staticdev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/lastlog2/lastlog2: PKGSIZE changed from 47950 to 52074 (+9%)
packages/core2-64-poky-linux/lastlog2/lastlog2: PV changed from "1.1.0" to "1.2.0"
packages/core2-64-poky-linux/lastlog2/lastlog2: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/lastlog2/lastlog2: FILELIST: added "/usr/lib/liblastlog2.so.1.2.0"
packages/core2-64-poky-linux/lastlog2: PV changed from "1.1.0" to "1.2.0"
packages/core2-64-poky-linux/lastlog2: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
Changes to packages/core2-64-poky-linux/lastlog2 (sysroot):
  /usr/lib/liblastlog2.so.1 changed type from file to symlink
  /usr/lib/liblastlog2.so.1 changed permissions from rwxr-xr-x to rwxrwxrwx
  /usr/lib/liblastlog2.so.1 changed symlink target from None to liblastlog2.so.1.2.0
  /usr/lib/liblastlog2.so.1.2.0 was added

--===============2091748021314489781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/lastlog2/lastlog2: FILELIST: added "/usr/lib/liblastlog2.so.1.2.0"
Changes to packages/core2-64-poky-linux/lastlog2 (sysroot):
  /usr/lib/liblastlog2.so.1 changed type from file to symlink
  /usr/lib/liblastlog2.so.1 changed permissions from rwxr-xr-x to rwxrwxrwx
  /usr/lib/liblastlog2.so.1 changed symlink target from None to liblastlog2.so.1.2.0
  /usr/lib/liblastlog2.so.1.2.0 was added

--===============2091748021314489781==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lastlog2-upgrade-1.1.0-1.2.0.patch"

RnJvbSBlNzJiN2ZkYjA1ZGU5OTk1NGYyNjczYzMyYjAwZTQ1NTk2YjNmZWJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMzozNjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxh
c3Rsb2cyOiB1cGdyYWRlIDEuMS4wIC0+IDEuMi4wCgotLS0KIC4uLi9sYXN0bG9nMi97bGFzdGxv
ZzJfMS4xLjAuYmIgPT4gbGFzdGxvZzJfMS4yLjAuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtb2Uv
cmVjaXBlcy1leHRlbmRlZC9sYXN0bG9nMi97bGFzdGxvZzJfMS4xLjAuYmIgPT4gbGFzdGxvZzJf
MS4yLjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2xh
c3Rsb2cyL2xhc3Rsb2cyXzEuMS4wLmJiIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2xhc3Rs
b2cyL2xhc3Rsb2cyXzEuMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1l
dGEtb2UvcmVjaXBlcy1leHRlbmRlZC9sYXN0bG9nMi9sYXN0bG9nMl8xLjEuMC5iYgpyZW5hbWUg
dG8gbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2xhc3Rsb2cyL2xhc3Rsb2cyXzEuMi4wLmJiCmlu
ZGV4IDc1N2FmMDA3My4uNDNkZWFjMzgzIDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0
ZW5kZWQvbGFzdGxvZzIvbGFzdGxvZzJfMS4xLjAuYmIKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4
dGVuZGVkL2xhc3Rsb2cyL2xhc3Rsb2cyXzEuMi4wLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTAyMDA5MGEwMGI2OWRkMmFmOWFiODJlYjAwMDNlYTJjIgogU0VDVElPTiA9ICJsaWJzIgogCi1T
UkNSRVYgPSAiNTg1MTUzYTU3Nzc4OGM1OTAzNzBkMjBlNDAyNjNiNjEyMzhkZmFiMyIKK1NSQ1JF
ViA9ICI2MTM4ZGZmNmYyYTUyMTYwNjVmYTQ4MzNhMjIzYjU2ZDk4Y2I2MmYzIgogCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vdGhrdWt1ay9sYXN0bG9nMi5naXQ7YnJhbmNoPW1haW47cHJv
dG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1yZW1vdmUtbHRvLXRvLWZpeC1s
aW5rLWVycm9yLW9mLWNsYW5nLnBhdGNoIFwKLS0gCjIuMzkuMgoK

--===============2091748021314489781==--

