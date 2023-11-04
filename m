Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D2CC4708E
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5515.1699083060319640521
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fF32wYwn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gOOIzgho;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b993e0141-4851ac67-274b-434f-9aca-9ed33d831605-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BQjNFzbxRIWyKyE5XRb8Ch/SYPLwKEBTdRF8gN8HoJ0=;
	b=fF32wYwndn4kfuB6u+DLBsqPSzXgSKl/1sZDSQKSOlSG77+4Lw7XaRsL0BYnPtAh
	epv9ir9KQrl+6TVsOOrH2zOm/STcEacFp2ImBdWhIo6XD1WmHBeK7onmK2qzE821CxT
	Vi20jWiol2zUP8afeR/zUCq8mN8ibmy8mYL7Z9Sw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BQjNFzbxRIWyKyE5XRb8Ch/SYPLwKEBTdRF8gN8HoJ0=;
	b=gOOIzghoTBG1TAVcKr7bLChIb3mFBHRnDxNc1ICcIWFT2pgdt5NKqwxzxzu5fvMq
	35MIj+R0Mj5QuC989ESZTNxBcfXf+pQExw8R9Vrx9J/qvYquE/UEEQIVa1ldu1UnHFR
	4qC5zer8K7cd5X5dxBTPQfc84LoTiI4b/m/wChbo=
Content-Type: multipart/mixed; boundary="===============7943683802920830272=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] thunar-shares-plugin: upgrading to 0.3.2 SUCCEEDED
Message-ID: <0101018b993e0141-4851ac67-274b-434f-9aca-9ed33d831605-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106307

--===============7943683802920830272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *thunar-shares-plugin* to *0.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-thunar-shares-plugin-upgrade-0.3.1-0.3.2.patch
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
From 3280aa92acad1bc556ac5c3d1d61046cfd665c28 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:50:34 +0000
Subject: [PATCH] thunar-shares-plugin: upgrade 0.3.1 -> 0.3.2

---
 ...d-Bump-GLib-minimum-required-to-2.26.patch | 34 -------------------
 ...0.3.1.bb => thunar-shares-plugin_0.3.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-xfce/recipes-thunar-plugins/shares/files/0001-build-Bump-GLib-minimum-required-to-2.26.patch
 rename meta-xfce/recipes-thunar-plugins/shares/{thunar-shares-plugin_0.3.1.bb => thunar-shares-plugin_0.3.2.bb} (66%)

diff --git a/meta-xfce/recipes-thunar-plugins/shares/files/0001-build-Bump-GLib-minimum-required-to-2.26.patch b/meta-xfce/recipes-thunar-plugins/shares/files/0001-build-Bump-GLib-minimum-required-to-2.26.patch
deleted file mode 100644
index 1cd24572f..000000000
--- a/meta-xfce/recipes-thunar-plugins/shares/files/0001-build-Bump-GLib-minimum-required-to-2.26.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Backport [https://gitlab.xfce.org/thunar-plugins/thunar-shares-plugin/-/commit/e4bce21a]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From e4bce21a1bd744ccfde84de4669ac30aa1d72135 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
-Date: Fri, 2 Dec 2022 20:18:46 +0100
-Subject: [PATCH] build: Bump GLib minimum required to 2.26
-
-This is the minimum required to build since xfce4-dev-tools >= 4.17.1
-set GLIB_VERSION_MAX_ALLOWED to the GLib version found in
-configure.ac.in.
-
-MR: !3
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a458785..bc6d24c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -61,7 +61,7 @@ dnl -------------------------------------------------------
- dnl Packages checks
- dnl -------------------------------------------------------
- XDT_CHECK_PACKAGE([GTK], [gtk+-3.0], [3.22.0])
--XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.18.0])
-+XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.26.0])
- XDT_CHECK_PACKAGE([THUNARX], [thunarx-3], [1.0.1])
- 
- dnl -------------------------------------------------------
--- 
-2.34.1
-
diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.2.bb
similarity index 66%
rename from meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
rename to meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.2.bb
index d981fe14a..065e89254 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.2.bb
@@ -7,7 +7,6 @@ inherit thunar-plugin features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRC_URI += "file://0001-build-Bump-GLib-minimum-required-to-2.26.patch"
-SRC_URI[sha256sum] = "dc1d8c7caa727e76d033d4653dc0742613f57a1711d0050900659c90a84452a0"
+SRC_URI[sha256sum] = "1009d5e6c91534fa49a69090c53c54ab9da2e0428d08d8e687528f63a4ac3f07"
 
 RDEPENDS:${PN} += "samba-server"
