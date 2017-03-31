Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3513277EC1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:50 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 79so18588273pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Uguvi2TyClDDIZCni1lWGK6YDbpNydcMzgsXPC+dnRw=;
	b=RjIvQUullb763eng4ZG+9TpXQWrQpd0/GCit8AvS1outXqDVpLPqNPfM5FoSbWNh6p
	l/hN1EmrfM9C8yZV+jZIYv0QFR6PMYfL2yJ5vFlJSuLLM6FdOg67Pivl2ssW67xKrEA4
	eVKOYM7aCwB8cHXCR5oIepbODcIzNdeGriAJQI8x9fE/hUhrcXoZyM05WoCL/ywyfPHW
	sljcruoNppEHohPGFHv4zbxXcWCEAVTnEaYwSaZnE02EIzaN+CI8oQcDmzadC9U4ibvH
	xBUu9/oFBGwiyHlybZV5B+eI4VYrHuwj1JxE9fjikbsg7N621xk1tJYFvxQrE+aV+A8b
	V//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Uguvi2TyClDDIZCni1lWGK6YDbpNydcMzgsXPC+dnRw=;
	b=eCBZYzUqv15VjgAj4PJNd+iXYo+/zDFgHMMHZJLkugBnm6FWVXgltTVQb+uBUTF/JL
	47md8o7dmLXxh8yuzxJIv33AQKaA9B1vmv5gKLVX0cO9+ksq9rkZSlj4Rrw45uAwp82N
	XQsr2mjOxNpHSX4kQp1peW9RQSihuIjGfQqvuG1c7j+vt/UMU6K2UhBRwkm76WrJMdID
	dMnHbI6i3lC72/cXJ7BArdHJOGn7UFO1oYOgdsvuCvIbS07i3pszvMvfzSHlDzqA+MmE
	Q3OdCHjsIFzmVqxVCtHskvJ0711vTl25chHQhys4UIEiB1mkS6eEMzQ7EaVAVaG0R/jS
	0uNA==
X-Gm-Message-State: AFeK/H1PdSKS1waJjUYcEpdZp5vIpidwQc2udQ2ktC3S+juY9vYTbO7KTxhcMQz2dyUqSg==
X-Received: by 10.98.47.4 with SMTP id v4mr3219301pfv.86.1490978631330;
	Fri, 31 Mar 2017 09:43:51 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:42 -0700
Message-Id: <20170331164247.5052-38-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 38/43] arptables: Upgrade to 0.0.4
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:50 -0000

Switch the SRC_URI to git based fetcher

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../arptables-compile-install.patch                | 61 -----------------
 ...FLAGS-for-package-specific-compiler-flags.patch | 79 ++++++++++++++++++++++
 .../arptables-arpt-get-target-fix.patch            |  0
 .../arptables-init-busybox.patch                   |  0
 .../arptables-remove-bashism.patch                 |  0
 .../arptables.service                              |  0
 .../{arptables_0.0.3-4.bb => arptables_git.bb}     | 43 ++++++------
 7 files changed, 98 insertions(+), 85 deletions(-)
 delete mode 100644 meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-compile-install.patch
 create mode 100644 meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch
 rename meta-networking/recipes-support/arptables/{arptables-0.0.3-4 => arptables}/arptables-arpt-get-target-fix.patch (100%)
 rename meta-networking/recipes-support/arptables/{arptables-0.0.3-4 => arptables}/arptables-init-busybox.patch (100%)
 rename meta-networking/recipes-support/arptables/{arptables-0.0.3-4 => arptables}/arptables-remove-bashism.patch (100%)
 rename meta-networking/recipes-support/arptables/{arptables-0.0.3-4 => arptables}/arptables.service (100%)
 rename meta-networking/recipes-support/arptables/{arptables_0.0.3-4.bb => arptables_git.bb} (61%)

