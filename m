Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225D3C07CB1
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2281.1699061894488854594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Lj/JJ35Z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pX1uEDLT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b97fb1211-f386e14c-46bd-4e6e-a8da-89d1d3480cfe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6Ekzp8C2t3aBszIVr8M7fVHh/X6A6wI6T8xsthfhT6E=;
	b=Lj/JJ35ZL1GVs0K0yhBDZc3e1a6nqGN+TUcj+qRtHxsyUjpPero2ev/SiNMbC3Y6
	hEhUyFK0WyHl3Ihszyv/dmTsACohGS8yGS4WfuX65RczJFp91kFezYbmBKZxlVQ0r7i
	jtO3E1l6EJ6oWKDDaVegZQlcKoJj2SKtv8xYk57A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6Ekzp8C2t3aBszIVr8M7fVHh/X6A6wI6T8xsthfhT6E=;
	b=pX1uEDLTHaVBCbuxe6//R7Cwg0SlI66rcMLMIJqq2YnHQZV64BgcK9SDGbULuH8N
	h+s8/OHanzIepJAnFZmMqnxkQ1dzrz6B+PNtLU6z9B9smTncPBLJXPJDVeNebA1QCvP
	Nz6r5tPgfCa5M5Lcfta5nz7Kfy71ZrkkaZtkv+Bg=
Content-Type: multipart/mixed; boundary="===============4769041935740779488=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-m2crypto: upgrading to 0.40.1 SUCCEEDED
Message-ID: <0101018b97fb1211-f386e14c-46bd-4e6e-a8da-89d1d3480cfe-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106129

--===============4769041935740779488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-m2crypto* to *0.40.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-m2crypto-upgrade-0.39.0-0.40.1.patch
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
From b39c1a7d0c38ff2ff518644f5b626d9eef556bef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 22:41:15 +0000
Subject: [PATCH] python3-m2crypto: upgrade 0.39.0 -> 0.40.1

