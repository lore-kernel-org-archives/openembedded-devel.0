Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAD0601E9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 02:33:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,562,1574092800"; d="scan'208";a="86439185"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 10:33:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 1B1EA49DF145
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 10:23:27 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 10:33:28 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 17 Mar 2020 10:33:27 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Mar 2020 10:35:50 +0800
Message-ID: <20200317023550.2885-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1B1EA49DF145.A9209
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] redis: upgrade 5.0.7 -> 5.0.8
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
X-List-Received-Date: Tue, 17 Mar 2020 02:33:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Refresh the following patch:
	0001-src-Do-not-reset-FINAL_LIBS.patch

-0005-Mark-extern-definition-of-SDS_NOINIT-in-sds.h.patch
	Removed since this is included in 5.0.8

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch    |  4 +--
 ...rn-definition-of-SDS_NOINIT-in-sds.h.patch | 27 -------------------
 .../redis/{redis_5.0.7.bb => redis_5.0.8.bb}  |  5 ++--
 3 files changed, 4 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/redis/redis/0005-Mark-extern-definition-of-SDS_NOINIT-in-sds.h.patch
 rename meta-oe/recipes-extended/redis/{redis_5.0.7.bb => redis_5.0.8.bb} (90%)

diff --git a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
index 04af15dd8..b5c4133e3 100644
--- a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
@@ -18,7 +18,7 @@ diff --git a/src/Makefile b/src/Makefile
 index 7f7c625..c71dd3b 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -66,7 +66,7 @@ endif
+@@ -75,7 +75,7 @@ endif
  
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
@@ -26,7 +26,7 @@ index 7f7c625..c71dd3b 100644
 +FINAL_LIBS+=-lm
  DEBUG=-g -ggdb
  
- ifeq ($(uname_S),SunOS)
+ # Linux ARM needs -latomic at linking time
 -- 
 2.23.0
 
diff --git a/meta-oe/recipes-extended/redis/redis/0005-Mark-extern-definition-of-SDS_NOINIT-in-sds.h.patch b/meta-oe/recipes-extended/redis/redis/0005-Mark-extern-definition-of-SDS_NOINIT-in-sds.h.patch
deleted file mode 100644
index 4675687c3..000000000
--- a/meta-oe/recipes-extended/redis/redis/0005-Mark-extern-definition-of-SDS_NOINIT-in-sds.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7f7f710c8821b7254baeaf945ca3ca263b9845e2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 21 Dec 2019 11:17:50 -0800
-Subject: [PATCH] Mark extern definition of SDS_NOINIT in sds.h
-
-This helps avoiding multiple definition of this variable, its also
-defined globally in sds.c
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/sds.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sds.h b/src/sds.h
-index 1bdb60d..adcc12c 100644
---- a/src/sds.h
-+++ b/src/sds.h
-@@ -34,7 +34,7 @@
- #define __SDS_H
- 
- #define SDS_MAX_PREALLOC (1024*1024)
--const char *SDS_NOINIT;
-+extern const char *SDS_NOINIT;
- 
- #include <sys/types.h>
- #include <stdarg.h>
diff --git a/meta-oe/recipes-extended/redis/redis_5.0.7.bb b/meta-oe/recipes-extended/redis/redis_5.0.8.bb
similarity index 90%
rename from meta-oe/recipes-extended/redis/redis_5.0.7.bb
rename to meta-oe/recipes-extended/redis/redis_5.0.8.bb
index b91575552..2aec1b46a 100644
--- a/meta-oe/recipes-extended/redis/redis_5.0.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_5.0.8.bb
@@ -14,12 +14,11 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://lua-update-Makefile-to-use-environment-build-setting.patch \
            file://oe-use-libc-malloc.patch \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
-           file://0005-Mark-extern-definition-of-SDS_NOINIT-in-sds.h.patch \
            file://GNU_SOURCE.patch \
            "
 
-SRC_URI[md5sum] = "612ec43075a888bc8b8a7dd8ccb2e0f7"
-SRC_URI[sha256sum] = "61db74eabf6801f057fd24b590232f2f337d422280fd19486eca03be87d3a82b"
+SRC_URI[md5sum] = "1885f1c67281d566a1fd126e19cfb25d"
+SRC_URI[sha256sum] = "f3c7eac42f433326a8d981b50dba0169fdfaf46abb23fcda2f933a7552ee4ed7"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.20.1




