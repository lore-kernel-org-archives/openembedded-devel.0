Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDC0C78B21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 02:51:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6Q2pCBU011070
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 19:51:12 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 25 Jul 2018 19:51:11 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Jul 2018 10:51:09 +0800
Message-ID: <1532573469-67823-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ipvdasm: upgrade 1.26 -> 1.29
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
X-List-Received-Date: Thu, 26 Jul 2018 02:51:12 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: Make README more generic and reference new
                kernel.org location

1.remove patch 0002 since new version already have this patch
2.update other patches to new version 1.29

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...001-Modify-the-Makefile-for-cross-compile.patch | 58 ++++++--------------
 .../0002-Replace-nl_handle-to-nl_sock.patch        | 63 ----------------------
 .../ipvsadm/ipvsadm/makefile-add-ldflags.patch     | 20 +++++--
 .../ipvsadm/{ipvsadm_1.26.bb => ipvsadm_1.29.bb}   | 11 ++--
 4 files changed, 40 insertions(+), 112 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm/0002-Replace-nl_handle-to-nl_sock.patch
 rename meta-networking/recipes-support/ipvsadm/{ipvsadm_1.26.bb => ipvsadm_1.29.bb} (78%)

diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Modify-the-Makefile-for-cross-compile.patch b/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Modify-the-Makefile-for-cross-compile.patch
index 7c3dfe4..d7b0267 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Modify-the-Makefile-for-cross-compile.patch
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Modify-the-Makefile-for-cross-compile.patch
@@ -1,18 +1,22 @@
-From 58292175115bae7a4c3600d3022e59ea57213025 Mon Sep 17 00:00:00 2001
-From: Jianchuan Wang <jianchuan.wang@windriver.com>
-Date: Mon, 12 Jan 2015 15:53:23 +0800
+From 801224257015788d3aff026bf2ae1cd8531d4fcc Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 25 Jul 2018 13:12:04 +0800
 Subject: [PATCH] Modify the Makefile for cross compile.
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+
+update to version 1.29
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- Makefile         | 23 ++++++-----------------
+ Makefile         | 9 ++++-----
  libipvs/Makefile |  3 +--
- 2 files changed, 7 insertions(+), 19 deletions(-)
+ 2 files changed, 5 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index e4e03cc..461c021 100644
+index 91a2991..906086d 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -35,10 +35,9 @@ ARCH		= $(shell uname -m)
@@ -23,57 +27,29 @@ index e4e03cc..461c021 100644
  INCLUDE		=
  SBIN		= $(BUILD_ROOT)/sbin
 -MANDIR		= usr/man
-+MANDIR		= usr/share/man
++MANDIR          = usr/share/man
  MAN		= $(BUILD_ROOT)/$(MANDIR)/man8
  INIT		= $(BUILD_ROOT)/etc/rc.d/init.d
  MKDIR		= mkdir