-- 
2.39.2


--===============7943683802920830272==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-thunar-shares-plugin-upgrade-0.3.1-0.3.2.patch"

RnJvbSAzMjgwYWE5MmFjYWQxYmM1NTZhYzVjM2QxZDYxMDQ2Y2ZkNjY1YzI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNTo1MDozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRo
dW5hci1zaGFyZXMtcGx1Z2luOiB1cGdyYWRlIDAuMy4xIC0+IDAuMy4yCgotLS0KIC4uLmQtQnVt
cC1HTGliLW1pbmltdW0tcmVxdWlyZWQtdG8tMi4yNi5wYXRjaCB8IDM0IC0tLS0tLS0tLS0tLS0t
LS0tLS0KIC4uLjAuMy4xLmJiID0+IHRodW5hci1zaGFyZXMtcGx1Z2luXzAuMy4yLmJifSB8ICAz
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzNiBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhLXhmY2UvcmVjaXBlcy10aHVuYXItcGx1Z2lucy9zaGFyZXMv
ZmlsZXMvMDAwMS1idWlsZC1CdW1wLUdMaWItbWluaW11bS1yZXF1aXJlZC10by0yLjI2LnBhdGNo
CiByZW5hbWUgbWV0YS14ZmNlL3JlY2lwZXMtdGh1bmFyLXBsdWdpbnMvc2hhcmVzL3t0aHVuYXIt
c2hhcmVzLXBsdWdpbl8wLjMuMS5iYiA9PiB0aHVuYXItc2hhcmVzLXBsdWdpbl8wLjMuMi5iYn0g
KDY2JSkKCmRpZmYgLS1naXQgYS9tZXRhLXhmY2UvcmVjaXBlcy10aHVuYXItcGx1Z2lucy9zaGFy
ZXMvZmlsZXMvMDAwMS1idWlsZC1CdW1wLUdMaWItbWluaW11bS1yZXF1aXJlZC10by0yLjI2LnBh
dGNoIGIvbWV0YS14ZmNlL3JlY2lwZXMtdGh1bmFyLXBsdWdpbnMvc2hhcmVzL2ZpbGVzLzAwMDEt
YnVpbGQtQnVtcC1HTGliLW1pbmltdW0tcmVxdWlyZWQtdG8tMi4yNi5wYXRjaApkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMWNkMjQ1NzJmLi4wMDAwMDAwMDAKLS0tIGEvbWV0YS14ZmNl
L3JlY2lwZXMtdGh1bmFyLXBsdWdpbnMvc2hhcmVzL2ZpbGVzLzAwMDEtYnVpbGQtQnVtcC1HTGli
LW1pbmltdW0tcmVxdWlyZWQtdG8tMi4yNi5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM0ICsw
LDAgQEAKLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0bGFiLnhmY2Uub3Jn
L3RodW5hci1wbHVnaW5zL3RodW5hci1zaGFyZXMtcGx1Z2luLy0vY29tbWl0L2U0YmNlMjFhXQot
Ci1TaWduZWQtb2ZmLWJ5OiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4KLQotRnJv
bSBlNGJjZTIxYTFiZDc0NGNjZmRlODRkZTQ2NjlhYzMwYWExZDcyMTM1IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQotRnJvbTogPT9VVEYtOD9xP0dhPUMzPUFCbD0yMEJvbml0aG9uPz0gPGdhZWxA
eGZjZS5vcmc+Ci1EYXRlOiBGcmksIDIgRGVjIDIwMjIgMjA6MTg6NDYgKzAxMDAKLVN1YmplY3Q6
IFtQQVRDSF0gYnVpbGQ6IEJ1bXAgR0xpYiBtaW5pbXVtIHJlcXVpcmVkIHRvIDIuMjYKLQotVGhp
cyBpcyB0aGUgbWluaW11bSByZXF1aXJlZCB0byBidWlsZCBzaW5jZSB4ZmNlNC1kZXYtdG9vbHMg
Pj0gNC4xNy4xCi1zZXQgR0xJQl9WRVJTSU9OX01BWF9BTExPV0VEIHRvIHRoZSBHTGliIHZlcnNp
b24gZm91bmQgaW4KLWNvbmZpZ3VyZS5hYy5pbi4KLQotTVI6ICEzCi0tLS0KLSBjb25maWd1cmUu
YWMgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Ci0KLWRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGE0NTg3
ODUuLmJjNmQyNGMgMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsrKyBiL2NvbmZpZ3VyZS5h
YwotQEAgLTYxLDcgKzYxLDcgQEAgZG5sIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLSBkbmwgUGFja2FnZXMgY2hlY2tzCi0gZG5sIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLSBYRFRf
Q0hFQ0tfUEFDS0FHRShbR1RLXSwgW2d0aystMy4wXSwgWzMuMjIuMF0pCi0tWERUX0NIRUNLX1BB
Q0tBR0UoW0dMSUJdLCBbZ2xpYi0yLjBdLCBbMi4xOC4wXSkKLStYRFRfQ0hFQ0tfUEFDS0FHRShb
R0xJQl0sIFtnbGliLTIuMF0sIFsyLjI2LjBdKQotIFhEVF9DSEVDS19QQUNLQUdFKFtUSFVOQVJY
XSwgW3RodW5hcngtM10sIFsxLjAuMV0pCi0gCi0gZG5sIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdp
dCBhL21ldGEteGZjZS9yZWNpcGVzLXRodW5hci1wbHVnaW5zL3NoYXJlcy90aHVuYXItc2hhcmVz
LXBsdWdpbl8wLjMuMS5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXRodW5hci1wbHVnaW5zL3NoYXJl
cy90aHVuYXItc2hhcmVzLXBsdWdpbl8wLjMuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDY2JQpyZW5h
bWUgZnJvbSBtZXRhLXhmY2UvcmVjaXBlcy10aHVuYXItcGx1Z2lucy9zaGFyZXMvdGh1bmFyLXNo
YXJlcy1wbHVnaW5fMC4zLjEuYmIKcmVuYW1lIHRvIG1ldGEteGZjZS9yZWNpcGVzLXRodW5hci1w
bHVnaW5zL3NoYXJlcy90aHVuYXItc2hhcmVzLXBsdWdpbl8wLjMuMi5iYgppbmRleCBkOTgxZmUx
NGEuLjA2NWU4OTI1NCAxMDA2NDQKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMtdGh1bmFyLXBsdWdp
bnMvc2hhcmVzL3RodW5hci1zaGFyZXMtcGx1Z2luXzAuMy4xLmJiCisrKyBiL21ldGEteGZjZS9y
ZWNpcGVzLXRodW5hci1wbHVnaW5zL3NoYXJlcy90aHVuYXItc2hhcmVzLXBsdWdpbl8wLjMuMi5i
YgpAQCAtNyw3ICs3LDYgQEAgaW5oZXJpdCB0aHVuYXItcGx1Z2luIGZlYXR1cmVzX2NoZWNrCiBB
TllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVTfSIKIFJFUVVJUkVE
X0RJU1RST19GRUFUVVJFUyA9ICJwYW0iCiAKLVNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLWJ1aWxk
LUJ1bXAtR0xpYi1taW5pbXVtLXJlcXVpcmVkLXRvLTIuMjYucGF0Y2giCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZGMxZDhjN2NhYTcyN2U3NmQwMzNkNDY1M2RjMDc0MjYxM2Y1N2ExNzExZDAwNTA5
MDA2NTljOTBhODQ0NTJhMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxMDA5ZDVlNmM5MTUzNGZh
NDlhNjkwOTBjNTNjNTRhYjlkYTJlMDQyOGQwOGQ4ZTY4NzUyOGY2M2E0YWMzZjA3IgogCiBSREVQ
RU5EUzoke1BOfSArPSAic2FtYmEtc2VydmVyIgotLSAKMi4zOS4yCgo=

