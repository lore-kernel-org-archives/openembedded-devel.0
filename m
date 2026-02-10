Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E98EA3F1F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 08:12:13 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15607.1770711127479173111
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Feb 2026 00:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bpjZ+Yqj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770711126; x=1802247126;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NfNZ///fPDZcnG8Dnu39az3O7Iuxa0KSSg78QuFzq1k=;
  b=bpjZ+Yqj0uwR4RHYJxTRNibL9sEMqOnooQL4xZK4tUhT3ne8VMQqOIhV
   WNHGPDgMQXmNre2tYE4jUNYxpkiD1adFOA8mzyWwkXslz/sqU+KTl7SxG
   bWA55f49PoedROZZVjaSXYL9wyY17WXCfff11UJp+YEy39/mpEhSobZE0
   bwVYRRWeLtSQEC+nP3HFy0GvUuxwoX1Hcx3psSZ0VPeMfFy5VglhQbItd
   Ziw0cUmp+file15Zs/6PKM13pidZKRWrghoXQoT1TJEsVZmpngqtGRBtH
   eSnmn2is7hyUOJAG3YXP7DTwhydIBQjk1I/o9d74PbQv+O0rEzCxms+JG
   g==;
X-CSE-ConnectionGUID: RXJ+BCpsQFqgMtfUew/aXw==
X-CSE-MsgGUID: ajs8XkXhSSyzlDqK2WZcVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="228572422"
X-IronPort-AV: E=Sophos;i="6.21,283,1763391600"; 
   d="scan'208";a="228572422"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id B82A342A30C
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 08:12:05 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4FDE11C0029F
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 08:12:05 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B4DCF101A404
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 08:12:02 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH]lmdb: upgrade 0.9.31 -> 0.9.35
Date: Tue, 10 Feb 2026 16:11:57 +0800
Message-ID: <20260210081157.12706-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 08:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124318

Drop CVE-2026-22185.patch as it was merged upstream

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../lmdb/files/CVE-2026-22185.patch           | 31 -------------------
 .../lmdb/{lmdb_0.9.31.bb => lmdb_0.9.35.bb}   |  5 ++-
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
 rename meta-oe/recipes-dbs/lmdb/{lmdb_0.9.31.bb => lmdb_0.9.35.bb} (91%)

diff --git a/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch b/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
deleted file mode 100644
index 6c85b2b8ed..0000000000
--- a/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 94ca20e5aed5d8730e045bb945fa3485b28a7981 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Tue, 6 Jan 2026 20:52:25 +0000
-Subject: [PATCH] ITS#10421 mdb_load: check for malicious input
-
-From: Howard Chu <hyc@openldap.org>
-
-CVE: CVE-2026-22185
-Upstream-Status: Backport [https://github.com/LMDB/lmdb/commit/8e1fda85532a3c74276df38a42d234dcdfa1e40d]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- libraries/liblmdb/mdb_load.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/libraries/liblmdb/mdb_load.c b/libraries/liblmdb/mdb_load.c
-index d2a3cec..7eccf40 100644
---- a/libraries/liblmdb/mdb_load.c
-+++ b/libraries/liblmdb/mdb_load.c
-@@ -208,6 +208,12 @@ badend:
- 
- 	c1 = buf->mv_data;
- 	len = strlen((char *)c1);
-+	if (!len) {
-+		/* This can only happen with an intentionally invalid input
-+		 * with a NUL byte after the leading SPACE
-+		 */
-+		goto badend;
-+	}
- 	l2 = len;
- 
- 	/* Is buffer too short? */
diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.35.bb
similarity index 91%
rename from meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
rename to meta-oe/recipes-dbs/lmdb/lmdb_0.9.35.bb
index 29bfbb81fa..36f2056914 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.35.bb
@@ -8,14 +8,13 @@ HOMEPAGE = "https://symas.com/lightning-memory-mapped-database/"
 LICENSE = "OLDAP-2.8"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
 
-SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https \
+SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https;tag=LMDB_${PV} \
            file://run-ptest \
            file://0001-Makefile-use-libprefix-instead-of-libdir.patch \
            file://0001-make-set-soname-on-liblmdb.patch;patchdir=../.. \
-           file://CVE-2026-22185.patch;striplevel=3 \
            "
 
-SRCREV = "ce201088de95d26fc0da36ba805bf2ddc2ba74ff"
+SRCREV = "69087ced3cb6082f7dcfb4fc2dcaa3b68a7e2e8c"
 
 inherit ptest
 
-- 
2.43.0


