Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC08DC4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:48:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.5664.1699084092086559620
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cEKhk+O9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LRAEdLXK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b994dbf37-23af550c-7185-4196-8fe7-b5155aecdd5a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=by2DJSGKUBi8xKi4YJQIr4YKLxD8lgF5hBGS70Si32M=;
	b=cEKhk+O9/1jrNGiCk5hoDdqu2c+CLJFma4W8885p4HIihKz6mN1Gc4N8VoejCdXC
	cmZbrY9xcs8WR4FgRbbTtvJjnUf98Uy1uiQu10qZdJG0CYDDpjO/OxC0Yjr/izjbB+S
	GlKOpwqzT6t9WBqAz7DquYRmbInjqzhq5b8ey5ms=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=by2DJSGKUBi8xKi4YJQIr4YKLxD8lgF5hBGS70Si32M=;
	b=LRAEdLXKe7OkXcJiyOJd8cuv0jPvJPLZH/BJGMPnKlPqpaTXO/o85vFRfw/pnrCs
	nKlWtKYAxq0HcUULgA51H7+YLkwrAImyP84kdUd9ZaIqPuJ+BQ4PAZ6JT4YemSc4bPm
	nt58YWF2wWC7FuCASwu4i3BTRrabfYbNDvvrwVoY=
Content-Type: multipart/mixed; boundary="===============5157719027109496715=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] ufs-utils: upgrading to
 faf0fe153547f5d02315fa82159f925f0c9daef8 SUCCEEDED
Message-ID: <0101018b994dbf37-23af550c-7185-4196-8fe7-b5155aecdd5a-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:48:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106355

--===============5157719027109496715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ufs-utils* to *faf0fe153547f5d02315fa82159f925f0c9daef8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ufs-utils-upgrade-to-latest-revision.patch
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
From 9a3b2ab404657299eea25ddc48f80f2d3c6513d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:32:13 +0000
Subject: [PATCH] ufs-utils: upgrade to latest revision

---
 meta-filesystems/recipes-utils/ufs-utils/ufs-utils_3.12.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_3.12.3.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_3.12.3.bb
index 342661c9a..86709145e 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_3.12.3.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_3.12.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 BRANCH ?= "dev"
 
-SRCREV = "40c0bdfa7f4e922a4bcdf431ef72b321648d2d9f"
+SRCREV = "faf0fe153547f5d02315fa82159f925f0c9daef8"
 
 SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=https;branch=${BRANCH} \
           "
-- 
2.39.2


--===============5157719027109496715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ufs-utils/ufs-utils-dbg: PKGSIZE changed from 257200 to 259320 (+1%)
packages/core2-64-poky-linux/ufs-utils/ufs-utils-src: PKGSIZE changed from 245033 to 254616 (+4%)
packages/core2-64-poky-linux/ufs-utils/ufs-utils: PKGSIZE changed from 117864 to 136840 (+16%)

--===============5157719027109496715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ufs-utils/ufs-utils: PKGSIZE changed from 117864 to 136840 (+16%)

--===============5157719027109496715==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ufs-utils-upgrade-to-latest-revision.patch"

RnJvbSA5YTNiMmFiNDA0NjU3Mjk5ZWVhMjVkZGM0OGY4MGYyZDNjNjUxM2Q2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzozMjoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHVm
cy11dGlsczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS1maWxlc3lzdGVt
cy9yZWNpcGVzLXV0aWxzL3Vmcy11dGlscy91ZnMtdXRpbHNfMy4xMi4zLmJiIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
bWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLXV0aWxzL3Vmcy11dGlscy91ZnMtdXRpbHNfMy4xMi4z
LmJiIGIvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLXV0aWxzL3Vmcy11dGlscy91ZnMtdXRpbHNf
My4xMi4zLmJiCmluZGV4IDM0MjY2MWM5YS4uODY3MDkxNDVlIDEwMDY0NAotLS0gYS9tZXRhLWZp
bGVzeXN0ZW1zL3JlY2lwZXMtdXRpbHMvdWZzLXV0aWxzL3Vmcy11dGlsc18zLjEyLjMuYmIKKysr
IGIvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLXV0aWxzL3Vmcy11dGlscy91ZnMtdXRpbHNfMy4x
Mi4zLmJiCkBAIC00LDcgKzQsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT01OTUzMGJkZjMzNjU5YjI5ZTczZDRhZGI5ZjlmNjU1MiIKIAogQlJBTkNIID89ICJkZXYi
CiAKLVNSQ1JFViA9ICI0MGMwYmRmYTdmNGU5MjJhNGJjZGY0MzFlZjcyYjMyMTY0OGQyZDlmIgor
U1JDUkVWID0gImZhZjBmZTE1MzU0N2Y1ZDAyMzE1ZmE4MjE1OWY5MjVmMGM5ZGFlZjgiCiAKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS93ZXN0ZXJuZGlnaXRhbGNvcnBvcmF0aW9uL3Vmcy11
dGlscy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPSR7QlJBTkNIfSBcCiAgICAgICAgICAgIgot
LSAKMi4zOS4yCgo=

--===============5157719027109496715==--

