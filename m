Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBA0C433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 08:25:20 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.4038.1641543918288486769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 00:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k4FEwCuc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641543916; i=@fujitsu.com;
	bh=hRs7leUJKQY8NyLvBhcjf9G1oESgYomRM/H/tZUNyFY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=k4FEwCucRDNvIMWtTnlTcdX/Ad3hhZ0GcbpW/q91+gCuGWu8SgMhqRO8tkwmVyK/x
	 sER62+SboItEtHTjj+gJeofK7LOXDv8wGBk628ja026WbD1JFYl6DENsVcIu7oxDXx
	 xmtQ/8oINXdvjTHRoexwYeL6pDseqMFkcyWtdm8h0M/1hpwF4E2hTsPea1QC4JSwBR
	 3UtfQfabYH75SQF4ozlYFkiLhA9+R0KeTco95zgT7jT8Bgusob9FYPkLC4CH3TzkRR
	 qduwq8dbGqLK29/mWXv3i49CX1vGWrDOgCaViiIkb3YOUPUyQ1DfhXkhPBNmamW524
	 d5woBX4Ugvd1g==
Received: from [100.115.3.123] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 72/46-13695-CE8F7D16;
 Fri, 07 Jan 2022 08:25:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MRovv6x/V
  EgzP3bCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxTsycyFrzNrGh6OI2xgfFnZBcjF4eQwAwm
  ifbnW9khnD2MEh8//WfpYuTkYBPQkNg99TIziC0ioC+xdPYeMJtZQE3i6MufYLawgL/Esv0TG
  LsYOThYBFQkmtbygYR5BVwkXq26wg5iSwgoSEx5+B6snFPAVWL2zZtMILYQUM2kvxA2r4CgxM
  mZT1ggxktIHHzxghmiV0ni7aU9jBB2hcSsWW1MExj5ZyFpmYWkZQEj0ypGq6SizPSMktzEzBx
  dQwMDXUNDU10TIMtQL7FKN1EvtVS3PLW4RBfILS/WSy0u1iuuzE3OSdHLSy3ZxAgMyZRiltQd
  jH19P/UOMUpyMCmJ8oq/u54oxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3yS2gnGBRanpqRVpmD
  jA+YNISHDxKIrwCwBgR4i0uSMwtzkyHSJ1iVJQS5/3/HSghAJLIKM2Da4PF5CVGWSlhXkYGBg
  YhnoLUotzMElT5V4ziHIxKwrzLQKbwZOaVwE1/BbSYCWjxCmGwxSWJCCmpBqa+hnNzd078e9x
  6QWvE8/NzSyIvNxvezz59KHuewasZ0eZvGJ6rSVRM/DfZaeeCBfmXxHn7Wp/72E0XCcidfCTx
  bcOyY2r5s67YKRsdk1flmPpzosXZ/iUvlq2t4avImpIh4vZ/C7uwrGbgw+PnDe+LnU+M3to44
  0BNt9r8mZJzT3W1FuT+OCna43vkF8esr+zfd9eyb3WZInA5m/9vUqXEypkXw21PlB7v2Lly7l
  0uL6dteipZQuW2Do1b5b0zXlxQMzzZquTuvVLicvgu3kj562Jv303i8DYXY0x41vVy6ekepZ1
  sbxVmbr9mslk2eGWfaZHcJXaz7t8pVQn3VsRzlVZfWdGtGcC9+W7U/ONKLMUZiYZazEXFiQCK
  AC73RAMAAA==
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1641543915!75331!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30223 invoked from network); 7 Jan 2022 08:25:15 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jan 2022 08:25:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2078P7vm004314
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jan 2022 08:25:15 GMT
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 7 Jan 2022 08:25:11 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [PATCH 3/3] pcp: Added a new recipe which provides dstat
 command.
Date: Sat, 8 Jan 2022 01:24:57 +0800
Message-ID: <1641576297-3341-4-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641576297-3341-1-git-send-email-leimaohui@fujitsu.com>
References: <1641576297-3341-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 08:25:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94679

