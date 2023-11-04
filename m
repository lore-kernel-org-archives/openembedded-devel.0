Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE3CC05022
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.4225.1699071646726897414
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UJbBItCf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RBdtXPwv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b988fdbab-65d6c828-9e71-43da-be24-ca5c293a529e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wduianQgCIVrWCEW6N1B2cNQ0+CHw9cp7p+k+FH6dU0=;
	b=UJbBItCfQiyKBvkJL/4GzsI2+mB5iSi13FDSPaCPoPGZ1ajY6vE5RP9ons9o+KFe
	EAllQO3fAa++h4gXr0nIrDDnNdzd66fdSoUb9z1IhgIUUpw/9QC5dDI/ILV48pRucuK
	rlX7RNE+OWT7sh15Sem6XcyoRTwNjYAhK+yNeDRk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wduianQgCIVrWCEW6N1B2cNQ0+CHw9cp7p+k+FH6dU0=;
	b=RBdtXPwvW9k8TM+HOtxx5hOD4be5qRrO8e2rToPYWol+9LSsf+2gJeqXuJgfUKOi
	mhGMn+Pz30v4BT28QrgdVW0hhDeW/xwTIn1aLys3C7QwC13NilwGqUy+eHuJDiMqlMA
	yU+2XWN4cF9KUVq4uimtvZrhfJRaIL9eadFexPfw=
Content-Type: multipart/mixed; boundary="===============5000605975053228391=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gupnp-av: upgrading to 0.14.1 SUCCEEDED
Message-ID: <0101018b988fdbab-65d6c828-9e71-43da-be24-ca5c293a529e-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106239

--===============5000605975053228391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gupnp-av* to *0.14.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gupnp-av-upgrade-0.14.0-0.14.1.patch
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
From 4d9b16e8c1335e7b905f71cbcdfc7f5b67c98063 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:32:01 +0000
Subject: [PATCH] gupnp-av: upgrade 0.14.0 -> 0.14.1

