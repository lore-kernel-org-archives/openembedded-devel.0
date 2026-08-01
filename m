Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C41C55178
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:56 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13604.1785620749641648166
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OYHc9V6C;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceab75934dso24357465ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620749; x=1786225549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXfiboS4Vg38Ukyzug9Gl6UFwUwM/CGz+6VuVzvJTHA=;
        b=OYHc9V6CIfOtCdjco2oX2lhLwya1RgRsTV+zrnWwLn8VzhCuo+fHt+fvvcDFS6a4PX
         AoRYap4EH4+TLvopcIrY7MNKWNAiCgfvWrZ8jlEgz6Ev0eM0VMEeR9L4trKOLDRWdYEO
         e4+3RbuNpeXTpOk37MOU7oWnjYiLl7xHLTotKqesFwjWwpfE9y9inYXk1PwAIXeobT41
         I3YLZTfGGu4gjlQwSdcVwbY7QrBKA5glX+Amd589AVv90sF8Vqk7CXS6al1te2H23Ht8
         16qSYwNjsvhOqQ7r5Pcv/QtZArOgLz5hMyTZ75H+sliscksP4/ESVnLeYgKmhYOxm/1I
         uG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620749; x=1786225549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nXfiboS4Vg38Ukyzug9Gl6UFwUwM/CGz+6VuVzvJTHA=;
        b=Y9CRAoUWkhhSFllI52KX8ba5ryfZWG7y0gTud3Pa4aDkfwH2xr9Oh+npz+oBWeR8aM
         JCHqban/nay7EQ5uMprS7bG6r2i0Na/w22SSPeJigbwdDnuwwtNODfVwTEjyL7eJdj4W
         2PaOmTeVq6QMWaVu1RStQ/weONUz8i+91nWyDuyrGAUJGfes+hZ3te3tQKpiVoyM0gOm
         ruMrIljbR34vj06VHVlZs5ae2oiJJ9kp2B1fy0RbbNhCNSO01+di3uPahfCA2EyyEJmR
         xpre5jzUhRrjcJ2WLNUpYAhibbgeHBoujwpGu/RbRg/sLi659o/iWK4+LHOVc1Xq/FzQ
         Orow==
X-Gm-Message-State: AOJu0YwWm8DbeCK2SFqO4npDdp8Edh4hXFNWGHTrVo3gFl7YuAoSoZfr
	NvhEBdpeg/AgSS5p4WA5ekpDKJlh9dyiGSfnLI5+AJt7qeGn1651p2TrQQZueedU
X-Gm-Gg: AR+sD10/L5StkSDeNIg+yHvvndHfrNXByII9ji35kxevlFI6dWkyo245LgGDRkGwKq2
	u8LG+OXPHc8ImOMkLUSq6M+Mz19oID+fx+fdaOhOILUv784Mph82cTyDMDxxA65SoBjPl1rLSxG
	QYmEpwUpxDvWAgj2S6hdYDjb4IwFQPmLJC+7q/Qzm8lCkiOXg4r9JQjAXnmSkLTCjnH+4LV4PfB
	kmWMlEDHUVbqGf1fjZU2TQ4x6tYKXHKT8mg9fdwI91hbNRtRve2oF8egkel6CNI8xp3yoB4txqD
	dJq3z8ca9e28u1zRoLjQDp50nEZP+hLuNm5Bbmgm77r4m3fiGuuU/creE4ePBFLX78l7DKumonr
	O/8JYWhyh8rhLvzmfqR/dG51tb0A/ipNpP7u0ZF7hePgHiNFSDHfgyhzaywoGIsVW7TVL3fCFbj
	llJVu3Z+PXTh36pTqMtwFg1GQ2Tcn09MmQ3FdinDQOI5xVEfBXmAWe7btlpOzt1lFnUTAPMeujl
	s+UT+DAeHxNf1Adkvj5dUuCSb0bUAezXOtnp/7BTq9K7BgqIkgtYN93uyn/1GdD9VYmGJudkTko
	JChknztefrX/72ji9gdQIOud9utSYN1a4jFr+rELTXhvHlhf3PfcRhhUxrSvPeBEFR6903gBurX
	KySg/BecjmkUC
X-Received: by 2002:a17:903:354b:b0:2cc:d192:50b8 with SMTP id d9443c01a7336-2d052913c00mr52112895ad.47.1785620748966;
        Sat, 01 Aug 2026 14:45:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 21/31] openal-soft: upgrade 1.24.3 -> 1.25.2
Date: Sat,  1 Aug 2026 14:45:16 -0700
Message-ID: <20260801214526.788343-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128638

Upstream changes:
 * 1.25.x modernizes the mixer, bundles fmt 11.2.0 (was 11.1.1), and
   annotates realtime-critical functions with [[clang::nonblocking]].

