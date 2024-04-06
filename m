Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEE5C67861
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 18:30:20 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.42105.1712428210706406239
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Apr 2024 11:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dh84l/s0;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e1a1c0ec9so3233256a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 11:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712428208; x=1713033008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g8SW+XIHY7nnADTCQ3v8ylHNoEUjfym6ZH0IASgpP4o=;
        b=dh84l/s0pMporYauoTRh2HrJRAbTBzuX9iZa9yHhioBj6SEM8+KFsK24AV2Cm3K2J2
         M9n6lGyt9M7VhbFYC1u6OnUEmLYJhq8/iOCgXa+94/My15Vw+tftICjl68t8ngCgjeGE
         nWYsjqyvaLrCaGtejiLCA9tMt8wL0f0UARs7LQe6ST685UOVBaxRHxEoVkg8QYI+AH1T
         WCdlTDaUkheK23zg+kfLmzYwonqGas+MfhuCLqbkN0NSLHQ+DqHwufnyWDaSvy0scvbm
         WW1UbyJNoIQ+9rOUj1NGotXKTTEjfgu4cnb0fWRbMhrdzQew/wWU6qOPgqVHbpdYAbCe
         BL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712428208; x=1713033008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8SW+XIHY7nnADTCQ3v8ylHNoEUjfym6ZH0IASgpP4o=;
        b=ClC+yS6SSvbhcVGjQYjuvSrl+5TXe7HtdwPOjP7W45rtGr6O5uio3gKgVXBy/U5t3B
         YqSF3UeDGrhW27Uvm/pHrpOuOxekML5pPKSZDAT77en9avyGxBbpXTkm/QauMJGX2/vH
         yNQyTAM+Ay1YyTzjKSpIn+/77639MPT5uaDzNy2Jm1W7pRFfUjzeaqpuhRhBowfR1oQe
         4RJxscznjujTF5YmXAJD/ubD2QWd3I/HpnHHA/JBNV+NTCmG5lN5XdZegbu/UTQuTEKQ
         6ccZQKzpbYUM1wCU8M0M27i8rhslORfkskaIbg5RNS8bvJJJgE4Lnyly2LuadchywUQ2
         fAPA==
X-Gm-Message-State: AOJu0YyXjmGOPGh0qkcz9sPA3nMf8kWjCjBDQdJC+nx60QTPFNokRYBG
	P8AwDlwCPOQqsbvguBBgs22eDFBZOwWuaccBwkKK6jD7MdLqLm+ZfEnBOEEy
X-Google-Smtp-Source: AGHT+IGKPy/SkP1cb6642/Rg9rGf8mUqm1zz1zBWmgydZcLiJ7UqTFoZ9Duscdy7PUhwd1Y4dWj1Ig==
X-Received: by 2002:a50:8acc:0:b0:56b:9ef8:f630 with SMTP id k12-20020a508acc000000b0056b9ef8f630mr3248848edk.2.1712428207936;
        Sat, 06 Apr 2024 11:30:07 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id ck6-20020a0564021c0600b0056e2bf42d0fsm2168307edb.49.2024.04.06.11.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 11:30:07 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-pillow: Upgrade 10.1.0 -> 10.3.0 and fix ptest
Date: Sat,  6 Apr 2024 21:30:04 +0300
Message-Id: <20240406183004.663753-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 18:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109837

License-Update: Updated copyright year and clean up authors, contributors

