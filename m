Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.18207.1590941817923774316
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vPvnkUw4;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id x207so409846pfc.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8iZmQ86EpGrUkmL2ZDhDzjHVmigdzpWq+j5woc3hEt4=;
        b=vPvnkUw4YOxyHBkWSZyTAkktMGMYtFEhFntFFAH9BVUmG2nVdXXGf+PDp2y8shW6/N
         dmvYUA7PrmrC40r8qV1GtnBEqwgRsiBwdrsZ+KfHPodqEjY/IwZXT8QTAcAbWPxRAvG2
         SM9HEju6Ab8Aizr14olewX1N3obrRgca7mTaW2JlmXcfvOQ7LQXpcHlhbhGG8jgwfPas
         QGAqYU1WMUK+kOzCG3laoyKJ+uDv2Td3Bc55S3pASq1cyp4KTJHkwqavgk5bqxxzp8Km
         AUMnQxUF7EHo0wofENToOinxVHqYuKKVWjSCsNGapd6k5Tu3ywr1QxMLfMsh3b3Z7U34
         KY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8iZmQ86EpGrUkmL2ZDhDzjHVmigdzpWq+j5woc3hEt4=;
        b=iaVXntG0cs3dFKBOmZAG3bhindExqWJdYJG+NdsgKhhvY/U8l1kpNNV9OR3aK/s7TU
         J2Sxwv4PSAEMAXF6/eigTGLaa9XFd8YTJiQRfonvLLCZqOAQkOGKhVH7b9Y4s+5QVEEt
         yk5JuHijZPhoP5W8fr6leNUXA53koE8FPAvXJ2BCG/rQEDIrJRUjcGWWYvAvmnPhq1zi
         qHziYKS+AhrfwjAgwPAK8qQXnO3ZCsX2hD18eJJmd4YbeNOg+8i7+jBG3Ap5PFl0Vsuf
         kOkKtUHCHOaEeOcCPkLn1J3ft2l2QpyYVivovI4ExvlUy2aqqcfTCKaWeh9HQUYx1Gqo
         YTGA==
X-Gm-Message-State: AOAM532FWsfdToy10MTfw+fqjqjBgdC9QdbdYAGEEZqU8fMVS1wvvR63
	O9/fijTe1TKGKG2XeVNbtpTfJgMD
X-Google-Smtp-Source: ABdhPJyH5ARtusMLk1yVtwD02fsPbWdGSNt8ZpXiW2tCYLhdOV+Ysz1PBeB+PoziwqYlcuJWTp1mNw==
X-Received: by 2002:a63:cf03:: with SMTP id j3mr15798897pgg.24.1590941817148;
        Sun, 31 May 2020 09:16:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:56 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 27/35] python3-openpyxl: Upgrade 2.6.3 -> 3.0.3
Date: Sun, 31 May 2020 09:16:14 -0700
Message-Id: <25ec75c173c9569565a68d2f11bae79267863290.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.0.3.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dfd24cb9ca407b69f527ee551a0ffd0122e6b3ae)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{python3-openpyxl_2.6.3.bb => python3-openpyxl_3.0.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_2.6.3.bb => python3-openpyxl_3.0.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
index 87cb46ea9e..018c4abe28 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
@@ -5,11 +5,11 @@ was initially based on PHPExcel."
 
 HOMEPAGE = "http://www.python-excel.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3baf26d8abf08632beaf913ea973cb8a"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a6e506457afab4a25ecbaeb4bc3ed623"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "b067750e51f17a1a9cc6bacfdd668218"
-SRC_URI[sha256sum] = "72d1ed243972cad0b3c236230083cac00d9c72804e64a2ae93d7901aec1a8f1c"
+SRC_URI[md5sum] = "9583cea56b9d4441d96eb63a8a5c92a4"
+SRC_URI[sha256sum] = "547a9fc6aafcf44abe358b89ed4438d077e9d92e4f182c87e2dc294186dc4b64"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
-- 
2.17.1

