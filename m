Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1SWSLa-0001T3-JD
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 15:08:26 +0200
Received: by localhost (Postfix, from userid 1000)
	id DFA624439DF; Mon, 21 May 2012 14:58:18 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 May 2012 14:58:04 +0200
Message-Id: <1337605084-9265-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Cc: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
Subject: [PATCH] OpenSSH/dropbear: introducing update-alternatives for server component
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
X-List-Received-Date: Mon, 21 May 2012 13:08:26 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/dropbear/dropbear.inc |   49 ++++++++++++++++++++++++++---
 recipes/openssh/openssh.inc   |   68 +++++++++++++++++++++++++++-------------
 2 files changed, 90 insertions(+), 27 deletions(-)

diff --git a/recipes/dropbear/dropbear.inc b/recipes/dropbear/dropbear.inc
index d69c23b..ba40a22 100644
--- a/recipes/dropbear/dropbear.inc
+++ b/recipes/dropbear/dropbear.inc
@@ -6,7 +6,7 @@ DEPENDS = "zlib"
 PROVIDES = "ssh sshd"
 RPROVIDES_${PN} = "ssh sshd"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 SRC_URI = "\
   http://matt.ucc.asn.au/dropbear/dropbear-${PV}.tar.bz2 \
@@ -18,10 +18,7 @@ SRC_URI = "\
   file://default \
 "
 
-inherit autotools update-rc.d
-
-INITSCRIPT_NAME = "dropbear"
-INITSCRIPT_PARAMS = "defaults 10"
+inherit autotools
 
 CFLAGS =+ "-I."
 LD = "${CC}"
@@ -64,9 +61,38 @@ do_install() {
 	fi
 }
 
