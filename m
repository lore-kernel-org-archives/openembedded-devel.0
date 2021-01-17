Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.21185.1610905600077942507
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CCfeQgJQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id b8so7341649plh.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=T8G206ZeLN8c+TWbQiDD9bzzSPKGd9IRnLTaPI2sBPU=;
        b=CCfeQgJQS/Jjgv0OP1X7zdeV5xeyrt/syKMw48VbcAX2qXa/6IMaPmxTfngJM8WdcB
         L79S22ZXyQC1TMO5F01phfp8V7xELXTef5qSgs7UCa4gRc8lRHCp+5I9yeM/6GPJAl+U
         sdy5KbHwNJBp2PJDWexBQkM/Uw5PPyhWQvTAutcwxYwxMQnvY0vUk4T8PcZj3SxE92Hy
         LKrxDQxvLzO3DMr4MssBngnrwb4Q/12rEJR/MYwhr/2507CAx714zr7v6DY+13AEO22l
         hTx6YeK2VSW+bX2J4sCZxSbmnTxgjp2KNSDQm70bxtdG43+ocmtsO+AFVmHLzZBQTrte
         oF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=T8G206ZeLN8c+TWbQiDD9bzzSPKGd9IRnLTaPI2sBPU=;
        b=gnWeOESWq7gebiQVxAHQlNvuTxCpXwocf2EvDQmnJI68UIp/eBbYASVHCZ0B7KxFMd
         t+zQOUPJeuC96kFmIAAT/T0+IBtqIA76ozOwAaSm0oOjLou0PaBoZyfL4aB7XMPDwEtA
         H749WKcY5b/69VomO3jFOkS3O/MxJOytVCAMguVr2vDTXaIUitXULzfsrUCmC/TBkfSk
         THl5XQb2PCNBwaV5Luc5ve8RGYQ4/3vybRcUGXhPrONrnn+eMbqn/AV0DPeBSS6WIbxg
         4/oGTzvrgMCczN6UMMVvOGYqYzeLCgGJwUV78jr2Nmr9sGgk6Fthj+HxrNkNHbARaMZj
         HveA==
X-Gm-Message-State: AOAM530xI9rma9mKItf9flqzPap8dXgTiGQibLTfTWCL18nvCfhnnqnQ
	5MWEGtxK5lpokLb54Ru5YQ1HSRLF7fMsjw==
X-Google-Smtp-Source: ABdhPJy24mFDxcllNHi3idftn4FrXzbWsqn2xRfe6gaf46Hdw7fIvnOPUwWWaLLM7aw9WwnP1KsK1A==
X-Received: by 2002:a17:90a:74ca:: with SMTP id p10mr22296244pjl.34.1610905599401;
        Sun, 17 Jan 2021 09:46:39 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:38 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/28] samba: CVE-2020-14383 Security Advisory
Date: Sun, 17 Jan 2021 09:46:06 -0800
Message-Id: <65985a6579064d08009adecb6279a5bb599affca.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-14383

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit baee1ebeafce5d6a99dafc30b91e6fb760197686)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 81d14a86353829eba1d55a93d478faf4c5527a89)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../samba/samba/CVE-2020-14383.patch          | 112 ++++++++++++++++++
 .../samba/samba_4.10.18.bb                    |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
new file mode 100644
index 0000000000..3341b80a38
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
index 923b2ddf16..1a982368ec 100644
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
2.17.1

