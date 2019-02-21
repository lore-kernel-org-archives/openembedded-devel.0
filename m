Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7F987CA6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 05:21:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1L5LFxm011045
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 21:21:15 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 21:21:14 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Feb 2019 13:21:13 +0800
Message-ID: <1550726473-182418-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openldap: upgrade 2.4.46 -> 2.4.47
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
X-List-Received-Date: Thu, 21 Feb 2019 05:21:14 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../remove-user-host-pwd-from-version.patch        | 43 +++++++++++++++-------
 .../{openldap_2.4.46.bb => openldap_2.4.47.bb}     |  6 +--
 2 files changed, 32 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.46.bb => openldap_2.4.47.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
index ac18f08..870fc98 100644
--- a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
+++ b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
@@ -1,24 +1,36 @@
-diff -ru openldap-2.4.46.orig/build/mkversion openldap-2.4.46/build/mkversion
---- openldap-2.4.46.orig/build/mkversion	2018-10-25 18:46:10.383750480 +1300
-+++ openldap-2.4.46/build/mkversion	2018-10-25 18:46:33.156232586 +1300
-@@ -50,7 +50,15 @@
- fi
- 
- APPLICATION=$1
--WHOWHERE="$USER@`uname -n`:`pwd`"
-+if [ -n "${SOURCE_DATE_EPOCH}" ]; then
-+   WHOWHERE="openldap"
+From 868a04b0596e2df708ba14ed70815b1411db3db1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 21 Feb 2019 11:33:24 +0800
+Subject: [PATCH] mkversion: remove user host pwd from version
+
+Upstream-Status: Pending
+
+Update this patch to version 2.4.47
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ build/mkversion | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/build/mkversion b/build/mkversion
+index 4e35723..9fa3bee 100755
+--- a/build/mkversion
++++ b/build/mkversion
+@@ -53,8 +53,12 @@ APPLICATION=$1
+ # Reproducible builds set SOURCE_DATE_EPOCH, want constant strings
+ if [ -n "${SOURCE_DATE_EPOCH}" ]; then
+    WHOWHERE="openldap"
 +   DATE=$(date -d@$SOURCE_DATE_EPOCH +' %b %d %Y ')
 +   TIME=$(date -d@$SOURCE_DATE_EPOCH +' %H:%M:%S ')
-+else
+ else
+-   WHOWHERE="$USER@$(uname -n):$(pwd)"
 +   WHOWHERE="openldap"
 +   DATE='" __DATE__ "'
 +   TIME='" __TIME__ "'
-+fi
+ fi
  
  cat << __EOF__
- /* This work is part of OpenLDAP Software <http://www.openldap.org/>.
-@@ -72,7 +80,7 @@
+@@ -77,7 +81,7 @@ static const char copyright[] =
  "COPYING RESTRICTIONS APPLY\n";
  
  $static $const char $SYMBOL[] =
@@ -27,3 +39,6 @@ diff -ru openldap-2.4.46.orig/build/mkversion openldap-2.4.46/build/mkversion
  "\t$WHOWHERE\n";
  
  __EOF__
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.46.bb b/meta-oe/recipes-support/openldap/openldap_2.4.47.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.4.46.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.47.bb
index 7fe9fb0..4345d7d 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.46.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.47.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 LDAP_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
-SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
+SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/${BP}.tgz \
     file://openldap-m4-pthread.patch \
     file://kill-icu.patch \
     file://openldap-2.4.28-gnutls-gcrypt.patch \
@@ -26,8 +26,8 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "829016c5a9f45c51adc50073ac6f9fd7"
-SRC_URI[sha256sum] = "9a90dcb86b99ae790ccab93b7585a31fbcbeec8c94bf0f7ab0ca0a87ea0c4b2d"
+SRC_URI[md5sum] = "e508f97bfd778fec7799f286e5c07176"
+SRC_URI[sha256sum] = "f54c5877865233d9ada77c60c0f69b3e0bfd8b1b55889504c650047cc305520b"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.7.4


