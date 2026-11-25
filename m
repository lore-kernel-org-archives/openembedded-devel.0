Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37923.1795594074741361207
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aR98Tj2Y;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3866a784546so7289869eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594074; x=1796198874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zY6MId5f8NfFMlZaUv8GH1cB/A3TTz3u4zJDK7bcJVM=;
        b=aR98Tj2YoFGp3rEvYLUowy4/S23LsHOPmgkf8xKmwQWRkvVxh5tJfo8vihKvBUYqkB
         y9UicpROqLrK4ygTIZf5DG4jw2cqSOQOZsHshKlSefU5sCFjt9oXOBCAFy6lc/4aLY3X
         4pGSpCk6fYsZuq1hibCFNhyBq0fvO9oUptIi4xXnk9c2oScMglz+EI9zLEmydBxw+k44
         YkIaAbaiavWGFiDkcDFVwoRDBw2kXFXIye9FGDx/8+DwSqB70DdBk8R8mqbDSLHoM+9G
         qrV3tVdy3tFLD+g8VicVEvX/YSNyQs6gbFoHb8QS80ub6dFdisWZP7sQg7Ewn4EBMf2m
         K4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594074; x=1796198874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zY6MId5f8NfFMlZaUv8GH1cB/A3TTz3u4zJDK7bcJVM=;
        b=v38eTDSXHWWbQU9h26Fo/bxiXKaUVShMz6HFr2xLQQtQEG3MEmPW4J5gdzSIz83QHw
         lC159YmxKlPYLneZPeJtJpQlrENKRnmyqUmZHfNItxo0mn5M/VVcfmG+YPtvnI7XPjWu
         DuHngxyxzi0tX6Lmo5U/zH133S3w29azInvmGT6+7PZz56xAe+cLUjtAAeHAKi3Vq93u
         qtsCc1kHZwwDvbuz4r+ijJSymuI3iwmWDLUmXzz1TngJO84019o2ypwGncRPSHwToR/i
         6jIhPnZbhlWRLva+ul8Ksga0OM2ia6RZMMrVBFqSvDBk00BROM65GfLvnvqJqQky+CS1
         60dQ==
X-Gm-Message-State: APuU4Z/dsDRT1jLe83AC+P1yzk1twB4lZDTMDPN5I+W3tcd7YN0h1EgY
	+du34K1oRcFCdUf4IZAUQhrprsuANkqrvbn46wpIZiRqVjHXajy77qupXs6GJUaj
X-Gm-Gg: AZFdTZc+W7EuzocP7ODPQeRn32btxbNPiEmSn02ZxFhV4uqCW82ctNSG2IyQB0ysLUQ
	bABenpoGOWWsckflvoiHxnG9Xg1YBZT4IZQB3RzoVJCl14pUZR8bdZrHYwrZbJCrj64yfUgZVZV
	fREo2+3nlsVTkrgLrIMz/0PkOYhuAqfF7PLcijOUal5xR4L0hd9nkq3p4ioGxezjd18wMNLpsp2
	BnZi44W3MjFHfnLhCgQQ1I/OdPyKYNRfqwPBflWVvCSA5hScyEKnwnebVtT/ezPmGWCbOwWhfiy
	8Vt21HHoY9IZjak3H9698NTVrU8vHFupA2Whddu8RQATslEtZCfiH2dLRu6yFyf24OreDF8oXjV
	IFxs3ASPE9s2GhAhJNJEfDjRm3prhUWJJrJV5ITODdINFOePJc5bXwVjEgw2HHzCxMAsVwo3OMs
	XY4B1VHFuVh+UvqUdD2teuOpUdUbHDSj97pzgTxug2TYG6rv61wCi9+tyzUD7POJC2KHvrYgzqg
	YyAAbYXkRPcrCO/edtBIMQH/XUjkV9RRY6N2FIRnU1oJ8MbaR+RSkwNWtc5lmPFlo7cHH1dUN8P
	ibPD0KrC/hIPgxQQn7O6UOmekGPm5cHrGdnWIu6pHBEtYkF/SuQF4xnyrwIlWM4wj8MQQZnZoRg
	S/7N4Q38E60To7IGKdDlWow/lYALStDcrsSiB14DoyCiFfpafwoUOXrvIV06Qe5CoJ58IQPgi8E
	wihC1JP+TnbFLb1mYUUMleBj9DXDnRo2bY5WM/Mw6zmEkLljB1wEhJQkNPLeSiz0F71DPR/YWEY
	tTHUA2oGJYNey0b5BEl8sEDHL2HCLWEXred77O3oKy4MZbvhols9LV9vOx24yL3g1XckA64tDBp
	zF2y
