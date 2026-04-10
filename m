Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3456FF364CD
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:05:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150635.1775804717393383633
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UTihND15;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8560f54642=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A4tQZd2694910
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 00:05:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=bn3Xx66lhWaVT66wufHLO2BOPXpThGfCYH7envO5SuE=; b=UTihND15NRm/
	mmlfl24jK86cf/Evvw8aHIhz8g5pZ1zKY36iVnNhXUj1/x+q0FOkLb9LIXfmXuO9
	ItO6LWMMblgropqRSMWMUtzseq1x4TEjQkr7PIqAOTx90BNtNUcSxhhjNtbMp7zZ
	WjiczmjttR9YfvQVNShZMC3gkLsjcBIVZwXWrNtonuUC9thr93jCeRsGtBsCxGEJ
	Nb+p5Mjl0QiBpUoZ1FgU+2fh1redgQUCvKIIPVjmd/n+IOQGD3CaI88lHMG9cfoo
	dDi0Z+2EXlW1Jbc/XWYXloANPIKpl3ir3ZknFnh7LR4iIT9wQWO/zPQinZ7ak51z
	NfseNXSFCQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryn4eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 00:05:16 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 10 Apr 2026 00:05:16 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 10 Apr 2026 00:05:15 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH v2 07/11] hdf5: fix CVE-2025-2309
Date: Fri, 10 Apr 2026 15:05:04 +0800
Message-ID: <20260410070508.1104455-8-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OFxxmzyX6SW26ipgl0FQme3zoAR-yGWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfX1waCKIchrNYk
 /qJMQFGjO1LfdnjpkOkiUN14HcQ29f0LNDEu9OiypJJId25jynYKXZrIxOkS9WUY0UhvljD/nRU
 SCaIZUGL9P8dPBZ4R6LIIbhpdq6iygtfzEn/b7DV84KhoFknkLSIgI6hD6N716OM2sMl0eVqsgl
 7IngR9bvtzxAVhZtylwbKN3eciCb4jfI1CWYciFQXLuhvlTk+lMNB8Lihb9nxjmFXrW5JYNulIi
 bESU8hQnxrkQxhIqe8ewtOMqCdJrb58Vo+pL6WTN4urc3cgcjpgclv7FVTaQtISFbtX/gRbWcTl
 tk3tzfsY63M186l8GF76GbRZwmRul0gE3tAXDuouHZ1cpM2TOyDvFgpKIE5WfGx6mpgPArxmwsf
 tQJlSO0K54LL9/uH4MdSVWT7n4PFsvGwuEAf+Gsjp6TkZP2GpSCxF5v1u/GldfkvT+i8Lx1sq/C
 rifwlPr0E4TThGKawWQ==
X-Proofpoint-GUID: OFxxmzyX6SW26ipgl0FQme3zoAR-yGWq
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d8a12c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=nkXCzIGPx5NjI-_UGwcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126228

From: Libo Chen <libo.chen.cn@windriver.com>

According to [1], A vulnerability has been found in HDF5 1.14.6 and
classified as critical. This vulnerability affects the function
H5T__bit_copy of the component Type Conversion Logic. The manipulation
leads to heap-based buffer overflow. Local access is required to approach
this attack. The exploit has been disclosed to the public and may be used.
The real existence of this vulnerability is still doubted at the moment.
The vendor plans to fix this issue in an upcoming release.

Backport patch [2] from upstream to fix CVE-2025-2309

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-2309
[2] https://github.com/HDFGroup/hdf5/commit/9d90b21ef5c5373978014f1a711795aa653bd9a1

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../hdf5/files/CVE-2025-2309.patch            | 41 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2309.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2309.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2309.patch
new file mode 100644
index 0000000000..d14cb2589f
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2309.patch
@@ -0,0 +1,41 @@
+From 6b24925c5fae3e2d7f47e9e7c879816673a48cd5 Mon Sep 17 00:00:00 2001
+From: Libo Chen <libo.chen.cn@windriver.com>
+Date: Fri, 30 Jan 2026 15:04:26 +0800
+Subject: [PATCH] Fix CVE-2025-2309
+
+A malformed file can trigger bit field type conversions that can (due to missing boundary checks in the conversion step) cause a heap buffer overflow. This PR adds a check on the defined conversion to ensure it does not read beyond the size of a single bit field element. Thus, H5T__bit_copy does not result in a buffer overflow. There are several other calls to H5T__bit_copy which might be subject to a similar issue.
+
+This PR fixes CVE-2025-2309.
+
+CVE: CVE-2025-2309
+
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/9d90b21ef5c5373978014f1a711795aa653bd9a1]
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/H5Odtype.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/H5Odtype.c b/src/H5Odtype.c
+index 24671b0..085ce24 100644
+--- a/src/H5Odtype.c
++++ b/src/H5Odtype.c
+@@ -307,6 +307,15 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
+                 HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, FAIL, "ran off end of input buffer while decoding");
+             UINT16DECODE(*pp, dt->shared->u.atomic.offset);
+             UINT16DECODE(*pp, dt->shared->u.atomic.prec);
++
++            /* Sanity checks */
++            if (dt->shared->u.atomic.offset >= (dt->shared->size * 8))
++                HGOTO_ERROR(H5E_DATATYPE, H5E_BADRANGE, FAIL, "bitfield offset out of bounds");
++            if (0 == dt->shared->u.atomic.prec)
++                HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL, "bitfield precision is zero");
++            if (((dt->shared->u.atomic.offset + dt->shared->u.atomic.prec) - 1) >= (dt->shared->size * 8))
++                HGOTO_ERROR(H5E_DATATYPE, H5E_BADRANGE, FAIL, "bitfield offset+precision out of bounds");
++
+             break;
+ 
+         case H5T_OPAQUE: {
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 9cf3f98fe3..d821fb8f34 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://CVE-2025-2153.patch \
     file://CVE-2025-2310.patch \
     file://CVE-2025-44905.patch \
+    file://CVE-2025-2309.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.34.1


