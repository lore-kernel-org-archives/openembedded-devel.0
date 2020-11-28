Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.36805.1606592840396661870
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PFaf3Lm0;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id l17so7044967pgk.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hexpR1dCd7Nu5OllArPq1sCs0W1c2UoTiEppNwElhF4=;
        b=PFaf3Lm0/codQYXYxGvDszMoLQI2CBtPbGL6bd8xQHb4EkVlU/l+FlNEA9IS5snBR1
         4vzalLJlP79pzTkRWgqX5WATwArKRJBYbzDYpb+as24X3ZyzDX+21VfeGXgSIHZO6Yr9
         SSLlW5wvJzgm5bSsz63hoH+6a0BIQEokLrA4pfuHs9abRbP0ABLna6TSRbt38vp5ZP8r
         lH6MUwazcaVeJUbiuD4uGTup74Xyzr7i95mPN7vRyhUkv5itd/b81U+odwZl2YM1tPrr
         N8++A28sA7pIBync76JWuNec/9bsrw8GuGLgYDD6Nhorbq0y3yJpDE23qenD4qyzbhxe
         Ju/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hexpR1dCd7Nu5OllArPq1sCs0W1c2UoTiEppNwElhF4=;
        b=GAw9Hdk10DMEEmxSMkLUMNQsG6nbzXsB1XReXXwdnVhU9MqHbauqOkDFo1NxTpwA87
         qojyii4hKmZzK0ENN4PXqlY59ffroMXWbMrBLVR3Nb9sRJRYNtTOsDYFPmdJO13AKLVw
         0kt0F6Eez7vu2p8Yod12cTsbFxn0lGAaFeniu8co5b59zlmQtatQ5NEqtxfIBiNCmzWl
         a7Cu82rCNENY2G5Lf2J9eCeMm0w4O0IugxsjkgmDSxEh+XsnXFZyKXUyyn5ghGgZWRbV
         D88cQbXrg80cPFD2aJiwpyAaSkyT0W0O4s8D3bfnnjx6Qx0RgwUChE/E9RkcrHsBLs3/
         NUJA==
X-Gm-Message-State: AOAM5304sy93t6y3/rwrkZlJgsamUFXfdKcFvL9+vIvcNtB7kqOljDiA
	2PDRalp/2PX22/HJ+w3r2LnGuLYFeCv2jw==
X-Google-Smtp-Source: ABdhPJxe6pGIQOn4ny0gf76/0yk2pgH305+yyh1DWvFvsFq0rfeces4MfpinQGjeiHtnt0xKU5x92Q==
X-Received: by 2002:a17:90a:bc83:: with SMTP id x3mr17788783pjr.90.1606592839733;
        Sat, 28 Nov 2020 11:47:19 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:19 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 02/16] python3-attrs: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:42 -0800
Message-Id: <59b5a3ab900d3864ab071bc6826b2abb26e87612.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-attrs_20.3.0.bb            | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
deleted file mode 100644
index 55cfda7180..0000000000
--- a/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Classes Without Boilerplate"
-HOMEPAGE = "http://www.attrs.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
-
-SRC_URI[sha256sum] = "832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700"
-SRC_URI[md5sum] = "4fe38f89297b2b446d83190fce189f29"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-ctypes \
-"
-RDEPENDS_${PN}_class-nativesdk += " \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-ctypes \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

