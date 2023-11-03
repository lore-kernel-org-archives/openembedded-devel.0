Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5E5C0018A
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.63860.1699041165375197203
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZXtnR6Wo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=k+0PiWIy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bec8f4-30944f51-c78a-45ef-ad1b-c546d395fcf6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KRAi9+FSWCaGTumckK/iLyLXUmY6OTFXbsemhzB3koI=;
	b=ZXtnR6Wo7KgYVpPJ8Lo0VgGmshx92iY1/vTJvqwB6NS7Tasi3dlm88pZBqVjM9RI
	D0QC/7dfNwTx++UjQrrIjNCFAl3g3V4K459jdY47lghozFA+LPb1zmWD7dNzW4ZNPv1
	8uhQvBeq4m/Q0MH8ho9xEtK51WO37XuBJTZagp3c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KRAi9+FSWCaGTumckK/iLyLXUmY6OTFXbsemhzB3koI=;
	b=k+0PiWIyK2gwj5oA8SqTjnDV5CbP5rhkvP9egUdo+6G5mO45Y3FCKZalYZ/Z65W6
	b8hMVsZWrRdZkAsFyUMnEsdY9tWsVqeJuQEvFLjZ+vr4iyfy4Rp4/OhfpLOKQJnVi9P
	FKtqWquyJoCXZfcw3564b8awp8JPY0nbM1262bIg=
Content-Type: multipart/mixed; boundary="===============3554948909430323014=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gtkmm3: upgrading to 4.13.1 FAILED
Message-ID: <0101018b96bec8f4-30944f51-c78a-45ef-ad1b-c546d395fcf6-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105936

--===============3554948909430323014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtkmm3* to *4.13.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f gtkmm3 /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4954 entries from dependency cache.
Parsing recipes...done.
Parsing of 3056 .bb files complete (3055 cached, 1 parsed). 4887 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.

INFO: No patches or local source files needed updating
INFO: Cleaning sysroot for recipe gtkmm3...
ERROR: Command 'bitbake -c clean gtkmm3' failed, output:
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4955 entries from dependency cache.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.

If you wish, you may specify -n/--no-clean to skip running this command when resetting


Next steps:
    - apply the patch: git am 0001-gtkmm3-upgrade-3.24.7-4.13.1.patch
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
From 8b729c9307b904a20f41638787849c3433579164 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 13:05:38 +0000
Subject: [PATCH] gtkmm3: upgrade 3.24.7 -> 4.13.1

---
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb | 23 ---------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
deleted file mode 100644
index 28d2bb138..000000000
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "C++ bindings for the GTK+ toolkit V3"
-HOMEPAGE = "http://www.gtkmm.org/"
-SECTION = "libs"
-
-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
-
-DEPENDS = "glib-2.0-native atkmm pangomm glibmm gtk+3 cairomm gdk-pixbuf-native"
-
-BPN = "gtkmm"
-
-GNOMEBASEBUILDCLASS = "meson"
-
-inherit gnomebase features_check
-
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-
-SRC_URI[archive.sha256sum] = "1d7a35af9c5ceccacb244ee3c2deb9b245720d8510ac5c7e6f4b6f9947e6789c"
-
-EXTRA_OEMESON = "-Dbuild-demos=false"
-
-FILES:${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
2.39.2


--===============3554948909430323014==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtkmm3-upgrade-3.24.7-4.13.1.patch"

RnJvbSA4YjcyOWM5MzA3YjkwNGEyMGY0MTYzODc4Nzg0OWMzNDMzNTc5MTY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMzowNTozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
a21tMzogdXBncmFkZSAzLjI0LjcgLT4gNC4xMy4xCgotLS0KIG1ldGEtb2UvcmVjaXBlcy1nbm9t
ZS9ndGsrL2d0a21tM18zLjI0LjcuYmIgfCAyMyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3Jl
Y2lwZXMtZ25vbWUvZ3RrKy9ndGttbTNfMy4yNC43LmJiCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9y
ZWNpcGVzLWdub21lL2d0aysvZ3RrbW0zXzMuMjQuNy5iYiBiL21ldGEtb2UvcmVjaXBlcy1nbm9t
ZS9ndGsrL2d0a21tM18zLjI0LjcuYmIKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDI4
ZDJiYjEzOC4uMDAwMDAwMDAwCi0tLSBhL21ldGEtb2UvcmVjaXBlcy1nbm9tZS9ndGsrL2d0a21t
M18zLjI0LjcuYmIKKysrIC9kZXYvbnVsbApAQCAtMSwyMyArMCwwIEBACi1TVU1NQVJZID0gIkMr
KyBiaW5kaW5ncyBmb3IgdGhlIEdUSysgdG9vbGtpdCBWMyIKLUhPTUVQQUdFID0gImh0dHA6Ly93
d3cuZ3RrbW0ub3JnLyIKLVNFQ1RJT04gPSAibGlicyIKLQotTElDRU5TRSA9ICJMR1BMLTIuMS1v
bmx5ICYgR1BMLTIuMC1vbmx5IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXAotICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vQ09QWUlORy50b29sczttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2FiYWFiYWE4ODJi
YmUiCi0KLURFUEVORFMgPSAiZ2xpYi0yLjAtbmF0aXZlIGF0a21tIHBhbmdvbW0gZ2xpYm1tIGd0
ayszIGNhaXJvbW0gZ2RrLXBpeGJ1Zi1uYXRpdmUiCi0KLUJQTiA9ICJndGttbSIKLQotR05PTUVC
QVNFQlVJTERDTEFTUyA9ICJtZXNvbiIKLQotaW5oZXJpdCBnbm9tZWJhc2UgZmVhdHVyZXNfY2hl
Y2sKLQotQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJFU30iCi0K
LVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjFkN2EzNWFmOWM1Y2VjY2FjYjI0NGVlM2My
ZGViOWIyNDU3MjBkODUxMGFjNWM3ZTZmNGI2Zjk5NDdlNjc4OWMiCi0KLUVYVFJBX09FTUVTT04g
PSAiLURidWlsZC1kZW1vcz1mYWxzZSIKLQotRklMRVM6JHtQTn0tZGV2ICs9ICIke2xpYmRpcn0v
Ki9pbmNsdWRlICR7bGliZGlyfS8qL3Byb2MvbTQiCi0tIAoyLjM5LjIKCg==

--===============3554948909430323014==--

