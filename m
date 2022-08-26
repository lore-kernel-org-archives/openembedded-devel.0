Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66606ECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 14:09:16 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.37253.1661522955448172761
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 07:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WTZwC02J;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: philip.balister@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id m5so1181867qkk.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 07:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc;
        bh=c0LfIYblx8NokbfC0ljf19LszesWPRofO5Rw0JWMbnY=;
        b=WTZwC02J1g9PaOGVcNwbKpmU7iGH5IeN3MHoyLhMQRvY6zAuCBi1fkAiq0/86jJVrJ
         iMZnO6Cyj9u5qRNtoeOR5lK8M5Kshe1tGrclRHe8LOrFI5efq4z6n9lulqHxufJS6YpL
         pIYuHPXiv7YipQ+PUPY+z36Oj3jjQd2nKWzMBvlYD1itUEsdHgwO1ej7SEHr14qJezGM
         HsMhD345hiAFLusfzW9c3IFqOsU7j4bxPTeORgxUyAoYOgNUI+sPp1jGdId0ssuEOvWL
         2uE1b87m8lkvvz3LJNZjgKMFGNZwm7Ace2qSnlQ0tmicueIQaAFAg6zNOe8LxK7efDJF
         JfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc;
        bh=c0LfIYblx8NokbfC0ljf19LszesWPRofO5Rw0JWMbnY=;
        b=Fn3JnFOG7nu6HFBdbAoDhGSORZSVjYLd8ZTx/CdGYVfKtKMw+D10aFseamIlOWWjXo
         SjL9HrPxn0+o/0cdS9KJn0UWMZAs42g0ELGsO2ycCdVWVclinCwzWfCCi6FMdTsM3eZM
         /na+ba+lBFxjErzwi8DfR5OJDpXDwVNjfxOkoxu6po7JsD84kMP+PjqX/4ASQW7cLe9y
         xOfzyjjgSs42keMElY5xaoiHowRuPx6mgpXm2sb89L8Cu80UiXbMRWbuoijzVHZS3Q4X
         gsNCyLIbasjXtEhwSQDZ7iJGQ5GbJPLRjlimXKVNNkYBuG7EIOq9AuZnCceHHV9SyJHB
         3hSA==
X-Gm-Message-State: ACgBeo3ddyh0LHADuItc4pe3KYw9YTocsFlaC5ZYvQUYn7Xtk4JiDFip
	r/hZZhC+TleDBOBNWFOFYzCalkom4js=
X-Google-Smtp-Source: 
 AA6agR5dqmL4BBINSsydvi70bCcpy2R1ZwReWJ3QqOQaSMX83VgOSLnYqFZbeO9q6TQAe8Jw1wRtjg==
X-Received: by 2002:a05:620a:4482:b0:6bb:c315:9597 with SMTP id
 x2-20020a05620a448200b006bbc3159597mr6648941qkp.423.1661522953980;
        Fri, 26 Aug 2022 07:09:13 -0700 (PDT)
Received: from thuvia.hsd1.va.comcast.net
 ([2601:5c0:c280:a00:5b97:5b4a:44a6:6d49])
        by smtp.gmail.com with ESMTPSA id
 w5-20020a05620a424500b006b8e049cf08sm2147790qko.2.2022.08.26.07.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 07:09:13 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>
Subject: [meta-python][PATCH] python3-pybind11: Update to Version 2.10.0.
Date: Fri, 26 Aug 2022 10:09:10 -0400
Message-Id: <20220826140910.71664-1-philip@balister.org>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 14:09:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98481

 * Dropped patch for cross compile. 918d4481a4f69c7a4cbb4282acbabd28e2433039
   fixes this upstream.
 * This also fixing an issue building gnuradio where pybind looked for
   something in /usr/include/pythonX.Y on the build machine.

Signed-off-by: Philip Balister <philip@balister.org>
---
 ...ck-pointer-size-when-cross-compiling.patch | 31 -------------------
 ...11_2.9.2.bb => python3-pybind11_2.10.0.bb} |  4 +--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.9.2.bb => python3-pybind11_2.10.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
deleted file mode 100644
index 761422e07..000000000
--- a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2e9318f7a70699eed239aee6301d1d0bbd2457ee Mon Sep 17 00:00:00 2001
-From: Philip Balister <philip@balister.org>
-Date: Fri, 10 Jul 2020 10:14:59 -0400
-Subject: [PATCH] Do not check pointer size when cross compiling.
-
-It is reasonable to build for 32 machine on a 64 bit build machine. Prevents:
-| CMake Error at tools/FindPythonLibsNew.cmake:127 (message):
-|   Python config failure: Python is 64-bit, chosen compiler is 32-bit
-
-Signed-off-by: Philip Balister <philip@balister.org>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- tools/FindPythonLibsNew.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/FindPythonLibsNew.cmake b/tools/FindPythonLibsNew.cmake
-index 3605aebc..67f4d4a0 100644
---- a/tools/FindPythonLibsNew.cmake
-+++ b/tools/FindPythonLibsNew.cmake
-@@ -156,7 +156,7 @@ list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)
- 
- # Make sure the Python has the same pointer-size as the chosen compiler
- # Skip if CMAKE_SIZEOF_VOID_P is not defined
--if(CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
-+if((NOT CMAKE_CROSSCOMPILING) AND CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
-   if(PythonLibsNew_FIND_REQUIRED)
-     math(EXPR _PYTHON_BITS "${PYTHON_SIZEOF_VOID_P} * 8")
-     math(EXPR _CMAKE_BITS "${CMAKE_SIZEOF_VOID_P} * 8")
--- 
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.9.2.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.10.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.9.2.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.10.0.bb
index 433bfd60e..66aefac3d 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.10.0.bb
@@ -7,9 +7,9 @@ DEPENDS = "boost"
 
 SRC_URI = "git://github.com/pybind/pybind11.git;branch=stable;protocol=https \
            file://0001-Do-not-strip-binaries.patch \
-           file://0001-Do-not-check-pointer-size-when-cross-compiling.patch \
 "
-SRCREV = "914c06fb252b6cc3727d0eedab6736e88a3fcb01"
+
+SRCREV = "aa304c9c7d725ffb9d10af08a3b34cb372307020"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.3


