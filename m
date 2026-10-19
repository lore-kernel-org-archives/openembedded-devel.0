Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A676CCF2EB
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:56:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33880.1792414583851853562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PxUXjsn8;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a01933b584so14862565e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792414582; x=1793019382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixmh3AVEQ8CPzxNYpQ2FiOesVOl5CjbL8wKgnDLLz44=;
        b=PxUXjsn8joaqNon/u5HCDanmNBKURQzL7Z9Ys3MWBulAffyWcg9/31eiOvNnbuzYCL
         VQ9AWKSsn/b9Z1GdTt0rRDNdnjKapymYwWVMPJ0NEXqDM2FBiLPxbn6N2ZuLF4gCDDHD
         y2CGNVQrujjX262mKH08vW9zjHsHQif/NrQck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414582; x=1793019382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ixmh3AVEQ8CPzxNYpQ2FiOesVOl5CjbL8wKgnDLLz44=;
        b=kyA1cRwfwez8eGVbhbnsJ8Ke/xzjv4fTGHeds2NocSLtLlmnUSBBQjEav9IZUeQaC6
         H49/rhr1PHYeU2dZ2pLldqfja68Pi2CGbxbuM9Tg/eGcKCs6zPBmn9eZWiySlCINPzCi
         jXG9P18BQXbUK0NaQYH+Of4SuWa17t73EmpN3NgTvz61wPzDQiWtOaLUOFn3Yo0zLCXF
         ZtdqOmcRhdy1Y3WCQZQOQiDc/YfViEgZHcp7Fu5YVG+IR+HmcSqZTMacfnYiCYCCsipE
         xz3J7TmcOdB37xbrBBpb039bvA2ycchmYAc96fCt98wZrJ8Mb5WgVfr/egJql4z2yRUi
         uCgg==
X-Gm-Message-State: AFq9FYIrtJ7bs6P+/guq/PZQ8wYDYV+NCm502KRi2Dbq2cVFLX0xswfI
	GtS0YYW6AXzft2DvRdsgYbuXjGqjJJEh1QAclza2VyQmb1kjmguAHkz4/wFq+fScAdS4S2ReZh4
	2mKSZ
X-Gm-Gg: AYBFou0JR+kDKMiubAFb2vhDG9joYlmDlLICEbL3NclveaCy/bmgNWIzCTkXZXqNWY6
	3MQ1D4ry4IsOsoTL7XTRUjhv1Xl3KfWWv33NJwu6OG1LozMruVMmkxt9zS+mQrBPM3fpjahBzrV
	TFaeE1dJiVAp+DyAenwkTTrNZKMVMW31TKw4x2/h1pCsYAlx0C//zlF2EflCseE1o16zDkZbY0V
	UOC0KTtKDeCiM4UYF2BTgwqjm0ssYO+UuPn/9lKfJG6u+kEZxWigU9lfqStW9ZA2uuJybVotXr4
	Xw35q654OnmToJn3tztTzjTD6cuzQy0K4+G9QrkVyhfhaaGLkT5WuGTDzYDVQFrE8ds7eT4cnHr
	o1G2azTqU7kYowCXGGIwuqODe970/KTjOx3/EFdwhRUnjW9lsuu40tZmSH+hcTLWZSNcnyVhHdT
	momrTOVgPD2Nwy95VLl5Y4qWjTfygtpjuvW72zlM9mSqCLHApgo7bIkjL6pWWiekPndwoLtOAWu
	famHVgj/0u65J/3FuZMoWYXY4jA8qE+rXXad+GlVsg5EIaVPjWakKdMmXH3wVuupWnUmf53mGPu
	mF1hPSCy6wRi1xp6cPL7z9Q=
X-Received: by 2002:a05:600c:c4a1:b0:4a1:efd3:9862 with SMTP id 5b1f17b1804b1-4a1efd399c2mr14413305e9.21.1792414581829;
        Mon, 19 Oct 2026 05:56:21 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm1527565f8f.35.2026.10.19.05.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:56:21 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-blivet: Upgrade 3.13.2 -> 3.14.2
Date: Mon, 19 Oct 2026 15:56:09 +0300
Message-ID: <20261019125616.3888504-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019125616.3888504-1-leon.anavi@konsulko.com>
References: <20261019125616.3888504-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 12:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131118

Upgrade to release 3.14.2:

