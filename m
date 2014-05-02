Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6FB2E60559
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 13:36:46 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Fri, 2 May 2014
	15:36:43 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id 4220128C882;
	Fri,  2 May 2014 15:36:43 +0200 (CEST)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 May 2014 15:36:40 +0200
Message-ID: <1399037801-2347-1-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [meta-networking][PATCH v3 1/2] lksctp-tools: add recipe (version 1.0.16)
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
X-List-Received-Date: Fri, 02 May 2014 13:36:50 -0000
Content-Type: text/plain

This recipe comes from arago-oe-dev:
https://github.com/mrchapp/arago-oe-dev/tree/master/recipes/lksctp-tools

Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
---
 .../lksctp-tools/files/lib_order.patch             |   75 ++++++++++++++++++++
 .../recipes-support/lksctp-tools/lksctp-tools.inc  |   59 +++++++++++++++
 .../lksctp-tools/lksctp-tools_1.0.16.bb            |   10 +++
 3 files changed, 144 insertions(+)
 create mode 100644 meta-networking/recipes-support/lksctp-tools/files/lib_order.patch
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools.inc
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb

diff --git a/meta-networking/recipes-support/lksctp-tools/files/lib_order.patch b/meta-networking/recipes-support/lksctp-tools/files/lib_order.patch
new file mode 100644
index 0000000..eb07d75
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/files/lib_order.patch
@@ -0,0 +1,75 @@
+From 93fd7448317419594472045663ff13034c31efa9 Mon Sep 17 00:00:00 2001
+From: Vlad Yasevich <vladislav.yasevich@hp.com>
+Date: Wed, 14 Jan 2009 14:30:20 -0500
+Subject: [PATCH] [lib] Fix building of static libraries
+
+When running "./configure --disable-shared --enable-
+static" the build fails with the following error:
+
+gcc -g -Wall -Wstrict-prototypes -Wimplicit-function-
+declaration -g -O2 -o nagle_snd
+nagle_snd.o ../../src/lib/.libs/libsctp.a ../../src/t
+estlib/.libs/libsctputil.a
+../../src/testlib/.libs/libsctputil.a(sctputil.o): In
+function `test_peer_addr':
+/home/roubert/src/lksctp/lksctp-tools-
+1.0.6/src/testlib/sctputil.c:376: undefined reference
+to `sctp_getpaddrs'
+/home/roubert/src/lksctp/lksctp-tools-
+1.0.6/src/testlib/sctputil.c:382: undefined reference
+to `sctp_freepaddrs'
+/home/roubert/src/lksctp/lksctp-tools-
+1.0.6/src/testlib/sctputil.c:416: undefined reference
+to `sctp_freepaddrs'
+/home/roubert/src/lksctp/lksctp-tools-
+1.0.6/src/testlib/sctputil.c:400: undefined reference
+to `sctp_freepaddrs'
+collect2: ld returned 1 exit status
+make[3]: *** [nagle_snd] Error 1
+
+Changing the order of libsctp.a and libsctputil.a
+fixes this. The attached patch updates
+src/apps/Makefile.am and src/func_tests/Makefile.am
+to do that.
+
+Patch submitted by Fredrik Roubert <roubert@sf.net>.
+
+Signed-off-by: Vlad Yasevich <vladislav.yasevich@hp.com>
+---
+ src/apps/Makefile.am       |    4 ++--
+ src/func_tests/Makefile.am |    4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/apps/Makefile.am b/src/apps/Makefile.am
+index 515ef96..960cd5e 100644
+--- a/src/apps/Makefile.am
++++ b/src/apps/Makefile.am
+@@ -8,8 +8,8 @@ include $(top_srcdir)/Makefile.dirs
+ INCLUDES = -I. -I$(top_srcdir)/src/include -I$(top_srcdir)/src/testlib 
+ AM_CFLAGS = -g -Wall -Wstrict-prototypes -Wimplicit-function-declaration
+ AM_LDFLAGS = 
+-LDADD = $(top_builddir)/src/lib/libsctp.la \
+-	$(top_builddir)/src/testlib/libsctputil.la
++LDADD = $(top_builddir)/src/testlib/libsctputil.la \
++	$(top_builddir)/src/lib/libsctp.la
+ 
+ # programs to be installed with the distriubution
+ bin_PROGRAMS = sctp_darn sctp_test
+diff --git a/src/func_tests/Makefile.am b/src/func_tests/Makefile.am
+index b985685..44f0e94 100644
+--- a/src/func_tests/Makefile.am
++++ b/src/func_tests/Makefile.am
+@@ -8,8 +8,8 @@ include $(top_srcdir)/Makefile.dirs
+ INCLUDES = -I. -I$(top_srcdir)/src/include -I$(top_srcdir)/src/testlib 
+ AM_CFLAGS = -g -Wall -Wstrict-prototypes -Wimplicit-function-declaration
+ AM_LDFLAGS = -lpthread
+-LDADD = $(top_builddir)/src/lib/libsctp.la \
+-	$(top_builddir)/src/testlib/libsctputil.la
++LDADD = $(top_builddir)/src/testlib/libsctputil.la \
++	$(top_builddir)/src/lib/libsctp.la
+ 
+ V6FLAGS = -DCONFIG_IPV6=1 -DTEST_V6=1 ${DEFS} ${INCLUDES} ${CFLAGS}
+ 
+-- 
+1.7.1
+
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools.inc b/meta-networking/recipes-support/lksctp-tools/lksctp-tools.inc
new file mode 100644
index 0000000..fd3c285
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools.inc
@@ -0,0 +1,59 @@
+DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPLv2"
+
+LIC_FILES_CHKSUM = " \
+  file://COPYING.lib;md5=0a1b79af951c42a9c8573533fbba9a92 \
+  file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
+  "
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+INC_PR = "r1"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools pkgconfig binconfig
+
+do_install_append_virtclass-native() {
+	:
+}
+
+RREPLACES_lksctp-tools = "lksctp"
+
+LEAD_SONAME = "libsctp.so"
+
+PACKAGES =+ "${PN}-withsctp ${PN}-utils"
+
+FILES_${PN} = " \
+  ${libdir}/libsctp.so.${SOLIBVERSION} \
+  "
+
+FILES_${PN}-withsctp = " \
+  ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION}"
+
+FILES_${PN}-dev += " \
+  ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
+  ${libdir}/libsctp.so \
+  ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
+  ${libdir}/lksctp-tools/libwithsctp.so \
+  ${datadir}/lksctp-tools/checksctp.c \
+  ${datadir}/lksctp-tools/sctp_socket.c \
+  ${datadir}/lksctp-tools/sctp_status.c \
+  ${datadir}/lksctp-tools/sctp_bind.c \
+  ${datadir}/lksctp-tools/sctp_darn.c \
+  ${datadir}/lksctp-tools/sctp_load_libs.c \
+  ${datadir}/lksctp-tools/sctp_sockopt.c \
+  ${datadir}/lksctp-tools/sctp_socket.h \
+  ${datadir}/lksctp-tools/sctp_test.c \
+  ${datadir}/lksctp-tools/sctp_darn.h \
+  "
+
+FILES_${PN}-utils = " \
+  ${bindir}/sctp_test \
+  ${bindir}/sctp_darn \
+  ${bindir}/checksctp \
+  ${bindir}/withsctp  \
+  ${bindir}/sctp_status \
+  "
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
new file mode 100644
index 0000000..964f08c
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
@@ -0,0 +1,10 @@
+SOLIBVERSION="1.0.16"
+SOLIBMAJORVERSION="1"
+require lksctp-tools.inc
+PR = "${INC_PR}.0"
+
+FILESEXTRAPATHS = "${THISDIR}/files"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "708bb0b5a6806ad6e8d13c55b067518e"
+SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26"
-- 
1.7.10.4


