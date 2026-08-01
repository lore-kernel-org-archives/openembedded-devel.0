Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8F9C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:34 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13590.1785620730119607432
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PEbyosH/;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caed617615so27898525ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620729; x=1786225529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UtO0swSUQaqzTKEQhPCtAnbAy0pqAV4RNvlR2zve6T4=;
        b=PEbyosH/dJFeKdtHxhx5TytDgb48w8w9Si1kpiXpP0yIAd5VJ6q6OozWRi6GFgWV6Z
         lld2W3JCf5FRhV2Apr6wb+MFF8O5+a4ZXnA5FjlcjE0/x92dQxapqn/hu7nRQjxuIuqf
         uSMh6aT7gK4o+iY34OTDTYbf+L9WhSpyFQ0vtZqRRystuKOpKs5+ArQRHDHQJt6niM/V
         /oZDOvPuVEW/JxvpdLTeaDLCPfc6xa2qhMizuDQC5t9HneDpIRwJIPaOSqMZrs+Y/T+D
         cwO52kN8szjEznGpEshmipQQLfFLWxs0gPTBnvIyn36PGjlCv35NsNY6Q7grg9D4K8XR
         /vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620729; x=1786225529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtO0swSUQaqzTKEQhPCtAnbAy0pqAV4RNvlR2zve6T4=;
        b=Qh840QJMxL6t+6BQU8wDAyYfMvz2Iu+IxoE1Em1dEeXFtWUjsLQAAgwDBJmqxt5A8H
         FvjtIWPOk353tj05I09yq59wRE/y+SKQ8qXW3biCa7YkMz6ROERR2GifCqt6d8eJU3Fg
         8q+MsBLApm2EGIq5yYcgxNS7OuPRsxK/uAHtLmqiDrCxAhrrqZuUmfGw6B9U4A6OXr56
         beE1emQFCN2EO8Y4xiKFqe8vFMVNURDu7Rvl7hsRmMd5r/UU0qVgGuPfybdvzjdQJ10D
         9GgWB13oP2gbhLiAGayTz8f1Qxv81kxZ9Mlgxq9MU0aRbYyxA5Tx22o5ONtNNr3ALLNI
         3d4A==
X-Gm-Message-State: AOJu0Yz0Tv0ZfOyfBror/SDTOArXB+soMvcz6pHAgFGk1jwOG/UMGwKA
	uDncfdhCOhFodb46nrgqnwkR6bv73WQS3ChJ92pc1AHBFgjbdvG03wBxAd5Qvhp9
X-Gm-Gg: AR+sD13WJ8TwyrbKIC5nx3pmFaP3g5BO3e78zGrn5/w318DF6HcDsWrD70qqvWzv1Xm
	oKyrceHGWasDm5FPEtM+cu4gEMV2Nd6OG9J9LOSqY7RwhYiKY8s6NYgmMtebprbSIMeetdBBuQT
	avBQvG5fnA/S3S6kCtxuFDdKyX7VRpJLQiUhQG9alVFztqnqkhsYMgcwcwCTpLdxZ3njXaiKMBR
	xG/7XgzPvsxrkD6D6LjIatK7XsX+rxzAJkHThx3GtPjdIpssV6GBSNXid9MkSZRg8RaXgxC5Qf3
	HE7pGmHqf6E/+xIpB+Mskzjmawr/Ife/QAw/xszfoI2s+fjWUySTxKkmjveA/ZF34rT9lqKBAv0
	WQYl6+5oDpcYZqheeokHixwzlk1kmZz/K3gYJD8ygP5am2DQDUeOlSk1GBzA9Grg65lvu025i5a
	f9paSmB51j10vVABAwpX2GnYv3HLYn+/KFVWTJ7KT3g/bQNapuOUjEsy5in35EaLSO8H/ey+qnV
	+GINzgin9Oe72W3Bhfk1vzCQGfqa1lv9bLT6btnawS9uyUZW9tR8xp42fehF4D0VtgbFjgvfXuX
	SCvcY7FcZk2x7mqVSlbg6deZoYyFhG7vwLMMyL1UGqhRQSd2HOhKnZQnzQYGwcMzfaMH6GCGFJl
	zSg==
X-Received: by 2002:a17:903:4686:b0:2c9:c6f3:457a with SMTP id d9443c01a7336-2d0523e157dmr46802335ad.31.1785620729322;
        Sat, 01 Aug 2026 14:45:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 01/31] libmatroska: upgrade 1.7.1 -> 1.7.2
Date: Sat,  1 Aug 2026 14:44:56 -0700
Message-ID: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128618

Upstream changes (NEWS.md):
 * Disallow infinite sizes on all Master elements except Segment+Cluster
   and restrict KaxSeekId to 4 bytes, per RFC 9559.
 * KaxBlock releases read buffers on EndOfStream error; catch some
   internal allocation failures.
 * Deprecate KaxTrackMinCache/KaxTrackMaxCache and KaxTrackOverlay
   (per RFC 9559); add missing MatroskaChapProcessCodecID enum and
   MATROSKA_CHAPTERSKIPTYPE_INTERMISSION.
 * Fix MATROSKA_VIDEO_FIELDORDER_{TOP,BOTTOM}FIELDSWAPPED values.
 * [API break] remove MatroskaChapterTranslateCodec /
   MatroskaTrackTranslateCodec.
 * Fix includes not implicit in modern compilers; add a DEV_MODE CMake
   option and a build-configuration summary.

Drop 0001-allow-build-with-cmake-4.patch: 1.7.2 already sets
cmake_minimum_required(VERSION 3.5). LICENSE.LGPL is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
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
index 164783a34f..a368c90d19 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.2.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libebml"
 
-SRC_URI = "git://github.com/Matroska-Org/libmatroska.git;branch=v1.x;protocol=https \
-        file://0001-allow-build-with-cmake-4.patch"
+SRC_URI = "git://github.com/Matroska-Org/libmatroska.git;branch=v1.x;protocol=https"
 
-SRCREV = "f5315fddda2d434e47035c038549a808d8b8eac7"
+SRCREV = "280281a8aeb69881f70ee3d6ff26aa6d964365a3"
 
 
 inherit pkgconfig cmake

