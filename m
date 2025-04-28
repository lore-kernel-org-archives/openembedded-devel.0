Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782FBC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 12:53:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.47402.1745844790733667392
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 05:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7213e41726=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SA1ULd023843
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 12:53:10 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468pf92x92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 12:53:09 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 28 Apr 2025 05:53:07 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] poppler: fix CVE-2025-43903
Date: Mon, 28 Apr 2025 12:52:48 +0000
Message-ID: <20250428125248.3188657-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ToeDOz_7ZXAAr6RcJ5YqvJ8Xhdq77tmJ
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=680f7a35 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=dldsdqVgAAAA:8
 a=WjO9WWqw1KPLFoUtmP8A:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=dvvn15oi174MAja8qEYz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEwNiBTYWx0ZWRfX2bpiiQQ62Mz5 V/rQjsOcnVDvTcr4fN9qEzkfmVT3FuDjIr282k6tXFki6G5GUggbzI/ahNC/8rIIlV1tm8yjDlx qJsCUdu7wEglq1LEGD2SPmnXY4u1UZTBFhkILps2aT/982xTQtZ21chTeBX1UoBFXO60lFt7B70
 ZIlHUY/DoI10l47lAdmoFaBBr1vZCo7KjjMJ4i8eg71hGQfL0il5i3o4bVryXNaQlUZZxlvD6rl CujGVE5U+Pgh574JsjjN7jMzMTUyuJdigRxqgIPdYSFHwbZjvP53LY7onj5S/o7YP+76sV+CK1T 0D/d5qCdT1WrZIUTzK+swYlH2hIgU5+rOGqIonR1HMo5dfHBqYOYwxzQTEyiQtb6dGxR0snQto5
 nApg+nd2gkZzrpRml5qJ1zeTZg4a+XI4iJydjoylfr7yTC6A4SkUvGbdaU45ORodHDgd0dyn
X-Proofpoint-ORIG-GUID: ToeDOz_7ZXAAr6RcJ5YqvJ8Xhdq77tmJ
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 12:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117194

From: Yogita Urade <yogita.urade@windriver.com>

NSSCryptoSignBackend.cc in Poppler before 25.04.0 does not verify
the adbe.pkcs7.sha1 signatures on documents, resulting in potential
signature forgeries.

CVE-2025-43903-0001 is the dependent commit and
CVE-2025-43903-0002 is the actual CVE fix.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-43903

Upstream patches:
https://gitlab.freedesktop.org/poppler/poppler/-/commit/33672ca1b6670f7378e24f6d475438f7f5d86b05
https://gitlab.freedesktop.org/poppler/poppler/-/commit/f1b9c830f145a0042e853d6462b2f9ca4016c669

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/poppler/CVE-2025-43903-0001.patch | 75 +++++++++++++++++++
 .../poppler/poppler/CVE-2025-43903-0002.patch | 49 ++++++++++++
 .../poppler/poppler_23.04.0.bb                |  2 +
 3 files changed, 126 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0001.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0002.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0001.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0001.patch
