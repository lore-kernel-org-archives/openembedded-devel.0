Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560D8C04E83
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.3432.1699067574981724263
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UmEjcofH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=B0GoXnmQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b9851ba6c-161698c1-4c8f-4650-abc2-60ff8b3105ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=luE131SDPKJ3satjSBCPZAouwg8pOVzR+KBbjROOkhI=;
	b=UmEjcofHq0iH0+Yu97bKBDUOSr6/1G9RjFJzznhb1pq3OyFSK2WHzVsHY4lr+dz+
	CiEofCyhKJPQfolH0JlfyvrJo87JkAYPjEesFLX78VYauJX63FF4Pghhqzd2SZr0kmA
	CodbAJUVnkXDci9U6IkE2OH6G28BEi/6Fp67zsJI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=luE131SDPKJ3satjSBCPZAouwg8pOVzR+KBbjROOkhI=;
	b=B0GoXnmQ0ChFOvy873SHDsH7qI8yC78cvv5qISahFlWCWUwdRTcgd/MpTHDmDrxh
	ADGD/yV40R/qaTgFoQv7ecbfKbyRwj50DJtTTSD/exRCu7QtlLU3DuXcj6NZlnRCXu3
	dXsCZiXP4bthJe9b3VbtR5qj95x45DRP0dq8Ek2k=
Content-Type: multipart/mixed; boundary="===============7292761325829714512=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] tnftp: upgrading to 20230507 SUCCEEDED
Message-ID: <0101018b9851ba6c-161698c1-4c8f-4650-abc2-60ff8b3105ca-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106221

--===============7292761325829714512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tnftp* to *20230507* has Succeeded.

Next steps:
    - apply the patch: git am 0001-tnftp-upgrade-20210827-20230507.patch
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
From 4210ae4e258392097485369a451ddb2a52b069a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 02:57:58 +0000
Subject: [PATCH] tnftp: upgrade 20210827 -> 20230507

---
 .../{tnftp_20210827.bb => tnftp_20230507.bb}  | 41 +++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/tnftp/{tnftp_20210827.bb => tnftp_20230507.bb} (42%)

diff --git a/meta-networking/recipes-support/tnftp/tnftp_20210827.bb b/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
similarity index 42%
rename from meta-networking/recipes-support/tnftp/tnftp_20210827.bb
rename to meta-networking/recipes-support/tnftp/tnftp_20230507.bb
index a6ba671e7..cf1a442b6 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
@@ -1,3 +1,39 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,6 +1,6 @@
+# -$NetBSD: COPYING,v 1.9 2021/05/16 08:28:50 lukem Exp $
+# +$NetBSD: COPYING,v 1.11 2023/04/09 01:18:28 lukem Exp $
+#  
+# -Copyright (c) 2001-2021 The NetBSD Foundation, Inc.
+# +Copyright (c) 2001-2023 The NetBSD Foundation, Inc.
+#  All rights reserved.
+#  
+#  This code is derived from software contributed to The NetBSD Foundation
+# @@ -14,13 +14,6 @@
+#  2. Redistributions in binary form must reproduce the above copyright
+#     notice, this list of conditions and the following disclaimer in the
+#     documentation and/or other materials provided with the distribution.
+# -3. All advertising materials mentioning features or use of this software
+# -   must display the following acknowledgement:
+# -       This product includes software developed by the NetBSD
+# -       Foundation, Inc. and its contributors.
+# -4. Neither the name of The NetBSD Foundation nor the names of its
+# -   contributors may be used to endorse or promote products derived
+# -   from this software without specific prior written permission.
+#  
+#  THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
+#  ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
+# 
+#
+
 SUMMARY = "Enhanced NetBSD ftp client"
 DESCRIPTION = "tnftp (formerly known as lukemftp) is a port of the NetBSD FTP client \
 to other systems. It offers many enhancements over the traditional \
@@ -28,9 +64,8 @@ ALTERNATIVE_TARGET[ftp] = "${bindir}/tnftp"
 
 FILES:${PN} = "${bindir}/tnftp"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=b4248c6fb8ecff27f256ba97b25f1a21"
-SRC_URI[md5sum] = "fdb6dd1b53dca79148c395b77c6dba5a"
-SRC_URI[sha256sum] = "101901e90b656c223ec8106370dd0d783fb63d26aa6f0b2a75f40e86a9f06ea2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbbb944979c7466ed5509b4bbc6c328b"
+SRC_URI[sha256sum] = "be0134394bd7d418a3b34892b0709eeb848557e86474e1786f0d1a887d3a6580"
 
 PACKAGECONFIG ?= "openssl \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.39.2


