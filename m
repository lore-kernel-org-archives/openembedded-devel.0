Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62378C4708C
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.6865.1649339641880291353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 06:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 237Ds0w4026883
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 7 Apr 2022 06:54:00 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Apr 2022 06:53:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Apr 2022 06:53:59 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 7 Apr 2022 06:53:58 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] wxwidgets: fix wx-config multilib issue
Date: Thu, 7 Apr 2022 21:53:55 +0800
Message-ID: <20220407135356.38304-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96452

From: Kai Kang <kai.kang@windriver.com>

It sets 'libdir' with path element 'lib' directly which is not suitable
for multilib. Add an option '--baselib' for wx-config to support
multilib when cross compile.

And set EGREP for wx-config to avoid host contamination.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../wx-config-fix-libdir-for-multilib.patch   | 56 +++++++++++++++++++
 .../wxwidgets/wxwidgets_3.1.5.bb              |  4 ++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-for-multilib.patch

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-for-multilib.patch
new file mode 100644
index 000000000..7ce206d26
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-for-multilib.patch
@@ -0,0 +1,56 @@
+It sets 'libdir' with path element 'lib' directly which is not suitable for
+multilib. Add an option '--baselib' for wx-config to support multilib when
+cross compile. And set default value of baselib with "lib${wxPLATFORM_LIB_DIR}".
+
+Upstream-Status: Pending [oe specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ build/cmake/config.cmake | 2 +-
+ wx-config.in             | 6 ++++--
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
+index 52ae69d3f6..28aa733eb0 100644
+--- a/build/cmake/config.cmake
++++ b/build/cmake/config.cmake
+@@ -86,7 +86,7 @@ function(wx_write_config)
+     set(prefix ${CMAKE_INSTALL_PREFIX})
+     set(exec_prefix "\${prefix}")
+     set(includedir "\${prefix}/include")
+-    set(libdir "\${exec_prefix}/lib")
++    set(libdir "\${exec_prefix}/\${baselib}")
+     set(bindir "\${exec_prefix}/bin")
+ 
+     find_program(EGREP egrep)
+diff --git a/wx-config.in b/wx-config.in
+index e3f7d115bb..0e78af03c7 100755
+--- a/wx-config.in
++++ b/wx-config.in
+@@ -42,7 +42,8 @@ usage()
+ {
+     cat 1>&2 <<EOF
+ 
+- wx-config [--prefix[=DIR]] [--exec-prefix[=DIR]] [--release] [--version-full]
++ wx-config [--prefix[=DIR]] [--exec-prefix[=DIR]][--baselib=DIR]
++           [--release] [--version-full]
+            [--list] [--selected-config] [--host=HOST] [--toolkit=TOOLKIT]
+            [--universal[=yes|no]] [--unicode[=yes|no]] [--static[=yes|no]]
+            [--debug[=yes|no]] [--version[=VERSION]] [--flavour=FLAVOUR]
+@@ -137,7 +138,7 @@ wxconfig_output_options="prefix exec_prefix
+ 
+ # Options that permit the user to supply hints that may affect the output.
+ # These options all accept arbitrary values, to interpret as they please.
+-wxconfig_input_options="prefix exec_prefix utility $wxconfig_schema"
++wxconfig_input_options="prefix exec_prefix baselib utility $wxconfig_schema"
+ 
+ # Input options that accept only a yes or no argument.
+ #
+@@ -404,6 +405,7 @@ is_cross()  { [ "x@cross_compiling@" = "xyes" ]; }
+ # Determine the base directories we require.
+ prefix=${input_option_prefix-${this_prefix:-@prefix@}}
+ exec_prefix=${input_option_exec_prefix-${input_option_prefix-${this_exec_prefix:-@exec_prefix@}}}
++baselib=${input_option_baselib:-lib@wxPLATFORM_LIB_DIR@}
+ wxconfdir="@libdir@/wx/config"
+ 
+ installed_configs=`cd "$wxconfdir" 2> /dev/null && ls | grep -v "^inplace-"`
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
index e82143040..87fd284ae 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://fix-libdir-for-multilib.patch \
     file://respect-DESTDIR-when-create-link.patch \
     file://not-append-system-name-to-lib-name.patch \
+    file://wx-config-fix-libdir-for-multilib.patch \
 "
 SRCREV= "9c0a8be1dc32063d91ed1901fd5fcd54f4f955a1"
 S = "${WORKDIR}/git"
@@ -42,6 +43,7 @@ EXTRA_OECMAKE += " \
 EXTRA_OECMAKE:append:libc-musl = " \
     -DHAVE_LOCALE_T=OFF \
 "
+EXTRA_OECMAKE:append:class-target = ' -DEGREP="/bin/grep -E"'
 
 # All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', 'no_gui', d)} \
@@ -113,4 +115,6 @@ FILES:${PN}-dev += " \
     ${libdir}/wx/config/ \
 "
 
+RDEPENDS:${PN}-dev += "grep"
+
 BBCLASSEXTEND = "native"
-- 
2.17.1


