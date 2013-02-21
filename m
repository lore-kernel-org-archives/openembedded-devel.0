Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U8VZ0-0001yG-NC
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 13:47:57 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2643FD22B3;
	Thu, 21 Feb 2013 13:31:42 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Feb 2013 13:31:35 +0100
Message-Id: <1361449895-30626-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <CAP9ODKoT2KTTWB=DiLXwyjy7K_2wK8Osa2_i9tmbsbQXS8s+4Q@mail.gmail.com>
References: <CAP9ODKoT2KTTWB=DiLXwyjy7K_2wK8Osa2_i9tmbsbQXS8s+4Q@mail.gmail.com>
Subject: [meta-oe][PATCH] onig: do not use system headers
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
X-List-Received-Date: Thu, 21 Feb 2013 12:47:57 -0000

When build on host with older eglibc (Ubuntu 12.04) build fails with:

/tmp/OE/build/tmp-eglibc/sysroots/genericarmv8/usr/include/bits/predefs.h:23:3: error: #error "Never use <bits/predefs.h> directly; include <stdc-predef.h> instead."

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../onig/files/do-not-use-system-headers.patch     | 44 ++++++++++++++++++++++
 meta-oe/recipes-support/onig/onig_5.9.3.bb         |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch

diff --git a/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch b/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch
new file mode 100644
index 0000000..b93602a
--- /dev/null
+++ b/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch
@@ -0,0 +1,44 @@
+Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+When build on host with older eglibc (Ubuntu 12.04) build fails with:
+
+/tmp/OE/build/tmp-eglibc/sysroots/genericarmv8/usr/include/bits/predefs.h:23:3: error: #error "Never use <bits/predefs.h> directly; include <stdc-predef.h> instead."
+
+Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+Upstream-Status: Inappropriate [embedded specific]
+
+---
+ Makefile.am        |    2 +-
+ sample/Makefile.am |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+--- onig-5.9.3.orig/Makefile.am
++++ onig-5.9.3/Makefile.am
+@@ -4,11 +4,11 @@ sampledir = $(top_srcdir)/sample
+ libname = libonig.la
+
+ ACLOCAL_AMFLAGS = -I m4
+ #AM_CFLAGS = -DNOT_RUBY
+ AM_CFLAGS =
+-INCLUDES  = -I$(top_srcdir) -I$(includedir)
++INCLUDES  = -I$(top_srcdir)
+
+ SUBDIRS = . sample
+
+ include_HEADERS = oniguruma.h oniggnu.h onigposix.h
+ lib_LTLIBRARIES = $(libname)
+--- onig-5.9.3.orig/sample/Makefile.am
++++ onig-5.9.3/sample/Makefile.am
+@@ -1,10 +1,10 @@
+ noinst_PROGRAMS = encode listcap names posix simple sql syntax crnl
+
+ libname = $(top_builddir)/libonig.la
+ LDADD   = $(libname)
+-INCLUDES  = -I$(top_srcdir) -I$(includedir)
++INCLUDES  = -I$(top_srcdir)
+
+ encode_SOURCES  = encode.c
+ listcap_SOURCES = listcap.c
+ names_SOURCES   = names.c
+ posix_SOURCES   = posix.c
diff --git a/meta-oe/recipes-support/onig/onig_5.9.3.bb b/meta-oe/recipes-support/onig/onig_5.9.3.bb
index 230e585..f67ceed 100644
--- a/meta-oe/recipes-support/onig/onig_5.9.3.bb
+++ b/meta-oe/recipes-support/onig/onig_5.9.3.bb
@@ -5,7 +5,8 @@ HOMEPAGE = "http://www.geocities.jp/kosako3/oniguruma/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0d4861b5bc0c392a5aa90d9d76ebd86f"
 
-SRC_URI = "http://www.geocities.jp/kosako3/oniguruma/archive/onig-${PV}.tar.gz"
+SRC_URI = "http://www.geocities.jp/kosako3/oniguruma/archive/onig-${PV}.tar.gz \
+           file://do-not-use-system-headers.patch"
 
 SRC_URI[md5sum] = "0d4eda2066d3c92970842a6790ce897a"
 SRC_URI[sha256sum] = "c3bba66b2a84760e6582c40881db97c839d94f327870009724bb8b4d0c051f2a"
-- 
1.8.1.2



