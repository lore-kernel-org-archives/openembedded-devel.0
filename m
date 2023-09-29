Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD35FE728CF
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 17:41:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24211.1696009289510137547
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 10:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=anLj/kGa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8636bada3f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38TAhmSc003692
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 17:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=rQm4A
	fjayZTxf7ZUa7TNQcMzlyBaD2eJeljkkpK9v14=; b=anLj/kGaXadoPPt+xdsVQ
	6Jp7ysjw2cu4L49OAQLcdPNa5SZIKVKSwdR8XVzzf/DQnfP2DoOt49xM/EXHACDy
	0FoV7h2/t1Cyswbjs/PPna5nKG5byO0wlbpUKEKnCI0YYl1J3IgIxagKy+OGmDfp
	61kaBzEiBQiBnXjQmsT3OU/VJn3SvT94k/62frAg9208gmGQ8RDPSe/0S7IHkIaM
	QZ/y0EN6SbADuO3bs2W8GFNjdzst+4mAaFabhthOAGvdostuhmXyECSmKwPUnKZ1
	JD3LgyDnoO0a/5YtyWNT63WNW9ZnxaLXB6IqofD2HOvcXzPoGAJXGgeXTzSSxLI8
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x6fwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 17:41:28 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 10:41:25 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/3] samba: fix CVE-2023-34966
Date: Fri, 29 Sep 2023 17:41:10 +0000
Message-ID: <20230929174112.3060625-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 3RmapaoFbk27Ug8Z731CtKgJUC0dtHUd
X-Proofpoint-GUID: 3RmapaoFbk27Ug8Z731CtKgJUC0dtHUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_16,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309290153
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 17:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105253

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2023-34966_0001.patch     |  78 ++++++++++
 .../samba/samba/CVE-2023-34966_0002.patch     | 140 ++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |   2 +
 3 files changed, 220 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch
new file mode 100644
index 000000000..77a383f09
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch
@@ -0,0 +1,78 @@
+From 38664163fcac985d87e4274d198568e0fe88595e Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Fri, 26 May 2023 13:06:19 +0200
+Subject: [PATCH] CVE-2023-34966: mdssvc: harden sl_unpack_loop()
+
+A malicious client could send a packet where subcount is zero, leading to a busy
+loop because
+
+    count -= subcount
+=>  count -= 0
+=>  while (count > 0)
+
+loops forever.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=15340
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/38664163fcac985d87e4274d198568e0fe88595e]
+
+CVE: CVE-2023-34966
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/marshalling.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/source3/rpc_server/mdssvc/marshalling.c b/source3/rpc_server/mdssvc/marshalling.c
+index 9ba6ef571f2..d794ba15838 100644
+--- a/source3/rpc_server/mdssvc/marshalling.c
++++ b/source3/rpc_server/mdssvc/marshalling.c
+@@ -1119,7 +1119,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+			sl_nil_t nil = 0;
+
+			subcount = tag.count;
+-			if (subcount > count) {
++			if (subcount < 1 || subcount > count) {
+				return -1;
+			}
+			for (i = 0; i < subcount; i++) {
+@@ -1147,7 +1147,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+
+		case SQ_TYPE_INT64:
+			subcount = sl_unpack_ints(query, buf, offset, bufsize, encoding);
+-			if (subcount == -1 || subcount > count) {
++			if (subcount < 1 || subcount > count) {
+				return -1;
+			}
+			offset += tag.size;
+@@ -1156,7 +1156,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+
+		case SQ_TYPE_UUID:
+			subcount = sl_unpack_uuid(query, buf, offset, bufsize, encoding);
+-			if (subcount == -1 || subcount > count) {
++			if (subcount < 1 || subcount > count) {
+				return -1;
+			}
+			offset += tag.size;
+@@ -1165,7 +1165,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+
+		case SQ_TYPE_FLOAT:
+			subcount = sl_unpack_floats(query, buf, offset, bufsize, encoding);
+-			if (subcount == -1 || subcount > count) {
++			if (subcount < 1 || subcount > count) {
+				return -1;
+			}
+			offset += tag.size;
+@@ -1174,7 +1174,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+
+		case SQ_TYPE_DATE:
+			subcount = sl_unpack_date(query, buf, offset, bufsize, encoding);
+-			if (subcount == -1 || subcount > count) {
++			if (subcount < 1 || subcount > count) {
+				return -1;
+			}
+			offset += tag.size;
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch
new file mode 100644
index 000000000..a86d1729c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch
@@ -0,0 +1,140 @@
+From 10b6890d26b3c7a829a9e9a05ad1d1ff54daeca9 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Wed, 31 May 2023 15:34:26 +0200
+Subject: [PATCH] CVE-2023-34966: CI: test for sl_unpack_loop()
+
+Send a maliciously crafted packet where a nil type has a subcount of 0. This
+triggers an endless loop in mdssvc sl_unpack_loop().
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=15340
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/10b6890d26b3c7a829a9e9a05ad1d1ff54daeca9]
+
+CVE: CVE-2023-34966
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source4/torture/rpc/mdssvc.c | 100 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 100 insertions(+)
+
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c
+index 2d2a8306412..a9956ef8f1d 100644
+--- a/source4/torture/rpc/mdssvc.c
++++ b/source4/torture/rpc/mdssvc.c
+@@ -581,6 +581,102 @@ done:
+	return ok;
+ }
+
++static uint8_t test_sl_unpack_loop_buf[] = {
++	0x34, 0x33, 0x32, 0x31, 0x33, 0x30, 0x64, 0x6d,
++	0x1d, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00,
++	0x01, 0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0x00,
++	0x01, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00,
++	0x01, 0x00, 0x00, 0x02, 0x03, 0x00, 0x00, 0x00,
++	0x06, 0x00, 0x00, 0x07, 0x04, 0x00, 0x00, 0x00,
++	0x66, 0x65, 0x74, 0x63, 0x68, 0x41, 0x74, 0x74,
++	0x72, 0x69, 0x62, 0x75, 0x74, 0x65, 0x73, 0x3a,
++	0x66, 0x6f, 0x72, 0x4f, 0x49, 0x44, 0x41, 0x72,
++	0x72, 0x61, 0x79, 0x3a, 0x63, 0x6f, 0x6e, 0x74,
++	0x65, 0x78, 0x74, 0x3a, 0x00, 0x00, 0x00, 0xea,
++	0x02, 0x00, 0x00, 0x84, 0x02, 0x00, 0x00, 0x00,
++	0x0a, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++	0x01, 0x00, 0x00, 0x02, 0x04, 0x00, 0x00, 0x00,
++	0x01, 0x00, 0x00, 0x02, 0x05, 0x00, 0x00, 0x00,
++	0x03, 0x00, 0x00, 0x07, 0x03, 0x00, 0x00, 0x00,
++	0x6b, 0x4d, 0x44, 0x49, 0x74, 0x65, 0x6d, 0x50,
++	0x61, 0x74, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00,
++	0x01, 0x00, 0x00, 0x02, 0x06, 0x00, 0x00, 0x00,
++	0x03, 0x00, 0x00, 0x87, 0x08, 0x00, 0x00, 0x00,
++	0x01, 0x00, 0xdd, 0x0a, 0x20, 0x00, 0x00, 0x6b,
++	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++	0x07, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x00,
++	0x02, 0x00, 0x00, 0x0a, 0x03, 0x00, 0x00, 0x00,
++	0x03, 0x00, 0x00, 0x0a, 0x03, 0x00, 0x00, 0x00,
++	0x04, 0x00, 0x00, 0x0c, 0x04, 0x00, 0x00, 0x00,
++	0x0e, 0x00, 0x00, 0x0a, 0x01, 0x00, 0x00, 0x00,
++	0x0f, 0x00, 0x00, 0x0c, 0x03, 0x00, 0x00, 0x00,
++	0x13, 0x00, 0x00, 0x1a, 0x00, 0x00, 0x00, 0x00,
++	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++	0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00,
++	0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
++	0x00, 0x00, 0x00, 0x00
++};
++
++static bool test_mdssvc_sl_unpack_loop(struct torture_context *tctx,
++				       void *data)
++{
++	struct torture_mdsscv_state *state = talloc_get_type_abort(
++		data, struct torture_mdsscv_state);
++	struct dcerpc_binding_handle *b = state->p->binding_handle;
++	struct mdssvc_blob request_blob;
++	struct mdssvc_blob response_blob;
++	uint32_t device_id;
++	uint32_t unkn2;
++	uint32_t unkn9;
++	uint32_t fragment;
++	uint32_t flags;
++	NTSTATUS status;
++	bool ok = true;
++
++	device_id = UINT32_C(0x2f000045);
++	unkn2 = 23;
++	unkn9 = 0;
++	fragment = 0;
++	flags = UINT32_C(0x6b000001);
++
++	request_blob.spotlight_blob = test_sl_unpack_loop_buf;
++	request_blob.size = sizeof(test_sl_unpack_loop_buf);
++	request_blob.length = sizeof(test_sl_unpack_loop_buf);
++
++	response_blob.spotlight_blob = talloc_array(state,
++						    uint8_t,
++						    0);
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
++		"dcerpc_mdssvc_unknown1 failed\n");
++
++done:
++	return ok;
++}
++
+ static bool test_mdssvc_invalid_ph_close(struct torture_context *tctx,
+					 void *data)
+ {
+@@ -856,5 +952,9 @@ struct torture_suite *torture_rpc_mdssvc(TALLOC_CTX *mem_ctx)
+				      "fetch_unknown_cnid",
+				      test_mdssvc_fetch_attr_unknown_cnid);
+
++	torture_tcase_add_simple_test(tcase,
++				      "mdssvc_sl_unpack_loop",
++				      test_mdssvc_sl_unpack_loop);
++
+	return suite;
+ }
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 72021745b..11b6ade40 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -33,6 +33,8 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2022-45142.patch;patchdir=source4/heimdal \
            file://CVE-2022-41916.patch;patchdir=source4/heimdal \
            file://CVE-2021-44758.patch;patchdir=source4/heimdal \
+           file://CVE-2023-34966_0001.patch \
+           file://CVE-2023-34966_0002.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