X-Received: by 2002:a05:7301:6405:b0:381:a3bb:f945 with SMTP id 5a478bee46e88-38570254ec3mr20514636eec.22.1795594073857;
        Wed, 25 Nov 2026 00:07:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 08/55] assimp: upgrade 6.0.x snapshot -> 6.0.6
Date: Wed, 25 Nov 2026 00:06:24 -0800
Message-ID: <20261125080732.2419614-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133011
Content-Type: text/plain; charset="utf-8"

- Large hardening pass across importers (OBJ, PLY, FBX, glTF2,
  MD2/MDL/MDL7, MDC, Q3BSP, Q3D, IQM, LWO, X3D, COB, Blender, STEP,
  OpenGEX and more): many out-of-bounds reads/writes, integer overflows,
  null dereferences and leaks found by fuzzing are fixed
- New safe allocator and stricter bounds validation in parser and
  allocation paths
- glTF2: fix normalized skin weights, KHR_texture_transform mapping and
  sparse accessors; exporter gains unsigned short indices and
  KHR_texture_basisu metadata fixes
- DXF gains POINT entity support; fix binary STL import on big-endian
  hosts
- Windows ARM64 support; PyAssimp drops Python 2 and gains tests; tests
  can be installed via CMake

Use the v6.0.6 release tag instead of a master snapshot labelled 5.x,
which already carried 6.0 code. Drop the CVE-2026-117608 patch, which is
part of v6.0.6, and add an upstream check.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../assimp/assimp/CVE-2026-117608.patch       | 62 -------------------
 .../assimp/{assimp_git.bb => assimp_6.0.6.bb} |  8 +--
 2 files changed, 3 insertions(+), 67 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/assimp/assimp/CVE-2026-117608.patch
 rename meta-oe/recipes-graphics/assimp/{assimp_git.bb => assimp_6.0.6.bb} (88%)

