Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C4CC4708E
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:04 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.3568.1699067575643993522
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gpmb5Ob0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WU9/K3rt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b9851bb35-34e2ee1a-8127-4cfd-a323-7e0ec1e331c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EduFKbRwh6xoZdKaz+VdkCMka60Sj1PPEezgnY3+Kpk=;
	b=gpmb5Ob0kUZyNrQuPnUfrG2wH77JZPLaoFxt2joVxSi/hORWCE/jP1UqV+UIMECF
	AtxA0BvxbZT50TtDj3rQRhDmYQeBqkFLZbPCljrBw2JVMByEVerVwryp7y4mAnQSMKP
	FRhqvXoHHx3+/DA/vgc5sKyVWJ7qKyVtXBR1tS1k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EduFKbRwh6xoZdKaz+VdkCMka60Sj1PPEezgnY3+Kpk=;
	b=WU9/K3rtA1INoUqsjLeyaZ9jTR1JECsk/nhdsSz1TxnYYiT4erCpJOul6Z5hUlFU
	S6Sy9iBvlgKoJDP8jMiiCRgQkfoKCvX1Vizxm/MG+u5F7V+onI+zfcmYapt6JzxPoEW
	VuaVEMQuPgcwTHQ7tMd69on43w/+OD0xyMgGYtCs=
Content-Type: multipart/mixed; boundary="===============3015071553142890854=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] wolfssl: upgrading to 5.6.4 SUCCEEDED
Message-ID: <0101018b9851bb35-34e2ee1a-8127-4cfd-a323-7e0ec1e331c8-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106227

--===============3015071553142890854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wolfssl* to *5.6.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wolfssl-upgrade-5.5.4-5.6.4.patch
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
From ed448a72b98ac5413d3245997ecf5b485dcc5cc7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:06:12 +0000
Subject: [PATCH] wolfssl: upgrade 5.5.4 -> 5.6.4

