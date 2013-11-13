Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9346D9A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 17:24:17 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2013 17:23:55 +0000
Message-Id: <1384363435-25984-2-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1384363435-25984-1-git-send-email-ml@communistcode.co.uk>
References: <1384363435-25984-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH 2/2] zile: initial add 2.4.9
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
X-List-Received-Date: Wed, 13 Nov 2013 17:24:18 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 .../zile/files/remove-help2man.patch               | 28 ++++++++++++++++++++++
 meta-oe/recipes-support/zile/zile_2.4.9.bb         | 15 ++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-support/zile/files/remove-help2man.patch
 create mode 100644 meta-oe/recipes-support/zile/zile_2.4.9.bb

diff --git a/meta-oe/recipes-support/zile/files/remove-help2man.patch b/meta-oe/recipes-support/zile/files/remove-help2man.patch
new file mode 100644
index 0000000..c1a63f4
--- /dev/null
+++ b/meta-oe/recipes-support/zile/files/remove-help2man.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Inappropriate [configuration]
+
+diff --git a/Makefile.am b/Makefile.am
+index 54bc59f..46c2650 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -36,7 +36,6 @@ PERL_BUILDTIME =					\
+ 
+ EXTRA_DIST =						\
+ 	FAQ						\
+-	build-aux/zile-help2man-wrapper			\
+ 	$(PERL_BUILDTIME)
+ 
+ doc_DATA = AUTHORS FAQ NEWS
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index 639f59c..8c5123e 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -33,9 +33,3 @@ doc/zile.1: $(srcdir)/doc/zile.1.in doc/Makefile.am config.status
+ 	$(edit) $(abs_srcdir)/doc/zile.1.in >$@.tmp
+ 	mv $@.tmp $@
+ 
+-$(srcdir)/doc/zile.1.in: doc/man-extras build-aux/zile-help2man-wrapper configure.ac $(builddir)/src/zile$(EXEEXT)
+-	@test -d doc || mkdir doc
+-## Exit gracefully if zile.1.in is not writeable, such as during distcheck!
+-	$(AM_V_GEN)if ( touch $@.w && rm -f $@.w; ) >/dev/null 2>&1; then \
+-	  $(srcdir)/build-aux/missing --run $(HELP2MAN) --output=$@ --no-info --name="Zile Is Lossy Emacs" --include $(srcdir)/doc/man-extras $(srcdir)/build-aux/zile-help2man-wrapper; \
+-	fi
diff --git a/meta-oe/recipes-support/zile/zile_2.4.9.bb b/meta-oe/recipes-support/zile/zile_2.4.9.bb
new file mode 100644
index 0000000..0421ff7
--- /dev/null
+++ b/meta-oe/recipes-support/zile/zile_2.4.9.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Zile is lossy Emacs"
+HOMEPAGE = "http://zile.sourceforge.net/"
+DEPENDS = "ncurses libgc"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "http://ftp.gnu.org/gnu/zile/${P}.tar.gz \
+           file://remove-help2man.patch \
+"
+
+SRC_URI[md5sum] = "84a0af58fb4fbe3af16bde2ef2b8f5ae"
+SRC_URI[sha256sum] = "c71959c7aca02ac66be526ecccbc7954fb0ea7591ed3c13311a95e8f040b0049"
+
+inherit autotools
-- 
1.8.4.2


