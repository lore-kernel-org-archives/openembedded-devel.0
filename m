Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.14506.1590679698609934064
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2020 08:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=pJMPQz0B;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.27, mailfrom: patrick@stwcx.xyz)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 282C75C018D;
	Thu, 28 May 2020 11:28:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 28 May 2020 11:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=ALQbXcSiKyBmva2q/k15cYFKxi
	0RY8qTc1dUJRoCpGA=; b=pJMPQz0BA+jkNbJZp+pXeNywp2cxy7fR1zfHrTHdi7
	p3yfqVMYZFCj3aQctr9m+tSgwizY8Zs/bN/HmVan7YrrW+yF+8Ahgqsd89fIp/0h
	Y7QWeAyxQzFEty317k8Sv0UIEPD+W6kNOqHKHMrRJO8XtwZIRyRkRk9LAAjrxIN5
	y3qPHMTor+lM/HDa+mIfrMDuIlGjs276zZlql9UQV9vhH6GLFwLmRkNeDkCbdVXR
	oephB70i06CbDzh+RXAhpqi4eVsksPCHaR8Yq++CXOF+GB/5llscGyWtwwhMgXY8
	qlKuTMdxuAOGwtqWNN7IpotZ3oNqkFOY84kOjEy2zH0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ALQbXcSiKyBmva2q/
	k15cYFKxi0RY8qTc1dUJRoCpGA=; b=pLWhu1Z8iihj7LOMKYRpLfMREuJSoDGsB
	4GDxiR12NnyNAjqWQPN6j6Q+8DXGM3cTEEz+fwwoorR/TTGQMaZ/mSewtHNEEkwR
	3DQGtzzkSXyJutkFp4BJBHb3uMiXK3gHv1LdLKBf1Glu0sByTh5B9EPCrIDNKHf8
	gBzWg33mNheP2YaaU+VjBEmRhSR3ohrovARek3akvu7a0xbkd+T94MBpTcyU+2S2
	VgXGJfLARuLPkvPKXlDzUVqNQ/nbeICJYpZjcbdYL6MZZo4CLrFFveEjcF0BcPTC
	IJ2E8RkZwfq/6OCMDRGZ4pUXKVNtHR5AEtmXzjcoOikHCM8qUKQIA==
X-ME-Sender: <xms:kNjPXmScVYxM4fqogvNUQiWkNFfW-PdCG6HYxuSy6hjcBIguwV2vVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddviedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenogevohgrshhtrghlqdfhgeduvddqtddvucdludehtddm
    necujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitg
    hkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffr
    rghtthgvrhhnpeeuteffieduvefgffdvhfeiveehgeeuvdeiteejheejteethfehvdffje
    etudfgvdenucffohhmrghinhepshhouhhrtggvfhhorhhgvgdrnhgvthdpphgtrdhinhen
    ucfkphepudeiiedrudejvddruddvfedrvdehheenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:kNjPXryKG9fcBLPicws5RjESBRZuQOFOSimGrEKsUocEIrtTIc2pRg>
    <xmx:kNjPXj1SDzoYwjKswQPrWreNbQhgfdueHeZzpmonHK0vk6LigVhiGQ>
    <xmx:kNjPXiA-iHce-HDvWq34ndxaTn7dtzmOypBhU2K8CgCIoHHcNMYMmg>
    <xmx:kdjPXvKZK-4KlR8HeObO0oKLWEPkGo3AR0IoJgw2owwKnj0wVY28pQ>
Received: from localhost (mobile-166-172-123-255.mycingular.net [166.172.123.255])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9AB9B328006A;
	Thu, 28 May 2020 11:28:16 -0400 (EDT)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Joe MacDonald <joe@deserted.net>,
	Patrick Williams <patrick@stwcx.xyz>
Subject: [meta-networking][PATCH] net-snmp: refresh patches
Date: Thu, 28 May 2020 10:28:12 -0500
Message-Id: <20200528152812.4102054-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refreshed patches for 5.8 due to the following:

    ERROR: net-snmp-5.8-r0 do_patch: Command Error: 'quilt --quiltrc .../net-snmp/5.8-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
    Applying patch 0001-Add-pkg-config-support-for-building-applications-and.patch
    patching file configure
    ...
    Hunk #1 succeeded at 32248 with fuzz 2 (offset 1826 lines).
    Hunk #2 FAILED at 31447.
    1 out of 2 hunks FAILED -- rejects in file configure
    ...
    Patch 0001-Add-pkg-config-support-for-building-applications-and.patch does not apply (enforce with -f)

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 ...upport-for-building-applications-and.patch | 24 +++++++++----------
 .../0001-config_os_headers-Error-Fix.patch    | 10 ++++----
 ...t-snmp-fix-compile-error-disable-des.patch | 14 +++++------
 ...add-knob-whether-nlist.h-are-checked.patch | 15 +++++++-----
 4 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch
index 6cb9588eb..dd159b9ce 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch
@@ -1,4 +1,4 @@
-From aea8c2f0bf8004c8da8ca9acb04ab07798cd8068 Mon Sep 17 00:00:00 2001
+From 4bf83597379523032663c8e95b3786a217c9a849 Mon Sep 17 00:00:00 2001
 From: Hugh McMaster <hugh.mcmaster@outlook.com>
 Date: Wed, 3 Apr 2019 21:36:03 +1100
 Subject: [PATCH] Add pkg-config support for building applications and
@@ -10,10 +10,8 @@ The netsnmp-agent package should be used when building Net-SNMP subagents.
 Signed-off-by: Hugh McMaster <hugh.mcmaster@outlook.com>
 [ bvanassche: edited makefile code and .pc files; added ./configure changes ]
 
-
 Upstream-Status: Backport
 https://sourceforge.net/p/net-snmp/patches/_discuss/thread/a0d66e91dd/f940/attachment/0001-Add-pkg-config-support-for-building-applications-and.patch
-
 ---
  Makefile.in         |  2 ++
  Makefile.rules      | 30 ++++++++++++++++++++++++++----
@@ -26,7 +24,7 @@ https://sourceforge.net/p/net-snmp/patches/_discuss/thread/a0d66e91dd/f940/attac
  create mode 100644 netsnmp.pc.in
 
 diff --git a/Makefile.in b/Makefile.in
-index 9dbdde1353b1..ec972636c279 100644
+index 9dbdde1353..ec972636c2 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -35,6 +35,7 @@ INSTALLBUILTHEADERS=include/net-snmp/net-snmp-config.h
@@ -46,7 +44,7 @@ index 9dbdde1353b1..ec972636c279 100644
  	rm -f include/net-snmp/agent/mib_module_config.h		\
  		include/net-snmp/agent/agent_module_config.h		\
 diff --git a/Makefile.rules b/Makefile.rules
-index 9e9e9009e5d2..e714f91e725e 100644
+index 9e9e9009e5..e714f91e72 100644
 --- a/Makefile.rules
 +++ b/Makefile.rules
 @@ -85,12 +85,14 @@ subdirs:
@@ -96,10 +94,10 @@ index 9e9e9009e5d2..e714f91e725e 100644
  # normal bin binaries
  #
 diff --git a/configure b/configure
-index 5ec44f5ce082..5103a4dc9d88 100755
+index cad6b74486..8909bffe05 100755
 --- a/configure
 +++ b/configure
-@@ -30422,6 +30422,8 @@ ac_config_files="$ac_config_files net-snmp-config:net-snmp-config.in"
+@@ -31717,6 +31717,8 @@ ac_config_files="$ac_config_files net-snmp-config:net-snmp-config.in"
  
  ac_config_files="$ac_config_files net-snmp-create-v3-user:net-snmp-create-v3-user.in"
  
@@ -108,7 +106,7 @@ index 5ec44f5ce082..5103a4dc9d88 100755
  ac_config_files="$ac_config_files dist/generation-scripts/gen-variables:dist/generation-scripts/gen-variables.in"
  
  ac_config_files="$ac_config_files local/snmpconf"
