Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.4996.1615530864000514917
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 22:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ehhRJPhW;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id s21so1195769pfm.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Mar 2021 22:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=94lCod575KZuAgusb/4kbUufykpaNK/KsUHBOCD3zJ4=;
        b=ehhRJPhWGsK/hb1umfxHvGPaA6kbXm31x/Kul2D2onOEPz+qLhzN65ftkJykB7saAT
         9V3BlwPJ11VEoMSVt52Du5kXY/7VlOcLwY9gNPS2dF8OXDCVe+pPPc+X/w1KXntrGqwA
         ag3wxAQXGuBMfdMgCO6er5naIqu2eK3ZKtLFWul+ywxjK1a48CcwFgsCw/jLBHiGSxmD
         ckcy3u4o4Q5mSpG2ET+wBqRDtisBvITJZH+BXZqsnDP7aGCNB0I9h0h0tCVkwIYX2uY8
         ywcCDS2MwFS9D+bBHRgb1nlddpMcdjm6Xun1dK7xqAFbJZye4Z6Dz4LEkaipAfXn0obJ
         Ckbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=94lCod575KZuAgusb/4kbUufykpaNK/KsUHBOCD3zJ4=;
        b=TJYfQJH+lojShU4TSJPdiJTyIUXhnqB0NjchQbqDp0Lsf+O1Gs53U+LGiFugL2NKFf
         dAYVdAL11Mc3N+al5oblhrtpRu9u3sfeVtVZ9Zk44wT9gMYrpLe/zAy6P5VMWS9yoRlM
         YXDCHMYjgB8po3o44WuwGvfSANnePZ8Jq8K75eC6/dt9xV8J/AIwYY5dxIzmGIkVKkI9
         964yTt2mKCr30d2ZVCaqA0+4TBrx74udzB1NoDKDIXjg6gms3BBzEHDsPRPJYf3qkR87
         b1O+0cHOMGcsLmqb+OTrZnA82lzYT7Nk8Hz7oKYENfM9KsEX4nioLRuzSx+hzvAMxY+S
         susA==
X-Gm-Message-State: AOAM533tQBc4Y73TPMK5eGzwVzgfVIXfBs69JWxXe2KLJWtlX8gQ2k66
	QdirhV2MXV2FJ6cm9BYRZpUwiZI23r3zlQ==
X-Google-Smtp-Source: ABdhPJx2Fu13xpXiv09dS0zsLaYgtzARbk6QKzgZ4rr+EBh+Hpy1lsB8swJMuJVWrK48iIUUnAVlQA==
X-Received: by 2002:a63:6642:: with SMTP id a63mr10248429pgc.333.1615530862831;
        Thu, 11 Mar 2021 22:34:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id y8sm4545473pfe.36.2021.03.11.22.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 22:34:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] waf-cross-answers: Add powerpc64le version
Date: Thu, 11 Mar 2021 22:34:20 -0800
Message-Id: <20210312063420.1572257-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cross-answers-powerpc64le.txt             | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
new file mode 100644
index 0000000000..7a443cc015
--- /dev/null
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
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
+Checking for large file support without additional flags: OK
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
+Checking if can we convert from CP850 to UCS-2LE: (255, "")
+Checking if can we convert from IBM850 to UCS-2LE: (255, "")
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
+Checking whether we can use Linux thread-specific credentials: OK
+Checking whether fcntl locking is available: OK
+Checking for the maximum value of the 'time_t' type: OK
+Checking whether the realpath function allows a NULL argument: OK
+Checking for ftruncate extend: OK
+getcwd takes a NULL argument: OK
+Checking for small off_t: NO
+Checking whether blkcnt_t is 32 bit: NO
+Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
+Checking for a 64-bit host to support lmdb: OK
-- 
2.30.2

