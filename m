Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28A3C10F1B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.62968.1699041164665655841
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AZksKZdr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qDHNsCES;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bed4d7-9cc43c87-d341-446c-89c9-c3696aacce13-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HmBDp7908iO6ROzHf9Op+FVg3/nH+pYyiMZXyi6KBZ4=;
	b=AZksKZdrQy29ypYOopZJgsRxM0v4Nt2CBqgH/+famwqyq25u1AIOGgNNJiOIHMsW
	JmjRInGV54LlEc5W3tPFzKJ7xCyjOFYzLhTYJOnAJMFDGyDjuVu8BOyCMnEudteKutq
	sfGGLVP9T39CN2nf/2ggyNhIYQGb11IgQiVJzx2g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HmBDp7908iO6ROzHf9Op+FVg3/nH+pYyiMZXyi6KBZ4=;
	b=qDHNsCESrVsc2cJmV9jRWySgH4EfEmAV1MyUOtRpyWG/fpgtnjXYpRclZsrUHK1c
	3/Yh3z3GPWj4OIo0nh0w47mkGFo1nZnvoAQSJLR4RRWI1ROdVyMIGuRzgB3VTj1PlFI
	PU2YEo5nbo+RDDX7rQRwe+EdJlw8PmoT1NDi4Wpk=
Content-Type: multipart/mixed; boundary="===============7241579426510456059=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] neatvnc: upgrading to 0.7.0 SUCCEEDED
Message-ID: <0101018b96bed4d7-9cc43c87-d341-446c-89c9-c3696aacce13-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105996

--===============7241579426510456059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *neatvnc* to *0.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-neatvnc-upgrade-0.6.0-0.7.0.patch
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
From 28cc9fd9b9f854b7340be4eb5007bf5f8083a402 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 17:00:35 +0000
Subject: [PATCH] neatvnc: upgrade 0.6.0 -> 0.7.0

---
 meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb
index 834401520..0c95f7e4c 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "https://github.com/any1/neatvnc"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
-SRC_URI = "git://github.com/any1/neatvnc;branch=master;protocol=https"
+SRC_URI = "git://github.com/any1/neatvnc;branch=v0.7;protocol=https"
 
-SRCREV = "8b3dc1ae6099dcfa73aec3ae11df2fdc58540d14"
+SRCREV = "112391140a76f0b362fa0df92fc1183c4a48ef3d"
 
