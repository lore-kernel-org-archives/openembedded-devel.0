Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NzzDL-0005D5-FN
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 23:24:42 +0200
Received: from fbcmmo06.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 23:21:13 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 8 Apr 2010 23:21:05 +0200
Received: from jcn ([82.59.101.2]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 8 Apr 2010 23:21:01 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nzz9o-0004m8-N5; Thu, 08 Apr 2010 23:21:00 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Apr 2010 23:20:57 +0200
Message-Id: <1270761657-18322-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <20100408162117.e7638f69.ospite@studenti.unina.it>
References: <20100408162117.e7638f69.ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 08 Apr 2010 21:21:01.0319 (UTC)
	FILETIME=[636A4970:01CAD761]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, RCVD_ILLEGAL_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] glib-2.0: remove old glib-2.0-native recipes
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
X-List-Received-Date: Thu, 08 Apr 2010 21:24:43 -0000

Having these around can cause some conflict in recipes depending on
recent glib-2.0-native, see [1].

What can happen is that, when no preferred versions are set (like in
DISTRO=minimal), bitbake picks up an older -native recipe even if a more
recent one using the BBCLASSEXTEND = "native" mechanism exists.

[1] http://tinderbox.openembedded.org/packages/540390/

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
Please check if the commit message is clear enough, I think I've figured
out what's happening behind the scenes, but I have not that deep
knowledge of bitbake.

Thanks,
   Antonio Ospite
   http://ao2.it


 .../glib-gettextize-dir.patch                      |   11 --
 recipes/glib-2.0/glib-2.0-native_2.12.4.bb         |   49 ----------
 recipes/glib-2.0/glib-2.0-native_2.16.1.bb         |   40 --------
 recipes/glib-2.0/glib-2.0-native_2.18.0.bb         |   40 --------
 recipes/glib-2.0/glib-2.0-native_2.2.3.bb          |  100 --------------------
 recipes/glib-2.0/glib-2.0-native_2.22.1.bb         |   39 --------
 recipes/glib-2.0/glib-2.0-native_2.4.6.bb          |   49 ----------
 recipes/glib-2.0/glib-2.0-native_2.6.5.bb          |   51 ----------
 recipes/glib-2.0/glib-2.0-native_2.6.6.bb          |   51 ----------
 9 files changed, 0 insertions(+), 430 deletions(-)
 delete mode 100644 recipes/glib-2.0/glib-2.0-native-2.12.4/glib-gettextize-dir.patch
 delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.12.4.bb
 delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.16.1.bb
 delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.18.0.bb
 delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.2.3.bb
 delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.22.1.bb
 delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.4.6.bb
 delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.6.5.bb
 delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.6.6.bb

