Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RSdy8-0002FF-Hb
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 01:12:16 +0100
Received: (qmail invoked by alias); 22 Nov 2011 00:05:42 -0000
Received: from p5B0A17D0.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.208]
	by mail.gmx.net (mp055) with SMTP; 22 Nov 2011 01:05:42 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19aq0IWrd9aU4e40Q8MYP2aP4g6y+2ofe4Y3bvPiA
	w57DZu230D8Qb0
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Nov 2011 01:05:36 +0100
Message-Id: <1321920336-4905-6-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1321920336-4905-1-git-send-email-schnitzeltony@gmx.de>
References: <1321920336-4905-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe][V3 5/5] libnl1: remove
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
X-List-Received-Date: Tue, 22 Nov 2011 00:12:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

networkmanager 0.9.0 was the last to depend on linbl1. So since update
of networkmanager 0.9.0 -> 0.9.2 linnl1 is obsolete.

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../libnl/libnl1-1.1/build.only.static.lib.patch   |   79 --------------------
 .../libnl1-1.1/dont-link-libnl-from-sysroot.patch  |   26 -------
 .../libnl/libnl1-1.1/fix-includes.patch            |   13 ---
 .../libnl/libnl1-1.1/fix-ucred-declaration.patch   |   23 ------
 .../libnl/libnl1-1.1/local-includes.patch          |   12 ---
 .../libnl/libnl1-1.1/netlink-local-fix.patch       |   12 ---
 .../libnl/libnl1-1.1/respect-ldflags.patch         |   12 ---
 meta-oe/recipes-support/libnl/libnl1_1.1.bb        |   30 --------
 8 files changed, 0 insertions(+), 207 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/build.only.static.lib.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/dont-link-libnl-from-sysroot.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/fix-includes.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/fix-ucred-declaration.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/local-includes.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/netlink-local-fix.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/respect-ldflags.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1_1.1.bb

