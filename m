Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 578C57F957
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:41 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x6so21820659pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+lbxNaPs8avG5XHWjhHhH9w0BrQAIbdmCA9N9EljSWk=;
	b=AsqJN3AqZUmC5d4vFibhYCTeCtdsmE+Ld9t2a7CmTDbwGqzEZHA+CNxgUBeUQyTXcr
	C5AuY4nW/RYWHUMsKcdrWzavsd7PZs/6my9xKy2vU/cvQcUdTMTeocg3ervcIQUVkDVp
	fssu+UPzoj+l+iF6kzwwXevBc2p2MrubtPv9K56P5RiORbiv1IOTF8+DewwjF3XvUdWm
	yMkbHtdb7e7doiCqWeC2P//8fdJRLuJpFongUpsSDFYAqUOvwSFi6EUicUYLqKX2dIb+
	q1ncep6ZTBzypF4dUwTG7etCQRF6TmHnTG6gvGC+XDNeqlvMuklw/OYnoVQ1OFWTHR/d
	YV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+lbxNaPs8avG5XHWjhHhH9w0BrQAIbdmCA9N9EljSWk=;
	b=hWpXYJHNSrY6ojeKWnTJtD5kRdAyCdvNXZ4EA2cmvJko9l+cFSiQJJiY/55lvaCyTi
	a+FHFBAyXPT1Zz6IdNb2umQV8ft6L3H1yXpgVjteRqUWaNPc9F5Wd6zqaT+NWQ+MnS65
	P5HBDbdFN6P4EqSKUVxOnE/VR5UL9Bxg5GQeOJ2Ol5Vdh0Kndu2NVH3VAzMJbcQoyk//
	UPlf5e+kzvVZRAaJWeTMAwnMoy6Z0icUpEOIlLw8wuDBRg1yd4JOxqHTBlzwfpn5ZbPH
	jqyy1sh0YDbWGzo3aB1HY15SfN6FYk3qYR3ogA8pkK8l+Bv0LEspWcQRacDRMC+qRL8R
	3J+A==
X-Gm-Message-State: APjAAAXlW9eefzV5zBCAzOpVWCicu1SCyoZmNAjldN7/AbPMueSi0FXf
	yogVPG/s80RqjhJF82RFwdNxu0kkS3g=
X-Google-Smtp-Source: APXvYqzq91f/E4Y+1XBXPCXObuZm7JTuTMbt26IJttwf/xkpBHSQg83kj6KmVbvA01ndMaqVMHgNfQ==
X-Received: by 2002:a63:1d1d:: with SMTP id d29mr89689895pgd.387.1578019781827;
	Thu, 02 Jan 2020 18:49:41 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:09 -0800
Message-Id: <dcaf604c3ae7f09d463b731ba37a0ef896d0cae0.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 12/17] ruli: Fix install step and build samples too
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:41 -0000

From: Khem Raj <raj.khem@gmail.com>

do_install never executed as a result it was empty install
Create ruli-bin package for utilities, so libraries can be packages
granularily

Drop the makefile patch which is no longer needed, set the make
variables to get the needed bits set

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f4e6224b340fba198639bdd4585a81efdf15303e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-Fix-build-with-format-string-checks.patch |  29 ++++-
 ...ake-space-for-flags-from-environment.patch |  95 ++++++++++++++
 ...v-Mark-prev_addr_list_size-as-unused.patch |  35 +++++
 .../recipes-support/ruli/files/Makefile.patch | 122 ------------------
 .../recipes-support/ruli/ruli_0.36.bb         |  23 +++-
 5 files changed, 169 insertions(+), 135 deletions(-)
 create mode 100644 meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch
 create mode 100644 meta-networking/recipes-support/ruli/files/0001-ruli_srv-Mark-prev_addr_list_size-as-unused.patch
 delete mode 100644 meta-networking/recipes-support/ruli/files/Makefile.patch

