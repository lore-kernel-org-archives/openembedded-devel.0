Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 080F777FC3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:09:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I69XOe013612
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jul 2017 23:09:33 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 23:09:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jul 2017 02:09:12 -0400
Message-ID: <709861cfabf74c7a0cefb15d791399e0f9a1f76f.1500357921.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500357921.git.hongxu.jia@windriver.com>
References: <cover.1500357921.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] python3-prctl: add recipe 1.6.1
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
X-List-Received-Date: Tue, 18 Jul 2017 06:09:33 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-support-cross-complication.patch          | 61 ++++++++++++++++++++++
 .../recipes-devtools/python/python3-prctl_1.6.1.bb | 22 ++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-prctl_1.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch b/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
new file mode 100644
index 0000000..775ae1b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
@@ -0,0 +1,61 @@
+From 9a16800738547d117284354bbcad7dd77d9d0344 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 21 Apr 2016 03:05:57 -0400
+Subject: [PATCH] support cross-complication
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ setup.py | 35 -----------------------------------
+ 1 file changed, 35 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 658d1a5..e8be7eb 100755
+--- a/setup.py
++++ b/setup.py
+@@ -13,41 +13,6 @@ import sys
+ # - Need gcc
+ # - Need C headers
+ # - Need libcap headers
+-if not sys.platform.startswith('linux'):
+-    sys.stderr.write("This module only works on linux\n")
+-    sys.exit(1)
+-
+-kvers = os.uname()[2]
+-if kvers < '2.6.18' and not os.environ.get("PRCTL_SKIP_KERNEL_CHECK",False):
+-    sys.stderr.write("This module requires linux 2.6.18 or newer\n")
+-    sys.exit(1)
+-
+-if sys.version_info[:2] < (2,4):
+-    sys.stderr.write("This module requires python 2.4 or newer\n")
+-    sys.exit(1)
+-
+-exit = False
+-try:
+-    subprocess.call(['gcc','-v'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+-except:
+-    sys.stderr.write("You need to install gcc to build this module\n")
+-    sys.exit(1)
+-
+-sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+-sp.communicate('#include <sys/prctl.h>\n'.encode())
+-if sp.returncode:
+-    sys.stderr.write("You need to install libc development headers to build this module\n")
+-    exit = True
+-
+-sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+-sp.communicate('#include <sys/capability.h>\n'.encode())
+-if sp.returncode:
+-    sys.stderr.write("You need to install libcap development headers to build this module\n")
+-    exit = True
+-
+-if exit:
+-    sys.exit(1)
+-
+ _prctl = Extension("_prctl",
+                    sources = ['_prctlmodule.c'],
+                    depends = ['securebits.h'],
+-- 
+2.8.1
+
diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.6.1.bb b/meta-python/recipes-devtools/python/python3-prctl_1.6.1.bb
new file mode 100644
index 0000000..5de83ce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-prctl_1.6.1.bb
@@ -0,0 +1,22 @@
+SUMMARY  = "Control process attributes through prctl"
+DESCRIPTION = "The linux prctl function allows you to control specific characteristics of a \
+process' behaviour. Usage of the function is fairly messy though, due to \
+limitations in C and linux. This module provides a nice non-messy python(ic) \
+interface."
+SECTION = "devel/python"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5eb2f4bcd60326f83e5deb542372d52f"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+SRCREV = "1107d0be7bec4b28c85c62c454882d16844c930a"
+PV = "1.6.1+git${SRCPV}"
+
+SRC_URI = "git://github.com/seveas/python-prctl;branch=master \
+           file://0001-support-cross-complication.patch \
+"
+inherit setuptools3 python3native
+
+DEPENDS += "libcap"
+
-- 
2.8.1


