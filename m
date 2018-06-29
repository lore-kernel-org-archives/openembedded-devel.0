Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEDDB74BBC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:23:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5T6N7ER020485
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 23:23:07 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 28 Jun 2018 23:22:57 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jun 2018 14:22:15 +0800
Message-ID: <1530253337-32732-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530253337-32732-1-git-send-email-changqing.li@windriver.com>
References: <1530253337-32732-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] rsyslog: upgrade 8.29.0 -> 8.36.0
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
X-List-Received-Date: Fri, 29 Jun 2018 06:23:06 -0000
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{libfastjson_0.99.4.bb => libfastjson_0.99.8.bb}    |  2 +-
 .../rsyslog/rsyslog/0001-Include-sys-time-h.patch       | 17 ++++++++++-------
 .../rsyslog/use-pkgconfig-to-check-libgcrypt.patch      |  2 +-
 .../rsyslog/{rsyslog_8.29.0.bb => rsyslog_8.36.0.bb}    |  6 +++---
 4 files changed, 15 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{libfastjson_0.99.4.bb => libfastjson_0.99.8.bb} (85%)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.29.0.bb => rsyslog_8.36.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.4.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb
similarity index 85%
rename from meta-oe/recipes-extended/rsyslog/libfastjson_0.99.4.bb
rename to meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb
index 2e23d7e..ea089de 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb
@@ -8,7 +8,7 @@ DEPENDS = ""
 
 SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https"
 
-SRCREV = "6e057a094cb225c9d80d8d6e6b1f36ca88a942dd"
+SRCREV = "4758b1caf69ada911ef79e1d80793fe489b98dff"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
index ca88dd3..3c546dd 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
@@ -1,6 +1,6 @@
-From 9739095de6ae5f844354756ae968f5f8864eb3e3 Mon Sep 17 00:00:00 2001
+From 7baf35b88d742032a2dc456c396843e17e866f8e Mon Sep 17 00:00:00 2001
 From: Ming Liu <peter.x.liu@external.atlascopco.com>
-Date: Sun, 26 Feb 2017 14:10:21 +0100
+Date: Wed, 27 Jun 2018 14:04:57 +0800
 Subject: [PATCH] Include sys/time.h
 
 struct timeval is defined in sys/time.h with a musl libc.
@@ -8,13 +8,13 @@ struct timeval is defined in sys/time.h with a musl libc.
 Upstream-Status: Inappropriate [musl libc specific]
 
 Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
-
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  tests/msleep.c | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/tests/msleep.c b/tests/msleep.c
-index 26a8206..ca818be 100644
+index 98dbece..96f6950 100644
 --- a/tests/msleep.c
 +++ b/tests/msleep.c
 @@ -26,11 +26,7 @@
@@ -26,6 +26,9 @@ index 26a8206..ca818be 100644
 -#else
 -#include <time.h>
 -#endif
- 
- int main(int argc, char *argv[])
- {
+ #if defined(HAVE_SYS_SELECT_H)
+ #include <sys/select.h>
+ #endif
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
index 162d239..0352587 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
@@ -3,7 +3,7 @@ From: Roy Li <rongqing.li@windriver.com>
 Date: Wed, 18 Jun 2014 13:46:52 +0800
 Subject: [PATCH] use pkgconfig to check libgcrypt
 
-Upstream-status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 libgcrypt does no longer provide libgcrypt-config, and provide
 *.pc, so we should use pkgconfig to check
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
index 03f21c6..d65a2be 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
@@ -9,7 +9,7 @@ Rsyslog is an enhanced syslogd supporting, among others, MySQL,\
  encryption protected syslog relay chains while at the same time being\
  very easy to setup for the novice user."
 
-DEPENDS = "zlib libestr libfastjson bison-native flex-native liblogging"
+DEPENDS = "zlib libestr libfastjson bison-native flex-native liblogging curl"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3 & LGPLv3 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
@@ -30,8 +30,8 @@ SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "3805617f65a4b4bea34606487a5255a0"
-SRC_URI[sha256sum] = "220ba30b5afb0f3ddb328613fea7aa3966b01e4d0c52d6de9ab27b0858f19738"
+SRC_URI[md5sum] = "6846bb6d37af3ce067988dd2460d3a5d"
+SRC_URI[sha256sum] = "8a4b5beb92c6b308c3d14de2364c2788f62ef5d37ca0448144619edfe508ee70"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.7.4


