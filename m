Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3113C3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 12:30:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.5560.1703334622971617826
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Dec 2023 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LYRh4ErK;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33677fb38a3so2581182f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 04:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703334620; x=1703939420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J+rDw2ucX1zjVtjv4raXewyCY3DiIuwomhFfOgHd1j8=;
        b=LYRh4ErKIRKdawsrtGectGg52Jyyg5wH/laQwHKNSTINy0jcDTMTo1F0eJp0dPvXYv
         Dg+SPVuCdg45E8hvdDXwkAT7TC0mGOacd1sqF98GFVc+K9ONt0WMUe61MSxxb4VegFXj
         WvgtGgezWNwr0CggTyJ32B47lXtNd34b7+TdUIUALIxWoMIzP7wpBA3vpiJdOezEcu8j
         wrqSkakKkTl/XJxbgqnxUPhNZzjTA23Sa6H28Dh8UnwYcm4uLk7bwsKe5mF+nhyFhuTe
         qvKhk+DmdZQWibX2iFyB5zFCYsxwK+wAdABCn2VkQ89BcA/sZSXDMPBufBi4y8nnL+MR
         AsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703334620; x=1703939420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+rDw2ucX1zjVtjv4raXewyCY3DiIuwomhFfOgHd1j8=;
        b=KpFuiMAWmxEJiyKkdVReRKHuo9SRGpfkVPSR6cum/xh4Uc97tKIU/JOSYa4h1GrtTh
         ii4KLiO/0DJRiHIkcldu1ReDmuDRmb+zglHCuEPolNDEcsQmX6AdEzJbexjvIWVeIIMU
         GtFpnckCkD71KnnJNQOPJedWQWX2WbQ6f80/41ZKW0JrE2dhZtWHw/fN3qT1XPa1Gc9H
         2Dnv86NyMR2s6XljeZv//OlSd1pWwvXjMGjKGhYG567iu7gx0Fq02GOGYvwp4Mh8b8cB
         PCtYG3nhM2qcSENtv9kviRRJ5RoLgh1TIYPWxZ01pVhkxxADEJ/QVXoo1lshx0YFWAP8
         xvyw==
X-Gm-Message-State: AOJu0Yw0hS83aOIWdhNJwGdjXXNSiXLBVoNb4JTK6nlYNQ085EZuUVC0
	pv3LX4XfRh0eZJESQo1Gug1xFAM1CiE=
X-Google-Smtp-Source: AGHT+IFjVkD/cXYCw+sdBF37KsQ6HajWu7SHBOwP6GVHm1Dn7CauuYxLUU2r0FQvKaMQ/3uJI4IrlA==
X-Received: by 2002:adf:a35a:0:b0:336:780f:6d50 with SMTP id d26-20020adfa35a000000b00336780f6d50mr1672505wrb.85.1703334620314;
        Sat, 23 Dec 2023 04:30:20 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:d9e2:102b:56b1:9620])
        by smtp.gmail.com with ESMTPSA id r10-20020adfce8a000000b00336781490dcsm6408327wrn.69.2023.12.23.04.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 04:30:19 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] bearssl: Upgrade to latest
Date: Sat, 23 Dec 2023 12:30:17 +0000
Message-Id: <20231223123017.20128-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 12:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107772

Install headers so that dependencies can use this to build against. Make
`brssl` executable, fixup library soname.

Changes:

Thomas Pornin (4):
      Added generic API for date range validation (with callbacks).
      Fixed RSA PSS verificatiobn bug (when hash_len != salt_len).
      Added macro that indicates presence of the time callback feature. Also added C++ compatibility.
      Fixed spurious warning about old-style prototype.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-connectivity/bearssl/bearssl_0.6.bb  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
index 777ba2270bc1..133bc669e373 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -24,24 +24,28 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fc37e1037ae673975fbcb96a98f7191"
 
 PV .= "+git${SRCPV}"
-SRCREV = "79b1a9996c094ff593ae50bc4edc1f349f39dd6d"
+SRCREV = "79c060eea3eea1257797f15ea1608a9a9923aa6f"
 SRC_URI = "git://www.bearssl.org/git/BearSSL;protocol=https;branch=master \
 	   file://0001-conf-Unix.mk-remove-fixed-command-definitions.patch \
 	   file://0002-test-test_x509.c-fix-potential-overflow-issue.patch \
            file://0001-make-Pass-LDFLAGS-when-building-shared-objects.patch \
 	   "
 
+SONAME = "libbearssl.so.6"
 # without compile errors like 
 # <..>/ld: build/obj/ghash_pclmul.o: warning: relocation against `br_ghash_pclmul' in read-only section `.text'
 CFLAGS += "-fPIC"
 
+EXTRA_OEMAKE += 'BEARSSLDLL=build/${SONAME} LDDLLFLAGS="-shared -Wl,-soname,${SONAME}"'
+
 S = "${WORKDIR}/git"
 B = "${S}"
 
 do_install() {
-    mkdir -p ${D}/${bindir} ${D}/${libdir}
-    install -m 0644 ${B}/build/brssl ${D}/${bindir}
-    install -m 0644 ${B}/build/libbearssl.so ${D}/${libdir}/libbearssl.so.6.0.0
-    ln -s libbearssl.so.6.0.0 ${D}/${libdir}/libbearssl.so.6
-    ln -s libbearssl.so.6.0.0 ${D}/${libdir}/libbearssl.so
+	install -d ${D}/${bindir} ${D}/${libdir} ${D}/${includedir}
+	install -m 0755 ${B}/build/brssl ${D}/${bindir}
+	oe_libinstall -C ${B}/build libbearssl ${D}/${libdir}
+	for inc in ${S}/inc/*.h; do
+		install -m 0644 "${inc}" ${D}/${includedir}
+	done
 }
-- 
2.39.0


