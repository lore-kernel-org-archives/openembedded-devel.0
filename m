Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E588EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 17:46:31 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.13406.1689961581862887790
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 10:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=N/NCsm1N;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so3557675e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 10:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689961580; x=1690566380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4C4JkssEuGFUAMHS+/RnOxVMw02mJCsqwFUwsn9MWkM=;
        b=N/NCsm1N7jwtr8qKehBMMBgCrcRjff3ZrLZWT7k1MpkIHSBaDX0oRBZAq7i8t82Mtm
         gvet3XqQeRBIXuQV/UCDuGVgADYyJ+PIGdeYGPfVR5T7q5KlCsUC2XkhtrHT6V5wCRu0
         QSz2ud9FZfpC/JC7P5Jg577hOQAGYYUdm8NiATFMIF7J1+vrS8m05wEm2eHlhMVnBYlt
         osUdNBAhVExW31L59WgUemaSzhV0jp/FEzyBfBS+HGR/fS3oAkuXbhq4w0tyoquCZfMF
         I5+VHUU58arAYQRMHWhiU/D4+x2bet3vQWox2U+9FTP0Kf+Ll8SG4smDm07eYpluuD5O
         Qgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689961580; x=1690566380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4C4JkssEuGFUAMHS+/RnOxVMw02mJCsqwFUwsn9MWkM=;
        b=loliPzcrmIQG2D7AJ+qNAd6QACkBgtxX+lDRaGBNW7tQC2jQ3qegAv+abIWOVSmzYA
         P0BY2+NkxqpVIGHf8lohBkCc9OcDNovvOtGE27QtCc24yd/oaWg9G9pWzpB3JxPdc1+6
         IlW5T0P0xcfGEz7Kz8iiw6NipuboHYkhwRTm+NhvJfpW95sdQlqOnvi3Q1LpROpK4u6G
         Wt9QcOWvDCnu8AGuwLbVoUcO7ufH6B7SkCELMJaSSHToiGLOBqbVjHzAZusgd87QfJ1g
         SSTrgEm0Bspu42gOaT61FP16ZfWYFa/Do6KFyrl8YBJf6mzsYj7q9lX/vaYVOjpgUru8
         2EQQ==
X-Gm-Message-State: ABy/qLbQBOCtnyIdVFmA7B4LA/BrLOd+yF93dNm73XrZjXzwYkrT3Sof
	DXRiw3CGU/4+U+NCG1r82eQXCKEN00g=
X-Google-Smtp-Source: APBJJlHPoxkeIEvZ5yL/gN9FN/whSGs6dKkxCFr6qMiKV0P/Z3p8HsT/x53kCC4YJdaB7MhovuxlFQ==
X-Received: by 2002:a19:5601:0:b0:4f8:72b6:eae with SMTP id k1-20020a195601000000b004f872b60eaemr1592483lfb.40.1689961579294;
        Fri, 21 Jul 2023 10:46:19 -0700 (PDT)
Received: from Unimatrix08-Jammy.lan ([2.199.98.135])
        by smtp.gmail.com with ESMTPSA id rv7-20020a17090710c700b00993a9a951fasm2490587ejb.11.2023.07.21.10.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 10:46:19 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: Add patch to fix build with googletest 1.13
Date: Fri, 21 Jul 2023 19:46:16 +0200
Message-Id: <20230721174616.3682616-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 17:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103973

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon/504.patch           | 34 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.9.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/504.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/504.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/504.patch
new file mode 100644
index 000000000..3290d1108
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/504.patch
@@ -0,0 +1,34 @@
+Bug: https://bugs.debian.org/1041124
+From 3f8bc3343983697531d52918fb6cdba19593f3a8 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Sat, 15 Jul 2023 11:31:55 +0200
+Subject: [PATCH] Update CMakeLists.txt: set required std version to gnu++14
+
+New googletest 1.13.0 defaults to gnu++14, so makes this package FTBFS when building testsuite with this error:
+
+In file included from /usr/include/gtest/gtest-message.h:57,
+                 from /usr/include/gtest/gtest-assertion-result.h:46,
+                 from /usr/include/gtest/gtest.h:64,
+                 from /build/1st/dlt-daemon-2.18.9/tests/gtest_dlt_user.cpp:27:
+/usr/include/gtest/internal/gtest-port.h:270:2: error: #error C++ versions less than C++14 are not supported.
+  270 | #error C++ versions less than C++14 are not supported.
+      |  ^~~~~
+
+Thanks Adrian Bunk <bunk@debian.org> for the report and the fix!
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 014fc3bb..b2e056db 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -213,7 +213,7 @@ endif()
+ 
+ add_compile_options(
+     $<$<COMPILE_LANGUAGE:C>:-std=gnu99>
+-    $<$<COMPILE_LANGUAGE:CXX>:-std=gnu++11>
++    $<$<COMPILE_LANGUAGE:CXX>:-std=gnu++14>
+     -Wall
+     -Wextra
+     # -pedantic
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.9.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.9.bb
index 9a7b38b49..2d6d1879a 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.9.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.9.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            file://0004-Modify-systemd-config-directory.patch \
            file://481.patch \
            file://482.patch \
+           file://504.patch \
            "
 SRCREV = "9a2312d3512a27620d41b9a325338b6e7b3d42de"
 
-- 
2.34.1


