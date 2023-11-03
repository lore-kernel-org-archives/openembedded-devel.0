Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102A5C074FD
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.62968.1699041164665655841
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f4uMMf4v;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Fk/2dqVi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bec215-53497e08-2cba-4655-a18d-c19a040e1bbd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KoTdTgSvW18Etgxy5mdDbPSVxuYqKwqPou44Fa/zwVc=;
	b=f4uMMf4vs+rf7++ABTN9g11I5Bq3NTmG5ZPrjt+VhRHfpHaBgoEoqHAuPpw0HbTC
	S5Z94UF2uDeN4YKtSAIxO7C7tRs/UKfxz26UHU9XD5N/9dSG3BEyk+BUbhAn/40iaUJ
	bs3OILoMje5qkM+UopFPlaOfqxsk9/UM0CI+2/dE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KoTdTgSvW18Etgxy5mdDbPSVxuYqKwqPou44Fa/zwVc=;
	b=Fk/2dqViqdfSu1KbT0m05kOEifaLmuOOEGV7fwkqt3URfDhQKX9x1RJUTHRgild1
	xTo1uVhqFFdTOOoyEHRAKSAX6K+jlGN+dkWTIGzJRpls10T8VmtXFTwSOKH8Y7dUTTv
	BeOsO8XOoI5TFd3556vYTq/FhGysTy4EVy6eAa3A=
Content-Type: multipart/mixed; boundary="===============8190611020022593389=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] feh: upgrading to 3.10.1 SUCCEEDED
Message-ID: <0101018b96bec215-53497e08-2cba-4655-a18d-c19a040e1bbd-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:45 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105902

--===============8190611020022593389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *feh* to *3.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-feh-upgrade-3.10-3.10.1.patch
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
From efa61d9c2f833fbfe8daa440277a43d8760969c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 12:11:33 +0000
Subject: [PATCH] feh: upgrade 3.10 -> 3.10.1

