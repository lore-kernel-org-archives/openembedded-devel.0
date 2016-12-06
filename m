Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0D460079
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 02:36:30 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id x23so18242921pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 18:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RQdwCewzrwYiLOL1gfQ+bUNevsIlbg0490+BNQFiv/U=;
	b=n2/puXjBUqJyZbmgvV4+aUtATvWRoZ/2kpTKaeM1dpnSBS+hkRiCJOwegI3y7UQX5M
	8lkOTC9XzEB93Ie8eQNs2x8QFBvlxIJMZ1YuFL1Mh5keXbXBXCilg33g9bfvkA5v50am
	xD91TUix9eZaADjGB6d7Uvsf2xtUOq7JnVR+BH4hKanx5DkzgRwd0D1kYNZ8Tsqf08Du
	M5WqVV8dmSJN6FFv8VWAc4ye6s1ZPTsW+VGpKFWaB5JWtETnGm5Vmfi1GxGEkCPkiSe7
	3aRvkkT+jR0EvaWUFLQ5eBD6P9Rb6Sc8t0NMwNVOqTk7fjFib3UM7g3lu6HnFm9Da5+Y
	D7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RQdwCewzrwYiLOL1gfQ+bUNevsIlbg0490+BNQFiv/U=;
	b=UikkhVOitezvVxFef+wdhzdrXwQ73DAptEitwiGVg8f2TkJ8OivjHuU+9lvKG+kBOb
	mc7u9GhJpuFTRUX1xQQXR0AYsUvt9xZKKQUQcoFw98IHFRFZ+GaOOehrJmPBHs2SJ8PK
	OAwqLoy/53cMoVvruZctf1SuD6W7yV5jP7P/QaROb7U/FpEulwTKbtLswYKurNJdnGst
	m9vq5UWobF1tKG5nohMUgFb6Q5pbSdBwhws2ycVpemskJThTJETIX4h+HF6qqm8aCCH1
	FjW3gS41d77EqJNZa0OUHUr+HQSgIxjiZYdXHmhY/MAz+7horK1nMPd0uaFoe0JD1Pns
	r3ww==
X-Gm-Message-State: AKaTC00QjjR2fibuR1VAqiG1gJdGL1I7btFilP1+RFjJQHBa1LdY1br1jNRBSmlvwrXxiA==
X-Received: by 10.99.116.25 with SMTP id p25mr107914915pgc.161.1480991792066; 
	Mon, 05 Dec 2016 18:36:32 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	64sm30357837pfu.17.2016.12.05.18.36.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 18:36:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Dec 2016 18:36:22 -0800
Message-Id: <20161206023625.12901-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161206023625.12901-1-raj.khem@gmail.com>
References: <20161206023625.12901-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/7] ruli: Add new package
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
X-List-Received-Date: Tue, 06 Dec 2016 02:36:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/ruli/files/Makefile.patch      | 122 +++++++++++++++++++++
 meta-networking/recipes-support/ruli/ruli_0.36.bb  |  22 ++++
 2 files changed, 144 insertions(+)
 create mode 100644 meta-networking/recipes-support/ruli/files/Makefile.patch
 create mode 100644 meta-networking/recipes-support/ruli/ruli_0.36.bb

diff --git a/meta-networking/recipes-support/ruli/files/Makefile.patch b/meta-networking/recipes-support/ruli/files/Makefile.patch
new file mode 100644
index 0000000..60789a3
--- /dev/null
+++ b/meta-networking/recipes-support/ruli/files/Makefile.patch
@@ -0,0 +1,122 @@
+diff -Naur patch.org/ruli-0.36/Makefile patch.new/ruli-0.36/Makefile 
+--- ruli-0.36/Makefile	2015-09-10 15:14:13.952262350 -0400
++++ ruli-0.36/Makefile	2015-09-10 15:14:38.628261620 -0400
+@@ -7,17 +7,17 @@
+ .PHONY: default
+ default:
+ 	$(MAKE) -C src   
+-	$(MAKE) -C sample 
++#	$(MAKE) -C sample 
+ 
+ .PHONY: clean
+ clean:
+ 	$(MAKE) -C src    clean
+-	$(MAKE) -C sample clean
++#	$(MAKE) -C sample clean
+ 
+ .PHONY: install
+ install:
+ 	$(MAKE) -C src    install
+-	$(MAKE) -C sample install
++#	$(MAKE) -C sample install
+ 
+ .PHONY: dpkg
+ dpkg:
+
+=====================================================================
+
+diff -Naur patch.org/git/src/Makefile patch.new/git/src/Makefile 
+--- ruli-0.36/src/Makefile	2005-06-13 12:34:53.000000000 -0400
++++ ruli-0.36/src/Makefile	2015-09-11 09:46:06.290287347 -0400
+@@ -18,9 +18,9 @@
+ #
+ # Debian packaging likes this: OOP_BASE_DIR = /usr
+ #
+-OOP_BASE_DIR    = /usr/local/oop
+-OOP_INCLUDE_DIR = $(OOP_BASE_DIR)/include
+-OOP_LIB_DIR     = $(OOP_BASE_DIR)/lib
++#OOP_BASE_DIR    = /usr/local/oop
++OOP_INCLUDE_DIR = ${PKG_CONFIG_SYSROOT_DIR}/$(includedir)/
++#OOP_LIB_DIR     = $(OOP_BASE_DIR)/lib
+ 
+ #
+ # INSTALL_BASE_DIR indicates where RULI
+@@ -30,11 +30,11 @@
+ #
+ # Debian packaging likes this: INSTALL_BASE_DIR = $(DESTDIR)/usr
+ #
+-INSTALL_BASE_DIR     = ../install/ruli
+-INSTALL_INCLUDE_DIR  = $(INSTALL_BASE_DIR)/include
+-INSTALL_LIB_DIR      = $(INSTALL_BASE_DIR)/lib
+-INSTALL_MAN_DIR      = $(INSTALL_BASE_DIR)/share/man
+-INSTALL_MAN3_DIR     = $(INSTALL_MAN_DIR)/man3
++#INSTALL_BASE_DIR     = ../install/ruli
++#INSTALL_INCLUDE_DIR  = $(INSTALL_BASE_DIR)/include
++#INSTALL_LIB_DIR      = $(INSTALL_BASE_DIR)/lib
++#INSTALL_MAN_DIR      = $(INSTALL_BASE_DIR)/share/man
++#INSTALL_MAN3_DIR     = $(INSTALL_MAN_DIR)/man3
+ 
+ # SunOS, Linux
+ PLATFORM=$(shell uname)
+@@ -45,7 +45,7 @@
+ 
+ WARN = -pedantic -ansi -Wshadow -Wpointer-arith -Wcast-qual \
+ 	-Wcast-align -Wwrite-strings -Wredundant-decls
+-CC = gcc
++#CC = gcc
+ 
+ # gcc-specific options (not valid for g++)
+ ifeq ($(CC),gcc)
+@@ -58,7 +58,7 @@
+ FLAGS = $(DEBUG) -O2 -pipe -Wall -g -shared -D_REENTRANT \
+         $(DEFINE_SOLARIS) -I. -I$(OOP_INCLUDE_DIR)
+ SOFT_CFLAGS = $(WARN) $(FLAGS)
+-CFLAGS = $(WARN) -Werror $(FLAGS)
++CFLAGS = $(WARN) $(FLAGS)
+ LIBOBJ = ruli_isaac.o ruli_mem.o ruli_rand.o ruli_util.o ruli_list.o \
+ 	ruli_addr.o ruli_sock.o ruli_txt.o ruli_msg.o ruli_fsm.o \
+ 	ruli_res.o ruli_parse.o ruli_host.o ruli_srv.o ruli_conf.o \
+@@ -66,7 +66,7 @@
+ 	ruli_getaddrinfo.o
+ SHAREDOBJ = $(LIBOBJ:%.o=%.os)
+ SONAME = libruli.so.4
+-LDFLAGS = -L$(OOP_LIB_DIR)
++#LDFLAGS = -L$(OOP_LIB_DIR)
+ 
+ COMPILE = $(CC) $(ARCH) $(CPPFLAGS) $(CFLAGS) -c
+ SHARED_COMPILE = $(CC) $(ARCH) $(CPPFLAGS) $(SHARED) $(CFLAGS) -o $@ -c
+@@ -89,19 +89,19 @@
+ strip: ruli
+ 	strip $(SONAME) libruli.a
+ 
+-.PHONY: install
+-install: ruli
+-	mkdir -p $(INSTALL_LIB_DIR) $(INSTALL_INCLUDE_DIR) $(INSTALL_MAN3_DIR)
+-	cp $(SONAME) libruli.a $(INSTALL_LIB_DIR)
+-	cp *.h $(INSTALL_INCLUDE_DIR)
+-	cp ../doc/man/*.3 $(INSTALL_MAN3_DIR)
+-	cd $(INSTALL_LIB_DIR) && ln -s $(SONAME) libruli.so
+-	@echo
+-	@echo "REMINDER:"
+-	@echo "Add $(INSTALL_LIB_DIR) to your dynamic loader path:"
+-	@echo "# echo $(INSTALL_LIB_DIR) >> /etc/ld.so.conf"
+-	@echo "# ldconfig"
+-	@echo
++#.PHONY: install
++#install: ruli
++#	mkdir -p $(INSTALL_LIB_DIR) $(INSTALL_INCLUDE_DIR) $(INSTALL_MAN3_DIR)
++#	cp $(SONAME) libruli.a $(INSTALL_LIB_DIR)
++#	cp *.h $(INSTALL_INCLUDE_DIR)
++#	cp ../doc/man/*.3 $(INSTALL_MAN3_DIR)
++#	cd $(INSTALL_LIB_DIR) && ln -s $(SONAME) libruli.so
++#	@echo
++#	@echo "REMINDER:"
++#	@echo "Add $(INSTALL_LIB_DIR) to your dynamic loader path:"
++#	@echo "# echo $(INSTALL_LIB_DIR) >> /etc/ld.so.conf"
++#	@echo "# ldconfig"
++#	@echo
+ 
+ .PHONY: ruli
+ ruli: $(SONAME) libruli.a
+
+
diff --git a/meta-networking/recipes-support/ruli/ruli_0.36.bb b/meta-networking/recipes-support/ruli/ruli_0.36.bb
new file mode 100644
index 0000000..a455e1f
--- /dev/null
+++ b/meta-networking/recipes-support/ruli/ruli_0.36.bb
@@ -0,0 +1,22 @@
+SUMMARY = "RULI stands for Resolver User Layer Interface It's a library	built on top of an asynchronous DNS stub resolver"
+
+HOMEPAGE = "http://www.nongnu.org/ruli/"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+DEPENDS = "liboop"
+
+SRC_URI += "http://download.savannah.gnu.org/releases/ruli/ruli_${PV}.orig.tar.gz \
+            file://Makefile.patch"
+
+SRC_URI[md5sum] = "e73fbfdeadddb68a703a70cea5271468"
+SRC_URI[sha256sum] = "11d32def5b514748fbd9ea8c88049ae99e1bb358efc74eb91a4d268a3999dbfa"
+
+do_install1() {
+    install -d ${D}${includedir}/ruli
+    install -d ${D}${libdir}
+    install -m 0644 ${S}/src/ruli*.h ${D}${includedir}/ruli
+    install -m 0644 ${S}/src/libruli.so ${D}${libdir}
+    install -m 0644 ${S}/src/libruli.so.4 ${D}${libdir}
+}
-- 
2.10.2


