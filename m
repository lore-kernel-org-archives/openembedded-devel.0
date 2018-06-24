Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id C9D1A74CAF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:28 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id g20-v6so5778310plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9C3wDbgd6F+PxsXa+gLs/cL2Sg9oofs5NkNk+SgozN4=;
	b=HbqhEtfUFsPU2ETbH7kPSH5mR8GaAX4C32mheEbdh1H172iSCm8iFOL//Bz+51H6ly
	MphCC1wOJ06lm3hsHiGzJwfXu2q/j7nfefhhBM3dSse/NVg8R+DA4Fp2vFUA/UVUxMmQ
	4vhrkpcVQlm8/9YU3NXEFi02j3ZZHO00qmMeUA1fYiH1T30Ggmd+6LNItsVQk1sk/vyj
	qON2sElGwyvlEeAXQVhMGuoxxdnHbV/b18jDQrAHw3ahbRpOnedtOqO6xXAO2V2VCCIR
	YvcWwsBwsNrMpJZRmo/0IRQPgQ2lkYRtM0hcsbJkLIdgvwnw3sClryWZ80S5T9COwkAY
	gpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9C3wDbgd6F+PxsXa+gLs/cL2Sg9oofs5NkNk+SgozN4=;
	b=W5RKpFUCvAKATenHO6MlBDBJM5f43H2dYDzMc6nwcA6JkqM2rddtAonslnOsGtcaSI
	2zW5FD/wJICSGemwWwZWZTy5TByc5+MCIpHzbZj/DAvw4hTOPascKXbvPap5yyxezyA2
	8pkQNDCaVPSeEm1bKaQZ09QRrT92KfJ9Lmp78PS8EB0uq26IliLpsKpufaWe2Ak3Fzop
	SlVyKBuNd1BTiTUycdYBS8T0Ehx10d/wB4EQwa7ZVe2DgNI6L/mgIOL4cfNm3iiTGLWs
	ZNsvEX+Y+bmB0+JOkK5mC6adY3boXgCeotKqGuaGOTCk6MZ3zIAEP90jZqyJgGg4yjFs
	B3xA==
X-Gm-Message-State: APt69E1LpFnrJyqJP53srC4Kur+vgTQQ8adIPo7OaNeraL0c7Fj1sAOj
	AIDX3G5yJr8PNSmNAujxM0VLcg==
X-Google-Smtp-Source: ADUXVKJ8uK1dDgZ3CO9fOQJgg1xRs+d0THmUsVpeytoMkQqmuEE6vJINX+NDPKxrkhGW1lNdOzRSyQ==
X-Received: by 2002:a17:902:bd05:: with SMTP id
	p5-v6mr9749615pls.32.1529867969465; 
	Sun, 24 Jun 2018 12:19:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:26 -0700
Message-Id: <20180624191845.31082-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH 01/20] pcmciautils: add (from oe-core)
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:28 -0000

From: Ross Burton <ross.burton@intel.com>

Modern hardware doesn't really use PCMCIA so the support has been moved out of
oe-core.  Move into meta-oe for people who still want it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pcmciautils/lex_sys_types.patch           |  21 ++++
 .../pcmciautils/makefile_fix.patch            | 101 ++++++++++++++++++
 .../pcmciautils/makefile_race.patch           |  43 ++++++++
 .../pcmciautils/pcmciautils_018.bb            |  41 +++++++
 4 files changed, 206 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/pcmciautils/pcmciautils/lex_sys_types.patch
 create mode 100644 meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_fix.patch
 create mode 100644 meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_race.patch
 create mode 100644 meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb

diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils/lex_sys_types.patch b/meta-oe/recipes-bsp/pcmciautils/pcmciautils/lex_sys_types.patch
new file mode 100644
index 0000000000..d4c2bed15c
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
index 0000000000..7b0ce21194
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
index 0000000000..f5a518ff73
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
index 0000000000..2e59f05c2c
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
2.18.0


