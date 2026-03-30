Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEDCFC97E2
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 08:42:06 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46973.1774860121987464373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 01:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b/nwRUFx;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: nmjain23@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82a655cfab5so3961162b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 01:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860121; x=1775464921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbKiqFHZhhz3VjJH6sCmQu++ltltCd7/FnUwAgB65kY=;
        b=b/nwRUFxywgQ+UxDGHAbOE88JGhy31ktiLpZS7Uf4Ede3bXwyejlFUQd4hp94L2znO
         MSmRIr14bQc61RHnESgo1h+rZH7EB5vaPA+j6ln3RinvMCi+73p4xZU338NRUcEmlKli
         aPkSge9721ueB5FLKW+9kMtYVBgxar4mIru2KMpF9DiNBRyrkmG1cw9jKe6rZl036wmQ
         1ryhl4HieE5wlk6fm7lH3Df2LT3tghh2IAFnZERS1i2pms4SMayZ0gYnckgOBAZwo2sz
         pd10SUOt+9X7KMn2skzwsAKQS0oSzbVNX5fOuTAgHtYFkiW+e69WbqpDRy1FfA5T5nW3
         KI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860121; x=1775464921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hbKiqFHZhhz3VjJH6sCmQu++ltltCd7/FnUwAgB65kY=;
        b=ianJQSKDKMkIMYCkoIoFnE0v/4aLxs+e+hvLYL5XwiJdCGvjR/MCwxlXUJ9KS3r8Q/
         Oa2d8k8xLCRyC2o5LogA1Tj+aBZvlf8afW9ZPrhWEnuJBqIGFnDlMIBUcbZtJwWOJwtl
         NnMFkRC98SL1MoQ67JY4lVGZ6f+vjO0yfd/c1dcbxa7yT+/uxAQMSlIXt+p3tSdbMRIV
         meCO0C6mHjFKR53ZJHYZVNiyoWZI0nMsl4i+guKUGOQrSYKwMC5YdOLGqv39GDsFKopw
         7Jh07lo2aFWjDsVCkuBgtVjz01SEz6LbB6C20vywwMYPBIFD+QM2Vjip1l7LveUHslqm
         Q93Q==
X-Gm-Message-State: AOJu0YxBriUQ57Y2Djma//FKOyMhuuXHggYoK06x0U4THt4KvkwYOm3g
	rDm4WRkx7vq7RdHybZZruQa1gAC9nu9ny6BGkeUWJjMqpYunfp+q2TDO8G/Jpg==
X-Gm-Gg: ATEYQzxs2hcXr6C594+bZHYahzGd99XKndi+PMugQexxlMxsxdY56zkM95CxOwGc0J2
	Ry14oyeKU8Ig/RDbC2Gtm5YmFWprBNGwBmrpMIVStUvhSzXMCcAmLgX2Pz4RJcarRYti+uKNWe3
	RUj+gVzA6BuwSMXPsjueb5ebUIQEy1k2nmfzyTFzwpJTC4pAr0RbZzu4hnLD5VNwIPRxn0HqFeS
	sn35WJ7cbLWSQt5iBP92fA4B9NONJDtZ0up8x8wXQCldOBclusBTI9ptWLwO3KpGtd2LTj8xVsX
	Gb6m9d3Sp1t4rBMcEfo1aLoZwLl6db0GYAn8OZ1D8pxYnRIvx4+LGRzKukoRpwE3Lg3t+yOaHKp
	4lMRH3ZlvKVbAfgOioLDlZDJ1XGuQxjrlrFLYVXTlNVARWO/Kz/0GR1mNQC5c2bearN9BGCGuhd
	poAPkClLqnzl1hgtwoftPdGf5UyT4RaWQAAMg9102yn+FURi9cVnR6FkIe9hndpF1AZP3ITQzH
X-Received: by 2002:a05:6a00:4b50:b0:82c:217c:98ca with SMTP id d2e1a72fcca58-82c95c199d5mr11346720b3a.12.1774860120773;
        Mon, 30 Mar 2026 01:42:00 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.197.75.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d019dsm7746256b3a.29.2026.03.30.01.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:42:00 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <naman.jain@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Naman Jain <namanj1@kpit.com>
Subject: [meta-oe][scarthgap][PATCH 1/1] imagemagick: upgrade 7.1.1-47 -> 7.1.2-15
Date: Mon, 30 Mar 2026 14:11:19 +0530
Message-Id: <20260330084119.3008435-2-naman.jain@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330084119.3008435-1-naman.jain@partner.bmw.de>
References: <20260330084119.3008435-1-naman.jain@partner.bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 08:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125839

From: Naman Jain <namanj1@kpit.com>

Upgrade ImageMagick to fix 50+ security vulnerabilities,
including 6+ CVEs with high severity (CVSS score > 9.0).

CVEs fixed (2026):
CVE-2026-24481 CVE-2026-24484 CVE-2026-24485 CVE-2026-25576
CVE-2026-25637 CVE-2026-25638 CVE-2026-25794 CVE-2026-25795
CVE-2026-25796 CVE-2026-25797 CVE-2026-25798 CVE-2026-25799
CVE-2026-25897 CVE-2026-25898 CVE-2026-25965 CVE-2026-25966
CVE-2026-25967 CVE-2026-25968 CVE-2026-25969 CVE-2026-25970
CVE-2026-25971 CVE-2026-25982 CVE-2026-25983 CVE-2026-25985
CVE-2026-25986 CVE-2026-25987 CVE-2026-25988 CVE-2026-25989
CVE-2026-26066 CVE-2026-26283 CVE-2026-26284 CVE-2026-26983
CVE-2026-27798 CVE-2026-27799

