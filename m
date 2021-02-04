Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.5318.1612429356052304163
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 01:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y8/Y3Ga1;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: andrey.z@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id m1so2306284wml.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 01:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3hp9qu2PLoSRVrwtJbCgjkOPzHbg0U68W0QO3tn11Rw=;
        b=Y8/Y3Ga1Rczs04RgNCzJjvMT2fEmoDW8pv9w0vCU9L4FSTsgHfA2qObA4Zr3V4ssIZ
         TfoFnnk6uFsqCGww1L5GrLwo/gpNoMIkHl93zTXJh4WLNYCmi3AFh3bc9JYyWtucyR/A
         Zj6JRSvPUD4jL/6dhb21QIdcgbdc+LhfTQamhWu/q6s566O5bf09xC9Ul793EJFe+Vcb
         gwzwbQ1LnLJhY42+x+x6YB7QmWZ9MwbG/avvYbfZ/ZVJbXCEDukyOKbaoIFJnVZIgDj3
         xbkuZWzoZdtZ+zF0EmAWVz70lmzekujz6NXC+MF5b9Mqa6XgEhsVX1MiDVi6ovJLDhVl
         Kj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3hp9qu2PLoSRVrwtJbCgjkOPzHbg0U68W0QO3tn11Rw=;
        b=e8ibka2hCwFa5OnYNRN8udNdME5q5dEXb6zisoC4jc1YztnQhGSL0psiHF6wmCco4N
         n90D5dRXf9OZKWE2bIwfJOcTudpLlg3etduuaYoio+FkClRUbulL+ghIZZsbZsKJqYtV
         eX4EW9x0Eh3/uzBZ8MP6j9wMuqGnETR532xSFyjCvIh3Zzr0JGrmM8g1iCyYvTjectvO
         bQbcwbC1Lb1dKY6tBdRc+L2i9KslxrJssdskjrXdIOp2f2q7Hpntu+l5AqndoNekU4V7
         f5ShObVrhqD5umBsBwFWqDpmHwavH8vrmSJWntbtwk3HQ5vk5+rdQygWPaJ2Xwi3jL7E
         tyQA==
X-Gm-Message-State: AOAM530Tq8IYHUy4iVppzmzcqDvb8dH9KtaWWTki7xSiIDA9TgMXMVNs
	d4dj87nlacWN4xZDIG6V88GMuyyD9B9RhA==
X-Google-Smtp-Source: ABdhPJxc9QdoHtFxlUWO8buWS9W/8GsqINdpem3DWVasM6MHZ/x12LHp76PeTmwSv2cS/CyuU2tuog==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr6713806wmb.0.1612429354444;
        Thu, 04 Feb 2021 01:02:34 -0800 (PST)
Return-Path: <andrey.z@gmail.com>
Received: from aherlnxbspsrv01.lgs-net.com (ahersrvdom51.leica-geosystems.com. [193.8.40.99])
        by smtp.gmail.com with ESMTPSA id p18sm7088432wrx.84.2021.02.04.01.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 01:02:33 -0800 (PST)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [meta-oe][PATCH] iperf3: fix build with autoconf 2.71
Date: Thu,  4 Feb 2021 09:02:10 +0000
Message-Id: <20210204090210.4677-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1

Add patch that checks for CPP prog, which helps to resolve build
errors:

../git/configure: line 14427: CPP: command not found
| ../git/configure: line 14553: ac_fn_c_try_cpp: command not found
| ../git/configure: line 14553: ac_fn_c_try_cpp: command not found

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 ...0001-configure.ac-check-for-CPP-prog.patch | 31 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.9.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch
new file mode 100644
index 000000000..739fd20fc
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch
@@ -0,0 +1,31 @@
+From cc4499cd4cfcb655fc44c3f3571eee20663dafde Mon Sep 17 00:00:00 2001
+From: Andrey Zhizhikin <andrey.z@gmail.com>
+Date: Wed, 3 Feb 2021 20:44:34 +0000
+Subject: [PATCH] configure.ac: check for CPP prog
+
+Absence of check for CPP_PROG causes following build errors:
+| checking TCP_CONGESTION socket option... ../git/configure: line 14427: CPP: command not found
+| ../git/configure: line 14553: ac_fn_c_try_cpp: command not found
+| ../git/configure: line 14553: ac_fn_c_try_cpp: command not found
+
+Upstream-Status: Pending
+Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 939cf0a..f75b398 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -47,6 +47,7 @@ AC_CANONICAL_HOST
+ # Checks for tools: c compiler, ranlib (used for creating static libraries),
+ # symlinks and libtool
+ AC_PROG_CC
++AC_PROG_CPP
+ AC_PROG_RANLIB
+ AC_PROG_LN_S
+ AC_PROG_LIBTOOL
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
index d969555c2..be75837be 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b7fb682e9941a49f1214dcd7441410d7"
 
 SRC_URI = "git://github.com/esnet/iperf.git \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
+           file://0001-configure.ac-check-for-CPP-prog.patch \
            "
 
 SRCREV = "1f8fb13297f3e3e40169ebcd12e171167e394473"
-- 
2.17.1

