Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2A5C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 04:28:33 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.2896.1657859303984126198
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 21:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=STyv9guG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657859302; i=@fujitsu.com;
	bh=SBgP809SaPBaThPIQBUw+ebs1N+1jMOs3SyknZX/eUE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=STyv9guGbqgCTX83L5iO04H/D9HgzPvcaXTobTRp+E/O+lyYdPRlTfgpKvzYPxYUd
	 +b6q/7W9Ui6igpLEH+pNVCLDILtvZQMmHZrf3PEIoLg5oQ8yjsmFsA4GbkZ4ZciDAm
	 Ayucj/t21z7LoLoZkm3dwtjRdgb/AJZnYOJDOApfMWBrVneh+Z/8iPUaEsYrkW+hZA
	 yZGQmupf6liGMKFKyKtVSK99JtLXExwCCzAYY6ovi7Z+DljgZ5fJIbeduZdFFVgnc1
	 itvQeNv5Ujg/SY7cPKAPKFExDchx4pWE0T5vTe4RzQFZkJDkGnFM2OfR/8cO1BQk8W
	 N2hV9R1Kf7wcg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSffJmwt
  JBqu+M1lcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkztuQVHJOsaDu9mrWBcaZoFyMXh5DAE0aJ
  tRcOsEM415kklj/ewQLhHGCUuH93GWsXIycHm4CuxIsfi1lAbBEBfYmls/cwg9jCAl4SbRM2g
  NWwCKhKHDnRD2bzCnhIzFsziwnElhBQkJjy8D0zRFxQ4uTMJ2BzmAUkJA6+eAEU5wCqUZSYPV
  0eorxC4vXhS8wQtprE1XObmCcw8s1C0j0LSfcCRqZVjLZJRZnpGSW5iZk5uoYGBrqGhqZA2lj
  X0MRIL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAAU4rT+3Ywbtz3S+8Q
  oyQHk5Io76H8C0lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjVXwLlBItS01Mr0jJzgNEAk5bg4
  FES4V3xCijNW1yQmFucmQ6ROsWoy/H309+9zEIsefl5qVLivCUPgYoEQIoySvPgRsAi8xKjrJ
  QwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd7U10BTeDLzSuA2vQI6ggnoiIe+YEeUJCKkpBqYtj1
  2TDis4+c+UeXMVPWQH2ujCmVmpUreyyjm2XLDk4kh9OXWoAQpAWXN5rkR5b4cnE2P15xPmPhY
  v+7BjVS19Q+fz/1/14q7koelXdwv/rnp5qjqnUtqL59Mv2Q570e/5icpi4d/CtbJhnH0hqtmr
  rmyNvFWSqB5W6Z8+TGjRIV9q/8uOvU4clnY/t55K99E1J4Tu/rY99VRZhUPH6fG0/cztcy4J6
  5MVJkm2HYh/t+1j+92Prqx9dbT7RuYW1s3xS6p52xrtBd/nr8se+2PDd5qR+U+rgjIPjsj325
  91+tfde94oxLK1E1+zdXexlLXkbCg5+5kj4BC4wmL1jX7bZx1RUVKz0LKIqmq1/qGEktxRqKh
  FnNRcSIAKUVR7EcDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1657859299!53951!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16556 invoked from network); 15 Jul 2022 04:28:19 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jul 2022 04:28:19 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6F2261000C1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:28:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6265A100077
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:28:19 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Jul 2022 05:28:17 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pillow: upgrade 9.1.1 -> 9.2.0
Date: Fri, 15 Jul 2022 12:28:10 +0800
Message-ID: <1657859290-15224-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 04:28:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97838

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
2.25.1


