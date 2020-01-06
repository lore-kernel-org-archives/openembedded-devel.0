Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CA67D7F97A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:38:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,402,1571673600"; d="scan'208";a="81374668"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 17:38:05 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id CCDEB49E9326
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 17:29:06 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 17:38:04 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 6 Jan 2020 17:38:12 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Jan 2020 05:54:54 -0800
Message-ID: <1578318898-25525-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: CCDEB49E9326.A5B7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] lftp: upgrade 4.8.4 -> 4.9.0
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
X-List-Received-Date: Mon, 06 Jan 2020 09:38:05 -0000
Content-Type: text/plain

fix-gcc-6-conflicts-signbit.patch
Removed since they are included in 4.9.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../files/fix-gcc-6-conflicts-signbit.patch   | 44 -------------------
 .../lftp/{lftp_4.8.4.bb => lftp_4.9.0.bb}     |  8 ++--
 2 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch
 rename meta-networking/recipes-connectivity/lftp/{lftp_4.8.4.bb => lftp_4.9.0.bb} (82%)

diff --git a/meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch b/meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch
deleted file mode 100644
index 952232b7a..000000000
--- a/meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch
+++ /dev/null
@@ -1,44 +0,0 @@
---- lftp-4.6.3a/src/NetAccess.cc.orig	2016-06-18 10:25:51.063358981 -0400
-+++ lftp-4.6.3a/src/NetAccess.cc	2016-06-18 10:26:04.143359209 -0400
-@@ -21,7 +21,7 @@
- 
- #include <errno.h>
- #include <assert.h>
--#include <math.h>
-+#include <cmath>
- #include <sys/types.h>
- 
- #include "NetAccess.h"
---- lftp-4.6.3a/src/Speedometer.cc.orig	2016-06-18 10:24:58.895358073 -0400
-+++ lftp-4.6.3a/src/Speedometer.cc	2016-06-18 10:25:10.879358281 -0400
-@@ -18,7 +18,7 @@
-  */
- 
- #include <config.h>
--#include <math.h>
-+#include <cmath>
- #include <stdlib.h>
- #include "Speedometer.h"
- #include "misc.h"
---- lftp-4.6.3a/src/FileCopy.cc.orig	2016-06-18 10:24:15.939357325 -0400
-+++ lftp-4.6.3a/src/FileCopy.cc	2016-06-18 10:24:24.583357475 -0400
-@@ -36,7 +36,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
--#include <math.h>
-+#include <cmath>
- #include <stddef.h>
- #include "FileCopy.h"
- #include "url.h"
---- lftp-4.6.3a/src/ResMgr.cc.orig	2016-06-18 10:23:31.387356549 -0400
-+++ lftp-4.6.3a/src/ResMgr.cc	2016-06-18 10:23:41.771356729 -0400
-@@ -23,7 +23,7 @@
- #include <ctype.h>
- #include <unistd.h>
- #include <stdlib.h>
--#include <math.h>
-+#include <cmath>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <errno.h>
diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.9.0.bb
similarity index 82%
rename from meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb
rename to meta-networking/recipes-connectivity/lftp/lftp_4.9.0.bb
index bf793d91d..ef047f7a3 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.0.bb
@@ -6,11 +6,9 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
-           file://fix-gcc-6-conflicts-signbit.patch \
-          "
-SRC_URI[md5sum] = "a56b5047dbfda052df4c1dfd197aa092"
-SRC_URI[sha256sum] = "a853edbd075b008c315679c7882b6dcc6821ed2365d2ed843a412acd3d40da0e"
+SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b05817a2c26463618271730d0f677edb"
+SRC_URI[sha256sum] = "309e7e91a7c020625715e85c1726b1e7524da22518683fbe051ac13116dedeac"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1




