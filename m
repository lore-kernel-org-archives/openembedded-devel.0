Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4348F6AC3D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 01:56:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t671uWB2008177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jul 2015 18:56:32 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 18:56:32 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jul 2015 09:55:46 +0800
Message-ID: <1436234146-4895-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking][v3] squid: upgrade to 3.5.5
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
X-List-Received-Date: Tue, 07 Jul 2015 01:56:33 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. Remove the squid-change-ksh-referen*.patch which is not needed, since
   3.5.5 did not use ksh by default.
2. Update the checksum of COPYING,since the date in it has been changed.
3. Define BUILDCXXFLAGS, otherwise the target gcc options -std=c++11 will
   add into it, and lead to building failure since host gcc maybe not
   support "-std=c++11"
4. Assume to support GNU atomic operations by default, the running check
   on cross-compile setup does not work
5. Add the dependency on libpam

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...ge-ksh-reference-in-krb-ldap-helper-to-sh.patch | 39 ----------------------
 .../squid/{squid_3.4.7.bb => squid_3.5.5.bb}       | 11 +++---
 2 files changed, 6 insertions(+), 44 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
 rename meta-networking/recipes-daemons/squid/{squid_3.4.7.bb => squid_3.5.5.bb} (86%)

diff --git a/meta-networking/recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch b/meta-networking/recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
deleted file mode 100644
index 8e03860..0000000
--- a/meta-networking/recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-squid: change ksh reference in krb ldap helper to sh
-
-Very simple cert_tool script with no ksh specifics.
-Change it to use sh so a package dependency doesn't
-get created to ksh.
-
-Upstream-Status: Pending
-
-Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- helpers/external_acl/kerberos_ldap_group/cert_tool | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/helpers/external_acl/kerberos_ldap_group/cert_tool b/helpers/external_acl/kerberos_ldap_group/cert_tool
-index 9f14959..8c4ea11 100644
---- a/helpers/external_acl/kerberos_ldap_group/cert_tool
-+++ b/helpers/external_acl/kerberos_ldap_group/cert_tool
-@@ -1,4 +1,4 @@
--#!/bin/ksh
-+#!/bin/sh
- #
- #  -----------------------------------------------------------------------------
- # 
-@@ -64,9 +64,9 @@ QUIT
- # Create database for Sun ldap and pem file for Openldap 
- #
- rm ${server}_[0-9]*.pem 2>/dev/null
--let i=0
-+i=0
-  ls ${server}_[0-9]*.cert | while read file; do
-- let i=i+1
-+ i=`expr $i + 1`
-  cat  $file  >> ${server}_$i.pem
-  CA=`openssl x509 -noout -text -in  ${server}_$i.pem | grep -i "CA:.*true"`
-  if [ -n "$CA" ]; then
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.5.bb
similarity index 86%
rename from meta-networking/recipes-daemons/squid/squid_3.4.7.bb
rename to meta-networking/recipes-daemons/squid/squid_3.5.5.bb
index 7b00dfc..198319d 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.5.bb
@@ -16,19 +16,18 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://Set-up-for-cross-compilation.patch \
            file://Skip-AC_RUN_IFELSE-tests.patch \
            file://Fix-flawed-dynamic-ldb-link-test-in-configure.patch \
-           file://squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch \
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://volatiles.03_squid \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-                    file://COPYRIGHT;md5=2900f50789c498be8e9f1eb23b55cbe9 \
+                    file://errors/COPYRIGHT;md5=0fed8f1462f6fdbc62bb431bcb618f46 \
                    "
-SRC_URI[md5sum] = "9951034b10f7ee0f45a95cfae61c57c2"
-SRC_URI[sha256sum] = "7b423f3d3495a317503ca559ea535f80445fd7c4e3c3e268cb7a8c97c61af2b6"
+SRC_URI[md5sum] = "6aac5c2e9cbbeabcbf2e9e49a178a931"
+SRC_URI[sha256sum] = "741c24a307c50f0d845d53cabb66b36d91ce9a73c8a165eae5def5e4d11e6a0d"
 
-DEPENDS = "libtool krb5 openldap db cyrus-sasl"
+DEPENDS = "libtool krb5 openldap db cyrus-sasl libpam"
 
 inherit autotools useradd ptest
 
@@ -38,6 +37,8 @@ USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --she
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
 EXTRA_OECONF += "--with-default-user=squid"
+export BUILDCXXFLAGS="${BUILD_CXXFLAGS}"
+CACHED_CONFIGUREVARS += "squid_cv_gnu_atomics=yes"
 
 TESTDIR = "test-suite"
 do_compile_ptest() {
-- 
1.9.1


