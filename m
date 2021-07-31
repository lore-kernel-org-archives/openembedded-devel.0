Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.458.1627754269974153311
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jul 2021 10:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dxrOAl2T;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so25469661pja.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jul 2021 10:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2oN5ev7h+JpjLhOaXhNyePbduwd4JJjg+oro47/R4l8=;
        b=dxrOAl2TiuGTJoLDYPyW69ejdb8UPog1a6UT5sNcGsxJWOIhRLQbKhgTNzOIWI0qh0
         wvdWp0lzAF87lyD7iCO3Kb553O2Db4SQDkvLIsBztbHgTTa3lWIsV4NKDPhODTGUWdHj
         R47WsELn8lxjFBVOaq/rsCvDsJLtHFCKMWKcgFcWCYMeRa4yEgmPzMvSsVUhwC9ex64D
         bKitB/8/Bv7Wl5fL+eRBETokG9HQ66RmVIYOL03yoWnxjI8/avRXJJ5XY4wgIOmqIbwL
         UH1YRXVFKIAakX1XjygACVKQzCYbbKdR6K1Dc00vzG+lRvtFOsDp6JHQTCOgoaoRndbu
         Et5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2oN5ev7h+JpjLhOaXhNyePbduwd4JJjg+oro47/R4l8=;
        b=dIJIxmC+PLAI0DC6DuPHE3c0UQAhfUcj7OAbEG73zXrLP3NcPY8OG/89xOd5nJ217h
         uidScXhwSfwKJ/ICzo0kS0oBtiB4gecPxWhg+RXbrxB4lC66COrFmEb3jZjLMUln4z6q
         Xw1o9bNxCmxPX9TtIwHN9sLUV6JZzkE9q8wB8D+0g3zxKudrtlDt4xJuRwbdzcQ886db
         rgXCbbOcAZh9jWiT66+YOcma0k/+2V4hKXoJvomzaZv5UjvUH67JqULK78F2gHizagqq
         ZW+A+B34XmSOJ65/N4keNaVnSFNt8uM2Gu7h6j70SMPxOwk0VPMJRYzyij+J8fLxjg8l
         JPrA==
X-Gm-Message-State: AOAM533uq6LtZHox9fspfsDx7+MSaGi8ofVOhS3JI+/mvOagCr2bqef0
	amFeGEpoyaH/ZKtyDndjly9s03rn+czOlg==
X-Google-Smtp-Source: ABdhPJw31MBWVWG5xsG59c4185Mc12PsO2T4X0QizMN/MJajextfwi9hHbUv776y/vl+1+1BdEvefg==
X-Received: by 2002:a17:90b:1c8e:: with SMTP id oo14mr9310915pjb.108.1627754269261;
        Sat, 31 Jul 2021 10:57:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id t19sm6824613pfg.216.2021.07.31.10.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 10:57:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] ntp: Do not use PTHREAD_STACK_MIN on glibc
Date: Sat, 31 Jul 2021 10:57:46 -0700
Message-Id: <20210731175746.3669064-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Int not a compile time constant in glibc 2.34+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-not-use-PTHREAD_STACK_MIN-on-glibc.patch | 32 +++++++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p15.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch

diff --git a/meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch b/meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
new file mode 100644
index 0000000000..372938c6d6
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
@@ -0,0 +1,32 @@
+From 082a504cfcc046c3d8adaae1164268bc94e5108a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Jul 2021 10:51:41 -0700
+Subject: [PATCH] libntp: Do not use PTHREAD_STACK_MIN on glibc
+
+In glibc 2.34+ PTHREAD_STACK_MIN is not a compile-time constant which
+could mean different stack sizes at runtime on different architectures
+and it also causes compile failure. Default glibc thread stack size
+or 64Kb set by ntp should be good in glibc these days.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libntp/work_thread.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libntp/work_thread.c b/libntp/work_thread.c
+index 03a5647..3ddd751 100644
+--- a/libntp/work_thread.c
++++ b/libntp/work_thread.c
+@@ -41,7 +41,7 @@
+ #ifndef THREAD_MINSTACKSIZE
+ # define THREAD_MINSTACKSIZE	(64U * 1024)
+ #endif
+-#ifndef __sun
++#if !defined(__sun) && !defined(__GLIBC__)
+ #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
+ # undef THREAD_MINSTACKSIZE
+ # define THREAD_MINSTACKSIZE PTHREAD_STACK_MIN
+--
+2.32.0
+
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index e668113c50..6129bab261 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -13,6 +13,7 @@ DEPENDS = "libevent"
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
            file://ntp-4.2.4_p6-nano.patch \
            file://reproducibility-fixed-path-to-posix-shell.patch \
+           file://0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch \
            file://ntpd \
            file://ntp.conf \
            file://ntpdate \
--
2.32.0
