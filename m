Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B455CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 09:25:58 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35272.1792056351539430564
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 02:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=VfJrUTng;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.48, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c329dc7e0f5so77210966b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792056349; x=1792661149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8pAHmkX2YV5OH+vc+K8i6uhoM6gqtA8z1G8qDx61NXw=;
        b=VfJrUTngqR23i24UltnmebB+AIaJl6VBy10+RQ74lvIAq3fzwWcVZktEqNLm54NhHF
         +xM0Vp3UAto/Sy/+b3+g4zoKG7QRHQSjR6BGyvH81JjE9heYE4CePZu0lli/2azUqBV2
         SWdoQiw92JTMMLe0QzHA+a3LKyZELyO/BKtsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792056349; x=1792661149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8pAHmkX2YV5OH+vc+K8i6uhoM6gqtA8z1G8qDx61NXw=;
        b=dcMr5z9DmtcY4laP8gyynh01FTy+hYx46Q3m77aUX2wEZyxrfHSwyetjBb2q8taoOE
         931EtY4AiVtrZ9FKT6Nxx+W4sQFYbPWq+ornHV7Z5Zs6gg+ftWwXmH/hNUc0h89eC/wB
         3BmAGe4jYv1lhowkWxDyuOxVtgmQJuPloCmv7Bz8vbAm2y25hiL2pCZTrVZUXY9ITd5y
         PsKDVqQMmnB9isDxj4HGHbnQR0fkARAgvK2P4F/9hgKvnhZ9BHikmVARQ9G4xGuJFsD2
         CjkVM5XIMS2Dl6qFjwwHS+gjaUw/1CHosuBKCTjGhl18DyGb4+xMiQjko130WUvj1tl0
         DVKg==
X-Gm-Message-State: AFq9FYKydJvfOoN0f41aS59hsJI8hTlfMKpSxUc2N15jJ7tO8Kl9Bk8N
	xBFqdaIS4HE4nRLGcswYMIRaS/jyH5aHVbVOHGte/fQTk6JDReVBMIHcCQZrrTAWgaEGMpkXYDY
	awvllGAw=
X-Gm-Gg: AYBFou3UFITTiaPxh33llgTBV8O6HFRONVwjHemXWeC3Yh00fO9UhAj2j+QCsSv7OpJ
	VdXSCW9CailgKMCmok7UyWP5nmhK5BQ4FrQei/eBvrYAqyiUL24MRsizpGcmfdbjng2Mp6KLMgR
	nO9mGbXU9ff4136OrzanD4T6bdSNN/f6WzQlMtYIs76mBFK5UfrucEshM6n9iAyLRiBCC1AYZ6T
	IUY8m6ln0+GjAAVf5wcy5gFCb0CavHGrWlsuf1WjUr2m68CxGlGdZsKVH+O6mWq2L/1R1Nal8/p
	Kz/gzb8r4/7fztBG008HNx8XTYSBIpMYt06bo7eYjvwWtB/737uI5xdHXaq/ldNBWikow26/bvU
	VUFGCAvvFs1Gk/lBGoGlQPi9GepuQCae6lxj4yfQm0GyLdn0DGo3PQShjdVQpR0tjLlMY7GgQeX
	T5KjF+0grPFcqDC4lpY9lZtIANiDPvostqZzJqDdgzOVxFx9TDt3kK79FKXboZx0SLUh1GhyGiz
	kzGeqrBk+4qJVrrw7qOznJF1ld3rku8yW2RdfPXgc/X7B0cbFi+R+amw9SihhqpFfL5E53xT66n
	kjMI73xnjlfNLf6Bh+XnX3wqlFFZmlu0PQjCoUdRr055+s9wYWrXyMZgroZBH3WDTSqbBMZYSUN
	pbtYo
X-Received: by 2002:a17:907:3cc4:b0:c25:2ded:ad36 with SMTP id a640c23a62f3a-c31a96e7a46mr1860863466b.0.1792056349418;
        Thu, 15 Oct 2026 02:25:49 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3af45sm100234266b.33.2026.10.15.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:25:48 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] libtoml11: remove package
Date: Thu, 15 Oct 2026 11:25:46 +0200
Message-ID: <20261015092546.1009251-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 09:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131004

