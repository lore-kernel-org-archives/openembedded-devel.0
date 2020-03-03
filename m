Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id BC5B061966
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 21:10:03 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id y30so2099529pga.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 13:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wOQRXEza4PEwmmeCQlXulkDfZ84Nu0StpjY/jX2Nyug=;
	b=bu2qyA+6Eca0q0bVDcshoWFtlJO8VybNAMJyz2RhDdnpnKXNs9WJagFsmA/bnyjffV
	/2v4uKUl0tTY02Mgb/Eb+k4+6XO8sFRSEI0G0s84IFkAf85M9twd+zvrPCNNf1L2AC08
	ELs0GklytAJ3jg4Ye7mk713prRQHruuGXo+G5Deq9DXDB3DQsw47hCJSEDDnKOTiK5dI
	wMQefbHUNkPNcZeP66184bbZcxPvoNI6kWptzJ2TNgamFgLUn6SV3vGNhHlArVRRbPbv
	tgo27nd8G8SH9ZJJQRsIGF2X1TaCVa1I9YMt2vvD3X5XMk+uKezpOW744VyjELkjOJGh
	FZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wOQRXEza4PEwmmeCQlXulkDfZ84Nu0StpjY/jX2Nyug=;
	b=fC2FAUV0wzQTMGtVfn3THzNlkvcJaBsr35B8aLRnDyEs0CQ2rWvYVGxX70+dWEzQKl
	gA55/hoZ7xBjsytfQrlqF69SNST/OiRonH4J76hGF1xm8vIjvE6nhpSlOH4eQJdGgRVW
	oHBYebWY0ZMABTerR39StQb+QjDajUWkee32kFI2LsJc9UEQOspY+EIuiO1IJ43vtP5h
	UyMkVf7CGW1L+PUvB6R4uHsNidWxOxp9k1/l2YK9mq8Y7L0/IahEk3PEbOzEWPTjryaW
	CbLJaBx/PoTUYUoevFFrhV6Q/Qxi37xMY9/dPUACs4x1ECBES2vNd/BCCfUtJSgDl24Z
	UgqQ==
X-Gm-Message-State: ANhLgQ2Egr06EsQg++9xUDR7fABcqes8C7ue+eZd8pLvLM5aVTltzbyO
	JkQ9K2KD1Yr6rR5ImTI5TbCDB/iF1BA=
X-Google-Smtp-Source: ADFU+vuJqlDI4GZiexWzXV+fkAu5DTj87YpeGZeF2jLFSQGxROLPSc9OMzhekV7mDyovBrMI89wE4g==
X-Received: by 2002:a62:2e06:: with SMTP id u6mr5852649pfu.262.1583269804148; 
	Tue, 03 Mar 2020 13:10:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d533])
	by smtp.gmail.com with ESMTPSA id 7sm121581pjm.35.2020.03.03.13.10.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 13:10:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Mar 2020 13:10:14 -0800
Message-Id: <20200303211014.2213437-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] dlm: Fix host-user-contaminated QA errors
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
X-List-Received-Date: Tue, 03 Mar 2020 21:10:03 -0000
Content-Transfer-Encoding: 8bit

- Drop unused 0001-dlm-fix-package-qa-error.patch
- Merge appends into main task
- remove explicitly mentioning systemd in deps, systemd bbclass will add it
- Add a patch to fix install using cp cmd to preserve file permissions

Fixes
dlm: /usr/lib/libdlmcontrol.so.3 is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dlm/0001-dlm-fix-package-qa-error.patch   | 32 ------------
 ...ce-cp-a-with-mode-preserving-options.patch | 51 +++++++++++++++++++
 .../recipes-extended/dlm/dlm_4.0.9.bb         | 24 +++------
 3 files changed, 59 insertions(+), 48 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-package-qa-error.patch
 create mode 100644 meta-networking/recipes-extended/dlm/dlm/0001-make-Replace-cp-a-with-mode-preserving-options.patch

diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-package-qa-error.patch b/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-package-qa-error.patch
deleted file mode 100644
index 3e384f7d97..0000000000
--- a/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-package-qa-error.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1fb68433bde97d571fc781b52c9521b17fbb8df0 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 24 Jul 2018 17:42:43 +0800
-Subject: [PATCH] dlm: fix package qa error
-
-pass LDFLAG to makefile to fix below error:
-do_package_qa: QA Issue: No GNU_HASH in the elf binary:
-/packages-split/dlm/usr/sbin/dlm_stonith' [ldflags]
-
-Upstream-Status: Inappropriate[oe-specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- fence/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fence/Makefile b/fence/Makefile
-index cca0b2c..2b3963c 100644
---- a/fence/Makefile
-+++ b/fence/Makefile
-@@ -33,7 +33,7 @@ BIN_CFLAGS += -fPIE -DPIE
- BIN_CFLAGS += `pkg-config libxml-2.0 --cflags`
- BIN_CFLAGS += -I../include
- 
--BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
-+BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,now -Wl,-z,relro -pie
- BIN_LDFLAGS += `pkg-config libxml-2.0 --libs`
- BIN_LDFLAGS += -ldl
- 
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-make-Replace-cp-a-with-mode-preserving-options.patch b/meta-networking/recipes-extended/dlm/dlm/0001-make-Replace-cp-a-with-mode-preserving-options.patch
new file mode 100644
index 0000000000..e6a37579ed
--- /dev/null
+++ b/meta-networking/recipes-extended/dlm/dlm/0001-make-Replace-cp-a-with-mode-preserving-options.patch
@@ -0,0 +1,51 @@
+From 2f72f9271b8dd61ca5092e025b0f8243c6fd68f2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Mar 2020 12:38:19 -0800
+Subject: [PATCH] make: Replace cp -a with mode preserving options
+
+Helps fix permissions in staging area
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dlm_controld/Makefile | 4 ++--
+ libdlm/Makefile       | 8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
+index 6081cf8..fe71be2 100644
+--- a/dlm_controld/Makefile
++++ b/dlm_controld/Makefile
+@@ -88,8 +88,8 @@ install: all
+ 	$(INSTALL) -d $(DESTDIR)/$(PKGDIR)
+ 	$(INSTALL) -m 755 $(BIN_TARGET) $(DESTDIR)/$(BINDIR)
+ 	$(INSTALL) -m 755 $(LIB_TARGET) $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_SO) $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_SMAJOR) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_SO) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_SMAJOR) $(DESTDIR)/$(LIBDIR)
+ 	$(INSTALL) -m 644 $(LIB_PC) $(DESTDIR)/$(PKGDIR)
+ 	$(INSTALL) -m 644 libdlmcontrol.h $(DESTDIR)/$(HDRDIR)
+ 	$(INSTALL) -m 644 dlm_controld.8 $(DESTDIR)/$(MANDIR)/man8/
+diff --git a/libdlm/Makefile b/libdlm/Makefile
+index ab32761..8820bf8 100644
+--- a/libdlm/Makefile
++++ b/libdlm/Makefile
+@@ -125,10 +125,10 @@ install: all
+ 	$(INSTALL) -d $(DESTDIR)/$(UDEVDIR)
+ 	$(INSTALL) -c -m 755 $(LIB_TARGET) $(DESTDIR)/$(LIBDIR)
+ 	$(INSTALL) -c -m 755 $(LLT_TARGET) $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_SO) $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_SMAJOR) $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LLT_SO) $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LLT_SMAJOR) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_SO) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_SMAJOR) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LLT_SO) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LLT_SMAJOR) $(DESTDIR)/$(LIBDIR)
+ 	$(INSTALL) -m 644 $(LIB_PC) $(DESTDIR)/$(PKGDIR)
+ 	$(INSTALL) -m 644 $(LLT_PC) $(DESTDIR)/$(PKGDIR)
+ 	$(INSTALL) -c -m 644 $(HDR_TARGET) $(DESTDIR)/$(HDRDIR)
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb b/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
index 4bf9944aad..577db7087f 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
@@ -8,6 +8,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 SRC_URI = "https://pagure.io/dlm/archive/dlm-${PV}/dlm-dlm-${PV}.tar.gz \
            file://0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch \
            file://0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch \
+           file://0001-make-Replace-cp-a-with-mode-preserving-options.patch \
            "
 
 SRC_URI[md5sum] = "4c57a941a15547859cd38fd55f66388e"
@@ -21,7 +22,7 @@ LIC_FILES_CHKSUM = "file://README.license;md5=8f0bbcdd678df1bce9863492b6c8832d"
 
 S = "${WORKDIR}/dlm-dlm-${PV}"
 
-DEPENDS = "corosync systemd"
+DEPENDS += "corosync"
 
 inherit pkgconfig systemd features_check
 
@@ -40,29 +41,20 @@ do_compile_prepend_toolchain-clang() {
     sed -i -e "s/-fstack-clash-protection//g" ${S}/*/Makefile
 }
 
-do_compile_prepend() {
+do_compile() {
     sed -i "s/libsystemd-daemon/libsystemd/g" ${S}/dlm_controld/Makefile
     sed -i -e "s/ ${DONTBUILD}//g" ${S}/Makefile
-}
-
-do_compile () {
     oe_runmake 'CC=${CC}'
 }
 
-do_install_append (){
-    install -d ${D}${sysconfdir}/sysconfig/
-    install -d ${D}${sysconfdir}/init.d/
-    install -m 0644 ${S}/init/dlm.sysconfig ${D}${sysconfdir}/sysconfig/dlm
-    install -m 0644 ${S}/init/dlm.init ${D}${sysconfdir}/init.d/dlm
+do_install() {
+    oe_runmake install DESTDIR=${D} LIBDIR=${libdir}
+    install -Dm 0644 ${S}/init/dlm.sysconfig ${D}${sysconfdir}/sysconfig/dlm
+    install -Dm 0644 ${S}/init/dlm.init ${D}${sysconfdir}/init.d/dlm
 
     # install systemd unit files
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${S}/init/dlm.service ${D}${systemd_unitdir}/system
+        install -Dm 0644 ${S}/init/dlm.service ${D}${systemd_unitdir}/system/dlm.service
     fi
 }
 
-do_install() {
-    oe_runmake install DESTDIR=${D} LIBDIR=${libdir}
-}
-
-- 
2.25.1


