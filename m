Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.14371.1613593776420296161
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 12:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TlP+krzj;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id z9so2402467pjl.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 12:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=szSV9vDlzNZS5okyyV7E++5/2Vkhpk/dQrqZarSOueQ=;
        b=TlP+krzjQWPlhvaU2kOCaVAG8VMYF7spqQEOsCmRjdGwZp2zGGit1hJUa8UgMj5JvA
         7Og6WnTZRnRfkUPUrUwVudU4yO7YrURDkod61ji+Ry9Hz2se9ebgjyS4n+Vbg6krLieW
         Qdzc9ancbkvbTp6LyJkz9HzPV0IWqOq7uBg9QwfgbD/wH9VuKqtZZfaqgs7XkdmEficA
         Zzcoa3fTh8/WHyj+nQ7gRFfsH9cur5NQR3fUpRw1mCPZrGEiH7hnWd1koLP1B6s8V9hv
         7MUkKcmawQGnWOvwz2SgfCZ1Qle3yBg5Ay6nfGSDkctX+IThviph0eSsQY3QhxLayakC
         v9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=szSV9vDlzNZS5okyyV7E++5/2Vkhpk/dQrqZarSOueQ=;
        b=q2iyTaW6l62ILISZt/zE6MPF0/b0W+6wGlbguUYVrw3WIAGWtEn9acwePWIGHnuoVO
         O5PgWble+IVVpyQFYgjU+Xw8e9g5KSbAzjxf2r2VNW5CiL+TY6KbU+UfSW9NL53zoNto
         AesUcpX3NjDCbLkwcVmlhj0vcENeq00u/yHsPT4FUcWnL0SMLBGapl/LQlYHoxHSYXj0
         XuPdSKSoAqUfaQs7XQWYBLgYAiAtRTlU/a7Hh+y+80PXXLTqZEUOAAWCi9hVNzXgLHHn
         YtKFZnVDGs4NhGLhuyyHm3xGXHyULDviQmiTc2nSJwJAJ+fHKJ/ZJOSv80nLqGWQxx5a
         dn2A==
X-Gm-Message-State: AOAM530H+/qh66CfOEXA6CSkIKve1gnDTge+oz2Ve953hO+5P+RgLAwU
	XL6yf60DC3uxitPI/SkRUzrCeTPDd1c=
X-Google-Smtp-Source: ABdhPJxRT5gATpbcUF7UYFKYiVR7GReRRfVXX4s9sqm9U+KtksJHSvcQM1eWNIjgcs4cwNHaGcoVGA==
X-Received: by 2002:a17:902:e812:b029:e3:9877:7c38 with SMTP id u18-20020a170902e812b02900e398777c38mr779096plg.49.1613593775318;
        Wed, 17 Feb 2021 12:29:35 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id x4sm3156035pfm.64.2021.02.17.12.29.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 12:29:34 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] softhsm: update to 2.6.1 and align
Date: Wed, 17 Feb 2021 20:29:33 +0000
Message-Id: <20210217202933.2291762-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

meta-security has this pkg to but newer. Move from meta-sec to meta-oe
minor cleanups.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-security/softhsm/softhsm_2.6.1.bb | 30 +++++++++++++++++++
 .../recipes-security/softhsm/softhsm_git.bb   | 18 -----------
 2 files changed, 30 insertions(+), 18 deletions(-)
 create mode 100644 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
 delete mode 100644 meta-oe/recipes-security/softhsm/softhsm_git.bb

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
new file mode 100644
index 000000000..aa91ab37f
--- /dev/null
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -0,0 +1,30 @@
+SUMMARY = "PKCS#11 HSM/Token Emulator"
+HOMEPAGE = "https://www.opendnssec.org/softhsm/"
+LICENSE = "BSD-2-Clause & ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
+
+DEPENDS = "sqlite3"
+
+SRC_URI = "https://dist.opendnssec.org/source/softhsm-2.6.1.tar.gz"
+SRC_URI[sha256sum] = "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2"
+
+inherit autotools pkgconfig siteinfo
+
+EXTRA_OECONF += " --with-sqlite3=${STAGING_DIR_HOST}/usr"
+EXTRA_OECONF += "${@oe.utils.conditional('SITEINFO_BITS', '64', ' --enable-64bit', '', d)}"
+
+PACKAGECONFIG ?= "ecc eddsa pk11 openssl"
+
+PACKAGECONFIG[npm] = ",--disable-non-paged-memory"
+PACKAGECONFIG[ecc] = "--enable-ecc,--disable-ecc"
+PACKAGECONFIG[gost] = "--enable-gost,--disable-gost"
+PACKAGECONFIG[eddsa] = "--enable-eddsa, --disable-eddsa"
+PACKAGECONFIG[fips] = "--enable-fips, --disable-fips"
+PACKAGECONFIG[notvisable] = "--disable-visibility"
+PACKAGECONFIG[openssl] = "--with-openssl=${STAGING_DIR_HOST}/usr --with-crypto-backend=openssl, --without-openssl, openssl, openssl"
+PACKAGECONFIG[botan] = "--with-botan=${STAGING_DIR_HOST}/usr --with-crypto-backend=botan, --without-botan, botan"
+PACKAGECONFIG[migrate] = "--with-migrate"
+PACKAGECONFIG[pk11] = "--enable-p11-kit --with-p11-kit==${STAGING_DIR_HOST}/usr, --without-p11-kit, p11-kit, p11-kit"
+
+RDEPENDS_${PN} = "sqlite3"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-security/softhsm/softhsm_git.bb b/meta-oe/recipes-security/softhsm/softhsm_git.bb
deleted file mode 100644
index 3236cb9a6..000000000
--- a/meta-oe/recipes-security/softhsm/softhsm_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "PKCS#11 HSM/Token Emulator"
-HOMEPAGE = "https://www.opendnssec.org/softhsm/"
-LICENSE = "BSD-2-Clause & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
-DEPENDS = "openssl"
-PV = "2.5.0"
-
-SRC_URI = "git://github.com/opendnssec/SoftHSMv2.git;branch=master"
-SRCREV = "369df0383d101bc8952692c2a368ac8bc887d1b4"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-# EdDSA requires OpenSSL >= 1.1.1
-EXTRA_OECONF = "--enable-eddsa --disable-gost"
-
-BBCLASSEXTEND = "native"
-- 
2.25.1

