Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id B273277D24
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 05:44:35 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym04.jp.fujitsu.com with smtp
	id 3f89_5153_4a3b9bbb_58da_42ca_b52e_9d510736f356;
	Fri, 09 Jun 2017 14:44:30 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E45EAC00F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 14:44:29 +0900 (JST)
Received: from g01jpexchkw37.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	4636DBD646B for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 14:44:28 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw37.g01.fujitsu.local (10.0.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 9 Jun 2017 14:44:28 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jun 2017 14:45:49 +0900
Message-ID: <1496987149-7987-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] openldap: Fix CVE-2017-9287
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
X-List-Received-Date: Fri, 09 Jun 2017 05:44:37 -0000
Content-Type: text/plain

servers/slapd/back-mdb/search.c in OpenLDAP through 2.4.44 is
prone to a double free vulnerability. A user with access to
search the directory can crash slapd by issuing a search including the
Paged Results control with a page size of 0.

Patch reference:
http://www.openldap.org/its/?findid=8655

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../openldap/openldap/openldap-CVE-2017-9287.patch | 30 ++++++++++++++++++++++
 .../recipes-support/openldap/openldap_2.4.44.bb    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-CVE-2017-9287.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2017-9287.patch b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2017-9287.patch
new file mode 100644
index 0000000..93e9243
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2017-9287.patch
@@ -0,0 +1,30 @@
+From e0e65f309dc0eb5582387acf1b2c2b5b3955f6b6 Mon Sep 17 00:00:00 2001
+From: Ryan Tandy <ryan@nardis.ca>
+Date: Wed, 17 May 2017 20:07:39 -0700
+Subject: [PATCH] Fix double free of search base with page size 0
+
+CVE: CVE-2017-9287
+Upstream-Status: Submitted
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+---
+ servers/slapd/back-mdb/search.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/servers/slapd/back-mdb/search.c b/servers/slapd/back-mdb/search.c
+index 009939d..d0db918 100644
+--- a/servers/slapd/back-mdb/search.c
++++ b/servers/slapd/back-mdb/search.c
+@@ -1066,7 +1066,8 @@ notfound:
+ 			/* check size limit */
+ 			if ( get_pagedresults(op) > SLAP_CONTROL_IGNORED ) {
+ 				if ( rs->sr_nentries >= ((PagedResultsState *)op->o_pagedresults_state)->ps_size ) {
+-					mdb_entry_return( op, e );
++					if (e != base)
++						mdb_entry_return( op, e );
+ 					e = NULL;
+ 					send_paged_response( op, rs, &lastid, tentries );
+ 					goto done;
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
index 4b7ed35..2d3cfc0 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
@@ -25,6 +25,7 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://slapd.service \
     file://thread_stub.patch \
     file://openldap-CVE-2015-3276.patch \
+    file://openldap-CVE-2017-9287.patch \
 "
 
 SRC_URI[md5sum] = "693ac26de86231f8dcae2b4e9d768e51"
-- 
1.9.1


