Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046F5C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 11:46:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.74461.1747136799035024964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 04:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=722802a532=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D5H7VE007109
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 04:46:38 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46j233jt3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 04:46:38 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 13 May 2025 04:46:36 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] poppler: fix CVE-2025-43903
Date: Tue, 13 May 2025 17:16:12 +0530
Message-ID: <20250513114612.2391171-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=EojSrTcA c=1 sm=1 tr=0 ts=6823311e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=dldsdqVgAAAA:8
 a=5wJQu0amyvUBLPbx98cA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=dvvn15oi174MAja8qEYz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDExMiBTYWx0ZWRfXy018/Ka5R+uV y/u5F9vd1DMlvHeqIHJlmQ+SCEdCfvnnp1JkDp05Ix6zisGzfL/O/tzVkTiT3C/RkYMW9q5ZUTR 58bY/rwJKzv8oJOEgTOJPAMoT975rfp4GcaO03gvhnoI/g9wC/qa87BRNX5eFs2/OTYUgI1Gjr2
 yC5QhzZlFZ3aCM4jJwco4kNPYFE/B461F/D1oPskTEQkdHAKwZ4upJh3NktarHD5aqwQ1GgjTji nlshCIcdfoo//WDfB52q+1bmlPuUmDnuHGbOmHJpXQXWKRPGKgtIWdgUBxv0PlC56eXyigjZwq4 3kTmklsppuZC460RyYTQbugZ+9vgEQ4gqCiaZ95WS2HoeCpFMv7Hrq249Qi774SDr9AXKqjjHHj
 uzpFczpjoa5fE1qzhcbVG96ozSD+98a0sjiC9PZA6UTggLzOFFBEFvimHvEQUhq9JwgRbo5a
X-Proofpoint-GUID: mcqkqvgSyWzmxhWWJSmTgQXjxRqDdf6_
X-Proofpoint-ORIG-GUID: mcqkqvgSyWzmxhWWJSmTgQXjxRqDdf6_
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=855 adultscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505130112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 11:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117395

From: Yogita Urade <yogita.urade@windriver.com>

NSSCryptoSignBackend.cc in Poppler before 25.04.0 does not
verify the adbe.pkcs7.sha1 signatures on documents, resulting
in potential signature forgeries.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-43903

Upstream patch:
https://gitlab.freedesktop.org/poppler/poppler/-/commit/f1b9c830f145a0042e853d6462b2f9ca4016c669

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/poppler/CVE-2025-43903.patch      | 54 +++++++++++++++++++
 .../poppler/poppler_22.04.0.bb                |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-43903.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-43903.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-43903.patch
new file mode 100644
index 0000000000..e5acf7492b
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-43903.patch
@@ -0,0 +1,54 @@
+From f1b9c830f145a0042e853d6462b2f9ca4016c669 Mon Sep 17 00:00:00 2001
+From: Juraj sarinay <juraj@sarinay.com>
+Date: Thu, 6 Mar 2025 02:02:56 +0100
+Subject: [PATCH] Properly verify adbe.pkcs7.sha1 signatures.
+
+For signatures with non-empty encapsulated content
+(typically adbe.pkcs7.sha1), we only compared hash values and
+never actually checked SignatureValue within SignerInfo.
+The bug introduced by c7c0207b
+made trivial signature forgeries possible. Fix this by calling
+NSS_CMSSignerInfo_Verify() after the hash values compare equal.
+
+CVE: CVE-2025-43903
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/f1b9c830f145a0042e853d6462b2f9ca4016c669]
+
+Changes:
+- Refresh patch context as per the source code.
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ poppler/SignatureHandler.cc | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/poppler/SignatureHandler.cc b/poppler/SignatureHandler.cc
+index 6538239..4008b2c 100644
+--- a/poppler/SignatureHandler.cc
++++ b/poppler/SignatureHandler.cc
+@@ -969,16 +969,19 @@ SignatureValidationStatus SignatureHandler::validateSignature()
+           This means it's not a detached type signature
+           so the digest is contained in SignedData->contentInfo
+         */
+-        if (memcmp(digest.data, content_info_data->data, hash_length) == 0 && digest.len == content_info_data->len) {
+-            PORT_Free(digest_buffer);
+-            return SIGNATURE_VALID;
+-        } else {
++        if (digest.len != content_info_data->len || memcmp(digest.data, content_info_data->data, digest.len) != 0) {
+             PORT_Free(digest_buffer);
+             return SIGNATURE_DIGEST_MISMATCH;
+         }
+
+-    } else if (NSS_CMSSignerInfo_Verify(CMSSignerInfo, &digest, nullptr) != SECSuccess) {
++        auto innerHashContext = HASH_Create(getHashAlgorithm());
++        HASH_Update(innerHashContext, content_info_data->data, content_info_data->len);
++        HASH_End(innerHashContext, digest_buffer, &result_len, hash_length);
++        digest.data = digest_buffer;
++        digest.len = hash_length;
++    }
+
++    if (NSS_CMSSignerInfo_Verify(CMSSignerInfo, &digest, nullptr) != SECSuccess) {
+         PORT_Free(digest_buffer);
+         return NSS_SigTranslate(CMSSignerInfo->verificationStatus);
+     } else {
+--
+2.40.0
diff --git a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
index 494308b8a5..bb6e64d657 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2024-56378.patch \
            file://CVE-2025-32364.patch \
            file://CVE-2025-32365.patch \
+           file://CVE-2025-43903.patch \
            "
 SRC_URI[sha256sum] = "813fb4b90e7bda63df53205c548602bae728887a60f4048aae4dbd9b1927deff"
 
-- 
2.40.0