--===============7292761325829714512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/tnftp: PKGV changed from 20210827 [default] to 20230507 [default]
packages/core2-64-poky-linux/tnftp: SRC_URI changed from "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/tnftp-20210827.tar.gz file://0001-libedit-Include-missing-header-stdc-predef.h.patch" to "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/tnftp-20230507.tar.gz file://0001-libedit-Include-missing-header-stdc-predef.h.patch"
packages/core2-64-poky-linux/tnftp: PV changed from "20210827" to "20230507"
packages/core2-64-poky-linux/tnftp/tnftp-dbg: PKGV changed from 20210827 [default] to 20230507 [default]
packages/core2-64-poky-linux/tnftp/tnftp-dbg: PKGSIZE changed from 908904 to 914808 (+1%)
packages/core2-64-poky-linux/tnftp/tnftp-dbg: PV changed from "20210827" to "20230507"
packages/core2-64-poky-linux/tnftp/tnftp-dev: PKGV changed from 20210827 [default] to 20230507 [default]
packages/core2-64-poky-linux/tnftp/tnftp-dev: PV changed from "20210827" to "20230507"
packages/core2-64-poky-linux/tnftp/tnftp-doc: PKGV changed from 20210827 [default] to 20230507 [default]
packages/core2-64-poky-linux/tnftp/tnftp-doc: PKGSIZE changed from 55955 to 56201 (+0%)
packages/core2-64-poky-linux/tnftp/tnftp-doc: PV changed from "20210827" to "20230507"
packages/core2-64-poky-linux/tnftp/tnftp-locale: PKGV changed from 20210827 [default] to 20230507 [default]
packages/core2-64-poky-linux/tnftp/tnftp-locale: PV changed from "20210827" to "20230507"
packages/core2-64-poky-linux/tnftp/tnftp-src: PKGV changed from 20210827 [default] to 20230507 [default]
packages/core2-64-poky-linux/tnftp/tnftp-src: PKGSIZE changed from 815961 to 821476 (+1%)
packages/core2-64-poky-linux/tnftp/tnftp-src: PV changed from "20210827" to "20230507"
packages/core2-64-poky-linux/tnftp/tnftp-staticdev: PKGV changed from 20210827 [default] to 20230507 [default]
packages/core2-64-poky-linux/tnftp/tnftp-staticdev: PV changed from "20210827" to "20230507"
packages/core2-64-poky-linux/tnftp/tnftp: PKGV changed from 20210827 [default] to 20230507 [default]
packages/core2-64-poky-linux/tnftp/tnftp: PKGSIZE changed from 338704 to 346896 (+2%)
packages/core2-64-poky-linux/tnftp/tnftp: PV changed from "20210827" to "20230507"

--===============7292761325829714512==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tnftp-upgrade-20210827-20230507.patch"

