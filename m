Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802C6F46437
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:34:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46948.1773653686117479037
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=V9OB0/wh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7535dcf6df=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G30lEv386076
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 09:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+aZ68XbWNFawWa4EJapG
	bHUthxNJInsxSJROKTvXRhw=; b=V9OB0/wh1p5QupolSR40U37gC/IRvr863Gst
	BdC9NGGEegKA+QOERlLzmngtL6BHyCTAIyXt0CAZcwB7W/NKGcxvmmjdam2g/o0e
	8v9qAD+Sw6P7ClVxkff/rbOQdFtedF6gqbSzZFmIKrP1YzzeKtHWsVrVx9j98iN0
	apx1AgxAQ3gSDcRxLNAbLoitjtq3ZrG5MGv9vcCjzdQdrc2U09q+5XvMv3KwGmSH
	AwPnbhLibyN+KrtWfLkLyqul+2QY00vvY4wyXkjCNk3ktNg/zHqXNysp1msiDHhk
	g0J8I5IMcjCHJ2ImPlmvPKhzdTNKf0bzq/irr/W8lEsIliva9Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvxn59te6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 09:34:44 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 16 Mar 2026 02:34:43 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 16 Mar 2026 02:34:43 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-ninja: upgrade 1.11.1.1 -> 1.13.0
Date: Mon, 16 Mar 2026 17:34:42 +0800
Message-ID: <20260316093442.3450847-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MiBTYWx0ZWRfX82xy947jbfUL
 7VQp0TPLJrJOniqv33jI+YzvTgrEkyxfNxJ5ucDlYSG1x2ZIgg5dbhCb0qireRba65BiXpXOtGA
 hV9Of7WSZjDIjcYjrHOTB8tSECd4K+sfYPYvZouxdLTciPjihxT9tPuWbMMsdD85NzNbZHFaIlg
 pSU3kr2hP8IM46dleXt9e6qGnAtBnl7J/czqUJKtj1hCgWepEoX6jndfMpPNGzo67HHm/nb44GX
 TP/OJMV5Bzzgk33iDL+NGYg2mVuhoEjUUgz5/prTuQ0iwudCxTILMg6z0+B0B+oGvKbx2QaUWcq
 lHDCzzI8TcvrSwos5OjS5CShbzfB+fPqORRF2DwHMemzTQ/XBhT06Ra87eK/jY6+2837eunL6i2
 3nNufLs+RVn/T1QxyiisUuoC5V0mX6sXD2vQA6SKRp48rpROeZvZutgSdPKCecHCkPxPFJsiPR4
 Yhfkj/bzp0sPJLtfxUg==
X-Proofpoint-GUID: AzKf9gYKkNJxvm1PenDEUi6yktjkBnEv
X-Proofpoint-ORIG-GUID: AzKf9gYKkNJxvm1PenDEUi6yktjkBnEv
X-Authority-Analysis: v=2.4 cv=T52BjvKQ c=1 sm=1 tr=0 ts=69b7ceb4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=qOLvluO_AAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=7CQSdrXTAAAA:8 a=zuu0M-wxc3A4uMvWb34A:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 09:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125270

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://github.com/scikit-build/ninja-python-distributions/releases

Upstream commit [1] switched build system from scikit-build to
scikit-build-core, which changed pyproject.toml structure and rewrote
__init__.py. Update patches accordingly:

- no-scikit-build.patch: rewrite for new pyproject.toml structure,
  replace scikit-build-core with setuptools, and remove 'readme'
  from dynamic fields as setuptools cannot handle the fancy-pypi-readme
  plugin.
- run-ninja-from-path.patch: drop. Old version imported skbuild
  modules in __init__.py which caused ImportError in OE since
  scikit-build is not installed. New version replaced these imports
  with stdlib sysconfig, so the patch is no longer needed.
- CMakeLists.txt: drop. This was a stub file added to prevent
  scikit-build from failing when it could not find CMakeLists.txt.
  Since we now use setuptools which does not require it, the file
  can be removed.

