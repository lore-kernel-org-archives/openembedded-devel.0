Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF186E7719F
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:06 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.48441.1736119440686945630
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VTvQ5sAc;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3983426f80so18816056276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119440; x=1736724240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4WxAkp/7HNY2wQaGMiXKyJxyV7tNBGzO2XyRXw4P/M=;
        b=VTvQ5sAcc1o7e7/vrvf8bQ2/gMMJq1h2y94lhDM/2Db5O1WbStezhKilugIsCknG+k
         Amrl/bYA9zUpcP7ZYll5s80EL5lYHGLtjH1z6QYMQJQj31QapZTBnUbaBCVa05Luoief
         EOGnnWLar32xIK7zn4iMBSSgVW3ua8OS3H6nIoR1ncG/sclALeuiN3JLt0ffpuFdypIu
         093AYCTp+B09Nqnd+i0YhPHTKxMF626O/v7ibAUK4VeQNrROpctIe7Ts75Rv9yS6TIDB
         i0mnEjMMmk5vHebhRPrcmQlc9p+8G0IiSjlTD5391VsioVWcvINkdiUbQ72u2LPiTvL9
         0vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119440; x=1736724240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4WxAkp/7HNY2wQaGMiXKyJxyV7tNBGzO2XyRXw4P/M=;
        b=b+erIkMR/5EAyIZ1m2ewBvBfV5CPvM9fKz4mqY+QU42DboRvbfka5RJtGBdgb4uXZQ
         YDozX/sUjj9+kkLKQTaWOCNV1YwarKbfQZJXiJjp4W6+8wTFhZ8bD0eNUV3lI/hJ7uVh
         co7zzWTxczRmlC2GtHFRWHolZU388WFUrQcH/njpIrKVyXvYW39+d+8HWdc4qE8PJajh
         wtX/X6gqXAA6d0WS5KXIyqks31cBM5C7i3mxkfkI+CYh+eitc4M/Ge250ob26S94DuO0
         v9uIcYV1LmhTrc7jTMD7YD0AXnXIBFJDLTyVuuGQ6qyQd++OX7LIe3nQdAWMvaoAwXpj
         ekhg==
X-Gm-Message-State: AOJu0YwzEzQ0XMD7nQmlL7k4AzSnSWG2TlDxf++GA/gu/f2KhR0OqkyX
	EiMKIAlvW5uRFR49rF67rtU3jJHkDe4k8405inax040kS+fxNHnK7YYs+nFR
X-Gm-Gg: ASbGncsX1vNNPiLbD3R5qaaoi8tGPjqBNG69erg9RhBH6oXUzXBDIIEfag9j7p7tDCY
	Ob8tE01UIdjNTPn46UPa9cKOXhhxCDGXDpXxJrPX9wBFKPKAU7fnkdKvye3/Q3QzWCnuVBc6VSj
	IUGy7cBJa/6O83Nk8H4TQo/0eWLS6k45dLEAe24XMM1zEtPjTRhE20a5lLVFDokSykyhkvI9TPk
	TjYlXPZQa+cW3l3gprL80nV/zVhHkqiJxYomhapruK6gQAGRrybVH6ED/HmZ/JGiLu78g==
X-Google-Smtp-Source: AGHT+IHMZI7luNO33vlFdL5ymFFMD/S0miOCLQNpXR0+v3PzK8cfYixfLoca4LchqOsjMobzYeBkVw==
X-Received: by 2002:a25:1887:0:b0:e54:9b01:d66c with SMTP id 3f1490d57ef6-e549b01d8f9mr3206581276.38.1736119439760;
        Sun, 05 Jan 2025 15:23:59 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:23:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 02/24] mariadb: Fix build with clang-20/trunk
Date: Sun,  5 Jan 2025 18:23:35 -0500
Message-ID: <20250105232358.1502946-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114632

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