Drop 0001-Add-missing-include-for-malloc-free.patch: it backported a
<cstdlib> include into the bundled fmt-11.1.1 copy, which is already
present in the fmt-11.2.0 now bundled by 1.25.2.

openal-soft hardcodes -Werror=function-effects for C++ even with
ALSOFT_WERROR=OFF. clang-22's function-effects analysis then fails the
build on calls from nonblocking mixer code into non-nonblocking
std::variant::emplace. Pre-seed HAVE_WFUNCTION_EFFECTS=OFF (clang only)
so neither -Wfunction-effects nor its -Werror promotion is added.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-Add-missing-include-for-malloc-free.patch | 38 -------------------
 ...l-soft_1.24.3.bb => openal-soft_1.25.2.bb} | 14 +++++--
 2 files changed, 10 insertions(+), 42 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Add-missing-include-for-malloc-free.patch
 rename meta-multimedia/recipes-multimedia/openal/{openal-soft_1.24.3.bb => openal-soft_1.25.2.bb} (64%)

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Add-missing-include-for-malloc-free.patch b/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Add-missing-include-for-malloc-free.patch
deleted file mode 100644
index cd966c04f7..0000000000
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft/0001-Add-missing-include-for-malloc-free.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 468b52958ded2dd942386d52e456ed259875b6e3 Mon Sep 17 00:00:00 2001
-From: Chris Robinson <chris.kcat@gmail.com>
-Date: Fri, 18 Jul 2025 01:57:32 -0700
-Subject: [PATCH] Add missing include for malloc/free
-
-Upstream-Status: Backport [https://github.com/kcat/openal-soft/commit/6b69e11867e6498f244da95de7a3d6c25f79f205]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- fmt-11.1.1/include/fmt/format.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/fmt-11.1.1/include/fmt/format.h b/fmt-11.1.1/include/fmt/format.h
-index d1b83d18..ae5700ff 100644
---- a/fmt-11.1.1/include/fmt/format.h
-+++ b/fmt-11.1.1/include/fmt/format.h
-@@ -44,6 +44,7 @@
- #  include <cmath>    // std::signbit
- #  include <cstddef>  // std::byte
- #  include <cstdint>  // uint32_t
-+#  include <cstdlib>  // std::malloc, std::free
- #  include <cstring>  // std::memcpy
- #  include <limits>   // std::numeric_limits
- #  include <new>      // std::bad_alloc
-@@ -742,12 +743,12 @@ template <typename T> struct allocator {
- 
-   T* allocate(size_t n) {
-     FMT_ASSERT(n <= max_value<size_t>() / sizeof(T), "");
--    T* p = static_cast<T*>(malloc(n * sizeof(T)));
-+    T* p = static_cast<T*>(std::malloc(n * sizeof(T)));
-     if (!p) FMT_THROW(std::bad_alloc());
-     return p;
-   }
- 
--  void deallocate(T* p, size_t) { free(p); }
-+  void deallocate(T* p, size_t) { std::free(p); }
- };
- 
- }  // namespace detail
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.25.2.bb
similarity index 64%
rename from meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
rename to meta-multimedia/recipes-multimedia/openal/openal-soft_1.25.2.bb
index a1d2932f93..e2da0b1b9f 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.25.2.bb
@@ -7,10 +7,16 @@ inherit cmake pkgconfig
 
 DEPENDS = "zlib libsndfile1"
 
-SRCREV = "dc7d7054a5b4f3bec1dc23a42fd616a0847af948"
-SRC_URI = "git://github.com/kcat/openal-soft.git;protocol=https;branch=master \
-           file://0001-Add-missing-include-for-malloc-free.patch \
-          "
+SRCREV = "b2c48f7718ef3fcf67921a8b6534c4914e328970"
+SRC_URI = "git://github.com/kcat/openal-soft.git;protocol=https;branch=master"
+
+# openal-soft 1.25.x annotates realtime-critical mixer functions with
+# [[clang::nonblocking]] and, even with ALSOFT_WERROR=OFF, hardcodes
+# -Werror=function-effects for CXX. clang-22's function-effects analysis
+# then fails the build on calls into non-nonblocking std::variant::emplace.
+# Pre-seed the feature-detection cache var so neither -Wfunction-effects
+# nor its -Werror promotion is added.
+EXTRA_OECMAKE:append:toolchain-clang = " -DHAVE_WFUNCTION_EFFECTS=OFF"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pipewire pulseaudio', d)}"
 PACKAGECONFIG[alsa] = "-DALSOFT_BACKEND_ALSA=ON,-DALSOFT_BACKEND_ALSA=OFF,alsa-lib"

