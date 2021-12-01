Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B799C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 01:54:44 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.86219.1638323683327769923
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 17:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eqzz+117;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 200so21866184pga.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 17:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0+XtFm4frZ+V5lzrV4kzntM98B44dZtJi3Yc7zTaneg=;
        b=eqzz+117PZ/27vIsaliLW3qCQ/Gv2dOHCb9rlinh5ONrNKp9tlT0+JYiuno+4NWj6G
         j3f7Qn5dkG12BzlQXbqd5jVHmhWFPeNYCbtRwecxm3In/XU1sSmjyJaYWNcMB5b4pgTh
         iGVJjt7Txxq06qVgTXuGZwxVJqDyxJzluvqEEvNQSD27UDwRBXK9Okt9MdUPsObSlANN
         GGuc5pMRv0f3dDLaF4BSMf2KEaRAzKdvr+xDjS1gp4yMzwkZbX1de64016pKI+vtkAwh
         AKS2wHgI4UUk2tSrHJHP/JvpBwt+GWGWhZjYENIdEQNw7sGhgC3o0ShmNfMe4+Yw5N3/
         XvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0+XtFm4frZ+V5lzrV4kzntM98B44dZtJi3Yc7zTaneg=;
        b=T7AnCYH/6OC1gj0rOB5829OM6EFlWR7qKxECaLJ9Sfgy/0+dbrj96iOSpwxgOV/Clb
         TkR0uj1Uk8YPxrAg96lP8gbW5+WklLg8yKXVJc/bgj8rz/3uVs7jtyLjdkv0pY/+dmQt
         2FEHm7H31l24s+7ADa/GnMTaYQMo1iDkBX4vQpeqllFMpbvAV1GnFqGshz4KxD0DHbOS
         G2ELsnUQu2v8T1LTTRgbFygESARA757PGweHFqS+pyTBRr1RD6ib/tqbZ2Xrpc+sMczQ
         uJbvdW0pz0VcbSOXaT4yPnqSzuAvvO5i7AXBni4RrbjzbcAzGAYFF2waLtqr1cauBMQO
         nM2Q==
X-Gm-Message-State: AOAM531rGU67Sv8/lrbnAjVfLPReRO6IXUHTM+51s1vyWvyNPT57HoMs
	YFJmU729Sx92mnQJ9FBn/ZoZEo51UCTCiw==
X-Google-Smtp-Source: 
 ABdhPJwPY0e7Iu2IHML2zu9MTJJCWqIGbmLcnoYn+qygwa0eskU10Eof5dbqKnepwr8NuvbraSq8/Q==
X-Received: by 2002:a05:6a00:99e:b0:49f:f9e2:c116 with SMTP id
 u30-20020a056a00099e00b0049ff9e2c116mr2804208pfg.83.1638323682524;
        Tue, 30 Nov 2021 17:54:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 h2sm23119633pfc.190.2021.11.30.17.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 17:54:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] influxdb: Fix build with Go 1.17 on x86_64
Date: Tue, 30 Nov 2021 17:54:40 -0800
Message-Id: <20211201015440.760589-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Dec 2021 01:54:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94161

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1.2-xxhash-to-fix-build-with-go-1.17.patch | 39 +++++++++++++++++++
 .../recipes-dbs/influxdb/influxdb_1.8.10.bb   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch b/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch
new file mode 100644
index 0000000000..e31c7be1ec
--- /dev/null
+++ b/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch
@@ -0,0 +1,39 @@
+From 4ca405e9763fd0ba747ef00edd30648b66992fbb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 30 Nov 2021 15:14:39 -0800
+Subject: [PATCH] Use v2.1.2 xxhash to fix build with go 1.17
+
+Fixes
+| # github.com/cespare/xxhash
+| asm: xxhash_amd64.s:120: when dynamic linking, R15 is clobbered by a global variable access and is used here: 000
+92 (/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/influxdb/1.8.10-r0/build/pkg/mod/github.com/cespare/xxhash@
+v1.1.0/xxhash_amd64.s:120)        ADDQ    R15, AX
+| asm: assembly failed
+
+Upstream-Status: Backport [https://github.com/cespare/xxhash/commit/e7a6b52374f7e2abfb8abb27249d53a1997b09a7]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ go.mod | 3 ++-
+ go.sum | 2 ++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+--- a/go.mod
++++ b/go.mod
+@@ -55,3 +55,5 @@ require (
+ 	gonum.org/v1/gonum v0.6.0 // indirect
+ 	google.golang.org/grpc v1.26.0
+ )
++
++replace github.com/cespare/xxhash => github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56
+--- a/go.sum
++++ b/go.sum
+@@ -188,6 +188,8 @@ github.com/kr/pretty v0.1.0/go.mod h1:dA
+ github.com/kr/pty v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYio2l3bCsQ=
+ github.com/kr/text v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKSTVE=
+ github.com/kr/text v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVham/4vfdArNI=
++github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56 h1:hCQ0jTkNInQ7PpNeGlSV9s+QMi6nUyyMuz37Bg3TduE=
++github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56/go.mod h1:XrSqR1VqqWfGrhpAt58auRo0WTKS1nRRg3ghfAqPWnc=
+ github.com/lib/pq v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9A=
+ github.com/lib/pq v1.0.0/go.mod h1:5WUZQaWbwv1U+lTReE5YruASi9Al49XbQIvNi/34Woo=
+ github.com/mattn/go-colorable v0.0.9 h1:UVL0vNpWh04HeJXV0KLcaT7r06gOH2l4OW6ddYRUIY4=
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 55c2c41eef..4736839c69 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -18,6 +18,7 @@ GO_INSTALL = "\
 
 SRC_URI = "\
     git://${GO_IMPORT};protocol=https;branch=1.8;destsuffix=${BPN}-${PV}/src/${GO_IMPORT} \
+    file://0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch;patchdir=src/${GO_IMPORT} \
     file://influxdb \
     file://influxdb.conf \
 "
-- 
2.34.1


