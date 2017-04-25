Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id BA51B77ABF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:47:49 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id x188so19384381itb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3dSeA0SU9qDRzP0Ef9dZt7Xf1Xao0A/wjxVCkSg4bFA=;
	b=hyObq7o18BNkAtGR89QqaK5E+JUXoY3+f0lDEjPfbBS36edwQia6RlUVNlhgAz509i
	k5TpxoA2Xo6Ai8NDCGNeHxx3R3C71BbMxzdGtbC/gdSrjw3pa0TFA7ixINpA1QavEJNb
	RsNMfW573C3SuZSPhhf7kwBBxaJhbh0dYwqxC65mpYibTweqDXcTX+78Rap8kmRTEHA9
	5fhh+zZP45/DkuLZ1wx/pOBZBwh8nY+LnhFYlyYD4eNz7jzCp2Tk3QJ/4/l8JrFhbDJG
	WEcG6xdd0uh2vgj/HmJpIVH2lWqOniO70M7EU3zqhG1Z7buotpHANusa3s/J6/JP3Vbs
	go3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3dSeA0SU9qDRzP0Ef9dZt7Xf1Xao0A/wjxVCkSg4bFA=;
	b=emYnX4ZcevpS8E1I5BiI0DfFaNVY/he8fM6qNyFyc1loFe2T43WFIyl09aVOmDXgpa
	rnHPdiw6ScrM3L9S3e2gFUkK4ljnAEJBXQHLYJhFy8xqIRbQ9hRxyH+hxHc+RortMYhV
	f0p+VYvoQCHFvXGV87aYic9AsN6PsneetnBkkQl35IkJS1kfcTCdy2twk07pdzZyu6Co
	buqpnJZDhuXgrQBKSMm17FmKX8+sXVfA+UxELouOdlpldGVJ7WU9JNJokf232pA3KTLl
	+k9c8Zjj84yU3eqNuAC7o+vHON5MGC8UQ2h1w0d+yR7Zlh1WVdMU4c66Mh6Vzddo+xar
	JuVg==
X-Gm-Message-State: AN3rC/4ZHVj7w14CDV82N3Uc8FYsUVd6IiY7tA8Yg896B0M1AftvAHiw
	QUViCyqMa3Nsa9RD
X-Received: by 10.36.14.77 with SMTP id 74mr18004799ite.115.1493092070259;
	Mon, 24 Apr 2017 20:47:50 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm1244118itm.6.2017.04.24.20.47.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 20:47:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 20:47:19 -0700
Message-Id: <20170425034719.8630-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170425034719.8630-1-raj.khem@gmail.com>
References: <20170425034719.8630-1-raj.khem@gmail.com>
Subject: [meta-networking][ 11/11] autofs: Upgrade to 5.1.2 release
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
X-List-Received-Date: Tue, 25 Apr 2017 03:47:49 -0000

Add patches to make it work when SECURITY_FLAGS are enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../autofs/autofs-5.1.2-libtirpc-as-need.patch     | 30 ++++++++++++++++++++++
 .../autofs/autofs/fix_disable_ldap.patch           | 10 +++++---
 .../autofs/libtirpc-name-clash-backout.patch       | 28 --------------------
 .../autofs/autofs/pkgconfig-libnsl.patch           | 19 ++++++++++++++
 .../autofs/{autofs_5.1.1.bb => autofs_5.1.2.bb}    | 28 ++++++++++----------
 5 files changed, 69 insertions(+), 46 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/libtirpc-name-clash-backout.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.1.bb => autofs_5.1.2.bb} (74%)

diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch
new file mode 100644
index 000000000..cbf2bf804
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch
@@ -0,0 +1,30 @@
+Make configure compatible with -Wl,--as-needed following
+https://wiki.gentoo.org/wiki/Project:Quality_Assurance/As-needed#Failure_in_..2Fconfigure
+
+2016-07-05 Martin von Gagern
+
+Index: autofs-5.1.2/aclocal.m4
+===================================================================
+--- autofs-5.1.2.orig/aclocal.m4
++++ autofs-5.1.2/aclocal.m4
+@@ -415,9 +415,9 @@ AC_DEFUN([AF_CHECK_LIBTIRPC],
+ [
+ # save current flags
+ af_check_libtirpc_save_cflags="$CFLAGS"
+-af_check_libtirpc_save_ldflags="$LDFLAGS"
++af_check_libtirpc_save_libs="$LIBS"
+ CFLAGS="$CFLAGS -I=/usr/include/tirpc"
+-LDFLAGS="$LDFLAGS -ltirpc"
++LIBS="$LIBS -ltirpc"
+ 
+ AC_TRY_LINK(
+     [ #include <rpc/rpc.h> ],
+@@ -440,7 +440,7 @@ AC_CHECK_FUNCS([getrpcbyname getservbyna
+ 
+ # restore flags
+ CFLAGS="$af_check_libtirpc_save_cflags"
+-LDFLAGS="$af_check_libtirpc_save_ldflags"
++LIBS="$af_check_libtirpc_save_libs"
+ ])
+ 
+ AC_DEFUN([AF_WITH_LIBTIRPC],
diff --git a/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch b/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
index 31c8510a6..94750b257 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
@@ -15,8 +15,10 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
  include/lookup_ldap.h |    4 ++++
  1 file changed, 4 insertions(+)
 
---- a/include/lookup_ldap.h
-+++ b/include/lookup_ldap.h
+Index: autofs-5.1.2/include/lookup_ldap.h
+===================================================================
+--- autofs-5.1.2.orig/include/lookup_ldap.h
++++ autofs-5.1.2/include/lookup_ldap.h
 @@ -1,7 +1,9 @@
  #ifndef LOOKUP_LDAP_H
  #define LOOKUP_LDAP_H
@@ -27,14 +29,14 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
  
  #ifdef WITH_SASL
  #include <openssl/ssl.h>
-@@ -109,10 +111,12 @@
+@@ -117,10 +119,12 @@ struct lookup_context {
  
  #define LDAP_AUTH_USESIMPLE	0x0008
  
 +#ifdef WITH_LDAP
  /* lookup_ldap.c */
  LDAP *init_ldap_connection(unsigned logopt, const char *uri, struct lookup_context *ctxt);
- int unbind_ldap_connection(unsigned logopt, LDAP *ldap, struct lookup_context *ctxt);
+ int unbind_ldap_connection(unsigned logopt, struct ldap_conn *conn, struct lookup_context *ctxt);
  int authtype_requires_creds(const char *authtype);
 +#endif
  
diff --git a/meta-networking/recipes-daemons/autofs/autofs/libtirpc-name-clash-backout.patch b/meta-networking/recipes-daemons/autofs/autofs/libtirpc-name-clash-backout.patch
deleted file mode 100644
index e93021d56..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/libtirpc-name-clash-backout.patch
+++ /dev/null
@@ -1,28 +0,0 @@
----
- lib/rpc_subs.c |   10 ----------
- 1 file changed, 10 deletions(-)
-
-diff --git a/lib/rpc_subs.c b/lib/rpc_subs.c
-index 5d6ead0..c7177f2 100644
---- a/lib/rpc_subs.c
-+++ b/lib/rpc_subs.c
-@@ -34,16 +34,6 @@
- #include <poll.h>
- 
- #ifdef WITH_LIBTIRPC
--#undef auth_destroy
--#define auth_destroy(auth)                                              \
--                do {                                                    \
--                        int refs;                                       \
--                        if ((refs = auth_put((auth))) == 0)             \
--                                ((*((auth)->ah_ops->ah_destroy))(auth));\
--                } while (0)
--#endif
--
--#ifdef WITH_LIBTIRPC
- const rpcprog_t rpcb_prog = RPCBPROG;
- const rpcvers_t rpcb_version = RPCBVERS;
- #else
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch b/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
new file mode 100644
index 000000000..bf2c964a0
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
@@ -0,0 +1,19 @@
+Use pkg-config first to look for external libnsl which is now
+split out from glibc, if it does not exist then see if its provided
+by glibc itself.
+
+-Khem
+
+Index: autofs-5.1.2/configure.in
+===================================================================
+--- autofs-5.1.2.orig/configure.in
++++ autofs-5.1.2/configure.in
+@@ -186,7 +186,7 @@ fi
+ #
+ # glibc/libc 6 new libraries
+ #
+-AC_CHECK_LIB(nsl, yp_match, LIBNSL="-lnsl")
++PKG_CHECK_MODULES([NSL], [libnsl], [], [AC_CHECK_LIB([nsl],[yp_match],[LIBNSL="-lnsl"],[LIBNSL=""])])
+ AC_SUBST(LIBNSL)
+ 
+ AC_CHECK_LIB(resolv, res_query, LIBRESOLV="-lresolv")
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
similarity index 74%
rename from meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
rename to meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
index d85600e4c..eea7c4b83 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
@@ -3,18 +3,17 @@ SECTION = "utils"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-DEPENDS += "libtirpc flex-native bison-native"
+DEPENDS += "libtirpc flex-native bison-native e2fsprogs openssl libxml2 util-linux cyrus-sasl"
 
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 
-inherit autotools-brokensep systemd
+inherit autotools-brokensep systemd update-rc.d pkgconfig
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch \
            file://no-bash.patch \
            file://cross.patch \
            file://libtirpc.patch \
-           file://libtirpc-name-clash-backout.patch \
            file://autofs-5.0.7-do-not-check-for-modprobe.patch \
            file://fix_disable_ldap.patch \
            file://autofs-5.0.7-fix-lib-deps.patch \
@@ -25,18 +24,17 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://fix-the-YACC-rule-to-fix-a-building-failure.patch \
            file://0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch \
            file://0002-Replace-__S_IEXEC-with-S_IEXEC.patch \
+           file://autofs-5.1.2-libtirpc-as-need.patch \
+           file://pkgconfig-libnsl.patch \
            "
-
-SRC_URI[md5sum] = "e143df66b614b8cdb1ff533735f8e12d"
-SRC_URI[sha256sum] = "795419383b120d15699ab3b89ea0f3d029f6fb28405a83982d305c4b7b61130f"
-
-inherit update-rc.d pkgconfig
+SRC_URI[md5sum] = "28cf88f99eff553a8500659ba5d45a76"
+SRC_URI[sha256sum] = "0d57e4138c2ec8058ca92164d035546f68ce4af93acb893369993d67c7056a10"
 
 INITSCRIPT_NAME = "autofs"
 INITSCRIPT_PARAMS = "defaults"
 
 # FIXME: modules/Makefile has crappy rules that don't obey LDFLAGS
-CFLAGS += "${LDFLAGS}"
+#CFLAGS += "${LDFLAGS}"
 
 PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd,systemd"
 
@@ -45,7 +43,7 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 EXTRA_OEMAKE = "DONTSTRIP=1"
 EXTRA_OECONF += "--disable-mount-locking \
                 --enable-ignore-busy --with-openldap=no \
-                --with-sasl=no --with-libtirpc=yes \
+                --with-sasl=no --with-libtirpc \
                 --with-path=${STAGING_BINDIR_NATIVE} \
 "
 CACHED_CONFIGUREVARS = "ac_cv_path_RANLIB=${RANLIB} \
@@ -53,9 +51,9 @@ CACHED_CONFIGUREVARS = "ac_cv_path_RANLIB=${RANLIB} \
 "
 
 do_configure_prepend () {
-    sed -e "s:filagdir:flagdir:" -i configure.in
-    if [ ! -e acinclude.m4 ]; then
-        cp aclocal.m4 acinclude.m4
+    sed -e "s:filagdir:flagdir:" -i ${S}/configure.in
+    if [ ! -e ${S}/acinclude.m4 ]; then
+        cp ${S}/aclocal.m4 ${S}/acinclude.m4
     fi
 }
 
@@ -67,6 +65,7 @@ do_install_append () {
         rmdir ${D}${localstatedir}/run
     fi
 }
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
 
 INSANE_SKIP_${PN} = "dev-so"
 
@@ -74,3 +73,4 @@ RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "autofs.service"
+
-- 
2.12.2


