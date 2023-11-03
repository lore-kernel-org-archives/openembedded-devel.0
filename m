Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB24C19F2A
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.63877.1699041166970464217
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PusN4M/9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bUEBDPfe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96beca92-c23491b4-e265-48b6-826b-407851a8a508-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ysLzKl2azNfLc3mh1jislQn+nncGU7o3cdsmIrGMm9M=;
	b=PusN4M/9s2x2XfaMjyPOhc/hWN5vaR7JuvKIhQLxLfAIgI1N+aOKGcGt9Gxm4lq7
	0dpesCKoVymT3xLmPrY2qwT1X9lLnlzkkEG3uTAXohSo0lHr6SSnW1cOoSugwyj1Fr6
	ZovhQBjjajrtCupTubS9v34cyQ0+xBclvhCTCxIQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ysLzKl2azNfLc3mh1jislQn+nncGU7o3cdsmIrGMm9M=;
	b=bUEBDPfeys+3TJjwAcBSDD4fK/wXiaTTeYP2Qe2fv3Rjxhk27a/3Nz8fBxu2YyDo
	Mbe3Ptk79IfVBqeNmfG3FevypffKRfxHaYmfYwTWH3pF//pKioMli3ZirysGHFb7z7L
	O763YE7nAird8Bcb7Dvxc8FFZ598MCu6gPTOIgXA=
Content-Type: multipart/mixed; boundary="===============4015229194651342926=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] jack: upgrading to 2 SUCCEEDED
Message-ID: <0101018b96beca92-c23491b4-e265-48b6-826b-407851a8a508-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105945

--===============4015229194651342926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *jack* to *2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-jack-upgrade-1.19.22-2.patch
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
From eef657c9b09e20176899189525b158e63b1405ae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 13:23:36 +0000
Subject: [PATCH] jack: upgrade 1.19.22 -> 2

---
 .../jack/{jack_1.19.22.bb => jack_2.bb}       | 63 +++++++++++++++++--
 1 file changed, 57 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-multimedia/jack/{jack_1.19.22.bb => jack_2.bb} (38%)

diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb b/meta-oe/recipes-multimedia/jack/jack_2.bb
similarity index 38%
rename from meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
rename to meta-oe/recipes-multimedia/jack/jack_2.bb
index ef9936dab..4b31be7b4 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_2.bb
@@ -1,3 +1,55 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- common/jack/control.h
+# +++ common/jack/control.h
+# @@ -1,20 +1,20 @@
+# -/*
+# -  JACK control API
+# +/* JACK server control API */
+# +/* SPDX-FileCopyrightText:  2008-2023 Nedko Arnaudov */
+# +/* SPDX-FileCopyrightText:  2008-2023 Grame */
+# +/* SPDX-License-Identifier: ( GPL-2.0-or-later OR LGPL-2.1-or-later OR MIT OR AFL-2.1 ) */
+# +/**
+# + * @file   jack/control.h
+# + * @ingroup publicheader
+# + * @brief  JACK control API
+# + *
+# + */
+#  
+# -  Copyright (C) 2008 Nedko Arnaudov
+# -  Copyright (C) 2008 GRAME
+# +#ifndef JACKCTL_H__2EEDAD78_DF4C_4B26_83B7_4FF1A446A47E__INCLUDED
+# +#define JACKCTL_H__2EEDAD78_DF4C_4B26_83B7_4FF1A446A47E__INCLUDED
+#  
+# -  This program is free software; you can redistribute it and/or modify
+# -  it under the terms of the GNU General Public License as published by
+# -  the Free Software Foundation; version 2 of the License.
+# -
+# -  This program is distributed in the hope that it will be useful,
+# -  but WITHOUT ANY WARRANTY; without even the implied warranty of
+# -  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# -  GNU General Public License for more details.
+# -
+# -  You should have received a copy of the GNU General Public License
+# -  along with this program; if not, write to the Free Software
+# -  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+# -
+# -*/
+# +#include <jack/types.h>
+# +#include <jack/jslist.h>
+# +#include <jack/systemdeps.h>
+# +#if !defined(sun) && !defined(__sun__)
+# +#include <stdbool.h>
+# +#endif
+# 
+#
+
 DESCRIPTION = "jackdmp is a C++ version of the JACK low-latency audio \
 server for multi-processor machines. It is a new implementation of the \
 JACK server core features that aims in removing some limitations of \
@@ -7,15 +59,14 @@ been used to have a more dynamic and robust system."
 SECTION = "libs/multimedia"
 
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = " \
-    file://common/jack/control.h;beginline=2;endline=21;md5=e6df0bf30cde8b3b825451459488195d \
-    file://common/jack/jack.h;beginline=1;endline=19;md5=6b736ed6b810592b135480a5e853392e \
-"
+LIC_FILES_CHKSUM = "file://common/jack/control.h;beginline=2;endline=21;md5=9edb8b99b7a0dcd49dbf8741444f123d \
+                    file://common/jack/jack.h;beginline=1;endline=19;md5=6b736ed6b810592b135480a5e853392e \
+                    "
 
 DEPENDS = "libsamplerate0 libsndfile1"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git;branch=master;protocol=https"
