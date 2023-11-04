Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25625C04A92
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.3554.1699067574367725296
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JQJjk1sK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZzbnumJk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b9851baef-6a8f3a5b-8a45-4e30-9b81-d5967879811b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZwHLKwR6c6Uq/vZ/i8xJQ4Th3CVlnY6yQwnzqIVQ6Tg=;
	b=JQJjk1sK562FccULVjbbYuD2cJL6kA4HTR6fy0lscI1vJmcjvRzd9jiqwFWHuE5y
	g8j/rGjEqEcOJbYm3vhkYejYzZCkBwgzA5Lbq3wxIhMFmA06PuVUvcMjLS4fINJfLx6
	Ntto52uURg6qsd7HF/gt0w9HYV6EmNJQ4sm3kXf0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZwHLKwR6c6Uq/vZ/i8xJQ4Th3CVlnY6yQwnzqIVQ6Tg=;
	b=ZzbnumJkQEztpXlHybBdin73TvAbYcFwG8g69fphDfQSavAJYrfAqDD4Y8A5PyGv
	eSM1m74w4RIehkXBF95rRaagm9EGrGK1mJosna+ll7G7XrVMbFGx+HPrkW0HgzMIJ/9
	4l3cSLY40WXZ/DPYXqYSvF8MbgTvWBsNLquX0giw=
Content-Type: multipart/mixed; boundary="===============2438062065549632772=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] usrsctp: upgrading to a0cbf4681474fab1e89d9e9e2d5c3694fce50359
 SUCCEEDED
Message-ID: <0101018b9851baef-6a8f3a5b-8a45-4e30-9b81-d5967879811b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106222

--===============2438062065549632772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *usrsctp* to *a0cbf4681474fab1e89d9e9e2d5c3694fce50359* has Succeeded.

Next steps:
    - apply the patch: git am 0001-usrsctp-upgrade-to-latest-revision.patch
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
From 662ad8c58388e67f47f72428c6c56a8e8ea7ca72 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:01:46 +0000
Subject: [PATCH] usrsctp: upgrade to latest revision

---
 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index dcfa7406d..38fb46fa4 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This is a userland SCTP stack supporting FreeBSD, Linux, Mac OS X
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ffcf846341f3856d79a483eafa18e2a5"
 
-SRCREV = "a10cd498d964508c0e6ec6bd2be9dd4afcbb4d86"
+SRCREV = "a0cbf4681474fab1e89d9e9e2d5c3694fce50359"
 SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master \
           "
 
-- 
2.39.2


--===============2438062065549632772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/core2-64-poky-linux/usrsctp (sysroot):
  /usr/lib/libusrsctp.so changed symlink target from libusrsctp.so.1.0.0 to libusrsctp.so.2.0.0
  /usr/lib/libusrsctp.so.1.0.0 moved to /usr/lib/libusrsctp.so.2.0.0
  /usr/lib/libusrsctp.so.1 moved to /usr/lib/libusrsctp.so.2
packages/core2-64-poky-linux/usrsctp/usrsctp-dbg: PKGSIZE changed from 1737304 to 1747656 (+1%)
packages/core2-64-poky-linux/usrsctp/usrsctp-dbg: FILELIST: removed "/usr/lib/.debug/libusrsctp.so.1.0.0", added "/usr/lib/.debug/libusrsctp.so.2.0.0"
packages/core2-64-poky-linux/usrsctp/usrsctp-dev: PKGSIZE changed from 41985 to 43428 (+3%)
packages/core2-64-poky-linux/usrsctp/usrsctp-src: PKGSIZE changed from 2660069 to 2675069 (+1%)
packages/core2-64-poky-linux/usrsctp/usrsctp: PKG changed from libusrsctp1 to libusrsctp2
packages/core2-64-poky-linux/usrsctp/usrsctp: FILELIST: removed "/usr/lib/libusrsctp.so.1 /usr/lib/libusrsctp.so.1.0.0", added "/usr/lib/libusrsctp.so.2 /usr/lib/libusrsctp.so.2.0.0"

--===============2438062065549632772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/usrsctp (sysroot):
  /usr/lib/libusrsctp.so changed symlink target from libusrsctp.so.1.0.0 to libusrsctp.so.2.0.0
  /usr/lib/libusrsctp.so.1.0.0 moved to /usr/lib/libusrsctp.so.2.0.0
  /usr/lib/libusrsctp.so.1 moved to /usr/lib/libusrsctp.so.2
packages/core2-64-poky-linux/usrsctp/usrsctp: PKG changed from libusrsctp1 to libusrsctp2
packages/core2-64-poky-linux/usrsctp/usrsctp: FILELIST: removed "/usr/lib/libusrsctp.so.1.0.0 /usr/lib/libusrsctp.so.1", added "/usr/lib/libusrsctp.so.2.0.0 /usr/lib/libusrsctp.so.2"

--===============2438062065549632772==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-usrsctp-upgrade-to-latest-revision.patch"

RnJvbSA2NjJhZDhjNTgzODhlNjdmNDdmNzI0MjhjNmM1NmE4ZThlYTdjYTcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzowMTo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHVz
cnNjdHA6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEtbmV0d29ya2luZy9y
ZWNpcGVzLXByb3RvY29scy91c3JzY3RwL3VzcnNjdHBfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS1u
ZXR3b3JraW5nL3JlY2lwZXMtcHJvdG9jb2xzL3VzcnNjdHAvdXNyc2N0cF9naXQuYmIgYi9tZXRh
LW5ldHdvcmtpbmcvcmVjaXBlcy1wcm90b2NvbHMvdXNyc2N0cC91c3JzY3RwX2dpdC5iYgppbmRl
eCBkY2ZhNzQwNmQuLjM4ZmI0NmZhNCAxMDA2NDQKLS0tIGEvbWV0YS1uZXR3b3JraW5nL3JlY2lw
ZXMtcHJvdG9jb2xzL3VzcnNjdHAvdXNyc2N0cF9naXQuYmIKKysrIGIvbWV0YS1uZXR3b3JraW5n
L3JlY2lwZXMtcHJvdG9jb2xzL3VzcnNjdHAvdXNyc2N0cF9naXQuYmIKQEAgLTIsNyArMiw3IEBA
IERFU0NSSVBUSU9OID0gIlRoaXMgaXMgYSB1c2VybGFuZCBTQ1RQIHN0YWNrIHN1cHBvcnRpbmcg
RnJlZUJTRCwgTGludXgsIE1hYyBPUyBYCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWZmY2Y4NDYzNDFmMzg1NmQ3OWE0
ODNlYWZhMThlMmE1IgogCi1TUkNSRVYgPSAiYTEwY2Q0OThkOTY0NTA4YzBlNmVjNmJkMmJlOWRk
NGFmY2JiNGQ4NiIKK1NSQ1JFViA9ICJhMGNiZjQ2ODE0NzRmYWIxZTg5ZDllOWUyZDVjMzY5NGZj
ZTUwMzU5IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3NjdHBsYWIvdXNyc2N0cDtwcm90
b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKICAgICAgICAgICAiCiAKLS0gCjIuMzkuMgoK

--===============2438062065549632772==--

