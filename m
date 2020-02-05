Return-Path: <Qi.Chen@windriver.com>
X-Greylist: delayed 13704 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Feb 2020 12:00:06 UTC
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0CA60AF0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 12:00:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0158BgWh019057
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Feb 2020 00:11:43 -0800 (PST)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 5 Feb 2020 00:11:42 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Feb 2020 00:11:42 -0800
Message-ID: <20200205081142.54027-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xmlsec1: fix for multilib
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
X-List-Received-Date: Wed, 05 Feb 2020 12:00:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With previous change of nss/nspr in this recipe, multilib build
failure at do_configure.

Fix it by not using hardcoded /lib/.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-nss-nspr-fix-for-multilib.patch      | 52 +++++++++++++++++++
 .../recipes-support/xmlsec1/xmlsec1_1.2.29.bb |  3 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
new file mode 100644
index 000000000..53c119765
--- /dev/null
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
@@ -0,0 +1,52 @@
+From 9ed3b4e628f9254d5c86006fe63c33a1eb02aee5 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 4 Feb 2020 23:39:49 -0800
+Subject: [PATCH] nss/nspr: fix for multilib
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ configure.ac | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b46d97d..39f4318 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -920,24 +920,24 @@ fi
+ dnl Priority 1: User specifies the path to installation
+ if test "z$NSPR_FOUND" = "zno" -a "z$with_nspr" != "z" -a "z$with_nspr" != "zyes" ; then
+     AC_MSG_CHECKING(for nspr library installation in "$with_nspr" folder)
+-    if test -f "$with_nspr/include/$NSPR_INCLUDE_MARKER" -a -f "$with_nspr/lib/$NSPR_LIB_MARKER" ; then
+-        NSPR_INCLUDE_PATH="$with_nspr/include"
+-        NSPR_LIB_PATH="$with_nspr/lib"
++    if test -f "$with_nspr/${includedir}/$NSPR_INCLUDE_MARKER" -a -f "$with_nspr/${libdir}/$NSPR_LIB_MARKER" ; then
++        NSPR_INCLUDE_PATH="$with_nspr/${includedir}"
++        NSPR_LIB_PATH="$with_nspr/${libdir}"
+         NSPR_FOUND="yes"
+         AC_MSG_RESULT([yes])
+     else
+-        AC_MSG_ERROR([not found: "$with_nspr/include/$NSPR_INCLUDE_MARKER" and/or "$with_nspr/lib/$NSPR_LIB_MARKER" files don't exist), typo?])
++        AC_MSG_ERROR([not found: "$with_nspr/${includedir}/$NSPR_INCLUDE_MARKER" and/or "$with_nspr/${libdir}/$NSPR_LIB_MARKER" files don't exist), typo?])
+     fi
+ fi
+ if test "z$NSS_FOUND" = "zno" -a "z$with_nss" != "z" -a "z$with_nss" != "zyes" ; then
+     AC_MSG_CHECKING(for nss library installation in "$with_nss" folder)
+-    if test -f "$with_nss/include/$NSS_INCLUDE_MARKER" -a -f "$with_nss/lib/$NSS_LIB_MARKER" ; then
+-        NSS_INCLUDE_PATH="$with_nss/include"
+-        NSS_LIB_PATH="$with_nss/lib"
++    if test -f "$with_nss/${includedir}/$NSS_INCLUDE_MARKER" -a -f "$with_nss/${libdir}/$NSS_LIB_MARKER" ; then
++        NSS_INCLUDE_PATH="$with_nss/${includedir}"
++        NSS_LIB_PATH="$with_nss/${libdir}"
+         NSS_FOUND="yes"
+         AC_MSG_RESULT([yes])
+     else
+-        AC_MSG_ERROR([not found: "$with_nss/include/$NSS_INCLUDE_MARKER" and/or "$with_nss/lib/$NSS_LIB_MARKER" files don't exist), typo?])
++        AC_MSG_ERROR([not found: "$with_nss/${includedir}/$NSS_INCLUDE_MARKER" and/or "$with_nss/${libdir}/$NSS_LIB_MARKER" files don't exist), typo?])
+     fi
+ fi
+ 
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb
index 3e25e8d35..8fc611a27 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://change-finding-path-of-nss.patch \
     file://makefile-ptest.patch \
     file://xmlsec1-examples-allow-build-in-separate-dir.patch \
+    file://0001-nss-nspr-fix-for-multilib.patch \
     file://run-ptest \
     "
 
@@ -31,7 +32,7 @@ inherit autotools-brokensep ptest pkgconfig
 PACKAGECONFIG ??= "gnutls libgcrypt nss openssl des"
 PACKAGECONFIG[gnutls] = ",,gnutls"
 PACKAGECONFIG[libgcrypt] = ",,libgcrypt"
-PACKAGECONFIG[nss] = "--with-nss=${STAGING_LIBDIR}/.. --with-nspr=${STAGING_LIBDIR}/..,,nss nspr"
+PACKAGECONFIG[nss] = "--with-nss=${STAGING_DIR_HOST} --with-nspr=${STAGING_DIR_HOST},,nss nspr"
 PACKAGECONFIG[openssl] = ",,openssl"
 PACKAGECONFIG[des] = ",--disable-des,,"
 
-- 
2.21.0


