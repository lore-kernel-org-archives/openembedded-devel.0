Return-Path: <B40290@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe002.messaging.microsoft.com [213.199.154.205])
	by mail.openembedded.org (Postfix) with ESMTP id C47076D257
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 02:23:39 +0000 (UTC)
Received: from mail34-am1-R.bigfish.com (10.3.201.235) by
	AM1EHSOBE010.bigfish.com (10.3.204.30) with Microsoft SMTP Server id
	14.1.225.22; Mon, 28 Oct 2013 02:23:40 +0000
Received: from mail34-am1 (localhost [127.0.0.1])	by mail34-am1-R.bigfish.com
	(Postfix) with ESMTP id 7E10E60087	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 02:23:40 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz9371I936eI542Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275bh8275dh1de097h186068hz2dh2a8h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5h21a6hbe9i1155h)
Received: from mail34-am1 (localhost.localdomain [127.0.0.1]) by mail34-am1
	(MessageSwitch) id 1382927018619665_32529;
	Mon, 28 Oct 2013 02:23:38 +0000 (UTC)
Received: from AM1EHSMHS012.bigfish.com (unknown [10.3.201.236])	by
	mail34-am1.bigfish.com (Postfix) with ESMTP id 9485B4A0055	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 02:23:38 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS012.bigfish.com
	(10.3.207.112) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 28 Oct 2013 02:23:38 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.249]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.03.0158.002; Mon, 28 Oct 2013 02:23:36 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: Guo Chunrong-B40290 <B40290@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH v2 1/3] snort : add recipe
Thread-Index: AQHOy9ssoLjaSOZ6ikmIjj030S8NA5oJcaVA
Date: Mon, 28 Oct 2013 02:23:35 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E10491537@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1382084537-10877-1-git-send-email-b40290@freescale.com>
In-Reply-To: <1382084537-10877-1-git-send-email-b40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.206]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: Re: [meta-networking][PATCH v2 1/3] snort : add recipe
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
X-List-Received-Date: Mon, 28 Oct 2013 02:23:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

pings

-----Original Message-----
From: Guo Chunrong-B40290=20
Sent: Friday, October 18, 2013 4:22 PM
To: openembedded-devel@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290
Subject: [meta-networking][PATCH v2 1/3] snort : add recipe

From: Chunrong Guo <B40290@freescale.com>

   *snort - a free lightweight network intrusion detection
                system for UNIX and Windows

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../snort/files/disable-dap-address-space-id.patch |   52 ++++++++++++++
 .../snort/files/disable-inaddr-none.patch          |   75 ++++++++++++++++=
++++
 .../recipes-connectivity/snort/snort_2.9.4.6.bb    |   64 ++++++++++++++++=
+
 3 files changed, 191 insertions(+), 0 deletions(-)  create mode 100644 met=
a-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.=
patch
 create mode 100644 meta-networking/recipes-connectivity/snort/files/disabl=
e-inaddr-none.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/snort_2.9.4.=
6.bb

