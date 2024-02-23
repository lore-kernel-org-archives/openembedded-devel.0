Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8447C47DD9
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 02:15:03 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.2138.1708654494682715549
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 18:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bG7sqvL1;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d8da50bffaso3006385ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 18:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708654494; x=1709259294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9T8cJ2m4dlKrn5fC36vXCgFt1msrJYCdli9lUf4WfBw=;
        b=bG7sqvL1f0M+Uvfw4W7UaeKrCdrylVCbHVmiYhjHgTeegYcGXEXWXf8/Z3EOx2YDzK
         kPxBjXSC25bFBNZhtL5gNDayCdCg9Ih4/izK5umKiH5FNx8jvzYDyVl63rKQtS1gO+U4
         BhMK5I2J2WOkySo8N+s7CqVYhDJjd2/GAefzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708654494; x=1709259294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9T8cJ2m4dlKrn5fC36vXCgFt1msrJYCdli9lUf4WfBw=;
        b=eav8dXxQHBLvjx9QcZrnZmh9bbly7cVFQJ370EViWRaZpmix+ZqMAVn7Eckvdmj3ba
         pikS4lJnTeZlKfwm0Z576qbCC8VT2CokqUGJ9FoogjUOVEqCxoIbk6a/VhjpNDK+dWOg
         1TUJIUF9FrLYd8JbSTBYQ2RYSNDJmysdT1GbdaARb1Md9et+sc/3oBmzUhwtgiN7Wmla
         iSsp2zY/8/CsMenKI7cmZTdkciObDs0gAQ5PQjfS4Io35oNUSKtJEVDlnt6dmFxDGmYm
         173p4QzYOvlSnn6MzAFTfOh0IXsKlltK1prtEDzRkx3DQjeWkYaWeqgRpzh7HG3x6t+g
         qQwg==
X-Gm-Message-State: AOJu0YxNoohUG49l0jr1JMDQMPJBRbXnXYx0c5tVw/D7q7ulIahqqYaa
	QVTKDlBidGG3Xoj4oYto3rHY3ShJU1SrlfWaUCu+q2HMgV3Ziuz/TwRDVKq7n1hSq8ITBFZ2FZr
	R
X-Google-Smtp-Source: AGHT+IFN1EXe/kzvEN/cmJJjIE+Kbd/2lBm1Rmt0YWUGmHzrdjoqmxld2po54+3WHpp7Jugy4a2riA==
X-Received: by 2002:a17:902:8644:b0:1d9:b751:4752 with SMTP id y4-20020a170902864400b001d9b7514752mr570433plt.62.1708654493657;
        Thu, 22 Feb 2024 18:14:53 -0800 (PST)
Received: from MVIN00020.mvista.com ([2405:201:c01c:781c:db2a:a0a:262b:2747])
        by smtp.gmail.com with ESMTPSA id mm11-20020a1709030a0b00b001db6da30331sm10623967plb.86.2024.02.22.18.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 18:14:53 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-python][dunfell][PATCH] python3-pillow: Fix for CVE-2023-50447
Date: Fri, 23 Feb 2024 07:44:43 +0530
Message-Id: <20240223021443.5560-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 02:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108999

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/python-pillow/Pillow/commit/45c726fd4daa63236a8f3653530f297dc87b160a
&
https://github.com/python-pillow/Pillow/commit/0ca3c33c59927e1c7e0c14dbc1eea1dfb2431a80
&
https://github.com/python-pillow/Pillow/commit/557ba59d13de919d04b3fd4cdef8634f7d4b3348]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-pillow/CVE-2023-50447-1.patch     | 31 +++++++++++
 .../python3-pillow/CVE-2023-50447-2.patch     | 54 +++++++++++++++++++
 .../python3-pillow/CVE-2023-50447-3.patch     | 44 +++++++++++++++
 .../python/python3-pillow_6.2.1.bb            |  3 ++
 4 files changed, 132 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch
new file mode 100644
index 000000000..f9e3c4950
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch
@@ -0,0 +1,31 @@
+From 45c726fd4daa63236a8f3653530f297dc87b160a Mon Sep 17 00:00:00 2001
+From: Eric Soroos <eric-github@soroos.net>
+Date: Fri, 27 Oct 2023 11:21:18 +0200
+Subject: [PATCH] Don't allow __ or builtins in env dictionarys for
+ ImageMath.eval
+
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/45c726fd4daa63236a8f3653530f297dc87b160a]
+CVE: CVE-2023-50447
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/PIL/ImageMath.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/PIL/ImageMath.py b/src/PIL/ImageMath.py
+index 392151c10..4cea3855e 100644
+--- a/src/PIL/ImageMath.py
++++ b/src/PIL/ImageMath.py
+@@ -261,6 +261,10 @@ def eval(expression, _dict={}, **kw):
+     args.update(_dict)
+     args.update(kw)
+     for k, v in list(args.items()):
++        if '__' in k or hasattr(__builtins__, k):
++            msg = f"'{k}' not allowed"
++            raise ValueError(msg)
++
+         if hasattr(v, "im"):
+             args[k] = _Operand(v)
+ 
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch
new file mode 100644
index 000000000..9c5d3fbcd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch
@@ -0,0 +1,54 @@
+From 0ca3c33c59927e1c7e0c14dbc1eea1dfb2431a80 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Sat, 28 Oct 2023 15:58:52 +1100
+Subject: [PATCH] Allow ops
+
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/0ca3c33c59927e1c7e0c14dbc1eea1dfb2431a80]
+CVE: CVE-2023-50447
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Tests/test_imagemath.py | 4 ++++
+ src/PIL/ImageMath.py    | 9 +++++----
+ 2 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/Tests/test_imagemath.py b/Tests/test_imagemath.py
+index da41b3a12..14a58a532 100644
+--- a/Tests/test_imagemath.py
++++ b/Tests/test_imagemath.py
+@@ -56,6 +56,10 @@ class TestImageMath(PillowTestCase):
+             pixel(ImageMath.eval("float(B)**33", images)), "F 8589934592.0"
+         )
+ 
++    def test_prevent_double_underscores():
++        with pytest.raises(ValueError):
++            ImageMath.eval("1", {"__": None})
++
+     def test_logical(self):
+         self.assertEqual(pixel(ImageMath.eval("not A", images)), 0)
+         self.assertEqual(pixel(ImageMath.eval("A and B", images)), "L 2")
+diff --git a/src/PIL/ImageMath.py b/src/PIL/ImageMath.py
+index 4cea3855e..776604e3f 100644
+--- a/src/PIL/ImageMath.py
++++ b/src/PIL/ImageMath.py
+@@ -258,13 +258,14 @@ def eval(expression, _dict={}, **kw):
+ 
+     # build execution namespace
+     args = ops.copy()
+-    args.update(_dict)
+-    args.update(kw)
+-    for k, v in list(args.items()):
+-        if '__' in k or hasattr(__builtins__, k):
++    for k in list(_dict.keys()) + list(kw.keys()):
++        if "__" in k or hasattr(__builtins__, k):
+             msg = f"'{k}' not allowed"
+             raise ValueError(msg)
+ 
++    args.update(_dict)
++    args.update(kw)
++    for k, v in list(args.items()):
+         if hasattr(v, "im"):
+             args[k] = _Operand(v)
+ 
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch
new file mode 100644
index 000000000..b93425ee5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch
@@ -0,0 +1,44 @@
+From 557ba59d13de919d04b3fd4cdef8634f7d4b3348 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Sat, 30 Dec 2023 09:30:12 +1100
+Subject: [PATCH] Include further builtins
+
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/557ba59d13de919d04b3fd4cdef8634f7d4b3348]
+CVE: CVE-2023-50447
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Tests/test_imagemath.py | 4 ++++
+ src/PIL/ImageMath.py    | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Tests/test_imagemath.py b/Tests/test_imagemath.py
+index 14a58a532..5bba832e2 100644
+--- a/Tests/test_imagemath.py
++++ b/Tests/test_imagemath.py
+@@ -60,6 +60,10 @@ class TestImageMath(PillowTestCase):
+         with pytest.raises(ValueError):
+             ImageMath.eval("1", {"__": None})
+ 
++    def test_prevent_builtins():
++        with pytest.raises(ValueError):
++            ImageMath.eval("(lambda: exec('exit()'))()", {"exec": None})
++
+     def test_logical(self):
+         self.assertEqual(pixel(ImageMath.eval("not A", images)), 0)
+         self.assertEqual(pixel(ImageMath.eval("A and B", images)), "L 2")
+diff --git a/src/PIL/ImageMath.py b/src/PIL/ImageMath.py
+index 776604e3f..c6bc22180 100644
+--- a/src/PIL/ImageMath.py
++++ b/src/PIL/ImageMath.py
+@@ -259,7 +259,7 @@ def eval(expression, _dict={}, **kw):
+     # build execution namespace
+     args = ops.copy()
+     for k in list(_dict.keys()) + list(kw.keys()):
+-        if "__" in k or hasattr(__builtins__, k):
++        if "__" in k or hasattr(builtins, k):
+             msg = f"'{k}' not allowed"
+             raise ValueError(msg)
+ 
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb b/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
index eda0bd57d..6567b32d0 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
@@ -9,6 +9,9 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=6.2.x;protocol=https
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
            file://0001-CVE-2022-45198.patch \
+           file://CVE-2023-50447-1.patch \
+           file://CVE-2023-50447-2.patch \
+           file://CVE-2023-50447-3.patch \
 "
 SRCREV ?= "6e0f07bbe38def22d36ee176b2efd9ea74b453a6"
 
-- 
2.25.1


