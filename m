Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.57475.1597711884485697474
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 17:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mOoUhwEK;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id 189so8296261pgg.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 17:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g29c3kfe6wqgGNZkcvCkELjpqHKhuWgkJJ/NC7JGPsI=;
        b=mOoUhwEKbOk5hCTbHSKFaUfags8hIDUpFZInjTyxP59W8Bxf5Eet2LcL+CF9xSoADU
         ZHidh0QKgauDW4KCK+tmx/wCltx+Z90mzcNHXrFmLgqgX+j2+Ql1l6zm9F4bEtEf4bZF
         0EiYg5wfcO/+SfDB1olr9nmD5nagqXlWrJM35viXRNy6uZoX+AI6kHFY0tmxGQZ1F6DN
         2fVl9R4uVXfH3UwOLFtxoksdUjZvswl4BfUqKQJW9eAcfPFw++pQZP9I7g2Gdf4Rx+Bc
         eaCY3+HeeWGquafqSeLtiRKG9+4KWVe7R2lPRj8btImDzfHOJ01AeIwT+4inKlAWnN+c
         pspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g29c3kfe6wqgGNZkcvCkELjpqHKhuWgkJJ/NC7JGPsI=;
        b=XZ1sMOxVi0Ugty7mVvrtqYb+3OC/9tY+ozEAzrJ+ZjEaL6SNY0N84wfrJUXXAYIkb4
         9EtMeME/Ar2L/UXYZIgC2v6yekAw4AhjiULrO6pZ2EWOkYUKm5ZQQoge7HilK8+jEWRG
         Zr7+VPGkhqlZ+UaK+r5Hp/W6zNblcYlVowZHozbgesOouIXfBZ2JXM9fDxiEYY9lmI0w
         ECyHpUU9bgJ197mmfaJM7+o1tq5ULp2OW8jLGBPYEQGpQSlxBfdDEvqZbn2/XGc62+HO
         FlsMrlwwTu21IfBMQH74lU1stCYqNITTaLprg+JpRX43ZAY35xQMQzOpDIF2TGGC/fhL
         VNAQ==
X-Gm-Message-State: AOAM530T1IVYX2h8LLSxwTtXgf3Qh9Fd1psf5hbo2bUrCc+6CKf6IFSp
	AKyStzJS2ik41tcgcxejM+q9yXOKae1TFw==
X-Google-Smtp-Source: ABdhPJz2dggd2iB0TPWEJKW85WnMui+eLjov3/YCnMBfony+b38yqChdUmNOx5imMP0a+QAzfyOtAA==
X-Received: by 2002:a63:5a1e:: with SMTP id o30mr11732223pgb.62.1597711883489;
        Mon, 17 Aug 2020 17:51:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id o16sm23452313pfu.188.2020.08.17.17.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 17:51:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] directfb: Disable dtor-typedef warning with clang11
Date: Mon, 17 Aug 2020 17:51:21 -0700
Message-Id: <20200818005121.3884853-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes build
src/core/Renderer.cpp:2021:21: error: destructor cannot be declared using a typedef 'DirectFB::Renderer::Throttle' (aka 'DirectFB::Throttle') of the class name [-Wdtor-typedef]
Renderer::Throttle::~Throttle()
                    ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/directfb/directfb.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index 65fd89e6fe..f7dc668433 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -28,6 +28,8 @@ S = "${WORKDIR}/DirectFB-${PV}"
 
 LDFLAGS_append = " -lm"
 
+CXXFLAGS_append_toolchain-clang = " -Wno-error=dtor-typedef"
+
 # Workaround for linking issues seen with armv7a + gold
 LDFLAGS_append_arm = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-- 
2.28.0

