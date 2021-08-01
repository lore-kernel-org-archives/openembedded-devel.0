Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.2603.1627781111337386389
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jul 2021 18:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RT8Ycfy5;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id j18-20020a17090aeb12b029017737e6c349so12262416pjz.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jul 2021 18:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=arGtkQ0g29UKgCnwNZYsnGStewJ7S8N1NsnKkc6kHLI=;
        b=RT8Ycfy5MYVaZaoXvaPjD+WDUzhBBUL0VwKxDIllCEqFf8Ts4UiVkswRlY/RMTKYKp
         9OfWiabnQZNs2XYKQc2eRciKv68LVU1/8lTrgcX3Q6g0xBqY++7/smhsGL052VgP5s/9
         tZSQCu+kyZRyMuXl+ZzUToT0sMc00sSwVKDLCMS66uoCcmvrR4seQTq8d+mKvLKwVvZb
         Yls4zww/nCabX2F4k7Fo1Qhhli7GNCjMn0sYZ4Q/l5/a+NxzfVj4HHWVPRTDI5TwPg5l
         DqLxIgIsvnmkMh15q1CZ+yBrZi2ZlkY8O7B6QBy8RLBy8IctE/LhrFg6BJH/dQyNzg9q
         fwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=arGtkQ0g29UKgCnwNZYsnGStewJ7S8N1NsnKkc6kHLI=;
        b=Jeb1wPnKYw0xM44u1TQerDaHcr524dVIGrw6DF/BuEJvLSetYP630OMBxw5qctdtzO
         VA4RKBMMP6M2jKHC/vxSxnTCm9v6ON/A1G0rm1UbcFlw6p/xHnhCdoMlYyHL5MGNsGIn
         eluqlTD7SnaoxIvtyd6nKobgq+D3e4FJN54sFnBkVWArOM/IXH0xBKM2JQE2wNk/h00y
         v252LQC60SKGsY3x+Sarn6aV0kO0ijsmJN7JysgmRKYI2mYP21WxlAETcJnmJH5LLvGY
         Fo0JM4PNLuz/HgqmUuSTZi7w/hdeWwZzfK4HtOW5nu5N+Abne1y7vc0z3ASoQkEtuZww
         n0Iw==
X-Gm-Message-State: AOAM533nE8fhEJyfWIK8xn/DAC/WtuAmE5smQvsm7iM9gEdvhti8wOU0
	m3bQGedPBVMvuyaAc3xULjxNUgfvTeFy7Q==
X-Google-Smtp-Source: ABdhPJxf4MOcNnMvO9S7Jykfk66LskNLm/Y6YCFTFW2tXsz9Ipp6YCGr5LHelFK2JP9G9YTPk7LYMg==
X-Received: by 2002:a17:90a:f493:: with SMTP id bx19mr10353035pjb.224.1627781110621;
        Sat, 31 Jul 2021 18:25:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id s36sm8066917pgk.64.2021.07.31.18.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 18:25:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] ntp: Fix make check
Date: Sat, 31 Jul 2021 18:25:06 -0700
Message-Id: <20210801012507.2054977-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some test code is not yet ported to build with gcc 11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ith-new-compiler-defaults-to-fno-com.patch | 66 +++++++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p15.bb       |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch

diff --git a/meta-networking/recipes-support/ntp/ntp/0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch b/meta-networking/recipes-support/ntp/ntp/0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch
new file mode 100644
index 0000000000..42e1efd8be
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch
@@ -0,0 +1,66 @@
+From 778f3cddc20930185a917fa3f8ffe1ef2b0b0ea0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Jul 2021 13:27:16 -0700
+Subject: [PATCH] test: Fix build with new compiler defaults to -fno-common
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sntp/tests/run-packetHandling.c | 2 +-
+ sntp/tests/run-t-log.c          | 2 +-
+ sntp/tests/run-utilities.c      | 2 +-
+ tests/libntp/test-libntp.h      | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/sntp/tests/run-packetHandling.c b/sntp/tests/run-packetHandling.c
+index 7790b20..c58380c 100644
+--- a/sntp/tests/run-packetHandling.c
++++ b/sntp/tests/run-packetHandling.c
+@@ -64,7 +64,7 @@ void resetTest(void)
+   setUp();
+ }
+
+-char const *progname;
++extern char const *progname;
+
+
+ //=======MAIN=====
+diff --git a/sntp/tests/run-t-log.c b/sntp/tests/run-t-log.c
+index 268bf41..cd835bc 100644
+--- a/sntp/tests/run-t-log.c
++++ b/sntp/tests/run-t-log.c
+@@ -50,7 +50,7 @@ void resetTest(void)
+   setUp();
+ }
+
+-char const *progname;
++extern char const *progname;
+
+
+ //=======MAIN=====
+diff --git a/sntp/tests/run-utilities.c b/sntp/tests/run-utilities.c
+index f717882..98d9bf1 100644
+--- a/sntp/tests/run-utilities.c
++++ b/sntp/tests/run-utilities.c
+@@ -58,7 +58,7 @@ void resetTest(void)
+   setUp();
+ }
+
+-char const *progname;
++extern char const *progname;
+
+
+ //=======MAIN=====
+diff --git a/tests/libntp/test-libntp.h b/tests/libntp/test-libntp.h
+index 93050b3..60461d8 100644
+--- a/tests/libntp/test-libntp.h
++++ b/tests/libntp/test-libntp.h
+@@ -5,4 +5,4 @@
+
+ time_t timefunc(time_t *ptr);
+ void settime(int y, int m, int d, int H, int M, int S);
+-time_t nowtime;
++extern time_t nowtime;
+--
+2.32.0
+
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index 6129bab261..37f67095c5 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntp-4.2.4_p6-nano.patch \
            file://reproducibility-fixed-path-to-posix-shell.patch \
            file://0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch \
+           file://0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch \
            file://ntpd \
            file://ntp.conf \
            file://ntpdate \
--
2.32.0
