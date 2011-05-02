Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QGoS1-0007EL-07
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 10:25:53 +0200
Received: by wye20 with SMTP id 20so4530510wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2011 01:23:13 -0700 (PDT)
Received: by 10.227.171.129 with SMTP id h1mr2277120wbz.96.1304324593388;
	Mon, 02 May 2011 01:23:13 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y29sm3229012wbd.21.2011.05.02.01.23.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 01:23:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 May 2011 10:22:53 +0200
Message-Id: <1304324573-31754-1-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH] systemd: update to v26
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
X-List-Received-Date: Mon, 02 May 2011 08:25:53 -0000

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/systemd/files/disable_xml_generation.patch |   36 --------
 recipes/systemd/files/execute.patch                |   17 ----
 recipes/systemd/files/getty-serial@.service        |   19 ----
 recipes/systemd/files/replace_accpet4.patch        |   26 ------
 recipes/systemd/files/systemadm.patch              |   13 ---
 ...-disable-xml-file-stuff-and-introspection.patch |   93 ++++++++++++++++++++
 recipes/systemd/systemd-v26/execute.patch          |   17 ++++
 recipes/systemd/systemd-v26/getty-serial@.service  |   19 ++++
 recipes/systemd/systemd-v26/replace_accpet4.patch  |   26 ++++++
 recipes/systemd/systemd-v26/systemadm.patch        |   13 +++
 recipes/systemd/systemd_git.bb                     |   26 ++++--
 11 files changed, 185 insertions(+), 120 deletions(-)
 delete mode 100644 recipes/systemd/files/disable_xml_generation.patch
 delete mode 100644 recipes/systemd/files/execute.patch
 delete mode 100644 recipes/systemd/files/getty-serial@.service
 delete mode 100644 recipes/systemd/files/replace_accpet4.patch
 delete mode 100644 recipes/systemd/files/systemadm.patch
 create mode 100644 recipes/systemd/systemd-v26/0001-systemd-disable-xml-file-stuff-and-introspection.patch
 create mode 100644 recipes/systemd/systemd-v26/execute.patch
 create mode 100644 recipes/systemd/systemd-v26/getty-serial@.service
 create mode 100644 recipes/systemd/systemd-v26/replace_accpet4.patch
 create mode 100644 recipes/systemd/systemd-v26/systemadm.patch

