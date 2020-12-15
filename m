Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.7737.1608017507135328391
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 23:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; 
   d="scan'208";a="102408739"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Dec 2020 15:31:53 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A672E4CE600B
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Dec 2020 15:31:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Dec 2020 15:31:50 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH 2/2] samba: CVE-2020-14383 Security Advisory
Date: Tue, 15 Dec 2020 15:31:50 +0800
Message-ID: <1608017510-56252-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A672E4CE600B.A9BCC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-14383

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../samba/samba/CVE-2020-14383.patch          | 112 ++++++++++++++++++
 .../samba/samba_4.10.18.bb                    |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
new file mode 100644
index 000000000..c4e79b566
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
@@ -0,0 +1,112 @@
+From ff17443fe761eda864d13957bec45f5bac478fe3 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Fri, 11 Dec 2020 14:34:31 +0900
+Subject: [PATCH] CVE-2020-14383: s4/dns: Ensure variable initialization with 
+ NULL. do not crash when additional data not found
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Found by Francis Brosnan BlÃ¡zquez <francis@aspl.es>.
+Based on patches from Francis Brosnan BlÃ¡zquez <francis@aspl.es>
+and Jeremy Allison <jra@samba.org>
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=14472
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=12795
+
+Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Reviewed-by: Jeremy Allison <jra@samba.org>
+
+Autobuild-User(master): Douglas Bagnall <dbagnall@samba.org>
+Autobuild-Date(master): Mon Aug 24 00:21:41 UTC 2020 on sn-devel-184
+
+(based on commit df98e7db04c901259dd089e20cd557bdbdeaf379)
+(based on commit 7afe449e7201be92bed8e53cbb37b74af720ef4e
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ .../rpc_server/dnsserver/dcerpc_dnsserver.c   | 31 ++++++++++---------
+ 1 file changed, 17 insertions(+), 14 deletions(-)
+
+diff --git a/source4/rpc_server/dnsserver/dcerpc_dnsserver.c b/source4/rpc_server/dnsserver/dcerpc_dnsserver.c
+index 910de9a1..618c7096 100644
+--- a/source4/rpc_server/dnsserver/dcerpc_dnsserver.c
++++ b/source4/rpc_server/dnsserver/dcerpc_dnsserver.c
+@@ -1754,15 +1754,17 @@ static WERROR dnsserver_enumerate_records(struct dnsserver_state *dsstate,
+ 	TALLOC_CTX *tmp_ctx;
+ 	char *name;
+ 	const char * const attrs[] = { "name", "dnsRecord", NULL };
+-	struct ldb_result *res;
+-	struct DNS_RPC_RECORDS_ARRAY *recs;
++	struct ldb_result *res = NULL;
++	struct DNS_RPC_RECORDS_ARRAY *recs = NULL;
+ 	char **add_names = NULL;
+-	char *rname;
++	char *rname = NULL;
+ 	const char *preference_name = NULL;
+ 	int add_count = 0;
+ 	int i, ret, len;
+ 	WERROR status;
+-	struct dns_tree *tree, *base, *node;
++	struct dns_tree *tree = NULL;
++	struct dns_tree *base = NULL;
++	struct dns_tree *node = NULL;
+ 
+ 	tmp_ctx = talloc_new(mem_ctx);
+ 	W_ERROR_HAVE_NO_MEMORY(tmp_ctx);
+@@ -1845,15 +1847,15 @@ static WERROR dnsserver_enumerate_records(struct dnsserver_state *dsstate,
+ 		}
+ 	}
+ 
+-	talloc_free(res);
+-	talloc_free(tree);
+-	talloc_free(name);
++	TALLOC_FREE(res);
++	TALLOC_FREE(tree);
++	TALLOC_FREE(name);
+ 
+ 	/* Add any additional records */
+ 	if (select_flag & DNS_RPC_VIEW_ADDITIONAL_DATA) {
+ 		for (i=0; i<add_count; i++) {
+-			struct dnsserver_zone *z2;
+-
++			struct dnsserver_zone *z2 = NULL;
++			struct ldb_message *msg = NULL;
+ 			/* Search all the available zones for additional name */
+ 			for (z2 = dsstate->zones; z2; z2 = z2->next) {
+ 				char *encoded_name;
+@@ -1865,14 +1867,15 @@ static WERROR dnsserver_enumerate_records(struct dnsserver_state *dsstate,
+ 						LDB_SCOPE_ONELEVEL, attrs,
+ 						"(&(objectClass=dnsNode)(name=%s)(!(dNSTombstoned=TRUE)))",
+ 						encoded_name);
+-				talloc_free(name);
++				TALLOC_FREE(name);
+ 				if (ret != LDB_SUCCESS) {
+ 					continue;
+ 				}
+ 				if (res->count == 1) {
++					msg = res->msgs[0];
+ 					break;
+ 				} else {
+-					talloc_free(res);
++					TALLOC_FREE(res);
+ 					continue;
+ 				}
+ 			}
+@@ -1885,10 +1888,10 @@ static WERROR dnsserver_enumerate_records(struct dnsserver_state *dsstate,
+ 			}
+ 			status = dns_fill_records_array(tmp_ctx, NULL, DNS_TYPE_A,
+ 							select_flag, rname,
+-							res->msgs[0], 0, recs,
++							msg, 0, recs,
+ 							NULL, NULL);
+-			talloc_free(rname);
+-			talloc_free(res);
++			TALLOC_FREE(rname);
++			TALLOC_FREE(res);
+ 		}
+ 	}
+ 
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
index 923b2ddf1..1a982368e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
@@ -29,6 +29,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0001-Add-options-to-configure-the-use-of-libbsd.patch \
            file://0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch \
            file://CVE-2020-14318.patch \
+           file://CVE-2020-14383.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
-- 
2.25.1



