Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1vr-0007fg-Cu
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:11:35 +0200
Received: by wibhm11 with SMTP id hm11so2101545wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 18:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LkQSzlHTadZ/yDMs52QScZ+xglxtns2f0jqG4iduxwE=;
	b=bQFMdd+L8cQPtZEMUvTytR1qQG9cpi6VNfuH281JbVuFz+P3g7PMQoOlHBga/Qrywl
	3dQUYgG26E5Tv9EhnlZV5zwdtPP4kr/Fq+Dh5d4vrJXhDdla4so1zxG9sLJ/8sLDIfp3
	Y13JO330kD0EtQnmAfPu2JsYaidjJNbikpHR26yOjZ/l99GToDfqWZIuSCIRLccmJeJ0
	PYkHxj7afDxqB2DnKbIdgqyz0F67A4OjpQxKmhTgIzJ5g4KneZuZbrCVsVUSvMrDm5Vw
	75n54Enq5u9KJsNUZzONxHz56jmKzrF2YgG1mwTsMY4IDKjBSuQgqY+iftGp6IfX+VZv
	sazg==
Received: by 10.180.76.135 with SMTP id k7mr299105wiw.7.1343699999116;
	Mon, 30 Jul 2012 18:59:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm19607391wix.9.2012.07.30.18.59.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 18:59:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:39 +0200
Message-Id: <5c13fc859ed4e05777a1ce5d8952c0dfbfe62278.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 14/24] libetpan: import from meta-smartphone
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
X-List-Received-Date: Tue, 31 Jul 2012 02:11:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libetpan-0.57/libetpan-autoreconf.patch        |   12 ++++++++++
 .../libetpan/libetpan-0.57/libetpan-ldflags.patch  |   11 +++++++++
 meta-oe/recipes-support/libetpan/libetpan_0.57.bb  |   24 ++++++++++++++++++++
 3 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/libetpan/libetpan-0.57/libetpan-autoreconf.patch
 create mode 100644 meta-oe/recipes-support/libetpan/libetpan-0.57/libetpan-ldflags.patch
 create mode 100644 meta-oe/recipes-support/libetpan/libetpan_0.57.bb

diff --git a/meta-oe/recipes-support/libetpan/libetpan-0.57/libetpan-autoreconf.patch b/meta-oe/recipes-support/libetpan/libetpan-0.57/libetpan-autoreconf.patch
new file mode 100644
index 0000000..d05967d
--- /dev/null
+++ b/meta-oe/recipes-support/libetpan/libetpan-0.57/libetpan-autoreconf.patch
@@ -0,0 +1,12 @@
+Index: libetpan-0.57/configure.ac
+===================================================================
+--- libetpan-0.57.orig/configure.ac	2008-10-08 19:54:20.000000000 +0000
++++ libetpan-0.57/configure.ac	2008-11-11 16:34:33.000000000 +0000
+@@ -106,6 +106,7 @@
+ 
+ # Check the C compiler.
+ AC_PROG_CC
++AC_PROG_CXX
+ 
+ # Compiler flags.
+ AC_ARG_ENABLE(debug,   [  --enable-debug          setup flags (gcc) for debugging (default=no)],
diff --git a/meta-oe/recipes-support/libetpan/libetpan-0.57/libetpan-ldflags.patch b/meta-oe/recipes-support/libetpan/libetpan-0.57/libetpan-ldflags.patch
new file mode 100644
index 0000000..438f44f
--- /dev/null
+++ b/meta-oe/recipes-support/libetpan/libetpan-0.57/libetpan-ldflags.patch
@@ -0,0 +1,11 @@
+--- libetpan-0.57/configure.ac~	2009-09-21 23:31:42.000000000 +0200
++++ libetpan-0.57/configure.ac	2009-09-21 23:31:42.000000000 +0200
+@@ -457,7 +457,7 @@
+       LDFLAGS="-$flag $LDFLAGS"
+       AC_TRY_LINK([], [pthread_create();], 
+                       [pthflag=yes; checkpthread=no], 
+-                      [pthflag=no; LDFLAGS="$OLDCFLAGS"])
++                      [pthflag=no; LDFLAGS="$OLDFLAGS"])
+       AC_MSG_RESULT($pthflag)
+     fi
+   done
diff --git a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
new file mode 100644
index 0000000..7049938
--- /dev/null
+++ b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "libetpan is a library for communicating with mail and news servers. \
+It supports the protocols SMTP, POP3, IMAP and NNTP."
+HOMEPAGE = "http://www.etpan.org"
+SECTION = "libs"
+DEPENDS = "gnutls"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f18ebe7e452708c26f83954f81062ba7"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libetpan/libetpan-${PV}.tar.gz \
+           file://libetpan-autoreconf.patch \
+           file://libetpan-ldflags.patch"
+
+inherit autotools pkgconfig gettext binconfig
+
+EXTRA_OECONF = "--without-openssl --with-gnutls --disable-db"
+
+PARALLEL_MAKE = ""
+
+FILES_${PN} = "${libdir}/lib*.so.*"
+FILES_${PN}-dev = "${bindir} ${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libdir}/pkgconfig"
+
+
+SRC_URI[md5sum] = "8ce8c6c071e81884a475b12b7f9a9cc0"
+SRC_URI[sha256sum] = "1f3fda5c9e2961d1a6298dc8aadae321493d37727d8db45bc2e8d58f20547011"
-- 
1.7.8.6



