Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id 801256E5CC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 00:49:43 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym01.jp.fujitsu.com with smtp
	id 3e07_a1a8_be843485_0a10_4d6c_a7e5_baa59db49e6d;
	Fri, 11 Dec 2015 09:49:35 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id B715FAC0948
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 09:49:34 +0900 (JST)
Received: from g01jpexchyt37.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	0CECB6D647B for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 09:49:34 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt37.g01.fujitsu.local (10.128.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 11 Dec 2015 09:49:32 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Dec 2015 09:50:39 +0900
Message-ID: <1449795039-26885-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] openldap: upgrade to 2.4.43
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
X-List-Received-Date: Fri, 11 Dec 2015 00:49:45 -0000
Content-Type: text/plain

1. Upgrade openldap from 2.4.42 to 2.4.43
2. Delete patch file openldap-fix-CVE-2015-6908.patch
because the bug(ITS#8240) has been fixed in OpenLDAP 2.4.43

http://www.openldap.org/software/release/changes.html

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../openldap/openldap-fix-CVE-2015-6908.patch      | 28 ----------------------
 .../{openldap_2.4.42.bb => openldap_2.4.43.bb}     |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-fix-CVE-2015-6908.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.42.bb => openldap_2.4.43.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-fix-CVE-2015-6908.patch b/meta-oe/recipes-support/openldap/openldap/openldap-fix-CVE-2015-6908.patch
deleted file mode 100644
index 34c87cc..0000000
--- a/meta-oe/recipes-support/openldap/openldap/openldap-fix-CVE-2015-6908.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 6fe51a9ab04fd28bbc171da3cf12f1c1040d6629 Mon Sep 17 00:00:00 2001
-From: Howard Chu <hyc@openldap.org>
-Date: Thu, 10 Sep 2015 00:37:32 +0100
-Subject: [PATCH 1/1] ITS#8240 remove obsolete assert
-
----
- libraries/liblber/io.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libraries/liblber/io.c b/libraries/liblber/io.c
-index 85c3e23..c05dcf8 100644
---- a/libraries/liblber/io.c
-+++ b/libraries/liblber/io.c
-@@ -679,7 +679,7 @@ done:
- 		return (ber->ber_tag);
- 	}
- 
--	assert( 0 ); /* ber structure is messed up ?*/
-+	/* invalid input */
- 	return LBER_DEFAULT;
- }
- 
--- 
-1.7.10.4
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb b/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.4.42.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.43.bb
index 49fcb56..c4a52b1 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
@@ -24,11 +24,10 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://initscript \
     file://slapd.service \
     file://thread_stub.patch \
-    file://openldap-fix-CVE-2015-6908.patch \
 "
 
-SRC_URI[md5sum] = "47c8e2f283647a6105b8b0325257e922"
-SRC_URI[sha256sum] = "eeb7b0e2c5852bfd2650e83909bb6152835c0b862fab10b63954dc1bcbba8e63"
+SRC_URI[md5sum] = "49ca65e27891fcf977d78c10f073c705"
+SRC_URI[sha256sum] = "34d78e5598a2b0360d26a9050fcdbbe198c65493b013bb607839d5598b6978c8"
 
 DEPENDS = "util-linux groff-native"
 
-- 
1.8.4.2


