Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A0DC5DF75
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:00 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24391.1786747616514655481
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DnUMiHtJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc11a30a259so591537a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747616; x=1787352416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eILrNWcj7WT6QdGL5IPkuRj7fM36NFvCZXH3JX/lhVg=;
        b=DnUMiHtJSJYfhUsJIZixau4vn8qSkkbQJbUgnuqpgiEfdy5g+sHmMbHs8ggk0tn1rb
         l9wfEtsKiAqk7lACyOdsfzYUAtee600FlJcLeQtMRg02h38P6fC6xMGlRekEkbcanjH9
         8C/H1iSzJ/kFMsjkO5jG4ih8M+EE67XjRmGiKjctF2sxd0J3neXt+lJ5oSzS6QaFep/s
         FG4vl1sd91IiXSdSSTLL3n7Rv8cYnvGI7Rylv5B8RZAKaRmKCeINCkj7VLWeZhPnEKZt
         K5sGim6jD4ldCy7mxEazRDfdImKNQ+brOpJVoFLdeQPsaWXeIoAIIayjmhPM99m/ac9U
         7Org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747616; x=1787352416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eILrNWcj7WT6QdGL5IPkuRj7fM36NFvCZXH3JX/lhVg=;
        b=IC0tdo8QeDsnX/+6NYnE8yFBShlyQ61rh50+cLNnf3/XlwIm9w4ShX9VJ2AFl8g5iw
         2rZRC1GfQPZULZE9ncqIr7/3//drwGRePesIY+hPOPHS8MF4Y+z+3xstBfXS/IMs5Wgd
         VD3RGQiAUhhlJLARHvlpObGxMXPp2IZDWpVAHWnCMvJt3BS2PFxopjliZwBQn30UKXQ/
         QUtiHN3nOxB9cOrstJ4Cjz+GcQbi5tjuN8q7V5qxojZkaCOlNaZzVi1W4MXlZ6OjLcZa
         BL8ESneODqN1hgZLVgomQHFCthewaMVDfW1mssPqKg/I700MTnnE5pXacd5iyczrGAnt
         acnQ==
X-Gm-Message-State: AOJu0YxWylQ85eglgfL4zz9iKMco0PRh/bO9tbRu/M4FJIaWEllSCvUo
	fYzem8zW+J9OxJSGQlYEem+d5aqtFdwhDlri81pf7WWxf7Hh8j2Xv6hrv2/j84a9
X-Gm-Gg: AR+sD10CcgtQFN/RW3MFt92Ef1pM9zoSpoIVaw4WVC4ZlAITfg/3AWru7bF4VffXyWn
	SuXxdl+G1bjZOCb5oiiI6XvaMzemyEfKfHuS8rX7ZbM1V4RDHHM/x400D2JpKdaKeZVk4kxFuY9
	7nBi30BGK+8vkykqlCHngG4OwFmsfmjARFI4Ll0qoRQjQimHvOjx80JCP2uCuRGD/pkLKhScFMO
	HcZsy/cWFpfsYT2kJOLx4u6iQG8SJZKXluPrWOcO+zNfyjc+X/KvWuhfgoo2LivaJpmZERjpl3c
	4W97dHkS+mi6+SNuGcK+WCjEeJ/KeIa3rfoc4rN7jYBmp1lP+bs0SmMeo1FXSC/AB6sXv1cr6rP
	it3J+5r501DCuKESK1ufJFZDCtCVJXOMyonkPQJo1KpHCS4Vo/nApneAsvIdy3Zz2jjjAfqujj4
	aGvDHakURXMrfPKym8FTWZBBtEr4BySWeL82JF2R1sHLEf6b3FLTiAzLGgYR2lEOhnONNuUkc0k
	uYaFNXhW5nnJbQL5z4m0vlyQBGJKhc3SF4vIB332Ej7/5rKxXWNcj7i7c0fKo7d7cmR6XKTePKN
	6eeuoIhNFS2aQfUap3DSa7qNm+xWWQjy1vvQ81Xu4J9r40XmRENInT37elsPEdj4nnO9rB3Jn5u
	k0AepFM6yctRQVbb5ZqaaFbyxhJwp0PIR4Io6+cERberpfA==
X-Received: by 2002:a05:6a20:12c8:b0:3c1:85d:fa2f with SMTP id adf61e73a8af0-3cc71eb2723mr9527300637.36.1786747615779;
        Fri, 14 Aug 2026 15:46:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 066/109] cli11: upgrade 2.6.1 -> 2.7.2
Date: Fri, 14 Aug 2026 15:44:52 -0700
Message-ID: <20260814224539.1523174-66-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129130

