Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F2EE728CF
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 17:41:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24213.1696009292974933862
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 10:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EEaSauP+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8636bada3f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38T6Dipo029535
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 17:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=zeL5ARN9XEtdYV7upBrxY5TwicDJ2GJN9KTzwPDgCFc=; b=
	EEaSauP+j0sN1xunKe/7XDSVshJe0a9r6VDMXu5H5X64zi6ADzXmN6laRL4ucBQn
	/2fcd+Mhg6sq6LgVrUaKPE5AaNv+CF0N7682fcNteDXsRUbMDldn2FC1sMOm+zOn
	VhXsFKWMBiuWFAr8872Uxe/Jbn4TTkfBHvl7XJ4OVL8Utzu3KCR6WSnxnulNvBS+
	ruq6RFFbmAVlAcDivygOP2I5kB7dig3j5U8lN5fUia7yQy6I7j+r+atPEEWd/pKT
	a4Q60GxobYWGu1vOp2Y4cp/sVtsMQZd0CH5DXMybpVA0MG3h3+sOyM9ZJ1mjKhxN
	lzRD57/riX8W84bl2dzuEg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q06edbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 17:41:32 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 10:41:28 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 3/3] samba:fix CVE-2023-34967
Date: Fri, 29 Sep 2023 17:41:12 +0000
Message-ID: <20230929174112.3060625-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230929174112.3060625-1-archana.polampalli@windriver.com>
References: <20230929174112.3060625-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: d2QWuacP5FuqpyGt1AEQ1bVZazLc7WB2
X-Proofpoint-ORIG-GUID: d2QWuacP5FuqpyGt1AEQ1bVZazLc7WB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_16,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309290153
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 17:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105255

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2023-34967_0001.patch     | 178 ++++++++++++++++++
 .../samba/samba/CVE-2023-34967_0002.patch     | 125 ++++++++++++
 .../samba/samba_4.14.14.bb                    |   2 +
 3 files changed, 305 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch
new file mode 100644
index 000000000..e30e54ab9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch
@@ -0,0 +1,178 @@
+From 3b3c30e2acfb00d04c4013e32343bc277d5b1aa8 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Wed, 31 May 2023 16:26:14 +0200
+Subject: [PATCH] CVE-2023-34967: CI: add a test for type checking of
+ dalloc_value_for_key()
+
+Sends a maliciously crafted packet where the value in a key/value style
+dictionary for the "scope" key is a simple string object whereas the server
+expects an array. As the server doesn't perform type validation on the value, it
+crashes when trying to use the "simple" object as a "complex" one.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=15341
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/3b3c30e2acfb00d04c4013e32343bc277d5b1aa8]
+
+CVE: CVE-2023-34967
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source4/torture/rpc/mdssvc.c | 134 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 134 insertions(+)
+
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c
+index f5f5939..1dce403 100644
+--- a/source4/torture/rpc/mdssvc.c
++++ b/source4/torture/rpc/mdssvc.c
+@@ -666,6 +666,136 @@ done:
+	return ok;
+ }
+
++static bool test_sl_dict_type_safety(struct torture_context *tctx,
++				     void *data)
++{
++	struct torture_mdsscv_state *state = talloc_get_type_abort(
++		data, struct torture_mdsscv_state);
++	struct dcerpc_binding_handle *b = state->p->binding_handle;
++	struct mdssvc_blob request_blob;
++	struct mdssvc_blob response_blob;
++	uint64_t ctx1 = 0xdeadbeef;
++	uint64_t ctx2 = 0xcafebabe;
++	uint32_t device_id;
++	uint32_t unkn2;
++	uint32_t unkn9;
++	uint32_t fragment;
++	uint32_t flags;
++	DALLOC_CTX *d = NULL;
++	sl_array_t *array1 = NULL, *array2 = NULL;
++	sl_dict_t *arg = NULL;
++	int result;
++	NTSTATUS status;
++	bool ok = true;
++
++	device_id = UINT32_C(0x2f000045);
++	unkn2 = 23;
++	unkn9 = 0;
++	fragment = 0;
++	flags = UINT32_C(0x6b000001);
++
++	d = dalloc_new(tctx);
++	torture_assert_not_null_goto(tctx, d,
++				     ok, done, "dalloc_new failed\n");
++
++	array1 = dalloc_zero(d, sl_array_t);
++	torture_assert_not_null_goto(tctx, array1,
++				     ok, done, "dalloc_zero failed\n");
++
++	array2 = dalloc_zero(d, sl_array_t);
++	torture_assert_not_null_goto(tctx, array2,
++				     ok, done, "dalloc_new failed\n");
++
++	result = dalloc_stradd(array2, "openQueryWithParams:forContext:");
++	torture_assert_goto(tctx, result == 0,
++			    ok, done, "dalloc_stradd failed\n");
++
++	result = dalloc_add_copy(array2, &ctx1, uint64_t);
++	torture_assert_goto(tctx, result == 0,
++			    ok, done, "dalloc_stradd failed\n");
++
++	result = dalloc_add_copy(array2, &ctx2, uint64_t);
++	torture_assert_goto(tctx, result == 0,
++			    ok, done, "dalloc_stradd failed\n");
++
++	arg = dalloc_zero(array1, sl_dict_t);
++	torture_assert_not_null_goto(tctx, d,
++				     ok, done, "dalloc_zero failed\n");
++
++	result = dalloc_stradd(arg, "kMDQueryString");
++	torture_assert_goto(tctx, result == 0,
++			    ok, done, "dalloc_stradd failed\n");
++
++	result = dalloc_stradd(arg, "*");
++	torture_assert_goto(tctx, result == 0,
++			    ok, done, "dalloc_stradd failed\n");
++
++	result = dalloc_stradd(arg, "kMDScopeArray");
++	torture_assert_goto(tctx, result == 0,
++			    ok, done, "dalloc_stradd failed\n");
++
++	result = dalloc_stradd(arg, "AAAABBBB");
++	torture_assert_goto(tctx, result == 0,
++			    ok, done, "dalloc_stradd failed\n");
++
++	result = dalloc_add(array1, array2, sl_array_t);
++	torture_assert_goto(tctx, result == 0,
++			    ok, done, "dalloc_add failed\n");
++
++	result = dalloc_add(array1, arg, sl_dict_t);
++	torture_assert_goto(tctx, result == 0,
++			    ok, done, "dalloc_add failed\n");
++
++	result = dalloc_add(d, array1, sl_array_t);
++	torture_assert_goto(tctx, result == 0,
++			    ok, done, "dalloc_add failed\n");
++
++	torture_comment(tctx, "%s", dalloc_dump(d, 0));
++
++	request_blob.spotlight_blob = talloc_array(tctx,
++						   uint8_t,
++						   64 * 1024);
++	torture_assert_not_null_goto(tctx, request_blob.spotlight_blob,
++				     ok, done, "dalloc_new failed\n");
++	request_blob.size = 64 * 1024;
++
++	request_blob.length = sl_pack(d,
++				      (char *)request_blob.spotlight_blob,
++				      request_blob.size);
++	torture_assert_goto(tctx, request_blob.length > 0,
++			    ok, done, "sl_pack failed\n");
++
++	response_blob.spotlight_blob = talloc_array(state, uint8_t, 0);
++	torture_assert_not_null_goto(tctx, response_blob.spotlight_blob,
++				     ok, done, "dalloc_zero failed\n");
++	response_blob.size = 0;
++
++	status = dcerpc_mdssvc_cmd(b,
++				   state,
++				   &state->ph,
++				   0,
++				   device_id,
++				   unkn2,
++				   0,
++				   flags,
++				   request_blob,
++				   0,
++				   64 * 1024,
++				   1,
++				   64 * 1024,
++				   0,
++				   0,
++				   &fragment,
++				   &response_blob,
++				   &unkn9);
++	torture_assert_ntstatus_ok_goto(
++		tctx, status, ok, done,
++		"dcerpc_mdssvc_cmd failed\n");
++
++done:
++	return ok;
++}
++
+ static bool test_mdssvc_invalid_ph_close(struct torture_context *tctx,
+					 void *data)
+ {
+@@ -940,6 +1070,10 @@ struct torture_suite *torture_rpc_mdssvc(TALLOC_CTX *mem_ctx)
+	torture_tcase_add_simple_test(tcase,
+				      "mdssvc_sl_unpack_loop",
+				      test_mdssvc_sl_unpack_loop);
++	torture_tcase_add_simple_test(tcase,
++				      "sl_dict_type_safety",
++				      test_sl_dict_type_safety);
++
+
+	return suite;
+ }
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch
new file mode 100644
index 000000000..2e4907ab6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch
@@ -0,0 +1,125 @@
+From 049c13245649fab412b61a5b55e5a7dea72d7c72 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Fri, 26 May 2023 15:06:38 +0200
+Subject: [PATCH] CVE-2023-34967: mdssvc: add type checking to
+ dalloc_value_for_key()
+
+Change the dalloc_value_for_key() function to require an additional final
+argument which denotes the expected type of the value associated with a key. If
+the types don't match, return NULL.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=15341
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/4c60e35add4a1abd04334012a8d6edf1c3f396ba]
+
+CVE: CVE-2023-34967
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/dalloc.c | 14 ++++++++++----
+ source3/rpc_server/mdssvc/mdssvc.c | 17 +++++++++++++----
+ 2 files changed, 23 insertions(+), 8 deletions(-)
+
+diff --git a/source3/rpc_server/mdssvc/dalloc.c b/source3/rpc_server/mdssvc/dalloc.c
+index 007702d..8b79b41 100644
+--- a/source3/rpc_server/mdssvc/dalloc.c
++++ b/source3/rpc_server/mdssvc/dalloc.c
+@@ -159,7 +159,7 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)
+	int result = 0;
+	void *p = NULL;
+	va_list args;
+-	const char *type;
++	const char *type = NULL;
+	int elem;
+	size_t array_len;
+
+@@ -170,7 +170,6 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)
+		array_len = talloc_array_length(d->dd_talloc_array);
+		elem = va_arg(args, int);
+		if (elem >= array_len) {
+-			va_end(args);
+			result = -1;
+			goto done;
+		}
+@@ -178,8 +177,6 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)
+		type = va_arg(args, const char *);
+	}
+
+-	va_end(args);
+-
+	array_len = talloc_array_length(d->dd_talloc_array);
+
+	for (elem = 0; elem + 1 < array_len; elem += 2) {
+@@ -192,8 +189,17 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)
+			break;
+		}
+	}
++	if (p == NULL) {
++		goto done;
++	}
++
++	type = va_arg(args, const char *);
++	if (strcmp(talloc_get_name(p), type) != 0) {
++		p = NULL;
++	}
+
+ done:
++	va_end(args);
+	if (result != 0) {
+		p = NULL;
+	}
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssvc/mdssvc.c
+index a983a88..fe6e0c2 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -884,7 +884,8 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,
+
+	querystring = dalloc_value_for_key(query, "DALLOC_CTX", 0,
+					   "DALLOC_CTX", 1,
+-					   "kMDQueryString");
++					   "kMDQueryString",
++					   "char *");
+	if (querystring == NULL) {
+		DEBUG(1, ("missing kMDQueryString\n"));
+		goto error;
+@@ -924,8 +925,11 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,
+	slq->ctx2 = *uint64p;
+
+	path_scope = dalloc_value_for_key(query, "DALLOC_CTX", 0,
+-					  "DALLOC_CTX", 1, "kMDScopeArray");
++                                          "DALLOC_CTX", 1,
++					  "kMDScopeArray",
++					  "sl_array_t");
+	if (path_scope == NULL) {
++		DBG_ERR("missing kMDScopeArray\n");
+		goto error;
+	}
+
+@@ -940,8 +944,11 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,
+	}
+
+	reqinfo = dalloc_value_for_key(query, "DALLOC_CTX", 0,
+-				       "DALLOC_CTX", 1, "kMDAttributeArray");
++		                       "DALLOC_CTX", 1,
++				       "kMDAttributeArray",
++				       "sl_array_t");
+	if (reqinfo == NULL) {
++		DBG_ERR("missing kMDAttributeArray\n");
+		goto error;
+	}
+
+@@ -949,7 +956,9 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,
+	DEBUG(10, ("requested attributes: %s", dalloc_dump(reqinfo, 0)));
+
+	cnids = dalloc_value_for_key(query, "DALLOC_CTX", 0,
+-				     "DALLOC_CTX", 1, "kMDQueryItemArray");
++			             "DALLOC_CTX", 1,
++				     "kMDQueryItemArray",
++				     "sl_array_t");
+	if (cnids) {
+		ok = sort_cnids(slq, cnids->ca_cnids);
+		if (!ok) {
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index b71c4b3fc..73e8a82e8 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -36,6 +36,8 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2023-34966_0001.patch \
            file://CVE-2023-34966_0002.patch \
            file://CVE-2022-2127.patch \
+           file://CVE-2023-34967_0001.patch \
+           file://CVE-2023-34967_0002.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


