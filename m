Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Neax7-0004T1-Pi
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:33 +0100
Received: by fxm27 with SMTP id 27so1137680fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=YoaSHCli0bxyKIyt1lIK6EKru1kkT+DRiaJ9yusHZl4=;
	b=MDcELf8BLVe/Vm46gT6SJMPueig+Mr2JaL+84mPAh6B9wmioU62PefBnqqIBWScPOp
	2qTa/1bXWIApNPY1jPgm6puQv4hdDAmWvQmHQ2OrRIbOkAEnabtT1UPAczDyGsHyk3BI
	zrlSnC8xewccyC6VlcpVkJpDW5jaySoGYgXME=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Py07e92J6tj02P3mW+JC0dCQYzow3O0PDHcPoJ/tOyQ27y1S5zEN3ByBbDxlflhF06
	7h4kndUoIQxdZYGK/6OG0cxT6P2lRmNKqH2Tqm0F2M/FjIAdrd2RaXqBJUXCmmt3Hvoz
	P0yYpaEtu6uD6hmK5/lnngKnXOzLzlftfFvzI=
Received: by 10.223.15.148 with SMTP id k20mr2373539faa.67.1265663577881;
	Mon, 08 Feb 2010 13:12:57 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id b17sm7253078fka.46.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004G9-D4; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:24 +0100
Message-Id: <1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 03/12] osso-application-installer: nonworking
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:33 -0000

osso-application-installer depends on nonworking hildon-lgpl

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 .../fix-buildsystem.patch                          |   65 --------------------
 .../maemo/osso-application-installer_1.0.03-1.bb   |   19 ------
 .../fix-buildsystem.patch                          |   65 ++++++++++++++++++++
 .../osso-application-installer_1.0.03-1.bb         |   19 ++++++
 4 files changed, 84 insertions(+), 84 deletions(-)
 delete mode 100644 recipes/maemo/osso-application-installer/fix-buildsystem.patch
 delete mode 100644 recipes/maemo/osso-application-installer_1.0.03-1.bb
 create mode 100644 recipes/nonworking/osso-application-installer/fix-buildsystem.patch
 create mode 100644 recipes/nonworking/osso-application-installer/osso-application-installer_1.0.03-1.bb

