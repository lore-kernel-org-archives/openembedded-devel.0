Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF145C07EBD
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.62975.1699041165814423711
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=egXtQVbU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HmmZIyH0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bebf86-93903a84-d47f-4da5-ba16-dde80de49691-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GCBY/K0+/Lk52049iU9HsrOKJX5OKLfZ3UXbFBpTuI0=;
	b=egXtQVbUBeAgqXTwzce9vJG4lUtssZBG1Zr9Pxuk5nAYM5DIbCyyr0qJIKqXIC8V
	HsyHoRL+BML7wmDqp1yCiikFRb658Nuecx2tWqF0ehmfDr/UfU2LEOytGTBJ1CjCbbb
	j6e4bdv2MwboHBlFCJ2KonlUfx751Fu1YyhxPBxU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GCBY/K0+/Lk52049iU9HsrOKJX5OKLfZ3UXbFBpTuI0=;
	b=HmmZIyH0cqf3nHfiVIZMeJQ5c4gCIqsDrmeugGRxOx+tk4UUjH7hjyLd/CIVwn90
	Y7Q7fbALQpa6apegEjrHDAvyGh3mCrBheb21SJi6+rTQZ4oeklzwSNezEqsAn3n12Kc
	l3c9xkEV2nlT9KThSMsQq7ckT9H9yaEP59GRiVnY=
Content-Type: multipart/mixed; boundary="===============5982508440002149787=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] ccid: upgrading to 1.5.4 SUCCEEDED
Message-ID: <0101018b96bebf86-93903a84-d47f-4da5-ba16-dde80de49691-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:45 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105887

--===============5982508440002149787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccid* to *1.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccid-upgrade-1.5.2-1.5.4.patch
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
From 619cd7d6ec0fb1a2d4016516e6f88f8cc4dc83db Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 11:50:55 +0000
Subject: [PATCH] ccid: upgrade 1.5.2 -> 1.5.4

---
 meta-oe/recipes-support/ccid/{ccid_1.5.2.bb => ccid_1.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.5.2.bb => ccid_1.5.4.bb} (85%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.5.2.bb b/meta-oe/recipes-support/ccid/ccid_1.5.4.bb
similarity index 85%
rename from meta-oe/recipes-support/ccid/ccid_1.5.2.bb
rename to meta-oe/recipes-support/ccid/ccid_1.5.4.bb
index 0802e80f7..e53ffa40b 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.5.2.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.5.4.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
     file://0001-Add-build-rule-for-README.patch \
 "
 
-SRC_URI[sha256sum] = "13934487e6f8b48f699a16d367cc7a1af7a3ca874de721ac6e9633beb86e7219"
+SRC_URI[sha256sum] = "6e832adc172ecdcfdee2b56f33144684882cbe972daff1938e7a9c73a64f88bf"
 
 inherit autotools pkgconfig
 
-- 
2.39.2


--===============5982508440002149787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ccid/ccid-dbg: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/ccid/ccid-dbg: PV changed from "1.5.2" to "1.5.4"
packages/core2-64-poky-linux/ccid/ccid-dbg: PKGSIZE changed from 265288 to 265712 (+0%)
packages/core2-64-poky-linux/ccid/ccid-dev: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/ccid/ccid-dev: PV changed from "1.5.2" to "1.5.4"
packages/core2-64-poky-linux/ccid/ccid-doc: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/ccid/ccid-doc: PV changed from "1.5.2" to "1.5.4"
packages/core2-64-poky-linux/ccid/ccid-locale: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/ccid/ccid-locale: PV changed from "1.5.2" to "1.5.4"
packages/core2-64-poky-linux/ccid/ccid-src: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/ccid/ccid-src: PV changed from "1.5.2" to "1.5.4"
packages/core2-64-poky-linux/ccid/ccid-src: PKGSIZE changed from 427118 to 429793 (+1%)
packages/core2-64-poky-linux/ccid/ccid-staticdev: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/ccid/ccid-staticdev: PV changed from "1.5.2" to "1.5.4"
packages/core2-64-poky-linux/ccid/ccid: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/ccid/ccid: PV changed from "1.5.2" to "1.5.4"
packages/core2-64-poky-linux/ccid/ccid: PKGSIZE changed from 178892 to 180301 (+1%)
packages/core2-64-poky-linux/ccid: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/ccid: SRC_URI changed from "https://ccid.apdu.fr/files/ccid-1.5.2.tar.bz2 file://0001-Add-build-rule-for-README.patch" to "https://ccid.apdu.fr/files/ccid-1.5.4.tar.bz2 file://0001-Add-build-rule-for-README.patch"
packages/core2-64-poky-linux/ccid: PV changed from "1.5.2" to "1.5.4"

--===============5982508440002149787==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccid-upgrade-1.5.2-1.5.4.patch"

RnJvbSA2MTljZDdkNmVjMGZiMWEyZDQwMTY1MTZlNmY4OGY4Y2M0ZGM4M2RiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMTo1MDo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
aWQ6IHVwZ3JhZGUgMS41LjIgLT4gMS41LjQKCi0tLQogbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQv
Y2NpZC97Y2NpZF8xLjUuMi5iYiA9PiBjY2lkXzEuNS40LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtb2UvcmVjaXBl
cy1zdXBwb3J0L2NjaWQve2NjaWRfMS41LjIuYmIgPT4gY2NpZF8xLjUuNC5iYn0gKDg1JSkKCmRp
ZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jY2lkL2NjaWRfMS41LjIuYmIgYi9t
ZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jY2lkL2NjaWRfMS41LjQuYmIKc2ltaWxhcml0eSBpbmRl
eCA4NSUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvY2NpZC9jY2lkXzEuNS4y
LmJiCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jY2lkL2NjaWRfMS41LjQuYmIK
aW5kZXggMDgwMmU4MGY3Li5lNTNmZmE0MGIgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1z
dXBwb3J0L2NjaWQvY2NpZF8xLjUuMi5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9j
Y2lkL2NjaWRfMS41LjQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Nj
aWQuYXBkdS5mci9maWxlcy9jY2lkLSR7UFZ9LnRhci5iejIgXAogICAgIGZpbGU6Ly8wMDAxLUFk
ZC1idWlsZC1ydWxlLWZvci1SRUFETUUucGF0Y2ggXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMTM5MzQ0ODdlNmY4YjQ4ZjY5OWExNmQzNjdjYzdhMWFmN2EzY2E4NzRkZTcyMWFjNmU5NjMz
YmViODZlNzIxOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZTgzMmFkYzE3MmVjZGNmZGVlMmI1
NmYzMzE0NDY4NDg4MmNiZTk3MmRhZmYxOTM4ZTdhOWM3M2E2NGY4OGJmIgogCiBpbmhlcml0IGF1
dG90b29scyBwa2djb25maWcKIAotLSAKMi4zOS4yCgo=

--===============5982508440002149787==--

