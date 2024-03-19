Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D483BC54E72
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:36 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8216.1710827194081913863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GrNaIkrC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827194; x=1742363194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=i6yqxIsf3mw5BadntOnPN7Mt7Uwnqw/0faTbIbZTt9k=;
  b=GrNaIkrC2YJ4BnbNowhehBYQNFVF2TeS3/Ui5/tCTz5QBz4CgG7IyZRj
   5LhxoVwOIng9z4f+rMyaqq0s9f/N7v0wPszFFRuUbKJPpBlNg+lSgCLEH
   NjTO6Z9D9YbReUozedNQYB4H+Z6x626eflrxg/UxM/T2SwrbOL5m1D/6T
   B2NjKP1Py1NSYRjoRi5nijeDKv0EIEFYag7CztHUfic7u0XtA6aea5Rfn
   GKQZYXayVteHk9Q9mlJodUua1dZmJwFFA4tVyiRuRht8suzvwk7JMNQtS
   YPAh7Wz/4GFRwTR381nM+1L7n/9cVUwnTVEWN2uCe74Gqjpe7a47DIqC9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152964691"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152964691"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 06FACC6814
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 36E85D7B87
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A8CC62009325D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 51F911A006D;
	Tue, 19 Mar 2024 13:46:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/50] python3-blivet: upgrade 3.8.2 -> 3.9.1
Date: Tue, 19 Mar 2024 13:45:10 +0800
Message-Id: <1710827139-30056-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--6.977900-10.000000
X-TMASE-MatchedRID: ZsQmnj20Xtajz0nOeth/yRMxKDqgAFSzrzD8YrC59vxXGTbsQqHbkiia
	SqRpkfBtZHp0JfxC6SwSuJRtSU84o39JXYBaBfzu/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQFH0
	IKehhaoYDCvV3UwP6eLKjrLq1doGhrkTZ9f2X/e55deF6OSK9l5Sr4ZD/PIl0S1jK4vkKprGZmq
	b6kvu1WdVlIlxlHyS4adTWu5nA0gKAC19n0zQXiPCW/PNRRp/Z+LidURF+DB3CYqJRFuvZvw610
	MA+5cFf4fASVdRdjJROQS3Qrp7u9tsy3hkbJ7eR30kDaWZBE1QWUg/hm489yG7adi1J0WbQvENH
	SHIz04JO7Zum+FX2yNsZPvxQgOeYTvHzGcGqiIKeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8irEHf
	aj14ZybXLBP7umUMbsqMItR9ce8BPmjOm1TPYYsRJUgZlHGGqJvc4z00o3WY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109437

From: Wang Mingyu <wangmy@fujitsu.com>

0002-run_program-support-timeout.patch
0003-support-infinit-timeout.patch
0005-fix-incorrect-timeout-while-system-time-changed.patch
0006-tweak-btrfs-packages.patch
0007-invoking-mount-with-infinite-timeout.patch
0008-use-oe-variable-to-replace-hardcoded-dir.patch
0010-invoking-mkfs-with-infinite-timeout.patch
0011-invoking-dd-with-infinite-timeout.patch
refreshed for 3.9.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0002-run_program-support-timeout.patch      | 13 +++++--------
 .../0003-support-infinit-timeout.patch          | 17 +++++++----------
 ...rect-timeout-while-system-time-changed.patch |  9 +++------
 .../0006-tweak-btrfs-packages.patch             | 13 +++++--------
 ...7-invoking-mount-with-infinite-timeout.patch |  9 +++------
 ...e-oe-variable-to-replace-hardcoded-dir.patch |  9 +++------
 ...10-invoking-mkfs-with-infinite-timeout.patch |  9 +++------
 ...0011-invoking-dd-with-infinite-timeout.patch |  9 +++------
 ...-blivet_3.8.2.bb => python3-blivet_3.9.1.bb} |  2 +-
 9 files changed, 33 insertions(+), 57 deletions(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.8.2.bb => python3-blivet_3.9.1.bb} (93%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
index 5b388599b..d277e8b0f 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
@@ -1,4 +1,4 @@
-From 713cf821ebe17f9e1771502a85e0905ea04dafae Mon Sep 17 00:00:00 2001
+From 8a18a6c1dea7cce6669d0eeb4230e85aa88d8e44 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Nov 2018 17:03:58 +0800
 Subject: [PATCH 02/11] run_program support timeout
@@ -7,14 +7,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- blivet/util.py | 70 ++++++++++++++++++++++++++++++++++------------------------
+ blivet/util.py | 70 +++++++++++++++++++++++++++++---------------------
  1 file changed, 41 insertions(+), 29 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index 4eac8b9..4f05076 100644
+index f8a8f88..a5da7b6 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -158,6 +158,30 @@ class Path(str):
+@@ -171,6 +171,30 @@ class Path(str):
      def __hash__(self):
          return self._path.__hash__()
  
@@ -45,7 +45,7 @@ index 4eac8b9..4f05076 100644
  
  def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=False, binary_output=False):
      if env_prune is None:
