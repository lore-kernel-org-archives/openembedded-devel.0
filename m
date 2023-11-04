Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C84AC001B5
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 02:05:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.2619.1699063504855509115
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 19:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aQWA9Dnj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=itJ4rp9X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b98139c4c-7d96b7d9-97e6-4e10-b3ad-678dbc4a6dc5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699063504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hxKuEMOXJ/eVJfz9FzyOCxHE3DBAyA5Goimf4Zid91U=;
	b=aQWA9Dnj8LqgY1DgbsQgXmIjNh9FUbiKfeV7BQ0s2xp265kH4uwDUNQaSpEagFfj
	FiFMqmKWvHsh1kn6Brt5SQwH3t8p6nQParzpSrBzsHLYahWeNYwfBPREmhSS6qIGozC
	2x0XauflnkvQbKU0oOf7aySZmtlsYLh7laucgU9E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699063504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hxKuEMOXJ/eVJfz9FzyOCxHE3DBAyA5Goimf4Zid91U=;
	b=itJ4rp9X2D2DfHzL6pwXu8TjPvTM0bRwUCXiM2A4xDkVgVuhplmO4dlGeRt9kOrM
	AjN57NCpK9fHyZrgQze//Swy+pgYO/KR8IcIEUk4wythuF/e6wTJ/tLJTtAp5aRNkbE
	jdIgQMbVpY2UhcVjrEvKju1aEP7/Da5DY12jpIAA=
Content-Type: multipart/mixed; boundary="===============3082596507144362211=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libmodule-build-tiny-perl: upgrading to 0.047 SUCCEEDED
Message-ID: <0101018b98139c4c-7d96b7d9-97e6-4e10-b3ad-678dbc4a6dc5-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 02:05:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 02:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106192

--===============3082596507144362211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmodule-build-tiny-perl* to *0.047* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmodule-build-tiny-perl-upgrade-0.046-0.047.patch
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
From 89673062ac5e34bf31eec7d6d21d84e293089a1c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 01:53:21 +0000
Subject: [PATCH] libmodule-build-tiny-perl: upgrade 0.046 -> 0.047

