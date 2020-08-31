Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.57071.1598890480031031982
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 09:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07VGEIFk022142
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 09:14:29 -0700
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 31 Aug 2020
 09:14:08 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] net-snmp: upgrade 5.8 -> 5.9
Date: Mon, 31 Aug 2020 19:14:01 +0300
Message-ID: <20200831161401.25715-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Upgrade net-snmp 5.8 -> 5.9:
* refresh patches
* drop backports:
  https://github.com/net-snmp/net-snmp/commit/5f881d3bf24599b90d67a45cae7a3eb099cd71c9
  https://github.com/net-snmp/net-snmp/commit/6e1329bde834e0edcfadb88d3c05e6015e945638
  https://github.com/net-snmp/net-snmp/commit/abdcb6af8df352a257a7092c1649471af1e4e97b
  https://github.com/net-snmp/net-snmp/commit/21260fdd60c172839f997fb6f888a6e21c6825eb

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 ...upport-for-building-applications-and.patch | 168 ------------------
 .../0001-config_os_headers-Error-Fix.patch    |  10 +-
 ...1-get_pid_from_inode-Include-limit.h.patch |   2 +-
 ...t-snmp-fix-compile-error-disable-des.patch |  62 -------
 ....c-Don-t-check-for-return-from-EVP_M.patch |  21 ++-
 .../0002-configure-fix-a-cc-check-issue.patch |   4 +-
 ...004-configure-fix-incorrect-variable.patch |   8 +-
 .../net-snmp/net-snmp/CVE-2019-20892.patch    | 120 -------------
 .../net-snmp/fix-libtool-finish.patch         |   4 +-
 ....7.2-fix-engineBoots-value-on-SIGHUP.patch |  10 +-
 ...add-knob-whether-nlist.h-are-checked.patch |  16 +-
 .../net-snmp-fix-for-disable-des.patch        |   6 +-
 ...ting-add-the-output-format-for-ptest.patch |   2 +-
 ...ty-accept-configure-options-from-env.patch |  15 --
 .../reproducibility-have-printcap.patch       |  17 +-
 .../{net-snmp_5.8.bb => net-snmp_5.9.bb}      |   7 +-
 16 files changed, 56 insertions(+), 416 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-accept-configure-options-from-env.patch
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.8.bb => net-snmp_5.9.bb} (96%)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch
deleted file mode 100644
index dd159b9ce..000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch
+++ /dev/null
@@ -1,168 +0,0 @@
-From 4bf83597379523032663c8e95b3786a217c9a849 Mon Sep 17 00:00:00 2001
-From: Hugh McMaster <hugh.mcmaster@outlook.com>
-Date: Wed, 3 Apr 2019 21:36:03 +1100
-Subject: [PATCH] Add pkg-config support for building applications and
- sub-agents
-
-The netsnmp package should be used when building Net-SNMP applications.
-The netsnmp-agent package should be used when building Net-SNMP subagents.
-
-Signed-off-by: Hugh McMaster <hugh.mcmaster@outlook.com>
-[ bvanassche: edited makefile code and .pc files; added ./configure changes ]
-
-Upstream-Status: Backport
-https://sourceforge.net/p/net-snmp/patches/_discuss/thread/a0d66e91dd/f940/attachment/0001-Add-pkg-config-support-for-building-applications-and.patch
----
- Makefile.in         |  2 ++
- Makefile.rules      | 30 ++++++++++++++++++++++++++----
- configure           |  4 ++++
- configure.ac        |  1 +
- netsnmp-agent.pc.in | 12 ++++++++++++
- netsnmp.pc.in       | 12 ++++++++++++
- 6 files changed, 57 insertions(+), 4 deletions(-)
- create mode 100644 netsnmp-agent.pc.in
- create mode 100644 netsnmp.pc.in
-
-diff --git a/Makefile.in b/Makefile.in
-index 9dbdde1353..ec972636c2 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -35,6 +35,7 @@ INSTALLBUILTHEADERS=include/net-snmp/net-snmp-config.h
- INSTALLBUILTINCLUDEHEADERS=@FEATUREHEADERS@
- INSTALLBINSCRIPTS=net-snmp-config net-snmp-create-v3-user
- INSTALLUCDHEADERS=ucd-snmp-config.h version.h mib_module_config.h
-+INSTALL_PKGCONFIG=netsnmp.pc netsnmp-agent.pc
- 
- #
- # other install rules.
-@@ -275,6 +276,7 @@ configclean: makefileclean
- 		libtool include/net-snmp/net-snmp-config.h \
- 		net-snmp-config net-snmp-config-x configure-summary \
- 		net-snmp-create-v3-user net-snmp-create-v3-user-x
-+	rm -f *.pc
- 	rm -f mibs/.index
- 	rm -f include/net-snmp/agent/mib_module_config.h		\
- 		include/net-snmp/agent/agent_module_config.h		\
-diff --git a/Makefile.rules b/Makefile.rules
-index 9e9e9009e5..e714f91e72 100644
---- a/Makefile.rules
-+++ b/Makefile.rules
-@@ -85,12 +85,14 @@ subdirs:
- # installlibs handles local, ucd and subdir libs. need to do subdir libs
- # before bins, sinze those libs may be needed for successful linking
- install: installlocalheaders @installucdheaders@ \
--         installlibs \
--         installlocalbin      installlocalsbin   \
-+         installlibs         install_pkgconfig   \
-+         installlocalbin     installlocalsbin    \
-          installsubdirs      $(OTHERINSTALL)
- 
--uninstall: uninstalllibs uninstallbin uninstallsbin uninstallheaders \
--           uninstallsubdirs $(OTHERUNINSTALL)
-+uninstall: uninstalllibs     uninstall_pkgconfig \
-+           uninstallbin      uninstallsbin       \
-+           uninstallheaders                      \
-+           uninstallsubdirs  $(OTHERUNINSTALL)
- 
- installprogs: installbin installsbin
- 
-@@ -287,6 +289,26 @@ uninstalllibs:
- 		done \
- 	fi
- 
-+#
-+# pkg-config files
-+#
-+install_pkgconfig: $(INSTALL_PKGCONFIG)
-+	@if test "x$(INSTALL_PKGCONFIG)" != x; then			\
-+		$(SHELL) $(top_srcdir)/mkinstalldirs $(INSTALL_PREFIX)$(libdir)/pkgconfig; \
-+		for i in $(INSTALL_PKGCONFIG); do			\
-+			echo "installing $$i in $(INSTALL_PREFIX)$(libdir)/pkgconfig"; \
-+		done;							\
-+		$(INSTALL) $(INSTALL_PKGCONFIG) $(INSTALL_PREFIX)$(libdir)/pkgconfig; \
-+	fi
-+
-+uninstall_pkgconfig:
-+	@if test "x$(INSTALL_PKGCONFIG)" != x; then			\
-+		for i in $(INSTALL_PKGCONFIG); do			\
-+			echo "removing $$i from $(INSTALL_PREFIX)$(libdir)/pkgconfig"; \
-+			$(UNINSTALL) $(INSTALL_PREFIX)$(libdir)/pkgconfig/$$i;\
-+		done;							\
-+	fi
-+
- #
- # normal bin binaries
- #
-diff --git a/configure b/configure
-index cad6b74486..8909bffe05 100755
---- a/configure
-+++ b/configure
-@@ -31717,6 +31717,8 @@ ac_config_files="$ac_config_files net-snmp-config:net-snmp-config.in"
- 
- ac_config_files="$ac_config_files net-snmp-create-v3-user:net-snmp-create-v3-user.in"
- 
-+ac_config_files="$ac_config_files netsnmp.pc:netsnmp.pc.in netsnmp-agent.pc:netsnmp-agent.pc.in"
-+
- ac_config_files="$ac_config_files dist/generation-scripts/gen-variables:dist/generation-scripts/gen-variables.in"
- 
- ac_config_files="$ac_config_files local/snmpconf"
-@@ -32740,6 +32742,8 @@ do
-     "mibs/Makefile") CONFIG_FILES="$CONFIG_FILES mibs/Makefile:Makefile.top:mibs/Makefile.in:Makefile.rules" ;;
-     "net-snmp-config") CONFIG_FILES="$CONFIG_FILES net-snmp-config:net-snmp-config.in" ;;
-     "net-snmp-create-v3-user") CONFIG_FILES="$CONFIG_FILES net-snmp-create-v3-user:net-snmp-create-v3-user.in" ;;
-+    "netsnmp.pc") CONFIG_FILES="$CONFIG_FILES netsnmp.pc:netsnmp.pc.in" ;;
-+    "netsnmp-agent.pc") CONFIG_FILES="$CONFIG_FILES netsnmp-agent.pc:netsnmp-agent.pc.in" ;;
-     "dist/generation-scripts/gen-variables") CONFIG_FILES="$CONFIG_FILES dist/generation-scripts/gen-variables:dist/generation-scripts/gen-variables.in" ;;
-     "local/snmpconf") CONFIG_FILES="$CONFIG_FILES local/snmpconf" ;;
-     "default") CONFIG_COMMANDS="$CONFIG_COMMANDS default" ;;
-diff --git a/configure.ac b/configure.ac
-index 1622b7c051..898b50f368 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -118,6 +118,7 @@ AC_CONFIG_FILES([net-snmp-config:net-snmp-config.in],
- 		[chmod +x net-snmp-config])
- AC_CONFIG_FILES([net-snmp-create-v3-user:net-snmp-create-v3-user.in],
- 		[chmod +x net-snmp-create-v3-user])
-+AC_CONFIG_FILES([netsnmp.pc:netsnmp.pc.in netsnmp-agent.pc:netsnmp-agent.pc.in])
- AC_CONFIG_FILES([dist/generation-scripts/gen-variables:dist/generation-scripts/gen-variables.in])
- AC_CONFIG_FILES([local/snmpconf])
- 
-diff --git a/netsnmp-agent.pc.in b/netsnmp-agent.pc.in
-new file mode 100644
-index 0000000000..3a1c77bbf8
---- /dev/null
-+++ b/netsnmp-agent.pc.in
-@@ -0,0 +1,12 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+includedir=@includedir@
-+libdir=@libdir@
-+
-+Name: netsnmp-agent (@PACKAGE_NAME@)
-+Description: SNMP (Simple Network Management Protocol) sub-agent SDK.
-+URL: http://www.net-snmp.org
-+Version: @PACKAGE_VERSION@
-+Cflags: -I${includedir}
-+Libs: -L${libdir} -lnetsnmpmibs -lnetsnmpagent -lnetsnmp
-+Libs.private: @LDFLAGS@ @LMIBLIBS@ @LAGENTLIBS@ @PERLLDOPTS_FOR_APPS@ @LNETSNMPLIBS@ @LIBS@
-diff --git a/netsnmp.pc.in b/netsnmp.pc.in
-new file mode 100644
-index 0000000000..0a1f5785a4
---- /dev/null
-+++ b/netsnmp.pc.in
-@@ -0,0 +1,12 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+includedir=@includedir@
-+libdir=@libdir@
-+
-+Name: netsnmp (@PACKAGE_NAME@)
-+Description: SNMP (Simple Network Management Protocol) daemon and applications.
-+URL: http://www.net-snmp.org
-+Version: @PACKAGE_VERSION@
-+Cflags: -I${includedir}
-+Libs: -L${libdir} -lnetsnmp
-+Libs.private: @LDFLAGS@ @LNETSNMPLIBS@ @LIBS@ @PERLLDOPTS_FOR_APPS@
--- 
-2.26.2
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
index 5ad7470c9..05a47f61c 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
@@ -1,4 +1,4 @@
-From 2ad4df6d503be72a8910c3087611adb33d77ffde Mon Sep 17 00:00:00 2001
+From 69d4c517c07f55c505090e48d96ace8cd599fb26 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 21 Aug 2015 18:23:13 +0900
 Subject: [PATCH] config_os_headers: Error Fix
