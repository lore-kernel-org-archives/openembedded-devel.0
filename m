Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 704F578DC8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 08:17:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w718HSgr022786
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 01:17:29 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 01:17:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 16:27:43 +0800
Message-ID: <ed7e4ba427cdb1856bcb7e9ca55a7a62060a0554.1533111522.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533111522.git.hongxu.jia@windriver.com>
References: <cover.1533111522.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 14/16 V2] python3-blivet: 2.2.0 -> 3.0.1
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
X-List-Received-Date: Wed, 01 Aug 2018 08:17:28 -0000
Content-Type: text/plain

- Drop 0004-Mount-var-volatile-during-install.patch and
  0005-update-fstab-by-appending.patch
  which are moved to python3-anaconda 28.22.11

- Drop 0013-Revert-Adapt-to-logging-module-name-change.patch
  whichis obsolete

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python3-blivet/0001-comment-out-selinux.patch  | 20 ++++----
 .../0002-run_program-support-timeout.patch         | 10 ++--
 .../0003-support-infinit-timeout.patch             | 16 +++---
 .../0004-Mount-var-volatile-during-install.patch   | 59 ----------------------
 ...004-fix-new.roots-object-is-not-iterable.patch} |  8 +--
 ...orrect-timeout-while-system-time-changed.patch} |  8 +--
 .../0005-update-fstab-by-appending.patch           | 32 ------------
 ...kages.patch => 0006-tweak-btrfs-packages.patch} | 10 ++--
 ...007-invoking-mount-with-infinite-timeout.patch} |  8 +--
 ...use-oe-variable-to-replace-hardcoded-dir.patch} |  6 +--
 ...0009-invoking-fsck-with-infinite-timeout.patch} |  6 +--
 ...0010-invoking-mkfs-with-infinite-timeout.patch} |  4 +-
 ...> 0011-invoking-dd-with-infinite-timeout.patch} | 10 ++--
 ...evert-Adapt-to-logging-module-name-change.patch | 30 -----------
 ...on3-blivet_2.2.0.bb => python3-blivet_3.0.1.bb} | 25 ++++-----
 15 files changed, 64 insertions(+), 188 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0004-Mount-var-volatile-during-install.patch
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0006-fix-new.roots-object-is-not-iterable.patch => 0004-fix-new.roots-object-is-not-iterable.patch} (78%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0007-fix-incorrect-timeout-while-system-time-changed.patch => 0005-fix-incorrect-timeout-while-system-time-changed.patch} (86%)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0005-update-fstab-by-appending.patch
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0008-tweak-btrfs-packages.patch => 0006-tweak-btrfs-packages.patch} (85%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0009-invoking-mount-with-infinite-timeout.patch => 0007-invoking-mount-with-infinite-timeout.patch} (74%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0010-use-oe-variable-to-replace-hardcoded-dir.patch => 0008-use-oe-variable-to-replace-hardcoded-dir.patch} (85%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0011-invoking-fsck-with-infinite-timeout.patch => 0009-invoking-fsck-with-infinite-timeout.patch} (84%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0012-invoking-mkfs-with-infinite-timeout.patch => 0010-invoking-mkfs-with-infinite-timeout.patch} (87%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0014-invoking-dd-with-infinite-timeout.patch => 0011-invoking-dd-with-infinite-timeout.patch} (78%)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0013-Revert-Adapt-to-logging-module-name-change.patch
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_2.2.0.bb => python3-blivet_3.0.1.bb} (51%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
index 0ee3205..c77b86a 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
@@ -1,7 +1,7 @@
-From 7d483c27ac0a23ca3bba7f320918afc40013bd8e Mon Sep 17 00:00:00 2001
+From 648a18bfc447f076d48ae4147d984b8ef56e37aa Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 8 May 2017 14:25:52 +0800
-Subject: [PATCH 01/13] comment out selinux
+Date: Mon, 30 Jul 2018 16:13:40 +0800
+Subject: [PATCH 01/11] comment out selinux
 
 Upstream-Status: Inappropriate [oe specific]
 
@@ -12,7 +12,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 8 insertions(+), 3 deletions(-)
 
 diff --git a/blivet/flags.py b/blivet/flags.py
-index 06822db..b55a93f 100644
+index 1840121..8789390 100644
 --- a/blivet/flags.py
 +++ b/blivet/flags.py
 @@ -20,7 +20,7 @@
@@ -24,7 +24,7 @@ index 06822db..b55a93f 100644
  
  
  class Flags(object):
-@@ -49,7 +49,8 @@ class Flags(object):
+@@ -47,7 +47,8 @@ class Flags(object):
          #
          # enable/disable functionality
          #
@@ -35,19 +35,19 @@ index 06822db..b55a93f 100644
          self.dmraid = True
          self.ibft = True
 diff --git a/blivet/util.py b/blivet/util.py
-index e3e71ce..0cf5188 100644
+index 7334ff6..0f2a995 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -4,7 +4,7 @@ import glob
+@@ -3,7 +3,7 @@ import functools
+ import glob
  import itertools
  import os
- import shutil
 -import selinux
 +#import selinux
  import subprocess
  import re
  import sys
-@@ -431,6 +431,8 @@ def get_cow_sysfs_path(dev_path, dev_sysfsPath):
+@@ -430,6 +430,8 @@ def get_cow_sysfs_path(dev_path, dev_sysfsPath):
  def match_path_context(path):
      """ Return the default SELinux context for the given path. """
      context = None
@@ -56,7 +56,7 @@ index e3e71ce..0cf5188 100644
      try:
          context = selinux.matchpathcon(os.path.normpath(path), 0)[1]
      except OSError as e:
-@@ -455,6 +457,8 @@ def set_file_context(path, context, root=None):
+@@ -454,6 +456,8 @@ def set_file_context(path, context, root=None):
  
              True if successful, False if not.
      """
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
index 01e71be..fea2254 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
@@ -1,7 +1,7 @@
-From 86744d408b91acdcb086a03d7779fcda152f2ac3 Mon Sep 17 00:00:00 2001
+From 596979ed58109141a7fee680ab95b27296c022b1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 14:39:56 +0800
-Subject: [PATCH 02/13] run_program support timeout
+Subject: [PATCH 02/11] run_program support timeout
 
 Upstream-Status: Pending
 
@@ -11,10 +11,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 39 insertions(+), 29 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index 0cf5188..d4bd9bb 100644
+index 0f2a995..05a253c 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -158,6 +158,30 @@ class Path(str):
+@@ -157,6 +157,30 @@ class Path(str):
      def __hash__(self):
          return self._path.__hash__()
  
@@ -45,7 +45,7 @@ index 0cf5188..d4bd9bb 100644
  
  def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=False, binary_output=False):
      if env_prune is None:
-@@ -180,36 +204,22 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -179,36 +203,22 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
              stderr_dir = subprocess.STDOUT
          else:
              stderr_dir = subprocess.PIPE
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
index 489fb56..38f061e 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
@@ -1,7 +1,7 @@
-From 923265e04df5920fc99393aa05f584032aa1b383 Mon Sep 17 00:00:00 2001
+From 325898f3f2951bbde07da47888175c427b11ddc3 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 16:18:02 +0800
-Subject: [PATCH 03/13] support infinit timeout
+Subject: [PATCH 03/11] support infinit timeout
 
 Upstream-Status: Pending
 
@@ -11,10 +11,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index d4bd9bb..44a2da5 100644
+index 05a253c..d6804be 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -158,6 +158,7 @@ class Path(str):
+@@ -157,6 +157,7 @@ class Path(str):
      def __hash__(self):
          return self._path.__hash__()
  
@@ -22,7 +22,7 @@ index d4bd9bb..44a2da5 100644
  def timeout_command(argv, timeout, *args, **kwargs):
      """call shell-command and either return its output or kill it
      if it doesn't normally exit within timeout seconds and return None"""
-@@ -169,7 +170,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -168,7 +169,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
          while proc.poll() is None:
              time.sleep(0.1)
              now = datetime.datetime.now()
@@ -31,7 +31,7 @@ index d4bd9bb..44a2da5 100644
                  os.kill(proc.pid, signal.SIGKILL)
                  os.waitpid(-1, os.WNOHANG)
                  program_log.debug("%d seconds timeout" % timeout)
-@@ -183,7 +184,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -182,7 +183,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
      program_log.debug("Return code: %d", proc.returncode)
      return (proc.returncode, proc.stdout.read())
  
@@ -40,7 +40,7 @@ index d4bd9bb..44a2da5 100644
      if env_prune is None:
          env_prune = []
  
-@@ -192,7 +193,10 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -191,7 +192,10 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
              os.chroot(root)
  
      with program_log_lock:  # pylint: disable=not-context-manager
@@ -52,7 +52,7 @@ index d4bd9bb..44a2da5 100644
  
          env = os.environ.copy()
          env.update({"LC_ALL": "C",
-@@ -205,7 +209,7 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -204,7 +208,7 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
          else:
              stderr_dir = subprocess.PIPE
  
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0004-Mount-var-volatile-during-install.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0004-Mount-var-volatile-during-install.patch
deleted file mode 100644
index cb837e2..0000000
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0004-Mount-var-volatile-during-install.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From c3959bd00665e24a955bbdbea1ef555e76372f12 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 8 May 2017 16:25:16 +0800
-Subject: [PATCH 04/13] Mount /var/volatile during install
-
-The installed system needs /var/volatile clean, otherwise it
-caused systemd's journalctl failed to record boot log.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- blivet/osinstall.py | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/blivet/osinstall.py b/blivet/osinstall.py
-index a4f9535..61819c2 100644
---- a/blivet/osinstall.py
-+++ b/blivet/osinstall.py
-@@ -294,6 +294,7 @@ class FSSet(object):
-         self._sysfs = None
-         self._proc = None
-         self._devshm = None
-+        self._volatile = None
-         self._usb = None
-         self._selinux = None
-         self._run = None
-@@ -335,6 +336,12 @@ class FSSet(object):
-         return self._devshm
- 
-     @property
-+    def volatile(self):
-+        if not self._volatile:
-+            self._volatile = NoDevice(fmt=get_format("tmpfs", device="tmpfs", mountpoint="/var/volatile"))
-+        return self._volatile
-+
-+    @property
-     def usb(self):
-         if not self._usb:
-             self._usb = NoDevice(fmt=get_format("usbfs", device="usbfs", mountpoint="/proc/bus/usb"))
-@@ -591,6 +598,7 @@ class FSSet(object):
- 
-         devices = list(self.mountpoints.values()) + self.swap_devices
-         devices.extend([self.dev, self.devshm, self.devpts, self.sysfs,
-+                        self.volatile,
-                         self.proc, self.selinux, self.usb, self.run])
-         if isinstance(_platform, EFI):
-             devices.append(self.efivars)
-@@ -650,6 +658,7 @@ class FSSet(object):
-         """ unmount filesystems, except swap if swapoff == False """
-         devices = list(self.mountpoints.values()) + self.swap_devices
-         devices.extend([self.dev, self.devshm, self.devpts, self.sysfs,
-+                        self.volatile,
-                         self.proc, self.usb, self.selinux, self.run])
-         if isinstance(_platform, EFI):
-             devices.append(self.efivars)
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0006-fix-new.roots-object-is-not-iterable.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0004-fix-new.roots-object-is-not-iterable.patch
similarity index 78%
rename from meta-python/recipes-extended/python-blivet/python3-blivet/0006-fix-new.roots-object-is-not-iterable.patch
rename to meta-python/recipes-extended/python-blivet/python3-blivet/0004-fix-new.roots-object-is-not-iterable.patch
index f5ff754..be997ac 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0006-fix-new.roots-object-is-not-iterable.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0004-fix-new.roots-object-is-not-iterable.patch
@@ -1,7 +1,7 @@
-From cd92eea8fab37ba6b0c7f03daa5255343dc75716 Mon Sep 17 00:00:00 2001
+From c31df1c0f5323ddc70e0d1c6d11db2fbf7a024ad Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 16:30:20 +0800
-Subject: [PATCH 06/13] fix new.roots object is not iterable
+Subject: [PATCH 04/11] fix new.roots object is not iterable
 
 Upstream-Status: Pending
 
@@ -11,10 +11,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/blivet.py b/blivet/blivet.py
-index 6a33e9c..79ae91a 100644
+index 3405810..f42b73b 100644
 --- a/blivet/blivet.py
 +++ b/blivet/blivet.py
-@@ -1761,7 +1761,7 @@ class Blivet(object):
+@@ -1198,7 +1198,7 @@ class Blivet(object):
              p = partition.disk.format.parted_disk.getPartitionByPath(partition.path)
              partition.parted_partition = p
  
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0007-fix-incorrect-timeout-while-system-time-changed.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
similarity index 86%
rename from meta-python/recipes-extended/python-blivet/python3-blivet/0007-fix-incorrect-timeout-while-system-time-changed.patch
rename to meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
index 6512d86..ecb9503 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0007-fix-incorrect-timeout-while-system-time-changed.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
@@ -1,7 +1,7 @@
-From 78ee2b9090f9400ccc4f730e674f5ae972740ccb Mon Sep 17 00:00:00 2001
+From b30a74671ca603e6bfd514f72d4fd7fd6fceef54 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 26 Aug 2016 02:02:49 -0400
-Subject: [PATCH 07/13] fix incorrect timeout while system time changed
+Subject: [PATCH 05/11] fix incorrect timeout while system time changed
 
 While system time changed by NTP, invoking timeout_command
 breaks with incorrect timeout.
@@ -22,10 +22,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index 44a2da5..b3c45ac 100644
+index d6804be..bc08af5 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -163,14 +163,14 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -162,14 +162,14 @@ def timeout_command(argv, timeout, *args, **kwargs):
      """call shell-command and either return its output or kill it
      if it doesn't normally exit within timeout seconds and return None"""
      import subprocess, datetime, os, time, signal
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0005-update-fstab-by-appending.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-update-fstab-by-appending.patch
deleted file mode 100644
index 4f343b7..0000000
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0005-update-fstab-by-appending.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 386ff899763f8473eb93a7a1578fb7cc4f86f66d Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 8 May 2017 16:28:12 +0800
-Subject: [PATCH 05/13] update fstab by appending
-
-The 'storage.write()' has updated fstab by overwriting
-the original one, we should update fstab by appending
-to keep original tmpfs partitions.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- blivet/osinstall.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/blivet/osinstall.py b/blivet/osinstall.py
-index 61819c2..afa82db 100644
---- a/blivet/osinstall.py
-+++ b/blivet/osinstall.py
-@@ -728,7 +728,7 @@ class FSSet(object):
-         # /etc/fstab
-         fstab_path = os.path.normpath("%s/etc/fstab" % get_sysroot())
-         fstab = self.fstab()
--        open(fstab_path, "w").write(fstab)
-+        open(fstab_path, "a").write(fstab)
- 
-         # /etc/crypttab
-         crypttab_path = os.path.normpath("%s/etc/crypttab" % get_sysroot())
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0008-tweak-btrfs-packages.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
similarity index 85%
rename from meta-python/recipes-extended/python-blivet/python3-blivet/0008-tweak-btrfs-packages.patch
rename to meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
index 121336e..da568a4 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0008-tweak-btrfs-packages.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
@@ -1,7 +1,7 @@
-From 6f661a511eea096c073888c7adb836a9a880b476 Mon Sep 17 00:00:00 2001
+From 0659d8a85bcdd76c0b23b8b5af6958783d35ac65 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 16:33:15 +0800
-Subject: [PATCH 08/13] tweak btrfs packages
+Subject: [PATCH 06/11] tweak btrfs packages
 
 In oe-cre/yocto, we name btrfs package with btrfs-tools,
 rather than btrfs-progs.
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/blivet/devices/btrfs.py b/blivet/devices/btrfs.py
-index c5cb21f..9d417b2 100644
+index cada940..7e4d4b8 100644
 --- a/blivet/devices/btrfs.py
 +++ b/blivet/devices/btrfs.py
 @@ -55,7 +55,7 @@ class BTRFSDevice(StorageDevice):
@@ -28,10 +28,10 @@ index c5cb21f..9d417b2 100644
  
      def __init__(self, *args, **kwargs):
 diff --git a/blivet/formats/fs.py b/blivet/formats/fs.py
-index a49826f..e8f216d 100644
+index 81e367f..55e5d57 100644
 --- a/blivet/formats/fs.py
 +++ b/blivet/formats/fs.py
-@@ -918,7 +918,7 @@ class BTRFS(FS):
+@@ -926,7 +926,7 @@ class BTRFS(FS):
      _formattable = True
      _linux_native = True
      _supported = True
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-mount-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
similarity index 74%
rename from meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-mount-with-infinite-timeout.patch
rename to meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
index fc084b1..e301219 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-mount-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
@@ -1,7 +1,7 @@
-From a6ac2157ee6793302e23ddbc5e3b249fa7da5b7e Mon Sep 17 00:00:00 2001
+From 9c7a15312259854f12137a30229e52c30fb7c770 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 31 Aug 2016 21:30:32 -0400
-Subject: [PATCH 09/13] invoking mount with infinite timeout
+Subject: [PATCH 07/11] invoking mount with infinite timeout
 
 This large timeout is needed when running on machines with
 lots of disks, or with slow disks.
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index b3c45ac..9f02b18 100644
+index bc08af5..b672787 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -257,7 +257,7 @@ def mount(device, mountpoint, fstype, options=None):
+@@ -256,7 +256,7 @@ def mount(device, mountpoint, fstype, options=None):
  
      argv = ["mount", "-t", fstype, "-o", options, device, mountpoint]
      try:
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0010-use-oe-variable-to-replace-hardcoded-dir.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
similarity index 85%
rename from meta-python/recipes-extended/python-blivet/python3-blivet/0010-use-oe-variable-to-replace-hardcoded-dir.patch
rename to meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
index 45d8fab..feb5647 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0010-use-oe-variable-to-replace-hardcoded-dir.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
@@ -1,7 +1,7 @@
-From e07133dbcf3c52e1ddd2f12797dcd16145269273 Mon Sep 17 00:00:00 2001
+From 7f57b2cd145d67c20beb02d5495b502f7af012cd Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 03:54:12 -0400
-Subject: [PATCH 10/13] use oe variable to replace hardcoded dir
+Subject: [PATCH 08/11] use oe variable to replace hardcoded dir
 
 Upstream-Status: Pending
 
@@ -11,7 +11,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 4d06a33..a994d06 100644
+index 7edab2c..9be3187 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -61,10 +61,10 @@ class blivet_sdist(sdist):
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-fsck-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-fsck-with-infinite-timeout.patch
similarity index 84%
rename from meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-fsck-with-infinite-timeout.patch
rename to meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-fsck-with-infinite-timeout.patch
index c61fe01..30d2d3e 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-fsck-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-fsck-with-infinite-timeout.patch
@@ -1,7 +1,7 @@
-From e9ab4376a18cc1bd413c000b036320833eec80d7 Mon Sep 17 00:00:00 2001
+From c757666f42f543baeed5df61269798c085665d9b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 1 Jun 2017 16:05:27 +0800
-Subject: [PATCH 11/13] invoking fsck with infinite timeout
+Subject: [PATCH 09/11] invoking fsck with infinite timeout
 
 This large timeout is needed when running on machines with
 lots of disks, or with slow disks.
@@ -14,7 +14,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/tasks/fsck.py b/blivet/tasks/fsck.py
-index c4214dc..e13ac6b 100644
+index 5274f13..6e074c4 100644
 --- a/blivet/tasks/fsck.py
 +++ b/blivet/tasks/fsck.py
 @@ -77,7 +77,7 @@ class FSCK(task.BasicApplication, fstask.FSTask):
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0012-invoking-mkfs-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
similarity index 87%
rename from meta-python/recipes-extended/python-blivet/python3-blivet/0012-invoking-mkfs-with-infinite-timeout.patch
rename to meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
index 33bdbe8..b2f4501 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0012-invoking-mkfs-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
@@ -1,7 +1,7 @@
-From 9f5a048181cf29d241d96814e736b8235b3d42b1 Mon Sep 17 00:00:00 2001
+From 42d8e57c748951098534bf7f52c4ebc790ef66e9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 16 Jun 2017 15:43:00 +0800
-Subject: [PATCH 12/13] invoking mkfs with infinite timeout
+Subject: [PATCH 10/11] invoking mkfs with infinite timeout
 
 This large timeout is needed when running on machines with
 lots of disks, or with slow disks.
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
similarity index 78%
rename from meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
rename to meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
index 12a9e4f..f24ce0a 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
@@ -1,7 +1,7 @@
-From 92fe7dfd01131c93a9b2013cabf77d5f46900fab Mon Sep 17 00:00:00 2001
+From a4753b3cbbd5aee59dc53eb16564cafd9862763e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 6 Mar 2018 17:28:56 +0800
-Subject: [PATCH] invoking dd with infinite timeout
+Subject: [PATCH 11/11] invoking dd with infinite timeout
 
 This large timeout is needed when running on machines with
 lots of disks, or with slow disks.
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/devices/partition.py b/blivet/devices/partition.py
-index a7372fb..8947472 100644
+index 47ff547..0cd1614 100644
 --- a/blivet/devices/partition.py
 +++ b/blivet/devices/partition.py
-@@ -594,7 +594,7 @@ class PartitionDevice(StorageDevice):
+@@ -621,7 +621,7 @@ class PartitionDevice(StorageDevice):
          cmd = ["dd", "if=/dev/zero", "of=%s" % device, "bs=%d" % bs,
                 "seek=%d" % start, "count=%d" % count]
          try:
@@ -27,5 +27,5 @@ index a7372fb..8947472 100644
              log.error(str(e))
          finally:
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0013-Revert-Adapt-to-logging-module-name-change.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0013-Revert-Adapt-to-logging-module-name-change.patch
deleted file mode 100644
index 6bdf4ce..0000000
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0013-Revert-Adapt-to-logging-module-name-change.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From bfdaf79a2109ac6aed408f0c94f69766991e60e2 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 27 Jul 2017 14:34:30 +0800
-Subject: [PATCH 13/13] Revert "Adapt to logging module name change"
-
-Upstream-Status: Inappropriate [oe specific, sync with anaconda f26-release]
-
-This reverts commit c367d62a516e541ad28636c8259321f1c53417ce.
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- blivet/__init__.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/blivet/__init__.py b/blivet/__init__.py
-index 49277cb..a01e487 100644
---- a/blivet/__init__.py
-+++ b/blivet/__init__.py
-@@ -124,7 +124,7 @@ def enable_installer_mode():
-         from pyanaconda.constants import ROOT_PATH  # pylint: disable=redefined-outer-name,no-name-in-module
-         _storage_root = _sysroot = ROOT_PATH
- 
--    from pyanaconda.anaconda_logging import program_log_lock
-+    from pyanaconda.anaconda_log import program_log_lock
-     util.program_log_lock = program_log_lock
- 
-     flags.installer_mode = True
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb
similarity index 51%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb
index 045e0f4..218c158 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb
@@ -8,22 +8,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "39db82f20d8d4904c0c4dc8912e595177c59e091"
-SRC_URI = "git://github.com/rhinstaller/blivet;branch=2.2-devel \
+SRCREV = "ddc24c71bad10208b11ea0c45853898fadd7030b"
+SRC_URI = "git://github.com/rhinstaller/blivet;branch=3.1-release \
            file://0001-comment-out-selinux.patch \
-           file://0002-run_program-support-timeout.patch\
+           file://0002-run_program-support-timeout.patch \
            file://0003-support-infinit-timeout.patch \
-           file://0004-Mount-var-volatile-during-install.patch \
-           file://0005-update-fstab-by-appending.patch \
-           file://0006-fix-new.roots-object-is-not-iterable.patch \
-           file://0007-fix-incorrect-timeout-while-system-time-changed.patch \
-           file://0008-tweak-btrfs-packages.patch \
-           file://0009-invoking-mount-with-infinite-timeout.patch \
-           file://0010-use-oe-variable-to-replace-hardcoded-dir.patch \
-           file://0011-invoking-fsck-with-infinite-timeout.patch \
-           file://0012-invoking-mkfs-with-infinite-timeout.patch \
-           file://0013-Revert-Adapt-to-logging-module-name-change.patch \
-           file://0014-invoking-dd-with-infinite-timeout.patch \
+           file://0004-fix-new.roots-object-is-not-iterable.patch \
+           file://0005-fix-incorrect-timeout-while-system-time-changed.patch \
+           file://0006-tweak-btrfs-packages.patch \
+           file://0007-invoking-mount-with-infinite-timeout.patch \
+           file://0008-use-oe-variable-to-replace-hardcoded-dir.patch \
+           file://0009-invoking-fsck-with-infinite-timeout.patch \
+           file://0010-invoking-mkfs-with-infinite-timeout.patch \
+           file://0011-invoking-dd-with-infinite-timeout.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "blivet-(?P<pver>\d+(\.\d+)+)$"
-- 
2.7.4


