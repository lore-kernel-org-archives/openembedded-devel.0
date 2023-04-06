Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA1EC77B71
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 06:54:33 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.152550.1680764067370246318
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 23:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bhwcgq/R;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id q102so36411465pjq.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 23:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680764066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0J3ym1BPrNGEjdFxJcZyYK/xtTHNn+l5aif8LSBx5k=;
        b=Bhwcgq/R2EsY6m+M7Z0/o5VDCngM3kcyqEYVAzZ6YhHNUK8XIWN+ZHfDKZ7DkA+aDz
         mILno/xUkj3AMr2sVGc9UwUx+2SDrZokIwk7pwjXu86X1h29BcAdsYODmoSBY/3PyLZQ
         R3rTsd2bXose97E/+qalFyUGrOPj/BfmXndivG3f2QrEvrLZ7B7M3bMMDLlkFaHLPQBa
         96GZ+kfP+HwYDq+/gZulXaBMVAqTQJ2n4LJHJADIllOUg01pP/jkfxyWnY/bjJFXzjNZ
         zFNszTplFtQjXTdUfyxbwdX9VEhNAC5Dor5x9FLeHt8xXl4m1Bse27G/zVrqgJsFa3/c
         4KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680764066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0J3ym1BPrNGEjdFxJcZyYK/xtTHNn+l5aif8LSBx5k=;
        b=riMeOCCimDGMEoiG02a6wcVrEuvy1gf2E11U+jY7PGJoC7hmuTb6wTsF/ej0DxWu1h
         QTOLimI11L1zaBKZd8tTBcV/O6gKNUL/azwOcdDvQB7/z4mY+zhxnhOSippnk2Xw6A6V
         9alaK3dLNYfoaTQr7wdOQlKD+2aMVDP+GiCrlB2XSPe5J2hWvT6O9P1EbjBcax/3blZ8
         Bjp0JdQEArqQ9s2HohnIxZEMBdp+DSCFk35xNd810sFAi1p18H+Vn30bG1SMGP/Ke1X/
         YAh9gurV6bBr1ESIp4HIXt/HAcHo+DyG70apsIqETj6qCdRSjvN5RofAxfF9VekfKKrJ
         XqJQ==
X-Gm-Message-State: AAQBX9eet2/76sVt3Ooleq5XGeElsaFmTTwf9KkeChMQmiW/OW75Jmru
	qeEiCMfbAzc6fzbDqY1X0+x9cYtDoeP/OQ==
X-Google-Smtp-Source: AKy350ZtHxjvwLaWTYKRHbrNfIsCLQ60l2TqAnSWsRwzN1860eGO31/sGKNlf6s/G7M00jv4Rc4WmQ==
X-Received: by 2002:a17:902:c403:b0:1a2:7356:1ecd with SMTP id k3-20020a170902c40300b001a273561ecdmr13077905plk.5.1680764066441;
        Wed, 05 Apr 2023 23:54:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709027c8b00b0019c919bccf8sm648703pll.86.2023.04.05.23.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:54:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] libtinyxml2: Add ptest support
Date: Wed,  5 Apr 2023 23:54:19 -0700
Message-Id: <20230406065421.767010-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406065421.767010-1-raj.khem@gmail.com>
References: <20230406065421.767010-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 06:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101968

- Switch to usong meson build system
- Fix build with musl by defining _LARGEFILE64_SOURCE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/libtinyxml2/files/run-ptest  | 10 ++++++++++
 .../libtinyxml2/libtinyxml2_9.0.0.bb             | 16 +++++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/libtinyxml2/files/run-ptest

diff --git a/meta-oe/recipes-support/libtinyxml2/files/run-ptest b/meta-oe/recipes-support/libtinyxml2/files/run-ptest
new file mode 100644
index 0000000000..0797ea2374
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml2/files/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+for i in `ls *test`; do
+    $i
+    if [ $? -eq 0 ]; then
+        echo "PASS: $i"
+    else
+        echo "FAIL: $i"
+    fi
+done
diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
index 7f205987f4..b99a126ba2 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
@@ -4,14 +4,20 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
 
-SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https"
-
 SRCREV = "1dee28e51f9175a31955b9791c74c430fe13dc82"
+SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
+           file://run-ptest"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit meson ptest
 
-BBCLASSEXTEND = "native"
+EXTRA_OEMESON += "${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtests=true', '', d)}"
+
+CXXFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
-EXTRA_OECMAKE += "-Dtinyxml2_SHARED_LIBS=YES"
+do_install_ptest() {
+    install -Dm 0755 ${B}/xmltest ${D}${PTEST_PATH}/xmltest
+}
+
+BBCLASSEXTEND = "native"
-- 
2.40.0


