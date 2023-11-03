Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B88C25B07
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.63880.1699041167836017796
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MK77Ci6B;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jaKXToXZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b96becf96-67a2629e-707d-4a47-a344-7b41799a27d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3Y1EfvLn0gORplewZsc/snpb0ODqGReyObY1ktdg+MA=;
	b=MK77Ci6B8wiajYXf5fBiJWFvoImMs77rPAAyP330+tkDEnv5ZKKN9DEU4gLLNuPA
	6tC87FJHwOINwHd64Dz63t+i8Zqmzee4az/5Kv5oIGdBAVufj5OQzeUbnK2KpFz0dOI
	wCy9gO8xRhNkHRfp71x8mQa6z7h+VVyx00WOIzcY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3Y1EfvLn0gORplewZsc/snpb0ODqGReyObY1ktdg+MA=;
	b=jaKXToXZ/mn91cs3TF/rvnqdyhmpgT3NwJ7SHFKom64BaR7oDASKbUHj+/pHPcPf
	BixM8IJpYWZz9rGusoXzwzNenIZm48lHGNiCyKOm3B/L5Y5bJhGwXDCrHm6VsJlv8rS
	C3J0GxKbZu6ALFR7KVOSpQtjsOrRJKjfmxC/zfR4=
Content-Type: multipart/mixed; boundary="===============2370569611058724385=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libsodium: upgrading to 1.0.19 SUCCEEDED
Message-ID: <0101018b96becf96-67a2629e-707d-4a47-a344-7b41799a27d9-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105970

--===============2370569611058724385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsodium* to *1.0.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsodium-upgrade-1.0.18-1.0.19.patch
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
From e7874cb60dc93d2bb4c54f80847d15e19998c4ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 14:55:01 +0000
Subject: [PATCH] libsodium: upgrade 1.0.18 -> 1.0.19

---
 ...ibsodium_1.0.18.bb => libsodium_1.0.19.bb} | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-crypto/libsodium/{libsodium_1.0.18.bb => libsodium_1.0.19.bb} (26%)

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
similarity index 26%
rename from meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb
rename to meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
index 53b3ddc26..142b63917 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
@@ -1,13 +1,35 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,7 +1,7 @@
+#  /*
+#   * ISC License
+#   *
+# - * Copyright (c) 2013-2019
+# + * Copyright (c) 2013-2023
+#   * Frank Denis <j at pureftpd dot org>
+#   *
+#   * Permission to use, copy, modify, and/or distribute this software for any
+# 
+#
+
 SUMMARY = "The Sodium crypto library"
 HOMEPAGE = "http://libsodium.org/"
 BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=47203c753972e855179dfffe15188bee"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=49ce3b426e6a002e23a1387248e6dbe9"
 
 SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "3ca9ebc13b6b4735acae0a6a4c4f9a95"
