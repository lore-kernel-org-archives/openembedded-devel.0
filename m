Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A4DC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:24:35 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web12.16362.1666592671056095855
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=csPtKVyA;
 spf=pass (domain: underview.tech, ip: 209.85.167.169, mailfrom: vince@underview.tech)
Received: by mail-oi1-f169.google.com with SMTP id o64so9853801oib.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Oct 2022 23:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ChLC1wcs4nxnFrewZHu+e97Rmlh7LkK5QqwV6g8reJo=;
        b=csPtKVyAPvUM50I/xP9z/APDQE/9xsL1LY2W1asZ1DzGR0IgKBPvbGW3gPU681IJ7M
         FTgkYAF3tiv11N8xraP3sKjk46maNNqlHnm3wFGXO4XOcdCwkMC198XgM457czFsEDyA
         FCpD+q5ryjRcIGY8JFK/9+hyT/Wr9818gGwaozFDB8fuKOQi5cIPSy8GeH+32lU+VEcC
         EUIWvR2kkM/FqRptVmO7O1cpQYvH/Wkz+Ge5sxRCPCSQSdy0gbCRGbv0MN4hxq7Hrn7I
         jaIx5j3G0aC+bDMiF+fNIQUTZyEQMkPaHWxJhaHvUkWd+6hVFSwce8DnEDKp0RmRYkQB
         3DPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChLC1wcs4nxnFrewZHu+e97Rmlh7LkK5QqwV6g8reJo=;
        b=3f9cGg7/Uj7TYVSagqUxUpZivOh9NkpYjW8edX/9RxXDM70R/IywiMqMOLy4dhKopZ
         ldH+5+ii845xfX6FaDiRJcnR0NPIfW/3PqmLA4VrFXc/cm6cLYPSGrSeHjNXjAN6fVST
         cJF1H6/9ltEMgGRwoU/DV/hr5OIvUTnydFUCQljZx2JCUMv6SFzg1xhDVjOtTWJ9OYJA
         K0ssh5aVVLl3zamS0qtdZI2LW5rNsiqU27xutgoEkhlnjIVL8dGMjwdukOfzl+O7eKKB
         JxXclegU3zH89LbEf0GBteAjs4jgjtk+TXKOAqHHgjLpqfrW1AVZYYm+qhergaKSN1ZV
         gX7g==
X-Gm-Message-State: ACrzQf1Es6jzvukOMo9C2Pgdb6x1U9SHbHEom9ePVSvRunmZKwUVgp81
	CTgG3Fgq3zcm1sJKG9XPC66kGfOOPDsgB9L4cys=
X-Google-Smtp-Source: AMsMyM45Lyx+ktEuF3kyLmYYfy89Thz0Hlvl5b54zuf4PV5JTXnRNquMpHwRH88v5xCmf4AaM8KRNw==
X-Received: by 2002:a05:6808:1b24:b0:355:4ca1:f66c with SMTP id bx36-20020a0568081b2400b003554ca1f66cmr16250594oib.37.1666592670028;
        Sun, 23 Oct 2022 23:24:30 -0700 (PDT)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id f80-20020a4a5853000000b0044afc1ba91asm11466751oob.44.2022.10.23.23.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 23:24:29 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-devel@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [meta-oe][PATCH] libglvnd: add new recipe libglvnd v1.5.0
Date: Mon, 24 Oct 2022 01:22:28 -0500
Message-Id: <20221024062228.323407-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99269

This recipe is meant to be an optional dependency of mesa.
This recipe will allow for glvnd support in mesa. Thus,
giving access to the GLX window-system API library and
related libraries, mesa will build libGLX_mesa.so.*.*
and libEGL_mesa.so.*.* or whatever specified in
-Dglvnd-vendor-name. There may be applications that require
direct access to the GLX window-system API library in order
to build/execute. This will allow for multiple layers to
have generic support for libraries in libglvnd
(GLX window-system API library, etc...) without needing to
implement their own version of the libglvnd recipe.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../libglvnd/libglvnd_1.5.0.bb                | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libglvnd/libglvnd_1.5.0.bb

diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.5.0.bb b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.5.0.bb
new file mode 100644
index 000000000..b92bad46e
--- /dev/null
+++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.5.0.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "libglvnd is a vendor-neutral dispatch layer for arbitrating \
+OpenGL API calls between multiple vendors."
+HOMEPAGE = "https://gitlab.freedesktop.org/glvnd/libglvnd"
+LICENSE = "MIT & BSD-1-Clause & BSD-3-Clause & GPL-3.0-with-autoconf-exception"
+LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efeb08e8c4"
+
+SRC_URI = "git://git@gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
+
+# v1.5.0 tag
+SRCREV = "c7cdf0cc4395b57563294d1f340b6bb1b95366a0"
+
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+inherit meson pkgconfig features_check
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ?= "\
+  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2', '', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)} \
+  "
+
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,libx11 libxext xorgproto"
+PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,libx11 libxext xorgproto"
+PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,"
+PACKAGECONFIG[gles1] = "-Dgles1=true,-Dgles1=false,"
+PACKAGECONFIG[gles2] = "-Dgles2=true,-Dgles2=false,"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


