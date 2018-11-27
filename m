Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 403726C108
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:16:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAR8GKYn018543
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:16:30 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:16:09 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:38 +0800
Message-ID: <6fc72e64edd12972d2f1b4b123f8583261b5ffa9.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543307294.git.hongxu.jia@windriver.com>
References: <cover.1543307294.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 04/12] python3-blivet: 3.0.1 -> 3.1.1
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
X-List-Received-Date: Tue, 27 Nov 2018 08:16:55 -0000
Content-Type: text/plain

Drop 0012-remove-dmraid-dependency-check.patch and
0013-add-Z-y-and-y-to-lvm.pvcreate.patch which the
new version has fixed the issues

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python3-blivet/0001-comment-out-selinux.patch  | 12 +++----
 .../0002-run_program-support-timeout.patch         | 21 +++++------
 .../0003-support-infinit-timeout.patch             | 14 ++++----
 ...0004-fix-new.roots-object-is-not-iterable.patch |  6 ++--
 ...correct-timeout-while-system-time-changed.patch |  6 ++--
 .../python3-blivet/0006-tweak-btrfs-packages.patch |  2 +-
 ...0007-invoking-mount-with-infinite-timeout.patch | 18 +++++-----
 ...-use-oe-variable-to-replace-hardcoded-dir.patch |  4 +--
 .../0009-invoking-fsck-with-infinite-timeout.patch |  2 +-
 .../0010-invoking-mkfs-with-infinite-timeout.patch |  2 +-
 .../0011-invoking-dd-with-infinite-timeout.patch   |  6 ++--
 .../0012-remove-dmraid-dependency-check.patch      | 31 ----------------
 .../0013-add-Z-y-and-y-to-lvm.pvcreate.patch       | 41 ----------------------
 ...on3-blivet_3.0.1.bb => python3-blivet_3.1.1.bb} |  4 +--
 14 files changed, 48 insertions(+), 121 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0012-remove-dmraid-dependency-check.patch
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0013-add-Z-y-and-y-to-lvm.pvcreate.patch
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.0.1.bb => python3-blivet_3.1.1.bb} (89%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
index c77b86a..90fa387 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
@@ -1,6 +1,6 @@
-From 648a18bfc447f076d48ae4147d984b8ef56e37aa Mon Sep 17 00:00:00 2001
+From fc8e93530ba017ecfe111e53d3cbdc3a5b3ac286 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 30 Jul 2018 16:13:40 +0800
+Date: Fri, 23 Nov 2018 16:58:38 +0800
 Subject: [PATCH 01/11] comment out selinux
 
 Upstream-Status: Inappropriate [oe specific]
@@ -12,7 +12,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 8 insertions(+), 3 deletions(-)
 
 diff --git a/blivet/flags.py b/blivet/flags.py
-index 1840121..8789390 100644
+index 4e26d82..94324ff 100644
 --- a/blivet/flags.py
 +++ b/blivet/flags.py
 @@ -20,7 +20,7 @@
@@ -35,7 +35,7 @@ index 1840121..8789390 100644
          self.dmraid = True
          self.ibft = True
 diff --git a/blivet/util.py b/blivet/util.py
-index 7334ff6..0f2a995 100644
+index 9daf151..4eac8b9 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
 @@ -3,7 +3,7 @@ import functools
@@ -47,7 +47,7 @@ index 7334ff6..0f2a995 100644
  import subprocess
  import re
  import sys
-@@ -430,6 +430,8 @@ def get_cow_sysfs_path(dev_path, dev_sysfsPath):
+@@ -444,6 +444,8 @@ def get_cow_sysfs_path(dev_path, dev_sysfsPath):
  def match_path_context(path):
      """ Return the default SELinux context for the given path. """
      context = None
@@ -56,7 +56,7 @@ index 7334ff6..0f2a995 100644
      try:
          context = selinux.matchpathcon(os.path.normpath(path), 0)[1]
      except OSError as e:
-@@ -454,6 +456,8 @@ def set_file_context(path, context, root=None):
+@@ -468,6 +470,8 @@ def set_file_context(path, context, root=None):
  
              True if successful, False if not.
      """
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
index fea2254..5b38859 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
@@ -1,20 +1,20 @@
-From 596979ed58109141a7fee680ab95b27296c022b1 Mon Sep 17 00:00:00 2001
+From 713cf821ebe17f9e1771502a85e0905ea04dafae Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 8 May 2017 14:39:56 +0800
+Date: Fri, 23 Nov 2018 17:03:58 +0800
 Subject: [PATCH 02/11] run_program support timeout
 
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- blivet/util.py | 68 +++++++++++++++++++++++++++++++++-------------------------
- 1 file changed, 39 insertions(+), 29 deletions(-)
+ blivet/util.py | 70 ++++++++++++++++++++++++++++++++++------------------------
+ 1 file changed, 41 insertions(+), 29 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index 0f2a995..05a253c 100644
+index 4eac8b9..4f05076 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -157,6 +157,30 @@ class Path(str):
+@@ -158,6 +158,30 @@ class Path(str):
      def __hash__(self):
          return self._path.__hash__()
  
@@ -45,12 +45,12 @@ index 0f2a995..05a253c 100644
  
  def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=False, binary_output=False):
      if env_prune is None:
-@@ -179,36 +203,22 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -180,35 +204,23 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
              stderr_dir = subprocess.STDOUT
          else:
              stderr_dir = subprocess.PIPE
 -        try:
--            proc = subprocess.Popen(argv,
+-            proc = subprocess.Popen(argv,  # pylint: disable=subprocess-popen-preexec-fn
 -                                    stdin=stdin,
 -                                    stdout=subprocess.PIPE,
 -                                    stderr=stderr_dir,
@@ -78,7 +78,7 @@ index 0f2a995..05a253c 100644
 -        program_log.debug("Return code: %d", proc.returncode)
 -
 -    return (proc.returncode, out)
- 
++
 +        res, out = timeout_command(argv, 10,
 +                                   stdin=stdin,
 +                                   stdout=subprocess.PIPE,
@@ -94,9 +94,10 @@ index 0f2a995..05a253c 100644
 +                program_log.info("%s", line)
 +
 +    return (res, out)
++
+ 
  
  def run_program(*args, **kwargs):
-     return _run_program(*args, **kwargs)[0]
 -- 
 2.7.4
 
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
index 38f061e..861b2cd 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
@@ -1,4 +1,4 @@
-From 325898f3f2951bbde07da47888175c427b11ddc3 Mon Sep 17 00:00:00 2001
+From 5d5436dfa3bdde7b4e87ce5a40cbc724199847d6 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 16:18:02 +0800
 Subject: [PATCH 03/11] support infinit timeout
@@ -11,10 +11,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index 05a253c..d6804be 100644
+index 4f05076..7e89949 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -157,6 +157,7 @@ class Path(str):
+@@ -158,6 +158,7 @@ class Path(str):
      def __hash__(self):
          return self._path.__hash__()
  
@@ -22,7 +22,7 @@ index 05a253c..d6804be 100644
  def timeout_command(argv, timeout, *args, **kwargs):
      """call shell-command and either return its output or kill it
      if it doesn't normally exit within timeout seconds and return None"""
-@@ -168,7 +169,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -169,7 +170,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
          while proc.poll() is None:
              time.sleep(0.1)
              now = datetime.datetime.now()
@@ -31,7 +31,7 @@ index 05a253c..d6804be 100644
                  os.kill(proc.pid, signal.SIGKILL)
                  os.waitpid(-1, os.WNOHANG)
                  program_log.debug("%d seconds timeout" % timeout)
-@@ -182,7 +183,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -183,7 +184,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
      program_log.debug("Return code: %d", proc.returncode)
      return (proc.returncode, proc.stdout.read())
  
@@ -40,7 +40,7 @@ index 05a253c..d6804be 100644
      if env_prune is None:
          env_prune = []
  
-@@ -191,7 +192,10 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -192,7 +193,10 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
              os.chroot(root)
  
      with program_log_lock:  # pylint: disable=not-context-manager
@@ -52,7 +52,7 @@ index 05a253c..d6804be 100644
  
          env = os.environ.copy()
          env.update({"LC_ALL": "C",
-@@ -204,7 +208,7 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -205,7 +209,7 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
          else:
              stderr_dir = subprocess.PIPE
  
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0004-fix-new.roots-object-is-not-iterable.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0004-fix-new.roots-object-is-not-iterable.patch
index be997ac..526a3b1 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0004-fix-new.roots-object-is-not-iterable.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0004-fix-new.roots-object-is-not-iterable.patch
@@ -1,4 +1,4 @@
-From c31df1c0f5323ddc70e0d1c6d11db2fbf7a024ad Mon Sep 17 00:00:00 2001
+From 3bb8d08bdec2f79bb13c0a44b81718d26e5bdabc Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 16:30:20 +0800
 Subject: [PATCH 04/11] fix new.roots object is not iterable
@@ -11,10 +11,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/blivet.py b/blivet/blivet.py
-index 3405810..f42b73b 100644
+index ea08837..91c92b2 100644
 --- a/blivet/blivet.py
 +++ b/blivet/blivet.py
-@@ -1198,7 +1198,7 @@ class Blivet(object):
+@@ -1206,7 +1206,7 @@ class Blivet(object):
              p = partition.disk.format.parted_disk.getPartitionByPath(partition.path)
              partition.parted_partition = p
  
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
index ecb9503..9c5d53b 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
@@ -1,4 +1,4 @@
-From b30a74671ca603e6bfd514f72d4fd7fd6fceef54 Mon Sep 17 00:00:00 2001
+From f783b9b00da5df176fcd7927b752f574ca6db319 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 26 Aug 2016 02:02:49 -0400
 Subject: [PATCH 05/11] fix incorrect timeout while system time changed
@@ -22,10 +22,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index d6804be..bc08af5 100644
+index 7e89949..5571e73 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -162,14 +162,14 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -163,14 +163,14 @@ def timeout_command(argv, timeout, *args, **kwargs):
      """call shell-command and either return its output or kill it
      if it doesn't normally exit within timeout seconds and return None"""
      import subprocess, datetime, os, time, signal
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
index da568a4..2e53a64 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
@@ -1,4 +1,4 @@
-From 0659d8a85bcdd76c0b23b8b5af6958783d35ac65 Mon Sep 17 00:00:00 2001
+From 8932ae933f2b6acf5e98c9956beff69ae430eed2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 16:33:15 +0800
 Subject: [PATCH 06/11] tweak btrfs packages
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
index e301219..b2606d7 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
@@ -1,6 +1,6 @@
-From 9c7a15312259854f12137a30229e52c30fb7c770 Mon Sep 17 00:00:00 2001
+From f53481dc4a56b8a996628733553e080bb0aafdd7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 31 Aug 2016 21:30:32 -0400
+Date: Fri, 23 Nov 2018 17:07:22 +0800
 Subject: [PATCH 07/11] invoking mount with infinite timeout
 
 This large timeout is needed when running on machines with
@@ -14,18 +14,18 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index bc08af5..b672787 100644
+index 5571e73..02c8033 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -256,7 +256,7 @@ def mount(device, mountpoint, fstype, options=None):
+@@ -258,7 +258,7 @@ def mount(device, mountpoint, fstype, options=None):
+         makedirs(mountpoint)
  
      argv = ["mount", "-t", fstype, "-o", options, device, mountpoint]
-     try:
--        rc = run_program(argv)
-+        rc = run_program(argv, timeout=-1)
-     except OSError:
-         raise
+-    return run_program(argv)
++    return run_program(argv, timeout=-1)
  
+ 
+ def umount(mountpoint):
 -- 
 2.7.4
 
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
index feb5647..ade1862 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
@@ -1,4 +1,4 @@
-From 7f57b2cd145d67c20beb02d5495b502f7af012cd Mon Sep 17 00:00:00 2001
+From 12e2579333258d1a690f8718e91b0f217078e886 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 03:54:12 -0400
 Subject: [PATCH 08/11] use oe variable to replace hardcoded dir
@@ -11,7 +11,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 7edab2c..9be3187 100644
+index b745a79..b5b4258 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -61,10 +61,10 @@ class blivet_sdist(sdist):
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-fsck-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-fsck-with-infinite-timeout.patch
index 30d2d3e..f477877 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-fsck-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-fsck-with-infinite-timeout.patch
@@ -1,4 +1,4 @@
-From c757666f42f543baeed5df61269798c085665d9b Mon Sep 17 00:00:00 2001
+From 9624b6d0dda40aaecbaf9530be819943575a2ec6 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 1 Jun 2017 16:05:27 +0800
 Subject: [PATCH 09/11] invoking fsck with infinite timeout
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
index b2f4501..f128490 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
@@ -1,4 +1,4 @@
-From 42d8e57c748951098534bf7f52c4ebc790ef66e9 Mon Sep 17 00:00:00 2001
+From 33844f6773a676bd57240954e402ae9a843663a4 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 16 Jun 2017 15:43:00 +0800
 Subject: [PATCH 10/11] invoking mkfs with infinite timeout
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
index f24ce0a..13c2933 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
@@ -1,4 +1,4 @@
-From a4753b3cbbd5aee59dc53eb16564cafd9862763e Mon Sep 17 00:00:00 2001
+From 21ca2b859a49e96a230d55a7866dfc7ed5d1366c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 6 Mar 2018 17:28:56 +0800
 Subject: [PATCH 11/11] invoking dd with infinite timeout
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/devices/partition.py b/blivet/devices/partition.py
-index 47ff547..0cd1614 100644
+index 623e1c9..141d8ad 100644
 --- a/blivet/devices/partition.py
 +++ b/blivet/devices/partition.py
-@@ -621,7 +621,7 @@ class PartitionDevice(StorageDevice):
+@@ -618,7 +618,7 @@ class PartitionDevice(StorageDevice):
          cmd = ["dd", "if=/dev/zero", "of=%s" % device, "bs=%d" % bs,
                 "seek=%d" % start, "count=%d" % count]
          try:
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0012-remove-dmraid-dependency-check.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0012-remove-dmraid-dependency-check.patch
deleted file mode 100644
index 886e3ff..0000000
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0012-remove-dmraid-dependency-check.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4476e846a1e64dde17df2e2370c803ce695514f9 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 6 Aug 2018 17:18:27 +0800
-Subject: [PATCH] remove dmraid dependency check
-
-OE does not support dmraid, remove it from dependency check
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- blivet/tasks/availability.py | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/blivet/tasks/availability.py b/blivet/tasks/availability.py
-index 9a87cfd..843cf6a 100644
---- a/blivet/tasks/availability.py
-+++ b/blivet/tasks/availability.py
-@@ -316,8 +316,7 @@ BLOCKDEV_DM_ALL_MODES = (blockdev.DMTechMode.CREATE_ACTIVATE |
-                          blockdev.DMTechMode.QUERY)
- BLOCKDEV_DM = BlockDevTechInfo(plugin_name="dm",
-                                check_fn=blockdev.dm_is_tech_avail,
--                               technologies={blockdev.DMTech.MAP: BLOCKDEV_DM_ALL_MODES,
--                                             blockdev.DMTech.RAID: BLOCKDEV_DM_ALL_MODES})
-+                               technologies={blockdev.DMTech.MAP: BLOCKDEV_DM_ALL_MODES})
- BLOCKDEV_DM_TECH = BlockDevMethod(BLOCKDEV_DM)
- 
- # libblockdev loop plugin required technologies and modes
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0013-add-Z-y-and-y-to-lvm.pvcreate.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0013-add-Z-y-and-y-to-lvm.pvcreate.patch
deleted file mode 100644
index 33b5f51..0000000
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0013-add-Z-y-and-y-to-lvm.pvcreate.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From bddbfa499df16b108f2d892ee48d65617523c33d Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 9 Aug 2018 11:00:39 +0800
-Subject: [PATCH] add `-Z y' and `-y' to lvm.pvcreate
-
-While reinstall a crypt fs, it occasionally failed
-[snip]
-|gi.overrides.BlockDev.LVMError: Process reported exit code 5:
-WARNING: atari signature detected on /dev/mapper/luks-0e5f891c
--7701-48bc-a41e-8d626b6ef953 at offset 466. Wipe it? [y/n]:
-[snip]
-
-Add `-Z y' and `-y' to lvm.pvcreate
-
-Upstream-Status: Submitted [https://github.com/storaged-project/blivet/pull/714]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- blivet/formats/lvmpv.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/blivet/formats/lvmpv.py b/blivet/formats/lvmpv.py
-index 260cc0b..4bbb46f 100644
---- a/blivet/formats/lvmpv.py
-+++ b/blivet/formats/lvmpv.py
-@@ -120,9 +120,9 @@ class LVMPhysicalVolume(DeviceFormat):
-         log_method_call(self, device=self.device,
-                         type=self.type, status=self.status)
- 
--        # Consider use of -Z|--zero
--        # -f|--force or -y|--yes may be required
--        blockdev.lvm.pvcreate(self.device, data_alignment=self.data_alignment)
-+        ea_zero = blockdev.ExtraArg.new("-Z", "y")
-+        ea_yes = blockdev.ExtraArg.new("-y", "")
-+        blockdev.lvm.pvcreate(self.device, data_alignment=self.data_alignment, extra=[ea_zero, ea_yes])
- 
-     def _destroy(self, **kwargs):
-         log_method_call(self, device=self.device,
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.1.bb
similarity index 89%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.1.1.bb
index 75f02f1..df8cc07 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.0.1.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "ddc24c71bad10208b11ea0c45853898fadd7030b"
+SRCREV = "0a1f8374197f5a5fb368de90a7f1c1258b7cd2b9"
 SRC_URI = "git://github.com/rhinstaller/blivet;branch=3.1-release \
            file://0001-comment-out-selinux.patch \
            file://0002-run_program-support-timeout.patch \
@@ -21,8 +21,6 @@ SRC_URI = "git://github.com/rhinstaller/blivet;branch=3.1-release \
            file://0009-invoking-fsck-with-infinite-timeout.patch \
            file://0010-invoking-mkfs-with-infinite-timeout.patch \
            file://0011-invoking-dd-with-infinite-timeout.patch \
-           file://0012-remove-dmraid-dependency-check.patch \
-           file://0013-add-Z-y-and-y-to-lvm.pvcreate.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "blivet-(?P<pver>\d+(\.\d+)+)$"
-- 
2.7.4


