Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59881C07D59
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2286.1699061895185393105
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PyHWj5fC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mlP0+1uP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b97fb0fa0-179580a2-584c-4a2a-af72-b7bde63f3c27-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tguvk0k/uz7kRR5jggV3kuSq8YdBlWBw/5Me2PQzVcc=;
	b=PyHWj5fCdqFqSqDV8XliQMTzUhXJgelxk2twqjAMzaLSnqZySAeu72JYOvWpOvA9
	wDkf+Pgt+W0edXGlIGLus6KB1rxj8rM4tISNFYL9hMU0746aImZzlxl5x11CWdycc59
	yWr3Eq650upHTeYB6p7PqayGWjAQCt51+dZnE+7I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tguvk0k/uz7kRR5jggV3kuSq8YdBlWBw/5Me2PQzVcc=;
	b=mlP0+1uP3sv8tQ9Rtvn1KelDE7RACqVjV8du5iiv1KOJs3uAqgteIx4fggIaUWDG
	YcWdSFCPtOVfd7fNxzTALV+gdf/73VrSP5nC5nDazGfeDSD5u/5Vxb1J52iOwzimE5Z
	okpPOptK6ogzT0BlnPRZsCksq8umlRJlJoJaq2CQ=
Content-Type: multipart/mixed; boundary="===============4610750027738016998=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-icu: upgrading to 2.12 SUCCEEDED
Message-ID: <0101018b97fb0fa0-179580a2-584c-4a2a-af72-b7bde63f3c27-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106126

--===============4610750027738016998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-icu* to *2.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-icu-upgrade-2.11-2.12.patch
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
From 894373183dfbf4d2e802180b4c519e206440fc82 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 21:48:56 +0000
Subject: [PATCH] python3-icu: upgrade 2.11 -> 2.12