diff --git a/recipes/maemo/osso-application-installer/fix-buildsystem.patch b/recipes/maemo/osso-application-installer/fix-buildsystem.patch
deleted file mode 100644
index d89522b..0000000
--- a/recipes/maemo/osso-application-installer/fix-buildsystem.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-diff -urbB osso-application-installer-1.0.03_old/configure.ac osso-application-installer-1.0.03/configure.ac
---- osso-application-installer-1.0.03_old/configure.ac	2005-05-22 22:06:52.000000000 +0200
-+++ osso-application-installer-1.0.03/configure.ac	2005-06-30 12:19:24.000000000 +0200
-@@ -38,9 +38,9 @@
- AC_SUBST(CP_CFLAGS)
- AC_SUBST(CP_LIBS)
- 
--cp_pluginlibdir=`pkg-config hildon-control-panel --variable=pluginlibdir`
-+cp_pluginlibdir=${libdir}/hildon-control-panel
- AC_SUBST(cp_pluginlibdir)
--cp_plugindesktopdir=`pkg-config hildon-control-panel --variable=plugindesktopentrydir`
-+cp_plugindesktopdir=${datadir}/applications/hildon-control-panel
- AC_SUBST(cp_plugindesktopdir)
- 
- # Localisation-related
-@@ -52,12 +52,12 @@
- AM_GLIB_GNU_GETTEXT
- 
- # Mime crap
--dnl MIME-type registration check (2.6 / 2.8 version)
--AC_PATH_PROG(UPDATE_MIME_DATABASE, update-mime-database, no)
--AM_CONDITIONAL(HAVE_26_MIME, test x$UPDATE_MIME_DATABASE != xno)
-+#dnl MIME-type registration check (2.6 / 2.8 version)
-+#AC_PATH_PROG(UPDATE_MIME_DATABASE, update-mime-database, no)
-+#AM_CONDITIONAL(HAVE_26_MIME, test x$UPDATE_MIME_DATABASE != xno)
- 
--AC_PATH_PROG(UPDATE_DESKTOP_DATABASE, update-desktop-database, no)
--AM_CONDITIONAL(HAVE_28_MIME, test x$UPDATE_DESKTOP_DATABASE != xno)
-+#AC_PATH_PROG(UPDATE_DESKTOP_DATABASE, update-desktop-database, no)
-+#AM_CONDITIONAL(HAVE_28_MIME, test x$UPDATE_DESKTOP_DATABASE != xno)
- 
- 
- applicationinstallerlocaledir=${datadir}/locale
-@@ -76,7 +76,7 @@
- AC_SUBST(hildonpixmapdir)
- AC_SUBST(hildonstatusbarlibdir)
- 
--dbuslibpathdir=`$PKG_CONFIG --variable=libdir dbus-1`
-+dbuslibpathdir=${libdir}
- dbusconfdir=/etc/dbus-1/system.d
- dbusservdir=${dbuslibpathdir}/dbus-1.0/services
- AC_SUBST(dbuslibpathdir)
-diff -urbB osso-application-installer-1.0.03_old/mime/Makefile.am osso-application-installer-1.0.03/mime/Makefile.am
---- osso-application-installer-1.0.03_old/mime/Makefile.am	2005-05-22 22:06:52.000000000 +0200
-+++ osso-application-installer-1.0.03/mime/Makefile.am	2005-06-30 12:19:24.000000000 +0200
-@@ -2,19 +2,3 @@
- mime_DATA = osso-application-installer.xml
- 
- EXTRA_DIST = $(mime_DATA)
--
--install-data-hook:
--if HAVE_26_MIME
--	$(UPDATE_MIME_DATABASE) "$(DESTDIR)$(datadir)/mime"
--endif
--if HAVE_28_MIME
--	$(UPDATE_DESKTOP_DATABASE)
--endif
--
--uninstall-hook:
--if HAVE_26_MIME
--	$(UPDATE_MIME_DATABASE) "$(DESTDIR)$(datadir)/mime"
--endif
--if HAVE_28_MIME
--	$(UPDATE_DESKTOP_DATABASE) 
--endif
diff --git a/recipes/maemo/osso-application-installer_1.0.03-1.bb b/recipes/maemo/osso-application-installer_1.0.03-1.bb
deleted file mode 100644
index 7380255..0000000
--- a/recipes/maemo/osso-application-installer_1.0.03-1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-PR         = "r0"
-LICENSE    = "GPL"
-
-DEPENDS = "hildon-lgpl hildon-base-lib libosso hildon-libs hildon-control-panel shared-mime-info"
-RDEPENDS = "shared-mime-info"
-
-SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/o/${PN}/${PN}_${PV}.tar.gz \
-           file://fix-buildsystem.patch;patch=1"
-
-S = "${WORKDIR}/osso-application-installer-1.0.03"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += "${libdir}/dbus-1.0 ${libdir}/hildon-control-panel/*.so ${datadir}/applications ${datadir}/mime"
-
-pkg_postinst () {
-  echo "Updating MIME database... this may take a while."
-  ${bindir}/update-mime-database ${datadir}/mime
-}
diff --git a/recipes/nonworking/osso-application-installer/fix-buildsystem.patch b/recipes/nonworking/osso-application-installer/fix-buildsystem.patch
new file mode 100644
index 0000000..d89522b
--- /dev/null
+++ b/recipes/nonworking/osso-application-installer/fix-buildsystem.patch
@@ -0,0 +1,65 @@
+diff -urbB osso-application-installer-1.0.03_old/configure.ac osso-application-installer-1.0.03/configure.ac
+--- osso-application-installer-1.0.03_old/configure.ac	2005-05-22 22:06:52.000000000 +0200
++++ osso-application-installer-1.0.03/configure.ac	2005-06-30 12:19:24.000000000 +0200
+@@ -38,9 +38,9 @@
+ AC_SUBST(CP_CFLAGS)
+ AC_SUBST(CP_LIBS)
+ 
+-cp_pluginlibdir=`pkg-config hildon-control-panel --variable=pluginlibdir`
++cp_pluginlibdir=${libdir}/hildon-control-panel
+ AC_SUBST(cp_pluginlibdir)
+-cp_plugindesktopdir=`pkg-config hildon-control-panel --variable=plugindesktopentrydir`
++cp_plugindesktopdir=${datadir}/applications/hildon-control-panel
+ AC_SUBST(cp_plugindesktopdir)
+ 
+ # Localisation-related
+@@ -52,12 +52,12 @@
+ AM_GLIB_GNU_GETTEXT
+ 
+ # Mime crap
+-dnl MIME-type registration check (2.6 / 2.8 version)
+-AC_PATH_PROG(UPDATE_MIME_DATABASE, update-mime-database, no)
+-AM_CONDITIONAL(HAVE_26_MIME, test x$UPDATE_MIME_DATABASE != xno)
++#dnl MIME-type registration check (2.6 / 2.8 version)
++#AC_PATH_PROG(UPDATE_MIME_DATABASE, update-mime-database, no)
++#AM_CONDITIONAL(HAVE_26_MIME, test x$UPDATE_MIME_DATABASE != xno)
+ 
+-AC_PATH_PROG(UPDATE_DESKTOP_DATABASE, update-desktop-database, no)
+-AM_CONDITIONAL(HAVE_28_MIME, test x$UPDATE_DESKTOP_DATABASE != xno)
++#AC_PATH_PROG(UPDATE_DESKTOP_DATABASE, update-desktop-database, no)
++#AM_CONDITIONAL(HAVE_28_MIME, test x$UPDATE_DESKTOP_DATABASE != xno)
+ 
+ 
+ applicationinstallerlocaledir=${datadir}/locale
+@@ -76,7 +76,7 @@
+ AC_SUBST(hildonpixmapdir)
+ AC_SUBST(hildonstatusbarlibdir)
+ 
+-dbuslibpathdir=`$PKG_CONFIG --variable=libdir dbus-1`
++dbuslibpathdir=${libdir}
+ dbusconfdir=/etc/dbus-1/system.d
+ dbusservdir=${dbuslibpathdir}/dbus-1.0/services
+ AC_SUBST(dbuslibpathdir)
+diff -urbB osso-application-installer-1.0.03_old/mime/Makefile.am osso-application-installer-1.0.03/mime/Makefile.am
+--- osso-application-installer-1.0.03_old/mime/Makefile.am	2005-05-22 22:06:52.000000000 +0200
++++ osso-application-installer-1.0.03/mime/Makefile.am	2005-06-30 12:19:24.000000000 +0200
+@@ -2,19 +2,3 @@
+ mime_DATA = osso-application-installer.xml
+ 
+ EXTRA_DIST = $(mime_DATA)
+-
+-install-data-hook:
+-if HAVE_26_MIME
+-	$(UPDATE_MIME_DATABASE) "$(DESTDIR)$(datadir)/mime"
+-endif
+-if HAVE_28_MIME
+-	$(UPDATE_DESKTOP_DATABASE)
+-endif
+-
+-uninstall-hook:
+-if HAVE_26_MIME
+-	$(UPDATE_MIME_DATABASE) "$(DESTDIR)$(datadir)/mime"
+-endif
+-if HAVE_28_MIME
+-	$(UPDATE_DESKTOP_DATABASE) 
+-endif
diff --git a/recipes/nonworking/osso-application-installer/osso-application-installer_1.0.03-1.bb b/recipes/nonworking/osso-application-installer/osso-application-installer_1.0.03-1.bb
new file mode 100644
index 0000000..7380255
--- /dev/null
+++ b/recipes/nonworking/osso-application-installer/osso-application-installer_1.0.03-1.bb
@@ -0,0 +1,19 @@
+PR         = "r0"
+LICENSE    = "GPL"
+
+DEPENDS = "hildon-lgpl hildon-base-lib libosso hildon-libs hildon-control-panel shared-mime-info"
+RDEPENDS = "shared-mime-info"
+
+SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/o/${PN}/${PN}_${PV}.tar.gz \
+           file://fix-buildsystem.patch;patch=1"
+
+S = "${WORKDIR}/osso-application-installer-1.0.03"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "${libdir}/dbus-1.0 ${libdir}/hildon-control-panel/*.so ${datadir}/applications ${datadir}/mime"
+
+pkg_postinst () {
+  echo "Updating MIME database... this may take a while."
+  ${bindir}/update-mime-database ${datadir}/mime
+}
-- 
1.6.5



