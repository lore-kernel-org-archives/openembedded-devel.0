Return-Path: <joe@deserted.net>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 43FEA728AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 16:53:52 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id a13so1304313igq.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 08:53:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=/eVYJiTMFplnEMPdx4JbIMWC0TYAh3/hd+82XEoY9Vw=;
	b=k0RecvMCS189k9hG+M4QCV5Fsb6i5JQRQfkSI5IHAXErfmuhP+PkEbamGHJDdhNsdB
	77S+EaSJVQE/apjYGYQ9ArW9IatbUTKTNgjzml6Bku3sMF6gc2j2SpGQQfD+Vmcj7T2+
	9xF9oINd2LoT/aOpseLUNT2dDGYpX8xc7cySuj1GGtXBx1QjcertawKL9HE+hSGvN5DH
	YrvINwxrYkdwC0x9U/gVaTSmCARHYhMRo05By0FPYG+v6+uug2m/JFEIObnj8Z+t06Ti
	ogVVJl+KMpLl4x83C2vLS3OpT4p79impwSEyOt5KkWFdeTSHWnbh277VXIyPjZH4fInx
	K8EA==
X-Gm-Message-State: ALoCoQls6j1AwKvtafZK6CRApAWD5SyDiqzYr+3kONZB7pJD2TZdjxENn6sCQCq0GPEdArbKM7i8
X-Received: by 10.107.7.142 with SMTP id g14mr85622705ioi.81.1420563232647;
	Tue, 06 Jan 2015 08:53:52 -0800 (PST)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id d3sm5203005igl.7.2015.01.06.08.53.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Jan 2015 08:53:51 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jan 2015 11:54:15 -0500
Message-Id: <1420563255-30869-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH v3] openl2tp: add new recipe
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
X-List-Received-Date: Tue, 06 Jan 2015 16:53:56 -0000

From: Li xin <lixin.fnst@cn.fujitsu.com>

OpenL2TP is an open source L2TP client / server, written specifically
for Linux. It has been designed for use as an enterprise L2TP VPN server
or in commercial, Linux-based, embedded networking products and is able
to support hundreds of sessions, each with different configuration.
It is used by several ISPs to provide L2TP services and by corporations
to implement L2TP VPNs.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

Still not ideal, but I managed to track down the world build failure and I think
the additional patch I added will resolve it, since it looks like a relic of gcc
behaviour on 32-bit systems.  There's also some problem with the generated
dependencies in the project makefile that I may take a look at later, but it's a
comparatively fast package to build so serializing it doesn't seem to be a
complete disaster.  If someone with better Makefile-fu than I wants to dig into
that one, that'd be great.  The issue somes from l2tp_options.h not being
generated quite quickly enough for the processing of lt2p_private.h.

-J.

 ...kefile-modify-CFLAGS-to-aviod-build-error.patch | 106 +++++++++++++++++++++
 .../openl2tp-simplify-gcc-warning-hack.patch       |  41 ++++++++
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb     |  36 +++++++
 3 files changed, 183 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch
new file mode 100644
index 0000000..96dbc75
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch
@@ -0,0 +1,106 @@
+From 152486fa3c36c3b99d17d5b553cf87ef412fae8e Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Mon, 1 Dec 2014 01:53:41 +0900
+Subject: [PATCH] Makefile:modify CFLAGS to aviod build error.
+
+Upstream-Status: pending
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
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch
new file mode 100644
index 0000000..c11a127
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch
@@ -0,0 +1,41 @@
+From 460549a3de27f8dd8371b6d6fc1f69d8bffa102b Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Tue, 6 Jan 2015 11:23:21 -0500
+Subject: [PATCH] openl2tp: simplify gcc warning hack
+
+The hack to work around the gcc warning causes problems with some modern
+gcc configurations.  Since the redef behaviour is essentially correct
+everywhere and since the hack is still required on 32-bit builders, leave
+it in place but remove the #if guard since it is only there to ensure that
+the l2tp_private.h file is updated if the rpc source file is changed and
+the two get out of sync.
+
+Upstream-status: pending
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+---
+ l2tp_private.h | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/l2tp_private.h b/l2tp_private.h
+index f3c1af7..cca6806 100644
+--- a/l2tp_private.h
++++ b/l2tp_private.h
+@@ -89,14 +89,8 @@
+  * So we redefine the constant with UL suffix to avoid the gcc warning.
+  * Is there some C preprocessor magic that could avoid having to do this?
+  */
+-#if L2TP_API_TUNNEL_FLAG_MTU != 2147483648
+-#error Constant L2TP_API_TUNNEL_FLAG_MTU changed. Update local definition here.
+-#endif
+ #undef L2TP_API_TUNNEL_FLAG_MTU
+ #define L2TP_API_TUNNEL_FLAG_MTU 2147483648UL
+-#if L2TP_API_SESSION_FLAG_NO_PPP != 2147483648
+-#error Constant L2TP_API_SESSION_FLAG_NO_PPP changed. Update local definition here.
+-#endif
+ #undef L2TP_API_SESSION_FLAG_NO_PPP
+ #define L2TP_API_SESSION_FLAG_NO_PPP 2147483648UL
+ 
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
new file mode 100644
index 0000000..5a04107
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -0,0 +1,36 @@
+SUMMARY = "An L2TP client/server, designed for VPN use."
+DESCRIPTION = "OpenL2TP is an open source L2TP client / server, written \
+specifically for Linux. It has been designed for use as an enterprise \
+L2TP VPN server or in commercial, Linux-based, embedded networking \
+products and is able to support hundreds of sessions, each with \
+different configuration. It is used by several ISPs to provide \
+L2TP services and by corporations to implement L2TP VPNs."
+HOMEPAGE = "http://www.openl2tp.org/"
+SECTION = "console/network"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585"
+DEPENDS = "popt flex readline"
+
+SRC_URI = "http://ftp.jaist.ac.jp/pub/sourceforge/o/op/${PN}/${PN}/${PV}/${BP}.tar.gz \
+           file://Makefile-modify-CFLAGS-to-aviod-build-error.patch \
+           file://openl2tp-simplify-gcc-warning-hack.patch \
+          "
+SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
+SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
+
+inherit autotools-brokensep pkgconfig
+
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
-- 
1.9.1


