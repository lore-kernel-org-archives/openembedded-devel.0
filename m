Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.1576.1627971225503202434
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 23:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1736DhEQ006493
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 23:13:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1736DhxR000692
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 23:13:43 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 2 Aug 2021 23:13:43 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 2 Aug 2021 23:13:42 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/2] python3-blivet: 3.1.4 -> 3.4.0
Date: Tue, 3 Aug 2021 14:13:38 +0800
Message-ID: <20210803061339.2196-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade python3-blivet from 3.1.4 to 3.4.0.
* it imports selinux conditionally, so remove
  0001-comment-out-selinux.patch
* rebase 0008-use-oe-variable-to-replace-hardcoded-dir.patch and
  0010-invoking-mkfs-with-infinite-timeout.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-comment-out-selinux.patch            | 70 -------------------
 ...oe-variable-to-replace-hardcoded-dir.patch |  8 ++-
 ...-invoking-mkfs-with-infinite-timeout.patch | 10 ++-
 ...livet_3.1.4.bb => python3-blivet_3.4.0.bb} |  5 +-
 4 files changed, 15 insertions(+), 78 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.1.4.bb => python3-blivet_3.4.0.bb} (89%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
deleted file mode 100644
index 90fa387b0..000000000
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From fc8e93530ba017ecfe111e53d3cbdc3a5b3ac286 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 23 Nov 2018 16:58:38 +0800
-Subject: [PATCH 01/11] comment out selinux
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- blivet/flags.py | 5 +++--
- blivet/util.py  | 6 +++++-
- 2 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/blivet/flags.py b/blivet/flags.py
-index 4e26d82..94324ff 100644
---- a/blivet/flags.py
-+++ b/blivet/flags.py
-@@ -20,7 +20,7 @@
- #
- 
- import shlex
--import selinux
-+#import selinux
- 
- 
- class Flags(object):
-@@ -47,7 +47,8 @@ class Flags(object):
-         #
-         # enable/disable functionality
-         #
--        self.selinux = selinux.is_selinux_enabled()
-+        #self.selinux = selinux.is_selinux_enabled()
-+        self.selinux = False
-         self.multipath = True
-         self.dmraid = True
-         self.ibft = True
-diff --git a/blivet/util.py b/blivet/util.py
-index 9daf151..4eac8b9 100644
---- a/blivet/util.py
-+++ b/blivet/util.py
-@@ -3,7 +3,7 @@ import functools
- import glob
- import itertools
- import os
--import selinux
-+#import selinux
- import subprocess
- import re
- import sys
-@@ -444,6 +444,8 @@ def get_cow_sysfs_path(dev_path, dev_sysfsPath):
- def match_path_context(path):
-     """ Return the default SELinux context for the given path. """
-     context = None
-+    return context
-+
-     try:
-         context = selinux.matchpathcon(os.path.normpath(path), 0)[1]
-     except OSError as e:
-@@ -468,6 +470,8 @@ def set_file_context(path, context, root=None):
- 
-             True if successful, False if not.
-     """
-+    return False
-+
-     if root is None:
-         root = '/'
- 
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
index ade1862d7..1c9c2d31b 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
@@ -6,6 +6,10 @@ Subject: [PATCH 08/11] use oe variable to replace hardcoded dir
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase for python3-blivet 3.4.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  setup.py | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -19,11 +23,11 @@ index b745a79..b5b4258 100644
  
  data_files = [
 -    ('/etc/dbus-1/system.d', ['dbus/blivet.conf']),
--    ('/usr/share/dbus-1/system-services', ['dbus/com.redhat.Blivet1.service']),
+-    ('/usr/share/dbus-1/system-services', ['dbus/com.redhat.Blivet0.service']),
 -    ('/usr/libexec', ['dbus/blivetd']),
 -    ('/usr/lib/systemd/system', ['dbus/blivet.service'])
 +    (os.environ.get('sysconfdir')+'/dbus-1/system.d', ['dbus/blivet.conf']),
-+    (os.environ.get('datadir')+'/dbus-1/system-services', ['dbus/com.redhat.Blivet1.service']),
++    (os.environ.get('datadir')+'/dbus-1/system-services', ['dbus/com.redhat.Blivet0.service']),
 +    (os.environ.get('libexecdir'), ['dbus/blivetd']),
 +    (os.environ.get('systemd_system_unitdir'), ['dbus/blivet.service'])
  ]
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
index f12849045..c441acd17 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
@@ -9,17 +9,21 @@ lots of disks, or with slow disks.
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase for python3-blivet 3.4.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  blivet/tasks/fsmkfs.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/tasks/fsmkfs.py b/blivet/tasks/fsmkfs.py
-index ad166aa..7bf5075 100644
+index e4a6aaa8..9730f7e5 100644
 --- a/blivet/tasks/fsmkfs.py
 +++ b/blivet/tasks/fsmkfs.py
-@@ -170,7 +170,7 @@ class FSMkfs(task.BasicApplication, FSMkfsTask):
+@@ -203,7 +203,7 @@ class FSMkfs(task.BasicApplication, FSMkfsTask):
          options = options or []
-         cmd = self._mkfs_command(options, label, set_uuid)
+         cmd = self._mkfs_command(options, label, set_uuid, nodiscard)
          try:
 -            ret = util.run_program(cmd)
 +            ret = util.run_program(cmd, timeout=-1)
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.0.bb
similarity index 89%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.4.0.bb
index 2b5b253b5..f77c318ae 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.0.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "9b5ad2d5b5df159963e1c6c24523e1dfe1f71435"
-SRC_URI = "git://github.com/rhinstaller/blivet;branch=3.1-release \
-           file://0001-comment-out-selinux.patch \
+SRCREV = "f7d9027e4fdad11187980e73726cd75a2dc962c2"
+SRC_URI = "git://github.com/storaged-project/blivet.git;branch=3.4-release \
            file://0002-run_program-support-timeout.patch \
            file://0003-support-infinit-timeout.patch \
            file://0004-fix-new.roots-object-is-not-iterable.patch \
-- 
2.17.1