[1] https://github.com/scikit-build/ninja-python-distributions/commit/f3b4a786be

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python/python3-ninja/CMakeLists.txt       |  9 ----
 .../python3-ninja/no-scikit-build.patch       | 39 +++++++---------
 .../python3-ninja/run-ninja-from-path.patch   | 44 -------------------
 ...ja_1.11.1.1.bb => python3-ninja_1.13.0.bb} |  5 +--
 4 files changed, 17 insertions(+), 80 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ninja/CMakeLists.txt
 delete mode 100644 meta-python/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch
 rename meta-python/recipes-devtools/python/{python3-ninja_1.11.1.1.bb => python3-ninja_1.13.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-ninja/CMakeLists.txt b/meta-python/recipes-devtools/python/python3-ninja/CMakeLists.txt
deleted file mode 100644
index 04fa451e72..0000000000
--- a/meta-python/recipes-devtools/python/python3-ninja/CMakeLists.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-cmake_minimum_required(VERSION 3.15)
-
-project(NinjaPythonDistributions)
-
-set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_MODULE_PATH})
-
-install(CODE "
- message(STATUS \"Install ninja project\")
-")
diff --git a/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch b/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch
index b7d191e244..4dfbb2675a 100644
--- a/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch
+++ b/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch
@@ -1,31 +1,22 @@
-We don't need to build ninja so there's no need to use scikit-build,
-as we just need the python module with it's one ninja() function.
+We don't need to build ninja so there's no need to use scikit-build-core,
+as we just need the python module with its one ninja() function.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
 
-diff --git a/pyproject.toml b/pyproject.toml
-index b895c20..577b642 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -2,7 +2,6 @@
- requires = [
-     "setuptools >=42",
-     "setuptools-scm[toml]",
--    "scikit-build",
- ]
- build-backend = "setuptools.build_meta"
+@@ -1,5 +1,4 @@
+ [build-system]
+-requires = ["scikit-build-core>=0.10"]
+-build-backend = "backend"
+-backend-path = ["_build_backend"]
++requires = ["setuptools", "setuptools-scm"]
++build-backend = "setuptools.build_meta"
  
-diff --git a/setup.py b/setup.py
-index dbe1fbc..3259754 100755
---- a/setup.py
-+++ b/setup.py
-@@ -5,7 +5,7 @@ import os
- import sys
- from distutils.text_file import TextFile
- 
--from skbuild import setup
-+from setuptools import setup
- 
- # Add current folder to path
- # This is required to import versioneer in an isolated pip build
+@@ -7,3 +6,3 @@
+ name = "ninja"
+-dynamic = ["version", "readme"]
++dynamic = ["version"]
+ description = "Ninja is a small build system with a focus on speed"
diff --git a/meta-python/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch b/meta-python/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch
deleted file mode 100644
index 0068efcc3a..0000000000
--- a/meta-python/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-There's no need to hunt around source or install trees when we're just running ninja
-from PATH.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/src/ninja/__init__.py b/src/ninja/__init__.py
-index f83767e..31bb926 100644
---- a/src/ninja/__init__.py
-+++ b/src/ninja/__init__.py
-@@ -19,32 +19,9 @@ except ImportError:
-             os.path.dirname(__file__), '../../Ninja-src/misc')))
-     from ninja_syntax import Writer, escape, expand  # noqa: F401
- 
--DATA = os.path.join(os.path.dirname(__file__), 'data')
--
--# Support running tests from the source tree
--if not os.path.exists(DATA):
--    from skbuild.constants import CMAKE_INSTALL_DIR as SKBUILD_CMAKE_INSTALL_DIR
--    from skbuild.constants import set_skbuild_plat_name
--
--    if platform.system().lower() == "darwin":
--        # Since building the project specifying --plat-name or CMAKE_OSX_* variables
--        # leads to different SKBUILD_DIR, the code below attempt to guess the most
--        # likely plat-name.
--        _skbuild_dirs = os.listdir(os.path.join(os.path.dirname(__file__), '..', '..', '_skbuild'))
--        if _skbuild_dirs:
--            _likely_plat_name = '-'.join(_skbuild_dirs[0].split('-')[:3])
--            set_skbuild_plat_name(_likely_plat_name)
--
--    _data = os.path.abspath(os.path.join(
--        os.path.dirname(__file__), '..', '..', SKBUILD_CMAKE_INSTALL_DIR(), 'src/ninja/data'))
--    if os.path.exists(_data):
--        DATA = _data
--
--BIN_DIR = os.path.join(DATA, 'bin')
--
- 
- def _program(name, args):
--    return subprocess.call([os.path.join(BIN_DIR, name)] + args, close_fds=False)
-+    return subprocess.call([name] + args, close_fds=False)
- 
- 
- def ninja():
diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.1.bb b/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-ninja_1.11.1.1.bb
rename to meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb
index 8f2e6528db..1591be0912 100644
--- a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb
@@ -6,10 +6,9 @@ PYPI_PACKAGE = "ninja"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "9d793b08dd857e38d0b6ffe9e6b7145d7c485a42dcfea04905ca0cdb6017cc3c"
+SRC_URI[sha256sum] = "4a40ce995ded54d9dc24f8ea37ff3bf62ad192b547f6c7126e7e25045e76f978"
 
-SRC_URI += "file://no-scikit-build.patch \
-            file://run-ninja-from-path.patch"
+SRC_URI += "file://no-scikit-build.patch "
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


