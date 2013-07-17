Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 51B656B215
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 03:20:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6H3KjWu017417
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 20:20:45 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 16 Jul 2013 20:20:43 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jul 2013 11:20:42 +0800
Message-ID: <1374031242-27577-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] inetutils: several improvement
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
X-List-Received-Date: Wed, 17 Jul 2013 03:20:43 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

1. integrate rexec, rlogin, rsh, telnet, tftpd xinetd startup scripts
2. inherit update-alternatives bbclass, not call update-alternatives directly.
3. package all commands into subpackages

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../inetutils-1.9.1/rexec.xinetd.inetutils         |   20 +++
 .../inetutils-1.9.1/rlogin.xinetd.inetutils        |   23 +++
 .../inetutils/inetutils-1.9.1/rsh.xinetd.inetutils |   21 +++
 .../inetutils-1.9.1/telnet.xinetd.inetutils        |   13 ++
 .../inetutils-1.9.1/tftpd.xinetd.inetutils         |   19 +++
 .../inetutils/inetutils_1.9.1.bb                   |  148 ++++++++++++++++----
 6 files changed, 215 insertions(+), 29 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rexec.xinetd.inetutils
 create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rlogin.xinetd.inetutils
 create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rsh.xinetd.inetutils
 create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/telnet.xinetd.inetutils
 create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/tftpd.xinetd.inetutils

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rexec.xinetd.inetutils
new file mode 100644
index 0000000..80aed36
--- /dev/null
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rexec.xinetd.inetutils
@@ -0,0 +1,20 @@
+# default: off
+# description:
+# Rexecd is the server for the rexec program. The server provides remote 
+# execution facilities with authentication based on user names and 
+# passwords.
+#
+service exec
+{
+	socket_type	= stream
+	protocol	= tcp
+	flags		= NAMEINARGS
+	wait		= no
+	user		= root
+	group		= root
+	log_on_success	+= USERID
+	log_on_failure	+= USERID
+	server		= /usr/bin/tcpd
+	server_args	= /usr/sbin/in.rexecd
+	disable		= yes
+}
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rlogin.xinetd.inetutils
new file mode 100644
index 0000000..00dbf93
--- /dev/null
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rlogin.xinetd.inetutils
@@ -0,0 +1,23 @@
+# default: off
+# description:
+# Rlogind is a server for the rlogin program. The server provides remote 
+# execution with authentication based on privileged port numbers from trusted
+# host
+#
+service login
+{
+	socket_type	= stream
+	protocol	= tcp
+	flags		= NAMEINARGS
+	wait		= no
+	user		= root
+	group		= root
+	log_on_success	+= USERID
+	log_on_failure	+= USERID
+	server		= /usr/bin/tcpd
+	server_args	= /usr/sbin/in.rlogind -a
+	disable		= yes
+}
+							
+							
+							
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rsh.xinetd.inetutils
new file mode 100644
index 0000000..ad59b62
--- /dev/null
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rsh.xinetd.inetutils
@@ -0,0 +1,21 @@
+# default: off
+# description:
+# The rshd server is a server for the rcmd(3) routine and, 
+# consequently, for the rsh(1) program. The server provides 
+# remote execution facilities with authentication based on 
+# privileged port numbers from trusted hosts.
+#
+service shell
+{
+	socket_type	= stream
+	protocol	= tcp
+	flags		= NAMEINARGS
+	wait		= no
+	user		= root
+	group		= root
+	log_on_success	+= USERID
+	log_on_failure	+= USERID
+	server		= /usr/bin/tcpd
+	server_args	= /usr/sbin/in.rshd -aL
+	disable		= yes
+}
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/telnet.xinetd.inetutils
new file mode 100644
index 0000000..2a2a12e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/telnet.xinetd.inetutils
@@ -0,0 +1,13 @@
+# default: on
+# description: The telnet server serves telnet sessions; it uses \
+#       unencrypted username/password pairs for authentication.
+service telnet
+{
+	disable		= no
+	flags		= REUSE
+	socket_type	= stream
+	wait		= no
+	user		= root
+	server		= /usr/sbin/in.telnetd
+	log_on_failure	+= USERID
+}
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/tftpd.xinetd.inetutils
new file mode 100644
index 0000000..f549163
--- /dev/null
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/tftpd.xinetd.inetutils
@@ -0,0 +1,19 @@
+# default: off
+# description:
+# Tftpd is a server which supports the Internet Trivial File Transfer
+# Pro-tocol (RFC 783). The TFTP server operates at the port indicated
+# in the tftp service description; see services(5).
+#
+service tftp
+{
+        disable         = yes
+        socket_type     = dgram
+        protocol        = udp
+        flags           = IPv6
+        wait            = yes
+        user            = root
+        group           = root
+        server          = /usr/sbin/in.tftpd
+        server_args     = /tftpboot
+}
+
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index 603bf01..c55851f 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -3,30 +3,36 @@ networking utilities and servers including ftp, ftpd, rcp, \
 rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
 talkd, telnet, telnetd, tftp, tftpd, and uucpd."
 SECTION = "libs"