CVEs fixed (2025):
CVE-2025-53014 CVE-2025-53015 CVE-2025-53019 CVE-2025-53101
CVE-2025-55004 CVE-2025-55005 CVE-2025-55154 CVE-2025-55160
CVE-2025-55212 CVE-2025-55298 CVE-2025-57803 CVE-2025-57807
CVE-2025-62171 CVE-2025-65955 CVE-2025-66628 CVE-2025-69204

ABI compatibility report:
Binary compatibility: 99.9%, no removed symbols
one high severity data type change: field removed from struct _LogInfo in log.c (internal logging only, non-functional)

Also incorporate upstream oe-core changes:

Remove jp2 PACKAGECONFIG as it was superseded by openjpeg,
which continues to provide JPEG2000 support.
(ref oe-core: b9e39b5fab062385f130b39c688c60a1519422df)

Add 'magick' binary to update-alternatives. ImageMagick 7
uses 'magick' as the primary CLI entry point, and without
this /usr/bin/magick would be missing, breaking scripts
and ptests.
(ref oe-core: 517f03237b89a0496304de1d83adbd862cc52e2f)

Add PACKAGECONFIG options for raw, jxl, and heic (not
enabled by default).
(ref oe-core: 5e234700b9d10e2f40e78bdc751f4eb451ca37b5)

Updated base PV and SRCREV accordingly.
(ref oe-core: 4e5fdfc4231772521e281b76fac0baf9108d31f6)

