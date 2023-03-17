Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE06C76196
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 07:25:57 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.13816.1679037953449152855
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Mar 2023 00:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NbUosrlX;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id eh3so16763002edb.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 00:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679037951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfdSTR/cJONzajWWmd7UxXy3250d4quGi+9PkGlrPvw=;
        b=NbUosrlXocrsqQJ598WPJhDKd1BbMRJBC6Ju83zq1f+IFSu6bFJKdjFkK6Pike9OHj
         NqXvfXBnSxzG63Bek8aKJiMlNcAr12zjwYHORzRQqRLMmaXaxiVZ4c2n0deNrhTzCti5
         fysQb3IWrOjfvp+hH9PnfT9qujLdZlfCLteftitdw2H5HwEpXD70xx8fcvFy26z7VA7e
         VtQ/Pyldmj9gcuegF3s9tpNkeBcaUL3gUQc3+558gMxPH3aeT86EygVwZLsLDJWU2wtP
         u3HWy+eGwpQICu7xoi/RyPzq1Y8hs9arPfTbFcStZBpsuVitvfmJXkOoc6SXR8/lnMcz
         D5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679037951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfdSTR/cJONzajWWmd7UxXy3250d4quGi+9PkGlrPvw=;
        b=qj0WIgI1GcpyNB3dESTGVaOKWrvzkjc3xp1tTH0c51tei12gWJNpoHzaAEd9Z3ziT2
         UC4sVG4hjm3bgsiWRmApkZgD2uguse/pKkenNqds6FPvWdCl/UJBdr/lLaRNsXci2xkU
         A7Gq1XEJx7FTr9RYDqasg5+H4vJ2QqtZov3o0I+0WliC+1JFlb5mm0LDv4UHdLolyiSM
         uATrQAfSig6oYd5kevLpW0Jyl6Q39jLnCASKADEK6aEXT94laAJu+No42/ftT+xhraNo
         4oxu/SPSuPpCdzFGkQULPrbkQE/Ms6Wk2Ly4CaIKPRJj3xT4VBkhLvwqPyElH/C/NlKw
         /aeg==
X-Gm-Message-State: AO0yUKX1Kt8/lvj0kQUbddTLs4k9+Wld8QlNM+YRFy6q13Mvll/kSVjO
	ZGOD4uG7FextKQpHpNUYmYuN/966sUa7Ig==
X-Google-Smtp-Source: AK7set9WefziNAHw8X1I147zMJ2Mt6oXGrs8iCWxYaKg4ENDc/Et+ZCC1D+p4rijarlmbIji+cx9Jw==
X-Received: by 2002:a17:906:b6c4:b0:880:a42d:dfb4 with SMTP id ec4-20020a170906b6c400b00880a42ddfb4mr12066987ejb.16.1679037951555;
        Fri, 17 Mar 2023 00:25:51 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id zc14-20020a170906988e00b00927f6c799e6sm621864ejb.132.2023.03.17.00.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 00:25:51 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v2 2/4] python3-patchelf: New recipe
Date: Fri, 17 Mar 2023 08:25:45 +0100
Message-Id: <20230317072547.1031123-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317072547.1031123-1-zboszor@gmail.com>
References: <20230317072547.1031123-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 07:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101587

Dummy module to indicate the presence of patchelf.
Used by python3-meson-python.

The CMakeLists.txt file is a crippled copy from this patchelf
python module's sources, removing almost everything, and
adding a dummy install target, so do_install() doesn't fail.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-patchelf/CMakeLists.txt    |  7 +++++
 .../python/python3-patchelf/patchelf.patch    | 11 +++++++
 .../python/python3-patchelf_0.17.2.1.bb       | 31 +++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-patchelf/CMakeLists.txt
 create mode 100644 meta-python/recipes-devtools/python/python3-patchelf/patchelf.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-patchelf_0.17.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-patchelf/CMakeLists.txt b/meta-python/recipes-devtools/python/python3-patchelf/CMakeLists.txt
new file mode 100644
index 000000000..335bb503f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-patchelf/CMakeLists.txt
@@ -0,0 +1,7 @@
+cmake_minimum_required(VERSION 3.6)
+
+project(PatchelfPythonDistributions)
+
+install(CODE "
+ message(STATUS \"Install patchelf project\")
+")
diff --git a/meta-python/recipes-devtools/python/python3-patchelf/patchelf.patch b/meta-python/recipes-devtools/python/python3-patchelf/patchelf.patch
new file mode 100644
index 000000000..96dbf2180
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-patchelf/patchelf.patch
@@ -0,0 +1,11 @@
+--- patchelf-0.17.2.1/setup.py.old	2023-03-13 10:12:55.951514413 +0100
++++ patchelf-0.17.2.1/setup.py	2023-03-13 10:13:18.877751074 +0100
+@@ -95,8 +95,6 @@
+     version=get_version(),
+     cmdclass=cmdclass,
+ 
+-    scripts=["bin/patchelf"],
+-
+     url="https://github.com/NixOS/patchelf",
+     project_urls={
+         "Source Code": "https://github.com/mayeut/patchelf-pypi",
diff --git a/meta-python/recipes-devtools/python/python3-patchelf_0.17.2.1.bb b/meta-python/recipes-devtools/python/python3-patchelf_0.17.2.1.bb
new file mode 100644
index 000000000..630bd808a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-patchelf_0.17.2.1.bb
@@ -0,0 +1,31 @@
+# This is a dummy package needed by python3-meson-python
+SUMMARY = "A small utility to modify the dynamic linker and RPATH of ELF executables."
+LICENSE = "GPL-3.0-or-later & Apache-2.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
+    file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+"
+
+DEPENDS = "python3-scikit-build-native"
+
+PYPI_PACKAGE = "patchelf"
+PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "a6eb0dd452ce4127d0d5e1eb26515e39186fa609364274bc1b0b77539cfa7031"
+
+SRC_URI += " \
+    file://CMakeLists.txt \
+    file://patchelf.patch \
+"
+
+addtask do_patchbuild after do_patch before do_configure
+
+do_patchbuild () {
+    rm -f ${S}/CMakeLists.txt
+    cp ${WORKDIR}/CMakeLists.txt ${S}/
+}
+
+RDEPENDS:${PN} = "patchelf"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


