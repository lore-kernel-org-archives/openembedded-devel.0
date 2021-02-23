Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.1023.1614107257806552299
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 11:07:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rlK2+H7t;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id e9so2625121pjj.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Feb 2021 11:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0VhYfVh3hQVd60zV4f10IIXBse1Xqx3y8wJ4C3+hzYU=;
        b=rlK2+H7ttYPiU+g0bJgE4d3lao/0VKWMFrhzW1+WqVm9BuFone2/iD2qOXVPVj2MTE
         cxxpezO8krh0bKgrBx8zXF3WNstQ7fMV9hKnz/61wPM7Q1AjO31ZD7idanuGAflMSSQt
         zoLDG0T1dbjAJQ9YbNUaV8g7z0d1QB6kPBHNzt3WULFZZvDLzyizbQczH78dgQTwMBBk
         QR6dUdccNfLSPsPrxHTgABnZQWDfaRbCX1xa++5DeYZPIUK6gNi3R1OzUbXCpEwCpwHL
         DfEU+phTw6L1Db6FLz2w/AYXHIUs/baeW6hgs7iWibFy25AQIg4H7bVNy5Rh435uDqAr
         xmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0VhYfVh3hQVd60zV4f10IIXBse1Xqx3y8wJ4C3+hzYU=;
        b=h6dVL5kAIc/quh6t4kSgI5FCpsm0TiJJPK8yX+JhrFvStjnZeLKKKvz7zioXx1dv9U
         lwIclRaLGRe2VNHA3spGcdq9KNsL9k8y+w/b0baXwP8FwUwfDYmOpiA94kADpg8/wqPz
         nhRS02X2A1HqVuE6YKBugBUFfARfnzciwd5pGKVApcjHLrtp+OLhznj/iOTbgF+wKwhZ
         IG0wEhWtoVsp+JCckhqjv1OJjbMWDNDMp4EEcjqFoxuJDkQIrhZG5nKYTme+JFOX/rV8
         kz7W0a+SAJBiam1nWTAtTo4axNbEMYYdpp1Mnj7ft++sDfsRELioHiStP79HcI4aE+Ld
         Jekg==
X-Gm-Message-State: AOAM5326sKIPbQoJqxOm6e2X3uJM963IP9PO7gjGuFJgvnnNuJx5wsmj
	EsCHQgUurhGd6++1aLRHn54VxVXcIHSLBg==
X-Google-Smtp-Source: ABdhPJyh0FV1xtu+CaLLeGju61jI4R9JeSZHv4UrM1aQelfcps4xuNdXfKRMZbV1QKWQcBFtI6FXew==
X-Received: by 2002:a17:902:ea84:b029:e3:bde8:4734 with SMTP id x4-20020a170902ea84b02900e3bde84734mr3830959plb.85.1614107257034;
        Tue, 23 Feb 2021 11:07:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id s16sm13266922pfs.39.2021.02.23.11.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 11:07:36 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nss: Add powerpc64 little endian support
Date: Tue, 23 Feb 2021 11:07:34 -0800
Message-Id: <20210223190734.211031-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix build with clang/ppc64le while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.60.1.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.60.1.bb b/meta-oe/recipes-support/nss/nss_3.60.1.bb
index dc147efea4..25a2bc2513 100644
--- a/meta-oe/recipes-support/nss/nss_3.60.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.60.1.bb
@@ -52,6 +52,14 @@ do_configure_prepend_libc-musl () {
     sed -i -e '/-DHAVE_SYS_CDEFS_H/d' ${S}/nss/lib/dbm/config/config.mk
 }
 
+do_configure_prepend_powerpc64le_toolchain-clang () {
+    sed -i -e 's/\-std=c99/\-std=gnu99/g' ${S}/nss/coreconf/command.mk
+}
+
+do_configure_prepend_powerpc64_toolchain-clang () {
+    sed -i -e 's/\-std=c99/\-std=gnu99/g' ${S}/nss/coreconf/command.mk
+}
+
 do_compile_prepend_class-native() {
     export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}/nspr
     export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
@@ -93,7 +101,7 @@ do_compile() {
 
     if [ "${TARGET_ARCH}" = "powerpc" ]; then
         OS_TEST=ppc
-    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
+    elif [ "${TARGET_ARCH}" = "powerpc64" -o "${TARGET_ARCH}" = "powerpc64le" ]; then
         OS_TEST=ppc64
     elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
         OS_TEST=mips
@@ -151,7 +159,7 @@ do_install() {
 
     if [ "${TARGET_ARCH}" = "powerpc" ]; then
         OS_TEST=ppc
-    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
+    elif [ "${TARGET_ARCH}" = "powerpc64" -o "${TARGET_ARCH}" = "powerpc64le" ]; then
         OS_TEST=ppc64
     elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
         OS_TEST=mips
-- 
2.30.1

