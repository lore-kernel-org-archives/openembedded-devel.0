Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Taq0c-0003zY-Vt
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2012 16:45:11 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2012 07:30:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,286,1352102400"; d="scan'208";a="222183682"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.208])
	by orsmga001.jf.intel.com with ESMTP; 20 Nov 2012 07:31:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2012 15:30:50 +0000
Message-Id: <370343df4dc83f16db9ae9014685d242c0f4b60a.1353425302.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353425302.git.paul.eggleton@linux.intel.com>
References: <cover.1353425302.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353425302.git.paul.eggleton@linux.intel.com>
References: <cover.1353425302.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH v2 6/8] xl2tpd: add from OE-Classic, update and tidy up
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
X-List-Received-Date: Tue, 20 Nov 2012 15:45:18 -0000

* Update to version 1.3.1
* Fetch source from a git tag as upstream apparently no longer publishes
  release tarballs
* Add virtual/kernel to DEPENDS since it needs the kernel source
* Inherit update-rc.d.bbclass
* Handle hardcoded paths in initscript
* Add LIC_FILES_CHKSUM
* Set SUMMARY (which sets DESCRIPTION)
* Remove some unnecessary cruft

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../xl2tpd/xl2tpd-1.3.1/cflags.patch               |   58 ++++++++++++++++++++
 .../recipes-protocols/xl2tpd/xl2tpd.inc            |   40 ++++++++++++++
 .../recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb       |    8 +++
 3 files changed, 106 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd-1.3.1/cflags.patch
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd-1.3.1/cflags.patch b/meta-networking/recipes-protocols/xl2tpd/xl2tpd-1.3.1/cflags.patch
new file mode 100644
index 0000000..3550812
--- /dev/null
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd-1.3.1/cflags.patch
@@ -0,0 +1,58 @@
+From 678d71e3b50f566776dbc29db49a1128be89caf6 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Fri, 26 Oct 2012 10:07:31 +0100
+Subject: [PATCH] Adjust CFLAGS for building within OE
+
+Updated version of cflags.patch from OE-Classic written by
+Vladimir Sorokin <sorokin@altell.ru>.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ Makefile |    8 +++++---
+ 1 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 6f6481f..c7602db 100644
+--- a/Makefile
++++ b/Makefile
+@@ -62,7 +62,7 @@ OSFLAGS?= -DLINUX -I$(KERNELSRC)/include/
+ # are packages seperately (eg kernel-headers on Fedora)
+ # Note: 2.6.23+ support still needs some changes in the xl2tpd source
+ #
+-#OSFLAGS+= -DUSE_KERNEL
++OSFLAGS+= -DUSE_KERNEL
+ #
+ #
+ # Uncomment the next line for FreeBSD
+@@ -90,7 +90,6 @@ OSFLAGS?= -DLINUX -I$(KERNELSRC)/include/
+ 
+ IPFLAGS?= -DIP_ALLOCATION
+ 
+-CFLAGS+= $(DFLAGS) -O2 -fno-builtin -Wall -DSANITY $(OSFLAGS) $(IPFLAGS)
+ HDRS=l2tp.h avp.h misc.h control.h call.h scheduler.h file.h aaa.h md5.h
+ OBJS=xl2tpd.o pty.o misc.o control.o avp.o call.o network.o avpsend.o scheduler.o file.o aaa.o md5.o
+ SRCS=${OBJS:.o=.c} ${HDRS}
+@@ -110,6 +109,9 @@ all: $(EXEC) pfc $(CONTROL_EXEC)
+ clean:
+ 	rm -f $(OBJS) $(EXEC) pfc.o pfc $(CONTROL_EXEC)
+ 
++%.o: %.c
++	$(CC) $(CFLAGS) $(DFLAGS) -O2 -DSANITY $(OSFLAGS) $(IPFLAGS) -o $@ -c $<
++
+ $(EXEC): $(OBJS) $(HDRS)
+ 	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)
+ 
+@@ -117,7 +119,7 @@ $(CONTROL_EXEC): $(CONTROL_SRCS)
+ 	$(CC) $(CONTROL_SRCS) -o $@
+ 
+ pfc:
+-	$(CC) $(CFLAGS) -c contrib/pfc.c
++	$(CC) $(CFLAGS) $(DFLAGS) -O2 -DSANITY $(OSFLAGS) $(IPFLAGS) -c contrib/pfc.c
+ 	$(CC) $(LDFLAGS) -o pfc pfc.o -lpcap $(LDLIBS)
+ 
+ romfs:
+-- 
+1.7.1
+
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
new file mode 100644
index 0000000..cea5427
--- /dev/null
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
@@ -0,0 +1,40 @@
+SUMMARY = "Xelerance version of the Layer 2 Tunneling Protocol (L2TP) daemon"
+HOMEPAGE = "http://www.xelerance.com/software/xl2tpd/"
+SECTION = "network"
+DEPENDS = "ppp virtual/kernel"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+INC_PR = "r0"
+
+SRC_URI = "git://github.com/xelerance/xl2tpd.git"
+
+S = "${WORKDIR}/git"
+
+inherit update-rc.d
+
+do_compile () {
+	oe_runmake CFLAGS="${CFLAGS} -DLINUX" LDFLAGS="${LDFLAGS}" PREFIX="${prefix}" KERNELSRC=${STAGING_KERNEL_DIR} all
+}
+
+do_install () {
+	oe_runmake PREFIX="${D}${prefix}" install
+
+	install -d ${D}${sysconfdir}/init.d
+	touch ${D}${sysconfdir}/xl2tpd.conf
+	install -m 0755 debian/xl2tpd.init ${D}${sysconfdir}/init.d/xl2tpd
+	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/xl2tpd
+	sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/xl2tpd
+	sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/xl2tpd
+	sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/xl2tpd
+
+	install -d ${D}${sysconfdir}/default
+	install -m 0644 debian/xl2tpd.default ${D}${sysconfdir}/default/xl2tpd
+}
+
+CONFFILES_${PN} += "${sysconfdir}/xl2tpd.conf ${sysconfdir}/default/xl2tpd"
+
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "xl2tpd"
+
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb
new file mode 100644
index 0000000..5321d6a
--- /dev/null
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb
@@ -0,0 +1,8 @@
+require xl2tpd.inc
+PR = "${INC_PR}.0"
+
+# 95445fc9aaeaf709d54c1cd934d4bed4467e910d corresponds to 1.3.1 tag
+SRCREV = "95445fc9aaeaf709d54c1cd934d4bed4467e910d"
+
+SRC_URI += " file://cflags.patch"
+
-- 
1.7.9.5



