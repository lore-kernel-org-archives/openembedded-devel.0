Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@ossystems.com.br>) id 1LXebP-0008EN-P2
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 17:39:52 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 92612402B8;
	Thu, 12 Feb 2009 12:38:49 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 45A05740DD;
	Thu, 12 Feb 2009 14:38:48 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id C484C610134; Thu, 12 Feb 2009 14:38:35 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 14:38:33 -0200
Message-Id: <1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.2.rc0
In-Reply-To: <1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/6] parted: drop versions up to 1.8.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Feb 2009 16:39:52 -0000

Versions older then 1.8.8 are not maintained upstream and looks to
have no users inside of OE hence makes no sense to be kept.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                                 |   21 ----------
 .../parted/parted-1.8.0/memory_allocation.patch    |   42 --------------------
 packages/parted/parted_1.6.23.bb                   |   12 ------
 packages/parted/parted_1.6.25.1.bb                 |   17 --------
 packages/parted/parted_1.8.0.bb                    |   18 --------
 packages/parted/parted_1.8.2.bb                    |   16 -------
 packages/parted/parted_1.8.7.bb                    |   30 --------------
 7 files changed, 0 insertions(+), 156 deletions(-)
 delete mode 100644 packages/parted/parted-1.8.0/memory_allocation.patch
 delete mode 100644 packages/parted/parted_1.6.23.bb
 delete mode 100644 packages/parted/parted_1.6.25.1.bb
 delete mode 100644 packages/parted/parted_1.8.0.bb
 delete mode 100644 packages/parted/parted_1.8.2.bb
 delete mode 100644 packages/parted/parted_1.8.7.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 9845ff6..4742b61 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -16610,26 +16610,6 @@ sha256=211a0092cfd50923eaad75c20630c0a1818e56605d4b6fbc10702d5a34ea7107
 md5=129f8623dc4f70188a015e3cbd7eae82
 sha256=74188aff5f2e5b77515a8cf3979199a598d58da8e4f573462b59cbf94cf1c99d
 
