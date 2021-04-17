Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.3489.1618693593223347088
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=epnjkl0I;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so11574652pja.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mWREbQzDql8Ld4qXXMOJiGMOYXTocYhuzGXH6wTSOXg=;
        b=epnjkl0IFyFwtWcZv6H9pzZNZ4aHM8gb7nioQZjPa34Ivm3UqpgXJlOmewRYzfZ8mw
         hGJNoDSky2znRwMDUltHIPcDHtW5gR2xuC9+zn7JJmQPruP0uMF/yKI+47HcJSdB0vim
         IxBMSXZ+FVUyhmPMjkKmj4Qm9Rjj8OG5mAHNl6f2ja4VUsnbGQSjs5ILI8dBl7heE8Kj
         6bCG38BlvQUx0NcDY0aXUk5hOkbR02/7RUB/xLr3sQXr9ywLY/KbL093GrPy+kSvTkxx
         zLl5sMEew2o3sVnILqQPLKAGjvjtSYsyZBJ690bCaWe+mXZ6f/4SEqu7kELWhRDz+TR/
         RfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mWREbQzDql8Ld4qXXMOJiGMOYXTocYhuzGXH6wTSOXg=;
        b=a2+hICKWEtjEyOCA3gCDk2fYi5t1WpITiGC4FUShjNZ8OrmHUcQitWS7mNAJ48YrKu
         ZbwI2IgMkDLD30urbml9NAYSghPxnmbfOBUksvv8Xhj/knQjvRh94M94XjKbOZn9UxBl
         KcranoHiBRqY50Zm3dbAkTurifW90WMcxcWGe21KVdCIslZ5HWHRudd4tCt3X59Ib8gj
         EjmjfZhdYwm63SNp0jy3bbFz7gxmRK4GcNoV54khpO3BZCKVkmRCqxhXGpMSokE2XS5y
         M8usFMWoDSL+OKZ4s7YLJB2ty1/41uXqvywUqdpFNtqdfiRf00dNBb6x27Kpzi3MbDAj
         +iqA==
X-Gm-Message-State: AOAM533gMeQxtbmWFxVLA96K3MwuNQ92MAcVUgjI8axRxb2OmajDq+6Z
	KFTm1IgxmpyU2kdFVLGcyedx4gBioIixFA==
X-Google-Smtp-Source: ABdhPJx7SNybNiMWO1is/9wa+mowQQlVkV58CaXfnuczA9PEmFLICQWhvhsLctbTuR1x/u2evlt6Jg==
X-Received: by 2002:a17:90a:5b15:: with SMTP id o21mr8236104pji.193.1618693592710;
        Sat, 17 Apr 2021 14:06:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:32 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 32/50] python3-decorator: Upgrade 5.0.6 -> 5.0.7
Date: Sat, 17 Apr 2021 14:05:41 -0700
Message-Id: <eaada9a695a0322e7d08f132e5be03dfe7f1cddf.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 5.0.7:

- The decorator module was not passing correctly the defaults
  inside the *args tuple
- Fixed some mispellings in the documentation
- Integrated codespell in the CI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit d07aa9a0a7c5e0a9472c339cccd6604ef9e70d12)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-decorator_5.0.6.bb => python3-decorator_5.0.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.0.6.bb => python3-decorator_5.0.7.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb b/meta-python/recipes-devtools/python/python3-decorator_5.0.7.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.0.7.bb
index 9e837b719ed..3131b2bc0bc 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.0.7.bb
@@ -9,7 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[sha256sum] = "f2e71efb39412bfd23d878e896a51b07744f2e2250b2e87d158e76828c5ae202"
+SRC_URI[sha256sum] = "6f201a6c4dac3d187352661f508b9364ec8091217442c9478f1f83c003a0f060"
 
 inherit pypi setuptools3
 
-- 
2.17.1

