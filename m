Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2B30877EA5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Oct 2017 20:20:56 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Oct 2017 13:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,478,1500966000"; d="scan'208";a="135214709"
Received: from mhrasooi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.135.159])
	by orsmga004.jf.intel.com with ESMTP; 04 Oct 2017 13:20:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Oct 2017 09:20:23 +1300
Message-Id: <4da0611806ae98b10f6ae00200b3e292a068f940.1507147924.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1507147924.git.paul.eggleton@linux.intel.com>
References: <cover.1507147924.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 1/1] mdns: move from meta-intel-iot-middleware
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Oct 2017 20:20:56 -0000

The following improvements have been made over the recipe that was in
meta-intel-iot-middleware (a layer which is no longer actively
maintained):

* Upgrade to latest upstream version (765.50.9)
* Fix compilation failures by passing CC and LD
* Fix "no GNU hash in the ELF binary" issue
* Point S at the correct source subdirectory so that "make clean" works
* Fix lack of soname on libdns_sd.so leading to missing RDEPENDS QA error
* Add SUMMARY

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-protocols/mdns/files/build.patch       | 167 +++++++++++++++++++++
 .../recipes-protocols/mdns/files/mdns.service      |  15 ++
 .../recipes-protocols/mdns/mdns_765.50.9.bb        |  89 +++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/mdns/files/build.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/mdns.service
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb

