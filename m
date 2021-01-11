Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.1658.1610408270338392120
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 15:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LszfoWPz;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id b5so510552pjk.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Jan 2021 15:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2HfsuvB24UEfL9TSeYClMMBbxZ+gTGazbtKeiKV1yTU=;
        b=LszfoWPzNaXfG3+OEOuw7ZXFY9flQZittSS52nFWMtb+p/ghEQpZIIJgw5cXV962hX
         WUSq0/DUjSYeqVq9i9Ij5cnG1DW/tCP+kJLctadmeTPO1qLh3l0KjQIb1nFlWA4CCAto
         ML2J3L1obxZuxDBTfuUkEa8dVrl6qw1oRmIb9XCeSc891IuPOS6C0q2R3o3lfE6HFjpY
         bcDa7H2c/qbbRsSAVTzphWYzO7scvgklFbiZT4IJX3h4Mn6SMl41rt2gk+7g43xyIl2R
         bqD7BxWwdqc/pDQwvh1b3GqllryOHO0zrybyuO7jj4gAuEBUu5jooSFs2Q2O4HdWzOXJ
         sjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2HfsuvB24UEfL9TSeYClMMBbxZ+gTGazbtKeiKV1yTU=;
        b=O/xyQhcoiDv6PlXvytUWjVUOJWQ+ZvcAnfBI/81Vz7XpuSf4oQmJYoxTe4xbjIFnMB
         p8TNgo/LZj54hmHdwL7WgdN+UvZoTE57yG0W7QVqSGdFBSWJdnycAn9p8RsAogjG0cJ8
         cOvkjVLNm6UifVMEYQi3mfi4oM7LQwg0JZhYd4aid9oCAxKUxd4OJWJ0pStHF/4Sen3Q
         E5Y9Q0DYI1/WRred7/VyX3X61N8RWoF3jeNQMK748/r9KcUPMwuXVLJ384aDMr8uK2jz
         JtnVALzoa9MRanlaMKZ5V2QwyS0sIwaw9xHsafP+WmmzfcaXM3ZHHq07T93bSuR3oZBb
         Xb9g==
X-Gm-Message-State: AOAM531o4Rn//Ms80GIFeddCScfhcYTGU8zUaTTzF0ACGsYxaMm/mH78
	czGeHZ2/1AuGvNpTnktCRTw8Mt+sXQNIeg==
X-Google-Smtp-Source: ABdhPJzctGyg59aEkynVr/wpOFJ2X49lnQ++TgZvYqaWv6rZFOFCqsIqfqDdOgrqxS7AuVrfr5wT2g==
X-Received: by 2002:a17:90a:d148:: with SMTP id t8mr1331332pjw.126.1610408269432;
        Mon, 11 Jan 2021 15:37:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::248c])
        by smtp.gmail.com with ESMTPSA id e21sm842808pgv.74.2021.01.11.15.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 15:37:48 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-oe][PATCH] influxdb: Fix build on mips
Date: Mon, 11 Jan 2021 15:37:46 -0800
Message-Id: <20210111233746.3892853-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
---
 ...e-for-mips-ispeed-ospeed-termios-abs.patch | 20 +++++++++++++++++++
 .../recipes-dbs/influxdb/influxdb_1.7.10.bb   |  2 ++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
new file mode 100644
index 0000000000..3cb2090d19
--- /dev/null
+++ b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
@@ -0,0 +1,20 @@
+From f3713628fac72e45223013dcf8e37ac65d17d886 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 11 Jan 2021 15:16:57 -0800
+Subject: [PATCH] patch term module for mips ispeed/ospeed termios absense
+
+Upstream-Status: OE-Specific [needed on mips]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ go.mod | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/go.mod
++++ b/go.mod
+@@ -54,3 +54,5 @@ require (
+ 	gonum.org/v1/gonum v0.6.0 // indirect
+ 	google.golang.org/grpc v1.26.0
+ )
++
++replace github.com/pkg/term => github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb
index 4f2bb78b23..06f7947642 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb
@@ -22,6 +22,8 @@ SRC_URI = "\
     file://influxdb.conf \
 "
 
+SRC_URI_append_mipsarch = " file://0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch;patchdir=src/${GO_IMPORT}"
+
 SRCREV = "c958f436b2e538a88a7815aad721c7774a0b8f63"
 
 inherit go-mod systemd update-rc.d useradd
-- 
2.30.0

