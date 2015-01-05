Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0472B72606
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:51:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2015 02:51:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="664505014"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2015 02:51:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:51:28 +0000
Message-Id: <3bbfca14789dc0b828f5478d855990401454779f.1420454954.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420454954.git.paul.eggleton@linux.intel.com>
References: <cover.1420454954.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420454954.git.paul.eggleton@linux.intel.com>
References: <cover.1420454954.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 3/5] mtr: update to 0.86
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
X-List-Received-Date: Mon, 05 Jan 2015 10:51:57 -0000

* Newer automake compatibility fixed upstream, so drop patches.
* LIC_FILES_CHKSUM changed due to a trailing space being removed, no
  actual change to the license text.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support/mtr/files/configure.patch      | 12 ---------
 .../recipes-support/mtr/files/no-gtk.patch         | 31 ----------------------
 .../mtr/{mtr_0.82.bb => mtr_0.86.bb}               | 10 +++----
 3 files changed, 4 insertions(+), 49 deletions(-)
 delete mode 100644 meta-networking/recipes-support/mtr/files/configure.patch
 delete mode 100644 meta-networking/recipes-support/mtr/files/no-gtk.patch
 rename meta-networking/recipes-support/mtr/{mtr_0.82.bb => mtr_0.86.bb} (51%)

diff --git a/meta-networking/recipes-support/mtr/files/configure.patch b/meta-networking/recipes-support/mtr/files/configure.patch
deleted file mode 100644
index c978b87..0000000
--- a/meta-networking/recipes-support/mtr/files/configure.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: mtr-0.82/configure.in
-===================================================================
---- mtr-0.82.orig/configure.in	2014-07-16 19:52:56.306026346 +0000
-+++ mtr-0.82/configure.in	2014-07-17 21:59:03.208587150 +0000
-@@ -1,5 +1,5 @@
--AC_INIT(mtr.c)
--AM_INIT_AUTOMAKE(mtr, 0.82)
-+AC_INIT(mtr.c, 0.82)
-+AM_INIT_AUTOMAKE([foreign])
- 
- 
- AC_SUBST(GTK_OBJ)
diff --git a/meta-networking/recipes-support/mtr/files/no-gtk.patch b/meta-networking/recipes-support/mtr/files/no-gtk.patch
deleted file mode 100644
index 0dbeb7a..0000000
--- a/meta-networking/recipes-support/mtr/files/no-gtk.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Disable gtk check that breaks with current autotools
-
-Ideally we would have a proper fix for this and send that upstream instead.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/configure.in b/configure.in
-index 8474543..5118565 100644
---- a/configure.in
-+++ b/configure.in
-@@ -48,16 +48,8 @@ AC_ARG_ENABLE(ipv6,
- [  --disable-ipv6          Do not enable IPv6],
- WANTS_IPV6=$enableval, WANTS_IPV6=yes)
-    
--if test "x$WANTS_GTK" = "xyes"; then
--        AM_PATH_GTK_2_0(2.6.0, CFLAGS="$CFLAGS $GTK_CFLAGS"
--                           LIBS="$LIBS $GTK_LIBS -lm",
--                           AC_MSG_WARN(Building without GTK2 display support)
--                   AC_DEFINE(NO_GTK, 1, [Define if you don't have the GTK+ libraries available.])
--                           GTK_OBJ="")
--else
--	AC_DEFINE(NO_GTK)
--	GTK_OBJ=""
--fi
-+AC_DEFINE(NO_GTK, 1, [Define if you don't have the GTK+ libraries available.])
-+GTK_OBJ=""
- 
- AC_CHECK_FUNC(socket, , 
-   AC_CHECK_LIB(socket, socket, , AC_MSG_ERROR(No socket library found)))
diff --git a/meta-networking/recipes-support/mtr/mtr_0.82.bb b/meta-networking/recipes-support/mtr/mtr_0.86.bb
similarity index 51%
rename from meta-networking/recipes-support/mtr/mtr_0.82.bb
rename to meta-networking/recipes-support/mtr/mtr_0.86.bb
index b9a1ea2..a60bd34 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.82.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.86.bb
@@ -5,14 +5,12 @@ DEPENDS = "ncurses"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://mtr.c;beginline=5;endline=16;md5=56e390ced194aff352eefab404883057"
+                    file://mtr.c;beginline=5;endline=16;md5=af1fafbbfa1bfd48af839f4bb3221106"
 
-SRC_URI = "ftp://ftp.bitwizard.nl/mtr/mtr-${PV}.tar.gz \
-           file://configure.patch \
-           file://no-gtk.patch"
+SRC_URI = "ftp://ftp.bitwizard.nl/mtr/mtr-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "10601ea543fda3e51545c4bce195b64c"
-SRC_URI[sha256sum] = "f3b457c9623ae03565688a7ffd49d4843a5e2505ccaf3ba8d9fbd86e3ce9b6a0"
+SRC_URI[md5sum] = "8d63592c9d4579ef20cf491b41843eb2"
+SRC_URI[sha256sum] = "c5d948920b641cc35f8b380fc356ddfe07cce6a9c6474afe242fc58113f28c06"
 
 inherit autotools
 
-- 
1.9.3