-SRCREV = "4f58969432339a250ce87fe855fb962c67d00ddb"
+SRC_URI = "git://github.com/jackaudio/jack2.git;branch=develop;protocol=https"
+SRCREV = "520dfa0ac5a72d292f5b9fc5835926f925129764"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============4015229194651342926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/jack/jack-dbg: PKGV changed from 1.19.22 [default] to 2 [default]
packages/core2-64-poky-linux/jack/jack-dbg: PV changed from "1.19.22" to "2"
packages/core2-64-poky-linux/jack/jack-dbg: PKGSIZE changed from 10655904 to 10654480 (-0%)
packages/core2-64-poky-linux/jack/jack-dev: PKGV changed from 1.19.22 [default] to 2 [default]
packages/core2-64-poky-linux/jack/jack-dev: PV changed from "1.19.22" to "2"
packages/core2-64-poky-linux/jack/jack-dev: PKGSIZE changed from 190851 to 190350 (-0%)
packages/core2-64-poky-linux/jack/jack-doc: PKGV changed from 1.19.22 [default] to 2 [default]
packages/core2-64-poky-linux/jack/jack-doc: PV changed from "1.19.22" to "2"
packages/core2-64-poky-linux/jack/jack-doc: PKGSIZE changed from 25323 to 25319 (-0%)
packages/core2-64-poky-linux/jack/jack-locale: PKGV changed from 1.19.22 [default] to 2 [default]
packages/core2-64-poky-linux/jack/jack-locale: PV changed from "1.19.22" to "2"
packages/core2-64-poky-linux/jack/jack-server: PKGV changed from 1.19.22 [default] to 2 [default]
packages/core2-64-poky-linux/jack/jack-server: PV changed from "1.19.22" to "2"
packages/core2-64-poky-linux/jack/jack-src: PKGV changed from 1.19.22 [default] to 2 [default]
packages/core2-64-poky-linux/jack/jack-src: PV changed from "1.19.22" to "2"
packages/core2-64-poky-linux/jack/jack-src: PKGSIZE changed from 2120357 to 2119379 (-0%)
packages/core2-64-poky-linux/jack/jack-staticdev: PKGV changed from 1.19.22 [default] to 2 [default]
packages/core2-64-poky-linux/jack/jack-staticdev: PV changed from "1.19.22" to "2"
packages/core2-64-poky-linux/jack/jack-utils: PKGV changed from 1.19.22 [default] to 2 [default]
packages/core2-64-poky-linux/jack/jack-utils: PV changed from "1.19.22" to "2"
packages/core2-64-poky-linux/jack/jack: PKGV changed from 1.19.22 [default] to 2 [default]
packages/core2-64-poky-linux/jack/jack: PV changed from "1.19.22" to "2"
packages/core2-64-poky-linux/jack: PKGV changed from 1.19.22 [default] to 2 [default]
packages/core2-64-poky-linux/jack: SRC_URI changed from "git://github.com/jackaudio/jack2.git;branch=master;protocol=https" to "git://github.com/jackaudio/jack2.git;branch=develop;protocol=https"
packages/core2-64-poky-linux/jack: PV changed from "1.19.22" to "2"
packages/core2-64-poky-linux/jack/libjack: PKGV changed from 1.19.22 [default] to 2 [default]
packages/core2-64-poky-linux/jack/libjack: PV changed from "1.19.22" to "2"