---
 .../wolfssl/{wolfssl_5.5.4.bb => wolfssl_5.6.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.5.4.bb => wolfssl_5.6.4.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.4.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.6.4.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.4.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.6.4.bb
index 9ac859f30..a4f42e7bf 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.4.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.6.4.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "4fbd4fd36a21efd9d1a7e17aba390e91c78693b1"
+SRCREV = "37884f864d6fd9b04f44677cb04da15d0c9d6526"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============3015071553142890854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/wolfssl: PKGV changed from 5.5.4 [default] to 5.6.4 [default]
packages/core2-64-poky-linux/wolfssl: PV changed from "5.5.4" to "5.6.4"
Changes to packages/core2-64-poky-linux/wolfssl (sysroot):
  /usr/lib/libwolfssl.so changed symlink target from libwolfssl.so.35.3.0 to libwolfssl.so.41.0.0
  /usr/lib/libwolfssl.so.35.3.0 moved to /usr/lib/libwolfssl.so.41.0.0
  /usr/lib/libwolfssl.so.35 moved to /usr/lib/libwolfssl.so.41
  /usr/include/wolfssl/wolfcrypt/ext_lms.h was added
  /usr/include/wolfssl/wolfcrypt/ext_xmss.h was added
  /usr/include/wolfssl/wolfcrypt/hpke.h was added
  /usr/include/wolfssl/wolfcrypt/lms.h was added
  /usr/include/wolfssl/wolfcrypt/sm2.h was added
  /usr/include/wolfssl/wolfcrypt/sm3.h was added
  /usr/include/wolfssl/wolfcrypt/sm4.h was added
  /usr/include/wolfssl/wolfcrypt/wc_lms.h was added
  /usr/include/wolfssl/wolfcrypt/wc_xmss.h was added
  /usr/include/wolfssl/wolfcrypt/xmss.h was added
  /usr/include/cyassl was removed
  /usr/include/cyassl/callbacks.h was removed
  /usr/include/cyassl/certs_test.h was removed
  /usr/include/cyassl/crl.h was removed
  /usr/include/cyassl/ctaocrypt was removed
  /usr/include/cyassl/ctaocrypt/aes.h was removed
  /usr/include/cyassl/ctaocrypt/arc4.h was removed
  /usr/include/cyassl/ctaocrypt/asn.h was removed
  /usr/include/cyassl/ctaocrypt/asn_public.h was removed
  /usr/include/cyassl/ctaocrypt/blake2.h was removed
  /usr/include/cyassl/ctaocrypt/blake2-impl.h was removed
  /usr/include/cyassl/ctaocrypt/blake2-int.h was removed
  /usr/include/cyassl/ctaocrypt/camellia.h was removed
  /usr/include/cyassl/ctaocrypt/chacha.h was removed
  /usr/include/cyassl/ctaocrypt/coding.h was removed
  /usr/include/cyassl/ctaocrypt/compress.h was removed
  /usr/include/cyassl/ctaocrypt/des3.h was removed
  /usr/include/cyassl/ctaocrypt/dh.h was removed
  /usr/include/cyassl/ctaocrypt/dsa.h was removed
  /usr/include/cyassl/ctaocrypt/ecc.h was removed
  /usr/include/cyassl/ctaocrypt/error-crypt.h was removed
  /usr/include/cyassl/ctaocrypt/fips_test.h was removed
  /usr/include/cyassl/ctaocrypt/hmac.h was removed
  /usr/include/cyassl/ctaocrypt/integer.h was removed
  /usr/include/cyassl/ctaocrypt/logging.h was removed
  /usr/include/cyassl/ctaocrypt/md2.h was removed
  /usr/include/cyassl/ctaocrypt/md4.h was removed
  /usr/include/cyassl/ctaocrypt/md5.h was removed
  /usr/include/cyassl/ctaocrypt/memory.h was removed
  /usr/include/cyassl/ctaocrypt/misc.h was removed
  /usr/include/cyassl/ctaocrypt/mpi_class.h was removed
  /usr/include/cyassl/ctaocrypt/mpi_superclass.h was removed
  /usr/include/cyassl/ctaocrypt/pkcs7.h was removed
  /usr/include/cyassl/ctaocrypt/poly1305.h was removed
  /usr/include/cyassl/ctaocrypt/pwdbased.h was removed
  /usr/include/cyassl/ctaocrypt/random.h was removed
  /usr/include/cyassl/ctaocrypt/ripemd.h was removed
  /usr/include/cyassl/ctaocrypt/rsa.h was removed
  /usr/include/cyassl/ctaocrypt/settings_comp.h was removed
  /usr/include/cyassl/ctaocrypt/settings.h was removed
  /usr/include/cyassl/ctaocrypt/sha256.h was removed
  /usr/include/cyassl/ctaocrypt/sha512.h was removed
  /usr/include/cyassl/ctaocrypt/sha.h was removed
  /usr/include/cyassl/ctaocrypt/tfm.h was removed
  /usr/include/cyassl/ctaocrypt/types.h was removed
  /usr/include/cyassl/ctaocrypt/visibility.h was removed
  /usr/include/cyassl/ctaocrypt/wc_port.h was removed
  /usr/include/cyassl/error-ssl.h was removed
  /usr/include/cyassl/ocsp.h was removed
  /usr/include/cyassl/openssl was removed
  /usr/include/cyassl/openssl/asn1.h was removed
  /usr/include/cyassl/openssl/bio.h was removed
  /usr/include/cyassl/openssl/bn.h was removed
  /usr/include/cyassl/openssl/conf.h was removed
  /usr/include/cyassl/openssl/crypto.h was removed
  /usr/include/cyassl/openssl/des.h was removed
  /usr/include/cyassl/openssl/dh.h was removed
  /usr/include/cyassl/openssl/dsa.h was removed
  /usr/include/cyassl/openssl/ec25519.h was removed
  /usr/include/cyassl/openssl/ec448.h was removed
  /usr/include/cyassl/openssl/ecdh.h was removed
  /usr/include/cyassl/openssl/ecdsa.h was removed
  /usr/include/cyassl/openssl/ec.h was removed
  /usr/include/cyassl/openssl/ed25519.h was removed
  /usr/include/cyassl/openssl/ed448.h was removed
  /usr/include/cyassl/openssl/engine.h was removed
  /usr/include/cyassl/openssl/err.h was removed
  /usr/include/cyassl/openssl/evp.h was removed
  /usr/include/cyassl/openssl/hmac.h was removed
  /usr/include/cyassl/openssl/lhash.h was removed
  /usr/include/cyassl/openssl/md4.h was removed
  /usr/include/cyassl/openssl/md5.h was removed
  /usr/include/cyassl/openssl/ocsp.h was removed
  /usr/include/cyassl/openssl/opensslconf.h was removed
  /usr/include/cyassl/openssl/opensslv.h was removed
  /usr/include/cyassl/openssl/ossl_typ.h was removed
  /usr/include/cyassl/openssl/pem.h was removed
  /usr/include/cyassl/openssl/pkcs12.h was removed
  /usr/include/cyassl/openssl/rand.h was removed
  /usr/include/cyassl/openssl/ripemd.h was removed
  /usr/include/cyassl/openssl/rsa.h was removed
  /usr/include/cyassl/openssl/sha.h was removed
  /usr/include/cyassl/openssl/ssl23.h was removed
  /usr/include/cyassl/openssl/ssl.h was removed
  /usr/include/cyassl/openssl/stack.h was removed
  /usr/include/cyassl/openssl/ui.h was removed
  /usr/include/cyassl/openssl/x509.h was removed
  /usr/include/cyassl/openssl/x509v3.h was removed
  /usr/include/cyassl/options.h was removed
  /usr/include/cyassl/sniffer_error.h was removed
  /usr/include/cyassl/sniffer.h was removed
  /usr/include/cyassl/ssl.h was removed
  /usr/include/cyassl/test.h was removed
  /usr/include/cyassl/version.h was removed
packages/core2-64-poky-linux/wolfssl/wolfssl-dbg: PKGSIZE changed from 2116592 to 2225744 (+5%)
packages/core2-64-poky-linux/wolfssl/wolfssl-dbg: FILELIST: removed "/usr/lib/.debug/libwolfssl.so.35.3.0", added "/usr/lib/.debug/libwolfssl.so.41.0.0"
packages/core2-64-poky-linux/wolfssl/wolfssl-dbg: PKGV changed from 5.5.4 [default] to 5.6.4 [default]
packages/core2-64-poky-linux/wolfssl/wolfssl-dbg: PV changed from "5.5.4" to "5.6.4"
packages/core2-64-poky-linux/wolfssl/wolfssl-dev: PKGSIZE changed from 2327270 to 2164552 (-7%)
packages/core2-64-poky-linux/wolfssl/wolfssl-dev: FILELIST: removed "/usr/include/cyassl/sniffer.h /usr/include/cyassl/ctaocrypt/settings.h /usr/include/cyassl/version.h /usr/include/cyassl/ctaocrypt/integer.h /usr/include/cyassl/ctaocrypt/md4.h /usr/include/cyassl/ctaocrypt/fips_test.h /usr/include/cyassl/ctaocrypt/mpi_class.h /usr/include/cyassl/ocsp.h /usr/include/cyassl/test.h /usr/include/cyassl/ctaocrypt/pwdbased.h /usr/include/cyassl/ctaocrypt/dh.h /usr/include/cyassl/ctaocrypt/memory.h /usr/include/cyassl/sniffer_error.h /usr/include/cyassl/ctaocrypt/poly1305.h /usr/include/cyassl/ctaocrypt/settings_comp.h /usr/include/cyassl/callbacks.h /usr/include/cyassl/openssl/ecdsa.h /usr/include/cyassl/openssl/evp.h /usr/include/cyassl/openssl/md4.h /usr/include/cyassl/openssl/md5.h /usr/include/cyassl/openssl/pem.h /usr/include/cyassl/ctaocrypt/tfm.h /usr/include/cyassl/ctaocrypt/error-crypt.h /usr/include/cyassl/ctaocrypt/visibility.h /usr/include/cyassl/ctaocrypt/sha512.h /usr/inclu
 de/cyassl/ctaocrypt/camellia.h /usr/include/cyassl/ctaocrypt/blake2.h /usr/include/cyassl/openssl/ec.h /usr/include/cyassl/ctaocrypt/wc_port.h /usr/include/cyassl/openssl/crypto.h /usr/include/cyassl/openssl/opensslconf.h /usr/include/cyassl/openssl/ripemd.h /usr/include/cyassl/ctaocrypt/pkcs7.h /usr/include/cyassl/openssl/ui.h /usr/include/cyassl/ctaocrypt/chacha.h /usr/include/cyassl/error-ssl.h /usr/include/cyassl/openssl/pkcs12.h /usr/include/cyassl/ctaocrypt/ecc.h /usr/include/cyassl/openssl/lhash.h /usr/include/cyassl/ctaocrypt/random.h /usr/include/cyassl/ctaocrypt/asn.h /usr/include/cyassl/ctaocrypt/sha.h /usr/include/cyassl/ctaocrypt/dsa.h /usr/include/cyassl/ctaocrypt/types.h /usr/include/cyassl/ctaocrypt/rsa.h /usr/include/cyassl/openssl/opensslv.h /usr/include/cyassl/openssl/dh.h /usr/include/cyassl/openssl/ossl_typ.h /usr/include/cyassl/ctaocrypt/mpi_superclass.h /usr/include/cyassl/openssl/ec25519.h /usr/include/cyassl/certs_test.h /usr/include/cyassl/openssl/ed25519.h
  /usr/include/cyassl/ctaocrypt/des3.h /usr/include/cyassl/openssl/x509v3.h /usr/include/cyassl/openssl/engine.h /usr/include/cyassl/options.h /usr/include/cyassl/ctaocrypt/md5.h /usr/include/cyassl/openssl/bn.h /usr/include/cyassl/crl.h /usr/include/cyassl/ssl.h /usr/include/cyassl/ctaocrypt/logging.h /usr/include/cyassl/ctaocrypt/arc4.h /usr/include/cyassl/ctaocrypt/sha256.h /usr/include/cyassl/ctaocrypt/ripemd.h /usr/include/cyassl/openssl/stack.h /usr/include/cyassl/ctaocrypt/coding.h /usr/include/cyassl/ctaocrypt/aes.h /usr/include/cyassl/ctaocrypt/misc.h /usr/include/cyassl/openssl/ec448.h /usr/include/cyassl/openssl/ed448.h /usr/include/cyassl/openssl/ocsp.h /usr/include/cyassl/openssl/rand.h /usr/include/cyassl/openssl/asn1.h /usr/include/cyassl/openssl/conf.h /usr/include/cyassl/openssl/ecdh.h /usr/include/cyassl/openssl/hmac.h /usr/include/cyassl/openssl/x509.h /usr/include/cyassl/openssl/rsa.h /usr/include/cyassl/openssl/sha.h /usr/include/cyassl/openssl/ssl.h /usr/include
 /cyassl/openssl/bio.h /usr/include/cyassl/openssl/des.h /usr/include/cyassl/ctaocrypt/compress.h /usr/include/cyassl/openssl/dsa.h /usr/include/cyassl/openssl/err.h /usr/include/cyassl/ctaocrypt/md2.h /usr/include/cyassl/openssl/ssl23.h /usr/include/cyassl/ctaocrypt/asn_public.h /usr/include/cyassl/ctaocrypt/blake2-int.h /usr/include/cyassl/ctaocrypt/blake2-impl.h /usr/include/cyassl/ctaocrypt/hmac.h", added "/usr/include/wolfssl/wolfcrypt/sm4.h /usr/include/wolfssl/wolfcrypt/wc_lms.h /usr/include/wolfssl/wolfcrypt/wc_xmss.h /usr/include/wolfssl/wolfcrypt/ext_lms.h /usr/include/wolfssl/wolfcrypt/ext_xmss.h /usr/include/wolfssl/wolfcrypt/hpke.h /usr/include/wolfssl/wolfcrypt/xmss.h /usr/include/wolfssl/wolfcrypt/sm2.h /usr/include/wolfssl/wolfcrypt/sm3.h /usr/include/wolfssl/wolfcrypt/lms.h"
packages/core2-64-poky-linux/wolfssl/wolfssl-dev: PKGV changed from 5.5.4 [default] to 5.6.4 [default]
packages/core2-64-poky-linux/wolfssl/wolfssl-dev: PV changed from "5.5.4" to "5.6.4"
packages/core2-64-poky-linux/wolfssl/wolfssl-doc: PKGSIZE changed from 410724 to 437052 (+6%)
packages/core2-64-poky-linux/wolfssl/wolfssl-doc: FILELIST: added "/usr/share/doc/wolfssl/example/async_client.c /usr/share/doc/wolfssl/example/async_server.c"
packages/core2-64-poky-linux/wolfssl/wolfssl-doc: PKGV changed from 5.5.4 [default] to 5.6.4 [default]
packages/core2-64-poky-linux/wolfssl/wolfssl-doc: PV changed from "5.5.4" to "5.6.4"
packages/core2-64-poky-linux/wolfssl/wolfssl-locale: PKGV changed from 5.5.4 [default] to 5.6.4 [default]
packages/core2-64-poky-linux/wolfssl/wolfssl-locale: PV changed from "5.5.4" to "5.6.4"
packages/core2-64-poky-linux/wolfssl/wolfssl-src: PKGSIZE changed from 9209551 to 9288317 (+1%)
packages/core2-64-poky-linux/wolfssl/wolfssl-src: FILELIST: directory renamed /usr/src/debug/wolfssl/5.5.4-r0/wolfssl/wolfcrypt -> /usr/src/debug/wolfssl/5.6.4-r0/wolfssl/wolfcrypt, directory renamed /usr/src/debug/wolfssl/5.5.4-r0/wolfssl -> /usr/src/debug/wolfssl/5.6.4-r0/wolfssl, directory renamed /usr/src/debug/wolfssl/5.5.4-r0/wolfcrypt/src -> /usr/src/debug/wolfssl/5.6.4-r0/wolfcrypt/src, directory renamed /usr/src/debug/wolfssl/5.5.4-r0/wolfssl/openssl -> /usr/src/debug/wolfssl/5.6.4-r0/wolfssl/openssl, removed "/usr/src/debug/wolfssl/5.5.4-r0/src/tls13.c /usr/src/debug/wolfssl/5.5.4-r0/src/ssl.c /usr/src/debug/wolfssl/5.5.4-r0/src/tls.c /usr/src/debug/wolfssl/5.5.4-r0/src/keys.c /usr/src/debug/wolfssl/5.5.4-r0/src/x509.c /usr/src/debug/wolfssl/5.5.4-r0/src/wolfio.c /usr/src/debug/wolfssl/5.5.4-r0/src/pk.c /usr/src/debug/wolfssl/5.5.4-r0/src/internal.c", added "/usr/src/debug/wolfssl/5.6.4-r0/src/tls13.c /usr/src/debug/wolfssl/5.6.4-r0/src/tls.c /usr/src/debug/wolfssl/5.6.4-r0
 /src/ssl.c /usr/src/debug/wolfssl/5.6.4-r0/src/keys.c /usr/src/debug/wolfssl/5.6.4-r0/src/x509.c /usr/src/debug/wolfssl/5.6.4-r0/src/ssl_certman.c /usr/src/debug/wolfssl/5.6.4-r0/src/wolfio.c /usr/src/debug/wolfssl/5.6.4-r0/src/ssl_misc.c /usr/src/debug/wolfssl/5.6.4-r0/src/internal.c"
packages/core2-64-poky-linux/wolfssl/wolfssl-src: PKGV changed from 5.5.4 [default] to 5.6.4 [default]
packages/core2-64-poky-linux/wolfssl/wolfssl-src: PV changed from "5.5.4" to "5.6.4"
packages/core2-64-poky-linux/wolfssl/wolfssl-staticdev: PKGV changed from 5.5.4 [default] to 5.6.4 [default]
packages/core2-64-poky-linux/wolfssl/wolfssl-staticdev: PV changed from "5.5.4" to "5.6.4"
packages/core2-64-poky-linux/wolfssl/wolfssl: PKGSIZE changed from 567174 to 604102 (+7%)
packages/core2-64-poky-linux/wolfssl/wolfssl: FILELIST: removed "/usr/lib/libwolfssl.so.35.3.0 /usr/lib/libwolfssl.so.35", added "/usr/lib/libwolfssl.so.41 /usr/lib/libwolfssl.so.41.0.0"
packages/core2-64-poky-linux/wolfssl/wolfssl: PKGV changed from 5.5.4 [default] to 5.6.4 [default]
packages/core2-64-poky-linux/wolfssl/wolfssl: PV changed from "5.5.4" to "5.6.4"

--===============3015071553142890854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/wolfssl (sysroot):
  /usr/lib/libwolfssl.so changed symlink target from libwolfssl.so.35.3.0 to libwolfssl.so.41.0.0
  /usr/lib/libwolfssl.so.35.3.0 moved to /usr/lib/libwolfssl.so.41.0.0
  /usr/lib/libwolfssl.so.35 moved to /usr/lib/libwolfssl.so.41
  /usr/include/wolfssl/wolfcrypt/ext_lms.h was added
  /usr/include/wolfssl/wolfcrypt/ext_xmss.h was added
  /usr/include/wolfssl/wolfcrypt/hpke.h was added
  /usr/include/wolfssl/wolfcrypt/lms.h was added
  /usr/include/wolfssl/wolfcrypt/sm2.h was added
  /usr/include/wolfssl/wolfcrypt/sm3.h was added
  /usr/include/wolfssl/wolfcrypt/sm4.h was added
  /usr/include/wolfssl/wolfcrypt/wc_lms.h was added
  /usr/include/wolfssl/wolfcrypt/wc_xmss.h was added
  /usr/include/wolfssl/wolfcrypt/xmss.h was added
  /usr/include/cyassl was removed
  /usr/include/cyassl/callbacks.h was removed
  /usr/include/cyassl/certs_test.h was removed
  /usr/include/cyassl/crl.h was removed
  /usr/include/cyassl/ctaocrypt was removed
  /usr/include/cyassl/ctaocrypt/aes.h was removed
  /usr/include/cyassl/ctaocrypt/arc4.h was removed
  /usr/include/cyassl/ctaocrypt/asn.h was removed
  /usr/include/cyassl/ctaocrypt/asn_public.h was removed
  /usr/include/cyassl/ctaocrypt/blake2.h was removed
  /usr/include/cyassl/ctaocrypt/blake2-impl.h was removed
  /usr/include/cyassl/ctaocrypt/blake2-int.h was removed
  /usr/include/cyassl/ctaocrypt/camellia.h was removed
  /usr/include/cyassl/ctaocrypt/chacha.h was removed
  /usr/include/cyassl/ctaocrypt/coding.h was removed
  /usr/include/cyassl/ctaocrypt/compress.h was removed
  /usr/include/cyassl/ctaocrypt/des3.h was removed
  /usr/include/cyassl/ctaocrypt/dh.h was removed
  /usr/include/cyassl/ctaocrypt/dsa.h was removed
  /usr/include/cyassl/ctaocrypt/ecc.h was removed
  /usr/include/cyassl/ctaocrypt/error-crypt.h was removed
  /usr/include/cyassl/ctaocrypt/fips_test.h was removed
  /usr/include/cyassl/ctaocrypt/hmac.h was removed
  /usr/include/cyassl/ctaocrypt/integer.h was removed
  /usr/include/cyassl/ctaocrypt/logging.h was removed
  /usr/include/cyassl/ctaocrypt/md2.h was removed
  /usr/include/cyassl/ctaocrypt/md4.h was removed
  /usr/include/cyassl/ctaocrypt/md5.h was removed
  /usr/include/cyassl/ctaocrypt/memory.h was removed
  /usr/include/cyassl/ctaocrypt/misc.h was removed
  /usr/include/cyassl/ctaocrypt/mpi_class.h was removed
  /usr/include/cyassl/ctaocrypt/mpi_superclass.h was removed
  /usr/include/cyassl/ctaocrypt/pkcs7.h was removed
  /usr/include/cyassl/ctaocrypt/poly1305.h was removed
  /usr/include/cyassl/ctaocrypt/pwdbased.h was removed
  /usr/include/cyassl/ctaocrypt/random.h was removed
  /usr/include/cyassl/ctaocrypt/ripemd.h was removed
  /usr/include/cyassl/ctaocrypt/rsa.h was removed
  /usr/include/cyassl/ctaocrypt/settings_comp.h was removed
  /usr/include/cyassl/ctaocrypt/settings.h was removed
  /usr/include/cyassl/ctaocrypt/sha256.h was removed
  /usr/include/cyassl/ctaocrypt/sha512.h was removed
  /usr/include/cyassl/ctaocrypt/sha.h was removed
  /usr/include/cyassl/ctaocrypt/tfm.h was removed
  /usr/include/cyassl/ctaocrypt/types.h was removed
  /usr/include/cyassl/ctaocrypt/visibility.h was removed
  /usr/include/cyassl/ctaocrypt/wc_port.h was removed
  /usr/include/cyassl/error-ssl.h was removed
  /usr/include/cyassl/ocsp.h was removed
  /usr/include/cyassl/openssl was removed
  /usr/include/cyassl/openssl/asn1.h was removed
  /usr/include/cyassl/openssl/bio.h was removed
  /usr/include/cyassl/openssl/bn.h was removed
  /usr/include/cyassl/openssl/conf.h was removed
  /usr/include/cyassl/openssl/crypto.h was removed
  /usr/include/cyassl/openssl/des.h was removed
  /usr/include/cyassl/openssl/dh.h was removed
  /usr/include/cyassl/openssl/dsa.h was removed
  /usr/include/cyassl/openssl/ec25519.h was removed
  /usr/include/cyassl/openssl/ec448.h was removed
  /usr/include/cyassl/openssl/ecdh.h was removed
  /usr/include/cyassl/openssl/ecdsa.h was removed
  /usr/include/cyassl/openssl/ec.h was removed
  /usr/include/cyassl/openssl/ed25519.h was removed
  /usr/include/cyassl/openssl/ed448.h was removed
  /usr/include/cyassl/openssl/engine.h was removed
  /usr/include/cyassl/openssl/err.h was removed
  /usr/include/cyassl/openssl/evp.h was removed
  /usr/include/cyassl/openssl/hmac.h was removed
  /usr/include/cyassl/openssl/lhash.h was removed
  /usr/include/cyassl/openssl/md4.h was removed
  /usr/include/cyassl/openssl/md5.h was removed
  /usr/include/cyassl/openssl/ocsp.h was removed
  /usr/include/cyassl/openssl/opensslconf.h was removed
  /usr/include/cyassl/openssl/opensslv.h was removed
  /usr/include/cyassl/openssl/ossl_typ.h was removed
  /usr/include/cyassl/openssl/pem.h was removed
  /usr/include/cyassl/openssl/pkcs12.h was removed
  /usr/include/cyassl/openssl/rand.h was removed
  /usr/include/cyassl/openssl/ripemd.h was removed
  /usr/include/cyassl/openssl/rsa.h was removed
  /usr/include/cyassl/openssl/sha.h was removed
  /usr/include/cyassl/openssl/ssl23.h was removed
  /usr/include/cyassl/openssl/ssl.h was removed
  /usr/include/cyassl/openssl/stack.h was removed
  /usr/include/cyassl/openssl/ui.h was removed
  /usr/include/cyassl/openssl/x509.h was removed
  /usr/include/cyassl/openssl/x509v3.h was removed
  /usr/include/cyassl/options.h was removed
  /usr/include/cyassl/sniffer_error.h was removed
  /usr/include/cyassl/sniffer.h was removed
  /usr/include/cyassl/ssl.h was removed
  /usr/include/cyassl/test.h was removed
  /usr/include/cyassl/version.h was removed
packages/core2-64-poky-linux/wolfssl/wolfssl-dev: FILELIST: removed "/usr/include/cyassl/openssl/opensslconf.h /usr/include/cyassl/ctaocrypt/md5.h /usr/include/cyassl/ctaocrypt/ecc.h /usr/include/cyassl/ctaocrypt/memory.h /usr/include/cyassl/ctaocrypt/coding.h /usr/include/cyassl/ctaocrypt/aes.h /usr/include/cyassl/ctaocrypt/mpi_class.h /usr/include/cyassl/openssl/pkcs12.h /usr/include/cyassl/openssl/ssl23.h /usr/include/cyassl/ctaocrypt/sha512.h /usr/include/cyassl/sniffer_error.h /usr/include/cyassl/ctaocrypt/misc.h /usr/include/cyassl/ctaocrypt/fips_test.h /usr/include/cyassl/openssl/crypto.h /usr/include/cyassl/ctaocrypt/md2.h /usr/include/cyassl/openssl/ed448.h /usr/include/cyassl/openssl/ec448.h /usr/include/cyassl/openssl/ui.h /usr/include/cyassl/ctaocrypt/tfm.h /usr/include/cyassl/certs_test.h /usr/include/cyassl/ctaocrypt/blake2-impl.h /usr/include/cyassl/ctaocrypt/compress.h /usr/include/cyassl/ctaocrypt/poly1305.h /usr/include/cyassl/openssl/ecdsa.h /usr/include/cyassl/cta
 ocrypt/md4.h /usr/include/cyassl/ctaocrypt/ripemd.h /usr/include/cyassl/sniffer.h /usr/include/cyassl/ctaocrypt/types.h /usr/include/cyassl/ctaocrypt/random.h /usr/include/cyassl/ctaocrypt/integer.h /usr/include/cyassl/version.h /usr/include/cyassl/ctaocrypt/des3.h /usr/include/cyassl/ctaocrypt/pkcs7.h /usr/include/cyassl/openssl/ocsp.h /usr/include/cyassl/openssl/asn1.h /usr/include/cyassl/openssl/conf.h /usr/include/cyassl/openssl/ecdh.h /usr/include/cyassl/openssl/hmac.h /usr/include/cyassl/openssl/rand.h /usr/include/cyassl/openssl/x509.h /usr/include/cyassl/ctaocrypt/arc4.h /usr/include/cyassl/ctaocrypt/asn.h /usr/include/cyassl/ctaocrypt/blake2-int.h /usr/include/cyassl/ctaocrypt/pwdbased.h /usr/include/cyassl/ctaocrypt/camellia.h /usr/include/cyassl/openssl/stack.h /usr/include/cyassl/ctaocrypt/settings_comp.h /usr/include/cyassl/openssl/pem.h /usr/include/cyassl/openssl/des.h /usr/include/cyassl/openssl/dsa.h /usr/include/cyassl/openssl/err.h /usr/include/cyassl/openssl/evp.
 h /usr/include/cyassl/openssl/md4.h /usr/include/cyassl/openssl/bio.h /usr/include/cyassl/ctaocrypt/dh.h /usr/include/cyassl/openssl/md5.h /usr/include/cyassl/ctaocrypt/hmac.h /usr/include/cyassl/options.h /usr/include/cyassl/crl.h /usr/include/cyassl/ssl.h /usr/include/cyassl/ctaocrypt/visibility.h /usr/include/cyassl/ctaocrypt/blake2.h /usr/include/cyassl/openssl/engine.h /usr/include/cyassl/openssl/ed25519.h /usr/include/cyassl/ctaocrypt/sha256.h /usr/include/cyassl/ctaocrypt/settings.h /usr/include/cyassl/callbacks.h /usr/include/cyassl/ctaocrypt/logging.h /usr/include/cyassl/ctaocrypt/chacha.h /usr/include/cyassl/ctaocrypt/mpi_superclass.h /usr/include/cyassl/openssl/dh.h /usr/include/cyassl/openssl/opensslv.h /usr/include/cyassl/openssl/ossl_typ.h /usr/include/cyassl/openssl/lhash.h /usr/include/cyassl/ctaocrypt/wc_port.h /usr/include/cyassl/openssl/ec.h /usr/include/cyassl/ocsp.h /usr/include/cyassl/test.h /usr/include/cyassl/ctaocrypt/error-crypt.h /usr/include/cyassl/openss
 l/rsa.h /usr/include/cyassl/openssl/sha.h /usr/include/cyassl/openssl/ssl.h /usr/include/cyassl/error-ssl.h /usr/include/cyassl/openssl/bn.h /usr/include/cyassl/openssl/x509v3.h /usr/include/cyassl/openssl/ripemd.h /usr/include/cyassl/ctaocrypt/asn_public.h /usr/include/cyassl/ctaocrypt/dsa.h /usr/include/cyassl/ctaocrypt/rsa.h /usr/include/cyassl/ctaocrypt/sha.h /usr/include/cyassl/openssl/ec25519.h", added "/usr/include/wolfssl/wolfcrypt/ext_xmss.h /usr/include/wolfssl/wolfcrypt/xmss.h /usr/include/wolfssl/wolfcrypt/sm4.h /usr/include/wolfssl/wolfcrypt/hpke.h /usr/include/wolfssl/wolfcrypt/lms.h /usr/include/wolfssl/wolfcrypt/sm3.h /usr/include/wolfssl/wolfcrypt/ext_lms.h /usr/include/wolfssl/wolfcrypt/sm2.h /usr/include/wolfssl/wolfcrypt/wc_lms.h /usr/include/wolfssl/wolfcrypt/wc_xmss.h"
packages/core2-64-poky-linux/wolfssl/wolfssl-doc: FILELIST: added "/usr/share/doc/wolfssl/example/async_client.c /usr/share/doc/wolfssl/example/async_server.c"
packages/core2-64-poky-linux/wolfssl/wolfssl: FILELIST: removed "/usr/lib/libwolfssl.so.35.3.0 /usr/lib/libwolfssl.so.35", added "/usr/lib/libwolfssl.so.41.0.0 /usr/lib/libwolfssl.so.41"

--===============3015071553142890854==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wolfssl-upgrade-5.5.4-5.6.4.patch"

RnJvbSBlZDQ0OGE3MmI5OGFjNTQxM2QzMjQ1OTk3ZWNmNWI0ODVkY2M1Y2M3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzowNjoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdv
bGZzc2w6IHVwZ3JhZGUgNS41LjQgLT4gNS42LjQKCi0tLQogLi4uL3dvbGZzc2wve3dvbGZzc2xf
NS41LjQuYmIgPT4gd29sZnNzbF81LjYuNC5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1uZXR3
b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L3dvbGZzc2wve3dvbGZzc2xfNS41LjQuYmIgPT4g
d29sZnNzbF81LjYuNC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVj
aXBlcy1jb25uZWN0aXZpdHkvd29sZnNzbC93b2xmc3NsXzUuNS40LmJiIGIvbWV0YS1uZXR3b3Jr
aW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L3dvbGZzc2wvd29sZnNzbF81LjYuNC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0
aXZpdHkvd29sZnNzbC93b2xmc3NsXzUuNS40LmJiCnJlbmFtZSB0byBtZXRhLW5ldHdvcmtpbmcv
cmVjaXBlcy1jb25uZWN0aXZpdHkvd29sZnNzbC93b2xmc3NsXzUuNi40LmJiCmluZGV4IDlhYzg1
OWYzMC4uYTRmNDJlN2JmIDEwMDY0NAotLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvd29sZnNzbC93b2xmc3NsXzUuNS40LmJiCisrKyBiL21ldGEtbmV0d29ya2luZy9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS93b2xmc3NsL3dvbGZzc2xfNS42LjQuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgUFJPVklERVMgKz0gImN5YXNzbCIKIFJQUk9WSURFUzoke1BOfSA9ICJjeWFzc2wiCiAK
IFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS93b2xmU1NML3dvbGZzc2wuZ2l0O3Byb3RvY29s
PWh0dHBzO2JyYW5jaD1tYXN0ZXIiCi1TUkNSRVYgPSAiNGZiZDRmZDM2YTIxZWZkOWQxYTdlMTdh
YmEzOTBlOTFjNzg2OTNiMSIKK1NSQ1JFViA9ICIzNzg4NGY4NjRkNmZkOWIwNGY0NDY3N2NiMDRk
YTE1ZDBjOWQ2NTI2IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============3015071553142890854==--

