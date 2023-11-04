Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B1DC05032
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4709.1699074742338173128
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NSYClb6h;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZL/1OpGU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b98bf1565-d69d1650-2d88-45f1-af61-d74989d93d37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xB3Fc61ITckxMGBjjNa0AyVjFLyYtHH3o3+ol8HHWls=;
	b=NSYClb6hp9vnSECEwgW9odaWjiJR8D0576XJkj308pCaCkG7jb4DWMcOesFI4JiG
	dElJpJ1tYT7dbvKCSDiX5OiK+N5DQ2hi37YV3M/M+gugGEOKLAHSHje09QiS8ABgCvk
	z7idP6BCXw6Qr6bKyR1M0+oCAptLnuZmVaUgqa+I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xB3Fc61ITckxMGBjjNa0AyVjFLyYtHH3o3+ol8HHWls=;
	b=ZL/1OpGUNv6srN2G0tOozbq4dfgRmob0Yflv27L6qVhWjJIJwrQ74ZittGamkYze
	buu6w2J5KLOUHftleVZE46QHp88gxcbrVP8Xm0pXhLGkmyu5DrSHYRAHd4dsND7DhiU
	Wgd7Hl/ErfTaKSxX9MJE+aIhRCeaerGS35tlSaWE=
Content-Type: multipart/mixed; boundary="===============1535527657876325997=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gvfs: upgrading to 1.52.1 SUCCEEDED
Message-ID: <0101018b98bf1565-d69d1650-2d88-45f1-af61-d74989d93d37-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106280

--===============1535527657876325997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gvfs* to *1.52.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gvfs-upgrade-1.52.0-1.52.1.patch
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
From 66fce110c3712db6336a7e6ba5e4d979693223ce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:39:52 +0000
Subject: [PATCH] gvfs: upgrade 1.52.0 -> 1.52.1

---
 .../recipes-gnome/gvfs/{gvfs_1.52.0.bb => gvfs_1.52.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.52.0.bb => gvfs_1.52.1.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
index d5103d865..61c8fadfd 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.sha256sum] = "e40e2035a40bc51ce9e88eed05b025596e40bb4aaf9bc632d12ce74fdb30b1f6"
+SRC_URI[archive.sha256sum] = "cdbd4440f6d08792a6e7521244c17386e20bd537d375117099fc8fb68fe91741"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.39.2


--===============1535527657876325997==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gvfs-upgrade-1.52.0-1.52.1.patch"

RnJvbSA2NmZjZTExMGMzNzEyZGI2MzM2YTdlNmJhNWU0ZDk3OTY5MzIyM2NlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDozOTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd2
ZnM6IHVwZ3JhZGUgMS41Mi4wIC0+IDEuNTIuMQoKLS0tCiAuLi4vcmVjaXBlcy1nbm9tZS9ndmZz
L3tndmZzXzEuNTIuMC5iYiA9PiBndmZzXzEuNTIuMS5iYn0gICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLWdub21l
L3JlY2lwZXMtZ25vbWUvZ3Zmcy97Z3Zmc18xLjUyLjAuYmIgPT4gZ3Zmc18xLjUyLjEuYmJ9ICg5
NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL2d2ZnMvZ3Zmc18xLjUy
LjAuYmIgYi9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvZ3Zmcy9ndmZzXzEuNTIuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvZ3Zm
cy9ndmZzXzEuNTIuMC5iYgpyZW5hbWUgdG8gbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL2d2ZnMv
Z3Zmc18xLjUyLjEuYmIKaW5kZXggZDUxMDNkODY1Li42MWM4ZmFkZmQgMTAwNjQ0Ci0tLSBhL21l
dGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9ndmZzL2d2ZnNfMS41Mi4wLmJiCisrKyBiL21ldGEtZ25v
bWUvcmVjaXBlcy1nbm9tZS9ndmZzL2d2ZnNfMS41Mi4xLmJiCkBAIC0yMCw3ICsyMCw3IEBAIFJE
RVBFTkRTOiR7UE59ICs9ICJnc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzIgogCiBTUkNfVVJJID0g
Imh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvJHtCUE59LyR7QGdub21lX3ZlcmRp
cigiJHtQVn0iKX0vJHtCUE59LSR7UFZ9LnRhci54ejtuYW1lPWFyY2hpdmUiCiAKLVNSQ19VUklb
YXJjaGl2ZS5zaGEyNTZzdW1dID0gImU0MGUyMDM1YTQwYmM1MWNlOWU4OGVlZDA1YjAyNTU5NmU0
MGJiNGFhZjliYzYzMmQxMmNlNzRmZGIzMGIxZjYiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3Vt
XSA9ICJjZGJkNDQ0MGY2ZDA4NzkyYTZlNzUyMTI0NGMxNzM4NmUyMGJkNTM3ZDM3NTExNzA5OWZj
OGZiNjhmZTkxNzQxIgogCiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZF
QVRVUkVTfSIKIAotLSAKMi4zOS4yCgo=

