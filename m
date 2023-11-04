Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FC9C072AB
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.4049.1699071647297787418
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=arZ3ZjRc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GiyKZji7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b988fdb84-085b9d87-c2c9-4419-97d9-64dbfbd20396-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MrqFBVlXs0ndsBHFQ+BPdkVeFfP0Fn3/rtXIb/7DdUI=;
	b=arZ3ZjRc6J6CjdNpQzaVm2aMFLHXcOARkrpB2u0Ph9NJ5FbejnC3VxEUpoCr8h/6
	LtyTHRsxv04NfwyYbL1aZHHVOx/hQh9lhhinGeAYV/4TQTpfhnZoPhVvMEh6hj4nvwM
	FN0zlJmjEO9vdPVL5/d+fa89t/z/8ZLnKP7wXNXg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MrqFBVlXs0ndsBHFQ+BPdkVeFfP0Fn3/rtXIb/7DdUI=;
	b=GiyKZji7XX5Em1PeZPsDQCrQEWj3ErvX63Sdq1CgKOboVejeis6EkVRa8m51FmHJ
	jmMIOrP0JE28jTmoaEAeAR2Z2WgiyE8RGOUIFH4SnmcBX3+z80TFbDBF5s3gsFxg87n
	m987wJjwd7sK50c60Wf+5jPUchYmRA1Vp8TRXxj0=
Content-Type: multipart/mixed; boundary="===============7076679447996730781=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libdvbpsi: upgrading to 1.3.3 SUCCEEDED
Message-ID: <0101018b988fdb84-085b9d87-c2c9-4419-97d9-64dbfbd20396-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106243

--===============7076679447996730781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdvbpsi* to *1.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdvbpsi-upgrade-1.3.0-1.3.3.patch
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
From 5125ca082b95d2b16202c4ec6297dd109eed0e23 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:42:16 +0000
Subject: [PATCH] libdvbpsi: upgrade 1.3.0 -> 1.3.3

---
 .../libdvbpsi/{libdvbpsi_1.3.0.bb => libdvbpsi_1.3.3.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libdvbpsi/{libdvbpsi_1.3.0.bb => libdvbpsi_1.3.3.bb} (75%)

diff --git a/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb b/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.3.bb
similarity index 75%
rename from meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb
rename to meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.3.bb
index 5ca146792..719fbf91e 100644
--- a/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.3.bb
@@ -6,7 +6,6 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://download.videolan.org/pub/libdvbpsi/${PV}/libdvbpsi-${PV}.tar.bz2"
-SRC_URI[md5sum] = "2b217039a1299000c39423441f77e76a"
-SRC_URI[sha256sum] = "a2fed1d11980662f919bbd1f29e2462719e0f6227e1a531310bd5a706db0a1fe"
+SRC_URI[sha256sum] = "02b5998bcf289cdfbd8757bedd5987e681309b0a25b3ffe6cebae599f7a00112"
 
 inherit autotools
-- 
2.39.2


--===============7076679447996730781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libdvbpsi: PV changed from "1.3.0" to "1.3.3"
packages/core2-64-poky-linux/libdvbpsi: PKGV changed from 1.3.0 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/libdvbpsi: SRC_URI changed from "http://download.videolan.org/pub/libdvbpsi/1.3.0/libdvbpsi-1.3.0.tar.bz2" to "http://download.videolan.org/pub/libdvbpsi/1.3.3/libdvbpsi-1.3.3.tar.bz2"
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-dbg: PV changed from "1.3.0" to "1.3.3"
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-dbg: PKGV changed from 1.3.0 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-dbg: PKGSIZE changed from 410136 to 410016 (-0%)
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-dev: PV changed from "1.3.0" to "1.3.3"
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-dev: PKGV changed from 1.3.0 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-doc: PV changed from "1.3.0" to "1.3.3"
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-doc: PKGV changed from 1.3.0 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-locale: PV changed from "1.3.0" to "1.3.3"
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-locale: PKGV changed from 1.3.0 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-src: PV changed from "1.3.0" to "1.3.3"
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-src: PKGV changed from 1.3.0 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-src: PKGSIZE changed from 1054442 to 1054533 (+0%)
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-staticdev: PV changed from "1.3.0" to "1.3.3"
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi-staticdev: PKGV changed from 1.3.0 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi: PV changed from "1.3.0" to "1.3.3"
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi: PKGV changed from 1.3.0 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/libdvbpsi/libdvbpsi: PKGSIZE changed from 128939 to 133035 (+3%)

--===============7076679447996730781==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdvbpsi-upgrade-1.3.0-1.3.3.patch"

RnJvbSA1MTI1Y2EwODJiOTVkMmIxNjIwMmM0ZWM2Mjk3ZGQxMDllZWQwZTIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzo0MjoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmR2YnBzaTogdXBncmFkZSAxLjMuMCAtPiAxLjMuMwoKLS0tCiAuLi4vbGliZHZicHNpL3tsaWJk
dmJwc2lfMS4zLjAuYmIgPT4gbGliZHZicHNpXzEuMy4zLmJifSAgICAgICB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1t
dWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJkdmJwc2kve2xpYmR2YnBzaV8xLjMuMC5i
YiA9PiBsaWJkdmJwc2lfMS4zLjMuYmJ9ICg3NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1tdWx0aW1l
ZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJkdmJwc2kvbGliZHZicHNpXzEuMy4wLmJiIGIvbWV0
YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJkdmJwc2kvbGliZHZicHNpXzEuMy4z
LmJiCnNpbWlsYXJpdHkgaW5kZXggNzUlCnJlbmFtZSBmcm9tIG1ldGEtbXVsdGltZWRpYS9yZWNp
cGVzLW11bHRpbWVkaWEvbGliZHZicHNpL2xpYmR2YnBzaV8xLjMuMC5iYgpyZW5hbWUgdG8gbWV0
YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJkdmJwc2kvbGliZHZicHNpXzEuMy4z
LmJiCmluZGV4IDVjYTE0Njc5Mi4uNzE5ZmJmOTFlIDEwMDY0NAotLS0gYS9tZXRhLW11bHRpbWVk
aWEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYmR2YnBzaS9saWJkdmJwc2lfMS4zLjAuYmIKKysrIGIv
bWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJkdmJwc2kvbGliZHZicHNpXzEu
My4zLmJiCkBAIC02LDcgKzYsNiBAQCBMSUNFTlNFID0gIkxHUEwtMi4xLW9ubHkiCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhi
MzY0NTE2YyIKIAogU1JDX1VSSSA9ICJodHRwOi8vZG93bmxvYWQudmlkZW9sYW4ub3JnL3B1Yi9s
aWJkdmJwc2kvJHtQVn0vbGliZHZicHNpLSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW21kNXN1bV0g
PSAiMmIyMTcwMzlhMTI5OTAwMGMzOTQyMzQ0MWY3N2U3NmEiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYTJmZWQxZDExOTgwNjYyZjkxOWJiZDFmMjllMjQ2MjcxOWUwZjYyMjdlMWE1MzEzMTBiZDVh
NzA2ZGIwYTFmZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMmI1OTk4YmNmMjg5Y2RmYmQ4NzU3
YmVkZDU5ODdlNjgxMzA5YjBhMjViM2ZmZTZjZWJhZTU5OWY3YTAwMTEyIgogCiBpbmhlcml0IGF1
dG90b29scwotLSAKMi4zOS4yCgo=

--===============7076679447996730781==--

