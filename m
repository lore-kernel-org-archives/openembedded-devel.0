Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.18019.1590941797119746300
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KESdQK7r;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id a4so2301655pfo.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=YIZatb4roa1GDW7bfgvu2sDrAvEjDZIPwllC3UTSPKU=;
        b=KESdQK7rAEBFpSTpTFvoeaAvd1daICB2uGbJ2iyVnlOYcJ3a/dEImoGJMqzkzLqodB
         34msbaalLuvg2+cTL6+s38n+QLITs+4vgzO+f27JMPeEbpbPC2ulX0x05vfL68c+U1NM
         8EEOUl5AJIW2PsRs9p1l89ASFoQIVSLmNYNGC43pQN2nXh7lgLNs8ouGr2xrIuOlfo8L
         8vGW2bSfoc27Mpr2mgipS6Loo/7hRinax9jfhQjta+aG4mMSuSomKQU3920WIthtAKqk
         95xjaYs+HWNtNH1cgG7yQ7rjXtzSISajRsiKRId7A33TqwfBUqkjC0Y5jSpZhKNReOox
         A/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=YIZatb4roa1GDW7bfgvu2sDrAvEjDZIPwllC3UTSPKU=;
        b=la9FEpiCOib5gmsUO8gplaebsZV2W/OgXGojrxpgZjwennOWrXWUhTglremY2ik4cm
         UeORst0fQb+PoRddgfEbbHOMyu4MlHE9Qk7DuRNw1PaGMF24k0UYRn9MaINFgNIhj8QB
         urv13WzO5KUM3CDRVM7J9NJtYltx1hfYKPe73wIsvoKE7+7TyfqIVjShz3MQEuszShDJ
         dn7UN0kVUbNN2boM665oi5AGOnqXyIwtWav+5lAtueDVvUSe4YWG896ghafIdwucMEvC
         ERT/LTMLQpV/ouYrlITnwtpMbDKseDzV16+n2J9O61NKmBzifUTy3blRax6x19YLu0Jq
         hZwA==
X-Gm-Message-State: AOAM530OpA4reF0ecRkLAOgPtYhN5MTXLxEGWdtlWoO2k1sNbkhkFtL/
	RGoSW/g3eE91yZyMFLl4FJ3GhFf2
X-Google-Smtp-Source: ABdhPJwzrXV2Xc/lu2CQBQKAW4X5FYE97IaRtuC5fsPrUYFqhOr4C2wka4uyhhNxiwJR+bsyOJdKQw==
X-Received: by 2002:a63:77c6:: with SMTP id s189mr15880566pgc.267.1590941795767;
        Sun, 31 May 2020 09:16:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:35 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/35] dstat: Fix runtime error that depend python.
Date: Sun, 31 May 2020 09:15:55 -0700
Message-Id: <6fbfbc4b1239b4b2f492b45103fa7a3f6e4b2f18.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Make dstat to depend python3.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5a825b5ce781aef64f347a6c9a76307406a4f295)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dstat/0001-change-dstat-to-python3.patch  | 89 +++++++++++++++++++
 meta-oe/recipes-support/dstat/dstat_0.7.4.bb  |  4 +-
 2 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch

diff --git a/meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch b/meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch
new file mode 100644
index 0000000000..06a8498f3c
--- /dev/null
+++ b/meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch
@@ -0,0 +1,89 @@
+From ce0528cb48666843fed2ad10ece5ecb0ac0b8cf8 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Fri, 15 May 2020 12:38:49 +0900
+Subject: [PATCH] change dstat to python3.
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ dstat               | 2 +-
+ examples/curstest   | 2 +-
+ examples/devtest.py | 2 +-
+ examples/mmpipe.py  | 2 +-
+ examples/mstat.py   | 2 +-
+ examples/read.py    | 2 +-
+ examples/tdbtest    | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/dstat b/dstat
+index 9359965..f250f06 100755
+--- a/dstat
++++ b/dstat
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ ### This program is free software; you can redistribute it and/or
+ ### modify it under the terms of the GNU General Public License
+diff --git a/examples/curstest b/examples/curstest
+index afc4e70..d720cca 100755
+--- a/examples/curstest
++++ b/examples/curstest
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ import curses, sys
+ 
+ #c = curses.wrapper(s)
+diff --git a/examples/devtest.py b/examples/devtest.py
+index 0e9e969..e53babd 100755
+--- a/examples/devtest.py
++++ b/examples/devtest.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ 
+ import sys
+ sys.path.insert(0, '/usr/share/dstat/')
+diff --git a/examples/mmpipe.py b/examples/mmpipe.py
+index 5c93567..f91515f 100755
+--- a/examples/mmpipe.py
++++ b/examples/mmpipe.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ import select, sys, os
+ 
+ def readpipe(file, tmout = 0.001):
+diff --git a/examples/mstat.py b/examples/mstat.py
+index abf4d07..ac157e4 100755
+--- a/examples/mstat.py
++++ b/examples/mstat.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ 
+ ### Example2: simple sub-second monitor (ministat)
+ 
+diff --git a/examples/read.py b/examples/read.py
+index 556b7ae..a925109 100755
+--- a/examples/read.py
++++ b/examples/read.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ 
+ ### Example 1: Direct accessing stats
+ ### This is a quick example showing how you can access dstat data
+diff --git a/examples/tdbtest b/examples/tdbtest
+index 528a8ea..ae7fef9 100755
+--- a/examples/tdbtest
++++ b/examples/tdbtest
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ import sys, tdb
+ 
+ db = tdb.tdb('/var/cache/samba/connections.tdb')
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
index 2e37dd72eb..74af54ca53 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS += "asciidoc-native xmlto-native"
 
-SRC_URI = "git://github.com/dagwieers/dstat.git"
+SRC_URI = "git://github.com/dagwieers/dstat.git \
+           file://0001-change-dstat-to-python3.patch \
+          "
 
 SRCREV = "6f5db0aed26bf8cf2700d4ffe90a9bd3436ac728"
 
-- 
2.17.1

