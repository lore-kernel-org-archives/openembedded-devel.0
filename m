Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Taq1R-00047N-Qf
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2012 16:46:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2012 07:30:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,286,1352102400"; d="scan'208";a="222183707"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.208])
	by orsmga001.jf.intel.com with ESMTP; 20 Nov 2012 07:31:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2012 15:30:52 +0000
Message-Id: <e66779106fb8357c184d57be42b2925ef3fe5d2a.1353425302.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353425302.git.paul.eggleton@linux.intel.com>
References: <cover.1353425302.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353425302.git.paul.eggleton@linux.intel.com>
References: <cover.1353425302.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH v2 8/8] mtr: add from OE-Classic, update and tidy up
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
X-List-Received-Date: Tue, 20 Nov 2012 15:46:02 -0000

* Update to 0.82
* Add ncurses to DEPENDS
* Add patch to fix configure with standard autotools_do_configure
* Add SUMMARY
* Add LIC_FILES_CHKSUM

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support/mtr/files/no-gtk.patch         |   31 ++++++++++++++++++++
 meta-networking/recipes-support/mtr/mtr_0.82.bb    |   19 ++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-networking/recipes-support/mtr/files/no-gtk.patch
 create mode 100644 meta-networking/recipes-support/mtr/mtr_0.82.bb

diff --git a/meta-networking/recipes-support/mtr/files/no-gtk.patch b/meta-networking/recipes-support/mtr/files/no-gtk.patch
new file mode 100644
index 0000000..0dbeb7a
--- /dev/null
+++ b/meta-networking/recipes-support/mtr/files/no-gtk.patch
@@ -0,0 +1,31 @@
+Disable gtk check that breaks with current autotools
+
+Ideally we would have a proper fix for this and send that upstream instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/configure.in b/configure.in
+index 8474543..5118565 100644
+--- a/configure.in
++++ b/configure.in
+@@ -48,16 +48,8 @@ AC_ARG_ENABLE(ipv6,
+ [  --disable-ipv6          Do not enable IPv6],
+ WANTS_IPV6=$enableval, WANTS_IPV6=yes)
+    
+-if test "x$WANTS_GTK" = "xyes"; then
+-        AM_PATH_GTK_2_0(2.6.0, CFLAGS="$CFLAGS $GTK_CFLAGS"
+-                           LIBS="$LIBS $GTK_LIBS -lm",
+-                           AC_MSG_WARN(Building without GTK2 display support)
+-                   AC_DEFINE(NO_GTK, 1, [Define if you don't have the GTK+ libraries available.])
+-                           GTK_OBJ="")
+-else
+-	AC_DEFINE(NO_GTK)
+-	GTK_OBJ=""
+-fi
++AC_DEFINE(NO_GTK, 1, [Define if you don't have the GTK+ libraries available.])
++GTK_OBJ=""
+ 
+ AC_CHECK_FUNC(socket, , 
+   AC_CHECK_LIB(socket, socket, , AC_MSG_ERROR(No socket library found)))
diff --git a/meta-networking/recipes-support/mtr/mtr_0.82.bb b/meta-networking/recipes-support/mtr/mtr_0.82.bb
new file mode 100644
index 0000000..c6d5152
--- /dev/null
+++ b/meta-networking/recipes-support/mtr/mtr_0.82.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Combined traceroute and ping utility"
+DESCRIPTION = "mtr combines the functionality of the 'traceroute' and 'ping' programs in a single network diagnostic tool."
+HOMEPAGE = "http://www.bitwizard.nl/mtr/"
+DEPENDS = "ncurses"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://mtr.c;startline=5;endline=16;md5=87105f8fe9675e897e074869afaafa6f"
+
+SRC_URI = "ftp://ftp.bitwizard.nl/mtr/mtr-${PV}.tar.gz \
+           file://no-gtk.patch"
+
+SRC_URI[md5sum] = "10601ea543fda3e51545c4bce195b64c"
+SRC_URI[sha256sum] = "f3b457c9623ae03565688a7ffd49d4843a5e2505ccaf3ba8d9fbd86e3ce9b6a0"
+
+inherit autotools
+
+EXTRA_OECONF = "--without-gtk"
+
-- 
1.7.9.5



