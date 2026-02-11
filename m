Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11194EA3F27
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 09:04:36 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15415.1770800668131601363
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 01:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=V9uVef5B;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82458495219so2075602b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 01:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1770800667; x=1771405467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Df0SBefyETHjHsoAiGPEtxV4sG99ga0+qP8df5oHJV4=;
        b=V9uVef5Bxlz1dGv8ez5WpWtiJo7RdV7gj4r+O7+wgEjqk900Vfr6WfTR2deCxf0AiL
         tpDg7KYFFDEtlpXN6mvD4bLfBgK1SHN6hZpfKnZnqb6+yjp4JLT1qBTgIh0qWyLgaDkr
         8tK4+BNZ1b7Y85gVSHi+gbyya4v2KFnR9XDI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770800667; x=1771405467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df0SBefyETHjHsoAiGPEtxV4sG99ga0+qP8df5oHJV4=;
        b=sYgI3jngpthmdFrziVsxNZ9ogA0ysfbVwO9NTMuZLoszkXQsdU6+htEq6t1Rf3zlkR
         u+SDYijR4ZfdUC5JoA3X8XOrp2PrNucrpn2P6pXnmht+GOXGdc255KXsThaPJ4PT1CRA
         a0b5N8YKl8hImTkQnivgC4icu7CCow5QeDAGgxElpEZPzhx+CbwMsl00M083ya465bkK
         BzgOn3ZhSYnhvIOhG0RGL74cRlwixOHD0MSUO8dESiZJqxUPro54vwnbqXpvXj2lCotS
         4ovBPLu9HC5ig+PmTtT8AmOvERfilBf6OFGOJaDA8KO+T3N6rwPGFU1m3RG3HtrxP64o
         Veew==
X-Gm-Message-State: AOJu0YxdMTqsRue2UVdl9wFOsbK9cjBIroWmoCNSkr0MP8YI/6OIlmmB
	4cg5tpgOfZ6m0iLnt0zb3E0V2TXcTIKwbIC/G6DBRIzo810w4h9+1HxVN5COrYApX3ulBHH3PQx
	HIsinCdo=
X-Gm-Gg: AZuq6aJasL8DAR2yp/IkzC86aI7Pc+y8aKUjlgAMSyFZb6cwkAK1WZyFyoV5I3Dkthr
	BNlb+CrUEpF3JHveDIU6beoyN903MFl9kgxYET4lpoDGtIlXG/VsKjaYX2w5RG/RCwB9yY9+OyJ
	s+J1Fc0cPEdbsBy5DGu91tNTeBe5mz4PJe1TN15YNHKmocOFuNSh/xg8hUF/N6Ohlfjik149Tm9
	sDOR2ui3FOoDeX9SZP/DI1aX4PnSxHX4wgUb7W3bLaErWnfK+4K97hLjjy+01JlO9zvBp7zwBLf
	p8Di2eBdZBqTq9zFRaJiwaGXOpIrJCCMdd0OXt0vWBhN+B+0l79WE4ksGyZLNSN+vcbF7LIxWbc
	4Tqx9gjKQUBvXJ6lujXiVChh0QmbDFxK8ig9ITUZ42QZkDMwtyQOpN9E5cIV5uw9L4HS/qFgD6j
	MjiwykyhA2ejRkkXxRF72ne/+PkNfKPy7hupf4t0/cBk5q+40=
X-Received: by 2002:a05:6a20:7488:b0:366:14ac:e208 with SMTP id adf61e73a8af0-394324969e3mr1478261637.70.1770800666990;
        Wed, 11 Feb 2026 01:04:26 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:54:f9ef:7321:e504:9c18:1623])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e196a8597sm2230956a12.12.2026.02.11.01.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:04:26 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] mariadb: Fix CVE-2025-30693
Date: Wed, 11 Feb 2026 14:34:16 +0530
Message-Id: <20260211090416.306644-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124328

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/MariaDB/server/commit/1c9f64e54ffb109bb6cf6a189e863bfa54e46510

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   1 +
 .../mysql/mariadb/CVE-2025-30693.patch        | 156 ++++++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30693.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 048e43d962..d15b19725a 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -35,6 +35,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://CVE-2024-21096-0005.patch \
 	   file://CVE-2025-21490.patch \
 	   file://CVE-2025-30722.patch \
