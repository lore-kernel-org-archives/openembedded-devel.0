Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E8AC25B4B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.62976.1699041165918300934
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BRpiPaPI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jgC56v1P;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b96becdb7-d18f97d2-8915-4dc9-ac04-75bd47748c2d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vade4bilJHxdsluXQmIcBxS8GNht3dGj082svNaxgoM=;
	b=BRpiPaPIqI964TkVrHifos2P4MPAmV9wM43BY4wWOt6a6oV/fatgWsfrRZONlXt1
	bwcgiHjJLdBQYtSZGNac2GAKVp6DEjw6IzsO+pQlFXANhbNZETwQW4Dsfow9ZRQPGLY
	RcZIyDjHUXB5ppdtNQPiUcBdvjcMXnEqqXqCeMM0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vade4bilJHxdsluXQmIcBxS8GNht3dGj082svNaxgoM=;
	b=jgC56v1Pg3qvoGhwD71nh3jFXTqf8wFmFhfSuK9YbkHlctZtQpddX/V/llH91TT5
	AHCLyYAyMZ0+ai1vQNPAATJPXukBo8yy6LYRjxDyX+YrdxHshmD7YARi6u5Zyp4t40h
	x1z1KuT3649WUe4gDFb7Q7NJw2VpF0OA9ZdAf0Y0=
Content-Type: multipart/mixed; boundary="===============0855450768582835290=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libraw: upgrading to 0.21.1 SUCCEEDED
Message-ID: <0101018b96becdb7-d18f97d2-8915-4dc9-ac04-75bd47748c2d-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105960

--===============0855450768582835290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libraw* to *0.21.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libraw-upgrade-0.20.2-0.21.1.patch
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
From 036d4c41312c8aab701ae928c4d2cfee354efd99 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 14:26:36 +0000
Subject: [PATCH] libraw: upgrade 0.20.2 -> 0.21.1

---
 .../{libraw_0.20.2.bb => libraw_0.21.1.bb}    | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libraw/{libraw_0.20.2.bb => libraw_0.21.1.bb} (20%)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.1.bb
similarity index 20%
rename from meta-oe/recipes-support/libraw/libraw_0.20.2.bb
rename to meta-oe/recipes-support/libraw/libraw_0.21.1.bb
index 1940864a2..8d2e44fbf 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.1.bb
@@ -1,9 +1,30 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYRIGHT
+# +++ COPYRIGHT
+# @@ -1,6 +1,6 @@
+#   ** LibRaw: Raw images processing library **
+#  
+# -Copyright (C) 2008-2020 LibRaw LLC (http://www.libraw.org, info@libraw.org)
+# +Copyright (C) 2008-2021 LibRaw LLC (http://www.libraw.org, info@libraw.org)
+#   
+#  LibRaw is free software; you can redistribute it and/or modify
+#  it under the terms of the one of two licenses as you choose:
+# 
+#
+
 SUMMARY = "raw image decoder"
 LICENSE = "LGPL-2.1-only | CDDL-1.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=74c9dffdc42805f9c0de2f97df6031fc"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1501ae0aa3c8544e63f08d6f7bf88a6f"
 
 SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=master;protocol=https"
-SRCREV = "0209b6a2caec189e6d1a9b21c10e9e49f46e5a92"
+SRCREV = "cccb97647fcee56801fa68231fa8a38aa8b52ef7"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.39.2


