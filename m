Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9DF60234
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 08:23:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9C8N8A6023450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 01:23:19 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Fri, 12 Oct 2018 01:22:37 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Oct 2018 16:22:34 +0800
Message-ID: <1539332554-26753-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH] postfix: add -lnsl and -lresolv to SYSLIBS by default
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
X-List-Received-Date: Fri, 12 Oct 2018 08:23:29 -0000
Content-Type: text/plain

When building native package, the do_compile function tries to check
libnsl.so and libresolv.so on host machine and add -lnsl and -lresolv to
SYSLIBS if they exist. But finally it will link the libnsl.so from
${STAGING_LIBDIR_NATIVE}. Actually there is no need to check them since
the libnsl2 is specified in DEPENDS and libresolv.so is from c libarary.
So add -lnsl and -lresolv to SYSLIBS directly.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...dd-lnsl-and-lresolv-to-SYSLIBS-by-default.patch | 58 ++++++++++++++++++++++
 .../recipes-daemons/postfix/postfix.inc            | 18 -------
 .../recipes-daemons/postfix/postfix_3.3.1.bb       |  1 +
 3 files changed, 59 insertions(+), 18 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
new file mode 100644
index 0000000..5650984
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
@@ -0,0 +1,58 @@
+From 4caa18feb70f8f3d133657c1250a53f4e292bb42 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 12 Oct 2018 12:38:02 +0800
+Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by default
+
+We don't need to check libnsl.so and libresolv.so since the libnsl2 is
+specified in DEPENDS and libresolv.so is from c libarary.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ makedefs | 22 ++--------------------
+ 1 file changed, 2 insertions(+), 20 deletions(-)
+
+diff --git a/makedefs b/makedefs
+index 2683bce..8f1b3f4 100644
+--- a/makedefs
++++ b/makedefs
+@@ -484,16 +484,7 @@ case "$SYSTEM.$RELEASE" in
+ 		    SYSLIBS="$SYSLIBS -ldb"
+ 		    ;;
+ 		esac
+-		for name in nsl resolv $GDBM_LIBS
+-		do
+-		    for lib in $BUILD_SYSROOT_NSL_PATH
+-		    do
+-			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
+-			    SYSLIBS="$SYSLIBS -l$name"
+-			    break
+-			}
+-		    done
+-		done
++		SYSLIBS="$SYSLIBS -lnsl -lresolv"
+ 		# Kernel 2.4 added IPv6
+ 		case "$RELEASE" in
+ 		2.[0-3].*) CCARGS="$CCARGS -DNO_IPV6";;
+@@ -561,16 +552,7 @@ EOF
+ 		    SYSLIBS="$SYSLIBS -ldb"
+ 		    ;;
+ 		esac
+-		for name in nsl resolv
+-		do
+-		    for lib in $BUILD_SYSROOT_NSL_PATH
+-		    do
+-			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
+-			    SYSLIBS="$SYSLIBS -l$name"
+-			    break
+-			}
+-		    done
+-		done
++		SYSLIBS="$SYSLIBS -lnsl -lresolv"
+ 		SYSLIBS="$SYSLIBS -ldl"
+ 		: ${SHLIB_SUFFIX=.so}
+ 		: ${SHLIB_CFLAGS=-fPIC}
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 882b27b..3d4f1df 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -97,27 +97,9 @@ do_compile () {
             "s:\$(SHELL) makedefs):\$(SHELL) makedefs $SYSTEM $RELEASE):" \
             ${S}/Makefile.in
         export BUILD_SYSROOT="${STAGING_DIR_HOST}"
-        export BUILD_SYSROOT_NSL_PATH="${STAGING_BASELIBDIR} \
-                                       ${STAGING_LIBDIR}"
     else
         # native build
         export BUILD_SYSROOT="${STAGING_DIR_NATIVE}"
-
-        # ubuntu x86 host: /lib/x86_64-linux-gnu(64) /lib/i386-linux-gnu (32)
-        #             on 64 bits, 32 libs in i386-linux-gnu
-        # let makedefs finds nsl and resolv libs, host CC will link
-        # the correct libraries
-        BUILD_SYSROOT_NSL_PATH="$(${CC} -print-search-dirs 2>/dev/null | \
-                      sed -n '/^libraries: =/s/libraries: =//p' | \
-                      sed -e 's/:/\n/g' | xargs -n1 readlink -f | \
-                      grep -v 'gcc\|/[0-9.]\+$' | sort -u)"
-        if [ -z "$BUILD_SYSROOT_NSL_PATH" ]; then
-            BUILD_SYSROOT_NSL_PATH="/usr/lib64 /lib64 \
-                                    /lib/x86_64-linux-gnu \
-                                    /usr/lib   /lib \
-                                    /lib/i386-linux-gnu"
-        fi
-        export BUILD_SYSROOT_NSL_PATH
     fi
 
     oe_runmake makefiles
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
index 9603569..6718b7e 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
@@ -3,6 +3,7 @@ require postfix.inc
 SRC_URI += "file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
             file://postfix-install.patch \
             file://icu-config.patch \
+            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
 
 SRC_URI[md5sum] = "4381c6492f415e4a69cf5099d4acea76"
-- 
2.7.4


