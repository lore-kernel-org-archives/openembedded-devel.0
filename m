Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EADC072DD
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4047.1699071647212744198
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JQ1/zE2h;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XR4msG8A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b988fda11-2482f284-8046-4889-86cd-f4aa42c6aad7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7x1tKVY58wU+LEE9ykA7R6ySbjFnv74Fo0b6U398K7A=;
	b=JQ1/zE2h1WMXl4ylujNzBIbI8VaWnOZBfd2XMotq+LO6v5qkwHHMBe9Mclccjr7O
	xCeUyE0mbcWhEuKrNUM1eWS1ga9oCoeWj+SR8Ud+QjA2PjQP4tPSSS5TdtxQj8EYkhi
	je1oVIlFiJZQaZqr7YB0TUSQWhNxxEc6hjJXbBm0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7x1tKVY58wU+LEE9ykA7R6ySbjFnv74Fo0b6U398K7A=;
	b=XR4msG8AJ1SwQJQE6QD38nNFzzigXo/CjWNmH+mYoh89AX80BMzu8IJP78NI0cAj
	bTPiJD+YK+fApECzatl0eJJViGX8IVRZ5m8h1GZyY2XwlfxWYBxzSnL33HaXGO9EkPo
	YpLv5hHWnOLsXtMHFIYuTcFW+0iRcv3yzKytBbHU=
Content-Type: multipart/mixed; boundary="===============6555193636681151884=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] fluidsynth: upgrading to 2.3.4 SUCCEEDED
Message-ID: <0101018b988fda11-2482f284-8046-4889-86cd-f4aa42c6aad7-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106241

--===============6555193636681151884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *fluidsynth* to *2.3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fluidsynth-upgrade-2.3.2-2.3.4.patch
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
From 2e941af8bb8af145b0b28f548755276d235ac963 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:19:59 +0000
Subject: [PATCH] fluidsynth: upgrade 2.3.2 -> 2.3.4

---
 .../recipes-multimedia/fluidsynth/fluidsynth_git.bb           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
index a1083af56..26b199943 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
@@ -5,9 +5,9 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=master;protocol=https"
-SRCREV = "4d8fe638e1a48660a4c843d493f69a86579e12f0"
+SRCREV = "5ecdc4568e45123216c6888892caad07918ef127"
 S = "${WORKDIR}/git"
-PV = "2.3.2"
+PV = "2.3.4"
 
 inherit cmake pkgconfig lib_package
 
-- 
2.39.2


--===============6555193636681151884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/fluidsynth/fluidsynth-bin: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/core2-64-poky-linux/fluidsynth/fluidsynth-bin: PV changed from "2.3.2" to "2.3.4"
packages/core2-64-poky-linux/fluidsynth/fluidsynth-dbg: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/core2-64-poky-linux/fluidsynth/fluidsynth-dbg: FILELIST: removed "/usr/lib/.debug/libfluidsynth.so.3.2.0", added "/usr/lib/.debug/libfluidsynth.so.3.2.2"
packages/core2-64-poky-linux/fluidsynth/fluidsynth-dbg: PV changed from "2.3.2" to "2.3.4"
packages/core2-64-poky-linux/fluidsynth/fluidsynth-dbg: PKGSIZE changed from 1315568 to 1318640 (+0%)
packages/core2-64-poky-linux/fluidsynth/fluidsynth-dev: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/core2-64-poky-linux/fluidsynth/fluidsynth-dev: PV changed from "2.3.2" to "2.3.4"
packages/core2-64-poky-linux/fluidsynth/fluidsynth-doc: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/core2-64-poky-linux/fluidsynth/fluidsynth-doc: PV changed from "2.3.2" to "2.3.4"
packages/core2-64-poky-linux/fluidsynth/fluidsynth-locale: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/core2-64-poky-linux/fluidsynth/fluidsynth-locale: PV changed from "2.3.2" to "2.3.4"
packages/core2-64-poky-linux/fluidsynth/fluidsynth-src: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/core2-64-poky-linux/fluidsynth/fluidsynth-src: PV changed from "2.3.2" to "2.3.4"
packages/core2-64-poky-linux/fluidsynth/fluidsynth-src: PKGSIZE changed from 2101876 to 2105062 (+0%)
packages/core2-64-poky-linux/fluidsynth/fluidsynth-staticdev: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/core2-64-poky-linux/fluidsynth/fluidsynth-staticdev: PV changed from "2.3.2" to "2.3.4"
packages/core2-64-poky-linux/fluidsynth/fluidsynth: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/core2-64-poky-linux/fluidsynth/fluidsynth: FILELIST: removed "/usr/lib/libfluidsynth.so.3.2.0", added "/usr/lib/libfluidsynth.so.3.2.2"
packages/core2-64-poky-linux/fluidsynth/fluidsynth: PV changed from "2.3.2" to "2.3.4"
packages/core2-64-poky-linux/fluidsynth: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/core2-64-poky-linux/fluidsynth: PV changed from "2.3.2" to "2.3.4"
Changes to packages/core2-64-poky-linux/fluidsynth (sysroot):
  /usr/lib/libfluidsynth.so.3 changed symlink target from libfluidsynth.so.3.2.0 to libfluidsynth.so.3.2.2
  /usr/lib/libfluidsynth.so.3.2.0 moved to /usr/lib/libfluidsynth.so.3.2.2