diff --git a/meta-oe/recipes-graphics/assimp/assimp/CVE-2026-117608.patch b/meta-oe/recipes-graphics/assimp/assimp/CVE-2026-117608.patch
deleted file mode 100644
index 2a388cb147..0000000000
--- a/meta-oe/recipes-graphics/assimp/assimp/CVE-2026-117608.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 9b9c149237ff7bf7f71db8eba7b6cc707e00e0bc Mon Sep 17 00:00:00 2001
-From: venkatchalla06 <111296179+venkatchalla06@users.noreply.github.com>
-Date: Sun, 25 Oct 2026 19:48:47 +0530
-Subject: [PATCH] MD2: compute the frame-table bounds check in 64-bit (integer
- overflow) (#6963)
-
-The header validation rejects out-of-file offsets with
-    offsetFrames + numFrames * frameSize >= fileSize
-but numFrames is an attacker-controlled uint32 and frameSize is an unsigned
-int that grows with numVertices (another uint32 field), so the product is a
-32-bit multiply that can wrap. The AI_MAX_ALLOC guards above bound numFrames
-only against sizeof(MD2::Frame) (~44 bytes, ceiling ~48M), while frameSize can
-be far larger (e.g. numVertices=1014 -> 4096), so numFrames ~= 2^20 already
-wraps numFrames*frameSize to a small value and the check passes. The frame
-vertices are then read out of bounds (heap OOB read / info leak).
-
-Compute frameSize and the four offset+count*size checks in 64-bit so the
-products cannot wrap. Reachable from Assimp::Importer::ReadFile() on a crafted
-.md2 (MD2 is default-enabled). Confirmed with AddressSanitizer
-(heap-buffer-overflow READ in InternReadFile); valid .md2 files
-(dolphin/horse/flag/faerie) still load unchanged.
-
-Co-authored-by: Claude Opus 4.8 <noreply@anthropic.com>
-Co-authored-by: Kim Kulling <kimkulling@users.noreply.github.com>
-(cherry picked from commit 7dbc85d9218fae017d4fad70269e7569f7b0c870)
-
-CVE: CVE-2026-117608
-Upstream-Status: Backport [https://github.com/assimp/assimp/commit/7dbc85d9218fae017d4fad70269e7569f7b0c870]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- code/AssetLib/MD2/MD2Loader.cpp | 18 +++++++++++-------
- 1 file changed, 11 insertions(+), 7 deletions(-)
-
-diff --git a/code/AssetLib/MD2/MD2Loader.cpp b/code/AssetLib/MD2/MD2Loader.cpp
-index f7101560d..adce318f8 100644
---- a/code/AssetLib/MD2/MD2Loader.cpp
-+++ b/code/AssetLib/MD2/MD2Loader.cpp
-@@ -171,13 +171,17 @@ void MD2Importer::ValidateHeader( )
-     }
- 
-     // -1 because Frame already contains one
--    unsigned int frameSize = sizeof (MD2::Frame) + (m_pcHeader->numVertices - 1) * sizeof(MD2::Vertex);
--
--    if (m_pcHeader->offsetSkins     + m_pcHeader->numSkins * sizeof (MD2::Skin)         >= fileSize ||
--        m_pcHeader->offsetTexCoords + m_pcHeader->numTexCoords * sizeof (MD2::TexCoord) >= fileSize ||
--        m_pcHeader->offsetTriangles + m_pcHeader->numTriangles * sizeof (MD2::Triangle) >= fileSize ||
--        m_pcHeader->offsetFrames    + m_pcHeader->numFrames * frameSize                 >= fileSize ||
--        m_pcHeader->offsetEnd           > fileSize)
-+    // Compute in 64-bit: numVertices/numFrames are attacker-controlled uint32 header
-+    // fields, so numFrames * frameSize (frameSize itself grows with numVertices) overflows
-+    // a 32-bit product and can wrap past the file-size check below. The AI_MAX_ALLOC guards
-+    // above only bound each count against sizeof(element), not against this product.
-+    const uint64_t frameSize = (uint64_t)sizeof(MD2::Frame) + (uint64_t)(m_pcHeader->numVertices - 1) * sizeof(MD2::Vertex);
-+
-+    if ((uint64_t)m_pcHeader->offsetSkins     + (uint64_t)m_pcHeader->numSkins     * sizeof(MD2::Skin)     >= fileSize ||
-+        (uint64_t)m_pcHeader->offsetTexCoords + (uint64_t)m_pcHeader->numTexCoords * sizeof(MD2::TexCoord) >= fileSize ||
-+        (uint64_t)m_pcHeader->offsetTriangles + (uint64_t)m_pcHeader->numTriangles * sizeof(MD2::Triangle) >= fileSize ||
-+        (uint64_t)m_pcHeader->offsetFrames    + (uint64_t)m_pcHeader->numFrames    * frameSize             >= fileSize ||
-+        m_pcHeader->offsetEnd > fileSize)
-     {
-         throw DeadlyImportError("Invalid MD2 header: Some offsets are outside the file");
-     }
diff --git a/meta-oe/recipes-graphics/assimp/assimp_git.bb b/meta-oe/recipes-graphics/assimp/assimp_6.0.6.bb
similarity index 88%
rename from meta-oe/recipes-graphics/assimp/assimp_git.bb
rename to meta-oe/recipes-graphics/assimp/assimp_6.0.6.bb
index 5fd56f719d..b21bf16574 100644
--- a/meta-oe/recipes-graphics/assimp/assimp_git.bb
+++ b/meta-oe/recipes-graphics/assimp/assimp_6.0.6.bb
@@ -9,13 +9,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2d38c9e0d63058b051065fb7b1102a8"
 
 DEPENDS = "zlib"
 
-SRC_URI = "git://github.com/assimp/assimp.git;protocol=https;branch=master \
-           file://CVE-2026-117608.patch \
-"
+SRC_URI = "git://github.com/assimp/assimp.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "fe1965b3e73f7c241265e8e5b3015764936a6ce5"
+SRCREV = "a79ff6bbce54d3e01186a918dc6374ed55317426"
 
-PV = "5.x+git${SRCPV}"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake
 