-[ftp://ftp.gnu.org/gnu/parted/parted-1.6.23.tar.gz]
-md5=7e46a32def60ea355c193d9225691742
-sha256=5144f413dcce1a0b94263ebf3730f2a2afe6a9557bf261f9d6f48c890423f4c8
-
-[ftp://ftp.gnu.org/gnu/parted/parted-1.6.25.1.tar.gz]
-md5=8ad8b2c8aa865d9d6a43a4ecfe021782
-sha256=b8f151450dc71e2477d44b7f9ebb77a9ccf8d08776b77edb9bddee07885f1b02
-
-[ftp://ftp.gnu.org/gnu/parted/parted-1.8.0.tar.gz]
-md5=52d3e565fc3369d3388a9e02d4b17410
-sha256=6c57feb082c23e52f38366fff4ffa3961e5dc294d4ebb61ffa31462b5ae3681e
-
-[ftp://ftp.gnu.org/gnu/parted/parted-1.8.2.tar.gz]
-md5=cce5bce8fa1d430e1ca3de3722807e01
-sha256=2f67c40e2589e7804213493f24ebf80cd10847b47c95098854db0250511c3ed1
-
-[ftp://ftp.gnu.org/gnu/parted/parted-1.8.7.tar.gz]
-md5=2ec5cb88b146f1a8ccd5b389455503c6
-sha256=bffb732ab47a8dfb528ab2513f6ae82a4f795c119decfe1f96310bf32c4dfc9e
-
 [ftp://ftp.gnu.org/gnu/parted/parted-1.8.8.tar.gz]
 md5=0d494591731082ec57cc18627728124a
 sha256=db59b77b7ef46f00d83eddedde8a4126bffa6bff5fa94a335dd5d30bf72d4286
@@ -25269,4 +25249,3 @@ sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 [http://heanet.dl.sourceforge.net/zziplib/zziplib-0.13.49.tar.bz2]
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
-
diff --git a/packages/parted/parted-1.8.0/memory_allocation.patch b/packages/parted/parted-1.8.0/memory_allocation.patch
deleted file mode 100644
index ba37096..0000000
--- a/packages/parted/parted-1.8.0/memory_allocation.patch
+++ /dev/null
@@ -1,42 +0,0 @@
---- parted-1.8.0/libparted/exception.c_orig	2006-12-11 19:44:23.000000000 +0000
-+++ parted-1.8.0/libparted/exception.c	2006-12-11 19:47:53.000000000 +0000
-@@ -231,6 +231,9 @@
- 		     PedExceptionOption ex_opts, const char* message, ...)
- {
- 	va_list		arg_list;
-+        int result;
-+	static int size = 1000;
-+
- 
- 	if (ex)
- 		ped_exception_catch ();
-@@ -239,16 +242,22 @@
- 	if (!ex)
- 		goto no_memory;
- 
--	ex->message = (char*) malloc (8192);
--	if (!ex->message)
--		goto no_memory;
--
- 	ex->type = ex_type;
- 	ex->options = ex_opts;
- 
--	va_start (arg_list, message);
--	vsnprintf (ex->message, 8192, message, arg_list);
--	va_end (arg_list);
-+        while (1) {
-+	            ex->message = (char*) malloc (size);
-+		    if (!ex->message)
-+		              goto no_memory;
-+		    va_start (arg_list, message);
-+		    result = vsnprintf (ex->message, size, message, arg_list);
-+		    va_end (arg_list);
-+		    
-+		    if (result > -1 && result < size)
-+		                    break;
-+		    size += 10;
-+		  }
-+	            
- 
- 	return do_throw ();
- 
diff --git a/packages/parted/parted_1.6.23.bb b/packages/parted/parted_1.6.23.bb
deleted file mode 100644
index cb9b08f..0000000
--- a/packages/parted/parted_1.6.23.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "parted, the GNU partition resizing program"
-HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
-LICENSE = "GPLv2"
-SECTION = "console/tools"
-DEPENDS = "readline e2fsprogs-libs"
-PR = "r0"
-
-SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz"
-
-EXTRA_OECONF = "--disable-Werror"
-
-inherit autotools
diff --git a/packages/parted/parted_1.6.25.1.bb b/packages/parted/parted_1.6.25.1.bb
deleted file mode 100644
index 8681055..0000000
--- a/packages/parted/parted_1.6.25.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "parted, the GNU partition resizing program"
-HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
-LICENSE = "GPLv2"
-SECTION = "console/tools"
-DEPENDS = "readline e2fsprogs-libs"
-PR = "r0"
-
-SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz"
-
-EXTRA_OECONF = "--disable-Werror"
-#export CFLAGS = "-mstructure-size-boundary=8"
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
diff --git a/packages/parted/parted_1.8.0.bb b/packages/parted/parted_1.8.0.bb
deleted file mode 100644
index bff27a6..0000000
--- a/packages/parted/parted_1.8.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "parted, the GNU partition resizing program"
-HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
-LICENSE = "GPLv2"
-SECTION = "console/tools"
-DEPENDS = "readline e2fsprogs-libs"
-PR = "r0"
-
-SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
-           file://memory_allocation.patch;patch=0"
-
-EXTRA_OECONF = "--disable-Werror"
-#export CFLAGS = "-mstructure-size-boundary=8"
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
diff --git a/packages/parted/parted_1.8.2.bb b/packages/parted/parted_1.8.2.bb
deleted file mode 100644
index 1185014..0000000
--- a/packages/parted/parted_1.8.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "parted, the GNU partition resizing program"
-HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
-LICENSE = "GPLv2"
-SECTION = "console/tools"
-DEPENDS = "readline e2fsprogs-libs"
-PR = "r0"
-
-SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz"
-           
-#EXTRA_OECONF = "--disable-Werror"
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
diff --git a/packages/parted/parted_1.8.7.bb b/packages/parted/parted_1.8.7.bb
deleted file mode 100644
index 59e3aea..0000000
--- a/packages/parted/parted_1.8.7.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "parted, the GNU partition resizing program"
-HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
-LICENSE = "GPLv2"
-SECTION = "console/tools"
-DEPENDS = "readline e2fsprogs-libs"
-PR = "r2"
-
-SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
-           file://syscalls.h \
-           file://syscalls.patch;patch=1 \
-           file://cross-gross-hack.patch;patch=1"
-           
-EXTRA_OECONF = "--disable-Werror"
-
-inherit autotools pkgconfig
-
-do_configure_prepend() {
-	cp ${WORKDIR}/syscalls.h ${S}/libparted/arch/
-}
-
-do_configure() {
-        gnu-configize
-        libtoolize --force
-        autoconf
-        oe_runconf
-}
-
-do_stage() {
-	autotools_stage_all
-}
-- 
1.6.2.rc0



