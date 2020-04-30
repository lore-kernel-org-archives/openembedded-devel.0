Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.1899.1588224717165498306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 22:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dqgzHKfW;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id d17so2248447pgo.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2020 22:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EfF8eOtO7JEWTVRFFjgw8n92gR2WuceRkIo2nOyYbcc=;
        b=dqgzHKfWYGwK7DU7pLWpa/UV4EQgu++FURcXu5OljdTtALULS+WYaCkFs93N8vZ1xV
         YaIiMI8+tK5qCxQb5gzCFXI3AgyZojDAIcAL5k+lHhOdP1YPsnd/cxIfZpi5T3zUUWh4
         93cDxmoXAK2kMWbzrcp2oceucXeLCkm4sdDeU8+3ZNb5yLnj+X0OG0blmEhY+PNx1tuk
         3erJHZRQjANsHJ+xke5c5Sd2m7Itte/94E9RZZDk/3+SQ1zaPTq2SLLvH4I5lluZPl5v
         VL1lM2j1fULjQpsR7cbkNhFR1ELPGyR938xpjCyX5GOMYhQqavfN5+4vgNRTrDBPZEba
         s/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EfF8eOtO7JEWTVRFFjgw8n92gR2WuceRkIo2nOyYbcc=;
        b=O6BD5mgOBOCCJSQ8jIlhDDxYpo5z+dj/yjq6u9kR/qKAYcczycg0R4xgVN2M8BNUN4
         fYowyMn2MhPkbv05LrrgkJ2pRtUYAYBsofH8uVK/6SLcwN9g0PPKG0ist4qQm9SzkVF8
         TaTLG8Pg7QTcE0sm4yiA70zxla6gwNmvKyP6iaiK6zg3qUqCL6UA6TkBWJkMHZLqbEKh
         1YWOFyC3FXdOsORKM1hpI8ldEOgkTm/z+gIU8sjAdZqnbpF1trBrlfrc5khtHJmu2Lcp
         qoQ/0p9uzmebua/YaWrYc6r8tpg3pj7Fb1WUAspmj0IhfTEZCE9fy8d3+nQVKBe/+lIS
         VEhA==
X-Gm-Message-State: AGi0Pubtqw+5Gr2CwcCFzCDw1sbSNzX6HgpRQe6byIX4orVAGVUMfU1Y
	bMv84hA7VMUD5vKdg5DoKq6p8mFXYaI=
X-Google-Smtp-Source: APiQypLt2jFx7AhYPHj0IOqeCjtC/mEiYVZOqd7Iqt0rlzCwgI1+fUwwbZzAwiGGsM++v2Ti/0Bs7w==
X-Received: by 2002:aa7:8b12:: with SMTP id f18mr1850613pfd.81.1588224716297;
        Wed, 29 Apr 2020 22:31:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e11c])
        by smtp.gmail.com with ESMTPSA id v26sm2418780pfe.121.2020.04.29.22.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 22:31:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/6] waf: Add cross answers for riscv32
Date: Wed, 29 Apr 2020 22:31:48 -0700
Message-Id: <20200430053149.226494-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430053149.226494-1-raj.khem@gmail.com>
References: <20200430053149.226494-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cross-answers-riscv32.txt                 | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
new file mode 100644
index 0000000000..759afe8f92
--- /dev/null
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
@@ -0,0 +1,41 @@
+Checking uname sysname type: "Linux"
+Checking uname version type: "# Wed May 20 10:34:39 UTC 2015"
+Checking simple C program: "hello world"
+rpath library support: OK
+-Wl,--version-script support: OK
+Checking getconf LFS_CFLAGS: NO
+Checking correct behavior of strtoll: NO
+Checking for working strptime: OK
+Checking for C99 vsnprintf: "1"
+Checking for HAVE_SHARED_MMAP: OK
+Checking for HAVE_MREMAP: OK
+Checking for HAVE_SECURE_MKSTEMP: OK
+Checking for HAVE_IFACE_GETIFADDRS: NO
+Checking for HAVE_IFACE_IFCONF: NO
+Checking for HAVE_IFACE_IFREQ: NO
+Checking for large file support without additional flags: NO
+Checking for -D_FILE_OFFSET_BITS=64: OK
+Checking for HAVE_INCOHERENT_MMAP: NO
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
+Checking whether the WRFILE -keytab is supported: OK
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
+Checking whether POSIX capabilities are available: OK
+Checking if can we convert from CP850 to UCS-2LE: OK
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
+Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
+Checking whether fcntl locking is available: OK
+Checking for the maximum value of the 'time_t' type: NO
+Checking whether the realpath function allows a NULL argument: OK
+Checking for ftruncate extend: OK
+getcwd takes a NULL argument: OK
+Checking for small off_t: NO
+Checking whether blkcnt_t is 32 bit: NO
+Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: NO
-- 
2.26.2

