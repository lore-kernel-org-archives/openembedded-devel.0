Return-Path: <ticotimo@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id BA53E7E08E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 08:26:07 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id q13so1775824pls.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 00:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u6l6bYRxP1EowzjLubVZx/q2GD+XvTLGHGi86UbLpD8=;
	b=QeF2jQgbe7MmllNo4j7TZEh9waMPaKw+EjBwj+S8CobgtTvt/4Buqo5VcURPlRDXoa
	NPOjBEer4x2b9Xq3Bu/R3mFdpxvI/ITvEaafLdxaGdXjrNxiNzz/tfviHM11+tJaFgpo
	u2npFe4zBLi6jG3IuHHhKBIc1SgvfteVluvkdxxmI40ZUnYEvDEmjQx8ZnVs+9mDMrfo
	dwjfDeh8PIP34sXdFOGibeevDCJcJAqN3dFnySjCeRBNpvI2aj0EHqim2EqEVF+nvm3e
	X6njHlmVOxeINS/CE9UgTSu44AG4oQbRDtT39WSHuEwk47ApNJUOEXnbpcKDmn4UYOaz
	S1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u6l6bYRxP1EowzjLubVZx/q2GD+XvTLGHGi86UbLpD8=;
	b=XVW9Vi9bxQVNG12g1pykJ6hKzIi7lTlPu59fxjVscVjbYMITemnll7UjvH8R+p9P/C
	+5CKe8K7hHyllB/ItSTRikyiWSxQBuJadEGZaI518TxESrJWML+SWChBcymFk3H0pXz+
	x5bimu/U9PtZCQZ6Np6tcKIXeZeNOHj0RXvQdzgTfYL4zRWCZ0xAn2enJBTuTxPsshuX
	L91aSVn+WzX9+cByZdsBoSWwKOZyXK1DKUxv/f/o33mZzmMj/i5gIQn65V7sj7uCbc1X
	Kb333UEMWrQNFnDbnjs3u0ySmLqAvlU3ow2WsIhqaclXIKMwgMovqa4ckopIvRzRfZMm
	Bnlg==
X-Gm-Message-State: APjAAAUqvSpqSiAJElB2sftvxc4mlrR/swLW51wYPhkyq1iPROkhkuyB
	qA04yK+UznYcNsGdixSbwG1HXdBzcEw=
X-Google-Smtp-Source: APXvYqynStQqfW+MyX/UXpFKQm5sNOfuiaAd68EqRpgjmupXYvEtHKWQjxiWNmbpMbWbpC8mlLX0XQ==
X-Received: by 2002:a17:90a:8685:: with SMTP id
	p5mr3777757pjn.92.1579940768180; 
	Sat, 25 Jan 2020 00:26:08 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:ddac:a57d:b60a:6cb7])
	by smtp.gmail.com with ESMTPSA id i11sm9093426pjg.0.2020.01.25.00.26.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 00:26:07 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 00:25:48 -0800
Message-Id: <20200125082548.12976-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][RFC] lib/oeqa/runtime/cases/python2_module.py: add test
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Jan 2020 08:26:07 -0000
Content-Transfer-Encoding: 8bit

This test case is intentionally limited to only tesing one
python package/recipe at a time, because the use case is to
determine whether dependencies have been met for a minimal
image with 'only' the package under test installed. This
dependency checking must include the packages-split python
standard library modules that OE/YP creates from the python
manifest.

TODO: Be smarter about PYTHON_IMPORTS_UNDER_TEST, as this
      should be discoverable from /usr/lib/python2.7/site-packages
      or from the rpm/deb/ipk of the python package itself.
      What we do NOT want to do is use pkgdata or some other
      magical Python script that will add dependencies to the
      test image. We need as pristine and minimalist a test
      environment as we can get.

TODO: Use a minimal master test image and install the package under
      test from a package feed using a package manager in the master
      test image. This would allow for much shorter developement
      cycles.

TODO: Parse the ImportError and give hints about what dependencies
      are missing.

Example configuration in local.conf:

IMAGE_CLASSES += " testimage"
DISTRO_FEAURES_append = " ptest"
EXTRA_IMAGE_FEATURES = "debug-tweaks"
TESTIMAGE_AUTO = "1"
TEST_SUITES = " ping ssh python2 ptest python2_module"
TEST_QEMUPARAMS += "-smp 4 -m 8192"
TEST_RUNQEMUPARAMS += "kvm gl"
IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
IMAGE_INSTALL_append = " ptest-runner dropbear procps coreutils iproute2 sysstat"
PYTHON_PACKAGE_UNDER_TEST = "python-pymongo"
IMAGE_INSTALL_append = " ${PYTHON_PACKAGE_UNDER_TEST}"
PYTHON_IMPORTS_UNDER_TEST = "bson gridfs pymongo"

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 lib/oeqa/runtime/cases/python2_module.py | 97 ++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 lib/oeqa/runtime/cases/python2_module.py

