Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE73AE6B27B
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 06:11:11 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96104.1766470263714523370
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 22:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xoe/5kom;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766470263; x=1798006263;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BZS6/lxDIpO7jxJI+cDQ3yzJTSJujUYcpl+9Hf967m4=;
  b=Xoe/5kom2SEqUQXL2UsdUBB5dyJSudPep/e/vIF4otEqfHLIiHejs2FS
   HaKXdyqLucLphFd5JeqYw+b6vO7PHUX5X+6KKqbFlQp0aqoqs1L5yfINz
   ucGCaynaiRxwM3J4tbsVXh6tmLjvOWfq/NcLjj4cRWkFKiH4s1+HfLBRv
   BxxW9SiIzLx6uis/drjpKiMdH/iqmxBXFxmYnJlRAnG4M1c//uD8Cxdlh
   eZlzInWQbTfKmDv+M5TqwLsGlnLgb+blSufXv/NwEkkPP346RP4Fmowr0
   AxtQEip8DO/Ie3/hYzYYHccC7NavXYWOGURRMAyv9/gb9IJELYzXFNO4z
   g==;
X-CSE-ConnectionGUID: qh0a8qPSRYuqcs2Vg4kl0A==
X-CSE-MsgGUID: WS6lZkSzQlmuN6qgMZZf1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="212167710"
X-IronPort-AV: E=Sophos;i="6.21,170,1763391600"; 
   d="scan'208";a="212167710"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:11:02 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 089B482073B
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:02 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id B86EF1400601
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:01 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5A07610005B7
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:10:59 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH 2/7] net-snmp: upgrade 5.9.4 -> 5.9.5
Date: Tue, 23 Dec 2025 14:10:37 +0800
Message-ID: <20251223061043.659-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
References: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122818

1.Drop following patches as they were merged upstream.
  0001-Android-Fix-the-build.patch
  0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
  net-snmp-5.9.4-kernel-6.7.patch
  0008-net-snmp-fix-engineBoots-value-on-SIGHUP.patch
  0001-Fix-LDFLAGS-vs-LIBS-ordering.patch

2.Drop 0005-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch as compile error has been fixed.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../net-snmp/0001-Android-Fix-the-build.patch |  83 ------
 .../0001-Fix-LDFLAGS-vs-LIBS-ordering.patch   | 252 ------------------
 ....c-Don-t-check-for-return-from-EVP_M.patch |  37 ---
 ...snmp-fix-engineBoots-value-on-SIGHUP.patch |  46 ----
 ...onfiguration-of-NETSNMP_FD_MASK_TYPE.patch |  43 ---
 .../net-snmp/net-snmp-5.9.4-kernel-6.7.patch  | 123 ---------
 .../{net-snmp_5.9.4.bb => net-snmp_5.9.5.bb}  |   8 +-
 7 files changed, 1 insertion(+), 591 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Android-Fix-the-build.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-LDFLAGS-vs-LIBS-ordering.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0005-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0008-net-snmp-fix-engineBoots-value-on-SIGHUP.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.4.bb => net-snmp_5.9.5.bb} (96%)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Android-Fix-the-build.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Android-Fix-the-build.patch
