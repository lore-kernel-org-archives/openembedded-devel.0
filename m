Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF1173AA9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 23:12:31 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so35097293iec.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 16:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vrc8Elu9cE4dx+y2lu9jk99v1zyskfeY1IrZ0VoXv3w=;
	b=KI+OcTcB/5zILmpgYAiqMfqui6Df4KPS+UbCUutIsWq1cylRKy7AdFC2ndd6b4GkRy
	nuUFwNV6v/7TkF3/pu3pCjYTRvSqZecybXFfPD4J90B2PELVM5XCGsQ5T3Bm0hzv+Huz
	fEoVa6vkh2REK7UG525hu9U7XF9/2rjAFsJP2iLIBoWdekIitqMJX5/UJDDXWn/aYp+9
	CYCeiJ+DtP6/F5gHULPOrPEK7NrUHdV3kxQPQyLgdhX0IYfMbUwcR6KFC1qqFTywG9bJ
	Xr1SauSfRlLaKCdqaUvmHWjZtfHx08UVbvO+0nem9oK24loq+iSilooli9MqkoQII63J
	Bx2w==
X-Received: by 10.50.66.198 with SMTP id h6mr61619318igt.22.1426029152253;
	Tue, 10 Mar 2015 16:12:32 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ha4sm1359703igb.21.2015.03.10.16.12.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 16:12:31 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2015 16:12:13 -0700
Message-Id: <1426029133-9403-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH] spawn-fcgi: add initial recipe
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
X-List-Received-Date: Tue, 10 Mar 2015 23:12:33 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../spawn-fcgi-1.6.4/fix_configure_ipv6_test.patch | 35 ++++++++++++++++++++++
 .../recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb | 16 ++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi-1.6.4/fix_configure_ipv6_test.patch
 create mode 100644 meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb

diff --git a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi-1.6.4/fix_configure_ipv6_test.patch b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi-1.6.4/fix_configure_ipv6_test.patch
new file mode 100644
index 0000000..9409dd2
--- /dev/null
+++ b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi-1.6.4/fix_configure_ipv6_test.patch
@@ -0,0 +1,35 @@
+Testing for IPv6 support got broken by configure.ac changes in 1.6.4
+As a temp workaround, revert back to the 1.6.3 version.
+
+Upstream-Status: Pending
+
+--- spawn-fcgi-1.6.4/configure.ac
++++ spawn-fcgi-1.6.3/configure.ac
+@@ -66,8 +47,8 @@
+ # Check for IPv6 support
+ 
+ AC_ARG_ENABLE(ipv6,
+-  AC_HELP_STRING([--disable-ipv6],[disable IPv6 support]),
+-  [case "${enableval}" in
++ AC_HELP_STRING([--disable-ipv6],[disable IPv6 support]),
++ [case "${enableval}" in
+    yes) ipv6=true ;;
+     no) ipv6=false ;;
+      *) AC_MSG_ERROR(bad value ${enableval} for --enable-ipv6) ;;
+@@ -75,13 +56,10 @@
+ 
+ if test x$ipv6 = xtrue; then
+   AC_CACHE_CHECK([for IPv6 support], ac_cv_ipv6_support,
+-    [AC_TRY_LINK([[
+-#include <sys/types.h>
++  [AC_TRY_LINK([ #include <sys/types.h>
+ #include <sys/socket.h>
+-#include <netinet/in.h>
+-    ]], [[
+-struct sockaddr_in6 s; struct in6_addr t=in6addr_any; int i=AF_INET6; s; t.s6_addr[0] = 0;
+-    ]], [ac_cv_ipv6_support=yes], [ac_cv_ipv6_support=no])])
++#include <netinet/in.h>], [struct sockaddr_in6 s; struct in6_addr t=in6addr_any; int i=AF_INET6; s; t.s6_addr[0] = 0; ],
++  [ac_cv_ipv6_support=yes], [ac_cv_ipv6_support=no])])
+ 
+   if test "$ac_cv_ipv6_support" = yes; then
+     AC_DEFINE(HAVE_IPV6,1,[Whether to enable IPv6 support])
diff --git a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
new file mode 100644
index 0000000..99e58bd
--- /dev/null
+++ b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
@@ -0,0 +1,16 @@
+SUMMARRY = "spawn-fcgi is used to spawn FastCGI applications"
+HOMEPAGE = "http://redmine.lighttpd.net/projects/spawn-fcgi"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
+
+SRC_URI = "http://download.lighttpd.net/spawn-fcgi/releases-1.6.x/spawn-fcgi-${PV}.tar.gz \
+           file://fix_configure_ipv6_test.patch"
+
+SRC_URI[md5sum] = "e970de4efe8045c01dd76280f39901aa"
+SRC_URI[sha256sum] = "ab327462cb99894a3699f874425a421d934f957cb24221f00bb888108d9dd09e"
+
+inherit autotools
+
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
1.9.1


