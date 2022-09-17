Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24F7ECAAA1
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 02:12:46 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.2009.1663380761622059876
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 19:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qkv4v9dz;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 78so21886083pgb.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 19:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=e2R5nMmS+EfOX7k8hHJ44f84YGSO+lcBATGtK8qCgZc=;
        b=Qkv4v9dzqRw5isk0ixAtOYRfvmG3GSHVe8fz6uTXN5WdIPidXdwC6AfAlveUk4cX8Z
         G3JpfE93Ofo7QwStSbD6341F7rokUz5lXS3crKfJHyz/UuA1pIpBQoK9L9OiLXAPxRLL
         w1nT8YpgTEPUesD3wG4xUz/gPiM3t1eUJbLtDIBncvIQbfbrYRQw2V8ns0PjEhKaghdf
         VtsWR5hbsfMBGEm6KBX4H1YlUxBjmg1A15Q09gaNA9gcH4DY1lH9G/o0ZQA6NsAVAQcr
         Jr5IKnHTA/t3UsI7cNBYGR86VukhMLQonUYIPubqQFSngb+DJHk0/B45rXXk/dUM0W5Z
         8kaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=e2R5nMmS+EfOX7k8hHJ44f84YGSO+lcBATGtK8qCgZc=;
        b=o0ca79t5ECu5NRVrknc3D3mAn3SPxgNmF1uyfb+gVt4CcwwKTXTK7E3A30BKddd/p6
         AJ8rLRiLj2lP94GaDJSMBezC9RKC1mclOrwYm4UMxBiUbXwWCQD+S0Z5QXJpwf9IjJ2O
         Gu/raIDGB0n3VY8ucflioonLPkuYyc8bUstkMnLfvxTjPpgGkiC7rj1coL6EY4rAQR2k
         j/qMteebADsq4/iaAbVDL6npFYZv1RM4u0d7QHXhJhY5yOday+hZMvk6dxWUgeYAyPGR
         1w5IMFySvLwtbGc7mh0KVJMBESkLv27o+eL3v3IDSywCgYyuQMG1AK9r4u/3yeVDFE2M
         ZkgQ==
X-Gm-Message-State: ACrzQf3k7Mo7KncquQpo9mSUqBfO+LiWHYuNuqTsHOuxkmaFhV3HlfMq
	qMmWuL9XuEbXls5RofdXlwxAwNHx+ileYQ==
X-Google-Smtp-Source: 
 AMsMyM4tSaZpqgPoC33idJuCsn8QXYb/95UB20UpnzjuI0py7Ymc1tB09Eugq6RMlRUp7xMgPjRH0Q==
X-Received: by 2002:a65:5501:0:b0:438:ebbe:4a6c with SMTP id
 f1-20020a655501000000b00438ebbe4a6cmr6899700pgr.384.1663380760842;
        Fri, 16 Sep 2022 19:12:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::fe04])
        by smtp.gmail.com with ESMTPSA id
 17-20020a17090a035100b002001c9bf22esm2173805pjf.8.2022.09.16.19.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 19:12:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-grpcio-tools: Disable clang's musttail
 attribute on mips
Date: Fri, 16 Sep 2022 19:12:38 -0700
Message-Id: <20220917021238.2777991-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Sep 2022 02:12:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98843

mips backend is not able to handle it in clang-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...f-Disable-musttail-attribute-on-mips.patch | 30 +++++++++++++++++++
 .../python/python3-grpcio-tools_1.48.1.bb     |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
new file mode 100644
index 0000000000..d19d1eee4c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
@@ -0,0 +1,30 @@
+From 64d737318656286f69ddc5ad654072785ddcbbed Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Sep 2022 19:09:15 -0700
+Subject: [PATCH] protobuf: Disable musttail attribute on mips
+
+See https://github.com/llvm/llvm-project/issues/57795
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/protobuf/src/google/protobuf/port_def.inc | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/third_party/protobuf/src/google/protobuf/port_def.inc b/third_party/protobuf/src/google/protobuf/port_def.inc
+index 37632cf..3c3c1e4 100644
+--- a/third_party/protobuf/src/google/protobuf/port_def.inc
++++ b/third_party/protobuf/src/google/protobuf/port_def.inc
+@@ -230,7 +230,8 @@
+ #error PROTOBUF_TAILCALL was previously defined
+ #endif
+ #if __has_cpp_attribute(clang::musttail) && \
+-  !defined(__arm__) && !defined(_ARCH_PPC) && !defined(__wasm__)
++  !defined(__arm__) && !defined(_ARCH_PPC) && !defined(__wasm__) && \
++  !defined(__mips__)
+ #  ifndef PROTO2_OPENSOURCE
+ // Compilation fails on ARM32: b/195943306
+ // Compilation fails on powerpc64le: b/187985113
+-- 
+2.37.3
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb
index d295429ae3..002211a8c1 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb
@@ -9,7 +9,9 @@ inherit pypi setuptools3
 
 DEPENDS += "${PYTHON_PN}-grpcio"
 
-SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
+SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
+            file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
+            "
 SRC_URI[sha256sum] = "1178f2ea531f80cc2027ec64728df6ffc8e98cf1df61652a496eafd612127183"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
-- 
2.37.3