diff --git a/recipes/glib-2.0/glib-2.0-native-2.12.4/glib-gettextize-dir.patch b/recipes/glib-2.0/glib-2.0-native-2.12.4/glib-gettextize-dir.patch
deleted file mode 100644
index efe3325..0000000
--- a/recipes/glib-2.0/glib-2.0-native-2.12.4/glib-gettextize-dir.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- glib-2.10.3/glib-gettextize.in.old	2006-06-21 12:46:45.000000000 +0100
-+++ glib-2.10.3/glib-gettextize.in	2006-06-21 12:48:14.000000000 +0100
-@@ -49,7 +49,7 @@
-     ;;
- esac
- 
--gettext_dir=$prefix/share/glib-2.0/gettext
-+gettext_dir=@datadir@/glib-2.0/gettext
- 
- while test $# -gt 0; do
-   case "$1" in
diff --git a/recipes/glib-2.0/glib-2.0-native_2.12.4.bb b/recipes/glib-2.0/glib-2.0-native_2.12.4.bb
deleted file mode 100644
index bfc1948..0000000
--- a/recipes/glib-2.0/glib-2.0-native_2.12.4.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-DESCRIPTION = "GLib is a general-purpose utility library, \
-which provides many useful data types, macros, \
-type conversions, string utilities, file utilities, a main \
-loop abstraction, and so on. It works on many \
-UNIX-like platforms, Windows, OS/2 and BeOS."
-LICENSE = "LGPL"
-SECTION = "libs"
-PRIORITY = "optional"
-DEPENDS += "gtk-doc-native"
-PR ="r1"
-
-EXTRA_OECONF = "--disable-debug"
-
-SRC_URI = "http://download.gnome.org/sources/glib/2.12/glib-${PV}.tar.bz2 \
-           file://glib-gettextize-dir.patch;patch=1 \
-           file://glibconfig-sysdefs.h"
-
-S = "${WORKDIR}/glib-${PV}"
-
-inherit autotools pkgconfig native gettext
-
-acpaths = ""
-do_configure_prepend () {
-	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h .
-}
-
-do_stage () {
-	install -m 0755 gobject/glib-mkenums ${STAGING_BINDIR}/
-	install -m 0755 gobject/.libs/glib-genmarshal ${STAGING_BINDIR}/
-	install -m 0755 glib-gettextize ${STAGING_BINDIR}/
-	oe_libinstall -so -C glib libglib-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gmodule libgmodule-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gthread libgthread-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gobject libgobject-2.0 ${STAGING_LIBDIR}
-	autotools_stage_includes
-	install -d ${STAGING_INCDIR}/glib-2.0/glib
-	install -m 0755 ${S}/glibconfig.h ${STAGING_INCDIR}/glib-2.0/glibconfig.h
-	install -d ${STAGING_DATADIR}/aclocal
-	install -m 0644 ${S}/m4macros/glib-2.0.m4 ${STAGING_DATADIR}/aclocal/glib-2.0.m4
-	install -m 0644 ${S}/m4macros/glib-gettext.m4 ${STAGING_DATADIR}/aclocal/glib-gettext.m4
-	install -d ${STAGING_DATADIR}/glib-2.0/gettext/po
-	install -m 0755 mkinstalldirs ${STAGING_DATADIR}/glib-2.0/gettext/
-	install -m 0644 po/Makefile.in.in ${STAGING_DATADIR}/glib-2.0/gettext/po/
-}
-
-do_install () {
-	:
-}
-
diff --git a/recipes/glib-2.0/glib-2.0-native_2.16.1.bb b/recipes/glib-2.0/glib-2.0-native_2.16.1.bb
deleted file mode 100644
index 8ad0c8a..0000000
--- a/recipes/glib-2.0/glib-2.0-native_2.16.1.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-require glib-2.0_${PV}.bb
-
-DEPENDS = "gtk-doc-native"
-EXTRA_OECONF = ""
-PR = "r3"
-
-inherit native
-
-do_configure_prepend() {
-    if [ -e ${S}/${TARGET_SYS}-libtool ] ; then
-		echo "${TARGET_SYS}-libtool already present"
-    else
-        cp ${STAGING_BINDIR}/${TARGET_SYS}-libtool ${S}
-    fi
-
-}
-
-do_stage () {
-	install -m 0755 gobject/glib-mkenums ${STAGING_BINDIR}/
-	install -m 0755 gobject/.libs/glib-genmarshal ${STAGING_BINDIR}/
-	install -m 0755 glib-gettextize ${STAGING_BINDIR}/
-	oe_libinstall -so -C glib libglib-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gmodule libgmodule-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gthread libgthread-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gobject libgobject-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gio libgio-2.0 ${STAGING_LIBDIR}
-	autotools_stage_includes
-	install -d ${STAGING_INCDIR}/glib-2.0/glib
-	install -m 0755 ${S}/glibconfig.h ${STAGING_INCDIR}/glib-2.0/glibconfig.h
-	install -d ${STAGING_DATADIR}/aclocal
-	install -m 0644 ${S}/m4macros/glib-2.0.m4 ${STAGING_DATADIR}/aclocal/glib-2.0.m4
-	install -m 0644 ${S}/m4macros/glib-gettext.m4 ${STAGING_DATADIR}/aclocal/glib-gettext.m4
-	install -d ${STAGING_DATADIR}/glib-2.0/gettext/po
-	install -m 0755 mkinstalldirs ${STAGING_DATADIR}/glib-2.0/gettext/
-	install -m 0644 po/Makefile.in.in ${STAGING_DATADIR}/glib-2.0/gettext/po/
-}
-
-do_install () {
-	:
-}
diff --git a/recipes/glib-2.0/glib-2.0-native_2.18.0.bb b/recipes/glib-2.0/glib-2.0-native_2.18.0.bb
deleted file mode 100644
index d267274..0000000
--- a/recipes/glib-2.0/glib-2.0-native_2.18.0.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-require glib-2.0_${PV}.bb
-
-DEPENDS = "gettext-native gtk-doc-native"
-EXTRA_OECONF = ""
-PR = "r4"
-
-inherit native
-
-do_configure_prepend() {
-    if [ -e ${S}/${TARGET_SYS}-libtool ] ; then
-		echo "${TARGET_SYS}-libtool already present"
-    else
-        cp ${STAGING_BINDIR}/${TARGET_SYS}-libtool ${S}
-    fi
-
-}
-
-do_stage () {
-	install -m 0755 gobject/glib-mkenums ${STAGING_BINDIR}/
-	install -m 0755 gobject/.libs/glib-genmarshal ${STAGING_BINDIR}/
-	install -m 0755 glib-gettextize ${STAGING_BINDIR}/
-	oe_libinstall -so -C glib libglib-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gmodule libgmodule-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gthread libgthread-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gobject libgobject-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gio libgio-2.0 ${STAGING_LIBDIR}
-	autotools_stage_includes
-	install -d ${STAGING_INCDIR}/glib-2.0/glib
-	install -m 0755 ${S}/glibconfig.h ${STAGING_INCDIR}/glib-2.0/glibconfig.h
-	install -d ${STAGING_DATADIR}/aclocal
-	install -m 0644 ${S}/m4macros/glib-2.0.m4 ${STAGING_DATADIR}/aclocal/glib-2.0.m4
-	install -m 0644 ${S}/m4macros/glib-gettext.m4 ${STAGING_DATADIR}/aclocal/glib-gettext.m4
-	install -d ${STAGING_DATADIR}/glib-2.0/gettext/po
-	install -m 0755 mkinstalldirs ${STAGING_DATADIR}/glib-2.0/gettext/
-	install -m 0644 po/Makefile.in.in ${STAGING_DATADIR}/glib-2.0/gettext/po/
-}
-
-do_install () {
-	:
-}
diff --git a/recipes/glib-2.0/glib-2.0-native_2.2.3.bb b/recipes/glib-2.0/glib-2.0-native_2.2.3.bb
deleted file mode 100644
index fe5ddff..0000000
--- a/recipes/glib-2.0/glib-2.0-native_2.2.3.bb
+++ /dev/null
@@ -1,100 +0,0 @@
-SECTION = "libs"
-LICENSE = "LGPL"
-DEPENDS = ""
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glib-2.0-${PV}"
-
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/glib/2.2/glib-${PV}.tar.bz2 \
-           file://automake-lossage.patch;patch=1 \
-           file://glibconfig-sysdefs.h \
-           file://configure-libtool.patch;patch=1"
-S = "${WORKDIR}/glib-${PV}"
-PR = "r1"
-
-inherit autotools  native
-
-acpaths = ""
-do_configure_prepend () {
-	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h .
-}
-
-do_stage () {
-	install -m 0755 gobject/glib-mkenums ${STAGING_BINDIR}/
-	install -m 0755 gobject/glib-genmarshal ${STAGING_BINDIR}/
-	oe_libinstall -so -C glib libglib-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gmodule libgmodule-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gthread libgthread-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gobject libgobject-2.0 ${STAGING_LIBDIR}
-	install -d ${STAGING_INCDIR}/glib-2.0/glib
-	install -m 0755 ${S}/glibconfig.h ${STAGING_INCDIR}/glib-2.0/glibconfig.h
-	install -m 0644 ${S}/glib/glib-object.h ${STAGING_INCDIR}/glib-2.0/glib-object.h
-	install -m 0644 ${S}/glib/glib.h ${STAGING_INCDIR}/glib-2.0/glib.h
-	install -m 0644 ${S}/gmodule/gmodule.h ${STAGING_INCDIR}/glib-2.0/gmodule.h
-	install -m 0644 ${S}/glib/galloca.h ${STAGING_INCDIR}/glib-2.0/glib/galloca.h
-	install -m 0644 ${S}/glib/garray.h ${STAGING_INCDIR}/glib-2.0/glib/garray.h
-	install -m 0644 ${S}/glib/gasyncqueue.h ${STAGING_INCDIR}/glib-2.0/glib/gasyncqueue.h
-	install -m 0644 ${S}/glib/gbacktrace.h ${STAGING_INCDIR}/glib-2.0/glib/gbacktrace.h
-	install -m 0644 ${S}/glib/gcache.h ${STAGING_INCDIR}/glib-2.0/glib/gcache.h
-	install -m 0644 ${S}/glib/gcompletion.h ${STAGING_INCDIR}/glib-2.0/glib/gcompletion.h
-	install -m 0644 ${S}/glib/gconvert.h ${STAGING_INCDIR}/glib-2.0/glib/gconvert.h
-	install -m 0644 ${S}/glib/gdataset.h ${STAGING_INCDIR}/glib-2.0/glib/gdataset.h
-	install -m 0644 ${S}/glib/gdate.h ${STAGING_INCDIR}/glib-2.0/glib/gdate.h
-	install -m 0644 ${S}/glib/gdir.h ${STAGING_INCDIR}/glib-2.0/glib/gdir.h
-	install -m 0644 ${S}/glib/gerror.h ${STAGING_INCDIR}/glib-2.0/glib/gerror.h
-	install -m 0644 ${S}/glib/gfileutils.h ${STAGING_INCDIR}/glib-2.0/glib/gfileutils.h
-	install -m 0644 ${S}/glib/ghash.h ${STAGING_INCDIR}/glib-2.0/glib/ghash.h
-	install -m 0644 ${S}/glib/ghook.h ${STAGING_INCDIR}/glib-2.0/glib/ghook.h
-	install -m 0644 ${S}/glib/giochannel.h ${STAGING_INCDIR}/glib-2.0/glib/giochannel.h
-	install -m 0644 ${S}/glib/glist.h ${STAGING_INCDIR}/glib-2.0/glib/glist.h
-	install -m 0644 ${S}/glib/gmacros.h ${STAGING_INCDIR}/glib-2.0/glib/gmacros.h
-	install -m 0644 ${S}/glib/gmain.h ${STAGING_INCDIR}/glib-2.0/glib/gmain.h
-	install -m 0644 ${S}/glib/gmarkup.h ${STAGING_INCDIR}/glib-2.0/glib/gmarkup.h
-	install -m 0644 ${S}/glib/gmem.h ${STAGING_INCDIR}/glib-2.0/glib/gmem.h
-	install -m 0644 ${S}/glib/gmessages.h ${STAGING_INCDIR}/glib-2.0/glib/gmessages.h
-	install -m 0644 ${S}/glib/gnode.h ${STAGING_INCDIR}/glib-2.0/glib/gnode.h
-	install -m 0644 ${S}/glib/gpattern.h ${STAGING_INCDIR}/glib-2.0/glib/gpattern.h
-	install -m 0644 ${S}/glib/gprimes.h ${STAGING_INCDIR}/glib-2.0/glib/gprimes.h
-	install -m 0644 ${S}/glib/gqsort.h ${STAGING_INCDIR}/glib-2.0/glib/gqsort.h
-	install -m 0644 ${S}/glib/gquark.h ${STAGING_INCDIR}/glib-2.0/glib/gquark.h
-	install -m 0644 ${S}/glib/gqueue.h ${STAGING_INCDIR}/glib-2.0/glib/gqueue.h
-	install -m 0644 ${S}/glib/grand.h ${STAGING_INCDIR}/glib-2.0/glib/grand.h
-	install -m 0644 ${S}/glib/grel.h ${STAGING_INCDIR}/glib-2.0/glib/grel.h
-	install -m 0644 ${S}/glib/gscanner.h ${STAGING_INCDIR}/glib-2.0/glib/gscanner.h
-	install -m 0644 ${S}/glib/gshell.h ${STAGING_INCDIR}/glib-2.0/glib/gshell.h
-	install -m 0644 ${S}/glib/gslist.h ${STAGING_INCDIR}/glib-2.0/glib/gslist.h
-	install -m 0644 ${S}/glib/gspawn.h ${STAGING_INCDIR}/glib-2.0/glib/gspawn.h
-	install -m 0644 ${S}/glib/gstrfuncs.h ${STAGING_INCDIR}/glib-2.0/glib/gstrfuncs.h
-	install -m 0644 ${S}/glib/gstring.h ${STAGING_INCDIR}/glib-2.0/glib/gstring.h
-	install -m 0644 ${S}/glib/gthread.h ${STAGING_INCDIR}/glib-2.0/glib/gthread.h
-	install -m 0644 ${S}/glib/gthreadpool.h ${STAGING_INCDIR}/glib-2.0/glib/gthreadpool.h
-	install -m 0644 ${S}/glib/gtimer.h ${STAGING_INCDIR}/glib-2.0/glib/gtimer.h
-	install -m 0644 ${S}/glib/gtree.h ${STAGING_INCDIR}/glib-2.0/glib/gtree.h
-	install -m 0644 ${S}/glib/gtypes.h ${STAGING_INCDIR}/glib-2.0/glib/gtypes.h
-	install -m 0644 ${S}/glib/gunicode.h ${STAGING_INCDIR}/glib-2.0/glib/gunicode.h
-	install -m 0644 ${S}/glib/gutils.h ${STAGING_INCDIR}/glib-2.0/glib/gutils.h
-	install -m 0644 ${S}/glib/gwin32.h ${STAGING_INCDIR}/glib-2.0/glib/gwin32.h
-	install -m 0644 ${S}/glib/gprintf.h ${STAGING_INCDIR}/glib-2.0/glib/gprintf.h
-	install -d ${STAGING_INCDIR}/glib-2.0/gobject
-	install -m 0644 ${S}/gobject/gboxed.h ${STAGING_INCDIR}/glib-2.0/gobject/gboxed.h
-	install -m 0644 ${S}/gobject/gclosure.h ${STAGING_INCDIR}/glib-2.0/gobject/gclosure.h
-	install -m 0644 ${S}/gobject/genums.h ${STAGING_INCDIR}/glib-2.0/gobject/genums.h
-	install -m 0644 ${S}/gobject/gobject.h ${STAGING_INCDIR}/glib-2.0/gobject/gobject.h
-	install -m 0644 ${S}/gobject/gparam.h ${STAGING_INCDIR}/glib-2.0/gobject/gparam.h
-	install -m 0644 ${S}/gobject/gparamspecs.h ${STAGING_INCDIR}/glib-2.0/gobject/gparamspecs.h
-	install -m 0644 ${S}/gobject/gsignal.h ${STAGING_INCDIR}/glib-2.0/gobject/gsignal.h
-	install -m 0644 ${S}/gobject/gsourceclosure.h ${STAGING_INCDIR}/glib-2.0/gobject/gsourceclosure.h
-	install -m 0644 ${S}/gobject/gtype.h ${STAGING_INCDIR}/glib-2.0/gobject/gtype.h
-	install -m 0644 ${S}/gobject/gtypemodule.h ${STAGING_INCDIR}/glib-2.0/gobject/gtypemodule.h
-	install -m 0644 ${S}/gobject/gtypeplugin.h ${STAGING_INCDIR}/glib-2.0/gobject/gtypeplugin.h
-	install -m 0644 ${S}/gobject/gvalue.h ${STAGING_INCDIR}/glib-2.0/gobject/gvalue.h
-	install -m 0644 ${S}/gobject/gvaluearray.h ${STAGING_INCDIR}/glib-2.0/gobject/gvaluearray.h
-	install -m 0644 ${S}/gobject/gvaluecollector.h ${STAGING_INCDIR}/glib-2.0/gobject/gvaluecollector.h
-	install -m 0644 ${S}/gobject/gvaluetypes.h ${STAGING_INCDIR}/glib-2.0/gobject/gvaluetypes.h
-	install -m 0644 ${S}/gobject/gobjectnotifyqueue.c ${STAGING_INCDIR}/glib-2.0/gobject/gobjectnotifyqueue.c
-	install -m 0644 ${S}/gobject/gmarshal.h ${STAGING_INCDIR}/glib-2.0/gobject/gmarshal.h
-	install -m 0644 ${S}/m4macros/glib-2.0.m4 ${STAGING_DATADIR}/aclocal/
-	install -m 0644 ${S}/m4macros/glib-gettext.m4 ${STAGING_DATADIR}/aclocal/
-}
-
-do_install () {
-	:
-}
diff --git a/recipes/glib-2.0/glib-2.0-native_2.22.1.bb b/recipes/glib-2.0/glib-2.0-native_2.22.1.bb
deleted file mode 100644
index 8d30d97..0000000
--- a/recipes/glib-2.0/glib-2.0-native_2.22.1.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-require glib-2.0_${PV}.bb
-
-DEPENDS = "gettext-native gtk-doc-native"
-EXTRA_OECONF = ""
-
-inherit native
-
-do_configure_prepend() {
-    if [ -e ${S}/${TARGET_SYS}-libtool ] ; then
-		echo "${TARGET_SYS}-libtool already present"
-    else
-        cp ${STAGING_BINDIR}/${TARGET_SYS}-libtool ${S}
-    fi
-
-}
-
-do_stage () {
-	install -m 0755 gobject/glib-mkenums ${STAGING_BINDIR}/
-	install -m 0755 gobject/.libs/glib-genmarshal ${STAGING_BINDIR}/
-	install -m 0755 glib-gettextize ${STAGING_BINDIR}/
-	oe_libinstall -so -C glib libglib-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gmodule libgmodule-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gthread libgthread-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gobject libgobject-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gio libgio-2.0 ${STAGING_LIBDIR}
-	autotools_stage_includes
-	install -d ${STAGING_INCDIR}/glib-2.0/glib
-	install -m 0755 ${S}/glibconfig.h ${STAGING_INCDIR}/glib-2.0/glibconfig.h
-	install -d ${STAGING_DATADIR}/aclocal
-	install -m 0644 ${S}/m4macros/glib-2.0.m4 ${STAGING_DATADIR}/aclocal/glib-2.0.m4
-	install -m 0644 ${S}/m4macros/glib-gettext.m4 ${STAGING_DATADIR}/aclocal/glib-gettext.m4
-	install -d ${STAGING_DATADIR}/glib-2.0/gettext/po
-	install -m 0755 mkinstalldirs ${STAGING_DATADIR}/glib-2.0/gettext/
-	install -m 0644 po/Makefile.in.in ${STAGING_DATADIR}/glib-2.0/gettext/po/
-}
-
-do_install () {
-	:
-}
diff --git a/recipes/glib-2.0/glib-2.0-native_2.4.6.bb b/recipes/glib-2.0/glib-2.0-native_2.4.6.bb
deleted file mode 100644
index 507ffed..0000000
--- a/recipes/glib-2.0/glib-2.0-native_2.4.6.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-DESCRIPTION = "GLib is a general-purpose utility library, \
-which provides many useful data types, macros, \
-type conversions, string utilities, file utilities, a main \
-loop abstraction, and so on. It works on many \
-UNIX-like platforms, Windows, OS/2 and BeOS."
-LICENSE = "LGPL"
-SECTION = "libs"
-PRIORITY = "optional"
-DEPENDS = "gtk-doc-native"
-PR = "r6"
-
-EXTRA_OECONF = "--disable-debug"
-
-SRC_URI = "ftp://ftp.gtk.org/pub/gtk/v2.4/glib-${PV}.tar.bz2 \
-           file://visibility.patch;patch=1 \
-           file://glibconfig-sysdefs.h \
-           file://configure-libtool.patch;patch=1"
-
-S = "${WORKDIR}/glib-${PV}"
-
-inherit autotools pkgconfig native gettext
-
-acpaths = ""
-do_configure_prepend () {
-	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h .
-}
-
-do_stage () {
-	install -m 0755 gobject/glib-mkenums ${STAGING_BINDIR}/
-	install -m 0755 gobject/.libs/glib-genmarshal ${STAGING_BINDIR}/
-	install -m 0755 glib-gettextize ${STAGING_BINDIR}/
-	oe_libinstall -so -C glib libglib-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gmodule libgmodule-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gthread libgthread-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gobject libgobject-2.0 ${STAGING_LIBDIR}
-	autotools_stage_includes
-	install -d ${STAGING_INCDIR}/glib-2.0/glib
-	install -m 0755 ${S}/glibconfig.h ${STAGING_INCDIR}/glib-2.0/glibconfig.h
-	install -d ${STAGING_DATADIR}/aclocal
-	install -m 0644 ${S}/m4macros/glib-2.0.m4 ${STAGING_DATADIR}/aclocal/glib-2.0.m4
-	install -m 0644 ${S}/m4macros/glib-gettext.m4 ${STAGING_DATADIR}/aclocal/glib-gettext.m4
-	install -d ${STAGING_DATADIR}/glib-2.0/gettext/po
-	install -m 0755 mkinstalldirs ${STAGING_DATADIR}/glib-2.0/gettext/
-	install -m 0644 po/Makefile.in.in ${STAGING_DATADIR}/glib-2.0/gettext/po/
-}
-
-do_install () {
-	:
-}
diff --git a/recipes/glib-2.0/glib-2.0-native_2.6.5.bb b/recipes/glib-2.0/glib-2.0-native_2.6.5.bb
deleted file mode 100644
index 0e47fec..0000000
--- a/recipes/glib-2.0/glib-2.0-native_2.6.5.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-DESCRIPTION = "GLib is a general-purpose utility library, \
-which provides many useful data types, macros, \
-type conversions, string utilities, file utilities, a main \
-loop abstraction, and so on. It works on many \
-UNIX-like platforms, Windows, OS/2 and BeOS."
-LICENSE = "LGPL"
-SECTION = "libs"
-PRIORITY = "optional"
-DEPENDS = "gtk-doc-native"
-PR = "r4"
-
-export PERL_PATH="/usr/bin/env perl"
-EXTRA_OECONF = "--disable-debug"
-
-SRC_URI = "ftp://ftp.gtk.org/pub/gtk/v2.6/glib-${PV}.tar.bz2 \
-	   file://glib-gettextize-dir.patch;patch=1 \
-	   file://glib-mkenums-nowarn.patch;patch=1 \
-           file://glibconfig-sysdefs.h \
-           file://configure-libtool.patch;patch=1"
-
-S = "${WORKDIR}/glib-${PV}"
-
-inherit autotools pkgconfig native gettext
-
-acpaths = ""
-do_configure_prepend () {
-	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h .
-}
-
-do_stage () {
-	install -m 0755 gobject/glib-mkenums ${STAGING_BINDIR}/
-	install -m 0755 gobject/.libs/glib-genmarshal ${STAGING_BINDIR}/
-	install -m 0755 glib-gettextize ${STAGING_BINDIR}/
-	oe_libinstall -so -C glib libglib-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gmodule libgmodule-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gthread libgthread-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gobject libgobject-2.0 ${STAGING_LIBDIR}
-	autotools_stage_includes
-	install -d ${STAGING_INCDIR}/glib-2.0/glib
-	install -m 0755 ${S}/glibconfig.h ${STAGING_INCDIR}/glib-2.0/glibconfig.h
-	install -d ${STAGING_DATADIR}/aclocal
-	install -m 0644 ${S}/m4macros/glib-2.0.m4 ${STAGING_DATADIR}/aclocal/glib-2.0.m4
-	install -m 0644 ${S}/m4macros/glib-gettext.m4 ${STAGING_DATADIR}/aclocal/glib-gettext.m4
-	install -d ${STAGING_DATADIR}/glib-2.0/gettext/po
-	install -m 0755 mkinstalldirs ${STAGING_DATADIR}/glib-2.0/gettext/
-	install -m 0644 po/Makefile.in.in ${STAGING_DATADIR}/glib-2.0/gettext/po/
-}
-
-do_install () {
-	:
-}
diff --git a/recipes/glib-2.0/glib-2.0-native_2.6.6.bb b/recipes/glib-2.0/glib-2.0-native_2.6.6.bb
deleted file mode 100644
index 0e47fec..0000000
--- a/recipes/glib-2.0/glib-2.0-native_2.6.6.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-DESCRIPTION = "GLib is a general-purpose utility library, \
-which provides many useful data types, macros, \
-type conversions, string utilities, file utilities, a main \
-loop abstraction, and so on. It works on many \
-UNIX-like platforms, Windows, OS/2 and BeOS."
-LICENSE = "LGPL"
-SECTION = "libs"
-PRIORITY = "optional"
-DEPENDS = "gtk-doc-native"
-PR = "r4"
-
-export PERL_PATH="/usr/bin/env perl"
-EXTRA_OECONF = "--disable-debug"
-
-SRC_URI = "ftp://ftp.gtk.org/pub/gtk/v2.6/glib-${PV}.tar.bz2 \
-	   file://glib-gettextize-dir.patch;patch=1 \
-	   file://glib-mkenums-nowarn.patch;patch=1 \
-           file://glibconfig-sysdefs.h \
-           file://configure-libtool.patch;patch=1"
-
-S = "${WORKDIR}/glib-${PV}"
-
-inherit autotools pkgconfig native gettext
-
-acpaths = ""
-do_configure_prepend () {
-	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h .
-}
-
-do_stage () {
-	install -m 0755 gobject/glib-mkenums ${STAGING_BINDIR}/
-	install -m 0755 gobject/.libs/glib-genmarshal ${STAGING_BINDIR}/
-	install -m 0755 glib-gettextize ${STAGING_BINDIR}/
-	oe_libinstall -so -C glib libglib-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gmodule libgmodule-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gthread libgthread-2.0 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gobject libgobject-2.0 ${STAGING_LIBDIR}
-	autotools_stage_includes
-	install -d ${STAGING_INCDIR}/glib-2.0/glib
-	install -m 0755 ${S}/glibconfig.h ${STAGING_INCDIR}/glib-2.0/glibconfig.h
-	install -d ${STAGING_DATADIR}/aclocal
-	install -m 0644 ${S}/m4macros/glib-2.0.m4 ${STAGING_DATADIR}/aclocal/glib-2.0.m4
-	install -m 0644 ${S}/m4macros/glib-gettext.m4 ${STAGING_DATADIR}/aclocal/glib-gettext.m4
-	install -d ${STAGING_DATADIR}/glib-2.0/gettext/po
-	install -m 0755 mkinstalldirs ${STAGING_DATADIR}/glib-2.0/gettext/
-	install -m 0644 po/Makefile.in.in ${STAGING_DATADIR}/glib-2.0/gettext/po/
-}
-
-do_install () {
-	:
-}
-- 
1.7.0.4



