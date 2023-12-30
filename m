Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C573C4706F
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 19:06:27 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.190574.1703963178748856035
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 11:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VCB0k0ee;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35fe456b94cso36472745ab.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 11:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703963178; x=1704567978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iv9L4FH4w3276SxLe3NxiXN/R71YWxIH4kAJppiA/P8=;
        b=VCB0k0eeZeArr9aIbTekHi7BqEHZ3uxsgWUaA3tfvdnbCIz7AigbcyVlsHtbBzCp1C
         6rfWctz0GS9Glg5vUXCqaSe2bXBwAYIp5/Sgl1ynmkPMf5bTwnHlCGukFD6tQVHlGx73
         blSZAqwnOtXQotCT1NGjKTZ9zXy9LHWVQQ0VW1BtS9+vXdUfF96aEmcalRIImg5FLimH
         CaHyPH8om98bXBDqQdpbajXn89c+lRCDqRsYRKCfNNxvGQyyzj0kUtCoG3aAxkDt/KJU
         Vw0YBa6Tg4DN2T3TzTazzF2OqE/l4d860LyY3awbRlReCihuPWcWJULlhuvN0N7m1ERA
         wDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703963178; x=1704567978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iv9L4FH4w3276SxLe3NxiXN/R71YWxIH4kAJppiA/P8=;
        b=OQD8NuV9aS9E0R91aSz8kv2VFN3AJBu9MZ2iq9fbnFLgwjwg5IvV1sFWTSkFnWua7U
         JXbzACTvmqfne9f2thKW1gewyIlKxODnQAMd65hzDO0eweTx89/ZO57O4OghexGPrlog
         lFzEfg9DaJxK3l3S1fZY3V27uxViWdbTB9wf6Oo0TewHPYtgWSnZBFLZ+nduJM33++mj
         wNNNmwFG6GQ+YCPe1V99irdxlGWyvXN68Kd0uFo6YTQrhlh9EpalCdzmIAjcz30qc1GK
         tljWXWLPJCy/SKPo+lcPbZn5ZBwH7th0cdQg2l+6ZANuH3Zxre+5r7NtXbYpp4IxRy0k
         tFZA==
X-Gm-Message-State: AOJu0YyJFfyrScPwyT/h4Rb+be+IN4fWZKmU8ueVlSRKWCpmdYBUwqvo
	k0M4Hib6arSwH33EoZqUE+uqHyAvrsA=
X-Google-Smtp-Source: AGHT+IGVZLvSa5VIQS8hx+INtpJIrE1rsLcKJBK2MIKhvaJwGhBiKD+wrEbi+M/7h/IqQAP61Auobg==
X-Received: by 2002:a05:6e02:18c7:b0:35f:d99b:2f5d with SMTP id s7-20020a056e0218c700b0035fd99b2f5dmr25655100ilu.8.1703963177554;
        Sat, 30 Dec 2023 11:06:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id l7-20020a17090270c700b001d49608e3dfsm4311066plt.50.2023.12.30.11.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 11:06:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] libcamera: Fix build with python 3.12
Date: Sat, 30 Dec 2023 11:06:12 -0800
Message-ID: <20231230190612.382560-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231230190612.382560-1-raj.khem@gmail.com>
References: <20231230190612.382560-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 19:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107913

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


