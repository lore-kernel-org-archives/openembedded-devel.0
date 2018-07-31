Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 041B778DBC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 12:15:22 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o18-v6so2936775wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 05:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vXGA7moPhBKZNboMOvhOcGQSVQQ5RzYbb2YhTX0ukJE=;
	b=SoAi2ZGFXXGTAvn1AhcUJJa5p0+id+MtG/UBbeRa1hgBGvreEoby1IAFmvmoUur4MS
	DMtDHHb+i6co6+EK/08F9AWmMvqgvEwRqRDQmgrbv+AwcG4VLZnb5Jg4x4jM+AG/qG4c
	h/9G2Y7ZcmbLnHxNmaNWtYPon6gCn6YL+iUFXS3Z0Bh5rYbuQIq8+dIFxOP2rthDSohR
	3HLzlvuZQjW4v42LpQ4TsBV2cIBaI635VEsxDmQ3sxOosjATi6ejgthjqmM4WAkQlQJR
	eGQat/1FMjq+tl18AizzbZEH3+jdtLKAYzQPr6TRGYkVmrn7JSVRkNnLR9KbAmDLVaqa
	CFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vXGA7moPhBKZNboMOvhOcGQSVQQ5RzYbb2YhTX0ukJE=;
	b=qLJ0puWPMHqj7dsWPpQSwgHTuGsqgxb1ZxqePaFb4KB9H+PgoA8QrtQt5RG7M+H0cX
	c+jlz4FPkMkyjKkjsOqriac6ff1viQKbY8Ggy6DCoREKdAggHo8Mk4cnoddvHUX7AIfj
	277WcyZA3EQqgS+oPil7yR1GTHmhvcw8YSIHBOUmPOnpDxTw6Os2eKsvaujXoBKOt+2o
	gS7eLpYnNfBXcaXGiI7DiQdrEiGarG0+DrT2yI/kbQ3/y7/pz/XvlHjd4Of+z4Ry/CiL
	SWd04LaDq7hbv0zGfVEKdVBaG9W5PLizwDG4Zplu7/gtJ5MT6UANJm1zdOs4EwZqz6uP
	/K5A==
X-Gm-Message-State: AOUpUlGcQgbuPFkTE+XzMZ4Hzq+9LqJbD9AfgAzqPgtcQN6nx4OWwVvR
	c+Eo+g+SYvGlMOAyqLSKItevIfT0
X-Google-Smtp-Source: AAOMgpcy8l+PedYSmk6rav3lfhF1AowwxDSUNHati0tMAj19Tz+KYUDGRC7FshfpkGXpF+eby1NbrQ==
X-Received: by 2002:a1c:1fc6:: with SMTP id
	f189-v6mr2060815wmf.12.1533039323551; 
	Tue, 31 Jul 2018 05:15:23 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m13-v6sm20202323wru.93.2018.07.31.05.15.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 31 Jul 2018 05:15:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2018 12:15:25 +0000
Message-Id: <20180731121525.29477-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][meta-python][PATCH] python-{m2crypto, protobuf, slip-dbus}, lio-utils: add CLEANBROKEN
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2018 12:15:23 -0000

* these are failing after distutils started calling clean in:
  http://git.openembedded.org/openembedded-core/commit/?id=57414f4a1c549e6faaa110e6e95ff601b05b7361
  http://git.openembedded.org/openembedded-core/commit/?id=9d556092fcc6f04c487afd126d52935bac133165

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb            | 4 ++++
 meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb | 4 ++++
 meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb  | 3 +++
 meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb | 4 ++++
 4 files changed, 15 insertions(+)

diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
index 3a6319c314..d9780cfb4c 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -60,3 +60,7 @@ RDEPENDS_${PN} += "python-stringold python-subprocess python-shell \
     bash"
 
 FILES_${PN} += "${sbindir}/* /etc/init.d/* /etc/target/*"
+
+# http://errors.yoctoproject.org/Errors/Details/184712/
+# python-native/python: can't open file 'setup.py': [Errno 2] No such file or directory
+CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
index 272c76ca17..899a361bd8 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
@@ -48,3 +48,7 @@ do_compile_prepend() {
 }
 
 BBCLASSEXTEND = "native"
+
+# http://errors.yoctoproject.org/Errors/Details/184714/
+# SWIG/_m2crypto.i:10: Error: Unable to find 'gcc_macros.h'
+CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb b/meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb
index dc0823fd23..dddc9bbb58 100644
--- a/meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb
@@ -1,3 +1,6 @@
 inherit setuptools
 require python-protobuf.inc
 
+# http://errors.yoctoproject.org/Errors/Details/184715/
+# Can't find required file: ../src/google/protobuf/descriptor.proto
+CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb
index 8081416ee4..dc587e761e 100644
--- a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb
@@ -25,3 +25,7 @@ SRC_URI[sha256sum] = "bc897f1ab6f5b4989f85548799aaeb84fde67bbba18e40341bfe1d7885
 do_compile_prepend() {
     sed -e 's/@VERSION@/${PV}/g' setup.py.in > setup.py
 }
+
+# http://errors.yoctoproject.org/Errors/Details/184713/
+# python-native/python: can't open file 'setup.py': [Errno 2] No such file or directory
+CLEANBROKEN = "1"
-- 
2.17.1


