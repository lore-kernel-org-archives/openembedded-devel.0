Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D445781C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 08:44:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6R8iaA5006601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jul 2017 01:44:36 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 01:44:35 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Jul 2017 04:44:25 -0400
Message-ID: <2b121c2e2fbf3f417f9689d2435084d01a4a2f68.1501142861.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1501142861.git.hongxu.jia@windriver.com>
References: <cover.1501142861.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] python3-blivet: add recipe 2.2.0
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
X-List-Received-Date: Thu, 27 Jul 2017 08:44:36 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python3-blivet/0001-comment-out-selinux.patch  |  70 ++++++++++++++
 .../0002-run_program-support-timeout.patch         | 102 +++++++++++++++++++++
 .../0003-support-infinit-timeout.patch             |  66 +++++++++++++
 .../0004-Mount-var-volatile-during-install.patch   |  59 ++++++++++++
 .../0005-update-fstab-by-appending.patch           |  32 +++++++
 ...0006-fix-new.roots-object-is-not-iterable.patch |  28 ++++++
 ...correct-timeout-while-system-time-changed.patch |  48 ++++++++++
 .../python3-blivet/0008-tweak-btrfs-packages.patch |  45 +++++++++
 ...0009-invoking-mount-with-infinite-timeout.patch |  31 +++++++
 ...-use-oe-variable-to-replace-hardcoded-dir.patch |  34 +++++++
 .../0011-invoking-fsck-with-infinite-timeout.patch |  31 +++++++
 .../0012-invoking-mkfs-with-infinite-timeout.patch |  31 +++++++
 ...evert-Adapt-to-logging-module-name-change.patch |  30 ++++++
 .../python-blivet/python3-blivet_2.2.0.bb          |  46 ++++++++++
 14 files changed, 653 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0004-Mount-var-volatile-during-install.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0005-update-fstab-by-appending.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0006-fix-new.roots-object-is-not-iterable.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0007-fix-incorrect-timeout-while-system-time-changed.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0008-tweak-btrfs-packages.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-mount-with-infinite-timeout.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0010-use-oe-variable-to-replace-hardcoded-dir.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-fsck-with-infinite-timeout.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0012-invoking-mkfs-with-infinite-timeout.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0013-Revert-Adapt-to-logging-module-name-change.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
