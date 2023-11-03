Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04803C04A95
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:49 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.62974.1699041165700227562
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KtBs/mR9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=g1D1ckJa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96bec733-af6fe632-c588-4aec-a8e8-43cdd512c384-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qsu4c679Z1uXHbW15+gtBNEItIssz4Ntca1g1sZ0TDI=;
	b=KtBs/mR9nq0IFR199U5LC6KqjD22bH2XykBSv3nMj5VdJZvRDQc67k8nlyE6EU78
	nlQwXVMF1D1NufqsZYsroudc7I54NmXAS+jQWjH+7wI77NY2rAvvVPECAT/9isGsDsW
	xUYC/bP8MgFXGP5YZA469PMZ9zjQX1UAvusoRRds=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qsu4c679Z1uXHbW15+gtBNEItIssz4Ntca1g1sZ0TDI=;
	b=g1D1ckJa/1hxNjow4SeLL0UVyYGrlJNRQeBo7GI3xsUy0/UOlR5AojlxYEVAiC+K
	uuVAtk6T6eTyNVXUF9aWXAYTOWVSzd6EBi3uy6ALgnhGpgXil62VVokxxGVzzpAQ6Ef
	EK+yd5KGvMscBtCeB9AsfX9HJast+yUzX1FD7tn4=
Content-Type: multipart/mixed; boundary="===============7377536356587373599=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] googlebenchmark: upgrading to 1.8.3 SUCCEEDED
Message-ID: <0101018b96bec733-af6fe632-c588-4aec-a8e8-43cdd512c384-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105926

--===============7377536356587373599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *googlebenchmark* to *1.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-googlebenchmark-upgrade-1.8.0-1.8.3.patch
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
From ac9e65ae0484b3c92d5b6a125b576285a71b0cc7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 12:48:16 +0000
Subject: [PATCH] googlebenchmark: upgrade 1.8.0 -> 1.8.3

