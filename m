Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DAF8606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 09:18:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6Q9ICvG000436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 02:18:12 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Jul 2016 02:18:11 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jul 2016 05:18:07 -0400
Message-ID: <c5db424fbf578e677fb4b731f96aa48ee97ff4d8.1469524511.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1469524511.git.jackie.huang@windriver.com>
References: <cover.1469524511.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] unixodbc: Add the new recipe
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
X-List-Received-Date: Tue, 26 Jul 2016 09:18:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

unixODBC is an Open Source ODBC sub-system and an
ODBC SDK for Linux, Mac OSX, and UNIX.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../do-not-use-libltdl-source-directory.patch      | 43 ++++++++++++++++++++++
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb | 27 ++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-directory.patch
 create mode 100644 meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb

diff --git a/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-directory.patch b/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-directory.patch
new file mode 100644
index 0000000..69d26ad
--- /dev/null
+++ b/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-directory.patch
@@ -0,0 +1,43 @@
+Subject: [PATCH] do not use libltdl source directory
+
+Don't use the included libltdl, use the one provided
+by our libtool instead.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile.am  | 1 -
+ configure.ac | 2 --
+ 2 files changed, 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e881cca..1321802 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -5,7 +5,6 @@ SUBDIRS = \
+ 	log \
+ 	lst \
+ 	ini \
+-    libltdl \
+ 	odbcinst \
+ 	DriverManager \
+ 	exe \
+diff --git a/configure.ac b/configure.ac
+index 218502f..d50b7af 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -136,9 +136,7 @@ dnl AC_CONFIG_MACRO_DIR([libltdl/m4])
+ dnl LT_CONFIG_LTDL_DIR([libltdl])
+ dnl LTDL_INIT
+ 
+-LT_CONFIG_LTDL_DIR([libltdl])
+ LT_INIT([dlopen])
+-LTDL_INIT([convenience])
+ 
+ dnl Substitute INCLTDL and LIBLTDL in the Makefiles
+ AC_SUBST(LTDLINCL)
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb
new file mode 100644
index 0000000..23d6d04
--- /dev/null
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb
@@ -0,0 +1,27 @@
+SUMMARY = "An Open Source ODBC sub-system"
+DESCRIPTION = "unixODBC is an Open Source ODBC sub-system and an ODBC SDK \
+for Linux, Mac OSX, and UNIX."
+
+HOMEPAGE = "http://www.unixodbc.org/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7b37bf80a3df5a65b355433ae36d206"
+
+DEPENDS = "libtool mysql5"
+
+SRC_URI = "ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-${PV}.tar.gz \
+           file://do-not-use-libltdl-source-directory.patch \
+"
+SRC_URI[md5sum] = "bd25d261ca1808c947cb687e2034be81"
+SRC_URI[sha256sum] = "2e1509a96bb18d248bf08ead0d74804957304ff7c6f8b2e5965309c632421e39"
+
+inherit autotools-brokensep
+
+S = "${WORKDIR}/unixODBC-${PV}"
+
+EXTRA_OEMAKE += "LIBS=-lltdl"
+
+do_configure_prepend() {
+	# old m4 files will cause libtool version don't match
+	rm -rf m4/*
+	rm -fr libltdl
+}
-- 
2.8.1


