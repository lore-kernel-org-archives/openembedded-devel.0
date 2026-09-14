Return-Path: <Aravind.Bandari@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D05C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 19:01:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5313.1789412487254229121
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 12:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VxNap4H+;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild11.wrs.com, ip: 205.220.166.238, mailfrom: prvs=37174f58b5=abandari@oak-lpgbuild11.wrs.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EIoKMh1236678
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 12:01:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=57BL/rynL
	7PoI2HGqbfEFGhvP7+SB36T9eruItxPtB0=; b=VxNap4H+Srldc0AQ18ugVZ+pe
	CzEJoUKz+Dr46prtrOqNjtaBa6VSDWcHC4QGHwjg+Vb4rT0UxD74nY7Uwk342Owk
	SdIJxF49PPaxSbxCXmK6AD9oXWC4Dp/ktven4t93kwQ3L4VZ3ajPOMyW0SplPp/C
	RItZX8RwcRWYytDF0gu9ZATkSosMRJy5Auia19mXWHN6aast9IY+1pwW1ImlrMPg
	14gmxWqrTo2unfWtOkIftOOD+4EbVKlXRGqCrLpJ41gJ1DqbM1QF9OTn7PhaY3C+
	RqYK5LvFOcppDbbIZqouGbJsxJnRxO9Nvqo3v7ADS8W9CSn06BIg/XevbT46A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gn210mg8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 12:01:26 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 14 Sep 2026 12:01:25 -0700
Received: from oak-lpgbuild11.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 14 Sep 2026 12:01:25 -0700
Received: by oak-lpgbuild11.wrs.com (Postfix, from userid 1762445477)
	id E515E4040260; Mon, 14 Sep 2026 19:01:25 +0000 (UTC)
From: Aravind Bandari <aravind.bandari@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <aravind.bandari@windriver.com>
Subject: [meta-python][wrynose][PATCH] python3-pillow: fix CVE-2026-54058
Date: Mon, 14 Sep 2026 19:00:32 +0000
Message-ID: <20260914190032.2167566-1-aravind.bandari@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _0-3VzBI5JgZj4T5XnPt0luK8GHHVwOQ
X-Proofpoint-ORIG-GUID: _0-3VzBI5JgZj4T5XnPt0luK8GHHVwOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI3MCBTYWx0ZWRfX1J2nlJxWZa4S
 Mu6xHe/S6izmNcaRf39J42NMwL56zSyoZxM3BRcESUNUhthD6NNwJr9YPLR6WtjQtRJCMSdl/hO
 EblQWLjAXvAs0lSUQHx8f1GdMGhQMSNf//MrD0/8N8T47bN1O2s/lV2yXWcgLNtFmwiXf0Tvhkt
 S5xeNO9S0ubtEdsl2X6PMUukwYXTIfCb6/F7+jAYmeVXwiS0l9I+AYGoKJz8m649nL485vBvfTD
 PhxMcp5lo1NeMWSqvWOABm7N1wg70tlGBkN8qPLnX2gg67QFeasY6JO8bd5eQlZuP/NdpYtFZ8s
 9wX8Rb/iRxKh+m9yr5SA5aWdd4U16W6HwT6pYYLsffSQ1oMWXhyvw/szhz75+H5jkpQxxnDPtRU
 pMhekbENVmMF0bBGIMW9CzyfTegViMdBkaSoSrCjHn13WgBE6g8PZFgwfaWKSIOD9KgJQ7tklph
 g1VY3Ef1sPby9Qvs0zQ==
X-Authority-Analysis: v=2.4 cv=J5Y/fwnS c=1 sm=1 tr=0 ts=6aa84486 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8 a=gUbaYAUbAAAA:8
 a=t7CeM3EgAAAA:8 a=69EAbJreAAAA:8 a=3cdx1C_GvPVl9K1xZTsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI3MCBTYWx0ZWRfX5iUQ1w7AOwEJ
 F3qMXs5ebcS1EvihKkG/0m9QP+88rJ57kF3p9bt/BNl+ZSeE8/pm3ppj4T0VrEzR8gUj8mpNcpr
 iCqzki/CMsoic0SrJMHGUWIDYxmzEjRvBr7wyQcUFF0OKsreGEZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140270
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 19:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130023

Pillow prior to 12.3.0, when loading an uncompressed McIdas AREA image
through the mmap raw codec path, allows an attacker-controlled row stride
smaller than the natural row width, causing pixel access to read beyond the
mapped region and disclose adjacent process memory or fault.

