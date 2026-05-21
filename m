Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B528FCD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 15:31:37 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39421.1779377487814462135
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 08:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=ehVH/S6J;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.44, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bcbf867a77eso81581766b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 08:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779377486; x=1779982286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6VfIGaeoSbWwHbSzU0VkpwaQZnzB6Si31+pl0H+HRlk=;
        b=ehVH/S6Jc/WClbS3WF/w3zrvWPUKrcmjLQUFkyn0f/hLiStqNYLd6kAv4Eq08vZSCN
         Zi04kH0JRoq3gJK7b/p8QVLndSLsEXfHYyW8OtczlVBGLPeCkUzkpbq0xIt/tvuKjD3w
         HuGX1IMtsdePXA16rkaJEPfYFTJhLsjzgOpjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377486; x=1779982286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VfIGaeoSbWwHbSzU0VkpwaQZnzB6Si31+pl0H+HRlk=;
        b=nyz7m3VIpw2+CBUqmecW6KVLWX76T5Y7nj5txJixKENF6sLcC/Dc2xwyRevpHPdhrM
         8JSTz2VANXHgoxmbeRbtBEUXCGKczUSglI+tZHHy7CqlMZz8O9JXn47/op8XAuuyEh42
         7zqrvUsUnOu9beewTfnDeD2LItr5Z26r/0Ot/Vf9mLZgY5eQFTPgRepRxkoQCRE/Itkx
         nMgYbDW0s7OeQgQSI6tBilKQSLpDDP8C7DwuACufFRTDpCNCGxoq7aRe3YyorE9+h6RX
         lOtVte6MgHwa4uwpFVYi1zaAfLlrSTx28iLOSdX/DejCHDyNnIhYHUJ+wESCepED6qFG
         1kBg==
X-Gm-Message-State: AOJu0YwBdQdieSaBa1Sp61Gff5HDviQtE9uccYymg3tkGL5FWsEMBYXV
	HZe1+M2z5qTBrAettYLpvX7AWbggaxen/O+0gzcWvDkm3Vdv3C+5Ut0/OEkbPA/nkFDLBkcIwqq
	KbH58
X-Gm-Gg: Acq92OH0KvAOBticFixS06LYzyq98rHkIsyhqpp5RZRG8E6sq5neS+7ykbaxyvRfIOe
	Sx0nIy0VXF7WH5xRApHUesuf1HDY4Er0KM4a4dhkIM2fnNDcOnTjH8M21GMjMEV1/y0sK1YoN7j
	FozzKSAGxbvwt03atSnKmAJDHcaomQxg/rYIFxEZHbFZEBqReN9u5kpQjutBio4An5fDhKAHPxK
	3ctCwZFTk4gEhLkToxF7IME5adSr8zN2Qa9djFttzEmPWNpS7OmBu2wZxNOxDta+V/3d2aWAhGt
	rU9QJwB1Z5B3Xj9MeK6ZPlrt+1BOPEZnctQRtNxPh75CLFeJf/xdkxgg3U+aEFhBHIyt7pR+cG5
	jZvBa6ye4I8Veb211YCe7L5e4fxN6SSgIwi2StPiNlZ/lq6NYLpon8+d66P0IbHzn1fSaPsq+NE
	6q0yBxZA1R6kC0VWv54RXIEwfDf75qJEyx20iXNSjIHqTeGdQgUtrnJqS0TJG8all2dqlZ9lX8Z
	bx2eHEgkMqPy755N7VlDtY3dj1oGLld9tMuJDZapi1fEfpWCGMe3GJPNgZRp2Y+XfvuM9jH6Mvf
	EYEp0mlL8k1VFQ2/tN8fRQ==
X-Received: by 2002:a17:907:d1e:b0:ba3:3dd5:88de with SMTP id a640c23a62f3a-bdc14281fd2mr81262966b.5.1779377485946;
        Thu, 21 May 2026 08:31:25 -0700 (PDT)
Received: from adam.tail032493.ts.net (2001-1c00-8183-9900-dfb4-52e9-0b83-429b.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:dfb4:52e9:b83:429b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aa03d78sm63786266b.44.2026.05.21.08.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:31:25 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] [meta-oe] kmscon: fix zlib cross-compiling errors
Date: Thu, 21 May 2026 17:31:23 +0200
Message-ID: <20260521153123.2296946-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 15:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127136

zlib compression was introduced in version 9.3.3. However, when
cross-compiling kmscon for an architecture other than x86_64, the
genunifont executable tries to use the build-systems zlib instead
of the hosts zlib.

This leads to the following error during compiling:
libz.so: error adding symbols: file in wrong format

Fix this by adding a new native zlib dependency specifically for the
genunifont executable.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...0001-fix-zlib-cross-compiling-errors.patch | 51 +++++++++++++++++++
 .../recipes-graphics/kmscon/kmscon_9.3.5.bb   |  5 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/kmscon/files/0001-fix-zlib-cross-compiling-errors.patch

diff --git a/meta-oe/recipes-graphics/kmscon/files/0001-fix-zlib-cross-compiling-errors.patch b/meta-oe/recipes-graphics/kmscon/files/0001-fix-zlib-cross-compiling-errors.patch
new file mode 100644
index 0000000000..c720aa6dde
--- /dev/null
+++ b/meta-oe/recipes-graphics/kmscon/files/0001-fix-zlib-cross-compiling-errors.patch
@@ -0,0 +1,51 @@
+From 0ff9beddd959ec9afc99f64789fdfb959842ba52 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 21 May 2026 16:30:27 +0200
+Subject: [PATCH 1/1] fix zlib cross-compiling errors
+
+zlib compression was introduced in version 9.3.3. However, when
+cross-compiling kmscon for an architecture other than x86_64, the
+genunifont executable tries to use the build-systems zlib instead
+of the hosts zlib.
+
+This leads to the following error during compiling:
+libz.so: error adding symbols: file in wrong format
+
+Fix this by adding a new native zlib dependency specifically for the
+genunifont executable.
+
+Upstream-Status: Submitted [https://github.com/kmscon/kmscon/pull/402]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ meson.build     | 1 +
+ src/meson.build | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index f7c0858..74cf595 100644
+--- a/meson.build
++++ b/meson.build
+@@ -52,6 +52,7 @@ libudev_deps = dependency('libudev', version: '>=172')
+ dl_deps = dependency('dl')
+ threads_deps = dependency('threads')
+ zlib_deps = dependency('zlib')
++zlib_deps_native = dependency('zlib', native: true)
+ 
+ python = find_program('python3')
+ 
+diff --git a/src/meson.build b/src/meson.build
+index 63d38ca..070e2a4 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -159,7 +159,7 @@ endif
+ # Unifont Generator
+ # This generates the unifont sources from raw hex-encoded font data.
+ #
+-genunifont = executable('genunifont', 'genunifont.c', dependencies: [zlib_deps], native: true)
++genunifont = executable('genunifont', 'genunifont.c', dependencies: [zlib_deps_native], native: true)
+ 
+ unifont_bin = custom_target('unifont-bin',
+   input: ['font_unifont_data.hex'],
+-- 
+2.54.0
+
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
index b730faf414..83256480ee 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
@@ -20,7 +20,10 @@ DEPENDS = "\
     zlib \
 "
 
-SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
+SRC_URI = "\
+    git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV} \
+    file://0001-fix-zlib-cross-compiling-errors.patch \
+"
 SRCREV = "a8832afb1dcca5bb4c0476d4c13c7239fecbd93a"
 
 inherit meson pkgconfig systemd
-- 
2.54.0