-DEPENDS = "ncurses"
+DEPENDS = "ncurses netbase readline"
 LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
 PR = "r1"
-
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://disable-pre-ANSI-compilers.patch \
            file://version.patch \
            file://remove-gets.patch \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
            file://inetutils-1.8-0003-wchar.patch \
-           file://fix-disable-ipv6.patch \
-" 
+           file://rexec.xinetd.inetutils  \
+           file://rlogin.xinetd.inetutils \
+           file://rsh.xinetd.inetutils \
+           file://telnet.xinetd.inetutils \
+           file://tftpd.xinetd.inetutils \
+"
+
 SRC_URI[md5sum] = "944f7196a2b3dba2d400e9088576000c"
 SRC_URI[sha256sum] = "02a9ebde8a198cb85f87545b9d88fb103a183958139864a85fe9e027ad79ff2b"
 
-inherit autotools gettext
+inherit autotools gettext update-alternatives
 
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)}"
 noipv6="${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6 gl_cv_socket_ipv6=no', d)}"
 EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         --with-path-procnet-dev=/proc/net/dev \
         ${noipv6} \
+        --with-path-login=/bin/login \
 "
 
 do_configure_prepend () {
@@ -35,30 +41,114 @@ do_configure_prepend () {
     rm -f ${S}/glob/configure*
 }
 
-do_install () {
-    autotools_do_install
-    install -d ${D}${base_sbindir} ${D}${base_bindir}
-    mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${BPN}
-    mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${BPN}
-    mv ${D}${bindir}/logger ${D}${bindir}/logger.${BPN}
-    mv ${D}${bindir}/traceroute ${D}${bindir}/traceroute.${BPN}
-    mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${BPN}
-    mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/ifconfig.${BPN}
+do_install_append () {
+    install -m 0755 -d ${D}${base_bindir}
+    install -m 0755 -d ${D}${base_sbindir}
+    install -m 0755 -d ${D}${sbindir}
+    install -m 0755 -d ${D}${sysconfdir}/xinetd.d
+    mv ${D}${bindir}/ping ${D}${base_bindir}/
+    mv ${D}${bindir}/ping6 ${D}${base_bindir}/
+    mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/
+    mv ${D}${libexecdir}/syslogd ${D}${base_sbindir}/
+    mv ${D}${bindir}/hostname ${D}${base_bindir}/
+    mv ${D}${libexecdir}/tftpd ${D}${sbindir}/in.tftpd
+    mv ${D}${libexecdir}/telnetd ${D}${sbindir}/in.telnetd
+    mv ${D}${libexecdir}/rexecd ${D}${sbindir}/in.rexecd
+    mv ${D}${libexecdir}/rlogind ${D}${sbindir}/in.rlogind
+    mv ${D}${libexecdir}/rshd ${D}${sbindir}/in.rshd
+    mv ${D}${libexecdir}/talkd ${D}${sbindir}/in.talkd
+    mv ${D}${libexecdir}/uucpd ${D}${sbindir}/in.uucpd
+    mv ${D}${libexecdir}/* ${D}${bindir}/
+    cp ${WORKDIR}/rexec.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rexec
+    cp ${WORKDIR}/rlogin.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rlogin
+    cp ${WORKDIR}/rsh.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rsh
+    cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/telnet
+    cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tftpd
+    rm -rf ${D}${libexecdir}/
 }
 
-pkg_postinst_${PN} () {
-    update-alternatives --install ${bindir}/tftp tftp tftp.${BPN} 100
-    update-alternatives --install ${bindir}/telnet telnet telnet.${BPN} 100
-    update-alternatives --install ${bindir}/logger logger logger.${BPN} 100
-    update-alternatives --install ${bindir}/traceroute traceroute traceroute.${BPN} 100
-    update-alternatives --install ${base_bindir}/hostname hostname hostname.${BPN} 100
-    update-alternatives --install ${base_sbindir}/ifconfig ifconfig ifconfig.${BPN} 100
-}
+PACKAGES =+ "${PN}-ping ${PN}-ping6 ${PN}-hostname ${PN}-ifconfig \
+${PN}-tftp ${PN}-logger ${PN}-traceroute ${PN}-syslogd \
+${PN}-ftp ${PN}-ftpd ${PN}-tftpd ${PN}-telnet ${PN}-telnetd ${PN}-inetd \
+${PN}-rsh ${PN}-rshd"
 
-pkg_prerm_${PN} () {
-    update-alternatives --remove tftp tftp.${BPN}
-    update-alternatives --remove telnet telnet.${BPN}
-    update-alternatives --remove logger logger.${BPN}
-    update-alternatives --remove traceroute traceroute.${BPN}
-    update-alternatives --remove ifconfig ifconfig.${BPN}
-}
+ALTERNATIVE_PRIORITY = "80"
+ALTERNATIVE_${PN} = "talk whois"
+ALTERNATIVE_LINK_NAME[talkd]  = "${sbindir}/in.talkd"
+ALTERNATIVE_LINK_NAME[uucpd]  = "${sbindir}/in.uucpd"
+
+ALTERNATIVE_${PN}-logger = "logger"
+ALTERNATIVE_${PN}-syslogd = "syslogd"
+ALTERNATIVE_LINK_NAME[syslogd]  = "${base_sbindir}/syslogd"
+
+ALTERNATIVE_${PN}-ftp = "ftp"
+ALTERNATIVE_${PN}-ftpd = "ftpd"
+ALTERNATIVE_${PN}-tftp = "tftp"
+ALTERNATIVE_${PN}-tftpd = "tftpd"
+ALTERNATIVE_LINK_NAME_${PN}-tftpd = "${bindir}/tftpd"
+ALTERNATIVE_TARGET_${PN}-tftpd  = "${sbindir}/in.tftpd"
+
+ALTERNATIVE_${PN}-telnet = "telnet"
+ALTERNATIVE_${PN}-telnetd = "telnetd"
+ALTERNATIVE_LINK_NAME_${PN}-telnetd = "${bindir}/telnetd"
+ALTERNATIVE_TARGET_${PN}-telnetd = "${sbindir}/in.telnetd"
+
+ALTERNATIVE_${PN}-rsh = "rcp rexec rlogin rsh"
+ALTERNATIVE_${PN}-rshd = "rshd rexecd rlogind"
+ALTERNATIVE_LINK_NAME_${PN}-rshd = "${bindir}/rshd"
+ALTERNATIVE_TARGET_${PN}-rshd = "${sbindir}/in.rshd"
+ALTERNATIVE_LINK_NAME_${PN}-rexecd = "${bindir}/rexecd"
+ALTERNATIVE_TARGET_${PN}-rexecd = "${sbindir}/in.rexecd"
+ALTERNATIVE_LINK_NAME_${PN}-rlogind = "${bindir}/rlogind"
+ALTERNATIVE_TARGET_${PN}-rlogind = "${sbindir}/in.rlogind"
+
+ALTERNATIVE_${PN}-inetd= "inetd"
+ALTERNATIVE_${PN}-traceroute = "traceroute"
+
+ALTERNATIVE_${PN}-hostname = "hostname"
+ALTERNATIVE_LINK_NAME[hostname]  = "${base_bindir}/hostname"
+
+ALTERNATIVE_${PN}-ifconfig = "ifconfig"
+ALTERNATIVE_LINK_NAME[ifconfig]  = "${base_sbindir}/ifconfig"
+
+ALTERNATIVE_${PN}-ping = "ping"
+ALTERNATIVE_LINK_NAME[ping]   = "${base_bindir}/ping"
+
+ALTERNATIVE_${PN}-ping6 = "ping6"
+ALTERNATIVE_LINK_NAME[ping6]  = "${base_bindir}/ping6"
+
+
+FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
+FILES_${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
+FILES_${PN}-hostname = "${base_bindir}/hostname.${BPN}"
+FILES_${PN}-ifconfig = "${base_sbindir}/ifconfig.${BPN}"
+FILES_${PN}-traceroute = "${bindir}/traceroute.${BPN}"
+FILES_${PN}-logger = "${bindir}/logger.${BPN}"
+FILES_${PN}-syslogd = "${base_sbindir}/syslogd.${BPN}"
+FILES_${PN}-ftp = "${bindir}/ftp.${BPN}"
+
+FILES_${PN}-tftp = "${bindir}/tftp.${BPN}"
+FILES_${PN}-telnet = "${bindir}/telnet.${BPN}"
+FILES_${PN}-rsh = "${bindir}/rsh.${BPN} ${bindir}/rlogin.${BPN} ${bindir}/rexec.${BPN} ${bindir}/rcp.${BPN}"
+
+FILES_${PN}-rshd = "${sbindir}/in.rshd ${sbindir}/in.rlogind ${sbindir}/in.rexecd \
+                    ${sysconfdir}/xinetd.d/rsh ${sysconfdir}/xinetd.d/rlogin ${sysconfdir}/xinetd.d/rexec"
+RDEPENDS_${PN}-rshd += "xinetd tcp-wrappers"
+RCONFLICTS_${PN}-rshd += "netkit-rshd"
+RPROVIDES_${PN}-rshd = "rshd"
+
+FILES_${PN}-ftpd = "${bindir}/ftpd.${BPN}"
+RDEPENDS_${PN}-ftpd += "xinetd"
+
+FILES_${PN}-tftpd = "${sbindir}/in.tftpd ${sysconfdir}/xinetd.d/tftpd"
+RCONFLICTS_${PN}-tftpd += "netkit-tftpd"
+RDEPENDS_${PN}-tftpd += "xinetd"
+
+FILES_${PN}-telnetd = "${sbindir}/in.telnetd ${sysconfdir}/xinetd.d/telnet"
+RCONFLICTS_${PN}-telnetd += "netkit-telnetd"
+RPROVIDES_${PN}-telnetd = "telnetd"
+RDEPENDS_${PN}-telnetd += "xinetd"
+
+FILES_${PN}-inetd = "${bindir}/inetd.${BPN}"
+
+RDEPENDS_${PN} = "xinetd"
-- 
1.7.10.4