-PV = "0.6.0+git${SRCPV}"
+PV = "0.7.0"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============7241579426510456059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/neatvnc: SRC_URI changed from "git://github.com/any1/neatvnc;branch=master;protocol=https" to "git://github.com/any1/neatvnc;branch=v0.7;protocol=https"
packages/core2-64-poky-linux/neatvnc: PKGV changed from 0.6.0+git [default] to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc: PV changed from "0.6.0+git" to "0.7.0"
packages/core2-64-poky-linux/neatvnc/neatvnc-dbg: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-dbg: PKGSIZE changed from 227968 to 540176 (+137%)
packages/core2-64-poky-linux/neatvnc/neatvnc-dbg: PV changed from "0.6.0+git" to "0.7.0"
packages/core2-64-poky-linux/neatvnc/neatvnc-dev: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-dev: PKGSIZE changed from 7781 to 9084 (+17%)
packages/core2-64-poky-linux/neatvnc/neatvnc-dev: PV changed from "0.6.0+git" to "0.7.0"
packages/core2-64-poky-linux/neatvnc/neatvnc-doc: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-doc: PV changed from "0.6.0+git" to "0.7.0"
packages/core2-64-poky-linux/neatvnc/neatvnc-examples: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-examples: PV changed from "0.6.0+git" to "0.7.0"
packages/core2-64-poky-linux/neatvnc/neatvnc-locale: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-locale: PV changed from "0.6.0+git" to "0.7.0"
packages/core2-64-poky-linux/neatvnc/neatvnc-src: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-src: PKGSIZE changed from 204224 to 505007 (+147%)
packages/core2-64-poky-linux/neatvnc/neatvnc-src: FILELIST: removed "/usr/src/debug/neatvnc/0.6.0+git-r0/include/encoder.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/stream.c /usr/src/debug/neatvnc/0.6.0+git-r0/include/murmurhash.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/display.c /usr/src/debug/neatvnc/0.6.0+git-r0/include/fb.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/murmurhash.c /usr/src/debug/neatvnc/0.6.0+git-r0/include/transform-util.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/vec.c /usr/src/debug/neatvnc/0.6.0+git-r0/include/enc-util.h /usr/src/debug/neatvnc/0.6.0+git-r0/include/pixels.h /usr/src/debug/neatvnc/0.6.0+git-r0/include/neatvnc.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/qnum-to-evdev.c /usr/src/debug/neatvnc/0.6.0+git-r0/src/fb_pool.c /usr/src/debug/neatvnc/0.6.0+git-r0/include/stream.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/cursor.c /usr/src/debug/neatvnc/0.6.0+git-r0/include/cursor.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/server.c /usr/src/debug/neatvnc/0.6.0+git-r0/in
 clude/logging.h /usr/src/debug/neatvnc/0.6.0+git-r0/include/rfb-proto.h /usr/src/debug/neatvnc/0.6.0+git-r0/include/resampler.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/rcbuf.c /usr/src/debug/neatvnc/0.6.0+git-r0/src/encoder.c /usr/src/debug/neatvnc/0.6.0+git-r0/src/fb.c /usr/src/debug/neatvnc/0.6.0+git-r0/src/raw-encoding.c /usr/src/debug/neatvnc/0.6.0+git-r0/include/display.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/tight.c /usr/src/debug/neatvnc/0.6.0+git-r0/src/zrle.c /usr/src/debug/neatvnc/0.6.0+git-r0/include/common.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/pixels.c /usr/src/debug/neatvnc/0.6.0+git-r0/include/rcbuf.h /usr/src/debug/neatvnc/0.6.0+git-r0/include/vec.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/logging.c /usr/src/debug/neatvnc/0.6.0+git-r0/include/damage-refinery.h /usr/src/debug/neatvnc/0.6.0+git-r0/src/enc-util.c /usr/src/debug/neatvnc/0.6.0+git-r0/src/transform-util.c /usr/src/debug/neatvnc/0.6.0+git-r0/src/damage-refinery.c /usr/src/debug/neatvnc/0.6.0+git-r0/src/
 resampler.c", added "/usr/src/debug/neatvnc/0.7.0-r0/src/tight.c /usr/src/debug/neatvnc/0.7.0-r0/include/xxhash.h /usr/src/debug/neatvnc/0.7.0-r0/include/common.h /usr/src/debug/neatvnc/0.7.0-r0/include/encoder.h /usr/src/debug/neatvnc/0.7.0-r0/include/resampler.h /usr/src/debug/neatvnc/0.7.0-r0/src/stream-common.c /usr/src/debug/neatvnc/0.7.0-r0/src/vec.c /usr/src/debug/neatvnc/0.7.0-r0/src/qnum-to-evdev.c /usr/src/debug/neatvnc/0.7.0-r0/include/desktop-layout.h /usr/src/debug/neatvnc/0.7.0-r0/include/logging.h /usr/src/debug/neatvnc/0.7.0-r0/src/desktop-layout.c /usr/src/debug/neatvnc/0.7.0-r0/src/fb_pool.c /usr/src/debug/neatvnc/0.7.0-r0/include/neatvnc.h /usr/src/debug/neatvnc/0.7.0-r0/include/stream.h /usr/src/debug/neatvnc/0.7.0-r0/src/transform-util.c /usr/src/debug/neatvnc/0.7.0-r0/src/encoder.c /usr/src/debug/neatvnc/0.7.0-r0/src/damage-refinery.c /usr/src/debug/neatvnc/0.7.0-r0/src/pixels.c /usr/src/debug/neatvnc/0.7.0-r0/src/resampler.c /usr/src/debug/neatvnc/0.7.0-r0/inc
 lude/transform-util.h /usr/src/debug/neatvnc/0.7.0-r0/src/display.c /usr/src/debug/neatvnc/0.7.0-r0/src/stream-tcp.c /usr/src/debug/neatvnc/0.7.0-r0/src/server.c /usr/src/debug/neatvnc/0.7.0-r0/src/zrle.c /usr/src/debug/neatvnc/0.7.0-r0/include/cursor.h /usr/src/debug/neatvnc/0.7.0-r0/src/logging.c /usr/src/debug/neatvnc/0.7.0-r0/src/cursor.c /usr/src/debug/neatvnc/0.7.0-r0/include/rcbuf.h /usr/src/debug/neatvnc/0.7.0-r0/src/raw-encoding.c /usr/src/debug/neatvnc/0.7.0-r0/include/vec.h /usr/src/debug/neatvnc/0.7.0-r0/include/display.h /usr/src/debug/neatvnc/0.7.0-r0/include/damage-refinery.h /usr/src/debug/neatvnc/0.7.0-r0/src/rcbuf.c /usr/src/debug/neatvnc/0.7.0-r0/src/enc-util.c /usr/src/debug/neatvnc/0.7.0-r0/include/enc-util.h /usr/src/debug/neatvnc/0.7.0-r0/include/stream-common.h /usr/src/debug/neatvnc/0.7.0-r0/src/base64.c /usr/src/debug/neatvnc/0.7.0-r0/include/pixels.h /usr/src/debug/neatvnc/0.7.0-r0/include/rfb-proto.h /usr/src/debug/neatvnc/0.7.0-r0/include/fb.h /usr/src/d
 ebug/neatvnc/0.7.0-r0/src/stream.c /usr/src/debug/neatvnc/0.7.0-r0/src/fb.c"
