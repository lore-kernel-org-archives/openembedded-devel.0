Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.11813.1594608980261301947
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NhU0V0+l;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id x11so4877061plo.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1so0Rn84UnjdAtWiUFN3cXfgssvbzox3UlmQkhJoMkA=;
        b=NhU0V0+l6LoncNcRnqz3pvXWY9T+wzvIJr4qjVer3zZoVWag+w8r5RqvGlu8WWCnpt
         YsvTW0QzbJ1Cy8zZzS6L4wdrdk/OxYGPKtPJcOujYu/e4fXPU1ePV0KM68iRw15PV6+Q
         NRnR1bB8iVsk9UyIwjN87ZYK1SWP+3t+vtnow/g0x6al7R4u3OPQyv+rYb8eXHaxDd8A
         jNlroHy/BrvPKenwbSgPkmcsL0vXtZ7wp2UiseXaGKC2phY14/CyWjbrxLA7jK8eIhfm
         /IQKKSISO7vOQoc6/dIEmbEbFjMi1qVxqROcA7Jamz2xqHA45a5GYNbJlQ3O3ztS/1fu
         abLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1so0Rn84UnjdAtWiUFN3cXfgssvbzox3UlmQkhJoMkA=;
        b=gpvLlVyRyXXR3c/7vexFY2MT6BrokChRfCH6uLPOjBzATIMp2lWPWwCi7jDV7fqCYA
         F0sClsQwyuO41yhlJXRZa9pJHcngu6jt5PZG2s5V4pu9+aBUdeTam83fKLNDLCdQqbVH
         5L/FHnG2CfVbAuAzyuMtMkiCaBRZAhUVAjDwkuzb+ZGt+yWXgjnj0kc4ol9CzFFpJiHK
         gHypU1lXCdzl6irHinYJeOhbtybQ4wrcU8bRpIrZ4A9uLvq3Eb6gVZKMAsbF8jO53q4S
         oPPkT7y2u5sxm0pHe64cgQX3tyJHb0Y6nVMck6hrt7twOTHeIatwF1qpMRAwxgrAOfQC
         e80g==
X-Gm-Message-State: AOAM5337rivnvSzl+mxuQV41qrjMvMdO1GRzv7xPK3+pq66HYw7dM4El
	GDhXhRN/nXQp6xoamfuRMoFO2dvn16U=
X-Google-Smtp-Source: ABdhPJyZC2XfaxpjalISf92U5+IOSLVDhoSWgKxNTrsnsc3jyUGLUZXBFAZUztTPWEIsq7CbhUoYzA==
X-Received: by 2002:a17:90a:3525:: with SMTP id q34mr17979687pjb.192.1594608978936;
        Sun, 12 Jul 2020 19:56:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:18 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/18] python3: Add python3-cryptography to RDEPENDS for python3-redis
Date: Sun, 12 Jul 2020 19:55:57 -0700
Message-Id: <2d964c9051632eb4d1896a4ef4d5eb2203f79570.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Bog999 <bogdan_999@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bf209dbf116a958689d82a73b7e1f4f1abfd5353)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-redis_2.10.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb b/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
index 3acc2fdaea..7a9cc3f793 100644
--- a/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
@@ -11,4 +11,5 @@ inherit pypi setuptools3
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-cryptography \
 "
-- 
2.17.1

