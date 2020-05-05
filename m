Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.2646.1588657256044955298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 22:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1014420B717B
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 May 2020 22:40:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1014420B717B
From: "Alejandro Hernandez" <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] weechat: introduce weechat recipe providing a fully working IRC client
Date: Mon,  4 May 2020 22:40:48 -0700
Message-Id: <20200505054048.7414-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 ...01-use-pkg-config-for-gcrypt-instead.patch | 37 +++++++++++++++++++
 .../recipes-irc/weechat/weechat_2.8.bb        | 32 ++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch
 create mode 100644 meta-networking/recipes-irc/weechat/weechat_2.8.bb

diff --git a/meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch b/meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch
new file mode 100644
index 000000000..0717e9654
--- /dev/null
+++ b/meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch
@@ -0,0 +1,37 @@
+From dc6b11f4cc6035b4701e1d7f7c91b2f45757e7a2 Mon Sep 17 00:00:00 2001
+From: Alejandro Enedino Hernandez Samaniego
+ <alejandro@enedino.org>
+Date: Wed, 26 Feb 2020 13:55:16 -0800
+Subject: [PATCH] use pkg-config for gcrypt instead
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+
+Upstream-Status: Inappropriate [oe-specific]
+
+---
+ cmake/FindGCRYPT.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: weechat-2.7.1/cmake/FindGCRYPT.cmake
+===================================================================
+--- weechat-2.7.1.orig/cmake/FindGCRYPT.cmake
++++ weechat-2.7.1/cmake/FindGCRYPT.cmake
+@@ -27,15 +27,15 @@
+ #  GCRYPT_LDFLAGS = ldflags to use to compile
+ #
+ 
+-find_program(LIBGCRYPT_CONFIG_EXECUTABLE NAMES libgcrypt-config)
++find_program(LIBGCRYPT_CONFIG_EXECUTABLE NAMES pkg-config)
+ 
+ set(GCRYPT_LDFLAGS)
+ set(GCRYPT_CFLAGS)
+ 
+ if(LIBGCRYPT_CONFIG_EXECUTABLE)
+ 
+-   exec_program(${LIBGCRYPT_CONFIG_EXECUTABLE} ARGS --libs RETURN_VALUE _return_VALUE OUTPUT_VARIABLE GCRYPT_LDFLAGS)
+-   exec_program(${LIBGCRYPT_CONFIG_EXECUTABLE} ARGS --cflags RETURN_VALUE _return_VALUE OUTPUT_VARIABLE GCRYPT_CFLAGS)
++   exec_program(${LIBGCRYPT_CONFIG_EXECUTABLE} ARGS libgcrypt --libs RETURN_VALUE _return_VALUE OUTPUT_VARIABLE GCRYPT_LDFLAGS)
++   exec_program(${LIBGCRYPT_CONFIG_EXECUTABLE} ARGS libgcrypt --cflags RETURN_VALUE _return_VALUE OUTPUT_VARIABLE GCRYPT_CFLAGS)
+ 
+    if(${GCRYPT_CFLAGS} MATCHES "\n")
+       set(GCRYPT_CFLAGS " ")
diff --git a/meta-networking/recipes-irc/weechat/weechat_2.8.bb b/meta-networking/recipes-irc/weechat/weechat_2.8.bb
new file mode 100644
index 000000000..cdfb1a963
--- /dev/null
+++ b/meta-networking/recipes-irc/weechat/weechat_2.8.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Full-featured IRC plugin: multi-servers, proxy support, IPv6, SASL authentication, nicklist, DCC, and many other features"
+HOMEPAE = "https://weechat.org/"
+SECTION = "net"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
+
+DEPENDS = "openssl zlib icu libgcrypt gnutls curl aspell"
+
+SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
+           file://0001-use-pkg-config-for-gcrypt-instead.patch \
+           "
+SRC_URI[sha256sum] = "553ea295edad3b03cf88e6029c21e7bde32ff1cc026d35386ba9da3e56a6018c"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG ??= " ncurses python"
+PACKAGECONFIG[ncurses] = "-DENABLE_NCURSES=ON,-DENABLE_NCURSES=OFF,ncurses"
+PACKAGECONFIG[python] = "-DENABLE_PYTHON=ON,-DENABLE_PYTHON=OFF,python3"
+
+EXTRA_OECMAKE_append = " -DENABLE_PHP=OFF -DENABLE_TCL=OFF -DENABLE_LUA=OFF -DENABLE_JAVASCRIPT=OFF -DENABLE_RUBY=OFF -DENABLE_GUILE=OFF -DENABLE_PERL=OFF -DENABLE_ASPELL=ON"
+
+do_configure_prepend(){
+    #  Make sure we get dependencies from recipe-sysroot
+    sed -i -e 's# /usr/bin# ${RECIPE_SYSROOT}/${bindir}/#g' ${S}/cmake/FindPerl.cmake
+    sed -i -e 's# /usr/local/bin##g' ${S}/cmake/FindPerl.cmake
+    sed -i -e 's# /usr/pkg/bin##g' ${S}/cmake/FindPerl.cmake
+}
+
+do_install_append(){
+    rm -rf ${D}/${datadir}
+}
+
-- 
2.17.1

