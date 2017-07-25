Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E432A6E660
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 08:34:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21774183"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jul 2017 16:34:15 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 48BE846B5E00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 16:34:09 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 25 Jul 2017 16:34:08 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Jul 2017 16:33:49 +0800
Message-ID: <1500971629-1042-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 48BE846B5E00.A7B06
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] openldap: 2.4.44 -> 2.4.45
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
X-List-Received-Date: Tue, 25 Jul 2017 08:34:17 -0000
Content-Type: text/plain

1) Upgrade openldap from 2.4.44 to 2.4.45
2) Delete openldap-CVE-2017-9287.patch, since it is integrated upstream.
3) License checksum changed, since the copyright years were updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../openldap/openldap/openldap-CVE-2017-9287.patch | 30 ----------------------
 .../{openldap_2.4.44.bb => openldap_2.4.45.bb}     |  7 +++--
 2 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-CVE-2017-9287.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.44.bb => openldap_2.4.45.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2017-9287.patch b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2017-9287.patch
deleted file mode 100644
index 93e9243..0000000
--- a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2017-9287.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e0e65f309dc0eb5582387acf1b2c2b5b3955f6b6 Mon Sep 17 00:00:00 2001
-From: Ryan Tandy <ryan@nardis.ca>
-Date: Wed, 17 May 2017 20:07:39 -0700
-Subject: [PATCH] Fix double free of search base with page size 0
-
-CVE: CVE-2017-9287
-Upstream-Status: Submitted
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
----
- servers/slapd/back-mdb/search.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/servers/slapd/back-mdb/search.c b/servers/slapd/back-mdb/search.c
-index 009939d..d0db918 100644
---- a/servers/slapd/back-mdb/search.c
-+++ b/servers/slapd/back-mdb/search.c
-@@ -1066,7 +1066,8 @@ notfound:
- 			/* check size limit */
- 			if ( get_pagedresults(op) > SLAP_CONTROL_IGNORED ) {
- 				if ( rs->sr_nentries >= ((PagedResultsState *)op->o_pagedresults_state)->ps_size ) {
--					mdb_entry_return( op, e );
-+					if (e != base)
-+						mdb_entry_return( op, e );
- 					e = NULL;
- 					send_paged_response( op, rs, &lastid, tentries );
- 					goto done;
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb b/meta-oe/recipes-support/openldap/openldap_2.4.45.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.4.44.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.45.bb
index 2d3cfc0..adbf8ce 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.45.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c933fba6d89fda89f58df1e086e3f2e7 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=25fd3721960f39128cd15a749fd21139 \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
 "
 SECTION = "libs"
@@ -25,11 +25,10 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://slapd.service \
     file://thread_stub.patch \
     file://openldap-CVE-2015-3276.patch \
-    file://openldap-CVE-2017-9287.patch \
 "
 
-SRC_URI[md5sum] = "693ac26de86231f8dcae2b4e9d768e51"
-SRC_URI[sha256sum] = "d7de6bf3c67009c95525dde3a0212cc110d0a70b92af2af8e3ee800e81b88400"
+SRC_URI[md5sum] = "00ff8301277cdfd0af728a6927042a13"
+SRC_URI[sha256sum] = "cdd6cffdebcd95161a73305ec13fc7a78e9707b46ca9f84fb897cd5626df3824"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.7.4




