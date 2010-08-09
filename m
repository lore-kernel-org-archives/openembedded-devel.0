Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hbragge@dcombus.com>) id 1OiQeX-0000Rk-Ec
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 13:36:27 +0200
Received: from lumikki.dcombus.lan (unknown [83.150.95.26])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-68.nebula.fi (Postfix) with ESMTP id C060443F0ACE;
	Mon,  9 Aug 2010 14:36:12 +0300 (EEST)
Received: from hbragge by lumikki.dcombus.lan with local (Exim 4.69)
	(envelope-from <hbragge@lumikki.dcombus.lan>)
	id 1OiQeK-000898-Je; Mon, 09 Aug 2010 14:36:12 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Aug 2010 14:36:12 +0300
Message-Id: <1281353772-30862-1-git-send-email-henri.bragge@dcombus.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <AANLkTikjR5wxTzno2fJwtnDwVzDrQaMTVU=SiEbxHbCp@mail.gmail.com>
References: <AANLkTikjR5wxTzno2fJwtnDwVzDrQaMTVU=SiEbxHbCp@mail.gmail.com>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: hbragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/1] gsnmp-0.3.0: fix quoting in autoconf macros
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
X-List-Received-Date: Mon, 09 Aug 2010 11:36:27 -0000

Signed-off-by: Henri Bragge <henri.bragge@dcombus.com>
---
 recipes/gsnmp/gsnmp-0.3.0/quote-fix.patch |   24 ++++++++++++++++++++++++
 recipes/gsnmp/gsnmp_0.3.0.bb              |    3 ++-
 2 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gsnmp/gsnmp-0.3.0/quote-fix.patch

diff --git a/recipes/gsnmp/gsnmp-0.3.0/quote-fix.patch b/recipes/gsnmp/gsnmp-0.3.0/quote-fix.patch
new file mode 100644
index 0000000..138c9e6
--- /dev/null
+++ b/recipes/gsnmp/gsnmp-0.3.0/quote-fix.patch
@@ -0,0 +1,24 @@
+diff -Nurd gsnmp-0.3.0.orig/acinclude.m4 gsnmp-0.3.0/acinclude.m4
+--- gsnmp-0.3.0.orig/acinclude.m4	2010-02-19 10:35:29.000000000 +0200
++++ gsnmp-0.3.0/acinclude.m4	2010-08-09 13:30:32.000000000 +0300
+@@ -6,7 +6,7 @@
+ dnl usually in <utime.h>.
+ dnl Some systems have utime.h but don't declare the struct anywhere.
+ 
+-AC_DEFUN(jm_CHECK_TYPE_STRUCT_UTIMBUF,
++AC_DEFUN([jm_CHECK_TYPE_STRUCT_UTIMBUF],
+ [
+   AC_CHECK_HEADERS(utime.h)
+   AC_REQUIRE([AC_HEADER_TIME])
+diff -Nurd gsnmp-0.3.0.orig/gsnmp.m4 gsnmp-0.3.0/gsnmp.m4
+--- gsnmp-0.3.0.orig/gsnmp.m4	2010-02-19 10:35:29.000000000 +0200
++++ gsnmp-0.3.0/gsnmp.m4	2010-08-09 13:30:46.000000000 +0300
+@@ -1,7 +1,7 @@
+ dnl AM_PATH_GSNMP()
+ dnl 
+ 
+-AC_DEFUN(AM_PATH_GSNMP,
++AC_DEFUN([AM_PATH_GSNMP],
+ [
+   PKG_CHECK_MODULES(GSNMP, glib-2.0 >= 2.0.1)
+ ])
diff --git a/recipes/gsnmp/gsnmp_0.3.0.bb b/recipes/gsnmp/gsnmp_0.3.0.bb
index b191762..6287010 100644
--- a/recipes/gsnmp/gsnmp_0.3.0.bb
+++ b/recipes/gsnmp/gsnmp_0.3.0.bb
@@ -4,7 +4,8 @@ LICENSE = "GPLv2"
 DEPENDS = "glib-2.0 gnet"
 PR = "r0"
 
-SRC_URI = "ftp://ftp.ibr.cs.tu-bs.de/local/gsnmp/gsnmp-${PV}.tar.gz"
+SRC_URI = "ftp://ftp.ibr.cs.tu-bs.de/local/gsnmp/gsnmp-${PV}.tar.gz \
+	   file://quote-fix.patch"
 
 SRC_URI[md5sum] = "466699c11b70e18a04d51388b8f89f1c"
 SRC_URI[sha256sum] = "e428b61071b8ba2971fc8737ed2987210b04a71ffde307900df12c06a0bed0f9"
-- 
1.5.6.5