new file mode 100644
index 0000000..0ee3205
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comment-out-selinux.patch
@@ -0,0 +1,70 @@
+From 7d483c27ac0a23ca3bba7f320918afc40013bd8e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 8 May 2017 14:25:52 +0800
+Subject: [PATCH 01/13] comment out selinux
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/flags.py | 5 +++--
+ blivet/util.py  | 6 +++++-
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/blivet/flags.py b/blivet/flags.py
+index 06822db..b55a93f 100644
+--- a/blivet/flags.py
++++ b/blivet/flags.py
+@@ -20,7 +20,7 @@
+ #
+ 
+ import shlex
+-import selinux
++#import selinux
+ 
+ 
+ class Flags(object):
+@@ -49,7 +49,8 @@ class Flags(object):
+         #
+         # enable/disable functionality
+         #
+-        self.selinux = selinux.is_selinux_enabled()
++        #self.selinux = selinux.is_selinux_enabled()
++        self.selinux = False
+         self.multipath = True
+         self.dmraid = True
+         self.ibft = True
+diff --git a/blivet/util.py b/blivet/util.py
+index e3e71ce..0cf5188 100644
+--- a/blivet/util.py
++++ b/blivet/util.py
+@@ -4,7 +4,7 @@ import glob
+ import itertools
+ import os
+ import shutil
+-import selinux
++#import selinux
+ import subprocess
+ import re
+ import sys
+@@ -431,6 +431,8 @@ def get_cow_sysfs_path(dev_path, dev_sysfsPath):
+ def match_path_context(path):
+     """ Return the default SELinux context for the given path. """
+     context = None
++    return context
++
+     try:
+         context = selinux.matchpathcon(os.path.normpath(path), 0)[1]
+     except OSError as e:
+@@ -455,6 +457,8 @@ def set_file_context(path, context, root=None):
+ 
+             True if successful, False if not.
+     """
++    return False
++
+     if root is None:
+         root = '/'
+ 
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
new file mode 100644
index 0000000..01e71be
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
@@ -0,0 +1,102 @@
+From 86744d408b91acdcb086a03d7779fcda152f2ac3 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 8 May 2017 14:39:56 +0800
+Subject: [PATCH 02/13] run_program support timeout
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/util.py | 68 +++++++++++++++++++++++++++++++++-------------------------
+ 1 file changed, 39 insertions(+), 29 deletions(-)
+
+diff --git a/blivet/util.py b/blivet/util.py
+index 0cf5188..d4bd9bb 100644
+--- a/blivet/util.py
++++ b/blivet/util.py
+@@ -158,6 +158,30 @@ class Path(str):
+     def __hash__(self):
+         return self._path.__hash__()
+ 
++def timeout_command(argv, timeout, *args, **kwargs):
++    """call shell-command and either return its output or kill it
++    if it doesn't normally exit within timeout seconds and return None"""
++    import subprocess, datetime, os, time, signal
++    start = datetime.datetime.now()
++
++    try:
++        proc = subprocess.Popen(argv, *args, **kwargs)
++        while proc.poll() is None:
++            time.sleep(0.1)
++            now = datetime.datetime.now()
++            if (now - start).seconds> timeout:
++                os.kill(proc.pid, signal.SIGKILL)
++                os.waitpid(-1, os.WNOHANG)
++                program_log.debug("%d seconds timeout" % timeout)
++                return (-1, None)
++
++
++    except OSError as e:
++        program_log.error("Error running %s: %s", argv[0], e.strerror)
++        raise
++
++    program_log.debug("Return code: %d", proc.returncode)
++    return (proc.returncode, proc.stdout.read())
+ 
+ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=False, binary_output=False):
+     if env_prune is None:
+@@ -180,36 +204,22 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+             stderr_dir = subprocess.STDOUT
+         else:
+             stderr_dir = subprocess.PIPE
+-        try:
+-            proc = subprocess.Popen(argv,
+-                                    stdin=stdin,
+-                                    stdout=subprocess.PIPE,
+-                                    stderr=stderr_dir,
+-                                    close_fds=True,
+-                                    preexec_fn=chroot, cwd=root, env=env)
+-
+-            out, err = proc.communicate()
+-            if not binary_output and six.PY3:
+-                out = out.decode("utf-8")
+-            if out:
+-                if not stderr_to_stdout:
+-                    program_log.info("stdout:")
+-                for line in out.splitlines():
+-                    program_log.info("%s", line)
+-
+-            if not stderr_to_stdout and err:
+-                program_log.info("stderr:")
+-                for line in err.splitlines():
+-                    program_log.info("%s", line)
+-
+-        except OSError as e:
+-            program_log.error("Error running %s: %s", argv[0], e.strerror)
+-            raise
+-
+-        program_log.debug("Return code: %d", proc.returncode)
+-
+-    return (proc.returncode, out)
+ 
++        res, out = timeout_command(argv, 10,
++                                   stdin=stdin,
++                                   stdout=subprocess.PIPE,
++                                   stderr=stderr_dir,
++                                   close_fds=True,
++                                   preexec_fn=chroot, cwd=root, env=env)
++        if not binary_output and six.PY3:
++            out = out.decode("utf-8")
++        if out:
++            if not stderr_to_stdout:
++                program_log.info("stdout:")
++            for line in out.splitlines():
++                program_log.info("%s", line)
++
++    return (res, out)
+ 
+ def run_program(*args, **kwargs):
+     return _run_program(*args, **kwargs)[0]
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
new file mode 100644
index 0000000..489fb56
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
@@ -0,0 +1,66 @@
+From 923265e04df5920fc99393aa05f584032aa1b383 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 8 May 2017 16:18:02 +0800
+Subject: [PATCH 03/13] support infinit timeout
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/util.py | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/blivet/util.py b/blivet/util.py
+index d4bd9bb..44a2da5 100644
+--- a/blivet/util.py
++++ b/blivet/util.py
+@@ -158,6 +158,7 @@ class Path(str):
+     def __hash__(self):
+         return self._path.__hash__()
+ 
++# timeout = -1 means infinite timeout, always wait.
+ def timeout_command(argv, timeout, *args, **kwargs):
+     """call shell-command and either return its output or kill it
+     if it doesn't normally exit within timeout seconds and return None"""
+@@ -169,7 +170,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
+         while proc.poll() is None:
+             time.sleep(0.1)
+             now = datetime.datetime.now()
+-            if (now - start).seconds> timeout:
++            if timeout != -1 and (now - start).seconds> timeout:
+                 os.kill(proc.pid, signal.SIGKILL)
+                 os.waitpid(-1, os.WNOHANG)
+                 program_log.debug("%d seconds timeout" % timeout)
+@@ -183,7 +184,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
+     program_log.debug("Return code: %d", proc.returncode)
+     return (proc.returncode, proc.stdout.read())
+ 
+-def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=False, binary_output=False):
++def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=False, binary_output=False, timeout=10):
+     if env_prune is None:
+         env_prune = []
+ 
+@@ -192,7 +193,10 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+             os.chroot(root)
+ 
+     with program_log_lock:  # pylint: disable=not-context-manager
+-        program_log.info("Running... %s", " ".join(argv))
++        if timeout != -1:
++            program_log.info("Running... %s", " ".join(argv))
++        else:
++            program_log.info("Running... %s ...infinite timeout", " ".join(argv))
+ 
+         env = os.environ.copy()
+         env.update({"LC_ALL": "C",
+@@ -205,7 +209,7 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+         else:
+             stderr_dir = subprocess.PIPE
+ 
+-        res, out = timeout_command(argv, 10,
++        res, out = timeout_command(argv, timeout,
+                                    stdin=stdin,
+                                    stdout=subprocess.PIPE,
+                                    stderr=stderr_dir,
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0004-Mount-var-volatile-during-install.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0004-Mount-var-volatile-during-install.patch
new file mode 100644
index 0000000..cb837e2
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0004-Mount-var-volatile-during-install.patch
@@ -0,0 +1,59 @@
+From c3959bd00665e24a955bbdbea1ef555e76372f12 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 8 May 2017 16:25:16 +0800
+Subject: [PATCH 04/13] Mount /var/volatile during install
+
+The installed system needs /var/volatile clean, otherwise it
+caused systemd's journalctl failed to record boot log.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/osinstall.py | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/blivet/osinstall.py b/blivet/osinstall.py
+index a4f9535..61819c2 100644
+--- a/blivet/osinstall.py
++++ b/blivet/osinstall.py
+@@ -294,6 +294,7 @@ class FSSet(object):
+         self._sysfs = None
+         self._proc = None
+         self._devshm = None
++        self._volatile = None
+         self._usb = None
+         self._selinux = None
+         self._run = None
+@@ -335,6 +336,12 @@ class FSSet(object):
+         return self._devshm
+ 
+     @property
++    def volatile(self):
++        if not self._volatile:
++            self._volatile = NoDevice(fmt=get_format("tmpfs", device="tmpfs", mountpoint="/var/volatile"))
++        return self._volatile
++
++    @property
+     def usb(self):
+         if not self._usb:
+             self._usb = NoDevice(fmt=get_format("usbfs", device="usbfs", mountpoint="/proc/bus/usb"))
+@@ -591,6 +598,7 @@ class FSSet(object):
+ 
+         devices = list(self.mountpoints.values()) + self.swap_devices
+         devices.extend([self.dev, self.devshm, self.devpts, self.sysfs,
++                        self.volatile,
+                         self.proc, self.selinux, self.usb, self.run])
+         if isinstance(_platform, EFI):
+             devices.append(self.efivars)
+@@ -650,6 +658,7 @@ class FSSet(object):
+         """ unmount filesystems, except swap if swapoff == False """
+         devices = list(self.mountpoints.values()) + self.swap_devices
+         devices.extend([self.dev, self.devshm, self.devpts, self.sysfs,
++                        self.volatile,
+                         self.proc, self.usb, self.selinux, self.run])
+         if isinstance(_platform, EFI):
+             devices.append(self.efivars)
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0005-update-fstab-by-appending.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-update-fstab-by-appending.patch
new file mode 100644
index 0000000..4f343b7
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-update-fstab-by-appending.patch
@@ -0,0 +1,32 @@
+From 386ff899763f8473eb93a7a1578fb7cc4f86f66d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 8 May 2017 16:28:12 +0800
+Subject: [PATCH 05/13] update fstab by appending
+
+The 'storage.write()' has updated fstab by overwriting
+the original one, we should update fstab by appending
+to keep original tmpfs partitions.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/osinstall.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/blivet/osinstall.py b/blivet/osinstall.py
+index 61819c2..afa82db 100644
+--- a/blivet/osinstall.py
++++ b/blivet/osinstall.py
+@@ -728,7 +728,7 @@ class FSSet(object):
+         # /etc/fstab
+         fstab_path = os.path.normpath("%s/etc/fstab" % get_sysroot())
+         fstab = self.fstab()
+-        open(fstab_path, "w").write(fstab)
++        open(fstab_path, "a").write(fstab)
+ 
+         # /etc/crypttab
+         crypttab_path = os.path.normpath("%s/etc/crypttab" % get_sysroot())
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0006-fix-new.roots-object-is-not-iterable.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-fix-new.roots-object-is-not-iterable.patch
new file mode 100644
index 0000000..f5ff754
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-fix-new.roots-object-is-not-iterable.patch
@@ -0,0 +1,28 @@
+From cd92eea8fab37ba6b0c7f03daa5255343dc75716 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 8 May 2017 16:30:20 +0800
+Subject: [PATCH 06/13] fix new.roots object is not iterable
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/blivet.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/blivet/blivet.py b/blivet/blivet.py
+index 6a33e9c..79ae91a 100644
+--- a/blivet/blivet.py
++++ b/blivet/blivet.py
+@@ -1761,7 +1761,7 @@ class Blivet(object):
+             p = partition.disk.format.parted_disk.getPartitionByPath(partition.path)
+             partition.parted_partition = p
+ 
+-        for root in new.roots:
++        for root in new.roots or []:
+             root.swaps = [new.devicetree.get_device_by_id(d.id, hidden=True) for d in root.swaps]
+             root.swaps = [s for s in root.swaps if s]
+ 
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0007-fix-incorrect-timeout-while-system-time-changed.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0007-fix-incorrect-timeout-while-system-time-changed.patch
new file mode 100644
index 0000000..6512d86
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0007-fix-incorrect-timeout-while-system-time-changed.patch
@@ -0,0 +1,48 @@
+From 78ee2b9090f9400ccc4f730e674f5ae972740ccb Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 Aug 2016 02:02:49 -0400
+Subject: [PATCH 07/13] fix incorrect timeout while system time changed
+
+While system time changed by NTP, invoking timeout_command
+breaks with incorrect timeout.
+--------
+|05:40:55,872 INFO program: Running... mount -t ext2 -o
+  defaults,ro /dev/sda2 /mnt/sysimage
+|01:40:55,086 DEBUG program: 10 seconds timeout
+--------
+
+Use numbert count to replace current time count could workaround
+the issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/util.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/blivet/util.py b/blivet/util.py
+index 44a2da5..b3c45ac 100644
+--- a/blivet/util.py
++++ b/blivet/util.py
+@@ -163,14 +163,14 @@ def timeout_command(argv, timeout, *args, **kwargs):
+     """call shell-command and either return its output or kill it
+     if it doesn't normally exit within timeout seconds and return None"""
+     import subprocess, datetime, os, time, signal
+-    start = datetime.datetime.now()
++    count = 0
+ 
+     try:
+         proc = subprocess.Popen(argv, *args, **kwargs)
+         while proc.poll() is None:
+             time.sleep(0.1)
+-            now = datetime.datetime.now()
+-            if timeout != -1 and (now - start).seconds> timeout:
++            count += 1
++            if timeout != -1 and count > timeout*10:
+                 os.kill(proc.pid, signal.SIGKILL)
+                 os.waitpid(-1, os.WNOHANG)
+                 program_log.debug("%d seconds timeout" % timeout)
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0008-tweak-btrfs-packages.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-tweak-btrfs-packages.patch
new file mode 100644
index 0000000..121336e
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-tweak-btrfs-packages.patch
@@ -0,0 +1,45 @@
+From 6f661a511eea096c073888c7adb836a9a880b476 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 8 May 2017 16:33:15 +0800
+Subject: [PATCH 08/13] tweak btrfs packages
+
+In oe-cre/yocto, we name btrfs package with btrfs-tools,
+rather than btrfs-progs.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/devices/btrfs.py | 2 +-
+ blivet/formats/fs.py    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/blivet/devices/btrfs.py b/blivet/devices/btrfs.py
+index c5cb21f..9d417b2 100644
+--- a/blivet/devices/btrfs.py
++++ b/blivet/devices/btrfs.py
+@@ -55,7 +55,7 @@ class BTRFSDevice(StorageDevice):
+ 
+     """ Base class for BTRFS volume and sub-volume devices. """
+     _type = "btrfs"
+-    _packages = ["btrfs-progs"]
++    _packages = ["btrfs-tools"]
+     _external_dependencies = [availability.BLOCKDEV_BTRFS_PLUGIN]
+ 
+     def __init__(self, *args, **kwargs):
+diff --git a/blivet/formats/fs.py b/blivet/formats/fs.py
+index a49826f..e8f216d 100644
+--- a/blivet/formats/fs.py
++++ b/blivet/formats/fs.py
+@@ -918,7 +918,7 @@ class BTRFS(FS):
+     _formattable = True
+     _linux_native = True
+     _supported = True
+-    _packages = ["btrfs-progs"]
++    _packages = ["btrfs-tools"]
+     _min_size = Size("256 MiB")
+     _max_size = Size("16 EiB")
+     _mkfs_class = fsmkfs.BTRFSMkfs
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-mount-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-mount-with-infinite-timeout.patch
new file mode 100644
index 0000000..fc084b1
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-mount-with-infinite-timeout.patch
@@ -0,0 +1,31 @@
+From a6ac2157ee6793302e23ddbc5e3b249fa7da5b7e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 31 Aug 2016 21:30:32 -0400
+Subject: [PATCH 09/13] invoking mount with infinite timeout
+
+This large timeout is needed when running on machines with
+lots of disks, or with slow disks.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/util.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/blivet/util.py b/blivet/util.py
+index b3c45ac..9f02b18 100644
+--- a/blivet/util.py
++++ b/blivet/util.py
+@@ -257,7 +257,7 @@ def mount(device, mountpoint, fstype, options=None):
+ 
+     argv = ["mount", "-t", fstype, "-o", options, device, mountpoint]
+     try:
+-        rc = run_program(argv)
++        rc = run_program(argv, timeout=-1)
+     except OSError:
+         raise
+ 
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0010-use-oe-variable-to-replace-hardcoded-dir.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-use-oe-variable-to-replace-hardcoded-dir.patch
new file mode 100644
index 0000000..45d8fab
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-use-oe-variable-to-replace-hardcoded-dir.patch
@@ -0,0 +1,34 @@
+From e07133dbcf3c52e1ddd2f12797dcd16145269273 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 8 May 2017 03:54:12 -0400
+Subject: [PATCH 10/13] use oe variable to replace hardcoded dir
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ setup.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 4d06a33..a994d06 100644
+--- a/setup.py
++++ b/setup.py
+@@ -61,10 +61,10 @@ class blivet_sdist(sdist):
+ 
+ 
+ data_files = [
+-    ('/etc/dbus-1/system.d', ['dbus/blivet.conf']),
+-    ('/usr/share/dbus-1/system-services', ['dbus/com.redhat.Blivet1.service']),
+-    ('/usr/libexec', ['dbus/blivetd']),
+-    ('/usr/lib/systemd/system', ['dbus/blivet.service'])
++    (os.environ.get('sysconfdir')+'/dbus-1/system.d', ['dbus/blivet.conf']),
++    (os.environ.get('datadir')+'/dbus-1/system-services', ['dbus/com.redhat.Blivet1.service']),
++    (os.environ.get('libexecdir'), ['dbus/blivetd']),
++    (os.environ.get('systemd_system_unitdir'), ['dbus/blivet.service'])
+ ]
+ 
+ 
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-fsck-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-fsck-with-infinite-timeout.patch
new file mode 100644
index 0000000..c61fe01
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-fsck-with-infinite-timeout.patch
@@ -0,0 +1,31 @@
+From e9ab4376a18cc1bd413c000b036320833eec80d7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 16:05:27 +0800
+Subject: [PATCH 11/13] invoking fsck with infinite timeout
+
+This large timeout is needed when running on machines with
+lots of disks, or with slow disks.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/tasks/fsck.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/blivet/tasks/fsck.py b/blivet/tasks/fsck.py
+index c4214dc..e13ac6b 100644
+--- a/blivet/tasks/fsck.py
++++ b/blivet/tasks/fsck.py
+@@ -77,7 +77,7 @@ class FSCK(task.BasicApplication, fstask.FSTask):
+             raise FSError("\n".join(error_msgs))
+ 
+         try:
+-            rc = util.run_program(self._fsck_command)
++            rc = util.run_program(self._fsck_command, timeout=-1)
+         except OSError as e:
+             raise FSError("filesystem check failed: %s" % e)
+ 
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0012-invoking-mkfs-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0012-invoking-mkfs-with-infinite-timeout.patch
new file mode 100644
index 0000000..33bdbe8
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0012-invoking-mkfs-with-infinite-timeout.patch
@@ -0,0 +1,31 @@
+From 9f5a048181cf29d241d96814e736b8235b3d42b1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 16 Jun 2017 15:43:00 +0800
+Subject: [PATCH 12/13] invoking mkfs with infinite timeout
+
+This large timeout is needed when running on machines with
+lots of disks, or with slow disks.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/tasks/fsmkfs.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/blivet/tasks/fsmkfs.py b/blivet/tasks/fsmkfs.py
+index ad166aa..7bf5075 100644
+--- a/blivet/tasks/fsmkfs.py
++++ b/blivet/tasks/fsmkfs.py
+@@ -170,7 +170,7 @@ class FSMkfs(task.BasicApplication, FSMkfsTask):
+         options = options or []
+         cmd = self._mkfs_command(options, label, set_uuid)
+         try:
+-            ret = util.run_program(cmd)
++            ret = util.run_program(cmd, timeout=-1)
+         except OSError as e:
+             raise FSError(e)
+ 
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0013-Revert-Adapt-to-logging-module-name-change.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0013-Revert-Adapt-to-logging-module-name-change.patch
new file mode 100644
index 0000000..6bdf4ce
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0013-Revert-Adapt-to-logging-module-name-change.patch
@@ -0,0 +1,30 @@
+From bfdaf79a2109ac6aed408f0c94f69766991e60e2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 27 Jul 2017 14:34:30 +0800
+Subject: [PATCH 13/13] Revert "Adapt to logging module name change"
+
+Upstream-Status: Inappropriate [oe specific, sync with anaconda f26-release]
+
+This reverts commit c367d62a516e541ad28636c8259321f1c53417ce.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/__init__.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/blivet/__init__.py b/blivet/__init__.py
+index 49277cb..a01e487 100644
+--- a/blivet/__init__.py
++++ b/blivet/__init__.py
+@@ -124,7 +124,7 @@ def enable_installer_mode():
+         from pyanaconda.constants import ROOT_PATH  # pylint: disable=redefined-outer-name,no-name-in-module
+         _storage_root = _sysroot = ROOT_PATH
+ 
+-    from pyanaconda.anaconda_logging import program_log_lock
++    from pyanaconda.anaconda_log import program_log_lock
+     util.program_log_lock = program_log_lock
+ 
+     flags.installer_mode = True
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
new file mode 100644
index 0000000..8b9448c
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "A python module for system storage configuration"
+HOMEPAGE = "http://fedoraproject.org/wiki/blivet"
+LICENSE = "LGPLv2+"
+SECTION = "devel/python"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+SRCREV = "39db82f20d8d4904c0c4dc8912e595177c59e091"
+SRC_URI = "git://github.com/rhinstaller/blivet;branch=2.2-devel \
+           file://0001-comment-out-selinux.patch \
+           file://0002-run_program-support-timeout.patch\
+           file://0003-support-infinit-timeout.patch \
+           file://0004-Mount-var-volatile-during-install.patch \
+           file://0005-update-fstab-by-appending.patch \
+           file://0006-fix-new.roots-object-is-not-iterable.patch \
+           file://0007-fix-incorrect-timeout-while-system-time-changed.patch \
+           file://0008-tweak-btrfs-packages.patch \
+           file://0009-invoking-mount-with-infinite-timeout.patch \
+           file://0010-use-oe-variable-to-replace-hardcoded-dir.patch \
+           file://0011-invoking-fsck-with-infinite-timeout.patch \
+           file://0012-invoking-mkfs-with-infinite-timeout.patch \
+           file://0013-Revert-Adapt-to-logging-module-name-change.patch \
+"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+inherit setuptools3 python3native
+
+RDEPENDS_${PN} = "pykickstart python3-pyudev \
+                  parted python3-pyparted multipath-tools \
+                  lsof cryptsetup libblockdev \
+                  libbytesize \
+"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1/system-services \
+"
+
+inherit systemd
+
+SYSTEMD_AUTO_ENABLE = "disable"
+SYSTEMD_SERVICE_${PN} = "blivet.service"
-- 
2.8.1


