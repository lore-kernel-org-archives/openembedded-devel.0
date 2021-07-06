Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.7383.1625583204278214390
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JxZhjGQQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id v13so12158221ple.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ce6MbISIw2asOvJVeRnQ7uR/8tB/DpCDzKjKXPPiW9E=;
        b=JxZhjGQQiIebkygLtRDKRbqVbPNBMVqY5r+l+fCqweYJToj39ReuRIBAESCh3SW6tx
         oUNqYJLd7uXWo/JF0YMcvEr/uB2nJtipPOSv6hhD1jZ2t52SFm2LqfcboNTHkL2IjEuN
         K0TK341kKb/T0Q8X3DXl1n9kSyK3kDkE2GP20KIxY1KaUHN8KbCAX5r3M8TE5T4g41vb
         i8JoHtxLZQWUM0f3+NL6o+q71CfU66GtA55OZlXAuvTa57l0HtjODCV4X9lOVuNGb+3i
         ndsK43kCfAUDCvhiwb2Q7JQncwBX7Kw0WsmWnShOzTOyvOgzvtlNKEZEJIcXsmVWj92r
         q5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ce6MbISIw2asOvJVeRnQ7uR/8tB/DpCDzKjKXPPiW9E=;
        b=eP9+LiwfI6UJhBMN6k/3dYNJV3hcBYu1OGx6tL5vRrr6PSVlj991EFc6LhqCf5XLP7
         iWnKvPDtKY3EQpkqQYo5SeRN09xKIc4NjdfpT8Tp8a+hjpoXaHrrFzbnkpdyHBCNh/ZG
         LsMrIjAjO/mZN38Xqfggrgy0xuonb/Uyn4QMcPeW9ncbdz6uM0Nv7sRz0o0bK6JQ+S0S
         Hlha+whOicQlgiDw1VcNJYKqA/aEjgLipwZ0mVRPZRZMmEzyC7YrefnA1pqL4AEI+w+h
         KFE/qItFCv2N6Z2U/BKbMBjJdMwdDtSV/iHBhN13P/5CXNEo+LMmPxxvXLlnPOcnNRG7
         gnkA==
X-Gm-Message-State: AOAM532zKOaNIpphsKal7eF1/QHrbUaQl6UkmFX0TCNHbKvGiHiqAGzF
	h8QYeCVLtv4NU1hVsPdb5/FPMnfMTJBIHg==
X-Google-Smtp-Source: ABdhPJzOz46jKYmN7xA7jQTX06Hr7Z11a7fAaBSzX9PdvEOfg09Xci5fVudxF2/uarl8Q7T3deMHRg==
X-Received: by 2002:a17:902:e5d0:b029:129:b045:ffb with SMTP id u16-20020a170902e5d0b0290129b0450ffbmr2509726plf.41.1625583203757;
        Tue, 06 Jul 2021 07:53:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-X13-Gen-1.hsd1.ca.comcast.net ([2601:202:4180:a5c0:234d:f3c6:164b:2950])
        by smtp.gmail.com with ESMTPSA id b22sm6504809pfi.181.2021.07.06.07.53.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 07:53:23 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/11] python3-django: upgrade 2.2.20 -> 2.2.22
Date: Tue,  6 Jul 2021 07:53:11 -0700
Message-Id: <732b073b99d94acce6bb7112f1223b842b72752e.1625583100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625583100.git.akuster808@gmail.com>
References: <cover.1625583100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Version 2.2.22 includes a fix for CVE-2021-32052.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit b26099fc156961ba252c3b6281f09799e91347ba)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit f3758cb44486ce87c96b803efb2b5417a8e90708)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-django_2.2.20.bb => python3-django_2.2.22.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.20.bb => python3-django_2.2.22.bb} (41%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.20.bb b/meta-python/recipes-devtools/python/python3-django_2.2.22.bb
similarity index 41%
rename from meta-python/recipes-devtools/python/python3-django_2.2.20.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.22.bb
index 905d022a4f..a0b8840259 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.22.bb
@@ -1,8 +1,8 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[md5sum] = "947060d96ccc0a05e8049d839e541b25"
-SRC_URI[sha256sum] = "2569f9dc5f8e458a5e988b03d6b7a02bda59b006d6782f4ea0fd590ed7336a64"
+SRC_URI[md5sum] = "dca447b605dcabd924ac7ba17680cf73"
+SRC_URI[sha256sum] = "db2214db1c99017cbd971e58824e6f424375154fe358afc30e976f5b99fc6060"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1

