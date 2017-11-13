Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9220178670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 13:21:30 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u97so14435741wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 05:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=S8D1QULhfBnFYA2dHTy9et0eHNWKBoigMpBUAwhoflE=;
	b=M2QXbYvrNa0Xn69xgXcGDkvRAlLvMOokPnC71kmTpoodeSkQWZj1MQ2+HCRBz9CF9w
	1J1fb+4ADSLd+5sDmqrFa0wkCU6MLq4kqqol46LTBJeUPru0Ax1qaoRNWJiGxL2zLdT8
	7TJvOANow4qYz0WDK9udmGoDiTtn9Cguxg+tDVqNF52ie/mq5fT27kdhd4qMoMwORTok
	GYBwJ31conssAUSQmcGlElxJFjWJrgblEW/pd/mg9RoTfTV2zm94UNQptBRg+e1Abel+
	z7As8WJinud0cY0wBkas4q+jBk1IIkemo0sAAl3rhnL/NL4C/ydO9cun5h1Ne0wlZkJc
	lN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=S8D1QULhfBnFYA2dHTy9et0eHNWKBoigMpBUAwhoflE=;
	b=hw2Lt5IKnopg1MoEV0Z87xsKYc5YFpQNqJcGpDkOn+90qf8hnTZbFIj33U9fLM15kL
	Odbe9QSBgP6XcsiffUa5aC71BmzX/eev7cxoS/cgms5n7rBIqnBDupVfkT8pL53CWGaG
	C7XkiehtQTreqWguzsqO2AQX3XHtxI4JeWIs0hY8prX4c6vmIDfr3W9TjtaSoWfWMvrb
	m9EvWVzzTICaFQI4+8184LpMIGPimJxfbtD5szwBTdNCyARzySBpP+Gtr9T+M4W+JnaE
	RUT8TMOIRDYgfH0ZJMKJGdhYNrfoHCzvN4j/ocMqoNx0eGiopGcb0HHCZxpSZjZsPfwM
	VkzQ==
X-Gm-Message-State: AJaThX4TGpP/7+Bpnns1CRqbv9JqzgTxEo0EThc+AeCnB73y11aNJ9vu
	niZaovDobZWviALpf13P4BSzh69o
X-Google-Smtp-Source: AGs4zMZoadvWPSYJ3Q+6VaXMMcs1DzYIbdetbmSJ+alRxJcQJiBgX5vWV4qn5CT16SWOIB0sr4uPzw==
X-Received: by 10.223.184.42 with SMTP id h39mr7593377wrf.38.1510579290898;
	Mon, 13 Nov 2017 05:21:30 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m198sm19788050wmg.20.2017.11.13.05.21.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 05:21:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Nov 2017 13:21:26 +0000
Message-Id: <20171113132126.30759-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pcmciautils: add (from oe-core)
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
X-List-Received-Date: Mon, 13 Nov 2017 13:21:30 -0000

Modern hardware doesn't really use PCMCIA so the support has been moved out of
oe-core.  Move into meta-oe for people who still want it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../pcmciautils/pcmciautils/lex_sys_types.patch    |  21 +++++
 .../pcmciautils/pcmciautils/makefile_fix.patch     | 101 +++++++++++++++++++++
 .../pcmciautils/pcmciautils/makefile_race.patch    |  43 +++++++++
 meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb |  41 +++++++++
 4 files changed, 206 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/pcmciautils/pcmciautils/lex_sys_types.patch
 create mode 100644 meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_fix.patch
 create mode 100644 meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_race.patch
 create mode 100644 meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb

diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils/lex_sys_types.patch b/meta-oe/recipes-bsp/pcmciautils/pcmciautils/lex_sys_types.patch
new file mode 100644
index 000000000..d4c2bed15
--- /dev/null
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils/lex_sys_types.patch
@@ -0,0 +1,21 @@
+Include sys/types.h for u_long definition
+
+Fix errors like
+In file included from src/lex_config.l:34:0:
+src/yacc_config.y:45:5: error: unknown type name 'u_long'
+     u_long num;
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: pcmciautils-018/src/lex_config.l
+===================================================================
+--- pcmciautils-018.orig/src/lex_config.l
++++ pcmciautils-018/src/lex_config.l
+@@ -22,6 +22,7 @@
+ #include <unistd.h>
+ #include <string.h>
+ #include <syslog.h>
++#include <sys/types.h>
+ 
+ #ifdef HAS_WORDEXP
+ #include <wordexp.h>
diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_fix.patch b/meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_fix.patch
new file mode 100644
index 000000000..7b0ce2119
--- /dev/null
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_fix.patch
@@ -0,0 +1,101 @@
+Upstream-Status: Inappropriate [configuration]
+
+Hardcoded paths are bad...
+This lets us use the install from OE's native sysroot
+rebase the patch to 018, removing hardcoded path for true
+as well. Removing of -D in install invocation is a little
+questionable, is it some GNU extention?
+
+-Khem Raj <raj.khem@gmail.com>
+
+Index: pcmciautils-018/Makefile
+===================================================================
+--- pcmciautils-018.orig/Makefile
++++ pcmciautils-018/Makefile
+@@ -76,7 +76,7 @@ sbindir =	${exec_prefix}/sbin
+ mandir =	${prefix}/usr/share/man
+ udevdir =	${prefix}/lib/udev
+ 
+-INSTALL = /usr/bin/install -c
++INSTALL = install -c
+ INSTALL_PROGRAM = ${INSTALL}
+ INSTALL_DATA  = ${INSTALL} -m 644
+ INSTALL_SCRIPT = ${INSTALL_PROGRAM}
+@@ -180,7 +180,7 @@ endif
+ # if DEBUG is enabled, then we do not strip or optimize
+ ifeq ($(strip $(DEBUG)),true)
+ 	CFLAGS  += -O1 -g -DDEBUG -D_GNU_SOURCE
+-	STRIPCMD = /bin/true -Since_we_are_debugging
++	STRIPCMD = true -Since_we_are_debugging
+ else
+ 	CFLAGS  += $(OPTIMIZATION) -fomit-frame-pointer -D_GNU_SOURCE
+ 	STRIPCMD = $(STRIP) -s --remove-section=.note --remove-section=.comment
+@@ -273,30 +273,32 @@ clean:
+ 
+ install-hotplug:
+ 	$(INSTALL) -d $(DESTDIR)$(hotplugdir)
+-	$(INSTALL_PROGRAM) -D hotplug/pcmcia.agent $(DESTDIR)$(hotplugdir)/pcmcia.agent
+-	$(INSTALL_PROGRAM) -D hotplug/pcmcia.rc $(DESTDIR)$(hotplugdir)/pcmcia.rc
++	$(INSTALL_PROGRAM) hotplug/pcmcia.agent $(DESTDIR)$(hotplugdir)/pcmcia.agent
++	$(INSTALL_PROGRAM) hotplug/pcmcia.rc $(DESTDIR)$(hotplugdir)/pcmcia.rc
+ 
+ uninstall-hotplug:
+ 	- rm -f $(DESTDIR)$(hotplugdir)/pcmcia.agent $(DESTDIR)$(hotplugdir)/pcmcia.rc
+ 
+ install-socket-hotplug:
+-	$(INSTALL_PROGRAM) -D hotplug/pcmcia_socket.agent $(DESTDIR)$(hotplugdir)/pcmcia_socket.agent
+-	$(INSTALL_PROGRAM) -D hotplug/pcmcia_socket.rc $(DESTDIR)$(hotplugdir)/pcmcia_socket.rc
++	$(INSTALL_PROGRAM) hotplug/pcmcia_socket.agent $(DESTDIR)$(hotplugdir)/pcmcia_socket.agent
++	$(INSTALL_PROGRAM) hotplug/pcmcia_socket.rc $(DESTDIR)$(hotplugdir)/pcmcia_socket.rc
+ 
+ uninstall-socket-hotplug:
+ 	- rm -f $(DESTDIR)$(hotplugdir)/pcmcia_socket.agent $(DESTDIR)$(hotplugdir)/pcmcia_socket.rc
+ 
+ install-socket-tools:
+-	$(INSTALL_PROGRAM) -D $(PCMCIA_SOCKET_STARTUP) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_SOCKET_STARTUP)
++	$(INSTALL) -d $(DESTDIR)$(udevhelperdir)
++	$(INSTALL_PROGRAM) $(PCMCIA_SOCKET_STARTUP) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_SOCKET_STARTUP)
+ 
+ uninstall-socket-tools:
+ 	- rm -f $(DESTDIR)$(udevhelperdir)/$(PCMCIA_SOCKET_STARTUP)
+ 
+ install-tools:
+ 	$(INSTALL) -d $(DESTDIR)$(sbindir)
+-	$(INSTALL_PROGRAM) -D $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(PCCARDCTL)
++	$(INSTALL) -d $(DESTDIR)$(udevhelperdir)
++	$(INSTALL_PROGRAM) $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(PCCARDCTL)
+ 	$(SYMLINK) $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(LSPCMCIA)
+-	$(INSTALL_PROGRAM) -D $(PCMCIA_CHECK_BROKEN_CIS) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_CHECK_BROKEN_CIS)
++	$(INSTALL_PROGRAM) $(PCMCIA_CHECK_BROKEN_CIS) $(DESTDIR)$(udevhelperdir)/$(PCMCIA_CHECK_BROKEN_CIS)
+ 
+ uninstall-tools:
+ 	- rm -f $(DESTDIR)$(sbindir)/$(PCCARDCTL)
+@@ -305,22 +307,24 @@ uninstall-tools:
+ 
+ install-config:
+ 	$(INSTALL) -d $(DESTDIR)$(pcmciaconfdir)
+-	$(INSTALL_DATA)  -D config/config.opts $(DESTDIR)$(pcmciaconfdir)/config.opts
++	$(INSTALL_DATA)  config/config.opts $(DESTDIR)$(pcmciaconfdir)/config.opts
+ 	if [ -f config/config.opts.$(ARCH) ]; then \
+-		$(INSTALL_DATA) -D config/config.opts.$(ARCH) $(DESTDIR)$(pcmciaconfdir)/config.opts; \
++		$(INSTALL_DATA) config/config.opts.$(ARCH) $(DESTDIR)$(pcmciaconfdir)/config.opts; \
+ 	fi
+ 
+ uninstall-config:
+ #	- rm -f $(DESTDIR)$(pcmciaconfdir)/config.opts
+ 
+ install-udev:
+-	$(INSTALL_DATA) -D $(UDEV_RULES_FILE) $(DESTDIR)$(udevrulesdir)/60-pcmcia.rules
++	$(INSTALL) -d $(DESTDIR)$(udevrulesdir)
++	$(INSTALL_DATA) $(UDEV_RULES_FILE) $(DESTDIR)$(udevrulesdir)/60-pcmcia.rules
+ 
+ uninstall-udev:
+ 	- rm -f $(DESTDIR)$(udevrulesdir)/60-pcmcia.rules
+ 
+ install-man:
+-	$(INSTALL_DATA) -D man/man8/pccardctl.8 $(DESTDIR)$(mandir)/man8/pccardctl.8
++	$(INSTALL) -d $(DESTDIR)$(mandir)/man8
++	$(INSTALL_DATA) man/man8/pccardctl.8 $(DESTDIR)$(mandir)/man8/pccardctl.8
+ 	$(SYMLINK) pccardctl.8 $(DESTDIR)$(mandir)/man8/lspcmcia.8
+ 
+ uninstall-man:
diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_race.patch b/meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_race.patch
new file mode 100644
index 000000000..f5a518ff7
--- /dev/null
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_race.patch
@@ -0,0 +1,43 @@
+"make src/lex_config.o"
+
+results in:
+
+src/lex_config.l:35:25: fatal error: yacc_config.h: No such file or directory
+
+so add missing dependency through a missing rule. Also remove a rule which
+doesn't appear to do anything.
+
+RP
+2016/1/31
+
+Upstream-Status: Pending
+
+Index: pcmciautils-018/Makefile
+===================================================================
+--- pcmciautils-018.orig/Makefile
++++ pcmciautils-018/Makefile
+@@ -249,6 +249,9 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/st
+ yacc_config.o lex_config.o: %.o: %.c src/yacc_config.h
+ 	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
+ 
++src/lex_config.o : src/lex_config.c src/yacc_config.h
++	$(QUIET) $(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
++
+ debugtools: ccdv $(CBDUMP) $(CISDUMP)
+ 
+ $(CBDUMP): $(LIBC) debug/cbdump.o
+Index: pcmciautils-018/Makefile
+===================================================================
+--- pcmciautils-018.orig/Makefile
++++ pcmciautils-018/Makefile
+@@ -246,8 +246,8 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/st
+ 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
+ 	$(QUIET) $(STRIPCMD) $@
+ 
+-yacc_config.o lex_config.o: %.o: %.c
+-	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
++src/lex_config.o : src/lex_config.c src/yacc_config.h ccdv
++	$(QUIET) $(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
+ 
+ debugtools: ccdv $(CBDUMP) $(CISDUMP)
+ 
diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
new file mode 100644
index 000000000..2e59f05c2
--- /dev/null
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Linux kernel userland utilities for the PCMCIA subsystem"
+HOMEPAGE = "https://www.kernel.org/pub/linux/utils/kernel/pcmcia/"
+SECTION = "kernel/userland"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "udev sysfsutils flex-native"
+RDEPENDS_${PN} = "udev module-init-tools"
+
+PR = "r1"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/${BP}.tar.xz \
+           file://makefile_fix.patch \
+           file://makefile_race.patch \
+           file://lex_sys_types.patch \
+"
+
+SRC_URI[md5sum] = "885431c3cefb76ffdad8cb985134e996"
+SRC_URI[sha256sum] = "57c27be8f04ef4d535bcfa988567316cc57659fe69068327486dab53791e6558"
+
+inherit pkgconfig
+
+export HOSTCC = "${BUILD_CC}"
+export etcdir = "${sysconfdir}"
+export sbindir = "${base_sbindir}"
+export pcmciaconfdir = "${sysconfdir}/pcmcia"
+export udevdir = "`pkg-config --variable=udevdir udev`"
+export udevrulesdir = "`pkg-config --variable=udevdir udev`/rules.d"
+export UDEV = "1"
+LD = "${CC}"
+CFLAGS =+ "-I${S}/src"
+CFLAGS =+ "-DPCMCIAUTILS_VERSION=\\"${PV}\\""
+
+EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install
+}
+
+CONFFILES_${PN} += "${sysconfdir}/pcmcia/config.opts"
-- 
2.11.0


