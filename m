Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD227EBFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 01:31:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6A1VlbQ006219
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jul 2019 18:31:47 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 9 Jul 2019 18:31:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 21:30:59 -0400
Message-ID: <1562722259-183795-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-blivetgui: fix blivet-gui broken
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
X-List-Received-Date: Wed, 10 Jul 2019 01:31:47 -0000
Content-Type: text/plain

In target installer anaconda 30, when they try to go to blivet-gui,
anaconda.log shows a traceback:

23:02:49,842 INF threading: Thread Done: AnaExecuteStorageThread (140274838624000)
23:02:49,844 DBG exception: running handleException
23:02:49,845 CRT exception: Traceback (most recent call last):

  File "/usr/lib/python3.7/site-packages/blivetgui/list_devices.py", line 165, in on_disk_selection_changed
    selection.select_iter(self.last_iter)

TypeError: Argument 1 does not allow None as a value

23:02:49,845 DBG exception: Gtk running, queuing exception handler to the main loop
23:02:49,858 DBG ui.common: Entered spoke: BlivetGuiSpoke
23:02:49,858 DBG exception: running handleException
23:02:49,859 CRT exception: Traceback (most recent call last):

  File "/usr/lib/python3.7/site-packages/blivetgui/list_devices.py", line 165, in on_disk_selection_changed
    selection.select_iter(self.last_iter)

TypeError: Argument 1 does not allow None as a value

Backport a patch from upstream could fix the issue
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...urn-type-of-BlivetUtils.get_disks-1658893.patch | 32 ++++++++++++++++++++++
 .../python-blivet/python3-blivetgui_2.1.10.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch b/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch
new file mode 100644
index 0000000..cf80566
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch
@@ -0,0 +1,32 @@
+From 4d0f9f961704bc1dd83fdf6808fb6ab91dc6a768 Mon Sep 17 00:00:00 2001
+From: Vojtech Trefny <vtrefny@redhat.com>
+Date: Thu, 13 Dec 2018 13:39:03 +0100
+Subject: [PATCH] Fix return type of BlivetUtils.get_disks (#1658893)
+
+This must be a list, not a generator, because we are iterating
+over it multiple times in some cases.
+
+Upstream-Status: Backport[git://github.com/rhinstaller/blivet-gui]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ blivetgui/blivet_utils.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/blivetgui/blivet_utils.py b/blivetgui/blivet_utils.py
+index e2bd802..ddb04fc 100644
+--- a/blivetgui/blivet_utils.py
++++ b/blivetgui/blivet_utils.py
+@@ -204,7 +204,7 @@ class BlivetUtils(object):
+ 
+         """
+ 
+-        return (device for device in self.storage.disks if device.type != "mdarray")
++        return [device for device in self.storage.disks if device.type != "mdarray"]
+ 
+     def get_group_devices(self):
+         """ Return list of LVM2 Volume Group devices
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb
index 2ea8103..b7e2493 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb
@@ -10,6 +10,7 @@ B = "${S}"
 
 SRCREV = "67ec0b7a0e065ba24ab87963409bfb21b2aac6dd"
 SRC_URI = "git://github.com/rhinstaller/blivet-gui;branch=master \
+           file://0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch \
 "
 
 inherit distro_features_check
-- 
2.8.1


