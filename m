Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.3673.1617934870313932287
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ENzcJ88k;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id m13so4253051oiw.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AVTDGr037up/OYobyiYoWYsYVaByo9NggUXJuP2y6w8=;
        b=ENzcJ88kRKc4ZCbcjDpiPv0IqjDa1BhBxBXASBW9Bf39XQN8lSFza/fiJoIkuSvjkM
         +TcxrYPwPJhny7g4zreqwVeEmvFpgSncwL7ZqExWegAiHu1tEwhqW3jwUa2FmuHAhsm2
         d/yOv+mjwRJmdhrE9Vfo6QrbESdMOumIX6tI5RaO0IHcMzWkDDImEJ0CDC86LxjouPgB
         lxCicVHe5/8ClmxMuE4kAPexvQBZ39n6c6hqTCC4/VQZSKr/9TdkjhvD6JKmtMrcmO+K
         xuR6QL8MDPBZz3+bGRtjyY3P/M2hgam8havgWe6wL7TIqEc0HAWtMyo+u+gzU8otO2NN
         vVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AVTDGr037up/OYobyiYoWYsYVaByo9NggUXJuP2y6w8=;
        b=tdQycr0aw2BAlpOTSAGGjWVEL+tvrfvzDbAe8wj++PPQoNv8bZYbLC6DIPOCySROIQ
         2j/0mYHLAmzAeE8K5C5VmzFV30JCPq3WXJFHVnIom3NXH640ZXGT8iPOGWgvPVIfk1sS
         DjLe5nNqVEmfI04X39vmyZM29mkU99QZI+7UHbPyDCKc5AYwGfzt4JoSS969uB+HWF6l
         rXllv1hErWoUOK1mSPIhKLKh/KCE7/sYf01UWHi+biFJRGze4x1Cn1jOHmfUZ5n/MG9K
         Lg29tK7mv/uA3TiLX1egMdT7qFxNrdOL/3GoCft0r5KPp04q2ijS+rr6VW7ZD+2b2Pcj
         2E/g==
X-Gm-Message-State: AOAM532FjyyLaXYd4yFS44tfeIrPkWgmE21FPLOTmGw7yU5wHaIjdBLm
	5BMwou1fFk58IcduMuybeTkzpPA2Qxg=
X-Google-Smtp-Source: ABdhPJzxsdVKP0JrrrJNPaavHG53ExC8nPFvQtbtlvQDJWT5U6xzk7HdDdA00SWsccXiHRtVyKVvtg==
X-Received: by 2002:aca:445:: with SMTP id 66mr8204512oie.81.1617934869501;
        Thu, 08 Apr 2021 19:21:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:09 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 19/36] python3-xmlschema: Upgrade 1.5.3 -> 1.6.0
Date: Thu,  8 Apr 2021 19:20:32 -0700
Message-Id: <5430eb6deeb369e549a868a6d3ed156da2e165e2.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.6.0:

- XML data bindings and code generators are now considered stable
- Add arguments 'max_depth' and 'extra_validator' to validation
  methods
- Enhance decoding with 'value_hook' argument

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 0f32057302b1d9297e96319e501dde317b493eed)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-xmlschema_1.5.3.bb => python3-xmlschema_1.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.5.3.bb => python3-xmlschema_1.6.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.5.3.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb
index 3f9c06365f8..2d207fb243e 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "a7db4c8ae2afa28654d15fcbf5d7f22f0441b5611e50426426e5418f369b5c79"
+SRC_URI[sha256sum] = "e951efc5ab3f251973f92cba7a7026adb32a4cd844d3425133d23eb269de4f8f"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.17.1

