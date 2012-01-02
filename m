Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rhr6i-0004M1-3m
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jan 2012 00:15:56 +0100
Received: (qmail invoked by alias); 02 Jan 2012 23:08:35 -0000
Received: from p5B0A271B.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.39.27]
	by mail.gmx.net (mp029) with SMTP; 03 Jan 2012 00:08:35 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18PNOcDrt8PdH7GShpo0pJAsKs84X5G8ywB5MyCMF
	ZYqykR56MCItmz
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jan 2012 00:09:39 +0100
Message-Id: <1325545779-30547-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe] udisks: add native systemd support
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
X-List-Received-Date: Mon, 02 Jan 2012 23:15:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../udisks/udisks/add-systemd-support.patch        |  112 ++++++++++++++++++++
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   14 ++-
 2 files changed, 123 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch

diff --git a/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch b/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
new file mode 100644
index 0000000..29df8a4
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
@@ -0,0 +1,112 @@
+From 7a485d491697906b445020dfcb37fe91806d7134 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 22 Jul 2010 02:20:22 +0200
+Subject: [PATCH] systemd: install systemd unit files
+Upstream-Status: ?
+Based on: https://www.libreoffice.org/bugzilla/show_bug.cgi?id=29205
+---
+ Makefile.am                            |    5 ++++-
+ configure.ac                           |    9 +++++++++
+ data/.gitignore                        |    1 +
+ data/Makefile.am                       |   11 ++++++++++-
+ data/org.freedesktop.UDisks.service.in |    2 +-
+ data/udisks-daemon.service.in          |   12 ++++++++++++
+ 6 files changed, 37 insertions(+), 3 deletions(-)
+ create mode 100644 data/udisks-daemon.service.in
+
+diff --git a/Makefile.am b/Makefile.am
+index 588f05d..c3aaeea 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -24,7 +24,10 @@ EXTRA_DIST = 			\
+ 	ChangeLog
+ 
+ # xsltproc barfs on 'make distcheck'; disable for now
+-DISTCHECK_CONFIGURE_FLAGS=--disable-man-pages --disable-gtk-doc
++DISTCHECK_CONFIGURE_FLAGS = \
++	--disable-man-pages \
++	--disable-gtk-doc \
++	--with-systemdsystemunitdir=$$dc_install_base/$(systemdsystemunitdir)
+ 
+ clean-local :
+ 	rm -f *~
+diff --git a/configure.ac b/configure.ac
+index a9141bf..39bbd7a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -232,6 +232,15 @@ AC_SUBST([GETTEXT_PACKAGE])
+ AM_GLIB_GNU_GETTEXT
+ AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],["$GETTEXT_PACKAGE"],[gettext domain])
+ 
++# systemd
++
++AC_ARG_WITH([systemdsystemunitdir],
++        AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [Directory for systemd service files]),
++        [],
++        [with_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)])
++AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir])
++AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir"])
++
+ AC_OUTPUT([
+ Makefile
+ data/Makefile
+diff --git a/data/Makefile.am b/data/Makefile.am
+index ca6d8ac..bf5c1a7 100644
+--- a/data/Makefile.am
++++ b/data/Makefile.am
+@@ -35,6 +35,14 @@ avahiservicedir = $(sysconfdir)/avahi/services
+ avahiservice_DATA = udisks.service
+ endif # REMOTE_ACCESS_ENABLED
+ 
++if HAVE_SYSTEMD
++systemdsystemunit_DATA = \
++	udisks-daemon.service
++
++udisks-daemon.service: udisks-daemon.service.in
++	@sed -e "s|\@libexecdir\@|$(libexecdir)|" $< > $@
++endif
++
+ EXTRA_DIST = 						\
+ 	80-udisks.rules					\
+ 	$(dbusif_DATA)					\
+@@ -42,7 +50,8 @@ EXTRA_DIST = 						\
+ 	$(dbusconf_in_files)				\
+ 	udisks.pc.in					\
+ 	udisks.service					\
++	udisks-daemon.service.in                        \
+ 	$(NULL)
+ 
+ clean-local :
+-	rm -f *~ $(service_DATA) $(dbusconf_DATA)
++	rm -f *~ $(service_DATA) $(dbusconf_DATA) udisks-daemon.service
+diff --git a/data/org.freedesktop.UDisks.service.in b/data/org.freedesktop.UDisks.service.in
+index b3606a6..6ba2cd0 100644
+--- a/data/org.freedesktop.UDisks.service.in
++++ b/data/org.freedesktop.UDisks.service.in
+@@ -2,4 +2,4 @@
+ Name=org.freedesktop.UDisks
+ Exec=@libexecdir@/udisks-daemon
+ User=root
+-
++SystemdService=udisks-daemon.service
+diff --git a/data/udisks-daemon.service.in b/data/udisks-daemon.service.in
+new file mode 100644
+index 0000000..78379b2
+--- /dev/null
++++ b/data/udisks-daemon.service.in
+@@ -0,0 +1,12 @@
++[Unit]
++Description=Disk Manager
++After=syslog.target
++
++[Service]
++Type=dbus
++BusName=org.freedesktop.UDisks
++ExecStart=@libexecdir@/udisks-daemon
++StandardOutput=syslog
++
++[Install]
++WantedBy=graphical.target
+-- 
+1.7.0.1
+
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index 099ff8f..c3e2664 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -6,15 +6,23 @@ DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
 # optional dependencies: device-mapper parted
 
 SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
+           file://add-systemd-support.patch \
            file://optional-depends.patch"
 
 SRC_URI[udisks.md5sum] = "86c63b2b5484f2060499a052b5b6256b"
 SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
 
-inherit autotools
+PR = "r1"
 
-# No docbook-xsl-native recipe available
-EXTRA_OECONF = "--enable-man-pages=no"
+inherit autotools systemd
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "udisks-daemon.service"
+
+PACKAGES =+ "${PN}-systemd"
+
+FILES_${PN}-systemd = "${base_libdir}/systemd/system/"
+RDEPENDS_${PN}-systemd = "${PN}"
 
 FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
                 ${datadir}/dbus-1/ \
-- 
1.7.4.4