diff --git a/meta-oe/recipes-support/libnl/libnl1-1.1/build.only.static.lib.patch b/meta-oe/recipes-support/libnl/libnl1-1.1/build.only.static.lib.patch
deleted file mode 100644
index 770a392..0000000
--- a/meta-oe/recipes-support/libnl/libnl1-1.1/build.only.static.lib.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-diff -uNr libnl-1.1.orig//lib/Makefile libnl-1.1/lib/Makefile
---- libnl-1.1.orig//lib/Makefile	2011-03-23 15:50:32.310534329 +0100
-+++ libnl-1.1/lib/Makefile	2011-03-23 15:50:43.926534326 +0100
-@@ -33,18 +33,24 @@
- DEPS     := $(CIN:%.c=%.d)
- OBJ      := $(CIN:%.c=%.o)
- CFLAGS   += -fPIC
-+OUT_LIB  := $(PACKAGE_NAME)1.a
- OUT_SLIB := $(PACKAGE_NAME).so.$(PACKAGE_VERSION)
- LN_SLIB  := $(PACKAGE_NAME).so
- LN1_SLIB := $(LN_SLIB).1
- 
- export
- 
--.PHONY: all clean install librtn.a $(OUT_SLIB)
-+.PHONY: all clean install librtn.a $(OUT_SLIB) $(OUT_LIB)
- 
- 
- all:
--	@echo "  MAKE $(OUT_SLIB)"; \
--	$(MAKE) $(OUT_SLIB)
-+	@echo "  MAKE $(OUT_LIB)"; \
-+	$(MAKE) $(OUT_LIB)
-+
-+$(OUT_LIB): ../Makefile.opts $(OBJ)
-+	@echo "  LD $(OUT_LIB)"; \
-+	echo $(AR) rs $(OUT_LIB) $(OBJ)
-+	$(AR) rs $(OUT_LIB) $(OBJ)
- 
- $(OUT_SLIB): ../Makefile.opts $(OBJ)
- 	@echo "  LD $(OUT_SLIB)"; \
-@@ -56,8 +62,8 @@
- 
- clean:
- 	@echo "  CLEAN lib"; \
--	$(RM) -f $(OBJ) $(OUT_SLIB) $(LN_SLIB) $(LN1_SLIB); \
--	$(RM) -f $(DEPS) $(OUT_SLIB) $(LN_SLIB) $(LN1_SLIB)
-+	$(RM) -f $(OBJ) $(OUT_SLIB) $(OUT_LIB) $(LN_SLIB) $(LN1_SLIB); \
-+	$(RM) -f $(DEPS) $(OUT_SLIB) $(OUT_LIB) $(LN_SLIB) $(LN1_SLIB)
- 
- distclean:
- 	@echo "  DISTCLEAN lib"; \
-@@ -65,11 +71,7 @@
- 
- install:
--	mkdir -p $(DESTDIR)$(libdir)/
--	install -m 0644 $(OUT_SLIB) $(DESTDIR)$(libdir)
--	rm -f $(DESTDIR)$(libdir)/$(LN1_SLIB)
--	$(LN) -s $(OUT_SLIB) $(DESTDIR)$(libdir)/$(LN1_SLIB)
--	rm -f $(DESTDIR)$(libdir)/$(LN_SLIB)
--	$(LN) -s $(LN1_SLIB) $(DESTDIR)$(libdir)/$(LN_SLIB)
-+	mkdir -p $(DESTDIR)$(libdir)/libnl1
-+	install -m 0644 $(OUT_LIB) $(DESTDIR)$(libdir)/libnl1
- 
- $(DEPS): ../Makefile.opts
- 
-diff -uNr libnl-1.1.orig//Makefile libnl-1.1/Makefile
---- libnl-1.1.orig//Makefile	2008-01-14 16:48:45.000000000 +0100
-+++ libnl-1.1/Makefile	2011-03-23 16:53:12.438533242 +0100
-@@ -13,7 +13,7 @@
-     include Makefile.opts
- endif
- 
--SUBDIRS := lib include doc src tests
-+SUBDIRS := lib include doc 
- .PHONY: all clean distclean install gendoc $(SUBDIRS)
- 
- all: Makefile.opts
-diff -uNr libnl-1.1.orig//libnl-1.pc.in libnl-1.1/libnl-1.pc.in
---- libnl-1.1.orig//libnl-1.pc.in	2008-01-14 16:48:45.000000000 +0100
-+++ libnl-1.1/libnl-1.pc.in	2011-03-23 16:57:18.084533174 +0100
-@@ -6,5 +6,5 @@
- Name: libnl
- Description: Convenience library for netlink sockets
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -lnl
--Cflags:
-+Libs: -L${libdir}/libnl1 -lnl1 -lm
-+Cflags: -I${includedir}/libnl1
diff --git a/meta-oe/recipes-support/libnl/libnl1-1.1/dont-link-libnl-from-sysroot.patch b/meta-oe/recipes-support/libnl/libnl1-1.1/dont-link-libnl-from-sysroot.patch
deleted file mode 100644
index beb6361..0000000
--- a/meta-oe/recipes-support/libnl/libnl1-1.1/dont-link-libnl-from-sysroot.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Index: libnl-1.1/src/Makefile
-===================================================================
---- libnl-1.1.orig/src/Makefile	2008-01-14 07:48:45.000000000 -0800
-+++ libnl-1.1/src/Makefile	2010-09-22 14:58:46.820826001 -0700
-@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
-     include ../Makefile.opts
- endif
- 
--LDFLAGS	+= -L../lib -lnl utils.o
-+LDFLAGS	+= ../lib/libnl.so utils.o
- CIN 	:= $(wildcard nl-*.c) $(wildcard genl-*.c) $(wildcard nf-*.c)
- TOOLS	:= $(CIN:%.c=%)
- 
-Index: libnl-1.1/tests/Makefile
-===================================================================
---- libnl-1.1.orig/tests/Makefile	2008-01-14 07:48:45.000000000 -0800
-+++ libnl-1.1/tests/Makefile	2010-09-22 14:58:46.820826001 -0700
-@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
-     include ../Makefile.opts
- endif
- 
--LDFLAGS	+= -L../lib -lnl ../src/utils.o
-+LDFLAGS	+= ../lib/libnl.so ../src/utils.o
- CIN 	:= $(wildcard test-*.c)
- TOOLS	:= $(CIN:%.c=%)
- 
diff --git a/meta-oe/recipes-support/libnl/libnl1-1.1/fix-includes.patch b/meta-oe/recipes-support/libnl/libnl1-1.1/fix-includes.patch
deleted file mode 100644
index b172fd2..0000000
--- a/meta-oe/recipes-support/libnl/libnl1-1.1/fix-includes.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -ruN libnl-1.1/lib/route/link/vlan.c libnl-1.1-new/lib/route/link/vlan.c
---- libnl-1.1/lib/route/link/vlan.c	2008-01-14 18:48:45.000000000 +0300
-+++ libnl-1.1-new/lib/route/link/vlan.c	2009-01-30 10:55:09.000000000 +0300
-@@ -26,7 +26,9 @@
- #include <netlink/route/link/info-api.h>
- #include <netlink/route/link/vlan.h>
- 
-+#ifndef VLAN_FLAG_REORDER_HDR
- #include <linux/if_vlan.h>
-+#endif
- 
- /** @cond SKIP */
- #define VLAN_HAS_ID		(1<<0)
diff --git a/meta-oe/recipes-support/libnl/libnl1-1.1/fix-ucred-declaration.patch b/meta-oe/recipes-support/libnl/libnl1-1.1/fix-ucred-declaration.patch
deleted file mode 100644
index e31b18e..0000000
--- a/meta-oe/recipes-support/libnl/libnl1-1.1/fix-ucred-declaration.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-diff -pruN libnl-1.1.orig/include/netlink/handlers.h libnl-1.1/include/netlink/handlers.h
---- libnl-1.1.orig/include/netlink/handlers.h	2008-01-14 18:48:45.000000000 +0300
-+++ libnl-1.1/include/netlink/handlers.h	2011-04-12 19:23:16.603292527 +0400
-@@ -120,6 +120,7 @@ extern struct nl_cb *	nl_cb_alloc(enum n
- extern struct nl_cb *	nl_cb_clone(struct nl_cb *);
- extern struct nl_cb *	nl_cb_get(struct nl_cb *);
- extern void		nl_cb_put(struct nl_cb *);
-+struct ucred;
- 
- extern int  nl_cb_set(struct nl_cb *, enum nl_cb_type, enum nl_cb_kind,
- 		      nl_recvmsg_msg_cb_t, void *);
-diff -pruN libnl-1.1.orig/include/netlink/netlink.h libnl-1.1/include/netlink/netlink.h
---- libnl-1.1.orig/include/netlink/netlink.h	2008-01-14 18:48:45.000000000 +0300
-+++ libnl-1.1/include/netlink/netlink.h	2011-04-12 19:23:51.370292658 +0400
-@@ -50,6 +50,8 @@ extern int			nl_send_auto_complete(struc
- extern int			nl_send_simple(struct nl_handle *, int, int,
- 					       void *, size_t);
- 
-+struct ucred;
-+
- /* Receive */
- extern int			nl_recv(struct nl_handle *,
- 					struct sockaddr_nl *, unsigned char **,
diff --git a/meta-oe/recipes-support/libnl/libnl1-1.1/local-includes.patch b/meta-oe/recipes-support/libnl/libnl1-1.1/local-includes.patch
deleted file mode 100644
index 85659db..0000000
--- a/meta-oe/recipes-support/libnl/libnl1-1.1/local-includes.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN libnl-1.1.orig/Makefile.opts.in libnl-1.1/Makefile.opts.in
---- libnl-1.1.orig/Makefile.opts.in	2008-01-14 15:48:45.000000000 +0000
-+++ libnl-1.1/Makefile.opts.in	2009-04-06 10:20:40.000000000 +0000
-@@ -10,7 +10,7 @@
- #
- 
- CC               := @CC@
--CFLAGS           := @CFLAGS@
-+CFLAGS           := -I./include -I. -I../include @CFLAGS@
- LDFLAGS          := @LDFLAGS@
- CPPFLAGS         := @CPPFLAGS@
- PACKAGE_NAME     := @PACKAGE_NAME@
diff --git a/meta-oe/recipes-support/libnl/libnl1-1.1/netlink-local-fix.patch b/meta-oe/recipes-support/libnl/libnl1-1.1/netlink-local-fix.patch
deleted file mode 100644
index 51c6736..0000000
--- a/meta-oe/recipes-support/libnl/libnl1-1.1/netlink-local-fix.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: libnl-1.1/include/netlink-local.h
-===================================================================
---- libnl-1.1.orig/include/netlink-local.h	2009-06-18 15:28:32.614209645 +0400
-+++ libnl-1.1/include/netlink-local.h	2009-06-18 15:28:44.094190518 +0400
-@@ -26,6 +26,7 @@
- #include <sys/socket.h>
- #include <inttypes.h>
- #include <assert.h>
-+#include <limits.h>
- 
- #include <arpa/inet.h>
- #include <netdb.h>
diff --git a/meta-oe/recipes-support/libnl/libnl1-1.1/respect-ldflags.patch b/meta-oe/recipes-support/libnl/libnl1-1.1/respect-ldflags.patch
deleted file mode 100644
index ba97dc6..0000000
--- a/meta-oe/recipes-support/libnl/libnl1-1.1/respect-ldflags.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN libnl-1.1.orig/lib/Makefile libnl-1.1/lib/Makefile
---- libnl-1.1.orig/lib/Makefile	2008-01-14 15:48:45.000000000 +0000
-+++ libnl-1.1/lib/Makefile	2009-04-06 10:16:21.000000000 +0000
-@@ -48,7 +48,7 @@
- 
- $(OUT_SLIB): ../Makefile.opts $(OBJ)
- 	@echo "  LD $(OUT_SLIB)"; \
--	$(CC) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
-+	$(CC) $(LDFLAGS) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
- 	@echo "  LN $(OUT_SLIB) $(LN1_SLIB)"; \
- 	rm -f $(LN1_SLIB) ; $(LN) -s $(OUT_SLIB) $(LN1_SLIB)
- 	@echo "  LN $(LN1_SLIB) $(LN_SLIB)"; \
diff --git a/meta-oe/recipes-support/libnl/libnl1_1.1.bb b/meta-oe/recipes-support/libnl/libnl1_1.1.bb
deleted file mode 100644
index 72f5995..0000000
--- a/meta-oe/recipes-support/libnl/libnl1_1.1.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "libnl is a library for applications dealing with netlink sockets"
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
-SECTION = "libs/network"
-
-inherit autotools pkgconfig
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
-
-PR = "r6"
-
-# move it to extra subdirectory
-includedir = "${prefix}/include/libnl1"
-
-CFLAGS += '-DVLAN_FLAG_REORDER_HDR=1'
-
-SRC_URI = "\
-  http://www.infradead.org/~tgr/libnl/files/libnl-${PV}.tar.gz \
-  file://local-includes.patch \
-  file://fix-includes.patch \
-  file://respect-ldflags.patch \
-  file://netlink-local-fix.patch \
-  file://dont-link-libnl-from-sysroot.patch \
-  file://build.only.static.lib.patch \
-  file://fix-ucred-declaration.patch \
-"
-S = "${WORKDIR}/libnl-${PV}"
-
-SRC_URI[md5sum] = "ae970ccd9144e132b68664f98e7ceeb1"
-SRC_URI[sha256sum] = "35cea4cfb6cd8af0cafa0f34fff81def5a1f193b8b8384299b4b21883e22edc3"
-- 
1.7.4.4



