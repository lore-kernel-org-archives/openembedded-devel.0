Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.5996.1620477765641279121
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 05:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gln2Ic+W;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id l10-20020a17090a850ab0290155b06f6267so6925345pjn.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kwdf8LcJYWF/GtnIbjLeQhj+eLR07DMmkzofuba3yc4=;
        b=gln2Ic+WvWuUzaybbPku4bmcuL0DT3GieCbGcxwdH7z78dztaHJVDshcHXd5UnLJ5r
         EseLU7u7AqTmLPxVO2hFxtohgl0mXNlsTaSkkAWtgoqQC84IzY2Zy9IKS9sVZz5uzRwu
         KPMW36mwMGj3HZ6uDYr1wHpzTL7JpXmxpLFVxz/h5j3ehZ5/guFstQ31IrQh0gnruUB3
         0iVF9uup0NqMfrzqCPls5tA68RxCY5d9ZLHstLSUm+RRGedWZ4g3FO+Fj2cMTNKQnMGs
         luaQgIofOke1DB8jbXNeBnq6DB5tfj7iSb3tW6rbsZpO+HHEw58dnzbcMW36e6i+edEB
         kNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kwdf8LcJYWF/GtnIbjLeQhj+eLR07DMmkzofuba3yc4=;
        b=HbTS6o70//hIZgMTxkdy60M1BD+w5cyLfS0Kzdkiilq0QBy+vLDPiJbFmDn2NiCdWj
         4751Fq+5EASJede8lTUD9/GWt1bv/YF8SXsXnAAkTmNZbtThC97NHGO1cqrgIRTkjHCU
         7znGILCSmWWdZ/xOqBEPQ/gBv1GWrmtZS3OSrsKwVFhe73AI5NgXjOWTmHXxuLCH2tgJ
         C8sO1aIkK15qJmmps9kJADOzxThzlCyqz0Yh72j0aUEkC+Iu9nKq4UCEXKbl0uAWE6FW
         Y4ZRZY83MonSh6lanGzQINSKoDREatikn0T40A3qcg954pKsQt98dRHK6TkJ8lBcTsX7
         VdmQ==
X-Gm-Message-State: AOAM533XI/CEwEAUnawtai5LeluTjTop6OY+B3CygXBzkqB1S2sXzEww
	29JeU7rL8048Ak+qH/vKB33TnfK0lqtFiA==
X-Google-Smtp-Source: ABdhPJzL7hbzkhgPdGEZaqEPMwPMswQEPdz2E4VfsecIPln7RevbuKLCRM5zGlVm065UfZazWo7DhA==
X-Received: by 2002:a17:90b:3b92:: with SMTP id pc18mr5117823pjb.218.1620477764931;
        Sat, 08 May 2021 05:42:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id e5sm7081265pgj.91.2021.05.08.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:42:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-lazy-object-proxy: Add missing dep on pip
Date: Sat,  8 May 2021 05:42:41 -0700
Message-Id: <20210508124241.1186378-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
TOPDIR/build/tmp/work/riscv64-yoe-linux/python3-lazy-object-proxy/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: No module named pip

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-lazy-object-proxy_1.6.0.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.6.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.6.0.bb
index 700c70e53f..60eb2a62be 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.6.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-pip-native"
 
 SRC_URI[sha256sum] = "489000d368377571c6f982fba6497f2aa13c6d1facc40660963da62f5c379726"
 
-- 
2.31.1

