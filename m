Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDECBC83F1B
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 17:39:09 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.1135.1752169140802704724
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 10:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HFj4NPl5;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-558f7fda97eso772336e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 10:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752169138; x=1752773938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkbZ1iddh0zLz5DLooGTAYxrMNch1xkIu/wBJWL5qSw=;
        b=HFj4NPl5e4UV/DXynTL0fcQu0XTYMec3JRqah/GDavlWdMfuQ2bPFkjmBN0Nyw5+ip
         twFWOl2110T5ra0eRMY4tNr7j4awuyxwIle41uIMu/XsgSjKUb+jyvdeUOXzfCHhQP8z
         N3nBe9k7RtGK9eTPzL5r+i3fjk5ejMkeWF3TMpqqcUUoLM0caz3FL1zqXdAVbk405WqL
         3A2SvVPo4QFMasmoVKHNTR1lYrrywcJpkxH0K4BHoqFbLxR05VxUmeWm+fiiobhcrTET
         eWV5zBVKWwJKkVoDBbZI71gx9cNC7ewvh6hpFVVEv067erTAUurEUjhd63MDx/a5ZfjS
         DaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169138; x=1752773938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkbZ1iddh0zLz5DLooGTAYxrMNch1xkIu/wBJWL5qSw=;
        b=asSkebDNxeagwTRMsqZChFhpTseEg5Tfhb9x+WBA8HTsLSuI52C8tUxSkCepP7HwBE
         Pi/RU6n6scfq9lHfzSrHgNOD88Q6CFgazFg1FuArXdtZlg5jng1gWLiN8m0Tnke/dg0g
         x8ikgq16dTgklvt5dy2Hf1kjyVejGWZvx1hG/0Ht0Smdb2MiKoqDvG3cZ1SIzM3qd/O4
         IqYNEo724zFZtVcKnOe3vCQJLR76foBHq3YGHKNfT99Nb6QJ061sLiZzS2GxE6IMiM2n
         oh7jsFIXL5pd0p4Esg8B8nO3qS4dL7Ie42Zh/QPlG+hoGoSHcie6WQ55wDNO0LbR/fJq
         NPfw==
X-Gm-Message-State: AOJu0YzXoc9DRtZlZfPueVlOCF9oTSzWhbwE/fbGWJqUN7UwJIc3FxEC
	vA1U7fHo/99nSXYs1jCtF28o5kCJdoSMKSspAsRzVLSFDYkrRuf3s/3+vOTlAg==
X-Gm-Gg: ASbGnctCR2HMJgYmr1pXYZVf9dhmQE1gl7RQb2c8O7DPTkYkuEke5cp8PQ7ukAn1+EE
	QSrf2eUCdjrDiRTU1lm6rwzs5gxQdmVV1+ytFVLobH/LXCTKFYcQ+TBC0bsCsigx2GI+9eGM5y5
	B3mkWtJmODdd8PkDni7Jg5qmgWNCd/CRVfvq7HWGZkiBD1It3Klfin5FVd8Ul7bQ/u33nq9zvIn
	6Aqr+UKv+S8DmFevBdsZBtPnucunfYe6n4YAO31jHckU2WAtywXtIpSQd6o8+3EW4HssdNiCHSz
	fkh7kf/+zpAe9dRmZZGNyyO9r5fqT/pQpk7Uyfv4cJoA2S7SA64O/Nv9weVs07OK9fUyZh6Qkim
	78pM=
X-Google-Smtp-Source: AGHT+IEThGcx+qZMnbFWx/szIr99FU4n4RkODC2/osXBdl9QNKq34/sfeOIoeqQAjo67yUcJD5cR4w==
X-Received: by 2002:a05:6512:1343:b0:553:3892:5ec6 with SMTP id 2adb3069b0e04-5592e3e1179mr1000953e87.35.1752169138182;
        Thu, 10 Jul 2025 10:38:58 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b8185csm431191e87.246.2025.07.10.10.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:38:57 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 4/5] sqlite-orm: Upgrade 1.5 -> 1.9.1 to allow CMake 4+ compatibility
Date: Thu, 10 Jul 2025 20:38:26 +0300
Message-ID: <20250710173827.43239-4-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710173827.43239-1-alperyasinak1@gmail.com>
References: <20250710173827.43239-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 17:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118419

- Dropped the patch as the issue is already fixed in the newer version.
- The LICENSE file has changed so updated LIC_FILES_CHKSUM to match the new md5sum.
- Updated CMake flag to disable tests according to the new version.

Changelog:

