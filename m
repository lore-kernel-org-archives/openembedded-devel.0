Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.13020.1591188806356751223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 05:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,467,1583164800"; 
   d="scan'208";a="93762372"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Jun 2020 20:53:28 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 030F350A9984
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jun 2020 20:53:25 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Jun 2020 20:53:25 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dash: upgrade 0.5.10.2 -> 0.5.11
Date: Wed, 3 Jun 2020 20:53:11 +0800
Message-ID: <1591188793-15698-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591188793-15698-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1591188793-15698-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 030F350A9984.A3F3D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Fix-printf-format-errors-with-clang.patch
removed since it is not available in 0.5.11

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-Fix-printf-format-errors-with-clang.patch | 28 -------------------
 .../dash/{dash_0.5.10.2.bb => dash_0.5.11.bb} |  8 ++----
 2 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-shells/dash/dash/0001-Fix-printf-format-errors-with-clang.patch
 rename meta-oe/recipes-shells/dash/{dash_0.5.10.2.bb => dash_0.5.11.bb} (77%)

diff --git a/meta-oe/recipes-shells/dash/dash/0001-Fix-printf-format-errors-with-clang.patch b/meta-oe/recipes-shells/dash/dash/0001-Fix-printf-format-errors-with-clang.patch
deleted file mode 100644
index b3991faa8..000000000
--- a/meta-oe/recipes-shells/dash/dash/0001-Fix-printf-format-errors-with-clang.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3ddf397febf47f8de9ca2805e92355ecb3ba0e9f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Apr 2017 12:37:54 -0700
-Subject: [PATCH] Fix printf format errors with clang
-
-error: format string is not a string literal (potentially insecure)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/jobs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/jobs.c b/src/jobs.c
-index c2c2332..dcb81c1 100644
---- a/src/jobs.c
-+++ b/src/jobs.c
-@@ -427,7 +427,7 @@ sprint_status(char *s, int status, int sigonly)
- 				goto out;
- #endif
- 		}
--		col = fmtstr(s, 32, strsignal(st));
-+		col = fmtstr(s, 32, "%s", strsignal(st));
- #ifdef WCOREDUMP
- 		if (WCOREDUMP(status)) {
- 			col += fmtstr(s + col, 16, " (core dumped)");
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-shells/dash/dash_0.5.10.2.bb b/meta-oe/recipes-shells/dash/dash_0.5.11.bb
similarity index 77%
rename from meta-oe/recipes-shells/dash/dash_0.5.10.2.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.11.bb
index 18566284c..b3a36651f 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.10.2.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.11.bb
@@ -7,11 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 
 inherit autotools update-alternatives
 
-SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz \
-           file://0001-Fix-printf-format-errors-with-clang.patch \
-           "
-SRC_URI[md5sum] = "8f485f126c05d0ab800e85abfe1987aa"
-SRC_URI[sha256sum] = "3c663919dc5c66ec991da14c7cf7e0be8ad00f3db73986a987c118862b5f6071"
+SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
+SRC_URI[md5sum] = "027236e48b9202607b1418fee42c473e"
+SRC_URI[sha256sum] = "4dd9a6ed5fe7546095157918fe5d784bb0b7887ae13de50e1e2d11e1b5a391cb"
 
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
-- 
2.17.1