-@@ -180,35 +204,23 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -193,35 +217,23 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
              stderr_dir = subprocess.STDOUT
          else:
              stderr_dir = subprocess.PIPE
@@ -98,6 +98,3 @@ index 4eac8b9..4f05076 100644
  
  
  def run_program(*args, **kwargs):
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
index 861b2cdd4..8ab65a3e2 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
@@ -1,4 +1,4 @@
-From 5d5436dfa3bdde7b4e87ce5a40cbc724199847d6 Mon Sep 17 00:00:00 2001
+From 112b825541f498762f373cfc9918e444dda74095 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 16:18:02 +0800
 Subject: [PATCH 03/11] support infinit timeout
@@ -11,10 +11,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index 4f05076..7e89949 100644
+index a5da7b6..58117ae 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -158,6 +158,7 @@ class Path(str):
+@@ -171,6 +171,7 @@ class Path(str):
      def __hash__(self):
          return self._path.__hash__()
  
@@ -22,7 +22,7 @@ index 4f05076..7e89949 100644
  def timeout_command(argv, timeout, *args, **kwargs):
      """call shell-command and either return its output or kill it
      if it doesn't normally exit within timeout seconds and return None"""
-@@ -169,7 +170,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -182,7 +183,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
          while proc.poll() is None:
              time.sleep(0.1)
              now = datetime.datetime.now()
@@ -31,7 +31,7 @@ index 4f05076..7e89949 100644
                  os.kill(proc.pid, signal.SIGKILL)
                  os.waitpid(-1, os.WNOHANG)
                  program_log.debug("%d seconds timeout" % timeout)
-@@ -183,7 +184,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -196,7 +197,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
      program_log.debug("Return code: %d", proc.returncode)
      return (proc.returncode, proc.stdout.read())
  
@@ -40,7 +40,7 @@ index 4f05076..7e89949 100644
      if env_prune is None:
          env_prune = []
  
-@@ -192,7 +193,10 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -205,7 +206,10 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
              os.chroot(root)
  
      with program_log_lock:  # pylint: disable=not-context-manager