-@@ -31445,6 +31447,8 @@ do
+@@ -32740,6 +32742,8 @@ do
      "mibs/Makefile") CONFIG_FILES="$CONFIG_FILES mibs/Makefile:Makefile.top:mibs/Makefile.in:Makefile.rules" ;;
      "net-snmp-config") CONFIG_FILES="$CONFIG_FILES net-snmp-config:net-snmp-config.in" ;;
      "net-snmp-create-v3-user") CONFIG_FILES="$CONFIG_FILES net-snmp-create-v3-user:net-snmp-create-v3-user.in" ;;
@@ -118,10 +116,10 @@ index 5ec44f5ce082..5103a4dc9d88 100755
      "local/snmpconf") CONFIG_FILES="$CONFIG_FILES local/snmpconf" ;;
      "default") CONFIG_COMMANDS="$CONFIG_COMMANDS default" ;;
 diff --git a/configure.ac b/configure.ac
-index 4c4dce09d488..d62a02da5d88 100644
+index 1622b7c051..898b50f368 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -136,6 +136,7 @@ AC_CONFIG_FILES([net-snmp-config:net-snmp-config.in],
+@@ -118,6 +118,7 @@ AC_CONFIG_FILES([net-snmp-config:net-snmp-config.in],
  		[chmod +x net-snmp-config])
  AC_CONFIG_FILES([net-snmp-create-v3-user:net-snmp-create-v3-user.in],
  		[chmod +x net-snmp-create-v3-user])
@@ -131,7 +129,7 @@ index 4c4dce09d488..d62a02da5d88 100644
  
 diff --git a/netsnmp-agent.pc.in b/netsnmp-agent.pc.in
 new file mode 100644
-index 000000000000..3a1c77bbf814
+index 0000000000..3a1c77bbf8
 --- /dev/null
 +++ b/netsnmp-agent.pc.in
 @@ -0,0 +1,12 @@
@@ -149,7 +147,7 @@ index 000000000000..3a1c77bbf814
 +Libs.private: @LDFLAGS@ @LMIBLIBS@ @LAGENTLIBS@ @PERLLDOPTS_FOR_APPS@ @LNETSNMPLIBS@ @LIBS@
 diff --git a/netsnmp.pc.in b/netsnmp.pc.in
 new file mode 100644
-index 000000000000..0a1f5785a4f4
+index 0000000000..0a1f5785a4
 --- /dev/null
 +++ b/netsnmp.pc.in
 @@ -0,0 +1,12 @@
@@ -166,5 +164,5 @@ index 000000000000..0a1f5785a4f4
 +Libs: -L${libdir} -lnetsnmp
 +Libs.private: @LDFLAGS@ @LNETSNMPLIBS@ @LIBS@ @PERLLDOPTS_FOR_APPS@
 -- 
-2.21.0.196.g041f5ea1cf98
+2.26.2
 
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
index bfc55a08a..5ad7470c9 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
@@ -1,4 +1,4 @@
-From 7ae2ce8dbf1c54d4e2db4a5f49397a239baadc49 Mon Sep 17 00:00:00 2001
+From 2ad4df6d503be72a8910c3087611adb33d77ffde Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 21 Aug 2015 18:23:13 +0900
 Subject: [PATCH] config_os_headers: Error Fix
@@ -13,16 +13,15 @@ conftest.c:168:17: fatal error: pkg.h: No such file or directory
 Upstream-Status: pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
-
 ---
  configure.d/config_os_headers | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
-index af99746..83b2e31 100644
+index 2fdb5a35d6..0272f02c8e 100644
 --- a/configure.d/config_os_headers
 +++ b/configure.d/config_os_headers
-@@ -489,8 +489,8 @@ then
+@@ -487,8 +487,8 @@ then
      unset ac_cv_header_pkg_h
      netsnmp_save_CPPFLAGS="$CPPFLAGS"
      netsnmp_save_LDFLAGS="$LDFLAGS"
@@ -33,3 +32,6 @@ index af99746..83b2e31 100644
      AC_CHECK_HEADERS(pkg.h,
          NETSNMP_SEARCH_LIBS(pkg_init, pkg,
  	    AC_DEFINE(HAVE_LIBPKG, 1, [define if you have BSD pkg-ng])))
+-- 
+2.26.2
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch
index 7e686ce7f..33a1e745f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch
@@ -1,4 +1,4 @@
-From e38c508ef401593b1d4fe42b62e42a49cfec82af Mon Sep 17 00:00:00 2001
+From 383e67e359b89abe0440597ce414297892ade511 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 26 Feb 2019 14:26:07 +0800
 Subject: [PATCH] net-snmp: fix compile error with --disable-des
@@ -12,12 +12,12 @@ Subject: [PATCH] net-snmp: fix compile error with --disable-des
 pad_size is defined only without --disable-des
 [snip]
 #ifndef NETSNMP_DISABLE_DES
-    int             pad, plast, pad_size = 0; 
+    int             pad, plast, pad_size = 0;
 
 but used when disable-des,
 [snip]
         QUITFUN(SNMPERR_GENERR, sc_encrypt_quit);
-    }    
+    }
     pad_size = pai->pad_size;
 
     memset(my_iv, 0, sizeof(my_iv));