* 0001-explicitly-set-compile-options.patch dropped because setup.cfg moved to pyproject.toml -> (https://github.com/python-pillow/Pillow/pull/7484)

        Also, we can give the build option parameters as described in the documentation -> https://pillow.readthedocs.io/en/stable/installation/building-from-source.html#build-options
		Added build options to pass to build with using the variable PEP517_BUILD_OPTS so no need to create patch again.

* "python setup.py" and the use of "setup.py" as a command line tool are deprecated and upstream added a custom build backend to translate -C feature=disable style flags to the old --disable-feature style flags by prepending the build command (typically bdist_wheel) with a build_ext --disable-feature command which builds the extension modules before being added to a wheel. That backend uses the build_meta module of setuptools. The _CustomBuildMetaBackend class is a subclass of this module, adding custom behaviors and enabling settings specific to a particular project.

        https://github.com/python-pillow/Pillow/blob/10.3.0/_custom_build/backend.py

* Ptest tested on qemux86-64 and qemuarm64 with x11.

* Since no ptest error was encountered, python3-pillow has been moved from PTESTS_PROBLEMS_META_PYTHON to PTESTS_SLOW_META_PYTHON.

        Tests with SKIP are related to packages with explicitly disabled build options.

qemux86-64:

Testsuite summary
TOTAL: 4502
PASS: 4152
SKIP: 347
XFAIL: 2
FAIL: 0
XPASS: 1
ERROR: 0
DURATION: 904
END: /usr/lib/python3-pillow/ptest
2024-04-06T15:56
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 4502
PASS: 4152
SKIP: 347
XFAIL: 2
FAIL: 0
XPASS: 1
ERROR: 0
DURATION: 674
END: /usr/lib/python3-pillow/ptest
2024-04-06T16:40
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Changelog:

https://pillow.readthedocs.io/en/stable/releasenotes/10.3.0.html
https://pillow.readthedocs.io/en/stable/releasenotes/10.2.0.html

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  2 +-
 .../0001-explicitly-set-compile-options.patch | 40 -------------------
 ...low_10.1.0.bb => python3-pillow_10.3.0.bb} | 24 ++++++++---
 3 files changed, 19 insertions(+), 47 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
 rename meta-python/recipes-devtools/python/{python3-pillow_10.1.0.bb => python3-pillow_10.3.0.bb} (68%)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 63f312b45..19566e466 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -88,6 +88,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-google-auth \
     python3-lz4 \
     python3-marshmallow \
+    python3-pillow \
     python3-pytest-localserver \
     python3-traitlets \
     python3-yappi \
@@ -97,7 +98,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-betamax \
     python3-dnspython \
     python3-fastjsonschema \
-    python3-pillow \
     python3-pint \
     python3-pyzmq \
     python3-scrypt \
diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
deleted file mode 100644
index 005fea5c6..000000000
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 27bfa4028453dc79a72569823e97da8fd1994ffc Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Tue, 1 Sep 2020 11:53:53 +0000
-Subject: [PATCH] explicitly set compile options
-
-OE does not support to install egg package, so
-explicitly set build_ext options for oe-core's
-`setup.py install'
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- setup.cfg | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/setup.cfg b/setup.cfg
-index 19979cf7..ed27dfe1 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -11,3 +11,15 @@ multi_line_output = 3
- [tool:pytest]
- addopts = -ra --color=yes
- testpaths = Tests
-+
-+[build_ext]
-+disable-platform-guessing = 1
-+enable-zlib = 1
-+enable-jpeg = 1
-+enable-tiff = 1
-+enable-freetype = 1
-+enable-lcms = 1
-+enable-jpeg2000 = 1
-+disable-webp = 1
-+disable-webpmux = 1
-+disable-imagequant = 1
--- 
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index e795bd491..debf48815 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -3,16 +3,28 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b22dc6b663b9175820e5e03337c7596b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c349a4b4b9ec2377a8fd6a7df87dbffe"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
-           file://0001-explicitly-set-compile-options.patch \
            file://run-ptest \
            "
-SRCREV ?= "da59ad000d1405eaecd557175e29083a87d19f7c"
+SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 
-inherit setuptools3 ptest
+inherit python_setuptools_build_meta ptest
+
+PEP517_BUILD_OPTS += " \
+    -C platform-guessing=disable \
+    -C zlib=enable \
+    -C jpeg=enable \
+    -C tiff=enable \
+    -C freetype=enable \
+    -C lcms=enable \
+    -C jpeg2000=enable \
+    -C webp=disable \
+    -C webpmux=disable \
+    -C imagequant=disable \
+"
 
 DEPENDS += " \
     zlib \
@@ -53,8 +65,8 @@ S = "${WORKDIR}/git"
 RPROVIDES:${PN} += "python3-imaging"
 
 do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/Tests
-        cp -rf ${S}/Tests ${D}${PTEST_PATH}/
+    install -d ${D}${PTEST_PATH}/Tests
+    cp -rf ${S}/Tests ${D}${PTEST_PATH}/
 }
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


