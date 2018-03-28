Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A68957846C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 07:27:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2S7ROTV019078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 00:27:24 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 28 Mar 2018 00:27:23 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Mar 2018 15:24:17 +0800
Message-ID: <20180328072417.5716-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] unixodbc: update to 2.3.6
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
X-List-Received-Date: Wed, 28 Mar 2018 07:27:23 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Release notes from http://www.unixodbc.org/:

* Single bug fix that was a possible security issue so I have pushed a version out.

  - Fix order of arguments in SQLWriteFileDSN.c, fix unwanted free() in iusql.c
  - Add pkg-config files

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../unixodbc/files/do-not-use-libltdl-source-directory.patch | 12 ++++++------
 .../unixodbc/{unixodbc_2.3.4.bb => unixodbc_2.3.6.bb}        |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/unixodbc/{unixodbc_2.3.4.bb => unixodbc_2.3.6.bb} (82%)

diff --git a/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-directory.patch b/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-directory.patch
index 69d26adca..2499cff72 100644
--- a/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-directory.patch
+++ b/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-directory.patch
@@ -13,22 +13,22 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  2 files changed, 3 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index e881cca..1321802 100644
+index 4628401..e8989bf 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -5,7 +5,6 @@ SUBDIRS = \
+@@ -11,7 +11,6 @@ SUBDIRS = \
  	log \
  	lst \
  	ini \
--    libltdl \
+-	libltdl \
  	odbcinst \
  	DriverManager \
  	exe \
 diff --git a/configure.ac b/configure.ac
-index 218502f..d50b7af 100644
+index e4bcdaf..58aa5c5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -136,9 +136,7 @@ dnl AC_CONFIG_MACRO_DIR([libltdl/m4])
+@@ -144,9 +144,7 @@ dnl AC_CONFIG_MACRO_DIR([libltdl/m4])
  dnl LT_CONFIG_LTDL_DIR([libltdl])
  dnl LTDL_INIT
  
@@ -39,5 +39,5 @@ index 218502f..d50b7af 100644
  dnl Substitute INCLTDL and LIBLTDL in the Makefiles
  AC_SUBST(LTDLINCL)
 -- 
-2.8.1
+2.12.3
 
diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.6.bb
similarity index 82%
rename from meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb
rename to meta-oe/recipes-support/unixodbc/unixodbc_2.3.6.bb
index 6f57f375e..62d9db843 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.6.bb
@@ -11,8 +11,8 @@ DEPENDS = "libtool mysql5"
 SRC_URI = "ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
 "
-SRC_URI[md5sum] = "bd25d261ca1808c947cb687e2034be81"
-SRC_URI[sha256sum] = "2e1509a96bb18d248bf08ead0d74804957304ff7c6f8b2e5965309c632421e39"
+SRC_URI[md5sum] = "a8629fd2953b04b4639d0a9d8a5cf9d1"
+SRC_URI[sha256sum] = "88b637f647c052ecc3861a3baa275c3b503b193b6a49ff8c28b2568656d14d69"
 
 inherit autotools-brokensep
 
-- 
2.11.0


