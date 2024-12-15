Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23FAE7717F
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 18:36:23 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.40711.1734287778141483087
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Dec 2024 10:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GWf8Z/Z+;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6eff5f99de4so37089547b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 10:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734287777; x=1734892577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4WxAkp/7HNY2wQaGMiXKyJxyV7tNBGzO2XyRXw4P/M=;
        b=GWf8Z/Z+l1XGhyci16MpPk2Njp6+yNLWFV7jBRNRg166bq+NWa116+2iaiN0p+0ztq
         jPSfVftjLLQ1wrc6uBLK+CLjubGLqDqSuRJtdY+lO4T/SLyjlpZfP7NEBWKEkOFGl2Jz
         rEgPnezwacfoWf6BnCUuiWn5RI9xbYR20qX8C7Kg7Lp1zb7Qm5HfrNRgEdRTZlniXvcr
         CbPWUzH+UAMosZe+dssBsp0vdn9BMSD2uboo4oa7utQL9ThOoAiRAt8XWi+HmkOJeJWO
         kxaj/kM8OCpipdfkxmFKUyF31j0WEDNI66CZvs2EzpChJWKV6aUSdkZV8upnSvc91vpo
         vL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734287777; x=1734892577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4WxAkp/7HNY2wQaGMiXKyJxyV7tNBGzO2XyRXw4P/M=;
        b=lYbbYJJpgLDyyk75XlRmRqZHlGeg8RFPhtLKFZPQs+iCex2cv5NVH8zGXkxe1kOINr
         jUgV1bWGyD2lQ9cTUc1PhrurcQBcANQ9W9iO93YBlQJYNzTc8V2/HGGy758rVHJnqEQU
         fDXqRbile3VbBQfq2Xm9i0CJgp11U4ex38SYq0KJqBDp9dmuSnl/l62nfwXdoo7OGZoH
         AduWMXEkZYiebn08a1oH7QicjW/eK53gzuDmwkgqCK9aYItsCLMdUYK5VBBsR5kiUovb
         aDNa2kB5dLx4ANHOpFYodu0+TWVLIaeUg95QhkKZYMgP2dFIHGu/aTcWuEkz5qCIhsnF
         tRZQ==
X-Gm-Message-State: AOJu0Yx8+1zeUhlORf04nxXVdoeYmw4TJiEs2qsT6kUFincPSBftMM2o
	MZ9YugTdlcqSZ0C4+l82bPQOMjDij1pBDRH0qE35V+PCZ2XhGXtpLaOMnUq7
X-Gm-Gg: ASbGnct8ZxP/kt4ZISZySYSEgTqW4IZIbbgE6QCiUIWALOWHdXw1SAAz0n/B20nYY9W
	/ldRWi12bLUt7Ubpq7mxsTfEXeUFjhx1l5iYwHbm231SZtqkP1NCqYSf6Q2RMoQtH4JpPFAMpcy
	RrGfiQvxbhOKj1U0gBYWGMPxhGoksQyCWkuk0MrlZM6/N52n3adPcGZoG+xYeWEV+ozQaAqPldY
	G9ZXl9jnJgiXFdtUpnx/PN2iQX0paY5H2gZQg42L8+8uIMXd63gCq9yJf5BXjVQrTtrUw==
X-Google-Smtp-Source: AGHT+IFESlAmJNmEIHvqxTwPB82FkzvskLs/u3XrHyKkGg0ssx2R+g9cUbWg6gGGyH+mx6ksC/d75A==
X-Received: by 2002:a05:6902:10c4:b0:e47:dcde:6415 with SMTP id 3f1490d57ef6-e47dcde6757mr3427128276.27.1734287777223;
        Sun, 15 Dec 2024 10:36:17 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:a906:ba5:bc1d:da36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e47035366easm985356276.18.2024.12.15.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 10:36:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 1/5] mariadb: Fix build with clang-20/trunk
Date: Sun, 15 Dec 2024 13:36:12 -0500
Message-ID: <20241215183616.7218-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 18:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114317

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5de95a5b7af6da3784498398181d156b948f049f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
-- 
2.43.0