@@ -13,15 +13,16 @@ conftest.c:168:17: fatal error: pkg.h: No such file or directory
 Upstream-Status: pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+
 ---
  configure.d/config_os_headers | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
-index 2fdb5a35d6..0272f02c8e 100644
+index f07d512..2363b42 100644
 --- a/configure.d/config_os_headers
 +++ b/configure.d/config_os_headers
-@@ -487,8 +487,8 @@ then
+@@ -395,8 +395,8 @@ then
      unset ac_cv_header_pkg_h
      netsnmp_save_CPPFLAGS="$CPPFLAGS"
      netsnmp_save_LDFLAGS="$LDFLAGS"
@@ -32,6 +33,3 @@ index 2fdb5a35d6..0272f02c8e 100644
      AC_CHECK_HEADERS(pkg.h,
          NETSNMP_SEARCH_LIBS(pkg_init, pkg,
  	    AC_DEFINE(HAVE_LIBPKG, 1, [define if you have BSD pkg-ng])))
--- 
-2.26.2
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
index bf133b3e3..22e591556 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
@@ -1,4 +1,4 @@
-From 98c6edba4835b515d933542411d80879327eee16 Mon Sep 17 00:00:00 2001
+From 2bf1bbe1d428ed06d57aa76b03e394b72ff2216d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 22 Jul 2016 18:34:39 +0000
 Subject: [PATCH] get_pid_from_inode: Include limit.h
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch
deleted file mode 100644
index 33a1e745f..000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 383e67e359b89abe0440597ce414297892ade511 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 26 Feb 2019 14:26:07 +0800
-Subject: [PATCH] net-snmp: fix compile error with --disable-des
-
-| scapi.c: In function 'sc_encrypt':
-| scapi.c:1256:5: error: 'pad_size' undeclared (first use in this function); did you mean 'dysize'?
-|      pad_size = pai->pad_size;
-|      ^~~~~~~~
-|      dysize
-
-pad_size is defined only without --disable-des
-[snip]
-#ifndef NETSNMP_DISABLE_DES
-    int             pad, plast, pad_size = 0;
-
-but used when disable-des,
-[snip]
-        QUITFUN(SNMPERR_GENERR, sc_encrypt_quit);
-    }
-    pad_size = pai->pad_size;
-
-    memset(my_iv, 0, sizeof(my_iv));
-
-#ifndef NETSNMP_DISABLE_DES
-    if (USM_CREATE_USER_PRIV_DES == (pai->type & USM_PRIV_MASK_ALG)) {
-
-        /*
-
-fix by move it into #ifndef NETSNMP_DISABLE_DES
-
-Upstream-Status: Submitted [https://sourceforge.net/p/net-snmp/bugs/2927/]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- snmplib/scapi.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/snmplib/scapi.c b/snmplib/scapi.c
-index 8ad1d70d90..8c6882d9ab 100644
---- a/snmplib/scapi.c
-+++ b/snmplib/scapi.c
-@@ -1251,7 +1251,6 @@ sc_encrypt(const oid * privtype, size_t privtypelen,
- 
-         QUITFUN(SNMPERR_GENERR, sc_encrypt_quit);
-     }
--    pad_size = pai->pad_size;
- 
-     memset(my_iv, 0, sizeof(my_iv));
- 
-@@ -1261,6 +1260,8 @@ sc_encrypt(const oid * privtype, size_t privtypelen,
-         /*
-          * now calculate the padding needed 
-          */
-+
-+       pad_size = pai->pad_size;
-         pad = pad_size - (ptlen % pad_size);
-         plast = (int) ptlen - (pad_size - pad);
-         if (pad == pad_size)
--- 
-2.26.2
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
index 778b40188..42352a6b0 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
@@ -1,4 +1,4 @@
-From 89538a973119f1bf976b3a6df157ea940cf32eb5 Mon Sep 17 00:00:00 2001
+From f3ff99736b8cccbba77349b0d10a3cee366a4c87 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 18 Sep 2015 00:28:45 -0400
 Subject: [PATCH] snmplib/keytools.c: Don't check for return from
@@ -10,22 +10,25 @@ EVP_MD_CTX_init() API returns void, it fixes errors with new compilers
 snmplib/keytools.c: In function 'generate_Ku': error: invalid use of void expression
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 
 ---
- snmplib/keytools.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ snmplib/keytools.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/snmplib/keytools.c b/snmplib/keytools.c
-index 2cf0240..50fd3ea 100644
+index 129a7c0..2fc1efc 100644
 --- a/snmplib/keytools.c
 +++ b/snmplib/keytools.c
-@@ -186,8 +186,7 @@ generate_Ku(const oid * hashtype, u_int hashtype_len,
+@@ -183,10 +183,7 @@ generate_Ku(const oid * hashtype, u_int hashtype_len,
      ctx = EVP_MD_CTX_create();
  #else
      ctx = malloc(sizeof(*ctx));
--    if (!EVP_MD_CTX_init(ctx))
--        return SNMPERR_GENERR;
+-    if (!EVP_MD_CTX_init(ctx)) {
+-        rval = SNMPERR_GENERR;
+-        goto generate_Ku_quit;
+-    }
 +    EVP_MD_CTX_init(ctx);
  #endif
-     if (!EVP_DigestInit(ctx, hashfn))
-         return SNMPERR_GENERR;
+     if (!EVP_DigestInit(ctx, hashfn)) {
+         rval = SNMPERR_GENERR;
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
index 4782714d5..c973bde72 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
@@ -1,7 +1,7 @@
-From a3631df3d6743113e1cd63579925e15bcce85868 Mon Sep 17 00:00:00 2001
+From 0a02ac779c51a2b4af3b58cb96967bf3eff80367 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Wed, 24 May 2017 16:45:34 +0800
-Subject: [PATCH 2/4] configure: fix a cc check issue.
+Subject: [PATCH] configure: fix a cc check issue.
 
 When has "." in cc value, the expression
 $myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=.([-=\w\s\/]+).;\s*/$1/);'
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
index a3d84b291..bfddc63dd 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
@@ -1,7 +1,7 @@
-From f3c5cd4df7ce8e5639c99b7b918e41fb89e969e3 Mon Sep 17 00:00:00 2001
+From 011bdcd07f2a289d0cfc1b411c03c0cc7c42dad1 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Wed, 24 May 2017 17:10:20 +0800
-Subject: [PATCH 4/4] configure: fix incorrect variable
+Subject: [PATCH] configure: fix incorrect variable
 
 For cross compile platform, this variable will not be correct, so fix it.
 
@@ -14,10 +14,10 @@ Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 9dbdde1..5fdc760 100644
+index 912f6b2..a53d1b2 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -173,7 +173,7 @@ OTHERCLEANTODOS=perlclean @PYTHONCLEANTARGS@ cleanfeatures perlcleanfeatures pyt
+@@ -174,7 +174,7 @@ OTHERCLEANTODOS=perlclean @PYTHONCLEANTARGS@ cleanfeatures perlcleanfeatures pyt
  #
  # override LD_RUN_PATH to avoid dependencies on the build directory
  perlmodules: perlmakefiles subdirs
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
deleted file mode 100644
index ec1b6de8f..000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 5f881d3bf24599b90d67a45cae7a3eb099cd71c9 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Sat, 27 Jul 2019 19:34:09 -0700
-Subject: [PATCH] libsnmp, USM: Introduce a reference count in struct
- usmStateReference
-
-This patch fixes https://sourceforge.net/p/net-snmp/bugs/2956/.
-
-Upstream-Status: Backport
-[ak: fixup for 5.8 context, changes to library/snmpusm.h]
-
-CVE: CVE-2019-20892
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
-
----
- snmplib/snmp_client.c | 22 +++----------
- snmplib/snmpusm.c     | 73 ++++++++++++++++++++++++++++---------------
- 2 files changed, 53 insertions(+), 42 deletions(-)
-
-Index: net-snmp-5.8/snmplib/snmpusm.c
-===================================================================
---- net-snmp-5.8.orig/snmplib/snmpusm.c
-+++ net-snmp-5.8/snmplib/snmpusm.c
-@@ -285,12 +285,35 @@ free_enginetime_on_shutdown(int majorid,
- struct usmStateReference *
- usm_malloc_usmStateReference(void)
- {
--    struct usmStateReference *retval = (struct usmStateReference *)
--        calloc(1, sizeof(struct usmStateReference));
-+   struct usmStateReference *retval;
- 
-+    retval = calloc(1, sizeof(struct usmStateReference));
-+    if (retval)
-+        retval->refcnt = 1;
-     return retval;
- }                               /* end usm_malloc_usmStateReference() */
- 
-+static int
-+usm_clone(netsnmp_pdu *pdu, netsnmp_pdu *new_pdu)
-+{
-+    struct usmStateReference *ref = pdu->securityStateRef;
-+    struct usmStateReference **new_ref =
-+        (struct usmStateReference **)&new_pdu->securityStateRef;
-+    int ret = 0;
-+
-+    if (!ref)
-+        return ret;
-+
-+    if (pdu->command == SNMP_MSG_TRAP2) {
-+        netsnmp_assert(pdu->securityModel == SNMP_DEFAULT_SECMODEL);
-+        ret = usm_clone_usmStateReference(ref, new_ref);
-+    } else {
-+        netsnmp_assert(ref == *new_ref);
-+        ref->refcnt++;
-+    }
-+
-+    return ret;
-+}
- 
- void
- usm_free_usmStateReference(void *old)
-@@ -3345,6 +3368,7 @@ init_usm(void)
-     def->encode_reverse = usm_secmod_rgenerate_out_msg;
-     def->encode_forward = usm_secmod_generate_out_msg;
-     def->decode = usm_secmod_process_in_msg;
-+    def->pdu_clone = usm_clone;
-     def->pdu_free_state_ref = usm_free_usmStateReference;
-     def->session_setup = usm_session_init;
-     def->handle_report = usm_handle_report;
-Index: net-snmp-5.8/snmplib/snmp_client.c
-===================================================================
---- net-snmp-5.8.orig/snmplib/snmp_client.c
-+++ net-snmp-5.8/snmplib/snmp_client.c
-@@ -402,27 +402,15 @@ _clone_pdu_header(netsnmp_pdu *pdu)
-         return NULL;
-     }
- 
--    if (pdu->securityStateRef &&
--        pdu->command == SNMP_MSG_TRAP2) {
--
--        ret = usm_clone_usmStateReference((struct usmStateReference *) pdu->securityStateRef,
--                (struct usmStateReference **) &newpdu->securityStateRef );
--
--        if (ret)
--        {
-+    sptr = find_sec_mod(newpdu->securityModel);
-+    if (sptr && sptr->pdu_clone) {
-+        /* call security model if it needs to know about this */
-+        ret = sptr->pdu_clone(pdu, newpdu);
-+        if (ret) {
-             snmp_free_pdu(newpdu);
-             return NULL;
-         }
-     }
--
--    if ((sptr = find_sec_mod(newpdu->securityModel)) != NULL &&
--        sptr->pdu_clone != NULL) {
--        /*
--         * call security model if it needs to know about this 
--         */
--        (*sptr->pdu_clone) (pdu, newpdu);
--    }
--
-     return newpdu;
- }
- 
-Index: net-snmp-5.8/include/net-snmp/library/snmpusm.h
-===================================================================
---- net-snmp-5.8.orig/include/net-snmp/library/snmpusm.h
-+++ net-snmp-5.8/include/net-snmp/library/snmpusm.h
-@@ -43,6 +43,7 @@ extern          "C" {
-      * Structures.
-      */
-     struct usmStateReference {
-+        int             refcnt;
-         char           *usr_name;
-         size_t          usr_name_length;
-         u_char         *usr_engine_id;
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
index fc3ac2a4b..26dd014ce 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
@@ -1,4 +1,4 @@
-From 0becb4843a40910d5ec9aa11969d4905a22037cf Mon Sep 17 00:00:00 2001
+From 27444fbf8323679ea0551a3bd5f04c365143d8c0 Mon Sep 17 00:00:00 2001
 From: "Roy.Li" <rongqing.li@windriver.com>
 Date: Fri, 16 Jan 2015 14:14:01 +0800
 Subject: [PATCH] net-snmp: fix "libtool --finish"
@@ -20,7 +20,7 @@ Signed-off-by: Roy.Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.top b/Makefile.top
-index 5d4f9bc..d0ed31c 100644
+index 6315401..fc0ee06 100644
 --- a/Makefile.top
 +++ b/Makefile.top
 @@ -89,7 +89,7 @@ LIBREVISION = 0
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
index 5cbb60d8e..da6d80ef4 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
@@ -1,4 +1,4 @@
-From d619cd9fc01f336ff0ff55b18f9112789eb4d84c Mon Sep 17 00:00:00 2001
+From b6a3d6c8af35f1ef27b80b0516742fce89f4eb29 Mon Sep 17 00:00:00 2001
 From: Marian Florea <marian.florea@windriver.com>
 Date: Thu, 20 Jul 2017 16:55:24 +0800
 Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP
@@ -14,10 +14,10 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/agent/snmpd.c b/agent/snmpd.c
-index 6566354..eb0d4b4 100644
+index ae73eda..66b4560 100644
 --- a/agent/snmpd.c
 +++ b/agent/snmpd.c
-@@ -1239,6 +1239,7 @@ receive(void)
+@@ -1207,6 +1207,7 @@ receive(void)
  	    snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
  		     netsnmp_get_version());
              update_config();
@@ -26,10 +26,10 @@ index 6566354..eb0d4b4 100644
  #if HAVE_SIGHOLD
              sigrelse(SIGHUP);
 diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c
-index 771ba3b..5de05e7 100644
+index 29c2a0f..ada961c 100644
 --- a/snmplib/snmpv3.c
 +++ b/snmplib/snmpv3.c
-@@ -1060,9 +1060,9 @@ init_snmpv3_post_config(int majorid, int minorid, void *serverarg,
+@@ -1059,9 +1059,9 @@ init_snmpv3_post_config(int majorid, int minorid, void *serverarg,
      /*
       * if our engineID has changed at all, the boots record must be set to 1 
       */
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
index fb773e638..f1ebe2bb6 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
@@ -1,4 +1,4 @@
-From a1134a31d417cc05a1fdb094f613a00a7a5e7ac5 Mon Sep 17 00:00:00 2001
+From e507dcf8b29c55011f85d88bf05400d4717e4074 Mon Sep 17 00:00:00 2001
 From: Chong Lu <Chong.Lu@windriver.com>
 Date: Thu, 28 May 2020 09:46:34 -0500
 Subject: [PATCH] net-snmp: add knob whether nlist.h are checked
@@ -9,30 +9,28 @@ Add knob to decide whether nlist.h are checked or not.
 Upstream-status: Pending
 
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+
 ---
  configure.d/config_os_headers | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
-index 2fdb5a35d6..af997461d5 100644
+index 76ef58a..f07d512 100644
 --- a/configure.d/config_os_headers
 +++ b/configure.d/config_os_headers
-@@ -32,6 +32,7 @@ AC_CHECK_HEADERS([getopt.h   pthread.h  regex.h      ] dnl
-                  [sys/un.h           ])
+@@ -37,6 +37,7 @@ AC_CHECK_HEADERS([getopt.h   pthread.h  regex.h      ] dnl
+                  [sys/timeb.h        ])
  
  #  Library and Agent:
 +if test "x$with_elf" != "xno"; then
  AC_CHECK_HEADERS([nlist.h],,,[
  AC_INCLUDES_DEFAULT
  [
-@@ -39,6 +40,7 @@ AC_INCLUDES_DEFAULT
+@@ -44,6 +45,7 @@ AC_INCLUDES_DEFAULT
  #define LIBBSD_DISABLE_DEPRECATED 1
  #endif
  ]])
 +fi
  
  #  Library:
- AC_CHECK_HEADERS([fcntl.h    io.h       kstat.h                 ] dnl
--- 
-2.26.2
-
+ AC_CHECK_HEADERS([crt_externs.h                        ] dnl
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
index 4cd8fd1e4..2941a3609 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
@@ -1,4 +1,4 @@
-From 068952c0e0cdda5a91250b91c5fcc9b85b43daab Mon Sep 17 00:00:00 2001
+From 3ca4335ec1d6b7b384c134fc85d7a9e513c68376 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 22 Jun 2017 10:25:08 +0800
 Subject: [PATCH] net-snmp: fix for --disable-des
@@ -15,10 +15,10 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/snmplib/scapi.c b/snmplib/scapi.c
-index 8ad1d70..43caddf 100644
+index 00c9174..c6875e1 100644
 --- a/snmplib/scapi.c
 +++ b/snmplib/scapi.c
-@@ -84,7 +84,9 @@ netsnmp_feature_child_of(usm_scapi, usm_support)
+@@ -85,7 +85,9 @@ netsnmp_feature_child_of(usm_scapi, usm_support);
  #include <openssl/hmac.h>
  #include <openssl/evp.h>
  #include <openssl/rand.h>
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
index 7cbaf0bc5..807983f61 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
@@ -1,4 +1,4 @@
-From 827fe3b0253aab33472828f40ad05934cc0261b8 Mon Sep 17 00:00:00 2001
+From 972df16e9599dffddf5d714a4cbf43008c771122 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 14 Jan 2015 15:10:06 +0800
 Subject: [PATCH] testing: add the output format for ptest
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-accept-configure-options-from-env.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-accept-configure-options-from-env.patch
deleted file mode 100644
index b0dbf5ad3..000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-accept-configure-options-from-env.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Reproducible build: To avoid build host paths being written into binaries,
-accept NETSNMP_CONFIGURE_OPTIONS from the environment.
-NETSNMP_CONFIGURE_OPTIONS can be set either null or to a fixed value.
-
---- net-snmp-5.8.original/configure.ac	2018-11-20 17:41:39.926529072 +1300
-+++ net-snmp-5.8/configure.ac	2018-11-20 17:54:44.488180224 +1300
-@@ -28,7 +28,7 @@
- #
- # save the configure arguments
- #
--AC_DEFINE_UNQUOTED(NETSNMP_CONFIGURE_OPTIONS,"$ac_configure_args",
-+AC_DEFINE_UNQUOTED(NETSNMP_CONFIGURE_OPTIONS,"${NETSNMP_CONFIGURE_OPTIONS-$ac_configure_args}",
-   [configure options specified])
- CONFIGURE_OPTIONS="\"$ac_configure_args\""
- AC_SUBST(CONFIGURE_OPTIONS)
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
index 4316c7a71..bf1e7bedf 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
@@ -1,11 +1,22 @@
+From 84e362fe97f50fbad69f083bc2d8fe18f83eb2f7 Mon Sep 17 00:00:00 2001
+From: "douglas.royds" <douglas.royds@taitradio.com>
+Date: Wed, 21 Nov 2018 13:52:18 +1300
+Subject: [PATCH] net-snmp: Reproducibility: Don't check build host for
+
 Reproducible build: Don't check for /etc/printcap on the build machine when
 cross-compiling. Use AC_CHECK_FILE to set the cached variable
 ac_cv_file__etc_printcap instead. When cross-compiling, this variable should be
 set in the environment to "yes" or "no" as appropriate for the target platform.
 
---- net-snmp-5.8.original/configure.d/config_os_misc4	2018-11-20 17:05:03.986274522 +1300
-+++ net-snmp-5.8/configure.d/config_os_misc4	2018-11-20 17:08:32.250700448 +1300
-@@ -116,9 +116,9 @@
+---
+ configure.d/config_os_misc4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.d/config_os_misc4 b/configure.d/config_os_misc4
+index 6f23c8e..8cea75a 100644
+--- a/configure.d/config_os_misc4
++++ b/configure.d/config_os_misc4
+@@ -99,9 +99,9 @@ if test x$LPSTAT_PATH != x; then
  	[Path to the lpstat command])
      AC_DEFINE(HAVE_LPSTAT, 1, [Set if the lpstat command is available])
  fi
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
similarity index 96%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
index 67316db0d..5df1f9340 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
@@ -25,13 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
            file://net-snmp-fix-for-disable-des.patch \
            file://reproducibility-have-printcap.patch \
-           file://reproducibility-accept-configure-options-from-env.patch \
-           file://0001-net-snmp-fix-compile-error-disable-des.patch \
-           file://0001-Add-pkg-config-support-for-building-applications-and.patch \
-           file://CVE-2019-20892.patch \
            "
-SRC_URI[md5sum] = "63bfc65fbb86cdb616598df1aff6458a"
-SRC_URI[sha256sum] = "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
+SRC_URI[sha256sum] = "04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
 UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
-- 
2.17.1

