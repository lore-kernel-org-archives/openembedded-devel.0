Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF385E65D1C
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 19:18:34 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.53442.1732389508004966006
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 11:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fst0Fgmd;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21278f3d547so24522265ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 11:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732389507; x=1732994307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rfc3UIf439T43rxV1hLXUVAnqx1aSr33zuATfSNApWs=;
        b=fst0Fgmd9j8BkRJq6OFiRquZjYszQDc+HpQ19FBklUr4TyMZq12r56z1SXvXwTWMwR
         cj7bQXk5ZnkvC2qSZZTCzYkmO9PLqhIB5i0gylIaG/OM4CRW0bzrzXIDllzyg2nIPC2U
         EgxVFN4aMGxPJ/ooXw/aB4x0ZSZ6BlpcvPuoQfxi7RA9UiIKtTXcVLhYIZ/nJckLQYZl
         Za6yzKi1BKz+G0qMbi6JQURfk3eIskZ1/LLwdM2Uq4ust6Mv6nYJC0Dx0kdMKF/2zmqs
         1XaJCEj9CkHnSfuUyK6boPgOJLs2Ya6dUFXOx8sCM817hGIafiNLo9O1sIzUGCb+LyEA
         Jh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732389507; x=1732994307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfc3UIf439T43rxV1hLXUVAnqx1aSr33zuATfSNApWs=;
        b=R08+9HhGWemI355+e2WjoqFAR6ZPvbsSjSeD4RV6WjTbKxvwASHyH9QZUUARHVgMTp
         gDvLdWPqIUzkYmzxugkeemj5AllTOFvW699mI2leWD6mZ8glL/lxzdt7IJ3Ylf46ETMu
         pih/gTMe8Yt3RIFvToNlcMn+trjfvg+rJWnxyj7t4Xg4IzUrz5DmznE8Tnite8iYSg9T
         AbfwVpN6XZp7yDOzYxxNnvPD2DAMR5u1YF2Mffr0XvgzNRqpmGEtjVcl6OJTNAvEVNWZ
         mnyJn3Yj4uw0771sU3EaFK64NZm2OdkxWR7UF5X6CrYE07h5ZynDwrrE7wbyj5fcmDln
         EdUw==
X-Gm-Message-State: AOJu0Yx7Aloix6ZH8RqzI4lVRj/KGKfBzzwJzAOWYfsffqgDyibZYGj7
	GQjHTie0/uB6QCQIiQDMidFQCc+eGtiq/sjBmBg4QxhLd2KsZbd8dAzijg==
X-Gm-Gg: ASbGncv8zurTuVTXqNDEYVEsw894FrDnxhs+Ob4hgz3aMjhoGKj0WMFslS+qI6V7CTV
	sdltPbG8Y6AYpBEdI2iY5WK+9NPY9fc633WEqUGhaFXIEPp6kq+jzh/3qpkErpNcB/SX89pC2mN
	oJ8sW9Sr99yUch9LohcX56Sn6YuEyEgrbtsO4ElRUxKLY3xYgDp5x6CbaNFOqhxTiFevKkhxNNj
	YNqD/yIJeFJ+I2+4ISBr+ueQTRIubmUqAAKBdVtqWqu8Mf1YkU=
X-Google-Smtp-Source: AGHT+IHZq7VLim1JxL9bSlXDDPy1Pi3XYzeFZ5ZWD5Kk+UAUsvzWP6ddC3tSBPeONOIv3u08S+QuFA==
X-Received: by 2002:a17:902:f686:b0:20c:e1f5:48c7 with SMTP id d9443c01a7336-2129f830574mr74301575ad.55.1732389507039;
        Sat, 23 Nov 2024 11:18:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db8c9d8sm35961345ad.48.2024.11.23.11.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 11:18:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] nodejs: Fix build with icu-76+
Date: Sat, 23 Nov 2024 11:18:24 -0800
Message-ID: <20241123191825.656582-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 19:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114019

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...uild-fix-building-with-system-icu-76.patch | 33 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_22.11.0.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-building-with-system-icu-76.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-building-with-system-icu-76.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-building-with-system-icu-76.patch
new file mode 100644
index 0000000000..326d226290
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-building-with-system-icu-76.patch
@@ -0,0 +1,33 @@
+From 2aec714749db053014a205d2d66d186f94867b55 Mon Sep 17 00:00:00 2001
+From: Michael Cho <michael@michaelcho.dev>
+Date: Tue, 29 Oct 2024 19:24:38 -0400
+Subject: [PATCH] build: fix building with system icu 76
+
+ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no longer
+add `icu-uc` when linking to shared libraries. This results in undefined
+symbols/references when trying to build with system ICU 76.
+
+[^1]: unicode-org/icu@199bc82
+
+Upstream-Status: Backport [https://github.com/nodejs/node/pull/55563]
+PR-URL: https://github.com/nodejs/node/pull/55563
+Reviewed-By: Richard Lau <rlau@redhat.com>
+Reviewed-By: Luigi Pinca <luigipinca@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.py b/configure.py
+index c4653f37..bff72b75 100755
+--- a/configure.py
++++ b/configure.py
+@@ -1876,7 +1876,7 @@ def configure_intl(o):
+   elif with_intl == 'system-icu':
+     # ICU from pkg-config.
+     o['variables']['v8_enable_i18n_support'] = 1
+-    pkgicu = pkg_config('icu-i18n')
++    pkgicu = pkg_config(['icu-i18n', 'icu-uc'])
+     if not pkgicu[0]:
+       error('''Could not load pkg-config data for "icu-i18n".
+        See above errors or the README.md.''')
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
index 49a5f350d9..e9e569af0d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-deps-disable-io_uring-support-in-libuv.patch \
            file://0001-positional-args.patch \
            file://0001-custom-env.patch \
+           file://0001-build-fix-building-with-system-icu-76.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \

