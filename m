Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA96C07E97
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2288.1699061895893924145
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WMY0sdeJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pPbx6pEA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b97fb1862-b0a54882-01e8-48b9-9f46-2948c21200df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PY5mpTEwYdMBVKruTjhkLPHQ2t/jiKZj305h+wKBcxQ=;
	b=WMY0sdeJg4hGkCdKlWQP1hgacBsld9N5xYejcIxYbbQchwy1lUStjPNnV/55fmdg
	11xK0OohJO2GMtdhdswaQiPielpwmnXqj7BsBKWHjtdql0ybfxzYcK1++XiNpHEecjA
	VVdJRFEHbXFWz2dBtfJXKcuYix4DtbpRaWyFAt+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PY5mpTEwYdMBVKruTjhkLPHQ2t/jiKZj305h+wKBcxQ=;
	b=pPbx6pEALRJxJrI7aFMsuePYtc3zy00qP9TepPFmrztMqMO2XTQjg6hu1QCHlaSe
	gOCS9e3jTHXcRAxgDPAKSAK5PqT6c8uB5qok//aOCk2984bfnayqfKpt9ic9UEwkGL2
	XttrMRzKi96MAWmsoOdVS1E02A79dy/tFeDtTlio=
Content-Type: multipart/mixed; boundary="===============2649710128706102222=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-rapidjson: upgrading to 1.13 SUCCEEDED
Message-ID: <0101018b97fb1862-b0a54882-01e8-48b9-9f46-2948c21200df-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106160

--===============2649710128706102222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-rapidjson* to *1.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rapidjson-upgrade-1.12-1.13.patch
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
From aca0bff99bd91b4923438053bc711d0734291261 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 00:21:08 +0000
Subject: [PATCH] python3-rapidjson: upgrade 1.12 -> 1.13

---
 .../{python3-rapidjson_1.12.bb => python3-rapidjson_1.13.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rapidjson_1.12.bb => python3-rapidjson_1.13.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.12.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.13.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-rapidjson_1.12.bb
rename to meta-python/recipes-devtools/python/python3-rapidjson_1.13.bb
index f0f6c0dba..1623f721f 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.12.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.13.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4daf3929156304df67003c33274a98bd"
 
 SRC_URI = "git://github.com/python-rapidjson/python-rapidjson.git;protocol=https;branch=master"
-SRCREV = "5063cc63008b41e129344b012fc59b114cacd5c9"
+SRCREV = "a87053d9b97750afddb504da05bd1cd9f4b94654"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============2649710128706102222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-rapidjson: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-64-poky-linux/python3-rapidjson: PV changed from "1.12" to "1.13"
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-dbg: PKGSIZE changed from 3909136 to 3908968 (-0%)
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-dbg: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-dbg: PV changed from "1.12" to "1.13"
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-dev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-dev: PV changed from "1.12" to "1.13"
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-doc: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-doc: PV changed from "1.12" to "1.13"
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-locale: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-locale: PV changed from "1.12" to "1.13"
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-ptest: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-ptest: PV changed from "1.12" to "1.13"
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-src: PKGSIZE changed from 141556 to 141380 (-0%)
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-src: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-src: PV changed from "1.12" to "1.13"
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-staticdev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson-staticdev: PV changed from "1.12" to "1.13"
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson: PKGSIZE changed from 699851 to 700051 (+0%)
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-64-poky-linux/python3-rapidjson/python3-rapidjson: PV changed from "1.12" to "1.13"
Changes to packages/core2-64-poky-linux/python3-rapidjson (sysroot):
  /usr/lib/python3.11/site-packages/python_rapidjson-1.12.dist-info moved to /usr/lib/python3.11/site-packages/python_rapidjson-1.13.dist-info

--===============2649710128706102222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-rapidjson (sysroot):
  /usr/lib/python3.11/site-packages/python_rapidjson-1.12.dist-info moved to /usr/lib/python3.11/site-packages/python_rapidjson-1.13.dist-info

--===============2649710128706102222==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rapidjson-upgrade-1.12-1.13.patch"

RnJvbSBhY2EwYmZmOTliZDkxYjQ5MjM0MzgwNTNiYzcxMWQwNzM0MjkxMjYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMDoyMTowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcmFwaWRqc29uOiB1cGdyYWRlIDEuMTIgLT4gMS4xMwoKLS0tCiAuLi4ve3B5dGhvbjMt
cmFwaWRqc29uXzEuMTIuYmIgPT4gcHl0aG9uMy1yYXBpZGpzb25fMS4xMy5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1yYXBpZGpzb25fMS4x
Mi5iYiA9PiBweXRob24zLXJhcGlkanNvbl8xLjEzLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmFwaWRqc29uXzEuMTIu
YmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJhcGlkanNv
bl8xLjEzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmFwaWRqc29uXzEuMTIuYmIKcmVuYW1lIHRv
IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmFwaWRqc29uXzEu
MTMuYmIKaW5kZXggZjBmNmMwZGJhLi4xNjIzZjcyMWYgMTAwNjQ0Ci0tLSBhL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmFwaWRqc29uXzEuMTIuYmIKKysrIGIv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yYXBpZGpzb25fMS4x
My5iYgpAQCAtNSw3ICs1LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9MSUNFTlNFO21kNT00ZGFmMzkyOTE1NjMwNGRmNjcwMDNjMzMyNzRhOThiZCIKIAog
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3B5dGhvbi1yYXBpZGpzb24vcHl0aG9uLXJhcGlk
anNvbi5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVNSQ1JFViA9ICI1MDYzY2M2
MzAwOGI0MWUxMjkzNDRiMDEyZmM1OWIxMTRjYWNkNWM5IgorU1JDUkVWID0gImE4NzA1M2Q5Yjk3
NzUwYWZkZGI1MDRkYTA1YmQxY2Q5ZjRiOTQ2NTQiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAK
LS0gCjIuMzkuMgoK

--===============2649710128706102222==--

