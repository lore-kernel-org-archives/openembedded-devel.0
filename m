Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD1361B3B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2020 03:29:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,550,1574092800"; d="scan'208";a="86307975"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Mar 2020 11:29:57 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2F22D406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2020 11:19:55 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sat, 14 Mar 2020 11:29:55 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sat, 14 Mar 2020 11:29:58 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 14 Mar 2020 02:15:18 -0700
Message-ID: <1584177319-73191-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2F22D406AB15.A3AE7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] postgresql: 12.1 -> 12.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Mar 2020 03:30:01 -0000
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql_12.1.bb | 12 ------------
 meta-oe/recipes-dbs/postgresql/postgresql_12.2.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_12.1.bb
 create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_12.2.bb

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.1.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.1.bb
deleted file mode 100644
index 486851941..000000000
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require postgresql.inc
-
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=87da2b84884860b71f5f24ab37e7da78"
-
-SRC_URI += "\
-   file://not-check-libperl.patch \
-   file://0001-Add-support-for-RISC-V.patch \
-   file://0001-Improve-reproducibility.patch \
-"
-
-SRC_URI[md5sum] = "2ee1bd4ec5f49363a3f456f07e599b41"
-SRC_URI[sha256sum] = "a09bf3abbaf6763980d0f8acbb943b7629a8b20073de18d867aecdb7988483ed"
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.2.bb
new file mode 100644
index 000000000..0613e50c7
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.2.bb
@@ -0,0 +1,12 @@
+require postgresql.inc
+
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fc4ce21960f0c561460d750bc270d11f"
+
+SRC_URI += "\
+   file://not-check-libperl.patch \
+   file://0001-Add-support-for-RISC-V.patch \
+   file://0001-Improve-reproducibility.patch \
+"
+
+SRC_URI[md5sum] = "a88ceea8ecf2741307f663e4539b58b7"
+SRC_URI[sha256sum] = "ad1dcc4c4fc500786b745635a9e1eba950195ce20b8913f50345bb7d5369b5de"
-- 
2.17.1