+# sshd initscript is handled explicitly because order of
+# update-rc.d and update-alternatives is important
+DEPENDS_append = " update-rc.d update-rc.d-native"
+RDEPENDS_${PN}_append = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
+
 pkg_postinst () {
 	update-alternatives --install ${bindir}/scp scp ${sbindir}/dropbearmulti 20
 	update-alternatives --install ${bindir}/ssh ssh ${sbindir}/dropbearmulti 20
+
+	update-alternatives --install ${sysconfdir}/init.d/sshd sshd dropbear 20
+
+	if test "x$D" != "x"; then
+		OPT="-r $D"
+	else
+		OPT="-s"
+	fi
+	# remove all rc.d-links potentially created from older dropbear or
+	# alternative sshd packages before creating new ones
+	update-rc.d $OPT -f dropbear remove
+	update-rc.d $OPT -f sshd remove
+	update-rc.d $OPT sshd defaults
+
+}
+
+pkg_prerm () {
+	if test "x$D" = "x"; then
+		if test "$1" = "upgrade" -o "$1" = "remove"; then
+			/etc/init.d/sshd stop
+		fi
+	fi
+
+	update-alternatives --remove sshd dropbear
 }
 
 pkg_postrm_append () {
@@ -78,6 +104,19 @@ pkg_postrm_append () {
 	fi
 	update-alternatives --remove ssh ${bindir}/dropbearmulti
 	update-alternatives --remove scp ${bindir}/dropbearmulti
+
+	if test "x$D" != "x"; then
+		OPT="-r $D"
+	else
+		OPT=""
+	fi
+	if test "$1" = "remove" -o "$1" = "purge"; then
+		if ! test -e "/etc/init.d/sshd"; then
+			update-rc.d $OPT sshd remove
+		fi
+	fi
 }
 
 CONFFILES_${PN} += "${sysconfdir}/default/dropbear"
+
+INITSCRIPT_NAME = "sshd"
diff --git a/recipes/openssh/openssh.inc b/recipes/openssh/openssh.inc
index 4555d34..5563d41 100644
--- a/recipes/openssh/openssh.inc
+++ b/recipes/openssh/openssh.inc
@@ -1,8 +1,6 @@
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-RCONFLICTS_${PN} = "dropbear"
-RCONFLICTS_${PN}-sshd = "dropbear"
 RCONFLICTS_${PN}-keygen = "ssh-keygen"
 
 SECTION = "console/network"
@@ -17,7 +15,7 @@ used to provide applications with a secure communication channel."
 HOMEPAGE = "http://www.openssh.org/"
 LICENSE = "BSD"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 inherit autotools
 
@@ -56,7 +54,7 @@ do_compile_append () {
 
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd.openssh
 	mv ${D}${bindir}/scp ${D}${bindir}/scp.${PN}
 	mv ${D}${bindir}/ssh ${D}${bindir}/ssh.${PN}
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
@@ -66,7 +64,7 @@ do_install_append() {
 PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
 FILES_${PN}-scp = "${bindir}/scp.${PN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${PN} ${sysconfdir}/ssh/ssh_config"
-FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
+FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd.openssh"
 FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config"
 FILES_${PN}-sftp = "${bindir}/sftp"
 FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
@@ -74,17 +72,27 @@ FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
 FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
-DEPENDS_${PN}-sshd += "update-rc.d"
-RDEPENDS_${PN}-sshd += "update-rc.d ${PN}-keygen"
+RDEPENDS_${PN}-sshd += "${PN}-keygen"
+
+# sshd initscript is handled explicitly because order of
+# update-rc.d and update-alternatives is important
+DEPENDS_${PN}-sshd_append = " update-rc.d update-rc.d-native"
+RDEPENDS_${PN}-sshd_append = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
 pkg_postinst_${PN}-sshd() {
-if test "x$D" != "x"; then
-	exit 1
-else
-	addgroup sshd
-	adduser --system --home /var/run/sshd --no-create-home --disabled-password --ingroup sshd -s /bin/false sshd
-	update-rc.d sshd defaults 9
-fi
+	update-alternatives --install ${sysconfdir}/init.d/sshd sshd sshd.${PN} 90
+
+	if test "x$D" != "x"; then
+		OPT="-r $D"
+	else
+		OPT="-s"
+		addgroup sshd
+		adduser --system --home /var/run/sshd --no-create-home --disabled-password --ingroup sshd -s /bin/false sshd
+	fi
+	# remove all rc.d-links potentially created from alternative
+	# sshd packages before creating new ones
+	update-rc.d $OPT -f sshd remove
+	update-rc.d $OPT sshd defaults
 }
 
 pkg_postinst_${PN}-scp() {
@@ -95,6 +103,16 @@ pkg_postinst_${PN}-ssh() {
 	update-alternatives --install ${bindir}/ssh ssh ssh.${PN} 90
 }
 
+pkg_prerm_${PN}-sshd() {
+	if test "x$D" = "x"; then
+		if test "$1" = "upgrade" -o "$1" = "remove"; then
+			/etc/init.d/sshd stop
+		fi
+	fi
+
+	update-alternatives --remove sshd sshd.${PN}
+}
+
 pkg_postrm_${PN}-ssh() {
         update-alternatives --remove ${bindir}/ssh ssh.${PN}
 }
@@ -104,16 +122,22 @@ pkg_postrm_${PN}-scp() {
 }
 
 pkg_postrm_${PN}-sshd() {
-if test "x$D" != "x"; then
-	exit 1
-else
-	${sysconfdir}/init.d/sshd stop
-	deluser sshd
-	delgroup sshd
-	update-rc.d -f sshd remove
-fi
+	if test "x$D" != "x"; then
+		OPT="-r $D"
+	else
+		OPT=""
+		deluser sshd
+		delgroup sshd
+	fi
+	if test "$1" = "remove" -o "$1" = "purge"; then
+		if ! test -e "/etc/init.d/sshd"; then
+			update-rc.d $OPT sshd remove
+		fi
+	fi
 }
 
 ALLOW_EMPTY_${PN} = "1"
 CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
 CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
+
+INITSCRIPT_NAME_${PN}-sshd = "sshd"
-- 
1.7.7



