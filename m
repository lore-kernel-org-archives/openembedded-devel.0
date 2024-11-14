Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C89D68B16
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 13:23:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37041.1731590623376453948
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 05:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10487a133e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE8HtCP030802
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 05:23:43 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwpmktfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 05:23:42 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 14 Nov 2024 05:23:42 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 14 Nov 2024 05:23:40 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 7/7] nodejs: cleanup
Date: Thu, 14 Nov 2024 13:23:28 +0000
Message-ID: <20241114132328.1340824-7-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241114132328.1340824-1-archana.polampalli@windriver.com>
References: <20241114132328.1340824-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8-ROiKFjv_WAyx6haYn4G5sN9C-2Y5Ln
X-Authority-Analysis: v=2.4 cv=ZdlPNdVA c=1 sm=1 tr=0 ts=6735f9de cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=Y1CTIuGaO5iKeU1sxbUA:9
X-Proofpoint-ORIG-GUID: 8-ROiKFjv_WAyx6haYn4G5sN9C-2Y5Ln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411140105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 13:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113822

From: "J. S" <schonm@gmail.com>

Drop two patches which haven't been referenced by the nodejs recipe since the
20.11.0 version checkin.
  0001-build-fix-build-with-Python-3.12.patch
  0001-gyp-resolve-python-3.12-issues.patch

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-build-fix-build-with-Python-3.12.patch | 55 ----------------
 .../0001-gyp-resolve-python-3.12-issues.patch | 63 -------------------
 2 files changed, 118 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
deleted file mode 100644
index 39026d074..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 656f6c91f1da7f1e1ffb01e2de7d9026a84958b5 Mon Sep 17 00:00:00 2001
-From: Luigi Pinca <luigipinca@gmail.com>
-Date: Wed, 8 Nov 2023 21:20:53 +0100
-Subject: [PATCH] build: fix build with Python 3.12
-
-Replace `distutils.version.StrictVersion` with
-`packaging.version.Version`.
-
-Refs: https://github.com/nodejs/node/pull/50209#issuecomment-1795852539
-PR-URL: https://github.com/nodejs/node/pull/50582
-Reviewed-By: Richard Lau <rlau@redhat.com>
-Reviewed-By: Chengzhong Wu <legendecas@gmail.com>
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/95534ad82f4e33f53fd50efe633d43f8da70cba6]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- configure.py | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/configure.py b/configure.py
-index 62f041ce..18fe7c14 100755
---- a/configure.py
-+++ b/configure.py
-@@ -14,8 +14,6 @@ import bz2
- import io
- from pathlib import Path
- 
--from distutils.version import StrictVersion
--
- # If not run from node/, cd to node/.
- os.chdir(Path(__file__).parent)
- 
-@@ -30,6 +28,7 @@ tools_path = Path('tools')
- 
- sys.path.insert(0, str(tools_path / 'gyp' / 'pylib'))
- from gyp.common import GetFlavor
-+from packaging.version import Version
- 
- # imports in tools/configure.d
- sys.path.insert(0, str(tools_path / 'configure.d'))
-@@ -1565,10 +1564,10 @@ def configure_openssl(o):
-     # supported asm compiler for AVX2. See https://github.com/openssl/openssl/
-     # blob/OpenSSL_1_1_0-stable/crypto/modes/asm/aesni-gcm-x86_64.pl#L52-L69
-     openssl110_asm_supported = \
--      ('gas_version' in variables and StrictVersion(variables['gas_version']) >= StrictVersion('2.23')) or \
--      ('xcode_version' in variables and StrictVersion(variables['xcode_version']) >= StrictVersion('5.0')) or \
--      ('llvm_version' in variables and StrictVersion(variables['llvm_version']) >= StrictVersion('3.3')) or \
--      ('nasm_version' in variables and StrictVersion(variables['nasm_version']) >= StrictVersion('2.10'))
-+      ('gas_version' in variables and Version(variables['gas_version']) >= Version('2.23')) or \
-+      ('xcode_version' in variables and Version(variables['xcode_version']) >= Version('5.0')) or \
-+      ('llvm_version' in variables and Version(variables['llvm_version']) >= Version('3.3')) or \
-+      ('nasm_version' in variables and Version(variables['nasm_version']) >= Version('2.10'))
- 
-     if is_x86 and not openssl110_asm_supported:
-       error('''Did not find a new enough assembler, install one or build with
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch
deleted file mode 100644
index 9d878dfb8..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From bf8c96ba6936050ed4a0de5bc8aeeaf2b3c50dc1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 7 Dec 2023 12:54:30 +0100
-Subject: [PATCH] gyp: resolve python 3.12 issues
-
-Upstream has updated gyp wholesale in the main branch, so
-this patch can be dropped in due time.
-
-Upstream-Status: Inappropriate [issue will be fixed upstream with the next nodejs LTS update]
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py | 4 ++--
- tools/gyp/pylib/gyp/input.py                          | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py b/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
-index d9699a0a..173e9465 100644
---- a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
-+++ b/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
-@@ -16,7 +16,7 @@ import subprocess
- import sys
- import threading
- import traceback
--from distutils.version import StrictVersion
-+from packaging.version import Version
- from gyp.common import GypError
- from gyp.common import OrderedSet
- 
-@@ -1183,7 +1183,7 @@ def EvalSingleCondition(cond_expr, true_dict, false_dict, phase, variables, buil
-         else:
-             ast_code = compile(cond_expr_expanded, "<string>", "eval")
-             cached_conditions_asts[cond_expr_expanded] = ast_code
--        env = {"__builtins__": {}, "v": StrictVersion}
-+        env = {"__builtins__": {}, "v": Version}
-         if eval(ast_code, env, variables):
-             return true_dict
-         return false_dict
-diff --git a/tools/gyp/pylib/gyp/input.py b/tools/gyp/pylib/gyp/input.py
-index 354958bf..ab6112e5 100644
---- a/tools/gyp/pylib/gyp/input.py
-+++ b/tools/gyp/pylib/gyp/input.py
-@@ -16,7 +16,7 @@ import subprocess
- import sys
- import threading
- import traceback
--from distutils.version import StrictVersion
-+from packaging.version import Version
- from gyp.common import GypError
- from gyp.common import OrderedSet
- 
-@@ -1190,7 +1190,7 @@ def EvalSingleCondition(cond_expr, true_dict, false_dict, phase, variables, buil
-         else:
-             ast_code = compile(cond_expr_expanded, "<string>", "eval")
-             cached_conditions_asts[cond_expr_expanded] = ast_code
--        env = {"__builtins__": {}, "v": StrictVersion}
-+        env = {"__builtins__": {}, "v": Version}
-         if eval(ast_code, env, variables):
-             return true_dict
-         return false_dict
--- 
-2.39.2
-
-- 
2.40.0


