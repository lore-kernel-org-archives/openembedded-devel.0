Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.8179.1619068898512918072
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sqPirlaX;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id gq23-20020a17090b1057b0290151869af68bso325391pjb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Apr 2021 22:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FWtHysE8Q1jMytIyLIBrv7d3LSWNkjhoZtv3y/9dVls=;
        b=sqPirlaXwo7uQ7QY68dXB42eC5Bihe9u1kbAHMM3uYyNvjWyzMeZgH40tQKesD0kFK
         KwrqyeWVSBEE+uUJIVMXOHPnqpNPskIbH30qFNeRq1Q92utdnMh5b7K1QJdHuWRczp8F
         UED9pQJ5hZr0Ye3iktCC2sQpL6bcpYarSNG/bAdCapc2KLdfwHMwTLmUgpXZhyJ55OV8
         WyJEGF7kxjK8peyfL5TKvuRFAscaHTvTCJXYXF5kUu+eZKEMTuZhaSSITu49rrfCoQZF
         dTH/du87Edy9dMNnQRXv0QV9RejmN39uRBLRPjWMwVGOJty2wyXDxQSKJCVahFmIzNPv
         M72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FWtHysE8Q1jMytIyLIBrv7d3LSWNkjhoZtv3y/9dVls=;
        b=s2C7Xmm4r7ySQVFnMxOVnjjwa38pClHzGKZ3XjPWwGq/2nh8nueWza5jvP0kx/9VMQ
         4aL3MvUreM3yOX2hTykycZ1z1DEZ410kgSM5vlwVP7llYmHzzv9L9gtAeLrNn5vaDsog
         +3tqzsYF8wHc6+f7F0MAJSY02ekB1GfuuKRgl00soZkuhebz9ffTDTmeYSGPPHYvt/lr
         jD0KwVF8Yluw8FFlpvom60vURZpmI3PHNIDr5KuDErK9gKIQWTW4lV9iLWWHWzgMbPr/
         5J7gdLTjp0xR2i6oELtG8PaCuVgRYNuK7MLjUPPzrgiM1D/VovGGVrkg4es7On+rSKAm
         eH1Q==
X-Gm-Message-State: AOAM531sBdAO7mKZ8rGyOJBeX9/gBmgyIy6/rKTXRanMrE6GqpuJIMTh
	qX/5JbFxNIf851tDvIqGRHhRwNfRTPkEFg==
X-Google-Smtp-Source: ABdhPJwyVBMeJBYyQtPHWBzT1f2fStwG9LMHTjF1vV4UC4+pLMtPnT5TrGLlOtylKCa6+ZU2CrBH1w==
X-Received: by 2002:a17:902:760b:b029:e9:8bda:ae44 with SMTP id k11-20020a170902760bb02900e98bdaae44mr1606671pll.26.1619068897564;
        Wed, 21 Apr 2021 22:21:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id k4sm937680pgm.73.2021.04.21.22.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 22:21:37 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] beassl: Update to tip of master
Date: Wed, 21 Apr 2021 22:21:34 -0700
Message-Id: <20210422052134.3443355-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

changelog

* 79b1a99 Fixed comment.
* b2ec203 Fixed carry propagation bug in m64 impl for P-256.
* dda1f8a Harmonized behaviour when point length is invalid.
* acc70b1 Typo fix in comment.
* 946f5ba Added discard of unread appdata on explicit close.
* 252dba9 Fixed carry propagation bug in P-256 'm62' implementation (found by Auke Zeilstra; consequences unclear, possibly some invalid curve attacks in static ECDH contexts).
* 15b3af7 Typo fix in comment.
* 69807a3 Fixed typo in comment.
* fb4296c Fixed some errors in comments.
* 4b60464 Fixed small display bug in debug tool.
* b715b43 Fixed buffer overflow in private key decoding (wrong buffer length used in size check).
* 2893441 Fixed a spurious warning on some compilers.
* e4edfb8 Added support for getrandom()/getentropy(), and a fix for the RDRAND bug on AMD CPU (family 22).
* 924921d Fixed mishandling of UTF-8 codepoints in the FDF0..FEDF range (these were unduly rejected when extracting names from certificates, thereby preventing use of the extra presentation forms of Arabic).
* 9721b3e Fixed efficiency pre-test on RSA prime generation (no security issue, but RSA key generation with pubexp 5, 7 or 11 may be slightly more efficient).
* ecdf897 Normalize use of BR_DOXYGEN_IGNORE.
* c1bb535 Small workaround for CompCert compatibility.
* 87a796d Fixed computing of intermediate buffer size for maximum-size RSA keys.
* 6433cc2 Added detection for MIPS64 with n32 ABI.
* 001d094 Some small performance improvements on 32-bit architectures.
* 08eb078 Fixed fd leak in test code.
* d5acc4f Made m64 implementations of elliptic curves the default (when available).
* f0ddbc3 Added new 64-bit implementations of Curve25519 and P-256.
* b2a08e9 Made ec_c25519_m62 implementation the default on supported architectures.
* 52a69fe Fixed endianness in Curve25519 implementation (no consequence on security). Also added new Curve25519 code for 64-bit platforms.
* fd98320 Cosmetic fix (value did not conform to its announced bit length, but this did not have bad consequences since br_i31_decode_mod() is lenient on that).
* 431629d Changed speed benchmark for i31 to a 521-bit modulus.
* c6ffcd2 Fixed warning on GCC 4.6 to 4.9 (macro redefinition).
* 420f50c Added stand-alone RSA/PSS implementation.
* 966078b Added SHAKE implementation.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
index 1102bb95a5..c0556e7395 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -23,8 +23,9 @@ inherit lib_package
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fc37e1037ae673975fbcb96a98f7191"
 
-SRCREV = "8ef7680081c61b486622f2d983c0d3d21e83caad"
-SRC_URI = "git://www.bearssl.org/git/BearSSL;protocol=https;nobranch=1 \
+PV .= "+git${SRCPV}"
+SRCREV = "79b1a9996c094ff593ae50bc4edc1f349f39dd6d"
+SRC_URI = "git://www.bearssl.org/git/BearSSL;protocol=https \
 	   file://0001-conf-Unix.mk-remove-fixed-command-definitions.patch \
 	   file://0002-test-test_x509.c-fix-potential-overflow-issue.patch \
            file://0001-make-Pass-LDFLAGS-when-building-shared-objects.patch \
-- 
2.31.1

