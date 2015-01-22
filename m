Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3353471144
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 06:30:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56452973"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jan 2015 14:27:06 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0M6TvGc011995
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:29:57 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 22 Jan 2015 14:30:34 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Jan 2015 14:29:43 +0800
Message-ID: <1421908183-1672-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E8738F0420@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <A8FC939F80655644A89BB21CCD3741E8738F0420@G08CNEXMBPEKD02.g08.fujitsu.local>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-networking][PATCH v4] openl2tp: add new recipe
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
X-List-Received-Date: Thu, 22 Jan 2015 06:30:45 -0000
Content-Type: text/plain

OpenL2TP is an open source L2TP client / server, written
specifically for Linux. It has been designed for use as an enterprise
L2TP VPN server or in commercial, Linux-based, embedded networking
products and is able to support hundreds of sessions, each with
different configuration. It is used by several ISPs to provide
L2TP services and by corporations to implement L2TP VPNs.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...kefile-modify-CFLAGS-to-aviod-build-error.patch | 104 +++++++++++++++++++++
 .../recipes-daemons/openl2tp/openl2tp_1.8.bb       |  36 +++++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/openl2tp/files/Makefile-modify-CFLAGS-to-aviod-build-error.patch
 create mode 100644 meta-networking/recipes-daemons/openl2tp/openl2tp_1.8.bb