diff --git a/meta-networking/recipes-protocols/mdns/files/build.patch b/meta-networking/recipes-protocols/mdns/files/build.patch
new file mode 100644
index 0000000..4ab9d23
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/build.patch
@@ -0,0 +1,167 @@
+From 43b6e98c9c37afd0d914949dcff4eab81f5a995f Mon Sep 17 00:00:00 2001
+From: Brendan Le Foll <brendan.le.foll@intel.com>
+Date: Tue, 3 Mar 2015 11:42:57 +0000
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+---
+ mDNSPosix/Makefile | 54 +++++++++++++++++++++++++-----------------------------
+ 1 file changed, 25 insertions(+), 29 deletions(-)
+
+diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
+index 4f98e90..8ac97ad 100755
+--- a/mDNSPosix/Makefile
++++ b/mDNSPosix/Makefile
+@@ -50,6 +50,7 @@
+ 
+ LIBVERS = 1
+ 
++POSIXDIR = ../mDNSPosix
+ COREDIR = ../mDNSCore
+ SHAREDDIR ?= ../mDNSShared
+ JDK = /usr/jdk
+@@ -58,11 +59,11 @@ CC = @cc
+ BISON = @bison
+ FLEX = @flex
+ ST = @strip
+-LD = ld -shared
++LD =@LD
+ CP = cp
+ RM = rm
+ LN = ln -s -f
+-CFLAGS_COMMON = -I$(COREDIR) -I$(SHAREDDIR) -I$(OBJDIR) -fwrapv -W -Wall -DPID_FILE=\"/var/run/mdnsd.pid\" -DMDNS_UDS_SERVERPATH=\"/var/run/mdnsd\"
++CFLAGS_COMMON = -I$(POSIXDIR) -I$(COREDIR) -I$(SHAREDDIR) -I$(OBJDIR) -fwrapv -W -Wall -DPID_FILE=\"/var/run/mdnsd.pid\" -DMDNS_UDS_SERVERPATH=\"/var/run/mdnsd\"
+ CFLAGS_PTHREAD =
+ LINKOPTS =
+ LINKOPTS_PTHREAD = -lpthread
+@@ -70,7 +71,7 @@ LDSUFFIX = so
+ JAVACFLAGS_OS = -fPIC -shared -ldns_sd
+ 
+ # Set up diverging paths for debug vs. prod builds
+-DEBUG=0
++DEBUG?=1
+ ifeq ($(DEBUG),1)
+ CFLAGS_DEBUG = -g -DMDNS_DEBUGMSGS=2
+ OBJDIR = objects/debug
+@@ -213,7 +214,7 @@ endif
+ endif
+ endif
+ 
+-CFLAGS = $(CFLAGS_COMMON) $(CFLAGS_OS) $(CFLAGS_DEBUG)
++CFLAGS_BUILD = $(CFLAGS) $(CFLAGS_COMMON) $(CFLAGS_OS) $(CFLAGS_DEBUG)
+ 
+ #############################################################################
+ 
+@@ -249,8 +250,7 @@ Daemon: setup $(BUILDDIR)/mdnsd
+ 	@echo "Responder daemon done"
+ 
+ $(BUILDDIR)/mdnsd: $(DAEMONOBJS)
+-	$(CC) -o $@ $+ $(LINKOPTS)
+-	@$(STRIP) $@
++	$(CC) -o $@ $+
+ 
+ # libdns_sd target builds the client library
+ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
+@@ -259,22 +259,18 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
+ CLIENTLIBOBJS = $(OBJDIR)/dnssd_clientlib.c.so.o $(OBJDIR)/dnssd_clientstub.c.so.o $(OBJDIR)/dnssd_ipc.c.so.o
+ 
+ $(BUILDDIR)/libdns_sd.$(LDSUFFIX): $(CLIENTLIBOBJS)
+-	@$(LD) $(LINKOPTS) -o $@ $+
+-	@$(STRIP) $@
++	$(LD) -shared $(LINKOPTS) -Wl,-soname,libdns_sd.$(LDSUFFIX).1 -o $@ $+
+ 
+-Clients: setup libdns_sd ../Clients/build/dns-sd
++Clients: setup libdns_sd
++	@$(MAKE) -C ../Clients DEBUG=${DEBUG}
+ 	@echo "Clients done"
+ 
+-../Clients/build/dns-sd:
+-	@$(MAKE) -C ../Clients
+-
+ # nss_mdns target builds the Name Service Switch module
+ nss_mdns: setup $(BUILDDIR)/$(NSSLIBFILE)
+ 	@echo "Name Service Switch module done"
+ 
+ $(BUILDDIR)/$(NSSLIBFILE): $(CLIENTLIBOBJS) $(OBJDIR)/nss_mdns.c.so.o
+-	@$(LD) $(LINKOPTS) -o $@ $+
+-	@$(STRIP) $@
++	$(LD) -shared $(LINKOPTS) -o $@ $+
+ 
+ #############################################################################
+ 
+@@ -470,55 +466,55 @@ dnsextd: setup $(BUILDDIR)/dnsextd
+ 	@echo "dnsextd done"
+ 
+ $(BUILDDIR)/mDNSClientPosix:         $(APPOBJ)     $(OBJDIR)/Client.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@
+ 
+ $(BUILDDIR)/mDNSResponderPosix:      $(COMMONOBJ)  $(OBJDIR)/Responder.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@
+ 
+ $(BUILDDIR)/mDNSProxyResponderPosix: $(COMMONOBJ)  $(OBJDIR)/ProxyResponder.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@
+ 
+ $(BUILDDIR)/mDNSIdentify:            $(SPECIALOBJ) $(OBJDIR)/Identify.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@
+ 
+ $(OBJDIR)/Identify.c.o:              $(COREDIR)/mDNS.c # Note: Identify.c textually imports mDNS.c
+ 
+ $(BUILDDIR)/mDNSNetMonitor:          $(SPECIALOBJ) $(OBJDIR)/NetMonitor.c.o
+-	$(CC) $+ -o $@ $(LINKOPTS)
++	$(CC) $+ -o $@
+ 
+ $(OBJDIR)/NetMonitor.c.o:            $(COREDIR)/mDNS.c # Note: NetMonitor.c textually imports mDNS.c
+ 
+ $(BUILDDIR)/dnsextd:                 $(DNSEXTDOBJ) $(OBJDIR)/dnsextd.c.threadsafe.o
+-	$(CC) $+ -o $@ $(LINKOPTS) $(LINKOPTS_PTHREAD)
++	$(CC) $+ -o $@ $(LINKOPTS_PTHREAD)
+ 
+ #############################################################################
+ 
+ # Implicit rules
+ $(OBJDIR)/%.c.o:	%.c
+-	$(CC) $(CFLAGS) -c -o $@ $<
++	$(CC) $(CFLAGS_BUILD) -c -o $@ $<
+ 
+ $(OBJDIR)/%.c.o:	$(COREDIR)/%.c
+-	$(CC) $(CFLAGS) -c -o $@ $<
++	$(CC) $(CFLAGS_BUILD) -c -o $@ $<
+ 
+ $(OBJDIR)/%.c.o:	$(SHAREDDIR)/%.c
+-	$(CC) $(CFLAGS) -c -o $@ $<
++	$(CC) $(CFLAGS_BUILD) -c -o $@ $<
+ 
+ $(OBJDIR)/%.c.threadsafe.o:	%.c
+-	$(CC) $(CFLAGS) $(CFLAGS_PTHREAD) -D_REENTRANT -c -o $@ $<
++	$(CC) $(CFLAGS_BUILD) $(CFLAGS_PTHREAD) -D_REENTRANT -c -o $@ $<
+ 
+ $(OBJDIR)/%.c.threadsafe.o:	$(SHAREDDIR)/%.c
+-	$(CC) $(CFLAGS) $(CFLAGS_PTHREAD) -D_REENTRANT -c -o $@ $<
++	$(CC) $(CFLAGS_BUILD) $(CFLAGS_PTHREAD) -D_REENTRANT -c -o $@ $<
+ 
+ $(OBJDIR)/%.c.so.o:	%.c
+-	$(CC) $(CFLAGS) -c -fPIC -o $@ $<
++	$(CC) $(CFLAGS_BUILD) -c -fPIC -o $@ $<
+ 
+ $(OBJDIR)/%.c.so.o:	$(SHAREDDIR)/%.c
+-	$(CC) $(CFLAGS) -c -fPIC -o $@ $<
++	$(CC) $(CFLAGS_BUILD) -c -fPIC -o $@ $<
+ 
+ $(OBJDIR)/%.y.o: $(SHAREDDIR)/%.y
+ 	$(BISON)              -o $(OBJDIR)/$*.c -d $<
+-	$(CC) $(CFLAGS) -c -o $@ $(OBJDIR)/$*.c
++	$(CC) $(CFLAGS_BUILD) -c -o $@ $(OBJDIR)/$*.c
+ 
+ $(OBJDIR)/%.l.o: $(SHAREDDIR)/%.l
+ 	$(FLEX) $(FLEXFLAGS_OS) -i             -o$(OBJDIR)/$*.l.c $<
+-	$(CC) $(CFLAGS) -Wno-error -c -o $@ $(OBJDIR)/$*.l.c
++	$(CC) $(CFLAGS_BUILD) -Wno-error -c -o $@ $(OBJDIR)/$*.l.c
+-- 
+2.9.5
+
diff --git a/meta-networking/recipes-protocols/mdns/files/mdns.service b/meta-networking/recipes-protocols/mdns/files/mdns.service
new file mode 100644
index 0000000..531d142
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/mdns.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Zero-configuration networking
+After=network.target
+
+[Service]
+Type=forking
+ExecStartPre=/bin/rm -f /var/run/mdnsd.pid
+ExecStart=/usr/sbin/mdnsd
+ExecReload=/bin/kill -HUP $MAINPID
+PIDFile=/var/run/mdnsd.pid
+Restart=always
+RestartSec=10s
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb b/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb
new file mode 100644
index 0000000..1a80f7a
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb
@@ -0,0 +1,89 @@
+SUMMARY = "Publishes & browses available services on a link according to the Zeroconf / Bonjour protocol"
+DESCRIPTION = "Bonjour, also known as zero-configuration networking, enables automatic discovery of computers, devices, and services on IP networks."
+HOMEPAGE = "http://developer.apple.com/networking/bonjour/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
+
+RPROVIDES_${PN} += "libdns_sd.so"
+
+SRC_URI = "http://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz \
+           file://build.patch;patchdir=.. \
+           file://mdns.service \
+           "
+
+SRC_URI[md5sum] = "4a6bc1628851002634ea3833a4dca317"
+SRC_URI[sha256sum] = "de61dd0034357aa50c60806726fb1f70fa8e953ff9cb62eccfb73efad10dba0a"
+
+PARALLEL_MAKE = ""
+
+S = "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
+
+EXTRA_OEMAKE += "os=linux DEBUG=0 'CC=${CC}' 'LD=${CCLD} ${LDFLAGS}'"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_install () {
+    install -d ${D}${sbindir}
+    install -m 0755 build/prod/mdnsd ${D}${sbindir}
+
+    install -d ${D}${libdir}
+    cp build/prod/libdns_sd.so ${D}${libdir}/libdns_sd.so.1
+    chmod 0644 ${D}${libdir}/libdns_sd.so.1
+    ln -s libdns_sd.so.1 ${D}${libdir}/libdns_sd.so
+
+    install -d ${D}${includedir}
+    install -m 0644 ../mDNSShared/dns_sd.h ${D}${includedir}
+
+    install -d ${D}${mandir}/man8
+    install -m 0644 ../mDNSShared/mDNSResponder.8 ${D}${mandir}/man8/mdnsd.8
+
+    install -d ${D}${bindir}
+    install -m 0755 ../Clients/build/dns-sd ${D}${bindir}
+
+    install -d ${D}${libdir}
+    oe_libinstall -C build/prod -so libnss_mdns-0.2 ${D}${libdir}
+    ln -s libnss_mdns-0.2.so ${D}${libdir}/libnss_mdns.so.2
+
+    install -d ${D}${sysconfdir}
+    install -m 0644 nss_mdns.conf ${D}${sysconfdir}
+
+    install -d ${D}${mandir}/man5
+    install -m 0644 nss_mdns.conf.5 ${D}${mandir}/man5
+
+    install -d ${D}${mandir}/man8
+    install -m 0644 libnss_mdns.8 ${D}${mandir}/man8
+
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/mdns.service ${D}${systemd_unitdir}/system/
+}
+
+pkg_postinst_${PN} () {
+    sed -e '/^hosts:/s/\s*\<mdns\>//' \
+        -e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mdns\3\4\5/' \
+        -i $D/etc/nsswitch.conf
+}
+
+pkg_prerm_${PN} () {
+    sed -e '/^hosts:/s/\s*\<mdns\>//' \
+        -e '/^hosts:/s/\s*mdns//' \
+        -i $D/etc/nsswitch.conf
+}
+
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "mdns.service"
+
+FILES_${PN} += "${systemd_unitdir}/system/mdns.service"
+FILES_${PN} += "${libdir}/libdns_sd.so.1 \
+                ${bindir}/dns-sd \
+                ${libdir}/libnss_mdns-0.2.so \
+                ${sysconfdir}/nss_mdns.conf"
+
+FILES_${PN}-dev += "${libdir}/libdns_sd.so \
+                    ${includedir}/dns_sd.h "
+
+FILES_${PN}-man += "${mandir}/man8/mdnsd.8 \
+                    ${mandir}/man5/nss_mdns.conf.5 \
+                    ${mandir}/man8/libnss_mdns.8"
+
+PACKAGES = "${PN} ${PN}-dev ${PN}-man ${PN}-dbg"
-- 
2.9.5


