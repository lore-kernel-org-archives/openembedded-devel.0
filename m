Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.1658.1597283636251546450
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 18:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oZ/9jxE7;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id o13so2031194pgf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 18:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ocqZXzQVnfX54IRJU80oFp1zZ/OwW9M/9CN6GnqlhiI=;
        b=oZ/9jxE73v8dl4ZqyRGmJnYcoFpprAlphOzehP+1+KO5Vub5A9vUzC1mHSUaqMIB+S
         /g2P09KL5v0Vur1wkrzIFqB2ZBrfYgMGF1ohb5hh2kptkb08NtIOwa8rDlY5eCMswiRb
         f/13L+LgXUx23vHUxzTuCceEXc7x5pjoHpsUfx+eoZXsjMEddcfi6QEru4K61FJltt96
         WIbVOhMuAMj7Aeb0PqSJMYGTZ0y9fkfFYNQVHTIctDSENtfUPqH9SGtHEKTSq7/YSnf0
         6CeE9bZpmRh1GgMO5e4kUcb/bPrgAJ0YOyl1DRd33Cl0gTEzBdyKf41zsu+UO9jH8bE6
         SY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ocqZXzQVnfX54IRJU80oFp1zZ/OwW9M/9CN6GnqlhiI=;
        b=nYJdp5VT4qbEYzyX/+ogsVP87/ZAPj2cMhJwF7mOUUaQ1SQUtx9+62UytUD7rHOa9S
         4jqml4YCXhryMxlGpToKYRAwrwyVjgytscYe/C01FZBdu6xiiuDUydT6zcrV8r2YvygR
         v9IVjQYEn7g4hanCgmgnCAb4NVx3JUq9WMJVu3WjHl0KciSWogRuNIjP/tiEKPOQDdRJ
         vC9rlyWkmIEJNQtqbmV6eM4w7UAT3Bw/5xs83fK9f/Hlb38PtalSreevdGQqp2dJ4YI0
         bzCEVLoJqNQ91FSm/TmT2Of1fwol+/5kUODjypNYaohlEg9kq1EGcTmyd26ScbFgZCdW
         5UCQ==
X-Gm-Message-State: AOAM530C3fRVzZN+DWcoVp5Xc5A56vy6RAK/7hJslg6jXVG6HQnkbB9R
	VRenqhj4zd7NYw485ms7y6OV+hrwkJg=
X-Google-Smtp-Source: ABdhPJzFbsdOfFPq8IQB4N0Zn1TlJQBtd1quRHYeZQIpQzVcsuy1cyavjKSpKwUwnz8Bqa8G+HNBOg==
X-Received: by 2002:a63:f752:: with SMTP id f18mr1655857pgk.94.1597283635037;
        Wed, 12 Aug 2020 18:53:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id o4sm3453578pjs.51.2020.08.12.18.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 18:53:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/4] openal-soft: Update to 1.20.1
