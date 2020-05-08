Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.2282.1588966477601874590
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 12:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F743dyfc;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id f6so1317422pgm.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KPnmO9apvGTBmXQktI2iLgC1ZxcEsU9EdJNcrYwqxBc=;
        b=F743dyfcvlglJY8T1BqYQU7ZvSkGDMWoFj1Hv89onV+GSVOiBl7m4sPCQNPRk3jVDR
         oP6iKj7iKDWzN5tblHCx+NPQtUjNQ56mrX3r/xp3JJ9D7edPy5CwKlexckD2nRE8W26l
         wBnX2/uiwTTi5LO1lg8E5XvSEGinNVn/6ilYcMkWekbYEBefmkkp3iq1YPAnunDbIPG3
         ucpBbryiyrL0mDlfp8aGuSoA8lRkkceK8MVyn6cCdXu2J55bLaJuL1h/YYx8qHMRsqpi
         qjR0u1RSbCimuYp7010icj5EIYNRnU6aBLiVn4MnQgiIHKi8QN792Lg47gzWHaPbvHpr
         XYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KPnmO9apvGTBmXQktI2iLgC1ZxcEsU9EdJNcrYwqxBc=;
        b=MPK/qkURu3TX5bc5ZOBP7aQHXHmp0T92HmH/RS99BjVxZjgYxI89p35vlT2LL3DPaP
         S+ufrs3/oeJ0YRIP5RQkeQJAWghFuXc1mr2UiRzs9dqhOR+zjT311EUiQ9myX1VaFTOf
         oOT3/AJzsU08ZFFlwLlftqyyKUPY9mMNA8TDLNZ3BdBRCoXmqWlEx+UbEMm9FhWi2OZM
         bdxQn+T8fH2VN9qVnFZGAf1qp6tPCqnOfNxMPN5fc4h0RjyUJcCT9SmKyEieDaS9HGi3
         5Jn4orOdgo+ZIe32q6rh3z29/gYgfxR+PDAGVaMEOIRvKH8sQdWM25hy0qnHbvo/IQjG
         qnoA==
X-Gm-Message-State: AGi0PubWs1AyeKtIisjG2C02xH9ohLKVhYhCWNvMLU4iDVjwBzO1Biqv
	Ex8uMS0whHMXvXOnZ0HyO4Ds+9hZlGc=
X-Google-Smtp-Source: APiQypJ1VffpRXJneP0knE2+XY9Itgr3HVlV9eiXsDSJOl9sZ5tbDJC/zNvkAiZtKrR0/fNErJQRFg==
X-Received: by 2002:a62:6443:: with SMTP id y64mr4690547pfb.100.1588966476592;
        Fri, 08 May 2020 12:34:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2691])
        by smtp.gmail.com with ESMTPSA id u11sm2650819pfc.208.2020.05.08.12.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 12:34:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH 2/2] rasdaemon: Include limits.h
Date: Fri,  8 May 2020 12:34:33 -0700
Message-Id: <20200508193433.3952554-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200508193433.3952554-1-raj.khem@gmail.com>
References: <20200508193433.3952554-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a build problem found with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../0001-Fix-system-header-includes.patch     | 44 +++++++++++++++++++
 .../rasdaemon/rasdaemon_0.6.5.bb              |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch

diff --git a/meta-oe/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch b/meta-oe/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch
new file mode 100644
index 0000000000..0164321312
--- /dev/null
+++ b/meta-oe/recipes-support/rasdaemon/files/0001-Fix-system-header-includes.patch
@@ -0,0 +1,44 @@
+From 18786db1ad03716267927d983c83275469a1478a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 May 2020 12:27:19 -0700
+Subject: [PATCH] Fix system header includes
+
+Use poll.h instead of sys/poll.h
+Fixes
+warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
+
+Include limits.h for PATH_MAX
+
+Fixes
+ras-events.c:359:16: error: 'PATH_MAX' undeclared (first use in this function)
+  359 |  char pipe_raw[PATH_MAX];
+      |                ^~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ras-events.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/ras-events.c b/ras-events.c
+index 511c93d..400e740 100644
+--- a/ras-events.c
++++ b/ras-events.c
+@@ -18,13 +18,14 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <limits.h>
++#include <poll.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+-#include <sys/poll.h>
+ #include <signal.h>
+ #include <sys/signalfd.h>
+ #include "libtrace/kbuffer.h"
+-- 
+2.26.2
+
diff --git a/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb b/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
index 33b0d17d65..93f624882d 100644
--- a/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
+++ b/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
 
 SRC_URI = "git://git.infradead.org/users/mchehab/rasdaemon.git;branch=master \
+        file://0001-Fix-system-header-includes.patch \
 	file://rasdaemon.service \
 	file://init"
 
-- 
2.26.2

