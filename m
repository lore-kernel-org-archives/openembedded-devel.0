Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62049CA0EFF
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 18:43:17 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.15747.1756579396867420189
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Aug 2025 11:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f2Rnia0S;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3297a168470so183110a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 11:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579396; x=1757184196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rkwa9aiQhkgbH5K6oU3JAcQMxtAex9tmGMUL9aU5cFA=;
        b=f2Rnia0SAdqwVuKYoFBQBzbQn5qR78z++511E1Uggoi7ByEePXySlIhDTBSKLpQThM
         7LbHi/XgMGEPM8oNms4w9u7fwLM34uQZNrT5u0pjL6ecm9KEhswwWqY70+Nl5i/akJeO
         hnS9YOIEEDtOG7RnrBYsfr5l3J7ZGQ9BM30Nr7VFWlkRqrcoZLpO52WXCuLS5UCzigEk
         OdFy76e/hECGal5vUyTE59AI4eav9VwMdNdFXnHIqhwwdHVmWqpcTNlCD3Bm8G0AcUzN
         BIFu1oaOMfu2RjJLgUDOMKdbSPrju0u+m33zwhGm4G/vYG/7V3/BAeKcJPkkTY72uSKI
         r2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579396; x=1757184196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rkwa9aiQhkgbH5K6oU3JAcQMxtAex9tmGMUL9aU5cFA=;
        b=sGb3NcVJi10ZRRopZ3du4uNdhw3Xr9dml/NvXQAazamSK51NGFIdG7kpq6S4t1u9bl
         q6INPJytZOWRaOGzmWowK6x1ZMQLTTg2t+OIeoF5gMP6eMc70RVOAndG1ihxircFg8/Y
         fM3kRb94gdl5A96T2QAtJx4+OtEn04sEUaedQmDYiZeO7PX0et09wJiGbrtIGhfz622W
         BI0zetEOUA/jGCCixJ55oiktnVa0cZZ2Zl88eJBO2wJQ3kCvQ+8oxqGgpvMc2FZsocZ9
         r5+Jx3kXBtzqpZYWWPaZZC4izYjTA0FjGyTiqQi5PTE5n4yjjaR+rbQhlWUqHi74XgFz
         hWRQ==
X-Gm-Message-State: AOJu0YzyryBMKbEnfbBFoeHPGy1SlT8YfYmViPRzVR5rOp9qTIcB1Lae
	7Ja+x8LapZlzC7Sckr9wJHV9dRahzswHRqMMQQEcbheWk9TZZLb8NwPlgsGGzo5/
X-Gm-Gg: ASbGnctIsjiIkJJkrUYxA3BtKU5VoiSQreTjfY4Pki79brlB8ESV+IQknOTKiln71uk
	aUKvzo87U4eSnhZp+sDhAlhGpKyyhr3bPt5iU1SlgdVZAJHOYzdL8q/y93B2l+xuExUnUIIPoMu
	lteFpEzQP0hhicwCn7+Yr4KeGFUw6VcYLGFCNrz3T3bFeCwJQDZ3PERAg/BwmXxDzCDBeI/LvnQ
	aTLhUhkZ4atwHpXxdah/bd98Hpe71ekQErNo8vclab1t8qXX+rvnCpnX1kiL20xNlLSnEk2agop
	8M/qQd36K46N0KF4oi4TVm6rwmUHWe2hIR1NbifWO9pS0lvIYIJnD0RWZgFIGm4ml5VRkolyS1n
	ivniQn4mZitoZycJFUukfPEM2jAQuQ3s11BpDrZB+k+yO/qaQ2yaS65WfVe8HabRPRK/yqoj7Zd
	bU38FIRX+vhD25ujMCTJ5KEVn/aQpwIvugQy2ParN9
X-Google-Smtp-Source: AGHT+IHwPi4nJ14o74ti0Fzf2Uuj5xz2a5cCcmr24/L4dcmz8Dg6nj8ALTg/PTQIYd1SM2aGdSo+Wg==
X-Received: by 2002:a17:90b:39c5:b0:321:4760:c65a with SMTP id 98e67ed59e1d1-328156cc697mr3652624a91.27.1756579395934;
        Sat, 30 Aug 2025 11:43:15 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d9330b73sm6462091a91.4.2025.08.30.11.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/8] openal-soft: Fix build with clang-21
Date: Sat, 30 Aug 2025 11:43:04 -0700
Message-ID: <20250830184311.1018374-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830184311.1018374-1-raj.khem@gmail.com>
References: <20250830184311.1018374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 18:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119144

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Add-missing-include-for-malloc-free.patch | 38 +++++++++++++++++++
 .../openal/openal-soft_1.24.3.bb              |  5 ++-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Add-missing-include-for-malloc-free.patch

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Add-missing-include-for-malloc-free.patch b/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Add-missing-include-for-malloc-free.patch
new file mode 100644
index 0000000000..cd966c04f7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Add-missing-include-for-malloc-free.patch
@@ -0,0 +1,38 @@
+From 468b52958ded2dd942386d52e456ed259875b6e3 Mon Sep 17 00:00:00 2001
+From: Chris Robinson <chris.kcat@gmail.com>
+Date: Fri, 18 Jul 2025 01:57:32 -0700
+Subject: [PATCH] Add missing include for malloc/free
+
+Upstream-Status: Backport [https://github.com/kcat/openal-soft/commit/6b69e11867e6498f244da95de7a3d6c25f79f205]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ fmt-11.1.1/include/fmt/format.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/fmt-11.1.1/include/fmt/format.h b/fmt-11.1.1/include/fmt/format.h
+index d1b83d18..ae5700ff 100644
+--- a/fmt-11.1.1/include/fmt/format.h
++++ b/fmt-11.1.1/include/fmt/format.h
+@@ -44,6 +44,7 @@
+ #  include <cmath>    // std::signbit
+ #  include <cstddef>  // std::byte
+ #  include <cstdint>  // uint32_t
++#  include <cstdlib>  // std::malloc, std::free
+ #  include <cstring>  // std::memcpy
+ #  include <limits>   // std::numeric_limits
+ #  include <new>      // std::bad_alloc
+@@ -742,12 +743,12 @@ template <typename T> struct allocator {
+ 
+   T* allocate(size_t n) {
+     FMT_ASSERT(n <= max_value<size_t>() / sizeof(T), "");
+-    T* p = static_cast<T*>(malloc(n * sizeof(T)));
++    T* p = static_cast<T*>(std::malloc(n * sizeof(T)));
+     if (!p) FMT_THROW(std::bad_alloc());
+     return p;
+   }
+ 
+-  void deallocate(T* p, size_t) { free(p); }
++  void deallocate(T* p, size_t) { std::free(p); }
+ };
+ 
+ }  // namespace detail
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
index 4204017c20..a1d2932f93 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
@@ -8,8 +8,9 @@ inherit cmake pkgconfig
 DEPENDS = "zlib libsndfile1"
 
 SRCREV = "dc7d7054a5b4f3bec1dc23a42fd616a0847af948"
-SRC_URI = "git://github.com/kcat/openal-soft.git;protocol=https;branch=master"
-
+SRC_URI = "git://github.com/kcat/openal-soft.git;protocol=https;branch=master \
+           file://0001-Add-missing-include-for-malloc-free.patch \
+          "
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pipewire pulseaudio', d)}"
 PACKAGECONFIG[alsa] = "-DALSOFT_BACKEND_ALSA=ON,-DALSOFT_BACKEND_ALSA=OFF,alsa-lib"

