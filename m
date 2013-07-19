Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D53186AF56
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2013 06:29:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6J6TW0a016640
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2013 23:29:32 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 18 Jul 2013 23:29:32 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jul 2013 14:29:31 +0800
Message-ID: <1374215371-23406-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: Joe.macdonald@windriver.com
Subject: [meta-networking][PATCH] cyrus-sasl: several fixes
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
X-List-Received-Date: Fri, 19 Jul 2013 06:29:32 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

1. Fix hardcoded libdir
2. configure cyrus-sasl based on PACKAGECONFIG
3. create user by inherit useradd
4. add -fPIC to CFLAG to fix the below building failure:
        ld: ../sasldb/.libs/libsasldb.a(db_berkeley.o): relocation R_X86_64_32S against
        `.rodata' can not be used when making a shared object; recompile with -fPIC
        ../sasldb/.libs/libsasldb.a(db_berkeley.o): could not read symbols: Bad value
   The cause is that libsasldb.a is built twice since {.c.o: and .c.lo} co-exist, one
   with -fPIC, other without -fPIC. if no -fPIC library follows behind, this error
   will appear. so we enable -fPIC no matter whatever objects are built.
5. The version of db in oe-core is 5.0

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |   31 ++++++++++++++++----
 .../cyrus-sasl/files/Fix-hardcoded-libdir.patch    |   25 ++++++++++++++++
 2 files changed, 51 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcoded-libdir.patch

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 4311540..d8cb3d9 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -5,21 +5,39 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
 
 SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
-	   file://avoid-to-call-AC_TRY_RUN.patch"
+	   file://avoid-to-call-AC_TRY_RUN.patch \
+	   file://Fix-hardcoded-libdir.patch" 
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig useradd
 
 EXTRA_OECONF += "--with-dblib=berkeley \
                  --with-bdb-libdir=${STAGING_LIBDIR} \
                  --with-bdb-incdir=${STAGING_INCDIR} \
-                 --without-pam --without-opie --without-des \
+                 --with-bdb=db-5.3 \
+                 --with-plugindir="${libdir}/sasl2/" \
                  andrew_cv_runpath_switch=none"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "ntlm \
+        ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
+        ${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+        "
 PACKAGECONFIG[gssapi] = "--enable-gssapi=yes,--enable-gssapi=no,krb5,"
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
+PACKAGECONFIG[opie] = "--with-opie,--without-opie,opie,"
+PACKAGECONFIG[des] = "--with-des,--without-des,,"
+PACKAGECONFIG[ldap] = "--with-ldap=${STAGING_LIBDIR} --enable-ldapdb,--without-ldap --disable-ldapdb,openldap,"
+PACKAGECONFIG[ntlm] = "--with-ntlm,--without-ntlm,,"
+
+CFLAGS += "-fPIC"
 
 do_configure_prepend () {
     rm -f acinclude.m4 config/libtool.m4
+
+    # make it be able to work with db 5.0 version
+    local sed_files="sasldb/db_berkeley.c utils/dbconverter-2.c"
+    for sed_file in $sed_files; do
+        sed -i 's#DB_VERSION_MAJOR == 4.*#(&) || DB_VERSION_MAJOR == 5#' $sed_file
+    done
 }
 
 do_compile_prepend () {
@@ -29,8 +47,11 @@ do_compile_prepend () {
     cd ..
 }
 
+USERADD_PACKAGES = "${PN}-bin"
+GROUPADD_PARAM_${PN}-bin = "--system mail"
+USERADD_PARAM_${PN}-bin = "--system --home=/var/spool/mail -g mail cyrus"
+
 pkg_postinst_${PN}-bin () {
-    grep cyrus /etc/passwd || adduser --disabled-password --home=/var/spool/mail --ingroup mail -g "Cyrus sasl" cyrus
     echo "cyrus" | saslpasswd2 -p -c cyrus
     chgrp mail /etc/sasldb2
 }
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcoded-libdir.patch b/meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcoded-libdir.patch
new file mode 100644
index 0000000..3fa8431
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcoded-libdir.patch
@@ -0,0 +1,25 @@
+Fix hardcoded libdir.
+
+Upstream-Status: Pending 
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ plugins/Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/plugins/Makefile.am b/plugins/Makefile.am
+index b00915f..25262a1 100644
+--- a/plugins/Makefile.am
++++ b/plugins/Makefile.am
+@@ -62,7 +62,7 @@ plugindir = @plugindir@
+ 
+ common_sources = plugin_common.c plugin_common.h
+ 
+-sasldir = $(prefix)/lib/sasl2
++sasldir = $(libdir)/sasl2
+ sasl_LTLIBRARIES = @SASL_MECHS@
+ EXTRA_LTLIBRARIES = libplain.la libanonymous.la libkerberos4.la libcrammd5.la \
+ 	libgs2.la libgssapiv2.la libdigestmd5.la liblogin.la libsrp.la libotp.la \
+-- 
+1.7.4.1
+
-- 
1.7.10.4


