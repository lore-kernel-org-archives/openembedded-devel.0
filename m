Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4191F7F811
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 08:26:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,277,1569254400"; d="scan'208";a="77996295"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2019 16:26:08 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 767474CE20C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 16:18:04 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 16:26:09 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2019 20:05:55 +0800
Message-ID: <1573128355-61944-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 767474CE20C2.A6F73
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] postgresql: upgrade 11.5 -> 12.0
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
X-List-Received-Date: Thu, 07 Nov 2019 08:26:08 -0000
Content-Type: text/plain

Update 0001-Use-pkg-config-for-libxml2-detection.patch for new version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../files/0001-Use-pkg-config-for-libxml2-detection.patch  | 14 +++++++++-----
 .../postgresql/{postgresql_11.5.bb => postgresql_12.0.bb}  |  4 ++--
 2 files changed, 11 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_11.5.bb => postgresql_12.0.bb} (63%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
index f14da06..84cd5c1 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
@@ -9,21 +9,25 @@ xml2-config does not work. Use pkgconfig to set CPPFLAGS and LIBS.
 
 Signed-off-by: Philip Balister <philip@balister.org>
 
-upate to version 10.4
+update to version 10.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Update for version 12.0
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
- configure.in | 15 ++-------------
- 1 file changed, 2 insertions(+), 13 deletions(-)
+ configure.in | 16 ++--------------
+ 1 file changed, 2 insertions(+), 14 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index d9fe56e..3e2cd3a 100644
+index 6942f81..7fd3e78 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -816,19 +816,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML support],
+@@ -923,20 +923,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML support],
                [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with XML support. (--with-libxml)])])
  
  if test "$with_libxml" = yes ; then
 -  PGAC_PATH_PROGS(XML2_CONFIG, xml2-config)
+-  AC_ARG_VAR(XML2_CONFIG, [path to xml2-config utility])dnl
 -  if test -n "$XML2_CONFIG"; then
 -    for pgac_option in `$XML2_CONFIG --cflags`; do
 -      case $pgac_option in
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_11.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.0.bb
similarity index 63%
rename from meta-oe/recipes-dbs/postgresql/postgresql_11.5.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.0.bb
index fd4200a..d5b1ebd 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_11.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.0.bb
@@ -8,5 +8,5 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[md5sum] = "580da94f6d85046ff2a228785ab2cc89"
-SRC_URI[sha256sum] = "7fdf23060bfc715144cbf2696cf05b0fa284ad3eb21f0c378591c6bca99ad180"
+SRC_URI[md5sum] = "87545416ef021eee8621d31a93fcc899"
+SRC_URI[sha256sum] = "cda2397215f758b793f741c86be05468257b0e6bcb1a6113882ab5d0df0855c6"
-- 
2.7.4




