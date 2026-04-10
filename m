Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E60F364D6
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:05:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150885.1775804717430268164
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=azHxEVS1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560f54642=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5erni103534
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=J4uYXMpBnzj58QDXST8FPxT7FWu9WR/1+iVC/0XgAtI=; b=azHxEVS1l2W8
	0guy1rDYt+d9NbSYTbhrcm0On44Us11voEuQ8n1WT/AgqpPGPDJfdKeOzluFlDDc
	CzYX8/AADA0qxiwvFEbI32Saobm6eTJI0kcG7xXOxemuS62Vv2/LBySIAEiz8w0b
	s+T1zows2MARkqn6PVuLkyE1HF/OjkctZyb4iwGrqbpQgrByI6FnvDNAro1sZlbr
	LJn2sVyBLFVhfHyKowwe4Nd8tOYtTVyr2VVGSJnMh6TZggFpTpGM7Ge+NWvCXBNl
	8n9/dfxSC9gNsFK/tUsLF3FxtuFa7uTICjiPmRvzhyH4qRyqLiqTDiX5KFHt3tFh
	SEKyh9xO6g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryd78t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 10 Apr 2026 00:05:15 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 10 Apr 2026 00:05:14 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH v2 06/11] hdf5: fix CVE-2025-44905
Date: Fri, 10 Apr 2026 15:05:03 +0800
Message-ID: <20260410070508.1104455-7-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d8a12c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=fsqS_kxPcqjdks22YjMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: cwM8OdEdqaP7WBnGWM6OI7CcI_7rOEz6
X-Proofpoint-ORIG-GUID: cwM8OdEdqaP7WBnGWM6OI7CcI_7rOEz6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfXw0uJIn8UOMKL
 9luvp47D3PeYPGe2h+HUOOSqnF6WrWytwGVKs/nZqK1kbqK1WBD2np0rdNMnWap61U+2xK02uhv
 T+BEdgU8Y0tFLpZcuFi5OSM64g8GFBniYc5Sp0yp6vga/ZJ4Cus+LgMP8nF8pbenkVnQfqaHt+m
 GO4CCzCDjHhKfZnhhGU6OGVE08lPQFsudwrjSgRNOoEvlYgjLFAPmxvVaSv5AOADimnss+Y5kPo
 qWxeSmBg6+bf+PXlsjXBCXDGxnLdgy5VO+X0M5egd34hMnTeEzNAM8SHCcDdjc0gfLI4bqV7Bbe
 dV2B3uYBgO8uNF1HWlVvu8muaD6zok/+xTa9LDUOdmw4jt4zIJqsm1FECPKk8Ghtexns1sMSRuC
 wf/3yrsUh1X05tRq59OiIaCl1HZjdF+z6hfqkSKydz/EHSdFhoi0M/FQyB+eguz5bnmO9/IRcfj
 VMwjhy5Ct5VE0oCGIjg==
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
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126229

From: Libo Chen <libo.chen.cn@windriver.com>

According to [1], hdf5 v1.14.6 was discovered to contain a heap buffer
overflow via the H5Z__filter_scaleoffset function.

Backport patch [2] from upstream to fix CVE-2025-44905

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-44905
[2] https://github.com/HDFGroup/hdf5/commit/42588aeba786a121fec1fbad72cf39d8f60a4983

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../hdf5/files/CVE-2025-44905.patch           | 46 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-44905.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-44905.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-44905.patch
new file mode 100644
index 0000000000..91ad655760
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-44905.patch
@@ -0,0 +1,46 @@
+From d7ed737287ef2ecc6efd006fa11c3f784cdbdba6 Mon Sep 17 00:00:00 2001
+From: Libo Chen <libo.chen.cn@windriver.com>
+Date: Fri, 30 Jan 2026 14:37:09 +0800
+Subject: [PATCH] H5Zscaleoffset: add buffer size check to prevent
+ out-of-bounds reads
+
+Adds a buffer size check in H5Z__filter_scaleoffset to prevent out-of-bounds reads with malformed HDF5 files.
+
+Fixes CVE-2025-44905.
+
+CVE: CVE-2025-44905
+
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/42588aeba786a121fec1fbad72cf39d8f60a4983]
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/H5Zscaleoffset.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/H5Zscaleoffset.c b/src/H5Zscaleoffset.c
+index 048344b..fbf12d6 100644
+--- a/src/H5Zscaleoffset.c
++++ b/src/H5Zscaleoffset.c
+@@ -1205,6 +1205,9 @@ H5Z__filter_scaleoffset(unsigned flags, size_t cd_nelmts, const unsigned cd_valu
+         unsigned           minval_size  = 0;
+ 
+         minbits = 0;
++        if (H5_IS_BUFFER_OVERFLOW((unsigned char *)*buf, 5, (unsigned char *)*buf + *buf_size - 1))
++            HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
++
+         for (i = 0; i < 4; i++) {
+             minbits_mask = ((unsigned char *)*buf)[i];
+             minbits_mask <<= i * 8;
+@@ -1220,6 +1223,9 @@ H5Z__filter_scaleoffset(unsigned flags, size_t cd_nelmts, const unsigned cd_valu
+         minval_size = sizeof(unsigned long long) <= ((unsigned char *)*buf)[4] ? sizeof(unsigned long long)
+                                                                                : ((unsigned char *)*buf)[4];
+         minval      = 0;
++        if (H5_IS_BUFFER_OVERFLOW((unsigned char *)*buf, 5 + minval_size,
++                                  (unsigned char *)*buf + *buf_size - 1))
++            HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
+         for (i = 0; i < minval_size; i++) {
+             minval_mask = ((unsigned char *)*buf)[5 + i];
+             minval_mask <<= i * 8;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 653c32ab4a..9cf3f98fe3 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://CVE-2025-6857.patch \
     file://CVE-2025-2153.patch \
     file://CVE-2025-2310.patch \
+    file://CVE-2025-44905.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.34.1


