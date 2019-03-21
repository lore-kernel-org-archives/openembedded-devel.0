Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8421A6C0EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 11:13:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2LBDPnn025117
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 04:13:35 -0700
Received: from otp-opanait-l1.corp.ad.wrs.com (128.224.124.169) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 21 Mar 2019 04:13:14 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Mar 2019 13:12:26 +0200
Message-ID: <20190321111226.9746-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [thud][meta-python][PATCH] python3-blivetgui: Fix _supported_filesystems crash
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
X-List-Received-Date: Thu, 21 Mar 2019 11:13:45 -0000
Content-Type: text/plain

Fix the following error when attempting to use blivet-gui in anaconda:
Traceback (most recent call first):
  File "/usr/lib64/python3.5/site-packages/blivetgui/blivetgui.py", line 153, in supported_filesystems
    if self._supported_filesystems:
  File "/usr/lib64/python3.5/site-packages/blivetgui/blivetgui.py", line 456, in add_device
    supported_filesystems=self.supported_filesystems,
AttributeError: 'BlivetGUIAnaconda' object has no attribute '_supported_filesystems'

Reference:
https://github.com/storaged-project/blivet-gui/pull/100/

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 ...ilesystems-in-BlivetGUIAnaconda-init.patch | 39 +++++++++++++++++++
 .../python-blivet/python3-blivetgui_2.1.8.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Set-_supported_filesystems-in-BlivetGUIAnaconda-init.patch

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Set-_supported_filesystems-in-BlivetGUIAnaconda-init.patch b/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Set-_supported_filesystems-in-BlivetGUIAnaconda-init.patch
new file mode 100644
index 000000000..25a71d4a7
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Set-_supported_filesystems-in-BlivetGUIAnaconda-init.patch
@@ -0,0 +1,39 @@
+From a7b76f783608033e449ba1e33d040c2b40c01a4d Mon Sep 17 00:00:00 2001
+From: Adam Williamson <awilliam@redhat.com>
+Date: Wed, 17 Jan 2018 10:38:18 -0800
+Subject: [PATCH] Set _supported_filesystems in BlivetGUIAnaconda init
+
+BlivetGUIAnaconda subclasses BlivetGUI, but doesn't call the
+parent class's __init__. c4b6e174 added supported_filesystems
+to BlivetGUI and set _supported_filesystems for caching during
+__init__, but this was not also added to BlivetGUIAnaconda, so
+when anything tries to use the supported_filesystems property
+of a BlivetGUIAnaconda instance, it will crash. This is causing
+all attempts to use blivet-gui in anaconda to crash since 2.1.8
+landed in Rawhide.
+
+Upstream-Status: Backport [https://github.com/storaged-project/blivet-gui]
+
+Signed-off-by: Adam Williamson <awilliam@redhat.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ blivetgui/osinstall.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/blivetgui/osinstall.py b/blivetgui/osinstall.py
+index 21806ca..32ff66b 100644
+--- a/blivetgui/osinstall.py
++++ b/blivetgui/osinstall.py
+@@ -94,6 +94,9 @@ class BlivetGUIAnaconda(BlivetGUI):
+         self.builder.set_translation_domain("blivet-gui")
+         self.builder.add_from_file(locate_ui_file("blivet-gui.ui"))
+ 
++        # supported filesystems
++        self._supported_filesystems = []
++
+         # CSS styles
+         css_provider = Gtk.CssProvider()
+         css_provider.load_from_path(locate_css_file("rectangle.css"))
+-- 
+2.20.1
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.8.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.8.bb
index 91f0dff71..5f62b9e5c 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.8.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.8.bb
@@ -10,6 +10,7 @@ B = "${S}"
 
 SRCREV = "a4fd427ee2acc5a8f5fb030bf7816917cee63bd8"
 SRC_URI = "git://github.com/rhinstaller/blivet-gui;branch=master \
+    file://0001-Set-_supported_filesystems-in-BlivetGUIAnaconda-init.patch \
 "
 
 inherit distro_features_check
-- 
2.20.1