packages/core2-64-poky-linux/neatvnc/neatvnc-src: PV changed from "0.6.0+git" to "0.7.0"
packages/core2-64-poky-linux/neatvnc/neatvnc-staticdev: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-staticdev: PV changed from "0.6.0+git" to "0.7.0"
packages/core2-64-poky-linux/neatvnc/neatvnc: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc: PKGSIZE changed from 63627 to 100555 (+58%)
packages/core2-64-poky-linux/neatvnc/neatvnc: PV changed from "0.6.0+git" to "0.7.0"

--===============7241579426510456059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/neatvnc/neatvnc-dbg: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-dbg: PKGSIZE changed from 227968 to 540176 (+137%)
packages/core2-64-poky-linux/neatvnc/neatvnc-dev: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-dev: PKGSIZE changed from 7781 to 9084 (+17%)
packages/core2-64-poky-linux/neatvnc/neatvnc-doc: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-examples: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-locale: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-src: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc-src: PKGSIZE changed from 204224 to 505007 (+147%)
packages/core2-64-poky-linux/neatvnc/neatvnc-staticdev: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc: PKGV changed from 0.6.0+git0+8b3dc1ae60 to 0.7.0 [default]
packages/core2-64-poky-linux/neatvnc/neatvnc: PKGSIZE changed from 63627 to 100555 (+58%)

--===============7241579426510456059==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-neatvnc-upgrade-0.6.0-0.7.0.patch"

RnJvbSAyOGNjOWZkOWI5Zjg1NGI3MzQwYmU0ZWI1MDA3YmY1ZjgwODNhNDAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNzowMDozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5l
YXR2bmM6IHVwZ3JhZGUgMC42LjAgLT4gMC43LjAKCi0tLQogbWV0YS1vZS9yZWNpcGVzLWdyYXBo
aWNzL25lYXR2bmMvbmVhdHZuY19naXQuYmIgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lw
ZXMtZ3JhcGhpY3MvbmVhdHZuYy9uZWF0dm5jX2dpdC5iYiBiL21ldGEtb2UvcmVjaXBlcy1ncmFw
aGljcy9uZWF0dm5jL25lYXR2bmNfZ2l0LmJiCmluZGV4IDgzNDQwMTUyMC4uMGM5NWY3ZTRjIDEw
MDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvbmVhdHZuYy9uZWF0dm5jX2dpdC5i
YgorKysgYi9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvbmVhdHZuYy9uZWF0dm5jX2dpdC5iYgpA
QCAtNCwxMSArNCwxMSBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vYW55MS9uZWF0
dm5jIgogTElDRU5TRSA9ICJJU0MiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT05NGZjMzc0ZTcxNzRmNDFlM2FmZTBmMDI3ZWU1OWZmNyIKIAotU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL2FueTEvbmVhdHZuYzticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgor
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2FueTEvbmVhdHZuYzticmFuY2g9djAuNztwcm90
b2NvbD1odHRwcyIKIAotU1JDUkVWID0gIjhiM2RjMWFlNjA5OWRjZmE3M2FlYzNhZTExZGYyZmRj
NTg1NDBkMTQiCitTUkNSRVYgPSAiMTEyMzkxMTQwYTc2ZjBiMzYyZmEwZGY5MmZjMTE4M2M0YTQ4
ZWYzZCIKIAotUFYgPSAiMC42LjArZ2l0JHtTUkNQVn0iCitQViA9ICIwLjcuMCIKIAogUyA9ICIk
e1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============7241579426510456059==--