--===============7943683802920830272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/thunar-shares-plugin: SRC_URI changed from "http://archive.xfce.org/src/thunar-plugins/thunar-shares-plugin/0.3/thunar-shares-plugin-0.3.1.tar.bz2 file://0001-build-Bump-GLib-minimum-required-to-2.26.patch" to "http://archive.xfce.org/src/thunar-plugins/thunar-shares-plugin/0.3/thunar-shares-plugin-0.3.2.tar.bz2"
packages/core2-64-poky-linux/thunar-shares-plugin: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin: PACKAGES: added "thunar-shares-plugin-locale-kab thunar-shares-plugin-locale-hye thunar-shares-plugin-locale-hye-ru thunar-shares-plugin-locale-et"
packages/core2-64-poky-linux/thunar-shares-plugin: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-dbg: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-dbg: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-dev: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-dev: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-doc: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-doc: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ar: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ar: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ast: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ast: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-be: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-be: PKGSIZE changed from 4726 to 4728 (+0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-be: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-bg: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-bg: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ca: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ca: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-cs: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-cs: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-da: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-da: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-de: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-de: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-el: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-el: PKGSIZE changed from 4964 to 5030 (+1%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-el: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-en-au: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-en-au: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-en-gb: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-en-gb: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-es: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-es: PKGSIZE changed from 3838 to 3858 (+1%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-es: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-eu: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-eu: PKGSIZE changed from 3626 to 3637 (+0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-eu: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-fi: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-fi: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-fr: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-fr: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-gl: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-gl: PKGSIZE changed from 3661 to 3660 (-0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-gl: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-he: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-he: PKGSIZE changed from 4023 to 4033 (+0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-he: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-hr: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-hr: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-hu: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-hu: PKGSIZE changed from 3798 to 3800 (+0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-hu: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-hy-am: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-hy-am: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-id: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-id: PKGSIZE changed from 3540 to 3583 (+1%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-id: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ie: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ie: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-is: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-is: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-it: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-it: PKGSIZE changed from 3774 to 3796 (+1%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-it: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ja: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ja: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-kk: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-kk: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ko: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ko: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-lt: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-lt: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-lv: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-lv: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ms: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ms: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-nb: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-nb: PKGSIZE changed from 3538 to 3527 (-0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-nb: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-nl: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-nl: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-oc: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-oc: PKGSIZE changed from 3779 to 3796 (+0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-oc: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-pl: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-pl: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-pt-br: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-pt-br: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-pt: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-pt: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ro: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ro: PKGSIZE changed from 3696 to 3711 (+0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ro: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ru: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ru: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sk: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sk: PKGSIZE changed from 3898 to 3937 (+1%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sk: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sl: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sl: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sq: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sq: PKGSIZE changed from 3764 to 3770 (+0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sq: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sr: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sr: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sv: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-sv: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-tr: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-tr: PKGSIZE changed from 3679 to 3678 (-0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-tr: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ug: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ug: PKGSIZE changed from 4538 to 4545 (+0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ug: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-uk: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-uk: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ur-pk: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ur-pk: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ur: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-ur: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-uz: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-uz: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-vi: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-vi: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-zh-cn: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-zh-cn: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-zh-tw: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-zh-tw: PKGSIZE changed from 3451 to 3450 (-0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-locale-zh-tw: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-src: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-src: PKGSIZE changed from 71607 to 71611 (+0%)
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-src: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-staticdev: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin-staticdev: PV changed from "0.3.1" to "0.3.2"
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin: PKGV changed from 0.3.1 [default] to 0.3.2 [default]
packages/core2-64-poky-linux/thunar-shares-plugin/thunar-shares-plugin: PV changed from "0.3.1" to "0.3.2"

--===============7943683802920830272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/thunar-shares-plugin: PACKAGES: added "thunar-shares-plugin-locale-hye-ru thunar-shares-plugin-locale-hye thunar-shares-plugin-locale-et thunar-shares-plugin-locale-kab"

--===============7943683802920830272==--

