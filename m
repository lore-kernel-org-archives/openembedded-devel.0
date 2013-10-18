Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe003.messaging.microsoft.com [216.32.180.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E20A6C76F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:22:31 +0000 (UTC)
Received: from mail211-va3-R.bigfish.com (10.7.14.227) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.22; Fri, 18 Oct 2013 08:22:31 +0000
Received: from mail211-va3 (localhost [127.0.0.1])	by
	mail211-va3-R.bigfish.com (Postfix) with ESMTP id DC424C00238	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:22:31 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275dh1de097h186068h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail211-va3 (localhost.localdomain [127.0.0.1]) by mail211-va3
	(MessageSwitch) id 1382084549276139_7436;
	Fri, 18 Oct 2013 08:22:29 +0000 (UTC)
Received: from VA3EHSMHS032.bigfish.com (unknown [10.7.14.253])	by
	mail211-va3.bigfish.com (Postfix) with ESMTP id 402E84003E	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:22:29 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS032.bigfish.com
	(10.7.99.42) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 18 Oct 2013 08:22:25 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 18 Oct 2013 08:22:24 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r9I8MLqW019899;	Fri, 18 Oct 2013 01:22:22 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Oct 2013 16:22:17 +0800
Message-ID: <1382084537-10877-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-networking][PATCH v2 1/3] snort : add recipe
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
X-List-Received-Date: Fri, 18 Oct 2013 08:22:32 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

   *snort - a free lightweight network intrusion detection
                system for UNIX and Windows

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../snort/files/disable-dap-address-space-id.patch |   52 ++++++++++++++
 .../snort/files/disable-inaddr-none.patch          |   75 ++++++++++++++++++++
 .../recipes-connectivity/snort/snort_2.9.4.6.bb    |   64 +++++++++++++++++
 3 files changed, 191 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb

diff --git a/meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch b/meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch
new file mode 100644
index 0000000..39e5c9c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch
@@ -0,0 +1,52 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+fix the below error:
+checking for dap address space id... configure: 
+configure: error: cannot run test program while cross compiling
+
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+--- a/configure.in	2013-08-23 00:06:37.239361932 -0500
++++ b/configure.in	2013-08-23 00:07:32.860266534 -0500
+@@ -679,23 +679,23 @@
+ 
+ AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta])
+ 
+-AC_MSG_CHECKING([for daq address space ID])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.address_space_id = 0;
+-]])],
+-[have_daq_address_space_id="yes"],
+-[have_daq_address_space_id="no"])
+-AC_MSG_RESULT($have_daq_address_space_id)
+-if test "x$have_daq_address_space_id" = "xyes"; then
+-    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
+-        [DAQ version supports address space ID in header.])
+-fi
++#AC_MSG_CHECKING([for daq address space ID])
++#AC_RUN_IFELSE(
++#[AC_LANG_PROGRAM(
++#[[
++##include <daq.h>
++#]],
++#[[
++#   DAQ_PktHdr_t hdr;
++#   hdr.address_space_id = 0;
++#]])],
++have_daq_address_space_id="yes"
++#[have_daq_address_space_id="no"])
++#AC_MSG_RESULT($have_daq_address_space_id)
++#if test "x$have_daq_address_space_id" = "xyes"; then
++#    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
++#        [DAQ version supports address space ID in header.])
++#fi
+ 
+ # any sparc platform has to have this one defined.
+ AC_MSG_CHECKING(for sparc)
diff --git a/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch
new file mode 100644
index 0000000..9dafe63
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch
@@ -0,0 +1,75 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+fix the below error:
+checking for INADDR_NONE... configure:
+configure: error: cannot run test program while cross compiling
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+
+--- a/configure.in	2013-08-21 03:56:17.197414789 -0500
++++ b/configure.in	2013-08-21 23:19:05.298553560 -0500
+@@ -281,25 +281,7 @@
+ AC_CHECK_TYPES([boolean])
+ 
+ # In case INADDR_NONE is not defined (like on Solaris)
+-have_inaddr_none="no"
+-AC_MSG_CHECKING([for INADDR_NONE])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <sys/types.h>
+-#include <netinet/in.h>
+-#include <arpa/inet.h>
+-]],
+-[[
+-	if (inet_addr("10,5,2") == INADDR_NONE);
+-    return 0;
+-]])],
+-[have_inaddr_none="yes"],
+-[have_inaddr_none="no"])
+-AC_MSG_RESULT($have_inaddr_none)
+-if test "x$have_inaddr_none" = "xno"; then
+-	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
+-fi
++have_inaddr_none="yes"
+ 
+ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include <stdio.h>
+@@ -397,21 +379,21 @@
+   fi
+ fi
+ 
+-AC_MSG_CHECKING([for pcap_lex_destroy])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <pcap.h>
+-]],
+-[[
+-   pcap_lex_destroy();
+-]])],
+-[have_pcap_lex_destroy="yes"],
+-[have_pcap_lex_destroy="no"])
+-AC_MSG_RESULT($have_pcap_lex_destroy)
+-if test "x$have_pcap_lex_destroy" = "xyes"; then
+-    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack created by pcap bpf filter])
+-fi
++#AC_MSG_CHECKING([for pcap_lex_destroy])
++#AC_RUN_IFELSE(
++#[AC_LANG_PROGRAM(
++#[[
++##include <pcap.h>
++#]],
++#[[
++#   pcap_lex_destroy();
++#]])],
++have_pcap_lex_destroy="yes"
++#[have_pcap_lex_destroy="no"])
++#AC_MSG_RESULT($have_pcap_lex_destroy)
++#if test "x$have_pcap_lex_destroy" = "xyes"; then
++#    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack created by pcap bpf filter])
++#fi
+ 
+ AC_MSG_CHECKING([for pcap_lib_version])
+ AC_LINK_IFELSE(
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
new file mode 100644
index 0000000..8639639
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
@@ -0,0 +1,64 @@
+DESCRIPTION = "snort - a free lightweight network intrusion detection system for UNIX and Windows."
+HOMEPAGE = "http://www.snort.org/"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
+
+DEPENDS = "libpcap libpcre daq libdnet"
+
+
+SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
+            file://disable-inaddr-none.patch \
+            file://disable-dap-address-space-id.patch "
+
+SRC_URI[tarball.md5sum] = "4111df01a4f21bd1d328a18b76d625bd"
+SRC_URI[tarball.sha256sum] = "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6186a014baa451d43cdb0b3bc"
+
+inherit autotools  gettext 
+
+EXTRA_OECONF = " \
+	--enable-gre \    
+	--enable-linux-smp-stats \
+	--enable-reload \
+	--enable-reload-error-restart \
+	--enable-targetbased \
+	--disable-static-daq \
+	"
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/snort/rules
+	install -d ${D}/${sysconfdir}/snort/preproc_rules
+	for i in map config conf dtd; do
+		cp ${S}/etc/*.$i ${D}/${sysconfdir}/snort/
+	done
+	cp ${S}/preproc_rules/*.rules ${D}/${sysconfdir}/snort/preproc_rules/
+	mkdir -p ${D}/${localstatedir}/log/snort
+}
+
+FILES_${PN} += " \
+	${libdir}/snort_dynamicengine/*.so.* \
+	${libdir}/snort_dynamicpreprocessor/*.so.* \
+	${libdir}/snort_dynamicrules/*.so.* \
+	"
+FILES_${PN}-dbg += " \
+	${libdir}/snort_dynamicengine/.debug \
+	${libdir}/snort_dynamicpreprocessor/.debug \
+	${libdir}/snort_dynamicrules/.debug \
+	"
+FILES_${PN}-staticdev += " \
+	${libdir}/snort_dynamicengine/*.a \
+	${libdir}/snort_dynamicpreprocessor/*.a \
+	${libdir}/snort_dynamicrules/*.a \
+	${libdir}/snort/dynamic_preproc/*.a \
+	${libdir}/snort/dynamic_output/*.a \
+	"
+FILES_${PN}-dev += " \
+	${libdir}/snort_dynamicengine/*.la \
+	${libdir}/snort_dynamicpreprocessor/*.la \
+	${libdir}/snort_dynamicrules/*.la \
+	${libdir}/snort_dynamicengine/*.so \
+	${libdir}/snort_dynamicpreprocessor/*.so \
+	${libdir}/snort_dynamicrules/*.so \
+	${prefix}/src/snort_dynamicsrc \
+	"
+
+RRECOMMENDS_${PN} += "barnyard"
-- 
1.7.5.4



