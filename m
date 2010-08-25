Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1OoDvl-0000Lf-NU
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 13:14:21 +0200
Received: by ewy7 with SMTP id 7so127233ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 04:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=NgIGdkBqAnHHCtbXxPHr7tblmFj7B2gnVxmK0zfrW/0=;
	b=vVCkucwN7E+xtzOflsXZqrDWPDXWQogPNUPrOmF+TE3F0LbHcXOuod+38kZjnh7pY9
	jH6XJEriZH906RidN8UFKAS4+5YbXDPDkD/kY0WHtYSdQlW2IAayBdGPbY/TvBrevjNE
	hZ9wc3hp9zLELqgrXY84U+34EePT4H3s+ZfCc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=EGLqL/pKkkOZb0NVCSGiGxc/3aFKdl/Qp0mb2uvthciYk1GhYoF4/k7en+72mzjJ7+
	UJMtkj3bqY5FWvyMe1hTscW2CXAOUXzAhYsc50j802iftrG3I8ruviXcUh1iG9Kk1eg/
	VNYqts7iy94sQ7ad+KPkInpV1NUf6lKhrJK78=
MIME-Version: 1.0
Received: by 10.213.7.81 with SMTP id c17mr3366242ebc.57.1282734822955; Wed,
	25 Aug 2010 04:13:42 -0700 (PDT)
Received: by 10.14.6.75 with HTTP; Wed, 25 Aug 2010 04:13:42 -0700 (PDT)
Date: Wed, 25 Aug 2010 17:13:42 +0600
Message-ID: <AANLkTikvLoGEKA-kmer4_QOVMPG+fynmOPDca03eWJ=X@mail.gmail.com>
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] upstart_0.3.11.bb: fix upstart sysvinit compat
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
X-List-Received-Date: Wed, 25 Aug 2010 11:14:21 -0000
Content-Type: text/plain; charset=UTF-8

From: Anatoly Shipitsin <norguhtar@gmail.com>

* move shutdown to sysvinit package
* move killall5 to sysvinit-utils
* change PR = "r59"

Signed-off-by: Anatoly Shipitsin <norguhtar@gmail.com>

---
 recipes/upstart/upstart.inc       |  111 +++++++++++++++++++++++++++++++++++-
 recipes/upstart/upstart_0.3.11.bb |   15 ++++-
 recipes/upstart/upstart_0.3.8.bb  |   14 +++--
 3 files changed, 127 insertions(+), 13 deletions(-)


diff --git a/recipes/upstart/upstart.inc b/recipes/upstart/upstart.inc
index e67774a..7512133 100644
--- a/recipes/upstart/upstart.inc
+++ b/recipes/upstart/upstart.inc
@@ -4,7 +4,7 @@ DEPENDS = ""
 DESCRIPTION = "Event driven system init"
 LICENSE = "GPL"

-inherit autotools pkgconfig
+inherit autotools pkgconfig update-alternatives

 # --enable-compat builds halt, reboot, shutdown tools
 EXTRA_OECONF += "--enable-compat"
@@ -17,6 +17,109 @@ FILES_libupstart-dev += "${libdir}/libupstart.*
${includedir}/upstart/"

 # upstart-sysvcompat provides Sys V Init compatible tools: halt, reboot,
 # shutdown, telinit. These might be needed by other scripts.
