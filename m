Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABF6C46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 19:06:27 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.190573.1703963177212629383
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 11:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mpv2hoY8;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso6073462a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 11:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703963176; x=1704567976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iv9L4FH4w3276SxLe3NxiXN/R71YWxIH4kAJppiA/P8=;
        b=Mpv2hoY8oAG3cs4iApn+vqt9Hb1USUFbfH3K5QKNS/zmZwmyN3cXt/rcIhgiUR6/er
         L/r7ckoJ8AAsKsMuVTWiDuGq3QwO3ZOfCRTUnxnJUawzUfEYEM7cT3zX1Wk7qLSUeW3o
         Th0rSRlaN26emAuJ1kHr91qvypHpH8n+5ezxUra+KlETc6U49T5znvgA6uLpBlCEUI0Z
         c+7oBjTLWffHbN12BAibc9HFi3akOA0iX0UA4dxHg9SuHm5d8d5+ygepPgcI5CNAxCbl
         fwoBxMpOuhVyzeqXL7fgcVAmDLI41qRO9TBTfL9Q6AaP6nRcECJGhVzqTobhKiN0FhVQ
         v3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703963176; x=1704567976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iv9L4FH4w3276SxLe3NxiXN/R71YWxIH4kAJppiA/P8=;
        b=a0Vq2GaJUDW1QUmUH+iPwdAz9wIMkZ9ea9iG+Yp5tMF03DU6m28wEhtNIKCOOZp2EB
         tinPHg5Ky6iqGeraMF5ytK7E2IMAPvUQpsBTL+EzSJyxYX3X93skDB3/YjTDn+M+SzlG
         /7cLjaINIdPy3glJ38eN5AO5ymlyPBihTkHiSOuAMe/eYcxUvKm0gEPLNbjTaNkMMPkN
         TkxekSWKs+KD7Jdd1cp7B1gu38QQBd16eOlxURCftDcWtYhPtSofFyCfI7U3lYC5pa1Q
         iYaIsv2VttlJ3SrcX6UGcSUKw8b1QP5Xd+F6HX901CBFxmdwC4NEFue0uQ0243sP93jo
         04zQ==
X-Gm-Message-State: AOJu0YxOYAztpkPm1Emun5J6AlPZk4hjgAdVi9EXbtXDDwVgMTlS8uHb
	qpWwiNcbg39r66x9YOSLQSEGmAU4KWc=
X-Google-Smtp-Source: AGHT+IHp8/4H+BOIL7I+utqmwtM81Ubo0XCdVmtZEQtM1CSNNLaXVsGII54GDhTkX9JNgUtRLIEPfg==
X-Received: by 2002:a17:902:ef93:b0:1d3:fa43:6a08 with SMTP id iz19-20020a170902ef9300b001d3fa436a08mr14339588plb.44.1703963175968;
        Sat, 30 Dec 2023 11:06:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id l7-20020a17090270c700b001d49608e3dfsm4311066plt.50.2023.12.30.11.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 11:06:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] libcamera: Fix build with python 3.12
Date: Sat, 30 Dec 2023 11:06:11 -0800
Message-ID: <20231230190612.382560-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 19:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107912

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-mojom-Drop-using-imp-module.patch    | 176 ++++++++++++++++++
 .../libcamera/libcamera_0.1.0.bb              |   1 +
 2 files changed, 177 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-mojom-Drop-using-imp-module.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-mojom-Drop-using-imp-module.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-mojom-Drop-using-imp-module.patch
