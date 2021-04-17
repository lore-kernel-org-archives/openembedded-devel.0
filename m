Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.3585.1618693584942173558
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FyQwpgHi;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id a12so20619933pfc.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Av59SSlfWgSmQumRF6UiodSGeGi3BdZRrUHHlS5f6ys=;
        b=FyQwpgHiSUjGWXIMJQRqN+gGpJ4Cd4tvBTtqFJ8Rl2qKuUJ/s2Sr1T/eKZowWlPk0C
         flUValtprErN6Ieef+DNpfyfX0oVMoFuOJskwyThWnpYRHCqTLwC4OrWebD6Iy5BLFRQ
         WGkzIMI0E6qwbCUtI3+KWeKUasdZREX21hrzKDeSWEQnqyFRjrl219qpZ5F7BbdUE67g
         d0S+5ptLAknAG3Pr5wsU6T52DMnvGCCMwnx5keYm2HVH3tgoAGb8z+cIx1X05i9oLmop
         1gfVZw6JKCUgLY9Atg8vew5nrhJNov4m2CMxyHY0+z7Jm5lpU+iztuiwLSK19rrHjNza
         xcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Av59SSlfWgSmQumRF6UiodSGeGi3BdZRrUHHlS5f6ys=;
        b=DutdadzuYszYrKG9FCdEN/wMc9vcwDgf5OYrWd7YV3Li7l7mS1M6veOMNSZeqA8DW9
         vOK4wyOfHouDIE1GmJapcqT1c1FYiNrVGNQvRkQQZ4ASk7SSBix3iC4ODLH0ySW761YL
         7W+oMJx1mwJ5swBnzwD8t//zeZ9tOwInmf16D3MxabvcTsvbYvvmZ+kGl83XVYjqaNOj
         IiwZLasmjdpuf6qe2JeZX2AfZsXuLbMUwggMR0VNLK11lhJ1dMSSnw455jGaN8b7e+e8
         DRvx2iV/4QAAYy4HVGsS8t4jTYbhlDOh5eQ7rlKLNelrSQcl/mIMskbeM0f9MdAzCKyx
         29gQ==
X-Gm-Message-State: AOAM531EphUSbLzQjYV+MH/pYpsWLLbOQyfc/+xwUOngICxcUJjIRBtM
	NZIPPSdk1WlG1reG71tqpAy78dorPjANvw==
X-Google-Smtp-Source: ABdhPJwPXDIVapKCvnMNm+4O6UfgY3sf1x7xX/dyrgf+VkgCBT21A3BNqpd5J02R1xmT/pNiScaxPQ==
X-Received: by 2002:a63:d04b:: with SMTP id s11mr2860096pgi.92.1618693584417;
        Sat, 17 Apr 2021 14:06:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:24 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 21/50] python3-xmlschema: Upgrade 1.6.0 -> 1.6.1
Date: Sat, 17 Apr 2021 14:05:30 -0700
Message-Id: <3198de3b4b41077f5164ea5e607d9de8c6fbc767.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.6.1:

- Add multi-source initialization and add_schema() to schema class
- Add bytes strings to accepted XML sources

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 98cc478e5e5453cb000c58f22f9993e3129bc350)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-xmlschema_1.6.0.bb => python3-xmlschema_1.6.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.6.0.bb => python3-xmlschema_1.6.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.6.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.6.1.bb
index 2d207fb243e..91697e39a97 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "e951efc5ab3f251973f92cba7a7026adb32a4cd844d3425133d23eb269de4f8f"
+SRC_URI[sha256sum] = "d02b82bb4fce3af09495b85e6ada5ce0cfdaa865b09b28ecc0f5ab81fad7e328"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.17.1

