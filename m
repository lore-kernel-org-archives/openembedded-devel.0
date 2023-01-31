Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DB9C636D7
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 23:08:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9731.1675206535012770995
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 15:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Pr7PoGOB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1395f88de3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VMn9Pd023756
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=NSbbD33erkb86ddI5NAJIItddOP5fcHkmLOi46LEWpk=;
 b=Pr7PoGOBNVb+WHcNDi+iPiDSM3WmxD6+9Q2TzrOICasr1xliLU1We9+J53Z01Ixe0WiG
 qUCoZXqnbJJ8nbWbhGcBFChRQ/2+tUTW6b3ATZ9uAYOvkOEYhb5NlGkdiFSgxaFJznX2
 HFJ8aL/jfvKKuYP4gpi07Pi5oAs5LZc9PItFmRWsjGIksYb2D82+hM3jyta2BPYs22V3
 IK8BeRIiFlP849M4ohH1ZkEAd8M0R9JqLR952/xdl/HoEFXKeSk4hzisD+3vCuU1eBN7
 rTzuVpygem8WYuOzbEM8pN949iirETyzmu7NuvGS8U8fGvXrhWja4kJY4BM0MS/eYwrv wA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpausud-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:54 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 31 Jan 2023 15:08:52 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 31 Jan 2023 15:08:52 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][kirkstone][PATCH 3/6] python3-pillow: upgrade 9.2.0 -> 9.3.0
Date: Tue, 31 Jan 2023 15:08:48 -0800
Message-ID: <20230131230851.2785067-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7GxN4MtN_LVl89ZmcrQCvzyz336Ywci9
X-Proofpoint-ORIG-GUID: 7GxN4MtN_LVl89ZmcrQCvzyz336Ywci9
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100894

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========

    Limit SAMPLESPERPIXEL to avoid runtime DOS #6700 [wiredfool]
    Initialize libtiff buffer when saving #6699 [radarhere]
    Inline fname2char to fix memory leak #6329 [nulano]
    Fix memory leaks related to text features #6330 [nulano]
    Use double quotes for version check on old CPython on Windows #6695 [hugovk]
    Remove backup implementation of Round for Windows platforms #6693 [cgohlke]
    Fixed set_variation_by_name offset #6445 [radarhere]
    Fix malloc in _imagingft.c:font_setvaraxes #6690 [cgohlke]
    Release Python GIL when converting images using matrix operations #6418 [hmaarrfk]
    Added ExifTags enums #6630 [radarhere]
    Do not modify previous frame when calculating delta in PNG #6683 [radarhere]
    Added support for reading BMP images with RLE4 compression #6674 [npjg, radarhere]
    Decode JPEG compressed BLP1 data in original mode #6678 [radarhere]
    Added GPS TIFF tag info #6661 [radarhere]
    Added conversion between RGB/RGBA/RGBX and LAB #6647 [radarhere]
    Do not attempt normalization if mode is already normal #6644 [radarhere]
    Fixed seeking to an L frame in a GIF #6576 [radarhere]
    Consider all frames when selecting mode for PNG save_all #6610 [radarhere]
    Don't reassign crc on ChunkStream close #6627 [wiredfool, radarhere]
    Raise a warning if NumPy failed to raise an error during conversion #6594 [radarhere]
    Show all frames in ImageShow #6611 [radarhere]
    Allow FLI palette chunk to not be first #6626 [radarhere]
    If first GIF frame has transparency for RGB_ALWAYS loading strategy, use RGBA mode #6592 [radarhere]
    Round box position to integer when pasting embedded color #6517 [radarhere, nulano]
    Removed EXIF prefix when saving WebP #6582 [radarhere]
    Pad IM palette to 768 bytes when saving #6579 [radarhere]
    Added DDS BC6H reading #6449 [ShadelessFox, REDxEYE, radarhere]
    Added support for opening WhiteIsZero 16-bit integer TIFF images #6642 [JayWiz, radarhere]
    Raise an error when allocating translucent color to RGB palette #6654 [jsbueno, radarhere]
    Added reading of TIFF child images #6569 [radarhere]
    Improved ImageOps palette handling #6596 [PososikTeam, radarhere]
    Defer parsing of palette into colors #6567 [radarhere]
    Apply transparency to P images in ImageTk.PhotoImage #6559 [radarhere]
    Use rounding in ImageOps contain() and pad() #6522 [bibinhashley, radarhere]
    Fixed GIF remapping to palette with duplicate entries #6548 [radarhere]
    Allow remap_palette() to return an image with less than 256 palette entries #6543 [radarhere]
    Corrected BMP and TGA palette size when saving #6500 [radarhere]
    Do not call load() before draft() in Image.thumbnail #6539 [radarhere]
    Copy palette when converting from P to PA #6497 [radarhere]
    Allow RGB and RGBA values for PA image putpixel #6504 [radarhere]
    Removed support for tkinter in PyPy before Python 3.6 #6551 [nulano]
    Do not use CCITTFaxDecode filter if libtiff is not available #6518 [radarhere]
    Fallback to not using mmap if buffer is not large enough #6510 [radarhere]
    Fixed writing bytes as ASCII tag #6493 [radarhere]
    Open 1 bit EPS in mode 1 #6499 [radarhere]
    Removed support for tkinter before Python 1.5.2 #6549 [radarhere]
    Allow default ImageDraw font to be set #6484 [radarhere, hugovk]
    Save 1 mode PDF using CCITTFaxDecode filter #6470 [radarhere]
    Added support for RGBA PSD images #6481 [radarhere]
    Parse orientation from XMP tag contents #6463 [bigcat88, radarhere]
    Added support for reading ATI1/ATI2 (BC4/BC5) DDS images #6457 [REDxEYE, radarhere]
    Do not clear GIF tile when checking number of frames #6455 [radarhere]
    Support saving multiple MPO frames #6444 [radarhere]
    Do not double quote Pillow version for setuptools >= 60 #6450 [radarhere]
    Added ABGR BMP mask mode #6436 [radarhere]
    Fixed PSDraw rectangle #6429 [radarhere]
    Raise ValueError if PNG sRGB chunk is truncated #6431 [radarhere]
    Handle missing Python executable in ImageShow on macOS #6416 [bryant1410, radarhere]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-pillow_9.2.0.bb => python3-pillow_9.3.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.2.0.bb => python3-pillow_9.3.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
index 454d61a48..11f545160 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.2.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
            "
@@ -39,4 +39,4 @@ RPROVIDES:${PN} += "python3-imaging"
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "58acec3312fb8671c9d84829197e1c8150085589"
+SRCREV = "d594f4cb8dc47fb0c69ae58d9fff86faae4515bd"
-- 
2.39.0


