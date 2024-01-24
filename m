Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47622C47422
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 21:59:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.41479.1706133583026826505
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jan 2024 13:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C0D6940C2C;
	Wed, 24 Jan 2024 21:59:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vi65E3weOkkc; Wed, 24 Jan 2024 21:59:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9E84640C1E;
	Wed, 24 Jan 2024 21:59:40 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4D2DA163DDA;
	Wed, 24 Jan 2024 16:59:39 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] libcamera: update 0.1.0 -> 0.2.0
Date: Wed, 24 Jan 2024 16:59:38 -0500
Message-Id: <20240124215938.2030548-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jan 2024 21:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108452

From: Denys Dmytriyenko <denys@konsulko.com>

Changelog:
https://git.libcamera.org/libcamera/libcamera.git/tag/?h=3Dv0.2.0

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../0001-mojom-Drop-using-imp-module.patch    | 176 ------------------
 ...{libcamera_0.1.0.bb =3D> libcamera_0.2.0.bb} |   4 +-
 2 files changed, 1 insertion(+), 179 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamer=
a/0001-mojom-Drop-using-imp-module.patch
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.1.0.bb =
=3D> libcamera_0.2.0.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-=
mojom-Drop-using-imp-module.patch b/meta-multimedia/recipes-multimedia/li=
bcamera/libcamera/0001-mojom-Drop-using-imp-module.patch
deleted file mode 100644
index b07a79059..000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-mojom-D=
rop-using-imp-module.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From 23a9bbb9ab380344c5daf5bc0109fab249e41afd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Dec 2023 10:55:44 -0800
-Subject: [PATCH] mojom: Drop using imp module.
-
-This module is gone in python 3.12 onwards, in most places it is unused
-so remove from those places, in some places where its still is needed
-replace it with importlib.util
-
-Fixes [1]
-
-[1] https://bugs.libcamera.org/show_bug.cgi?id=3D206
-
-Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcam=
era-devel/2023-December/039986.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py        | 1 -
- .../ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py | 1 -
- .../tools/mojom/mojom/generate/generator_unittest.py       | 7 ++-----
- .../tools/mojom/mojom/generate/translate_unittest.py       | 1 -
- .../mojo/public/tools/mojom/mojom/parse/ast_unittest.py    | 1 -
- .../mojom/mojom/parse/conditional_features_unittest.py     | 7 ++-----
- utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py     | 1 -
- .../mojo/public/tools/mojom/mojom/parse/lexer_unittest.py  | 6 ++----
- .../mojo/public/tools/mojom/mojom/parse/parser_unittest.py | 1 -
- 9 files changed, 6 insertions(+), 20 deletions(-)
-
-diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py b/utils=
/ipc/mojo/public/tools/mojom/mojom/fileutil.py
-index bf626f54..e1c823da 100644
---- a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py
-+++ b/utils/ipc/mojo/public/tools/mojom/mojom/fileutil.py
-@@ -3,7 +3,6 @@
- # found in the LICENSE file.
-=20
- import errno
--import imp
- import os.path
- import sys
-=20
-diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.p=
y b/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py
-index ff5753a2..e754151f 100644
---- a/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py
-+++ b/utils/ipc/mojo/public/tools/mojom/mojom/fileutil_unittest.py
-@@ -2,7 +2,6 @@
- # Use of this source code is governed by a BSD-style license that can b=
e
- # found in the LICENSE file.
-=20
--import imp
- import os.path
- import shutil
- import sys
-diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_=
unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_=
unittest.py
-index 32c884a8..6cae6092 100644
---- a/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_unittes=
t.py
-+++ b/utils/ipc/mojo/public/tools/mojom/mojom/generate/generator_unittes=
t.py
-@@ -2,7 +2,7 @@
- # Use of this source code is governed by a BSD-style license that can b=
e
- # found in the LICENSE file.
-=20
--import imp
-+import importlib.util
- import os.path
- import sys
- import unittest
-@@ -18,10 +18,7 @@ def _GetDirAbove(dirname):
-     if tail =3D=3D dirname:
-       return path
-=20
--
--try:
--  imp.find_module("mojom")
--except ImportError:
-+if importlib.util.find_spec("mojom") is None:
-   sys.path.append(os.path.join(_GetDirAbove("pylib"), "pylib"))
- from mojom.generate import generator
-=20
-diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_=
unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_=
unittest.py
-index 19905c8a..09724d88 100644
---- a/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_unittes=
t.py
-+++ b/utils/ipc/mojo/public/tools/mojom/mojom/generate/translate_unittes=
t.py
-@@ -2,7 +2,6 @@
- # Use of this source code is governed by a BSD-style license that can b=
e
- # found in the LICENSE file.
-=20
--import imp
- import os.path
- import sys
- import unittest
-diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.=
py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.py
-index 62798631..4ab51033 100644
---- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.py
-+++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/ast_unittest.py
-@@ -2,7 +2,6 @@
- # Use of this source code is governed by a BSD-style license that can b=
e
- # found in the LICENSE file.
-=20
--import imp
- import os.path
- import sys
- import unittest
-diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/conditional_f=
eatures_unittest.py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/condi=
tional_features_unittest.py
-index aa609be7..f3c2c95f 100644
---- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/conditional_features=
_unittest.py
-+++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/conditional_features=
_unittest.py
-@@ -2,7 +2,7 @@
- # Use of this source code is governed by a BSD-style license that can b=
e
- # found in the LICENSE file.
-=20
--import imp
-+import importlib.util
- import os
- import sys
- import unittest
-@@ -18,10 +18,7 @@ def _GetDirAbove(dirname):
-     if tail =3D=3D dirname:
-       return path
-=20
--
--try:
--  imp.find_module('mojom')
--except ImportError:
-+if importlib.util.find_spec("mojom") is None:
-   sys.path.append(os.path.join(_GetDirAbove('pylib'), 'pylib'))
- import mojom.parse.ast as ast
- import mojom.parse.conditional_features as conditional_features
-diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py b/ut=
ils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py
-index 3e084bbf..1e8b49f2 100644
---- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py
-+++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer.py
-@@ -2,7 +2,6 @@
- # Use of this source code is governed by a BSD-style license that can b=
e
- # found in the LICENSE file.
-=20
--import imp
- import os.path
- import sys
-=20
-diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittes=
t.py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittest.py
-index eadc6587..77976507 100644
---- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittest.py
-+++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/lexer_unittest.py
-@@ -2,7 +2,7 @@
- # Use of this source code is governed by a BSD-style license that can b=
e
- # found in the LICENSE file.
-=20
--import imp
-+import importlib.util
- import os.path
- import sys
- import unittest
-@@ -22,9 +22,7 @@ def _GetDirAbove(dirname):
- sys.path.insert(1, os.path.join(_GetDirAbove("mojo"), "third_party"))
- from ply import lex
-=20
--try:
--  imp.find_module("mojom")
--except ImportError:
-+if importlib.util.find_spec("mojom") is None:
-   sys.path.append(os.path.join(_GetDirAbove("pylib"), "pylib"))
- import mojom.parse.lexer
-=20
-diff --git a/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unitte=
st.py b/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unittest.py
-index 6d6b7153..7e8acf43 100644
---- a/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unittest.py
-+++ b/utils/ipc/mojo/public/tools/mojom/mojom/parse/parser_unittest.py
-@@ -2,7 +2,6 @@
- # Use of this source code is governed by a BSD-style license that can b=
e
- # found in the LICENSE file.
-=20
--import imp
- import os.path
- import sys
- import unittest
---=20
-2.43.0
-
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.=
bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
index c8ccff6f4..3fd17f0a8 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM =3D "\
=20
 SRC_URI =3D " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
-        file://0001-mojom-Drop-using-imp-module.patch \
 "
=20
-SRCREV =3D "960d0c1e19feaf310321c906e14bd5410c6be629"
+SRCREV =3D "89227a428a82e724548399d35c98ea89566f9045"
=20
 PE =3D "1"
=20
@@ -73,4 +72,3 @@ FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0"
 # libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to
 # both 32 and 64 bit file APIs.
 GLIBC_64BIT_TIME_FLAGS =3D ""
-
--=20
2.25.1