@@ -37,10 +37,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/snmplib/scapi.c b/snmplib/scapi.c
-index 43caddf..c09deb0 100644
+index 8ad1d70d90..8c6882d9ab 100644
 --- a/snmplib/scapi.c
 +++ b/snmplib/scapi.c
-@@ -1253,7 +1253,6 @@ sc_encrypt(const oid * privtype, size_t privtypelen,
+@@ -1251,7 +1251,6 @@ sc_encrypt(const oid * privtype, size_t privtypelen,
  
          QUITFUN(SNMPERR_GENERR, sc_encrypt_quit);
      }
@@ -48,7 +48,7 @@ index 43caddf..c09deb0 100644
  
      memset(my_iv, 0, sizeof(my_iv));
  
-@@ -1263,6 +1262,8 @@ sc_encrypt(const oid * privtype, size_t privtypelen,
+@@ -1261,6 +1260,8 @@ sc_encrypt(const oid * privtype, size_t privtypelen,
          /*
           * now calculate the padding needed 
           */
@@ -58,5 +58,5 @@ index 43caddf..c09deb0 100644
          plast = (int) ptlen - (pad_size - pad);
          if (pad == pad_size)
 -- 
-2.7.4
+2.26.2
 
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
index 74b0c12e0..fb773e638 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
@@ -1,4 +1,7 @@
-net-snmp: add knob whether nlist.h are checked
+From a1134a31d417cc05a1fdb094f613a00a7a5e7ac5 Mon Sep 17 00:00:00 2001
+From: Chong Lu <Chong.Lu@windriver.com>
+Date: Thu, 28 May 2020 09:46:34 -0500
+Subject: [PATCH] net-snmp: add knob whether nlist.h are checked
 
 Previously, it still was checked when there was no nlish.h in sysroots directory.
 Add knob to decide whether nlist.h are checked or not.
@@ -7,14 +10,14 @@ Upstream-status: Pending
 
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
 ---
- configure.d/config_os_headers |    2 ++
+ configure.d/config_os_headers | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
-index d903f58..a05d30e 100644
+index 2fdb5a35d6..af997461d5 100644
 --- a/configure.d/config_os_headers
 +++ b/configure.d/config_os_headers
-@@ -31,6 +31,7 @@ AC_CHECK_HEADERS([getopt.h   pthread.h  regex.h      ] dnl
+@@ -32,6 +32,7 @@ AC_CHECK_HEADERS([getopt.h   pthread.h  regex.h      ] dnl
                   [sys/un.h           ])
  
  #  Library and Agent:
@@ -22,7 +25,7 @@ index d903f58..a05d30e 100644
  AC_CHECK_HEADERS([nlist.h],,,[
  AC_INCLUDES_DEFAULT
  [
-@@ -38,6 +39,7 @@ AC_INCLUDES_DEFAULT
+@@ -39,6 +40,7 @@ AC_INCLUDES_DEFAULT
  #define LIBBSD_DISABLE_DEPRECATED 1
  #endif
  ]])
@@ -31,5 +34,5 @@ index d903f58..a05d30e 100644
  #  Library:
  AC_CHECK_HEADERS([fcntl.h    io.h       kstat.h                 ] dnl
 -- 
-1.7.9.5
+2.26.2
 
-- 
2.26.2