--===============0855450768582835290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libraw: PV changed from "0.20.2" to "0.21.1"
packages/core2-64-poky-linux/libraw: PKGV changed from 0.20.2 [default] to 0.21.1 [default]
packages/core2-64-poky-linux/libraw/libraw-dbg: PV changed from "0.20.2" to "0.21.1"
packages/core2-64-poky-linux/libraw/libraw-dbg: PKGSIZE changed from 6941872 to 7566896 (+9%)
packages/core2-64-poky-linux/libraw/libraw-dbg: PKGV changed from 0.20.2 [default] to 0.21.1 [default]
packages/core2-64-poky-linux/libraw/libraw-dbg: FILELIST: removed "/usr/lib/.debug/libraw.so.20.0.0 /usr/lib/.debug/libraw_r.so.20.0.0", added "/usr/lib/.debug/libraw_r.so.23.0.0 /usr/lib/.debug/libraw.so.23.0.0"
packages/core2-64-poky-linux/libraw/libraw-dev: PV changed from "0.20.2" to "0.21.1"
packages/core2-64-poky-linux/libraw/libraw-dev: PKGSIZE changed from 89338 to 103945 (+16%)
packages/core2-64-poky-linux/libraw/libraw-dev: PKGV changed from 0.20.2 [default] to 0.21.1 [default]
packages/core2-64-poky-linux/libraw/libraw-doc: PV changed from "0.20.2" to "0.21.1"
packages/core2-64-poky-linux/libraw/libraw-doc: PKGSIZE changed from 140310 to 158702 (+13%)
packages/core2-64-poky-linux/libraw/libraw-doc: PKGV changed from 0.20.2 [default] to 0.21.1 [default]
packages/core2-64-poky-linux/libraw/libraw-locale: PV changed from "0.20.2" to "0.21.1"
packages/core2-64-poky-linux/libraw/libraw-locale: PKGV changed from 0.20.2 [default] to 0.21.1 [default]
packages/core2-64-poky-linux/libraw/libraw-src: PV changed from "0.20.2" to "0.21.1"
packages/core2-64-poky-linux/libraw/libraw-src: PKGSIZE changed from 1599598 to 1744180 (+9%)
packages/core2-64-poky-linux/libraw/libraw-src: PKGV changed from 0.20.2 [default] to 0.21.1 [default]
packages/core2-64-poky-linux/libraw/libraw-staticdev: PV changed from "0.20.2" to "0.21.1"
packages/core2-64-poky-linux/libraw/libraw-staticdev: PKGV changed from 0.20.2 [default] to 0.21.1 [default]
packages/core2-64-poky-linux/libraw/libraw: PV changed from "0.20.2" to "0.21.1"
packages/core2-64-poky-linux/libraw/libraw: PKGSIZE changed from 2429698 to 2521250 (+4%)
packages/core2-64-poky-linux/libraw/libraw: PKGV changed from 0.20.2 [default] to 0.21.1 [default]
packages/core2-64-poky-linux/libraw/libraw: FILELIST: removed "/usr/lib/libraw_r.so.20.0.0 /usr/lib/libraw.so.20 /usr/lib/libraw_r.so.20 /usr/lib/libraw.so.20.0.0", added "/usr/lib/libraw_r.so.23.0.0 /usr/lib/libraw.so.23 /usr/lib/libraw.so.23.0.0 /usr/lib/libraw_r.so.23"
Changes to packages/core2-64-poky-linux/libraw (sysroot):
  /usr/lib/libraw_r.so changed symlink target from libraw_r.so.20.0.0 to libraw_r.so.23.0.0
  /usr/lib/libraw.so changed symlink target from libraw.so.20.0.0 to libraw.so.23.0.0
  /usr/lib/libraw_r.so.20.0.0 moved to /usr/lib/libraw_r.so.23.0.0
  /usr/lib/libraw_r.so.20 moved to /usr/lib/libraw_r.so.23
  /usr/lib/libraw.so.20.0.0 moved to /usr/lib/libraw.so.23.0.0
  /usr/lib/libraw.so.20 moved to /usr/lib/libraw.so.23

--===============0855450768582835290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libraw/libraw-dev: PKGSIZE changed from 89338 to 103945 (+16%)
packages/core2-64-poky-linux/libraw/libraw-doc: PKGSIZE changed from 140310 to 158702 (+13%)
packages/core2-64-poky-linux/libraw/libraw: FILELIST: removed "/usr/lib/libraw.so.20.0.0 /usr/lib/libraw_r.so.20.0.0 /usr/lib/libraw_r.so.20 /usr/lib/libraw.so.20", added "/usr/lib/libraw_r.so.23 /usr/lib/libraw_r.so.23.0.0 /usr/lib/libraw.so.23.0.0 /usr/lib/libraw.so.23"
Changes to packages/core2-64-poky-linux/libraw (sysroot):
  /usr/lib/libraw_r.so changed symlink target from libraw_r.so.20.0.0 to libraw_r.so.23.0.0
  /usr/lib/libraw.so changed symlink target from libraw.so.20.0.0 to libraw.so.23.0.0
  /usr/lib/libraw_r.so.20.0.0 moved to /usr/lib/libraw_r.so.23.0.0
  /usr/lib/libraw_r.so.20 moved to /usr/lib/libraw_r.so.23
  /usr/lib/libraw.so.20.0.0 moved to /usr/lib/libraw.so.23.0.0
  /usr/lib/libraw.so.20 moved to /usr/lib/libraw.so.23

