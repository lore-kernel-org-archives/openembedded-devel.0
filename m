Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62258C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 01:16:48 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.4720.1645665407251946211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 17:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21O1GjBv014099
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 17:16:46 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 21O1GdPu028006
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 17:16:45 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 23 Feb 2022 17:16:38 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 23 Feb 2022 17:16:37 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-psutil: fix test failure
Date: Thu, 24 Feb 2022 09:16:37 +0800
Message-ID: <20220224011637.1024145-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 01:16:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95492

From: Changqing Li <changqing.li@windriver.com>

fix serval failure of "python3 -m psutil.tests"

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-fix-failure-test-cases.patch         | 197 ++++++++++++++++++
 .../python/python3-psutil_5.9.0.bb            |   2 +
 2 files changed, 199 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch

diff --git a/meta-python/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch b/meta-python/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
new file mode 100644
index 000000000..34ea03b27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
@@ -0,0 +1,197 @@
+From 8b4e38958ff8bdbb3ece4796bfa2d3b6f7536f71 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 23 Feb 2022 11:54:40 +0800
+Subject: [PATCH] fix failure test cases
+
+The test cases is not robust enough. skip some cases that is
+not suitable for all conditions.
+
+* test_io_counters failed when kernel config CONFIG_TASKSTATS
+  and CONFIG_TASK_IO_ACCOUNTING are not enable in OE 
+* test_setup_script failed since oe don't install setup.py
+* test_used failed since oe use git source for free, so the version
+  is 3.3.17-dirty
+* test_weird_environ failed since gcc not installed
+* test_debug failed since it is designed to run when PSUTIL_DEBUG is set
+* test_against_findmnt/test_comparisons/test_disk_partitions_mocked/
+  test_disk_partitions is not suitable for Linux nfs boot
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ psutil/tests/test_contracts.py | 1 +
+ psutil/tests/test_linux.py     | 8 ++++++--
+ psutil/tests/test_misc.py      | 4 ++++
+ psutil/tests/test_process.py   | 5 +++++
+ psutil/tests/test_system.py    | 1 +
+ psutil/tests/test_unicode.py   | 4 +++-
+ 6 files changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/psutil/tests/test_contracts.py b/psutil/tests/test_contracts.py
+index 7401cc1..bf0fca0 100755
+--- a/psutil/tests/test_contracts.py
++++ b/psutil/tests/test_contracts.py
+@@ -172,6 +172,7 @@ class TestAvailProcessAPIs(PsutilTestCase):
+     def test_rlimit(self):
+         self.assertEqual(hasattr(psutil.Process, "rlimit"), LINUX or FREEBSD)
+ 
++    @unittest.skip("broken on OE since kernel config maye not be enabled")
+     def test_io_counters(self):
+         hasit = hasattr(psutil.Process, "io_counters")
+         self.assertEqual(hasit, False if MACOS or SUNOS else True)
+diff --git a/psutil/tests/test_linux.py b/psutil/tests/test_linux.py
+index 20e28d2..66b6dda 100755
+--- a/psutil/tests/test_linux.py
++++ b/psutil/tests/test_linux.py
+@@ -196,8 +196,9 @@ def get_free_version_info():
+     out = sh(["free", "-V"]).strip()
+     if 'UNKNOWN' in out:
+         raise unittest.SkipTest("can't determine free version")
+-    return tuple(map(int, out.split()[-1].split('.')))
+-
++    vlist = out.split()[-1].split('.')
++    vlist[:] = [n.split('-')[0] for n in vlist]
++    return tuple(map(int, vlist))
+ 
+ @contextlib.contextmanager
+ def mock_open_content(for_path, content):
+@@ -1289,6 +1290,7 @@ class TestRootFsDeviceFinder(PsutilTestCase):
+         finder.ask_sys_class_block()
+ 
+     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS")
++    @unittest.skip("Broken for oe")
+     def test_comparisons(self):
+         finder = RootFsDeviceFinder()
+         self.assertIsNotNone(finder.find())
+@@ -1311,11 +1313,13 @@ class TestRootFsDeviceFinder(PsutilTestCase):
+ 
+     @unittest.skipIf(not which("findmnt"), "findmnt utility not available")
+     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS")
++    @unittest.skip("Broken for oe")
+     def test_against_findmnt(self):
+         psutil_value = RootFsDeviceFinder().find()
+         findmnt_value = sh("findmnt -o SOURCE -rn /")
+         self.assertEqual(psutil_value, findmnt_value)
+ 
++    @unittest.skip("Broken for oe")
+     def test_disk_partitions_mocked(self):
+         with mock.patch(
+                 'psutil._pslinux.cext.disk_partitions',
+diff --git a/psutil/tests/test_misc.py b/psutil/tests/test_misc.py
+index d946eb6..121004a 100755
+--- a/psutil/tests/test_misc.py
++++ b/psutil/tests/test_misc.py
+@@ -54,6 +54,8 @@ from psutil.tests import unittest
+ # ===================================================================
+ 
+ 
++PSUTIL_DEBUG = bool(os.getenv('PSUTIL_DEBUG', 0))
++
+ class TestMisc(PsutilTestCase):
+ 
+     def test_process__repr__(self, func=repr):
+@@ -368,6 +370,7 @@ class TestMisc(PsutilTestCase):
+ 
+     # XXX: https://github.com/pypa/setuptools/pull/2896
+     @unittest.skipIf(APPVEYOR, "temporarily disabled due to setuptools bug")
++    @unittest.skip("OE run this test outof source tree")
+     def test_setup_script(self):
+         setup_py = os.path.join(ROOT_DIR, 'setup.py')
+         if CI_TESTING and not os.path.exists(setup_py):
+@@ -401,6 +404,7 @@ class TestMisc(PsutilTestCase):
+                 reload_module(psutil)
+             self.assertIn("version conflict", str(cm.exception).lower())
+ 
++    @unittest.skipIf(not PSUTIL_DEBUG, "env PSUTIL_DEBUG not set")
+     def test_debug(self):
+         if PY3:
+             from io import StringIO
+diff --git a/psutil/tests/test_process.py b/psutil/tests/test_process.py
+index c9059e3..a34ba3d 100755
+--- a/psutil/tests/test_process.py
++++ b/psutil/tests/test_process.py
+@@ -36,6 +36,7 @@ from psutil._compat import PY3
+ from psutil._compat import FileNotFoundError
+ from psutil._compat import long
+ from psutil._compat import super
++from psutil._compat import which
+ from psutil.tests import APPVEYOR
+ from psutil.tests import CI_TESTING
+ from psutil.tests import GITHUB_ACTIONS
+@@ -726,6 +727,7 @@ class TestProcess(PsutilTestCase):
+             self.assertEqual(' '.join(p.cmdline()), ' '.join(cmdline))
+ 
+     @unittest.skipIf(PYPY, "broken on PYPY")
++    @unittest.skipIf(not which("gcc"), "gcc not installed")
+     def test_long_cmdline(self):
+         testfn = self.get_testfn()
+         create_exe(testfn)
+@@ -740,6 +742,7 @@ class TestProcess(PsutilTestCase):
+         assert pyexe.startswith(name), (pyexe, name)
+ 
+     @unittest.skipIf(PYPY, "unreliable on PYPY")
++    @unittest.skipIf(not which("gcc"), "gcc not installed")
+     def test_long_name(self):
+         testfn = self.get_testfn(suffix="0123456789" * 2)
+         create_exe(testfn)
+@@ -750,6 +753,7 @@ class TestProcess(PsutilTestCase):
+     @unittest.skipIf(SUNOS, "broken on SUNOS")
+     @unittest.skipIf(AIX, "broken on AIX")
+     @unittest.skipIf(PYPY, "broken on PYPY")
++    @unittest.skipIf(not which("gcc"), "gcc not installed")
+     def test_prog_w_funky_name(self):
+         # Test that name(), exe() and cmdline() correctly handle programs
+         # with funky chars such as spaces and ")", see:
+@@ -1408,6 +1412,7 @@ class TestProcess(PsutilTestCase):
+ 
+     @unittest.skipIf(not HAS_ENVIRON, "not supported")
+     @unittest.skipIf(not POSIX, "POSIX only")
++    @unittest.skipIf(not which("gcc"), "gcc not installed")
+     def test_weird_environ(self):
+         # environment variables can contain values without an equals sign
+         code = textwrap.dedent("""
+diff --git a/psutil/tests/test_system.py b/psutil/tests/test_system.py
+index db2cb34..5ee519f 100755
+--- a/psutil/tests/test_system.py
++++ b/psutil/tests/test_system.py
+@@ -580,6 +580,7 @@ class TestDiskAPIs(PsutilTestCase):
+     def test_disk_usage_bytes(self):
+         psutil.disk_usage(b'.')
+ 
++    @unittest.skip("Broken for oe")
+     def test_disk_partitions(self):
+         def check_ntuple(nt):
+             self.assertIsInstance(nt.device, str)
+diff --git a/psutil/tests/test_unicode.py b/psutil/tests/test_unicode.py
+index e635726..7ba5b0f 100755
+--- a/psutil/tests/test_unicode.py
++++ b/psutil/tests/test_unicode.py
+@@ -86,6 +86,7 @@ from psutil import POSIX
+ from psutil import WINDOWS
+ from psutil._compat import PY3
+ from psutil._compat import u
++from psutil._compat import which
+ from psutil.tests import APPVEYOR
+ from psutil.tests import ASCII_FS
+ from psutil.tests import CI_TESTING
+@@ -156,7 +157,7 @@ def try_unicode(suffix):
+ # FS APIs
+ # ===================================================================
+ 
+-
++@unittest.skipIf(not which("gcc"), "gcc not installed")
+ class BaseUnicodeTest(PsutilTestCase):
+     funky_suffix = None
+ 
+@@ -169,6 +170,7 @@ class BaseUnicodeTest(PsutilTestCase):
+ @serialrun
+ @unittest.skipIf(ASCII_FS, "ASCII fs")
+ @unittest.skipIf(PYPY and not PY3, "too much trouble on PYPY2")
++@unittest.skipIf(not which("gcc"), "gcc not installed")
+ class TestFSAPIs(BaseUnicodeTest):
+     """Test FS APIs with a funky, valid, UTF8 path name."""
+ 
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.9.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.9.0.bb
index cf3e0b39c..3df0e5d00 100644
--- a/meta-python/recipes-devtools/python/python3-psutil_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-psutil_5.9.0.bb
@@ -6,6 +6,8 @@ SRC_URI[sha256sum] = "869842dbd66bb80c3217158e629d6fceaecc3a3166d3d1faee515b05dd
 
 inherit pypi setuptools3
 
+SRC_URI += "file://0001-fix-failure-test-cases.patch"
+
 PACKAGES =+ "${PN}-tests"
 
 FILES:${PN}-tests += " \
-- 
2.25.1