deleted file mode 100644
index 097d9f83cd..0000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Android-Fix-the-build.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From b4598662a39ff6974119c900ea56a4d020eac366 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Wed, 20 Dec 2023 13:08:06 -0800
-Subject: [PATCH] Android: Fix the build
-
-Include <sys/select.h> for the fd_set type. In the configure script,
-check whether 'unsigned long' is the underlying type of fd_set. Use
-u_long instead of ulong.
-
-Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/b4598662a39ff6974119c900ea56a4d020eac366]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- agent/mibgroup/ip-mib/data_access/ipaddress_linux.c | 4 ++--
- configure                                           | 2 +-
- configure.d/config_project_types                    | 2 +-
- include/net-snmp/types.h                            | 3 +++
- 4 files changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
-index b38beb57dd..232202d0f9 100644
---- a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
-+++ b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
-@@ -50,7 +50,7 @@ int _load_v6(netsnmp_container *container, int idx_offset);
- int
- netsnmp_access_ipaddress_extra_prefix_info(int index,
-                                            u_long *preferedlt,
--                                           ulong *validlt,
-+                                           u_long *validlt,
-                                            char *addr);
- #endif
- 
-@@ -523,7 +523,7 @@ out:
- 
- int
- netsnmp_access_ipaddress_extra_prefix_info(int index, u_long *preferedlt,
--                                           ulong *validlt, char *addr)
-+                                           u_long *validlt, char *addr)
- {
- 
-     struct {
-diff --git a/configure b/configure
-index e7bf859bba..48abcbab11 100755
---- a/configure
-+++ b/configure
-@@ -31577,7 +31577,7 @@ CFLAGS="$CFLAGS -Werror"
- 
- { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for the type of fd_set::fds_bits" >&5
- printf %s "checking for the type of fd_set::fds_bits... " >&6; }
--for type in __fd_mask __int32_t long\ int unknown; do
-+for type in __fd_mask __int32_t long 'unsigned long' unknown; do
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- 
-diff --git a/configure.d/config_project_types b/configure.d/config_project_types
-index a78e8ebb06..ac958d6712 100644
---- a/configure.d/config_project_types
-+++ b/configure.d/config_project_types
-@@ -66,7 +66,7 @@ netsnmp_save_CFLAGS=$CFLAGS
- CFLAGS="$CFLAGS -Werror"
- 
- AC_MSG_CHECKING([for the type of fd_set::fds_bits])
--for type in __fd_mask __int32_t long\ int unknown; do
-+for type in __fd_mask __int32_t long 'unsigned long' unknown; do
-   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
- #include <sys/select.h>
- #include <stddef.h>
-diff --git a/include/net-snmp/types.h b/include/net-snmp/types.h
-index b78f53ffd7..6228170e5f 100644
---- a/include/net-snmp/types.h
-+++ b/include/net-snmp/types.h
-@@ -23,6 +23,9 @@
- #endif
- 
- #include <sys/types.h>
-+#ifdef __ANDROID__
-+#include <sys/select.h>
-+#endif
- 
- #if defined(WIN32) && !defined(cygwin)
- typedef HANDLE netsnmp_pid_t;
--- 
-2.44.0
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-LDFLAGS-vs-LIBS-ordering.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-LDFLAGS-vs-LIBS-ordering.patch
deleted file mode 100644
index 51a63538e4..0000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-LDFLAGS-vs-LIBS-ordering.patch
+++ /dev/null
@@ -1,252 +0,0 @@
-From 10883d754750865e42327826ee90d7eda3741dda Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Fri, 2 Dec 2022 02:26:29 +0000
-Subject: [PATCH] Fix LDFLAGS vs LIBS ordering
-
-LDFLAGS must come before both LIBS & any listed objects in order
-for certain valid LDFLAGS, like '-Wl,--as-needed' to work correctly
-(otherwise it'll either take no effect or discard libraries when
-they're needed).
-
-Gentoo has been carrying this patch for a while.
-
-Signed-off-by: Sam James <sam@gentoo.org>
-Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/72b47b9b41d2640ed4810297f2e26f5eb9d2fa31]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- Makefile.top                 |  4 ++--
- agent/Makefile.in            | 16 ++++++-------
- agent/helpers/Makefile.in    |  2 +-
- apps/Makefile.in             | 46 ++++++++++++++++++------------------
- apps/snmpnetstat/Makefile.in |  2 +-
- snmplib/Makefile.in          |  4 ++--
- testing/Makefile.in          |  8 +++----
- 7 files changed, 41 insertions(+), 41 deletions(-)
-
-diff --git a/Makefile.top b/Makefile.top
-index 53e0392..5de5648 100644
---- a/Makefile.top
-+++ b/Makefile.top
-@@ -86,11 +86,11 @@ LIBCURRENT  = 42
- LIBAGE      = 2
- LIBREVISION = 1
- 
--LIB_LD_CMD      = $(LIBTOOL) --mode=link $(LINKCC) $(CFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) @LD_NO_UNDEFINED@ -o
-+LIB_LD_CMD      = $(LIBTOOL) --mode=link $(LINKCC) $(CFLAGS) $(LDFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) @LD_NO_UNDEFINED@ -o
- LIB_EXTENSION   = la
- LIB_VERSION     =
- LIB_LDCONFIG_CMD = echo "do not ldconfig\n"
--LINK		= $(LIBTOOL) --mode=link $(LINKCC)
-+LINK		= $(LIBTOOL) --mode=link $(LINKCC) $(LDFLAGS)
- # RANLIB 	= @RANLIB@
- RANLIB		= :
- 
-diff --git a/agent/Makefile.in b/agent/Makefile.in
-index 44f8818..6008eb8 100644
---- a/agent/Makefile.in
-+++ b/agent/Makefile.in
-@@ -288,26 +288,26 @@ all: agentlib subdirs miblib $(INSTALLBINPROGS) $(INSTALLSBINPROGS)
- # build stuff targets
- #
- getkstat: getkstat.o
--	$(CC) $(CFLAGS) -o $@ $? $(LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $? $(LIBS)
- 
- getkstat.o: mibgroup/kernel_sunos5.c
--	$(CC) $(CFLAGS) -o $@ -D_GETKSTAT_TEST -DDODEBUG -c $? 
-+	$(CC) $(CFLAGS) -o $@ -D_GETKSTAT_TEST -DDODEBUG -c $?
- 
- getmibstat: getmibstat.o
--	$(CC) $(CFLAGS) -o $@ $? $(LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $? $(LIBS)
- 
- getmibstat.o: mibgroup/kernel_sunos5.c
--	$(CC) $(CFLAGS) -o $@ -D_GETMIBSTAT_TEST -DDODEBUG -c $? 
-+	$(CC) $(CFLAGS) -o $@ -D_GETMIBSTAT_TEST -DDODEBUG -c $?
- 
--snmpd$(EXEEXT):	${LAGENTOBJS} $(USELIBS) $(AGENTLIB) $(HELPERLIB) $(MIBLIB) $(LIBTARG) 
--	$(LINK) $(CFLAGS) -o $@ ${LAGENTOBJS} ${LDFLAGS} ${OUR_AGENT_LIBS}
-+snmpd$(EXEEXT):	${LAGENTOBJS} $(USELIBS) $(AGENTLIB) $(HELPERLIB) $(MIBLIB) $(LIBTARG)
-+	$(LINK) $(CFLAGS) $(LDFLAGS) -o $@ ${LAGENTOBJS} ${OUR_AGENT_LIBS}
- 
- libnetsnmpagent.$(LIB_EXTENSION)$(LIB_VERSION):    ${LLIBAGENTOBJS} $(USELIBS)
--	$(LIB_LD_CMD) $(AGENTLIB) ${LLIBAGENTOBJS} $(USELIBS) ${LAGENTLIBS} $(LDFLAGS) $(PERLLDOPTS_FOR_LIBS) @AGENTLIBS@
-+	$(LIB_LD_CMD) $(AGENTLIB) $(LDFLAGS) ${LLIBAGENTOBJS} $(USELIBS) ${LAGENTLIBS} $(PERLLDOPTS_FOR_LIBS) @AGENTLIBS@
- 	$(RANLIB) $(AGENTLIB)
- 
- libnetsnmpmibs.$(LIB_EXTENSION)$(LIB_VERSION): ${LMIBOBJS} $(AGENTLIB) $(USELIBS) subdirs
--	$(LIB_LD_CMD) $(MIBLIB) ${LMIBOBJS} $(AGENTLIB) $(USELIBS) $(LDFLAGS) ${LMIBLIBS} $(PERLLDOPTS_FOR_LIBS) @AGENTLIBS@
-+	$(LIB_LD_CMD) $(MIBLIB) $(LDFLAGS) ${LMIBOBJS} $(AGENTLIB) $(USELIBS) ${LMIBLIBS} $(PERLLDOPTS_FOR_LIBS) @AGENTLIBS@
- 	$(RANLIB) $(MIBLIB)
- 
- agentlib: $(AGENTLIB)
-diff --git a/agent/helpers/Makefile.in b/agent/helpers/Makefile.in
-index 51f409d..05a9adc 100644
---- a/agent/helpers/Makefile.in
-+++ b/agent/helpers/Makefile.in
-@@ -32,5 +32,5 @@ LOBJS = dummy.lo
- all: standardall
- 
- libnetsnmphelpers.$(LIB_EXTENSION)$(LIB_VERSION):    $(LOBJS)
--	$(LIB_LD_CMD) $@ $(LOBJS) $(LDFLAGS)
-+	$(LIB_LD_CMD) $@ $(LDFLAGS) $(LOBJS)
- 	$(RANLIB) $@
-diff --git a/apps/Makefile.in b/apps/Makefile.in
-index 57b8524..b5b26f9 100644
---- a/apps/Makefile.in
-+++ b/apps/Makefile.in
-@@ -161,37 +161,37 @@ OTHERUNINSTALL=snmpinformuninstall snmptrapdperluninstall	\
- # build rules
- #
- snmpwalk$(EXEEXT):    snmpwalk.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpwalk.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpwalk.$(OSUFFIX) ${LIBS}
- 
- snmpbulkwalk$(EXEEXT):    snmpbulkwalk.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpbulkwalk.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpbulkwalk.$(OSUFFIX) ${LIBS}
- 
- snmpbulkget$(EXEEXT):    snmpbulkget.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpbulkget.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpbulkget.$(OSUFFIX) ${LIBS}
- 
- snmptranslate$(EXEEXT):    snmptranslate.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmptranslate.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmptranslate.$(OSUFFIX) ${LIBS}
- 
- snmpstatus$(EXEEXT):    snmpstatus.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpstatus.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpstatus.$(OSUFFIX) ${LIBS}
- 
- snmpget$(EXEEXT):    snmpget.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpget.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpget.$(OSUFFIX) ${LIBS}
- 
- snmpdelta$(EXEEXT):    snmpdelta.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpdelta.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpdelta.$(OSUFFIX) ${LIBS}
- 
- snmptable$(EXEEXT):    snmptable.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmptable.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmptable.$(OSUFFIX) ${LIBS}
- 
- snmptest$(EXEEXT):    snmptest.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmptest.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmptest.$(OSUFFIX) ${LIBS}
- 
- snmptrapd$(EXEEXT):    $(TRAPD_OBJECTS) $(USETRAPLIBS) $(INSTALLLIBS)
--	$(LINK) ${CFLAGS} -o $@ $(TRAPD_OBJECTS) $(INSTALLLIBS) ${LDFLAGS} ${TRAPLIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ $(TRAPD_OBJECTS) $(INSTALLLIBS) ${TRAPLIBS}
- 
- snmptrap$(EXEEXT):    snmptrap.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmptrap.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmptrap.$(OSUFFIX) ${LIBS}
- 
- snmpinform$(EXEEXT): snmptrap$(EXEEXT)
- 	rm -f snmpinform
-@@ -202,40 +202,40 @@ snmptop$(EXEEXT): snmpps$(EXEEXT)
- 	$(LN_S) snmpps$(EXEEXT) snmptop$(EXEEXT)
- 
- snmpset$(EXEEXT):    snmpset.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpset.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpset.$(OSUFFIX) ${LIBS}
- 
- snmpusm$(EXEEXT):    snmpusm.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpusm.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpusm.$(OSUFFIX) ${LIBS}
- 
- snmpvacm$(EXEEXT):    snmpvacm.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpvacm.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpvacm.$(OSUFFIX) ${LIBS}
- 
- snmptls$(EXEEXT):    snmptls.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmptls.$(OSUFFIX) ${LDFLAGS} ${LIBS} 
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmptls.$(OSUFFIX) ${LIBS}
- 
- agentxtrap$(EXEEXT):    agentxtrap.$(OSUFFIX) $(USEAGENTLIBS)
--	$(LINK) ${CFLAGS} -o $@ agentxtrap.$(OSUFFIX) ${LDFLAGS} $(USEAGENTLIBS) $(PERLLDOPTS_FOR_APPS) ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ agentxtrap.$(OSUFFIX) $(USEAGENTLIBS) $(PERLLDOPTS_FOR_APPS) ${LIBS}
- 
- snmpgetnext$(EXEEXT):    snmpgetnext.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpgetnext.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpgetnext.$(OSUFFIX) ${LIBS}
- 
- encode_keychange$(EXEEXT):    encode_keychange.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ encode_keychange.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ encode_keychange.$(OSUFFIX) ${LIBS}
- 
- snmpdf$(EXEEXT):    snmpdf.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpdf.$(OSUFFIX) ${LDFLAGS} ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpdf.$(OSUFFIX) ${LIBS}
- 
- snmpps$(EXEEXT):    snmpps.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpps.$(OSUFFIX) ${LDFLAGS} @LIBCURSES@ ${LIBS}
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpps.$(OSUFFIX) @LIBCURSES@ ${LIBS}
- 
- snmpping$(EXEEXT):    snmpping.$(OSUFFIX) $(USELIBS)
--	$(LINK) ${CFLAGS} -o $@ snmpping.$(OSUFFIX) ${LDFLAGS} ${LIBS} -lm
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpping.$(OSUFFIX) ${LIBS} -lm
- 
- snmppcap$(EXEEXT):    snmppcap.$(OSUFFIX) $(USEAGENTLIBS)
--	$(LINK) ${CFLAGS} -o $@ snmppcap.$(OSUFFIX) ${LDFLAGS} ${USEAGENTLIBS} ${LIBS} -lpcap
-+	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmppcap.$(OSUFFIX) ${USEAGENTLIBS} ${LIBS} -lpcap
- 
- libnetsnmptrapd.$(LIB_EXTENSION)$(LIB_VERSION): $(LLIBTRAPD_OBJS)
--	$(LIB_LD_CMD) $@ ${LLIBTRAPD_OBJS} $(MIBLIB) $(MYSQL_LIBS) $(USELIBS) $(PERLLDOPTS_FOR_LIBS) $(LDFLAGS)
-+	$(LIB_LD_CMD) $@ $(LDFLAGS) ${LLIBTRAPD_OBJS} $(MIBLIB) $(MYSQL_LIBS) $(USELIBS) $(PERLLDOPTS_FOR_LIBS)
- 	$(RANLIB) $@
- 
- snmpinforminstall:
-diff --git a/apps/snmpnetstat/Makefile.in b/apps/snmpnetstat/Makefile.in
-index dfb566d..8a8cb21 100644
---- a/apps/snmpnetstat/Makefile.in
-+++ b/apps/snmpnetstat/Makefile.in
-@@ -34,4 +34,4 @@ LIBS=	 ../../snmplib/libnetsnmp.$(LIB_EXTENSION)$(LIB_VERSION) $(VAL_LIBS) @LIBS
- all: standardall
- 
- snmpnetstat$(EXEEXT): ${LOBJS} ${USELIBS}
--	${LINK} ${CFLAGS} -o $@ ${LOBJS} ${LOCAL_LIBS} ${LDFLAGS} ${LIBS}
-+	${LINK} ${CFLAGS} ${LDFLAGS} -o $@ ${LOBJS} ${LOCAL_LIBS} ${LIBS}
-diff --git a/snmplib/Makefile.in b/snmplib/Makefile.in
-index ecbfc4d..1501636 100644
---- a/snmplib/Makefile.in
-+++ b/snmplib/Makefile.in
-@@ -230,11 +230,11 @@ all: standardall
- 
- # how to build the libraries.
- libnetsnmp.$(LIB_EXTENSION)$(LIB_VERSION):    $(TOBJS)
--	$(LIB_LD_CMD) $@ $(TOBJS) $(LDFLAGS) @LNETSNMPLIBS@
-+	$(LIB_LD_CMD) $@ $(LDFLAGS) $(TOBJS) @LNETSNMPLIBS@
- 	$(RANLIB) $@
- 
- libsnmp.$(LIB_EXTENSION)$(LIB_VERSION):    $(TOBJS)
--	$(LIB_LD_CMD) $@ $(TOBJS) $(LDFLAGS) @LNETSNMPLIBS@
-+	$(LIB_LD_CMD) $@ $(LDFLAGS) $(TOBJS) @LNETSNMPLIBS@
- 	$(RANLIB) $@
- 
- #
-diff --git a/testing/Makefile.in b/testing/Makefile.in
-index 79d069d..a6d920e 100644
---- a/testing/Makefile.in
-+++ b/testing/Makefile.in
-@@ -61,16 +61,16 @@ test-mibs:
- 	cd $(srcdir)/rfc1213 ; ./run
- 
- etest:    etimetest.o $(PARSEOBJS) $(USELIBS)
--	${CC} -o $@ etimetest.o $(PARSEOBJS) ${LDFLAGS} ${LIBS} 
-+	${CC} ${LDFLAGS} -o $@ etimetest.o $(PARSEOBJS) ${LIBS}
- 
- ktest:    keymanagetest.o $(PARSEOBJS) $(USELIBS)
--	${CC} -o $@ keymanagetest.o $(PARSEOBJS) ${LDFLAGS} ${LIBS} 
-+	${CC} ${LDFLAGS} -o $@ keymanagetest.o $(PARSEOBJS) ${LIBS}
- 
- misctest:    misctest.o $(PARSEOBJS) $(USELIBS)
--	${CC} -o $@ misctest.o $(PARSEOBJS) ${LDFLAGS} ${LIBS} 
-+	${CC} ${LDFLAGS} -o $@ misctest.o $(PARSEOBJS) ${LIBS}
- 
- stest:    scapitest.o $(PARSEOBJS) $(USELIBS)
--	${CC} -o $@ scapitest.o $(PARSEOBJS) ${LDFLAGS} ${LIBS} 
-+	${CC} ${LDFLAGS} -o $@ scapitest.o $(PARSEOBJS) ${LIBS}
- 
- clean: testclean
- 	rm -f *.o core *.core $(TARG)
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0005-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0005-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
deleted file mode 100644
index 7a6b35460e..0000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0005-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c790411f9aa82064fea9bbf23b499fb6b7f22c4f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 18 Sep 2015 00:28:45 -0400
-Subject: [PATCH] snmplib/keytools.c: Don't check for return from
- EVP_MD_CTX_init()
-
-EVP_MD_CTX_init() API returns void, it fixes errors with new compilers
-
-snmplib/keytools.c: In function 'generate_Ku': error: invalid use of void expression
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- snmplib/keytools.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/snmplib/keytools.c b/snmplib/keytools.c
-index 388e655..5a66898 100644
---- a/snmplib/keytools.c
-+++ b/snmplib/keytools.c
-@@ -183,10 +183,7 @@ generate_Ku(const oid * hashtype, u_int hashtype_len,
-     ctx = EVP_MD_CTX_create();
- #else
-     ctx = malloc(sizeof(*ctx));
--    if (!EVP_MD_CTX_init(ctx)) {
--        rval = SNMPERR_GENERR;
--        goto generate_Ku_quit;
--    }
-+    EVP_MD_CTX_init(ctx);
- #endif
-     if (!EVP_DigestInit(ctx, hashfn)) {
-         rval = SNMPERR_GENERR;
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0008-net-snmp-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0008-net-snmp-fix-engineBoots-value-on-SIGHUP.patch
deleted file mode 100644
index a57c4c8f14..0000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0008-net-snmp-fix-engineBoots-value-on-SIGHUP.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b5cbe0953a7e7a3c77c7ec69dfe81254475f08c0 Mon Sep 17 00:00:00 2001
-From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
-Date: Wed, 9 Jun 2021 15:47:30 +0900
-Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP
-
-Upstream-Status: Pending
-
-Signed-off-by: Marian Florea <marian.florea@windriver.com>
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- agent/snmpd.c    | 1 +
- snmplib/snmpv3.c | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/agent/snmpd.c b/agent/snmpd.c
-index fe31c87..d9f68dd 100644
---- a/agent/snmpd.c
-+++ b/agent/snmpd.c
-@@ -1169,6 +1169,7 @@ snmpd_reconfig(void)
-     snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
-              netsnmp_get_version());
-     update_config();
-+    snmp_store(app_name);
-     send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
- #ifdef HAVE_SIGPROCMASK
-     ret = sigprocmask(SIG_UNBLOCK, &set, NULL);
-diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c
-index be9256f..d17d2e3 100644
---- a/snmplib/snmpv3.c
-+++ b/snmplib/snmpv3.c
-@@ -1071,9 +1071,9 @@ init_snmpv3_post_config(int majorid, int minorid, void *serverarg,
-     /*
-      * if our engineID has changed at all, the boots record must be set to 1 
-      */
--    if (engineIDLen != oldEngineIDLength ||
-+    if (oldEngineIDLength != (size_t)0 && (engineIDLen != oldEngineIDLength ||
-         oldEngineID == NULL || c_engineID == NULL ||
--        memcmp(oldEngineID, c_engineID, engineIDLen) != 0) {
-+        memcmp(oldEngineID, c_engineID, engineIDLen) != 0)) {
-         engineBoots = 1;
-     }
- 
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
deleted file mode 100644
index 9d4b769930..0000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 21ea0b9ce5cc9445f7ffd7a9020b816681e16284 Mon Sep 17 00:00:00 2001
-From: Adam Gajda <adgajda@users.noreply.github.com>
-Date: Mon, 2 Oct 2023 16:40:31 +0200
-Subject: [PATCH] Fix configuration of NETSNMP_FD_MASK_TYPE
-
-Upstream-Status: Backport
-[https://github.com/net-snmp/net-snmp/commit/af1b7f77975bbb2fcbdb3f005f8cb010d1d33cd3]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- configure                        | 2 +-
- configure.d/config_project_types | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 907d441..f4468c6 100755
---- a/configure
-+++ b/configure
-@@ -31638,7 +31638,7 @@ CFLAGS="$CFLAGS -Werror"
- 
- { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for the type of fd_set::fds_bits" >&5
- printf %s "checking for the type of fd_set::fds_bits... " >&6; }
--for type in __fd_mask __int32_t unknown; do
-+for type in __fd_mask __int32_t long\ int unknown; do
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- 
-diff --git a/configure.d/config_project_types b/configure.d/config_project_types
-index 1b4c66b..a78e8eb 100644
---- a/configure.d/config_project_types
-+++ b/configure.d/config_project_types
-@@ -66,7 +66,7 @@ netsnmp_save_CFLAGS=$CFLAGS
- CFLAGS="$CFLAGS -Werror"
- 
- AC_MSG_CHECKING([for the type of fd_set::fds_bits])
--for type in __fd_mask __int32_t unknown; do
-+for type in __fd_mask __int32_t long\ int unknown; do
-   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
- #include <sys/select.h>
- #include <stddef.h>
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
deleted file mode 100644
index 9111ed8ae2..0000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From f5ae6baf0018abda9dedc368fe6d52c0d7a8ab8f Mon Sep 17 00:00:00 2001
-From: Philippe Troin <phil+github-commits@fifi.org>
-Date: Sat, 3 Feb 2024 10:30:30 -0800
-Subject: [PATCH] Add Linux 6.7 compatibility parsing /proc/net/snmp
-
-Linux 6.7 adds a new OutTransmits field to Ip in /proc/net/snmp.
-This breaks the hard-coded assumptions about the Ip line length.
-Add compatibility to parse Linux 6.7 Ip header while keep support
-for previous versions.
-
-Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b4425dab0982c]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../ip-mib/data_access/systemstats_linux.c    | 46 +++++++++++++++----
- 1 file changed, 37 insertions(+), 9 deletions(-)
-
-diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
-index 49e0a34d5c..f04e828a94 100644
---- a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
-+++ b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
-@@ -36,7 +36,7 @@ netsnmp_access_systemstats_arch_init(void)
- }
- 
- /*
--  /proc/net/snmp
-+  /proc/net/snmp - Linux 6.6 and lower
- 
-   Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscards OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails FragCreates
-   Ip: 2 64 7083534 0 0 0 0 0 6860233 6548963 0 0 1 286623 63322 1 259920 0 0
-@@ -49,6 +49,26 @@ netsnmp_access_systemstats_arch_init(void)
-   
-   Udp: InDatagrams NoPorts InErrors OutDatagrams
-   Udp: 1491094 122 0 1466178
-+*
-+  /proc/net/snmp - Linux 6.7 and higher
-+
-+  Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscards OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails FragCreates OutTransmits
-+  Ip: 1 64 50859058 496 0 37470604 0 0 20472980 7515791 1756 0 0 7264 3632 0 3548 0 7096 44961424
-+
-+  Icmp: InMsgs InErrors InCsumErrors InDestUnreachs InTimeExcds InParmProbs InSrcQuenchs InRedirects InEchos InEchoReps InTimestamps InTimestampReps InAddrMasks InAddrMaskReps OutMsgs OutErrors OutRateLimitGlobal OutRateLimitHost OutDestUnreachs OutTimeExcds OutParmProbs OutSrcQuenchs OutRedirects OutEchos OutEchoReps OutTimestamps OutTimestampReps OutAddrMasks OutAddrMaskReps
-+  Icmp: 114447 2655 0 17589 0 0 0 0 66905 29953 0 0 0 0 143956 0 0 572 16610 484 0 0 0 59957 66905 0 0 0 0
-+
-+  IcmpMsg: InType0 InType3 InType8 OutType0 OutType3 OutType8 OutType11
-+  IcmpMsg: 29953 17589 66905 66905 16610 59957 484
-+
-+  Tcp: RtoAlgorithm RtoMin RtoMax MaxConn ActiveOpens PassiveOpens AttemptFails EstabResets CurrEstab InSegs OutSegs RetransSegs InErrs OutRsts InCsumErrors
-+  Tcp: 1 200 120000 -1 17744 13525 307 3783 6 18093137 9277788 3499 8 7442 0
-+
-+  Udp: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors SndbufErrors InCsumErrors IgnoredMulti MemErrors
-+  Udp: 2257832 1422 0 2252835 0 0 0 84 0
-+
-+  UdpLite: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors SndbufErrors InCsumErrors IgnoredMulti MemErrors
-+  UdpLite: 0 0 0 0 0 0 0 0 0
- */
- 
- 
-@@ -101,10 +121,10 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
-     FILE           *devin;
-     char            line[1024];
-     netsnmp_systemstats_entry *entry = NULL;
--    int             scan_count;
-+    int             scan_count, expected_scan_count;
-     char           *stats, *start = line;
-     int             len;
--    unsigned long long scan_vals[19];
-+    unsigned long long scan_vals[20];
- 
-     DEBUGMSGTL(("access:systemstats:container:arch", "load v4 (flags %x)\n",
-                 load_flags));
-@@ -126,10 +146,17 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
-      */
-     NETSNMP_IGNORE_RESULT(fgets(line, sizeof(line), devin));
-     len = strlen(line);
--    if (224 != len) {
-+    switch (len) {
-+    case 224:
-+	expected_scan_count = 19;
-+	break;
-+    case 237:
-+	expected_scan_count = 20;
-+	break;
-+    default:
-         fclose(devin);
-         snmp_log(LOG_ERR, "systemstats_linux: unexpected header length in /proc/net/snmp."
--                 " %d != 224\n", len);
-+                 " %d not in { 224, 237 } \n", len);
-         return -4;
-     }
- 
-@@ -178,20 +205,20 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
-         memset(scan_vals, 0x0, sizeof(scan_vals));
-         scan_count = sscanf(stats,
-                             "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu"
--                            "%llu %llu %llu %llu %llu %llu %llu %llu %llu",
-+                            "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu",
-                             &scan_vals[0],&scan_vals[1],&scan_vals[2],
-                             &scan_vals[3],&scan_vals[4],&scan_vals[5],
-                             &scan_vals[6],&scan_vals[7],&scan_vals[8],
-                             &scan_vals[9],&scan_vals[10],&scan_vals[11],
-                             &scan_vals[12],&scan_vals[13],&scan_vals[14],
-                             &scan_vals[15],&scan_vals[16],&scan_vals[17],
--                            &scan_vals[18]);
-+                            &scan_vals[18],&scan_vals[19]);
-         DEBUGMSGTL(("access:systemstats", "  read %d values\n", scan_count));
- 
--        if(scan_count != 19) {
-+        if(scan_count != expected_scan_count) {
-             snmp_log(LOG_ERR,
-                      "error scanning systemstats data (expected %d, got %d)\n",
--                     19, scan_count);
-+                     expected_scan_count, scan_count);
-             netsnmp_access_systemstats_entry_free(entry);
-             return -4;
-         }
-@@ -223,6 +250,7 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
-         entry->stats.HCOutFragFails.high = scan_vals[17] >> 32;
-         entry->stats.HCOutFragCreates.low = scan_vals[18] & 0xffffffff;
-         entry->stats.HCOutFragCreates.high = scan_vals[18] >> 32;
-+        /* entry->stats. = scan_vals[19]; / * OutTransmits */
- 
-         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_HCINRECEIVES] = 1;
-         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_INHDRERRORS] = 1;
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.bb
similarity index 96%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.bb
index 44a3cfc745..f4108d9715 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.bb
@@ -19,20 +19,14 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://0002-net-snmp-fix-libtool-finish.patch \
            file://0003-testing-add-the-output-format-for-ptest.patch \
            file://0004-config_os_headers-Error-Fix.patch \
-           file://0005-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
            file://0006-get_pid_from_inode-Include-limit.h.patch \
            file://0007-configure-fix-incorrect-variable.patch \
-           file://0008-net-snmp-fix-engineBoots-value-on-SIGHUP.patch \
            file://0009-net-snmp-fix-for-disable-des.patch \
            file://0010-net-snmp-Reproducibility-Don-t-check-build-host-for.patch \
            file://0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch \
-           file://0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch \
-           file://0001-Android-Fix-the-build.patch \
            file://netsnmp-swinst-crash.patch \
-           file://net-snmp-5.9.4-kernel-6.7.patch \
-           file://0001-Fix-LDFLAGS-vs-LIBS-ordering.patch \
            "
-SRC_URI[sha256sum] = "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544"
+SRC_URI[sha256sum] = "07f94f06a8d681485e43eeec4f190d9bea43e1b335146d0de466b6de3f3f4c5a"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
 UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
-- 
2.43.0