-@@ -62,17 +61,7 @@ RPMBUILD = $(shell				\
- 		echo "/bin/rpm";		\
- 	fi )
- 
--ifeq (,$(FORCE_GETOPT))
--LIB_SEARCH = /lib64 /usr/lib64 /usr/local/lib64 /lib /usr/lib /usr/local/lib
--POPT_LIB = $(shell for i in $(LIB_SEARCH); do \
--  if [ -f $$i/libpopt.a ]; then \
--    if nm $$i/libpopt.a | fgrep -q poptGetContext; then \
--	echo "-lpopt"; \
--	break; \
--    fi; \
--  fi; \
--done)
--endif
-+POPT_LIB = -lpopt
- 
- ifneq (,$(POPT_LIB))
- POPT_DEFINE = -DHAVE_POPT
-@@ -81,7 +70,7 @@ endif
- OBJS		= ipvsadm.o config_stream.o dynamic_array.o
- LIBS		= $(POPT_LIB)
- ifneq (0,$(HAVE_NL))
--LIBS		+= -lnl
-+LIBS		+= -lnl-3 -lnl-genl-3
- endif
- DEFINES		= -DVERSION=\"$(VERSION)\" -DSCHEDULERS=\"$(SCHEDULERS)\" \
- 		  -DPE_LIST=\"$(PE_LIST)\" $(POPT_DEFINE)
-@@ -91,13 +80,13 @@ DEFINES		+= $(shell if [ ! -f ../ip_vs.h ]; then	\
+@@ -81,13 +80,13 @@ DEFINES		+= $(shell if [ ! -f ../ip_vs.h ]; then	\
  
  .PHONY	= all clean install dist distclean rpm rpms
  
 -all:            libs ipvsadm
-+all: ipvsadm
++all:            ipvsadm
  
  libs:
  		make -C libipvs
  
 -ipvsadm:	$(OBJS) $(STATIC_LIBS)
 -		$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
-+ipvsadm:	$(OBJS) libs
++ipvsadm:       $(OBJS) libs
 +		$(CC) $(CFLAGS) -o $@ $(OBJS) $(STATIC_LIBS) $(LIBS)
  
  install:        all
  		if [ ! -d $(SBIN) ]; then $(MKDIR) -p $(SBIN); fi
 diff --git a/libipvs/Makefile b/libipvs/Makefile
-index a527a7f..b7300ec 100644
+index f845c8b..dafab30 100644
 --- a/libipvs/Makefile
 +++ b/libipvs/Makefile
 @@ -1,6 +1,5 @@
@@ -83,7 +59,7 @@ index a527a7f..b7300ec 100644
  CFLAGS		= -Wall -Wunused -Wstrict-prototypes -g -fPIC
  ifneq (0,$(HAVE_NL))
  CFLAGS		+= -DLIBIPVS_USE_NL
-@@ -18,7 +17,7 @@ SHARED_LIB	= libipvs.so
+@@ -30,7 +29,7 @@ SHARED_LIB	= libipvs.so
  all:		$(STATIC_LIB) $(SHARED_LIB)
  
  $(STATIC_LIB):	libipvs.o ip_vs_nl_policy.o
@@ -93,5 +69,5 @@ index a527a7f..b7300ec 100644
  $(SHARED_LIB):	libipvs.o ip_vs_nl_policy.o
  		$(CC) -shared -Wl,-soname,$@ -o $@ $^
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm/0002-Replace-nl_handle-to-nl_sock.patch b/meta-networking/recipes-support/ipvsadm/ipvsadm/0002-Replace-nl_handle-to-nl_sock.patch
deleted file mode 100644
index 7896d6d..0000000
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm/0002-Replace-nl_handle-to-nl_sock.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 2686213259b15df9cf1d969c5a14d62f14cfbaae Mon Sep 17 00:00:00 2001
-From: Jianchuan Wang <jianchuan.wang@windriver.com>
-Date: Thu, 8 Jan 2015 17:37:11 +0800
-Subject: [PATCH 2/2] Replace nl_handle to nl_sock.
-
-The nl_handle was replace with nl_sock in the libnl-3.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
----
- libipvs/libipvs.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/libipvs/libipvs.c b/libipvs/libipvs.c
-index a157e18..21a9bfa 100644
---- a/libipvs/libipvs.c
-+++ b/libipvs/libipvs.c
-@@ -32,7 +32,7 @@ static void* ipvs_func = NULL;
- struct ip_vs_getinfo ipvs_info;
- 
- #ifdef LIBIPVS_USE_NL
--static struct nl_handle *sock = NULL;
-+static struct nl_sock *sock = NULL;
- static int family, try_nl = 1;
- #endif
- 
-@@ -73,7 +73,7 @@ int ipvs_nl_send_message(struct nl_msg *msg, nl_recvmsg_msg_cb_t func, void *arg
- {
- 	int err = EINVAL;
- 
--	sock = nl_handle_alloc();
-+	sock = nl_socket_alloc();
- 	if (!sock) {
- 		nlmsg_free(msg);
- 		return -1;
-@@ -88,7 +88,7 @@ int ipvs_nl_send_message(struct nl_msg *msg, nl_recvmsg_msg_cb_t func, void *arg
- 
- 	/* To test connections and set the family */
- 	if (msg == NULL) {
--		nl_handle_destroy(sock);
-+		nl_socket_free(sock);
- 		sock = NULL;
- 		return 0;
- 	}
-@@ -104,12 +104,12 @@ int ipvs_nl_send_message(struct nl_msg *msg, nl_recvmsg_msg_cb_t func, void *arg
- 
- 	nlmsg_free(msg);
- 
--	nl_handle_destroy(sock);
-+	nl_socket_free(sock);
- 
- 	return 0;
- 
- fail_genl:
--	nl_handle_destroy(sock);
-+	nl_socket_free(sock);
- 	sock = NULL;
- 	nlmsg_free(msg);
- 	errno = err;
--- 
-1.8.3.1
-
diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm/makefile-add-ldflags.patch b/meta-networking/recipes-support/ipvsadm/ipvsadm/makefile-add-ldflags.patch
index 1bf1eed..a2c5235 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm/makefile-add-ldflags.patch
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm/makefile-add-ldflags.patch
@@ -1,19 +1,33 @@
-Add LDFLAGS variable to Makefile, make sure the extra linker flags can be passed.
+From 8aff1e965ec17262f3a5b376f7eb3e053d81905c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 18:18:05 +0800
+Subject: [PATCH] Add LDFLAGS variable to Makefile, make sure the extra linker
+ flags can be passed.
 
 Upstream-Status: Pending
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 
+Update to version 1.29
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/Makefile b/Makefile
-index 461c021..8bc9cde 100644
+index f29bbae..81beb5a 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -86,7 +86,7 @@ libs:
  		make -C libipvs
  
- ipvsadm:	$(OBJS) libs
+ ipvsadm:       $(OBJS) libs
 -		$(CC) $(CFLAGS) -o $@ $(OBJS) $(STATIC_LIBS) $(LIBS)
 +		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS) $(STATIC_LIBS) $(LIBS)
  
  install:        all
  		if [ ! -d $(SBIN) ]; then $(MKDIR) -p $(SBIN); fi
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
similarity index 78%
rename from meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
rename to meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
index 2ac2b48..58407a1 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
@@ -12,19 +12,18 @@ locality-based  least-connection, locality-based least-connection with replicati
 destination-hashing, and source-hashing)."
 SECTION = "net"
 LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://README;beginline=40;endline=56;md5=a54cba37b64924aa5008881607942892"
+LIC_FILES_CHKSUM = "file://README;beginline=40;endline=56;md5=b4e40069f15598d0e3fe2aa177e5ec77"
 
 DEPENDS += "libnl popt"
 
-SRC_URI = "http://www.linuxvirtualserver.org/software/kernel-2.6/${BP}.tar.gz \
+SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/utils/kernel/ipvsadm/${BP}.tar.gz \
         file://0001-Modify-the-Makefile-for-cross-compile.patch \
-        file://0002-Replace-nl_handle-to-nl_sock.patch \
         file://0003-ipvsadm-remove-dependency-on-bash.patch \
         file://makefile-add-ldflags.patch \
 "
 
-SRC_URI[md5sum] = "eac3ba3f62cd4dea2da353aeddd353a8"
-SRC_URI[sha256sum] = "6d6c46fecb1c532a892616b4445c73b71730e8790d5630f60269fd9cbee0eb2d"
+SRC_URI[md5sum] = "88b35030b4766b3e44ad15aacdef65c4"
+SRC_URI[sha256sum] = "297f5cd459c3eef81ed0ca32e53bf320ed6b132fe7ed6ea5e44aa6b1fbd2a7de"
 
 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/ipvsadm"
 
@@ -37,3 +36,5 @@ do_compile() {
 do_install() {
     oe_runmake 'BUILD_ROOT=${D}' install
 }
+
+inherit pkgconfig
-- 
2.7.4


