Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EF64B76551
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 02:47:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99103041"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 10:51:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V2k32C014022
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:46:03 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 10:47:54 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 10:47:42 +0800
Message-ID: <1438310864-15716-7-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438310864-15716-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1438310864-15716-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH v3 6/8] sblim-sfcb: add new recipe for openlmi
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
X-List-Received-Date: Fri, 31 Jul 2015 02:47:56 -0000
Content-Type: text/plain

Sblim-sfcb is dependence of openlmi.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../recipes-extended/sblim-sfcb/files/sfcb.service | 11 +++
 .../sblim-sfcb-1.3.15-fix-provider-debugging.patch | 12 ++++
 .../sblim-sfcb-1.3.16-maxMsgLen.patch              | 14 ++++
 .../sblim-sfcb-1.3.16-multilib-man-cfg.patch       | 41 +++++++++++
 ...blim-sfcb-1.3.9-sfcbrepos-schema-location.patch | 42 +++++++++++
 .../sblim-sfcb-1.4.5-service.patch                 | 27 +++++++
 .../sblim-sfcb-1.4.8-default-ecdh-curve-name.patch | 26 +++++++
 .../sblim-sfcb/sblim-sfcb_1.4.8.bb                 | 82 ++++++++++++++++++++++
 8 files changed, 255 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/files/sfcb.service
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.15-fix-provider-debugging.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-maxMsgLen.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-multilib-man-cfg.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.5-service.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb

