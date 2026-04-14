Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B85F531EC
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 04:04:30 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11203.1776139463775652320
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 21:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lw0JUW6b;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: nmjain23@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c74f0c3fc16so1762435a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 21:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776139463; x=1776744263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jd45Vbbv1rDDVxmT6dUkW8WOMDTcdaaPpdYUnGZjFH8=;
        b=lw0JUW6bn+qP6cF4486n83bJZ+ns74DPNiIVdS8/zPDezBT+78OSq+aumaBr2MwxQ+
         hTW8HoyaIvdhoS7kAr/dt0D7V9NFk6ZIlqdS126bvDB0/3eKTEhU05A8FrYVwXJkq20N
         ANiX+FtPyiuiV9bxrbIOnnNmrOyimll1ZH4ku/ami/83SnvLZQbH3/em94oFXtilDFwd
         BdCyRjhgAaDiuFAVGFXjAlDkNfpGoTqD5K1IRRfTEByHuU0vmfy3Stt2rXVhCjmOOEUS
         WLUkkOdr3UkS4m7kg5Kw/2F3+F9SqS9X74BzkLb4gnP03JUkMfWc9iMH9b31oOIx2bvU
         W5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776139463; x=1776744263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd45Vbbv1rDDVxmT6dUkW8WOMDTcdaaPpdYUnGZjFH8=;
        b=k7u+o1ksxdPn3lvR2sX92onK7iQgPHpsyP73gFBwK1hqP9IVBqHRXY9g6XbubptCOv
         0JyqW+jnstvVC4dajM3GYNSk+LXZNoUfEh6alk/P9pYQKOrn4qeklyfMVcKad1oiDcKc
         950GQaSKRa/Gm9HpLk2Pg/eAT0leYJQZuqGTGSTwT7penbwEC1Wt4hWkCbghJ3p7n5pL
         JvyIlDcVgiEek+zKL4i3SoT2f94XN5riwZO6/ApcHgkA9QoQI+D+A2cZ93oKYSYYNOuP
         aoPzUITdnsLc7qJt5xTdNdMJ2gGNyKpo/2V9YnsFrl3KFtkZT5d5J+yABiUGBwpqW9+u
         RGvw==
X-Gm-Message-State: AOJu0YwjgWE5vMmSqY4qvLZKSIvOi8yDA6KmKc9bKcFab8o8Y6FiPFSK
	KPQvyln2wiKJZYKgUfyi1BU4YgV2xeH1xduzd4KDKYPrvB1R1Sh+fqOPXKliAw==
X-Gm-Gg: AeBDiety4LhL79CQMo35bboOAifWkd2kfrxf3gX8OWlVmSc8iod3Z4iQapgt8aY1trN
	6J/ClMdKByrSsed2KqDhXOzYKqrHY15EKMj1/ATv59Y2HAKWNJ5sz58zxyBc1pNncidSHdeu/Ga
	C3rccnpqJdVyqipr5D/SRt3ojNYzdnVxfWc8yudlposEyfGN9HCg8GOJSHfAz5OVuX4AL5IWdEp
	mvZ5gPluagjADjA3ZD3qMNmAYiZfEQpmWQbFrZMbakmNirhGdoiqLtPzqbVPqmmwhUizrEcO989
	7qQr2guscEehRsgoR5DByaomFI+8MoeBbXWawMSrkJieXZGhSIo0GhfuWtE8Ha6KKk1rCNFNuBw
	09qWbk+/eHYpy3d5ra9/eTBFELni1mp8us0z1r+8j2Lr0wJzESxRi66pMUxG3eNGmt7wnpR8BC4
	FH+FFmlgZ1stYub1IcPDl0oAN+tT7YtNsXpisBOQCtknr5TS+zhKtIZ1AZ6PaKGM4tL5p81wI=
X-Received: by 2002:a05:6a20:2451:b0:398:bcee:4502 with SMTP id adf61e73a8af0-39fe3f15038mr17232954637.33.1776139461446;
        Mon, 13 Apr 2026 21:04:21 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([49.43.162.246])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79219fb00csm11079504a12.23.2026.04.13.21.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 21:04:20 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <naman.jain@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Naman Jain <namanj1@kpit.com>
Subject: [meta-oe][scarthgap][PATCH] Imagemagick: Fix CVEs
Date: Tue, 14 Apr 2026 09:34:05 +0530
Message-Id: <20260414040405.2258458-1-naman.jain@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 04:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126293

Fix the following CVEs-
CVE-2026-24481 CVE-2026-25638 CVE-2026-25794 CVE-2026-25795
CVE-2026-25796 CVE-2026-25797 CVE-2026-25798 CVE-2026-25799
CVE-2026-25897 CVE-2026-25898 CVE-2026-25965 CVE-2026-25966
CVE-2026-25967 CVE-2026-25968 CVE-2026-25969 CVE-2026-25970
CVE-2026-25982 CVE-2026-25985 CVE-2026-25986 CVE-2026-25987
CVE-2026-25988 CVE-2026-26066 CVE-2026-26283 CVE-2026-26284
CVE-2026-26983

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../imagemagick/CVE-2026-24481.patch          |  30 ++
 .../imagemagick/CVE-2026-25638.patch          |  29 ++
 .../imagemagick/CVE-2026-25794.patch          |  60 +++
 .../imagemagick/CVE-2026-25795.patch          |  32 ++
 .../imagemagick/CVE-2026-25796.patch          |  46 +++
 .../imagemagick/CVE-2026-25797_1.patch        | 344 ++++++++++++++++++
 .../imagemagick/CVE-2026-25797_2.patch        | 143 ++++++++
 .../imagemagick/CVE-2026-25798.patch          | 109 ++++++
 .../imagemagick/CVE-2026-25799.patch          |  42 +++
 .../imagemagick/CVE-2026-25897.patch          |  34 ++
 .../imagemagick/CVE-2026-25898_1.patch        |  39 ++
 .../imagemagick/CVE-2026-25898_2.patch        |  37 ++
 .../imagemagick/CVE-2026-25965.patch          | 322 ++++++++++++++++
 .../imagemagick/CVE-2026-25966.patch          |  56 +++
 .../imagemagick/CVE-2026-25967.patch          |  38 ++
 .../imagemagick/CVE-2026-25968.patch          |  39 ++
 .../imagemagick/CVE-2026-25969.patch          |  63 ++++
 .../imagemagick/CVE-2026-25970.patch          | 139 +++++++
 .../imagemagick/CVE-2026-25970_pre1.patch     |  57 +++
 .../imagemagick/CVE-2026-25982.patch          |  77 ++++
 .../imagemagick/CVE-2026-25985.patch          |  67 ++++
 .../imagemagick/CVE-2026-25986.patch          |  42 +++
 .../imagemagick/CVE-2026-25987.patch          |  44 +++
 .../imagemagick/CVE-2026-25988.patch          |  50 +++
 .../imagemagick/CVE-2026-26066.patch          |  49 +++
 .../imagemagick/CVE-2026-26283.patch          |  33 ++
 .../imagemagick/CVE-2026-26284.patch          |  31 ++
 .../imagemagick/CVE-2026-26983.patch          |  41 +++
 .../imagemagick/imagemagick_7.1.1.bb          |  28 ++
 29 files changed, 2121 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970_pre1.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25982.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25985.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25986.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25987.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25988.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26066.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26283.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26284.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26983.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
