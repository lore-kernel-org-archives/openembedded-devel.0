Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8282EC433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 09:39:39 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.5192.1648633178680888368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 02:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22U9dbOT026171
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 02:39:37 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 30 Mar 2022 02:39:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 02:39:37 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 30 Mar 2022 02:39:36 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/2] python3-wxgtk4: add recipe
Date: Wed, 30 Mar 2022 17:39:33 +0800
Message-ID: <20220330093933.12701-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220330093933.12701-1-kai.kang@windriver.com>
References: <20220330093933.12701-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Mar 2022 09:39:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96266

From: Kai Kang <kai.kang@windriver.com>

Add recipe for python3-wxgtk4 which is a python3 interface to the
wxWidgets Cross-platform C++ GUI toolkit.

Add patches to
* add back build options for oe
* fixup build scripts for cross compile
* fix sip oevrride functions compile errors

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../add-back-option-build-base.patch          | 22 ++++++++
 .../sip-fix-override-functions.patch          | 35 ++++++++++++
 .../wxgtk-fixup-build-scripts.patch           | 53 +++++++++++++++++++
 .../python3-wxgtk4/python3-wxgtk4_4.1.1.bb    | 32 +++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
 create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch
 create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
 create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
new file mode 100644
index 000000000..a46f3f870
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
@@ -0,0 +1,22 @@
+Add back default user options for cross build.
+
+Upstream-Status: Pending [oe specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index a215da7..dccfeb3 100644
+--- a/setup.py
++++ b/setup.py
+@@ -105,7 +105,7 @@ class wx_build(orig_build):
+     Delegate to build.py for doing the actual build, (including wxWidgets)
+     instead of letting distutils do it all.
+     """
+-    user_options = [
++    user_options = orig_build.user_options + [
+         ('skip-build', None, 'skip building the C/C++ code (assumes it has already been done)'),
+         ]
+     boolean_options = ['skip-build']
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch
new file mode 100644
index 000000000..51b9a462b
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch
@@ -0,0 +1,35 @@
+It fails to compile with errors:
+
+| ../../../../sip/cpp/sip_gridwxGridEvent.cpp:35:9: error: 'int sipwxGridEvent::GetRow()'
+  marked 'override', but does not override
+|    35 |     int GetRow() SIP_OVERRIDE;
+|       |         ^~~~~~
+| ../../../../sip/cpp/sip_gridwxGridEvent.cpp:36:9: error: 'int sipwxGridEvent::GetCol()'
+  marked 'override', but does not over      ride
+|    36 |     int GetCol() SIP_OVERRIDE;
+|       |         ^~~~~~
+
+Make these functions non-override.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ sip/cpp/sip_gridwxGridEvent.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sip/cpp/sip_gridwxGridEvent.cpp b/sip/cpp/sip_gridwxGridEvent.cpp
+index 0830b677..314aec94 100644
+--- a/sip/cpp/sip_gridwxGridEvent.cpp
++++ b/sip/cpp/sip_gridwxGridEvent.cpp
+@@ -32,8 +32,8 @@ public:
+      * this class.
+      */
+ protected:
+-    int GetRow() SIP_OVERRIDE;
+-    int GetCol() SIP_OVERRIDE;
++    int GetRow() ;
++    int GetCol() ;
+      ::wxEvent* Clone() const SIP_OVERRIDE;
+      ::wxEventCategory GetEventCategory() const SIP_OVERRIDE;
+ 
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
new file mode 100644
index 000000000..0d65ebb59
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
@@ -0,0 +1,53 @@
+Fix issues in build scripts:
+
+* remove hardcode lib path from buildtools/config.py which is not suitable for
+  cross build
+* only build target 'build_py' in setup.py
+* do not override self.install_lib with self.install_platlib which causes
+  package issue when multilib is enabled.
+
+Upstream-Status: Pending [cross build specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ buildtools/config.py | 4 ++--
+ setup.py             | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/buildtools/config.py b/buildtools/config.py
+index c837e5d..d426005 100644
+--- a/buildtools/config.py
++++ b/buildtools/config.py
+@@ -312,8 +312,8 @@ class Configuration(object):
+                 # wx-config doesn't output that for some reason.  For now, just
+                 # add it unconditionally but we should really check if the lib is
+                 # really found there or wx-config should be fixed.
+-                if self.WXPORT != 'msw':
+-                    self.libdirs.append("/usr/X11R6/lib")
++                #if self.WXPORT != 'msw':
++                #    self.libdirs.append("/usr/X11R6/lib")
+ 
+             # Move the various -I, -D, etc. flags we got from the config scripts
+             # into the distutils lists.
+diff --git a/setup.py b/setup.py
+index 64bec4b..fb29253 100644
+--- a/setup.py
++++ b/setup.py
+@@ -130,7 +130,7 @@ class wx_build(orig_build):
+                 'message and the wxWidgets and Phoenix build steps in the future.\n')
+ 
+             # Use the same Python that is running this script.
+-            cmd = ['"{}"'.format(sys.executable), '-u', 'build.py', 'build']
++            cmd = ['"{}"'.format(sys.executable), '-u', 'build.py', 'build_py']
+             cmd = ' '.join(cmd)
+             runcmd(cmd)
+ 
+@@ -233,7 +233,7 @@ if haveWheel:
+ class wx_install(orig_install):
+     def finalize_options(self):
+         orig_install.finalize_options(self)
+-        self.install_lib = self.install_platlib
++        #self.install_lib = self.install_platlib
+ 
+     def run(self):
+         self.run_command("build")
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
new file mode 100644
index 000000000..af7b51d83
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Python3 interface to the wxWidgets Cross-platform C++ GUI toolkit."
+HOMEPAGE = "http://www.wxpython.org"
+
+LICENSE = "WXwindows"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce1d18e2d633d41786c0a8dfbc80917"
+
+DEPENDS = "wxwidgets-native wxwidgets"
+
+PYPI_PACKAGE = "wxPython"
+
+SRC_URI += "file://add-back-option-build-base.patch \
+            file://wxgtk-fixup-build-scripts.patch \
+            file://sip-fix-override-functions.patch \
+            "
+SRC_URI[sha256sum] = "00e5e3180ac7f2852f342ad341d57c44e7e4326de0b550b9a5c4a8361b6c3528"
+
+S = "${WORKDIR}/wxPython-${PV}"
+
+inherit pypi setuptools3 pkgconfig
+
+export WX_CONFIG = "${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config"
+
+RDEPENDS:${PN} = "\
+    python3-difflib \
+    python3-image \
+    python3-numpy \
+    python3-pillow \
+    python3-pprint \
+    python3-pycairo \
+    python3-six \
+    python3-xml \
+"
-- 
2.17.1


