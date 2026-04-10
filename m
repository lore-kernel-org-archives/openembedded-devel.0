Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377ADE99046
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:05:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150633.1775804716748567033
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WU6B1le7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560f54642=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5erng103534
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=qrrX5DpF/lOFIlU9urPQp5tVk+L4kwwZQfw6mtxRKSE=; b=WU6B1le71jd1
	2E7mKwjA1aXWG2ooD9A+jFPwURPPECYPgwhhLsQ7cNewZrvwyMBMRkNVGqRRkEEm
	81UMiSeAH2ngeVoenDko8J24rI6oAvgrJ/g7NouCi5nUWqPbYqpRIC8EHJyBwanC
	CsHSTRjlvu6wmDAbLnZLRto9BSGZ+ymblIf8ZcoqRDlsH55mq/vmguFCeM2swWGD
	lOMKwnEL6hgMWj9vi7X6/SEz9b3Ol3KBGNntwXAw4e3Qj95YkmYtJfVssrane45+
	3AoG99Kp+uYCKARydK92VSSscdnffS5ZphqbTDNY/HYFwfTldd0vvUGD2cJd7m0L
	J4WOT+p3Rg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryd78t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 10 Apr 2026 00:05:14 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 10 Apr 2026 00:05:13 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH v2 05/11] hdf5: fix CVE-2025-2310
Date: Fri, 10 Apr 2026 15:05:02 +0800
Message-ID: <20260410070508.1104455-6-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d8a12b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=yGWg0Mz01TQhIeDDkRoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Q8WXZoLuhsRv4Yoqd8-9bIkG_9kx1NJp
X-Proofpoint-ORIG-GUID: Q8WXZoLuhsRv4Yoqd8-9bIkG_9kx1NJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfX1DdB4NJZyJhy
 wVgULF1sI93MNJw7RC3+Kt2/mXDuFcPjw+FJ9J3ISBBxb97cTP5lnZ0JloqtihX4mcYOUgKOgUb
 p7kUdHMfxEd0ukstttS2iUfpz1dk/i/BOMmtvMoP2Clv39rakj5ouDunge8yqSqRNkeBUc3ZbfR
 Mc1z+MEFf7cuDEPdPqZx6dOYqWzWMpN6UGmzkjYxMpRQJuF9yA4wCb6iMfWMctqV4wHfm9uMa61
 p0jAcIO3+HQOWhV+H8SlkqoknlUZfjZVEfvgPaxYDT/PTu06aptMq0yxJy2o1DJ6POcswtJEUn6
 bpFjWeq6s1aWtcgSXDJgNabyAiT5c5L5Y2ukRkJEzmoDgoum5s9tOEnMHb3h9A7+4qQDdigyoM4
 YqorH7hzLtFvq3yhNv9/2gKiwWetlG1VTkrxbttUe6fdoelThWuwYaIpiK1+iR8EiCk+iCtqZn8
 X6O5yfNNGlaUQVURPSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126227

From: Libo Chen <libo.chen.cn@windriver.com>

According to [1], A vulnerability was found in HDF5 1.14.6 and classified
as critical. This issue affects the function H5MM_strndup of the component
Metadata Attribute Decoder. The manipulation leads to heap-based buffer
overflow. Attacking locally is a requirement. The exploit has been
disclosed to the public and may be used.

Backport patch [2] from upstream to fix CVE-2025-2310

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-2310
[2] https://github.com/HDFGroup/hdf5/commit/6c86f97e03c6dc7d7bd2bae9acc422bdc3438ff4

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../hdf5/files/CVE-2025-2310.patch            | 37 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2310.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2310.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2310.patch
new file mode 100644
index 0000000000..8ac74737d8
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2310.patch
@@ -0,0 +1,37 @@
+From 89a4466d72f688f4da6521e82a466c183ebe1d08 Mon Sep 17 00:00:00 2001
+From: Libo Chen <libo.chen.cn@windriver.com>
+Date: Fri, 30 Jan 2026 14:05:54 +0800
+Subject: [PATCH] Fix CVE-2025-2310
+
+Malformed files can have a zero name-length, which when subtracted lead to an overflow and an out-of-bounds read.
+
+Check that name length is not too small in addition to checking for an overflow directly.
+
+CVE: CVE-2025-2310
+
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/6c86f97e03c6dc7d7bd2bae9acc422bdc3438ff4]
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/H5Oattr.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/H5Oattr.c b/src/H5Oattr.c
+index 6d1d237..7b7ebb0 100644
+--- a/src/H5Oattr.c
++++ b/src/H5Oattr.c
+@@ -167,6 +167,11 @@ H5O__attr_decode(H5F_t *f, H5O_t *open_oh, unsigned H5_ATTR_UNUSED mesg_flags, u
+     if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
+         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     UINT16DECODE(p, name_len); /* Including null */
++
++    /* Verify that retrieved name length (including null byte) is valid */
++    if (name_len <= 1)
++        HGOTO_ERROR(H5E_OHDR, H5E_CANTDECODE, NULL, "decoded name length is invalid");
++
+     if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
+         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     UINT16DECODE(p, attr->shared->dt_size);
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 715f14ccae..653c32ab4a 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -26,6 +26,7 @@ SRC_URI = " \
     file://CVE-2025-2926.patch \
     file://CVE-2025-6857.patch \
     file://CVE-2025-2153.patch \
+    file://CVE-2025-2310.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.34.1