--===============4015229194651342926==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-jack-upgrade-1.19.22-2.patch"

RnJvbSBlZWY2NTdjOWIwOWUyMDE3Njg5OTE4OTUyNWIxNThlNjNiMTQwNWFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMzoyMzozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGph
Y2s6IHVwZ3JhZGUgMS4xOS4yMiAtPiAyCgotLS0KIC4uLi9qYWNrL3tqYWNrXzEuMTkuMjIuYmIg
PT4gamFja18yLmJifSAgICAgICB8IDYzICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA1NyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEtb2UvcmVj
aXBlcy1tdWx0aW1lZGlhL2phY2sve2phY2tfMS4xOS4yMi5iYiA9PiBqYWNrXzIuYmJ9ICgzOCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLW11bHRpbWVkaWEvamFjay9qYWNrXzEuMTku
MjIuYmIgYi9tZXRhLW9lL3JlY2lwZXMtbXVsdGltZWRpYS9qYWNrL2phY2tfMi5iYgpzaW1pbGFy
aXR5IGluZGV4IDM4JQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtbXVsdGltZWRpYS9qYWNr
L2phY2tfMS4xOS4yMi5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLW11bHRpbWVkaWEvamFj
ay9qYWNrXzIuYmIKaW5kZXggZWY5OTM2ZGFiLi40YjMxYmU3YjQgMTAwNjQ0Ci0tLSBhL21ldGEt
b2UvcmVjaXBlcy1tdWx0aW1lZGlhL2phY2svamFja18xLjE5LjIyLmJiCisrKyBiL21ldGEtb2Uv
cmVjaXBlcy1tdWx0aW1lZGlhL2phY2svamFja18yLmJiCkBAIC0xLDMgKzEsNTUgQEAKKyMgRklY
TUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2
dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBM
SUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0
aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6
ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNo
YW5nZXM6CisjCisjIC0tLSBjb21tb24vamFjay9jb250cm9sLmgKKyMgKysrIGNvbW1vbi9qYWNr
L2NvbnRyb2wuaAorIyBAQCAtMSwyMCArMSwyMCBAQAorIyAtLyoKKyMgLSAgSkFDSyBjb250cm9s
IEFQSQorIyArLyogSkFDSyBzZXJ2ZXIgY29udHJvbCBBUEkgKi8KKyMgKy8qIFNQRFgtRmlsZUNv
cHlyaWdodFRleHQ6ICAyMDA4LTIwMjMgTmVka28gQXJuYXVkb3YgKi8KKyMgKy8qIFNQRFgtRmls
ZUNvcHlyaWdodFRleHQ6ICAyMDA4LTIwMjMgR3JhbWUgKi8KKyMgKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoIEdQTC0yLjAtb3ItbGF0ZXIgT1IgTEdQTC0yLjEtb3ItbGF0ZXIgT1IgTUlU
IE9SIEFGTC0yLjEgKSAqLworIyArLyoqCisjICsgKiBAZmlsZSAgIGphY2svY29udHJvbC5oCisj
ICsgKiBAaW5ncm91cCBwdWJsaWNoZWFkZXIKKyMgKyAqIEBicmllZiAgSkFDSyBjb250cm9sIEFQ
SQorIyArICoKKyMgKyAqLworIyAgCisjIC0gIENvcHlyaWdodCAoQykgMjAwOCBOZWRrbyBBcm5h
dWRvdgorIyAtICBDb3B5cmlnaHQgKEMpIDIwMDggR1JBTUUKKyMgKyNpZm5kZWYgSkFDS0NUTF9I
X18yRUVEQUQ3OF9ERjRDXzRCMjZfODNCN180RkYxQTQ0NkE0N0VfX0lOQ0xVREVECisjICsjZGVm
aW5lIEpBQ0tDVExfSF9fMkVFREFENzhfREY0Q180QjI2XzgzQjdfNEZGMUE0NDZBNDdFX19JTkNM
VURFRAorIyAgCisjIC0gIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisjIC0gIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisjIC0gIHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZS4KKyMgLQor
IyAtICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxs
IGJlIHVzZWZ1bCwKKyMgLSAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4g
dGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyMgLSAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1Mg
Rk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorIyAtICBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAtCisjIC0gIFlvdSBzaG91bGQgaGF2ZSBy
ZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisjIC0gIGFs
b25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJl
CisjIC0gIEZvdW5kYXRpb24sIEluYy4sIDY3NSBNYXNzIEF2ZSwgQ2FtYnJpZGdlLCBNQSAwMjEz
OSwgVVNBLgorIyAtCisjIC0qLworIyArI2luY2x1ZGUgPGphY2svdHlwZXMuaD4KKyMgKyNpbmNs
dWRlIDxqYWNrL2pzbGlzdC5oPgorIyArI2luY2x1ZGUgPGphY2svc3lzdGVtZGVwcy5oPgorIyAr
I2lmICFkZWZpbmVkKHN1bikgJiYgIWRlZmluZWQoX19zdW5fXykKKyMgKyNpbmNsdWRlIDxzdGRi
b29sLmg+CisjICsjZW5kaWYKKyMgCisjCisKIERFU0NSSVBUSU9OID0gImphY2tkbXAgaXMgYSBD
KysgdmVyc2lvbiBvZiB0aGUgSkFDSyBsb3ctbGF0ZW5jeSBhdWRpbyBcCiBzZXJ2ZXIgZm9yIG11
bHRpLXByb2Nlc3NvciBtYWNoaW5lcy4gSXQgaXMgYSBuZXcgaW1wbGVtZW50YXRpb24gb2YgdGhl
IFwKIEpBQ0sgc2VydmVyIGNvcmUgZmVhdHVyZXMgdGhhdCBhaW1zIGluIHJlbW92aW5nIHNvbWUg
bGltaXRhdGlvbnMgb2YgXApAQCAtNywxNSArNTksMTQgQEAgYmVlbiB1c2VkIHRvIGhhdmUgYSBt
b3JlIGR5bmFtaWMgYW5kIHJvYnVzdCBzeXN0ZW0uIgogU0VDVElPTiA9ICJsaWJzL211bHRpbWVk
aWEiCiAKIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5ICYgTEdQTC0yLjEtb25seSIKLUxJQ19GSUxF
U19DSEtTVU0gPSAiIFwKLSAgICBmaWxlOi8vY29tbW9uL2phY2svY29udHJvbC5oO2JlZ2lubGlu
ZT0yO2VuZGxpbmU9MjE7bWQ1PWU2ZGYwYmYzMGNkZThiM2I4MjU0NTE0NTk0ODgxOTVkIFwKLSAg
ICBmaWxlOi8vY29tbW9uL2phY2svamFjay5oO2JlZ2lubGluZT0xO2VuZGxpbmU9MTk7bWQ1PTZi
NzM2ZWQ2YjgxMDU5MmIxMzU0ODBhNWU4NTMzOTJlIFwKLSIKK0xJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL2NvbW1vbi9qYWNrL2NvbnRyb2wuaDtiZWdpbmxpbmU9MjtlbmRsaW5lPTIxO21kNT05
ZWRiOGI5OWI3YTBkY2Q0OWRiZjg3NDE0NDRmMTIzZCBcCisgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9jb21tb24vamFjay9qYWNrLmg7YmVnaW5saW5lPTE7ZW5kbGluZT0xOTttZDU9NmI3MzZl
ZDZiODEwNTkyYjEzNTQ4MGE1ZTg1MzM5MmUgXAorICAgICAgICAgICAgICAgICAgICAiCiAKIERF
UEVORFMgPSAibGlic2FtcGxlcmF0ZTAgbGlic25kZmlsZTEiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9qYWNrYXVkaW8vamFjazIuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0
cHMiCi1TUkNSRVYgPSAiNGY1ODk2OTQzMjMzOWEyNTBjZTg3ZmU4NTVmYjk2MmM2N2QwMGRkYiIK
K1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9qYWNrYXVkaW8vamFjazIuZ2l0O2JyYW5jaD1k
ZXZlbG9wO3Byb3RvY29sPWh0dHBzIgorU1JDUkVWID0gIjUyMGRmYTBhYzVhNzJkMjkyZjViOWZj
NTgzNTkyNmY5MjUxMjk3NjQiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============4015229194651342926==--

