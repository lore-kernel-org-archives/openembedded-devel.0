Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0399C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:42:20 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.1218.1667810537258592503
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d9ZEiXcw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810535; i=@fujitsu.com;
	bh=pjRA/qCsZYKme7vBuvS19zi9blHbu8T5A4mZR/Uz5mk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=d9ZEiXcwnO4SIAzEK7ukeAzZYoZf3wYjB5O9LZZ8NM4J5PRTg3+I4dcy0s+lSYKN/
	 ORShOMaLsYAokhCP8hDgZShUvfSWrd96GAbTM3g+Cn74Oy8/kksZyHgSrBeLriMiWg
	 hwfhD+XmiL4nmlyZGYf6s/SBNLBgFxzu4Ywzb/9u+JZ7TCZttHUHvGxKppXVgrlsFA
	 Xkk6qV0FkcjwTzZkNjFNwtjZuHZrs7LFg951zLqOP7CQzoVQTP3pZ00uEQ/S10FlKg
	 RIqJDTtQCTlQz34BOabArusvh1O8BifiesFLlTo4E/vnpfli9GkldB+J7ihgf8PYl4
	 y6q0vnifm6zgw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8MxSffZkYx
  kg7UrjCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxbq/6yFCzXrvh2eBlTA+NX5S5GLg4hgSeM
  Ek2f7rNBONeZJHY83MkC4exmlLj0pY+5i5GTg01ASuLG/f9sILaIgL7E0tl7wOLMAioSL373s
  IPYwgJeEud397CA2CxA8aU7GxhBbF4BJ4ntny+B1UgIKEhMefgerJdTwFniwdnpYPVCQDWPfi
  1hg6gXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoWpxaVJZapGukl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvCnFLLN3MPYs/aN3iFGSg0lJlPf38oxkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8N
  zYC5QSLUtNTK9Iyc4CRBJOW4OBREuE1AUaTEG9xQWJucWY6ROoUoyXH1Nn/9jNzLAeTM7+2HW
  AWYsnLz0uVEue9thuoQQCkIaM0D24cLNovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmtQZ
  Zy5OZVwK39RXQQUxAB1UXpIEcVJKIkJJqYDJKXsC3if935EOFOZLi6nVaM4p53Ra1HTENEPg2
  L3F1QWd26z7HSQeL1vbabXV5e+rHyw6VG2I/2w6cP/ZP1mzrwcK2nRVZ6Tl7rXJOFGeEr7hz/
  UdOklt+ovqW/ZOOL1CYqaIS53xqw7N5BTfaRBZrG+x60tO/LF1RXrdxz9H9P6cXpb/5HiiUWc
  i6K3Ltzp+35lr++jFjcosJx6n1hfwHXfqNF3eVb5kWFHFnUbMDc0rrhvR+vtuTGaJ4936dVlx
  v56PyQSPGbS/zjd1T/vZy/VNW91N69MWc464jc6XUOt3EX8cYUr4/m1Dqt1x0i53PdmHlYkX7
  KZYX7cPuPmK1X9TRlhlyMlrz3m7BKUosxRmJhlrMRcWJAFDdmddxAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1667810534!249473!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31326 invoked from network); 7 Nov 2022 08:42:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:42:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6C3C71000D2
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:42:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5F0461000C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:42:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:42:12 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pillow: upgrade 9.2.0 -> 9.3.0
Date: Mon, 7 Nov 2022 16:41:53 +0800
Message-ID: <1667810514-31107-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667810514-31107-1-git-send-email-wangmy@fujitsu.com>
References: <1667810514-31107-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99469

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
2.25.1


