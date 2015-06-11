Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED4C3756A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:17:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B9H1Jh014198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:17:01 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 11 Jun 2015 02:17:01 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jun 2015 17:16:48 +0800
Message-ID: <c7bba45becbe2cb37e5b63238cdb836eb1502742.1434013953.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013953.git.yi.zhao@windriver.com>
References: <cover.1434013953.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 1/9] meta-oe: fix the install dir for udev rules and files
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
X-List-Received-Date: Thu, 11 Jun 2015 09:17:01 -0000
Content-Type: text/plain

When enable multilib, some packages try to install udev rules and
related files into /lib64/udev/ directory. But these files should
be installed in /lib/udev/ directory even on multilib.
Use ${nonarch_base_libdir} instead of ${base_libdir} to fix it.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/libmtp/libmtp_1.1.5.bb    |    6 +++---
 .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    2 +-
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb    |    7 ++++++-
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |    4 ++--
 .../usb-modeswitch/usb-modeswitch_2.2.0.bb         |    2 +-
 5 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
index de63c72..857895b 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -49,13 +49,13 @@ PACKAGES =+ "libmtp-common libmtp-runtime mtp-tools"
 
 RDEPENDS_${PN} += "libmtp-common"
 RRECOMMENDS_${PN} += "libmtp-runtime mtp-tools"
-FILES_${PN}-dbg += "${base_libdir}/udev/.debug/*"
+FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/*"
 PKG_${PN}-bin = "mtp-tools"
 SUMMARY_${PN}-bin = "Tools for communicating with MTP devices"
 DESCRIPTION_${PN}-bin = "${DESCRIPTION}\nThis package contains tools for communicating with MTP devices."
-FILES_libmtp-common = "${base_libdir}/udev/rules.d/*"
+FILES_libmtp-common = "${nonarch_base_libdir}/udev/rules.d/*"
 SUMMARY_libmtp-common = "The udev rules file for MTP devices"
-FILES_libmtp-runtime = "${base_libdir}/udev/mtp-probe"
+FILES_libmtp-runtime = "${nonarch_base_libdir}/udev/mtp-probe"
 DEPENDS_libmtp-runtime = "libmtp-common"
 SUMMARY_libmtp-runtime = "mtp-probe, used for the MTP udev rules"
 DESCRIPTION_libmtp-runtime = "This package provides mtp-probe, a program to probe newly connected device interfaces from userspace to determine if they are MTP devices, used for udev rules."
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
index 523efa7..cd8fafb 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
@@ -52,7 +52,7 @@ RDEPENDS_${PN} = "bash"
 
 FILES_libgphotoport = "${libdir}/libgphoto2_port.so.*"
 
-FILES_${PN} += "${base_libdir}/udev/* ${datadir}/hal"
+FILES_${PN} += "${nonarch_base_libdir}/udev/* ${datadir}/hal"
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
 FILES_${PN}-dev += "${libdir}/*/*/*.la"
 
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
index 4ff6687..1c76d81 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
@@ -6,6 +6,8 @@ DEPENDS = "libatasmart polkit udev dbus-glib glib-2.0 intltool-native gnome-comm
 
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
+RDEPENDS_${PN} = "acl"
+
 SRC_URI = "http://udisks.freedesktop.org/releases/udisks-${PV}.tar.bz2"
 SRC_URI[md5sum] = "73632501002e6de8244f831e38b2b98e"
 SRC_URI[sha256sum] = "2cfcf560447ea44cba2a683342c7062aaaf35e4eb554bed64ac2dd55a70a5fb6"
@@ -19,7 +21,8 @@ EXTRA_OECONF = "--disable-introspection --disable-man"
 FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
                 ${datadir}/dbus-1/ \
                 ${datadir}/polkit-1 \
-                ${base_libdir}/udev/* \
+                ${nonarch_base_libdir}/udev/* \
+                ${exec_prefix}${nonarch_base_libdir}/udisks2/* \
 "
 
 PACKAGES =+ "${PN}-libs"
@@ -27,5 +30,7 @@ PACKAGES =+ "${PN}-libs"
 FILES_${PN} += "${datadir}/bash-completion"
 FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
 
+FILES_${PN}-dbg += "${exec_prefix}${nonarch_base_libdir}/udisks2/.debug"
+
 SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index e8a4e55..4bd65d3 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -27,10 +27,10 @@ EXTRA_OECONF = "--disable-man-pages"
 FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
                 ${datadir}/dbus-1/ \
                 ${datadir}/polkit-1 \
-                ${base_libdir}/udev/* \
+                ${nonarch_base_libdir}/udev/* \
 "
 
-FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
+FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
index 5e95bb9..52a2f56 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "2752103de171ed5f6c8d6a6e3e73e16c9ee3e8e394dd39c5991f7680eb
 
 EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
 
-FILES_${PN} = "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
+FILES_${PN} = "${bindir} ${sysconfdir} ${nonarch_base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
 RDEPENDS_${PN} = "tcl"
 RRECOMMENDS_${PN} = "usb-modeswitch-data"
 
-- 
1.7.9.5