new file mode 100644
index 0000000000..b07a790596
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-mojom-Drop-using-imp-module.patch
@@ -0,0 +1,176 @@
+From 23a9bbb9ab380344c5daf5bc0109fab249e41afd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Dec 2023 10:55:44 -0800
+Subject: [PATCH] mojom: Drop using imp module.
+
+This module is gone in python 3.12 onwards, in most places it is unused
+so remove from those places, in some places where its still is needed
+replace it with importlib.util
+
+Fixes [1]
+
+[1] https://bugs.libcamera.org/show_bug.cgi?id=206
+
+Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2023-December/039986.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py        | 1 -
+ .../ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py | 1 -
+ .../tools/mojom/mojom/generate/generator_unittest.py       | 7 ++-----
+ .../tools/mojom/mojom/generate/translate_unittest.py       | 1 -
+ .../mojo/public/tools/mojom/mojom/parse/ast_unittest.py    | 1 -
+ .../mojom/mojom/parse/conditional_features_unittest.py     | 7 ++-----
+ utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py     | 1 -
+ .../mojo/public/tools/mojom/mojom/parse/lexer_unittest.py  | 6 ++----
+ .../mojo/public/tools/mojom/mojom/parse/parser_unittest.py | 1 -
+ 9 files changed, 6 insertions(+), 20 deletions(-)
+
+diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py b/utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py
+index bf626f54..e1c823da 100644
+--- a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py
++++ b/utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py
+@@ -3,7 +3,6 @@
+ # found in the LICENSE file.
+ 
+ import errno
+-import imp
+ import os.path
+ import sys
+ 
+diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py
+index ff5753a2..e754151f 100644
+--- a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py
++++ b/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py
+@@ -2,7 +2,6 @@
+ # Use of this source code is governed by a BSD-style license that can be
+ # found in the LICENSE file.
+ 
+-import imp
+ import os.path
+ import shutil
+ import sys
+diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_unittest.py
+index 32c884a8..6cae6092 100644
+--- a/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_unittest.py
++++ b/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_unittest.py
+@@ -2,7 +2,7 @@
+ # Use of this source code is governed by a BSD-style license that can be
+ # found in the LICENSE file.
+ 
+-import imp
++import importlib.util
+ import os.path
+ import sys
+ import unittest
+@@ -18,10 +18,7 @@ def _GetDirAbove(dirname):
+     if tail == dirname:
+       return path
+ 
+-
+-try:
+-  imp.find_module("mojom")
+-except ImportError:
++if importlib.util.find_spec("mojom") is None:
+   sys.path.append(os.path.join(_GetDirAbove("pylib"), "pylib"))
+ from mojom.generate import generator
+ 
+diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_unittest.py
+index 19905c8a..09724d88 100644
+--- a/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_unittest.py
++++ b/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_unittest.py
+@@ -2,7 +2,6 @@
+ # Use of this source code is governed by a BSD-style license that can be
+ # found in the LICENSE file.
+ 
+-import imp
+ import os.path
+ import sys
+ import unittest
+diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.py
+index 62798631..4ab51033 100644
+--- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.py
++++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.py
+@@ -2,7 +2,6 @@
+ # Use of this source code is governed by a BSD-style license that can be
+ # found in the LICENSE file.
+ 
+-import imp
+ import os.path
+ import sys
+ import unittest
+diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/conditional_features_unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/conditional_features_unittest.py
+index aa609be7..f3c2c95f 100644
+--- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/conditional_features_unittest.py
++++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/conditional_features_unittest.py
+@@ -2,7 +2,7 @@
+ # Use of this source code is governed by a BSD-style license that can be
+ # found in the LICENSE file.
+ 
+-import imp
++import importlib.util
+ import os
+ import sys
+ import unittest
+@@ -18,10 +18,7 @@ def _GetDirAbove(dirname):
+     if tail == dirname:
+       return path
+ 
+-
+-try:
+-  imp.find_module('mojom')
+-except ImportError:
++if importlib.util.find_spec("mojom") is None:
+   sys.path.append(os.path.join(_GetDirAbove('pylib'), 'pylib'))
+ import mojom.parse.ast as ast
+ import mojom.parse.conditional_features as conditional_features
+diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py
+index 3e084bbf..1e8b49f2 100644
+--- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py
++++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py
+@@ -2,7 +2,6 @@
+ # Use of this source code is governed by a BSD-style license that can be
+ # found in the LICENSE file.
+ 
+-import imp
+ import os.path
+ import sys
+ 
+diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittest.py
+index eadc6587..77976507 100644
+--- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittest.py
++++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittest.py
+@@ -2,7 +2,7 @@
+ # Use of this source code is governed by a BSD-style license that can be
+ # found in the LICENSE file.
+ 
+-import imp
++import importlib.util
+ import os.path
+ import sys
+ import unittest
+@@ -22,9 +22,7 @@ def _GetDirAbove(dirname):
+ sys.path.insert(1, os.path.join(_GetDirAbove("mojo"), "third_party"))
+ from ply import lex
+ 
+-try:
+-  imp.find_module("mojom")
+-except ImportError:
++if importlib.util.find_spec("mojom") is None:
+   sys.path.append(os.path.join(_GetDirAbove("pylib"), "pylib"))
+ import mojom.parse.lexer
+ 
+diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unittest.py
+index 6d6b7153..7e8acf43 100644
+--- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unittest.py
++++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unittest.py
+@@ -2,7 +2,6 @@
+ # Use of this source code is governed by a BSD-style license that can be
+ # found in the LICENSE file.
+ 
+-import imp
+ import os.path
+ import sys
+ import unittest
+-- 
+2.43.0
+
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
index 2a3c6473ee..c8ccff6f40 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
+        file://0001-mojom-Drop-using-imp-module.patch \
 "
 
 SRCREV = "960d0c1e19feaf310321c906e14bd5410c6be629"
-- 
2.43.0


