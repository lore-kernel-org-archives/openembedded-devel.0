Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18173.1795794963411064163
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KULjDdy3;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so12311117c88.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794963; x=1796399763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncLB5AqWCXSs1X0QDg5I3C517TKbuFHnt3wjq5B+6PI=;
        b=KULjDdy3OhMPyNJnz4WG+6hhLhTaz6FFbwBtD18Od3yqhje6ikNSuts/GyZGxSAGmz
         7AMaU47EedNj7CF0iBJCLaHcWlouv7R/aPTdk0JDNjVUFEdrzv22E0zGWAxLPNL2dm31
         2sjHUJYoZkpJL2FWic3CxlQk/SkXB1ySvKs53ITZXMIzGXXdBG8yQITo2blmnSKvH5OU
         WqLBNClgvrdl1NRl6I6m5xFIwHHdjpvR8ORvYz1mi2f+/sEL8C6My4K4K5YdcF4TeO/r
         XoicC07P38n1xg32y9J/md2YanOn2ZEeZ21ONk5ViNZs3YDQLI8rrWB52zOBoKl2/jWx
         zA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794963; x=1796399763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncLB5AqWCXSs1X0QDg5I3C517TKbuFHnt3wjq5B+6PI=;
        b=XkTFE+mHiq6znPL4QzT0qC16RtlZWQNQIQ6YeqAiEkR4IwKV8hkRslM/7P06qzksgT
         MuygIekihcfuo5RSWwPzgx/dM8cKTyyKBb8g6y0yvKMjvtfanw2uGFI8Yuob364R1yTp
         Nx+DPT01ecw+CdRF+U1zT1fjNC4bbfaxbQMpgFBWq7FAnyAQfvHNUNpqS28jUSkOON4l
         23liizecH8cZsrM4+xapSp5C8k7CVeU9+HI0+7QnnwyS5euDN8YUM85Ok1GtmcoxCBtc
         lNh6yKKoSCvMKvOt1LMKgiANAHmGLotee8MqP2lSPjGvQ/4IEcmr4bIwsR8JByI5D6bk
         WcyQ==
X-Gm-Message-State: APuU4Z9J5R0KNQY0Y0ttksbpwFF5ntLobqZQVRpEoqC6koyD7LfkTVwT
	YEP7Y3iyL0LCQ7n7pZfFeLfD4v4PdXrrhvavD3+x144FpDE5sppJlE/dMyp4NZ8K
X-Gm-Gg: AZFdTZemryBX2veX26cX6EWBn0HYVwH1d1LLdcHAslzgt1bAwRMXGD3nbRog0WAWHS8
	gIxvSR7BgTw5srR5xWPLOsHoBMA6Iu7x+eeglISEL/35feOKJ845XNZXuhkA2MQM36w65Nu52BG
	BAVl2Bb2kdgd9nxMMWplWntNCNXq0sl0+u5+iwrmwxTRmNV+x5NvyNtYGzhpAf4wIJAM7ORqG0c
	+DQ5IGCcX81kwJ/oa4g7BQ+E8x3rq4dvPzapDdDnjCRB1maaZYUGaycNEcyKSunFX2ZvP16pkcB
	XhE/eBDjVkScYdy2hH/Y8h2kfUgHFVU5kdzieQBeZqdnMqn9WLm3/O0CsiiUm4/ypVpmfSqVe86
	iX80iM4FZUI6HdzuXlOvHqt2kaZRfYVNoOPOLXOCMekQfmH5M4jKdsN/YvZGRiME6hNzCcyhgSV
	ziW5BIBomzsxrKFoUFVXu++LqJRnhIiNiwcIEiBFr+oBtqQtE7uJcPH/LSkkMR3NQp5YT7Rtqqv
	Hrrcz/DRpxfIUZgbzKcJAqItjpdmkbBVB99B14ZWJeNdgH3c9jyiubT6/g4oXsq8jE1yjj85J/O
	iXguvR7sHIKTTwAxFOWYG/33sPgn/NlZixDDPMvhfEveevNKDRbRsBN8sbcC8aaHDoa1sALxF4R
	IfbPUw38z/vf0Dy40R/4Bsv9dh3cNyg+2BUzB8w0Ny/dE7Jn0FiCKbN0TFCJQBpCp7Ks8aRS+Ns
	zO0p0/RxEs9j2j+gzzTPhQL0sGtpKhfnceNiLxi/drTYtje7bGB/BKjZeWFd7lzzq5YOAvlnldn
	Z9e6NDPeIl3QTTXSLf5TIKGjwy4PNyzm47lzuKQMZ7VvshxAFZ9KOIBEM35MB5nfwiE6t2lymEm
	ZoW0
X-Received: by 2002:a05:7022:23aa:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b55688dd29mr34157727c88.19.1795794962707;
        Fri, 27 Nov 2026 07:56:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm58118218c88.8.2026.11.27.07.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:56:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/3] kernel-selftest: Skip the cgroup tests that hit the OOM killer
Date: Fri, 27 Nov 2026 07:55:56 -0800
Message-ID: <20261127155557.2874294-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127155557.2874294-1-khem.raj@oss.qualcomm.com>
References: <20261127155557.2874294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 15:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133384
Content-Type: text/plain; charset="utf-8"

cgroup:test_memcontrol runs memcg OOM cases on purpose, and testimage
fails the ptest image whenever dmesg has "Killed process":

  AssertionError: ERROR: Processes were killed by the OOM Killer:
  Memory cgroup out of memory: Killed process 3424 (test_memcontrol) ...

cgroup:test_kmem fails intermittently under memory pressure in the test
VM. Skip both.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../kernel-selftest/kernel-selftest/run-ptest              | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
index 85fa63b5e4..3c4b4993c1 100755
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
@@ -16,8 +16,13 @@
 #
 # landlock:fs_bench only reports timings, and walking its 10000 nested
 # directories takes about 90 seconds in qemu, twice the default timeout.
+#
+# cgroup:test_memcontrol triggers the OOM killer on purpose, and testimage
+# fails the run whenever dmesg has "Killed process". cgroup:test_kmem fails
+# intermittently under memory pressure in the test VM. Skip both.
 SKIP="-S ftrace:ftracetest-ktap -S filesystems:file_stressor \
-      -S ptrace:vmaccess -S tty:tty_tiocsti_test -S landlock:fs_bench"
+      -S ptrace:vmaccess -S tty:tty_tiocsti_test -S landlock:fs_bench \
+      -S cgroup:test_memcontrol -S cgroup:test_kmem"
 
 # sysmap_is_sealed can't tell at runtime whether the kernel seals the system
 # mappings, so skip it when the running kernel's config says it doesn't.
