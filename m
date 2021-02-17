Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.945.1613599104346085531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 13:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TBlOjYpP;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id a24so57665plm.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 13:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5iH8zy5HjfMeDBxelrAOWgrC2bgSTmfvVWXHTUHeH4w=;
        b=TBlOjYpPYJ9bXflPfyJlaM3FuYmqhZae1CjfACQTEUKqkrUEF6EBGW7j3UsnmZKPSJ
         aXVqWyPJN5MulfhGFV2m4FB6gGO8F8ZuVovgU71gBWg7BmnubTHzrki06O0H7p2349pH
         d6O0llJ6IW93mGVp6t/ZMWRIqa2xynBIST6AdW8TchKWmzRaq0OYu9qOO08+WbEriIkR
         UUYHMotl3Jzn/FS+hyV2c5ayeJw/TjG+WpNvpcAr5G/GNY9QqOBg9VlA66Ju0hGl7+ak
         7ztWuHlOpaJ3agDnNQhlheUqhMMSe9VW5NsFsl0DlZ2AtGMjpx8fOpc2EKtaBqG869Ew
         rFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5iH8zy5HjfMeDBxelrAOWgrC2bgSTmfvVWXHTUHeH4w=;
        b=KIDSFF1LQQyao6z9DHNdXsXxQs0cBqZF7oiJhKZLjqtVkTsyIlw7qNgKssZqrKBmRy
         Ah6EtNuXGK+YFpHsPJvLS8hc8gDAj//8iWcW/h/L9THtAwugesjBYj4b+Bp1emWUhyyG
         9Y77VcOHPcMQYchcRc0BXADjWuIpi1fgJgyjP4zCNvep5LcoNbYYJyUx/THnFtwTsn1E
         EKkNQeOadVjKjYrgCoEVpVCr4WaVZyC8QOQaa/5BqL01GvaOPB6/YzXw7HIa9wZ/ADmq
         qBIOmMCcWKuI3TXQ6NXdm6sNIcX/hMBugL+UtotmBQsrXC7CwL+/mYie2ZJL11hCByAj
         Jc6g==
X-Gm-Message-State: AOAM531yHMvo3rVIh8sxDkLhj7D2dExdVGkoqE9FAL/xtALEHJku0QdR
	YVmXo/9Y0eGGPOhd19geBtXvoYOZhBjrUw==
X-Google-Smtp-Source: ABdhPJzuExl69bJqCk7PeLWR0bztiQbJFevpibwFaICBHpF+HN9zFwrnyUuDzG4p+YOe0LBzO1WdGQ==
X-Received: by 2002:a17:902:ab98:b029:e3:3add:e89d with SMTP id f24-20020a170902ab98b02900e33adde89dmr967749plr.64.1613599103589;
        Wed, 17 Feb 2021 13:58:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id q13sm3443474pfg.155.2021.02.17.13.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 13:58:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python-grpcio-tools: Upgrade to 1.35.0
Date: Wed, 17 Feb 2021 13:58:20 -0800
Message-Id: <20210217215820.3761256-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210217215820.3761256-1-raj.khem@gmail.com>
References: <20210217215820.3761256-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

merge inc file into bb as this is the only consumer now
Fix the compiler name logic to match OE, since our compiler name is not
a single word but a collection of words

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Do-not-mix-C-and-C-compiler-options.patch | 58 +++++++++++++++++++
 .../python/python3-grpcio-tools_1.14.1.bb     |  2 -
 ...ols.inc => python3-grpcio-tools_1.35.0.bb} |  7 ++-
 3 files changed, 62 insertions(+), 5 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
 rename meta-python/recipes-devtools/python/{python-grpcio-tools.inc => python3-grpcio-tools_1.35.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
new file mode 100644
index 0000000000..aef67b5748
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -0,0 +1,58 @@
+From 9b2f1d400db8b8d0045f5a58a748a2dc52b5c9ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 17 Feb 2021 13:38:55 -0800
+Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
+
+EXTRA_ENV_COMPILE_ARGS is used both with CC and CXX
+so using -std=c++11 or -std=gnu99 together will cause
+build time errors espcially with clang
+
+Keep '-std=c++11' to fix native build error
+with old gcc (such as gcc 5.4.0 on ubuntu 16.04), for clang
+we will remove them through GRPC_PYTHON_CFLAGS at do_compile
+in bb recipe.
+
+While export CC="gcc ", cc_args is None, it will
+cause subprocess.Popen always return 1. On centos 8, if you don't
+install package libatomic, there will be a native build error
+`cannot find /usr/lib64/libatomic.so.1.2.0'.
+
+Add no harm '-g' to cc_args if cc_args is empty.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index a316038..70aa174 100644
+--- a/setup.py
++++ b/setup.py
+@@ -76,8 +76,11 @@ def check_linker_need_libatomic():
+     """Test if linker on system needs libatomic."""
+     code_test = (b'#include <atomic>\n' +
+                  b'int main() { return std::atomic<int64_t>{}; }')
+-    cxx = os.environ.get('CXX', 'c++')
+-    cpp_test = subprocess.Popen([cxx, '-x', 'c++', '-std=c++11', '-'],
++    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
++    if not cxx_args:
++      cxx_args = "-g"
++
++    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++11', '-'],
+                                 stdin=PIPE,
+                                 stdout=PIPE,
+                                 stderr=PIPE)
+@@ -87,7 +90,7 @@ def check_linker_need_libatomic():
+     # Double-check to see if -latomic actually can solve the problem.
+     # https://github.com/grpc/grpc/issues/22491
+     cpp_test = subprocess.Popen(
+-        [cxx, '-x', 'c++', '-std=c++11', '-latomic', '-'],
++        [cxx, cxx_args, '-x', 'c++', '-std=c++11', '-latomic', '-'],
+         stdin=PIPE,
+         stdout=PIPE,
+         stderr=PIPE)
+-- 
+2.30.1
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
deleted file mode 100644
index 2da1a4df03..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-grpcio-tools.inc
diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python-grpcio-tools.inc
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
index 6675f904c1..0063b4b0ef 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools.inc
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
@@ -8,9 +8,10 @@ RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
 
-inherit pypi
+inherit pypi setuptools3
 
-SRC_URI[md5sum] = "b2fabfb54c7824c1e49a02de2aa6628e"
-SRC_URI[sha256sum] = "4ce5aa660d7884f23aac1eafa93b97a4c3e2b512edff871e91fdb6ee86ebd5ea"
+SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
+
+SRC_URI[sha256sum] = "9e2a41cba9c5a20ae299d0fdd377fe231434fa04cbfbfb3807293c6ec10b03cf"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.1

