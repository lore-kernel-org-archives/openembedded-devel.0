Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 533B773D17
	for <Openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2015 02:31:56 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Tue, 4 Aug 2015
	04:31:49 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id C5A0D28BA20;
	Tue,  4 Aug 2015 04:31:49 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Aug 2015 04:31:48 +0200
Message-ID: <1438655508-30519-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [meta-networking] [PATCH] pure-ftpd: upgrade to 1.0.42
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Aug 2015 02:31:58 -0000
Content-Type: text/plain

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 ...coded-usr-local-includes-from-configure.a.patch | 23 +++++++++++-----------
 .../pure-ftpd/pure-ftpd/nostrip.patch              | 19 +++++++++---------
 .../{pure-ftpd_1.0.36.bb => pure-ftpd_1.0.42.bb}   |  6 +++---
 3 files changed, 25 insertions(+), 23 deletions(-)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.36.bb => pure-ftpd_1.0.42.bb} (71%)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
index 54088b0..76523fb 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
@@ -1,20 +1,21 @@
-From cffca7cb7c055f82ced316ddee90bb701b85b92d Mon Sep 17 00:00:00 2001
-From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
-Date: Tue, 10 Jan 2012 19:15:25 +0300
+From 1bafadf2502334a3e972ff667061469316d0d2ca Mon Sep 17 00:00:00 2001
+From: Tudor Florea <tudor.florea@enea.com>
+Date: Tue, 4 Aug 2015 02:46:39 +0200
 Subject: [PATCH] Remove hardcoded /usr/local includes from configure.ac
 
 Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 ---
- configure.ac |   12 ------------
- 1 files changed, 0 insertions(+), 12 deletions(-)
+ configure.ac | 12 ------------
+ 1 file changed, 12 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ae00c08..9ba6d8d 100644
+index 6c78e8c..851d45d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -67,18 +67,6 @@ AC_ARG_VAR(PYTHON,local path to the python interpreter)
+@@ -100,18 +100,6 @@ AC_ARG_VAR(PYTHON,local path to the python interpreter)
  python_possible_path="/usr/bin:/usr/local/bin:/bin:/opt/python/bin:/opt/python/usr/bin:/opt/python/usr/local/bin"
  AC_PATH_PROG(PYTHON,python,/usr/bin/env python,$python_possible_path)
  
@@ -30,9 +31,9 @@ index ae00c08..9ba6d8d 100644
 -  LDFLAGS="$LDFLAGS -L/usr/local/lib"
 -fi
 -
- if uname | fgrep SunOS > /dev/null 2> /dev/null ; then
-   CPPFLAGS="$CPPFLAGS -D_XPG4_2=1"
- fi
+ CPPFLAGS="$CPPFLAGS -D_FORTIFY_SOURCE=2"
+ 
+ dnl Checks for header files
 -- 
-1.7.7.3
+1.9.1
 
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
index 5cbbc5f..4cb33bc 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
@@ -1,6 +1,6 @@
-From 45eb89d1a6fde65caaf2d6e1a5d527f1ae7beb9c Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Mon, 3 Dec 2012 17:12:11 +0000
+From 0290bd6f4ceddff2c52dff833c9d31d24de7d0e1 Mon Sep 17 00:00:00 2001
+From: Tudor Florea <tudor.florea@enea.com>
+Date: Tue, 4 Aug 2015 03:07:01 +0200
 Subject: [PATCH] Don't mess with CFLAGS and LDFLAGS when --with-minimal is specified
 
 We especially don't want stripping enabled.
@@ -8,23 +8,24 @@ We especially don't want stripping enabled.
 Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 ---
- configure.ac |    2 --
- 1 files changed, 0 insertions(+), 2 deletions(-)
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3d59409..6836c0e 100644
+index 851d45d..dc410a1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -413,8 +413,6 @@ AC_ARG_WITH(minimal,
+@@ -423,8 +423,6 @@ AC_ARG_WITH(minimal,
      AC_DEFINE(NO_FTP_USERS)
      AC_DEFINE(WITHOUT_ASCII)    
      AC_DEFINE(BORING_MODE)
--    CFLAGS="$CFLAGS -Os -fomit-frame-pointer -fgcse -falign-functions=2 -falign-jumps=2 -fno-unroll-loops "
+-    CFLAGS="$CFLAGS -Os -fomit-frame-pointer -fno-unroll-loops "
 -    LDFLAGS="$LDFLAGS -s "
    fi ])
  
  AC_ARG_WITH(paranoidmsg,
 -- 
-1.7.1
+1.9.1
 
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
similarity index 71%
rename from meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
rename to meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
index 974e6b7..30b329a 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
@@ -3,7 +3,7 @@ SUMMARY = "FTP Server with a strong focus on software security"
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 SECTION = "net"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ae9e161311a5a0768c333b537a40e332"
+LIC_FILES_CHKSUM = "file://COPYING;md5=90352fb2bfe17f4261687a0d6e09f489"
 
 DEPENDS = "libcap"
 
@@ -11,8 +11,8 @@ SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.t
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
            file://nostrip.patch \
 "
-SRC_URI[md5sum] = "bbcb48e8aa6ec1abff9775b89f84af91"
-SRC_URI[sha256sum] = "90fb63b1a9d448076aa9f3e3c74b298965f98e03c824e9a4d241fffe8eb3a130"
+SRC_URI[md5sum] = "4195af8f0e5ee2a798b1014071dae3a3"
+SRC_URI[sha256sum] = "7be73a8e58b190a7054d2ae00c5e650cb9e091980420082d02ec3c3b68d8e7f9"
 
 inherit autotools
 
-- 
1.9.1


