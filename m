Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.260.1617899812760436708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YYRarXW0;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id i3so2788801oik.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XmaCaNHpbTNaDFwSn8MlX1S11ZKLqei6FusNhGra5WU=;
        b=YYRarXW0ryNJm48DGW1AyfLHrQz6pwZr+DHq2r5tzo7q/RzwW0HcBUGA6m0uQsIUoh
         IyDgpysiM2CD5ziSCCNOpEeiTCVA23TbjfgyRfgiZdk4IrIeN0O0gA8I1CBePvXWrTP+
         3CwYIhDfIASL1YPvvltH9aeSTRwcPrAwf4IsXgwAlEUO373wxa1Ix5jM0XmgMpWIeSUE
         I6s93QmMWwM4UtdLjtgEWizPiH6mnBTkMIDG+zT91/VSVLGNYXRoYnLL/5jmxibc73Dw
         MELWIQd3sj5fr7b7NF7ks0zCZjG8U/4sTgiD3L6raK1KkawOcZTSXNvQXb//A4yERV30
         78MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XmaCaNHpbTNaDFwSn8MlX1S11ZKLqei6FusNhGra5WU=;
        b=fhFXdgOP5nOU4kmCvhUtFBrxSygSgMXONs43xfMDFuJtZJtXTwcxjG5o0757NCTskE
         3zH8ULrXNbAP8D+J5kgJ9zhY7Hgc8GqsZemKnIh7DM/yf6Ru3Uznvztx234Xk+psrYrw
         HcNMhXc1jWCjh/n+V4e1ouaeE88UWnPeuAPgcgn2SO9YvcXpLu8tBzPAswgZTFHijxQo
         FPIbmGeUrMruSHBhpuIJFUSeoJlow9erSbNeXpughzPyi2008cfzkWa790u18u8kr+aL
         sf6PI2aEmaozgoFeuDcieJCilLAHQfQtCpxICYZFvIMeSE4/tz39x4amvy6Jz/BeEGgm
         DcDA==
X-Gm-Message-State: AOAM532XgbuQ6khUN34pT7xpvVpk3LE4qNeP4RP2xWKNpIEEdas8hihd
	JUx5vUvIHCCeyhMMmrVd39Q+t/BuXlE=
X-Google-Smtp-Source: ABdhPJzWxZTZ6wJ8sWjmEPOnNatt86KHaISGLfqP/fuf2W/qQyHAWAfvZaXu8x9FgjothThFC+ak+w==
X-Received: by 2002:a05:6808:a8a:: with SMTP id q10mr6741152oij.167.1617899811783;
        Thu, 08 Apr 2021 09:36:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:51 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 42/64] python3-decorator: Upgrade 4.4.2 -> 5.0.1
Date: Thu,  8 Apr 2021 09:35:49 -0700
Message-Id: <ec137ee8b41ef42c8324df608d070498c2d65447.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 5.0.1:

- Dropped support for Python < 3.5 with a substantial
  simplification of the code base. Ported CI from Travis to
  GitHub.
- Fixed setup.cfg and python_requires in setup.py

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit a112f5ed6c7c611445583a08a2d1b22e6e141526)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-decorator_4.4.2.bb => python3-decorator_5.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.4.2.bb => python3-decorator_5.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.4.2.bb b/meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-decorator_4.4.2.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb
index 23d0cf2181b..e9d20379f9d 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb
@@ -9,8 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[md5sum] = "d83c624cce93e6bdfab144821b526e1d"
-SRC_URI[sha256sum] = "e3a62f0520172440ca0dcc823749319382e377f37f140a0b99ef45fecb84bfe7"
+SRC_URI[sha256sum] = "1e53162e016f317a61d93848f00e80e7109ca9ed06846c7f2930cf0ebede7c6c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

