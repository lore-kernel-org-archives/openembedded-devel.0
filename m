Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F61C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:20 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5264.1785589939839966021
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rNzDBPAM;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1063545a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589939; x=1786194739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saeJga8+0MJI6Y2xGvsEmyvIes6etRICVJ/42jB5M3Q=;
        b=rNzDBPAMvLjUjOuognLK7iltEvF+Lb37AoWsKY7wQxbYF4NyvLO++HHDbwA+o3eAWu
         f/+LiRmbDCE2fd0+11GjXYGLSciOjwZWTXSb0Tg6bjoGwL6bbpMsm7Gi3MM8krihJITM
         22Ou3TErafR5bmBZzxKN/CH0urJHmCK21jj39ITwkvfS07fSu5RHompITqfAKu73XljF
         czje+xVLqmoBLnLsgCiiphVcZsVvjUhWsjVC0SqoxIUrGSKFgYAbp85Z0Ftwuer6GAHa
         I2TaW7DYscEvT+o6qssNXpIWLuGCTlxl5ipDR2TdKjJD+kB+znL0ge8IxYPE084RgA4a
         8xVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589939; x=1786194739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=saeJga8+0MJI6Y2xGvsEmyvIes6etRICVJ/42jB5M3Q=;
        b=Im9tYLn2qGzET1mfBChjH08TwkJXfmdr6m5OmbjG0JZAIUxrEkdV9v3/UBPt5tl4Vg
         FUXSuOYtDi5okgX8/lMiakBr6OeP7LTBrdHBoq8tYyerfNrMeDleE6AjJ44v+2Pv0oUL
         x43uroCQcoBiw6rEqwps7KS/NOmxGiK8Lg0JmU4A9qAOgxyoI3KMu6CfojvDO2XcVIhj
         qGT8kxjrgBCzDrdksf7VF+vhJQRWk90z8A5og2G9be2OL5mlnaRZolZXrjSJxgIBmjxo
         PT04ZSMsQz+G3gbSgSEwNVEe31t5t1lhpFIXDuaE2vZ4BkFgnoEunW5m/MdDZ3mzDwkL
         l2QQ==
X-Gm-Message-State: AOJu0Yz1vgyQjGVfXkiatNdX0eEQnG/w0CTwcyqiFeW34YBH4/jZgmdM
	4xaQiO7LhXI+j3jTjk1MzmqyhGWtq6JsmPXBcOoLXc6HzMUI9Uoi9IOimZQUEUwF
X-Gm-Gg: AR+sD13Ofn+C5YuL/Igyza0JbmltHASK7YIlQaDjV9HFkwqItj2SDNdHerF92bkW9fN
	+hu8whkr4rOxNdQOqL+uYj53XmWJnbDzp90Q4oGWI3iRiiikpj6c5CldUoTJQJEPrMco7+e21hV
	NHHzIe4UDPiN+4Lj872ZF47yt0Pk1AaUpRMA12dGfjHAVBf+inZvY43AAe69E3w2JGjs+hibBLI
	nnRwEbgpwt77RkaE8tg/5ucBb+PjfeW6XTPTaI34epg1kNqRWHdi7AcyIGsQ5C+lA1kB+Sq2+GT
	jc33G0VElaeOCHlPgVXG7GtoOJXzPIet2q1gScOzpu1Q0bL7kck6huVVWX7zAsJq7fpfBFiIZ54
	FMGjyVHQ1PknjSxh79Qe3+ziFbxGIHzH/pcYQk+tkxQN8TR+3nIsvS8cKI2YPA8kus4B9NDHLHE
	pp6HRg71xFOTsG+dscNxzvyuRSpZAmY3d0T7+x3Rbb+AcZLgln3xpyM9cwdLAqZbcKlA6kdmQ1m
	L1ZxcJKWWdc
X-Received: by 2002:a05:6a00:2918:b0:846:7507:4e07 with SMTP id d2e1a72fcca58-84ee493e7e1mr2928457b3a.39.1785589939202;
        Sat, 01 Aug 2026 06:12:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 12/20] libmatroska: upgrade 1.7.1 -> 1.7.2
Date: Sun,  2 Aug 2026 01:11:30 +1200
Message-ID: <20260801131138.3299410-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128606

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is merged in the upstream version.
Also included tag in the SRC_URI.

https://github.com/Matroska-Org/libmatroska/blob/release-1.7.2/NEWS.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 40 -------------------
 ...matroska_1.7.1.bb => libmatroska_1.7.2.bb} |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-allow-build-with-cmake-4.patch
 rename meta-multimedia/recipes-mkv/libmatroska/{libmatroska_1.7.1.bb => libmatroska_1.7.2.bb} (79%)

diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-allow-build-with-cmake-4.patch b/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index ba4ccadd20..0000000000
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 193661ce9dcc956bf609065df6cbd753a3cbd8e0 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Fri, 11 Jul 2025 16:18:41 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-|   to tell CMake that the project requires at least <min> but has been updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Backport [https://github.com/Matroska-Org/libmatroska/commit/dc80e194e93e6f0e25c8ad3e015d83aca2a99e10]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8fed3ca..63ac23d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.1.2)
-+cmake_minimum_required(VERSION 3.5)
- 
- project(matroska VERSION 1.7.1)
- 
--- 
-2.43.0
-
diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.2.bb
similarity index 79%
rename from meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
rename to meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.2.bb
index 164783a34f..ed7a7af97d 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.2.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libebml"
 
-SRC_URI = "git://github.com/Matroska-Org/libmatroska.git;branch=v1.x;protocol=https \
-        file://0001-allow-build-with-cmake-4.patch"
+SRC_URI = "git://github.com/Matroska-Org/libmatroska.git;branch=v1.x;protocol=https;tag=release-${PV}"
 
-SRCREV = "f5315fddda2d434e47035c038549a808d8b8eac7"
+SRCREV = "280281a8aeb69881f70ee3d6ff26aa6d964365a3"
 
 
 inherit pkgconfig cmake