The libtoml11 package is now included in openembedded-core.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 -
 ...move-more-whitespaces-after-operator.patch | 34 --------------
 .../0001-Remove-whitespace-in-operator.patch  | 46 -------------------
 .../libtoml11/files/run-ptest                 | 13 ------
 .../libtoml11/libtoml11_4.4.0.bb              | 39 ----------------
 5 files changed, 133 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch
 delete mode 100644 meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
 delete mode 100755 meta-oe/recipes-devtools/libtoml11/files/run-ptest
 delete mode 100644 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 46cf9254df..0e2df75d3f 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -42,7 +42,6 @@ PTESTS_FAST_META_OE = "\
     libssh \
     libteam \
     libtinyxml2 \
-    libtoml11 \
     libxml++-5.0 \
     libyang \
     lmdb \
diff --git a/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch b/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch
deleted file mode 100644
index 5bff81eaf6..0000000000
--- a/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6af7de3d5eaae59c53c42aab8eca1e1e9a365da5 Mon Sep 17 00:00:00 2001
-From: Steffen Winter <steffen.winter@proton.me>
-Date: Thu, 25 Dec 2025 20:48:02 +0100
-Subject: [PATCH] Remove more whitespaces after operator""
-
-Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/306]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- include/toml11/fwd/literal_fwd.hpp   | 4 ++--
- include/toml11/impl/literal_impl.hpp | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
---- a/include/toml11/fwd/literal_fwd.hpp
-+++ b/include/toml11/fwd/literal_fwd.hpp
-@@ -24,7 +24,7 @@ inline namespace toml_literals
- #if defined(TOML11_HAS_CHAR8_T)
- // value of u8"" literal has been changed from char to char8_t and char8_t is
- // NOT compatible to char
--::toml::value operator"" _toml(const char8_t* str, std::size_t len);
-+::toml::value operator""_toml(const char8_t* str, std::size_t len);
- #endif
- 
- } // toml_literals
---- a/include/toml11/impl/literal_impl.hpp
-+++ b/include/toml11/impl/literal_impl.hpp
-@@ -146,7 +146,7 @@ operator""_toml(const char* str, std::si
- // value of u8"" literal has been changed from char to char8_t and char8_t is
- // NOT compatible to char
- TOML11_INLINE ::toml::value
--operator"" _toml(const char8_t* str, std::size_t len)
-+operator""_toml(const char8_t* str, std::size_t len)
- {
-     if(len == 0)
-     {
diff --git a/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch b/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
deleted file mode 100644
index 9516ee5cb1..0000000000
--- a/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From dee78f822d8a5b985e565e5c1ef42a59557aa8fc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Mar 2025 11:35:46 -0800
-Subject: [PATCH] Remove whitespace in operator""
-
-Clang 20+ errors about this whitespace.
-
-Fixes
-include/toml11/impl/../fwd/literal_fwd.hpp:22:26: error: identifier '_toml' preceded by whitespace in a literal operator declaration is deprecated [-Werror,-Wdeprecated-literal-operator]
-|    22 | ::toml::value operator"" _toml(const char* str, std::size_t len);
-|       |               ~~~~~~~~~~~^~~~~
-|       |               operator""_toml
-
-Upstream-Status: Backport [https://github.com/ToruNiina/toml11/commit/dee78f822d8a5b985e565e5c1ef42a59557aa8fc]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/toml11/fwd/literal_fwd.hpp   | 2 +-
- include/toml11/impl/literal_impl.hpp | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/toml11/fwd/literal_fwd.hpp b/include/toml11/fwd/literal_fwd.hpp
-index e46612c..82f62b7 100644
---- a/include/toml11/fwd/literal_fwd.hpp
-+++ b/include/toml11/fwd/literal_fwd.hpp
-@@ -19,7 +19,7 @@ inline namespace literals
- inline namespace toml_literals
- {
- 
--::toml::value operator"" _toml(const char* str, std::size_t len);
-+::toml::value operator""_toml(const char* str, std::size_t len);
- 
- #if defined(TOML11_HAS_CHAR8_T)
- // value of u8"" literal has been changed from char to char8_t and char8_t is
-diff --git a/include/toml11/impl/literal_impl.hpp b/include/toml11/impl/literal_impl.hpp
-index e8298c2..067d4ed 100644
---- a/include/toml11/impl/literal_impl.hpp
-+++ b/include/toml11/impl/literal_impl.hpp
-@@ -115,7 +115,7 @@ inline namespace toml_literals
- {
- 
- TOML11_INLINE ::toml::value
--operator"" _toml(const char* str, std::size_t len)
-+operator""_toml(const char* str, std::size_t len)
- {
-     if(len == 0)
-     {
diff --git a/meta-oe/recipes-devtools/libtoml11/files/run-ptest b/meta-oe/recipes-devtools/libtoml11/files/run-ptest
deleted file mode 100755
index 4da9e68cc5..0000000000
--- a/meta-oe/recipes-devtools/libtoml11/files/run-ptest
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/usr/bin/env sh
-
-cd tests || exit 1
-
-rm -rf tests.log
-
-for atest in test_* ; do
-    if ./"${atest}" >> tests.log 2>&1; then
-        echo "PASS: ${atest}"
-    else
-        echo "FAIL: ${atest}"
-    fi
-done
diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
deleted file mode 100644
index 49f9840f06..0000000000
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "TOML for Modern C++"
-DESCRIPTION = "toml11 is a feature-rich TOML language library for \
-               C++11/14/17/20."
-
-HOMEPAGE = "https://github.com/ToruNiina/toml11"
-BUGTRACKER = "https://github.com/ToruNiina/toml11/issues"
-CVE_PRODUCT = "libtoml11"
-
-SECTION = "libs"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=44d1fcf70c7aa6991533c38daf7befa3"
-
-PE = "1"
-
-SRC_URI = "\
-    gitsm://github.com/ToruNiina/toml11.git;protocol=https;branch=main;tag=v${PV} \
-    file://0001-Remove-whitespace-in-operator.patch \
-    file://0001-Remove-more-whitespaces-after-operator.patch \
-    file://run-ptest \
-"
-SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
-
-inherit cmake ptest
-
-CXXFLAGS:append:toolchain-clang = " -Wno-error=c2y-extensions"
-
-EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
-                  -DTOML11_BUILD_TESTS=${@bb.utils.contains("PTEST_ENABLED", "1", "ON", "OFF", d)} \
-"
-
-ALLOW_EMPTY:${PN} = "1"
-
-do_install_ptest () {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.55.0


