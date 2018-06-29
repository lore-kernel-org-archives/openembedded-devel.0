Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B10DC744B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:22:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5T6MQCt020435
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 23:22:26 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 28 Jun 2018 23:22:18 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jun 2018 14:22:12 +0800
Message-ID: <1530253337-32732-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: SUBJECT:RR
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
X-List-Received-Date: Fri, 29 Jun 2018 06:22:25 -0000
Content-Type: text/plain

From 16cc71f4803c7773cf550fa53097c2aaeaf6a00e Mon Sep 17 00:00:00 2001
From: Changqing Li <changqing.li@windriver.com>
Date: Fri, 29 Jun 2018 12:43:28 +0800
Subject: [PATCH][meta-oe] openldap: upgrade 2.4.45 -> 2.4.46

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/openldap/openldap/install-strip.patch  |  3 +++
 meta-oe/recipes-support/openldap/openldap/kill-icu.patch       |  2 +-
 .../openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch      |  2 +-
 .../openldap/openldap/openldap-CVE-2015-3276.patch             |  2 ++
 .../openldap/openldap/openldap-m4-pthread.patch                |  2 ++
 .../openldap/{openldap_2.4.45.bb => openldap_2.4.46.bb}        | 10 ++++------
 6 files changed, 13 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.45.bb => openldap_2.4.46.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap/install-strip.patch b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
index 2992b70..7c67596 100644
--- a/meta-oe/recipes-support/openldap/openldap/install-strip.patch
+++ b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
@@ -1,6 +1,9 @@
 # This patch ensures that the install operations which strip
 # programs and libraries (LTINSTALL) work in a cross build
 # environment.
+
+Upstream-Status: Pending
+
 --- openldap-2.2.24/.pc/install-strip.patch/build/top.mk	2005-01-20 09:00:55.000000000 -0800
 +++ openldap-2.2.24/build/top.mk	2005-04-16 13:48:20.536710376 -0700
 @@ -116,7 +116,7 @@
diff --git a/meta-oe/recipes-support/openldap/openldap/kill-icu.patch b/meta-oe/recipes-support/openldap/openldap/kill-icu.patch
index dcf5411..35e4646 100644
--- a/meta-oe/recipes-support/openldap/openldap/kill-icu.patch
+++ b/meta-oe/recipes-support/openldap/openldap/kill-icu.patch
@@ -2,7 +2,7 @@ From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
 
 slapd depends on ICU if it was built first.
 
-Upstream-status: inappropiate [embedded specific]
+Upstream-Status: inappropiate [embedded specific]
 ---
  configure.in |    8 --------
  1 file changed, 8 deletions(-)
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
index c7b1552..86d0767 100644
--- a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
@@ -1,6 +1,6 @@
 From http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-nds/openldap/files/
 
-Upstream-status: Unknown
+Upstream-status: Pending
 
 --
 
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
index de9ca52..25e148e 100644
--- a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
@@ -10,6 +10,8 @@ cipher strings, which might cause a weaker than intended cipher to
 be used and allow remote attackers to have unspecified impact via
 unknown vectors.
 
+Upstream-Status: Pending
+
 Signed-off-by: Li Wang <li.wang@windriver.com>
 ---
  libraries/libldap/tls_m.c |   27 ++++++++++++++++-----------
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch b/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
index b669b72..38c0a5a 100644
--- a/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- openldap-2.3.11/build/openldap.m4.orig	2005-11-11 00:11:18.604322590 -0800
 +++ openldap-2.3.11/build/openldap.m4	2005-11-11 00:26:21.621145856 -0800
 @@ -788,7 +788,7 @@ AC_DEFUN([OL_PTHREAD_TEST_FUNCTION],[[
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.45.bb b/meta-oe/recipes-support/openldap/openldap_2.4.46.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.4.45.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.46.bb
index 82d6619..0c25506 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.45.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.46.bb
@@ -1,5 +1,3 @@
-# OpenLDAP, a license free (see http://www.OpenLDAP.org/license.html)
-#
 SUMMARY = "OpenLDAP Directory Service"
 DESCRIPTION = "OpenLDAP Software is an open source implementation of the Lightweight Directory Access Protocol."
 HOMEPAGE = "http://www.OpenLDAP.org/license.html"
@@ -9,9 +7,9 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=25fd3721960f39128cd15a749fd21139 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=25b4ead0e45182e7c2914e59ff57009f \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
-"
+                    "
 SECTION = "libs"
 
 LDAP_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
@@ -27,8 +25,8 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://openldap-CVE-2015-3276.patch \
 "
 
-SRC_URI[md5sum] = "00ff8301277cdfd0af728a6927042a13"
-SRC_URI[sha256sum] = "cdd6cffdebcd95161a73305ec13fc7a78e9707b46ca9f84fb897cd5626df3824"
+SRC_URI[md5sum] = "829016c5a9f45c51adc50073ac6f9fd7"
+SRC_URI[sha256sum] = "9a90dcb86b99ae790ccab93b7585a31fbcbeec8c94bf0f7ab0ca0a87ea0c4b2d"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.7.4