--===============0855450768582835290==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libraw-upgrade-0.20.2-0.21.1.patch"

RnJvbSAwMzZkNGM0MTMxMmM4YWFiNzAxYWU5MjhjNGQyY2ZlZTM1NGVmZDk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNDoyNjozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnJhdzogdXBncmFkZSAwLjIwLjIgLT4gMC4yMS4xCgotLS0KIC4uLi97bGlicmF3XzAuMjAuMi5i
YiA9PiBsaWJyYXdfMC4yMS4xLmJifSAgICB8IDI1ICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEt
b2UvcmVjaXBlcy1zdXBwb3J0L2xpYnJhdy97bGlicmF3XzAuMjAuMi5iYiA9PiBsaWJyYXdfMC4y
MS4xLmJifSAoMjAlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnJh
dy9saWJyYXdfMC4yMC4yLmJiIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlicmF3L2xpYnJh
d18wLjIxLjEuYmIKc2ltaWxhcml0eSBpbmRleCAyMCUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNp
cGVzLXN1cHBvcnQvbGlicmF3L2xpYnJhd18wLjIwLjIuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L2xpYnJhdy9saWJyYXdfMC4yMS4xLmJiCmluZGV4IDE5NDA4NjRhMi4uOGQy
ZTQ0ZmJmIDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJyYXcvbGlicmF3
XzAuMjAuMi5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJyYXcvbGlicmF3XzAu
MjEuMS5iYgpAQCAtMSw5ICsxLDMwIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2
YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xs
b3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vu
c2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFu
ZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGlj
ZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdo
dCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWVJJR0hU
CisjICsrKyBDT1BZUklHSFQKKyMgQEAgLTEsNiArMSw2IEBACisjICAgKiogTGliUmF3OiBSYXcg
aW1hZ2VzIHByb2Nlc3NpbmcgbGlicmFyeSAqKgorIyAgCisjIC1Db3B5cmlnaHQgKEMpIDIwMDgt
MjAyMCBMaWJSYXcgTExDIChodHRwOi8vd3d3LmxpYnJhdy5vcmcsIGluZm9AbGlicmF3Lm9yZykK
KyMgK0NvcHlyaWdodCAoQykgMjAwOC0yMDIxIExpYlJhdyBMTEMgKGh0dHA6Ly93d3cubGlicmF3
Lm9yZywgaW5mb0BsaWJyYXcub3JnKQorIyAgIAorIyAgTGliUmF3IGlzIGZyZWUgc29mdHdhcmU7
IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyMgIGl0IHVuZGVyIHRoZSB0
ZXJtcyBvZiB0aGUgb25lIG9mIHR3byBsaWNlbnNlcyBhcyB5b3UgY2hvb3NlOgorIyAKKyMKKwog
U1VNTUFSWSA9ICJyYXcgaW1hZ2UgZGVjb2RlciIKIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSB8
IENEREwtMS4wIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWVJJR0hUO21kNT03NGM5
ZGZmZGM0MjgwNWY5YzBkZTJmOTdkZjYwMzFmYyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlSSUdIVDttZDU9MTUwMWFlMGFhM2M4NTQ0ZTYzZjA4ZDZmN2JmODhhNmYiCiAKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9MaWJSYXcvTGliUmF3LmdpdDticmFuY2g9bWFzdGVyO3By
b3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjAyMDliNmEyY2FlYzE4OWU2ZDFhOWIyMWMxMGU5ZTQ5
ZjQ2ZTVhOTIiCitTUkNSRVYgPSAiY2NjYjk3NjQ3ZmNlZTU2ODAxZmE2ODIzMWZhOGEzOGFhOGI1
MmVmNyIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZp
ZwotLSAKMi4zOS4yCgo=

--===============0855450768582835290==--