-PACKAGES =+ "upstart-sysvcompat upstart-sysvtools-doc"
-FILES_upstart-sysvcompat += "${sbindir}/reboot ${sbindir}/halt
${sbindir}/shutdown ${sbindir}/telinit"
-FILES_upstart-sysvcompat-doc += "${mandir}/*/reboot.*
${mandir}/*/halt.* ${mandir}/*/shutdown.* ${mandir}/*/telinit.*"
+PACKAGES =+ "upstart-sysvcompat upstart-sysvcompat-doc"
+FILES_upstart-sysvcompat += " \
+    ${base_sbindir}/reboot.* ${base_sbindir}/halt.*
${base_sbindir}/poweroff.* \
+    ${base_sbindir}/shutdown.* ${base_sbindir}/telinit
${base_sbindir}/runlevel \
+    ${sysconfdir}/event.d/control-alt-delete \
+    ${sysconfdir}/event.d/rc* \
+    ${sysconfdir}/event.d/sulogin \
+    ${sysconfdir}/init.d \
+    ${sysconfdir}/default/rcS \
+"
+FILES_upstart-sysvcompat-doc += " \
+    ${mandir}/*/reboot.* ${mandir}/*/halt.* ${mandir}/*/poweroff.* \
+     ${mandir}/*/shutdown.* ${mandir}/*/telinit.* ${mandir}/*/runlevel.* \
+"
+
+ALTERNATIVE_NAME = "init"
+ALTERNATIVE_LINK = "${base_sbindir}/init"
+ALTERNATIVE_PATH = "${base_sbindir}/init.${PN}"
+ALTERNATIVE_PRIORITY = "60"
+

+EXTRA_OEMAKE += "'bindir=${base_bindir}' \
+                'sbindir=${base_sbindir}' \
+                'usrbindir=${bindir}' \
+                'usrsbindir=${sbindir}' \
+                'includedir=${includedir}' \
+                'mandir=${mandir}'"
+
+do_install () {
+       oe_runmake 'DESTDIR=${D}' install
+       install -d ${D}${sysconfdir}
+       install -d ${D}${sysconfdir}/default
+       install -d ${D}${sysconfdir}/init.d
+
+       install -m 0644 ${WORKDIR}/init/rcS-default
${D}${sysconfdir}/default/rcS
+       install -m 0755 ${WORKDIR}/init/rc              ${D}${sysconfdir}/init.d
+       install -m 0755 ${WORKDIR}/init/rcS             ${D}${sysconfdir}/init.d
+       install -m 0644 ${WORKDIR}/rc*
${D}${sysconfdir}/event.d
+       install -m 0644 ${WORKDIR}/control-alt-delete
${D}${sysconfdir}/event.d
+       install -m 0644 ${WORKDIR}/sulogin
${D}${sysconfdir}/event.d
+
+       if [ ! -z "${SERIAL_CONSOLE}" ]; then
+            cat <<EOF >> ${D}${sysconfdir}/event.d/tty-serial
+# tty-serial - getty
+#
+# This service maintains a getty on tty-serial from the point the system is
+# started until it is shut down again.
+
+start on runlevel 2
+start on runlevel 3
+start on runlevel 4
+start on runlevel 5
+
+stop on runlevel 0
+stop on runlevel 1
+stop on runlevel 6
+
+respawn
+exec ${base_sbindir}/getty ${SERIAL_CONSOLE}
+EOF
+       fi

+       if [ "${USE_VT}" = "1" ]; then
+           for n in ${SYSVINIT_ENABLED_GETTYS}
+           do
+            cat <<EOF >> ${D}${sysconfdir}/event.d/tty$n
+# tty$n - getty
+#
+# This service maintains a getty on tty$n from the point the system is
+# started until it is shut down again.
+
+start on runlevel 2
+start on runlevel 3
+start on runlevel 4
+start on runlevel 5
+
+stop on runlevel 0
+stop on runlevel 1
+stop on runlevel 6
+
+respawn
+exec ${base_sbindir}/getty 38400 tty$n
+EOF
+           done
+       fi
+
+       mv ${D}${base_sbindir}/init     ${D}${base_sbindir}/init.${PN}
+        mv ${D}${base_sbindir}/halt ${D}${base_sbindir}/halt.${PN}
+       mv ${D}${base_sbindir}/reboot ${D}${base_sbindir}/reboot.${PN}
+        mv ${D}${base_sbindir}/shutdown ${D}${base_sbindir}/shutdown.${PN}
+       mv ${D}${base_sbindir}/poweroff ${D}${base_sbindir}/poweroff.${PN}
+}
+
+pkg_postinst_${PN}-sysvcompat () {
+#!/bin/sh
+update-alternatives --install ${base_sbindir}/reboot reboot reboot.${PN} 200
+update-alternatives --install ${base_sbindir}/halt halt halt.${PN} 200
+update-alternatives --install ${base_sbindir}/poweroff poweroff
poweroff.${PN} 200
+update-alternatives --install ${base_sbindir}/shutdown shutdown
shutdown.${PN} 200
+}
+
+pkg_prerm_${PN}-sysvcompat () {

+#!/bin/sh
+update-alternatives --remove reboot reboot.${PN}
+update-alternatives --remove halt halt.${PN}
+update-alternatives --remove poweroff reboot.${PN}
+update-alternatives --remove shutdown shutdown.${PN}
+}
diff --git a/recipes/upstart/upstart_0.3.11.bb
b/recipes/upstart/upstart_0.3.11.bb
index c4db01b..a0bd17e 100644
--- a/recipes/upstart/upstart_0.3.11.bb
+++ b/recipes/upstart/upstart_0.3.11.bb
@@ -1,11 +1,18 @@
 require upstart.inc

-SRC_URI = "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz2 \
+SRC_URI = "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz2;name=upstart
\
+    http://upstart.ubuntu.com/download/example-jobs/0.3/example-jobs-${PV}.tar.gz;name=compat
\
+    file://init/rcS-default file://init/rc file://init/rcS \
 "

 RRECOMMENDS_${PN} = "libupstart upstart-sysvcompat"

-PR = "r1"
+PR = "r2"

-SRC_URI[md5sum] = "a9e475e1458c876add0441d9d4cfe9c0"
-SRC_URI[sha256sum] =
"d4f7fff9112049eab318518719735d0ac66ff558ed91c2d7c7c41124de2832b6"
+USE_VT ?= "1"
+SYSVINIT_ENABLED_GETTYS ?= "1"
+
+SRC_URI[upstart.md5sum] = "a9e475e1458c876add0441d9d4cfe9c0"
+SRC_URI[upstart.sha256sum] =
"d4f7fff9112049eab318518719735d0ac66ff558ed91c2d7c7c41124de2832b6"
+SRC_URI[compat.md5sum] = "22d66ef8bc9d167eb822bbfecb584107"
+SRC_URI[compat.sha256sum] =
"f53fae7258fcf67cb29d344e53e1548171e4781af11ff4ba92b8b81caab3c315"
diff --git a/recipes/upstart/upstart_0.3.8.bb b/recipes/upstart/upstart_0.3.8.bb
index 1b2cfb5..baf00d2 100644
--- a/recipes/upstart/upstart_0.3.8.bb
+++ b/recipes/upstart/upstart_0.3.8.bb
@@ -1,10 +1,14 @@
 require upstart.inc

-SRC_URI = "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz2 \
+SRC_URI = "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz2;name=upstart
\
+    http://upstart.ubuntu.com/download/example-jobs/0.3/example-jobs-${PV}.tar.gz;name=compat
\
+    file://init/rcS-default file://init/rc file://init/rcS \

+    file://autoconf_version.patch \
+"

 PR = "r1"

-
-SRC_URI[md5sum] = "5cdd2dc3a3f02089c9450edf4e8f4941"
-SRC_URI[sha256sum] =
"9a2a37455ad4e9dd2856b5a0f15adb1a3f84439f60d0f63b041584a2666e9835"
+SRC_URI[upstart.md5sum] = "5cdd2dc3a3f02089c9450edf4e8f4941"
+SRC_URI[upstart.sha256sum] =
"9a2a37455ad4e9dd2856b5a0f15adb1a3f84439f60d0f63b041584a2666e9835"
+SRC_URI[compat.md5sum] = "22d66ef8bc9d167eb822bbfecb584107"
+SRC_URI[compat.sha256sum] =
"f53fae7258fcf67cb29d344e53e1548171e4781af11ff4ba92b8b81caab3c315"


