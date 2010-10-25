Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAMgV-00059U-QG
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 15:02:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id CF3EF314A20F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:01:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id nnJOI8bdE8R9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:01:07 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 5BF96314A1B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:01:06 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 13:01:06 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 13:01:06 +0000
Message-Id: <1288011666-23870-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libid3tag: patch libid3tag.pc.in into source tree, update recipe
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
X-List-Received-Date: Mon, 25 Oct 2010 13:02:13 -0000

* set SECTION to libs/multimedia
* bump PR
* oe-stylize

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libid3tag/files/id3tag.pc                  |   11 ------
 recipes/libid3tag/files/libid3tag-pkg-config.patch |   38 ++++++++++++++++++++
 recipes/libid3tag/libid3tag_0.15.1b.bb             |   21 ++++-------
 3 files changed, 45 insertions(+), 25 deletions(-)
 delete mode 100644 recipes/libid3tag/files/id3tag.pc
 create mode 100644 recipes/libid3tag/files/libid3tag-pkg-config.patch

diff --git a/recipes/libid3tag/files/id3tag.pc b/recipes/libid3tag/files/id3tag.pc
deleted file mode 100644
index e686000..0000000
--- a/recipes/libid3tag/files/id3tag.pc
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: id3tag
-Description: ID3 tag reading library
-Requires:
-Version: 0.15.0b
-Libs: -L${libdir} -lid3tag -lz
-Cflags: -I${includedir}
diff --git a/recipes/libid3tag/files/libid3tag-pkg-config.patch b/recipes/libid3tag/files/libid3tag-pkg-config.patch
new file mode 100644
index 0000000..16da613
--- /dev/null
+++ b/recipes/libid3tag/files/libid3tag-pkg-config.patch
@@ -0,0 +1,38 @@
+upstream: unmaintained
+source: http://gentoo.mindzoo.de/index.cgi/export/586/openmoko/trunk/openmoko-target/media-libs/libid3tag/files/0.15.1b/libid3tag-pkg-config.patch
+
+--- /dev/null	2009-07-02 12:43:53.540375369 +0200
++++ b/id3tag.pc.in	2009-07-02 16:19:21.000000000 +0200
+@@ -0,0 +1,11 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: id3tag
++Description: ID3 tag reading library
++Requires:
++Version: @VERSION@
++Libs: -L${libdir} -lid3tag -lz
++Cflags: -I${includedir}
+--- a/Makefile.am	2004-02-17 03:11:28.000000000 +0100
++++ b/Makefile.am	2009-07-02 16:17:35.000000000 +0200
+@@ -94,6 +94,9 @@
+ 
+ BUILT_SOURCES =		frametype.c compat.c genre.dat
+ 
++pkgconfigdir = $(libdir)/pkgconfig
++pkgconfig_DATA = id3tag.pc
++
+ $(srcdir)/frametype.c: $(srcdir)/frametype.gperf Makefile.am
+ 	cd $(srcdir) &&  \
+ 	gperf -tCcTonD -K id -N id3_frametype_lookup -s -3 -k '*'  \
+--- a/configure.ac	2004-01-24 00:22:46.000000000 +0100
++++ b/configure.ac	2009-07-02 16:19:00.000000000 +0200
+@@ -201,5 +201,5 @@
+ dnl AC_SUBST(LTLIBOBJS)
+ 
+ AC_CONFIG_FILES([Makefile msvc++/Makefile  \
+-	libid3tag.list])
++	libid3tag.list id3tag.pc])
+ AC_OUTPUT
diff --git a/recipes/libid3tag/libid3tag_0.15.1b.bb b/recipes/libid3tag/libid3tag_0.15.1b.bb
index 7675dc3..c7869da 100644
--- a/recipes/libid3tag/libid3tag_0.15.1b.bb
+++ b/recipes/libid3tag/libid3tag_0.15.1b.bb
@@ -1,22 +1,15 @@
-SECTION = "libs"
+DESCRIPTION = "Library for interacting with ID3 tags"
+SECTION = "libs/multimedia"
 PRIORITY = "optional"
-DEPENDS = "zlib"
-DESCRIPTION = "Library for interacting with ID3 tags."
 LICENSE = "GPL"
-PR = "r2"
+DEPENDS = "zlib"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz \
-           file://id3tag.pc"
-
-S = "${WORKDIR}/libid3tag-${PV}"
+           file://libid3tag-pkg-config.patch"
+SRC_URI[md5sum] = "e5808ad997ba32c498803822078748c3"
+SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
 
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "-enable-speed"
-
-do_configure_prepend() {
-    install -m 0644 ${WORKDIR}/id3tag.pc ${S}
-}
-
-SRC_URI[md5sum] = "e5808ad997ba32c498803822078748c3"
-SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
-- 
1.7.1