new file mode 100644
index 0000000000..abfa1f817c
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
@@ -0,0 +1,30 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 23 Jan 2026 13:19:06 +0100
+Subject: Initialize the pixels with empty values to prevent possible heap
+ information disclosure (GHSA-96pc-27rx-pr36)
+
+(cherry picked from commit 51c9d33f4770cdcfa1a029199375d570af801c97)
+
+CVE: CVE-2026-24481
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick6/commit/38872ec2a70084813883ea152f18497911823c18]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/51c9d33f4770cdcfa1a029199375d570af801c97
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-96pc-27rx-pr36
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/psd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/coders/psd.c b/coders/psd.c
+index 050abcd..7e2b3eb 100644
+--- a/coders/psd.c
++++ b/coders/psd.c
+@@ -1331,6 +1331,7 @@ static MagickBooleanType ReadPSDChannelZip(Image *image,
+       ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed",
+         image->filename);
+     }
++  memset(pixels,0,count*sizeof(*pixels));
+   if (ReadBlob(image,compact_size,compact_pixels) != (ssize_t) compact_size)
+     {
+       pixels=(unsigned char *) RelinquishMagickMemory(pixels);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch
new file mode 100644
index 0000000000..025ff90c40
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch
@@ -0,0 +1,29 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Tue, 3 Feb 2026 22:06:12 +0100
+Subject: Fixed memory leak when writing MSL files (GHSA-gxcx-qjqp-8vjw)
+
+(cherry picked from commit 1e88fca11c7b8517100d518bc99bd8c474f02f88)
+
+CVE: CVE-2026-25638
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/1e88fca11c7b8517100d518bc99bd8c474f02f88]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/1e88fca11c7b8517100d518bc99bd8c474f02f88
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-gxcx-qjqp-8vjw
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/msl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/coders/msl.c b/coders/msl.c
+index 43c4b73..9facbf2 100644
+--- a/coders/msl.c
++++ b/coders/msl.c
+@@ -7887,6 +7887,7 @@ static MagickBooleanType WriteMSLImage(const ImageInfo *image_info,Image *image,
+     (void) LogMagickEvent(TraceEvent,GetMagickModule(),"%s",image->filename);
+   msl_image=CloneImage(image,0,0,MagickTrue,exception);
+   status=ProcessMSLScript(image_info,&msl_image,exception);
++  msl_image=DestroyImageList(msl_image);
+   return(status);
+ }
+ #endif
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch
new file mode 100644
index 0000000000..f67ab86ad1
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch
@@ -0,0 +1,60 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 6 Feb 2026 21:03:53 +0100
+Subject: Prevent out of bounds heap write in uhdr encoder
+ (https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vhqj-f5cj-9x8h)
+
+(cherry picked from commit ffe589df5ff8ce1433daa4ccb0d2a9fadfbe30ed)
+
+Subject: [PATCH] CVE-2026-25794
+CVE: CVE-2026-25794
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/ffe589df5ff8ce1433daa4ccb0d2a9fadfbe30ed]
+
+origin:  https://github.com/ImageMagick/ImageMagick/commit/ffe589df5ff8ce1433daa4ccb0d2a9fadfbe30ed
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vhqj-f5cj-9x8h
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/uhdr.c | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/coders/uhdr.c b/coders/uhdr.c
+index 0a25676..a527465 100644
+--- a/coders/uhdr.c
++++ b/coders/uhdr.c
+@@ -618,20 +618,28 @@ static MagickBooleanType WriteUHDRImage(const ImageInfo *image_info,
+   {
+     /* Classify image as hdr/sdr intent basing on depth */
+     int
+-      bpp = image->depth >= hdrIntentMinDepth ? 2 : 1;
+-
+-    int
+-      aligned_width = image->columns + (image->columns & 1);
+-
+-    int
+-      aligned_height = image->rows + (image->rows & 1);
++      bpp;
+ 
+     ssize_t
+-      picSize = aligned_width * aligned_height * bpp * 1.5 /* 2x2 sub-sampling */;
++      aligned_height,
++      aligned_width;
++
++    size_t
++      picSize;
+ 
+     void
+       *crBuffer = NULL, *cbBuffer = NULL, *yBuffer = NULL;
+ 
++    if (((double) image->columns > sqrt(MAGICK_SSIZE_MAX/3.0)) ||
++        ((double) image->rows > sqrt(MAGICK_SSIZE_MAX/3.0)))
++      {
++        (void) ThrowMagickException(exception,GetMagickModule(),ImageError,
++          "WidthOrHeightExceedsLimit","%s",image->filename);
++        goto next_image;
++    }
++    bpp = image->depth >= hdrIntentMinDepth ? 2 : 1;
++    aligned_width = image->columns + (image->columns & 1);
++    picSize = aligned_width * aligned_height * bpp * 1.5 /* 2x2 sub-sampling */;
+     if (IssRGBCompatibleColorspace(image->colorspace) && !IsGrayColorspace(image->colorspace))
+     {
+       if (image->depth >= hdrIntentMinDepth && hdr_ct == UHDR_CT_LINEAR)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch
new file mode 100644
index 0000000000..69a474dc11
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch
@@ -0,0 +1,32 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 6 Feb 2026 21:16:10 +0100
+Subject: Fixed NULL pointer dereference in ReadSFWImage (GHSA-p33r-fqw2-rqmm)
+
+(cherry picked from commit 0c7d0b9671ae2616fca106dcada45536eb4df5dc)
+
+CVE: CVE-2026-25796
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/0c7d0b9671ae2616fca106dcada45536eb4df5dc]
+
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p33r-fqw2-rqmm
+origin: https://github.com/ImageMagick/ImageMagick/commit/0c7d0b9671ae2616fca106dcada45536eb4df5dc
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/sfw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/coders/sfw.c b/coders/sfw.c
+index 22ebcd9..46c67b4 100644
+--- a/coders/sfw.c
++++ b/coders/sfw.c
+@@ -317,9 +317,9 @@ static Image *ReadSFWImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   if ((unique_file == -1) || (file == (FILE *) NULL))
+     {
+       buffer=(unsigned char *) RelinquishMagickMemory(buffer);
+-      read_info=DestroyImageInfo(read_info);
+       (void) CopyMagickString(image->filename,read_info->filename,
+         MagickPathExtent);
++      read_info=DestroyImageInfo(read_info);
+       ThrowFileException(exception,FileOpenError,"UnableToCreateTemporaryFile",
+         image->filename);
+       image=DestroyImageList(image);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch
new file mode 100644
index 0000000000..7bd577b4dd
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch
@@ -0,0 +1,46 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 6 Feb 2026 21:10:47 +0100
+Subject: Prevent memory leak in early exits (GHSA-g2pr-qxjg-7r2w)
+
+(cherry picked from commit 93ad259ce4f6d641eea0bee73f374af90f35efc3)
+
+CVE: CVE-2026-25796
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/93ad259ce4f6d641eea0bee73f374af90f35efc3]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/93ad259ce4f6d641eea0bee73f374af90f35efc3
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-g2pr-qxjg-7r2w
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/stegano.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/coders/stegano.c b/coders/stegano.c
+index 111640a..5f91bd9 100644
+--- a/coders/stegano.c
++++ b/coders/stegano.c
+@@ -150,15 +150,22 @@ static Image *ReadSTEGANOImage(const ImageInfo *image_info,
+     return(DestroyImage(image));
+   watermark->depth=MAGICKCORE_QUANTUM_DEPTH;
+   if (AcquireImageColormap(image,MaxColormapSize,exception) == MagickFalse)
+-    ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
++    {
++      watermark=DestroyImage(watermark);
++      ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
++    }
+   if (image_info->ping != MagickFalse)
+     {
++      watermark=DestroyImage(watermark);
+       (void) CloseBlob(image);
+       return(GetFirstImageInList(image));
+     }
+   status=SetImageExtent(image,image->columns,image->rows,exception);
+   if (status == MagickFalse)
+-    return(DestroyImageList(image));
++    {
++      watermark=DestroyImage(watermark);
++      return(DestroyImageList(image));
++    }
+   for (y=0; y < (ssize_t) image->rows; y++)
+   {
+     q=QueueAuthenticPixels(image,0,y,image->columns,1,exception);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1.patch
new file mode 100644
index 0000000000..295b686a91
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1.patch
@@ -0,0 +1,344 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 6 Feb 2026 21:28:50 +0100
+Subject: Prevent code injection via PostScript header
+ (https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-rw6c-xp26-225v)
+
+(cherry picked from commit 26088a83d71e9daa203d54a56fe3c31f3f85463d)
+
+CVE: CVE-2026-25797
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/26088a83d71e9daa203d54a56fe3c31f3f85463d]
+
+origin: backport, https://github.com/ImageMagick/ImageMagick/commit/26088a83d71e9daa203d54a56fe3c31f3f85463d
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-rw6c-xp26-225v
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/ps.c  | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ coders/ps2.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ coders/ps3.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 3 files changed, 243 insertions(+), 3 deletions(-)
+
+diff --git a/coders/ps.c b/coders/ps.c
+index 8af2af7..3999cf9 100644
+--- a/coders/ps.c
++++ b/coders/ps.c
+@@ -1086,6 +1086,82 @@ static inline unsigned char *PopHexPixel(const char hex_digits[][3],
+   return(pixels);
+ }
+ 
++static inline void FilenameToTitle(const char *filename,char *title,
++  const size_t extent)
++{
++  int
++    depth = 0;
++
++  ssize_t
++    i,
++    offset = 0;
++
++  if (extent == 0)
++    return;
++  for (i=0; (filename[i] != '\0') && ((offset+1) < (ssize_t) extent); i++)
++  {
++    unsigned char
++      c = filename[i];
++
++    /*
++      Only allow printable ASCII.
++    */
++    if ((c < 32) || (c > 126))
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Percent signs break DSC parsing.
++    */
++    if (c == '%')
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Parentheses must remain balanced.
++    */
++    if (c == '(')
++      {
++        depth++;
++        title[offset++] = '(';
++        continue;
++      }
++    if (c == ')')
++      {
++        if (depth <= 0)
++          title[offset++]='_';
++        else
++          {
++            depth--;
++            title[offset++]=')';
++          }
++         continue;
++     }
++    /*
++      Everything else is allowed.
++    */
++    title[offset++]=c;
++  }
++  /*
++    If parentheses remain unbalanced, close them.
++  */
++  while ((depth > 0) && ((offset+1) < (ssize_t) extent)) {
++    title[offset++]=')';
++    depth--;
++  }
++  title[offset]='\0';
++  /*
++    Ensure non-empty result.
++  */
++  if (offset == 0)
++    {
++      (void) CopyMagickString(title,"Untitled",extent-1);
++      title[extent-1]='\0';
++    }
++}
++
+ static MagickBooleanType WritePSImage(const ImageInfo *image_info,Image *image,
+   ExceptionInfo *exception)
+ {
+@@ -1554,6 +1630,9 @@ static MagickBooleanType WritePSImage(const ImageInfo *image_info,Image *image,
+       text_size=(size_t) (MultilineCensus(value)*pointsize+12);
+     if (page == 1)
+       {
++        char
++          title[MagickPathExtent];
++
+         /*
+           Output Postscript header.
+         */
+@@ -1564,8 +1643,9 @@ static MagickBooleanType WritePSImage(const ImageInfo *image_info,Image *image,
+             MagickPathExtent);
+         (void) WriteBlobString(image,buffer);
+         (void) WriteBlobString(image,"%%Creator: (ImageMagick)\n");
++        FilenameToTitle(image->filename,title,MagickPathExtent);
+         (void) FormatLocaleString(buffer,MagickPathExtent,"%%%%Title: (%s)\n",
+-          image->filename);
++          title);
+         (void) WriteBlobString(image,buffer);
+         timer=GetMagickTime();
+         (void) FormatMagickTime(timer,sizeof(date),date);
+diff --git a/coders/ps2.c b/coders/ps2.c
+index f840782..10670a7 100644
+--- a/coders/ps2.c
++++ b/coders/ps2.c
+@@ -225,6 +225,82 @@ static MagickBooleanType Huffman2DEncodeImage(const ImageInfo *image_info,
+   return(status);
+ }
+ 
++static inline void FilenameToTitle(const char *filename,char *title,
++  const size_t extent)
++{
++  int
++    depth = 0;
++
++  ssize_t
++    i,
++    offset = 0;
++
++  if (extent == 0)
++    return;
++  for (i=0; (filename[i] != '\0') && ((offset+1) < (ssize_t) extent); i++)
++  {
++    unsigned char
++      c = filename[i];
++
++    /*
++      Only allow printable ASCII.
++    */
++    if ((c < 32) || (c > 126))
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Percent signs break DSC parsing.
++    */
++    if (c == '%')
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Parentheses must remain balanced.
++    */
++    if (c == '(')
++      {
++        depth++;
++        title[offset++] = '(';
++        continue;
++      }
++    if (c == ')')
++      {
++        if (depth <= 0)
++          title[offset++]='_';
++        else
++          {
++            depth--;
++            title[offset++]=')';
++          }
++         continue;
++     }
++    /*
++      Everything else is allowed.
++    */
++    title[offset++]=c;
++  }
++  /*
++    If parentheses remain unbalanced, close them.
++  */
++  while ((depth > 0) && ((offset+1) < (ssize_t) extent)) {
++    title[offset++]=')';
++    depth--;
++  }
++  title[offset]='\0';
++  /*
++    Ensure non-empty result.
++  */
++  if (offset == 0)
++    {
++      (void) CopyMagickString(title,"Untitled",extent-1);
++      title[extent-1]='\0';
++    }
++}
++
+ static MagickBooleanType WritePS2Image(const ImageInfo *image_info,Image *image,
+   ExceptionInfo *exception)
+ {
+@@ -547,6 +623,9 @@ static MagickBooleanType WritePS2Image(const ImageInfo *image_info,Image *image,
+       text_size=(size_t) (MultilineCensus(value)*pointsize+12);
+     if (page == 1)
+       {
++        char
++          title[MagickPathExtent];
++
+         /*
+           Output Postscript header.
+         */
+@@ -557,8 +636,9 @@ static MagickBooleanType WritePS2Image(const ImageInfo *image_info,Image *image,
+             MagickPathExtent);
+         (void) WriteBlobString(image,buffer);
+         (void) WriteBlobString(image,"%%Creator: (ImageMagick)\n");
++        FilenameToTitle(image->filename,title,MagickPathExtent);
+         (void) FormatLocaleString(buffer,MagickPathExtent,"%%%%Title: (%s)\n",
+-          image->filename);
++          title);
+         (void) WriteBlobString(image,buffer);
+         timer=GetMagickTime();
+         (void) FormatMagickTime(timer,sizeof(date),date);
+diff --git a/coders/ps3.c b/coders/ps3.c
+index d3e870c..b135b46 100644
+--- a/coders/ps3.c
++++ b/coders/ps3.c
+@@ -203,6 +203,82 @@ ModuleExport void UnregisterPS3Image(void)
+ %
+ */
+ 
++static inline void FilenameToTitle(const char *filename,char *title,
++  const size_t extent)
++{
++  int
++    depth = 0;
++
++  ssize_t
++    i,
++    offset = 0;
++
++  if (extent == 0)
++    return;
++  for (i=0; (filename[i] != '\0') && ((offset+1) < (ssize_t) extent); i++)
++  {
++    unsigned char
++      c = filename[i];
++
++    /*
++      Only allow printable ASCII.
++    */
++    if ((c < 32) || (c > 126))
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Percent signs break DSC parsing.
++    */
++    if (c == '%')
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Parentheses must remain balanced.
++    */
++    if (c == '(')
++      {
++        depth++;
++        title[offset++] = '(';
++        continue;
++      }
++    if (c == ')')
++      {
++        if (depth <= 0)
++          title[offset++]='_';
++        else
++          {
++            depth--;
++            title[offset++]=')';
++          }
++         continue;
++     }
++    /*
++      Everything else is allowed.
++    */
++    title[offset++]=c;
++  }
++  /*
++    If parentheses remain unbalanced, close them.
++  */
++  while ((depth > 0) && ((offset+1) < (ssize_t) extent)) {
++    title[offset++]=')';
++    depth--;
++  }
++  title[offset]='\0';
++  /*
++    Ensure non-empty result.
++  */
++  if (offset == 0)
++    {
++      (void) CopyMagickString(title,"Untitled",extent-1);
++      title[extent-1]='\0';
++    }
++}
++
+ static MagickBooleanType Huffman2DEncodeImage(const ImageInfo *image_info,
+   Image *image,Image *inject_image,ExceptionInfo *exception)
+ {
+@@ -1007,6 +1083,9 @@ static MagickBooleanType WritePS3Image(const ImageInfo *image_info,Image *image,
+     is_gray=IdentifyImageCoderGray(image,exception);
+     if (page == 1)
+       {
++        char
++          title[MagickPathExtent];
++
+         /*
+           Postscript header on the first page.
+         */
+@@ -1019,8 +1098,9 @@ static MagickBooleanType WritePS3Image(const ImageInfo *image_info,Image *image,
+         (void) FormatLocaleString(buffer,MagickPathExtent,
+           "%%%%Creator: ImageMagick %s\n",MagickLibVersionText);
+         (void) WriteBlobString(image,buffer);
++        FilenameToTitle(image->filename,title,MagickPathExtent);
+         (void) FormatLocaleString(buffer,MagickPathExtent,"%%%%Title: %s\n",
+-          image->filename);
++          title);
+         (void) WriteBlobString(image,buffer);
+         timer=GetMagickTime();
+         (void) FormatMagickTime(timer,sizeof(date),date);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2.patch
new file mode 100644
index 0000000000..a1872b7ee9
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2.patch
@@ -0,0 +1,143 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 20 Feb 2026 14:08:15 +0100
+Subject: Properly escape the strings that are written as raw html
+ (GHSA-rw6c-xp26-225v)
+
+(cherry picked from commit 81129f79ad622ff4c1d729828a34ab0f49ec89f6)
+
+CVE: CVE-2026-25797
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/81129f79ad622ff4c1d729828a34ab0f49ec89f6]
+
+origin:  https://github.com/ImageMagick/ImageMagick/commit/81129f79ad622ff4c1d729828a34ab0f49ec89f6
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-rw6c-xp26-225v
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/html.c | 65 +++++++++++++++++++++++++++++++++++------------------------
+ 1 file changed, 39 insertions(+), 26 deletions(-)
+
+diff --git a/coders/html.c b/coders/html.c
+index 739cb12..1e171cb 100644
+--- a/coders/html.c
++++ b/coders/html.c
+@@ -204,6 +204,21 @@ ModuleExport void UnregisterHTMLImage(void)
+ %
+ */
+ 
++static void WriteHtmlEncodedString(Image *image,const char* value)
++{
++  char
++    *encoded_value;
++
++  encoded_value=AcquireString(value);
++  (void) SubstituteString(&encoded_value,"<","&lt;");
++  (void) SubstituteString(&encoded_value,">","&gt;");
++  (void) SubstituteString(&encoded_value,"&","&amp;");
++  (void) SubstituteString(&encoded_value,"\"","&quot;");
++  (void) SubstituteString(&encoded_value,"'","&apos;");
++  WriteBlobString(image,encoded_value);
++  encoded_value=DestroyString(encoded_value);
++}
++
+ static ssize_t WriteURLComponent(Image *image,const int c)
+ {
+   char
+@@ -318,29 +333,29 @@ static MagickBooleanType WriteHTMLImage(const ImageInfo *image_info,
+         "\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");
+       (void) WriteBlobString(image,"<html>\n");
+       (void) WriteBlobString(image,"<head>\n");
++      (void) WriteBlobString(image,"<title>");
+       value=GetImageProperty(image,"label",exception);
+       if (value != (const char *) NULL)
+-        (void) FormatLocaleString(buffer,MagickPathExtent,"<title>%s</title>\n",
+-          value);
++        WriteHtmlEncodedString(image,value);
+       else
+         {
+           GetPathComponent(filename,BasePath,basename);
+-          (void) FormatLocaleString(buffer,MagickPathExtent,
+-            "<title>%s</title>\n",basename);
++          WriteHtmlEncodedString(image,basename);
+         }
+-      (void) WriteBlobString(image,buffer);
++      (void) WriteBlobString(image,"</title>\n");
+       (void) WriteBlobString(image,"</head>\n");
+       (void) WriteBlobString(image,"<body style=\"text-align: center;\">\n");
+-      (void) FormatLocaleString(buffer,MagickPathExtent,"<h1>%s</h1>\n",
+-        image->filename);
+-      (void) WriteBlobString(image,buffer);
++      (void) WriteBlobString(image,"<h1>");
++      WriteHtmlEncodedString(image,image->filename);
++      (void) WriteBlobString(image,"</h1>");
+       (void) WriteBlobString(image,"<div>\n");
+       (void) CopyMagickString(filename,image->filename,MagickPathExtent);
+       AppendImageFormat("png",filename);
+-      (void) FormatLocaleString(buffer,MagickPathExtent,"<img usemap=\"#%s\" "
+-        "src=\"%s\" style=\"border: 0;\" alt=\"Image map\" />\n",mapname,
+-        filename);
+-      (void) WriteBlobString(image,buffer);
++      (void) WriteBlobString(image,"<img usemap=\"#");
++      WriteHtmlEncodedString(image,mapname);
++      (void) WriteBlobString(image,"\" src=\"");
++      WriteHtmlEncodedString(image,filename);
++      (void) WriteBlobString(image,"\" style=\"border: 0;\" alt=\"Image map\" />\n");
+       /*
+         Determine the size and location of each image tile.
+       */
+@@ -350,18 +365,18 @@ static MagickBooleanType WriteHTMLImage(const ImageInfo *image_info,
+       /*
+         Write an image map.
+       */
+-      (void) FormatLocaleString(buffer,MagickPathExtent,
+-        "<map id=\"%s\" name=\"%s\">\n",mapname,mapname);
+-      (void) WriteBlobString(image,buffer);
+-      (void) FormatLocaleString(buffer,MagickPathExtent,"  <area href=\"%s",
+-        url);
+-      (void) WriteBlobString(image,buffer);
++      (void) WriteBlobString(image,"<map id=\"");
++      WriteHtmlEncodedString(image,mapname);
++      (void) WriteBlobString(image,"\" name=\"");
++      WriteHtmlEncodedString(image,mapname);
++      (void) WriteBlobString(image,"\">\n<area href=\"");
++      WriteHtmlEncodedString(image,url);
+       if (image->directory == (char *) NULL)
+         {
++          WriteHtmlEncodedString(image,image->filename);
+           (void) FormatLocaleString(buffer,MagickPathExtent,
+-            "%s\" shape=\"rect\" coords=\"0,0,%.20g,%.20g\" alt=\"\" />\n",
+-            image->filename,(double) geometry.width-1,(double) geometry.height-
+-            1);
++            "\" shape=\"rect\" coords=\"0,0,%.20g,%.20g\" alt=\"\" />\n",
++            (double) geometry.width-1,(double) geometry.height-1);
+           (void) WriteBlobString(image,buffer);
+         }
+       else
+@@ -378,9 +393,9 @@ static MagickBooleanType WriteHTMLImage(const ImageInfo *image_info,
+               (void) WriteBlobString(image,buffer);
+               if (*(p+1) != '\0')
+                 {
+-                  (void) FormatLocaleString(buffer,MagickPathExtent,
+-                    "  <area href=%s\"",url);
+-                  (void) WriteBlobString(image,buffer);
++                  (void) WriteBlobString(image,"  <area href=\"");
++                  WriteHtmlEncodedString(image,url);
++                  (void) WriteBlobString(image,"\"");
+                 }
+               geometry.x+=(ssize_t) geometry.width;
+               if ((geometry.x+4) >= (ssize_t) image->columns)
+@@ -390,7 +405,6 @@ static MagickBooleanType WriteHTMLImage(const ImageInfo *image_info,
+                 }
+             }
+       (void) WriteBlobString(image,"</map>\n");
+-      (void) CopyMagickString(filename,image->filename,MagickPathExtent);
+       (void) WriteBlobString(image,"</div>\n");
+       (void) WriteBlobString(image,"</body>\n");
+       (void) WriteBlobString(image,"</html>\n");
+@@ -398,7 +412,6 @@ static MagickBooleanType WriteHTMLImage(const ImageInfo *image_info,
+       /*
+         Write the image as PNG.
+       */
+-      (void) CopyMagickString(image->filename,filename,MagickPathExtent);
+       AppendImageFormat("png",image->filename);
+       next=GetNextImageInList(image);
+       image->next=NewImageList();
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch
new file mode 100644
index 0000000000..18758b625b
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch
@@ -0,0 +1,109 @@
+From: Cristy <urban-warrior@imagemagick.org>
+From: Naman Jain <namanj1@kpit.com>
+Date: Sun, 1 Feb 2026 14:56:14 -0500
+Subject: [PATCH] CVE-2026-25798
+https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p863-5fgm-rgq4
+
+a NULL pointer dereference in ClonePixelCacheRepository allows a remote attacker to crash any application linked against ImageMagick by supplying a crafted image file, resulting in denial of service.
+
+(cherry picked from commit 16dd3158ce197c6f65e7798a7a5cc4538bb0303e)
+
+CVE: CVE-2026-25798
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/16dd3158ce197c6f65e7798a7a5cc4538bb0303e]
+
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p863-5fgm-rgq4
+origin: https://github.com/ImageMagick/ImageMagick/commit/16dd3158ce197c6f65e7798a7a5cc4538bb0303e
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ MagickCore/cache.c | 37 +++++++++++++++++++++++++++++++++----
+ coders/sixel.c     |  4 ++--
+ 2 files changed, 35 insertions(+), 6 deletions(-)
+
+diff --git a/MagickCore/cache.c b/MagickCore/cache.c
+index 8df6945..5a36189 100644
+--- a/MagickCore/cache.c
++++ b/MagickCore/cache.c
+@@ -3500,6 +3500,25 @@ static MagickBooleanType MaskPixelCacheNexus(Image *image,NexusInfo *nexus_info,
+ %
+ */
+ 
++static inline MagickBooleanType CacheOverflowSanityCheckGetSize(
++  const MagickSizeType count,const size_t quantum,MagickSizeType *const extent)
++{
++  MagickSizeType
++    length;
++
++  if ((count == 0) || (quantum == 0))
++    return(MagickTrue);
++  length=count*quantum;
++  if (quantum != (length/count))
++    {
++      errno=ENOMEM;
++      return(MagickTrue);
++    }
++  if (extent != NULL)
++    *extent=length;
++  return(MagickFalse);
++}
++
+ static MagickBooleanType OpenPixelCacheOnDisk(CacheInfo *cache_info,
+   const MapMode mode)
+ {
+@@ -3650,7 +3669,7 @@ static MagickBooleanType OpenPixelCache(Image *image,const MapMode mode,
+     status;
+ 
+   MagickSizeType
+-    length,
++    length = 0,
+     number_pixels;
+ 
+   size_t
+@@ -3723,12 +3742,22 @@ static MagickBooleanType OpenPixelCache(Image *image,const MapMode mode,
+   packet_size=MagickMax(cache_info->number_channels,1)*sizeof(Quantum);
+   if (image->metacontent_extent != 0)
+     packet_size+=cache_info->metacontent_extent;
+-  length=number_pixels*packet_size;
++  if (CacheOverflowSanityCheckGetSize(number_pixels,packet_size,&length) != MagickFalse)
++    {
++      cache_info->storage_class=UndefinedClass;
++      cache_info->length=0;
++      ThrowBinaryException(ResourceLimitError,"PixelCacheAllocationFailed",
++      image->filename);
++    }
+   columns=(size_t) (length/cache_info->rows/packet_size);
+   if ((cache_info->columns != columns) || ((ssize_t) cache_info->columns < 0) ||
+       ((ssize_t) cache_info->rows < 0))
+-    ThrowBinaryException(ResourceLimitError,"PixelCacheAllocationFailed",
+-      image->filename);
++    {
++      cache_info->storage_class=UndefinedClass;
++      cache_info->length=0;
++      ThrowBinaryException(ResourceLimitError,"PixelCacheAllocationFailed",
++        image->filename);
++    }
+   cache_info->length=length;
+   if (image->ping != MagickFalse)
+     {
+diff --git a/coders/sixel.c b/coders/sixel.c
+index 08ca474..11d857d 100644
+--- a/coders/sixel.c
++++ b/coders/sixel.c
+@@ -544,7 +544,7 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+                       if (max_x < position_x)
+                           max_x = position_x;
+                       if (max_y < (position_y + i))
+-                          max_y = position_y + i;
++                          max_y = (int) (position_y + i);
+                     }
+                   sixel_vertical_mask <<= 1;
+                 }
+@@ -577,7 +577,7 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+                       if (max_x < (position_x+repeat_count-1))
+                         max_x = position_x+repeat_count-1;
+                       if (max_y < (position_y+i+n-1))
+-                        max_y = position_y+i+n-1;
++                        max_y = (int) (position_y+i+n-1);
+                       i+=(n-1);
+                       sixel_vertical_mask <<= (n-1);
+                     }
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.patch
new file mode 100644
index 0000000000..8dc511d2a4
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.patch
@@ -0,0 +1,42 @@
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 31 Jan 2026 12:56:17 -0500
+Subject: [PATCH] CVE-2026-25798
+https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-543g-8grm-9cw6
+
+a logic error in YUV sampling factor validation allows an invalid sampling factor to bypass checks and trigger a division-by-zero during image loading, resulting in a reliable denial-of-service.
+
+(cherry picked from commit 412f3c8bc1d3b6890aad72376cd992c9b5177037)
+
+CVE: CVE-2026-25799
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/412f3c8bc1d3b6890aad72376cd992c9b5177037]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/412f3c8bc1d3b6890aad72376cd992c9b5177037
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-543g-8grm-9cw6
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/yuv.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/coders/yuv.c b/coders/yuv.c
+index a1d5bf1..1817c43 100644
+--- a/coders/yuv.c
++++ b/coders/yuv.c
+@@ -165,7 +165,7 @@ static Image *ReadYUVImage(const ImageInfo *image_info,ExceptionInfo *exception)
+       vertical_factor=horizontal_factor;
+       if ((flags & SigmaValue) != 0)
+         vertical_factor=(ssize_t) geometry_info.sigma;
+-      if ((horizontal_factor != 1) && (horizontal_factor != 2) &&
++      if ((horizontal_factor != 1) && (horizontal_factor != 2) ||
+           (vertical_factor != 1) && (vertical_factor != 2))
+         ThrowReaderException(CorruptImageError,"UnexpectedSamplingFactor");
+     }
+@@ -670,7 +670,7 @@ static MagickBooleanType WriteYUVImage(const ImageInfo *image_info,Image *image,
+       vertical_factor=horizontal_factor;
+       if ((flags & SigmaValue) != 0)
+         vertical_factor=(ssize_t) geometry_info.sigma;
+-      if ((horizontal_factor != 1) && (horizontal_factor != 2) &&
++      if ((horizontal_factor != 1) && (horizontal_factor != 2) ||
+           (vertical_factor != 1) && (vertical_factor != 2))
+         ThrowWriterException(CorruptImageError,"UnexpectedSamplingFactor");
+     }
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.patch
new file mode 100644
index 0000000000..f1db20a6ad
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.patch
@@ -0,0 +1,34 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 6 Feb 2026 22:21:19 +0100
+Subject: Added extra check to prevent out of bounds heap write on 32-bit
+ systems (GHSA-6j5f-24fw-pqp4)
+
+(cherry picked from commit 23fde73188ea32c15b607571775d4f92bdb75e60)
+
+CVE: CVE-2026-25897
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/23fde73188ea32c15b607571775d4f92bdb75e60]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/23fde73188ea32c15b607571775d4f92bdb75e60
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-6j5f-24fw-pqp4
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/sun.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/coders/sun.c b/coders/sun.c
+index f1452c5..76d7607 100644
+--- a/coders/sun.c
++++ b/coders/sun.c
+@@ -470,6 +470,11 @@ static Image *ReadSUNImage(const ImageInfo *image_info,ExceptionInfo *exception)
+         sun_data=(unsigned char *) RelinquishMagickMemory(sun_data);
+         ThrowReaderException(ResourceLimitError,"ImproperImageHeader");
+       }
++    if (image->rows > (MAGICK_SIZE_MAX - pixels_length))
++      {
++        sun_data=(unsigned char *) RelinquishMagickMemory(sun_data);
++        ThrowReaderException(ResourceLimitError,"ImproperImageHeader");
++      }
+     sun_pixels=(unsigned char *) AcquireQuantumMemory(pixels_length+image->rows,
+       sizeof(*sun_pixels));
+     if (sun_pixels == (unsigned char *) NULL)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1.patch
new file mode 100644
index 0000000000..8e68732131
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1.patch
@@ -0,0 +1,39 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 6 Feb 2026 20:55:43 +0100
+Subject: Fixed out of bound read with negative pixel index
+ (GHSA-vpxv-r9pg-7gpr)
+
+(cherry picked from commit c9c87dbaba56bf82aebd3392e11f0ffd93709b12)
+
+CVE: CVE-2026-25898
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/c9c87dbaba56bf82aebd3392e11f0ffd93709b12]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/c9c87dbaba56bf82aebd3392e11f0ffd93709b12
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vpxv-r9pg-7gpr
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/uil.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/coders/uil.c b/coders/uil.c
+index 74c45c7..ffcab49 100644
+--- a/coders/uil.c
++++ b/coders/uil.c
+@@ -352,11 +352,14 @@ static MagickBooleanType WriteUILImage(const ImageInfo *image_info,Image *image,
+     for (x=0; x < (ssize_t) image->columns; x++)
+     {
+       k=((ssize_t) GetPixelIndex(image,p) % MaxCixels);
++      if (k < 0)
++        k=0;
+       symbol[0]=Cixel[k];
+       for (j=1; j < (int) characters_per_pixel; j++)
+       {
+-        k=(((int) GetPixelIndex(image,p)-k)/MaxCixels) %
+-          MaxCixels;
++        k=(((int) GetPixelIndex(image,p)-k)/MaxCixels) % MaxCixels;
++        if (k < 0)
++          k=0;
+         symbol[j]=Cixel[k];
+       }
+       symbol[j]='\0';
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2.patch
new file mode 100644
index 0000000000..563d5612b0
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2.patch
@@ -0,0 +1,37 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sun, 8 Feb 2026 14:15:46 +0100
+Subject: Fixed out of bound read with negative pixel index
+ (GHSA-vpxv-r9pg-7gpr)
+
+(cherry picked from commit 21525d8f27b86e8063fe359616086fd6b71eb05b)
+
+CVE: CVE-2026-25898
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/21525d8f27b86e8063fe359616086fd6b71eb05b]
+
+origin:  https://github.com/ImageMagick/ImageMagick/commit/21525d8f27b86e8063fe359616086fd6b71eb05b
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vpxv-r9pg-7gpr
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/xpm.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/coders/xpm.c b/coders/xpm.c
+index 1dda89f..4a77b48 100644
+--- a/coders/xpm.c
++++ b/coders/xpm.c
+@@ -1131,10 +1131,14 @@ static MagickBooleanType WriteXPMImage(const ImageInfo *image_info,Image *image,
+     for (x=0; x < (ssize_t) image->columns; x++)
+     {
+       k=((ssize_t) GetPixelIndex(image,p) % MaxCixels);
++      if (k < 0)
++        k=0;
+       symbol[0]=Cixel[k];
+       for (j=1; j < (ssize_t) characters_per_pixel; j++)
+       {
+         k=(((int) GetPixelIndex(image,p)-k)/MaxCixels) % MaxCixels;
++        if (k < 0)
++          k=0;
+         symbol[j]=Cixel[k];
+       }
+       symbol[j]='\0';
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.patch
new file mode 100644
index 0000000000..d57b62e83a
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.patch
@@ -0,0 +1,322 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Tue, 3 Feb 2026 21:09:59 +0100
+Subject: Prevent path traversal of paths that are blocked in the security
+ policy (GHSA-8jvj-p28h-9gm7)
+
+(cherry picked from commit 4a9dc1075dcad3ab0579e1b37dbe854c882699a5)
+
+CVE: CVE-2026-25965
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/4a9dc1075dcad3ab0579e1b37dbe854c882699a5]
+
+origin: backport, https://github.com/ImageMagick/ImageMagick/commit/4a9dc1075dcad3ab0579e1b37dbe854c882699a5
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-8jvj-p28h-9gm7
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ MagickCore/module.c          |  11 +++--
+ MagickCore/policy.c          |  39 ++++++++++-----
+ MagickCore/token.c           |   2 +
+ MagickCore/utility-private.h | 115 +++++++++++++++++++++++++++++++++++++++++++
+ MagickCore/utility.c         |  28 +++++++----
+ 5 files changed, 169 insertions(+), 26 deletions(-)
+
+diff --git a/MagickCore/module.c b/MagickCore/module.c
+index e36214d..5332a71 100644
+--- a/MagickCore/module.c
++++ b/MagickCore/module.c
+@@ -584,15 +584,16 @@ static MagickBooleanType GetMagickModulePath(const char *filename,
+           (void) ConcatenateMagickString(path,DirectorySeparator,
+             MagickPathExtent);
+         (void) ConcatenateMagickString(path,filename,MagickPathExtent);
+-#if defined(MAGICKCORE_HAVE_REALPATH)
+         {
+           char
+-            resolved_path[PATH_MAX+1];
++            *real_path = realpath_utf8(path);
+ 
+-          if (realpath(path,resolved_path) != (char *) NULL)
+-            (void) CopyMagickString(path,resolved_path,MagickPathExtent);
++          if (real_path != (char *) NULL)
++            {
++              (void) CopyMagickString(path,real_path,MagickPathExtent);
++              real_path=DestroyString(real_path);
++            }
+         }
+-#endif
+         if (IsPathAccessible(path) != MagickFalse)
+           {
+             module_path=DestroyString(module_path);
+diff --git a/MagickCore/policy.c b/MagickCore/policy.c
+index 8cfcee0..0e036c0 100644
+--- a/MagickCore/policy.c
++++ b/MagickCore/policy.c
+@@ -640,6 +640,9 @@ static MagickBooleanType IsPolicyCacheInstantiated(ExceptionInfo *exception)
+ MagickExport MagickBooleanType IsRightsAuthorized(const PolicyDomain domain,
+   const PolicyRights rights,const char *pattern)
+ {
++  char
++    *real_pattern = (char *) NULL;
++
+   const PolicyInfo
+     *policy_info;
+ 
+@@ -647,7 +650,8 @@ MagickExport MagickBooleanType IsRightsAuthorized(const PolicyDomain domain,
+     *exception;
+ 
+   MagickBooleanType
+-    authorized;
++    authorized,
++    match;
+ 
+   ElementInfo
+     *p;
+@@ -671,22 +675,33 @@ MagickExport MagickBooleanType IsRightsAuthorized(const PolicyDomain domain,
+       *policy;
+ 
+     policy=(const PolicyInfo *) p->value;
+-    if ((policy->domain == domain) &&
+-        (GlobExpression(pattern,policy->pattern,MagickFalse) != MagickFalse))
++    if (policy->domain == domain)
+       {
+-        if ((rights & ReadPolicyRights) != 0)
+-          authorized=(policy->rights & ReadPolicyRights) != 0 ? MagickTrue :
+-            MagickFalse;
+-        if ((rights & WritePolicyRights) != 0)
+-          authorized=(policy->rights & WritePolicyRights) != 0 ? MagickTrue :
+-            MagickFalse;
+-        if ((rights & ExecutePolicyRights) != 0)
+-          authorized=(policy->rights & ExecutePolicyRights) != 0 ? MagickTrue :
+-            MagickFalse;
++        if ((policy->domain == PathPolicyDomain) &&
++            (real_pattern == (const char *) NULL))
++          real_pattern=realpath_utf8(pattern);
++        if (real_pattern != (char*) NULL)
++          match=GlobExpression(real_pattern,policy->pattern,MagickFalse);
++        else
++          match=GlobExpression(pattern,policy->pattern,MagickFalse);
++        if (match != MagickFalse)
++          {
++            if ((rights & ReadPolicyRights) != 0)
++              authorized=(policy->rights & ReadPolicyRights) != 0 ? MagickTrue :
++                MagickFalse;
++            if ((rights & WritePolicyRights) != 0)
++              authorized=(policy->rights & WritePolicyRights) != 0 ?
++                MagickTrue : MagickFalse;
++            if ((rights & ExecutePolicyRights) != 0)
++              authorized=(policy->rights & ExecutePolicyRights) != 0 ?
++                MagickTrue : MagickFalse;
++          }
+       }
+     p=p->next;
+   }
+   UnlockSemaphoreInfo(policy_semaphore);
++  if (real_pattern != (char *) NULL)
++    real_pattern=DestroyString(real_pattern);
+   return(authorized);
+ }
+ 
+diff --git a/MagickCore/token.c b/MagickCore/token.c
+index 9763069..70085b4 100644
+--- a/MagickCore/token.c
++++ b/MagickCore/token.c
+@@ -518,6 +518,7 @@ MagickExport MagickBooleanType GlobExpression(
+         target=DestroyString(target);
+         break;
+       }
++#if !defined(MAGICKCORE_WINDOWS_SUPPORT) || defined(__CYGWIN__)
+       case '\\':
+       {
+         pattern+=GetUTFOctets(pattern);
+@@ -525,6 +526,7 @@ MagickExport MagickBooleanType GlobExpression(
+           break;
+         magick_fallthrough;
+       }
++#endif
+       default:
+       {
+         if (case_insensitive != MagickFalse)
+diff --git a/MagickCore/utility-private.h b/MagickCore/utility-private.h
+index b3d951c..c28d4c5 100644
+--- a/MagickCore/utility-private.h
++++ b/MagickCore/utility-private.h
+@@ -252,6 +252,121 @@ static inline FILE *popen_utf8(const char *command,const char *type)
+ #endif
+ }
+ 
++static inline char *realpath_utf8(const char *path)
++{
++#if !defined(MAGICKCORE_WINDOWS_SUPPORT) || defined(__CYGWIN__)
++#if defined(MAGICKCORE_HAVE_REALPATH)
++  return(realpath(path,(char *) NULL));
++#else
++  return(AcquireString(path));
++#endif
++#else
++  char
++    *real_path;
++
++  DWORD
++    final_path_length,
++    full_path_length;
++
++  HANDLE
++    file_handle;
++
++  int
++    length,
++    utf8_length;
++
++  wchar_t
++    *clean_path,
++    *full_path,
++    *wide_path;
++
++  /*
++    Convert UTF-8 to UTF-16.
++  */
++  if (path == (const char *) NULL)
++    return((char *) NULL);
++  length=MultiByteToWideChar(CP_UTF8,0,path,-1,NULL,0);
++  if (length <= 0)
++    return((char *) NULL);
++  wide_path=(wchar_t *) AcquireQuantumMemory(length,sizeof(wchar_t));
++  if (wide_path == (wchar_t *) NULL)
++    return((char *) NULL);
++  MultiByteToWideChar(CP_UTF8,0,path,-1,wide_path,length);
++  /*
++    Normalize syntactically.
++  */
++  full_path_length=GetFullPathNameW(wide_path,0,NULL,NULL);
++  if (full_path_length == 0)
++    {
++      wide_path=(wchar_t *) RelinquishMagickMemory(wide_path);
++      return((char *) NULL);
++    }
++  full_path=(wchar_t *) AcquireQuantumMemory(full_path_length,sizeof(wchar_t));
++  if (full_path == (wchar_t *) NULL)
++    {
++      wide_path=(wchar_t *) RelinquishMagickMemory(wide_path);
++      return((char *) NULL);
++    }
++  GetFullPathNameW(wide_path,full_path_length,full_path,NULL);
++  wide_path=(wchar_t *) RelinquishMagickMemory(wide_path);
++  /*
++    Open the file/directory to resolve symlinks.
++  */
++  file_handle=CreateFileW(full_path,GENERIC_READ,FILE_SHARE_READ |
++    FILE_SHARE_WRITE | FILE_SHARE_DELETE,NULL,OPEN_EXISTING,
++    FILE_FLAG_BACKUP_SEMANTICS,NULL);
++  if (file_handle != INVALID_HANDLE_VALUE)
++    {
++      /*
++        Resolve final canonical path.
++      */
++      final_path_length=GetFinalPathNameByHandleW(file_handle,NULL,0,
++        FILE_NAME_NORMALIZED);
++      if (final_path_length == 0)
++        {
++          CloseHandle(file_handle);
++          full_path=(wchar_t *) RelinquishMagickMemory(full_path);
++          return((char *) NULL);
++        }
++      full_path=(wchar_t *) RelinquishMagickMemory(full_path);
++      full_path=(wchar_t *) AcquireQuantumMemory(final_path_length,
++        sizeof(wchar_t));
++      if (full_path == (wchar_t *) NULL)
++        {
++          CloseHandle(file_handle);
++          return((char *) NULL);
++        }
++      GetFinalPathNameByHandleW(file_handle,full_path,final_path_length,
++        FILE_NAME_NORMALIZED);
++      CloseHandle(file_handle);
++    }
++  /*
++    Remove \\?\ prefix for POSIX-like behavior.
++  */
++  clean_path=full_path;
++  if (wcsncmp(full_path,L"\\\\?\\",4) == 0)
++    clean_path=full_path+4;
++  /*
++    Convert UTF-16 to UTF-8.
++  */
++  utf8_length=WideCharToMultiByte(CP_UTF8,0,clean_path,-1,NULL,0,NULL,NULL);
++  if (utf8_length <= 0)
++    {
++      full_path=(wchar_t *) RelinquishMagickMemory(full_path);
++      return NULL;
++    }
++  real_path=(char *) AcquireQuantumMemory(utf8_length,sizeof(char));
++  if (real_path == (char *) NULL)
++    {
++      full_path=(wchar_t *) RelinquishMagickMemory(full_path);
++      return NULL;
++    }
++  WideCharToMultiByte(CP_UTF8,0,clean_path,-1,real_path,utf8_length,NULL,NULL);
++  full_path=(wchar_t *) RelinquishMagickMemory(full_path);
++  return(real_path);
++#endif
++}
++
+ static inline int remove_utf8(const char *path)
+ {
+ #if !defined(MAGICKCORE_WINDOWS_SUPPORT) || defined(__CYGWIN__)
+diff --git a/MagickCore/utility.c b/MagickCore/utility.c
+index bbeef37..4fd6e9c 100644
+--- a/MagickCore/utility.c
++++ b/MagickCore/utility.c
+@@ -1042,16 +1042,23 @@ MagickPrivate MagickBooleanType GetExecutionPath(char *path,const size_t extent)
+ #if defined(MAGICKCORE_HAVE__NSGETEXECUTABLEPATH)
+   {
+     char
+-      executable_path[PATH_MAX << 1],
+-      execution_path[PATH_MAX+1];
++      executable_path[PATH_MAX << 1];
+ 
+     uint32_t
+       length;
+ 
+     length=sizeof(executable_path);
+-    if ((_NSGetExecutablePath(executable_path,&length) == 0) &&
+-        (realpath(executable_path,execution_path) != (char *) NULL))
+-      (void) CopyMagickString(path,execution_path,extent);
++    if (_NSGetExecutablePath(executable_path,&length) == 0)
++      {
++        char
++          *real_path = realpath_utf8(executable_path);
++
++        if (real_path != (char *) NULL)
++          {
++            (void) CopyMagickString(path,real_path,extent);
++            real_path=DestroyString(real_path);
++          }
++      }
+   }
+ #endif
+ #if defined(MAGICKCORE_HAVE_GETEXECNAME)
+@@ -1097,10 +1104,13 @@ MagickPrivate MagickBooleanType GetExecutionPath(char *path,const size_t extent)
+     if (count != -1)
+       {
+         char
+-          execution_path[PATH_MAX+1];
++          *real_path = realpath_utf8(program_name);
+ 
+-        if (realpath(program_name,execution_path) != (char *) NULL)
+-          (void) CopyMagickString(path,execution_path,extent);
++        if (real_path != (char *) NULL)
++          {
++            (void) CopyMagickString(path,real_path,extent);
++            real_path=DestroyString(real_path);
++          }
+       }
+     if (program_name != program_invocation_name)
+       program_name=(char *) RelinquishMagickMemory(program_name);
+@@ -1882,7 +1892,7 @@ MagickPrivate MagickBooleanType ShredFile(const char *path)
+     {
+       char
+         *property;
+-          
++
+       passes=0;
+       property=GetEnvironmentValue("MAGICK_SHRED_PASSES");
+       if (property != (char *) NULL)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.patch
new file mode 100644
index 0000000000..324443e5f0
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.patch
@@ -0,0 +1,56 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Tue, 3 Feb 2026 20:00:28 +0100
+Subject: Block reading from fd: in our more secure policies by default
+ (GHSA-xwc6-v6g8-pw2h)
+
+(cherry picked from commit 8d4c67a90ae458fb36393a05c0069e9123ac174c)
+
+CVE: CVE-2026-25966
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/8d4c67a90ae458fb36393a05c0069e9123ac174c]
+
+origin: backport, https://github.com/ImageMagick/ImageMagick/commit/8d4c67a90ae458fb36393a05c0069e9123ac174c
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xwc6-v6g8-pw2h
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ config/policy-secure.xml  | 1 +
+ config/policy-websafe.xml | 1 +
+ www/security-policy.html  | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/config/policy-secure.xml b/config/policy-secure.xml
+index 0d312d2..4239822 100644
+--- a/config/policy-secure.xml
++++ b/config/policy-secure.xml
+@@ -88,6 +88,7 @@
+   <policy domain="filter" rights="none" pattern="*"/>
+   <!-- Don't read/write from/to stdin/stdout. -->
+   <policy domain="path" rights="none" pattern="-"/>
++  <policy domain="path" rights="none" pattern="fd:*"/>
+   <!-- don't read sensitive paths. -->
+   <policy domain="path" rights="none" pattern="/etc/*"/>
+   <!-- Indirect reads are not permitted. -->
+diff --git a/config/policy-websafe.xml b/config/policy-websafe.xml
+index 05327e3..544bf74 100644
+--- a/config/policy-websafe.xml
++++ b/config/policy-websafe.xml
+@@ -84,6 +84,7 @@
+   <policy domain="filter" rights="none" pattern="*"/>
+   <!-- Don't read/write from/to stdin/stdout. -->
+   <policy domain="path" rights="none" pattern="-"/>
++  <policy domain="path" rights="none" pattern="fd:*"/>
+   <!-- don't read sensitive paths. -->
+   <policy domain="path" rights="none" pattern="/etc/*"/>
+   <!-- Indirect reads are not permitted. -->
+diff --git a/www/security-policy.html b/www/security-policy.html
+index af8c206..b254962 100644
+--- a/www/security-policy.html
++++ b/www/security-policy.html
+@@ -250,6 +250,7 @@
+   &lt;policy domain="filter" rights="none" pattern="*"/>
+   &lt;!-- Don't read/write from/to stdin/stdout. -->
+   &lt;policy domain="path" rights="none" pattern="-"/>
++  &lt;policy domain="path" rights="none" pattern="fd:*"/>
+   &lt;!-- don't read sensitive paths. -->
+   &lt;policy domain="path" rights="none" pattern="/etc/*"/>
+   &lt;!-- Indirect reads are not permitted. -->
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.patch
new file mode 100644
index 0000000000..d9b7efc9c1
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.patch
@@ -0,0 +1,38 @@
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 31 Jan 2026 12:59:33 -0500
+Subject: [PATCH] CVE-2026-25967
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-72hf-fj62-w6j4
+
+a stack-based buffer overflow exists in the ImageMagick FTXT image reader. A crafted FTXT file can cause out-of-bounds writes on the stack, leading to a crash.
+
+(cherry picked from commit 9afe96cc325da1e4349fbd7418675af2f8708c10)
+
+CVE: CVE-2026-25967
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/9afe96cc325da1e4349fbd7418675af2f8708c10]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/9afe96cc325da1e4349fbd7418675af2f8708c10
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-72hf-fj62-w6j4
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/ftxt.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/coders/ftxt.c b/coders/ftxt.c
+index d665bec..e9bb47f 100644
+--- a/coders/ftxt.c
++++ b/coders/ftxt.c
+@@ -197,11 +197,11 @@ static int ReadInt(Image * image,MagickBooleanType *eofInp,int *chPushed,
+     if (p-buffer >= MaxTextExtent)
+       {
+         *eofInp=MagickTrue;
+-        continue;
++        break;
+       }
+     chIn=ReadChar(image,chPushed);
+   }
+-  if (p==buffer)
++  if (p == buffer)
+     {
+       *eofInp=MagickTrue;
+       return(0);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.patch
new file mode 100644
index 0000000000..bad2ace65d
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.patch
@@ -0,0 +1,39 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Tue, 3 Feb 2026 22:40:04 +0100
+Subject: Patch to resolve possible out of bounds write in the msl decoder
+ (GHSA-3mwp-xqp2-q6ph).
+
+(cherry picked from commit 56f02958890b820cf2d0a6ecb04eb6f58ea75628)
+
+CVE: CVE-2026-25969
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/56f02958890b820cf2d0a6ecb04eb6f58ea75628]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/56f02958890b820cf2d0a6ecb04eb6f58ea75628
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-3mwp-xqp2-q6ph
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/msl.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/coders/msl.c b/coders/msl.c
+index 9facbf2..4af3a71 100644
+--- a/coders/msl.c
++++ b/coders/msl.c
+@@ -5827,11 +5827,12 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+                   Quantum  opac = OpaqueAlpha;
+                   ssize_t len = (ssize_t) strlen( value );
+ 
+-                  if (value[len-1] == '%') {
+-                    char  tmp[100];
++                  if ((len > 0) && (value[len-1] == '%')) {
++                    char *tmp = AcquireString(value);
+                     (void) CopyMagickString(tmp,value,(size_t) len);
+-                    opac = StringToLong( tmp );
+-                    opac = (int)(QuantumRange * ((float)opac/100));
++                    opac = (Quantum) StringToLong( tmp );
++                    tmp=DestroyString(tmp);
++                    opac = (Quantum)(QuantumRange * ((float)opac/100));
+                   } else
+                     opac = StringToLong( value );
+                   (void) SetImageAlpha( msl_info->image[n], (Quantum) opac,
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.patch
new file mode 100644
index 0000000000..4432a5c9d8
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.patch
@@ -0,0 +1,63 @@
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Wed, 28 Jan 2026 20:33:56 -0500
+Subject: [PATCH] CVE-2026-25969
+https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xgm3-v4r9-wfgm
+
+a memory leak exists in `coders/ashlar.c`. The `WriteASHLARImage` allocates a structure. However, when an exception is thrown, the allocated memory is not properly released, resulting in a potential memory leak.
+
+(cherry picked from commit a253d1b124ebdcc2832daac6f9a35c362635b40e)
+
+CVE: CVE-2026-25969
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/a253d1b124ebdcc2832daac6f9a35c362635b40e]
+
+[backport]
+- do not change border parameters, keep old parameter in patch context
+
+origin: backport, https://github.com/ImageMagick/ImageMagick/commit/a253d1b124ebdcc2832daac6f9a35c362635b40e
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xgm3-v4r9-wfgm
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/ashlar.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/coders/ashlar.c b/coders/ashlar.c
+index a44976f..1984215 100644
+--- a/coders/ashlar.c
++++ b/coders/ashlar.c
+@@ -543,7 +543,8 @@ static Image *ASHLARImage(ImageInfo *image_info,Image *image,
+       geometry.height=(size_t) geometry.height/7;
+       geometry.x=(ssize_t) pow((double) geometry.width,0.25);
+       geometry.y=(ssize_t) pow((double) geometry.height,0.25);
+-      image_info->extract=AcquireString("");
++      if (image_info->extract == (char *) NULL)
++        image_info->extract=AcquireString("");
+       if (image_info->extract != (char *) NULL)
+         (void) FormatLocaleString(image_info->extract,MagickPathExtent,
+           "%gx%g%+g%+g",(double) geometry.width,(double) geometry.height,
+@@ -707,7 +708,6 @@ static MagickBooleanType WriteASHLARImage(const ImageInfo *image_info,
+   if (value != (const char *) NULL)
+     tiles_per_page=(size_t) MagickMax(StringToInteger(value),1);
+   ashlar_images=NewImageList();
+-  write_info=CloneImageInfo(image_info);
+   for (i=0; i < (ssize_t) GetImageListLength(image); i+=(ssize_t) tiles_per_page)
+   {
+     char
+@@ -726,7 +726,9 @@ static MagickBooleanType WriteASHLARImage(const ImageInfo *image_info,
+           ashlar_images=DestroyImageList(ashlar_images);
+         break;
+       }
++    write_info=CloneImageInfo(image_info);
+     ashlar_image=ASHLARImage(write_info,clone_images,exception);
++    write_info=DestroyImageInfo(write_info);
+     clone_images=DestroyImageList(clone_images);
+     if (ashlar_image == (Image *) NULL)
+       {
+@@ -741,6 +743,7 @@ static MagickBooleanType WriteASHLARImage(const ImageInfo *image_info,
+   ashlar_images=GetFirstImageInList(ashlar_images);
+   (void) CopyMagickString(ashlar_images->filename,image_info->filename,
+     MagickPathExtent);
++  write_info=CloneImageInfo(image_info);
+   *write_info->magick='\0';
+   (void) SetImageInfo(write_info,(unsigned int)
+     GetImageListLength(ashlar_images),exception);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.patch
new file mode 100644
index 0000000000..0483050a2b
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.patch
@@ -0,0 +1,139 @@
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 1 Feb 2026 13:55:34 -0500
+Subject: 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xg29-8ghv-v4xr
+
+(cherry picked from commit 729253dc16e1a1ec4cac891a12d597e3fa9336b3)
+
+CVE: CVE-2026-25970
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/729253dc16e1a1ec4cac891a12d597e3fa9336b3]
+
+a signed integer overflow vulnerability in ImageMagick's SIXEL decoder allows an attacker to trigger memory corruption and denial of service when processing a maliciously crafted SIXEL image file. The vulnerability occurs during buffer reallocation operations where pointer arithmetic using signed 32-bit integers overflows
+
+origin: backport, https://github.com/ImageMagick/ImageMagick/commit/729253dc16e1a1ec4cac891a12d597e3fa9336b3
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xg29-8ghv-v4xr
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/sixel.c | 39 +++++++++++++++++++++------------------
+ 1 file changed, 21 insertions(+), 18 deletions(-)
+
+diff --git a/coders/sixel.c b/coders/sixel.c
+index aa9ce70..a75ee32 100644
+--- a/coders/sixel.c
++++ b/coders/sixel.c
+@@ -250,7 +250,6 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+     c,
+     color_index,
+     g,
+-    i,
+     n,
+     max_color_index,
+     max_x,
+@@ -261,23 +260,24 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+     r,
+     repeat_count,
+     sixel_palet[SIXEL_PALETTE_MAX],
+-    sixel_vertical_mask,
+-    x,
+-    y;
++    sixel_vertical_mask;
+ 
+   sixel_pixel_t
+     *dmbuf,
+     *imbuf;
+ 
+   size_t
+-    extent,
+-    offset;
++    extent;
+ 
+   ssize_t
+     dmsx,
+     dmsy,
++    i,
+     imsx,
+-    imsy;
++    imsy,
++    offset,
++    x,
++    y;
+ 
+   extent=strlen((char *) p);
+   position_x=position_y=0;
+@@ -294,7 +294,8 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+   imsy=2048;
+   if (SetImageExtent(image,(size_t) imsx,(size_t) imsy,exception) == MagickFalse)
+     return(MagickFalse);
+-  imbuf=(sixel_pixel_t *) AcquireQuantumMemory((size_t) imsx,(size_t) imsy*sizeof(sixel_pixel_t));
++  imbuf=(sixel_pixel_t *) AcquireQuantumMemory((size_t) imsx,
++    (size_t) imsy*sizeof(sixel_pixel_t));
+   if (imbuf == (sixel_pixel_t *) NULL)
+     return(MagickFalse);
+   for (n = 0; n < 16; n++)
+@@ -315,8 +316,8 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+     sixel_palet[n++]=SIXEL_RGB(i*11,i*11,i*11);
+   for (; n < SIXEL_PALETTE_MAX; n++)
+     sixel_palet[n]=SIXEL_RGB(255,255,255);
+-  for (i = 0; i < imsx * imsy; i++)
+-    imbuf[i]=background_color_index;
++  for (i = 0; i < (imsx*imsy); i++)
++    imbuf[i]=(sixel_pixel_t) background_color_index;
+   while (*p != '\0')
+   {
+     if ((p[0] == '\033' && p[1] == 'P') || (*p == 0x90))
+@@ -409,7 +410,7 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+               }
+             (void) memset(dmbuf,background_color_index,(size_t) dmsx*(size_t)
+               dmsy*sizeof(sixel_pixel_t));
+-            for (y = 0; y < imsy; ++y)
++            for (y=0; y < imsy; ++y)
+               (void) memcpy(dmbuf+dmsx*y,imbuf+imsx*y,(size_t) imsx*
+                 sizeof(sixel_pixel_t));
+             imbuf=(sixel_pixel_t *) RelinquishMagickMemory(imbuf);
+@@ -486,7 +487,8 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+       }
+     else if ((*p >= '?') && (*p <= '\177'))
+       {
+-        if ((imsx < (position_x + repeat_count)) || (imsy < (position_y + 6)))
++        if ((imsx < ((ssize_t) position_x+repeat_count)) ||
++            (imsy < ((ssize_t) position_y+6)))
+           {
+             ssize_t
+               nx,
+@@ -495,7 +497,7 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+             nx=imsx*2;
+             ny=imsy*2;
+ 
+-            while ((nx < (position_x + repeat_count)) || (ny < (position_y + 6)))
++            while ((nx < ((ssize_t) position_x+repeat_count)) || (ny < ((ssize_t) position_y+6)))
+             {
+               nx *= 2;
+               ny *= 2;
+@@ -535,9 +537,9 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+                 {
+                   if ((b & sixel_vertical_mask) != 0)
+                     {
+-                      offset=(size_t) (imsx*((ssize_t) position_y+i)+
++                      offset=(ssize_t) (imsx*((ssize_t) position_y+i)+
+                         (ssize_t) position_x);
+-                      if (offset >= (size_t) (imsx*imsy))
++                      if (offset >= (imsx*imsy))
+                         {
+                           imbuf=(sixel_pixel_t *) RelinquishMagickMemory(imbuf);
+                           return(MagickFalse);
+@@ -567,10 +569,11 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+                       }
+                       for (y = position_y + i; y < position_y + i + n; ++y)
+                       {
+-                        offset=(size_t) ((ssize_t) imsx*y+(ssize_t) position_x);
+-                        if ((offset+(size_t) repeat_count) >= (size_t) (imsx*imsy))
++                        offset=(imsx*y+position_x);
++                        if ((offset+repeat_count) >= (imsx*imsy))
+                           {
+-                            imbuf=(sixel_pixel_t *) RelinquishMagickMemory(imbuf);
++                            imbuf=(sixel_pixel_t *)
++                              RelinquishMagickMemory(imbuf);
+                             return(MagickFalse);
+                           }
+                         for (x = 0; x < repeat_count; x++)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970_pre1.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970_pre1.patch
new file mode 100644
index 0000000000..15488934f4
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970_pre1.patch
@@ -0,0 +1,57 @@
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Wed, 28 Jan 2026 19:50:14 -0500
+Subject: 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xg29-8ghv-v4x
+
+This fix int to size_t and is needed for fully fix CVE-2026-25970
+
+CVE: CVE-2026-25970
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/266e59ed8d886a76355c863bd38ff5ac34537673]
+
+origin: backport, https://github.com/ImageMagick/ImageMagick/commit/266e59ed8d886a76355c863bd38ff5ac34537673
+(cherry picked from commit 266e59ed8d886a76355c863bd38ff5ac34537673)
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/sixel.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/coders/sixel.c b/coders/sixel.c
+index 11d857d..aa9ce70 100644
+--- a/coders/sixel.c
++++ b/coders/sixel.c
+@@ -249,12 +249,8 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+     background_color_index,
+     c,
+     color_index,
+-    dmsx,
+-    dmsy,
+     g,
+     i,
+-    imsx,
+-    imsy,
+     n,
+     max_color_index,
+     max_x,
+@@ -277,6 +273,12 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+     extent,
+     offset;
+ 
++  ssize_t
++    dmsx,
++    dmsy,
++    imsx,
++    imsy;
++
+   extent=strlen((char *) p);
+   position_x=position_y=0;
+   max_x=max_y=0;
+@@ -486,7 +488,7 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+       {
+         if ((imsx < (position_x + repeat_count)) || (imsy < (position_y + 6)))
+           {
+-            int
++            ssize_t
+               nx,
+               ny;
+ 
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25982.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25982.patch
new file mode 100644
index 0000000000..cd6074db97
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25982.patch
@@ -0,0 +1,77 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Tue, 3 Feb 2026 21:53:39 +0100
+Subject: Added checks to prevent an out of bounds read (GHSA-pmq6-8289-hx3v)
+
+(cherry picked from commit 4e1f5381d4ccbb6b71927e94c5d257fa883b3af7)
+
+CVE: CVE-2026-25982
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/4e1f5381d4ccbb6b71927e94c5d257fa883b3af7]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/4e1f5381d4ccbb6b71927e94c5d257fa883b3af7
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-pmq6-8289-hx3v
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/dcm.c | 18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/coders/dcm.c b/coders/dcm.c
+index df45d71..fdd3b93 100644
+--- a/coders/dcm.c
++++ b/coders/dcm.c
+@@ -2704,6 +2704,7 @@ typedef struct _DCMInfo
+ 
+   size_t
+     bits_allocated,
++    bits_per_entry,
+     bytes_per_pixel,
+     depth,
+     mask,
+@@ -3158,6 +3159,7 @@ static Image *ReadDCMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   */
+   (void) CopyMagickString(photometric,"MONOCHROME1 ",MagickPathExtent);
+   info.bits_allocated=8;
++  info.bits_per_entry=1;
+   info.bytes_per_pixel=1;
+   info.depth=8;
+   info.mask=0xffff;
+@@ -3695,7 +3697,7 @@ static Image *ReadDCMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                 else
+                   index=(unsigned short) (*p | (*(p+1) << 8));
+                 map.red[i]=(int) index;
+-                p+=(ptrdiff_t) 2;
++                p+=(ptrdiff_t) info.bits_per_entry;
+               }
+               break;
+             }
+@@ -3727,7 +3729,7 @@ static Image *ReadDCMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                 else
+                   index=(unsigned short) (*p | (*(p+1) << 8));
+                 map.green[i]=(int) index;
+-                p+=(ptrdiff_t) 2;
++                p+=(ptrdiff_t) info.bits_per_entry;
+               }
+               break;
+             }
+@@ -3759,10 +3761,20 @@ static Image *ReadDCMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                 else
+                   index=(unsigned short) (*p | (*(p+1) << 8));
+                 map.blue[i]=(int) index;
+-                p+=(ptrdiff_t) 2;
++                p+=(ptrdiff_t) info.bits_per_entry;
+               }
+               break;
+             }
++            case 0x3002:
++            {
++              /*
++                Bytes per entry.
++              */
++              info.bits_per_entry=(size_t) datum;
++              if ((info.bits_per_entry == 0) || (info.bits_per_entry > 2))
++                ThrowDCMException(CorruptImageError,"ImproperImageHeader")
++              break;
++            }
+             default:
+               break;
+           }
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25985.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25985.patch
new file mode 100644
index 0000000000..e2f2093ad1
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25985.patch
@@ -0,0 +1,67 @@
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 7 Feb 2026 22:30:57 -0500
+Subject: 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-v7g2-m8c5-mf84
+
+a crafted SVG file containing an malicious element causes ImageMagick to attempt to allocate ~674 GB of memory, leading to an out-of-memory abort.
+
+(cherry picked from commit 1a51eb9af00c36724660e294520878fd1f13e312)
+
+CVE: CVE-2026-25985
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/1a51eb9af00c36724660e294520878fd1f13e312]
+
+origin:  https://github.com/ImageMagick/ImageMagick/commit/1a51eb9af00c36724660e294520878fd1f13e312
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-v7g2-m8c5-mf84
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ MagickCore/draw.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/MagickCore/draw.c b/MagickCore/draw.c
+index d1c0651..2faa8f0 100644
+--- a/MagickCore/draw.c
++++ b/MagickCore/draw.c
+@@ -2297,7 +2297,7 @@ static MagickBooleanType CheckPrimitiveExtent(MVGInfo *mvg_info,
+   extent=(double) mvg_info->offset+pad+(PrimitiveExtentPad+1)*(double) quantum;
+   if (extent <= (double) *mvg_info->extent)
+     return(MagickTrue);
+-  if ((extent >= (double) MAGICK_SSIZE_MAX) || (IsNaN(extent) != 0))
++  if ((extent >= (double) GetMaxMemoryRequest()) || (IsNaN(extent) != 0))
+     return(MagickFalse);
+   if (mvg_info->offset > 0)
+     {
+@@ -6401,7 +6401,7 @@ static MagickBooleanType TraceBezier(MVGInfo *mvg_info,
+     for (j=i+1; j < (ssize_t) number_coordinates; j++)
+     {
+       alpha=fabs(primitive_info[j].point.x-primitive_info[i].point.x);
+-      if (alpha > (double) MAGICK_SSIZE_MAX)
++      if (alpha > (double) GetMaxMemoryRequest())
+         {
+           (void) ThrowMagickException(mvg_info->exception,GetMagickModule(),
+             ResourceLimitError,"MemoryAllocationFailed","`%s'","");
+@@ -6410,18 +6410,18 @@ static MagickBooleanType TraceBezier(MVGInfo *mvg_info,
+       if (alpha > (double) quantum)
+         quantum=(size_t) alpha;
+       alpha=fabs(primitive_info[j].point.y-primitive_info[i].point.y);
+-      if (alpha > (double) MAGICK_SSIZE_MAX)
+-        {
+-          (void) ThrowMagickException(mvg_info->exception,GetMagickModule(),
+-            ResourceLimitError,"MemoryAllocationFailed","`%s'","");
+-          return(MagickFalse);
+-        }
+       if (alpha > (double) quantum)
+         quantum=(size_t) alpha;
+     }
+   }
+   primitive_info=(*mvg_info->primitive_info)+mvg_info->offset;
+   quantum=MagickMin(quantum/number_coordinates,BezierQuantum);
++  if (quantum > (double) GetMaxMemoryRequest())
++    {
++      (void) ThrowMagickException(mvg_info->exception,GetMagickModule(),
++        ResourceLimitError,"MemoryAllocationFailed","`%s'","");
++      return(MagickFalse);
++    }
+   coefficients=(double *) AcquireQuantumMemory(number_coordinates,
+     sizeof(*coefficients));
+   points=(PointInfo *) AcquireQuantumMemory(quantum,number_coordinates*
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25986.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25986.patch
new file mode 100644
index 0000000000..10be76cb90
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25986.patch
@@ -0,0 +1,42 @@
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 7 Feb 2026 17:42:01 -0500
+Subject: 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-mqfc-82jx-3mr2
+
+A heap buffer overflow write vulnerability exists in ReadYUVImage() (coders/yuv.c) when processing malicious YUV 4:2:2 (NoInterlace) images.
+
+(cherry picked from commit b9c80ad3ca802b6883da25f153c4fdf72c017eba)
+
+CVE: CVE-2026-25986
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/b9c80ad3ca802b6883da25f153c4fdf72c017eba]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/b9c80ad3ca802b6883da25f153c4fdf72c017eba
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-mqfc-82jx-3mr2
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/yuv.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/coders/yuv.c b/coders/yuv.c
+index 1817c43..21486fc 100644
+--- a/coders/yuv.c
++++ b/coders/yuv.c
+@@ -261,7 +261,7 @@ static Image *ReadYUVImage(const ImageInfo *image_info,ExceptionInfo *exception)
+             chroma_image->columns,1,exception);
+           if (chroma_pixels == (Quantum *) NULL)
+             break;
+-          for (x=0; x < (ssize_t) image->columns; x+=2)
++          for (x=0; x < (ssize_t) (image->columns-1); x+=2)
+           {
+             SetPixelRed(chroma_image,0,chroma_pixels);
+             if (quantum == 1)
+@@ -740,7 +740,7 @@ static MagickBooleanType WriteYUVImage(const ImageInfo *image_info,Image *image,
+             exception);
+           if (s == (const Quantum *) NULL)
+             break;
+-          for (x=0; x < (ssize_t) yuv_image->columns; x+=2)
++          for (x=0; x < (ssize_t) (yuv_image->columns-1); x+=2)
+           {
+             if (quantum == 1)
+               {
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25987.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25987.patch
new file mode 100644
index 0000000000..b34f598761
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25987.patch
@@ -0,0 +1,44 @@
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 7 Feb 2026 18:03:19 -0500
+Subject: 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-42p5-62qq-mmh7
+
+a heap buffer over-read vulnerability exists in the MAP image decoder when processing crafted MAP files, potentially leading to crashes or unintended memory disclosure during image decoding
+
+(cherry picked from commit bbae0215e1b76830509fd20e6d37c0dd7e3e4c3a)
+
+CVE: CVE-2026-25987
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/bbae0215e1b76830509fd20e6d37c0dd7e3e4c3a]
+
+origin: backport, https://github.com/ImageMagick/ImageMagick/commit/bbae0215e1b76830509fd20e6d37c0dd7e3e4c3a
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-42p5-62qq-mmh7
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/map.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/coders/map.c b/coders/map.c
+index 6b0f992..f5dbcdb 100644
+--- a/coders/map.c
++++ b/coders/map.c
+@@ -160,6 +160,8 @@ static Image *ReadMAPImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   if (status == MagickFalse)
+     ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
+   depth=GetImageQuantumDepth(image,MagickTrue);
++  if ((depth <= 8) && (image->colors > 256))
++    ThrowReaderException(CorruptImageError,"ImproperImageHeader");
+   packet_size=(size_t) (depth/8);
+   pixels=(unsigned char *) AcquireQuantumMemory(image->columns,packet_size*
+     sizeof(*pixels));
+@@ -236,8 +238,8 @@ static Image *ReadMAPImage(const ImageInfo *image_info,ExceptionInfo *exception)
+       p++;
+       if (image->colors > 256)
+         {
+-          index=ConstrainColormapIndex(image,(ssize_t) (((size_t) index << 8)+
+-            (size_t) (*p)),exception);
++          index=(Quantum) ConstrainColormapIndex(image,(ssize_t)
++            (((size_t) index << 8)+(size_t) (*p)),exception);
+           p++;
+         }
+       SetPixelIndex(image,index,q);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25988.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25988.patch
new file mode 100644
index 0000000000..f371140c3c
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25988.patch
@@ -0,0 +1,50 @@
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 7 Feb 2026 17:53:18 -0500
+Subject: 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-782x-jh29-9mf7
+
+sometimes msl.c fails to update the stack index, so an image is stored in the wrong slot and never freed on error, causing leaks
+
+(cherry picked from commit 4354fc1d554ec2e6314aed13536efa7bde9593d2)
+
+CVE: CVE-2026-25988
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/4354fc1d554ec2e6314aed13536efa7bde9593d2]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/4354fc1d554ec2e6314aed13536efa7bde9593d2
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-782x-jh29-9mf7
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/msl.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/coders/msl.c b/coders/msl.c
+index e2ad95a..be45dbf 100644
+--- a/coders/msl.c
++++ b/coders/msl.c
+@@ -240,7 +240,7 @@ static int IsPathDirectory(const char *path)
+   return(1);
+ }
+ 
+-static void MSLPushImage(MSLInfo *msl_info,Image *image)
++static ssize_t MSLPushImage(MSLInfo *msl_info,Image *image)
+ {
+   ssize_t
+     n;
+@@ -274,6 +274,7 @@ static void MSLPushImage(MSLInfo *msl_info,Image *image)
+     ThrowFatalException(ResourceLimitFatalError,"MemoryAllocationFailed")
+   if (msl_info->number_groups != 0)
+     msl_info->group_info[msl_info->number_groups-1].numImages++;
++  return(n);
+ }
+ 
+ static void MSLPopImage(MSLInfo *msl_info)
+@@ -3071,7 +3072,7 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+     {
+       if (LocaleCompare((const char *) tag,"image") == 0)
+         {
+-          MSLPushImage(msl_info,(Image *) NULL);
++          n=MSLPushImage(msl_info,(Image *) NULL);
+           if (attributes == (const xmlChar **) NULL)
+             break;
+           for (i=0; (attributes[i] != (const xmlChar *) NULL); i++)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26066.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26066.patch
new file mode 100644
index 0000000000..72cb4944bf
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26066.patch
@@ -0,0 +1,49 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Thu, 12 Feb 2026 07:49:05 +0100
+Subject: Fixed possible infinite loop (GHSA-v994-63cg-9wj3)
+
+CVE: CVE-2026-26066
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/880057ce34f6da9dff2fe3b290bbbc45b743e613]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/880057ce34f6da9dff2fe3b290bbbc45b743e613
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-v994-63cg-9wj3
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/meta.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/coders/meta.c b/coders/meta.c
+index c76bbd5..55a5888 100644
+--- a/coders/meta.c
++++ b/coders/meta.c
+@@ -1904,7 +1904,7 @@ static int formatIPTC(Image *ifile, Image *ofile)
+   foundiptc = 0; /* found the IPTC-Header */
+   tagsfound = 0; /* number of tags found */
+ 
+-  c = ReadBlobByte(ifile);
++  c=ReadBlobByte(ifile);
+   while (c != EOF)
+   {
+     if (c == 0x1c)
+@@ -1915,17 +1915,17 @@ static int formatIPTC(Image *ifile, Image *ofile)
+           return(-1);
+         else
+           {
+-            c=0;
++            c=ReadBlobByte(ifile);
+             continue;
+           }
+       }
+ 
+     /* we found the 0x1c tag and now grab the dataset and record number tags */
+-    c = ReadBlobByte(ifile);
++    c=ReadBlobByte(ifile);
+     if (c == EOF)
+       return(-1);
+     dataset = (unsigned char) c;
+-    c = ReadBlobByte(ifile);
++    c=ReadBlobByte(ifile);
+     if (c == EOF)
+       return(-1);
+     recnum = (unsigned char) c;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26283.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26283.patch
new file mode 100644
index 0000000000..7888fc2c9b
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26283.patch
@@ -0,0 +1,33 @@
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Fri, 13 Feb 2026 18:57:09 -0500
+Subject: 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-gwr3-x37h-h84v
+
+a `continue` statement in the JPEG extent binary search loop in the jpeg encoder causes an infinite loop when writing persistently fails
+
+(cherry picked from commit c448c6920a985872072fc7be6034f678c087de9b)
+
+CVE: CVE-2026-26283
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/c448c6920a985872072fc7be6034f678c087de9b]
+
+origin: https://github.com/ImageMagick/ImageMagick/commit/c448c6920a985872072fc7be6034f678c087de9b
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-gwr3-x37h-h84v
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/jpeg.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/coders/jpeg.c b/coders/jpeg.c
+index 8cbfa27..7ead4e5 100644
+--- a/coders/jpeg.c
++++ b/coders/jpeg.c
+@@ -2707,7 +2707,7 @@ static MagickBooleanType WriteJPEGImage_(const ImageInfo *image_info,
+             status=WriteJPEGImage(extent_info,jpeg_image,exception);
+             (void) RelinquishUniqueFileResource(jpeg_image->filename);
+             if (status == MagickFalse)
+-              continue;
++              break;
+             if (GetBlobSize(jpeg_image) <= extent)
+               minimum=jpeg_image->quality+1;
+             else
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26284.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26284.patch
new file mode 100644
index 0000000000..7d25bfa2f2
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26284.patch
@@ -0,0 +1,31 @@
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Tue, 27 Jan 2026 21:45:02 +0100
+Subject: Corrected loop initialization to prevent out of bounds read
+ (GHSA-wrhr-rf8j-r842)
+
+(cherry picked from commit 0c9ffcf55763e5daf1b61dfed0deed1aa43e217f)
+
+CVE: CVE-2026-26284
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/0c9ffcf55763e5daf1b61dfed0deed1aa43e217f]
+
+Bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-wrhr-rf8j-r842
+origin: backport,  https://github.com/ImageMagick/ImageMagick/commit/0c9ffcf55763e5daf1b61dfed0deed1aa43e217f
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/pcd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/coders/pcd.c b/coders/pcd.c
+index e6a361c..279c85f 100644
+--- a/coders/pcd.c
++++ b/coders/pcd.c
+@@ -313,7 +313,7 @@ static MagickBooleanType DecodeImage(Image *image,unsigned char *luma,
+       Decode luminance or chrominance deltas.
+     */
+     r=pcd_table[plane];
+-    for (i=0; ((i < (ssize_t) length) && ((sum & r->mask) != r->sequence)); i++)
++    for (i=1; ((i < pcd_length[plane]) && ((sum & r->mask) != r->sequence)); i++)
+       r++;
+     if ((row > image->rows) || (r == (PCDTable *) NULL))
+       {
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26983.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26983.patch
new file mode 100644
index 0000000000..72b5779a22
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26983.patch
@@ -0,0 +1,41 @@
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Mon, 16 Feb 2026 10:00:58 -0500
+Subject: 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-w8mw-frc6-r7m8
+
+the MSL interpreter crashes when processing a invalid `<map>` element that causes it to use an image after it has been freed
+
+(cherry picked from commit 7cfae4da24a995fb05386d77364ff404a7cca7bc)
+
+CVE: CVE-2026-26983
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/7cfae4da24a995fb05386d77364ff404a7cca7bc]
+
+origin: backport, https://github.com/ImageMagick/ImageMagick/commit/7cfae4da24a995fb05386d77364ff404a7cca7bc
+bug: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-w8mw-frc6-r7m8
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ coders/msl.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/coders/msl.c b/coders/msl.c
+index be45dbf..bee781e 100644
+--- a/coders/msl.c
++++ b/coders/msl.c
+@@ -3390,10 +3390,13 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+           quantize_info=AcquireQuantizeInfo(msl_info->image_info[n]);
+           quantize_info->dither_method=dither != MagickFalse ?
+             RiemersmaDitherMethod : NoDitherMethod;
+-          (void) RemapImages(quantize_info,msl_info->image[n],
+-            affinity_image,exception);
++          if (affinity_image != (Image *) NULL)
++            {
++              (void) RemapImages(quantize_info,msl_info->image[n],
++                affinity_image,exception);
++              affinity_image=DestroyImage(affinity_image);
++            }
+           quantize_info=DestroyQuantizeInfo(quantize_info);
+-          affinity_image=DestroyImage(affinity_image);
+           break;
+         }
+       if (LocaleCompare((const char *) tag,"matte-floodfill") == 0)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index ffc26e7169..acb6a16b1a 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -29,6 +29,34 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-68618.patch \
            file://CVE-2025-68950.patch \
            file://CVE-2025-69204.patch \
+           file://CVE-2026-24481.patch \
+           file://CVE-2026-25638.patch \
+           file://CVE-2026-25794.patch \
+           file://CVE-2026-25795.patch \
+           file://CVE-2026-25796.patch \
+           file://CVE-2026-25797_1.patch \
+           file://CVE-2026-25797_2.patch \
+           file://CVE-2026-25798.patch \
+           file://CVE-2026-25799.patch \
+           file://CVE-2026-25897.patch \
+           file://CVE-2026-25898_1.patch \
+           file://CVE-2026-25898_2.patch \
+           file://CVE-2026-25965.patch \
+           file://CVE-2026-25966.patch \
+           file://CVE-2026-25967.patch \
+           file://CVE-2026-25968.patch \
+           file://CVE-2026-25969.patch \
+           file://CVE-2026-25970_pre1.patch \
+           file://CVE-2026-25970.patch \
+           file://CVE-2026-25982.patch \
+           file://CVE-2026-25985.patch \
+           file://CVE-2026-25986.patch \
+           file://CVE-2026-25987.patch \
+           file://CVE-2026-25988.patch \
+           file://CVE-2026-26066.patch \
+           file://CVE-2026-26283.patch \
+           file://CVE-2026-26284.patch \
+           file://CVE-2026-26983.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 
-- 
2.34.1