---
 ....bb => libmodule-build-tiny-perl_0.047.bb} | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-build-tiny-perl_0.046.bb => libmodule-build-tiny-perl_0.047.bb} (69%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.047.bb
similarity index 69%
rename from meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.047.bb
index 1e23d87a6..4ff7daf66 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.047.bb
@@ -1,3 +1,32 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -270,13 +270,13 @@
+#  That's all there is to it!
+#  
+#  
+# ---- The Artistic License 1.0 (Perl) ---
+# +--- The Perl Artistic License 1.0 ---
+#  
+#  This software is Copyright (c) 2011 by Leon Timmermans, David Golden.
+#  
+#  This is free software, licensed under:
+#  
+# -  The Artistic License 1.0 (Perl)
+# +  The Perl Artistic License 1.0
+#  
+#  
+#  
+# 
+#
+
 SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
 DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
 Makefile.PL file to drive distribution configuration, build, test and \
@@ -10,12 +39,12 @@ SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=147a7b891d1584d3d33e478b1f2327c5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2b9e8b5e2bd19fcc97ac84b78a271a64"
 
 DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
-SRC_URI[sha256sum] = "be193027e2debb4c9926434aaf1aa46c9fc7bf4db83dcc347eb6e359ee878289"
+SRC_URI[sha256sum] = "71260e9421b93c33dd1b3e7d0cf15f759c0ca7c753fa840279ec3be70f8f8c9d"
 
 S = "${WORKDIR}/Module-Build-Tiny-${PV}"
 
-- 
2.39.2


--===============3082596507144362211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libmodule-build-tiny-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Module-Build-Tiny-0.046.tar.gz file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Module-Build-Tiny-0.047.tar.gz file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/libmodule-build-tiny-perl: PKGV changed from 0.046 [default] to 0.047 [default]
packages/core2-64-poky-linux/libmodule-build-tiny-perl: PV changed from "0.046" to "0.047"
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-dbg: PKGV changed from 0.046 [default] to 0.047 [default]
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-dbg: PV changed from "0.046" to "0.047"
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-dev: PKGV changed from 0.046 [default] to 0.047 [default]
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-dev: PV changed from "0.046" to "0.047"
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-doc: PKGV changed from 0.046 [default] to 0.047 [default]
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-doc: PV changed from "0.046" to "0.047"
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-locale: PKGV changed from 0.046 [default] to 0.047 [default]
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-locale: PV changed from "0.046" to "0.047"
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-ptest: PKGV changed from 0.046 [default] to 0.047 [default]
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-ptest: PV changed from "0.046" to "0.047"
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-src: PKGV changed from 0.046 [default] to 0.047 [default]
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-src: PV changed from "0.046" to "0.047"
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-staticdev: PKGV changed from 0.046 [default] to 0.047 [default]
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl-staticdev: PV changed from "0.046" to "0.047"
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl: PKGSIZE changed from 11120 to 11134 (+0%)
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl: PKGV changed from 0.046 [default] to 0.047 [default]
packages/core2-64-poky-linux/libmodule-build-tiny-perl/libmodule-build-tiny-perl: PV changed from "0.046" to "0.047"

--===============3082596507144362211==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmodule-build-tiny-perl-upgrade-0.046-0.047.patch"

RnJvbSA4OTY3MzA2MmFjNWUzNGJmMzFlZWM3ZDZkMjFkODRlMjkzMDg5YTFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMTo1MzoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1vZHVsZS1idWlsZC10aW55LXBlcmw6IHVwZ3JhZGUgMC4wNDYgLT4gMC4wNDcKCi0tLQogLi4u
LmJiID0+IGxpYm1vZHVsZS1idWlsZC10aW55LXBlcmxfMC4wNDcuYmJ9IHwgMzMgKysrKysrKysr
KysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS1wZXJsL3JlY2lwZXMtcGVybC9saWJtb2R1bGUve2xpYm1vZHVsZS1i
dWlsZC10aW55LXBlcmxfMC4wNDYuYmIgPT4gbGlibW9kdWxlLWJ1aWxkLXRpbnktcGVybF8wLjA0
Ny5iYn0gKDY5JSkKCmRpZmYgLS1naXQgYS9tZXRhLXBlcmwvcmVjaXBlcy1wZXJsL2xpYm1vZHVs
ZS9saWJtb2R1bGUtYnVpbGQtdGlueS1wZXJsXzAuMDQ2LmJiIGIvbWV0YS1wZXJsL3JlY2lwZXMt
cGVybC9saWJtb2R1bGUvbGlibW9kdWxlLWJ1aWxkLXRpbnktcGVybF8wLjA0Ny5iYgpzaW1pbGFy
aXR5IGluZGV4IDY5JQpyZW5hbWUgZnJvbSBtZXRhLXBlcmwvcmVjaXBlcy1wZXJsL2xpYm1vZHVs
ZS9saWJtb2R1bGUtYnVpbGQtdGlueS1wZXJsXzAuMDQ2LmJiCnJlbmFtZSB0byBtZXRhLXBlcmwv
cmVjaXBlcy1wZXJsL2xpYm1vZHVsZS9saWJtb2R1bGUtYnVpbGQtdGlueS1wZXJsXzAuMDQ3LmJi
CmluZGV4IDFlMjNkODdhNi4uNGZmN2RhZjY2IDEwMDY0NAotLS0gYS9tZXRhLXBlcmwvcmVjaXBl
cy1wZXJsL2xpYm1vZHVsZS9saWJtb2R1bGUtYnVpbGQtdGlueS1wZXJsXzAuMDQ2LmJiCisrKyBi
L21ldGEtcGVybC9yZWNpcGVzLXBlcmwvbGlibW9kdWxlL2xpYm1vZHVsZS1idWlsZC10aW55LXBl
cmxfMC4wNDcuYmIKQEAgLTEsMyArMSwzMiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VO
U0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTI3MCwxMyArMjcwLDEzIEBACisjICBUaGF0J3MgYWxs
IHRoZXJlIGlzIHRvIGl0IQorIyAgCisjICAKKyMgLS0tLSBUaGUgQXJ0aXN0aWMgTGljZW5zZSAx
LjAgKFBlcmwpIC0tLQorIyArLS0tIFRoZSBQZXJsIEFydGlzdGljIExpY2Vuc2UgMS4wIC0tLQor
IyAgCisjICBUaGlzIHNvZnR3YXJlIGlzIENvcHlyaWdodCAoYykgMjAxMSBieSBMZW9uIFRpbW1l
cm1hbnMsIERhdmlkIEdvbGRlbi4KKyMgIAorIyAgVGhpcyBpcyBmcmVlIHNvZnR3YXJlLCBsaWNl
bnNlZCB1bmRlcjoKKyMgIAorIyAtICBUaGUgQXJ0aXN0aWMgTGljZW5zZSAxLjAgKFBlcmwpCisj
ICsgIFRoZSBQZXJsIEFydGlzdGljIExpY2Vuc2UgMS4wCisjICAKKyMgIAorIyAgCisjIAorIwor
CiBTVU1NQVJZID0gIk1vZHVsZTo6QnVpbGQ6OlRpbnkgLSBBIHRpbnkgcmVwbGFjZW1lbnQgZm9y
IE1vZHVsZTo6QnVpbGQiCiBERVNDUklQVElPTiA9ICJNYW55IFBlcmwgZGlzdHJpYnV0aW9ucyB1
c2UgYSBCdWlsZC5QTCBmaWxlIGluc3RlYWQgb2YgYSBcCiBNYWtlZmlsZS5QTCBmaWxlIHRvIGRy
aXZlIGRpc3RyaWJ1dGlvbiBjb25maWd1cmF0aW9uLCBidWlsZCwgdGVzdCBhbmQgXApAQCAtMTAs
MTIgKzM5LDEyIEBAIFNFQ1RJT04gPSAibGlicyIKIEhPTUVQQUdFID0gImh0dHA6Ly9zZWFyY2gu
Y3Bhbi5vcmcvfmxlb250L01vZHVsZS1CdWlsZC1UaW55LyIKIAogTElDRU5TRSA9ICJBcnRpc3Rp
Yy0xLjAgfCBHUEwtMS4wLW9yLWxhdGVyIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9MTQ3YTdiODkxZDE1ODRkM2QzM2U0NzhiMWYyMzI3YzUiCitMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yYjllOGI1ZTJiZDE5ZmNjOTdhYzg0Yjc4YTI3MWE2
NCIKIAogREVQRU5EUyA9ICJsaWJleHR1dGlscy1jb25maWctcGVybC1uYXRpdmUgbGliZXh0dXRp
bHMtaGVscGVycy1wZXJsLW5hdGl2ZSBsaWJleHR1dGlscy1pbnN0YWxscGF0aHMtcGVybC1uYXRp
dmUiCiAKIFNSQ19VUkkgPSAiJHtDUEFOX01JUlJPUn0vYXV0aG9ycy9pZC9ML0xFL0xFT05UL01v
ZHVsZS1CdWlsZC1UaW55LSR7UFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiZTE5
MzAyN2UyZGViYjRjOTkyNjQzNGFhZjFhYTQ2YzlmYzdiZjRkYjgzZGNjMzQ3ZWI2ZTM1OWVlODc4
Mjg5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcxMjYwZTk0MjFiOTNjMzNkZDFiM2U3ZDBjZjE1
Zjc1OWMwY2E3Yzc1M2ZhODQwMjc5ZWMzYmU3MGY4ZjhjOWQiCiAKIFMgPSAiJHtXT1JLRElSfS9N
b2R1bGUtQnVpbGQtVGlueS0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============3082596507144362211==--

