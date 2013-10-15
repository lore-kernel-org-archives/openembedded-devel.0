Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 54E4C6D11C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 00:03:27 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so3684599eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 17:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=6tl3qvY4WVWphkvuIJhT2uBM+FryEfq9mGNYrYqz7ME=;
	b=S9o5gwpOw5k/l880olS0CawoaPZJk6igGCEccJ2OgmaurzP6l2hbGRnDPmsMuY5mCq
	iJ7sK5z8Ruf9Q2JLAzRWDOD9vmjzZ5iPMIS/y3rKNFC8XuN5jihwx+MhIfbC8QuS7Rwi
	g/aaKdyVlYGWUdJFYtsZsIQov4hpahpEtq29inA572eOYsS04fKSVCxX+NvjUhOiCzOU
	J+WiClDsa27a/BE5Yq02bSWBXHUTW82CPqzOMxV13BBF9erYCNLR3FutiYthUmx931x9
	TVzPbn8knzJkVUdTME9u/cgUgVAphUXd1qNhD7JX1sFxxV/sOGvXGmOxBXJBDUjdFdCF
	lbaQ==
X-Received: by 10.15.109.195 with SMTP id cf43mr7237eeb.60.1381795408798;
	Mon, 14 Oct 2013 17:03:28 -0700 (PDT)
Received: from localhost.localdomain (p5B0A21A3.dip0.t-ipconnect.de.
	[91.10.33.163]) by mx.google.com with ESMTPSA id
	f49sm159345944eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 17:03:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 02:03:13 +0200
Message-Id: <1381795394-21464-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1381795394-21464-1-git-send-email-schnitzeltony@googlemail.com>
References: <1381795394-21464-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-systemd 1/2] orbit2: fix build after automake 1.13.4 update
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
X-List-Received-Date: Tue, 15 Oct 2013 00:03:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:
| test/everything/Makefile.am:81: error: using '$(srcdir)' in TESTS is currently broken: '$(srcdir)/test.sh'
| test/inhibit/Makefile.am:4: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
| test/poa/Makefile.am:1: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: /home/superandy/tmp/oe-core-eglibc/work/x86_64-linux/orbit2-native/2.14.19-r0/temp/run.do_configure.14800:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_configure (log file is located at /home/superandy/tmp/oe-core-eglibc/work/x86_64-linux/orbit2-native/2.14.19-r0/temp/log.do_configure.14800)
ERROR: Task 6208 (virtual:native:/home/superandy/data/oe-core/sources/meta-openembedded/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb, do_configure) failed with exit code '1'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...LAGS-instead-of-INCLUDES-and-fix-problem-.patch | 42 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch

diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch b/meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch
new file mode 100644
index 0000000..7993abb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch
@@ -0,0 +1,42 @@
+From d91dbb42dc3b6073720027f68827acd0abee6d75 Mon Sep 17 00:00:00 2001
+From: Kjartan Maraas <kmaraas@gnome.org>
+Date: Tue, 14 May 2013 13:29:53 +0200
+Subject: [PATCH] Use AM_CPPFLAGS instead of INCLUDES and fix problem using
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [1]
+
+[1] https://git.gnome.org/browse/ORBit2/commit/test/everything/Makefile.am?id=d91dbb42dc3b6073720027f68827acd0abee6d75
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ test/everything/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test/everything/Makefile.am b/test/everything/Makefile.am
+index 32beb36..cb4b1d6 100644
+--- a/test/everything/Makefile.am
++++ b/test/everything/Makefile.am
+@@ -10,7 +10,7 @@ EVERYTHING_IDLOUT =          \
+ 	$(EVERYTHING_BUILT)  \
+ 	everything-imodule.c
+ 
+-INCLUDES =                                 \
++AM_CPPFLAGS =                              \
+ 	-I$(top_srcdir)/include            \
+ 	-I$(top_builddir)/include          \
+ 	-I$(top_builddir)/src              \
+@@ -78,7 +78,7 @@ include $(top_srcdir)/Makefile.shared
+ BUILT_SOURCES = ${EVERYTHING_BUILT} everything-imodule.c
+ CLEANFILES = ${BUILT_SOURCES} iorfile
+ 
+-TESTS = $(srcdir)/test.sh
++TESTS = $(top_builddir)/test/everything/test.sh
+ 
+ EXTRA_DIST = $(IDL_FILES) test.sh $(included_src)
+ 
+-- 
+1.8.3.1
+
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
index 74b6c12..ba3982d 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     file://configure-lossage.patch \
     file://pkgconfig-fix.patch \
     file://0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch \
+    file://0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch \
 "
 SRC_URI[md5sum] = "7082d317a9573ab338302243082d10d1"
 SRC_URI[sha256sum] = "55c900a905482992730f575f3eef34d50bda717c197c97c08fa5a6eafd857550"
-- 
1.8.3.1


