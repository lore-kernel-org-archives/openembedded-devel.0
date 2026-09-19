Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F803C982CC
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 22:20:52 +0000 (UTC)
Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20622.1789856451007033430
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Sep 2026 15:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=orFspWxJ;
 spf=pass (domain: gmail.com, ip: 74.125.227.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398a147688bso1947960a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 15:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856450; x=1790461250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRrmX7ogNKDSX0XAsLDNqJHulk2miDkb8DIXXv4sOxM=;
        b=orFspWxJv9p5vQPDUIX7zxWeCL7nvxA3KWLqXcJpyspgMbuMIlfRHf4ySfOaY23hHM
         r9NCtXsJSOSHdr9nwc2NzVcez3Gtw73Z7Uvb7DH/fTRbW8Dxvxu+i2nYv6ZuAfSLislR
         4gKWuUg58KrkQXYBBNSQstyG7UOYzAFNYzvh31Ou07K19tr6UBg1I1s2/BzCwT/vTuDx
         4r91PQew77b+KTlLFRFH5ePW4VUdKw3CdICTNQzT7xJfv4UMputOkGG2Cg7wMlqNuAFg
         vmHCsvE4Se+dok3Tyap9FLpGejgbGPZlrM2SqT1HcuFFhKregGun8kuxd2n0J4BbQKoD
         Hb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856450; x=1790461250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRrmX7ogNKDSX0XAsLDNqJHulk2miDkb8DIXXv4sOxM=;
        b=183bSV7Z+kasefkVlBr09EaSzR4i+K9NdjST25PofXpkCKc5BSMhe/mUzLtACGS++f
         fD6rbVczH92/VAPl3ZsK34/78rPIgkcSP9npXvsGt1LcaOJz1bFm2x+EhUjCq74JZA2/
         iM/P1QoAFHJm3WPE2m0+4tu7JkJxfezRruJw0O3OMtMy6PBuo5Bt096L+FNNYAkIs8In
         PftwZLjPis6Gy6v8QnO36EsgrQyOoe8alIFiFd+11zfwebiMs9dxEJa1zSLmJcqnhvJ4
         Hw4maIL5dzZwS5yzu2PHIW2X+YOYsqBaJCui9jjMLMZP59TsmGneDLsIyZu8cBSAdAZ+
         guiQ==
X-Gm-Message-State: AFuF++krD4xjrgPNrDaXCodfm3mMRwnbpTyKj7iQvNut+JK0fMw5Wk/0
	vWiH4BmsXEzLOHAKiA9EcW7YMNdpoXZfGrjoU9ZX2zNnnz3Jgg/yB/XJj1VOWA==
X-Gm-Gg: AYBFou3nK6su8gIRrJZt0lh0cZq2jqD6OjBKdiJuQ52cD0IBaS/OJtzu8TxWmVfNZOX
	pPnNjnhtD7zzmDrguUaDtAYIk8os9vnGCrY2nGMYqAZ1uTgL7c4ll+SNFW6UQqbOknxELKBzc51
	ki3amd4Yz2fxQXjriGnmZw54k4UFEEtjzAXZlAEGVn4PHUAVf7ndQXYLE10d2yuaWOVFOhl3aJn
	pxzNoGZRkjF9qUrXBBg0qVkyQMxD9wRmqWAIgvs0NhZLWMs94gT0Da1KGRvOErtq/+oaUkAvLcU
	NQLmnSg0GZHOMl4884a9CpA+TFgBuK/e0b6U2o7HPpaSxlXfD4Y46ur7qpIArvGyETDAzNwzyyn
	bmmf+FR2a5mBfexSYOH3UKNRKUnUj66skPntz1J9ErVPeW6CxFnO5SO7wdoqQg4Gms64WvaA9tM
	URmn40Nd3T1p0UXhsuxEs8ongfiISPdlPrbD/LThJOzkMEgieE5FmLS+5GbXUVHvMcou3zI/YHD
	U7XGwmJ5LnrBdXRynQ4eK0iuRNghBpUnXvrrXc1qqz0nsoC6Qgnb/tEaDCF6BeKH0mvNYVH/iLU
	j8K7PvmLUNIKGYo5K3tHxTAStlT6yRYlxaPQxBLo3qqeDejm5TuZWV8dBw7JxeGeHn7awIasiA/
	7MPFy02EQVhTCQy2tyfEZ6zBMeB+xxO6EfAGpbdwmQHvMkt9VL0cr0RYe+SxlblE3XA8=
X-Received: by 2002:a17:90b:58c5:b0:39e:6c69:9b97 with SMTP id 98e67ed59e1d1-39e6c69b286mr4937315a91.60.1789856450320;
        Sat, 19 Sep 2026 15:20:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm10494651eec.30.2026.09.19.15.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:20:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 1/7] libcrypt-openssl-bignum-perl: add recipe
Date: Sat, 19 Sep 2026 15:20:38 -0700
Message-ID: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 22:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130118

Crypt::OpenSSL::Bignum provides access to OpenSSL's multiprecision
integer arithmetic. Crypt::OpenSSL::RSA 0.41 loads it unconditionally
("use Crypt::OpenSSL::Bignum" in RSA.pm), so RSA cannot be used at all
without it.

The module has no t/ directory (only a top-level test.pl), so no ptest.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libcrypt-openssl-bignum-perl_0.09.bb      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libcrypt/libcrypt-openssl-bignum-perl_0.09.bb

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-bignum-perl_0.09.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-bignum-perl_0.09.bb
new file mode 100644
index 0000000000..ad7b5dc261
--- /dev/null
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-bignum-perl_0.09.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Crypt::OpenSSL::Bignum - OpenSSL's multiprecision integer arithmetic"
+DESCRIPTION = "Crypt::OpenSSL::Bignum provides access to OpenSSL multiprecision \
+integer arithmetic libraries. It is used by other OpenSSL modules, such as \
+Crypt::OpenSSL::RSA, to provide bignum values like key parameters."
+HOMEPAGE = "https://metacpan.org/dist/Crypt-OpenSSL-Bignum"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/K/KM/KMX/Crypt-OpenSSL-Bignum-${PV}.tar.gz"
+SRC_URI[sha256sum] = "234e72fb8396d45527e6fd45e43759c5c3f3a208cf8f29e6a22161a996fd42dc"
+
+S = "${UNPACKDIR}/Crypt-OpenSSL-Bignum-${PV}"
+
+DEPENDS += "openssl"
+
+EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -L${STAGING_BASELIBDIR} -lcrypto'"
+
+inherit cpan
+
+RDEPENDS:${PN} += "\
+    perl-module-carp \
+    perl-module-dynaloader \
+"
+
+BBCLASSEXTEND = "native"

