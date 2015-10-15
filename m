Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBB0C770A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 02:29:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9F2TelR029579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 19:29:40 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 14 Oct 2015 19:29:40 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Oct 2015 10:21:04 +0800
Message-ID: <1444875665-5203-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] openldap: 2.4.41 -> 2.4.42
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
X-List-Received-Date: Thu, 15 Oct 2015 02:29:43 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade phpmyadmin from 2.4.41 to 2.4.42. And backport patch from

http://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=commitdiff;h=6fe51a9

to fix CVE-2015-6908.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../openldap/openldap-fix-CVE-2015-6908.patch      | 28 ++++++++++++++++++++++
 .../{openldap_2.4.41.bb => openldap_2.4.42.bb}     |  6 +++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-fix-CVE-2015-6908.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.41.bb => openldap_2.4.42.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-fix-CVE-2015-6908.patch b/meta-oe/recipes-support/openldap/openldap/openldap-fix-CVE-2015-6908.patch
new file mode 100644
index 0000000..34c87cc
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-fix-CVE-2015-6908.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 6fe51a9ab04fd28bbc171da3cf12f1c1040d6629 Mon Sep 17 00:00:00 2001
+From: Howard Chu <hyc@openldap.org>
+Date: Thu, 10 Sep 2015 00:37:32 +0100
+Subject: [PATCH 1/1] ITS#8240 remove obsolete assert
+
+---
+ libraries/liblber/io.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libraries/liblber/io.c b/libraries/liblber/io.c
+index 85c3e23..c05dcf8 100644
+--- a/libraries/liblber/io.c
++++ b/libraries/liblber/io.c
+@@ -679,7 +679,7 @@ done:
+ 		return (ber->ber_tag);
+ 	}
+ 
+-	assert( 0 ); /* ber structure is messed up ?*/
++	/* invalid input */
+ 	return LBER_DEFAULT;
+ }
+ 
+-- 
+1.7.10.4
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.41.bb b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.4.41.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.42.bb
index e4a928f..49fcb56 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.41.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
@@ -24,9 +24,11 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://initscript \
     file://slapd.service \
     file://thread_stub.patch \
+    file://openldap-fix-CVE-2015-6908.patch \
 "
-SRC_URI[md5sum] = "3f1a4cea52827e18feaedfdc1634b5d0"
-SRC_URI[sha256sum] = "27856bb4a8b44feca2b326c309000e16a9dadd52362c8ab6eec6c67a43737f6e"
+
+SRC_URI[md5sum] = "47c8e2f283647a6105b8b0325257e922"
+SRC_URI[sha256sum] = "eeb7b0e2c5852bfd2650e83909bb6152835c0b862fab10b63954dc1bcbba8e63"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.6.1