diff --git a/meta-networking/recipes-support/ruli/files/0001-Fix-build-with-format-string-checks.patch b/meta-networking/recipes-support/ruli/files/0001-Fix-build-with-format-string-checks.patch
index f8eb3ae67a4..8ca26b51bbb 100644
--- a/meta-networking/recipes-support/ruli/files/0001-Fix-build-with-format-string-checks.patch
+++ b/meta-networking/recipes-support/ruli/files/0001-Fix-build-with-format-string-checks.patch
@@ -15,11 +15,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/ruli_addr.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/ruli_addr.c b/src/ruli_addr.c
-index 00d5d0d..f1eabae 100644
 --- a/src/ruli_addr.c
 +++ b/src/ruli_addr.c
-@@ -415,7 +415,7 @@ int ruli_in_print(FILE *out, const _ruli_addr *addr, int family)
+@@ -415,7 +415,7 @@ int ruli_in_print(FILE *out, const _ruli
  {
    switch (family) {
    case PF_INET:
@@ -28,6 +26,25 @@ index 00d5d0d..f1eabae 100644
  
    case PF_INET6:
      return ruli_inet6_print(out, &addr->ipv6);
--- 
-2.13.1
-
+--- a/sample/getaddrinfo.c
++++ b/sample/getaddrinfo.c
+@@ -174,7 +174,7 @@ static void solve(const char *fullname)
+ 
+       for (ai = ai_res; ai; ai = ai->ai_next) {
+ 
+-	printf(fullname);
++	printf("%s", fullname);
+ 
+ 	switch (ai->ai_family) {
+ 	case PF_INET:
+--- a/sample/ruli-getaddrinfo.c
++++ b/sample/ruli-getaddrinfo.c
+@@ -176,7 +176,7 @@ static void solve(const char *fullname)
+ 
+       for (ai = ai_res; ai; ai = ai->ai_next) {
+ 
+-	printf(fullname);
++	printf("%s", fullname);
+ 
+ 	switch (ai->ai_family) {
+ 	case PF_INET:
diff --git a/meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch b/meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch
new file mode 100644
index 00000000000..c3ca07a3903
--- /dev/null
+++ b/meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch
@@ -0,0 +1,95 @@
+From bb19a2c7e5b3142d70d3e13c2d8a92a63f2b840a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Nov 2019 22:12:52 -0800
+Subject: [PATCH] Make space for flags from environment
+
+Add force option to ln cmd, so do_install can be rerun in same directory
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sample/Makefile | 20 ++++++++++----------
+ src/Makefile    |  8 ++++----
+ 2 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/sample/Makefile b/sample/Makefile
+index 15cafd9..d83641f 100644
+--- a/sample/Makefile
++++ b/sample/Makefile
+@@ -35,9 +35,9 @@ ifeq ($(PLATFORM),SunOS)
+ SOLARIS_LIBS = -lresolv -lnsl -lsocket
+ endif
+ 
+-CC      = gcc
+-CFLAGS  = -O2 -pipe -Wall -g -I../src -I$(OOP_INCLUDE_DIR)
+-LDFLAGS = -L../src -L$(OOP_LIB_DIR) $(SOLARIS_LDFLAGS)
++CC      ?= gcc
++CFLAGS  += -O2 -pipe -Wall -g -I../src -I$(OOP_INCLUDE_DIR)
++LDFLAGS += -L../src -L$(OOP_LIB_DIR) $(SOLARIS_LDFLAGS)
+ UNRULI_LINK = $(CC) $(ARCH) $(LDFLAGS) -o $@ $^ $(SOLARIS_LIBS)
+ LINK = $(UNRULI_LINK) -lruli -loop
+ 
+@@ -65,13 +65,13 @@ install: $(TARGETS)
+ 	mkdir -p $(INSTALL_BIN_DIR) $(INSTALL_MAN1_DIR)
+ 	cp $(TARGETS) $(INSTALL_BIN_DIR)
+ 	cp ../doc/man/*.1 $(INSTALL_MAN1_DIR)
+-	cd $(INSTALL_MAN_DIR)/man1 && ln -s srvsearch.1 smtpsearch.1
+-	cd $(INSTALL_MAN_DIR)/man1 && ln -s srvsearch.1 httpsearch.1
+-	cd $(INSTALL_MAN_DIR)/man1 && ln -s srvsearch.1 sync_srvsearch.1
+-	cd $(INSTALL_MAN_DIR)/man1 && ln -s srvsearch.1 sync_smtpsearch.1
+-	cd $(INSTALL_MAN_DIR)/man1 && ln -s srvsearch.1 sync_httpsearch.1
+-	cd $(INSTALL_MAN_DIR)/man1 && ln -s srvsearch.1 ruli-getaddrinfo.1
+-	cd $(INSTALL_MAN_DIR)/man1 && ln -s srvsearch.1 getaddrinfo.1
++	cd $(INSTALL_MAN_DIR)/man1 && ln -sf srvsearch.1 smtpsearch.1
++	cd $(INSTALL_MAN_DIR)/man1 && ln -sf srvsearch.1 httpsearch.1
++	cd $(INSTALL_MAN_DIR)/man1 && ln -sf srvsearch.1 sync_srvsearch.1
++	cd $(INSTALL_MAN_DIR)/man1 && ln -sf srvsearch.1 sync_smtpsearch.1
++	cd $(INSTALL_MAN_DIR)/man1 && ln -sf srvsearch.1 sync_httpsearch.1
++	cd $(INSTALL_MAN_DIR)/man1 && ln -sf srvsearch.1 ruli-getaddrinfo.1
++	cd $(INSTALL_MAN_DIR)/man1 && ln -sf srvsearch.1 getaddrinfo.1
+ 
+ %.o: %.c
+ 	$(CC) $(ARCH) $(CPPFLAGS) $(CFLAGS) -c $<
+diff --git a/src/Makefile b/src/Makefile
+index 9b56b5e..39a5ea1 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -45,7 +45,7 @@ endif
+ 
+ WARN = -pedantic -ansi -Wshadow -Wpointer-arith -Wcast-qual \
+ 	-Wcast-align -Wwrite-strings -Wredundant-decls
+-CC = gcc
++CC ?= gcc
+ 
+ # gcc-specific options (not valid for g++)
+ ifeq ($(CC),gcc)
+@@ -58,7 +58,7 @@ SHARED = -fPIC
+ FLAGS = $(DEBUG) -O2 -pipe -Wall -g -shared -D_REENTRANT \
+         $(DEFINE_SOLARIS) -I. -I$(OOP_INCLUDE_DIR)
+ SOFT_CFLAGS = $(WARN) $(FLAGS)
+-CFLAGS = $(WARN) -Werror $(FLAGS)
++CFLAGS += $(WARN) -Werror $(FLAGS)
+ LIBOBJ = ruli_isaac.o ruli_mem.o ruli_rand.o ruli_util.o ruli_list.o \
+ 	ruli_addr.o ruli_sock.o ruli_txt.o ruli_msg.o ruli_fsm.o \
+ 	ruli_res.o ruli_parse.o ruli_host.o ruli_srv.o ruli_conf.o \
+@@ -66,7 +66,7 @@ LIBOBJ = ruli_isaac.o ruli_mem.o ruli_rand.o ruli_util.o ruli_list.o \
+ 	ruli_getaddrinfo.o
+ SHAREDOBJ = $(LIBOBJ:%.o=%.os)
+ SONAME = libruli.so.4
+-LDFLAGS = -L$(OOP_LIB_DIR)
++LDFLAGS += -L$(OOP_LIB_DIR)
+ 
+ COMPILE = $(CC) $(ARCH) $(CPPFLAGS) $(CFLAGS) -c
+ SHARED_COMPILE = $(CC) $(ARCH) $(CPPFLAGS) $(SHARED) $(CFLAGS) -o $@ -c
+@@ -95,7 +95,7 @@ install: ruli
+ 	cp $(SONAME) libruli.a $(INSTALL_LIB_DIR)
+ 	cp *.h $(INSTALL_INCLUDE_DIR)
+ 	cp ../doc/man/*.3 $(INSTALL_MAN3_DIR)
+-	cd $(INSTALL_LIB_DIR) && ln -s $(SONAME) libruli.so
++	cd $(INSTALL_LIB_DIR) && ln -sf $(SONAME) libruli.so
+ 	@echo
+ 	@echo "REMINDER:"
+ 	@echo "Add $(INSTALL_LIB_DIR) to your dynamic loader path:"
+-- 
+2.24.0
+
diff --git a/meta-networking/recipes-support/ruli/files/0001-ruli_srv-Mark-prev_addr_list_size-as-unused.patch b/meta-networking/recipes-support/ruli/files/0001-ruli_srv-Mark-prev_addr_list_size-as-unused.patch
new file mode 100644
index 00000000000..213006a677b
--- /dev/null
+++ b/meta-networking/recipes-support/ruli/files/0001-ruli_srv-Mark-prev_addr_list_size-as-unused.patch
@@ -0,0 +1,35 @@
+From 895ae26e36c4498677ad0b2695a6e5af05548a29 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Nov 2019 22:02:43 -0800
+Subject: [PATCH] ruli_srv: Mark prev_addr_list_size as unused
+
+This ensures that compiler does not trip on building it
+
+ruli_srv.c:157:20: error: variable 'prev_addr_list_size' set but not used [-Werror=unused-but-set-variable]
+|   int              prev_addr_list_size;
+|                    ^~~~~~~~~~~~~~~~~~~
+cc1: all warnings being treated as errors
+
+Upstream-Status: Inappropriate [Workaround]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ruli_srv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ruli_srv.c b/src/ruli_srv.c
+index 45c70c7..ff82349 100644
+--- a/src/ruli_srv.c
++++ b/src/ruli_srv.c
+@@ -154,7 +154,7 @@ static void *on_walk_answer(ruli_host_t *host_qry, void *qry_arg)
+   walk_t           *walk_qry = (walk_t *) qry_arg;
+   ruli_srv_t       *srv_qry = walk_qry->srv_query;
+   ruli_srv_entry_t *srv_entry;
+-  int              prev_addr_list_size;
++  __attribute__((unused)) int              prev_addr_list_size;
+ 
+   assert(ruli_host_answer_code(host_qry) != RULI_SRV_CODE_VOID);
+ 
+-- 
+2.24.0
+
diff --git a/meta-networking/recipes-support/ruli/files/Makefile.patch b/meta-networking/recipes-support/ruli/files/Makefile.patch
deleted file mode 100644
index 60789a3d56f..00000000000
--- a/meta-networking/recipes-support/ruli/files/Makefile.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-diff -Naur patch.org/ruli-0.36/Makefile patch.new/ruli-0.36/Makefile 
---- ruli-0.36/Makefile	2015-09-10 15:14:13.952262350 -0400
-+++ ruli-0.36/Makefile	2015-09-10 15:14:38.628261620 -0400
-@@ -7,17 +7,17 @@
- .PHONY: default
- default:
- 	$(MAKE) -C src   
--	$(MAKE) -C sample 
-+#	$(MAKE) -C sample 
- 
- .PHONY: clean
- clean:
- 	$(MAKE) -C src    clean
--	$(MAKE) -C sample clean
-+#	$(MAKE) -C sample clean
- 
- .PHONY: install
- install:
- 	$(MAKE) -C src    install
--	$(MAKE) -C sample install
-+#	$(MAKE) -C sample install
- 
- .PHONY: dpkg
- dpkg:
-
-=====================================================================
-
-diff -Naur patch.org/git/src/Makefile patch.new/git/src/Makefile 
---- ruli-0.36/src/Makefile	2005-06-13 12:34:53.000000000 -0400
-+++ ruli-0.36/src/Makefile	2015-09-11 09:46:06.290287347 -0400
-@@ -18,9 +18,9 @@
- #
- # Debian packaging likes this: OOP_BASE_DIR = /usr
- #
--OOP_BASE_DIR    = /usr/local/oop
--OOP_INCLUDE_DIR = $(OOP_BASE_DIR)/include
--OOP_LIB_DIR     = $(OOP_BASE_DIR)/lib
-+#OOP_BASE_DIR    = /usr/local/oop
-+OOP_INCLUDE_DIR = ${PKG_CONFIG_SYSROOT_DIR}/$(includedir)/
-+#OOP_LIB_DIR     = $(OOP_BASE_DIR)/lib
- 
- #
- # INSTALL_BASE_DIR indicates where RULI
-@@ -30,11 +30,11 @@
- #
- # Debian packaging likes this: INSTALL_BASE_DIR = $(DESTDIR)/usr
- #
--INSTALL_BASE_DIR     = ../install/ruli
--INSTALL_INCLUDE_DIR  = $(INSTALL_BASE_DIR)/include
--INSTALL_LIB_DIR      = $(INSTALL_BASE_DIR)/lib
--INSTALL_MAN_DIR      = $(INSTALL_BASE_DIR)/share/man
--INSTALL_MAN3_DIR     = $(INSTALL_MAN_DIR)/man3
-+#INSTALL_BASE_DIR     = ../install/ruli
-+#INSTALL_INCLUDE_DIR  = $(INSTALL_BASE_DIR)/include
-+#INSTALL_LIB_DIR      = $(INSTALL_BASE_DIR)/lib
-+#INSTALL_MAN_DIR      = $(INSTALL_BASE_DIR)/share/man
-+#INSTALL_MAN3_DIR     = $(INSTALL_MAN_DIR)/man3
- 
- # SunOS, Linux
- PLATFORM=$(shell uname)
-@@ -45,7 +45,7 @@
- 
- WARN = -pedantic -ansi -Wshadow -Wpointer-arith -Wcast-qual \
- 	-Wcast-align -Wwrite-strings -Wredundant-decls
--CC = gcc
-+#CC = gcc
- 
- # gcc-specific options (not valid for g++)
- ifeq ($(CC),gcc)
-@@ -58,7 +58,7 @@
- FLAGS = $(DEBUG) -O2 -pipe -Wall -g -shared -D_REENTRANT \
-         $(DEFINE_SOLARIS) -I. -I$(OOP_INCLUDE_DIR)
- SOFT_CFLAGS = $(WARN) $(FLAGS)
--CFLAGS = $(WARN) -Werror $(FLAGS)
-+CFLAGS = $(WARN) $(FLAGS)
- LIBOBJ = ruli_isaac.o ruli_mem.o ruli_rand.o ruli_util.o ruli_list.o \
- 	ruli_addr.o ruli_sock.o ruli_txt.o ruli_msg.o ruli_fsm.o \
- 	ruli_res.o ruli_parse.o ruli_host.o ruli_srv.o ruli_conf.o \
-@@ -66,7 +66,7 @@
- 	ruli_getaddrinfo.o
- SHAREDOBJ = $(LIBOBJ:%.o=%.os)
- SONAME = libruli.so.4
--LDFLAGS = -L$(OOP_LIB_DIR)
-+#LDFLAGS = -L$(OOP_LIB_DIR)
- 
- COMPILE = $(CC) $(ARCH) $(CPPFLAGS) $(CFLAGS) -c
- SHARED_COMPILE = $(CC) $(ARCH) $(CPPFLAGS) $(SHARED) $(CFLAGS) -o $@ -c
-@@ -89,19 +89,19 @@
- strip: ruli
- 	strip $(SONAME) libruli.a
- 
--.PHONY: install
--install: ruli
--	mkdir -p $(INSTALL_LIB_DIR) $(INSTALL_INCLUDE_DIR) $(INSTALL_MAN3_DIR)
--	cp $(SONAME) libruli.a $(INSTALL_LIB_DIR)
--	cp *.h $(INSTALL_INCLUDE_DIR)
--	cp ../doc/man/*.3 $(INSTALL_MAN3_DIR)
--	cd $(INSTALL_LIB_DIR) && ln -s $(SONAME) libruli.so
--	@echo
--	@echo "REMINDER:"
--	@echo "Add $(INSTALL_LIB_DIR) to your dynamic loader path:"
--	@echo "# echo $(INSTALL_LIB_DIR) >> /etc/ld.so.conf"
--	@echo "# ldconfig"
--	@echo
-+#.PHONY: install
-+#install: ruli
-+#	mkdir -p $(INSTALL_LIB_DIR) $(INSTALL_INCLUDE_DIR) $(INSTALL_MAN3_DIR)
-+#	cp $(SONAME) libruli.a $(INSTALL_LIB_DIR)
-+#	cp *.h $(INSTALL_INCLUDE_DIR)
-+#	cp ../doc/man/*.3 $(INSTALL_MAN3_DIR)
-+#	cd $(INSTALL_LIB_DIR) && ln -s $(SONAME) libruli.so
-+#	@echo
-+#	@echo "REMINDER:"
-+#	@echo "Add $(INSTALL_LIB_DIR) to your dynamic loader path:"
-+#	@echo "# echo $(INSTALL_LIB_DIR) >> /etc/ld.so.conf"
-+#	@echo "# ldconfig"
-+#	@echo
- 
- .PHONY: ruli
- ruli: $(SONAME) libruli.a
-
-
diff --git a/meta-networking/recipes-support/ruli/ruli_0.36.bb b/meta-networking/recipes-support/ruli/ruli_0.36.bb
index 885796d2a59..b82a3d08e84 100644
--- a/meta-networking/recipes-support/ruli/ruli_0.36.bb
+++ b/meta-networking/recipes-support/ruli/ruli_0.36.bb
@@ -8,18 +8,27 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 DEPENDS = "liboop"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/ruli/ruli_${PV}.orig.tar.gz \
-           file://Makefile.patch \
            file://0001-Fix-build-with-format-string-checks.patch \
            file://0001-src-ruli_addr.c-Add-missing-format-string.patch \
+           file://0001-ruli_srv-Mark-prev_addr_list_size-as-unused.patch \
+           file://0001-Make-space-for-flags-from-environment.patch \
            "
 
 SRC_URI[md5sum] = "e73fbfdeadddb68a703a70cea5271468"
 SRC_URI[sha256sum] = "11d32def5b514748fbd9ea8c88049ae99e1bb358efc74eb91a4d268a3999dbfa"
 
-do_install1() {
-    install -d ${D}${includedir}/ruli
-    install -d ${D}${libdir}
-    install -m 0644 ${S}/src/ruli*.h ${D}${includedir}/ruli
-    install -m 0644 ${S}/src/libruli.so ${D}${libdir}
-    install -m 0644 ${S}/src/libruli.so.4 ${D}${libdir}
+B = "${S}"
+
+EXTRA_OEMAKE = 'CC="${CC}" OOP_BASE_DIR="${STAGING_EXECPREFIXDIR}" INSTALL_BASE_DIR="${D}${exec_prefix}"'
+
+do_configure() {
+    touch configure-stamp
+}
+
+do_install() {
+    oe_runmake install
 }
+
+PACKAGES =+ "${PN}-bin"
+
+FILES_${PN} =+ "${bindir}"
-- 
2.17.1


