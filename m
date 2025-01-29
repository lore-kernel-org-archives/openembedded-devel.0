Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0405EC02193
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:41:06 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.10685.1738150847959045906
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DDk+Svm3;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so3717769f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 03:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738150846; x=1738755646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXdyGJDqB7CBbq67G0d7HFESa8asKWcDohRcDU+FeuQ=;
        b=DDk+Svm3+y5Ec4IQk4P9LYlNPCO0pCwGcIUuaCrYWO6Te8W+i8V2zbrnDE1IG9aF/6
         FIUbLuYo0myx6NKOxEvT+WosiBiUwRGQhqUgDJ1CUHzS+CJrZd8c1WlOVDIAQ3xISUFW
         DoN+/xd24m8Ch/WYx1DbEywiaLGjgIBxcSzwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738150846; x=1738755646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXdyGJDqB7CBbq67G0d7HFESa8asKWcDohRcDU+FeuQ=;
        b=PL37XohqTPUofwq6PQay0osV0BVju4QaFAvwL24FmbGDCvAdRgg8uOabDSZHtJtZiq
         dup2hN3c6K7BZ1DwyvaBVlwpAiRwWF7XZTcF2UnuKQD/yugK1nXjLVu+bP+n660KBqLZ
         q8R8NUGTnvdpH+KB7Lo9fZXp1ikkcemaxxI4P6rYlOE8+zk9tJR90OA/W3aL9QNVIBRN
         UYHeQZftOwS/TtX05UWyhEP63K9USvW9yDkjKIasbr3ldOFZMdTqFajuHMQcxQCTraDY
         c6BgbDLuEUxhA0tuk4kQ4NBDuve8XuwPrRGAuKlQLsUTBRtrFnzMzkgxK5eMd6eu2dw6
         jBng==
X-Gm-Message-State: AOJu0Yy48UMdSLWZT8D4NQ0HJ9D5vUkg9VkIDYS19HDQ7gWfXEoL8lcK
	bSIahSFxQhYkA2R4FL3FPE6pDIYiU6yaYEFueC+UvPIZPnr/7N1JcVgScDwNBiR79sH4cKQel+t
	v
X-Gm-Gg: ASbGnct1t9Qc5Hopf8Jtd3q9UwxkTQ/Wnd0FGENq1GaFqvczBPx0+b9wrODkbLRVn0O
	CnWtT4AzR4ww+a4B37oKc06DxOrjn0xBNQ10BJv+AgH0b6jhcLIhxEEYJXqmNhY7PLdMzhiSdwg
	hIb8plXDYy9JE149sPfSfdf0Pnizypp99kcGqUnbkFVCDMqFG21L1OJ1Es4lbLdE1H7m2+jSG7u
	SNBJbXnfSO9RDMC/LBM6WV2MGwCmg4JInyQEkZ7SkQsNY3tVDQV2STVm/vfztakh7mbxcpCyzNN
	3f+sOF1y25QNVC3g7S1fLK0uxu/2Nw==
X-Google-Smtp-Source: AGHT+IGZ11a+AIJ8UiEILRtoX3ASYqQRo1F2qyDxFjBn5tMsLvorL4/MRuSy1BSZtmcKOxFIyqCrHg==
X-Received: by 2002:a5d:59a6:0:b0:385:df43:223c with SMTP id ffacd0b85a97d-38c5194b798mr2456551f8f.13.1738150845993;
        Wed, 29 Jan 2025 03:40:45 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176449sm16982283f8f.11.2025.01.29.03.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:40:45 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-lief: Add recipe
Date: Wed, 29 Jan 2025 13:40:38 +0200
Message-Id: <20250129114039.3562870-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129114039.3562870-1-leon.anavi@konsulko.com>
References: <20250129114039.3562870-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 11:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115136

Add recipe to build the Python API of LIEF (Library to Instrument
Executable Formats). The purpose of this project is to provide a
cross-platform library to parse, modify and abstract ELF, PE and
MachO formats.

Changelog for LIEF release 0.16.2:

- Fix broken aarch64 Python wheel which is related to a toolchain
  issue

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...equirements.txt-Allow-newer-versions.patch | 39 +++++++++++++++++++
 ...api-python-config-default.toml-Debug.patch | 28 +++++++++++++
 .../python/python3-lief_0.16.2.bb             | 29 ++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-lief/0002-api-python-config-default.toml-Debug.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-lief_0.16.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch b/meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch
new file mode 100644
index 0000000000..e2d041dac7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch
@@ -0,0 +1,39 @@
+From d6686206658aadc74d21a29c781320e2e13fe8f3 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 27 Jan 2025 17:05:53 +0000
+Subject: [PATCH] build-requirements.txt: Allow newer versions
+
+Allowing building with newer version
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ api/python/build-requirements.txt | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/api/python/build-requirements.txt b/api/python/build-requirements.txt
+index 4c9004ca..fe0d1055 100644
+--- a/api/python/build-requirements.txt
++++ b/api/python/build-requirements.txt
+@@ -1,10 +1,10 @@
+-tomli==2.0.1
+-scikit-build-core==0.9.8
++tomli>=2.0.1
++scikit-build-core>=0.9.8
+ # For Ninja: msvc.msvc14_get_vc_env
+-setuptools==70.2.0
++setuptools>=70.2.0
+ # For the "env" feature
+-pydantic==2.8.2
++pydantic>=2.8.2
+ # Implicit from scikit-build-core
+-pathspec==0.12.1
+-build==1.2.1
+-wheel==0.43.0
++pathspec>=0.12.1
++build>=1.2.1
++wheel>=0.43.0
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-lief/0002-api-python-config-default.toml-Debug.patch b/meta-python/recipes-devtools/python/python3-lief/0002-api-python-config-default.toml-Debug.patch
new file mode 100644
index 0000000000..bc38a63726
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lief/0002-api-python-config-default.toml-Debug.patch
@@ -0,0 +1,28 @@
+From 064f361f113e1e4496f40dd0a075f89d21bad5a3 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Tue, 28 Jan 2025 12:25:31 +0000
+Subject: [PATCH] api/python/config-default.toml: Debug
+
+Fixes do_package: QA Issue: [already-stripped]
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ api/python/config-default.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/api/python/config-default.toml b/api/python/config-default.toml
+index 519bc046..49477864 100644
+--- a/api/python/config-default.toml
++++ b/api/python/config-default.toml
+@@ -1,5 +1,5 @@
+ [lief.build]
+-type          = "Release"
++type          = "Debug"
+ cache         = true
+ ninja         = true
+ parallel-jobs = 0
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb b/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb
new file mode 100644
index 0000000000..6cc6e7e5ae
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Library to instrument executable formats"
+DESCRIPTION = "LIEF: Library to Instrument Executable Formats"
+HOMEPAGE = "https://github.com/lief-project/LIEF"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9ab5db472ff936b441055522f5000547"
+SECTION = "libs"
+
+SRC_URI = " \
+    git://github.com/lief-project/LIEF.git;protocol=https;branch=main \
+    file://0001-build-requirements.txt-Allow-newer-versions.patch \
+    file://0002-api-python-config-default.toml-Debug.patch \
+"
+SRCREV = "d3ad812008fd286322b7085e84136e422b3afea4"
+
+S = "${WORKDIR}/git"
+PEP517_SOURCE_PATH = "${S}/api/python"
+
+inherit python_setuptools_build_meta
+
+DEPENDS += "\
+    python3-scikit-build-native \
+    python3-scikit-build-core-native \
+    python3-tomli-native \
+    python3-pydantic-native \
+    ninja-native \
+    ccache-native \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