diff --git a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-compile-install.patch b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-compile-install.patch
deleted file mode 100644
index 80e980472..000000000
--- a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-compile-install.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Index: arptables-v0.0.3-4/Makefile
-===================================================================
---- arptables-v0.0.3-4.orig/Makefile	2010-03-08 18:49:28.000000000 +0300
-+++ arptables-v0.0.3-4/Makefile	2010-03-22 15:52:56.000000000 +0300
-@@ -6,12 +6,11 @@
- LIBDIR:=$(PREFIX)/lib
- BINDIR:=$(PREFIX)/sbin
- MANDIR:=$(PREFIX)/man
--INITDIR:=/etc/rc.d/init.d
-+INITDIR:=/etc/init.d
- SYSCONFIGDIR:=/etc/sysconfig
- DESTDIR:=
- 
--COPT_FLAGS:=-O2
--CFLAGS:=$(COPT_FLAGS) -Wall -Wunused -I$(KERNEL_DIR)/include/ -Iinclude/ -DARPTABLES_VERSION=\"$(ARPTABLES_VERSION)\" #-g -DDEBUG #-pg # -DARPTC_DEBUG
-+ARPCFLAGS:=-Wall -Wunused -I$(KERNEL_DIR)/include/ -Iinclude/ -DARPTABLES_VERSION=\"$(ARPTABLES_VERSION)\"
- 
- ifndef ARPT_LIBDIR
- ARPT_LIBDIR:=$(LIBDIR)/arptables
-@@ -22,16 +21,16 @@
- all: arptables
- 
- arptables.o: arptables.c
--	$(CC) $(CFLAGS) -c -o $@ $<
-+	$(CC) $(CFLAGS) $(ARPCFLAGS) -c -o $@ $<
- 
- arptables-standalone.o: arptables-standalone.c
--	$(CC) $(CFLAGS) -c -o $@ $<
-+	$(CC) $(CFLAGS) $(ARPCFLAGS) -c -o $@ $<
- 
- libarptc/libarptc.o: libarptc/libarptc.c libarptc/libarptc_incl.c
--	$(CC) $(CFLAGS) -c -o $@ $<
-+	$(CC) $(CFLAGS) $(ARPCFLAGS) -c -o $@ $<
- 
- arptables: arptables-standalone.o arptables.o libarptc/libarptc.o $(EXT_OBJS)
--	$(CC) $(CFLAGS) -o $@ $^
-+	$(CC) $(LDFLAGS) $(CFLAGS) $(ARPCFLAGS) -o $@ $^
- 
- $(DESTDIR)$(MANDIR)/man8/arptables.8: arptables.8
- 	mkdir -p $(@D)
-@@ -50,6 +49,7 @@
- 	cat arptables-restore | sed 's/__EXEC_PATH__/$(tmp1)/g' > arptables-restore_
- 	install -m 0755 -o root -g root arptables-restore_ $(DESTDIR)$(BINDIR)/arptables-restore
- 	cat arptables.sysv | sed 's/__EXEC_PATH__/$(tmp1)/g' | sed 's/__SYSCONFIG__/$(tmp2)/g' > arptables.sysv_
-+	install -d $(DESTDIR)$(INITDIR)
- 	if test -d $(DESTDIR)$(INITDIR); then install -m 0755 -o root -g root arptables.sysv_ $(DESTDIR)$(INITDIR)/arptables; fi
- 	rm -f arptables-save_ arptables-restore_ arptables.sysv_
- 
-Index: arptables-v0.0.3-4/extensions/Makefile
-===================================================================
---- arptables-v0.0.3-4.orig/extensions/Makefile	2010-03-08 18:49:28.000000000 +0300
-+++ arptables-v0.0.3-4/extensions/Makefile	2010-03-22 15:52:38.000000000 +0300
-@@ -4,4 +4,7 @@
- EXT_OBJS+=$(foreach T,$(EXT_FUNC), extensions/arpt_$(T).o)
- 
- extensions/ebt_%.o: extensions/arpt_%.c include/arptables.h include/arptables_common.h
--	$(CC) $(CFLAGS) $(PROGSPECS) -c -o $@ $<
-+	$(CC) $(CFLAGS) $(ARPCFLAGS) $(PROGSPECS) -c -o $@ $<
-+
-+extensions/arpt_%.o: extensions/arpt_%.c include/arptables.h include/arptables_common.h
-+	$(CC) $(CFLAGS) $(ARPCFLAGS) $(PROGSPECS) -c -o $@ $<
diff --git a/meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch b/meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch
new file mode 100644
index 000000000..e8be45e6b
--- /dev/null
+++ b/meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch
@@ -0,0 +1,79 @@
+From a2021f0bc0f029dfa05dcca5db3d2ec77904d41a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 30 Mar 2017 12:33:51 -0700
+Subject: [PATCH] Use ARPCFLAGS for package specific compiler flags
+
+This leaves room for setting CFLAGS in environment
+which OE uses to pass tweaks
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile            | 15 +++++++--------
+ extensions/Makefile |  5 ++++-
+ 2 files changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7bead0d..336db6b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -7,15 +7,13 @@ LIBDIR:=$(PREFIX)/lib
+ BINDIR:=$(PREFIX)/sbin
+ MANDIR:=$(PREFIX)/man
+ man8dir=$(MANDIR)/man8
+-INITDIR:=/etc/rc.d/init.d
++INITDIR:=/etc/init.d
+ SYSCONFIGDIR:=/etc/sysconfig
+ DESTDIR:=
+ 
+ MANS = arptables.8 arptables-save.8 arptables-restore.8
+ 
+-COPT_FLAGS:=-O2
+-CFLAGS:=$(COPT_FLAGS) -Wall -Wunused -I$(KERNEL_DIR)/include/ -Iinclude/ -DARPTABLES_VERSION=\"$(ARPTABLES_VERSION)\" #-g -DDEBUG #-pg # -DARPTC_DEBUG
+-
++ARPCFLAGS:=-Wall -Wunused -I$(KERNEL_DIR)/include/ -Iinclude/ -DARPTABLES_VERSION=\"$(ARPTABLES_VERSION)\"
+ ifndef ARPT_LIBDIR
+ ARPT_LIBDIR:=$(LIBDIR)/arptables
+ endif
+@@ -25,13 +23,13 @@ include extensions/Makefile
+ all: arptables libarptc/libarptc.a
+ 
+ arptables.o: arptables.c
+-	$(CC) $(CFLAGS) -c -o $@ $<
++	$(CC) $(ARPCFLAGS) $(CFLAGS) -c -o $@ $<
+ 
+ arptables-standalone.o: arptables-standalone.c
+-	$(CC) $(CFLAGS) -c -o $@ $<
++	$(CC) $(ARPCFLAGS) $(CFLAGS) -c -o $@ $<
+ 
+ libarptc/libarptc.o: libarptc/libarptc.c libarptc/libarptc_incl.c
+-	$(CC) $(CFLAGS) -c -o $@ $<
++	$(CC) $(ARPCFLAGS) $(CFLAGS) -c -o $@ $<
+ 
+ libarptc/libarptc.a: libarptc/libarptc.o
+ 	$(AR) rcs $@ $<
+@@ -53,7 +51,8 @@ scripts: arptables-save arptables-restore arptables.sysv
+ 	install -m 0755 arptables-restore_ $(DESTDIR)$(BINDIR)/arptables-restore
+ 	cat arptables.sysv | sed 's/__EXEC_PATH__/$(tmp1)/g' | sed 's/__SYSCONFIG__/$(tmp2)/g' > arptables.sysv_
+ 	if [ "$(DESTDIR)" != "" ]; then mkdir -p $(DESTDIR)$(INITDIR); fi
+-	if test -d $(DESTDIR)$(INITDIR); then install -m 0755 arptables.sysv_ $(DESTDIR)$(INITDIR)/arptables; fi
++	install -d $(DESTDIR)$(INITDIR)
++	install -m 0755 arptables.sysv_ $(DESTDIR)$(INITDIR)/arptables
+ 	rm -f arptables-save_ arptables-restore_ arptables.sysv_
+ 
+ .PHONY: install-man
+diff --git a/extensions/Makefile b/extensions/Makefile
+index 0189cc9..b046425 100644
+--- a/extensions/Makefile
++++ b/extensions/Makefile
+@@ -4,4 +4,7 @@ EXT_FUNC+=standard mangle CLASSIFY MARK
+ EXT_OBJS+=$(foreach T,$(EXT_FUNC), extensions/arpt_$(T).o)
+ 
+ extensions/ebt_%.o: extensions/arpt_%.c include/arptables.h include/arptables_common.h
+-	$(CC) $(CFLAGS) $(PROGSPECS) -c -o $@ $<
++	$(CC) $(CFLAGS) $(ARPCFLAGS) $(PROGSPECS) -c -o $@ $<
++
++extensions/arpt_%.o: extensions/arpt_%.c include/arptables.h include/arptables_common.h
++	$(CC) $(CFLAGS) $(ARPCFLAGS) $(PROGSPECS) -c -o $@ $<
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-arpt-get-target-fix.patch b/meta-networking/recipes-support/arptables/arptables/arptables-arpt-get-target-fix.patch
similarity index 100%
rename from meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-arpt-get-target-fix.patch
rename to meta-networking/recipes-support/arptables/arptables/arptables-arpt-get-target-fix.patch
diff --git a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-init-busybox.patch b/meta-networking/recipes-support/arptables/arptables/arptables-init-busybox.patch
similarity index 100%
rename from meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-init-busybox.patch
rename to meta-networking/recipes-support/arptables/arptables/arptables-init-busybox.patch
diff --git a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-remove-bashism.patch b/meta-networking/recipes-support/arptables/arptables/arptables-remove-bashism.patch
similarity index 100%
rename from meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-remove-bashism.patch
rename to meta-networking/recipes-support/arptables/arptables/arptables-remove-bashism.patch
diff --git a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables.service b/meta-networking/recipes-support/arptables/arptables/arptables.service
similarity index 100%
rename from meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables.service
rename to meta-networking/recipes-support/arptables/arptables/arptables.service
diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
similarity index 61%
rename from meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
rename to meta-networking/recipes-support/arptables/arptables_git.bb
index f53640847..274a55d91 100644
--- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -1,15 +1,13 @@
 SUMMARY = "Administration tool for arp packet filtering"