diff --git a/meta-oe/recipes-extended/sblim-sfcb/files/sfcb.service b/meta-oe/recipes-extended/sblim-sfcb/files/sfcb.service
new file mode 100644
index 0000000..5adf63c
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/files/sfcb.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Small Footprint CIM Broker Service
+After=syslog.target
+
+[Service]
+Type=oneshot
+ExecStart=/usr/sbin/sfcbd -d
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.15-fix-provider-debugging.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.15-fix-provider-debugging.patch
new file mode 100644
index 0000000..4fbecaa
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.15-fix-provider-debugging.patch
@@ -0,0 +1,12 @@
+diff -up sblim-sfcb-1.4.5/providerDrv.c.orig sblim-sfcb-1.4.5/providerDrv.c
+--- sblim-sfcb-1.4.5/providerDrv.c.orig	2013-09-04 12:59:22.140813239 +0200
++++ sblim-sfcb-1.4.5/providerDrv.c	2013-09-04 12:59:40.511870274 +0200
+@@ -3585,7 +3585,7 @@ processProviderInvocationRequests(char *
+     rc = spRecvReq(&providerSockets.receive, &parms->requestor,
+                    (void **) &parms->req, &rl, &mqg);
+     if (mqg.rdone) {
+-      int             debug_break = 0;
++      volatile int debug_break = 0;
+       if (rc != 0) {
+         mlogf(M_ERROR,M_SHOW, "spRecvReq returned error %d. Skipping message.\n", rc);
+         free(parms);
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-maxMsgLen.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-maxMsgLen.patch
new file mode 100644
index 0000000..a0dd816
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-maxMsgLen.patch
@@ -0,0 +1,14 @@
+diff -up sblim-sfcb-1.3.16/sfcb.cfg.pre.in.old sblim-sfcb-1.3.16/sfcb.cfg.pre.in
+--- sblim-sfcb-1.3.16/sfcb.cfg.pre.in.old	2012-06-13 23:21:09.000000000 +0200
++++ sblim-sfcb-1.3.16/sfcb.cfg.pre.in	2013-06-24 15:34:38.881992781 +0200
+@@ -113,8 +113,8 @@ provProcs:      32
+ 
+ ## Max message length, in bytes. This is a limit on the size of messages
+ ## written across sockets, for instance, between providers and SFCB.
+-## Default is 10000000
+-maxMsgLen:      10000000
++## Default is 100000000
++maxMsgLen:      100000000
+ 
+ ## Location of the registration directory, where providerRegister can be found
+ ## Default is @localstatedir@/lib/sfcb/registration
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-multilib-man-cfg.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-multilib-man-cfg.patch
new file mode 100644
index 0000000..c8cece2
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-multilib-man-cfg.patch
@@ -0,0 +1,41 @@
+diff -up sblim-sfcb-1.3.16/man/sfcbd.1.pre.in.orig sblim-sfcb-1.3.16/man/sfcbd.1.pre.in
+--- sblim-sfcb-1.3.16/man/sfcbd.1.pre.in.orig	2014-02-26 14:05:32.213091734 +0100
++++ sblim-sfcb-1.3.16/man/sfcbd.1.pre.in	2014-02-26 15:10:54.476196379 +0100
+@@ -151,7 +151,7 @@ Default=\fI@localstatedir@/lib/sfcb/regi
+ .TP
+ .B providerDirs
+ A space separated list of directories where sfcb is looking for provider
+-libraries. Default=\fI@libdir@\ @libdir@/cmpi\fR
++libraries. Default=\fI/usr/lib\ /usr/lib/cmpi /usr/lib64\ /usr/lib64/cmpi\fR
+ .TP
+ .B providerSampleInterval
+ The interval in seconds at which the provider manager is checking for
+@@ -275,11 +275,11 @@ SSL private key file for sfcb.
+ SSL client certificate / trust store for sfcb.
+ .SH LIBRARIES
+ .TP
+-.I @libdir@/libsfc*
++.I /usr/lib/libsfc* /usr/lib64/libsfc*
+ Binaries for sfcb runtime libraries.
+ .TP
+-.I @libdir@/cmpi/*
+-Binaries for providers
++.I /usr/lib/cmpi/* /usr/lib64/cmpi/*
++Binaries for providers.
+ .SH AUTHOR
+ Adrian Schuur <schuur@de.ibm.com>
+ .SH CONRIBUTORS
+diff -up sblim-sfcb-1.3.16/sfcb.cfg.pre.in.orig sblim-sfcb-1.3.16/sfcb.cfg.pre.in
+--- sblim-sfcb-1.3.16/sfcb.cfg.pre.in.orig	2014-02-26 15:35:43.133869718 +0100
++++ sblim-sfcb-1.3.16/sfcb.cfg.pre.in	2014-02-26 15:38:12.794240532 +0100
+@@ -121,8 +121,8 @@ maxMsgLen:      100000000
+ registrationDir: @localstatedir@/lib/sfcb/registration
+ 
+ ## Locations to look for provider libraries. Delimit paths with a space.
+-## Default is @libdir@/sfcb @libdir@ @libdir@/cmpi
+-providerDirs: @libdir@/sfcb @libdir@ @libdir@/cmpi
++## Default is /usr/lib/sfcb /usr/lib64/sfcb /usr/lib /usr/lib64 /usr/lib/cmpi /usr/lib64/cmpi
++providerDirs: /usr/lib/sfcb /usr/lib64/sfcb /usr/lib /usr/lib64 /usr/lib/cmpi /usr/lib64/cmpi
+ 
+ ## Enable the root/interop namespace (affects indications)
+ ## Default: true
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
new file mode 100644
index 0000000..7f95a9d
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
@@ -0,0 +1,42 @@
+diff -up sblim-sfcb-1.3.9/man/sfcbrepos.1.pre.in.orig sblim-sfcb-1.3.9/man/sfcbrepos.1.pre.in
+--- sblim-sfcb-1.3.9/man/sfcbrepos.1.pre.in.orig	2009-10-13 21:54:13.000000000 +0200
++++ sblim-sfcb-1.3.9/man/sfcbrepos.1.pre.in	2010-09-06 14:01:57.294564062 +0200
+@@ -26,7 +26,7 @@ Supported command line options are:
+ .TP
+ \fB\-c\fR \fIschemadir\fR
+ Path to obtain the CIM Schema classes.
+-Default is \fI@datadir@/sfcb\fR
++Default is \fI@datadir@/mof/cim-current\fR
+ .TP
+ \fB\-s\fR \fIstagingdir\fR
+ Path to sfcb staging area containing class MOFs and registration files
+@@ -58,7 +58,7 @@ Alias of \fB-b\fR
+ Display usage information and exit.
+ .SH FILES
+ .TP
+-\fI@datadir@/sfcb/CIM/CIM_Schema.mof\fR
++\fI@datadir@/mof/cim-current/CIM_Schema.mof\fR
+ CIM Schema
+ .TP
+ \fI@localstatedir@/lib/sfcb/registration/providerRegister\fR
+diff -up sblim-sfcb-1.3.9/sfcbrepos.sh.in.orig sblim-sfcb-1.3.9/sfcbrepos.sh.in
+--- sblim-sfcb-1.3.9/sfcbrepos.sh.in.orig	2009-12-22 01:18:29.000000000 +0100
++++ sblim-sfcb-1.3.9/sfcbrepos.sh.in	2010-09-06 13:45:28.671491648 +0200
+@@ -59,7 +59,7 @@ then
+     echo -e "\t-X create repository in non-native format as specifed by argument"
+     echo -e "\t-s specify staging directory [@localstatedir@/lib/sfcb/stage]"
+     echo -e "\t-r specify repository directory [@localstatedir@/lib/sfcb/registration]"
+-    echo -e "\t-c specify directory containing CIM Schema MOFs [@datadir@/sfcb/CIM]"
++    echo -e "\t-c specify directory containing CIM Schema MOFs [@datadir@/mof/cim-current]"
+     echo -e "\t-t create tiny class repository by omitting inheritance information"
+     echo -e "\t-z compress repository with gzip"
+     echo
+@@ -99,7 +99,7 @@ fi
+ 
+ if [ -z "$cimschemadir" ]
+ then
+-    cimschemadir=${DESTDIR}@datadir@/sfcb/CIM
++    cimschemadir=${DESTDIR}@datadir@/mof/cim-current
+ fi
+ 
+ if [ -d $stagingdir ] && [ -f $stagingdir/default.reg ] &&
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.5-service.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.5-service.patch
new file mode 100644
index 0000000..eaccfa5
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.5-service.patch
@@ -0,0 +1,27 @@
+diff -up sblim-sfcb-1.4.6/Makefile.in.orig sblim-sfcb-1.4.6/Makefile.in
+--- sblim-sfcb-1.4.6/Makefile.in.orig	2013-10-07 10:43:34.783228137 +0200
++++ sblim-sfcb-1.4.6/Makefile.in	2013-10-07 10:44:30.178533289 +0200
+@@ -627,7 +627,6 @@ initdir = $(sysconfdir)/init.d
+ pamdir = $(sysconfdir)/pam.d
+ sfcblibdir = $(libdir)/sfcb
+ cmpilibdir = $(libdir)/cmpi
+-systemddir = $(DESTDIR)@SYSTEMDDIR@
+ MANFILES = man/genSslCert.1 man/getSchema.1 man/sfcbd.1 man/sfcbmof.1 \
+ 	man/sfcbrepos.1 man/sfcbstage.1 man/sfcbunstage.1 man/sfcbuuid.1 \
+ 	man/wbemcat.1 man/xmltest.1
+@@ -2366,7 +2365,6 @@ unittest:
+ 	cd test && sh check_all.sh
+ 
+ install-data-local:
+-	if test -d $(systemddir); then cp $(srcdir)/sblim-sfcb.service $(systemddir); fi; 
+ 	test -d $(DESTDIR)$(sfcbstatedir)/registration/repository || $(mkdir_p) $(DESTDIR)$(sfcbstatedir)/registration/repository
+ 	test -d $(DESTDIR)$(sfcbstatedir)/stage/mofs/root/interop || $(mkdir_p) $(DESTDIR)$(sfcbstatedir)/stage/mofs/root/interop
+ 	test -d $(DESTDIR)$(sfcbstatedir)/stage/regs || $(mkdir_p) $(DESTDIR)$(sfcbstatedir)/stage/regs
+@@ -2384,7 +2382,6 @@ install-data-local:
+ uninstall-local:
+ 	rm -f $(DESTDIR)$(sfcbstatedir)/stage/default.reg
+ 	rm -f $(DESTDIR)$(sfcbstatedir)/stage/mofs/root/interop/10_interop.mof
+-	rm -f $(systemddir)/sblim-sfcb.service
+ @INDICATIONS_TRUE@	rm -f $(DESTDIR)$(sfcbstatedir)/stage/mofs/root/interop/20_indication.mof
+ @INDICATIONS_TRUE@	rm -f $(DESTDIR)$(sfcbstatedir)/stage/mofs/indication.mof
+ @DOCS_TRUE@	rm -rf $(DESTDIR)$(sfcbdocdir)/html
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
new file mode 100644
index 0000000..3268d49
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
@@ -0,0 +1,26 @@
+diff -up sblim-sfcb-1.4.8/control.c.orig sblim-sfcb-1.4.8/control.c
+--- sblim-sfcb-1.4.8/control.c.orig	2014-03-27 00:46:28.000000000 +0100
++++ sblim-sfcb-1.4.8/control.c	2014-05-15 12:31:38.304169409 +0200
+@@ -170,7 +170,7 @@ static Control init[] = {
+   {"sslCertList", CTL_STRING, SFCB_CONFDIR "/clist.pem", {0}},
+   {"sslCiphers", CTL_STRING, "ALL:!ADH:!LOW:!EXP:!MD5:@STRENGTH", {0}},
+   {"sslDhParamsFilePath", CTL_STRING, NULL, {0}},
+-  {"sslEcDhCurveName", CTL_STRING, "secp224r1", {0}},
++  {"sslEcDhCurveName", CTL_STRING, "secp384r1", {0}},
+   {"enableSslCipherServerPref", CTL_BOOL, NULL, {.b=0}},
+ 
+   {"registrationDir", CTL_STRING, SFCB_STATEDIR "/registration", {0}},
+diff -up sblim-sfcb-1.4.8/sfcb.cfg.pre.in.orig sblim-sfcb-1.4.8/sfcb.cfg.pre.in
+--- sblim-sfcb-1.4.8/sfcb.cfg.pre.in.orig	2014-05-15 12:31:59.188244865 +0200
++++ sblim-sfcb-1.4.8/sfcb.cfg.pre.in	2014-05-15 12:32:45.554408412 +0200
+@@ -293,8 +293,8 @@ sslCiphers: ALL:!ADH:!LOW:!EXP:!MD5:@STR
+ ## environment. If this value is not set, the indicated default is in effect.
+ ## If the value is set but the curve name is not recognized by the underlying
+ ## openssl implementation, SFCB will abort.
+-## Default is secp224r1
+-#sslEcDhCurveName: secp224r1
++## Default is secp384r1
++#sslEcDhCurveName: secp384r1
+ 
+ ## When set to true, sets the SSL_OP_CIPHER_SERVER_PREFERENCE flag for the ssl
+ ## context, to enforce server's preference instead of the client preference for
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb
new file mode 100644
index 0000000..c1c1d4c
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb
@@ -0,0 +1,82 @@
+SUMMARY = "Small Footprint CIM Broker"
+DESCRIPTION = "\
+Small Footprint CIM Broker (sfcb) is a CIM server conforming to the CIM \
+Operations over HTTP protocol. It is robust, with low resource consumption \
+and therefore specifically suited for embedded and resource constrained \
+environments. sfcb supports providers written against the Common \
+Manageability Programming Interface (CMPI)."
+HOMEPAGE = "http://www.sblim.org"
+SECTION = "Applications/System"
+LICENSE = "EPL-1.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
+DEPENDS = "curl libpam openssl sblim-sfcCommon"
+
+SRC_URI = "http://downloads.sourceforge.net/sblim/${PN}-${PV}.tar.bz2 \
+           file://sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch \
+           file://sblim-sfcb-1.3.15-fix-provider-debugging.patch \
+           file://sblim-sfcb-1.3.16-maxMsgLen.patch \
+           file://sblim-sfcb-1.4.5-service.patch \
+           file://sblim-sfcb-1.3.16-multilib-man-cfg.patch \
+           file://sblim-sfcb-1.4.8-default-ecdh-curve-name.patch \
+           file://sfcb.service"
+           
+SRC_URI[md5sum] = "b2e0cb26628cb31e2374959637d9268c"
+SRC_URI[sha256sum] = "7dc0f16e2c2d3767466a09afee04e6febd611c157d66f8f0ae666be1fefbff3b"
+
+inherit autotools
+inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "sblim-sfcb.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+LDFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+
+EXTRA_OECONF = '--enable-debug \
+                --enable-ssl \
+                --enable-pam \
+                --enable-ipv6 \
+                CFLAGS="${CFLAGS} -D_GNU_SOURCE"'
+
+# make all with -j option is unsafe.
+PARALLEL_MAKE = ""
+
+INSANE_SKIP_${PN} = "dev-so"
+CONFIG_SITE = "${WORKDIR}/config-site.${P}"
+
+do_install() {
+    cp -f ${S}/sfcb.cfg.pre.in ${S}/sfcb.cfg
+
+    oe_runmake DESTDIR=${D} install
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/sfcb.service ${D}${systemd_unitdir}/system/sblim-sfcb.service
+    fi
+
+    install -d ${D}${sysconfdir}/init.d
+    mv ${D}${sysconfdir}/init.d/sfcb ${D}${sysconfdir}/init.d/sblim-sfcb
+    sed -i -e 's/\/var\/lock\/subsys\/sfcb/\/var\/lock\/subsys\/sblim-sfcb/g' ${D}${sysconfdir}/init.d/sblim-sfcb
+    
+    rm -rf ${D}${libdir}/sfcb/*.la
+}
+
+pkg_postinst_${PN} () {
+    OPTS=""
+
+    if [ x"$D" != "x" ]; then
+        OPTS="--root=$D"
+        if type systemctl >/dev/null 2>/dev/null; then
+                systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
+        fi
+        exit 1
+    fi
+
+    ${datadir}/sfcb/genSslCert.sh ${sysconfdir}/sfcb
+    ${bindir}/sfcbrepos -f
+}
+
+FILES_${PN} += "${libdir}/sfcb ${datadir}/sfcb"
+FILES_${PN}-dbg += "${libdir}/sfcb/.debug"
+
+RDEPENDS_${PN} = "perl bash"
-- 
1.8.4.2


