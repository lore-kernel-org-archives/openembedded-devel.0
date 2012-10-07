Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TKocT-0007SL-V0
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Oct 2012 13:02:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Oct 2012 03:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,547,1344236400"; d="scan'208";a="202618157"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.60])
	by orsmga001.jf.intel.com with ESMTP; 07 Oct 2012 03:48:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Oct 2012 11:47:38 +0100
Message-Id: <1349606858-7635-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] lcdproc: add recipe from OE-Classic and update/clean up
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
X-List-Received-Date: Sun, 07 Oct 2012 11:02:02 -0000

* Update to latest upstream version 0.5.5
* Add an Ubuntu patch to fix incompatibility with current automake
* Use automatic package splitting for drivers
* Allow specifying drivers to build via LCD_DRIVERS
* Allow specifying default enabled driver via LCD_DEFAULT_DRIVER
* Disable g15 driver by default (but allow it to be re-enabled using
  PACKAGECONFIG, assuming the required recipes are also provided).
* Fix conf files not going into lcdvc and lcdd packages due to
  override expansion not happening at the expected time (for
  CONFFILES_*)
* Remove some unnecessary cruft
* Move packaging parts of recipe below do_install
* Add LIC_FILES_CHKSUM
* Make LICENSE more accurate
* Add SUMMARY

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../lcdproc/lcdproc/automake-111-fix.patch         |   21 ++++++
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc      |   77 ++++++++++++++++++++
 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb  |   24 ++++++
 3 files changed, 122 insertions(+)
 create mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc/automake-111-fix.patch
 create mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc5.inc
 create mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc/automake-111-fix.patch b/meta-oe/recipes-extended/lcdproc/lcdproc/automake-111-fix.patch
