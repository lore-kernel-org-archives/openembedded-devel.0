Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E3B52753E2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Sep 2018 07:53:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w837roX4001147
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Sep 2018 00:53:50 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Sep 2018 00:53:49 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Sep 2018 15:53:47 +0800
Message-ID: <1535961228-166818-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] lksctp-tools: Upgrade to 1.0.18
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
X-List-Received-Date: Mon, 03 Sep 2018 07:53:50 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

inherit autotools-brokensep to fix the gap
between ${S} and ${B}

Backport 6 patches from master to fix build
issue[https://github.com/sctp/lksctp-tools/compare/lksctp-tools-1.0.18...master]
| WARNING: lksctp-tools-1.0.18+gitAUTOINC+1b077af62d-r0 do_package: QA Issue: lksctp-tools: Files/directories were installed but not shipped in:
|  /usr/lib64/libsctp.so.1.0.17
|  /usr/lib64/lksctp-tools/libwithsctp.so.1.0.17

| -- Looking for sctp_connectx - not found[when
build freediameter which depends on lksctp-tools]

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...ld-0b0dce7a36fb-actually-belongs-to-v4.19.patch | 31 ++++++++++
 ...ld-fix-netinet-sctp.h-not-to-be-installed.patch | 35 +++++++++++
 ...001-build-fix-probing-for-HAVE_SCTP_SENDV.patch | 35 +++++++++++
 ...e-v4.12-secondary-defines-in-favor-of-HAV.patch | 52 ++++++++++++++++
 ...c-add-CURRENT-REVISION-and-AGE-for-libsct.patch | 71 ++++++++++++++++++++++
 ...ithsctp-use-PACKAGE_VERSION-in-withsctp.h.patch | 43 +++++++++++++
 ...sctp-tools_1.0.17.bb => lksctp-tools_1.0.18.bb} | 12 +++-
 7 files changed, 276 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-0b0dce7a36fb-actually-belongs-to-v4.19.patch
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-netinet-sctp.h-not-to-be-installed.patch
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-probing-for-HAVE_SCTP_SENDV.patch
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-remove-v4.12-secondary-defines-in-favor-of-HAV.patch
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-configure.ac-add-CURRENT-REVISION-and-AGE-for-libsct.patch
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-withsctp-use-PACKAGE_VERSION-in-withsctp.h.patch
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.17.bb => lksctp-tools_1.0.18.bb} (72%)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-0b0dce7a36fb-actually-belongs-to-v4.19.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-0b0dce7a36fb-actually-belongs-to-v4.19.patch
new file mode 100644
index 0000000..7599b1b
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-0b0dce7a36fb-actually-belongs-to-v4.19.patch
@@ -0,0 +1,31 @@
+From e5952a0cdfa8b1b56a5823574835f1f771f14ae0 Mon Sep 17 00:00:00 2001
+From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+Date: Fri, 24 Aug 2018 09:53:00 -0300
+Subject: [PATCH] build: 0b0dce7a36fb actually belongs to v4.19
+
+Typo or not, this commit actually belongs to v4.19 and made me wonder why
+on v4.18 it didn't find this feature.
+
+Fixes: 817f0bfa248f ("build: add two defines for Peer Address Parameters extensions on sctp_paddrparams")
+Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+Reviewed-by: Xin Long <lucien.xin@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f55775a..5de5c76 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -101,7 +101,7 @@ LKSCTP_CHECK_TYPE([struct sctp_prinfo], [HAVE_SCTP_SENDV])
+ # added on v4.16, 30f6ebf65bc4
+ LKSCTP_CHECK_DECL([SCTP_AUTH_NO_AUTH], [HAVE_SCTP_AUTH_NO_AUTH])
+ 
+-# New members to sctp_paddrparams, added on v4.18, 0b0dce7a36fb
++# New members to sctp_paddrparams, added on v4.19, 0b0dce7a36fb
+ LKSCTP_CHECK_MEMBER([struct sctp_paddrparams.spp_ipv6_flowlabel],
+ 		    [HAVE_SCTP_SPP_IPV6_FLOWLABEL])
+ LKSCTP_CHECK_MEMBER([struct sctp_paddrparams.spp_dscp],
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-netinet-sctp.h-not-to-be-installed.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-netinet-sctp.h-not-to-be-installed.patch
new file mode 100644
index 0000000..03c6c4f
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-netinet-sctp.h-not-to-be-installed.patch
@@ -0,0 +1,35 @@
+From 378560050a8f93786c590cc99a55461666205b61 Mon Sep 17 00:00:00 2001
+From: Xin Long <lucien.xin@gmail.com>
+Date: Fri, 24 Aug 2018 01:13:32 +0800
+Subject: [PATCH] build: fix netinet/sctp.h not to be installed
+
+After libcnetinet_HEADERS was set to sctp.h.in, netinet/sctp.h can
+no longer be installed into ${includedir}.
+
+Since "AC_CONFIG_HEADERS([src/include/netinet/sctp.h])" is already
+added into configure.ac, there's no need to generate sctp.h by
+automake.
+
+So we simply set libcnetinet_HEADERS back to sctp.h.
+
+Fixes: 9607dd85e70a ("netinet/sctp.h: dynamically build based on system setup")
+Signed-off-by: Xin Long <lucien.xin@gmail.com>
+Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+---
+ src/include/netinet/Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/include/netinet/Makefile.am b/src/include/netinet/Makefile.am
+index ca0aac2..965db8c 100644
+--- a/src/include/netinet/Makefile.am
++++ b/src/include/netinet/Makefile.am
+@@ -11,5 +11,4 @@ libcnetinetdir = $(includedir)/netinet
+ # API.
+ include_HEADERS =
+ 
+-libcnetinet_HEADERS = sctp.h.in
+-BUILT_SOURCES = sctp.h
++libcnetinet_HEADERS = sctp.h
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-probing-for-HAVE_SCTP_SENDV.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-probing-for-HAVE_SCTP_SENDV.patch
new file mode 100644
index 0000000..89c8983
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-fix-probing-for-HAVE_SCTP_SENDV.patch
@@ -0,0 +1,35 @@
+From 596efd6631b83069d41782fb0ee2d6cf76a50dfa Mon Sep 17 00:00:00 2001
+From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+Date: Fri, 24 Aug 2018 09:52:59 -0300
+Subject: [PATCH] build: fix probing for HAVE_SCTP_SENDV
+
+Somehow it was using a type that is non-existent. The right one is
+sctp_prinfo, introduced on ed63afb8a318 ("sctp: add support for PR-SCTP
+Information for sendmsg"), present on v4.17.
+
+Fixes: 1b798f1ca3b5 ("build: add define HAVE_SCTP_AUTH_NO_AUTH")
+Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+Reviewed-by: Xin Long <lucien.xin@gmail.com>
+---
+ configure.ac | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index dad658c..f55775a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -94,9 +94,8 @@ LKSCTP_CHECK_MEMBER([struct sctp_pdapi_event.pdapi_stream],
+ LKSCTP_CHECK_MEMBER([struct sctp_pdapi_event.pdapi_seq],
+ 		    [HAVE_SCTP_PDAPI_EVENT_PDAPI_SEQ])
+ 
+-# PR-SCTP field used to probe for sendv/recvv support, added on v4.17
+-LKSCTP_CHECK_MEMBER([struct sendv_prinfo.sctp_prinfo],
+-		    [HAVE_SCTP_SENDV])
++# PR-SCTP struct used to probe for sendv/recvv support, added on v4.17
++LKSCTP_CHECK_TYPE([struct sctp_prinfo], [HAVE_SCTP_SENDV])
+ 
+ # This event indicates that the peer does not support SCTP authentication,
+ # added on v4.16, 30f6ebf65bc4
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-remove-v4.12-secondary-defines-in-favor-of-HAV.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-remove-v4.12-secondary-defines-in-favor-of-HAV.patch
new file mode 100644
index 0000000..d22cda6
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-build-remove-v4.12-secondary-defines-in-favor-of-HAV.patch
@@ -0,0 +1,52 @@
+From db6d15bf12a0123e4320e5fd7cb688331dea1bdc Mon Sep 17 00:00:00 2001
+From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+Date: Fri, 24 Aug 2018 09:52:58 -0300
+Subject: [PATCH] build: remove v4.12 secondary defines in favor of
+ HAVE_SCTP_STREAM_RECONFIG
+
+These were backups, commented out since beginning.
+HAVE_SCTP_STREAM_RECONFIG is enough to identify that these are there, so
+lets use only one.
+
+Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+Reviewed-by: Xin Long <lucien.xin@gmail.com>
+---
+ configure.ac                  | 8 --------
+ src/include/netinet/sctp.h.in | 2 --
+ 2 files changed, 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2ae36ec..dad658c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -82,14 +82,6 @@ AC_CHECK_FUNCS([bzero gethostbyname gettimeofday memmove memset select socket \
+ LKSCTP_CHECK_MEMBER([struct sctp_event_subscribe.sctp_stream_reset_event],
+ 		    [HAVE_SCTP_STREAM_RESET_EVENT])
+ 
+-# Support for assoc reset event, added on v4.12, c95129d127c6
+-#LKSCTP_CHECK_MEMBER([struct sctp_event_subscribe.sctp_assoc_reset_event], \
+-#		    [HAVE_SCTP_ASSOC_RESET_EVENT])
+-
+-# Support for stream change event, added on v4.12, b444153fb5a6
+-#LKSCTP_CHECK_MEMBER([struct sctp_event_subscribe.sctp_stream_change_event], \
+-#		    [HAVE_SCTP_STREAM_CHANGE_EVENT])
+-
+ # RFC 6525 (Stream Reconf), finished on v4.12, c0d8bab6ae51
+ LKSCTP_CHECK_DECL([SCTP_RECONFIG_SUPPORTED], [HAVE_SCTP_STREAM_RECONFIG])
+ 
+diff --git a/src/include/netinet/sctp.h.in b/src/include/netinet/sctp.h.in
+index c049077..2009f1c 100644
+--- a/src/include/netinet/sctp.h.in
++++ b/src/include/netinet/sctp.h.in
+@@ -61,8 +61,6 @@ extern "C" {
+ #define HAVE_SCTP_CANSET_PRIMARY
+ 
+ #undef HAVE_SCTP_STREAM_RESET_EVENT
+-#undef HAVE_SCTP_ASSOC_RESET_EVENT
+-#undef HAVE_SCTP_STREAM_CHANGE_EVENT
+ #undef HAVE_SCTP_STREAM_RECONFIG
+ #undef HAVE_SCTP_PEELOFF_FLAGS
+ #undef HAVE_SCTP_PDAPI_EVENT_PDAPI_STREAM
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-configure.ac-add-CURRENT-REVISION-and-AGE-for-libsct.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-configure.ac-add-CURRENT-REVISION-and-AGE-for-libsct.patch
new file mode 100644
index 0000000..bec9bf0
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-configure.ac-add-CURRENT-REVISION-and-AGE-for-libsct.patch
@@ -0,0 +1,71 @@
+From 7de2bd7e769f10521e3d0c2cb42c6f6b9b505dd0 Mon Sep 17 00:00:00 2001
+From: Xin Long <lucien.xin@gmail.com>
+Date: Thu, 16 Aug 2018 14:12:30 +0800
+Subject: [PATCH] configure.ac: add CURRENT REVISION and AGE for libsctp and
+ libwithsctp
+
+Add CURRENT REVISION and AGE for libsctp and libwithsctp in
+configure.ac to update these 2 library version information.
+
+Compatible with before, they will start from 1:18:0. But each
+will get updated according to their definitions in the future.
+
+Signed-off-by: Xin Long <lucien.xin@gmail.com>
+Acked-by: Neil Horman <nhorman@tuxdriver.com>
+Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+---
+ configure.ac             | 7 +++++++
+ src/lib/Makefile.am      | 7 +++++--
+ src/withsctp/Makefile.am | 3 ++-
+ 3 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 275ef4e..2ae36ec 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,6 +14,13 @@ dnl reduce clutter in the root; if we put it below AM_INIT_AUTOMAKE,
+ dnl configure will fail ...)
+ 
+ AC_INIT([lksctp-tools], [1.0.18], [], [], [http://www.lksctp.org/])
++AC_SUBST(LIBSCTP_CURRENT, 1)
++AC_SUBST(LIBSCTP_REVISION, 18)
++AC_SUBST(LIBSCTP_AGE, 0)
++AC_SUBST(LIBWITHSCTP_CURRENT, 1)
++AC_SUBST(LIBWITHSCTP_REVISION, 18)
++AC_SUBST(LIBWITHSCTP_AGE, 0)
++
+ AC_CONFIG_AUX_DIR(bin)
+ AC_CONFIG_SRCDIR([src/apps/sctp_darn.c])
+ AC_CONFIG_HEADERS([config.h])
+diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
+index 6100c56..1d62175 100644
+--- a/src/lib/Makefile.am
++++ b/src/lib/Makefile.am
+@@ -8,5 +8,8 @@ AM_CPPFLAGS = -I$(top_srcdir)/src/include
+ 
+ lib_LTLIBRARIES = libsctp.la
+ 
+-libsctp_la_SOURCES = bindx.c connectx.c peeloff.c opt_info.c addrs.c sendmsg.c recvmsg.c Versions.map
+-libsctp_la_LDFLAGS = -version-info 1:17:0 -Wl,--version-script=$(srcdir)/Versions.map
++libsctp_la_SOURCES = bindx.c connectx.c peeloff.c opt_info.c \
++		addrs.c sendmsg.c recvmsg.c Versions.map
++libsctp_la_LDFLAGS = -version-info \
++		@LIBSCTP_CURRENT@:@LIBSCTP_REVISION@:@LIBSCTP_AGE@ \
++		-Wl,--version-script=$(srcdir)/Versions.map
+diff --git a/src/withsctp/Makefile.am b/src/withsctp/Makefile.am
+index 70b1cca..1f6ca37 100644
+--- a/src/withsctp/Makefile.am
++++ b/src/withsctp/Makefile.am
+@@ -14,7 +14,8 @@ AM_CPPFLAGS=-I$(top_srcdir)/src/include
+ pkglib_LTLIBRARIES = libwithsctp.la
+ libwithsctp_la_SOURCES = sctp_load_libs.c sctp_socket.c sctp_bind.c \
+ 	sctp_sockopt.c sctp_socket.h
+-libwithsctp_la_LDFLAGS = -version-info 1:17:0 -ldl
++libwithsctp_la_LDFLAGS = -version-info \
++	@LIBWITHSCTP_CURRENT@:@LIBWITHSCTP_REVISION@:@LIBWITHSCTP_AGE@ -ldl
+ 
+ pkgdoc_DATA = sctp_load_libs.c sctp_socket.c sctp_bind.c \
+ 	sctp_sockopt.c sctp_socket.h checksctp.c
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-withsctp-use-PACKAGE_VERSION-in-withsctp.h.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-withsctp-use-PACKAGE_VERSION-in-withsctp.h.patch
new file mode 100644
index 0000000..2537bb9
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-withsctp-use-PACKAGE_VERSION-in-withsctp.h.patch
@@ -0,0 +1,43 @@
+From 7c0ef4d441b3833e721df58f56e2cb8c81b34df4 Mon Sep 17 00:00:00 2001
+From: Xin Long <lucien.xin@gmail.com>
+Date: Thu, 16 Aug 2018 14:12:01 +0800
+Subject: [PATCH] withsctp: use @PACKAGE_VERSION@ in withsctp.h
+
+use @PACKAGE_VERSION@ to replace the hardcode version.
+
+Signed-off-by: Xin Long <lucien.xin@gmail.com>
+Acked-by: Neil Horman <nhorman@tuxdriver.com>
+Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+---
+ Makefile.rules           | 3 ++-
+ src/withsctp/withsctp.in | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.rules b/Makefile.rules
+index 83f5f0c..d3693fa 100644
+--- a/Makefile.rules
++++ b/Makefile.rules
+@@ -15,4 +15,5 @@
+ edit = @sed \
+ 	-e "s|\@bindir\@|$(bindir)|" \
+ 	-e "s|\@libdir\@|$(libdir)|" \
+-	-e "s|\@PACKAGE\@|$(PACKAGE)|"
++	-e "s|\@PACKAGE\@|$(PACKAGE)|" \
++	-e "s|\@PACKAGE_VERSION\@|$(PACKAGE_VERSION)|"
+diff --git a/src/withsctp/withsctp.in b/src/withsctp/withsctp.in
+index 7f182ba..fda5ebc 100644
+--- a/src/withsctp/withsctp.in
++++ b/src/withsctp/withsctp.in
+@@ -2,7 +2,8 @@
+ # -*- sh -*-
+ LIBDIR=@libdir@/@PACKAGE@
+ BINDIR=@bindir@
+-export LD_PRELOAD=${LIBDIR}/libwithsctp.so.1.0.17
++LIBVER=@PACKAGE_VERSION@
++export LD_PRELOAD=${LIBDIR}/libwithsctp.so.${LIBVER}
+ if ! ${BINDIR}/checksctp 2> /dev/null
+ then
+     ${BINDIR}/checksctp;
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
similarity index 72%
rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
index 121cc99..cc2f835 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
@@ -8,13 +8,19 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
 "
 
-SRCREV = "736b91d340e3f2519714f2930ed63b164d363511"
+SRCREV = "1b077af62d83d53c34b1bde8bad6648149d5edf9"
 
 PV .= "+git${SRCPV}"
-LK_REL = "1.0.17"
+LK_REL = "1.0.18"
 
 SRC_URI = " \
     git://github.com/sctp/lksctp-tools.git \
+    file://0001-withsctp-use-PACKAGE_VERSION-in-withsctp.h.patch \
+    file://0001-configure.ac-add-CURRENT-REVISION-and-AGE-for-libsct.patch \
+    file://0001-build-fix-netinet-sctp.h-not-to-be-installed.patch \
+    file://0001-build-remove-v4.12-secondary-defines-in-favor-of-HAV.patch \
+    file://0001-build-fix-probing-for-HAVE_SCTP_SENDV.patch \
+    file://0001-build-0b0dce7a36fb-actually-belongs-to-v4.19.patch \
     file://run-ptest \
     file://v4test.sh \
     file://v6test.sh \
@@ -24,7 +30,7 @@ S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
 
-inherit autotools pkgconfig binconfig ptest
+inherit autotools-brokensep pkgconfig binconfig ptest
 
 do_install_ptest () {
     install -m 0755 ${WORKDIR}/v4test.sh ${D}${PTEST_PATH}
-- 
2.7.4


