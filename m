Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3779C05027
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4050.1699071647337298754
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EqgPW9Fq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=p0hg4dlJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b988fdbbe-1902d89d-063a-4234-b667-dfea7bfe7d4e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ABBFk3wDMRLqRomv3UHHKua9+VGImP18AG2QNwRGWEA=;
	b=EqgPW9FqgT7i0I6KL6PgtPTs9pr5R1+s8k2TtByhwiyxpx2nzww4l9QQKBJWp2K4
	ApD+W7d4PLNV/GO8oLsM19u5GEZFXHOJ7WkRJ0y5t3jSrmps4eKW6debIl5x09sEfx3
	B6pXqeiHtAyZ7su3wsyVoUfDI80fKHy+QKo61wBE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ABBFk3wDMRLqRomv3UHHKua9+VGImP18AG2QNwRGWEA=;
	b=p0hg4dlJCz71qKmT1Wcg8iUFB911Awz4Roj8eZaHuvtHaIS5BubRsxP6MkIwI2B7
	j1DF0Sl7YJ7Eu8q9SHnkRFEKX3tN6YYHIFKNrTQuq/OApntMI4izDF0OUbtc03ilJES
	lBP/W9PYYSGSxw5NpChscuGLeoiw+BVrkTHK6WSo=
Content-Type: multipart/mixed; boundary="===============6910735349139758112=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gst-shark: upgrading to 0.8.1 SUCCEEDED
Message-ID: <0101018b988fdbbe-1902d89d-063a-4234-b667-dfea7bfe7d4e-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106247

--===============6910735349139758112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-shark* to *0.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-shark-upgrade-0.7.3.1-0.8.1.patch
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
From 48647e18fb2b027738b45720e8650b6aef3803d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:26:17 +0000
Subject: [PATCH] gst-shark: upgrade 0.7.3.1 -> 0.8.1

---
 .../recipes-multimedia/gstreamer-1.0/gst-shark_git.bb          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
index 4e50897de..c75d0965d 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
@@ -10,8 +10,9 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad "
 
 SRCBRANCH ?= "master"
 
-PV = "0.7.3.1"
+PV = "0.8.1"
 
+SRCREV = "09ba05865dacd2824b5b40ab75a4b9545fcc1366"
 SRCREV_base = "5413ef5475e5b70476c2480a75ca3746d91d4caf"
 SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
 SRCREV_FORMAT = "base_common"
-- 
2.39.2


--===============6910735349139758112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gst-shark/gst-shark-dbg: PV changed from "0.7.3.1" to "0.8.1"
packages/core2-64-poky-linux/gst-shark/gst-shark-dbg: PKGSIZE changed from 359240 to 359208 (-0%)
packages/core2-64-poky-linux/gst-shark/gst-shark-dbg: PKGV changed from 0.7.3.1 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/gst-shark/gst-shark-dev: PV changed from "0.7.3.1" to "0.8.1"
packages/core2-64-poky-linux/gst-shark/gst-shark-dev: PKGV changed from 0.7.3.1 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/gst-shark/gst-shark-doc: PV changed from "0.7.3.1" to "0.8.1"
packages/core2-64-poky-linux/gst-shark/gst-shark-doc: PKGV changed from 0.7.3.1 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/gst-shark/gst-shark-locale: PV changed from "0.7.3.1" to "0.8.1"
packages/core2-64-poky-linux/gst-shark/gst-shark-locale: PKGV changed from 0.7.3.1 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/gst-shark/gst-shark-src: PV changed from "0.7.3.1" to "0.8.1"
packages/core2-64-poky-linux/gst-shark/gst-shark-src: PKGV changed from 0.7.3.1 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/gst-shark/gst-shark-staticdev: PV changed from "0.7.3.1" to "0.8.1"
packages/core2-64-poky-linux/gst-shark/gst-shark-staticdev: PKGV changed from 0.7.3.1 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/gst-shark/gst-shark: PV changed from "0.7.3.1" to "0.8.1"
packages/core2-64-poky-linux/gst-shark/gst-shark: PKGV changed from 0.7.3.1 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/gst-shark: PV changed from "0.7.3.1" to "0.8.1"
packages/core2-64-poky-linux/gst-shark: PKGV changed from 0.7.3.1 [default] to 0.8.1 [default]

--===============6910735349139758112==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-shark-upgrade-0.7.3.1-0.8.1.patch"

RnJvbSA0ODY0N2UxOGZiMmIwMjc3MzhiNDU3MjBlODY1MGI2YWVmMzgwM2Q1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzoyNjoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1zaGFyazogdXBncmFkZSAwLjcuMy4xIC0+IDAuOC4xCgotLS0KIC4uLi9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyLTEuMC9nc3Qtc2hhcmtfZ2l0LmJiICAgICAgICAgIHwgMyArKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci0xLjAvZ3N0LXNo
YXJrX2dpdC5iYiBiL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
LTEuMC9nc3Qtc2hhcmtfZ2l0LmJiCmluZGV4IDRlNTA4OTdkZS4uYzc1ZDA5NjVkIDEwMDY0NAot
LS0gYS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci0xLjAvZ3N0
LXNoYXJrX2dpdC5iYgorKysgYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci0xLjAvZ3N0LXNoYXJrX2dpdC5iYgpAQCAtMTAsOCArMTAsOSBAQCBERVBFTkRTID0g
ImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIGdzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhZCAiCiAKIFNSQ0JSQU5DSCA/PSAibWFzdGVyIgogCi1QViA9ICIwLjcuMy4xIgorUFYg
PSAiMC44LjEiCiAKK1NSQ1JFViA9ICIwOWJhMDU4NjVkYWNkMjgyNGI1YjQwYWI3NWE0Yjk1NDVm
Y2MxMzY2IgogU1JDUkVWX2Jhc2UgPSAiNTQxM2VmNTQ3NWU1YjcwNDc2YzI0ODBhNzVjYTM3NDZk
OTFkNGNhZiIKIFNSQ1JFVl9jb21tb24gPSAiYjY0ZjAzZjYwOTAyNDU2MjQ2MDhiZWI1ZDJmZmYz
MzVlMjNhMDFjMCIKIFNSQ1JFVl9GT1JNQVQgPSAiYmFzZV9jb21tb24iCi0tIAoyLjM5LjIKCg==

--===============6910735349139758112==--

