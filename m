Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sa3G3-0000sm-ED
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 13:09:35 +0200
Received: by mail-bk0-f47.google.com with SMTP id jm2so710511bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 03:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Sf5eiai3EwJqX+sMsgGhQccb82ds78PBSMsf2QyvnPQ=;
	b=dOkU34YxPLXrUSy97I8f6KJuUnYUOOREAQU6FKGaDFdLbP1IOPDIyHCJTAwp9uVktP
	lWhs1hacgZNwBhDFa2QXYihjPIp7Q/5URCJiw7CxJt7PmaqWkp4VJne0DYlYCPm3Clcd
	bI/MrHhL6t74+o3uq1zy/IwDb9Xq75OePHrZGCEGlNrxhnQn0AU+uHK/3F5HTYKj0mp5
	bZmQofSk3gBVVtk+g0IxB9AyqFDsNMr7cvBLY01TbefG3U5RRzfagbsHG5VMqc335yBV
	GUp6QC3pYIUa2Nhv5juu7t4CPrFZMAN7fzTGyrWwb4jEOOZcmvNGEoz7/dNwwGAl0ozH
	s3aA==
Received: by 10.204.156.155 with SMTP id x27mr11432501bkw.84.1338461957942;
	Thu, 31 May 2012 03:59:17 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id ig1sm2794600bkc.4.2012.05.31.03.59.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 03:59:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2012 12:59:00 +0200
Message-Id: <1338461940-3040-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1338461940-3040-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338461940-3040-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 4/4] recipes: bump PR to fix -systemd postinsts where SYSTEMD_SERVICE was used without PN* suffix
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
X-List-Received-Date: Thu, 31 May 2012 11:09:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-efl/recipes-efl/efl/elsa_svn.bb               |    2 ++
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    2 +-
 meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend   |    2 +-
 .../cherokee/cherokee_1.2.98.bb                    |    2 +-
 .../recipes-connectivity/gateone/gateone_git.bb    |    2 +-
 .../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
 .../openssh/openssh_6.0p1.bbappend                 |    2 +-
 .../systemd/systemd-machine-units_1.0.bb           |    2 ++
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |    2 +-
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |    2 ++
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |    2 ++
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |    2 ++
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    2 +-
 14 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
index 1f1032f..b8a4f63 100644
--- a/meta-efl/recipes-efl/efl/elsa_svn.bb
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -4,6 +4,8 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "e/apps"
 
+PR = "r1"
+
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep \
   file://0001-pam-use-common-auth-instead-of-system-auth.patch \
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index d71c7d8..6ebd587 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r7"
+PR = "r8"
 
 inherit gnome update-rc.d systemd
 
diff --git a/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend b/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
index b144e9f..cc6cb7c 100644
--- a/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ b/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -1,5 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PRINC := "${@int(PRINC) + 4}"
+PRINC := "${@int(PRINC) + 5}"
 
 SRC_URI += " file://keymaps.service"
 
diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
index 0080195..a4835e0 100644
--- a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
+++ b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
@@ -5,7 +5,7 @@ SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index d56c848..c737eae 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
-PR = "r5"
+PR = "r6"
 
 PV = "1.1"
 SRCREV = "bb74e1095adb66b04b51ed6ff10ae0aa96afdd46"
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index 474d98a..221dc2c 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-PR = "r5"
+PR = "r6"
 
 DEPENDS = "systemd libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp"
 inherit gnome gettext systemd
diff --git a/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend b/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
index a459065..de7668f 100644
--- a/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
+++ b/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_PACKAGES = "openssh-sshd-systemd"
 SYSTEMD_SERVICE = "sshd.socket"
diff --git a/meta-oe/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta-oe/recipes-core/systemd/systemd-machine-units_1.0.bb
index f223364..f33b2a9 100644
--- a/meta-oe/recipes-core/systemd/systemd-machine-units_1.0.bb
+++ b/meta-oe/recipes-core/systemd/systemd-machine-units_1.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+PR = "r1"
+
 inherit systemd
 SYSTEMD_SERVICE = ""
 SYSTEMD_PACKAGES = "${PN}"
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
index d4552cf..97fd026 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
            file://rsyslog.conf"
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
index 765dcf2..fc5da49 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
 DEPENDS = "virtual/libx11 libxi"
 
-PR = "r6"
+PR = "r7"
 
 inherit autotools systemd
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 7f6d0ba..4f00cf4 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
 PROVIDES = "virtual/gpsd"
 
+PR = "r1"
+
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch \
   file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
index 92060b2..60b30df 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
+PR = "r1"
+
 DEFAULT_PREFERENCE = "-1"
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
index 2d01a77..0cf0685 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
+PR = "r1"
+
 SRCREV = "f8744f4af8cef211de698df5d8e6caddfe33f29d"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 3489ac5..50ce4a4 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
 # update-rc.d and update-alternatives is important
 RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 inherit autotools systemd
 
-- 
1.7.6.5



