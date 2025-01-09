Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC4EE7719A
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 04:41:36 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.40609.1736397687400347597
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 20:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HLexS09v;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so2489798a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 20:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736397686; x=1737002486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCh6VlNOu58oMCS8++Igc3h+OteK6cCe9thi9Jh6abI=;
        b=HLexS09vuU+1m5kK3wHz8hFUd9tidVAwSVc8BoKoustsKCFeJTNZBeaxiVOe8eehJ/
         9/XoZx4qi977Sp5jBMB538NGuQJoxE2tRLQNinr48d6NP+XCkMRF0WhZiy0pPvLdQ9RO
         7z6qpYeWLzSK5kpQaTuADqgRklxXBRq98z+UvZGs4oJBBK35bVM92/Vy4eckJIFMV4lL
         IY2dkWEcfgRUjmafojEZnVRzHaU2gUDQ4mgQiA5oAuvyVM2Vch+sR5ZDxBONav9DY4At
         6o6QZtmmu5+JYfKNhFlp5z9bQv39IL3EmP24iLyeen7Imkr/7ydyXkaZIU6/39SZU86R
         e2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736397686; x=1737002486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCh6VlNOu58oMCS8++Igc3h+OteK6cCe9thi9Jh6abI=;
        b=eNceBDYDGCSQqBIyO7Xfv6VOFONscM+QQUmxMSm2My6bnhbsusRurCrQs1s8hSjsgs
         cmvNDt5PwIKkACiRmdu/90MV2Slw94VRpdNxbAOKGzTFH3+suntr8JEi2xtX1xjE+ilZ
         w/rr0Yls9GNN0SPYQCFiXAH4VshyuGZo9W1WXWQQJ7G4JNqbDLuSojToz3wZepv3UZZo
         VH9UPT0KQ7ICFsfS0AbNph+UKy5QqlEKDe1X8PxEmIhrEiXFpeOZPAjBYgA28obtTHgP
         yS0Vg0FWbX3YVL6qgWkE+FCFpwmSBndsV3d5RK4J7v8wtWqmCRNv+25QgKmYH4FXwqEm
         uMww==
X-Gm-Message-State: AOJu0Yw4lI6GxfI9umepU48Q6cQ570WIU13GKw2fCOwQpa3Sg7jGd4SE
	04SOPZ2g258shmHQoQ7iu9oizpK2nT6EVJOg6w/9d+0O8DstLBctal+biw==
X-Gm-Gg: ASbGncvwK9uhFc/3ogJRyfIrybZ23AJ6R7+HSQt/gG/ylRyaeoji+tTKbK33OHLW9tR
	6ycZpsrGCZvPnqKdG12t32LQaBtXCRtj6ar3bhg6A6ZfzSBWmUsX21MjJYvzNe7d5lI8PO4d8/X
	hP+sZW2Rihw18WYEaoKhV5ZDUOZwT/83pF9xUKR1JaQHwEhBBMi/rXqjd2qlUULzz4EJz9w+yq8
	LPi7Xvx74j7Zmz3nfFLqxlJZYsseSF4DWMy263Im02ngFE=
X-Google-Smtp-Source: AGHT+IEKr+XnEsFAE4QzeuAY/bEqceqUv7a/rkEE6RduOircY4VzZ9diW6OGKWi4DuE+oZ8PBeNhVQ==
X-Received: by 2002:a05:6a00:928f:b0:72a:b292:1e96 with SMTP id d2e1a72fcca58-72d303ad898mr2731285b3a.12.1736397686415;
        Wed, 08 Jan 2025 20:41:26 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::e3f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad81622dsm36106342b3a.30.2025.01.08.20.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:41:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mariadb: Upgrade to 10.11.10
Date: Wed,  8 Jan 2025 20:41:23 -0800
Message-ID: <20250109044123.2467102-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109044123.2467102-1-raj.khem@gmail.com>
References: <20250109044123.2467102-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 04:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114747

Drop 0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch its
already in this version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._10.11.9.bb => mariadb-native_10.11.10.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +--
 ...ction-as-deleter-prototype-in-unique.patch | 26 -------------------
 ...mariadb_10.11.9.bb => mariadb_10.11.10.bb} |  0
 4 files changed, 1 insertion(+), 28 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.9.bb => mariadb-native_10.11.10.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.9.bb => mariadb_10.11.10.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.10.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.10.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index d3192cc59c..99d965717f 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,11 +23,10 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
-           file://0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch \
            file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
-SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
+SRC_URI[sha256sum] = "b06a74650b83a16aa9ab098984482b028e75b000674b11ff288772c619a6f022"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch
deleted file mode 100644
index 416b17ba23..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 713c21880e25108bf0703433432acca58377cc7b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 27 Sep 2024 11:55:53 -0700
-Subject: [PATCH] Use a lambda function as deleter prototype in unique_ptr
-
-Fixes build with clang/libc++ 20+
-
-Upstream-Status: Submitted [https://jira.mariadb.org/browse/MDEV-35040]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- extra/mariabackup/backup_copy.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/extra/mariabackup/backup_copy.cc b/extra/mariabackup/backup_copy.cc
-index a328f5e0ec7..2ab04b78bce 100644
---- a/extra/mariabackup/backup_copy.cc
-+++ b/extra/mariabackup/backup_copy.cc
-@@ -1641,7 +1641,7 @@ is_aria_log_dir_file(const datadir_node_t &node)
- bool
- copy_back_aria_logs(const char *dstdir)
- {
--  std::unique_ptr<ds_ctxt_t, void (&)(ds_ctxt_t*)>
-+  std::unique_ptr<ds_ctxt_t, std::function<void(ds_ctxt_t*)>>
-     ds_ctxt_aria_log_dir_path(ds_create(dstdir, DS_TYPE_LOCAL), ds_destroy);
- 
-   datadir_node_t node;
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.10.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.10.bb

