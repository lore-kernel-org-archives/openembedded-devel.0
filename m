Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42960C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 19:25:44 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.490.1715282743452442357
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 12:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e0wQ575M;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ee7963db64so9501415ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 12:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715282742; x=1715887542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sd3JLABMukAyTJW1TDP/RrUTTHlvVlCqz/PDQbe8NMo=;
        b=e0wQ575Mw2+Nx6kHOatv7pSQgF5oY+3lTMcDdZrI23JeHF35dyzVa0bPpDsiSw+7Nk
         9TQsb7RSp6CdtwoMEr5KKgXM9dh6gpfJT3j5QWt5oy0EFbbrdOpDg02t5OHTb8dYOEnj
         Q89KeGpJwk9rkD+Q/aivDnxuAHpfIiqEh90kTyHHAIlmbAIHEiO1FwwUiX4wksx9aAnQ
         9sbua6ws6Fb4JfwCMOqMAR3huLprDfNh0MFLmqjrvAXiSteVKYzA5i5saP2tA7D2LLGZ
         OZpPgCcT85iqmvOupf6dWHBsWrNrhe6zyP8suUh5Mm/9Bnl6IVMdNdztUctE5DlnRoYN
         VMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715282742; x=1715887542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sd3JLABMukAyTJW1TDP/RrUTTHlvVlCqz/PDQbe8NMo=;
        b=sIV9ZgO/JsV0KkbHZgKqcEEmsbbDvgVV/Lkhc+/iphdgR56L+qg9xtQ9GSH+7ChWav
         Gcgpgm52YiJfKiW+727vlCd1sNvwRGp4uJtFTlKju3pROOaNM+QicgxPJjgDoPGYL2pz
         GV6KwPbTlY3kH77g31JNIdOIrm5kRmCSG3TWLF6n7QG9erqyV29p9dpMFnRGwgRbB5YM
         Rk3e6OBcZzjfu+w7fPjea7r2rtNiEyA2hD1fVctnR9Vgg76xOtSvgv7ukmngKDm7e2Nc
         hkDbw0uoqoHF9DOhbcGWmSCKpqrXs2Yh/evpTSBIDVo3r416oq6rPE4phqvJ9HDqS3+b
         P+Rw==
X-Gm-Message-State: AOJu0Yx1f5yu/k6tkXox3yCjlESwJl7/crw/KqqAsvu6LrG3h4lgBPXs
	g5PS+DBLlPJfe1Y9HSoRZ/anNiv14TZuytP8GTXkTSuq9hrxFMmz/DJ1uq7Vs4Y=
X-Google-Smtp-Source: AGHT+IFYMfJ0t+ymc22l1Agb2oB4hFqtOl+7IHjqWmswSzaZG/lIRki1p79HI8PtLANI0P3uHysG+g==
X-Received: by 2002:a17:902:ccd0:b0:1ef:442c:a023 with SMTP id d9443c01a7336-1ef442ca12bmr8447025ad.38.1715282742398;
        Thu, 09 May 2024 12:25:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f4db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad62fesm17991855ad.83.2024.05.09.12.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 12:25:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] freerdp: Upgrade to 2.11.7
Date: Thu,  9 May 2024 12:25:36 -0700
Message-ID: <20240509192537.1639358-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 19:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110294

Partially backport a fix to build with gcc-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fixed-compilation-warnings.patch     | 27 +++++++++++++++++++
 .../{freerdp_2.11.2.bb => freerdp_2.11.7.bb}  |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
 rename meta-oe/recipes-support/freerdp/{freerdp_2.11.2.bb => freerdp_2.11.7.bb} (97%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
new file mode 100644
index 0000000000..7fae2703f8
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
@@ -0,0 +1,27 @@
+From 75fa1fa5bd5ef2350390564245fd0984209ac092 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 4 Jul 2022 14:34:46 +0200
+Subject: [PATCH] Fixed compilation warnings
+
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/2da280b8a1748052b70b3f5a1ef0d8e932c33adc]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ client/X11/xf_graphics.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
+index 5aa1fd48b..fe81e0ed9 100644
+--- a/client/X11/xf_graphics.c
++++ b/client/X11/xf_graphics.c
+@@ -438,7 +438,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rdpPointer* pointer)
+ 
+ #endif
+ fail:
+-	WLog_DBG(TAG, "%s: %ld", __func__, rc ? pointer : -1);
++	WLog_DBG(TAG, "%s: %p", __func__, rc ? pointer : NULL);
+ 	return rc;
+ }
+ 
+-- 
+2.45.0
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
similarity index 97%
rename from meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 3319488051..43c38bf9c9 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -13,9 +13,10 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "a38c1be9eee39a9bc22b511fffe96e63fdf8ebe7"
+SRCREV = "7f6cc93c21d7f0faad6daacca06f494f29ce882c"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
            file://winpr-makecert-Build-with-install-RPATH.patch \
+           file://0001-Fixed-compilation-warnings.patch \
            file://0001-Fix-const-qualifier-error.patch \
            file://0002-Do-not-install-tools-a-CMake-targets.patch \
            "
-- 
2.45.0