new file mode 100644
index 0000000..061cc22
--- /dev/null
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc/automake-111-fix.patch
@@ -0,0 +1,21 @@
+Description: With automake 1.11.3, pkglib_PROGRAMS is not valid anymore, 
+ so work around this by using my_execbin_PROGRAMS.
+Author: Andreas Moog <amoog@ubuntu.com>
+Bug-Ubuntu: https://bugs.launchpad.net/bugs/934265
+
+Upstream-Status: Backport 
+
+Index: lcdproc-0.5.5/server/drivers/Makefile.am
+===================================================================
+--- lcdproc-0.5.5.orig/server/drivers/Makefile.am	2012-02-26 14:04:37.000000000 +0100
++++ lcdproc-0.5.5/server/drivers/Makefile.am	2012-02-26 14:13:17.764467350 +0100
+@@ -20,7 +20,8 @@
+ 
+ ## Keep the lists sorted!
+ 
+-pkglib_PROGRAMS = @DRIVERS@
++my_execbindir = $(pkglibdir)
++my_execbin_PROGRAMS = @DRIVERS@
+ EXTRA_PROGRAMS = bayrad CFontz CFontz633 CFontzPacket curses debug CwLnx ea65 EyeboxOne g15 glcdlib glk hd44780 icp_a106 imon imonlcd IOWarrior irman joy lb216 lcdm001 lcterm lirc lis MD8800 mdm166a ms6931 mtc_s16209x MtxOrb mx5000 NoritakeVFD picolcd pyramid sed1330 sed1520 serialPOS serialVFD shuttleVFD stv5730 SureElec svga t6963 text tyan sli ula200 xosd i2500vfd irtrans
+ noinst_LIBRARIES = libLCD.a libbignum.a
+ 
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
new file mode 100644
index 0000000..50b6b0e
--- /dev/null
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
@@ -0,0 +1,77 @@
+DESCRIPTION = "LCDproc is a client/server suite to drive all kinds of LCD (-like) devices. The client \
+shipped with this package can be used to acquire various kinds of system stats."
+SUMMARY = "Drivers for character-based LCD displays"
+HOMEPAGE = "http://lcdproc.org"
+SECTION = "utils"
+LICENSE = "GPLv2+"
+DEPENDS = "virtual/libusb0 ncurses"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
+                    file://README;startline=60;md5=8237b4d4d80a525b15f8162192e07bee"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/lcdproc/${P}.tar.gz"
+
+inherit autotools update-rc.d
+
+LCD_DRIVERS ?= "all"
+LCD_DEFAULT_DRIVER ?= "curses"
+
+EXTRA_OECONF = "--enable-drivers=${LCD_DRIVERS} --enable-libusb"
+
+do_install () {
+	# binaries
+	install -D -m 0755 server/LCDd ${D}${sbindir}/LCDd
+	install -D -m 0755 clients/lcdproc/lcdproc ${D}${bindir}/lcdproc
+
+	# init scripts
+	install -d ${D}${sysconfdir}/init.d
+	# so far, not fixed :-( and now even uglier :-((
+	cat scripts/init-LCDd.debian | sed -e s'/--oknodo//' -e 's/ -s -f / -s 1 -f 1 /' -e 's/force-reload/force-restart/' -e 's/sleep 1/sleep 4/' > ${D}${sysconfdir}/init.d/lcdd
+	chmod 0755 ${D}${sysconfdir}/init.d/lcdd
+	install -m 0755 scripts/init-lcdproc.debian ${D}${sysconfdir}/init.d/lcdproc
+	sed -i s'/--oknodo//' ${D}${sysconfdir}/init.d/lcdproc
+
+	# configuration files
+	install -m 0644 LCDd.conf ${D}${sysconfdir}/LCDd.conf
+	sed -i 's!^DriverPath=.*!DriverPath=${libdir}/lcdproc/!' ${D}${sysconfdir}/LCDd.conf
+	sed -i 's!^Driver=.*!Driver=${LCD_DEFAULT_DRIVER}!' ${D}${sysconfdir}/LCDd.conf
+	install -m 0644 clients/lcdproc/lcdproc.conf ${D}${sysconfdir}/lcdproc.conf
+
+	# driver library files
+	install -d ${D}${libdir}/lcdproc
+	for i in server/drivers/*.so; do
+		install -m 0644 $i ${D}${libdir}/lcdproc/
+	done
+}
+
+PACKAGES =+ "lcdd"
+
+RRECOMMENDS_${PN} = "lcdd"
+
+FILES_lcdd = "${sysconfdir}/LCDd.conf \
+	${sbindir}/LCDd \
+	${sysconfdir}/init.d/lcdd"
+
+CONFFILES_lcdd = "${sysconfdir}/LCDd.conf"
+CONFFILES_${PN} = "${sysconfdir}/lcdproc.conf"
+
+# Driver packages
+
+# USB / no USB trickery
+
+RCONFLICTS_lcdd-driver-hd47780nousb = "lcdd-driver-hd44780"
+RCONFLICTS_lcdd-driver-hd47780 = "lcdd-driver-hd44780nousb"
+
+INITSCRIPT_PACKAGES = "lcdd lcdproc"
+INITSCRIPT_NAME_lcdd = "lcdd"
+INITSCRIPT_NAME_lcdproc = "lcdproc"
+INITSCRIPT_PARAMS_lcdd = "defaults 70 21"
+INITSCRIPT_PARAMS_lcdproc = "defaults 71 20"
+
+python populate_packages_prepend() {
+    plugindir = d.expand('${libdir}/lcdproc')
+    do_split_packages(d, plugindir, '(.*)\.so$', 'lcdd-driver-%s', 'LCDd driver for %s', prepend=True)
+}
+
+PACKAGES_DYNAMIC = "lcdd-driver-*"
+
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
new file mode 100644
index 0000000..0276c55
--- /dev/null
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
@@ -0,0 +1,24 @@
+require lcdproc5.inc
+
+SRC_URI += "file://automake-111-fix.patch"
+
+SRC_URI[md5sum] = "c92d4529d36eeec6d9d6fd0a4aa3ec82"
+SRC_URI[sha256sum] = "b136b47d7bf585a003334f432d8730a36ef5ed1cd520084b919667d825e48d42"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[g15] = ",,libg15 g15daemon libg15render,"
+
+LCD_DRIVERS_append = "${@base_contains('PACKAGECONFIG', 'g15', '', ',!g15', d)}"
+
+do_install_append () {
+	# binaries
+	install -D -m 0755 clients/lcdvc/lcdvc ${D}${sbindir}/lcdvc
+
+	# configuration files
+	install -D -m 0644 clients/lcdvc/lcdvc.conf ${D}${sysconfdir}/lcdvc.conf
+}
+
+PACKAGES =+ "lcdvc"
+CONFFILES_lcdvc = "${sysconfdir}/lcdvc.conf"
+FILES_lcdvc = "${sysconfdir}/lcdvc.conf ${sbindir}/lcdvc"
+
-- 
1.7.9.5