Point release. LIC_FILES_CHKSUM md5 updated for the LICENSE file whose copyright header now says 2017-2026 instead of 2017-2025; license text unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../remove_tmpdir_from_test_binary.patch      | 45 ++++++++-----------
 .../cli11/{cli11_2.6.1.bb => cli11_2.7.2.bb}  |  4 +-
 2 files changed, 21 insertions(+), 28 deletions(-)
 rename meta-oe/recipes-support/cli11/{cli11_2.6.1.bb => cli11_2.7.2.bb} (88%)

diff --git a/meta-oe/recipes-support/cli11/cli11/remove_tmpdir_from_test_binary.patch b/meta-oe/recipes-support/cli11/cli11/remove_tmpdir_from_test_binary.patch
index 22c3e5211f..78ef11e487 100644
--- a/meta-oe/recipes-support/cli11/cli11/remove_tmpdir_from_test_binary.patch
+++ b/meta-oe/recipes-support/cli11/cli11/remove_tmpdir_from_test_binary.patch
@@ -1,33 +1,26 @@
 Remove tmpdir from apptest binary
 
-This binary is used in the ptest package. It executes another helper binary
-for the test, which is identified by its absolute path, as it was determined during
-build. To avoid the QA error (and to find the helper binary during test excution),
-use pwd command files.
+The AppTest binary is used in the ptest package. It spawns two helper binaries
+(ensure_utf8 / ensure_utf8_twice) which upstream identifies by the absolute
+path in the build tree via $<TARGET_FILE:...>. That absolute path both trips
+the buildpaths QA check and does not exist on the target. Refer to the helpers
+relative to the current directory instead - run-ptest chdir()s into the tests
+directory the helpers are installed into.
 
 Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 
 
-diff --git a/tests/AppTest.cpp b/tests/AppTest.cpp
-index 29aff27c..ddb8238b 100644
---- a/tests/AppTest.cpp
-+++ b/tests/AppTest.cpp
-@@ -2819,7 +2819,7 @@ TEST_CASE("C20_compile", "simple") {
- 
- // #845
- TEST_CASE("Ensure UTF-8", "[app]") {
--    const char *commandline = CLI11_ENSURE_UTF8_EXE " 1234 false \"hello world\"";
-+    const char *commandline = "$(pwd)/ensure_utf8 1234 false \"hello world\"";
-     int retval = std::system(commandline);
- 
-     if(retval == -1) {
-@@ -2837,7 +2837,7 @@ TEST_CASE("Ensure UTF-8", "[app]") {
- 
- // #845
- TEST_CASE("Ensure UTF-8 called twice", "[app]") {
--    const char *commandline = CLI11_ENSURE_UTF8_TWICE_EXE " 1234 false \"hello world\"";
-+    const char *commandline = "$(pwd)/ensure_utf8_twice 1234 false \"hello world\"";
-     int retval = std::system(commandline);
- 
-     if(retval == -1) {
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -159,8 +159,7 @@ endforeach()
+ function(add_dependent_application_definitions TARGET)
+   foreach(APP IN LISTS CLI11_DEPENDENT_APPLICATIONS)
+     string(TOUPPER ${APP} APP_UPPERCASE)
+-    target_compile_definitions(${TARGET}
+-                               PRIVATE CLI11_${APP_UPPERCASE}_EXE="$<TARGET_FILE:${APP}>")
++    target_compile_definitions(${TARGET} PRIVATE CLI11_${APP_UPPERCASE}_EXE="./${APP}")
+
+     if(WIN32)
+       target_link_libraries(${APP} PRIVATE shell32)
diff --git a/meta-oe/recipes-support/cli11/cli11_2.6.1.bb b/meta-oe/recipes-support/cli11/cli11_2.7.2.bb
similarity index 88%
rename from meta-oe/recipes-support/cli11/cli11_2.6.1.bb
rename to meta-oe/recipes-support/cli11/cli11_2.7.2.bb
index b6c1ac56ba..9f06452301 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.6.1.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.7.2.bb
@@ -1,14 +1,14 @@
 DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
 HOMEPAGE = "https://github.com/CLIUtils/CLI11"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27559a6fd853c4b46ec4dea16597460c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e78b25a90f01b35b087d9fb985ed4"
 
 DEPENDS = "catch2"
 
 SRC_URI = "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https;tag=v${PV} \
            file://remove_tmpdir_from_test_binary.patch \
            file://run-ptest"
-SRCREV = "bfffd37e1f804ca4fae1caae106935791696b6a9"
+SRCREV = "919ce47dad39520a6e9a695d3e2d222c6920a445"
 
 inherit cmake ptest
 