---
 .../{googlebenchmark_1.8.0.bb => googlebenchmark_1.8.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.8.0.bb => googlebenchmark_1.8.3.bb} (90%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.0.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.3.bb
similarity index 90%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.0.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.3.bb
index 209f51ea3..f945a30f3 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.0.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.3.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
-SRCREV = "2dd015dfef425c866d9a43f2c67d8b52d709acb6"
+SRCREV = "344117638c8ff7e239044fd0fa7085839fc03021"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============7377536356587373599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-dbg: PKGSIZE changed from 7600448 to 7656752 (+1%)
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-dbg: FILELIST: removed "/usr/lib/.debug/libbenchmark.so.1.8.0 /usr/lib/.debug/libbenchmark_main.so.1.8.0", added "/usr/lib/.debug/libbenchmark.so.1.8.3 /usr/lib/.debug/libbenchmark_main.so.1.8.3"
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-dbg: PV changed from "1.8.0" to "1.8.3"
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-dbg: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-dev: PKGSIZE changed from 82753 to 83974 (+1%)
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-dev: PV changed from "1.8.0" to "1.8.3"
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-dev: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-doc: PKGSIZE changed from 73145 to 164949 (+126%)
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-doc: FILELIST: added "/usr/share/doc/benchmark/assets/images/icon_black.png /usr/share/doc/benchmark/assets/images/icon_black.xcf /usr/share/doc/benchmark/assets/images/icon.xcf /usr/share/doc/benchmark/assets/images/icon.png"
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-doc: PV changed from "1.8.0" to "1.8.3"
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-doc: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-locale: PV changed from "1.8.0" to "1.8.3"
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-locale: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-src: PKGSIZE changed from 308064 to 310296 (+1%)
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-src: PV changed from "1.8.0" to "1.8.3"
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-src: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-staticdev: PV changed from "1.8.0" to "1.8.3"
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-staticdev: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark: FILELIST: removed "/usr/lib/libbenchmark_main.so.1.8.0 /usr/lib/libbenchmark.so.1.8.0", added "/usr/lib/libbenchmark_main.so.1.8.3 /usr/lib/libbenchmark.so.1.8.3"
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark: PV changed from "1.8.0" to "1.8.3"
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/googlebenchmark: PV changed from "1.8.0" to "1.8.3"
packages/core2-64-poky-linux/googlebenchmark: PKGV changed from 1.8.0 [default] to 1.8.3 [default]
Changes to packages/core2-64-poky-linux/googlebenchmark (sysroot):
  /usr/lib/libbenchmark_main.so.1 changed symlink target from libbenchmark_main.so.1.8.0 to libbenchmark_main.so.1.8.3
  /usr/lib/libbenchmark.so.1 changed symlink target from libbenchmark.so.1.8.0 to libbenchmark.so.1.8.3
  /usr/lib/libbenchmark_main.so.1.8.0 moved to /usr/lib/libbenchmark_main.so.1.8.3
  /usr/lib/libbenchmark.so.1.8.0 moved to /usr/lib/libbenchmark.so.1.8.3

--===============7377536356587373599==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-googlebenchmark-upgrade-1.8.0-1.8.3.patch"

RnJvbSBhYzllNjVhZTA0ODRiM2M5MmQ1YjZhMTI1YjU3NjI4NWE3MWIwY2M3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMjo0ODoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdv
b2dsZWJlbmNobWFyazogdXBncmFkZSAxLjguMCAtPiAxLjguMwoKLS0tCiAuLi4ve2dvb2dsZWJl
bmNobWFya18xLjguMC5iYiA9PiBnb29nbGViZW5jaG1hcmtfMS44LjMuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9nb29nbGViZW5jaG1hcmsve2dvb2dsZWJlbmNobWFya18x
LjguMC5iYiA9PiBnb29nbGViZW5jaG1hcmtfMS44LjMuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvZ29vZ2xlYmVuY2htYXJrL2dvb2dsZWJlbmNobWFya18x
LjguMC5iYiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2dvb2dsZWJlbmNobWFyay9nb29nbGVi
ZW5jaG1hcmtfMS44LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvZ29vZ2xlYmVuY2htYXJrL2dvb2dsZWJlbmNobWFya18xLjguMC5i
YgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvZ29vZ2xlYmVuY2htYXJrL2dvb2ds
ZWJlbmNobWFya18xLjguMy5iYgppbmRleCAyMDlmNTFlYTMuLmY5NDVhMzBmMyAxMDA2NDQKLS0t
IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvZ29vZ2xlYmVuY2htYXJrL2dvb2dsZWJlbmNobWFy
a18xLjguMC5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9nb29nbGViZW5jaG1hcmsv
Z29vZ2xlYmVuY2htYXJrXzEuOC4zLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIkFwYWNo
ZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5NjM4
N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2dv
b2dsZS9iZW5jaG1hcmsuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgotU1JDUkVWID0g
IjJkZDAxNWRmZWY0MjVjODY2ZDlhNDNmMmM2N2Q4YjUyZDcwOWFjYjYiCitTUkNSRVYgPSAiMzQ0
MTE3NjM4YzhmZjdlMjM5MDQ0ZmQwZmE3MDg1ODM5ZmMwMzAyMSIKIAogUyA9ICIke1dPUktESVJ9
L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============7377536356587373599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-doc: FILELIST: added "/usr/share/doc/benchmark/assets/images/icon_black.xcf /usr/share/doc/benchmark/assets/images/icon.xcf /usr/share/doc/benchmark/assets/images/icon_black.png /usr/share/doc/benchmark/assets/images/icon.png"
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark-doc: PKGSIZE changed from 73145 to 164949 (+126%)
packages/core2-64-poky-linux/googlebenchmark/googlebenchmark: FILELIST: removed "/usr/lib/libbenchmark.so.1.8.0 /usr/lib/libbenchmark_main.so.1.8.0", added "/usr/lib/libbenchmark.so.1.8.3 /usr/lib/libbenchmark_main.so.1.8.3"
Changes to packages/core2-64-poky-linux/googlebenchmark (sysroot):
  /usr/lib/libbenchmark_main.so.1 changed symlink target from libbenchmark_main.so.1.8.0 to libbenchmark_main.so.1.8.3
  /usr/lib/libbenchmark.so.1 changed symlink target from libbenchmark.so.1.8.0 to libbenchmark.so.1.8.3
  /usr/lib/libbenchmark_main.so.1.8.0 moved to /usr/lib/libbenchmark_main.so.1.8.3
  /usr/lib/libbenchmark.so.1.8.0 moved to /usr/lib/libbenchmark.so.1.8.3

--===============7377536356587373599==--