--===============1535527657876325997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gvfs/gvfs-bash-completion: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-bash-completion: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-dbg: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-dbg: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-dbg: PKGSIZE changed from 5366024 to 5368056 (+0%)
packages/core2-64-poky-linux/gvfs/gvfs-dev: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-dev: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-doc: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-doc: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ab: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ab: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-af: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-af: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ar: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ar: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-as: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-as: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ast: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ast: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-be+latin: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-be+latin: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-be: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-be: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-bg: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-bg: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-bn-in: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-bn-in: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-bn: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-bn: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-bs: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-bs: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ca+valencia: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ca+valencia: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ca: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ca: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-cs: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-cs: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-da: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-da: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-de: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-de: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-el: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-el: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-en+shaw: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-en+shaw: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-en-gb: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-en-gb: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-eo: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-eo: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-eo: PKGSIZE changed from 7772 to 18380 (+136%)
packages/core2-64-poky-linux/gvfs/gvfs-locale-es: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-es: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-et: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-et: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-eu: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-eu: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-fa: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-fa: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-fi: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-fi: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-fr: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-fr: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-fur: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-fur: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ga: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ga: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-gl: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-gl: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-gu: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-gu: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-he: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-he: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-hi: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-hi: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-hr: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-hr: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-hu: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-hu: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-id: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-id: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ie: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ie: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-it: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-it: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ja: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ja: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ka: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ka: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-kk: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-kk: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-kn: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-kn: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ko: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ko: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ku: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ku: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-lt: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-lt: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-lv: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-lv: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-mai: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-mai: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-mk: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-mk: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ml: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ml: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-mr: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-mr: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ms: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ms: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-nb: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-nb: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-nds: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-nds: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ne: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ne: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-nl: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-nl: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-nn: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-nn: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-oc: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-oc: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-or: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-or: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-pa: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-pa: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-pl: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-pl: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-pt-br: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-pt-br: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-pt: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-pt: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ro: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ro: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ru: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ru: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-sk: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-sk: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-sl: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-sl: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-sq: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-sq: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-sr+latin: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-sr+latin: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-sr: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-sr: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-sv: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-sv: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-ta: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ta: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-te: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-te: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-tg: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-tg: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-th: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-th: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-tr: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-tr: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-tr: PKGSIZE changed from 37709 to 37712 (+0%)
packages/core2-64-poky-linux/gvfs/gvfs-locale-ug: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-ug: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-uk: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-uk: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-vi: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-vi: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-zh-cn: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-zh-cn: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-zh-hk: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-zh-hk: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-locale-zh-tw: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-locale-zh-tw: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-src: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-src: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs-src: PKGSIZE changed from 3893058 to 3895668 (+0%)
packages/core2-64-poky-linux/gvfs/gvfs-staticdev: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs-staticdev: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfs: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfs: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfsd-ftp: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfsd-ftp: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfsd-sftp: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfsd-sftp: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs/gvfsd-trash: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs/gvfsd-trash: PV changed from "1.52.0" to "1.52.1"
packages/core2-64-poky-linux/gvfs: SRC_URI changed from "https://download.gnome.org/sources/gvfs/1.52/gvfs-1.52.0.tar.xz;name=archive" to "https://download.gnome.org/sources/gvfs/1.52/gvfs-1.52.1.tar.xz;name=archive"
packages/core2-64-poky-linux/gvfs: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/core2-64-poky-linux/gvfs: PV changed from "1.52.0" to "1.52.1"

--===============1535527657876325997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gvfs/gvfs-locale-eo: PKGSIZE changed from 7772 to 18380 (+136%)

--===============1535527657876325997==--

