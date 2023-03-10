Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D64C6FD1E
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 13:46:49 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.19276.1678456002340195404
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 05:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WnUvl2ce;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id cy23so20518886edb.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 05:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678456000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaKt+z7tybttKAw8kIF38Y5Vla/v06MNyNCW5h3/uuk=;
        b=WnUvl2ce3tXcg222/8tdLiOn+6g1e6p7MopeUoioXOUx1uLt9JBk+IMhlwkhBrq2EO
         VRQugXhSYMNd8UX2ri/awWugNsxAaW+pRHbbBoCGO0szvFU5cMWqcwOspcsAu1J/Qgnk
         3OQvkPPxaN0trU75juG3XuW89pCghxvLDnfJQ+/dSKngcMrXx1KD9a5G1iJKunPRFymy
         eFkh2wrJ8q0SQBUJYNrQD9XHKkb96p08n0BzC2C+xX0DGnYkxEmSdAOmvsDF4GLpeNSk
         cD52lPRS5H7fgEUjLd+FM0DaRfqJT3YO4Y4b142wzz+IJCKKyCI1U0OA6FQJQ9Ene9zP
         k0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678456000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaKt+z7tybttKAw8kIF38Y5Vla/v06MNyNCW5h3/uuk=;
        b=VhNZ6pHd6Vjh5qPrQ8hpRuXPZNW5W16CF7PAne3qopCfbCjaz4GsCGEZ3uXcd+Nt5B
         5aHXR0KSGQnf+00z7bjalBDCHNZqk2ISZ/NwlPx59B7goZrEEh7aSZydcV1xd5K4VPEP
         qDdTwv8Zf4zSr4ECDd57JChubTHXlAAhqdSlLn6ESVJbF6Z78ikr+mEJyVDCQhE68Gbu
         ymGAfZPZY6AhYKAfckFbI3FnRS24dF/pM4YcN8bRHaajEKr+XPjqRzEm1m4x6nzSn0lT
         yfgRZg6aWIxL6Ziusr5XKrk0wtZTMKJCUdWMXMYQTvzTdHIZx7AH+jziKxj5xduQqH7n
         ylWQ==
X-Gm-Message-State: AO0yUKX3u6OGjSL18G4NX+CuvZKdzjV8hLCf8LtUXH29CbTtLFGIJaP4
	VtUJJOjqZ/g/0/MU/WyP+/CWYBYlFciHDg==
X-Google-Smtp-Source: AK7set8d6wTDUJqcF4AimJ6ZxNOv8pqRVWShnheK4XoCGJPZaoCRnd/2sIouqvBv5FDsqhK4U9BQZQ==
X-Received: by 2002:a05:6402:188:b0:4a3:43c1:8430 with SMTP id r8-20020a056402018800b004a343c18430mr1760697edv.4.1678456000518;
        Fri, 10 Mar 2023 05:46:40 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id o26-20020a1709062e9a00b008b17fe9ac6csm980198eji.178.2023.03.10.05.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:46:40 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v2 2/3] python3-cmake: New recipe
Date: Fri, 10 Mar 2023 14:46:36 +0100
Message-Id: <20230310134637.108312-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310134637.108312-1-zboszor@gmail.com>
References: <20230310134637.108312-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 13:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101490

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


