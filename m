Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329C5C4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:40:29 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.3722.1672803626676635371
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:40:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rSrJgxaY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803624; i=@fujitsu.com;
	bh=vgGjrMKztFdZhPKRrxr8EcXg/CrJbtv/D7LlyVJgvCs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rSrJgxaYnOhPuYlpaA29aYmnXZz7swXxNCZEaw32fFMzzyiDVg2DnzbBgdVn/42Si
	 Nai0f9iC7uHg/qCTaunsApDKJ4M0U1IgT2ckS5IErXZICsa7wrp3JEar/fhCFURa4d
	 EP2ay/3STyqHvzStCxPaDee+yciqKLlRV7VIC23J8hQB7kxUfBLBAAardJFl2G9UN9
	 7sR8rXxVaCJfeA7W09yKkCk73wpw7LVrdl+Qd0LKDV0VE6fQPsMndIUudDfZZScQ86
	 U5Oi0rCuG467QpI17cQH9H/OzWHG+0Nm3WCrztCQDa4ww2ToRssDRhWVCGU5WcTwMe
	 ZSu/slUiXzgkw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORqKv+dUu
  ywaWJIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a5iRNYC65LVszvlm9gnCDWxcjFISTwhFHi
  /5+dTBDOdSaJx5tbmLsYOYGc3YwSO146gNhsAlISN+7/ZwOxRQT0JZbO3gNWwyygIvHidw87i
  C0s4CXR1woRZxFQlfi5ZSNYnFfASeLH48OsILaEgILElIfvmSHighInZz5hgZgjIXHwxQtmiB
  pFidmXm1kg7AqJWbPamCBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYTYtTi8pSi3TN9ZKKMtMzSnI
  TM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECAzGlmDF3B+POZX/0DjFK
  cjApifKWfN6SLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV/0TUE6wKDU9tSItMwcYFTBpCQ4eJ
  RHeLJBW3uKCxNzizHSI1ClGXY67C/fuZRZiycvPS5US530KUiQAUpRRmgc3AhahlxhlpYR5GR
  kYGIR4ClKLcjNLUOVfMYpzMCoJ864GmcKTmVcCt+kV0BFMQEckrdkIckRJIkJKqoFJ8Jf7Tzf
  ud/kWRsKKJstnTP94WNgn//Yy/fj5R8z/f30S9+dHs4bl9ENi+zTYd240veTL9+DK42VzPs+f
  N43tfKqzb3Dj1iLXiJn/Z3DuntS3sXhB2NOt+/oWHTc+6P7Hs33fdo0Xm1/NfvTi8sHl6uIWG
  VkR2ozut6dYsuX1Si8vENz276PfosR7GSJfDgY8PfBjqk6titaUhdaTYtf1+a78zS6xz/80v+
  fKaZIePl7/ZrzsOJ7nIRb64vlr7gTLJ3NULuobqn6bEb1sRvSU/eVXmpoaBLuOV/+2OPJYaaH
  ytweBB+Vs7k+/5ePz/H1ae8yeqdPd1trVHWVgEObfdP5lGtNy3rPH5rnmSWXt6lNiKc5INNRi
  LipOBADbl1LHSwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1672803623!260035!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23932 invoked from network); 4 Jan 2023 03:40:23 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:40:23 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E5FA1100192
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:40:22 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D94EF100188
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:40:22 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:40:21 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pillow: upgrade 9.3.0 -> 9.4.0
Date: Fri, 30 Dec 2022 12:56:48 +0800
Message-ID: <1672376212-25291-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100371

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
---
 .../{python3-pillow_9.3.0.bb => python3-pillow_9.4.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.3.0.bb => python3-pillow_9.4.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 11f5451609..403a987d1e 100644
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
2.25.1


