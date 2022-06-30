Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5B6C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:57:12 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web09.28769.1656611828536563021
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 10:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aB9qFBsb;
 spf=pass (domain: gmail.com, ip: 209.85.166.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id n14so12870996ilt.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X0SGnjbuzKVXw/siErG8vxRBmIFvqxAGKAN82QhpoYU=;
        b=aB9qFBsbSYoiA/yqrEDc0F6YSxTlQKTNkIZNoGUhkKuJtbk5QCOf8BhPQdSEmWZmKs
         GzJkmMmE7839NA5kcQ2dkUeaFsTCOnCyywvYRKHdxSyUlXpyYi+8pKeE9qljJ556XpPn
         QCyXXF7TTb6lm+KAcOPpExoaV16ICbJwnuNAX5Liqyg446jJ28lAP4WqFjcp+XBdJmgs
         8+oh6JqzCF01L7WtU1P7lBKH6clXYQetSFrJT5MOlWcosGI5PJO67nvyJPTQBF3jEisx
         UPji68dIq3bkDalOeZZsSXSMwYT7p5EDXrWuXrzTdMj7+hPX80ofPf/2Inm1ZNKPi7H+
         Up3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X0SGnjbuzKVXw/siErG8vxRBmIFvqxAGKAN82QhpoYU=;
        b=1ga8U+/jKyfhcl1Ts2f18r51pcs47GTWL2cSHP/OGUYQsTT1FFpnZZwZqhAcmyZk1i
         xk99vxyJ5nF3onOPGO3wNF7Soi7cgKHMvKR8QlIfFr402WJ9nV4WC55fBBVcPx6mLY2N
         qXzDmO2D6i49Uqv9FZTszXajJyypT9o1+a6RPjNEryhhCwfJbkGMHhqr03vpxW7KF8Jf
         1JGZh72t7z+o4vIPYRBFnYGHk8ZjVafHalhVx8DfLSVF1R70v/sH/7Joe0+RF5a270Th
         FtNGgKYbXVexumm5QcT/jwYfGFKD4VehL8A2YfYY0CsjL2OsGAurK1fMVZx3c8kXoHHu
         C7ag==
X-Gm-Message-State: AJIora9DI5mRT5u1ZzAHgGLp6smIndYqi0U1cE8Ezwhirtdi3BNIhUzj
	eY5BdbnibsM6+oaGvo8A77YBUrgij0a2zg==
X-Google-Smtp-Source: 
 AGRyM1sW6wTyEmIOlR4ui1soHW6CPcDILYnP/cqeCFciTBzyE/vFJHjaDask+y+U3pw7hc+Tk8KGnw==
X-Received: by 2002:a05:6e02:b29:b0:2da:bd29:6ee5 with SMTP id
 e9-20020a056e020b2900b002dabd296ee5mr5983993ilu.291.1656611827496;
        Thu, 30 Jun 2022 10:57:07 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fea8:95df:9730:6119:b422:792f:b68a])
        by smtp.gmail.com with ESMTPSA id
 b28-20020a026f5c000000b0032e70c4e12fsm8956793jae.28.2022.06.30.10.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:57:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-python][PATCH 1/2] python3-editables, python3-hatchling,
 python3-pathspec: Delete
Date: Thu, 30 Jun 2022 13:57:01 -0400
Message-Id: <20220630175702.15954-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 17:57:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97643

Moved to oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-editables_0.3.bb           | 11 ----------
 .../python/python3-hatchling_1.3.0.bb         | 21 -------------------
 .../python/python3-pathspec_0.9.0.bb          | 11 ----------
 3 files changed, 43 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-editables_0.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pathspec_0.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-editables_0.3.bb b/meta-python/recipes-devtools/python/python3-editables_0.3.bb
deleted file mode 100644
index b42ff0687..000000000
--- a/meta-python/recipes-devtools/python/python3-editables_0.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "A Python library for creating editable wheels"
-HOMEPAGE = "https://github.com/pfmoore/editables"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41bc1be47b7bb8240db3ef928c7cb0bf"
-
-SRC_URI[sha256sum] = "167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f7b410cde16161b1a"
-
-inherit pypi python_setuptools_build_meta
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb b/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
deleted file mode 100644
index a6550a973..000000000
--- a/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "The extensible, standards compliant build backend used by Hatch"
-HOMEPAGE = "https://hatch.pypa.io/latest/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbe2fd33fc9297692812fc94b7d27fd9"
-
-inherit pypi python_hatchling
-
-DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
-DEPENDS:remove:class-native = "python3-hatchling-native"
-
-SRC_URI[sha256sum] = "1401d45d3dd6a5910f64d539acaa943486d5e8b7dda1a97f2b0040fdddc5b85e"
-
-# Until we have a proper tool to invoke PEP517 builds, hatchling can't
-# bootstrap itself automatically.
-PEP517_BUILD_API = "hatchling.ouroboros"
-
-do_compile:prepend() {
-    export PYTHONPATH=src
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pathspec_0.9.0.bb b/meta-python/recipes-devtools/python/python3-pathspec_0.9.0.bb
deleted file mode 100644
index 641f1cfd8..000000000
--- a/meta-python/recipes-devtools/python/python3-pathspec_0.9.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Utility library for gitignore style pattern matching of file paths."
-HOMEPAGE = "https://github.com/cpburnz/python-path-specification"
-SECTION = "devel/python"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
-
-SRC_URI[sha256sum] = "e564499435a2673d586f6b2130bb5b95f04a3ba06f81b8f895b651a3c76aabb1"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.32.1 (Apple Git-133)