diff --git a/lib/oeqa/runtime/cases/python2_module.py b/lib/oeqa/runtime/cases/python2_module.py
new file mode 100644
index 00000000..59ae00fb
--- /dev/null
+++ b/lib/oeqa/runtime/cases/python2_module.py
@@ -0,0 +1,97 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import OETestDataDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+
+class PythonModuleTest(OERuntimeTestCase):
+    """This test case is intentionally limited to only tesing one
+       python package/recipe at a time, because the use case is to
+       determine whether dependencies have been met for a minimal
+       image with 'only' the package under test installed. This
+       dependency checking must include the packages-split python
+       standard library modules that OE/YP creates from the python
+       manifest.
+
+       TODO: Be smarter about PYTHON_IMPORTS_UNDER_TEST, as this
+             should be discoverable from /usr/lib/python2.7/site-packages
+             or from the rpm/deb/ipk of the python package itself.
+             What we do NOT want to do is use pkgdata or some other
+             magical Python script that will add dependencies to the
+             test image. We need as pristine and minimalist a test
+             environment as we can get.
+
+       TODO: Use a minimal master test image and install the package under
+             test from a package feed using a package manager in the master
+             test image. This would allow for much shorter developement
+             cycles.
+
+       TODO: Parse the ImportError and give hints about what dependencies
+             are missing.
+
+
+       Example configuration in local.conf:
+       
+       IMAGE_CLASSES += " testimage"
+       DISTRO_FEAURES_append = " ptest"
+       EXTRA_IMAGE_FEATURES = "debug-tweaks"
+       TESTIMAGE_AUTO = "1"
+       TEST_SUITES = " ping ssh python2 ptest python2_module"
+       TEST_QEMUPARAMS += "-smp 4 -m 8192"
+       TEST_RUNQEMUPARAMS += "kvm gl"
+       IMAGE_ROOTFS_SIZE ?= "8192"
+       IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
+       IMAGE_INSTALL_append = " ptest-runner dropbear procps coreutils iproute2 sysstat"
+       PYTHON_PACKAGE_UNDER_TEST = "python-engineio"
+       IMAGE_INSTALL_append = " ${PYTHON_PACKAGE_UNDER_TEST}"
+       PYTHON_IMPORTS_UNDER_TEST = "engineio"
+    """
+
+    package = ""
+    imports = []
+
+    @classmethod
+    def setUp(cls):
+        if 'PYTHON_PACKAGE_UNDER_TEST' in cls.tc.td:
+            cls.package = cls.tc.td.get('PYTHON_PACKAGE_UNDER_TEST')
+            cls.logger.debug('Running import test on "%s" recipe' % cls.package)
+        else:
+            cls.logger.error('No recipe to test found in configuration.\n'
+                             'Please set in PYTHON_PACKAGE_UNDER_TEST')
+        if 'PYTHON_IMPORTS_UNDER_TEST' in cls.tc.td:
+            cls.imports = cls.tc.td.get('PYTHON_IMPORTS_UNDER_TEST').split()
+            if isinstance(cls.imports, list) and len(cls.imports) > 0:
+                cls.logger.info('Importing from %s' % cls.imports)
+            else:
+                cls.logger.error("PYTHON_IMPORTS_UNDER_TEST should be a space delimited list")
+                cls.logger.error("typeof(PYTHON_IMPORTS_UNDER_TEST) is %s" % type(cls.imports))
+        else:
+            cls.logger.error("No modules to import found in configuration.\n"
+                             "Please set in variable PYTHON_IMPORTS_UNDER_TEST")
+
+
+class PythonModuleImportTest(PythonModuleTest):
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OETestDepends(['python2.PythonTest.test_python'])
+    @OETestDataDepends(['PYTHON_PACKAGE_UNDER_TEST'])
+    @OETestDataDepends(['PYTHON_IMPORTS_UNDER_TEST'])
+    def test_python_module(self):
+        # We can't use the OEHasPackage decorator, because 'package' isn't defined
+        # until the class has already been instantiated
+        msg = 'Checking if "%s" is installed' % self.package
+        self.logger.debug(msg)
+        if not self.package in self.tc.image_packages:
+            msg = 'Test requires "%s" to be installed' % self.package
+            self.skipTest(msg)
+
+        for python_import in self.imports:
+            cmd = 'python -c "import %s"' % python_import
+            status, output = self.target.run(cmd)
+            msg = 'Exit status was not 0. Output: %s' % output
+            self.assertEqual(status, 0, msg=msg)
-- 
2.25.0


