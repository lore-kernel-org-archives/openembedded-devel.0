Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5D4C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 23:08:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9728.1675206534391607231
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 15:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=tIZPq1m+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1395f88de3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VLrIGJ024236
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=XOGt28hnxVY56+j1advZPY1sWApJRYcs5JsSHRN7//c=;
 b=tIZPq1m+qjyrxM+hd2fFbd4mpd0frN1FXaFxjM99ZEBjELscTrKGEy5Np7ZZP6p3GWLb
 XDLt8pr/2nO3sPYwYY88EKbjjQW4cgCR8iT7LKCAv41d/eZ+5AZ2hl7IAd4X+e9dmYBx
 rPk3MnWMYnEMrcWsKaRQC0zSgNAFa+ZEk6xkdgJy/uT1KjY90H6yJSHMwhX+DSXH4GJV
 oSjDdOpoWfFNM2ExVNQ1XmUMCthVt9ylZGAaeZHRdpLSUCEzMIf67mxhQ1NyEnz1A1ki
 kaCceACttqZRJSExsrwDpNK3uCKtc/JAqU35egub4OBLYogRJ1pWU12hrgjWTe0TQbh+ Cw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncrx3bv5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:53 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 31 Jan 2023 15:08:52 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 31 Jan 2023 15:08:52 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][kirkstone][PATCH 4/6] python3-pillow: upgrade 9.3.0 -> 9.4.0
Date: Tue, 31 Jan 2023 15:08:49 -0800
Message-ID: <20230131230851.2785067-4-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Vz25cFnBYsR-Rw9jWCVSqLZOgHn_I-xK
X-Proofpoint-ORIG-GUID: Vz25cFnBYsR-Rw9jWCVSqLZOgHn_I-xK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310199
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100891

From: Wang Mingyu <wangmy@fujitsu.com>

License-Updated: copyright year updated to 2023

Changelog:
==========
 Fixed null pointer dereference crash with malformed font #6846
 Return from ImagingFill early if image has a zero dimension #6842
 Reversed deprecations for Image constants, except for duplicate Resampling attributes #6830
 Improve exception traceback readability #6836
 Do not attempt to read IFD1 if absent #6840
 Fixed writing int as ASCII tag #6800
 If available, use wl-paste or xclip for grabclipboard() on Linux #6783
 Added signed option when saving JPEG2000 images #6709
 Patch OpenJPEG to include ARM64 fix #6718
 Added support for I;16 modes in putdata() #6825
 Added conversion from RGBa to RGB #6708
 Added DDS support for uncompressed L and LA images #6820
 Added LightSource tag values to ExifTags #6749
 Fixed PyAccess after changing ICO size #6821
 Do not use EXIF from info when saving PNG images #6819
 Fixed saving EXIF data to MPO #6817
 Added Exif hide_offsets() #6762
 Only compare to previous frame when checking for duplicate GIF frames while saving #6787
 Always initialize all plugins in registered_extensions() #6811
 Ignore non-opaque WebP background when saving as GIF #6792
 Only set tile in ImageFile __setstate__ #6793
 When reading BLP, do not trust JPEG decoder to determine image is CMYK #6767
 Added IFD enum to ExifTags #6748
 Fixed bug combining GIF frame durations #6779
 Support saving JPEG comments #6774
 Added getxmp() to WebPImagePlugin #6758
 Added "exact" option when saving WebP #6747
 Use fractional coordinates when drawing text #6722
 Fixed writing int as BYTE tag #6740
 Added MP Format Version when saving MPO #6735
 Added Interop to ExifTags #6724
 CVE-2007-4559 patch when building on Windows #6704
 Fix compiler warning: accessing 64 bytes in a region of size 48 #6714
 Use verbose flag for pip install #6713

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-pillow_9.3.0.bb => python3-pillow_9.4.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.3.0.bb => python3-pillow_9.4.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 11f545160..403a987d1 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -3,7 +3,7 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bc416d18f294943285560364be7cbec1"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
@@ -39,4 +39,4 @@ RPROVIDES:${PN} += "python3-imaging"
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "d594f4cb8dc47fb0c69ae58d9fff86faae4515bd"
+SRCREV = "a5bbab1c1e63b439de191ef2040173713b26d2da"
-- 
2.39.0


