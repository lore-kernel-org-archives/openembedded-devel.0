Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PW2cO-0007JZ-VH
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 09:03:18 +0100
Received: by ewy28 with SMTP id 28so426049ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 00:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=mEN9Knhha9V61/G3UGSjEwS7w9RjDqnR8DNVja9guSo=;
	b=L9PluTLYo8GIam/3r9XRBSj5pnio/W7EhOXB2M9x+fZj9ZSmoufIb/rKMiEbQHXiAy
	wU13h3vaKQJkPiGBMa3FjwIj8zFUlpEsMkhgseDLzUu63gb11VBP5K1ij3yS1snMRdBe
	0hbsK+Ki+ZcdF726TZy41yHjE0ESg5CIB2NTY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cAbnC+qhXOdTG26SVLRsMGsX+aTxYPPbhefv4zk/C+71lEdeAswaaBvmYWgI6piFXn
	5t5yC4vWqBsmQz7oaoNrQEg1Wc+goq4K1DlHAaAjDhk1FnQWldAAQ3fTzuUUIsyUMxn5
	WEJR+LobHfCBUKp5qtTqe1BnKeJOTMesr7F1g=
Received: by 10.213.34.208 with SMTP id m16mr7730577ebd.65.1293177787605;
	Fri, 24 Dec 2010 00:03:07 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id u1sm6246966eeh.4.2010.12.24.00.03.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Dec 2010 00:03:06 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Dec 2010 09:03:00 +0100
Message-Id: <1293177781-29292-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 1/2] changed rm into rm -f to remove old libtool stuff
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
X-List-Received-Date: Fri, 24 Dec 2010 08:03:18 -0000

this keeps things working even if the files are not there
(e.g. because configure is ran twice)

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/lesstif/lesstif_0.95.0.bb                  |    2 +-
 recipes/lftp/lftp_4.0.5.bb                         |    2 +-
 recipes/libfribidi/libfribidi_0.10.4.bb            |    6 +++---
 recipes/libgee/libgee.inc                          |    2 +-
 recipes/rxtx/rxtx_2.1-7r2.bb                       |    2 +-
 recipes/rxvt-unicode/rxvt-unicode_4.8.bb           |    2 +-
 recipes/rxvt-unicode/rxvt-unicode_4.9.bb           |    2 +-
 recipes/rxvt-unicode/rxvt-unicode_5.2.bb           |    2 +-
 recipes/rxvt-unicode/rxvt-unicode_5.3.bb           |    2 +-
 recipes/rxvt-unicode/rxvt-unicode_5.4.bb           |    2 +-
 recipes/rxvt-unicode/rxvt-unicode_5.6.bb           |    2 +-
 recipes/rxvt-unicode/rxvt-unicode_cvs.bb           |    2 +-
 recipes/rxvt/rxvt_2.7.9.bb                         |    2 +-
 recipes/rxvt/rxvt_2.8.0.bb                         |    2 +-
 recipes/util-linux-ng/util-linux-ng.inc            |    2 +-
 recipes/xmms/xmms_1.2.10.bb                        |    2 +-
 .../xorg-driver/xf86-video-openchrome_0.2.904.bb   |    2 +-
 17 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/recipes/lesstif/lesstif_0.95.0.bb b/recipes/lesstif/lesstif_0.95.0.bb