diff --git a/meta-networking/recipes-daemons/openl2tp/files/Makefile-modify-CFLAGS-to-aviod-build-error.patch b/meta-networking/recipes-daemons/openl2tp/files/Makefile-modify-CFLAGS-to-aviod-build-error.patch
new file mode 100644
index 0000000..157e4a5
--- /dev/null
+++ b/meta-networking/recipes-daemons/openl2tp/files/Makefile-modify-CFLAGS-to-aviod-build-error.patch
@@ -0,0 +1,104 @@
+From 152486fa3c36c3b99d17d5b553cf87ef412fae8e Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Mon, 1 Dec 2014 01:53:41 +0900
+Subject: [PATCH] Makefile:modify CFLAGS to aviod build error.
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ Makefile         | 22 +++++++++++-----------
+ plugins/Makefile |  6 +++---
+ 2 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4aaa448..baa7882 100644
+--- a/Makefile
++++ b/Makefile
+@@ -152,10 +152,10 @@ LIBS.dmalloc=		-ldmalloc
+ export USE_DMALLOC
+ endif
+ 
+-CPPFLAGS=		$(CPPFLAGS.l2tptest) $(CPPFLAGS-y)
+-CFLAGS=			-I. -Iusl -Icli -isystem include \
+-				-MMD -Wall -Werror -Wno-strict-aliasing \
+-				$(CPPFLAGS) $(CPPFLAGS.dmalloc) \
++ADD_CPPFLAGS=		$(CPPFLAGS.l2tptest) $(CPPFLAGS-y)
++ADD_CFLAGS=			-I. -Iusl -Icli -isystem include \
++				-MMD -Wall -Wno-strict-aliasing \
++				$(ADD_CPPFLAGS) $(CPPFLAGS.dmalloc) \
+ 				-DSYS_LIBDIR=$(SYS_LIBDIR)
+ LDFLAGS.l2tpd=		-Wl,-E -L. -Lusl -lusl -ldl $(LIBS.dmalloc) -lc
+ LDFLAGS.l2tpconfig=	-Lcli -lcli -lreadline $(LIBS.dmalloc) $(READLINE_LDFLAGS) -lc
+@@ -170,10 +170,10 @@ CFLAGS.optimize=	$(OPT_CFLAGS)
+ endif
+ export CFLAGS.optimize
+ 
+-CFLAGS+=		$(CFLAGS.optimize)
++ADD_CFLAGS+=		$(CFLAGS.optimize)
+ 
+ ifeq ($(L2TP_USE_ASYNC_RPC),y)
+-CPPFLAGS+=		-DL2TP_ASYNC_RPC
++ADD_CPPFLAGS+=		-DL2TP_ASYNC_RPC
+ endif
+ 
+ ifeq ($(L2TP_FEATURE_RPC_MANAGEMENT),y)
+@@ -220,13 +220,13 @@ endif
+ 
+ # Compile without -Wall because rpcgen-generated code is full of warnings.
+ %_xdr.o:		%_xdr.c
+-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
+ 
+ %_client.o:		%_client.c
+-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
+ 
+ %_server.o:		%_server.c
+-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
+ 
+ %_xdr.c:		%.x
+ 			-$(RM) $@
+@@ -272,7 +272,7 @@ l2tpconfig:		$(L2TPCONFIG_SRCS.o)
+ 			$(CC) -o $@ $^ $(LDFLAGS.l2tpconfig)
+ 
+ %.o:	%.c
+-			$(CC) -c $(CFLAGS) $< -o $@
++			$(CC) -c $(CFLAGS) $(ADD_CFLAGS) $< -o $@
+ 
+ l2tp_options.h:	FORCE
+ 	@rm -f $@.tmp
+@@ -325,7 +325,7 @@ install:		install-all
+ install-all:		all install-daemon install-app
+ 
+ install-daemon:
+-			@for d in $(filter-out usl,$(SUBDIRS)); do $(MAKE) -C $$d $(MFLAGS) EXTRA_CFLAGS="$(CPPFLAGS)" install; if [ $$? -ne 0 ]; then exit 1; fi; done
++			@for d in $(filter-out usl,$(SUBDIRS)); do $(MAKE) -C $$d $(MFLAGS) EXTRA_CFLAGS="$(CPPFLAGS) $(ADD_CPPFLAGS)" install; if [ $$? -ne 0 ]; then exit 1; fi; done
+ 			$(INSTALL) -d $(DESTDIR)/usr/sbin
+ 			$(INSTALL) openl2tpd $(DESTDIR)/usr/sbin
+ 
+diff --git a/plugins/Makefile b/plugins/Makefile
+index 5be996d..6810236 100644
+--- a/plugins/Makefile
++++ b/plugins/Makefile
+@@ -1,7 +1,7 @@
+-CFLAGS	:= $(CFLAGS.optimize) -MMD -Wall \
++ADD_CFLAGS	:= $(CFLAGS.optimize) -MMD -Wall \
+ 	-isystem ../include \
+ 	-I. -I.. -I../usl -fPIC $(EXTRA_CFLAGS)
+-LDFLAGS	:= -shared
++ADD_LDFLAGS	:= -shared
+ 
+ PLUGINS.c:=	ppp_unix.c ppp_null.c ipsec.c event_sock.c
+ 
+@@ -21,7 +21,7 @@ clean:
+ 		$(RM) $(PLUGINS.so) $(wildcard *.o) $(wildcard *.d) $(SRC.generated)
+ 
+ %.so: %.c
+-		$(CC) -o $@ $(LDFLAGS) $(CFLAGS) $<
++		$(CC) -o $@ $(LDFLAGS) $(ADD_LDFLAGS) $(CFLAGS) $(ADD_CFLAGS) $<
+ 
+ install:	all
+ 		$(INSTALL) -d $(DESTDIR)$(SYS_LIBDIR)/openl2tp
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-daemons/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-daemons/openl2tp/openl2tp_1.8.bb
new file mode 100644
index 0000000..435390e
--- /dev/null
+++ b/meta-networking/recipes-daemons/openl2tp/openl2tp_1.8.bb
@@ -0,0 +1,36 @@
+SUMMARY = "An L2TP client/server, designed for VPN use."
+DESCRIPTION = "OpenL2TP is an open source L2TP client / server, written \
+specifically for Linux. It has been designed for use as an enterprise \
+L2TP VPN server or in commercial, Linux-based, embedded networking \
+products and is able to support hundreds of sessions, each with \
+different configuration. It is used by several ISPs to provide \
+L2TP services and by corporations to implement L2TP VPNs."
+
+HOMEPAGE = "http://www.openl2tp.org/"
+SECTION = "System Environment/Daemons"
+
+SRC_URI = "http://ftp.jaist.ac.jp/pub/sourceforge/o/op/${PN}/${PN}/${PV}/${BP}.tar.gz \
+           file://Makefile-modify-CFLAGS-to-aviod-build-error.patch"
+SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
+SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585"
+
+DEPENDS = "popt flex readline"
+inherit autotools-brokensep pkgconfig
+PARALLEL_MAKE = ""
+EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -Wno-nused-but-set-variable"'
+
+do_compile_prepend() {
+    sed -i -e "s:SYS_LIBDIR=.*:SYS_LIBDIR=${libdir}:g" \
+        -e 's:$(CROSS_COMPILE)as:${AS}:g' \
+        -e 's:$(CROSS_COMPILE)ld:${LD}:g' \
+        -e 's:$(CROSS_COMPILE)gcc:${CC}:g' \
+        -e 's:$(CROSS_COMPILE)ar:${AR}:g' \
+        -e 's:$(CROSS_COMPILE)nm:${NM}:g' \
+        -e 's:$(CROSS_COMPILE)strip:${STRIP}:g' \
+        -e 's:$(CROSS_COMPILE)install:install:g' \
+        ${S}/Makefile
+}
+
-- 
1.8.4.2


