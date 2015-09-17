Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id AC32576FDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:50 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so96408612wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=1fh9x+bmJw9vtoizS2GIJ4DwGstMlbboT48ao7nwji4=;
	b=inMyC4zDm7bqyLPW6P+1QGdYTpNknEVqQkqUPnDTXDVSl/ig0CktASUikTh7cWUCKo
	k02hNTQbuQWt6tWNlLsnArJ7piK6dSj0GA9s3ehKAynrRw9mvSS/Trb+RSlMeQLBzcvp
	w+ev9W3qoJl0aNsWKyEN8R7BoUduMP12XbdLKJLewjyUjfXmFdRPpU7+3FLjWHF/CeKh
	OXGJRoxA3O5m8FymEY9AZh5RhxLe0RNO7lFsuHRsNxpkeqSuQZPbxnd0rV7KVSe5eSiQ
	j6iV44626otvzYY3LWBSuet7RZ+Y8VAp0DcnvgLeE//4NUnfXs4e6/KqFxWkor/6OnSK
	RvAg==
X-Received: by 10.180.23.194 with SMTP id o2mr11517210wif.48.1442450510650;
	Wed, 16 Sep 2015 17:41:50 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:21 +0200
Message-Id: <1442450491-14912-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/19] udisks: update to 1.05 and fix build with latest glibc-version
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From News:
This version fixes a security vulnerability (CVE-2014-0004), so please update
as soon as possible!

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-fix-build-with-newer-glibc-versions.patch |  29 ++++++
 .../udisks/udisks/add-systemd-support.patch        | 112 ---------------------
 .../udisks/udisks-1.0.5-fix-service-file.patch     |  33 ++++++
 .../udisks/{udisks_1.0.4.bb => udisks_1.0.5.bb}    |  20 ++--
 4 files changed, 72 insertions(+), 122 deletions(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch
 rename meta-oe/recipes-support/udisks/{udisks_1.0.4.bb => udisks_1.0.5.bb} (66%)

diff --git a/meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch b/meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch
new file mode 100644
index 0000000..520655a
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch
@@ -0,0 +1,29 @@
+From 9829152b12a8924d2e091a00133ed1a3a7ba75c0 Mon Sep 17 00:00:00 2001
+From: Alexandre Rostovtsev <tetromino@gentoo.org>
+Date: Fri, 29 May 2015 21:09:39 -0400
+Subject: [PATCH] fix build with newer glibc versions
+
+https://bugs.freedesktop.org/show_bug.cgi?id=90778
+
+Upstream-Status: Applied [1]
+
+[1] http://cgit.freedesktop.org/udisks/commit/?h=udisks1&id=9829152b12a8924d2e091a00133ed1a3a7ba75c0
+---
+ src/helpers/job-drive-detach.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/helpers/job-drive-detach.c b/src/helpers/job-drive-detach.c
+index eeafcab..d122a1f 100644
+--- a/src/helpers/job-drive-detach.c
++++ b/src/helpers/job-drive-detach.c
+@@ -18,6 +18,7 @@
+  *
+  */
+ 
++#include <sys/stat.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <errno.h>
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch b/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
deleted file mode 100644
index 29df8a4..0000000
--- a/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 7a485d491697906b445020dfcb37fe91806d7134 Mon Sep 17 00:00:00 2001
-From: Lennart Poettering <lennart@poettering.net>
-Date: Thu, 22 Jul 2010 02:20:22 +0200
-Subject: [PATCH] systemd: install systemd unit files
-Upstream-Status: ?
-Based on: https://www.libreoffice.org/bugzilla/show_bug.cgi?id=29205
----
- Makefile.am                            |    5 ++++-
- configure.ac                           |    9 +++++++++
- data/.gitignore                        |    1 +
- data/Makefile.am                       |   11 ++++++++++-
- data/org.freedesktop.UDisks.service.in |    2 +-
- data/udisks-daemon.service.in          |   12 ++++++++++++
- 6 files changed, 37 insertions(+), 3 deletions(-)
- create mode 100644 data/udisks-daemon.service.in
-
-diff --git a/Makefile.am b/Makefile.am
-index 588f05d..c3aaeea 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -24,7 +24,10 @@ EXTRA_DIST = 			\
- 	ChangeLog
- 
- # xsltproc barfs on 'make distcheck'; disable for now
--DISTCHECK_CONFIGURE_FLAGS=--disable-man-pages --disable-gtk-doc
-+DISTCHECK_CONFIGURE_FLAGS = \
-+	--disable-man-pages \
-+	--disable-gtk-doc \
-+	--with-systemdsystemunitdir=$$dc_install_base/$(systemdsystemunitdir)
- 
- clean-local :
- 	rm -f *~
-diff --git a/configure.ac b/configure.ac
-index a9141bf..39bbd7a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -232,6 +232,15 @@ AC_SUBST([GETTEXT_PACKAGE])
- AM_GLIB_GNU_GETTEXT
- AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],["$GETTEXT_PACKAGE"],[gettext domain])
- 
-+# systemd
-+
-+AC_ARG_WITH([systemdsystemunitdir],
-+        AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [Directory for systemd service files]),
-+        [],
-+        [with_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)])
-+AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir])
-+AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir"])
-+
- AC_OUTPUT([
- Makefile
- data/Makefile
-diff --git a/data/Makefile.am b/data/Makefile.am
-index ca6d8ac..bf5c1a7 100644
---- a/data/Makefile.am
-+++ b/data/Makefile.am
-@@ -35,6 +35,14 @@ avahiservicedir = $(sysconfdir)/avahi/services
- avahiservice_DATA = udisks.service
- endif # REMOTE_ACCESS_ENABLED
- 
-+if HAVE_SYSTEMD
-+systemdsystemunit_DATA = \
-+	udisks-daemon.service
-+
-+udisks-daemon.service: udisks-daemon.service.in
-+	@sed -e "s|\@libexecdir\@|$(libexecdir)|" $< > $@
-+endif
-+
- EXTRA_DIST = 						\
- 	80-udisks.rules					\
- 	$(dbusif_DATA)					\
-@@ -42,7 +50,8 @@ EXTRA_DIST = 						\
- 	$(dbusconf_in_files)				\
- 	udisks.pc.in					\
- 	udisks.service					\
-+	udisks-daemon.service.in                        \
- 	$(NULL)
- 
- clean-local :
--	rm -f *~ $(service_DATA) $(dbusconf_DATA)
-+	rm -f *~ $(service_DATA) $(dbusconf_DATA) udisks-daemon.service
-diff --git a/data/org.freedesktop.UDisks.service.in b/data/org.freedesktop.UDisks.service.in
-index b3606a6..6ba2cd0 100644
---- a/data/org.freedesktop.UDisks.service.in
-+++ b/data/org.freedesktop.UDisks.service.in
-@@ -2,4 +2,4 @@
- Name=org.freedesktop.UDisks
- Exec=@libexecdir@/udisks-daemon
- User=root
--
-+SystemdService=udisks-daemon.service
-diff --git a/data/udisks-daemon.service.in b/data/udisks-daemon.service.in
-new file mode 100644
-index 0000000..78379b2
---- /dev/null
-+++ b/data/udisks-daemon.service.in
-@@ -0,0 +1,12 @@
-+[Unit]
-+Description=Disk Manager
-+After=syslog.target
-+
-+[Service]
-+Type=dbus
-+BusName=org.freedesktop.UDisks
-+ExecStart=@libexecdir@/udisks-daemon
-+StandardOutput=syslog
-+
-+[Install]
-+WantedBy=graphical.target
--- 
-1.7.0.1
-
diff --git a/meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch b/meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch
new file mode 100644
index 0000000..d5e84d3
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch
@@ -0,0 +1,33 @@
+From 7d61ad048856ee239870b917d6933e3ad63f0789 Mon Sep 17 00:00:00 2001
+From: David King <amigadave@amigadave.com>
+Date: Thu, 2 Jul 2015 13:49:22 +0100
+Subject: [PATCH] Fix systemd service file
+
+udisks-daemon is installed to $(libexecdir), not $(prefix)/lib/udisks.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1238664
+https://bugs.freedesktop.org/show_bug.cgi?id=91191
+
+Taken-From: [1]
+[1] http://pkgs.fedoraproject.org/cgit/udisks.git/tree/udisks-1.0.5-fix-service-file.patch
+
+Upstream-Status: Pending
+---
+ data/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/data/Makefile.am b/data/Makefile.am
+index 411ea0f..08af5f4 100644
+--- a/data/Makefile.am
++++ b/data/Makefile.am
+@@ -31,7 +31,7 @@ systemdservicedir       = $(systemdsystemunitdir)
+ systemdservice_DATA     = $(systemdservice_in_files:.service.in=.service)
+ 
+ $(systemdservice_DATA): $(systemdservice_in_files) Makefile
+-	@sed -e "s|\@libexecdir\@|$(prefix)/lib/udisks|" $< > $@
++	@sed -e "s|\@libexecdir\@|$(libexecdir)|" $< > $@
+ endif
+ 
+ udevrulesdir = $(slashlibdir)/udev/rules.d
+-- 
+2.4.5
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
similarity index 66%
rename from meta-oe/recipes-support/udisks/udisks_1.0.4.bb
rename to meta-oe/recipes-support/udisks/udisks_1.0.5.bb
index 9923d60..8ddc20d 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
@@ -7,17 +7,17 @@ DEPENDS = "libatasmart sg3-utils polkit libgudev dbus-glib glib-2.0 intltool-nat
 
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
-SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
-           file://optional-depends.patch"
-
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'systemd', 'file://add-systemd-support.patch', '', d)}"
-
-SRC_URI[udisks.md5sum] = "86c63b2b5484f2060499a052b5b6256b"
-SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
+SRC_URI = " \
+    http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
+    file://optional-depends.patch \
+    file://0001-fix-build-with-newer-glibc-versions.patch \
+    file://udisks-1.0.5-fix-service-file.patch \
+"
 
-PR = "r9"
+SRC_URI[udisks.md5sum] = "70d48dcfe523a74cd7c7fbbc2847fcdd"
+SRC_URI[udisks.sha256sum] = "f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71"
 
-inherit autotools systemd gtk-doc
+inherit autotools-brokensep systemd gtk-doc
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[parted] = "--enable-parted,--disable-parted,parted"
@@ -35,5 +35,5 @@ FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug"
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "udisks-daemon.service"
+SYSTEMD_SERVICE_${PN} = "udisks.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.1.0