-SRC_URI[sha256sum] = "6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1"
+SRC_URI[sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea"
 
 inherit autotools
 
+S = "${WORKDIR}/libsodium-stable"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


--===============2370569611058724385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsodium: PKGV changed from 1.0.18 [default] to 1.0.19 [default]
packages/core2-64-poky-linux/libsodium: SRC_URI changed from "https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz" to "https://download.libsodium.org/libsodium/releases/libsodium-1.0.19.tar.gz"
packages/core2-64-poky-linux/libsodium: PV changed from "1.0.18" to "1.0.19"
packages/core2-64-poky-linux/libsodium/libsodium-dbg: PV changed from "1.0.18" to "1.0.19"
packages/core2-64-poky-linux/libsodium/libsodium-dbg: PKGSIZE changed from 2216208 to 2333416 (+5%)
packages/core2-64-poky-linux/libsodium/libsodium-dbg: FILELIST: removed "/usr/lib/.debug/libsodium.so.23.3.0", added "/usr/lib/.debug/libsodium.so.26.1.0"
packages/core2-64-poky-linux/libsodium/libsodium-dbg: PKGV changed from 1.0.18 [default] to 1.0.19 [default]
packages/core2-64-poky-linux/libsodium/libsodium-dev: PV changed from "1.0.18" to "1.0.19"
packages/core2-64-poky-linux/libsodium/libsodium-dev: PKGSIZE changed from 154618 to 166736 (+8%)
packages/core2-64-poky-linux/libsodium/libsodium-dev: FILELIST: added "/usr/include/sodium/crypto_aead_aegis256.h /usr/include/sodium/crypto_kdf_hkdf_sha256.h /usr/include/sodium/crypto_kdf_hkdf_sha512.h /usr/include/sodium/crypto_aead_aegis128l.h"
packages/core2-64-poky-linux/libsodium/libsodium-dev: PKGV changed from 1.0.18 [default] to 1.0.19 [default]
packages/core2-64-poky-linux/libsodium/libsodium-doc: PV changed from "1.0.18" to "1.0.19"
packages/core2-64-poky-linux/libsodium/libsodium-doc: PKGV changed from 1.0.18 [default] to 1.0.19 [default]
packages/core2-64-poky-linux/libsodium/libsodium-locale: PV changed from "1.0.18" to "1.0.19"
packages/core2-64-poky-linux/libsodium/libsodium-locale: PKGV changed from 1.0.18 [default] to 1.0.19 [default]
packages/core2-64-poky-linux/libsodium/libsodium-src: PV changed from "1.0.18" to "1.0.19"
packages/core2-64-poky-linux/libsodium/libsodium-src: PKGSIZE changed from 877991 to 928035 (+6%)
packages/core2-64-poky-linux/libsodium/libsodium-src: FILELIST: directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_kdf -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_kdf, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream/salsa20 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/salsa20, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/ristretto255/ref10 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult/ristretto255/ref10, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_aead/chacha20poly1305/sodium -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/chacha20poly1305, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream/xchacha20 -> /usr/sr
 c/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/xchacha20, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_onetimeauth -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_onetimeauth, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_aead/aes256gcm/aesni -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aes256gcm/aesni, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_shorthash/siphash24 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_shorthash/siphash24, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_box/curve25519xchacha20poly1305 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_box/curve25519xchacha20poly1305, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream/xsalsa20 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/xsalsa20, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/l
 ibsodium/crypto_onetimeauth/poly1305 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_onetimeauth/poly1305, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_generichash -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_generichash, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_pwhash/scryptsalsa208sha256 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_pwhash/scryptsalsa208sha256, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/sodium -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/sodium, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_verify/sodium -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_verify, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_secretstream/xchacha20poly1305 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_secretstream/xchacha20poly1305, directory renamed /usr/src/debug/libsodium/1.0
 .18-r0/src/libsodium/crypto_hash -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_hash, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream/chacha20/dolbeau -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/chacha20/dolbeau, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream/chacha20/ref -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/chacha20/ref, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_core/ed25519/ref10/fe_51 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_core/ed25519/ref10/fe_51, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_box -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_box, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/randombytes/internal -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/randombytes/internal, directory renamed /usr/src/debug/libsodium/1.0.18-r0/sr
 c/libsodium/randombytes -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/randombytes, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_sign/ed25519/ref10 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_sign/ed25519/ref10, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_aead/xchacha20poly1305/sodium -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/xchacha20poly1305, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream/salsa208/ref -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/salsa208/ref, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream/chacha20 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/chacha20, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_secretbox/xchacha20poly1305 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_secretbox/xchacha20poly1305, directory renamed /
 usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_core/hsalsa20 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_core/hsalsa20, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_core/hchacha20 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_core/hchacha20, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_hash/sha256/cp -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_hash/sha256/cp, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_core/ed25519 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_core/ed25519, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_hash/sha512/cp -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_hash/sha512/cp, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_hash/sha512 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_hash/sha512, directory renamed /usr/src/debug/libsodium/1
 .0.18-r0/src/libsodium/crypto_stream/salsa208 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/salsa208, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/randombytes/sysrandom -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/randombytes/sysrandom, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_hash/sha256 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_hash/sha256, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_sign -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_sign, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_box/curve25519xsalsa20poly1305 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_box/curve25519xsalsa20poly1305, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/
 libsodium/crypto_pwhash -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_pwhash, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_sign/ed25519 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_sign/ed25519, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_auth/hmacsha512 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_auth/hmacsha512, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_generichash/blake2b/ref -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_generichash/blake2b/ref, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/curve25519/ref10 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult/curve25519/ref10, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_onetimeauth/poly1305/sse2 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_onetimeauth/poly1305/sse2, directory renamed /usr
 /src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_core/hsalsa20/ref2 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_core/hsalsa20/ref2, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_kdf/blake2b -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_kdf/blake2b, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_secretbox/xsalsa20poly1305 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_secretbox/xsalsa20poly1305, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_pwhash/scryptsalsa208sha256/nosse -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_pwhash/scryptsalsa208sha256/nosse, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream/salsa2012/ref -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/salsa2012/ref, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_core/ed25519/ref10 -> /usr/src/debug/libsodium/1.
 0.19-r0/src/libsodium/crypto_core/ed25519/ref10, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_onetimeauth/poly1305/donna -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_onetimeauth/poly1305/donna, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_core/salsa/ref -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_core/salsa/ref, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/curve25519 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult/curve25519, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream/salsa20/xmm6 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/salsa20/xmm6, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream/salsa2012 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/salsa2012, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_se
 cretbox -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_secretbox, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/ed25519/ref10 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult/ed25519/ref10, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_stream/salsa20/xmm6int -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_stream/salsa20/xmm6int, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_pwhash/scryptsalsa208sha256/sse -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_pwhash/scryptsalsa208sha256/sse, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_auth -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_auth, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_auth/hmacsha256 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_auth/hmacsha256, directory renamed /usr/src/debug/libsodium/1.0.
 18-r0/src/libsodium/crypto_generichash/blake2b -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_generichash/blake2b, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_kx -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_kx, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_shorthash/siphash24/ref -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_shorthash/siphash24/ref, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_pwhash/argon2 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_pwhash/argon2, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_shorthash -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_shorthash, directory renamed /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_auth/hmacsha512256 -> /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_auth/hmacsha512256, removed "/usr/src/debug/libsodium/1.0.18-r0/src/libsodium/in
 clude/sodium/private/implementations.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_core_hsalsa20.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_shorthash_siphash24.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/fe.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/private/ed25519_ref10.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_core_salsa2012.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_scalarmult_curve25519.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/ladder_base.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_kdf_blake2b.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/utils.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_core_salsa208.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_c
 ore_hchacha20.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_sign.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/curve25519_sandy2x.c /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/randombytes_sysrandom.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_generichash.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_aead_aes256gcm.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/curve25519_sandy2x.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/ladder.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/fe_frombytes_sandy2x.c /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_onetimeauth_poly1305.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_auth_hmacsha256.h /usr/src/debug/libsodium/1.0.18-r0/src/li
 bsodium/include/sodium/crypto_hash_sha256.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_pwhash_argon2i.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_pwhash_scryptsalsa208sha256.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_generichash_blake2b.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_auth_hmacsha512.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_stream_xsalsa20.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/randombytes.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/randombytes_internal_random.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_secretbox_xchacha20poly1305.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_onetimeauth.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/runtime.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodi
 um/private/chacha20_ietf_ext.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_hash_sha512.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/fe51_invert.c /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_secretstream_xchacha20poly1305.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_secretbox_xsalsa20poly1305.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_box_curve25519xchacha20poly1305.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_box_curve25519xsalsa20poly1305.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_box.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_scalarmult.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/fe51.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_core_ed25519.h /usr/src/debug/libsodium/1.0
 .18-r0/src/libsodium/include/sodium/core.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_secretbox.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_stream_chacha20.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_stream_salsa20.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_verify_16.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_verify_32.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_verify_64.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/private/ed25519_ref10_fe_51.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_auth_hmacsha512256.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/private/common.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_pwhash_argon2id.h /usr/src/debug/libsodium/1.0.18-r0/src/libsodium/include/sodium/crypto_sign_ed25519.h", a
 dded "/usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/private/implementations.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_core_hsalsa20.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_shorthash_siphash24.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis128l/aegis128l_aesni.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/fe.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/private/ed25519_ref10.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_core_salsa2012.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_scalarmult_curve25519.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis128l/aegis128l_aesni.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis256/aegis256_common.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis256/aegis256_aesni.h /usr/s
 rc/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis256/implementations.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aes256gcm/aead_aes256gcm.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_kdf_blake2b.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/utils.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_core_salsa208.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_core_hchacha20.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis256/aegis256_aesni.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_core/softaes/softaes.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_sign.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/curve25519_sandy2x.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/randombytes_sysrandom.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include
 /sodium/crypto_generichash.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_aead_aes256gcm.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/curve25519_sandy2x.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis256/aead_aegis256.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/ladder.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/fe_frombytes_sandy2x.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_onetimeauth_poly1305.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_auth_hmacsha256.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_hash_sha256.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_pwhash_argon2i.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_pwhash_scryptsalsa208sha256.h /usr/src/debug/libsodium/1
 .0.19-r0/src/libsodium/include/sodium/crypto_generichash_blake2b.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_auth_hmacsha512.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_stream_xsalsa20.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/private/softaes.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/randombytes.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_secretbox_xchacha20poly1305.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_onetimeauth.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/private/chacha20_ietf_ext.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/runtime.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_hash_sha512.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/fe51_invert.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/includ
 e/sodium/crypto_secretstream_xchacha20poly1305.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_secretbox_xsalsa20poly1305.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_box_curve25519xchacha20poly1305.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_kdf/hkdf/kdf_hkdf_sha256.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_kdf/hkdf/kdf_hkdf_sha512.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis128l/aead_aegis128l.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_box.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_box_curve25519xsalsa20poly1305.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_scalarmult.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_scalarmult/curve25519/sandy2x/fe51.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis128l/implementations.h /usr/src/debug/libsodium/1.0.19-r0/src/lib
 sodium/include/sodium/core.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_core_ed25519.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_kdf_hkdf_sha512.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis128l/aegis128l_soft.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis128l/aegis128l_common.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis256/aegis256_soft.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_kdf_hkdf_sha256.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_secretbox.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_stream_chacha20.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_stream_salsa20.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_verify_16.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_verify_32.h /usr/src/debug
 /libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis256/aegis256_soft.c /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_verify_64.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/private/ed25519_ref10_fe_51.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/randombytes_internal_random.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_auth_hmacsha512256.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/private/common.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_pwhash_argon2id.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/include/sodium/crypto_sign_ed25519.h /usr/src/debug/libsodium/1.0.19-r0/src/libsodium/crypto_aead/aegis128l/aegis128l_soft.h"
packages/core2-64-poky-linux/libsodium/libsodium-src: PKGV changed from 1.0.18 [default] to 1.0.19 [default]
packages/core2-64-poky-linux/libsodium/libsodium-staticdev: PV changed from "1.0.18" to "1.0.19"
packages/core2-64-poky-linux/libsodium/libsodium-staticdev: PKGV changed from 1.0.18 [default] to 1.0.19 [default]
packages/core2-64-poky-linux/libsodium/libsodium: PV changed from "1.0.18" to "1.0.19"
packages/core2-64-poky-linux/libsodium/libsodium: PKGSIZE changed from 371475 to 393075 (+6%)
packages/core2-64-poky-linux/libsodium/libsodium: FILELIST: removed "/usr/lib/libsodium.so.23 /usr/lib/libsodium.so.23.3.0", added "/usr/lib/libsodium.so.26 /usr/lib/libsodium.so.26.1.0"
packages/core2-64-poky-linux/libsodium/libsodium: PKG changed from libsodium23 to libsodium26
packages/core2-64-poky-linux/libsodium/libsodium: PKGV changed from 1.0.18 [default] to 1.0.19 [default]
Changes to packages/core2-64-poky-linux/libsodium (sysroot):
  /usr/lib/libsodium.so changed symlink target from libsodium.so.23.3.0 to libsodium.so.26.1.0
  /usr/lib/libsodium.so.23.3.0 moved to /usr/lib/libsodium.so.26.1.0
  /usr/lib/libsodium.so.23 moved to /usr/lib/libsodium.so.26
  /usr/include/sodium/crypto_aead_aegis128l.h was added
  /usr/include/sodium/crypto_aead_aegis256.h was added
  /usr/include/sodium/crypto_kdf_hkdf_sha256.h was added
  /usr/include/sodium/crypto_kdf_hkdf_sha512.h was added

--===============2370569611058724385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libsodium/libsodium-dev: FILELIST: added "/usr/include/sodium/crypto_aead_aegis128l.h /usr/include/sodium/crypto_kdf_hkdf_sha512.h /usr/include/sodium/crypto_kdf_hkdf_sha256.h /usr/include/sodium/crypto_aead_aegis256.h"
packages/core2-64-poky-linux/libsodium/libsodium: FILELIST: removed "/usr/lib/libsodium.so.23.3.0 /usr/lib/libsodium.so.23", added "/usr/lib/libsodium.so.26 /usr/lib/libsodium.so.26.1.0"
packages/core2-64-poky-linux/libsodium/libsodium: PKG changed from libsodium23 to libsodium26
Changes to packages/core2-64-poky-linux/libsodium (sysroot):
  /usr/lib/libsodium.so changed symlink target from libsodium.so.23.3.0 to libsodium.so.26.1.0
  /usr/lib/libsodium.so.23.3.0 moved to /usr/lib/libsodium.so.26.1.0
  /usr/lib/libsodium.so.23 moved to /usr/lib/libsodium.so.26
  /usr/include/sodium/crypto_aead_aegis128l.h was added
  /usr/include/sodium/crypto_aead_aegis256.h was added
  /usr/include/sodium/crypto_kdf_hkdf_sha256.h was added
  /usr/include/sodium/crypto_kdf_hkdf_sha512.h was added

--===============2370569611058724385==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsodium-upgrade-1.0.18-1.0.19.patch"

RnJvbSBlNzg3NGNiNjBkYzkzZDJiYjRjNTRmODA4NDdkMTVlMTk5OThjNGZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNDo1NTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNvZGl1bTogdXBncmFkZSAxLjAuMTggLT4gMS4wLjE5CgotLS0KIC4uLmlic29kaXVtXzEuMC4x
OC5iYiA9PiBsaWJzb2RpdW1fMS4wLjE5LmJifSB8IDI4ICsrKysrKysrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEtb2UvcmVjaXBlcy1jcnlwdG8vbGlic29kaXVtL3tsaWJzb2RpdW1fMS4wLjE4LmJiID0+IGxp
YnNvZGl1bV8xLjAuMTkuYmJ9ICgyNiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWNy
eXB0by9saWJzb2RpdW0vbGlic29kaXVtXzEuMC4xOC5iYiBiL21ldGEtb2UvcmVjaXBlcy1jcnlw
dG8vbGlic29kaXVtL2xpYnNvZGl1bV8xLjAuMTkuYmIKc2ltaWxhcml0eSBpbmRleCAyNiUKcmVu
YW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWNyeXB0by9saWJzb2RpdW0vbGlic29kaXVtXzEuMC4x
OC5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLWNyeXB0by9saWJzb2RpdW0vbGlic29kaXVt
XzEuMC4xOS5iYgppbmRleCA1M2IzZGRjMjYuLjE0MmI2MzkxNyAxMDA2NDQKLS0tIGEvbWV0YS1v
ZS9yZWNpcGVzLWNyeXB0by9saWJzb2RpdW0vbGlic29kaXVtXzEuMC4xOC5iYgorKysgYi9tZXRh
LW9lL3JlY2lwZXMtY3J5cHRvL2xpYnNvZGl1bS9saWJzb2RpdW1fMS4wLjE5LmJiCkBAIC0xLDEz
ICsxLDM1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVu
IHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxl
YXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhl
IGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0
YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVk
LicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQor
IyBAQCAtMSw3ICsxLDcgQEAKKyMgIC8qCisjICAgKiBJU0MgTGljZW5zZQorIyAgICoKKyMgLSAq
IENvcHlyaWdodCAoYykgMjAxMy0yMDE5CisjICsgKiBDb3B5cmlnaHQgKGMpIDIwMTMtMjAyMwor
IyAgICogRnJhbmsgRGVuaXMgPGogYXQgcHVyZWZ0cGQgZG90IG9yZz4KKyMgICAqCisjICAgKiBQ
ZXJtaXNzaW9uIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBhbmQvb3IgZGlzdHJpYnV0ZSB0aGlzIHNv
ZnR3YXJlIGZvciBhbnkKKyMgCisjCisKIFNVTU1BUlkgPSAiVGhlIFNvZGl1bSBjcnlwdG8gbGli
cmFyeSIKIEhPTUVQQUdFID0gImh0dHA6Ly9saWJzb2RpdW0ub3JnLyIKIEJVR1RSQUNLRVIgPSAi
aHR0cHM6Ly9naXRodWIuY29tL2plZGlzY3QxL2xpYnNvZGl1bS9pc3N1ZXMiCiBMSUNFTlNFID0g
IklTQyIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTQ3MjAzYzc1Mzk3
MmU4NTUxNzlkZmZmZTE1MTg4YmVlIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9NDljZTNiNDI2ZTZhMDAyZTIzYTEzODcyNDhlNmRiZTkiCiAKIFNSQ19VUkkgPSAiaHR0
cHM6Ly9kb3dubG9hZC5saWJzb2RpdW0ub3JnL2xpYnNvZGl1bS9yZWxlYXNlcy8ke0JQTn0tJHtQ
Vn0udGFyLmd6IgotU1JDX1VSSVttZDVzdW1dID0gIjNjYTllYmMxM2I2YjQ3MzVhY2FlMGE2YTRj
NGY5YTk1IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZmNTA0NDkwYjM0MmE0ZjhhNGM0YTAyZmM5
Yjg2NmNiZWY4NjIyZDVkZjRlNTQ1MmI0NmJlMTIxZTQ2NjM2YzEiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMDE4ZDc5ZmUwYTA0NWNjYTA3MzMxZDM3YmQwY2I1N2IyZTgzOGM1MWJjNDhmZDgzN2Ex
NDcyZTUwMDY4YmJlYSIKIAogaW5oZXJpdCBhdXRvdG9vbHMKIAorUyA9ICIke1dPUktESVJ9L2xp
YnNvZGl1bS1zdGFibGUiCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0tIAoy
LjM5LjIKCg==

--===============2370569611058724385==--