Performance Co-Pilot is a system performance analysis toolkit
 - Collect performance metrics from your systems efficiently.
 - Analyze systems' performance metrics in real-time or using historical data.
 - Extend the collected performance metrics in a simple way.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../recipes-support/pcp/pcp-native_5.3.5.bb   |  49 ++++
 meta-oe/recipes-support/pcp/pcp.inc           |  32 +++
 ...ove-unsuitble-part-for-cross-compile.patch |  45 ++++
 meta-oe/recipes-support/pcp/pcp/config.linux  |  13 ++
 meta-oe/recipes-support/pcp/pcp_5.3.5.bb      | 217 ++++++++++++++++++
 5 files changed, 356 insertions(+)
 create mode 100644 meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb
 create mode 100644 meta-oe/recipes-support/pcp/pcp.inc
 create mode 100644 meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch
 create mode 100644 meta-oe/recipes-support/pcp/pcp/config.linux
 create mode 100644 meta-oe/recipes-support/pcp/pcp_5.3.5.bb

diff --git a/meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb b/meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb
new file mode 100644
index 0000000000..029a47531b
--- /dev/null
+++ b/meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb
@@ -0,0 +1,49 @@
+require pcp.inc
+inherit python3native native 
+#autotools-brokensep 
+DEPENDS = "python3-native python3-setuptools-native flex-native bison-native"
+
+export PCP_DIR = "${D}"
+export PCP_TMP_DIR = "${D}/tmp"
+export PCP_BIN_DIR = "${D}/usr/bin"
+
+B = "${S}"
+
+do_configure:prepend() {
+    export SED=${TMPDIR}/hosttools/sed
+    export AR=${TMPDIR}/hosttools/ar
+#    export PYTHON=python3
+    
+    rm -rf ${S}/include/pcp/configsz.h
+    rm -rf ${S}/include/pcp/platformsz.h
+
+}
+do_compile:prepend() {
+    sed -i -e "s,#undef HAVE_64BIT_LONG,,g" \
+           -e "s,#undef HAVE_64BIT_PTR,,g" \
+           -e "s,#undef PM_SIZEOF_SUSECONDS_T,,g" \
+           -e "s,#undef PM_SIZEOF_TIME_T,,g" \
+           ${S}/src/include/pcp/config.h.in
+
+    export AR=${TMPDIR}/hosttools/ar
+#    export PYTHON=python3
+}
+
+do_compile() {
+        oe_runmake default_pcp
+}
+
+do_install () {
+    oe_runmake install \
+    PCP_ETC_DIR=${D}/${sysconfdir} \
+    PCP_SYSCONF_DIR=${D}/${sysconfdir} \
+    PCP_VAR_DIR=${D}/${localstatedir} \
+    PCP_SHARE_DIR=${D}/${datadir} \
+    PCP_BIN_DIR=${D}/${bindir} \
+    PCP_BINADM_DIR=${D}/${libexecdir}/pcp/bin \
+    PCP_LIBADM_DIR=${D}/${libdir} \
+    PCP_LIB_DIR=${D}/${libdir} \
+    PCP_MAN_DIR=${D}/${mandir} \
+    PCP_DOC_DIR=${D}/${docdir} 
+}
+
diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
new file mode 100644
index 0000000000..f6f111b0e8
--- /dev/null
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -0,0 +1,32 @@
+SUMMARY = "System-level performance monitoring and performance management"
+HOMEPAGE = "http://www.pcp.io"
+SECTION =  "Applications/System"
+
+LICENSE = "GPLv2+ & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=37ab75b580d5aad4ada04260efa3702f \
+                    "
+COMPATIBLE_HOST:libc-musl = "null"
+
+SRC_URI = "https://performancecopilot.jfrog.io/artifactory/pcp-source-release/pcp-5.3.5.src.tar.gz \
+	   file://config.linux \
+	   "
+
+SRC_URI[sha256sum] = "589a610f753a49af6d2015cede87e9d469bd07880ebef26fe1607b6ded375e97"
+
+inherit distutils3-base pkgconfig autotools
+
+B = "${S}"
+
+# Specify any options you want to pass to the configure script using EXTRA_OECONF:
+CACHED_CONFIGUREVARS = "PACKAGE_DISTRIBUTION=arch"
+EXTRA_OECONF:append = " --with-dstat-symlink=yes --with-infiniband=no \
+                --with-pmdapodman=no --with-python=no --with-python3=yes --with-perl=no \
+		--with-pmdabcc=no --with-pmdajson=no  --with-perfevent=no \
+		--with-pmdabcc=yes \
+		--with-rundir=${localstatedir}/run \
+                --with-sysconfigdir=${sysconfdir} \
+                --with-logdir=${localstatedir}/log \
+                --with-docdir=${docdir} \
+                "
+
+
diff --git a/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch b/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch
new file mode 100644
index 0000000000..292499850e
--- /dev/null
+++ b/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch
@@ -0,0 +1,45 @@
+From db9e6a4b7a48dee62fccb662347dd638a2d286d5 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Thu, 2 Dec 2021 14:29:06 +0900
+Subject: [PATCH] Remove unsuitble part for cross-compile.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ configure.ac               | 6 ------
+ src/libpcp/src/GNUmakefile | 1 -
+ 2 files changed, 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5b25382..5d24714 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -623,12 +623,6 @@ fi
+ which=$WHICH
+ AC_SUBST(which)
+ 
+-if test -z "$AR"; then
+-    AC_PATH_PROGS(AR, [gcc-ar ar], /usr/bin/ar)
+-fi
+-if test ! -x "$AR"; then
+-    AC_MSG_ERROR([cannot find a valid 'ar' command.])
+-fi
+ ar=$AR
+ AC_SUBST(ar)
+ 
+diff --git a/src/libpcp/src/GNUmakefile b/src/libpcp/src/GNUmakefile
+index 3c4ccd6..d1eba19 100644
+--- a/src/libpcp/src/GNUmakefile
++++ b/src/libpcp/src/GNUmakefile
+@@ -176,7 +176,6 @@ exports:	exports.in mk.exports
+ # cases
+ #
+ check.done:	$(OBJECTS)
+-	./check-statics
+ 	touch check.done
+ 
+ ifneq ($(LIBTARGET),)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/pcp/pcp/config.linux b/meta-oe/recipes-support/pcp/pcp/config.linux
new file mode 100644
index 0000000000..191f87acc6
--- /dev/null
+++ b/meta-oe/recipes-support/pcp/pcp/config.linux
@@ -0,0 +1,13 @@
+sizeof_int=4
+sizeof_long=4
+sizeof_pointer=8
+sizeof_suseconds_t=8
+sizeof_time_t=8
+bit_field_scheme=2100
+enable_python3='yes'
+enable_python3='true'
+have_python_OrderedDict="true"
+have_python=python3
+printf_p_prefix=0x
+printf_fmt_int64=I64d
+strtoint64=strtoll
diff --git a/meta-oe/recipes-support/pcp/pcp_5.3.5.bb b/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
new file mode 100644
index 0000000000..e6c139e1d3
--- /dev/null
+++ b/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
@@ -0,0 +1,217 @@
+require pcp.inc
+#inherit perlnative
+
+# NOTE: the following prog dependencies are unknown, ignoring: gtar gzip pkgmk xmlto lzma qshape md5sum pod2man publican git makedepend qmake-qt4 xconfirm true gmake xz dblatex hdiutil rpm bzip2 which mkinstallp dtrace seinfo qmake-qt5 gawk dlltool rpmbuild dpkg makepkg qmake echo
+# NOTE: unable to map the following pkg-config dependencies: libmicrohttpd libsystemd-journal
+#       (this is based on recipes that have previously been built and packaged)
+# NOTE: the following library dependencies are unknown, ignoring: nspr gen ibumad regex sasl2 pfm nss papi ibmad
+#       (this is based on recipes that have previously been built and packaged)
+DEPENDS += "perl-native bison-native flex-native python3-native python3-setuptools python3 \
+	pcp-native cairo zlib ncurses readline libx11 avahi openssl"
+
+
+SRC_URI += "file://0001-Remove-unsuitble-part-for-cross-compile.patch \
+           "
+
+export PCP_DIR="${RECIPE_SYSROOT_NATIVE}"
+#export PCP_RUN_DIR="${RECIPE_SYSROOT_NATIVE}"
+EXTRA_OEMAKE = "CC="${CC}" LD="${LD}" AR="${AR}""
+inherit useradd systemd 
+
+SYSTEMD_AUTO_ENABLE:${PN} = "enable"
+SYSTEMD_SERVICE:${PN} = "pmcd.service pmcd.service pmie_check.service pmie_farm_check.service \
+                         pmlogger_daily.service pmlogger_farm_check.service pmfind.service \
+                         pmie_daily.service  pmlogger.service pmlogger_daily_report.service \
+                         pmproxy.service pmie.service pmie_farm.service pmlogger_check.service \
+                         pmlogger_farm.service"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "--system --home ${localstatedir}/lib/pcp --no-create-home \
+                       --user-group pcp"
+
+USERADD_PACKAGES = "${PN}-testsuite"
+USERADD_PARAM:${PN}-testsuite = "--system --home ${localstatedir}/lib/pcp/testsuite --no-create-home \
+                       --user-group pcpqa"
+
+RDEPENDS:${PN} += "perl"
+RDEPENDS:${PN}-testsuite += "${PN} bash perl"
+RDEPENDS:python3-${PN} += "${PN} python3"
+
+do_configure:prepend () {
+    cp ${WORKDIR}/config.linux ${B}
+    rm -rf ${S}/include/pcp/configsz.h
+    rm -rf ${S}/include/pcp/platformsz.h
+    export SED=${TMPDIR}/hosttools/sed
+    export PYTHON=python3
+}
+
+do_compile:prepend() {
+	sed -i -e "s,#undef HAVE_64BIT_LONG,,g" \
+		-e "s,#undef HAVE_64BIT_PTR,,g" \
+		-e "s,#undef PM_SIZEOF_SUSECONDS_T,,g" \
+		-e "s,#undef PM_SIZEOF_TIME_T,,g" \
+		${S}/src/include/pcp/config.h.in
+	sed -i -e "s,HAVE_PYTHON_ORDEREDDICT = false,HAVE_PYTHON_ORDEREDDICT = true,g" \
+		${S}/src/include/builddefs
+	sed -i -e "s,TOPDIR)/python3-pcp.list,TOPDIR)/python3-pcp.list --install-lib=${PYTHON_SITEPACKAGES_DIR},g" ${S}/src/python/GNUmakefile
+	export PYTHON=python3
+	#export PYTHON3=${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
+}
+
+do_compile() {
+        oe_runmake default_pcp 
+}
+
+do_install () {
+	export NO_CHOWN=true
+	oe_runmake install DIST_ROOT=${D}\
+	install_pcp
+
+	rm -rf ${D}${localstatedir}/log
+	rm -rf ${D}${localstatedir}/lib/pcp/pmcd
+	rm -rf ${D}${localstatedir}/lib/pcp/tmp
+	rm -rf ${D}${localstatedir}/run
+	mv ${D}${docdir}/C* ${D}${docdir}/pcp-doc/
+	mv ${D}${docdir}/I* ${D}${docdir}/pcp-doc/
+	mv ${D}${docdir}/R* ${D}${docdir}/pcp-doc/
+	mv ${D}${docdir}/V* ${D}${docdir}/pcp-doc/
+	sed -i "s#PCP_AWK_PROG=.*#PCP_AWK_PROG=awk#" ${D}/${sysconfdir}/pcp.conf
+	sed -i "s#PCP_SORT_PROG=.*#PCP_SORT_PROG=sort#" ${D}/${sysconfdir}/pcp.conf
+	sed -i "s#PCP_ECHO_PROG=.*#PCP_ECHO_PROG=echo#" ${D}/${sysconfdir}/pcp.conf
+	sed -i "s#PCP_WHICH_PROG=.*#PCP_WHICH_PROG=which#" ${D}/${sysconfdir}/pcp.conf
+}
+
+PACKAGES += " ${PN}-export-zabbix-agent ${PN}-testsuite \
+	libpcp-gui2  libpcp-gui2-dev \
+	libpcp-import1 \
+	libpcp-mmv1 libpcp-mmv1-dev \
+	libpcp-pmda3 libpcp-pmda3-dev \
+	libpcp-trace2 libpcp-trace2-dev \
+	libpcp-web1 libpcp-web1-dev \
+	libpcp3 libpcp3-dev python3-${PN}\
+"
+FILES:libpcp-gui2 = "${libdir}/libpcp_gui.so.2 \
+"	
+FILES:libpcp-gui2-dev = " \
+	${libdir}/libpcp_gui.so \
+	${libdir}/libpcp_gui.a \
+	${includedir}/pmafm.h \
+	${includedir}/pmtime.h \
+"
+FILES:libpcp-mmv1 = " \
+	${libdir}/libpcp_mmv.so.1 \
+"
+FILES:libpcp-mmv1-dev = " \
+	${libdir}/libpcp_mmv.a \
+	${libdir}/libpcp_mmv.so \
+	${libdir}/libpcp_mmv.so \
+	${includedir}/mmv_stats.h \
+	${includedir}/mmv_dev.h \
+	${datadir}/man/man3/mmv_* \
+	${datadir}/man/man5/mmv.5.gz \
+"
+FILES:libpcp-import1 = " \
+	${libdir}/libpcp_import.so.1 \
+"
+FILES:libpcp-pmda3 = " \
+	${libdir}/libpcp_pmda.so.3 \
+"
+FILES:libpcp-pmda3-dev = " \
+	${includedir}/pmda.h \
+	${includedir}/pmdaroot.h \
+	${libdir}/libpcp_pmda.a \
+	${libdir}/libpcp_pmda.so \
+	${libdir}/pkgconfig/libpcp_pmda.pc \
+	${datadir}/man/man3/PMDA.3.gz \
+	${datadir}/man/man3/pmda* \
+"
+FILES:libpcp-trace2 = " \
+	${libdir}/libpcp_trace.so.2 \
+"
+FILES:libpcp-trace2-dev = " \
+	${includedir}/trace.h \
+	${includedir}/trace_dev.h \
+	${libdir}/libpcp_trace.a \
+	${libdir}/libpcp_trace.so \
+	${datadir}/man/man3/pmtrace* \
+"
+FILES:libpcp-web1 = " \
+	${libdir}/libpcp_web.so.1 \
+"
+FILES:libpcp-web1-dev = " \
+	${includedir}/pmhttp.h \
+	${includedir}/pmjson.h \
+	${libdir}/libpcp_web.a \
+	${libdir}/libpcp_web.so \
+	${datadir}/man/man3/pmhttp* \
+	${datadir}/man/man3/pmjson* \
+"
+FILES:libpcp3 = " \
+	${libdir}/libpcp.so.3 \
+"
+
+FILES:${PN} = " \
+	${sysconfdir}/pcp \
+	${libexecdir} \
+	${bindir} \
+	${datadir}/bash-completion \
+	${datadir}/pcp-gui \
+	${datadir}/zsh \
+	${systemd_system_unitdir}/ \
+	${libdir}/pcp/ \
+	${datadir}/pcp \
+	${libdir}/*.sh \
+	${datadir}/man \
+	${libdir}/rc-proc.sh.minimal \
+	${sysconfdir}/p* \
+	${sysconfdir}/s* \
+	${localstatedir}/lib/pcp/config \
+	${localstatedir}/lib/pcp/pmdas/ \
+	${localstatedir}/lib/pcp/pmns \
+	${libdir}/libpcp_fault.so.3 \
+"
+
+FILES:${PN}-export-zabbix-agent += " \
+	${libdir}/zabbix \
+	${sysconfdir}/zabbix \
+	${mandir}/man3/zbxpcp.3.gz \
+	${libdir}/zabbix \
+"
+FILES:${PN}-testsuite = "${localstatedir}/lib/pcp/testsuite/"
+FILES:python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}"
+FILES:${PN}-dev += " \
+        ${includedir}/pcp \
+        ${libdir}/libpcp.a \
+        ${libdir}/libpcp.so \
+        ${localstatedir}/lib/pcp/pmdas/*/*.so \
+        ${libexecdir}/pcp/bin/install-sh \
+        ${libdir}/pkgconfig/libpcp.pc \
+        ${libdir}/zabbix/modules/*.so \
+        ${datadir}/man/man3/LOGIMPORT.3.gz \
+        ${datadir}/man/man3/P* \
+        ${datadir}/man/man3/Q* \
+        ${datadir}/man/man3/__pm* \
+        ${datadir}/man/man3/pmA* \
+        ${datadir}/man/man3/pmC* \
+        ${datadir}/man/man3/pmD* \
+        ${datadir}/man/man3/pmE* \
+        ${datadir}/man/man3/pmF* \
+        ${datadir}/man/man3/pmG* \
+        ${datadir}/man/man3/pmH* \
+        ${datadir}/man/man3/pmI* \
+        ${datadir}/man/man3/pmL* \
+        ${datadir}/man/man3/pmM* \
+        ${datadir}/man/man3/pmN* \
+        ${datadir}/man/man3/pmO* \
+        ${datadir}/man/man3/pmP* \
+        ${datadir}/man/man3/pmR* \
+        ${datadir}/man/man3/pmS* \
+        ${datadir}/man/man3/pmT* \
+        ${datadir}/man/man3/pmU* \
+        ${datadir}/man/man3/pmW* \
+        ${datadir}/man/man3/pmf* \
+        ${datadir}/man/man3/pmg* \
+        ${datadir}/man/man3/pmi* \
+        ${datadir}/man/man3/pms* \
+        ${datadir}/man/man3/pmt* \
+"
-- 
2.25.1