index 065bc97..407658a 100644
--- a/recipes/lesstif/lesstif_0.95.0.bb
+++ b/recipes/lesstif/lesstif_0.95.0.bb
@@ -29,7 +29,7 @@ do_preconfigure() {
 	mv ac_find_xft.m4 m4/
 	mv acinclude.m4 m4/
 
-	rm aclocal.m4
+	rm -f aclocal.m4
 
 	sed -i -e "s|LT_HAVE_FREETYPE|HAVEFREETYPE|" m4/acinclude.m4
 	sed -i -e "s|LT_HAVE_XRENDER|HAVEXRENDER|" m4/acinclude.m4
diff --git a/recipes/lftp/lftp_4.0.5.bb b/recipes/lftp/lftp_4.0.5.bb
index 11f181e..61e12bb 100644
--- a/recipes/lftp/lftp_4.0.5.bb
+++ b/recipes/lftp/lftp_4.0.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://ftp.yars.free.net/pub/source/lftp/lftp-${PV}.tar.bz2;name=u1"
 EXTRA_OECONF = "--disable-largefile --disable-rpath --with-included-readline=no"
 
 do_configure_prepend () {
-    rm ${S}/m4/iconv.m4
+    rm -f ${S}/m4/iconv.m4
 }
 
 inherit autotools gettext
diff --git a/recipes/libfribidi/libfribidi_0.10.4.bb b/recipes/libfribidi/libfribidi_0.10.4.bb
index b83c484..cf93cab 100644
--- a/recipes/libfribidi/libfribidi_0.10.4.bb
+++ b/recipes/libfribidi/libfribidi_0.10.4.bb
@@ -14,7 +14,7 @@ inherit autotools lib_package binconfig pkgconfig
 
 do_configure_prepend () {
         # this version of libtool is old - we have to nobble this file to get it to litoolize
-        rm ltconfig
-        rm aclocal.m4
-        rm acinclude.m4
+        rm -f ltconfig
+        rm -f aclocal.m4
+        rm -f acinclude.m4
 }
diff --git a/recipes/libgee/libgee.inc b/recipes/libgee/libgee.inc
index 3b8d792..87220ca 100644
--- a/recipes/libgee/libgee.inc
+++ b/recipes/libgee/libgee.inc
@@ -12,6 +12,6 @@ inherit autotools vala
 do_configure_prepend() {
      MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
       for i in ${MACROS}; do
-         rm m4/$i
+         rm -f m4/$i
       done
 }
diff --git a/recipes/rxtx/rxtx_2.1-7r2.bb b/recipes/rxtx/rxtx_2.1-7r2.bb
index d2e78b1..c4944f6 100644
--- a/recipes/rxtx/rxtx_2.1-7r2.bb
+++ b/recipes/rxtx/rxtx_2.1-7r2.bb
@@ -15,7 +15,7 @@ SRC_URI = "\
     "
 
 do_removebinaries_append() {
-	rm acinclude.m4
+	rm -f acinclude.m4
 }
 
 do_compile() {
diff --git a/recipes/rxvt-unicode/rxvt-unicode_4.8.bb b/recipes/rxvt-unicode/rxvt-unicode_4.8.bb
index b246c56..bf4e1cd 100644
--- a/recipes/rxvt-unicode/rxvt-unicode_4.8.bb
+++ b/recipes/rxvt-unicode/rxvt-unicode_4.8.bb
@@ -35,7 +35,7 @@ EXTRA_OEMAKE = "'XINC=-I${STAGING_INCDIR}' \
 
 do_configure () {
 	mv autoconf/configure.in . || true
-	rm autoconf/libtool.m4
+	rm -f autoconf/libtool.m4
 	libtoolize --force
 	autotools_do_configure
 	echo '#define RXVT_UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
diff --git a/recipes/rxvt-unicode/rxvt-unicode_4.9.bb b/recipes/rxvt-unicode/rxvt-unicode_4.9.bb
index bad8222..018514e 100644
--- a/recipes/rxvt-unicode/rxvt-unicode_4.9.bb
+++ b/recipes/rxvt-unicode/rxvt-unicode_4.9.bb
@@ -34,7 +34,7 @@ EXTRA_OEMAKE = "'XINC=-I${STAGING_INCDIR}' \
 
 do_configure () {
 	mv autoconf/configure.in . || true
-	rm autoconf/libtool.m4
+	rm -f autoconf/libtool.m4
 	libtoolize --force
 	autotools_do_configure
 	echo '#define RXVT_UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
diff --git a/recipes/rxvt-unicode/rxvt-unicode_5.2.bb b/recipes/rxvt-unicode/rxvt-unicode_5.2.bb
index d125d37..518dafd 100644
--- a/recipes/rxvt-unicode/rxvt-unicode_5.2.bb
+++ b/recipes/rxvt-unicode/rxvt-unicode_5.2.bb
@@ -36,7 +36,7 @@ EXTRA_OEMAKE = "'XINC=-I${STAGING_INCDIR}' \
 
 do_configure () {
 	mv autoconf/configure.in . || true
-	rm autoconf/libtool.m4
+	rm -f autoconf/libtool.m4
 	libtoolize --force
 	autotools_do_configure
 	echo '#define RXVT_UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
diff --git a/recipes/rxvt-unicode/rxvt-unicode_5.3.bb b/recipes/rxvt-unicode/rxvt-unicode_5.3.bb
index 7164e1c..ee09e6f 100644
--- a/recipes/rxvt-unicode/rxvt-unicode_5.3.bb
+++ b/recipes/rxvt-unicode/rxvt-unicode_5.3.bb
@@ -35,7 +35,7 @@ EXTRA_OEMAKE = "'XINC=-I${STAGING_INCDIR}' \
 
 do_configure () {
 	mv autoconf/configure.in . || true
-	rm autoconf/libtool.m4
+	rm -f autoconf/libtool.m4
 	libtoolize --force
 	autotools_do_configure
 	echo '#define RXVT_UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
diff --git a/recipes/rxvt-unicode/rxvt-unicode_5.4.bb b/recipes/rxvt-unicode/rxvt-unicode_5.4.bb
index 6c15eb1..f68a511 100644
--- a/recipes/rxvt-unicode/rxvt-unicode_5.4.bb
+++ b/recipes/rxvt-unicode/rxvt-unicode_5.4.bb
@@ -35,7 +35,7 @@ EXTRA_OEMAKE = "'XINC=-I${STAGING_INCDIR}' \
 
 do_configure () {
 	mv autoconf/configure.in . || true
-	rm autoconf/libtool.m4
+	rm -f autoconf/libtool.m4
 	libtoolize --force
 	autotools_do_configure
 	echo '#define RXVT_UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
diff --git a/recipes/rxvt-unicode/rxvt-unicode_5.6.bb b/recipes/rxvt-unicode/rxvt-unicode_5.6.bb
index 5b9c3da..8039ea1 100644
--- a/recipes/rxvt-unicode/rxvt-unicode_5.6.bb
+++ b/recipes/rxvt-unicode/rxvt-unicode_5.6.bb
@@ -39,7 +39,7 @@ EXTRA_OEMAKE = "'XINC=-I${STAGING_INCDIR}' \
 
 do_configure () {
 	mv autoconf/configure.in . || true
-	rm autoconf/libtool.m4
+	rm -f autoconf/libtool.m4
 	libtoolize --force
 	autotools_do_configure
 	echo '#define RXVT_UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
diff --git a/recipes/rxvt-unicode/rxvt-unicode_cvs.bb b/recipes/rxvt-unicode/rxvt-unicode_cvs.bb
index 67ba216..d31b839 100644
--- a/recipes/rxvt-unicode/rxvt-unicode_cvs.bb
+++ b/recipes/rxvt-unicode/rxvt-unicode_cvs.bb
@@ -38,7 +38,7 @@ EXTRA_OEMAKE = "'XINC=-I${STAGING_INCDIR}' \
 
 do_configure () {
 	mv autoconf/configure.in . || true
-	rm autoconf/libtool.m4
+	rm -f autoconf/libtool.m4
 	libtoolize --force
 	autotools_do_configure
 	echo '#define RXVT_UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
diff --git a/recipes/rxvt/rxvt_2.7.9.bb b/recipes/rxvt/rxvt_2.7.9.bb
index f4840b7..6cd834b 100644
--- a/recipes/rxvt/rxvt_2.7.9.bb
+++ b/recipes/rxvt/rxvt_2.7.9.bb
@@ -29,7 +29,7 @@ EXTRA_OEMAKE = "'XINC=-I${STAGING_INCDIR}' \
 
 do_configure () {
 	mv autoconf/configure.in . || true
-	rm autoconf/libtool.m4
+	rm -f autoconf/libtool.m4
 	libtoolize --force
 	autotools_do_configure
 	echo '#define RXVT_UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
diff --git a/recipes/rxvt/rxvt_2.8.0.bb b/recipes/rxvt/rxvt_2.8.0.bb
index 0ed4392..99b4de2 100644
--- a/recipes/rxvt/rxvt_2.8.0.bb
+++ b/recipes/rxvt/rxvt_2.8.0.bb
@@ -29,7 +29,7 @@ EXTRA_OEMAKE = "'XINC=-I${STAGING_INCDIR}' \
 
 do_configure () {
 	mv autoconf/configure.in . || true
-	rm autoconf/libtool.m4
+	rm -f autoconf/libtool.m4
 	libtoolize --force
 	autotools_do_configure
 	echo '#define RXVT_UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index fbc92e4..fa367d9 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -80,7 +80,7 @@ do_configure_prepend_chinook-compat () {
 
         for i in  lt~obsolete.m4 ltsugar.m4 libtool.m4 ltoptions.m4 ltversion.m4
         do
-                rm ${S}/m4/${i}
+                rm -f ${S}/m4/${i}
         done
 }
 
diff --git a/recipes/xmms/xmms_1.2.10.bb b/recipes/xmms/xmms_1.2.10.bb
index 0585a7f..34b1e07 100644
--- a/recipes/xmms/xmms_1.2.10.bb
+++ b/recipes/xmms/xmms_1.2.10.bb
@@ -26,7 +26,7 @@ EXTRA_OECONF = "--disable-opengl --disable-esd \
 
 do_configure_prepend() {
 	cp ${WORKDIR}/acinclude.m4 ${S}
-	rm ${S}/libxmms/acinclude.m4 || true
+	rm -f ${S}/libxmms/acinclude.m4 || true
 	for i in $(find . -name "Makefile*") ; do
 		sed -i -e 's:MKINSTALLDIRS = @MKINSTALLDIRS@:MKINSTALLDIRS = @mkdir_p@:g' \ 
 	           -e 's:$(SHELL) $(MKINSTALLDIRS):$(MKINSTALLDIRS):g' $i
diff --git a/recipes/xorg-driver/xf86-video-openchrome_0.2.904.bb b/recipes/xorg-driver/xf86-video-openchrome_0.2.904.bb
index 83bdf89..a1f2aca 100644
--- a/recipes/xorg-driver/xf86-video-openchrome_0.2.904.bb
+++ b/recipes/xorg-driver/xf86-video-openchrome_0.2.904.bb
@@ -8,5 +8,5 @@ SRC_URI[archive.md5sum] = "f2481d98ef54febf5bffbb88a2a2426d"
 SRC_URI[archive.sha256sum] = "c7bdf7c48365b1d077a4be7ccc652cf3f7a0f385fddeb2d4fe71b00b6c6b7aea"
 
 do_configure_prepend() {
-        rm ${S}/acinclude.m4 || true
+        rm -f ${S}/acinclude.m4 || true
 }
-- 
1.7.1



