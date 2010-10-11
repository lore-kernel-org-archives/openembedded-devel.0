Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P5Bom-0006tL-FV
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:25:45 +0200
Received: by pxi10 with SMTP id 10so268233pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 23:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=/nksb/WpBZcSfLEv2jRYTGMgpqLHLzLygbjl/+YjiiM=;
	b=LfkYSPwbEGFWXyfgNGNL61w7ndtKCIP6fyORQYJViwGqMTWV9BX8x8ZOC49dbylydU
	F6Bt/MsbDvD49dPBEG4w+hewd59P2RsugCXFbqpmg1eUUE9m3D1Dcz0xcV1el/uUpHnF
	2x/6qssBzai2CfxeuVUacCNNvjeQD80xv9+JY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=NNVoxuF41V3dret5104+rTsPS+lAyocdbDVXRrRJetmwzWA7NKW1qdTP5LTomXs/AN
	OjVBL7vyzxEwhYFLCZWXEHM7T9DJ0N7K0us7cMtE9QwWT7Kf49OiVXKaFaxryvnCF2s4
	M5mByC2h0pEbT8hfCx52yML9+hSL0P63+Gkng=
Received: by 10.114.77.10 with SMTP id z10mr6563128waa.168.1286778187469;
	Sun, 10 Oct 2010 23:23:07 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id d2sm12629499wam.2.2010.10.10.23.23.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 10 Oct 2010 23:23:06 -0700 (PDT)
Message-ID: <4CB2AD43.5000102@gmail.com>
Date: Mon, 11 Oct 2010 16:52:59 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] galago: move to obsolete.
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
X-List-Received-Date: Mon, 11 Oct 2010 06:25:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

libgalago doesn't build, and presumably hasn't since dbus 0.92 was in the tree.

