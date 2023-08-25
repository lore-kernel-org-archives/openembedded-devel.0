Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051DEC71133
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 07:39:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8577.1692949183087271752
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 00:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T5G+2XhE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76017e5574=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37P5aDb7014864
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 07:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=pDOeB
	Tk4MJsIuLu1UxHxUVhMB6PVcR7iE0T/WPm7esY=; b=T5G+2XhE2ntyrv8sVRPJv
	6CuchPo+lC88MV9VijcGOzgrU54W+bB1OEy/ggwEhVAjIPF/WSWnnxaHkPQI7JLy
	UqwAaTq9npf/851OMc3l5yW/lKEvWTr7KGFn4RuyGEyXzANbMdHJ1sfY2YTS7J/g
	b+y9pJ3C5lckKSMnUTBnBYGxLDTonVzZXZtIniNuyj5mWo1B2HGZ9ecOWBRMYAUU
	KfE2ah/BlqnFACUYpX2ITnrewPxLLAMcxFsU/hhtwN0dq5X+DAzDbnizALHv1uJM
	OuBc/r+UVX0mMtLR7zMr30QGtzsiptQF2tgfo1MAKkxs9OPJDLJsLjSOod3jmoNV
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn21ktxuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 07:39:42 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 00:39:39 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][master][mickledore][PATCH 1/1] krb5: Fix CVE-2023-36054
Date: Fri, 25 Aug 2023 07:39:23 +0000
Message-ID: <20230825073923.1528500-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 8CKiZVAwnn5k2hK1vDSQTqwmlujWSDXG
X-Proofpoint-GUID: 8CKiZVAwnn5k2hK1vDSQTqwmlujWSDXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_05,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=861 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308250066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 07:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104600

From: Soumya Sambu <soumya.sambu@windriver.com>

lib/kadm5/kadm_rpc_xdr.c in MIT Kerberos 5 (aka krb5) before 1.20.2
and 1.21.x before 1.21.1 frees an uninitialized pointer. A remote
authenticated user can trigger a kadmind crash. This occurs because
_xdr_kadm5_principal_ent_rec does not validate the relationship
between n_key_data and the key_data array count.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-36054

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../krb5/krb5/CVE-2023-36054.patch            | 68 +++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.20.1.bb  |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch
new file mode 100644
index 000000000..160c090bc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch
@@ -0,0 +1,68 @@
+From ef08b09c9459551aabbe7924fb176f1583053cdd Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Mon, 21 Aug 2023 03:08:15 +0000
+Subject: [PATCH] Ensure array count consistency in kadm5 RPC
+
+In _xdr_kadm5_principal_ent_rec(), ensure that n_key_data matches the
+key_data array count when decoding.  Otherwise when the structure is
+later freed, xdr_array() could iterate over the wrong number of
+elements, either leaking some memory or freeing uninitialized
+pointers.  Reported by Robert Morris.
+
+CVE: CVE-2023-36054
+
+An authenticated attacker can cause a kadmind process to crash by
+freeing uninitialized pointers.  Remote code execution is unlikely.
+An attacker with control of a kadmin server can cause a kadmin client
+to crash by freeing uninitialized pointers.
+
+ticket: 9099 (new)
+tags: pullup
+target_version: 1.21-next
+target_version: 1.20-next
+
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/ef08b09c9459551aabbe7924fb176f1583053cdd]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/lib/kadm5/kadm_rpc_xdr.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/kadm5/kadm_rpc_xdr.c b/src/lib/kadm5/kadm_rpc_xdr.c
+index 2892d41..94b1ce8 100644
+--- a/src/lib/kadm5/kadm_rpc_xdr.c
++++ b/src/lib/kadm5/kadm_rpc_xdr.c
+@@ -390,6 +390,7 @@ _xdr_kadm5_principal_ent_rec(XDR *xdrs, kadm5_principal_ent_rec *objp,
+			     int v)
+ {
+	unsigned int n;
++	bool_t r;
+
+	if (!xdr_krb5_principal(xdrs, &objp->principal)) {
+		return (FALSE);
+@@ -443,6 +444,9 @@ _xdr_kadm5_principal_ent_rec(XDR *xdrs, kadm5_principal_ent_rec *objp,
+	if (!xdr_krb5_int16(xdrs, &objp->n_key_data)) {
+		return (FALSE);
+	}
++	if (xdrs->x_op == XDR_DECODE && objp->n_key_data < 0) {
++		return (FALSE);
++	}
+	if (!xdr_krb5_int16(xdrs, &objp->n_tl_data)) {
+		return (FALSE);
+	}
+@@ -451,9 +455,10 @@ _xdr_kadm5_principal_ent_rec(XDR *xdrs, kadm5_principal_ent_rec *objp,
+		return FALSE;
+	}
+	n = objp->n_key_data;
+-	if (!xdr_array(xdrs, (caddr_t *) &objp->key_data,
+-		       &n, ~0, sizeof(krb5_key_data),
+-		       xdr_krb5_key_data_nocontents)) {
++	r = xdr_array(xdrs, (caddr_t *) &objp->key_data, &n, objp->n_key_data,
++		      sizeof(krb5_key_data), xdr_krb5_key_data_nocontents);
++	objp->n_key_data = n;
++	if (!r) {
+		return (FALSE);
+	}
+
+--
+2.40.0
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
index 10fff11c2..e353b58aa 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://etc/default/krb5-admin-server \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
+           file://CVE-2023-36054.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "73f5780e7b587ccd8b8cfc10c965a686"
 SRC_URI[sha256sum] = "704aed49b19eb5a7178b34b2873620ec299db08752d6a8574f95d41879ab8851"
-- 
2.40.0


