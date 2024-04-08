Return-Path: <RahulJanani.Pandi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E19C67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 09:42:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.102355.1712569356653930607
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 02:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Eh568lX4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48283138d5=rahuljanani.pandi@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43890VWQ023427
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Apr 2024 09:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=XBEh8
	fcLk8GmIJ3Sj8NISlji+qIvErKtwNewssymWhU=; b=Eh568lX4x30zjlZCFJ9ti
	kLEvvY0siWwLvJQXEjo1Qdsp+URiwOIeadVu3IslQc+eqKP8Ux0brzYxPNoOg1Wm
	J9CaPpAo/MXyYb6v8Ffl+VSScMYA0koq4sANrK0c+T2u8X88nGwrKUQUwT44DFN5
	NBHtIltXKcABRDQfoimWOsF4hpr2+M5VqB+JgosVbgsNUvpzNQAZFFeGm00Ximm7
	NlqIpPc/ULTcFBSGSFmbranPImWWqPCFNvio4jag6sfs5LACWtVAQkaESG5sawdP
	t/nJiLUj+DKp4w5BtCMvzyjXrZ/hyjs6JlSfpf5g3SQRr9kOtTUYc/DK85icJGHJ
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xawc6hgfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 09:42:35 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 8 Apr 2024 02:42:34 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Mon, 8 Apr 2024 02:42:33 -0700
From: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-pillow: Fix CVE-2023-50447
Date: Mon, 8 Apr 2024 09:42:28 +0000
Message-ID: <20240408094228.2255483-1-RahulJanani.Pandi@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3ozRoXilVy6hAqVkrAgk0C3ET-wZ3zhw
X-Proofpoint-ORIG-GUID: 3ozRoXilVy6hAqVkrAgk0C3ET-wZ3zhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_07,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 09:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109862

Pillow through 10.1.0 allows PIL.ImageMath.eval Arbitrary Code
Execution via the environment parameter, a different vulnerability
than CVE-2022-22817 (which was about the expression parameter).

References:
https://security-tracker.debian.org/tracker/CVE-2023-50447
https://github.com/python-pillow/Pillow/blob/10.2.0/CHANGES.rst

Signed-off-by: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
---
 .../python3-pillow/CVE-2023-50447-1.patch     | 29 ++++++++
 .../python3-pillow/CVE-2023-50447-2.patch     | 31 +++++++++
 .../python3-pillow/CVE-2023-50447-3.patch     | 56 ++++++++++++++++
 .../python3-pillow/CVE-2023-50447-4.patch     | 66 +++++++++++++++++++
 .../python/python3-pillow_9.4.0.bb            |  4 ++
 5 files changed, 186 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-4.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch
new file mode 100644
index 000000000..7de12be5d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch
@@ -0,0 +1,29 @@
+From  3652f431c2d8b9c10bf20b70f284d300d12e814a
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date:   Sat Oct 28 14:22:39 2023 +1100
+Subject: [PATCH] python3-pillow: Simplified code
+
+CVE: CVE-2023-50447
+
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/3652f431c2d8b9c10bf20b70f284d300d12e814a]
+
+Signed-off-by: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
+---
+ src/PIL/ImageMath.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/PIL/ImageMath.py b/src/PIL/ImageMath.py
+index ac7d36b69..71872a3fb 100644
+--- a/src/PIL/ImageMath.py
++++ b/src/PIL/ImageMath.py
+@@ -239,7 +239,7 @@ def eval(expression, _dict={}, **kw):
+     args = ops.copy()
+     args.update(_dict)
+     args.update(kw)
+-    for k, v in list(args.items()):
++    for k, v in args.items():
+         if hasattr(v, "im"):
+             args[k] = _Operand(v)
+
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch
new file mode 100644
index 000000000..13fbaf6d7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch
@@ -0,0 +1,31 @@
+From  45c726fd4daa63236a8f3653530f297dc87b160a
+From: Eric Soroos <eric-github@soroos.net>
+Date:   Fri Oct 27 11:21:18 2023 +0200
+Subject: [PATCH] python3-pillow: Don't allow __ or builtins in env dictionarys
+
+CVE: CVE-2023-50447
+
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/45c726fd4daa63236a8f3653530f297dc87b160a]
+
+Signed-off-by: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
+---
+ src/PIL/ImageMath.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/PIL/ImageMath.py b/src/PIL/ImageMath.py
+index 71872a3fb..923a8eeae 100644
+--- a/src/PIL/ImageMath.py
++++ b/src/PIL/ImageMath.py
+@@ -240,6 +240,10 @@ def eval(expression, _dict={}, **kw):
+     args.update(_dict)
+     args.update(kw)
+     for k, v in args.items():
++        if '__' in k or hasattr(__builtins__, k):
++            msg = f"'{k}' not allowed"
++            raise ValueError(msg)
++
+         if hasattr(v, "im"):
+             args[k] = _Operand(v)
+
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch
new file mode 100644
index 000000000..bbfc32a6c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch
@@ -0,0 +1,56 @@
+From  0ca3c33c59927e1c7e0c14dbc1eea1dfb2431a80
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Sat, 28 Oct 2023 15:58:52 +1100
+Subject: [PATCH] python3-pillow: Allow ops
+
+CVE: CVE-2023-50447
+
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/0ca3c33c59927e1c7e0c14dbc1eea1dfb2431a80]
+
+Signed-off-by: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
+---
+ Tests/test_imagemath.py | 5 +++++
+ src/PIL/ImageMath.py    | 9 +++++----
+ 2 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/Tests/test_imagemath.py b/Tests/test_imagemath.py
+index fe7ac9a7a..ded8c0011 100644
+--- a/Tests/test_imagemath.py
++++ b/Tests/test_imagemath.py
+@@ -63,6 +63,11 @@ def test_prevent_exec(expression):
+         ImageMath.eval(expression)
+
+
++def test_prevent_double_underscores():
++    with pytest.raises(ValueError):
++        ImageMath.eval("1", {"__": None})
++
++
+ def test_logical():
+     assert pixel(ImageMath.eval("not A", images)) == 0
+     assert pixel(ImageMath.eval("A and B", images)) == "L 2"
+diff --git a/src/PIL/ImageMath.py b/src/PIL/ImageMath.py
+index 923a8eeae..c14598a4c 100644
+--- a/src/PIL/ImageMath.py
++++ b/src/PIL/ImageMath.py
+@@ -237,13 +237,14 @@ def eval(expression, _dict={}, **kw):
+
+     # build execution namespace
+     args = ops.copy()
+-    args.update(_dict)
+-    args.update(kw)
+-    for k, v in args.items():
+-        if '__' in k or hasattr(__builtins__, k):
++    for k in list(_dict.keys()) + list(kw.keys()):
++        if "__" in k or hasattr(__builtins__, k):
+             msg = f"'{k}' not allowed"
+             raise ValueError(msg)
+
++    args.update(_dict)
++    args.update(kw)
++    for k, v in args.items():
+         if hasattr(v, "im"):
+             args[k] = _Operand(v)
+
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-4.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-4.patch
new file mode 100644
index 000000000..da3e2c197
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-4.patch
@@ -0,0 +1,66 @@
+From 557ba59d13de919d04b3fd4cdef8634f7d4b3348
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date:   Sat Dec 30 09:30:12 2023 +1100
+Subject: [PATCH] python3-pillow: Include further builtins
+
+CVE: CVE-2023-50447
+
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/557ba59d13de919d04b3fd4cdef8634f7d4b3348]
+
+Signed-off-by: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
+---
+ Tests/test_imagemath.py     | 5 +++++
+ docs/releasenotes/9.4.0.rst | 8 ++++++++
+ src/PIL/ImageMath.py        | 2 +-
+ 3 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/Tests/test_imagemath.py b/Tests/test_imagemath.py
+index ded8c0011..124687478 100644
+--- a/Tests/test_imagemath.py
++++ b/Tests/test_imagemath.py
+@@ -67,6 +67,11 @@ def test_prevent_double_underscores():
+     with pytest.raises(ValueError):
+         ImageMath.eval("1", {"__": None})
+
++def test_prevent_builtins():
++    with pytest.raises(ValueError):
++        ImageMath.eval("(lambda: exec('exit()'))()", {"exec": None})
++
++
+
+ def test_logical():
+     assert pixel(ImageMath.eval("not A", images)) == 0
+diff --git a/docs/releasenotes/9.4.0.rst b/docs/releasenotes/9.4.0.rst
+index 0af5bc8ca..9ca7c9f6f 100644
+--- a/docs/releasenotes/9.4.0.rst
++++ b/docs/releasenotes/9.4.0.rst
+@@ -88,6 +88,14 @@ Pillow attempted to dereference a null pointer in ``ImageFont``, leading to a
+ crash. An error is now raised instead. This has been present since
+ Pillow 8.0.0.
+
++Restricted environment keys for ImageMath.eval
++^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
++
++:cve:`2023-50447`: If an attacker has control over the keys passed to the
++``environment`` argument of :py:meth:`PIL.ImageMath.eval`, they may be able to execute
++arbitrary code. To prevent this, keys matching the names of builtins and keys
++containing double underscores will now raise a :py:exc:`ValueError`.
++
+ Other Changes
+ =============
+
+diff --git a/src/PIL/ImageMath.py b/src/PIL/ImageMath.py
+index c14598a4c..b2c50bc5b 100644
+--- a/src/PIL/ImageMath.py
++++ b/src/PIL/ImageMath.py
+@@ -238,7 +238,7 @@ def eval(expression, _dict={}, **kw):
+     # build execution namespace
+     args = ops.copy()
+     for k in list(_dict.keys()) + list(kw.keys()):
+-        if "__" in k or hasattr(__builtins__, k):
++        if "__" in k or hasattr(builtins, k):
+             msg = f"'{k}' not allowed"
+             raise ValueError(msg)
+
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index b9c09127c..e1d0b3086 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -10,6 +10,10 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://0001-explicitly-set-compile-options.patch \
            file://run-ptest \
            file://CVE-2023-44271.patch \
+	   file://CVE-2023-50447-1.patch \
+	   file://CVE-2023-50447-2.patch \
+	   file://CVE-2023-50447-3.patch \
+	   file://CVE-2023-50447-4.patch \
            "
 SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
 
-- 
2.40.0


