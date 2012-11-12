Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1TXsJa-0001ti-EO
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 12:36:30 +0100
Received: from mail218-tx2-R.bigfish.com (10.9.14.237) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Mon, 12 Nov 2012 10:37:25 +0000
Received: from mail218-tx2 (localhost [127.0.0.1])	by
	mail218-tx2-R.bigfish.com (Postfix) with ESMTP id 42B87401A7	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 10:37:25 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1de0h1202h1d1ah1d2ahzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h1155h)
Received: from mail218-tx2 (localhost.localdomain [127.0.0.1]) by mail218-tx2
	(MessageSwitch) id 1352716643238382_825;
	Mon, 12 Nov 2012 10:37:23 +0000 (UTC)
Received: from TX2EHSMHS031.bigfish.com (unknown [10.9.14.248])	by
	mail218-tx2.bigfish.com (Postfix) with ESMTP id 2E4BB94005E	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 10:37:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS031.bigfish.com
	(10.9.99.131) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 12 Nov 2012 10:37:23 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Mon, 12 Nov 2012 10:37:22 +0000
Received: from localhost.localdomain (guo-desktop.ap.freescale.net
	[10.192.208.249])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id qACAbIcS012244;	Mon, 12 Nov 2012 03:37:20 -0700
From: Chunrong Guo <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Nov 2012 18:37:27 +0800
Message-ID: <1352716647-8613-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B29882@freescale.com, B19537@freescale.com
Subject: [meta-oe ] inetutils : Update to 1.9.1
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
X-List-Received-Date: Mon, 12 Nov 2012 11:36:30 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <b40290@freescale.com>
---
 .../disable-pre-ANSI-compilers.patch               |   11 ++++
 .../inetutils/inetutils-1.9.1/remove-gets.patch    |   16 +++++
 .../inetutils/inetutils-1.9.1/version.patch        |   12 ++++
 .../inetutils/inetutils_1.9.1.bb                   |   61 ++++++++++++++++++++
 4 files changed, 100 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/version.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils_1.9.1.bb

diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch
new file mode 100644
index 0000000..b200e58
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch
@@ -0,0 +1,11 @@
+--- inetutils-1.9.1/configure.ac	2012-01-06 22:05:05.000000000 +0800
++++ inetutils-1.9.1/configure.ac	2012-11-12 14:05:30.756957063 +0800
+@@ -586,7 +586,7 @@
+ 		  #include <arpa/tftp.h>])
+ 
+ ### Checks for compiler characteristics.
+-AM_C_PROTOTYPES dnl FIXME: Does inetutils even compile on pre-ANSI compilers?
++#AM_C_PROTOTYPES dnl FIXME: Does inetutils even compile on pre-ANSI compilers?
+ AC_C_CONST
+ 
+ dnl See if `weak refs' are possible; these make it possible (with shared
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch
new file mode 100644
index 0000000..92abef1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch
@@ -0,0 +1,16 @@
+--- inetutils-1.9.1.org/lib/stdio.in.h	2012-01-06 22:11:13.000000000 +0800
++++ inetutils-1.9.1/lib/stdio.in.h	2012-11-12 14:30:49.044958001 +0800
+@@ -715,9 +715,13 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
++#undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
+ #endif
+ 
++#endif
++
+ 
+ #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
+ struct obstack;
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/version.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/version.patch
new file mode 100644
index 0000000..6eefcf4
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.9.1/version.patch
@@ -0,0 +1,12 @@
+--- inetutils-1.9.1/configure.ac	2012-01-06 22:05:05.000000000 +0800
++++ inetutils-1.9.1/configure.ac	2012-11-12 14:01:11.732957019 +0800
+@@ -20,8 +20,7 @@
+ 
+ AC_PREREQ(2.59)
+ 
+-AC_INIT([GNU inetutils],
+- m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils-/v/;s/_/./g']),
++AC_INIT([GNU inetutils],[1.9.1],
+  [bug-inetutils@gnu.org])
+ 
+ AC_CONFIG_SRCDIR([src/inetd.c])
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-oe/recipes-connectivity/inetutils/inetutils_1.9.1.bb
new file mode 100644
index 0000000..2fc9b45
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -0,0 +1,61 @@
+DESCRIPTION = "The GNU inetutils are a collection of common \
+networking utilities and servers including ftp, ftpd, rcp, \
+rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
+talkd, telnet, telnetd, tftp, tftpd, and uucpd."
+SECTION = "libs"
+DEPENDS = "ncurses"
+LICENSE = "GPLv3"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
+
+PR = "r1"
+
+SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
+           file://disable-pre-ANSI-compilers.patch \
+           file://version.patch \
+           file://remove-gets.patch \
+" 
+SRC_URI[md5sum] = "944f7196a2b3dba2d400e9088576000c"
+SRC_URI[sha256sum] = "02a9ebde8a198cb85f87545b9d88fb103a183958139864a85fe9e027ad79ff2b"
+
+inherit autotools gettext
+
+noipv6="${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6 gl_cv_socket_ipv6=no', d)}"
+EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
+		--with-path-procnet-dev=/proc/net/dev \
+		${noipv6} \
+		"
+
+do_configure_prepend () {
+	export HELP2MAN='true'
+	cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
+	rm -f ${S}/glob/configure*
+}
+
+do_install () {
+	autotools_do_install
+	install -d ${D}${base_sbindir} ${D}${base_bindir}
+	mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${PN}
+	mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${PN}
+	mv ${D}${bindir}/logger ${D}${bindir}/logger.${PN}
+	mv ${D}${bindir}/traceroute ${D}${bindir}/traceroute.${PN}
+	mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${PN}
+	mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/ifconfig.${PN}
+}
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${bindir}/tftp tftp tftp.${PN} 100
+	update-alternatives --install ${bindir}/telnet telnet telnet.${PN} 100
+	update-alternatives --install ${bindir}/logger logger logger.${PN} 100
+	update-alternatives --install ${bindir}/traceroute traceroute traceroute.${PN} 100
+	update-alternatives --install ${base_bindir}/hostname hostname hostname.${PN} 100
+	update-alternatives --install ${base_sbindir}/ifconfig ifconfig ifconfig.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+	update-alternatives --remove tftp tftp.${PN}
+	update-alternatives --remove telnet telnet.${PN}
+	update-alternatives --remove logger logger.${PN}
+	update-alternatives --remove traceroute traceroute.${PN}
+	update-alternatives --remove ifconfig ifconfig.${PN}
+}
-- 
1.7.0.4




