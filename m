Return-Path: <Aravind.Bandari@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7B3C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 16:28:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.122.1790094517505649696
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 09:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JJL0frsK;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild11.wrs.com, ip: 205.220.166.238, mailfrom: prvs=3725b502de=abandari@oak-lpgbuild11.wrs.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEihXk208807
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 09:28:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=5u+w8JfHC
	0hOcB4KPQWNopDyo/DhXzdgwaBwqqwmIeg=; b=JJL0frsK00a7mMd6ync7GMGam
	EjkwZjIzTp+um4lSKPPpUsJh3Ix1fTj6wh512C7hY7PZY0/4uP9Nb1odKSk7mdhl
	8HQkNHXoC2D2oRX2iPmK9fcXJjHETOxj39vAe7iI+BGYHCSTsCcTJsAOdn3XzWZu
	dhvg3yPaO07e+Ur7xU2dUKSijvAwsDUI132lMcvWrLo4B7YV2c1r15ZONdaa7a3v
	ph7oq5SNVDbY3Wa1+5EbZRKSzKTUHBoJKPByLKNhLBM0ezJls6KsL2zQ3yXlwMnD
	hn9i/OvWqOhZaMs2eNRBAKF8lLw2GlwhsmRtybeBbMp/Gh6UGd4FSFjLB4Okg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gsswe4gj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 09:28:36 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 22 Sep 2026 09:28:36 -0700
Received: from oak-lpgbuild11.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 22 Sep 2026 09:28:36 -0700
Received: by oak-lpgbuild11.wrs.com (Postfix, from userid 1762445477)
	id DF9914040480; Tue, 22 Sep 2026 16:28:35 +0000 (UTC)
From: Aravind Bandari <aravind.bandari@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <aravind.bandari@windriver.com>
Subject: [meta-python,wrynose] python3-pillow: fix CVE-2026-59204
Date: Tue, 22 Sep 2026 16:27:51 +0000
Message-ID: <20260922162751.3658333-1-aravind.bandari@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zFwd_1LFYPv-es5vMWHwj2U8Ty944PBF
X-Authority-Analysis: v=2.4 cv=WLrqzXsR c=1 sm=1 tr=0 ts=6ab2acb4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8
 a=-YEQQrfU63PjvAhJpxAA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=cLmVwuuHqK9AzAu1PFJr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0MSBTYWx0ZWRfX46xynbpXRcIO
 vkzAdSGBeyuWsLqFM3hf1j0CgSyljWhZW2IQu6I3xri7CaB596gOCzTm+p0vUZjoUwS55fdwYAK
 zewWZc6EyoQ1H34rO7G7JroYs1pSEgpwHd/xb79MgARhTnehMYsHv0+g7fpj5DdMzRTResRw4/f
 ysmzKznppcFYPoNIswDB82mGwv27ML4X6UBt6rpA3QDUTlDS/7Qc21/FQqwfLQY1SrvjEfEUTAy
 D4CQegTlIkfY3h/CkJSWRkG/w6UvAB63oRX9EHdtjdzOIFTOXBCeXMd4v7hy7z7cUQBmMGAnQLR
 VPfFVKOUm8uKzPyhqZDunb3H/N0/GLKZkVaYriByGqkgByoUCAM2XL3jRQ/rtJewkGq9+FHCIFe
 uOhdLm2QrwR5Gwx2yiu6KpKCnNNM6OfS/SNGW00v53zmrNmW5s0yZplchBiAJqIrCg7Eqf/k6v7
 kLlj3xm5VdJOEW1LMIg==
X-Proofpoint-ORIG-GUID: zFwd_1LFYPv-es5vMWHwj2U8Ty944PBF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0MSBTYWx0ZWRfX5JjrD/m+HyWQ
 oV79H+M95AG0rX4f78aO1hg4gvhG7CUPhJa+yG7cEGD9cu9x48YOdtIF4NeQLtpeaiooEy1prgV
 u9RZ1CKR9vKtdS3RtRsfgD+Z5J1nof1/mf0yyWiWVo7GJ37Gdo96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220241
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 16:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130176

Pillow 8.2.0 through 12.2.0 accumulates total_component_width across
every tile in a JPEG2000 image instead of recomputing it per tile,
allowing a crafted tiled JPEG2000 file to force substantially higher
transient memory usage and trigger out-of-memory failures during
decoding.

Calculate JPEG2000 total_component_width for each tile in isolation.

Backport the patch to fix CVE-2026-59204
https://github.com/python-pillow/Pillow/commit/13ada41172142f2fd9f0906f615a00ea623a11ca

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-59204

Signed-off-by: Aravind Bandari <aravind.bandari@windriver.com>
---
 .../python3-pillow/CVE-2026-59204.patch       | 37 +++++++++++++++++++
 .../python/python3-pillow_12.2.0.bb           |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch
new file mode 100644
index 0000000000..a706271c00
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch
@@ -0,0 +1,37 @@
+From ca189db3cc625bf06cef39b09c8a61d91e7be080 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Mon, 22 Jun 2026 10:34:18 +1000
+Subject: [PATCH] Calculate JPEG2000 total_component_width for each tile in
+ isolation (#9704)
+
+CVE: CVE-2026-59204
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/13ada41172142f2fd9f0906f615a00ea623a11ca]
+Signed-off-by: Aravind Bandari <aravind.bandari@windriver.com>
+
+---
+ src/libImaging/Jpeg2KDecode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libImaging/Jpeg2KDecode.c b/src/libImaging/Jpeg2KDecode.c
+index 1123d7bc9..536313471 100644
+--- a/src/libImaging/Jpeg2KDecode.c
++++ b/src/libImaging/Jpeg2KDecode.c
+@@ -645,7 +645,6 @@ j2k_decode_entry(Imaging im, ImagingCodecState state) {
+     size_t tile_bytes = 0;
+     unsigned n, tile_height, tile_width;
+     int subsampling;
+-    int total_component_width = 0;
+ 
+     stream = opj_stream_create(BUFFER_SIZE, OPJ_TRUE);
+ 
+@@ -851,6 +850,7 @@ j2k_decode_entry(Imaging im, ImagingCodecState state) {
+          a, and then a malicious file could have a smaller tile_bytes
+         */
+ 
++        int total_component_width = 0;
+         for (n = 0; n < tile_info.nb_comps; n++) {
+             // see csize /acsize calcs
+             int csize = (image->comps[n].prec + 7) >> 3;
+-- 
+2.53.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index f3fcb2d3c1..1dcaeacd93 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f0ac3777cfc96ded1b825e32ae7c99"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
+           file://CVE-2026-59204.patch \
            "
 SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
-- 
2.53.0


