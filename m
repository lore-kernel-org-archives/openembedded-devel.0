Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C80BC6FD1E
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 13:39:19 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.19124.1678455553029406723
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 05:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K+JILTjM;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id a25so20727732edb.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 05:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678455551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=892xQiXIHyGl7fnt1P6uNmJqdGQ9J+piZbcxNFOh/Hw=;
        b=K+JILTjMpVdDAfifrh+IWDIIOk9+ChvQ9atrDDED/wxnzv0zHlVolIsBTXRHcG2+eU
         oZ2PgZgE+POIEu1EnIfEU94UlcIso4DhuZ5rZ6i5ZKtWKrerEEkH+hNjKvQ6VKeYxeEa
         M+onL3JO8EiT85hbX9qfGv4TfntrRcop82y/wv/ir+sPBHRmfdCbfmqqAPftajUd8bZP
         4rt5Fs+30NqxXgPULhcjuPFOfr2moymUBQM+4nRRK+TT0VVPrmYQZwtcLWwuykfontfY
         I9amSp61z3/mp8wEKwIW2HGaraFo68PS2S8PlPM2L6kfRHKRBQjMvVmot53QlGf8cBPg
         UhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678455551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=892xQiXIHyGl7fnt1P6uNmJqdGQ9J+piZbcxNFOh/Hw=;
        b=E9ncm6YgvBK73vtnWbb1EUiaEq/L1kO7nYYlt9fvR35NLajPFIErGQPskcPGnttTEy
         2mvolKPJYzO7PtzdHiOuQLB6/49nn+5cXKXSE8+7whYZ1JJqtkigd05ExXa/my4P+D3Z
         My+++LbSokSEajo7DyUAkUbGHPP6+42LqRE0eWRSbQ/xr/ObqN0ws10dJY+xrntc5Hz0
         HFMR3W6UCSirj7sA7yqfawRiYdn0oPsMaPPQt7b6IDHeaF5T9uy2182dhExOQYdKc2ki
         jG0ZbV1wfsVWYIPftfwGvz4/H4O+po1cKS4ONtbJo1qAbksl/GXtOyvu/kCZl/ORtVdW
         mASg==
X-Gm-Message-State: AO0yUKVzAsZY5iarHrLlw08qsbgCI391nR4ihPD2fw1BDd/zeRxPsZ4N
	E1b4kLUFz8W3eXlJZBZ+ClUX3vOInwe82w==
X-Google-Smtp-Source: AK7set+fGiDWVRQFlpG0GT4/dSyybgqidZCG7pyCiU/ysK85Y0pWM9A6W3yHMTKOOoyM1Zn33FaxvQ==
X-Received: by 2002:a17:906:b10d:b0:89f:1a76:e2dc with SMTP id u13-20020a170906b10d00b0089f1a76e2dcmr24165932ejy.0.1678455549497;
        Fri, 10 Mar 2023 05:39:09 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id p25-20020a50cd99000000b004c041723816sm20562edi.89.2023.03.10.05.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:39:09 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-ninja: New recipe
Date: Fri, 10 Mar 2023 14:39:01 +0100
Message-Id: <20230310133901.4144306-3-zboszor@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101488

Some python modules rely on "import ninja".

Only build and ship the python parts, and don't download and
build ninja from sources. Use the already built ninja instead.

The CMakeLists.txt file is a crippled copy from this ninja
python module's sources, removing almost everything, and
adding a dummy install target, so do_install() doesn't fail.

The python code is patched so ninja is used from PATH.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-ninja/CMakeLists.txt       |  9 +++++
 .../python3-ninja/run-ninja-from-path.patch   | 11 ++++++
 .../python/python3-ninja_1.11.1.bb            | 34 +++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ninja/CMakeLists.txt
 create mode 100644 meta-python/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-ninja/CMakeLists.txt b/meta-python/recipes-devtools/python/python3-ninja/CMakeLists.txt
new file mode 100644
index 000000000..04fa451e7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ninja/CMakeLists.txt
@@ -0,0 +1,9 @@
+cmake_minimum_required(VERSION 3.15)
+
+project(NinjaPythonDistributions)
+
+set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_MODULE_PATH})
+
+install(CODE "
+ message(STATUS \"Install ninja project\")
+")
diff --git a/meta-python/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch b/meta-python/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch
new file mode 100644
index 000000000..26bd03737
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch
@@ -0,0 +1,11 @@
+--- ninja-1.11.1/src/ninja/__init__.py.old	2022-11-05 09:49:23.000000000 +0100
++++ ninja-1.11.1/src/ninja/__init__.py	2023-03-10 09:45:13.452082888 +0100
+@@ -44,7 +44,7 @@
+ 
+ 
+ def _program(name, args):
+-    return subprocess.call([os.path.join(BIN_DIR, name)] + args, close_fds=False)
++    return subprocess.call([name] + args, close_fds=False)
+ 
+ 
+ def ninja():
diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
new file mode 100644
index 000000000..635fd076a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Ninja is a small build system with a focus on speed"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE_Apache_20;md5=19cbd64715b51267a47bf3750cc6a8a5"
+
+DEPENDS = "ninja-native cmake-native python3-scikit-build-native"
+
+PYPI_PACKAGE = "ninja"
+PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "c833a47d39b2d1eee3f9ca886fa1581efd5be6068b82734ac229961ee8748f90"
+
+SRC_URI += " \
+	file://CMakeLists.txt \
+	file://run-ninja-from-path.patch \
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
+	ninja \
+	python3-scikit-build \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


