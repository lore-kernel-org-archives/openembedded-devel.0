Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3321C52D6F
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 17:05:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.215733.1724087115579398092
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 10:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJ16ABYx;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso36579885e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 10:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724087113; x=1724691913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sRcHmENeY5F5qh9Rb/yE8V1wN7m888qyMug4ud1ZppY=;
        b=KJ16ABYxU7qSJG65Wh8RGfCtauWX7FsevBaR5nxfJQ1QUkpBA/a2YZzOAxltsYk3Fc
         oIDY/qkvXNx7LnWIXR+qHfNHCd/C5g8RPoMm5g+eh2a/pziTpt3zcvtz3/1lKtDMQc5x
         qSo5XY0Saqzoo/l+LQMR9RJiiTix3qsqxf06ylm0PHMLTi1TskwhsN8GhSXgA9fsudub
         dSFVnvJM0VsY68bQby3OReRAargf7bOQqYSZQQrpRCL9SGKZHgbMe8KU1WgoJY6j0sJi
         d3xSydEdXSAevKtq71hcWRao+LlFwLMlviiK67X9jWS6pNJFqX8zU+tfy5+uqquTv670
         dBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724087113; x=1724691913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRcHmENeY5F5qh9Rb/yE8V1wN7m888qyMug4ud1ZppY=;
        b=QrWhxDF4geRL2dZhd/Dz2jWV/RmUfJWFj1chXEflTBsEYgwMCtM1InEvVD7h2MEoRb
         x5nnApgKvz4Yyug++q+YyY/+YJogfe35MTPo8fjGyqK6m+eZ2vC1Cs12AzrXzQktDD6B
         SurrpsVwnW9MrrleGlYaeHYAU/9t9mczMH/9AtKkPVIr+0G8tIrR3KWV/DnpG3xKuWqb
         8pqKnoR0AxiW0B6OUJd7FLZ31dhjvv0r/DMSzzYwwb86i/2G/n9Ws4BaMsOPfeJR5S1P
         evN1QOb2h4qvAkB8AEDgji0OARzQMVKpUlwebrvi9Ibq8IrIMAb3QR/lcRIDJHRCpz41
         YjIw==
X-Gm-Message-State: AOJu0YwgAlrfZiF2i8a2UiSKlKzEawuS/TSNqskd/FqOawqWgpc9IaQg
	cSrS9wpJtpzDqXDhIcqdKZpzgSPiIVdYzugpkniGV510c1t+t5xRS2Cn6A==
X-Google-Smtp-Source: AGHT+IGW6YUwWOB5yW0LvT8fSyOAq6zt1O5y7hSUVgt26XnSCsfE0tQBzAmL6q9K0tuNC7chTGdYhQ==
X-Received: by 2002:a05:600c:8a1:b0:428:f79:1836 with SMTP id 5b1f17b1804b1-429ed7cce11mr79667215e9.26.1724087112969;
        Mon, 19 Aug 2024 10:05:12 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed649019sm116640765e9.8.2024.08.19.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 10:05:12 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH] composefs: upgrade 1.0.4 -> 1.0.5
Date: Mon, 19 Aug 2024 18:05:03 +0100
Message-ID: <20240819170503.2329998-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 17:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111854

- switch to meson build system

Changelog [1]:

$ git --no-pager log --oneline v1.0.4..v1.0.5
098d985 (tag: v1.0.5) Merge pull request #312 from cgwalters/release
0fae8a8 Release 1.0.5
9bdc377 Merge pull request #310 from cgwalters/symlink-limit
b06ea9b Verify payload length early on
3beb011 Merge pull request #308 from cgwalters/minor-rust-lints
a695ad4 Merge pull request #309 from giuseppe/libcomposefs-drop-ro
0a0d50f libcomposefs: drop using "ro" option
b35dc83 dumpfile: Fix clippy lint
a919ab8 rust: Drop unused cfg
3a87868 Merge pull request #307 from giuseppe/not-override-errno
bb94687 Merge pull request #306 from giuseppe/mkcomposefs-report-close-errors
76b4da5 mkcompose: report close() errors
502bc27 libcomposefs: do not override errno
2d2c09d Merge pull request #304 from jluebbe/meson
0260856 meson.build: Allow use as a meson subproject
5f512ac Merge pull request #303 from cgwalters/mount-source
91a3047 mount: Consistently use `composefs` as source
45e6179 Merge pull request #302 from cgwalters/info-term
f64022f info: Add missing terminator for `longopts`
d81cb87 Merge pull request #300 from jluebbe/meson
04c8a8e ci: Add GitHub Actions workflow which uses meson
64709f6 ci: Install meson package
b6f2b75 Add meson as an alternative to autotools
942cd73 Merge pull request #299 from giuseppe/composefs-info-set-locale
5072fd7 composefs-info: specify locale to isgraph/isprint
4f19d00 Merge pull request #298 from cgwalters/rust-misc
43a1d28 rust: Add README.md files, link to crates.io
a8bc747 rust: Clarify that "composefs-core" is really "composefs"
483356c Merge pull request #297 from cgwalters/rust-include
02213c0 composefs-core: Drop incorrect `include`
dce84ff Merge pull request #295 from cgwalters/rust-descr
3d2af03 Merge pull request #296 from Kiskae/upstream-tmpdir-fix
6928fcf test: remove hardcoded /tmp
e21be07 rust: Add mandatory `description` field, other misc changes
28dc491 Merge pull request #292 from cgwalters/rust-ci-dual
59c5a27 Merge pull request #293 from cgwalters/rust-minor
689ccc6 rust: Some doc and misc tweaks
426b65d ci: Test Rust code against current C code
32b3f6e Merge pull request #291 from Kiskae/patch-1
f7465b3 use correct `composefs-info` binary

[1] https://github.com/containers/composefs/compare/v1.0.4...v1.0.5

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../{composefs_1.0.4.bb => composefs_1.0.5.bb}       | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/composefs/{composefs_1.0.4.bb => composefs_1.0.5.bb} (84%)

diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.4.bb b/meta-oe/recipes-support/composefs/composefs_1.0.5.bb
similarity index 84%
rename from meta-oe/recipes-support/composefs/composefs_1.0.4.bb
rename to meta-oe/recipes-support/composefs/composefs_1.0.5.bb
index 7b934e4ea..14133fdcb 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.4.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.5.bb
@@ -13,20 +13,18 @@ LIC_FILES_CHKSUM = "\
     file://LICENSE.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
-SRCREV = "7623e4dc89f62ada5724d4e41d0a16d2671312f5"
+SRCREV = "098d985a1b9a15ac828d7b2382297a6955e31e40"
 SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit meson
 
 DEPENDS = "openssl"
 
-EXTRA_OECONF += " \
-    --disable-man \
-    --without-fuse \
+EXTRA_OEMESON += " \
+    -Dman=disabled \
+    -Dfuse=disabled \
 "
 
-LDFLAGS:append:class-native = " -pthread"
-
 BBCLASSEXTEND = "native"
-- 
2.46.0