Date: Wed, 12 Aug 2020 18:53:49 -0700
Message-Id: <20200813015352.2318764-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Forward port patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Use-BUILD_CC-to-compile-native-tools.patch | 30 +++++++++----------
 ...akehrtf-Disable-Wstringop-truncation.patch | 12 ++++----
 ...l-soft_1.19.1.bb => openal-soft_1.20.1.bb} |  3 +-
 3 files changed, 20 insertions(+), 25 deletions(-)
 rename meta-multimedia/recipes-multimedia/openal/{openal-soft_1.19.1.bb => openal-soft_1.20.1.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Use-BUILD_CC-to-compile-native-tools.patch b/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Use-BUILD_CC-to-compile-native-tools.patch
index 16f123fad8..2bffd65c6e 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Use-BUILD_CC-to-compile-native-tools.patch
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Use-BUILD_CC-to-compile-native-tools.patch
@@ -13,21 +13,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  CMakeLists.txt | 5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 39b80250..d6bdf8ed 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -1288,11 +1288,10 @@ FILE(MAKE_DIRECTORY "${NATIVE_BIN_DIR}")
- SET(BIN2H_COMMAND  "${NATIVE_BIN_DIR}bin2h")
- SET(BSINCGEN_COMMAND  "${NATIVE_BIN_DIR}bsincgen")
- ADD_CUSTOM_COMMAND(OUTPUT "${BIN2H_COMMAND}" "${BSINCGEN_COMMAND}"
--    COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" "${NATIVE_SRC_DIR}"
-     COMMAND ${CMAKE_COMMAND} -E remove "${BIN2H_COMMAND}" "${BSINCGEN_COMMAND}"
--    COMMAND ${CMAKE_COMMAND} --build . --config "Release"
-+    COMMAND gcc "${NATIVE_SRC_DIR}bin2h.c" -o "${BIN2H_COMMAND}" -lm
-+    COMMAND gcc "${NATIVE_SRC_DIR}bsincgen.c" -o "${BSINCGEN_COMMAND}" -lm
-     WORKING_DIRECTORY "${NATIVE_BIN_DIR}"
--    DEPENDS "${NATIVE_SRC_DIR}CMakeLists.txt"
-     IMPLICIT_DEPENDS C "${NATIVE_SRC_DIR}bin2h.c"
-                      C "${NATIVE_SRC_DIR}bsincgen.c"
-     VERBATIM
+@@ -1085,11 +1085,10 @@ ELSE()
+     SET(BIN2H_COMMAND  "${NATIVE_BIN_DIR}/bin2h")
+     SET(BSINCGEN_COMMAND  "${NATIVE_BIN_DIR}/bsincgen")
+     ADD_CUSTOM_COMMAND(OUTPUT "${BIN2H_COMMAND}" "${BSINCGEN_COMMAND}"
+-        COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" "${NATIVE_SRC_DIR}"
+         COMMAND ${CMAKE_COMMAND} -E remove "${BIN2H_COMMAND}" "${BSINCGEN_COMMAND}"
+-        COMMAND ${CMAKE_COMMAND} --build . --config "Release"
++        COMMAND gcc "${NATIVE_SRC_DIR}/bin2h.c" -o "${BIN2H_COMMAND}" -lm
++        COMMAND gcc "${NATIVE_SRC_DIR}/bsincgen.c" -o "${BSINCGEN_COMMAND}" -lm
+         WORKING_DIRECTORY "${NATIVE_BIN_DIR}"
+-        DEPENDS "${NATIVE_SRC_DIR}/CMakeLists.txt"
+         IMPLICIT_DEPENDS
+             C "${NATIVE_SRC_DIR}/bin2h.c"
+             C "${NATIVE_SRC_DIR}/bsincgen.c"
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft/0002-makehrtf-Disable-Wstringop-truncation.patch b/meta-multimedia/recipes-multimedia/openal/openal-soft/0002-makehrtf-Disable-Wstringop-truncation.patch
index 8420386e36..607ddab8d6 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft/0002-makehrtf-Disable-Wstringop-truncation.patch
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft/0002-makehrtf-Disable-Wstringop-truncation.patch
@@ -6,14 +6,12 @@ Subject: [PATCH] makehrtf: Disable Wstringop-truncation
 Upstream-Status: Inappropriate [Should be fixed in code]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- utils/makehrtf.c | 2 ++
+ utils/makemhr/makemhr.cpp | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/utils/makehrtf.c b/utils/makehrtf.c
-index 0bd36849..0abe4252 100644
---- a/utils/makehrtf.c
-+++ b/utils/makehrtf.c
-@@ -862,6 +862,7 @@ static int TrReadOperator(TokenReaderT *tr, const char *op)
+--- a/utils/makemhr/makemhr.cpp
++++ b/utils/makemhr/makemhr.cpp
+@@ -161,6 +161,7 @@ enum ChannelIndex : uint {
   * pattern string are replaced with the replacement string.  The result is
   * truncated if necessary.
   */
@@ -21,7 +19,7 @@ index 0bd36849..0abe4252 100644
  static int StrSubst(const char *in, const char *pat, const char *rep, const size_t maxLen, char *out)
  {
      size_t inLen, patLen, repLen;
-@@ -900,6 +901,7 @@ static int StrSubst(const char *in, const char *pat, const char *rep, const size
+@@ -199,6 +200,7 @@ static int StrSubst(const char *in, cons
      return !truncated;
  }
  
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.19.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/openal/openal-soft_1.19.1.bb
rename to meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
index a9cdfac8a9..d283cb361b 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.19.1.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0f159f19f9377e1895fbb477d5a7953e"
 
 inherit cmake pkgconfig
 
-# openal-soft-1.19.1
-SRCREV = "6761218e51699f46bf25c377e65b3e9ea5e434b9"
+SRCREV = "f5e0eef34db3a3ab94b61a2f99f84f078ba947e7"
 SRC_URI = "git://github.com/kcat/openal-soft \
            file://0001-Use-BUILD_CC-to-compile-native-tools.patch \
            file://0002-makehrtf-Disable-Wstringop-truncation.patch \
-- 
2.28.0