Changelog:
https://github.com/ImageMagick/ImageMagick/compare/7.1.1-47...7.1.2-0
https://github.com/ImageMagick/ImageMagick/compare/7.1.2-0...7.1.2-1
https://github.com/ImageMagick/ImageMagick/compare/7.1.2-1...7.1.2-2
https://github.com/ImageMagick/ImageMagick/compare/7.1.2-2...7.1.2-3
https://github.com/ImageMagick/Website/blob/main/ChangeLog.md

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../imagemagick/CVE-2025-53014.patch          |  25 ---
 .../imagemagick/CVE-2025-53015.patch          |  51 ------
 .../imagemagick/CVE-2025-53019.patch          |  26 ---
 .../imagemagick/CVE-2025-53101.patch          |  54 ------
 .../imagemagick/CVE-2025-55004.patch          |  65 -------
 .../imagemagick/CVE-2025-55005.patch          |  34 ----
 .../imagemagick/CVE-2025-55154.patch          |  79 ---------
 .../imagemagick/CVE-2025-55160.patch          | 159 ------------------
 .../imagemagick/CVE-2025-55212.patch          |  29 ----
 .../imagemagick/CVE-2025-57803.patch          |  60 -------
 .../imagemagick/CVE-2025-57807.patch          |  45 -----
 .../imagemagick/CVE-2025-62171.patch          |  26 ---
 .../imagemagick/CVE-2025-65955.patch          |  25 ---
 .../imagemagick/CVE-2025-66628.patch          |  27 ---
 ...agick_7.1.1.bb => imagemagick_7.1.2-15.bb} |  39 ++---
 15 files changed, 15 insertions(+), 729 deletions(-)
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53014.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53015.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53019.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53101.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55004.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55005.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55154.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55160.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55212.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57803.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57807.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62171.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-65955.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-66628.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.1.bb => imagemagick_7.1.2-15.bb} (94%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53014.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53014.patch
deleted file mode 100644
index b20d78e1bb..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53014.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From ebf0f36974e2c9b47d9bb5bf31d19a19c0ce4e8e Mon Sep 17 00:00:00 2001
-From: Dirk Lemstra <dirk@lemstra.org>
-Date: Thu, 26 Jun 2025 23:01:07 +0200
-Subject: [PATCH] Correct out of bounds read of a single byte.
-
-CVE: CVE-2025-53014
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/29d82726c7ec20c07c49ba263bdcea16c2618e03]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- MagickCore/image.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/MagickCore/image.c b/MagickCore/image.c
-index 261d75003..1b242f828 100644
---- a/MagickCore/image.c
-+++ b/MagickCore/image.c
-@@ -1678,7 +1678,7 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
-     q=(char *) p+1;
-     if (*q == '%')
-       {
--        p=q+1;
-+        p++;
-         continue;
-       }
-     field_width=0;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53015.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53015.patch
deleted file mode 100644
index 26ab56ebab..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53015.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From dee67b151cf3f25bde758d1fac9a42626715b3e5 Mon Sep 17 00:00:00 2001
-From: Dirk Lemstra <dirk@lemstra.org>
-Date: Fri, 2 May 2025 18:33:17 +0200
-Subject: [PATCH] Added extra checks to make sure we don't get stuck in the
- while loop.
-
-Added missing return.
-
-CVE: CVE-2025-53015
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/229fa96a988a21d78318bbca61245a6ed1ee33a0 and https://github.com/ImageMagick/ImageMagick/commit/38631605e6ab744548a561797472cf8648bcfe26]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- MagickCore/image-private.h |  1 +
- MagickCore/profile.c       | 12 ++++++++++++
- 2 files changed, 13 insertions(+)
-
-diff --git a/MagickCore/image-private.h b/MagickCore/image-private.h
-index 4ce71c32c..11dca1072 100644
---- a/MagickCore/image-private.h
-+++ b/MagickCore/image-private.h
-@@ -52,6 +52,7 @@ extern "C" {
- #define MAGICK_SIZE_MAX  (SIZE_MAX)
- #define MAGICK_SSIZE_MAX  (SSIZE_MAX)
- #define MAGICK_SSIZE_MIN  (-SSIZE_MAX-1)
-+#define MAGICK_ULONG_MAX  (ULONG_MAX)
- #define MatteColor  "#bdbdbd"  /* gray */
- #define MatteColorRGBA  ScaleShortToQuantum(0xbdbd),\
-   ScaleShortToQuantum(0xbdbd),ScaleShortToQuantum(0xbdbd),OpaqueAlpha
-diff --git a/MagickCore/profile.c b/MagickCore/profile.c
-index 7eea1d32f..a68e54f14 100644
---- a/MagickCore/profile.c
-+++ b/MagickCore/profile.c
-@@ -2571,6 +2571,18 @@ static void GetXmpNumeratorAndDenominator(double value,
-   *denominator=1;
-   if (value <= MagickEpsilon)
-     return;
-+  if (value > (double) MAGICK_ULONG_MAX)
-+    {
-+      *numerator = MAGICK_ULONG_MAX;
-+      *denominator = 1;
-+      return;
-+    }
-+  if (floor(value) == value)
-+    {
-+      *numerator = (unsigned long) value;
-+      *denominator = 1;
-+      return;
-+    }
-   *numerator=1;
-   df=1.0;
-   while(fabs(df - value) > MagickEpsilon)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53019.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53019.patch
deleted file mode 100644
index 63702955cb..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53019.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4e32e83e3f57d110b56641f12cc5ed7d007dce29 Mon Sep 17 00:00:00 2001
-From: Dirk Lemstra <dirk@lemstra.org>
-Date: Fri, 27 Jun 2025 14:51:57 +0200
-Subject: [PATCH] Fixed memory leak when entering StreamImage multiple times.
-
-CVE: CVE-2025-53019
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/fc3ab0812edef903bbb2473c0ee652ddfd04fe5c]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- MagickCore/stream.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/MagickCore/stream.c b/MagickCore/stream.c
-index 786dabb52..22a0c9eee 100644
---- a/MagickCore/stream.c
-+++ b/MagickCore/stream.c
-@@ -1321,7 +1321,8 @@ MagickExport Image *StreamImage(const ImageInfo *image_info,
-       image_info->filename);
-   read_info=CloneImageInfo(image_info);
-   stream_info->image_info=image_info;
--  stream_info->quantum_info=AcquireQuantumInfo(image_info,(Image *) NULL);
-+  if (stream_info->quantum_info == (QuantumInfo *) NULL)
-+    stream_info->quantum_info=AcquireQuantumInfo(image_info,(Image *) NULL);
-   if (stream_info->quantum_info == (QuantumInfo *) NULL)
-     {
-       read_info=DestroyImageInfo(read_info);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53101.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53101.patch
deleted file mode 100644
index 5688ad1372..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53101.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 682d679b300cdcbb0990742c29cd4397fe43c65d Mon Sep 17 00:00:00 2001
-From: Cristy <urban-warrior@imagemagick.org>
-Date: Fri, 27 Jun 2025 20:02:12 -0400
-Subject: [PATCH] 
- https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qh3h-j545-h8c9
-
-CVE: CVE-2025-53101
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/66dc8f51c11b0ae1f1cdeacd381c3e9a4de69774]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- MagickCore/image.c | 13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/MagickCore/image.c b/MagickCore/image.c
-index 1b242f828..ca89e9cc4 100644
---- a/MagickCore/image.c
-+++ b/MagickCore/image.c
-@@ -1665,7 +1665,6 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
-     canonical;
- 
-   ssize_t
--    field_width,
-     offset;
- 
-   canonical=MagickFalse;
-@@ -1681,21 +1680,23 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
-         p++;
-         continue;
-       }
--    field_width=0;
--    if (*q == '0')
--      field_width=(ssize_t) strtol(q,&q,10);
-     switch (*q)
-     {
-       case 'd':
-       case 'o':
-       case 'x':
-       {
-+        ssize_t
-+          count;
-+
-         q++;
-         c=(*q);
-         *q='\0';
--        (void) FormatLocaleString(filename+(p-format-offset),(size_t)
-+        count=FormatLocaleString(filename+(p-format-offset),(size_t)
-           (MagickPathExtent-(p-format-offset)),p,value);
--        offset+=(4-field_width);
-+        if ((count <= 0) || (count > (MagickPathExtent-(p-format-offset))))
-+          return(0);
-+        offset+=(ssize_t) ((q-p)-count);
-         *q=c;
-         (void) ConcatenateMagickString(filename,q,MagickPathExtent);
-         canonical=MagickTrue;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55004.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55004.patch
deleted file mode 100644
index 44ef34c40b..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55004.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From e3b2eba8a84e7c4222bcf1a843c1677b7406db3f Mon Sep 17 00:00:00 2001
-From: Cristy <urban-warrior@imagemagick.org>
-Date: Thu, 7 Aug 2025 19:14:00 -0400
-Subject: [PATCH] 
- https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-cjc8-g9w8-chfw
-
-CVE: CVE-2025-55004
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/55d97055e00a7bc7ae2776c99824002fbb4a72aa]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- coders/png.c | 33 ++++++++++-----------------------
- 1 file changed, 10 insertions(+), 23 deletions(-)
-
-diff --git a/coders/png.c b/coders/png.c
-index 23a96e4d0..c6fae6283 100644
---- a/coders/png.c
-+++ b/coders/png.c
-@@ -4785,37 +4785,24 @@ static Image *ReadOneJNGImage(MngReadInfo *mng_info,
-       jng_image=ReadImage(alpha_image_info,exception);
- 
-       if (jng_image != (Image *) NULL)
--        for (y=0; y < (ssize_t) image->rows; y++)
-         {
--          s=GetVirtualPixels(jng_image,0,y,image->columns,1,exception);
--          q=GetAuthenticPixels(image,0,y,image->columns,1,exception);
--          if ((s == (const Quantum *)  NULL) || (q == (Quantum *) NULL))
--            break;
-+          image->alpha_trait=BlendPixelTrait;
-+          for (y=0; y < (ssize_t) image->rows; y++)
-+          {
-+            s=GetVirtualPixels(jng_image,0,y,image->columns,1,exception);
-+            q=GetAuthenticPixels(image,0,y,image->columns,1,exception);
-+            if ((s == (const Quantum *)  NULL) || (q == (Quantum *) NULL))
-+              break;
- 
--          if (image->alpha_trait != UndefinedPixelTrait)
-             for (x=(ssize_t) image->columns; x != 0; x--)
-             {
-               SetPixelAlpha(image,GetPixelRed(jng_image,s),q);
-               q+=(ptrdiff_t) GetPixelChannels(image);
-               s+=(ptrdiff_t) GetPixelChannels(jng_image);
-             }
--
--          else
--            for (x=(ssize_t) image->columns; x != 0; x--)
--            {
--              Quantum
--                alpha;
--
--              alpha=GetPixelRed(jng_image,s);
--              SetPixelAlpha(image,alpha,q);
--              if (alpha != OpaqueAlpha)
--                image->alpha_trait=BlendPixelTrait;
--              q+=(ptrdiff_t) GetPixelChannels(image);
--              s+=(ptrdiff_t) GetPixelChannels(jng_image);
--            }
--
--          if (SyncAuthenticPixels(image,exception) == MagickFalse)
--            break;
-+            if (SyncAuthenticPixels(image,exception) == MagickFalse)
-+              break;
-+          }
-         }
-       (void) RelinquishUniqueFileResource(alpha_image->filename);
-       alpha_image=DestroyImageList(alpha_image);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55005.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55005.patch
deleted file mode 100644
index 727e66f741..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55005.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 430c29617ce287db24872cb4e7fbb1e03d117d0a Mon Sep 17 00:00:00 2001
-From: Cristy <urban-warrior@imagemagick.org>
-Date: Thu, 7 Aug 2025 22:05:10 -0400
-Subject: [PATCH] 
- https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-v393-38qx-v8fp
-
-CVE: CVE-2025-55005
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/b68bb6d3cfe472d5bd9329b4172e2e4f63d90a57]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- MagickCore/colorspace.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/MagickCore/colorspace.c b/MagickCore/colorspace.c
-index a87defad8..82400ce46 100644
---- a/MagickCore/colorspace.c
-+++ b/MagickCore/colorspace.c
-@@ -2420,10 +2420,16 @@ static MagickBooleanType TransformsRGBImage(Image *image,
-       value=GetImageProperty(image,"reference-black",exception);
-       if (value != (const char *) NULL)
-         reference_black=StringToDouble(value,(char **) NULL);
-+      if (reference_black > 1024.0)
-+        reference_black=1024.0;
-       reference_white=ReferenceWhite;
-       value=GetImageProperty(image,"reference-white",exception);
-       if (value != (const char *) NULL)
-         reference_white=StringToDouble(value,(char **) NULL);
-+      if (reference_white > 1024.0)
-+        reference_white=1024.0;
-+      if (reference_black > reference_white)
-+        reference_black=reference_white;
-       logmap=(Quantum *) AcquireQuantumMemory((size_t) MaxMap+1UL,
-         sizeof(*logmap));
-       if (logmap == (Quantum *) NULL)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55154.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55154.patch
deleted file mode 100644
index 52f4ac1525..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55154.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 963d61bbea3facd347262316201f3b8b7e3dc470 Mon Sep 17 00:00:00 2001
-From: Cristy <urban-warrior@imagemagick.org>
-Date: Sat, 9 Aug 2025 08:28:23 -0400
-Subject: [PATCH] 
- https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qp29-wxp5-wh82
-
-CVE: CVE-2025-55154
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/db986e4782e9f6cc42a0e50151dc4fe43641b337]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- coders/png.c | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/coders/png.c b/coders/png.c
-index c6fae6283..0191c6f1f 100644
---- a/coders/png.c
-+++ b/coders/png.c
-@@ -6398,19 +6398,19 @@ static Image *ReadOneMNGImage(MngReadInfo* mng_info,
-               mng_info->magn_methy = 1;
-             if (mng_info->magn_methx == 1)
-               {
--                magnified_width=mng_info->magn_ml;
-+                magnified_width=(size_t) mng_info->magn_ml;
- 
-                 if (image->columns > 1)
-                    magnified_width += mng_info->magn_mr;
- 
-                 if (image->columns > 2)
--                   magnified_width += (png_uint_32)
-+                   magnified_width += (size_t)
-                       ((image->columns-2)*(mng_info->magn_mx));
-               }
- 
-             else
-               {
--                magnified_width=(png_uint_32) image->columns;
-+                magnified_width=(size_t) image->columns;
- 
-                 if (image->columns > 1)
-                    magnified_width += mng_info->magn_ml-1;
-@@ -6419,25 +6419,25 @@ static Image *ReadOneMNGImage(MngReadInfo* mng_info,
-                    magnified_width += mng_info->magn_mr-1;
- 
-                 if (image->columns > 3)
--                   magnified_width += (png_uint_32)
-+                   magnified_width += (size_t)
-                       ((image->columns-3)*(mng_info->magn_mx-1));
-               }
- 
-             if (mng_info->magn_methy == 1)
-               {
--                magnified_height=mng_info->magn_mt;
-+                magnified_height=(size_t) mng_info->magn_mt;
- 
-                 if (image->rows > 1)
-                    magnified_height += mng_info->magn_mb;
- 
-                 if (image->rows > 2)
--                   magnified_height += (png_uint_32)
-+                   magnified_height += (size_t)
-                       ((image->rows-2)*(mng_info->magn_my));
-               }
- 
-             else
-               {
--                magnified_height=(png_uint_32) image->rows;
-+                magnified_height=(size_t) image->rows;
- 
-                 if (image->rows > 1)
-                    magnified_height += mng_info->magn_mt-1;
-@@ -6446,7 +6446,7 @@ static Image *ReadOneMNGImage(MngReadInfo* mng_info,
-                    magnified_height += mng_info->magn_mb-1;
- 
-                 if (image->rows > 3)
--                   magnified_height += (png_uint_32)
-+                   magnified_height += (size_t)
-                       ((image->rows-3)*(mng_info->magn_my-1));
-               }
- 
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55160.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55160.patch
deleted file mode 100644
index 565322e7ab..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55160.patch
+++ /dev/null
@@ -1,159 +0,0 @@
-From fecf9ca80adecb7709446ee226d50ac079a37308 Mon Sep 17 00:00:00 2001
-From: Cristy <urban-warrior@imagemagick.org>
-Date: Sun, 10 Aug 2025 08:28:28 -0400
-Subject: [PATCH] 
- https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-6hgw-6x87-578x
-
-CVE: CVE-2025-55160
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/63d8769dd6a8f32f4096c71be9e08a2c081e47da]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- MagickCore/artifact.c | 17 ++++++++++++++++-
- MagickCore/option.c   | 17 ++++++++++++++++-
- MagickCore/profile.c  | 19 ++++++++++++++++++-
- MagickCore/property.c | 18 ++++++++++++++++--
- 4 files changed, 66 insertions(+), 5 deletions(-)
-
-diff --git a/MagickCore/artifact.c b/MagickCore/artifact.c
-index dae6aaaf0..764ef75a4 100644
---- a/MagickCore/artifact.c
-+++ b/MagickCore/artifact.c
-@@ -99,6 +99,21 @@
- %    o clone_image: the source image for artifacts to clone.
- %
- */
-+
-+typedef char
-+  *(*CloneKeyFunc)(const char *),
-+  *(*CloneValueFunc)(const char *);
-+
-+static inline void *CloneArtifactKey(void *key)
-+{
-+  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
-+}
-+
-+static inline void *CloneArtifactValue(void *value)
-+{
-+  return((void *) ((CloneValueFunc) ConstantString)((const char *) value));
-+}
-+
- MagickExport MagickBooleanType CloneImageArtifacts(Image *image,
-   const Image *clone_image)
- {
-@@ -117,7 +132,7 @@ MagickExport MagickBooleanType CloneImageArtifacts(Image *image,
-       if (image->artifacts != (void *) NULL)
-         DestroyImageArtifacts(image);
-       image->artifacts=CloneSplayTree((SplayTreeInfo *) clone_image->artifacts,
--        (void *(*)(void *)) ConstantString,(void *(*)(void *)) ConstantString);
-+        CloneArtifactKey,CloneArtifactValue);
-     }
-   return(MagickTrue);
- }
-diff --git a/MagickCore/option.c b/MagickCore/option.c
-index eee6f943c..31c5fa99a 100644
---- a/MagickCore/option.c
-+++ b/MagickCore/option.c
-@@ -2361,6 +2361,21 @@ static const OptionInfo
- %    o clone_info: the source image info for options to clone.
- %
- */
-+
-+typedef char
-+  *(*CloneKeyFunc)(const char *),
-+  *(*CloneValueFunc)(const char *);
-+
-+static inline void *CloneOptionKey(void *key)
-+{
-+  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
-+}
-+
-+static inline void *CloneOptionValue(void *value)
-+{
-+  return((void *) ((CloneValueFunc) ConstantString)((const char *) value));
-+}
-+
- MagickExport MagickBooleanType CloneImageOptions(ImageInfo *image_info,
-   const ImageInfo *clone_info)
- {
-@@ -2376,7 +2391,7 @@ MagickExport MagickBooleanType CloneImageOptions(ImageInfo *image_info,
-       if (image_info->options != (void *) NULL)
-         DestroyImageOptions(image_info);
-       image_info->options=CloneSplayTree((SplayTreeInfo *) clone_info->options,
--        (void *(*)(void *)) ConstantString,(void *(*)(void *)) ConstantString);
-+        CloneOptionKey,CloneOptionValue);
-     }
-   return(MagickTrue);
- }
-diff --git a/MagickCore/profile.c b/MagickCore/profile.c
-index a68e54f14..e131bd6ec 100644
---- a/MagickCore/profile.c
-+++ b/MagickCore/profile.c
-@@ -143,6 +143,23 @@ typedef struct _CMSExceptionInfo
- %    o clone_image: the clone image.
- %
- */
-+
-+typedef char
-+  *(*CloneKeyFunc)(const char *);
-+
-+typedef StringInfo
-+  *(*CloneValueFunc)(const StringInfo *);
-+
-+static inline void *CloneProfileKey(void *key)
-+{
-+  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
-+}
-+
-+static inline void *CloneProfileValue(void *value)
-+{
-+  return((void *) ((CloneValueFunc) CloneStringInfo)((const StringInfo *) value));
-+}
-+
- MagickExport MagickBooleanType CloneImageProfiles(Image *image,
-   const Image *clone_image)
- {
-@@ -157,7 +174,7 @@ MagickExport MagickBooleanType CloneImageProfiles(Image *image,
-       if (image->profiles != (void *) NULL)
-         DestroyImageProfiles(image);
-       image->profiles=CloneSplayTree((SplayTreeInfo *) clone_image->profiles,
--        (void *(*)(void *)) ConstantString,(void *(*)(void *)) CloneStringInfo);
-+        CloneProfileKey,CloneProfileValue);
-     }
-   return(MagickTrue);
- }
-diff --git a/MagickCore/property.c b/MagickCore/property.c
-index f11e87d8a..f8779f3a1 100644
---- a/MagickCore/property.c
-+++ b/MagickCore/property.c
-@@ -131,6 +131,21 @@
- %    o clone_image: the clone image.
- %
- */
-+
-+typedef char
-+  *(*CloneKeyFunc)(const char *),
-+  *(*CloneValueFunc)(const char *);
-+
-+static inline void *ClonePropertyKey(void *key)
-+{
-+  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
-+}
-+
-+static inline void *ClonePropertyValue(void *value)
-+{
-+  return((void *) ((CloneValueFunc) ConstantString)((const char *) value));
-+}
-+
- MagickExport MagickBooleanType CloneImageProperties(Image *image,
-   const Image *clone_image)
- {
-@@ -195,8 +210,7 @@ MagickExport MagickBooleanType CloneImageProperties(Image *image,
-       if (image->properties != (void *) NULL)
-         DestroyImageProperties(image);
-       image->properties=CloneSplayTree((SplayTreeInfo *)
--        clone_image->properties,(void *(*)(void *)) ConstantString,
--        (void *(*)(void *)) ConstantString);
-+        clone_image->properties,ClonePropertyKey,ClonePropertyValue);
-     }
-   return(MagickTrue);
- }
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55212.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55212.patch
deleted file mode 100644
index 40a1b6fc4d..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55212.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3cc6cf85fbe2d147c7b3d48e53f4e9f081448ae8 Mon Sep 17 00:00:00 2001
-From: Cristy <urban-warrior@imagemagick.org>
-Date: Sun, 17 Aug 2025 14:33:44 -0400
-Subject: [PATCH] 
- https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-fh55-q5pj-pxgw
-
-CVE: CVE-2025-55212
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/5f0bcf986b8b5e90567750d31a37af502b73f2af]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- MagickCore/resize.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/MagickCore/resize.c b/MagickCore/resize.c
-index ea6e535f4..298662f8a 100644
---- a/MagickCore/resize.c
-+++ b/MagickCore/resize.c
-@@ -4624,8 +4624,9 @@ MagickExport Image *ThumbnailImage(const Image *image,const size_t columns,
-         x_factor,
-         y_factor;
- 
--      x_factor=(ssize_t) image->columns/(ssize_t) columns;
--      y_factor=(ssize_t) image->rows/(ssize_t) rows;
-+      x_factor=(ssize_t) (image->columns*PerceptibleReciprocal((double) 
-+        columns));
-+      y_factor=(ssize_t) (image->rows*PerceptibleReciprocal((double) rows));
-       if ((x_factor > 4) && (y_factor > 4))
-         {
-           thumbnail_image=SampleImage(clone_image,4*columns,4*rows,exception);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57803.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57803.patch
deleted file mode 100644
index 0eaf3af163..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57803.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 28b22daea4382d3599ea5a5369354d044c51b124 Mon Sep 17 00:00:00 2001
-From: Cristy <urban-warrior@imagemagick.org>
-Date: Sat, 23 Aug 2025 09:18:40 -0400
-Subject: [PATCH] 
- https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-mxvv-97wh-cfmm
-
-CVE: CVE-2025-57803
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/2c55221f4d38193adcb51056c14cf238fbcc35d7]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- coders/bmp.c | 20 ++++++++++++++++----
- 1 file changed, 16 insertions(+), 4 deletions(-)
-
-diff --git a/coders/bmp.c b/coders/bmp.c
-index e05659b22..5c75e7f23 100644
---- a/coders/bmp.c
-+++ b/coders/bmp.c
-@@ -516,6 +516,11 @@ static MagickBooleanType IsBMP(const unsigned char *magick,const size_t length)
- %
- */
- 
-+static inline MagickBooleanType BMPOverflowCheck(size_t x,size_t y)
-+{
-+  return((y != 0) && (x > 4294967295UL/y) ? MagickTrue : MagickFalse);
-+}
-+
- static Image *ReadEmbedImage(const ImageInfo *image_info,Image *image,
-   const char *magick,ExceptionInfo *exception)
- {
-@@ -609,6 +614,7 @@ static Image *ReadBMPImage(const ImageInfo *image_info,ExceptionInfo *exception)
-   size_t
-     bit,
-     bytes_per_line,
-+    extent,
-     length;
- 
-   ssize_t
-@@ -1110,12 +1116,18 @@ static Image *ReadBMPImage(const ImageInfo *image_info,ExceptionInfo *exception)
-       ThrowReaderException(CorruptImageError,"ImproperImageHeader");
-     if (bmp_info.compression == BI_RLE4)
-       bmp_info.bits_per_pixel<<=1;
--    bytes_per_line=4*((image->columns*bmp_info.bits_per_pixel+31)/32);
--    length=(size_t) bytes_per_line*image->rows;
-+    extent=image->columns*bmp_info.bits_per_pixel;
-+    bytes_per_line=4*((extent+31)/32);
-+    if (BMPOverflowCheck(bytes_per_line,image->rows) != MagickFalse)
-+      ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile");
-+    length=bytes_per_line*image->rows;
-     if ((MagickSizeType) (length/256) > blob_size)
-       ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile");
--    pixel_info=AcquireVirtualMemory(image->rows,
--      MagickMax(bytes_per_line,image->columns+1UL)*sizeof(*pixels));
-+    extent=MagickMax(bytes_per_line,image->columns+1UL);
-+    if ((BMPOverflowCheck(image->rows,extent) != MagickFalse) ||
-+        (BMPOverflowCheck(extent,sizeof(*pixels)) != MagickFalse))
-+      ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
-+    pixel_info=AcquireVirtualMemory(image->rows,extent*sizeof(*pixels));
-     if (pixel_info == (MemoryInfo *) NULL)
-       ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
-     pixels=(unsigned char *) GetVirtualMemoryBlob(pixel_info);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57807.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57807.patch
deleted file mode 100644
index e3476e6c02..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57807.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c3c9b87cfde14c543c98aa2358da8d4e915715fd Mon Sep 17 00:00:00 2001
-From: Cristy <urban-warrior@imagemagick.org>
-Date: Sun, 24 Aug 2025 12:32:18 -0400
-Subject: [PATCH] 
- https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-23hg-53q6-hqfg
-
-CVE: CVE-2025-57807
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/077a417a19a5ea8c85559b602754a5b928eef23e]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- MagickCore/blob.c | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/MagickCore/blob.c b/MagickCore/blob.c
-index d00b0ac57..5ee81a68b 100644
---- a/MagickCore/blob.c
-+++ b/MagickCore/blob.c
-@@ -1630,7 +1630,7 @@ static inline ssize_t WriteBlobStream(Image *image,const size_t length,
-   extent=(MagickSizeType) (blob_info->offset+(MagickOffsetType) length);
-   if (extent >= blob_info->extent)
-     {
--      extent=blob_info->extent+blob_info->quantum+length;
-+      extent+=blob_info->quantum+length;
-       blob_info->quantum<<=1;
-       if (SetBlobExtent(image,extent) == MagickFalse)
-         return(0);
-@@ -5912,12 +5912,15 @@ MagickExport ssize_t WriteBlob(Image *image,const size_t length,
-     }
-     case BlobStream:
-     {
--      if ((blob_info->offset+(MagickOffsetType) length) >=
--          (MagickOffsetType) blob_info->extent)
-+      MagickSizeType
-+        extent;
-+
-+      extent=(MagickSizeType) (blob_info->offset+(MagickOffsetType) length);
-+      if (extent >= blob_info->extent)
-         {
-           if (blob_info->mapped != MagickFalse)
-             return(0);
--          blob_info->extent+=length+blob_info->quantum;
-+          blob_info->extent=extent+blob_info->quantum+length;
-           blob_info->quantum<<=1;
-           blob_info->data=(unsigned char *) ResizeQuantumMemory(
-             blob_info->data,blob_info->extent+1,sizeof(*blob_info->data));
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62171.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62171.patch
deleted file mode 100644
index 6b14a19550..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62171.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 9214d0e007656d5385d51f31b215cc54225aab3c Mon Sep 17 00:00:00 2001
-From: Dirk Lemstra <dirk@lemstra.org>
-Date: Sun, 12 Oct 2025 20:43:14 +0200
-Subject: [PATCH] Added extra check to resolve issue on 32-bit systems
- (https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-9pp9-cfwx-54rm)
-
-CVE: CVE-2025-62171
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/cea1693e2ded51b4cc91c70c54096cbed1691c00]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- coders/bmp.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/coders/bmp.c b/coders/bmp.c
-index 5c75e7f23..7647a0296 100644
---- a/coders/bmp.c
-+++ b/coders/bmp.c
-@@ -1116,6 +1116,8 @@ static Image *ReadBMPImage(const ImageInfo *image_info,ExceptionInfo *exception)
-       ThrowReaderException(CorruptImageError,"ImproperImageHeader");
-     if (bmp_info.compression == BI_RLE4)
-       bmp_info.bits_per_pixel<<=1;
-+    if (BMPOverflowCheck(image->columns,bmp_info.bits_per_pixel) != MagickFalse)
-+      ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
-     extent=image->columns*bmp_info.bits_per_pixel;
-     bytes_per_line=4*((extent+31)/32);
-     if (BMPOverflowCheck(bytes_per_line,image->rows) != MagickFalse)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-65955.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-65955.patch
deleted file mode 100644
index cc88b8ae3b..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-65955.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c798be8690cd314c115c568ee90136e65c53b90b Mon Sep 17 00:00:00 2001
-From: Dirk Lemstra <dirk@lemstra.org>
-Date: Sun, 23 Nov 2025 09:17:29 +0100
-Subject: [PATCH] Correct incorrect free (GHSA-q3hc-j9x5-mp9m)
-
-CVE: CVE-2025-65955
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/6f81eb15f822ad86e8255be75efad6f9762c32f8]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- Magick++/lib/Options.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Magick++/lib/Options.cpp b/Magick++/lib/Options.cpp
-index 5d5724c96..eba417cca 100644
---- a/Magick++/lib/Options.cpp
-+++ b/Magick++/lib/Options.cpp
-@@ -310,7 +310,7 @@ void Magick::Options::fontFamily(const std::string &family_)
- {
-   if (family_.length() == 0)
-     {
--      _drawInfo->family=(char *) RelinquishMagickMemory(_drawInfo->font);
-+      _drawInfo->family=(char *) RelinquishMagickMemory(_drawInfo->family);
-       DestroyString(RemoveImageOption(imageInfo(),"family"));
-     }
-   else
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-66628.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-66628.patch
deleted file mode 100644
index 7894d12ab6..0000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-66628.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3853a72088f6a72fe3d7405655d8f9cbed605e75 Mon Sep 17 00:00:00 2001
-From: Dirk Lemstra <dirk@lemstra.org>
-Date: Tue, 2 Dec 2025 22:49:12 +0100
-Subject: [PATCH] Added extra check to avoid an overflow on 32-bit machines
- (GHSA-6hjr-v6g4-3fm8)
-
-CVE: CVE-2025-66628
-Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/bdae0681ad1e572defe62df85834218f01e6d670]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- coders/tim.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/coders/tim.c b/coders/tim.c
-index 4c094ac5f..fcfd9266f 100644
---- a/coders/tim.c
-+++ b/coders/tim.c
-@@ -231,7 +231,8 @@ static Image *ReadTIMImage(const ImageInfo *image_info,ExceptionInfo *exception)
-     (void) ReadBlobLSBShort(image);
-     width=ReadBlobLSBShort(image);
-     height=ReadBlobLSBShort(image);
--    image_size=2*width*height;
-+    if (HeapOverflowSanityCheckGetSize(2*width,height,&image_size) != MagickFalse)
-+      ThrowReaderException(CorruptImageError,"ImproperImageHeader");
-     if (image_size > GetBlobSize(image))
-       ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile");
-     bytes_per_line=width*2;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
similarity index 94%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
index 40e57b7f1d..6a452c276b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
@@ -4,45 +4,34 @@ HOMEPAGE = "https://www.imagemagick.org/"
 DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
 editing raster and vector image files. It can read and write over 200 image file formats."
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2f9de66264141265b203cde9902819ea \
-                    file://NOTICE;md5=bcbf1f1897b40ec8df39700cb560e9ed"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1f56ade64cf079aff7232f7dbeaea992 \
+                    file://NOTICE;md5=3974428a57d34b981abb7acc416dde8f"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
-BASE_PV := "${PV}"
-PV .= "-47"
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
-           file://CVE-2025-53014.patch \
-           file://CVE-2025-53015.patch \
-           file://CVE-2025-53019.patch \
-           file://CVE-2025-53101.patch \
-           file://CVE-2025-55004.patch \
-           file://CVE-2025-55005.patch \
-           file://CVE-2025-55154.patch \
-           file://CVE-2025-55160.patch \
-           file://CVE-2025-55212.patch \
-           file://CVE-2025-57803.patch \
-           file://CVE-2025-57807.patch \
-           file://CVE-2025-62171.patch \
-           file://CVE-2025-65955.patch \
-           file://CVE-2025-66628.patch \
-           "
-SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
+BASE_PV = "${@d.getVar('PV').split('-')[0]}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
+
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https "
 
 S = "${WORKDIR}/git"
 
+SRCREV = "b5fdb90dac0e6d0bf1bbd95704bbd60216a5bc23"
+
 inherit autotools pkgconfig update-alternatives
-export ac_cv_sys_file_offset_bits="64"
+export ac_cv_sys_file_offset_bits = "64"
 
 EXTRA_OECONF = "--program-prefix= --program-suffix=.im7 --without-perl --enable-largefile"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} cxx webp xml"
 PACKAGECONFIG[cxx] = "--with-magick-plus-plus,--without-magick-plus-plus"
 PACKAGECONFIG[graphviz] = "--with-gvc,--without-gvc,graphviz"
-PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
+PACKAGECONFIG[heic] = "--with-heic,--without-heic,libheif"
+PACKAGECONFIG[jxl] = "--with-jxl,--without-jxl,libjxl"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[openjpeg] = "--with-openjp2,--without-openjp2,openjpeg"
 PACKAGECONFIG[pango] = "--with-pango,--without-pango,pango cairo"
+PACKAGECONFIG[raw] = "--with-raw,--without-raw,libraw"
 PACKAGECONFIG[rsvg] = "--with-rsvg,--without-rsvg,librsvg"
 PACKAGECONFIG[tcmalloc] = "--with-tcmalloc=yes,--with-tcmalloc=no,gperftools"
 PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
@@ -83,7 +72,7 @@ BBCLASSEXTEND = "native nativesdk"
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE:${PN} = "animate compare composite conjure convert display \
-    identify import magick-script mogrify montage stream"
+    identify import magick-script mogrify montage stream magick"
 
 ALTERNATIVE_TARGET[animate] = "${bindir}/animate.im7"
 ALTERNATIVE_TARGET[compare] = "${bindir}/compare.im7"
@@ -97,6 +86,7 @@ ALTERNATIVE_TARGET[magick-script] = "${bindir}/magick-script.im7"
 ALTERNATIVE_TARGET[mogrify] = "${bindir}/mogrify.im7"
 ALTERNATIVE_TARGET[montage] = "${bindir}/montage.im7"
 ALTERNATIVE_TARGET[stream] = "${bindir}/stream.im7"
+ALTERNATIVE_TARGET[magick] = "${bindir}/magick.im7"
 
 ALTERNATIVE:${PN}-doc = "animate.1 compare.1 composite.1 conjure.1 \
     convert.1 display.1 identify.1 import.1 magick-script.1 mogrify.1 montage.1 stream.1"
@@ -125,6 +115,7 @@ ALTERNATIVE_LINK_NAME[montage.1] = "${mandir}/man1/montage.1"
 ALTERNATIVE_TARGET[montage.1] = "${mandir}/man1/montage.im7.1"
 ALTERNATIVE_LINK_NAME[stream.1] = "${mandir}/man1/stream.1"
 ALTERNATIVE_TARGET[stream.1] = "${mandir}/man1/stream.im7.1"
+ALTERNATIVE_LINK_NAME[magick] = "${bindir}/magick"
 
 CVE_STATUS[CVE-2007-1667] = "cpe-incorrect: CVE should not include a CPE for imagemagick"
 CVE_STATUS[CVE-2014-9804] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-- 
2.34.1


