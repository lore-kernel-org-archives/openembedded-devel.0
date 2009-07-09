Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MOueI-00044s-KC
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 16:30:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id A4E754E0090;
	Thu,  9 Jul 2009 10:18:12 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07157-04; Thu,  9 Jul 2009 10:18:12 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 840EE50089D; Thu,  9 Jul 2009 10:18:12 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id DB17A4E0090;
	Thu,  9 Jul 2009 10:18:10 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id D259040151; Thu,  9 Jul 2009 10:18:10 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jul 2009 10:18:09 -0400
Message-Id: <1247149089-23480-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] openssh.inc: cleanup
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
X-List-Received-Date: Thu, 09 Jul 2009 14:30:59 -0000

Because of leading slashes in FILES_*, some files were being installed
twice: e.g. /etc/ssh/moduli was in both openssh and openssh-sshd. Now
openssh is an empty metapackage, which I think was the plan.

Other cleanups:
* switch to INC_PR
* remove dangling slogin symlink to ssh to fix warning
* remove FILES_openssh-dbg line, which had a syntax error and doesn't
  appear necessary to keep debug out of the openssh-misc package anymore.
* rename package ssh-keygen to openssh-keygen for consistency
* use ${PN} in variable names

Tested with 5.2p1.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/openssh/openssh.inc      |   57 ++++++++++++++++++++------------------
 recipes/openssh/openssh_4.6p1.bb |    2 +-
 recipes/openssh/openssh_5.2p1.bb |    3 ++
 3 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/recipes/openssh/openssh.inc b/recipes/openssh/openssh.inc
index 6c33142..086c901 100644
--- a/recipes/openssh/openssh.inc
+++ b/recipes/openssh/openssh.inc
@@ -1,7 +1,7 @@
 DEPENDS = "zlib openssl"
 
-RCONFLICTS_openssh = "dropbear"
-RCONFLICTS_openssh-sshd = "dropbear"
+RCONFLICTS_${PN} = "dropbear"
+RCONFLICTS_${PN}-sshd = "dropbear"
 
 SECTION = "console/network"
 DESCRIPTION = "Secure rlogin/rsh/rcp/telnet replacement (OpenSSH) \
@@ -15,6 +15,8 @@ used to provide applications with a secure communication channel."
 HOMEPAGE = "http://www.openssh.org/"
 LICENSE = "BSD"
 
+INC_PR = "r7"
+
 inherit autotools
 
 export ASKPASS_PROGRAM = "${bindir}/ssh-askpass"
@@ -45,27 +47,27 @@ do_compile_append () {
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
-	mv ${D}${bindir}/scp ${D}${bindir}/scp.openssh
-	mv ${D}${bindir}/ssh ${D}${bindir}/ssh.openssh
+	mv ${D}${bindir}/scp ${D}${bindir}/scp.${PN}
+	mv ${D}${bindir}/ssh ${D}${bindir}/ssh.${PN}
+	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
 	rmdir ${D}/var/run/sshd ${D}/var/run ${D}/var
 }
 
-PACKAGES =+ " ssh-keygen openssh-scp openssh-ssh openssh-sshd openssh-sftp openssh-misc openssh-sftp-server"
-FILES_openssh-dbg +=${bindir}/.debug ${libdir}exec/.debug"
-FILES_openssh-scp = "${bindir}/scp.${PN}"
-FILES_openssh-ssh = "${bindir}/ssh.${PN} ${bindir}/slogin /${sysconfdir}/ssh/ssh_config"
-FILES_openssh-sshd = "${sbindir}/sshd /${sysconfdir}/init.d/sshd"
-FILES_openssh-sshd += " /${sysconfdir}/ssh/moduli /${sysconfdir}/ssh/sshd_config"
-FILES_openssh-sftp = "${bindir}/sftp"
-FILES_openssh-sftp-server = "${libdir}exec/sftp-server"
-FILES_openssh-misc = "${bindir}/ssh* ${libdir}exec/ssh*"
-FILES_ssh-keygen = "${bindir}/ssh-keygen"
-
-RDEPENDS_openssh += " openssh-scp openssh-ssh openssh-sshd ssh-keygen "
-DEPENDS_openssh-sshd += " update-rc.d"
-RDEPENDS_openssh-sshd += " update-rc.d ssh-keygen "
-
-pkg_postinst_openssh-sshd() {
+PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
+FILES_${PN}-scp = "${bindir}/scp.${PN}"
+FILES_${PN}-ssh = "${bindir}/ssh.${PN} ${sysconfdir}/ssh/ssh_config"
+FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
+FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config"
+FILES_${PN}-sftp = "${bindir}/sftp"
+FILES_${PN}-sftp-server = "${libdir}exec/sftp-server"
+FILES_${PN}-misc = "${bindir}/ssh* ${libdir}exec/ssh*"
+FILES_${PN}-keygen = "${bindir}/ssh-keygen"
+
+RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
+DEPENDS_${PN}-sshd += "update-rc.d"
+RDEPENDS_${PN}-sshd += "update-rc.d ${PN}-keygen"
+
+pkg_postinst_${PN}-sshd() {
 if test "x$D" != "x"; then
 	exit 1
 else
@@ -75,23 +77,23 @@ else
 fi
 }
 
-pkg_postinst_openssh-scp() {
+pkg_postinst_${PN}-scp() {
 	update-alternatives --install ${bindir}/scp scp scp.${PN} 90
 }
 
-pkg_postinst_openssh-ssh() {
+pkg_postinst_${PN}-ssh() {
 	update-alternatives --install ${bindir}/ssh ssh ssh.${PN} 90
 }
 
-pkg_postrm_openssh-ssh() {
+pkg_postrm_${PN}-ssh() {
         update-alternatives --remove ${bindir}/ssh ssh.${PN}
 }
 
-pkg_postrm_openssh-scp() {
+pkg_postrm_${PN}-scp() {
         update-alternatives --remove ${bindir}/scp scp.${PN}
 }
 
-pkg_postrm_openssh-sshd() {
+pkg_postrm_${PN}-sshd() {
 if test "x$D" != "x"; then
 	exit 1
 else
@@ -102,5 +104,6 @@ else
 fi
 }
 
-CONFFILES_openssh-sshd = "${sysconfdir}/ssh/sshd_config"
-CONFFILES_openssh-ssh = "${sysconfdir}/ssh/ssh_config"
+ALLOW_EMPTY_${PN} = "1"
+CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
+CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
diff --git a/recipes/openssh/openssh_4.6p1.bb b/recipes/openssh/openssh_4.6p1.bb
index f5ca4de..7fa2f09 100644
--- a/recipes/openssh/openssh_4.6p1.bb
+++ b/recipes/openssh/openssh_4.6p1.bb
@@ -5,4 +5,4 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://ssh_config \
            file://init \
 	   "
-PR = "r6"
+PR = "${INC_PR}.0"
diff --git a/recipes/openssh/openssh_5.2p1.bb b/recipes/openssh/openssh_5.2p1.bb
index 55227ca..86c51bb 100644
--- a/recipes/openssh/openssh_5.2p1.bb
+++ b/recipes/openssh/openssh_5.2p1.bb
@@ -1,4 +1,7 @@
 require openssh.inc
+
+PR = "${INC_PR}.0"
+
 DEFAULT_PREFERENCE = "-1" 
 #not tested extensively(I tested only ssh) and it's an important recipe I'm afraid to broke
 SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
-- 
1.6.3



