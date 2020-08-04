Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.1557.1596531106073155272
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2020 01:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nlx+9BHg;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id v15so17402990lfg.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2020 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbOn0V1jpmV+zgod0+izoP/BnpDv9lk7f3qUvPdwUqs=;
        b=nlx+9BHg8DY/0uKdTR2vpNrt6df9uAaIvuGkQmPU8Ex6ggrj+Ra1ZIWlDWjsQRTodn
         soUFQVeNHI6+qi8rmYaClu+KOPexC1ZY1e7VzNSFkxVeJIQPBZ84P1b4dXJtHYP/GAb1
         qUEt3rWrrdC4CmePPfRCciMQ9pxewa07klyUCSDDXygMkXCmwYcKjjHJXn+HL+Mc2sPF
         EpF5xIotmzhoF4SwTPjBhdicRg/UJkJG+jTVofxQv+JBza17kzgFa6cuTniMEqc/aLq2
         UVTq7d5+As/hV0aZtHEiIpRAkQ9OPGAj6Y25OTEXlBLCz1jaQzcoXoJvf22er+gTAdXo
         D2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbOn0V1jpmV+zgod0+izoP/BnpDv9lk7f3qUvPdwUqs=;
        b=rzbbQ2I54RhpzFoAQo7tkasqEKOaRN0fmz4bSDDtW45+Y/9RNk8pzLi1i2IsT2Wu0c
         x+mH51GbG/t0Nh47JQ21X8AfTHkW0DLp8P3XvijHduKiASDI/bdR22EGffXg9e5WCwCb
         4WxBh9NvLfs9W91+OBz7nnbdH4DHJ1kcXGhI3AkXBHOliOSOdQEeO9ATJmHGiH1FixL5
         tE9eZRQZIhEAr41lP4/gPHaRsUtDgLQ30IiKIteOlM3q2VtJNr3hKCz8L2VCa+kMCKxg
         hMZNwBZ39G6n+C6NaHfNNcVcnr/weKcpWMbG/MNfGA2KxBQkW8dy9Bxzywt00jA4Kson
         LTaQ==
X-Gm-Message-State: AOAM530akuFGIaJOGG0MDB78XEye8k/FAdjb27qUT7CabaxwgK00JV8U
	cWcY1BHh0oeiFUHNgOxImydKOZbn
X-Google-Smtp-Source: ABdhPJwJsj9dRlij6jzKz66ZTY6lPj//AWZ11n8l3OIBuwwCMJAeYfufmYD4P3IUbfE40cf0eGLknA==
X-Received: by 2002:a05:6512:752:: with SMTP id c18mr10366042lfs.53.1596531103738;
        Tue, 04 Aug 2020 01:51:43 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id 132sm6015196lfo.16.2020.08.04.01.51.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 01:51:43 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] abseil-cpp: Use SkipRecipe exception
Date: Tue,  4 Aug 2020 10:51:34 +0200
Message-Id: <20200804085134.79162-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SkipPackage exception is deprecated.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index e874e4a5e..8efa31e95 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -37,22 +37,22 @@ python () {
     if arch == "aarch64":
         tunes = d.getVar("TUNE_FEATURES")
         if not tunes:
-            raise bb.parse.SkipPackage("%s-%s Needs support for crypto on armv8" % (pkgn, pkgv))
+            raise bb.parse.SkipRecipe("%s-%s Needs support for crypto on armv8" % (pkgn, pkgv))
             return
         pkgn = d.getVar("PN")
         pkgv = d.getVar("PV")
         if "crypto" not in tunes:
-            raise bb.parse.SkipPackage("%s-%s Needs support for crypto on armv8" % (pkgn, pkgv))
+            raise bb.parse.SkipRecipe("%s-%s Needs support for crypto on armv8" % (pkgn, pkgv))
 
     if arch == "x86_64":
         tunes = d.getVar("TUNE_FEATURES")
         if not tunes:
-           raise bb.parse.SkipPackage("%s-%s Needs support for corei7 on x86_64" % (pkgn, pkgv))
+           raise bb.parse.SkipRecipe("%s-%s Needs support for corei7 on x86_64" % (pkgn, pkgv))
            return
         pkgn = d.getVar("PN")
         pkgv = d.getVar("PV")
         if "corei7" not in tunes:
-            raise bb.parse.SkipPackage("%s-%s Needs support for corei7 on x86_64" % (pkgn, pkgv))
+            raise bb.parse.SkipRecipe("%s-%s Needs support for corei7 on x86_64" % (pkgn, pkgv))
 
 }
 