https://github.com/fnc12/sqlite_orm/compare/v1.5...v1.9.1
https://github.com/fnc12/sqlite_orm/releases

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...01-fix-cstdint-error-with-gcc-15.0.1.patch | 52 -------------------
 ...{sqlite-orm_1.5.bb => sqlite-orm_1.9.1.bb} |  7 ++-
 2 files changed, 3 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/sqlite-orm/sqlite-orm/0001-fix-cstdint-error-with-gcc-15.0.1.patch
 rename meta-oe/recipes-devtools/sqlite-orm/{sqlite-orm_1.5.bb => sqlite-orm_1.9.1.bb} (68%)

diff --git a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm/0001-fix-cstdint-error-with-gcc-15.0.1.patch b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm/0001-fix-cstdint-error-with-gcc-15.0.1.patch
deleted file mode 100644
index af884808f2..0000000000
--- a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm/0001-fix-cstdint-error-with-gcc-15.0.1.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From f011501e719e0042fc6ca29ac7b33e8a14562246 Mon Sep 17 00:00:00 2001
-From: "mark.yang" <mark.yang@lge.com>
-Date: Tue, 1 Apr 2025 19:45:01 +0900
-Subject: [PATCH] fix cstdint error with gcc-15.0.1
-
-* see more details:
-  http://errors.yoctoproject.org/Errors/Details/850148/
-    TOPDIR/tmp/work/core2-64-oe-linux/sqlite-orm/1.5/git/examples/synchronous.cpp:7:5: error: 'uint16_t' does not name a type
-        7 |     uint16_t src_port;
-        |     ^~~~~~~~
-    TOPDIR/tmp/work/core2-64-oe-linux/sqlite-orm/1.5/git/examples/synchronous.cpp:3:1: note: 'uint16_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
-        2 | #include <sqlite_orm/sqlite_orm.h>
-    +++ |+#include <cstdint>
-        3 | #include <string>
-
-While this was backported from 6a96d1cec4(Explicitly included <cstdint> in examples and unit tests),
-since it was a commit made in v1.9, only synchronous.cpp was modified as other files do not exist in the current version.
-
-Signed-off-by: mark.yang <mark.yang@lge.com>
-
-Upstream-Status: Backport [6a96d1c Explicitly included <cstdint> in examples and unit tests]
----
- examples/synchronous.cpp | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/examples/synchronous.cpp b/examples/synchronous.cpp
-index d10da13d..b103b48c 100644
---- a/examples/synchronous.cpp
-+++ b/examples/synchronous.cpp
-@@ -1,15 +1,16 @@
- 
- #include <sqlite_orm/sqlite_orm.h>
-+#include <cstdint>
- #include <string>
- 
- struct Query {
-     std::string src_ip;
--    uint16_t src_port;
--    uint16_t txn_id;
--    uint32_t tv_sec;
--    uint32_t tv_usec;
-+    std::uint16_t src_port;
-+    std::uint16_t txn_id;
-+    std::uint32_t tv_sec;
-+    std::uint32_t tv_usec;
-     std::string name;
--    uint16_t type;
-+    std::uint16_t type;
- };
- 
- int main(int, char **) {
-
diff --git a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.9.1.bb
similarity index 68%
rename from meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
rename to meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.9.1.bb
index ee203f83e2..a4da31ebc7 100644
--- a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
+++ b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.9.1.bb
@@ -1,19 +1,18 @@
 SUMMARY = "SQLite ORM light header only library for modern C++"
 HOMEPAGE = "https://github.com/fnc12/sqlite_orm"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b5bf5ee8bb16d8e19359efe11bdc3f2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ae09d45eac4aa08d013b5f2e01c67f6"
 
 inherit cmake
 
 DEPENDS += "sqlite3"
 
-SRCREV = "e8a9e9416f421303f4b8970caab26dadf8bae98b"
+SRCREV = "5f1a2ce84a3d72711b4f0a440fdaba977868ae67"
 SRC_URI = " \
     git://github.com/fnc12/sqlite_orm;protocol=https;branch=master \
-    file://0001-fix-cstdint-error-with-gcc-15.0.1.patch \
 "
 
-EXTRA_OECMAKE += "-DSqliteOrm_BuildTests=OFF -DLIB_INSTALL_DIR=${libdir} \
+EXTRA_OECMAKE += "-DBUILD_TESTING=OFF -DLIB_INSTALL_DIR=${libdir} \
                   -DCMAKE_INSTALL_DIR=${libdir}/cmake \
                   -DPKGCONFIG_INSTALL_DIR=${libdir}/pkgconfig"
 
-- 
2.43.0


