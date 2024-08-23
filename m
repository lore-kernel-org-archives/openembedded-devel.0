Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F41C52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 06:46:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10777.1724395586739660047
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Aug 2024 23:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89651bc72e=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N5EZF9030073
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 06:46:26 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6x7av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 06:46:25 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 23:46:23 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][master][scarthgap][PATCH 1/1] krb5: fix CVE-2024-26458 and CVE-2024-26461
Date: Fri, 23 Aug 2024 06:46:03 +0000
Message-ID: <20240823064603.671901-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: MTSMskrPW27Skohy-fY3uFHG9Pog0TXi
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c83041 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=JhMfiyDoiLEA:10 a=HCiNrPZc1L8A:10 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=Gz7s5_CCAAAA:8 a=u0VBE2UhgT_kSXmcRp8A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=96-UuAdfYG6OSYlHWuPe:22
X-Proofpoint-GUID: MTSMskrPW27Skohy-fY3uFHG9Pog0TXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_04,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 06:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111911

From: Yogita Urade <yogita.urade@windriver.com>

CVE-2024-26458:
Kerberos 5 (aka krb5) 1.21.2 contains a memory leak in
/krb5/src/lib/rpc/pmap_rmt.c.

CVE-2024-26461:
Kerberos 5 (aka krb5) 1.21.2 contains a memory leak
vulnerability in /krb5/src/lib/gssapi/krb5/k5sealv3.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-26458
https://nvd.nist.gov/vuln/detail/CVE-2024-26461

Upstream Patch:
https://github.com/krb5/krb5/commit/c5f9c816107f70139de11b38aa02db2f1774ee0d

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../krb5/CVE-2024-26458_CVE-2024-26461.patch  | 207 ++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.21.3.bb  |   1 +
 2 files changed, 208 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch
new file mode 100644
index 000000000..46eb6aa96
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch
@@ -0,0 +1,207 @@
+From c5f9c816107f70139de11b38aa02db2f1774ee0d Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Tue, 5 Mar 2024 19:53:07 -0500
+Subject: [PATCH] Fix two unlikely memory leaks
+
+In gss_krb5int_make_seal_token_v3(), one of the bounds checks (which
+could probably never be triggered) leaks plain.data.  Fix this leak
+and use current practices for cleanup throughout the function.
+
+In xmt_rmtcallres() (unused within the tree and likely elsewhere),
+store port_ptr into crp->port_ptr as soon as it is allocated;
+otherwise it could leak if the subsequent xdr_u_int32() operation
+fails.
+
+CVE: CVE-2024-26458 CVE-2024-26461
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/c5f9c816107f70139de11b38aa02db2f1774ee0d]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/lib/gssapi/krb5/k5sealv3.c | 56 +++++++++++++++-------------------
+ src/lib/rpc/pmap_rmt.c         |  9 +++---
+ 2 files changed, 29 insertions(+), 36 deletions(-)
+
+diff --git a/src/lib/gssapi/krb5/k5sealv3.c b/src/lib/gssapi/krb5/k5sealv3.c
+index 1fcbdfb..d3210c1 100644
+--- a/src/lib/gssapi/krb5/k5sealv3.c
++++ b/src/lib/gssapi/krb5/k5sealv3.c
+@@ -65,7 +65,7 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+                                 int conf_req_flag, int toktype)
+ {
+     size_t bufsize = 16;
+-    unsigned char *outbuf = 0;
++    unsigned char *outbuf = NULL;
+     krb5_error_code err;
+     int key_usage;
+     unsigned char acceptor_flag;
+@@ -75,9 +75,13 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+ #endif
+     size_t ec;
+     unsigned short tok_id;
+-    krb5_checksum sum;
++    krb5_checksum sum = { 0 };
+     krb5_key key;
+     krb5_cksumtype cksumtype;
++    krb5_data plain = empty_data();
++
++    token->value = NULL;
++    token->length = 0;
+
+     acceptor_flag = ctx->initiate ? 0 : FLAG_SENDER_IS_ACCEPTOR;
+     key_usage = (toktype == KG_TOK_WRAP_MSG
+@@ -107,14 +111,15 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+ #endif
+
+     if (toktype == KG_TOK_WRAP_MSG && conf_req_flag) {
+-        krb5_data plain;
+         krb5_enc_data cipher;
+         size_t ec_max;
+         size_t encrypt_size;
+
+         /* 300: Adds some slop.  */
+-        if (SIZE_MAX - 300 < message->length)
+-            return ENOMEM;
++        if (SIZE_MAX - 300 < message->length) {
++            err = ENOMEM;
++            goto cleanup;
++        }
+         ec_max = SIZE_MAX - message->length - 300;
+         if (ec_max > 0xffff)
+             ec_max = 0xffff;
+@@ -126,20 +131,20 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+ #endif
+         err = alloc_data(&plain, message->length + 16 + ec);
+         if (err)
+-            return err;
++            goto cleanup;
+
+         /* Get size of ciphertext.  */
+         encrypt_size = krb5_encrypt_size(plain.length, key->keyblock.enctype);
+         if (encrypt_size > SIZE_MAX / 2) {
+             err = ENOMEM;
+-            goto error;
++            goto cleanup;
+         }
+         bufsize = 16 + encrypt_size;
+         /* Allocate space for header plus encrypted data.  */
+         outbuf = gssalloc_malloc(bufsize);
+         if (outbuf == NULL) {
+-            free(plain.data);
+-            return ENOMEM;
++            err = ENOMEM;
++            goto cleanup;
+         }
+
+         /* TOK_ID */
+@@ -164,11 +169,8 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+         cipher.ciphertext.length = bufsize - 16;
+         cipher.enctype = key->keyblock.enctype;
+         err = krb5_k_encrypt(context, key, key_usage, 0, &plain, &cipher);
+-        zap(plain.data, plain.length);
+-        free(plain.data);
+-        plain.data = 0;
+         if (err)
+-            goto error;
++            goto cleanup;
+
+         /* Now that we know we're returning a valid token....  */
+         ctx->seq_send++;
+@@ -181,7 +183,6 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+         /* If the rotate fails, don't worry about it.  */
+ #endif
+     } else if (toktype == KG_TOK_WRAP_MSG && !conf_req_flag) {
+-        krb5_data plain;
+         size_t cksumsize;
+
+         /* Here, message is the application-supplied data; message2 is
+@@ -193,21 +194,19 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+     wrap_with_checksum:
+         err = alloc_data(&plain, message->length + 16);
+         if (err)
+-            return err;
++            goto cleanup;
+
+         err = krb5_c_checksum_length(context, cksumtype, &cksumsize);
+         if (err)
+-            goto error;
++            goto cleanup;
+
+         assert(cksumsize <= 0xffff);
+
+         bufsize = 16 + message2->length + cksumsize;
+         outbuf = gssalloc_malloc(bufsize);
+         if (outbuf == NULL) {
+-            free(plain.data);
+-            plain.data = 0;
+             err = ENOMEM;
+-            goto error;
++            goto cleanup;
+         }
+
+         /* TOK_ID */
+@@ -239,23 +238,15 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+         if (message2->length)
+             memcpy(outbuf + 16, message2->value, message2->length);
+
+-        sum.contents = outbuf + 16 + message2->length;
+-        sum.length = cksumsize;
+-
+         err = krb5_k_make_checksum(context, cksumtype, key,
+                                    key_usage, &plain, &sum);
+-        zap(plain.data, plain.length);
+-        free(plain.data);
+-        plain.data = 0;
+         if (err) {
+             zap(outbuf,bufsize);
+-            goto error;
++            goto cleanup;
+         }
+         if (sum.length != cksumsize)
+             abort();
+         memcpy(outbuf + 16 + message2->length, sum.contents, cksumsize);
+-        krb5_free_checksum_contents(context, &sum);
+-        sum.contents = 0;
+         /* Now that we know we're actually generating the token...  */
+         ctx->seq_send++;
+
+@@ -285,12 +276,13 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+
+     token->value = outbuf;
+     token->length = bufsize;
+-    return 0;
++    outbuf = NULL;
++    err = 0;
+
+-error:
++cleanup:
++    krb5_free_checksum_contents(context, &sum);
++    zapfree(plain.data, plain.length);
+     gssalloc_free(outbuf);
+-    token->value = NULL;
+-    token->length = 0;
+     return err;
+ }
+
+diff --git a/src/lib/rpc/pmap_rmt.c b/src/lib/rpc/pmap_rmt.c
+index 8c7e30c..522cb20 100644
+--- a/src/lib/rpc/pmap_rmt.c
++++ b/src/lib/rpc/pmap_rmt.c
+@@ -160,11 +160,12 @@ xdr_rmtcallres(
+	caddr_t port_ptr;
+
+	port_ptr = (caddr_t)(void *)crp->port_ptr;
+-	if (xdr_reference(xdrs, &port_ptr, sizeof (uint32_t),
+-	    xdr_u_int32) && xdr_u_int32(xdrs, &crp->resultslen)) {
+-		crp->port_ptr = (uint32_t *)(void *)port_ptr;
++        if (!xdr_reference(xdrs, &port_ptr, sizeof (uint32_t),
++			   (xdrproc_t)xdr_u_int32))
++		return (FALSE);
++	crp->port_ptr = (uint32_t *)(void *)port_ptr;
++	if (xdr_u_int32(xdrs, &crp->resultslen))
+		return ((*(crp->xdr_results))(xdrs, crp->results_ptr));
+-	}
+	return (FALSE);
+ }
+
+--
+2.40.0
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
index c482472ff..748918132 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://etc/default/krb5-admin-server \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
+           file://CVE-2024-26458_CVE-2024-26461.patch;striplevel=2 \
 "
 
 SRC_URI[sha256sum] = "b7a4cd5ead67fb08b980b21abd150ff7217e85ea320c9ed0c6dadd304840ad35"
-- 
2.40.0


