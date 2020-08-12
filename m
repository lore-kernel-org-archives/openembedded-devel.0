Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.1233.1597271991068931806
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q2hN7lyh;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id p24so4002599ejf.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=U8T2Yphuz6LCZ8MOVIA5cy+R4K3kDWYu+Bzmp06hRMg=;
        b=q2hN7lyhDZWK8dlwaEeMGDquj/oZdqMnrpvA+B1DJVOW3q+pRpjzm+v4jY59kt9x4z
         Yj1lEdCfmyXwRvIxT9fd4tSkx/InxVyLG3s9nr4jNpm/0NYa6zTpBQmCmny3kHC8tkqp
         qZmUc1oqTyNKaCMKbEq2lFI8Pa1tmUh0q71Z33mOlQ1lhwASGBkDSde6S7y6vd8N5YbD
         Osyeg52x6jQC/Cto7IsFOL285Ab1jQ+9BbWiWh3XDBjxc5o/EScd2bBVNPaSIIftX4Y9
         /pvTlEDjoS1NVPs6S+hwlgTOJbtahXnWBLi6MOk+VTqpGzMfHTeomxaV5VbgHErR2dgX
         FfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U8T2Yphuz6LCZ8MOVIA5cy+R4K3kDWYu+Bzmp06hRMg=;
        b=k9rPg+WKo/4Ven3VmLE4DhyrZj/JmReI622EmCcGzgO/jt2k7Gs/L36NKLW34cEr1a
         DWtmBslx6W3raFrfx/ymN8lJlk9fm+0fprgVJ+H/9184a1pB6zOUXQ581FwKoPM7H+lp
         V+YXvyWCX3OCjPaNZZl/MWuany5dyuVdGwjIlxtNkeO3dvaThZrcep6ytc4Hw+vWcGBZ
         m38kNv2tlCM4mWnxa7RjqlP7DwNwZO1TVUzIoqWz02DbPFYO+VGNpTfuFGAv/6JZ+82j
         +YrD5ROvnguxhaxCUdXNGddJW9lGJcNZXhjPONja/A2HD42AZfhlyTvaiDeVd67PkfBI
         ewpw==
X-Gm-Message-State: AOAM531mArsXlFGLg6Cpcy4hncvbuJSUxWDk8vYitIbTOJX+KU5DdsJw
	U8t3c0UCYeyHkzH7Wu3aDM3CPSj2
X-Google-Smtp-Source: ABdhPJxqZ6YXlHHcWD6mcz/fI2sRE5pufDJNdvsUr7ACh0sy0yA9MwvRfjTzpmXeXpRB2USJkzwOBA==
X-Received: by 2002:a17:906:228a:: with SMTP id p10mr1998625eja.23.1597271989279;
        Wed, 12 Aug 2020 15:39:49 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f147e04a6500bbf92bdd781.dip0.t-ipconnect.de. [2003:f0:7f14:7e04:a650:bbf:92bd:d781])
        by smtp.gmail.com with ESMTPSA id ci27sm2569208ejc.23.2020.08.12.15.39.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:39:48 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 8/8] poppler: upgrade 0.90.1 -> 20.08.0
Date: Thu, 13 Aug 2020 00:39:33 +0200
Message-Id: <20200812223933.1119785-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812223933.1119785-1-schnitzeltony@gmail.com>
References: <20200812223933.1119785-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Looks like they changed release schema.

Release 20.08.0:
core:
 * Sub-page objects: initialize clip max values considering the render resolution. Issue #937
 * Splash: Set initial line width to 1. Issue #674
 * Fix stack overflow with specially crafted files
 * GfxShading: Simplify holding the Function
 * Splash: Fix x86 + windows asm build

qt5:
 * Deprecate Document::toc
 * Deprecate AnnotationUtils

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_0.90.1.bb => poppler_20.08.0.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.90.1.bb => poppler_20.08.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.90.1.bb b/meta-oe/recipes-support/poppler/poppler_20.08.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.90.1.bb
rename to meta-oe/recipes-support/poppler/poppler_20.08.0.bb
index bb5a782ae..c3f9716ef 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.90.1.bb
+++ b/meta-oe/recipes-support/poppler/poppler_20.08.0.bb
@@ -7,8 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "b80a82f14459d31d929db421b0e8cf05"
-SRC_URI[sha256sum] = "984d82e72e91418d280885298c8bdc855a2fd92665fd52a1345b27235e0c71c4"
+SRC_URI[sha256sum] = "ae65fef04bbf63259a6352e7b620719115d4fb97f5079b0b8b00a8eb0c86eca5"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.26.2

