Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.13396.1630869675928630565
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 12:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IwF3oraX;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d18so1532164pll.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Sep 2021 12:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5WiD1W+mx2ZyXYFQ6vbQ4uLm8bv06ZYkxR9tMDJWCFg=;
        b=IwF3oraXZ8JQRzm8VK97Ff6+M6tolfmSgAqrV48Cafzs/TPY76TXDjKBdwhcBN42wh
         sT84GZUR4UhwZf+ACKpYNgI47FigZwxBf8EpecskehzNOYtAbQPJfNx294eOiJ24nJ5w
         NgtBvk91Ek68lPr8377XAV1xiw+4CcuRtfv01dZqmDVkp9guGYl4ZpVfSIgqB5hTAL0U
         tVgE2mOSZNMnVrRC7hD411lpq9II32JVlrL+c4zjl2hYzkI53AyLSQKMrLmnh1HlmDQR
         VzGxZpv7HoMyp13oL2G51el/Z8QGfZjtq3GIpJscWYH9+l22zsPSB0vJc89tvL5vydUI
         vEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5WiD1W+mx2ZyXYFQ6vbQ4uLm8bv06ZYkxR9tMDJWCFg=;
        b=TcxneBgCfAT+kjkbaqsLhotka1GsAkJ2kML9CWmAM8t7xmx8lEF2LSh4tbZ/2CYP8w
         zEGNhsR6XE3iNAtRQBef05iy4jO7abipPb73XIp8Hqr/K605eahjiLjhP53uYeMYmDbL
         D87RzmqU1+dV4IZutX1jEUkLkJ9jh+cXMkHvz7/hFur+OPNkqHh2oHbb0MMzZdESkJvF
         iQIqmekvAGjiMHWKKHBXLweo/j9ztbYO5PcSK20aqMyiOE/6nHzXkqk7TAaboWJiKgX7
         QP/dEXtJN+XThGPBmU8Jx7lLv8VMisEofqJbANo+qPHTzSWxik2178ww00FVcxoSMMzr
         mGNA==
X-Gm-Message-State: AOAM532oSOQYROJwcI/Z+4CRpUCNYjS3SmMWk9DtDHcQ5ZlSwQS9CaHE
	VQ/kO0tOKJDJXxCpHki2aY6UNnB5wGQ=
X-Google-Smtp-Source: ABdhPJz6bBRIfyKk0ijL7PP/m9rZNPt2WrNt6PeLB8npDDj5JycoHuW9s1ZoDHp1Z8f5ayca9zLo2Q==
X-Received: by 2002:a17:90a:f8e:: with SMTP id 14mr10210607pjz.85.1630869675344;
        Sun, 05 Sep 2021 12:21:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:741f:21b:dc9f:801])
        by smtp.gmail.com with ESMTPSA id b17sm6207128pgl.61.2021.09.05.12.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 12:21:15 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>,
	Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>
Subject: [PATCH 3/8] dlt-daemon: fix build with upstream-proposed patch for MUSL libc
Date: Sun,  5 Sep 2021 12:21:06 -0700
Message-Id: <20210905192112.2081037-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210905192112.2081037-1-akuster808@gmail.com>
References: <20210905192112.2081037-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a7c9aa13dd94712ea49f535fbbf38d2db54cf7e2)
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dlt-daemon/dlt-daemon/241.patch           | 30 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.5.bb           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch
new file mode 100644
index 0000000000..7d8f22ec78
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
index 8673c59fea..af8d9fddd7 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0004-Modify-systemd-config-directory.patch \
     file://275.patch \
     file://238.patch \
+    file://241.patch \
 "
 SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
 
-- 
2.25.1

