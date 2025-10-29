Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0E8CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 12:44:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web01.1907.1761721369445745147
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 00:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=X2LYIYWw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: sasikuma@qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v0da3664612
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 07:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=A/hZcC22LtAzse3wqkl+YrUHX3mm5iPJFq5
	RWNZSZw0=; b=X2LYIYWwLdHYkv52RRnSqyPRQ6w/Ut2bXDRNSQ4oQ1bDMwJ0o47
	lCvLqOFlvnDAd7PURL/BJ/uIwhYWTK4fgefsAAExi3ExJNFykNZajzUFBhX4jURJ
	+5761CvJfXm/PIzxWC1AUBBChFXpzzD1qVuYNBAukzJwF9E/pdXnBN9VDRKb7QqC
	ju2tS7csPS6YrwzbRIHzPzu3NLRuy5D3q1klbS/x/n/DZhLNqhOK9QOqN8VmHbiF
	TeM4nx7E2IS4tKo0F9y2+QrA1XYxmNPv2XASR8cGWujUu/2lCu3yOcldysODNUTo
	uVs7VyYcCHiGOrE8gmBFxGyIjo8/AoMyCoA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3sh94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 07:02:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59T72hdG025874
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 07:02:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a0qmmnjr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 07:02:43 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59T72hmm025866
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 07:02:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sasikuma-hyd.qualcomm.com [10.147.243.253])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 59T72ho2025863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 07:02:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4060212)
	id 59CF45C8; Wed, 29 Oct 2025 12:32:42 +0530 (+0530)
From: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
Subject: [meta-oe][PATCH] libziparchive: fix missing fixed-width integer types in zip_writer.h
Date: Wed, 29 Oct 2025 12:32:40 +0530
Message-Id: <20251029070240.3402018-1-quic_sasikuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MlsnXxfYZhIhxLbeQPG8KwYqmbaV3C3y
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=6901bc17 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=TpZ7NbNYdCxUEK1PODMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0OSBTYWx0ZWRfX4d1y/GFHL+6E
 Xg+eLJBIiL8er07iQOyFfSfa8ZpaEOlnGOK1T4flpEFhL5fmXpxTOgMc10uPCHEO0Ke3CRc9Ynf
 6ZxEMcxPqkdwsRPltkmryWna3N1SQ3Ox8eDcgkHQW93vUVyUc3Q5VxjlDtU041VZZ5bzsh01ZaG
 FkYFCweuSaAbA0rAZu1CnOMAHNA1DiI/cMG/QDcckpYFXmE4eWaeSezsm7QawnwgwY5PN0d1qv2
 C6COMjtaQcww9qBTt/nYdEn29U56RdvefcbAMkPtdm9Z+FhD3gaNYMyX1x7e4/N6VydBogzPzNE
 tI2KEQGSnNReWgdHfzc5i+0c3X47uxnLa9kW/kd2+E2hWTyWrUNROQByDROohareiosX0m1RMLK
 cHgxUUjiKs8cLa+SPkBhWDB2Hbv52g==
X-Proofpoint-GUID: MlsnXxfYZhIhxLbeQPG8KwYqmbaV3C3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290049
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 12:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121150

Compilation fails due to undefined types 'uint16_t' and 'uint32_t' in
zip_writer.h. These types are used in struct members but are not recognized
because the required header <cstdint> is not included. This results in
errors such as:
  error: 'uint16_t' does not name a type
  error: 'uint32_t' does not name a type

Added '#include <cstdint>' to zip_writer.h to ensure fixed-width integer
types are properly defined.

Signed-off-by: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
---
 ...x-missing-fixed-width-integer-types-.patch | 38 +++++++++++++++++++
 .../android-tools/android-tools_29.0.6.r14.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch
new file mode 100644
index 0000000000..0b5087f283
--- /dev/null
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch
@@ -0,0 +1,38 @@
+From f6874a2f7de30b6eeefb2d509b895c58b93da8f7 Mon Sep 17 00:00:00 2001
+From: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
+Date: Wed, 29 Oct 2025 09:38:17 +0530
+Subject: [PATCH] libziparchive: fix missing fixed-width integer types in
+ zip_writer.h
+
+Compilation fails due to undefined types 'uint16_t' and 'uint32_t' in
+zip_writer.h. These types are used in struct members but are not recognized
+because the required header <cstdint> is not included. This results in
+errors such as:
+  error: 'uint16_t' does not name a type
+  error: 'uint32_t' does not name a type
+
+Added '#include <cstdint>' to zip_writer.h to ensure fixed-width integer
+types are properly defined.
+
+Upstream-Status: Pending
+
+Signed-off-by: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
+---
+ system/core/libziparchive/include/ziparchive/zip_writer.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/system/core/libziparchive/include/ziparchive/zip_writer.h b/system/core/libziparchive/include/ziparchive/zip_writer.h
+index d68683df..7a05e349 100644
+--- a/system/core/libziparchive/include/ziparchive/zip_writer.h
++++ b/system/core/libziparchive/include/ziparchive/zip_writer.h
+@@ -18,6 +18,7 @@
+ 
+ #include <cstdio>
+ #include <ctime>
++#include <cstdint>
+ 
+ #include <gtest/gtest_prod.h>
+ #include <memory>
+-- 
+2.34.1
+
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index 47c8e08b62..74928ed171 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -40,6 +40,7 @@ SRC_URI += " \
     file://debian/system/core/fix-standard-namespace-errors.patch \
     file://debian/system/core/Add-riscv64-support.patch \
     file://debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch \
+    file://debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch \
     \
 "
 
-- 
2.34.1


