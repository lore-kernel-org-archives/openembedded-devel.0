Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D3BC77B71
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:28:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.39444.1681115294478416204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XE3wlS13;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115292; i=@fujitsu.com;
	bh=2Xmu5BkD18vr0gwBG3EXgRrHjc/PrOH9CU+DZJQ9yl8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XE3wlS13p0n/s9gMypCWxOF05gUNV6U6/Rsi1CN+hiiIjYSnQaNZWmn56LCJ9SsgT
	 WTO9nRYBg+YWNnM5/XvDEGMAtmIb0kn+ciQzaTBpdWbommgw79Pa8LzyCMUhpsLEAU
	 aHO+Yb36ThABWTASZmgg2GbPILgyoIdK5xnQj1qM8blBUn86tuV78SCqJPJKX0VGQu
	 5IhdbZSXp4IFCCFMk1q240hqudnvsV1lxyW5aUsLeyqwx5RazCHVZWHLY5m2Nd4BPR
	 Uhr7dshEfhZ6KPqaII+79nHvXZE56FeLjy7YcJ+92vFbKE/DfOXbEYVprmP376PzmY
	 pACRgGZ3ENRnQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWXfOCeM
  Ugx/zJS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz+999ZClZJVyxfs4mlgfGNWBcjF4eQwENG
  iaMXJzFDOFeYJBYdOwvl7GGU6D24EMjh5GATkJK4cf8/G4gtIqAvsXT2HrA4s4CKxIvfPewgt
  rCAl8T1i7/A4iwCqhJLp91l6mLk4OAVcJLYuoIPJCwhoCAx5eF7sBJOAWeJZddOsILYQkAly1
  8/YgSxeQUEJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYFRKN0w8xQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjGaFacWlaUW6Rpa6CUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym
  56To5aWWbGIEBm9KsfKHHYxL+/7qHWKU5GBSEuXt4jJOEeJLyk+pzEgszogvKs1JLT7EKMPBo
  STBu/AAUE6wKDU9tSItMwcYSTBpCQ4eJRHeimNAad7igsTc4sx0iNQpRkUpcd5ekIQASCKjNA
  +uDRa9lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8247DDSFJzOvBG76K6DFTECLuVwMQBa
  XJCKkpBqYrDN75HZXRgj+XR+l47Lj3tWUA2yhU2uyf028b7RF8k5mcnj0jF4rQ2m9LXPSHxWe
  9Fu4aOJZwZO31i6flz41QbQyeb3lvj6m+3vn6weIvDl/Tn7Vq3VK4a3nV8/+K9h0orw52WHuH
  m3P//dttx/nXP0vNNhHTp2Btdmvw+DChLWhe29xX208ztLiz1xYeVi784/mHEv9mCeCNSYn9m
  TsVvij0zv5eln3x+9O4T6LsqW/fKnKvii3zH6hdEXh5gtyjyUDp28MO/t09imXYiP1Iw2d8v5
  zxZ/z9pXuqj9n1rUg8fsv2XgZf8uzlZxMHjdeN62dt+X405Vq4bVnGBlK60/I+7CucLCZaOip
  +btViaU4I9FQi7moOBEAEYKcV1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1681115292!288326!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26638 invoked from network); 10 Apr 2023 08:28:12 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:28:12 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 219FF159
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:28:12 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 155D9155
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:28:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:28:10 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pillow: upgrade 9.4.0 -> 9.5.0
Date: Mon, 10 Apr 2023 16:27:41 +0800
Message-ID: <1681115263-24378-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115263-24378-1-git-send-email-wangmy@fujitsu.com>
References: <1681115263-24378-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102012

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Alex Clark -> Jeffrey A. Clark (Alex)
 Update HPND wording in LICENSE file

Changelog:
==========
    Added ImageSourceData to TAGS_V2 #7053
    Clear PPM half token after use #7052
    Removed absolute path to ldconfig #7044
    Support custom comments and PLT markers when saving JPEG2000 images #6903
    Load before getting size in __array_interface__ #7034
    Support creating BGR;15, BGR;16 and BGR;24 images, but drop support for BGR;32 #7010
    Consider transparency when applying APNG blend mask #7018
    Round duration when saving animated WebP images #6996
    Added reading of JPEG2000 comments #6909
    Decrement reference count #7003
    Allow libtiff_support_custom_tags to be missing #7020
    Improved I;16N support #6834
    Added QOI reading #6852
    Added saving RGBA images as PDFs #6925
    Do not raise an error if os.environ does not contain PATH #6935
    Close OleFileIO instance when closing or exiting FPX or MIC #7005
    Added __int__ to IFDRational for Python >= 3.11 #6998
    Added memoryview support to Dib.frombytes() #6988
    Close file pointer copy in the libtiff encoder if still open #6986
    Raise an error if ImageDraw co-ordinates are incorrectly ordered #6978
    Added "corners" argument to ImageDraw rounded_rectangle() #6954
    Added memoryview support to frombytes() #6974
    Allow comments in FITS images #6973
    Support saving PDF with different X and Y resolutions #6961
    Fixed writing int as UNDEFINED tag #6950
    Raise an error if EXIF data is too long when saving JPEG #6939
    Handle more than one directory returned by pkg-config #6896
    Do not retry past formats when loading all formats for the first time #6902
    Do not retry specified formats if they failed when opening #6893
    Do not unintentionally load TIFF format at first #6892
    Stop reading when EPS line becomes too long #6897
    Allow writing IFDRational to BYTE tag #6890
    Raise ValueError for BoxBlur filter with negative radius #6874
    Support arbitrary number of loaded modules on Windows #6761

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pillow_9.4.0.bb => python3-pillow_9.5.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.4.0.bb => python3-pillow_9.5.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.5.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.5.0.bb
index 86705d2d8..76b3a82db 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.5.0.bb
@@ -3,7 +3,7 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bc416d18f294943285560364be7cbec1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b22dc6b663b9175820e5e03337c7596b"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
@@ -61,4 +61,4 @@ do_install_ptest() {
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "a5bbab1c1e63b439de191ef2040173713b26d2da"
+SRCREV = "204590600c6a8c5246d0564d3312abd6e6b0ed70"
-- 
2.34.1


