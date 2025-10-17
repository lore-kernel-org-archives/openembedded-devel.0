Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8481CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 15:51:31 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.19594.1760716284681826967
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 08:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HnD3PeuU;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-427007b1fe5so1239401f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760716283; x=1761321083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjAb5gMxBzZ+fBRO1ZY3Sk6DvUdHLuyuBexJXLmliZY=;
        b=HnD3PeuU1a9c3tTEQUmkYL5tUVyoLfkgp1C7HPNArDCqV9vCiozIBnqEcK2u2FnyqB
         y/FdJlEZ0EHzmK9I/8YQpmO2hFW40NEz5DzZ1vm+3e23eySVi2gQdf1S+b3qHSsF8nf0
         xVzOVjHu75hBdTKHQgQ+WOxtItnn8Gwg8eBZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760716283; x=1761321083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjAb5gMxBzZ+fBRO1ZY3Sk6DvUdHLuyuBexJXLmliZY=;
        b=Jgxd2y3HWkhDNkydVJAsttD+5vTBoEw7bBqfwMBL419HY+Vabf0FUG8jkYAQMrJE5B
         CcqFraJSM3CYi9l3XSolZDPEE4Fho5hy+gBT+N6Fnng0CFqJ0wjLA+amBraCiZj+5kXA
         yQmwQeifxBHJ0gSe2+k+fPxIAkUvQfN9w8P10+62owMjELAO1iv+lS5HteBpDe9Rx9JY
         9LM1NLhq/nrAoUvPvJoAYxAB2NRFhTOfMRFdBHuJ6QjzEspcywbdgOXdeSxxetH5cLTZ
         IKC/E7htmLq4l7By6Ax33pMnie58mTE300pEog9dSgclCoITzCZNJuwdyToHoFy8uaBP
         HeaQ==
X-Gm-Message-State: AOJu0Ywp1nAqgjGwE0ZCFsIUsLq8sKMskhf/8VD5XEya5CNqAufWOGoK
	qZHBXOKWTYi0bksiTF25u0/s7IPWvhRWmgttwnU2zVQuyWRGCvRAckMYKcaFN1oZpm1IzHqaKPb
	cOxwom1hp1b+i
X-Gm-Gg: ASbGncsvM/7NsfjfjBqntO9FVgQVBNEApXKZs+dowaR8P5Zohy0ftd+Xy/wvfnW5vFp
	iCIsQtgjIAiwDGiKrIMFByLBujxZA/Wmzu1Fz+fMgPPeTi+ejai++TLehWnUlnpivH5cgiEalKE
	MfwKvSX5iuVa8eQE79qxSnuW/pEL1kcPe4mbJ9YotEjzU1xFKAUB81c/P3rgtiJx6ZrrW+vfG2L
	qiS8FgQCmA/Koa4lGKTuPI4dXvUJ7pPMoq1I+hqz2kqFtde0RmKeH/ysQdBZl0r3U2YxHXuFFIw
	+V4E/oiJJuybH5ekXvK9oqMcDKtYQ5vE07fA4UaWaax7DueyMS0l1zuJBD1AsBTtl3mfrTId30k
	bvHb+fRGoVRRL4qmwbZ5qBjl/MX50U/Q+moWNCxPkRIKqUJu22gi23lpqGmr26dif942hmpzwTV
	XQYIF43w==
X-Google-Smtp-Source: AGHT+IEf83HmzrsuW/285i4SV/NMmdkx2topj1qfc3/LMXNXR0O4xNTJn8P9qaljUJdM6XDPjnGBDg==
X-Received: by 2002:a5d:64c3:0:b0:426:dbef:9abf with SMTP id ffacd0b85a97d-42704d8e0b2mr3084678f8f.23.1760716282978;
        Fri, 17 Oct 2025 08:51:22 -0700 (PDT)
Received: from heaven.. ([2a01:e0a:25d:d2b0:d59a:9e09:f40:c107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583664sm41568914f8f.22.2025.10.17.08.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:51:22 -0700 (PDT)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: pkj@axis.com,
	Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v3] opencv: limit features in native
Date: Fri, 17 Oct 2025 17:50:47 +0200
Message-ID: <20251017155047.1122714-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 15:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120768

Since commit 91e428d4cd5a ("opencv: Support building for native"),
opencv can be built on a native target. However, not all of their
PACKAGECONFIG dependencies (ade, libgphoto2, ffmpeg, gstreamer1.0 and
gstreamer1.0-plugins-base) can be built in this context due to the
missing native BBCLASSEXTEND.

These recipes would need to be extended for native build, but specific
work is required to ensure they work properly. To make opencv-native work
for now, remove the above features for the native build.

Effectively, PACKAGECONFIG for native is target minus gapi, gstreamer,
gphoto2 and libav.

Fixes this warning from AB[0]:
WARNING: Nothing PROVIDES 'gstreamer1.0-plugins-base-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'ffmpeg-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'libgphoto2-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'gstreamer1.0-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'ade-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing RPROVIDES 'opencv-dev-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'opencv-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb RDEPENDS on or otherwise requires it)
[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/469/steps/13/logs/warnings

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
changes in v3:
- update commit text according to the v2 implementation

changes in v2:
- change implementation to a more commonly written one
---
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index 27499caa92..aa11d3da43 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -86,8 +86,9 @@ LDFLAGS:append:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 
 EXTRA_OECMAKE:append:x86 = " -DX86=ON"
 
-PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
-    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)} \
+PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l samples tbb \
+    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+PACKAGECONFIG:append:class-target = " gapi gstreamer gphoto2 \
     ${@bb.utils.contains_any("LICENSE_FLAGS_ACCEPTED", "commercial_ffmpeg commercial", "libav", "", d)}"
 
 # TBB does not build for powerpc so disable that package config
-- 
2.49.0