---
 .../feh/{feh_3.10.bb => feh_3.10.1.bb}        | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.10.bb => feh_3.10.1.bb} (41%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.10.bb b/meta-oe/recipes-graphics/feh/feh_3.10.1.bb
similarity index 41%
rename from meta-oe/recipes-graphics/feh/feh_3.10.bb
rename to meta-oe/recipes-graphics/feh/feh_3.10.1.bb
index ec18f11aa..ccdd788b3 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.10.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.10.1.bb
@@ -1,15 +1,35 @@
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
+# @@ -1,5 +1,5 @@
+#  Copyright (C) 1999,2000 Tom Gilbert.
+# -Copyright (C) 2010-2020 Daniel Friesel.
+# +Copyright (C) 2010-2023 Birte Kristina Friesel.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to
+# 
+#
+
 SUMMARY = "X11 image viewer aimed mostly at console users"
 HOMEPAGE = "https://feh.finalrewind.org/"
 SECTION = "x11/utils"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f91bd06901085c94bdc50649d98c5059"
+LIC_FILES_CHKSUM = "file://COPYING;md5=150e4c518ff8aaecfe35694e47661d9a"
 DEPENDS = "\
     imlib2 \
     virtual/libx11 libxt\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "1d71d1f6dcfe9ffee5e2766969a11978f7eb4fac7d7ae556f104c11f9c57cc98"
+SRC_URI[sha256sum] = "ec5e44d3cfe6f50f1c64f28a6f0225d958f4f4621726d9c2a04b5a32e5106d23"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.39.2


--===============8190611020022593389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/feh/feh-dbg: PKGSIZE changed from 684376 to 683584 (-0%)
packages/core2-64-poky-linux/feh/feh-dbg: PV changed from "3.10" to "3.10.1"
packages/core2-64-poky-linux/feh/feh-dbg: PKGV changed from 3.10 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/feh/feh-dev: PV changed from "3.10" to "3.10.1"
packages/core2-64-poky-linux/feh/feh-dev: PKGV changed from 3.10 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/feh/feh-doc: PKGSIZE changed from 197831 to 198276 (+0%)
packages/core2-64-poky-linux/feh/feh-doc: PV changed from "3.10" to "3.10.1"
packages/core2-64-poky-linux/feh/feh-doc: PKGV changed from 3.10 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/feh/feh-locale: PV changed from "3.10" to "3.10.1"
packages/core2-64-poky-linux/feh/feh-locale: PKGV changed from 3.10 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/feh/feh-src: PKGSIZE changed from 438712 to 439405 (+0%)
packages/core2-64-poky-linux/feh/feh-src: PV changed from "3.10" to "3.10.1"
packages/core2-64-poky-linux/feh/feh-src: PKGV changed from 3.10 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/feh/feh-staticdev: PV changed from "3.10" to "3.10.1"
packages/core2-64-poky-linux/feh/feh-staticdev: PKGV changed from 3.10 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/feh/feh: PV changed from "3.10" to "3.10.1"
packages/core2-64-poky-linux/feh/feh: PKGV changed from 3.10 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/feh: PV changed from "3.10" to "3.10.1"
packages/core2-64-poky-linux/feh: SRC_URI changed from "https://feh.finalrewind.org/feh-3.10.tar.bz2" to "https://feh.finalrewind.org/feh-3.10.1.tar.bz2"
packages/core2-64-poky-linux/feh: PKGV changed from 3.10 [default] to 3.10.1 [default]

--===============8190611020022593389==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-feh-upgrade-3.10-3.10.1.patch"

RnJvbSBlZmE2MWQ5YzJmODMzZmJmZThkYWE0NDAyNzdhNDNkODc2MDk2OWMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMjoxMTozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZl
aDogdXBncmFkZSAzLjEwIC0+IDMuMTAuMQoKLS0tCiAuLi4vZmVoL3tmZWhfMy4xMC5iYiA9PiBm
ZWhfMy4xMC4xLmJifSAgICAgICAgfCAyNCArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhLW9lL3Jl
Y2lwZXMtZ3JhcGhpY3MvZmVoL3tmZWhfMy4xMC5iYiA9PiBmZWhfMy4xMC4xLmJifSAoNDElKQoK
ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9mZWgvZmVoXzMuMTAuYmIgYi9t
ZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvZmVoL2ZlaF8zLjEwLjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA0MSUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL2ZlaC9mZWhfMy4xMC5i
YgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL2ZlaC9mZWhfMy4xMC4xLmJiCmlu
ZGV4IGVjMThmMTFhYS4uY2NkZDc4OGIzIDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtZ3Jh
cGhpY3MvZmVoL2ZlaF8zLjEwLmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9mZWgv
ZmVoXzMuMTAuMS5iYgpAQCAtMSwxNSArMSwzNSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19D
SEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBU
aGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5l
dyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVl
ZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2
aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBj
b3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENP
UFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTEsNSArMSw1IEBACisjICBDb3B5cmlnaHQgKEMp
IDE5OTksMjAwMCBUb20gR2lsYmVydC4KKyMgLUNvcHlyaWdodCAoQykgMjAxMC0yMDIwIERhbmll
bCBGcmllc2VsLgorIyArQ29weXJpZ2h0IChDKSAyMDEwLTIwMjMgQmlydGUgS3Jpc3RpbmEgRnJp
ZXNlbC4KKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFy
Z2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAgb2YgdGhpcyBzb2Z0d2FyZSBh
bmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvCisj
IAorIworCiBTVU1NQVJZID0gIlgxMSBpbWFnZSB2aWV3ZXIgYWltZWQgbW9zdGx5IGF0IGNvbnNv
bGUgdXNlcnMiCiBIT01FUEFHRSA9ICJodHRwczovL2ZlaC5maW5hbHJld2luZC5vcmcvIgogU0VD
VElPTiA9ICJ4MTEvdXRpbHMiCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWY5MWJkMDY5MDEwODVjOTRiZGM1MDY0OWQ5OGM1MDU5IgorTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MTUwZTRjNTE4ZmY4YWFlY2ZlMzU2
OTRlNDc2NjFkOWEiCiBERVBFTkRTID0gIlwKICAgICBpbWxpYjIgXAogICAgIHZpcnR1YWwvbGli
eDExIGxpYnh0XAogIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZmVoLmZpbmFscmV3aW5kLm9yZy9m
ZWgtJHtQVn0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxZDcxZDFmNmRjZmU5ZmZl
ZTVlMjc2Njk2OWExMTk3OGY3ZWI0ZmFjN2Q3YWU1NTZmMTA0YzExZjljNTdjYzk4IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImVjNWU0NGQzY2ZlNmY1MGYxYzY0ZjI4YTZmMDIyNWQ5NThmNGY0NjIx
NzI2ZDljMmEwNGI1YTMyZTUxMDZkMjMiCiAKIGluaGVyaXQgbWltZS14ZGcgZmVhdHVyZXNfY2hl
Y2sKICMgZGVwZW5kcyBvbiB2aXJ0dWFsL2xpYngxMQotLSAKMi4zOS4yCgo=

--===============8190611020022593389==--

