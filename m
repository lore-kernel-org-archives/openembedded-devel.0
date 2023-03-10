Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7C5C6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 13:39:19 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.19117.1678455550866667601
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 05:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hHQ6dcbY;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id s11so20529993edy.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 05:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678455549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaKt+z7tybttKAw8kIF38Y5Vla/v06MNyNCW5h3/uuk=;
        b=hHQ6dcbYZ1KKcKkzSf+GFsrf9fNWEibRrZxvNV2uDXPPUaTxJ0sEYorqG0zxmVecz8
         mKDbXRVwF2sHSupNk1ZbJO3rTXdM3e135AYt7fjUAszC5yFlmzsp1ePsYKy7cA7JfLGQ
         jEBoFFWVhiK4Go3cAgDfWT3qmLTNWJZ927+93OJahHqRJJ43pl7IdMHwgX+jl9hzkRSN
         wbhGOU69OECuEK4ipVt7FIkK0uIp33WVXP3OEyE68GPt6vTprjDclfGcSeYoDd5Zt+Df
         rkEMjnzH6sJB60kpATsfdl+JKYMYHPEz9vPqtIw9cfHE52xQrypTMvlsa2hMSkPDzboG
         WbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678455549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaKt+z7tybttKAw8kIF38Y5Vla/v06MNyNCW5h3/uuk=;
        b=UAgD6aNzH+LpPh/Gx04c1Q9SahOijw+9/gMY2EJzgxq+8FK0vbc9D9ChXvMdNvgISx
         +xqMP7WGSlw7nSMb0G6yLXmkKKlpNFz0zk5VXnZDMuiWRPDjVqfGalYkrOCnn37WJSb3
         wMiqZurbtaUS94qSzz2iDMTTBXf3l8aPT/OXsl/2PP7ia/nFAhU1kbJYWFRiJdwhmcTo
         fy1YjqV0YTqh2WAuPYbmYlm/T3adq/hSIVJhAMG9KU0qlknw8IT+tmgs2HOiIaswWAfT
         c5WqedCgWHvHAT3ToDetU9YjwZJBokI6NxF0ZpKhkMqiJ2vbUPEAEe1gShvdKp35QQyo
         z+5Q==
X-Gm-Message-State: AO0yUKUM/twcSReCav9QMQTDvoqUrbdu3Sod2phiXu9z8KFv+1yckrTy
	p/4crwnxBLPncWhZ7M9d/IXBxHWBtpvbGA==
X-Google-Smtp-Source: AK7set9KdyRk30RgtwDheX6fC+I1r3nTjT75hZ8wIQ5B1YtI8SvhbID89LQ2ZCRbjeJvvH7J3PP8Xg==
X-Received: by 2002:a05:6402:2d3:b0:4c3:15f0:1100 with SMTP id b19-20020a05640202d300b004c315f01100mr24221634edx.29.1678455548890;
        Fri, 10 Mar 2023 05:39:08 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id p25-20020a50cd99000000b004c041723816sm20562edi.89.2023.03.10.05.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:39:08 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-cmake: New recipe
Date: Fri, 10 Mar 2023 14:39:00 +0100
Message-Id: <20230310133901.4144306-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310133901.4144306-1-zboszor@gmail.com>
References: <20230310133901.4144306-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 13:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101487

Some python modules rely on "import cmake".

Only build and ship the python parts, and don't download and
build cmake from sources. Use the already built cmake instead.

The CMakeLists.txt file is a crippled copy from this cmake
python module's sources, removing almost everything, and
adding a dummy install target, so do_install() doesn't fail.

The python code is patched so cmake is used from PATH.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-cmake/CMakeLists.txt       | 11 ++++++
 .../python3-cmake/run-cmake-from-path.patch   | 11 ++++++
 .../python/python3-cmake_3.25.2.bb            | 37 +++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cmake/CMakeLists.txt
 create mode 100644 meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-cmake/CMakeLists.txt b/meta-python/recipes-devtools/python/python3-cmake/CMakeLists.txt
new file mode 100644
index 000000000..8ba81970f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cmake/CMakeLists.txt
@@ -0,0 +1,11 @@
+cmake_minimum_required(VERSION 3.6)
+
+#
+# For more details, see docs/building.rst
+#
+
+project(CMakePythonDistributions NONE)
+
+install(CODE "
+  message(STATUS \"Install CMake project\")
+")
diff --git a/meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch b/meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
new file mode 100644
index 000000000..5c38fadce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
@@ -0,0 +1,11 @@
+--- cmake-3.25.2/src/cmake/__init__.py.old	2023-03-10 09:40:43.582315753 +0100
++++ cmake-3.25.2/src/cmake/__init__.py	2023-03-10 09:41:38.030874047 +0100
+@@ -36,7 +36,7 @@
+ 
+ 
+ def _program(name, args):
+-    return subprocess.call([os.path.join(CMAKE_BIN_DIR, name)] + args, close_fds=False)
++    return subprocess.call([name] + args, close_fds=False)
+ 
+ 
+ def cmake():
diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb b/meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb
new file mode 100644
index 000000000..d0e11f9a6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb
@@ -0,0 +1,37 @@
+SUMMARY = "CMake is an open-source, cross-platform family of tools designed to build, test and package software"
+LICENSE = "BSD-3-Clause & Apache-2.0"
+LIC_FILES_CHKSUM = " \
+	file://LICENSE_BSD_3;md5=9134cb61aebbdd79dd826ccb9ae6afcd \
+	file://LICENSE_Apache_20;md5=19cbd64715b51267a47bf3750cc6a8a5 \
+"
+
+DEPENDS = "ninja-native cmake-native python3-scikit-build-native"
+
+PYPI_PACKAGE = "cmake"
+PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "bcf9f0369743278ec26961542b31ed1610e6f4cfc20c00a3f1c61985abb3b0d2"
+
+SRC_URI += " \
+	file://CMakeLists.txt \
+	file://run-cmake-from-path.patch \
+"
+
+addtask do_patchbuild after do_patch before do_configure
+
+do_patchbuild () {
+	rm -f ${S}/CMakeLists.txt
+	cp ${WORKDIR}/CMakeLists.txt ${S}/
+}
+
+do_install:append () {
+	rm -rf ${D}${bindir}
+}
+
+RDEPENDS:${PN} = " \
+	cmake \
+	python3-scikit-build \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


