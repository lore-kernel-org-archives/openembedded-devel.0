Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94082C87FCF
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 13:38:35 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.19709.1753450712879096846
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 06:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WLii6k1H;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b3bcb168fd5so2040344a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753450712; x=1754055512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHzAu3kM1z6rZCfF1GjMCnqsZwuJOeEpeWD/c7oasjs=;
        b=WLii6k1HIHitbEhSo21N0VjYVF5Mp2//1KHsPQ2jKwya3Fax3Ii/m+qoFfFKo9UV9+
         vnFlZl3aVv9gKJanIagHrZyuu48QMPztnLgeWmos2o8mfOa4RLKQSMChDGwTIN5FBdWU
         yByyOgNqeOBnoaCyqKHTmjlK07OtJGRw2DS69uktIM5eg+fm4L/wlbSVbP4p7Dy4lR9t
         i69uJKwA9m1dNOv99Z0ND0JVP5QI1pTuNUks/tFs9PA8jUJw1hIgYeH/73so4bV9EKSo
         lzvSkK6Y6VwjrG+zK/9nONBxIi1qLP+/MlUFBlPispzlQzIxjAsdDGX5pvGZNBYs3FZs
         ylqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753450712; x=1754055512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHzAu3kM1z6rZCfF1GjMCnqsZwuJOeEpeWD/c7oasjs=;
        b=lc4YibunStu4qaEmGpQ1dcpJF4wiXA+7JxSbuPkOCZrvGFwC01z6zC1MZgYeYEaXiQ
         86e72tlu+1c3UGQkAF+m3QJUQeLzWRKao9t90RV4zHwf+SzTvo2PY1F1LWkWWOrp/+T6
         FnCfLS/C50wOZ3kkLqbC27gVVWQu5G8ylX8XKA1hx1xmkugNXPkB/QnCNes6U8PJhyLc
         dYMsxRyt2VyPF6TnG9OrR0H4iZMhOS03wwhlduuruEUjJ+j+ldA7YT6bGlL0FqdXJs1c
         1P9O5OwoGONH5MfYYDpigqIFYAL2rTb5p8qe3z3QZRPDvbPEvBPmweQJ8AUDZCKCp4ae
         3jcw==
X-Gm-Message-State: AOJu0YwpH+qCiDEdN+uLWZoJ6+10wz1fBDuo3Y5r9TkZihzz3G8PNOi+
	wBJkQXekeJowUzhbMqWlAD0JOxSHpgt16CTzOjE7qB3xZvWPIBnEAE9l9cTH1dUmKZE=
X-Gm-Gg: ASbGnctgUqVasHnLnfBB+sy6j4MVxno7DknjVNufw7S+ol044QcxhnTfbIlQ2w2mrWw
	GX1W5GypxYD11ZBLcp/xsOWYm75Fn0QSxtCZtO4KDxYsXVqnibBr0hIlwEbCAzSgkidjHXNS+R/
	vgBOabJSAXnbZ2mBXVv63gT+i/2QCjSRhTtt8hrQD6/Wrwebj9hRRejq1QrHhw9lUeVSrtKDFDc
	IowJVYmRwLnvEQ6meTsFDgT893coXDHwmBPYWuAoupBR8GIVv8Ex5S9pHQgUO4Jcr2f92YL4KBV
	rw6MTT6lYltAHoQdLrZW85zx2enDG+b7AQHEKiug1PoKO1HJk/I2YbcdUmFSM1xgGbx78w3eyS7
	ivVRfK8BmveBcIrfpuL/oMlQX
X-Google-Smtp-Source: AGHT+IGxp7Al9J1Pi64xwolcZnJZOTsG2kJCwZwYSBKthShrxe+OoGtuzkyOazM/Wk3uG1ehF0DXzQ==
X-Received: by 2002:a17:903:1a44:b0:235:5d1:e366 with SMTP id d9443c01a7336-23fb3051419mr35511165ad.10.1753450711762;
        Fri, 25 Jul 2025 06:38:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6226adfasm2549284a91.2.2025.07.25.06.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 06:38:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] webkitgtk3: Upgrade to 2.48.3
Date: Fri, 25 Jul 2025 06:38:26 -0700
Message-ID: <20250725133827.1533329-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725133827.1533329-1-raj.khem@gmail.com>
References: <20250725133827.1533329-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 13:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118729

WebKitGTK 2.48.3 release:

Fix a crash introduced by the new threaded rendering implementation using Skia API.
Improve rendering performance by recording layers once and replaying every dirty region in different worker threads.
Fix a crash when setting WEBKIT_SKIA_GPU_PAINTING_THREADS=0.
Fix a reference cycle in webkitmediastreamsrc preventing its disposal.

WebKitGTK 2.48.2 release:

Enable CSS Overscroll Behavior by default.
Change threaded rendering implementation to use Skia API instead of WebCore display list that is not thread safe.
Fix rendering when device scale factor change comes before the web view geometry update.
Fix network process crash on exit.
Fix the build with ENABLE_RESOURCE_USAGE=OFF.
Fix several crashes and rendering issues.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk3/fix-typo-denormaldisabler.patch | 18 ------------------
 ...bkitgtk3_2.48.1.bb => webkitgtk3_2.48.3.bb} |  3 +--
 2 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-typo-denormaldisabler.patch
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.48.1.bb => webkitgtk3_2.48.3.bb} (98%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-typo-denormaldisabler.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-typo-denormaldisabler.patch
deleted file mode 100644
index c3383fcd41..0000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/fix-typo-denormaldisabler.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-From: Alberto Garcia <berto@igalia.com>
-Subject: Fix build failure due to missing semicolon
-
-Source: https://sources.debian.org/data/main/w/webkit2gtk/2.48.1-2/debian/patches/fix-typo-denormaldisabler.patch
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/Source/WebCore/platform/audio/DenormalDisabler.cpp
-+++ b/Source/WebCore/platform/audio/DenormalDisabler.cpp
-@@ -91,7 +91,7 @@ DenormalDisabler::~DenormalDisabler()
-     }
- }
- #else
--DenormalDisabler::DenormalDisabler() = default
-+DenormalDisabler::DenormalDisabler() = default;
- DenormalDisabler::~DenormalDisabler() = default;
- #endif
- 
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
similarity index 98%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
index d11d4808fd..23cacc021b 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
@@ -19,10 +19,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
-           file://fix-typo-denormaldisabler.patch \
            file://fix-ftbfs-riscv64.patch \
            "
-SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
+SRC_URI[sha256sum] = "d4dc5970f0fc6a529ff7fd67bcbfab2bbb5e91be789b2e9279640b3217a782c3"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 

