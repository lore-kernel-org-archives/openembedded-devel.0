Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1OZXgU-0001VU-D2
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 01:17:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 923561416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 01:22:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id We86FEmmsA8a
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 01:22:35 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 954121416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 01:22:35 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Jul 2010 01:17:38 +0200
Message-ID: <1279235858.6792.16.camel@utx.lan>
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
Subject: [PATCH 2/3] udev: add udev-compat support to udev
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
X-List-Received-Date: Thu, 15 Jul 2010 23:17:44 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

This patch adds support for udev-compat to selected platforms (just now
spitz and akita). It is possible to implement the wrapper directly to
udev init files on all patforms. It would be more straightforward, but
it would check for udev-compat everywhere.

    udev: Added support for udev-compat.

diff --git a/recipes/udev/files/udev-compat-wrapper-patch b/recipes/udev/files/udev-compat-wrapper-patch
new file mode 100644
index 0000000..a3e312d
--- /dev/null
+++ b/recipes/udev/files/udev-compat-wrapper-patch
@@ -0,0 +1,37 @@
+This patch should be applied on platforms which support kernels < 2.6.27 and need udev-compat package.
+
+It should be applied after:
+sed -i "s:/sbin/udevd:\$UDEVD:g;s:/sbin/udevadm:\$UDEVADM:g" init
+
+It has not .patch suffix, because such files would not be copied to
+WORKDIR and cannot be selectively applied on another source file.
+
+--- init
++++ init
+@@ -11,6 +11,17 @@
+ 
+ export TZ=/etc/localtime
+ 
++UDEVD="/sbin/udevd"
++UDEVADM="/sbin/udevadm"
++# If we are running an old kernel and have a static udev present use that instead
++if [ -e /sbin/udevd-compat ] ; then
++	KERNELMICROVER="$(uname -r | awk -F. '{print $3}')"
++	if [ $KERNELMICROVER -lt 27 ] ; then
++		UDEVD="/sbin/udevd-compat"
++		UDEVADM="/sbin/udevadm-compat"
++	fi
++fi
++
+ [ -d /sys/class ] || exit 1
+ [ -r /proc/mounts ] || exit 1
+ [ -x $UDEVD ] || exit 1
+@@ -21,6 +32,8 @@
+         if [ -x /sbin/pidof ]; then
+                 pid=`/sbin/pidof -x udevd`
+                 [ -n "$pid" ] && kill $pid
++                pid=`/sbin/pidof -x udevd-compat`
++                [ -n "$pid" ] && kill $pid
+         fi
+ }
+ 
diff --git a/recipes/udev/udev.inc b/recipes/udev/udev.inc
index c79da97..f4f1c40 100644
--- a/recipes/udev/udev.inc
+++ b/recipes/udev/udev.inc
@@ -11,7 +11,8 @@ SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://mount.sh \
 	   file://network.sh \
 	   file://local.rules \
-           file://init"
+           file://init \
+	   file://udev-compat-wrapper-patch"
 
 INC_PR = "r27"
 
@@ -42,6 +43,22 @@ EXTRA_OEMAKE = "-e \
 		'EXTRAS=${UDEV_EXTRAS}' \
 		'STRIP=echo'"
 
+RPROVIDES_udev_spitz = "udev-compat-wrapper"
+do_unpack_append_spitz() {
+	bb.build.exec_func('do_apply_compat_wrapper', d)
+}
+RPROVIDES_udev_akita = "udev-compat-wrapper"
+do_unpack_append_akita() {
+	bb.build.exec_func('do_apply_compat_wrapper', d)
+}
+# Modify init script on platforms that need to boot old kernels:
+do_apply_compat_wrapper() {
+	cd ${WORKDIR}
+	sed -i "s:/sbin/udevd:\$UDEVD:g;s:/sbin/udevadm:\$UDEVADM:g" init
+	patch <udev-compat-wrapper-patch
+	cd -
+}
+
 do_install () {
 	install -d ${D}${usrsbindir} \
 		   ${D}${sbindir}
diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index 7be56d2..ce97a7b 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -29,6 +29,7 @@ SRC_URI += " \
        file://default \
        file://init \
        file://cache \
+       file://udev-compat-wrapper-patch \
 "
 
 SRC_URI_append_h2200 = " file://50-hostap_cs.rules "
@@ -74,6 +75,22 @@ FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
 FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
 FILES_${PN}-dbg += "/lib/udev/.debug"
 
+RPROVIDES_udev_spitz = "udev-compat-wrapper"
+do_unpack_append_spitz() {
+	bb.build.exec_func('do_apply_compat_wrapper', d)
+}
+RPROVIDES_udev_akita = "udev-compat-wrapper"
+do_unpack_append_akita() {
+	bb.build.exec_func('do_apply_compat_wrapper', d)
+}
+# Modify init script on platforms that need to boot old kernels:
+do_apply_compat_wrapper() {
+	cd ${WORKDIR}
+	sed -i "s:/sbin/udevd:\$UDEVD:g;s:/sbin/udevadm:\$UDEVADM:g" init
+	patch <udev-compat-wrapper-patch
+	cd -
+}
+
 do_install () {
 	install -d ${D}${usrsbindir} \
 		   ${D}${sbindir}
diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
index 5e90e88..6032215 100644
--- a/recipes/udev/udev_154.bb
+++ b/recipes/udev/udev_154.bb
@@ -30,6 +30,7 @@ SRC_URI += " \
        file://default \
        file://init \
        file://cache \
+       file://udev-compat-wrapper-patch \
 "
 
 SRC_URI_append_h2200 = " file://50-hostap_cs.rules "
@@ -75,6 +76,22 @@ FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
 FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
 FILES_${PN}-dbg += "/lib/udev/.debug"
 
+RPROVIDES_udev_spitz = "udev-compat-wrapper"
+do_unpack_append_spitz() {
+	bb.build.exec_func('do_apply_compat_wrapper', d)
+}
+RPROVIDES_udev_akita = "udev-compat-wrapper"
+do_unpack_append_akita() {
+	bb.build.exec_func('do_apply_compat_wrapper', d)
+}
+# Modify init script on platforms that need to boot old kernels:
+do_apply_compat_wrapper() {
+	cd ${WORKDIR}
+	sed -i "s:/sbin/udevd:\$UDEVD:g;s:/sbin/udevadm:\$UDEVADM:g" init
+	patch <udev-compat-wrapper-patch
+	cd -
+}
+
 do_install () {
 	install -d ${D}${usrsbindir} \
 		   ${D}${sbindir}

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




