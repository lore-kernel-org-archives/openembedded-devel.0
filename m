Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9287C19F21
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.62983.1699041167638722586
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UgS5MpX0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ym9+/nzK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b96becd06-21e96ed8-3249-4afd-9785-ce6937332688-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+edewLcJb5Ov6iB50TybbBrhlo2aaaEtug2gyA7ytu4=;
	b=UgS5MpX0XMCWy1/K6xwqdodZclLDZCGILJxVVXY9GcpdDgFJSyuhongHBYPD6+bc
	0pn6iB5ELVvFlsh1wxHE4UZnciLB/kL+fPSUOIL3vnXLMg2WougM2U6hrMSVmhmzSkj
	X0xSMR5YceZw4TeN5laNZpCBfMKCrMObOGXRvrRQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+edewLcJb5Ov6iB50TybbBrhlo2aaaEtug2gyA7ytu4=;
	b=Ym9+/nzKedapI+0083tJEvMzDcgqPPvqJCBaZfmyvCmbPhe47nVyw/F9Y01Vn2Eg
	0+if+4aYvCkdvCxDLL4Z/oCqJUvDhNcvvE/XmwUwjjlf5jt+Kw3JlZ+pPEJPGfE3khU
	XcBJ4MGDqMDKmpD0UpTd/ykoW0GTpMCQQx+mTgnk=
Content-Type: multipart/mixed; boundary="===============8277864754775494947=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libmbim: upgrading to 1.31.1 SUCCEEDED
Message-ID: <0101018b96becd06-21e96ed8-3249-4afd-9785-ce6937332688-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105973

--===============8277864754775494947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmbim* to *1.31.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmbim-upgrade-1.30.0-1.31.1.patch
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
From 9232f8a895749de47f1353058d1e92c9f315e98e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 14:12:32 +0000
Subject: [PATCH] libmbim: upgrade 1.30.0 -> 1.31.1

---
 .../libmbim/{libmbim_1.30.0.bb => libmbim_1.31.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.30.0.bb => libmbim_1.31.1.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.31.1.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.31.1.bb
index 59d5e87b8..7001d3e36 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.31.1.bb
@@ -11,8 +11,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 
 inherit meson pkgconfig bash-completion gobject-introspection
 
-SRCREV = "8415687e4f30ae5e36f407f179c8147f1529725c"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=mbim-1-30"
+SRCREV = "db0f5a09d4d29145620b81df0fdd8f4786a8fb59"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============8277864754775494947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libmbim: PV changed from "1.30.0" to "1.31.1"
packages/core2-64-poky-linux/libmbim: SRC_URI changed from "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=mbim-1-30" to "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=main"
packages/core2-64-poky-linux/libmbim: PKGV changed from 1.30.0 [default] to 1.31.1 [default]
packages/core2-64-poky-linux/libmbim/libmbim-bash-completion: PV changed from "1.30.0" to "1.31.1"
packages/core2-64-poky-linux/libmbim/libmbim-bash-completion: PKGV changed from 1.30.0 [default] to 1.31.1 [default]
packages/core2-64-poky-linux/libmbim/libmbim-dbg: PKGSIZE changed from 3825840 to 3836152 (+0%)
packages/core2-64-poky-linux/libmbim/libmbim-dbg: PV changed from "1.30.0" to "1.31.1"
packages/core2-64-poky-linux/libmbim/libmbim-dbg: PKGV changed from 1.30.0 [default] to 1.31.1 [default]
packages/core2-64-poky-linux/libmbim/libmbim-dev: PV changed from "1.30.0" to "1.31.1"
packages/core2-64-poky-linux/libmbim/libmbim-dev: PKGV changed from 1.30.0 [default] to 1.31.1 [default]
packages/core2-64-poky-linux/libmbim/libmbim-doc: PV changed from "1.30.0" to "1.31.1"
packages/core2-64-poky-linux/libmbim/libmbim-doc: PKGV changed from 1.30.0 [default] to 1.31.1 [default]
packages/core2-64-poky-linux/libmbim/libmbim-locale: PV changed from "1.30.0" to "1.31.1"
packages/core2-64-poky-linux/libmbim/libmbim-locale: PKGV changed from 1.30.0 [default] to 1.31.1 [default]
packages/core2-64-poky-linux/libmbim/libmbim-src: PKGSIZE changed from 3165504 to 3186513 (+1%)
packages/core2-64-poky-linux/libmbim/libmbim-src: PV changed from "1.30.0" to "1.31.1"
packages/core2-64-poky-linux/libmbim/libmbim-src: PKGV changed from 1.30.0 [default] to 1.31.1 [default]
packages/core2-64-poky-linux/libmbim/libmbim-staticdev: PV changed from "1.30.0" to "1.31.1"
packages/core2-64-poky-linux/libmbim/libmbim-staticdev: PKGV changed from 1.30.0 [default] to 1.31.1 [default]
packages/core2-64-poky-linux/libmbim/libmbim: PV changed from "1.30.0" to "1.31.1"
packages/core2-64-poky-linux/libmbim/libmbim: PKGV changed from 1.30.0 [default] to 1.31.1 [default]

--===============8277864754775494947==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmbim-upgrade-1.30.0-1.31.1.patch"

RnJvbSA5MjMyZjhhODk1NzQ5ZGU0N2YxMzUzMDU4ZDFlOTJjOWYzMTVlOThlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNDoxMjozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1iaW06IHVwZ3JhZGUgMS4zMC4wIC0+IDEuMzEuMQoKLS0tCiAuLi4vbGlibWJpbS97bGlibWJp
bV8xLjMwLjAuYmIgPT4gbGlibWJpbV8xLjMxLjEuYmJ9ICAgICAgICAgIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEt
b2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJpbS97bGlibWJpbV8xLjMwLjAuYmIgPT4gbGli
bWJpbV8xLjMxLjEuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9saWJtYmltL2xpYm1iaW1fMS4zMC4wLmJiIGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9saWJtYmltL2xpYm1iaW1fMS4zMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJl
bmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJpbS9saWJtYmltXzEu
MzAuMC5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL2xp
Ym1iaW1fMS4zMS4xLmJiCmluZGV4IDU5ZDVlODdiOC4uNzAwMWQzZTM2IDEwMDY0NAotLS0gYS9t
ZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbV8xLjMwLjAuYmIKKysr
IGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL2xpYm1iaW1fMS4zMS4xLmJi
CkBAIC0xMSw4ICsxMSw4IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGxp
Ymd1ZGV2IgogCiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBiYXNoLWNvbXBsZXRpb24gZ29iamVj
dC1pbnRyb3NwZWN0aW9uCiAKLVNSQ1JFViA9ICI4NDE1Njg3ZTRmMzBhZTVlMzZmNDA3ZjE3OWM4
MTQ3ZjE1Mjk3MjVjIgotU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21v
YmlsZS1icm9hZGJhbmQvbGlibWJpbS5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1iaW0tMS0z
MCIKK1NSQ1JFViA9ICJkYjBmNWEwOWQ0ZDI5MTQ1NjIwYjgxZGYwZmRkOGY0Nzg2YThmYjU5Igor
U1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21vYmlsZS1icm9hZGJhbmQv
bGlibWJpbS5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCiAKIFMgPSAiJHtXT1JLRElS
fS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============8277864754775494947==--