---
 .../python/{python3-icu_2.11.bb => python3-icu_2.12.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.11.bb => python3-icu_2.12.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.11.bb b/meta-python/recipes-devtools/python/python3-icu_2.12.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-icu_2.11.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.12.bb
index c66455c7e..6394db4e9 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.11.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.12.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0724597863f1581ab01429e0423e779f"
 DEPENDS += "icu"
 
 PYPI_PACKAGE = "PyICU"
-SRC_URI[sha256sum] = "3ab531264cfe9132b3d2ac5d708da9a4649d25f6e6813730ac88cf040a08a844"
+SRC_URI[sha256sum] = "bd7ab5efa93ad692e6daa29cd249364e521218329221726a113ca3cb281c8611"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
-- 
2.39.2


--===============4610750027738016998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-icu: PV changed from "2.11" to "2.12"
packages/core2-64-poky-linux/python3-icu: PKGV changed from 2.11 [default] to 2.12 [default]
packages/core2-64-poky-linux/python3-icu: SRC_URI changed from "https://files.pythonhosted.org/packages/source/P/PyICU/PyICU-2.11.tar.gz;downloadfilename=PyICU-2.11.tar.gz file://0001-Fix-host-contamination-of-include-files.patch" to "https://files.pythonhosted.org/packages/source/P/PyICU/PyICU-2.12.tar.gz;downloadfilename=PyICU-2.12.tar.gz file://0001-Fix-host-contamination-of-include-files.patch"
packages/core2-64-poky-linux/python3-icu/python3-icu-dbg: PV changed from "2.11" to "2.12"
packages/core2-64-poky-linux/python3-icu/python3-icu-dbg: PKGSIZE changed from 3772688 to 3795704 (+1%)
packages/core2-64-poky-linux/python3-icu/python3-icu-dbg: PKGV changed from 2.11 [default] to 2.12 [default]
packages/core2-64-poky-linux/python3-icu/python3-icu-dev: PV changed from "2.11" to "2.12"
packages/core2-64-poky-linux/python3-icu/python3-icu-dev: PKGV changed from 2.11 [default] to 2.12 [default]
packages/core2-64-poky-linux/python3-icu/python3-icu-doc: PV changed from "2.11" to "2.12"
packages/core2-64-poky-linux/python3-icu/python3-icu-doc: PKGV changed from 2.11 [default] to 2.12 [default]
packages/core2-64-poky-linux/python3-icu/python3-icu-locale: PV changed from "2.11" to "2.12"
packages/core2-64-poky-linux/python3-icu/python3-icu-locale: PKGV changed from 2.11 [default] to 2.12 [default]
packages/core2-64-poky-linux/python3-icu/python3-icu-src: PV changed from "2.11" to "2.12"
packages/core2-64-poky-linux/python3-icu/python3-icu-src: PKGSIZE changed from 1369733 to 1384093 (+1%)
packages/core2-64-poky-linux/python3-icu/python3-icu-src: PKGV changed from 2.11 [default] to 2.12 [default]
packages/core2-64-poky-linux/python3-icu/python3-icu-staticdev: PV changed from "2.11" to "2.12"
packages/core2-64-poky-linux/python3-icu/python3-icu-staticdev: PKGV changed from 2.11 [default] to 2.12 [default]
packages/core2-64-poky-linux/python3-icu/python3-icu: PV changed from "2.11" to "2.12"
packages/core2-64-poky-linux/python3-icu/python3-icu: PKGSIZE changed from 1388620 to 1402892 (+1%)
packages/core2-64-poky-linux/python3-icu/python3-icu: PKGV changed from 2.11 [default] to 2.12 [default]
Changes to packages/core2-64-poky-linux/python3-icu (sysroot):
  /usr/lib/python3.11/site-packages/PyICU-2.11.dist-info moved to /usr/lib/python3.11/site-packages/PyICU-2.12.dist-info

--===============4610750027738016998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-icu (sysroot):
  /usr/lib/python3.11/site-packages/PyICU-2.11.dist-info moved to /usr/lib/python3.11/site-packages/PyICU-2.12.dist-info

--===============4610750027738016998==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-icu-upgrade-2.11-2.12.patch"

RnJvbSA4OTQzNzMxODNkZmJmNGQyZTgwMjE4MGI0YzUxOWUyMDY0NDBmYzgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMTo0ODo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaWN1OiB1cGdyYWRlIDIuMTEgLT4gMi4xMgoKLS0tCiAuLi4vcHl0aG9uL3tweXRob24z
LWljdV8yLjExLmJiID0+IHB5dGhvbjMtaWN1XzIuMTIuYmJ9ICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1pY3VfMi4xMS5iYiA9PiBweXRo
b24zLWljdV8yLjEyLmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaWN1XzIuMTEuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWljdV8yLjEyLmJiCnNpbWlsYXJpdHkgaW5kZXggODMl
CnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
aWN1XzIuMTEuYmIKcmVuYW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaWN1XzIuMTIuYmIKaW5kZXggYzY2NDU1YzdlLi42Mzk0ZGI0ZTkgMTAwNjQ0Ci0t
LSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaWN1XzIuMTEu
YmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pY3Vf
Mi4xMi5iYgpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9MDcyNDU5Nzg2M2YxNTgxYWIwMTQyOWUwNDIzZTc3OWYiCiBERVBFTkRTICs9ICJpY3Ui
CiAKIFBZUElfUEFDS0FHRSA9ICJQeUlDVSIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzYWI1MzEy
NjRjZmU5MTMyYjNkMmFjNWQ3MDhkYTlhNDY0OWQyNWY2ZTY4MTM3MzBhYzg4Y2YwNDBhMDhhODQ0
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJkN2FiNWVmYTkzYWQ2OTJlNmRhYTI5Y2QyNDkzNjRl
NTIxMjE4MzI5MjIxNzI2YTExM2NhM2NiMjgxYzg2MTEiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8w
MDAxLUZpeC1ob3N0LWNvbnRhbWluYXRpb24tb2YtaW5jbHVkZS1maWxlcy5wYXRjaCIKIAotLSAK
Mi4zOS4yCgo=

--===============4610750027738016998==--

