Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.39917.1597042012703492753
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 23:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H9qTSOYr;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id p20so7061974wrf.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 23:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VAPdjjbVnRGa0qiwJGMEpKEj0C1A+2fSeVZFouLh7OQ=;
        b=H9qTSOYrjHYgBPwawfuJvz/+zRBIRS28Bd4LZtVm/xDsu+4kZ3okpMZD3ISOsy2anx
         FfhJ3R8U64lxAt3M/uxOntD0PalRC2lCrI4Qz+HHshch6Vya/hfN2ILLa1QMqvJJj948
         keLF9ScM8Wtc4m/gHxPTDqc/jNaDQWhnme1OY/SwZ0/W9t0D42smXMmJM0+RvG+/GP3H
         UCqshBEpAW5KDI61/2Q8HF5CCC59L5koDE5qkmmEo5grp6nY6ZuOhpANi178Xr1ufOd8
         pQFs4l473L1lpXBKMAk8QtIw7/1i5Tc3w8YQdHKzzMoxHwC1hTk5QatO+05Xdy7Wf3lW
         Dqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VAPdjjbVnRGa0qiwJGMEpKEj0C1A+2fSeVZFouLh7OQ=;
        b=h71z5Y9Dr9bPBiCXgsetYM8+ubOplqQ1ADGnae/NLOZ20fuliFP1OrdpSaXBojKoL3
         b2UGr3Fu3mf331ysOXsGyxRnGCTGUNF+jzZycRQQ3ujWtNdr8xbwRFhDpT8JfhaT6LXN
         oZXZEwLLGGK0xiEDP+pZPhRbdw6xFVD5583S9iRV3Z1IrUb7hwTtlaxgNefWGN2nFD6t
         dV94dD+0t/HervVnRtZPyxJlWoUtvg7KzyRw06EBefVd5Cbb0qgL+x0/OioUhMlXSi1j
         bJ7yVh8vB7C9mA4IV45Lhqe8sxDGdmdst6r8YxNTFLUGHV2hCJAHjslZ5FNQbGm+/mbA
         nPkA==
X-Gm-Message-State: AOAM531o7SyIO5LnC7S5sCGMskOaZCVElH7emd2ssgDIcfjYgP7zuJwd
	rkhL2ntEmhU2fPTnPYuMMuDPunvC
X-Google-Smtp-Source: ABdhPJxrRzOKt8lFis4Rmzd0bSzuAwPQOCEbUnjShOS9maxVwxJgp/WQEKE2dAau357WtlordGiyTw==
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr22804997wru.408.1597042010966;
        Sun, 09 Aug 2020 23:46:50 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain ([5.170.82.145])
        by smtp.gmail.com with ESMTPSA id e16sm19410479wrx.30.2020.08.09.23.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 23:46:50 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 5/5] dlt-daemon: fix build with upstream-proposed patch for MUSL libc
Date: Mon, 10 Aug 2020 08:46:33 +0200
Message-Id: <20200810064633.20079-5-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810064633.20079-1-costamagnagianfranco@yahoo.it>
References: <20200810064633.20079-1-costamagnagianfranco@yahoo.it>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon/241.patch           | 30 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.5.bb           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch
new file mode 100644
index 000000000..7d8f22ec7
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch
@@ -0,0 +1,30 @@
+From b8f9919f000e642fc8970d0a42c1bdadf5a9d720 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Mon, 10 Aug 2020 08:30:34 +0200
+Subject: [PATCH] sd-daemon.c: Fix build with newer glibc and musl libc
+
+Reported by Khem Raj on meta-oe list
+
+TOPDIR/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleabi/dlt-daemon/2.18.5-r0/recipe-sysroot/usr/include/sys/fcntl.h:1:2: error: redirecting incorrect #include <sys/fcntl.h> to <fcntl.h> [-Werror,-W#warnings]
+ ^
+1 error generated.
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
+---
+ systemd/3rdparty/sd-daemon.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/systemd/3rdparty/sd-daemon.c b/systemd/3rdparty/sd-daemon.c
+index 88936d2..de3f985 100644
+--- a/systemd/3rdparty/sd-daemon.c
++++ b/systemd/3rdparty/sd-daemon.c
+@@ -35,7 +35,7 @@
+ #ifdef __BIONIC__
+ #include <linux/fcntl.h>
+ #else
+-#include <sys/fcntl.h>
++#include <fcntl.h>
+ #endif
+ #include <netinet/in.h>
+ #include <stdlib.h>
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index e7a194ac8..3a2b40515 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0002-Don-t-execute-processes-as-a-specific-user.patch \
     file://0004-Modify-systemd-config-directory.patch \
     file://238.patch \
+    file://241.patch \
 "
 SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
 
-- 
2.17.1

