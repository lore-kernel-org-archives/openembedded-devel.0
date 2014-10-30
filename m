Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C76760670
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 02:29:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9U2Trcq009419
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 19:29:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 29 Oct 2014 19:29:53 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Oct 2014 10:26:40 +0800
Message-ID: <1414636000-17823-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] squid: change ksh reference in krb ldap helper to sh
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
X-List-Received-Date: Thu, 30 Oct 2014 02:29:57 -0000
Content-Type: text/plain

This solves the following warning:

squid-3.4.7: squid requires /bin/bash, /usr/bin/perl, but no providers in its
RDEPENDS [file-rdeps]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 ...-ksh-reference-in-krb-ldap-helper-to-bash.patch | 29 ----------------
 ...ge-ksh-reference-in-krb-ldap-helper-to-sh.patch | 39 ++++++++++++++++++++++
 recipes-daemons/squid/squid_3.4.7.bb               |  3 +-
 3 files changed, 41 insertions(+), 30 deletions(-)
 delete mode 100644 recipes-daemons/squid/files/Change-ksh-reference-in-krb-ldap-helper-to-bash.patch
 create mode 100644 recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch

diff --git a/meta-networking/recipes-daemons/squid/files/Change-ksh-reference-in-krb-ldap-helper-to-bash.patch b/meta-networking/recipes-daemons/squid/files/Change-ksh-reference-in-krb-ldap-helper-to-bash.patch
deleted file mode 100644
index 6591d5c..0000000
--- a/meta-networking/recipes-daemons/squid/files/Change-ksh-reference-in-krb-ldap-helper-to-bash.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 37da4010f41d936c2c727fc32adab832bdde9bec Mon Sep 17 00:00:00 2001
-Message-Id: <37da4010f41d936c2c727fc32adab832bdde9bec.1382481765.git.Jim.Somerville@windriver.com>
-From: Jim Somerville <Jim.Somerville@windriver.com>
-Date: Tue, 22 Oct 2013 18:39:39 -0400
-Subject: [PATCH 1/1] Change ksh reference in krb ldap helper to bash
-
-Very simple cert_tool script with no ksh specifics.
-Change it to use bash so a package dependency doesn't
-get created to ksh.
-
-Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
----
- helpers/external_acl/kerberos_ldap_group/cert_tool |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/helpers/external_acl/kerberos_ldap_group/cert_tool b/helpers/external_acl/kerberos_ldap_group/cert_tool
-index 9f14959..b61be5d 100644
---- a/helpers/external_acl/kerberos_ldap_group/cert_tool
-+++ b/helpers/external_acl/kerberos_ldap_group/cert_tool
-@@ -1,4 +1,5 @@
--#!/bin/ksh
-+#!/bin/bash
-+# The above was originally ksh
- #
- #  -----------------------------------------------------------------------------
- # 
--- 
-1.7.4.1
-
diff --git a/meta-networking/recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch b/meta-networking/recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
new file mode 100644
index 0000000..8e03860
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
@@ -0,0 +1,39 @@
+squid: change ksh reference in krb ldap helper to sh
+
+Very simple cert_tool script with no ksh specifics.
+Change it to use sh so a package dependency doesn't
+get created to ksh.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ helpers/external_acl/kerberos_ldap_group/cert_tool | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/helpers/external_acl/kerberos_ldap_group/cert_tool b/helpers/external_acl/kerberos_ldap_group/cert_tool
+index 9f14959..8c4ea11 100644
+--- a/helpers/external_acl/kerberos_ldap_group/cert_tool
++++ b/helpers/external_acl/kerberos_ldap_group/cert_tool
+@@ -1,4 +1,4 @@
+-#!/bin/ksh
++#!/bin/sh
+ #
+ #  -----------------------------------------------------------------------------
+ # 
+@@ -64,9 +64,9 @@ QUIT
+ # Create database for Sun ldap and pem file for Openldap 
+ #
+ rm ${server}_[0-9]*.pem 2>/dev/null
+-let i=0
++i=0
+  ls ${server}_[0-9]*.cert | while read file; do
+- let i=i+1
++ i=`expr $i + 1`
+  cat  $file  >> ${server}_$i.pem
+  CA=`openssl x509 -noout -text -in  ${server}_$i.pem | grep -i "CA:.*true"`
+  if [ -n "$CA" ]; then
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
index cd10bd0..c5f616d 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://Set-up-for-cross-compilation.patch \
            file://Skip-AC_RUN_IFELSE-tests.patch \
            file://Fix-flawed-dynamic-ldb-link-test-in-configure.patch \
-           file://Change-ksh-reference-in-krb-ldap-helper-to-bash.patch \
+           file://squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch \
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://volatiles.03_squid \
@@ -63,4 +63,5 @@ FILES_${PN} += "${libdir} ${datadir}/errors ${datadir}/icons"
 FILES_${PN}-dbg += "/usr/src/debug"
 FILES_${PN}-doc += "${datadir}/*.txt"
 
+RDEPENDS_${PN} += "perl"
 RDEPENDS_${PN}-ptest += "make"
-- 
1.9.1


