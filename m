Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.10713.1593562045700990498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZWYh7xkf;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id b92so10230245pjc.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Q5w9bL+/y3A/s+jSKRaYbBRdHL6lB+OIeP3dPUeG3L4=;
        b=ZWYh7xkf5CW1w5m4mFPDrK4nEaessfV87sM1wKu+zMCpPepefxlXqpM8EzQZNxRJ2X
         XeVIKag2FyqOfIj+TCODwKbhND6AlbDOg3WeTFJYNIKeHj2CD/51adVgNbVI06yZxrDj
         JGxsajwF/GDysleMUFmBNEByR11HYG8nW/jJFJndnDCC4KwxgTKP3LGeAv8SdUbHZpq2
         2dRRpbGQjEwoKt59BfuJLNK2qYBPkqki4YlrTvhoqgVSFZtIM/XkDKL9UiD3o1N0hFof
         aDWTvRPxVoTROhkLE3xmDx1pXReZeA/8Ql+PnkTjtvNlRaSbwm7ZeAfHc+u6aeGh1i4w
         8I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Q5w9bL+/y3A/s+jSKRaYbBRdHL6lB+OIeP3dPUeG3L4=;
        b=F1X8IAdSr2WmnFQPJpK+7WxU5+5EgyKXSlldGtpv1441ojVnqFuMLkYwJXl+UH1y3d
         n9Ui/0Scc3lUomrWQtF4DKS3frVZ8c5m0SwZ53Lbd0WSZY5eVYQkxBqwYCnZz2/OaiaF
         3P7J7Yd1dxdMRBWwHvSCvWn5WanORjp0Z1l1j+QooWWHsFPUTCy/YAFZRQzzwYweIoJp
         rwhtZeUo2cVomwqFizBJPj9AFWxXnzTBSGX5ztIl1S/yqCniKutpVuW+JIFPpzdt3Mz0
         IY9ry/U1l4Fd00mbGcOFZTNCk2wRIeJ87Pvg9w8YCQP9SxOzko7CV5HjV7fYMyDKz4Ty
         2QmQ==
X-Gm-Message-State: AOAM531cx1xjc/NUM1MQ1XPhY8HWgT95Y/wWfBf4io+zaqozlzsshNuv
	NYruWqjxzYzdJ9zgyEkH97jedIsi6P4=
X-Google-Smtp-Source: ABdhPJwqjnhZMgvVkC0O0rEPXJM+RZqAuN6L3PP/i8XyEwpKlagGhDBlPZz+m6R/Gd+x4dWqBGlYeQ==
X-Received: by 2002:a17:90a:ce96:: with SMTP id g22mr4781068pju.9.1593562045004;
        Tue, 30 Jun 2020 17:07:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:24 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 02/32] uriparser: upgrade 0.9.3 -> 0.9.4
Date: Tue, 30 Jun 2020 17:06:47 -0700
Message-Id: <3476f601bef7d2dd3c3d73f81a7addc7a39113ab.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

License-Update: copyright years updated

Changelog:

2020-05-31 -- 0.9.4

  * Fixed: testrunner: No longer crashes when compiled with NDEBUG (GitHub #67)
  * Fixed: CMake: Support GTest 1.8.0 (GitHub #68)
      Thanks to Ryan Schmidt for the related report!
  * Fixed: CMake: Use variable GTEST_INCLUDE_DIRS (with plural "S") rather than
      GTEST_INCLUDE_DIR (GitHub #79, #81)
      Thanks to Wouter Beek for the related report!
  * Improved: CMake: Send config summary to stdout, not stderr (GitHub #72)
      Thanks to Scott Donelan for the patch!
  * Improved: Make -DURIPARSER_BUILD_TESTS=OFF unlock compilation without
      a C++ compiler; thanks to Fabrice Fontaine for the patch! (GitHub #69)
  * Added: Functions to make UriUri[AW] instances independent of the original
      URI string (GitHub #77 and #78)
      New functions:
        uriMakeOwner[AW]
        uriMakeOwnerMm[AW]
  * Added: CMake option URIPARSER_ENABLE_INSTALL to toggle installation of
      files, defaults to "ON" (GitHub #74, #75)
      Thanks to Scott Donelan for the patch!
  * Soname: 1:26:0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 27adb9336cda4eea9fcd2e881807756f6d53eae0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../uriparser/{uriparser_0.9.3.bb => uriparser_0.9.4.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.3.bb => uriparser_0.9.4.bb} (64%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.9.3.bb b/meta-oe/recipes-support/uriparser/uriparser_0.9.4.bb
similarity index 64%
rename from meta-oe/recipes-support/uriparser/uriparser_0.9.3.bb
rename to meta-oe/recipes-support/uriparser/uriparser_0.9.4.bb
index da52bb5a36..d02cf5de8e 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.9.3.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.9.4.bb
@@ -2,11 +2,10 @@ SUMMARY = "RFC 3986 compliant URI parsing library"
 HOMEPAGE = "https://uriparser.github.io"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fc3bbde670fc6e95392a0e23bf57bda0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[md5sum] = "9874b64f6f4ff656f3f69598e38f12b7"
-SRC_URI[sha256sum] = "6cef39d6eaf1a48504ee0264ce85f078758057dafb1edd0a898183b55ff76014"
+SRC_URI[sha256sum] = "095e8a358a9ccbbef9d1f10d40495ca0fcb3d4490a948ba6449b213a66e08ef0"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.17.1

