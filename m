Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16A7773FF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 01:06:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5C16A1K023764
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 18:06:10 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 11 Jun 2015 18:06:10 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Jun 2015 08:59:25 +0800
Message-ID: <1434070765-3165-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][mete-oe] mariadb: fix floating dependency on krb5
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
X-List-Received-Date: Fri, 12 Jun 2015 01:06:12 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Mariadb depends on openssl, openssl conditionally depends on krb5 by
checking if OPENSSL_NO_KRB5 is defined, but cmake can not handle "ifndef"
and always ask krb5.h if krb5.h exist when cmake make_depend;

Faking a kssl.h if krb5 is not in PACKAGECONF, which does not include
krb5 related declaration, install the faked kssl.h into build dir to
be searched firstly

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 00fa965..ddc0644 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -42,6 +42,7 @@ PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITHOUT_VALGRIND=TRUE,valgrind"
 PACKAGECONFIG[libedit] = "-DLIBEDIT_INTERFACE=TRUE,-DLIBEDIT_INTERFACE=FALSE,libedit"
+PACKAGECONFIG[krb5] = ", ,krb5"
 
 # MariaDB doesn't link properly with gold
 # https://mariadb.atlassian.net/browse/MDEV-5982
@@ -84,6 +85,14 @@ do_compile_prepend_class-target () {
     # and since we're cross-compiling that is disabled
     cp ${STAGING_BINDIR_NATIVE}/comp_err ${S}/extra
     cp ${STAGING_BINDIR_NATIVE}/comp_sql ${S}/scripts
+
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'krb5', 'yes', 'no', d)}" = "no" ]; then
+        mkdir ${B}/include/openssl
+        echo "#ifndef KSSL_H" >${B}/include/openssl/kssl.h
+        echo "#define KSSL_H" >>${B}/include/openssl/kssl.h
+        echo "#include <openssl/opensslconf.h>">>${B}/include/openssl/kssl.h
+        echo "#endif" >>${B}/include/openssl/kssl.h
+    fi
 }
 
 SYSROOT_PREPROCESS_FUNCS += "mariadb_sysroot_preprocess"
-- 
1.9.1


