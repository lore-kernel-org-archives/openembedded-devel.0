Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3738BC636D4
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 23:08:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9729.1675206534525201558
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 15:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=K4Ni9KnN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1395f88de3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VMn9Pc023756
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=PMynL55eHvJ8QccTJFiORxeuRF/JN5vfwcbD7EaNpOE=;
 b=K4Ni9KnN7W0bF7Ugmw8jc6z1bPhmmpRcmanMGt73dP9sttJZeT0g2oA3FCVGkm8FSni5
 vyM8hc+9XAlmgW1AiPU40nWuognwpuxRC+MYCKnH+Dkt20ffcNYCFNTHPB65nvA/o+6U
 95QUCXLBDBzfWxG8gZXtkiDe+qa2u2YAFbU+kZu+JN82mgoSNXejjZuJshgzvzdpJ+06
 vFewGT79ZfDYLsaqQBbpcdegn7AutNZkpEjDvhtJP/HkcHORmqUhoEkhGYkW7FFHU6i8
 8FAbFnbgygYvRAMvW4Ja98IMknvd0HwCdsyb38yi0xVDIpky1XHiN8126kxcqm1nFEEf Nw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpausud-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:53 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 31 Jan 2023 15:08:51 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 31 Jan 2023 15:08:51 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][kirkstone][PATCH 2/6] python3-pillow: upgrade 9.1.1 -> 9.2.0
Date: Tue, 31 Jan 2023 15:08:47 -0800
Message-ID: <20230131230851.2785067-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jFy1vCmmNBfi2RqstZpHsjW-q8cwY3md
X-Proofpoint-ORIG-GUID: jFy1vCmmNBfi2RqstZpHsjW-q8cwY3md
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310199
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100892

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Changelog:
=========

    Fixed null check for fribidi_version_info in FriBiDi shim
    Added GIF decompression bomb check
    Handle PCF fonts files with less than 256 characters
    Improved GIF optimize condition
    Reverted to array_interface with the release of NumPy 1.23
    Pad PCX palette to 768 bytes when saving
    Fixed bug with rounding pixels to palette colors
    Use gnome-screenshot on Linux if available
    Fixed loading L mode BMP RLE8 images
    Fixed incorrect operator in ImageCms error
    Limit FPX tile size to avoid extending outside image
    Added support for decoding plain PPM formats
    Added apply_transparency()
    Fixed behaviour change from endian fix
    Use python3
    Allow remapping P images with RGBA palettes
    Revert "Skip test_realloc_overflow unless libtiff 4.0.4 or higher"
    [pre-commit.ci] pre-commit autoupdate
    Only import ImageFont in ImageDraw when necessary
    Fixed drawing translucent 1px high polygons
    Pad COLORMAP to 768 items when saving TIFF
    Fix P -> PA conversion
    Once exif data is parsed, do not reload unless it changes
    Only try to connect discontiguous corners at the end of edges
    Improve transparency handling when saving GIF images
    Do not update GIF frame position until local image is found
    Netscape GIF extension belongs after the global color table
    Only write GIF comments at the beginning of the file
    Separate multiple GIF comment blocks with newlines
    Always use GIF89a for comments
    Ignore compression value from BMP info dictionary when saving as TIFF
    If font is file-like object, do not re-read from object to get variant
    Raise ValueError when trying to access internal fp after close
    Support more affine expression forms in im.point()
    Include 'twine check' in 'make sdist'
    Ensure that furthest v is set in quantize2

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-pillow_9.1.1.bb => python3-pillow_9.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.1.1.bb => python3-pillow_9.2.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb b/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
index 00df22a3d..454d61a48 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.1.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.2.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
            "
@@ -39,4 +39,4 @@ RPROVIDES:${PN} += "python3-imaging"
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "0f44136e720cd3b2db72bdf29614897b7aa3e868"
+SRCREV = "58acec3312fb8671c9d84829197e1c8150085589"
-- 
2.39.0


