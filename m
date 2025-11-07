Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80147CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 11:34:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9250.1762515278596990424
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 03:34:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hLWWkJRk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34066b3d81=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A75gwb62562264
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Nov 2025 03:34:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=UQ2f2wq5e/FJU+bv6b/L
	MIOJm8lkZ4pwUG0Fp6B8LF0=; b=hLWWkJRkSL/DuIpKHyRsOuX9I2ebXoEwxa8R
	hl534agyPNCdS2b7Bey5r2KRkX91m3SROP03tZwqiz/VbOZ1rB3S5U8oVXpT0Jl+
	/SxoGFA7CIm2Nv2Qy39CqhYZtsHWPtolLBDRpsA5hL13D0hKwi6tutVqVu1rMkv6
	TxKIDavViOA9TOF/4viIbvOcpH3WaJoWzjMIyRl09zc9Lb+LQ3JJQdfu0obx/GEd
	LwfbJnXZE/vaz69u45RM5eE1afTlxWZuTXsuRkTbCXAzfVJRS+MInCMoGWUFMzgK
	RG1kYPb461XqVqL9HAgd6VG120m0WvCZPb3wt/aSEb70knGxGw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a96ym8f1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 03:34:38 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 7 Nov 2025 03:34:37 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 7 Nov 2025 03:34:36 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-pillow: Fix CVE-2024-28219
Date: Fri, 7 Nov 2025 17:04:28 +0530
Message-ID: <20251107113428.597691-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: soGxdO6qG5z9eYY16OjuonwPp62BhHUk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5NCBTYWx0ZWRfXxTS+ZmBy3R45
 2Vm00wp8OJ7rYkLCOx2gWRL1Tglt9M9x1uUMufmGQn6x+DxC82uiCIX7UBGxGgxcsxEByxnZ3IC
 3kdhWxRE4uIIQiU9gubc8txdZwEo98+jTzc8sWwRu6cPbfPoDUeAUmVTjPduAf9PZhwGB2ylEE5
 gY7pzgtoCEqYpNbxg36nPDwrCdP5RdINdbyQ6LrvQeb7VtcUqSjVyZMEthzQU5UbbzX9T1flCxT
 N7sq/Wv+aQEh3Mt2Hq1KbLLFICV4/DNE88/pk6v4sCSHe/fg96s6/WB0+9d1s5QHEH+vqjD8kL5
 ELYtflToE+Oi53W/OIR/9vRwSkB36botJqZTbyFetX/FQ01sFY14SLedIba8ZYNr+IE3Px/snOn
 hULQUJPQ917PvPSRrNTb6fVgM945Sw==
X-Proofpoint-GUID: soGxdO6qG5z9eYY16OjuonwPp62BhHUk
X-Authority-Analysis: v=2.4 cv=NqPcssdJ c=1 sm=1 tr=0 ts=690dd94e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wjU5IotzqukA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=-M1QvdhFEmmEk38SpgEA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 11:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121371

From: Soumya Sambu <soumya.sambu@windriver.com>

In _imagingcms.c in Pillow before 10.3.0, a buffer overflow exists because
strcpy is used instead of strncpy.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-28219
https://security-tracker.debian.org/tracker/CVE-2024-28219

Upstream patch:
https://github.com/python-pillow/Pillow/commit/2a93aba5cfcf6e241ab4f9392c13e3b74032c061

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-pillow/CVE-2024-28219.patch       | 43 +++++++++++++++++++
 .../python/python3-pillow_9.4.0.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2024-28219.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2024-28219.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2024-28219.patch
new file mode 100644
index 0000000000..3509b108eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2024-28219.patch
@@ -0,0 +1,43 @@
+From 2a93aba5cfcf6e241ab4f9392c13e3b74032c061 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Thu, 22 Feb 2024 18:56:26 +1100
+Subject: [PATCH] Use strncpy to avoid buffer overflow
+
+CVE: CVE-2024-28219
+
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/2a93aba5cfcf6e241ab4f9392c13e3b74032c061]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/_imagingcms.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/_imagingcms.c b/src/_imagingcms.c
+index 9b5a121d7..b839f09f0 100644
+--- a/src/_imagingcms.c
++++ b/src/_imagingcms.c
+@@ -201,8 +201,8 @@ cms_transform_new(cmsHTRANSFORM transform, char *mode_in, char *mode_out) {
+ 
+     self->transform = transform;
+ 
+-    strcpy(self->mode_in, mode_in);
+-    strcpy(self->mode_out, mode_out);
++    strncpy(self->mode_in, mode_in, 8);
++    strncpy(self->mode_out, mode_out, 8);
+ 
+     return (PyObject *)self;
+ }
+@@ -244,8 +244,8 @@ findLCMStype(char *PILmode) {
+     }
+ 
+     else {
+-        /* take a wild guess... but you probably should fail instead. */
+-        return TYPE_GRAY_8; /* so there's no buffer overrun... */
++        /* take a wild guess... */
++        return TYPE_GRAY_8;
+     }
+ }
+ 
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index e42e58be80..ffc2c00fb1 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
 	   file://CVE-2023-50447-2.patch \
 	   file://CVE-2023-50447-3.patch \
 	   file://CVE-2023-50447-4.patch \
+           file://CVE-2024-28219.patch \
            "
 SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
 
-- 
2.40.0