---
 .../{python3-m2crypto_0.39.0.bb => python3-m2crypto_0.40.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.39.0.bb => python3-m2crypto_0.40.1.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
index d47ec2bac..a55ded34d 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
@@ -11,7 +11,7 @@ SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
             file://avoid-host-contamination.patch \
             file://0001-setup.py-address-openssl-3.x-build-issue.patch \
             "
-SRC_URI[sha256sum] = "24c0f471358b8b19ad4c8aa9da12e868030b65c1fdb3279d006df60c9501338a"
+SRC_URI[sha256sum] = "bbfd113ec55708c05816252a4f09e4237df4f3bbfc8171cbbc33057d257bbb30"
 
 PYPI_PACKAGE = "M2Crypto"
 inherit pypi siteinfo setuptools3
-- 
2.39.2


--===============4769041935740779488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-m2crypto: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/M2Crypto/M2Crypto-0.39.0.tar.gz;downloadfilename=M2Crypto-0.39.0.tar.gz file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch file://cross-compile-platform.patch file://avoid-host-contamination.patch file://0001-setup.py-address-openssl-3.x-build-issue.patch" to "https://files.pythonhosted.org/packages/source/M/M2Crypto/M2Crypto-0.40.1.tar.gz;downloadfilename=M2Crypto-0.40.1.tar.gz file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch file://cross-compile-platform.patch file://avoid-host-contamination.patch file://0001-setup.py-address-openssl-3.x-build-issue.patch"
packages/core2-64-poky-linux/python3-m2crypto: PKGV changed from 0.39.0 [default] to 0.40.1 [default]
packages/core2-64-poky-linux/python3-m2crypto: PV changed from "0.39.0" to "0.40.1"
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-dbg: PKGSIZE changed from 1446896 to 1452160 (+0%)
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-dbg: PKGV changed from 0.39.0 [default] to 0.40.1 [default]
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-dbg: PV changed from "0.39.0" to "0.40.1"
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-dev: PKGV changed from 0.39.0 [default] to 0.40.1 [default]
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-dev: PV changed from "0.39.0" to "0.40.1"
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-doc: PKGV changed from 0.39.0 [default] to 0.40.1 [default]
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-doc: PV changed from "0.39.0" to "0.40.1"
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-locale: PKGV changed from 0.39.0 [default] to 0.40.1 [default]
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-locale: PV changed from "0.39.0" to "0.40.1"
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-src: PKGSIZE changed from 1015359 to 1029496 (+1%)
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-src: PKGV changed from 0.39.0 [default] to 0.40.1 [default]
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-src: PV changed from "0.39.0" to "0.40.1"
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-staticdev: PKGV changed from 0.39.0 [default] to 0.40.1 [default]
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto-staticdev: PV changed from "0.39.0" to "0.40.1"
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto: PKGSIZE changed from 886118 to 883997 (-0%)
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto: FILELIST: directory renamed /usr/lib/python3.11/site-packages/M2Crypto-0.39.0.dist-info -> /usr/lib/python3.11/site-packages/M2Crypto-0.40.1.dist-info, removed "/usr/lib/python3.11/site-packages/M2Crypto/SSL/ssl_dispatcher.py"
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto: PKGV changed from 0.39.0 [default] to 0.40.1 [default]
packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto: PV changed from "0.39.0" to "0.40.1"
Changes to packages/core2-64-poky-linux/python3-m2crypto (sysroot):
  /usr/lib/python3.11/site-packages/M2Crypto-0.39.0.dist-info moved to /usr/lib/python3.11/site-packages/M2Crypto-0.40.1.dist-info
  /usr/lib/python3.11/site-packages/M2Crypto/SSL/ssl_dispatcher.py was removed

--===============4769041935740779488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-m2crypto/python3-m2crypto: FILELIST: directory renamed /usr/lib/python3.11/site-packages/M2Crypto-0.39.0.dist-info -> /usr/lib/python3.11/site-packages/M2Crypto-0.40.1.dist-info, removed "/usr/lib/python3.11/site-packages/M2Crypto/SSL/ssl_dispatcher.py"
Changes to packages/core2-64-poky-linux/python3-m2crypto (sysroot):
  /usr/lib/python3.11/site-packages/M2Crypto-0.39.0.dist-info moved to /usr/lib/python3.11/site-packages/M2Crypto-0.40.1.dist-info
  /usr/lib/python3.11/site-packages/M2Crypto/SSL/ssl_dispatcher.py was removed

--===============4769041935740779488==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-m2crypto-upgrade-0.39.0-0.40.1.patch"

RnJvbSBiMzljMWE3ZDBjMzhmZjJmZjUxODY0NGY1YjYyNmQ5ZWVmNTU2YmVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMjo0MToxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbTJjcnlwdG86IHVwZ3JhZGUgMC4zOS4wIC0+IDAuNDAuMQoKLS0tCiAuLi4ve3B5dGhv
bjMtbTJjcnlwdG9fMC4zOS4wLmJiID0+IHB5dGhvbjMtbTJjcnlwdG9fMC40MC4xLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tMmNyeXB0b18w
LjM5LjAuYmIgPT4gcHl0aG9uMy1tMmNyeXB0b18wLjQwLjEuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tMmNyeXB0b18w
LjM5LjAuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW0y
Y3J5cHRvXzAuNDAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW0yY3J5cHRvXzAuMzkuMC5iYgpy
ZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tMmNy
eXB0b18wLjQwLjEuYmIKaW5kZXggZDQ3ZWMyYmFjLi5hNTVkZWQzNGQgMTAwNjQ0Ci0tLSBhL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbTJjcnlwdG9fMC4zOS4w
LmJiCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbTJj
cnlwdG9fMC40MC4xLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAx
LXNldHVwLnB5LWxpbmstaW4tc3lzcm9vdC1ub3QtaW4taG9zdC1kaXJlY3Rvcmllcy5wYXRjaCBc
CiAgICAgICAgICAgICBmaWxlOi8vYXZvaWQtaG9zdC1jb250YW1pbmF0aW9uLnBhdGNoIFwKICAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLXNldHVwLnB5LWFkZHJlc3Mtb3BlbnNzbC0zLngtYnVpbGQt
aXNzdWUucGF0Y2ggXAogICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI0YzBm
NDcxMzU4YjhiMTlhZDRjOGFhOWRhMTJlODY4MDMwYjY1YzFmZGIzMjc5ZDAwNmRmNjBjOTUwMTMz
OGEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmJmZDExM2VjNTU3MDhjMDU4MTYyNTJhNGYwOWU0
MjM3ZGY0ZjNiYmZjODE3MWNiYmMzMzA1N2QyNTdiYmIzMCIKIAogUFlQSV9QQUNLQUdFID0gIk0y
Q3J5cHRvIgogaW5oZXJpdCBweXBpIHNpdGVpbmZvIHNldHVwdG9vbHMzCi0tIAoyLjM5LjIKCg==

--===============4769041935740779488==--