---
 .../gupnp/{gupnp-av_0.14.0.bb => gupnp-av_0.14.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-av_0.14.0.bb => gupnp-av_0.14.1.bb} (84%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.1.bb
similarity index 84%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.1.bb
index 48de5868d..2a5c0808e 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.1.bb
@@ -11,4 +11,4 @@ inherit meson pkgconfig gobject-introspection vala
 SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz \
            file://0001-all-Drop-xmlRecoverMemory.patch \
           "
-SRC_URI[sha256sum] = "20aed546fc882e78a3f186a0c8bce5c841cc3a44b7ea528298fbdc82596fb156"
+SRC_URI[sha256sum] = "b79ce0cc4b0c66d9c54bc22183a10e5709a0011d2af272025948efcab33a3e4f"
-- 
2.39.2


--===============5000605975053228391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gupnp-av/gupnp-av-dbg: FILELIST: removed "/usr/lib/.debug/libgupnp-av-1.0.so.3.14.0", added "/usr/lib/.debug/libgupnp-av-1.0.so.3.14.1"
packages/core2-64-poky-linux/gupnp-av/gupnp-av-dbg: PKGV changed from 0.14.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/gupnp-av/gupnp-av-dbg: PKGSIZE changed from 603608 to 608448 (+1%)
packages/core2-64-poky-linux/gupnp-av/gupnp-av-dbg: PV changed from "0.14.0" to "0.14.1"
packages/core2-64-poky-linux/gupnp-av/gupnp-av-dev: PKGV changed from 0.14.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/gupnp-av/gupnp-av-dev: PKGSIZE changed from 455148 to 456608 (+0%)
packages/core2-64-poky-linux/gupnp-av/gupnp-av-dev: PV changed from "0.14.0" to "0.14.1"
packages/core2-64-poky-linux/gupnp-av/gupnp-av-doc: PKGV changed from 0.14.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/gupnp-av/gupnp-av-doc: PV changed from "0.14.0" to "0.14.1"
packages/core2-64-poky-linux/gupnp-av/gupnp-av-locale: PKGV changed from 0.14.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/gupnp-av/gupnp-av-locale: PV changed from "0.14.0" to "0.14.1"
packages/core2-64-poky-linux/gupnp-av/gupnp-av-src: PKGV changed from 0.14.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/gupnp-av/gupnp-av-src: PKGSIZE changed from 527603 to 529315 (+0%)
packages/core2-64-poky-linux/gupnp-av/gupnp-av-src: PV changed from "0.14.0" to "0.14.1"
packages/core2-64-poky-linux/gupnp-av/gupnp-av-staticdev: PKGV changed from 0.14.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/gupnp-av/gupnp-av-staticdev: PV changed from "0.14.0" to "0.14.1"
packages/core2-64-poky-linux/gupnp-av/gupnp-av: FILELIST: removed "/usr/lib/libgupnp-av-1.0.so.3.14.0", added "/usr/lib/libgupnp-av-1.0.so.3.14.1"
packages/core2-64-poky-linux/gupnp-av/gupnp-av: PKGV changed from 0.14.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/gupnp-av/gupnp-av: PKGSIZE changed from 305424 to 305632 (+0%)
packages/core2-64-poky-linux/gupnp-av/gupnp-av: PV changed from "0.14.0" to "0.14.1"
packages/core2-64-poky-linux/gupnp-av: SRC_URI changed from "https://download.gnome.org/sources//gupnp-av/0.14/gupnp-av-0.14.0.tar.xz file://0001-all-Drop-xmlRecoverMemory.patch" to "https://download.gnome.org/sources//gupnp-av/0.14/gupnp-av-0.14.1.tar.xz file://0001-all-Drop-xmlRecoverMemory.patch"
packages/core2-64-poky-linux/gupnp-av: PKGV changed from 0.14.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/gupnp-av: PV changed from "0.14.0" to "0.14.1"
Changes to packages/core2-64-poky-linux/gupnp-av (sysroot):
  /usr/lib/libgupnp-av-1.0.so.3 changed symlink target from libgupnp-av-1.0.so.3.14.0 to libgupnp-av-1.0.so.3.14.1
  /usr/lib/libgupnp-av-1.0.so.3.14.0 moved to /usr/lib/libgupnp-av-1.0.so.3.14.1

--===============5000605975053228391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gupnp-av/gupnp-av: FILELIST: removed "/usr/lib/libgupnp-av-1.0.so.3.14.0", added "/usr/lib/libgupnp-av-1.0.so.3.14.1"
Changes to packages/core2-64-poky-linux/gupnp-av (sysroot):
  /usr/lib/libgupnp-av-1.0.so.3 changed symlink target from libgupnp-av-1.0.so.3.14.0 to libgupnp-av-1.0.so.3.14.1
  /usr/lib/libgupnp-av-1.0.so.3.14.0 moved to /usr/lib/libgupnp-av-1.0.so.3.14.1

--===============5000605975053228391==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gupnp-av-upgrade-0.14.0-0.14.1.patch"

RnJvbSA0ZDliMTZlOGMxMzM1ZTdiOTA1ZjcxY2JjZGZjN2Y1YjY3Yzk4MDYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzozMjowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd1
cG5wLWF2OiB1cGdyYWRlIDAuMTQuMCAtPiAwLjE0LjEKCi0tLQogLi4uL2d1cG5wL3tndXBucC1h
dl8wLjE0LjAuYmIgPT4gZ3VwbnAtYXZfMC4xNC4xLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1t
dWx0aW1lZGlhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2d1cG5wL3tndXBucC1hdl8wLjE0LjAuYmIg
PT4gZ3VwbnAtYXZfMC4xNC4xLmJifSAoODQlKQoKZGlmZiAtLWdpdCBhL21ldGEtbXVsdGltZWRp
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ndXBucC9ndXBucC1hdl8wLjE0LjAuYmIgYi9tZXRhLW11
bHRpbWVkaWEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZ3VwbnAvZ3VwbnAtYXZfMC4xNC4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggODQlCnJlbmFtZSBmcm9tIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9ndXBucC9ndXBucC1hdl8wLjE0LjAuYmIKcmVuYW1lIHRvIG1ldGEtbXVsdGlt
ZWRpYS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ndXBucC9ndXBucC1hdl8wLjE0LjEuYmIKaW5kZXgg
NDhkZTU4NjhkLi4yYTVjMDgwOGUgMTAwNjQ0Ci0tLSBhL21ldGEtbXVsdGltZWRpYS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9ndXBucC9ndXBucC1hdl8wLjE0LjAuYmIKKysrIGIvbWV0YS1tdWx0aW1l
ZGlhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2d1cG5wL2d1cG5wLWF2XzAuMTQuMS5iYgpAQCAtMTEs
NCArMTEsNCBAQCBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBnb2JqZWN0LWludHJvc3BlY3Rpb24g
dmFsYQogU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vJHtCUE59LzAuMTQvJHtCUE59LSR7UFZ9
LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWFsbC1Ecm9wLXhtbFJlY292ZXJNZW1v
cnkucGF0Y2ggXAogICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMGFlZDU0NmZj
ODgyZTc4YTNmMTg2YTBjOGJjZTVjODQxY2MzYTQ0YjdlYTUyODI5OGZiZGM4MjU5NmZiMTU2Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImI3OWNlMGNjNGIwYzY2ZDljNTRiYzIyMTgzYTEwZTU3MDlh
MDAxMWQyYWYyNzIwMjU5NDhlZmNhYjMzYTNlNGYiCi0tIAoyLjM5LjIKCg==

--===============5000605975053228391==--