RnJvbSA0MjEwYWU0ZTI1ODM5MjA5NzQ4NTM2OWE0NTFkZGIyYTUyYjA2OWE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMjo1Nzo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRu
ZnRwOiB1cGdyYWRlIDIwMjEwODI3IC0+IDIwMjMwNTA3CgotLS0KIC4uLi97dG5mdHBfMjAyMTA4
MjcuYmIgPT4gdG5mdHBfMjAyMzA1MDcuYmJ9ICB8IDQxICsrKysrKysrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvdG5mdHAve3RuZnRwXzIwMjEwODI3LmJiID0+
IHRuZnRwXzIwMjMwNTA3LmJifSAoNDIlKQoKZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9y
ZWNpcGVzLXN1cHBvcnQvdG5mdHAvdG5mdHBfMjAyMTA4MjcuYmIgYi9tZXRhLW5ldHdvcmtpbmcv
cmVjaXBlcy1zdXBwb3J0L3RuZnRwL3RuZnRwXzIwMjMwNTA3LmJiCnNpbWlsYXJpdHkgaW5kZXgg
NDIlCnJlbmFtZSBmcm9tIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvdG5mdHAvdG5m
dHBfMjAyMTA4MjcuYmIKcmVuYW1lIHRvIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQv
dG5mdHAvdG5mdHBfMjAyMzA1MDcuYmIKaW5kZXggYTZiYTY3MWU3Li5jZjFhNDQyYjYgMTAwNjQ0
Ci0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvdG5mdHAvdG5mdHBfMjAyMTA4
MjcuYmIKKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC90bmZ0cC90bmZ0cF8y
MDIzMDUwNy5iYgpAQCAtMSwzICsxLDM5IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlO
RworIyArKysgQ09QWUlORworIyBAQCAtMSw2ICsxLDYgQEAKKyMgLSROZXRCU0Q6IENPUFlJTkcs
diAxLjkgMjAyMS8wNS8xNiAwODoyODo1MCBsdWtlbSBFeHAgJAorIyArJE5ldEJTRDogQ09QWUlO
Ryx2IDEuMTEgMjAyMy8wNC8wOSAwMToxODoyOCBsdWtlbSBFeHAgJAorIyAgCisjIC1Db3B5cmln
aHQgKGMpIDIwMDEtMjAyMSBUaGUgTmV0QlNEIEZvdW5kYXRpb24sIEluYy4KKyMgK0NvcHlyaWdo
dCAoYykgMjAwMS0yMDIzIFRoZSBOZXRCU0QgRm91bmRhdGlvbiwgSW5jLgorIyAgQWxsIHJpZ2h0
cyByZXNlcnZlZC4KKyMgIAorIyAgVGhpcyBjb2RlIGlzIGRlcml2ZWQgZnJvbSBzb2Z0d2FyZSBj
b250cmlidXRlZCB0byBUaGUgTmV0QlNEIEZvdW5kYXRpb24KKyMgQEAgLTE0LDEzICsxNCw2IEBA
CisjICAyLiBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhl
IGFib3ZlIGNvcHlyaWdodAorIyAgICAgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBh
bmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyIGluIHRoZQorIyAgICAgZG9jdW1lbnRhdGlvbiBh
bmQvb3Igb3RoZXIgbWF0ZXJpYWxzIHByb3ZpZGVkIHdpdGggdGhlIGRpc3RyaWJ1dGlvbi4KKyMg
LTMuIEFsbCBhZHZlcnRpc2luZyBtYXRlcmlhbHMgbWVudGlvbmluZyBmZWF0dXJlcyBvciB1c2Ug
b2YgdGhpcyBzb2Z0d2FyZQorIyAtICAgbXVzdCBkaXNwbGF5IHRoZSBmb2xsb3dpbmcgYWNrbm93
bGVkZ2VtZW50OgorIyAtICAgICAgIFRoaXMgcHJvZHVjdCBpbmNsdWRlcyBzb2Z0d2FyZSBkZXZl
bG9wZWQgYnkgdGhlIE5ldEJTRAorIyAtICAgICAgIEZvdW5kYXRpb24sIEluYy4gYW5kIGl0cyBj
b250cmlidXRvcnMuCisjIC00LiBOZWl0aGVyIHRoZSBuYW1lIG9mIFRoZSBOZXRCU0QgRm91bmRh
dGlvbiBub3IgdGhlIG5hbWVzIG9mIGl0cworIyAtICAgY29udHJpYnV0b3JzIG1heSBiZSB1c2Vk
IHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cyBkZXJpdmVkCisjIC0gICBmcm9tIHRoaXMg
c29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBwcmlvciB3cml0dGVuIHBlcm1pc3Npb24uCisjICAK
KyMgIFRISVMgU09GVFdBUkUgSVMgUFJPVklERUQgQlkgVEhFIE5FVEJTRCBGT1VOREFUSU9OLCBJ
TkMuIEFORCBDT05UUklCVVRPUlMKKyMgIGBgQVMgSVMnJyBBTkQgQU5ZIEVYUFJFU1MgT1IgSU1Q
TElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRAorIyAKKyMKKwogU1VN
TUFSWSA9ICJFbmhhbmNlZCBOZXRCU0QgZnRwIGNsaWVudCIKIERFU0NSSVBUSU9OID0gInRuZnRw
IChmb3JtZXJseSBrbm93biBhcyBsdWtlbWZ0cCkgaXMgYSBwb3J0IG9mIHRoZSBOZXRCU0QgRlRQ
IGNsaWVudCBcCiB0byBvdGhlciBzeXN0ZW1zLiBJdCBvZmZlcnMgbWFueSBlbmhhbmNlbWVudHMg
b3ZlciB0aGUgdHJhZGl0aW9uYWwgXApAQCAtMjgsOSArNjQsOCBAQCBBTFRFUk5BVElWRV9UQVJH
RVRbZnRwXSA9ICIke2JpbmRpcn0vdG5mdHAiCiAKIEZJTEVTOiR7UE59ID0gIiR7YmluZGlyfS90
bmZ0cCIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjQyNDhjNmZi
OGVjZmYyN2YyNTZiYTk3YjI1ZjFhMjEiCi1TUkNfVVJJW21kNXN1bV0gPSAiZmRiNmRkMWI1M2Rj
YTc5MTQ4YzM5NWI3N2M2ZGJhNWEiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTAxOTAxZTkwYjY1
NmMyMjNlYzgxMDYzNzBkZDBkNzgzZmI2M2QyNmFhNmYwYjJhNzVmNDBlODZhOWYwNmVhMiIKK0xJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWZiYmI5NDQ5NzljNzQ2NmVkNTUw
OWI0YmJjNmMzMjhiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJlMDEzNDM5NGJkN2Q0MThhM2Iz
NDg5MmIwNzA5ZWViODQ4NTU3ZTg2NDc0ZTE3ODZmMGQxYTg4N2QzYTY1ODAiCiAKIFBBQ0tBR0VD
T05GSUcgPz0gIm9wZW5zc2wgXAogICAgICR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRV
UkVTJywgJ2lwdjYnLCBkKX0gXAotLSAKMi4zOS4yCgo=

--===============7292761325829714512==--