--===============6555193636681151884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/fluidsynth/fluidsynth: FILELIST: removed "/usr/lib/libfluidsynth.so.3.2.0", added "/usr/lib/libfluidsynth.so.3.2.2"
Changes to packages/core2-64-poky-linux/fluidsynth (sysroot):
  /usr/lib/libfluidsynth.so.3 changed symlink target from libfluidsynth.so.3.2.0 to libfluidsynth.so.3.2.2
  /usr/lib/libfluidsynth.so.3.2.0 moved to /usr/lib/libfluidsynth.so.3.2.2

--===============6555193636681151884==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fluidsynth-upgrade-2.3.2-2.3.4.patch"

RnJvbSAyZTk0MWFmOGJiOGFmMTQ1YjBiMjhmNTQ4NzU1Mjc2ZDIzNWFjOTYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzoxOTo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZs
dWlkc3ludGg6IHVwZ3JhZGUgMi4zLjIgLT4gMi4zLjQKCi0tLQogLi4uL3JlY2lwZXMtbXVsdGlt
ZWRpYS9mbHVpZHN5bnRoL2ZsdWlkc3ludGhfZ2l0LmJiICAgICAgICAgICB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZsdWlkc3ludGgvZmx1aWRzeW50
aF9naXQuYmIgYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZsdWlkc3ludGgv
Zmx1aWRzeW50aF9naXQuYmIKaW5kZXggYTEwODNhZjU2Li4yNmIxOTk5NDMgMTAwNjQ0Ci0tLSBh
L21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvZmx1aWRzeW50aC9mbHVpZHN5bnRo
X2dpdC5iYgorKysgYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZsdWlkc3lu
dGgvZmx1aWRzeW50aF9naXQuYmIKQEAgLTUsOSArNSw5IEBAIExJQ0VOU0UgPSAiTEdQTC0yLjEt
b25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWZjMTc4YmNkNDI1
MDkwOTM5YThiNjM0ZDFkNmE5NTk0IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vRmx1
aWRTeW50aC9mbHVpZHN5bnRoLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgotU1JD
UkVWID0gIjRkOGZlNjM4ZTFhNDg2NjBhNGM4NDNkNDkzZjY5YTg2NTc5ZTEyZjAiCitTUkNSRVYg
PSAiNWVjZGM0NTY4ZTQ1MTIzMjE2YzY4ODg4OTJjYWFkMDc5MThlZjEyNyIKIFMgPSAiJHtXT1JL
RElSfS9naXQiCi1QViA9ICIyLjMuMiIKK1BWID0gIjIuMy40IgogCiBpbmhlcml0IGNtYWtlIHBr
Z2NvbmZpZyBsaWJfcGFja2FnZQogCi0tIAoyLjM5LjIKCg==

--===============6555193636681151884==--