+	   file://CVE-2025-30693.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30693.patch b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30693.patch
new file mode 100644
index 0000000000..c97c7366bc
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30693.patch
@@ -0,0 +1,156 @@
+From 1c9f64e54ffb109bb6cf6a189e863bfa54e46510 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@mariadb.com>
+Date: Wed, 16 Apr 2025 15:55:45 +0300
+Subject: [PATCH] MDEV-36613 Incorrect undo logging for indexes on virtual
+ columns
+
+Starting with mysql/mysql-server@02f8eaa9988dadb73dd68630dd82393cfa19bfb8
+and commit 2e814d4702d71a04388386a9f591d14a35980bfe the index ID of
+indexes on virtual columns was being encoded insufficiently in
+InnoDB undo log records.  Only the least significant 32 bits were
+being written.  This could lead to some corruption of the affected
+indexes on ROLLBACK, as well as to missed chances to remove some
+history from such indexes when purging the history of committed
+transactions that included DELETE or an UPDATE in the indexes.
+
+dict_hdr_create(): In debug instrumented builds, initialize the
+DICT_HDR_INDEX_ID close to the 32-bit barrier, instead of initializing
+it to DICT_HDR_FIRST_ID (10).  This will allow the changed code to
+be exercised while running ./mtr --suite=gcol,vcol.
+
+trx_undo_log_v_idx(): Encode large index->id in a similar way as
+mysql/mysql-server@e00328b4d068c7485ac2ffe27207ed1f462c718d
+but using a different implementation.
+
+trx_undo_read_v_idx_low(): Decode large index->id in a similar way
+as mach_u64_read_much_compressed().
+
+Reviewed by: Debarun Banerjee
+
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/1c9f64e54ffb109bb6cf6a189e863bfa54e46510]
+CVE: CVE-2025-30693
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../suite/gcol/r/innodb_virtual_basic.result  |  2 +
+ .../suite/gcol/t/innodb_virtual_basic.test    | 37 ++++++++++++++++++-
+ storage/innobase/trx/trx0rec.cc               | 26 ++++++++++---
+ 3 files changed, 58 insertions(+), 7 deletions(-)
+
+diff --git a/mysql-test/suite/gcol/r/innodb_virtual_basic.result b/mysql-test/suite/gcol/r/innodb_virtual_basic.result
+index 3823887186b06..35534d68e632a 100644
+--- a/mysql-test/suite/gcol/r/innodb_virtual_basic.result
++++ b/mysql-test/suite/gcol/r/innodb_virtual_basic.result
+@@ -86,6 +86,8 @@ delete from t where a =13;
+ DROP INDEX idx1 ON t;
+ DROP INDEX idx2 ON t;
+ DROP TABLE t;
++# restart
++set default_storage_engine=innodb;
+ /* Test large BLOB data */
+ CREATE TABLE `t` (
+ `a` BLOB,
+diff --git a/mysql-test/suite/gcol/t/innodb_virtual_basic.test b/mysql-test/suite/gcol/t/innodb_virtual_basic.test
+index b64daa2bcdb63..69f9f89ccee7f 100644
+--- a/mysql-test/suite/gcol/t/innodb_virtual_basic.test
++++ b/mysql-test/suite/gcol/t/innodb_virtual_basic.test
+@@ -1,6 +1,6 @@
+ --source include/have_innodb.inc
+ --source include/have_partition.inc
+---source include/big_test.inc
++--source include/not_embedded.inc
+ 
+ call mtr.add_suppression("\\[Warning\\] InnoDB: Compute virtual");
+ 
+@@ -66,6 +66,41 @@ DROP INDEX idx1 ON t;
+ DROP INDEX idx2 ON t;
+ DROP TABLE t;
+ 
++let MYSQLD_DATADIR=`select @@datadir`;
++let PAGE_SIZE=`select @@innodb_page_size`;
++--source include/shutdown_mysqld.inc
++perl;
++do "$ENV{MTR_SUITE_DIR}/../innodb/include/crc32.pl";
++my $file = "$ENV{MYSQLD_DATADIR}/ibdata1";
++open(FILE, "+<$file") || die "Unable to open $file";
++binmode FILE;
++my $ps= $ENV{PAGE_SIZE};
++my $page;
++die "Unable to read $file" unless sysread(FILE, $page, $ps) == $ps;
++my $full_crc32 = unpack("N",substr($page,54,4)) & 0x10; # FIL_SPACE_FLAGS
++sysseek(FILE, 7*$ps, 0) || die "Unable to seek $file\n";
++die "Unable to read $file" unless sysread(FILE, $page, $ps) == $ps;
++substr($page,54,4)=pack("N",0xc001cafe); # 32 MSB of 64-bit DICT_HDR_INDEX_ID
++my $polynomial = 0x82f63b78; # CRC-32C
++if ($full_crc32)
++{
++    my $ck = mycrc32(substr($page, 0, $ps-4), 0, $polynomial);
++    substr($page, $ps-4, 4) = pack("N", $ck);
++}
++else
++{
++    my $ck= pack("N",mycrc32(substr($page, 4, 22), 0, $polynomial) ^
++		 mycrc32(substr($page, 38, $ps - 38 - 8), 0, $polynomial));
++    substr($page,0,4)=$ck;
++    substr($page,$ps-8,4)=$ck;
++}
++sysseek(FILE, 7*$ps, 0) || die "Unable to rewind $file\n";
++syswrite(FILE, $page, $ps)==$ps || die "Unable to write $file\n";
++close(FILE) || die "Unable to close $file";
++EOF
++--source include/start_mysqld.inc
++set default_storage_engine=innodb;
++
+ /* Test large BLOB data */
+ CREATE TABLE `t` (
+   `a` BLOB,
+diff --git a/storage/innobase/trx/trx0rec.cc b/storage/innobase/trx/trx0rec.cc
+index 33a3962047fa7..d815f180abafa 100644
+--- a/storage/innobase/trx/trx0rec.cc
++++ b/storage/innobase/trx/trx0rec.cc
+@@ -148,7 +148,9 @@ trx_undo_log_v_idx(
+ 	ulint n_idx = 0;
+ 	for (const auto& v_index : vcol->v_indexes) {
+ 		n_idx++;
+-		/* FIXME: index->id is 64 bits! */
++		if (uint32_t hi= uint32_t(v_index.index->id >> 32)) {
++			size += 1 + mach_get_compressed_size(hi);
++		}
+ 		size += mach_get_compressed_size(uint32_t(v_index.index->id));
+ 		size += mach_get_compressed_size(v_index.nth_field);
+ 	}
+@@ -175,10 +177,14 @@ trx_undo_log_v_idx(
+ 	ptr += mach_write_compressed(ptr, n_idx);
+ 
+ 	for (const auto& v_index : vcol->v_indexes) {
+-		ptr += mach_write_compressed(
+-			/* FIXME: index->id is 64 bits! */
+-			ptr, uint32_t(v_index.index->id));
+-
++		/* This is compatible with
++		ptr += mach_u64_write_much_compressed(ptr, v_index.index-id)
++		(the added "if" statement is fixing an old regression). */
++		if (uint32_t hi= uint32_t(v_index.index->id >> 32)) {
++			*ptr++ = 0xff;
++			ptr += mach_write_compressed(ptr, hi);
++		}
++		ptr += mach_write_compressed(ptr, uint32_t(v_index.index->id));
+ 		ptr += mach_write_compressed(ptr, v_index.nth_field);
+ 	}
+ 
+@@ -217,7 +223,15 @@ trx_undo_read_v_idx_low(
+ 	dict_index_t*	clust_index = dict_table_get_first_index(table);
+ 
+ 	for (ulint i = 0; i < num_idx; i++) {
+-		index_id_t	id = mach_read_next_compressed(&ptr);
++		index_id_t	id = 0;
++		/* This is like mach_u64_read_much_compressed(),
++		but advancing ptr to the next field. */
++		if (*ptr == 0xff) {
++			ptr++;
++			id = mach_read_next_compressed(&ptr);
++			id <<= 32;
++		}
++		id |= mach_read_next_compressed(&ptr);
+ 		ulint		pos = mach_read_next_compressed(&ptr);
+ 		dict_index_t*	index = dict_table_get_next_index(clust_index);
+ 
-- 
2.25.1