- fs: Fix filesystem type for temporary mounts
- misc: Fix condition for installing pocketlint on Debian/Ubuntu
- misc: Use ansible_facts instead of deprecated top-level fact variables
- Update properties for started stratis pools during populate
- Fix extra mount options for Stratis filesystems in fstab
- Directly access _type/_name in _to_string to avoid subclass property
  lock
- Fix deadlock between blivet_lock and logging lock

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0002-run_program-support-timeout.patch       | 12 ++++++------
 .../0003-support-infinit-timeout.patch           | 16 ++++++++--------
 ...rrect-timeout-while-system-time-changed.patch |  8 ++++----
 .../0006-tweak-btrfs-packages.patch              |  8 ++++----
 ...07-invoking-mount-with-infinite-timeout.patch |  8 ++++----
 ...009-invoking-fsck-with-infinite-timeout.patch | 11 ++++-------
 ...010-invoking-mkfs-with-infinite-timeout.patch |  8 ++++----
 .../0011-invoking-dd-with-infinite-timeout.patch |  6 +++---
 ...blivet_3.13.2.bb => python3-blivet_3.14.2.bb} |  2 +-
 9 files changed, 38 insertions(+), 41 deletions(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.13.2.bb => python3-blivet_3.14.2.bb} (95%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
index b577cd4bd4..845c45c39e 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_program-support-timeout.patch
@@ -1,7 +1,7 @@
-From 8a18a6c1dea7cce6669d0eeb4230e85aa88d8e44 Mon Sep 17 00:00:00 2001
+From a2f0c4b1afacf07b550ba26b7658a34502831bcf Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Nov 2018 17:03:58 +0800
-Subject: [PATCH 02/11] run_program support timeout
+Subject: [PATCH] run_program support timeout
 
 Upstream-Status: Pending
 
@@ -11,14 +11,14 @@ Rebase for blivet 3.12.1.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- blivet/util.py | 70 ++++++++++++++++++++++++++++++++++------------------------
+ blivet/util.py | 70 +++++++++++++++++++++++++++++---------------------
  1 file changed, 41 insertions(+), 29 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index d194a5b..5985164 100644
+index 63d9091..efed862 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -169,6 +169,30 @@ class Path(str):
+@@ -179,6 +179,30 @@ class Path(str):
      def __hash__(self):
          return self._path.__hash__()
  
@@ -49,7 +49,7 @@ index d194a5b..5985164 100644
  
  def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=False, binary_output=False):
      if env_prune is None:
-@@ -191,35 +215,23 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -201,35 +225,23 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
              stderr_dir = subprocess.STDOUT
          else:
              stderr_dir = subprocess.PIPE
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
index 8ab65a3e22..ecee01f4e7 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0003-support-infinit-timeout.patch
@@ -1,7 +1,7 @@
-From 112b825541f498762f373cfc9918e444dda74095 Mon Sep 17 00:00:00 2001
+From 485f01b52fa958d5e8cec581feebd9c725e05e3c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 16:18:02 +0800
-Subject: [PATCH 03/11] support infinit timeout
+Subject: [PATCH] support infinit timeout
 
 Upstream-Status: Pending
 
@@ -11,10 +11,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index a5da7b6..58117ae 100644
+index efed862..623f732 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -171,6 +171,7 @@ class Path(str):
+@@ -179,6 +179,7 @@ class Path(str):
      def __hash__(self):
          return self._path.__hash__()
  
@@ -22,7 +22,7 @@ index a5da7b6..58117ae 100644
  def timeout_command(argv, timeout, *args, **kwargs):
      """call shell-command and either return its output or kill it
      if it doesn't normally exit within timeout seconds and return None"""
-@@ -182,7 +183,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -190,7 +191,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
          while proc.poll() is None:
              time.sleep(0.1)
              now = datetime.datetime.now()
@@ -31,7 +31,7 @@ index a5da7b6..58117ae 100644
                  os.kill(proc.pid, signal.SIGKILL)
                  os.waitpid(-1, os.WNOHANG)
                  program_log.debug("%d seconds timeout" % timeout)
-@@ -196,7 +197,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -204,7 +205,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
      program_log.debug("Return code: %d", proc.returncode)
      return (proc.returncode, proc.stdout.read())
  
@@ -40,7 +40,7 @@ index a5da7b6..58117ae 100644
      if env_prune is None:
          env_prune = []
  