Ensure the map stride is at least one full row of pixels.

Backport the patch to fix CVE-2026-54058
https://github.com/python-pillow/Pillow/commit/6a8de891fb00968e5ea79bfa84368ed90b3cfc1d

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-54058

Signed-off-by: Aravind Bandari <aravind.bandari@windriver.com>
---
 .../python3-pillow/CVE-2026-54058.patch       | 89 +++++++++++++++++++
 .../python/python3-pillow_12.2.0.bb           |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54058.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54058.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54058.patch
new file mode 100644
index 0000000000..6fc38570ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54058.patch
@@ -0,0 +1,89 @@
+From 04410f2e38c070e6d519c24d1cf315612b8adb93 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Fri, 26 Jun 2026 07:35:42 +1000
+Subject: [PATCH] Ensure map stride is at least one full row of pixels (#9719)
+
+CVE: CVE-2026-54058
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/6a8de891fb00968e5ea79bfa84368ed90b3cfc1d]
+Signed-off-by: Aravind Bandari <aravind.bandari@windriver.com>
+
+Co-authored-by: GameZoneHacker <devanshshah2003@hotmail.com>
+---
+ Tests/test_file_mcidas.py | 25 +++++++++++++++++++++++++
+ src/map.c                 | 18 ++++++++++--------
+ 2 files changed, 35 insertions(+), 8 deletions(-)
+
+diff --git a/Tests/test_file_mcidas.py b/Tests/test_file_mcidas.py
+index 7e236028d..d1410f503 100644
+--- a/Tests/test_file_mcidas.py
++++ b/Tests/test_file_mcidas.py
+@@ -1,5 +1,8 @@
+ from __future__ import annotations
+ 
++import struct
++from pathlib import Path
++
+ import pytest
+ 
+ from PIL import Image, McIdasImagePlugin
+@@ -14,6 +17,28 @@ def test_invalid_file() -> None:
+         McIdasImagePlugin.McIdasImageFile(invalid_file)
+ 
+ 
++def test_undersized_stride(tmp_path: Path) -> None:
++    # A crafted area descriptor declares a row stride far smaller than a full
++    # row of pixels. Memory mapping must not lay out row pointers at that
++    # stride, which would read past the mapped buffer; the image is rejected
++    # instead of leaking memory or crashing.
++    words = [0] * 65
++    words[2] = 4  # magic: 00 00 00 00 00 00 00 04
++    words[9] = 1  # ysize
++    words[10] = 200000  # xsize -> a full row is 200000 bytes (mode "L")
++    words[11] = 1  # mode "L"
++    words[14] = 0  # zeroes the xsize term of the stride
++    words[15] = 1  # stride = 1  (much smaller than a row)
++    data = struct.pack("!64i", *words[1:65])
++
++    path = tmp_path / "undersized_stride.area"
++    path.write_bytes(data)
++
++    with Image.open(path) as im:
++        with pytest.raises(ValueError, match="buffer is not large enough"):
++            im.load()
++
++
+ def test_valid_file() -> None:
+     # Arrange
+     # https://ghrc.nsstc.nasa.gov/hydro/details/cmx3g8
+diff --git a/src/map.c b/src/map.c
+index 6f66b0cc5..4c9bb2ae3 100644
+--- a/src/map.c
++++ b/src/map.c
+@@ -84,14 +84,16 @@ PyImaging_MapBuffer(PyObject *self, PyObject *args) {
+ 
+     const ModeID mode = findModeID(mode_name);
+ 
+-    if (stride <= 0) {
+-        if (mode == IMAGING_MODE_L || mode == IMAGING_MODE_P) {
+-            stride = xsize;
+-        } else if (isModeI16(mode)) {
+-            stride = xsize * 2;
+-        } else {
+-            stride = xsize * 4;
+-        }
++    int pixelsize;
++    if (mode == IMAGING_MODE_L || mode == IMAGING_MODE_P) {
++        pixelsize = 1;
++    } else if (isModeI16(mode)) {
++        pixelsize = 2;
++    } else {
++        pixelsize = 4;
++    }
++    if (stride <= xsize * pixelsize) {
++        stride = xsize * pixelsize;
+     }
+ 
+     if (stride > 0 && ysize > PY_SSIZE_T_MAX / stride) {
+-- 
+2.53.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index f3fcb2d3c1..29a65dd148 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f0ac3777cfc96ded1b825e32ae7c99"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
+           file://CVE-2026-54058.patch \
            "
 SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
-- 
2.53.0