| ../libgalago/.libs/libgalago.so: undefined reference to `dbus_connection_disconnect'
| collect2: ld returned 1 exit status
| make[2]: *** [presence-feed] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/galago/eds-feed/disable-bonobo.patch       |   62 --------------------
 recipes/galago/eds-feed_0.3.2.bb                   |   17 -----
 recipes/galago/files/no-check.patch                |   15 -----
 recipes/galago/galago-daemon_0.3.4.bb              |   17 -----
 recipes/galago/libgalago_0.3.3.bb                  |   20 ------
 .../obsolete/galago/eds-feed/disable-bonobo.patch  |   62 ++++++++++++++++++++
 recipes/obsolete/galago/eds-feed_0.3.2.bb          |   17 +++++
 recipes/obsolete/galago/files/no-check.patch       |   15 +++++
 recipes/obsolete/galago/galago-daemon_0.3.4.bb     |   17 +++++
 recipes/obsolete/galago/libgalago_0.3.3.bb         |   20 ++++++
 10 files changed, 131 insertions(+), 131 deletions(-)
 delete mode 100644 recipes/galago/eds-feed/disable-bonobo.patch
 delete mode 100644 recipes/galago/eds-feed_0.3.2.bb
 delete mode 100644 recipes/galago/files/no-check.patch
 delete mode 100644 recipes/galago/galago-daemon_0.3.4.bb
 delete mode 100644 recipes/galago/libgalago_0.3.3.bb
 create mode 100644 recipes/obsolete/galago/eds-feed/disable-bonobo.patch
 create mode 100644 recipes/obsolete/galago/eds-feed_0.3.2.bb
 create mode 100644 recipes/obsolete/galago/files/no-check.patch
 create mode 100644 recipes/obsolete/galago/galago-daemon_0.3.4.bb
 create mode 100644 recipes/obsolete/galago/libgalago_0.3.3.bb

diff --git a/recipes/galago/eds-feed/disable-bonobo.patch b/recipes/galago/eds-feed/disable-bonobo.patch
deleted file mode 100644
index 3a20978..0000000
--- a/recipes/galago/eds-feed/disable-bonobo.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Index: eds-feed-0.3.2/configure.ac
-===================================================================
---- eds-feed-0.3.2.orig/configure.ac	2005-08-28 19:11:39.000000000 +0000
-+++ eds-feed-0.3.2/configure.ac	2005-12-16 09:22:10.000000000 +0000
-@@ -65,7 +65,7 @@
- 	libxml-2.0)
- 
- # Check which version of eds we're using
--PKG_CHECK_MODULES(EDS, libebook-1.2 >= 1.1.4 libedata-book-1.2 >= 1.1.4)
-+PKG_CHECK_MODULES(EDS, libebook-1.2 >= 1.1.4)
- 
- PACKAGE_CFLAGS="$PACKAGE_CFLAGS $EDS_CFLAGS"
- PACKAGE_LIBS="$PACKAGE_LIBS $EDS_LIBS"
-Index: eds-feed-0.3.2/src/main.c
-===================================================================
---- eds-feed-0.3.2.orig/src/main.c	2005-08-21 07:26:02.000000000 +0000
-+++ eds-feed-0.3.2/src/main.c	2005-12-16 09:24:38.000000000 +0000
-@@ -20,17 +20,11 @@
-  */
- #include <glib.h>
- #include <libgalago/galago.h>
--#include <libedata-book/Evolution-DataServer-Addressbook.h>
- 
- #include <libebook/e-book.h>
--#include <libedata-book/e-data-book-factory.h>
--#include <bonobo/bonobo-main.h>
- 
- #include <string.h>
- 
--#define E_DATA_BOOK_FACTORY_OAF_ID \
--    "OAFIID:GNOME_Evolution_DataServer_BookFactory"
--
- static EBookView *book_view = NULL;
- static EBook *book = NULL;
- static gulong book_view_tag = 0;
-@@ -157,8 +151,8 @@
- 		galago_person_set_photo(person, NULL);
- 	else
- 	{
--		galago_photo_new(person, (unsigned char *)ephoto->data,
--						 ephoto->length);
-+//		galago_photo_new(person, (unsigned char *)ephoto->data,
-+//						 ephoto->length);
- 	}
- }
- 
-@@ -294,15 +288,6 @@
- 
- 	galago_core_set_exit_with_daemon(TRUE);
- 
--	if (!bonobo_init_full(NULL, NULL, bonobo_activation_orb_get(),
--						  CORBA_OBJECT_NIL, CORBA_OBJECT_NIL))
--	{
--		fprintf(stderr, "Unable to initialize bonobo.\n");
--		exit(1);
--	}
--
--	bonobo_activate();
--
- 	setup_book_view();
- 	setup_services();
- 
diff --git a/recipes/galago/eds-feed_0.3.2.bb b/recipes/galago/eds-feed_0.3.2.bb
deleted file mode 100644
index e42f6e8..0000000
--- a/recipes/galago/eds-feed_0.3.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Galago linkage to the Evolution Data Server."
-HOMEPAGE = "http://www.galago-project.org/"
-LICENSE = "GPL"
-DEPENDS = "gettext libgalago dbus glib-2.0 eds-dbus"
-
-SRC_URI = "http://www.galago-project.org/files/releases/source/${PN}/${P}.tar.gz \
-           file://disable-bonobo.patch"
-#           file://no-check.patch"
-#EXTRA_OECONF =	"--disable-binreloc"
-
-FILES_${PN} += "${libdir}/galago/eds-feed"
-
-inherit autotools pkgconfig
-
-
-SRC_URI[md5sum] = "1f6ac4910dc8bb0276549bd0308f8acb"
-SRC_URI[sha256sum] = "6b7448359284f5af75cbb7027c47616b28aca8b90f9a16b9ec954fa50e455ed3"
diff --git a/recipes/galago/files/no-check.patch b/recipes/galago/files/no-check.patch
deleted file mode 100644
index 89b0eaf..0000000
--- a/recipes/galago/files/no-check.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- /tmp/configure.ac	2005-09-08 21:38:49.316449440 +0200
-+++ libgalago-0.3.3/configure.ac	2005-09-08 21:39:32.697854464 +0200
-@@ -198,11 +198,8 @@
- dnl #
- dnl # Check for Check
- dnl #
--AM_PATH_CHECK(, [have_check="yes"],
--[
--	AC_MSG_WARN([Check not found; cannot run some unit tests])
- 	have_check="no"
--])
-+
- 
- AM_CONDITIONAL(HAVE_CHECK, test "$have_check" = "yes")
- 
diff --git a/recipes/galago/galago-daemon_0.3.4.bb b/recipes/galago/galago-daemon_0.3.4.bb
deleted file mode 100644
index 84c0885..0000000
--- a/recipes/galago/galago-daemon_0.3.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Galago is a desktop presence framework, designed to transmit presence information between programs."
-HOMEPAGE = "http://www.galago-project.org/"
-LICENSE = "GPL"
-DEPENDS = "gettext libgalago dbus glib-2.0"
-PR = "r1"
-
-SRC_URI = "http://www.galago-project.org/files/releases/source/${PN}/${P}.tar.gz \
-           file://no-check.patch"
-EXTRA_OECONF =	"--disable-binreloc"
-
-FILES_${PN} += "${datadir}/dbus-1/services/"
-
-inherit autotools pkgconfig
-
-
-SRC_URI[md5sum] = "958ea4a9e1be61cb5e5f35f75a9bfede"
-SRC_URI[sha256sum] = "958ae2ddc89d218e7b3fe4f00a61f4ade48c8fefa768854c67425f5495387eed"
diff --git a/recipes/galago/libgalago_0.3.3.bb b/recipes/galago/libgalago_0.3.3.bb
deleted file mode 100644
index 8c1ef61..0000000
--- a/recipes/galago/libgalago_0.3.3.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =	"Galago is a desktop presence framework, designed to transmit presence information between programs."
-HOMEPAGE =	"http://www.galago-project.org/"
-LICENSE =	"LGPL"
-DEPENDS = 	"gettext dbus glib-2.0"
-PR =		"r1"
-
-
-SRC_URI =	"http://www.galago-project.org/files/releases/source/${PN}/${P}.tar.gz \
-		 file://no-check.patch"
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_includes
-	install -d ${STAGING_LIBDIR}
-	install -m 755 libgalago/.libs/libgalago.so.1.0.0 ${STAGING_LIBDIR}/libgalago.so
-}
-
-SRC_URI[md5sum] = "94d5223445deb1ed95973424d4958386"
-SRC_URI[sha256sum] = "148bc83e4ab6e87a6f26b60efdffc1258752a42079783e6f2b080f287e8b15fc"
diff --git a/recipes/obsolete/galago/eds-feed/disable-bonobo.patch b/recipes/obsolete/galago/eds-feed/disable-bonobo.patch
new file mode 100644
index 0000000..3a20978
--- /dev/null
+++ b/recipes/obsolete/galago/eds-feed/disable-bonobo.patch
@@ -0,0 +1,62 @@
+Index: eds-feed-0.3.2/configure.ac
+===================================================================
+--- eds-feed-0.3.2.orig/configure.ac	2005-08-28 19:11:39.000000000 +0000
++++ eds-feed-0.3.2/configure.ac	2005-12-16 09:22:10.000000000 +0000
+@@ -65,7 +65,7 @@
+ 	libxml-2.0)
+ 
+ # Check which version of eds we're using
+-PKG_CHECK_MODULES(EDS, libebook-1.2 >= 1.1.4 libedata-book-1.2 >= 1.1.4)
++PKG_CHECK_MODULES(EDS, libebook-1.2 >= 1.1.4)
+ 
+ PACKAGE_CFLAGS="$PACKAGE_CFLAGS $EDS_CFLAGS"
+ PACKAGE_LIBS="$PACKAGE_LIBS $EDS_LIBS"
+Index: eds-feed-0.3.2/src/main.c
+===================================================================
+--- eds-feed-0.3.2.orig/src/main.c	2005-08-21 07:26:02.000000000 +0000
++++ eds-feed-0.3.2/src/main.c	2005-12-16 09:24:38.000000000 +0000
+@@ -20,17 +20,11 @@
+  */
+ #include <glib.h>
+ #include <libgalago/galago.h>
+-#include <libedata-book/Evolution-DataServer-Addressbook.h>
+ 
+ #include <libebook/e-book.h>
+-#include <libedata-book/e-data-book-factory.h>
+-#include <bonobo/bonobo-main.h>
+ 
+ #include <string.h>
+ 
+-#define E_DATA_BOOK_FACTORY_OAF_ID \
+-    "OAFIID:GNOME_Evolution_DataServer_BookFactory"
+-
+ static EBookView *book_view = NULL;
+ static EBook *book = NULL;
+ static gulong book_view_tag = 0;
+@@ -157,8 +151,8 @@
+ 		galago_person_set_photo(person, NULL);
+ 	else
+ 	{
+-		galago_photo_new(person, (unsigned char *)ephoto->data,
+-						 ephoto->length);
++//		galago_photo_new(person, (unsigned char *)ephoto->data,
++//						 ephoto->length);
+ 	}
+ }
+ 
+@@ -294,15 +288,6 @@
+ 
+ 	galago_core_set_exit_with_daemon(TRUE);
+ 
+-	if (!bonobo_init_full(NULL, NULL, bonobo_activation_orb_get(),
+-						  CORBA_OBJECT_NIL, CORBA_OBJECT_NIL))
+-	{
+-		fprintf(stderr, "Unable to initialize bonobo.\n");
+-		exit(1);
+-	}
+-
+-	bonobo_activate();
+-
+ 	setup_book_view();
+ 	setup_services();
+ 
diff --git a/recipes/obsolete/galago/eds-feed_0.3.2.bb b/recipes/obsolete/galago/eds-feed_0.3.2.bb
new file mode 100644
index 0000000..e42f6e8
--- /dev/null
+++ b/recipes/obsolete/galago/eds-feed_0.3.2.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Galago linkage to the Evolution Data Server."
+HOMEPAGE = "http://www.galago-project.org/"
+LICENSE = "GPL"
+DEPENDS = "gettext libgalago dbus glib-2.0 eds-dbus"
+
+SRC_URI = "http://www.galago-project.org/files/releases/source/${PN}/${P}.tar.gz \
+           file://disable-bonobo.patch"
+#           file://no-check.patch"
+#EXTRA_OECONF =	"--disable-binreloc"
+
+FILES_${PN} += "${libdir}/galago/eds-feed"
+
+inherit autotools pkgconfig
+
+
+SRC_URI[md5sum] = "1f6ac4910dc8bb0276549bd0308f8acb"
+SRC_URI[sha256sum] = "6b7448359284f5af75cbb7027c47616b28aca8b90f9a16b9ec954fa50e455ed3"
diff --git a/recipes/obsolete/galago/files/no-check.patch b/recipes/obsolete/galago/files/no-check.patch
new file mode 100644
index 0000000..89b0eaf
--- /dev/null
+++ b/recipes/obsolete/galago/files/no-check.patch
@@ -0,0 +1,15 @@
+--- /tmp/configure.ac	2005-09-08 21:38:49.316449440 +0200
++++ libgalago-0.3.3/configure.ac	2005-09-08 21:39:32.697854464 +0200
+@@ -198,11 +198,8 @@
+ dnl #
+ dnl # Check for Check
+ dnl #
+-AM_PATH_CHECK(, [have_check="yes"],
+-[
+-	AC_MSG_WARN([Check not found; cannot run some unit tests])
+ 	have_check="no"
+-])
++
+ 
+ AM_CONDITIONAL(HAVE_CHECK, test "$have_check" = "yes")
+ 
diff --git a/recipes/obsolete/galago/galago-daemon_0.3.4.bb b/recipes/obsolete/galago/galago-daemon_0.3.4.bb
new file mode 100644
index 0000000..84c0885
--- /dev/null
+++ b/recipes/obsolete/galago/galago-daemon_0.3.4.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Galago is a desktop presence framework, designed to transmit presence information between programs."
+HOMEPAGE = "http://www.galago-project.org/"
+LICENSE = "GPL"
+DEPENDS = "gettext libgalago dbus glib-2.0"
+PR = "r1"
+
+SRC_URI = "http://www.galago-project.org/files/releases/source/${PN}/${P}.tar.gz \
+           file://no-check.patch"
+EXTRA_OECONF =	"--disable-binreloc"
+
+FILES_${PN} += "${datadir}/dbus-1/services/"
+
+inherit autotools pkgconfig
+
+
+SRC_URI[md5sum] = "958ea4a9e1be61cb5e5f35f75a9bfede"
+SRC_URI[sha256sum] = "958ae2ddc89d218e7b3fe4f00a61f4ade48c8fefa768854c67425f5495387eed"
diff --git a/recipes/obsolete/galago/libgalago_0.3.3.bb b/recipes/obsolete/galago/libgalago_0.3.3.bb
new file mode 100644
index 0000000..8c1ef61
--- /dev/null
+++ b/recipes/obsolete/galago/libgalago_0.3.3.bb
@@ -0,0 +1,20 @@
+DESCRIPTION =	"Galago is a desktop presence framework, designed to transmit presence information between programs."
+HOMEPAGE =	"http://www.galago-project.org/"
+LICENSE =	"LGPL"
+DEPENDS = 	"gettext dbus glib-2.0"
+PR =		"r1"
+
+
+SRC_URI =	"http://www.galago-project.org/files/releases/source/${PN}/${P}.tar.gz \
+		 file://no-check.patch"
+
+inherit autotools pkgconfig
+
+do_stage() {
+	autotools_stage_includes
+	install -d ${STAGING_LIBDIR}
+	install -m 755 libgalago/.libs/libgalago.so.1.0.0 ${STAGING_LIBDIR}/libgalago.so
+}
+
+SRC_URI[md5sum] = "94d5223445deb1ed95973424d4958386"
+SRC_URI[sha256sum] = "148bc83e4ab6e87a6f26b60efdffc1258752a42079783e6f2b080f287e8b15fc"
-- 
1.7.1



