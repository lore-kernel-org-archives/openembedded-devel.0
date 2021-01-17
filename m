Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.21351.1610905005227859621
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AUirV7fR;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id v1so7976294pjr.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=v+1ucEaIE0sQpe/Q9U66yb7es0ghtNnMKmE/2hiTnnM=;
        b=AUirV7fRNw63aXOPuYpn/oW26lB555JH1GSTXBvLehwbyHWiIcy6wBcld2QvZwIwei
         CpJjMLbOH3j35FWffcfXueR5DGB/f/KGlqRslIznJaz9KYA0UGS00h4Ek93Sy4jnPkDW
         PKCT7t98JoMD3TRNIZC8G+98gEVDz9Ic/mRBLJnlYLmxPoH3NtpkN1323sMd/y183s9E
         dhCInunvCxXv024e3RCzrnrzrbP/YFghEfdUstMKosWWzOWjaNJIAv+SjsAiI7j7Yu4v
         dEJBf/M2Vf59UkRk7vpFOuNg7nNNT/QjOBgSnzHqf9lJKqD4aa40CGvDwZ8EWBdgO5cz
         uYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=v+1ucEaIE0sQpe/Q9U66yb7es0ghtNnMKmE/2hiTnnM=;
        b=S/0zqgqEuiJCuZlhDBc3VVw5/8SDgY2oxZCJ5ddgOovciCbWqVluGOz2S7VYXR/+DX
         UlJtaPkFr19D6hHEF03VA+Od8a7MPH8rz7Bb9Jzx+IIIhhqC4WnYFiuCcP+1eYBrFq9O
         6aBGx8WrNOLEZ3hTmWbZZ7oKm4aSW0D6Lc75HblCWZERX6QJg42LtHrkNKYV2mmVbOUB
         DP9bCHdOnDVPjBk1FGUQmB75Lr/LNJ7fCorfQ+FM7cnJAIv5UcpAsKN1UIXJCPiAqj1D
         IVbDn8R7MLOICNMORDXLOpu6zjrlIy06wsAOcLmkeuLhuIQWstyp4InfFTm4SR7+tE6n
         IrMw==
X-Gm-Message-State: AOAM532N/+bdkw/5nyGg2j5QfQYfMTdqse1IPjHEG1hokFaBzfmdgJpu
	c1Z9cnNEd/uPoZ8rpf/39CvlK23N0iD3Aw==
X-Google-Smtp-Source: ABdhPJw/rApWlUyZ6Fiq7va7lsTCamKbnpexdF3OBljQRpzrdtfPSQQMi0GUHfna8sUVTdHDobmliQ==
X-Received: by 2002:a17:903:230b:b029:dd:7cf1:8c33 with SMTP id d11-20020a170903230bb02900dd7cf18c33mr22456281plh.31.1610905004641;
        Sun, 17 Jan 2021 09:36:44 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:44 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 04/31] samba: CVE-2020-14383 Security Advisory
Date: Sun, 17 Jan 2021 09:36:09 -0800
Message-Id: <81d14a86353829eba1d55a93d478faf4c5527a89.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-14383

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit baee1ebeafce5d6a99dafc30b91e6fb760197686)
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

