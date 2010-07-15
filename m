Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1OZXXB-00064W-1a
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 01:10:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 28BC81416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 01:13:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h0Vd3tTMaAd2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 01:12:58 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 319C21416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 01:12:57 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jul 2010 01:08:00 +0200
Message-ID: <1279235280.6792.7.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] udev: add compatibility package for old kernels
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
X-List-Received-Date: Thu, 15 Jul 2010 23:11:07 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Attached patch creates udev compatibility package that allows to run
udev on old kernels.

Changes in udev recipes should have no effect for udev itself, just
simplifying the udev-compat recipe.

People that need even older udev can reuse the recipe, copy it with a
different name and add it to the image.

The idea was suggested in past by Koen Kooi:
Subject: [RFC][PATCH] udev 151: fall back to old, static udev if present when running an old kernel
Date: Sat, 17 Apr 2010 16:03:27 +0200

This recipe does not create static binary, but a dynamic binary
statically linked just with udev. Binary names don't contain version, so
arbitrary compat version can be used without modifying of the wrapper.

    udev-compat141: Added compatibility udev package for old kernels.

diff --git a/recipes/udev/udev-compat141_141.bb b/recipes/udev/udev-compat141_141.bb
new file mode 100644
index 0000000..3eb99e8
--- /dev/null
+++ b/recipes/udev/udev-compat141_141.bb
@@ -0,0 +1,32 @@
+# To use this package, you need:
+# - udev main package with init scrit that supports udev-compat-wrapper (enable per-platform in the udev.inc and udev*.bb files)
+# - this package must be embedded into the image (otherwise system will refuse to boot)
+# - only one compat package is supported (pick the newest udev that supports your oldest kernel)
+#
+FILESPATHPKG =. "udev-${PV}:udev:"
+require udev_141.bb
+S = "${WORKDIR}/udev-${PV}"
+DESCRIPTION = "udev compatibility helper package for systems that run old kernels"
+PACKAGES = "${PN} ${PN}-dbg"
+
+# Need udev with udev-compat-wrapper support.
+RDEPENDS_${PN} += "udev-compat-wrapper"
+# Remove hotplug RPROVIDES
+RPROVIDES_${PN} = ""
+
+# We cannot use newer library: udev_monitor_new_from_netlink_compat() will fail.
+# We cannot use older udev_monitor_new_from_netlink_compat(): Structures are incompatible.
+# That is why we link udev statically with the old library.
+export enable_shared = "no"
+EXTRA_OECONF += "--enable-static"
+
+# Remove everything except udevd and udevadm and rename these two.
+do_install_append () {
+	mv ${D}${base_sbindir}/udevd ${D}${base_sbindir}/udevd-compat
+	mv ${D}${base_sbindir}/udevadm ${D}${base_sbindir}/udevadm-compat
+	rm -r ${D}${datadir} ${D}${base_libdir} ${D}${libdir} ${D}${includedir} ${D}${sysconfdir}
+	rmdir ${D}${prefix} 2>/dev/null || true
+}
+
+# Remove udev init script installation
+INITSCRIPT_PACKAGES = ""
diff --git a/recipes/udev/udev.inc b/recipes/udev/udev.inc
index 1fb75fe..c79da97 100644
--- a/recipes/udev/udev.inc
+++ b/recipes/udev/udev.inc
@@ -63,7 +63,7 @@ do_install () {
 	install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
 	install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
         install -m 0644 ${S}/extras/volume_id/lib/libvolume_id.h ${D}${includedir}
-        oe_libinstall -C extras/volume_id/lib -so libvolume_id ${D}${libdir}
+        oe_libinstall -C extras/volume_id/lib libvolume_id ${D}${libdir}
 }
 
 PACKAGES =+ "udev-utils libvolume-id libvolume-id-dev"
diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index 27055be..3ef9f7d 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -79,7 +79,7 @@ do_install () {
 
 	install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
 	install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
-        oe_libinstall -C udev/lib -so libudev ${D}${libdir}
+        oe_libinstall -C udev/lib libudev ${D}${libdir}
         install ${S}/udev/lib/libudev.h ${D}${includedir}
 }
 
@@ -99,7 +99,7 @@ do_install_append_hipox() {
 }
 
 # Create the cache after checkroot has run
-pkg_postinst_${PN}_append() {
+pkg_postinst_udev_append() {
 update-rc.d $OPT udev-cache start 12 S .
 
 if [ -d $D/lib/udev/rules.d ] ; then
diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index 13f3a02..7be56d2 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -119,7 +119,7 @@ do_install_append_bug() {
 }
 
 # Create the cache after checkroot has run
-pkg_postinst_${PN}_append() {
+pkg_postinst_udev_append() {
 	update-rc.d $OPT udev-cache start 12 S .
 }
 
diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
index cd370e8..5e90e88 100644
--- a/recipes/udev/udev_154.bb
+++ b/recipes/udev/udev_154.bb
@@ -120,6 +120,6 @@ do_install_append_bug() {
 }
 
 # Create the cache after checkroot has run
-pkg_postinst_${PN}_append() {
+pkg_postinst_udev_append() {
 	update-rc.d $OPT udev-cache start 12 S .
 }

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