@@ -52,7 +52,7 @@ index 4f05076..7e89949 100644
  
          env = os.environ.copy()
          env.update({"LC_ALL": "C",
-@@ -205,7 +209,7 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -218,7 +222,7 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
          else:
              stderr_dir = subprocess.PIPE
  
@@ -61,6 +61,3 @@ index 4f05076..7e89949 100644
                                     stdin=stdin,
                                     stdout=subprocess.PIPE,
                                     stderr=stderr_dir,
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
index 9c5d53b43..795e4f120 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
@@ -1,4 +1,4 @@
-From f783b9b00da5df176fcd7927b752f574ca6db319 Mon Sep 17 00:00:00 2001
+From c645c83628b2290855cbd225e13c038ab75a7f74 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 26 Aug 2016 02:02:49 -0400
 Subject: [PATCH 05/11] fix incorrect timeout while system time changed
@@ -22,10 +22,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index 7e89949..5571e73 100644
+index 58117ae..5bc5804 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -163,14 +163,14 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -176,14 +176,14 @@ def timeout_command(argv, timeout, *args, **kwargs):
      """call shell-command and either return its output or kill it
      if it doesn't normally exit within timeout seconds and return None"""
      import subprocess, datetime, os, time, signal
@@ -43,6 +43,3 @@ index 7e89949..5571e73 100644
                  os.kill(proc.pid, signal.SIGKILL)
                  os.waitpid(-1, os.WNOHANG)
                  program_log.debug("%d seconds timeout" % timeout)
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
index 2e53a6477..b98dafeab 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
@@ -1,4 +1,4 @@
-From 8932ae933f2b6acf5e98c9956beff69ae430eed2 Mon Sep 17 00:00:00 2001
+From 359bc9f60a4bcf6be64a72c3825af65269f6c6c9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 16:33:15 +0800
 Subject: [PATCH 06/11] tweak btrfs packages
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/blivet/devices/btrfs.py b/blivet/devices/btrfs.py
-index cada940..7e4d4b8 100644
+index 259bcf8..8e4eb2b 100644
 --- a/blivet/devices/btrfs.py
 +++ b/blivet/devices/btrfs.py
-@@ -55,7 +55,7 @@ class BTRFSDevice(StorageDevice):
+@@ -57,7 +57,7 @@ class BTRFSDevice(StorageDevice):
  
      """ Base class for BTRFS volume and sub-volume devices. """
      _type = "btrfs"
@@ -28,10 +28,10 @@ index cada940..7e4d4b8 100644
  
      def __init__(self, *args, **kwargs):
 diff --git a/blivet/formats/fs.py b/blivet/formats/fs.py
-index 81e367f..55e5d57 100644
+index 932307a..865b863 100644
 --- a/blivet/formats/fs.py
 +++ b/blivet/formats/fs.py
-@@ -926,7 +926,7 @@ class BTRFS(FS):
+@@ -1049,7 +1049,7 @@ class BTRFS(FS):
      _formattable = True
      _linux_native = True
      _supported = True
@@ -40,6 +40,3 @@ index 81e367f..55e5d57 100644
      _min_size = Size("256 MiB")
      _max_size = Size("16 EiB")
      _mkfs_class = fsmkfs.BTRFSMkfs
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
index b2606d769..809f4e158 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
@@ -1,4 +1,4 @@
-From f53481dc4a56b8a996628733553e080bb0aafdd7 Mon Sep 17 00:00:00 2001
+From f159d71d742ace5640c7810bcc27365f8fde95a3 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Nov 2018 17:07:22 +0800
 Subject: [PATCH 07/11] invoking mount with infinite timeout
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index 5571e73..02c8033 100644
+index 5bc5804..9de77e1 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -258,7 +258,7 @@ def mount(device, mountpoint, fstype, options=None):
+@@ -271,7 +271,7 @@ def mount(device, mountpoint, fstype, options=None):
          makedirs(mountpoint)
  
      argv = ["mount", "-t", fstype, "-o", options, device, mountpoint]
@@ -26,6 +26,3 @@ index 5571e73..02c8033 100644
  
  
  def umount(mountpoint):
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
index 1e8bcac47..d3ab8f852 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-use-oe-variable-to-replace-hardcoded-dir.patch
@@ -1,4 +1,4 @@
-From 12e2579333258d1a690f8718e91b0f217078e886 Mon Sep 17 00:00:00 2001
+From 6a85945c060154581f5a129a6a946258bf9333c4 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 03:54:12 -0400
 Subject: [PATCH 08/11] use oe variable to replace hardcoded dir
@@ -15,10 +15,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index b745a79..b5b4258 100644
+index e6bb3f3..700085b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -61,10 +61,10 @@ class blivet_sdist(sdist):
+@@ -73,10 +73,10 @@ class blivet_sdist(sdist):
  
  
  data_files = [
@@ -33,6 +33,3 @@ index b745a79..b5b4258 100644
  ]
  
  
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
index c441acd17..394a818aa 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
@@ -1,4 +1,4 @@
-From 33844f6773a676bd57240954e402ae9a843663a4 Mon Sep 17 00:00:00 2001
+From abadd821acffd5dbc870f86dad3c3a6bf3f2f74f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 16 Jun 2017 15:43:00 +0800
 Subject: [PATCH 10/11] invoking mkfs with infinite timeout
@@ -18,10 +18,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/tasks/fsmkfs.py b/blivet/tasks/fsmkfs.py
-index e4a6aaa8..9730f7e5 100644
+index e9daa9e..2174cc3 100644
 --- a/blivet/tasks/fsmkfs.py
 +++ b/blivet/tasks/fsmkfs.py
-@@ -203,7 +203,7 @@ class FSMkfs(task.BasicApplication, FSMkfsTask):
+@@ -207,7 +207,7 @@ class FSMkfs(task.BasicApplication, FSMkfsTask):
          options = options or []
          cmd = self._mkfs_command(options, label, set_uuid, nodiscard)
          try:
@@ -30,6 +30,3 @@ index e4a6aaa8..9730f7e5 100644
          except OSError as e:
              raise FSError(e)
  
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
index 13c2933f0..48ffaf2cb 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
@@ -1,4 +1,4 @@
-From 21ca2b859a49e96a230d55a7866dfc7ed5d1366c Mon Sep 17 00:00:00 2001
+From 3d398173f02bb641473299abb1166fdcc3643666 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 6 Mar 2018 17:28:56 +0800
 Subject: [PATCH 11/11] invoking dd with infinite timeout
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/devices/partition.py b/blivet/devices/partition.py
-index 623e1c9..141d8ad 100644
+index b60b9b4..fa8858b 100644
 --- a/blivet/devices/partition.py
 +++ b/blivet/devices/partition.py
-@@ -618,7 +618,7 @@ class PartitionDevice(StorageDevice):
+@@ -667,7 +667,7 @@ class PartitionDevice(StorageDevice):
          cmd = ["dd", "if=/dev/zero", "of=%s" % device, "bs=%d" % bs,
                 "seek=%d" % start, "count=%d" % count]
          try:
@@ -26,6 +26,3 @@ index 623e1c9..141d8ad 100644
          except OSError as e:
              log.error(str(e))
          finally:
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.8.2.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.1.bb
similarity index 93%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_3.8.2.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.9.1.bb
index 52b3aa7dc..e9c27548e 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.8.2.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.1.bb
@@ -16,7 +16,7 @@ SRC_URI += "\
            file://0010-invoking-mkfs-with-infinite-timeout.patch \
            file://0011-invoking-dd-with-infinite-timeout.patch \
 "
-SRC_URI[sha256sum] = "88d1500c76c4660aec7da9e9aa54f7f574546571b52c07a67e1417883c2cb25b"
+SRC_URI[sha256sum] = "fda09ac9ddbbacbb0c00e867006cf36b213b8f5707accdfaaebfd27378f362d8"
 
 inherit pypi features_check systemd setuptools3_legacy
 
-- 
2.34.1


