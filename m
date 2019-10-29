Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7820C7FA37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:06:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472Qh22MHjzCK
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 10:06:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572340018;
	bh=cPnTbpMoUlZYRq1BRh8woKEeaifIwGYrrNB/We2soh0=;
	h=From:To:Subject:Date:From;
	b=FzyHXleIVC2/AQXPeedRQskZ/qPaIZuHr3fTiXkLvq0e3jKtiefA4qKDGMoadpapW
	QTrZwL9LimBZ1OGvMdysy295SLSi+EfQajCqrQMQ8qyddM+Vfl4LG0OQE6FpkSmvG1
	qOdYvZ+f29pnpZrpYC1Oq8mErcyNZg2lo29AQOxwGaKre9CQo9r35CDxnw4FF9bY+q
	Uiad+Ifl4Hufxp7GWlPtukKdA817+ooMsv4P99Y4d+/iavciV+ardEnqy4HTn6xOx+
	kBksuPeq3FUaY0NxfB469rBU+t7PxVAE4b7oml6YFEQ6x8E355ulvWhN4UKxbaQU66
	gINYM8n6AlsFCyA0WVz39ZnqYpcsEEWeduseKS+NEApelrGSR4+yri1f+Ub/kwUti1
	zhW02utz2fq/g4+FRmVO8xUh+QB2T1pyLqRmzzbvFd+uRJa1MQne6U5BojZkU3O4Cy
	Z/udsfpLP/dgqkZfXfr6mxG1F7UfnkDFJp2SOV2e8BDmDA9tH9uiK2P+HlMO2g1iCj
	KBOZ4Y6JWKbBRbsxtF9y3dH0se6jVkO9wB/ZmS0j2RUZzUgm62uNCzMgicw1WWrX0K
	u3tpwEUqstRKql4YsQJUa9WH4Iol1vJ5y/vru64zg6UCZ+m7wsJKrIyOg1Oe3hwVtf
	DBTdfMfSV7JGUhZQSZOpUrTM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 11:06:52 +0200
Message-Id: <20191029090657.30771-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] lftp: Remove no longer needed patch
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
X-List-Received-Date: Tue, 29 Oct 2019 09:06:59 -0000

The root cause has already been fixed in glibc.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../files/fix-gcc-6-conflicts-signbit.patch   | 44 -------------------
 .../recipes-connectivity/lftp/lftp_4.8.4.bb   |  1 -
 2 files changed, 45 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch

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
diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb
index bf793d91d..ce669eb4f 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.8.4.bb
@@ -7,7 +7,6 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
-           file://fix-gcc-6-conflicts-signbit.patch \
           "
 SRC_URI[md5sum] = "a56b5047dbfda052df4c1dfd197aa092"
 SRC_URI[sha256sum] = "a853edbd075b008c315679c7882b6dcc6821ed2365d2ed843a412acd3d40da0e"
-- 
2.17.1