diff --git a/meta-networking/recipes-connectivity/snort/files/disable-dap-a=
ddress-space-id.patch b/meta-networking/recipes-connectivity/snort/files/di=
sable-dap-address-space-id.patch
new file mode 100644
index 0000000..39e5c9c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/disable-dap-addre
+++ ss-space-id.patch
@@ -0,0 +1,52 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+fix the below error:
+checking for dap address space id... configure:=20
+configure: error: cannot run test program while cross compiling
+
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+--- a/configure.in	2013-08-23 00:06:37.239361932 -0500
++++ b/configure.in	2013-08-23 00:07:32.860266534 -0500
+@@ -679,23 +679,23 @@
+=20
+ AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta])
+=20
+-AC_MSG_CHECKING([for daq address space ID]) -AC_RUN_IFELSE(=20
+-[AC_LANG_PROGRAM( -[[ -#include <daq.h> -]], -[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.address_space_id =3D 0;
+-]])],
+-[have_daq_address_space_id=3D"yes"],
+-[have_daq_address_space_id=3D"no"])
+-AC_MSG_RESULT($have_daq_address_space_id)
+-if test "x$have_daq_address_space_id" =3D "xyes"; then
+-    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
+-        [DAQ version supports address space ID in header.])
+-fi
++#AC_MSG_CHECKING([for daq address space ID]) #AC_RUN_IFELSE(=20
++#[AC_LANG_PROGRAM( #[[ ##include <daq.h> #]], #[[
++#   DAQ_PktHdr_t hdr;
++#   hdr.address_space_id =3D 0;
++#]])],
++have_daq_address_space_id=3D"yes"
++#[have_daq_address_space_id=3D"no"])
++#AC_MSG_RESULT($have_daq_address_space_id)
++#if test "x$have_daq_address_space_id" =3D "xyes"; then
++#    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
++#        [DAQ version supports address space ID in header.])
++#fi
+=20
+ # any sparc platform has to have this one defined.
+ AC_MSG_CHECKING(for sparc)
diff --git a/meta-networking/recipes-connectivity/snort/files/disable-inadd=
r-none.patch b/meta-networking/recipes-connectivity/snort/files/disable-ina=
ddr-none.patch
new file mode 100644
index 0000000..9dafe63
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-no
+++ ne.patch
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
+=20
+ # In case INADDR_NONE is not defined (like on Solaris)=20
+-have_inaddr_none=3D"no"
+-AC_MSG_CHECKING([for INADDR_NONE])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <sys/types.h>
+-#include <netinet/in.h>
+-#include <arpa/inet.h>
+-]],
+-[[
+-	if (inet_addr("10,5,2") =3D=3D INADDR_NONE);
+-    return 0;
+-]])],
+-[have_inaddr_none=3D"yes"],
+-[have_inaddr_none=3D"no"])
+-AC_MSG_RESULT($have_inaddr_none)
+-if test "x$have_inaddr_none" =3D "xno"; then
+-	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
+-fi
++have_inaddr_none=3D"yes"
+=20
+ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include <stdio.h>
+@@ -397,21 +379,21 @@
+   fi
+ fi
+=20
+-AC_MSG_CHECKING([for pcap_lex_destroy]) -AC_RUN_IFELSE(=20
+-[AC_LANG_PROGRAM( -[[ -#include <pcap.h> -]], -[[
+-   pcap_lex_destroy();
+-]])],
+-[have_pcap_lex_destroy=3D"yes"],
+-[have_pcap_lex_destroy=3D"no"])
+-AC_MSG_RESULT($have_pcap_lex_destroy)
+-if test "x$have_pcap_lex_destroy" =3D "xyes"; then
+-    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack c=
reated by pcap bpf filter])
+-fi
++#AC_MSG_CHECKING([for pcap_lex_destroy]) #AC_RUN_IFELSE(=20
++#[AC_LANG_PROGRAM( #[[ ##include <pcap.h> #]], #[[
++#   pcap_lex_destroy();
++#]])],
++have_pcap_lex_destroy=3D"yes"
++#[have_pcap_lex_destroy=3D"no"])
++#AC_MSG_RESULT($have_pcap_lex_destroy)
++#if test "x$have_pcap_lex_destroy" =3D "xyes"; then
++#    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack =
created by pcap bpf filter])
++#fi
+=20
+ AC_MSG_CHECKING([for pcap_lib_version]) AC_LINK_IFELSE(
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb b/=
meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
new file mode 100644
index 0000000..8639639
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
@@ -0,0 +1,64 @@
+DESCRIPTION =3D "snort - a free lightweight network intrusion detection sy=
stem for UNIX and Windows."
+HOMEPAGE =3D "http://www.snort.org/"
+LICENSE =3D "GPL-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D78fa8ef966b48fbf9095e13cc92377c=
5"
+
+DEPENDS =3D "libpcap libpcre daq libdnet"
+
+
+SRC_URI =3D " ${GENTOO_MIRROR}/${BP}.tar.gz;name=3Dtarball \
+            file://disable-inaddr-none.patch \
+            file://disable-dap-address-space-id.patch "
+
+SRC_URI[tarball.md5sum] =3D "4111df01a4f21bd1d328a18b76d625bd"
+SRC_URI[tarball.sha256sum] =3D "cfaa5390b1840aaaa68a6c05a7077dd92cb916e618=
6a014baa451d43cdb0b3bc"
+
+inherit autotools  gettext
+
+EXTRA_OECONF =3D " \
+	--enable-gre \   =20
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
+	mkdir -p ${D}/${localstatedir}/log/snort }
+
+FILES_${PN} +=3D " \
+	${libdir}/snort_dynamicengine/*.so.* \
+	${libdir}/snort_dynamicpreprocessor/*.so.* \
+	${libdir}/snort_dynamicrules/*.so.* \
+	"
+FILES_${PN}-dbg +=3D " \
+	${libdir}/snort_dynamicengine/.debug \
+	${libdir}/snort_dynamicpreprocessor/.debug \
+	${libdir}/snort_dynamicrules/.debug \
+	"
+FILES_${PN}-staticdev +=3D " \
+	${libdir}/snort_dynamicengine/*.a \
+	${libdir}/snort_dynamicpreprocessor/*.a \
+	${libdir}/snort_dynamicrules/*.a \
+	${libdir}/snort/dynamic_preproc/*.a \
+	${libdir}/snort/dynamic_output/*.a \
+	"
+FILES_${PN}-dev +=3D " \
+	${libdir}/snort_dynamicengine/*.la \
+	${libdir}/snort_dynamicpreprocessor/*.la \
+	${libdir}/snort_dynamicrules/*.la \
+	${libdir}/snort_dynamicengine/*.so \
+	${libdir}/snort_dynamicpreprocessor/*.so \
+	${libdir}/snort_dynamicrules/*.so \
+	${prefix}/src/snort_dynamicsrc \
+	"
+
+RRECOMMENDS_${PN} +=3D "barnyard"
--
1.7.5.4