-@@ -205,7 +206,10 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -213,7 +214,10 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
              os.chroot(root)
  
      with program_log_lock:  # pylint: disable=not-context-manager
@@ -52,7 +52,7 @@ index a5da7b6..58117ae 100644
  
          env = os.environ.copy()
          env.update({"LC_ALL": "C",
-@@ -218,7 +222,7 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
+@@ -226,7 +230,7 @@ def _run_program(argv, root='/', stdin=None, env_prune=None, stderr_to_stdout=Fa
          else:
              stderr_dir = subprocess.PIPE
  
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
index 795e4f1206..572fac6acb 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-fix-incorrect-timeout-while-system-time-changed.patch
@@ -1,7 +1,7 @@
-From c645c83628b2290855cbd225e13c038ab75a7f74 Mon Sep 17 00:00:00 2001
+From 7054727a3544730c0abd11658f7175ad38e41fb8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 26 Aug 2016 02:02:49 -0400
-Subject: [PATCH 05/11] fix incorrect timeout while system time changed
+Subject: [PATCH] fix incorrect timeout while system time changed
 
 While system time changed by NTP, invoking timeout_command
 breaks with incorrect timeout.
@@ -22,10 +22,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index 58117ae..5bc5804 100644
+index 623f732..5b51427 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -176,14 +176,14 @@ def timeout_command(argv, timeout, *args, **kwargs):
+@@ -184,14 +184,14 @@ def timeout_command(argv, timeout, *args, **kwargs):
      """call shell-command and either return its output or kill it
      if it doesn't normally exit within timeout seconds and return None"""
      import subprocess, datetime, os, time, signal
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
index 6c53f03db1..0028298a62 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-tweak-btrfs-packages.patch
@@ -1,4 +1,4 @@
-From b55b1023f8f1ad3121928eb9d0ee9902f5474752 Mon Sep 17 00:00:00 2001
+From 5dabe62759e1de84142367aedc7c3a790bf1259b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 8 May 2017 16:33:15 +0800
 Subject: [PATCH] tweak btrfs packages
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/blivet/devices/btrfs.py b/blivet/devices/btrfs.py
-index c446e7e..37c183e 100644
+index 283da4e..87163cd 100644
 --- a/blivet/devices/btrfs.py
 +++ b/blivet/devices/btrfs.py
 @@ -58,7 +58,7 @@ class BTRFSDevice(StorageDevice):
@@ -28,10 +28,10 @@ index c446e7e..37c183e 100644
  
      def __init__(self, *args, **kwargs):
 diff --git a/blivet/formats/fs.py b/blivet/formats/fs.py
-index 1e102b6..f16941e 100644
+index 631aeb2..3512675 100644
 --- a/blivet/formats/fs.py
 +++ b/blivet/formats/fs.py
-@@ -1050,7 +1050,7 @@ class BTRFS(FS):
+@@ -1067,7 +1067,7 @@ class BTRFS(FS):
      _formattable = True
      _linux_native = True
      _supported = True
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
index 809f4e1584..0c30f4d3c2 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0007-invoking-mount-with-infinite-timeout.patch
@@ -1,7 +1,7 @@
-From f159d71d742ace5640c7810bcc27365f8fde95a3 Mon Sep 17 00:00:00 2001
+From 73e603d1b4bc9ae2bbad274ca9596f0ae5760a19 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Nov 2018 17:07:22 +0800
-Subject: [PATCH 07/11] invoking mount with infinite timeout
+Subject: [PATCH] invoking mount with infinite timeout
 
 This large timeout is needed when running on machines with
 lots of disks, or with slow disks.
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/util.py b/blivet/util.py
-index 5bc5804..9de77e1 100644
+index 5b51427..101ea31 100644
 --- a/blivet/util.py
 +++ b/blivet/util.py
-@@ -271,7 +271,7 @@ def mount(device, mountpoint, fstype, options=None):
+@@ -279,7 +279,7 @@ def mount(device, mountpoint, fstype, options=None):
          makedirs(mountpoint)
  
      argv = ["mount", "-t", fstype, "-o", options, device, mountpoint]
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-fsck-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-fsck-with-infinite-timeout.patch
index f4778779b6..d2f23ba765 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-fsck-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invoking-fsck-with-infinite-timeout.patch
@@ -1,7 +1,7 @@
-From 9624b6d0dda40aaecbaf9530be819943575a2ec6 Mon Sep 17 00:00:00 2001
+From 627b47094dc3a1f023f2fdb300cebf2c553bfaf2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 1 Jun 2017 16:05:27 +0800
-Subject: [PATCH 09/11] invoking fsck with infinite timeout
+Subject: [PATCH] invoking fsck with infinite timeout
 
 This large timeout is needed when running on machines with
 lots of disks, or with slow disks.
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/tasks/fsck.py b/blivet/tasks/fsck.py
-index 5274f13..6e074c4 100644
+index 8a52f63..e2224ad 100644
 --- a/blivet/tasks/fsck.py
 +++ b/blivet/tasks/fsck.py
-@@ -77,7 +77,7 @@ class FSCK(task.BasicApplication, fstask.FSTask):
+@@ -74,7 +74,7 @@ class FSCK(task.BasicApplication, fstask.FSTask, metaclass=abc.ABCMeta):
              raise FSError("\n".join(error_msgs))
  
          try:
@@ -26,6 +26,3 @@ index 5274f13..6e074c4 100644
          except OSError as e:
              raise FSError("filesystem check failed: %s" % e)
  
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
index 394a818aa2..d53751d6ab 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-invoking-mkfs-with-infinite-timeout.patch
@@ -1,7 +1,7 @@
-From abadd821acffd5dbc870f86dad3c3a6bf3f2f74f Mon Sep 17 00:00:00 2001
+From 497b681560b39b431542bfab2b03d2a013a0d6cc Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 16 Jun 2017 15:43:00 +0800
-Subject: [PATCH 10/11] invoking mkfs with infinite timeout
+Subject: [PATCH] invoking mkfs with infinite timeout
 
 This large timeout is needed when running on machines with
 lots of disks, or with slow disks.
@@ -18,10 +18,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/tasks/fsmkfs.py b/blivet/tasks/fsmkfs.py
-index e9daa9e..2174cc3 100644
+index 936b212..39a5323 100644
 --- a/blivet/tasks/fsmkfs.py
 +++ b/blivet/tasks/fsmkfs.py
-@@ -207,7 +207,7 @@ class FSMkfs(task.BasicApplication, FSMkfsTask):
+@@ -203,7 +203,7 @@ class FSMkfs(task.BasicApplication, FSMkfsTask, metaclass=abc.ABCMeta):
          options = options or []
          cmd = self._mkfs_command(options, label, set_uuid, nodiscard)
          try:
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
index ea4cffa9b3..ab758ffb74 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invoking-dd-with-infinite-timeout.patch
@@ -1,4 +1,4 @@
-From 5ee527fab06f9d33b162a6cd0c068d7b3ac2ecb0 Mon Sep 17 00:00:00 2001
+From 32f556f18cf2f2fbcf361eecbc05b7771193a91e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 6 Mar 2018 17:28:56 +0800
 Subject: [PATCH] invoking dd with infinite timeout
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/blivet/devices/partition.py b/blivet/devices/partition.py
-index 2d67be8..a4cf9a0 100644
+index 4260223..4fc6e19 100644
 --- a/blivet/devices/partition.py
 +++ b/blivet/devices/partition.py
-@@ -677,7 +677,7 @@ class PartitionDevice(StorageDevice):
+@@ -755,7 +755,7 @@ class PartitionDevice(StorageDevice):
          cmd = ["dd", "if=/dev/zero", "of=%s" % device, "bs=%d" % bs,
                 "seek=%d" % start, "count=%d" % count]
          try:
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.14.2.bb
similarity index 95%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.14.2.bb
index 69ec8c0487..24da6ce30a 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.14.2.bb
@@ -15,7 +15,7 @@ SRC_URI += "\
            file://0010-invoking-mkfs-with-infinite-timeout.patch \
            file://0011-invoking-dd-with-infinite-timeout.patch \
 "
-SRC_URI[sha256sum] = "6d8374d05eeab513b2a26cf01267e853df7b31e13ad1a1ba7d73a856190d0518"
+SRC_URI[sha256sum] = "db2cd996ed354d47fdc60740d912a102250a0fc469bfe17df6bced649c172e5b"
 
 inherit pypi features_check systemd python_setuptools_build_meta
 
-- 
2.47.3