new file mode 100644
index 0000000000..d18ff08ea0
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0001.patch
@@ -0,0 +1,75 @@
+From 33672ca1b6670f7378e24f6d475438f7f5d86b05 Mon Sep 17 00:00:00 2001
+From: Sune Vuorela <sune@vuorela.dk>
+Date: Mon, 22 May 2023 19:53:08 +0000
+Subject: [PATCH] Fix crash with weird hashing used for signatures
+
+CVE: CVE-2025-43903
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/33672ca1b6670f7378e24f6d475438f7f5d86b05]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ poppler/SignatureHandler.cc | 15 ++++++++++++---
+ poppler/SignatureHandler.h  |  7 ++++++-
+ 2 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/poppler/SignatureHandler.cc b/poppler/SignatureHandler.cc
+index 9916300..f0b7006 100644
+--- a/poppler/SignatureHandler.cc
++++ b/poppler/SignatureHandler.cc
+@@ -768,11 +768,11 @@ SignatureVerificationHandler::SignatureVerificationHandler(std::vector<unsigned
+         SECItem usedAlgorithm = NSS_CMSSignedData_GetDigestAlgs(CMSSignedData)[0]->algorithm;
+         auto hashAlgorithm = SECOID_FindOIDTag(&usedAlgorithm);
+         HASH_HashType hashType = HASH_GetHashTypeByOidTag(hashAlgorithm);
+-        hashContext = std::make_unique<HashContext>(ConvertHashTypeFromNss(hashType));
++        hashContext = HashContext::create(ConvertHashTypeFromNss(hashType));
+     }
+ }
+
+-SignatureSignHandler::SignatureSignHandler(const std::string &certNickname, HashAlgorithm digestAlgTag) : hashContext(std::make_unique<HashContext>(digestAlgTag)), signing_cert(nullptr)
++SignatureSignHandler::SignatureSignHandler(const std::string &certNickname, HashAlgorithm digestAlgTag) : hashContext(HashContext::create(digestAlgTag)), signing_cert(nullptr)
+ {
+     SignatureHandler::setNSSDir({});
+     signing_cert = CERT_FindCertByNickname(CERT_GetDefaultCertDB(), certNickname.c_str());
+@@ -1232,7 +1232,16 @@ std::vector<unsigned char> HashContext::endHash()
+     return digestBuffer;
+ }
+
+-HashContext::HashContext(HashAlgorithm algorithm) : hash_context { HASH_Create(HASH_GetHashTypeByOidTag(ConvertHashAlgorithmToNss(algorithm))) }, digest_alg_tag(algorithm) { }
++HashContext::HashContext(HashAlgorithm algorithm, private_tag) : hash_context { HASH_Create(HASH_GetHashTypeByOidTag(ConvertHashAlgorithmToNss(algorithm))) }, digest_alg_tag(algorithm) { }
++
++std::unique_ptr<HashContext> HashContext::create(HashAlgorithm algorithm)
++{
++    auto ctx = std::make_unique<HashContext>(algorithm, private_tag {});
++    if (ctx->hash_context) {
++        return ctx;
++    }
++    return {};
++}
+
+ HashAlgorithm HashContext::getHashAlgorithm() const
+ {
+diff --git a/poppler/SignatureHandler.h b/poppler/SignatureHandler.h
+index c9fb575..f1b319f 100644
+--- a/poppler/SignatureHandler.h
++++ b/poppler/SignatureHandler.h
+@@ -51,12 +51,17 @@ static const int maxSupportedSignatureSize = 10000;
+
+ class HashContext
+ {
++    class private_tag
++    {
++    };
++
+ public:
+-    explicit HashContext(HashAlgorithm algorithm);
++    HashContext(HashAlgorithm algorithm, private_tag);
+     void updateHash(unsigned char *data_block, int data_len);
+     std::vector<unsigned char> endHash();
+     HashAlgorithm getHashAlgorithm() const;
+     ~HashContext() = default;
++    static std::unique_ptr<HashContext> create(HashAlgorithm algorithm);
+
+ private:
+     struct HashDestroyer
+--
+2.40.0
diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0002.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0002.patch
new file mode 100644
index 0000000000..dc2d1e7e6d
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0002.patch
@@ -0,0 +1,49 @@
+From f1b9c830f145a0042e853d6462b2f9ca4016c669 Mon Sep 17 00:00:00 2001
+From: Juraj sarinay <juraj@sarinay.com>
+Date: Thu, 6 Mar 2025 02:02:56 +0100
+Subject: [PATCH] Properly verify adbe.pkcs7.sha1 signatures.
+
+For signatures with non-empty encapsulated content
+(typically adbe.pkcs7.sha1), we only compared hash values and
+never actually checked SignatureValue within SignerInfo.
+The bug introduced by c7c0207b1cfe49a4353d6cda93dbebef4508138f
+made trivial signature forgeries possible. Fix this by calling
+NSS_CMSSignerInfo_Verify() after the hash values compare equal.
+
+CVE: CVE-2025-43903
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/f1b9c830f145a0042e853d6462b2f9ca4016c669]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ poppler/SignatureHandler.cc | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/poppler/SignatureHandler.cc b/poppler/SignatureHandler.cc
+index 9916300..5c478bc 100644
+--- a/poppler/SignatureHandler.cc
++++ b/poppler/SignatureHandler.cc
+@@ -934,13 +934,20 @@ SignatureValidationStatus SignatureVerificationHandler::validateSignature()
+           This means it's not a detached type signature
+           so the digest is contained in SignedData->contentInfo
+         */
+-        if (digest.len == content_info_data->len && memcmp(digest.data, content_info_data->data, digest.len) == 0) {
++        if (digest.len != content_info_data->len || memcmp(digest.data, content_info_data->data, digest.len) != 0) {
+             return SIGNATURE_VALID;
+         } else {
+             return SIGNATURE_DIGEST_MISMATCH;
+         }
+
+-    } else if (NSS_CMSSignerInfo_Verify(CMSSignerInfo, &digest, nullptr) != SECSuccess) {
++        auto innerHashContext = HashContext::create(hashContext->getHashAlgorithm());
++        innerHashContext->updateHash(content_info_data->data, content_info_data->len);
++        digest_buffer = innerHashContext->endHash();
++        digest.data = digest_buffer.data();
++        digest.len = digest_buffer.size();
++    }
++
++    if (NSS_CMSSignerInfo_Verify(CMSSignerInfo, &digest, nullptr) != SECSuccess) {
+         return NSS_SigTranslate(CMSSignerInfo->verificationStatus);
+     } else {
+         return SIGNATURE_VALID;
+--
+2.40.0
diff --git a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
index 8760a0e17e..a8ab19064d 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
@@ -14,6 +14,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2024-56378.patch \
            file://CVE-2025-32364.patch \
            file://CVE-2025-32365.patch \
+           file://CVE-2025-43903-0001.patch \
+           file://CVE-2025-43903-0002.patch \
            "
 SRC_URI[sha256sum] = "b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cacee0674670693951a1"
 
-- 
2.40.0