-LICENSE = "GPL-2.0"
 SECTION = "net"
-
-PR = "r2"
-
-RDEPENDS_${PN} += "perl"
-
+LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+SRCREV = "f4ab8f63f11a72f14687a6646d04ae1bae3fa45f"
+PV = "0.0.4+git${SRCPV}"
+
 SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/ebtables/arptables-v${PV}.tar.gz;name=arptables \
-    file://arptables-compile-install.patch \
+    git://git.netfilter.org/arptables \
+    file://0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch \
     file://arptables-init-busybox.patch \
     file://arptables-arpt-get-target-fix.patch \
     file://arptables-remove-bashism.patch \
@@ -18,26 +16,23 @@ SRC_URI = " \
 SRC_URI[arptables.md5sum] = "1d4ab05761f063b0751645d8f2b8f8e5"
 SRC_URI[arptables.sha256sum] = "e529fd465c67d69ad335299a043516e6b38cdcd337a5ed21718413e96073f928"
 
-S = "${WORKDIR}/arptables-v${PV}"
-
-do_compile () {
-    oe_runmake
-}
+S = "${WORKDIR}/git"
+SYSTEMD_SERVICE_${PN} = "arptables.service"
 
-# the install target is not multi-job safe, but it doesn't do much
-# so we just install serially
-#
-PARALLEL_MAKEINST = "-j1"
+inherit systemd
 
-fakeroot do_install () {
-    oe_runmake 'BINDIR=${sbindir}' 'MANDIR=${mandir}/' 'DESTDIR=${D}' install
-}
+EXTRA_OEMAKE = "'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
 
 do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 644 ${WORKDIR}/arptables.service ${D}${systemd_unitdir}/system
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/arptables.service ${D}${systemd_unitdir}/system
+    fi
 }
 
-inherit systemd
+RDEPENDS_${PN} += "perl"
 
-SYSTEMD_SERVICE_${PN} = "arptables.service"
+# the install target is not multi-job safe, but it doesn't do much
+# so we just install serially
+#
+PARALLEL_MAKEINST = "-j1"
-- 
2.12.1