diff --git a/recipes/systemd/files/disable_xml_generation.patch b/recipes/systemd/files/disable_xml_generation.patch
deleted file mode 100644
index 47f36b8..0000000
--- a/recipes/systemd/files/disable_xml_generation.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am	2010-06-15 22:58:46.752961117 +0200
-+++ git/Makefile.am	2010-06-15 22:59:22.615040570 +0200
-@@ -75,21 +75,6 @@
- dist_udevrules_DATA = \
- 	src/99-systemd.rules
- 
--dbusinterface_DATA = \
--	org.freedesktop.systemd1.Manager.xml \
--	org.freedesktop.systemd1.Job.xml \
--	org.freedesktop.systemd1.Unit.xml \
--	org.freedesktop.systemd1.Service.xml \
--	org.freedesktop.systemd1.Socket.xml \
--	org.freedesktop.systemd1.Timer.xml \
--	org.freedesktop.systemd1.Target.xml \
--	org.freedesktop.systemd1.Device.xml \
--	org.freedesktop.systemd1.Mount.xml \
--	org.freedesktop.systemd1.Automount.xml \
--	org.freedesktop.systemd1.Snapshot.xml \
--	org.freedesktop.systemd1.Swap.xml \
--	org.freedesktop.systemd1.Path.xml
--
- dist_systemunit_DATA = \
- 	units/emergency.service \
- 	units/basic.target \
-@@ -466,9 +451,6 @@
- 	man/systemd.special.html.in
- endif
- 
--org.freedesktop.systemd1.%.xml: systemd
--	$(AM_V_GEN)./systemd --introspect=${@:.xml=} > $@
--
- CLEANFILES += $(dbusinterface_DATA)
- 
- install-data-hook:
diff --git a/recipes/systemd/files/execute.patch b/recipes/systemd/files/execute.patch
deleted file mode 100644
index c9f88c8..0000000
--- a/recipes/systemd/files/execute.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Index: git/src/execute.c
-===================================================================
---- git.orig/src/execute.c	2010-06-15 11:41:02.792856752 +0200
-+++ git/src/execute.c	2010-06-15 11:52:02.899046198 +0200
-@@ -47,6 +47,12 @@
- #include "cgroup.h"
- #include "namespace.h"
- 
-+#ifndef SCHED_RESET_ON_FORK
-+#  define SCHED_RESET_ON_FORK 0x40000000
-+#endif
-+
-+
-+
- /* This assumes there is a 'tty' group */
- #define TTY_MODE 0620
- 
diff --git a/recipes/systemd/files/getty-serial@.service b/recipes/systemd/files/getty-serial@.service
deleted file mode 100644
index 62e4695..0000000
--- a/recipes/systemd/files/getty-serial@.service
+++ /dev/null
@@ -1,19 +0,0 @@
-#  This file is part of systemd.
-#
-#  systemd is free software; you can redistribute it and/or modify it
-#  under the terms of the GNU General Public License as published by
-#  the Free Software Foundation; either version 2 of the License, or
-#  (at your option) any later version.
-
-[Unit]
-Description=Getty on %I
-Before=getty.target
-After=basic.target
-Conflicts=shutdown.target
-
-[Service]
-Environment=TERM=linux
-ExecStart=/sbin/getty @BAUDRATE@ %I
-Restart=restart-always
-RestartSec=0
-KillMode=process-group
diff --git a/recipes/systemd/files/replace_accpet4.patch b/recipes/systemd/files/replace_accpet4.patch
deleted file mode 100644
index d57b07a..0000000
--- a/recipes/systemd/files/replace_accpet4.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Index: git/src/logger.c
-===================================================================
---- git.orig/src/logger.c	2010-06-15 23:02:38.212932153 +0200
-+++ git/src/logger.c	2010-06-15 23:02:51.091686447 +0200
-@@ -331,7 +331,7 @@
- 
-         assert(s);
- 
--        if ((fd = accept4(server_fd, NULL, NULL, SOCK_NONBLOCK|SOCK_CLOEXEC)) < 0)
-+        if ((fd = accept(server_fd, NULL, NULL)) < 0)
-                 return -errno;
- 
-         if (s->n_streams >= STREAMS_MAX) {
-Index: git/src/socket.c
-===================================================================
---- git.orig/src/socket.c	2010-06-15 23:02:16.269606647 +0200
-+++ git/src/socket.c	2010-06-15 23:02:31.115021717 +0200
-@@ -1201,7 +1201,7 @@
-         if (w->socket_accept) {
-                 for (;;) {
- 
--                        if ((cfd = accept4(fd, NULL, NULL, SOCK_NONBLOCK)) < 0) {
-+                        if ((cfd = accept(fd, NULL, NULL)) < 0) {
- 
-                                 if (errno == EINTR)
-                                         continue;
diff --git a/recipes/systemd/files/systemadm.patch b/recipes/systemd/files/systemadm.patch
deleted file mode 100644
index b9c09db..0000000
--- a/recipes/systemd/files/systemadm.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: git/src/systemadm.vala
-===================================================================
---- git.orig/src/systemadm.vala	2010-06-15 11:02:35.863509632 +0200
-+++ git/src/systemadm.vala	2010-06-15 11:06:16.305986249 +0200
-@@ -297,7 +297,7 @@
- 
-                 bbox.pack_start(cancel_button, false, true, 0);
- 
--                bus = Bus.get(session ? BusType.SESSION : BusType.SYSTEM);
-+                bus = DBus.Bus.get(session ? DBus.BusType.SESSION : DBus.BusType.SYSTEM);
- 
-                 manager = bus.get_object(
-                                 "org.freedesktop.systemd1",
diff --git a/recipes/systemd/systemd-v26/0001-systemd-disable-xml-file-stuff-and-introspection.patch b/recipes/systemd/systemd-v26/0001-systemd-disable-xml-file-stuff-and-introspection.patch
new file mode 100644
index 0000000..63310aa
--- /dev/null
+++ b/recipes/systemd/systemd-v26/0001-systemd-disable-xml-file-stuff-and-introspection.patch
@@ -0,0 +1,93 @@
+From 4f2c783daa2556666821ad4b3a8825a7b58857b4 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 2 May 2011 09:12:21 +0200
+Subject: [PATCH] systemd: disable xml file stuff and introspection
+
+---
+ Makefile.am |   40 ++--------------------------------------
+ 1 files changed, 2 insertions(+), 38 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 873090e..49d2ee8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -199,21 +199,6 @@ dist_dbussystemservice_DATA = \
+ dist_udevrules_DATA = \
+ 	src/99-systemd.rules
+ 
+-dbusinterface_DATA = \
+-	org.freedesktop.systemd1.Manager.xml \
+-	org.freedesktop.systemd1.Job.xml \
+-	org.freedesktop.systemd1.Unit.xml \
+-	org.freedesktop.systemd1.Service.xml \
+-	org.freedesktop.systemd1.Socket.xml \
+-	org.freedesktop.systemd1.Timer.xml \
+-	org.freedesktop.systemd1.Target.xml \
+-	org.freedesktop.systemd1.Device.xml \
+-	org.freedesktop.systemd1.Mount.xml \
+-	org.freedesktop.systemd1.Automount.xml \
+-	org.freedesktop.systemd1.Snapshot.xml \
+-	org.freedesktop.systemd1.Swap.xml \
+-	org.freedesktop.systemd1.Path.xml
+-
+ dist_bashcompletion_DATA = \
+ 	src/systemctl-bash-completion.sh
+ 
+@@ -642,17 +627,10 @@ XML_FILES = \
+ XML_IN_FILES = \
+ 	${patsubst %.1,%.xml.in,${patsubst %.3,%.xml.in,${patsubst %.5,%.xml.in,${patsubst %.7,%.xml.in,${patsubst %.8,%.xml.in,$(nodist_man_MANS)}}}}}
+ 
+-dist_noinst_DATA = \
+-	${XML_FILES:.xml=.html}
+-
+-nodist_noinst_DATA = \
+-	${XML_IN_FILES:.xml.in=.html}
+-
+ EXTRA_DIST += \
+ 	$(XML_FILES) \
+ 	$(XML_IN_FILES) \
+-	${nodist_man_MANS:=.in} \
+-	${XML_IN_FILES:.xml.in=.html.in}
++	${nodist_man_MANS:=.in}
+ 
+ systemd_SOURCES = \
+ 	src/main.c
+@@ -1218,7 +1196,6 @@ CLEANFILES = \
+ 	$(nodist_systemunit_DATA) \
+ 	$(nodist_userunit_DATA) \
+ 	$(nodist_man_MANS) \
+-	${XML_IN_FILES:.xml.in=.html} \
+ 	$(pkgconfigdata_DATA) \
+ 	src/org.freedesktop.systemd1.policy
+ 
+@@ -1280,26 +1257,13 @@ man/%.8: man/%.xml
+ man/%.8.in: man/%.xml.in
+ 	$(XSLTPROC_PROCESS_MAN_IN)
+ 
+-man/%.html: man/%.xml
+-	$(XSLTPROC_PROCESS_HTML)
+-
+-man/%.html.in: man/%.xml.in
+-	$(XSLTPROC_PROCESS_HTML_IN)
+-
+ CLEANFILES += \
+ 	$(dist_man_MANS) \
+-	${nodist_man_MANS:=.in} \
+-	${XML_FILES:.xml=.html} \
+-	${XML_IN_FILES:.xml.in=.html.in}
++	${nodist_man_MANS:=.in}
+ endif
+ 
+ DBUS_PREPROCESS = $(CPP) -P $(DBUS_CFLAGS) -imacros dbus/dbus-protocol.h
+ 
+-org.freedesktop.systemd1.%.xml: systemd
+-	$(AM_V_GEN)$(OBJCOPY) -O binary -j introspect.$* $< $@.tmp && \
+-		$(STRINGS) $@.tmp | $(AWK) -f $(srcdir)/introspect.awk | \
+-		$(DBUS_PREPROCESS) -o $@ - && rm $@.tmp
+-
+ CLEANFILES += \
+ 	$(dbusinterface_DATA)
+ 
+-- 
+1.6.6.1
+
diff --git a/recipes/systemd/systemd-v26/execute.patch b/recipes/systemd/systemd-v26/execute.patch
new file mode 100644
index 0000000..c9f88c8
--- /dev/null
+++ b/recipes/systemd/systemd-v26/execute.patch
@@ -0,0 +1,17 @@
+Index: git/src/execute.c
+===================================================================
+--- git.orig/src/execute.c	2010-06-15 11:41:02.792856752 +0200
++++ git/src/execute.c	2010-06-15 11:52:02.899046198 +0200
+@@ -47,6 +47,12 @@
+ #include "cgroup.h"
+ #include "namespace.h"
+ 
++#ifndef SCHED_RESET_ON_FORK
++#  define SCHED_RESET_ON_FORK 0x40000000
++#endif
++
++
++
+ /* This assumes there is a 'tty' group */
+ #define TTY_MODE 0620
+ 
diff --git a/recipes/systemd/systemd-v26/getty-serial@.service b/recipes/systemd/systemd-v26/getty-serial@.service
new file mode 100644
index 0000000..62e4695
--- /dev/null
+++ b/recipes/systemd/systemd-v26/getty-serial@.service
@@ -0,0 +1,19 @@
+#  This file is part of systemd.
+#
+#  systemd is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU General Public License as published by
+#  the Free Software Foundation; either version 2 of the License, or
+#  (at your option) any later version.
+
+[Unit]
+Description=Getty on %I
+Before=getty.target
+After=basic.target
+Conflicts=shutdown.target
+
+[Service]
+Environment=TERM=linux
+ExecStart=/sbin/getty @BAUDRATE@ %I
+Restart=restart-always
+RestartSec=0
+KillMode=process-group
diff --git a/recipes/systemd/systemd-v26/replace_accpet4.patch b/recipes/systemd/systemd-v26/replace_accpet4.patch
new file mode 100644
index 0000000..d57b07a
--- /dev/null
+++ b/recipes/systemd/systemd-v26/replace_accpet4.patch
@@ -0,0 +1,26 @@
+Index: git/src/logger.c
+===================================================================
+--- git.orig/src/logger.c	2010-06-15 23:02:38.212932153 +0200
++++ git/src/logger.c	2010-06-15 23:02:51.091686447 +0200
+@@ -331,7 +331,7 @@
+ 
+         assert(s);
+ 
+-        if ((fd = accept4(server_fd, NULL, NULL, SOCK_NONBLOCK|SOCK_CLOEXEC)) < 0)
++        if ((fd = accept(server_fd, NULL, NULL)) < 0)
+                 return -errno;
+ 
+         if (s->n_streams >= STREAMS_MAX) {
+Index: git/src/socket.c
+===================================================================
+--- git.orig/src/socket.c	2010-06-15 23:02:16.269606647 +0200
++++ git/src/socket.c	2010-06-15 23:02:31.115021717 +0200
+@@ -1201,7 +1201,7 @@
+         if (w->socket_accept) {
+                 for (;;) {
+ 
+-                        if ((cfd = accept4(fd, NULL, NULL, SOCK_NONBLOCK)) < 0) {
++                        if ((cfd = accept(fd, NULL, NULL)) < 0) {
+ 
+                                 if (errno == EINTR)
+                                         continue;
diff --git a/recipes/systemd/systemd-v26/systemadm.patch b/recipes/systemd/systemd-v26/systemadm.patch
new file mode 100644
index 0000000..b9c09db
--- /dev/null
+++ b/recipes/systemd/systemd-v26/systemadm.patch
@@ -0,0 +1,13 @@
+Index: git/src/systemadm.vala
+===================================================================
+--- git.orig/src/systemadm.vala	2010-06-15 11:02:35.863509632 +0200
++++ git/src/systemadm.vala	2010-06-15 11:06:16.305986249 +0200
+@@ -297,7 +297,7 @@
+ 
+                 bbox.pack_start(cancel_button, false, true, 0);
+ 
+-                bus = Bus.get(session ? BusType.SESSION : BusType.SYSTEM);
++                bus = DBus.Bus.get(session ? DBus.BusType.SESSION : DBus.BusType.SYSTEM);
+ 
+                 manager = bus.get_object(
+                                 "org.freedesktop.systemd1",
diff --git a/recipes/systemd/systemd_git.bb b/recipes/systemd/systemd_git.bb
index 5f98e54..7634b22 100644
--- a/recipes/systemd/systemd_git.bb
+++ b/recipes/systemd/systemd_git.bb
@@ -1,48 +1,56 @@
 DESCRIPTION = "Systemd a init replacement"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
-LICENSE = "GPL"
+LICENSE = "GPLv2+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+
 DEPENDS = "readline udev dbus libcap2 libcgroup gtk+"
 PRIORITY = "optional"
 SECTION = "base/shell"
 
-PV = "0.0"
-PR_append = "+${SRCPV}"
+PV = "v26"
+#PR_append = "+${SRCPV}"
 
 inherit autotools vala
 
-TAG = "1ebdf2d8793181f31b766b8342391aa1978f9917"
+TAG = "${PV}"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd;protocol=git;tag=${TAG} \
            file://execute.patch \
-           file://systemadm.patch \
-           file://disable_xml_generation.patch \
+#           file://systemadm.patch \
+           file://0001-systemd-disable-xml-file-stuff-and-introspection.patch \
            file://replace_accpet4.patch \
            file://getty-serial@.service \
           "
 
 S = "${WORKDIR}/git"
 
+# The gtk+ tools should get built as a seperate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-distro=debian \
                  --with-rootdir=${base_prefix} \
+                 --disable-gtk \
                "
 
-PACKAGES = "${PN} ${PN}-gui ${PN}-dbg ${PN}-doc"
+PACKAGES =+ "${PN}-gui"
 
 FILES_${PN}-gui = "${bindir}/systemadm"
 
 FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
+                ${datadir}/polkit-1 \
                 ${datadir}/${PN} \
                 ${sysconfdir} \
                 ${base_libdir}/systemd/* \
                 ${base_libdir}/systemd/system/* \
                 ${base_libdir}/udev/rules.d \
+                ${base_libdir}/security/*.so \
                 /cgroup \
-                ${bindir}/systemd-install \
+                ${bindir}/systemd* \
+                ${libdir}/tmpfiles.d/*.conf \
+                ${libdir}/systemd \
                "
 
-FILES_${PN}-dbg += " /lib/systemd/.debug "
+FILES_${PN}-dbg += "${base_libdir}/systemd/.debug ${base_libdir}/systemd/*/.debug"
 
 def get_baudrate(bb, d):
     return bb.data.getVar('SERIAL_CONSOLE', d, 1).split()[0]
-- 
1.6.6.1



