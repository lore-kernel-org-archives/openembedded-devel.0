Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4CDC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 04:35:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.2791.1657859694504081028
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 21:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ft3oMUGu;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657859692; i=@fujitsu.com;
	bh=SBgP809SaPBaThPIQBUw+ebs1N+1jMOs3SyknZX/eUE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ft3oMUGu/77Wbv0VbTERIWWvB4+1wDVKsTRfhh/+sRJ1S5qnkYdgmgLP/t5sEXuP5
	 P0vdgN+Yg2EB6pNeUKw7ZhtVEWjKIDKWhXiui+1IE7EI9RsXgM7WOobQTB5HnkqnIF
	 BLt+JgFb7zcUEIm7K8AnWOEytdvAnI/av3UNUsaF7csNHvxlkwb0ZctQs2CEb/B5Ck
	 7i7PCLLawYGTaGFNTRP81IY5YA3Okg3AfqhxnkJjOMXE8lGNp2HoqBuChfla4+Fvz4
	 C/oiUJ6BoEybPsa5F0w4uLVmRdFiBqAhiPThu+nDqfgCro4xDC+nrFuOzpoT5I1tRZ
	 Sy8ZBsW7J9JZg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORpJvz7kK
  SwdlfnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aMLXkFxyQr2k6vZm1gnCnaxcjFISTwkFGi
  4+ZUVgjnMpPEpX1tbBDOAUaJu3OvAjmcHGwCuhIvfixmAbFFBPQlls7ewwxiCwt4SbRN2MAKY
  rMIqEo86XnODmLzCnhIvJ02C6xeQkBBYsrD98wQcUGJkzOfgMWZBSQkDr54ARTnAKpRlJg9XR
  6ivELi9eFLzBC2msTVc5uYJzDyzULSPQtJ9wJGplWM1klFmekZJbmJmTm6hgYGuoaGprrGFkD
  KUC+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzD4UorV8ncw/l35U+8QoyQH
  k5Io76H8C0lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgZ3gDlBItS01Mr0jJzgJEAk5bg4FES4
  V3xCijNW1yQmFucmQ6ROsWoy/H309+9zEIsefl5qVLivCUPgYoEQIoySvPgRsCi8hKjrJQwLy
  MDA4MQT0FqUW5mCar8K0ZxDkYlYV6ut0BTeDLzSuA2vQI6ggnoiIe+YEeUJCKkpBqYMnmvPGL
  8PEPo7x1mbbHrJ9N65i2REtTY6rJEVOeHdFr5vdC4zGL9R34/95hPbWm9PuMD9+vDxVL6W385
  6c+5uv3kqx17zSVnn/RuWzuh9ubVA86Ri+e/kLy04M6SA4d89+vprsjVOO0TIVnF+ZTXyD5n8
  dGrlhv81Z7WvBc4Iz/p77UYyxnOuc4b++cbbNhs9qRY4UGN/WTOyIe9T212tj2fb3ttR7zaV4
  6J70++ueraqm1c4OtgFGD84a4Y4+34458LPsreqdv9bAJbz92p0tKrH/wzCfzJ6lSc//fRmdT
  J5hdWfZ54c3U441FWo3RP19d9F21cHs9wjVL/FcX7ZrfTaU3f+wvPmF370uZ2760SS3FGoqEW
  c1FxIgCdYTLvRQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1657859692!137261!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18328 invoked from network); 15 Jul 2022 04:34:52 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jul 2022 04:34:52 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D79F61AB
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:34:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id CBCA37C
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:34:51 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Jul 2022 05:34:50 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pillow: upgrade 9.1.1 -> 9.2.0
Date: Fri, 15 Jul 2022 12:34:44 +0800
Message-ID: <1657859684-15382-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 04:35:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97840

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


