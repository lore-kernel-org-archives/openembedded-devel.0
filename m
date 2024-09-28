Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13713CF6493
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 00:28:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.5078.1727483272375694191
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Sep 2024 17:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OEAtMwOM;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20b01da232aso19799435ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 17:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727483271; x=1728088071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFYCXXl6rV20CF0LtGAitWzGx9PGapiKmp8XiRB6MLY=;
        b=OEAtMwOM7rtvzLyXMQWRivIRgLhjlWp2bHf02i1bUloob3nqOBH761Km/5HMalK0s5
         2WJM1LMVFOv2zRwRMFE/kcWE/Bn8sb0AYP8QgwhHsp7W4hbhPY6s7ZGRnA/N+Mjz0J4B
         O4QT9bQDbcVYbkD4WyVScUja+hayJQKduqSWh8PTm1LHxmm2Apd86hSgL1SEMjNvKSvu
         jUj828N8oLuDNsuNxqJhbeM9y6Fe48Dpv06tcm12xJbsTesUAxwDRN31zpWMxXAFeK0M
         AOo94TJ1v7FK03W/JnLVY3WvUMWSTOeQTUKnbO3cSD1OibswEOY2EaamMmqRRuPsCCLi
         5puA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727483271; x=1728088071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFYCXXl6rV20CF0LtGAitWzGx9PGapiKmp8XiRB6MLY=;
        b=aG28m+EHsbCU8DIxsqyUTrz/F7My833iCfVlSgQyVNE2yamU+TJLVviXjA1xzBbZEu
         sXKlOOos2oxTt9Oxh7CHO3qRxF/6WGWl/Lt6ecPOEX8QGVzKh7KzTxlhW1T5w5Vs1IOx
         KP4pSfA0YoXYFh+atrI7ZQMpSS2+HLeFk5wcmwVKAUQO66Cn2mBYw2rLgJUhDyOsQDD1
         bz7HJ5DJX/cKqR/B4u8bqoJJ0pmLaoGmwFrJ/XbtIrbc3452IEKQ3Dm2jJbXefTvcYR0
         rz0yHGOw56jM2jz91NN3w/E8vY8Th9CT8JwMDYwXECllQ1YOaayRE8Byxr8Vk7zPPiGy
         8xvQ==
X-Gm-Message-State: AOJu0Yz7iFaS/1f1tFy4qELG+Ak/yNH+P8T9UvXOf178S6pxKmzNesm4
	HlURSLIRDXNtQF2Zs9+17JeQb9DAIR3aXxr+e5Qc3DGte5PdbW6nWhV+KA==
X-Google-Smtp-Source: AGHT+IE533Q+5RdanuXeGmmBlKbmJcypSiQTYkVpTSd7YdMGiuTtdAwvNpHFyiEaTbh/xXglqEiY0Q==
X-Received: by 2002:a17:903:24e:b0:20b:db4:d913 with SMTP id d9443c01a7336-20b365f4b2amr81726985ad.11.1727483271346;
        Fri, 27 Sep 2024 17:27:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::caca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d5ef7fsm18667405ad.22.2024.09.27.17.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 17:27:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Fix build with clang-20/trunk
Date: Fri, 27 Sep 2024 17:27:49 -0700
Message-ID: <20240928002749.3755339-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 00:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112533

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...ction-as-deleter-prototype-in-unique.patch | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index ae6581ec71..39c9f4c9d5 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,6 +23,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
+           file://0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch
new file mode 100644
index 0000000000..416b17ba23
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch
@@ -0,0 +1,26 @@
+From 713c21880e25108bf0703433432acca58377cc7b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 27 Sep 2024 11:55:53 -0700
+Subject: [PATCH] Use a lambda function as deleter prototype in unique_ptr
+
+Fixes build with clang/libc++ 20+
+
+Upstream-Status: Submitted [https://jira.mariadb.org/browse/MDEV-35040]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ extra/mariabackup/backup_copy.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/extra/mariabackup/backup_copy.cc b/extra/mariabackup/backup_copy.cc
+index a328f5e0ec7..2ab04b78bce 100644
+--- a/extra/mariabackup/backup_copy.cc
++++ b/extra/mariabackup/backup_copy.cc
+@@ -1641,7 +1641,7 @@ is_aria_log_dir_file(const datadir_node_t &node)
+ bool
+ copy_back_aria_logs(const char *dstdir)
+ {
+-  std::unique_ptr<ds_ctxt_t, void (&)(ds_ctxt_t*)>
++  std::unique_ptr<ds_ctxt_t, std::function<void(ds_ctxt_t*)>>
+     ds_ctxt_aria_log_dir_path(ds_create(dstdir, DS_TYPE_LOCAL), ds_destroy);
+ 
+   datadir_node_t node;

