Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5130.1793782723910745238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 00:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eD0DOqhT;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc502d509c0so167198a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 00:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793782723; x=1794387523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Guy0I91qw3sIoaWNcLghzUXAkO+zYUptDzp1uacYV30=;
        b=eD0DOqhTG3ukvnc8SP7pZQ6F7EKinSftKurbRvUSJFffRWfKkiXmcxStUJ3yU9K9dk
         5EzG8eJgKrQd+SgPw+fwMahMNo211DA67xphy8oBs90Uysjs6FWv46DWXmunHgqLOUSh
         Y0bSivbiD73Qk/427u9IqLP6j1yWA7jYcls4DMqjfSRrTE587NVB/wlTzkG5tGif9nW0
         LSkafeL1s+kqxOqCsWNym5CRdAfWHp1qnVZcF9zfu2rkpVyz4YyWnoGze3pLItCSDXg+
         tC5jIbvf9dDEc59pPGm46sqFweI/uR/hGk5IplQPHQG8t26jJv6YYKTNth+UqTl3i2Xn
         sO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782723; x=1794387523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Guy0I91qw3sIoaWNcLghzUXAkO+zYUptDzp1uacYV30=;
        b=WPSHtZWuPvODSweNhJBBUe+TW8sZOqTvYVpCSCkIAZ5cND5m8oR4beYzm6Lu/rn9Qx
         CXyRq54TfgiNjFAJPM/sPGWHEe9QVUhhtz5L5znuQcB95QWQAvamRFAbAzjhbzURtiUS
         /hxC+WmySNOK0YDypenB7kkh7wgJ5gaXMft6WaMssxluCVdDFoBToLMar2HiViehiUnS
         aHGHVr0JDrRz/sqV62yWPhwdA8wLHSfJm6oijlc5dfl71JsK99xA4Prx+bFSjDo9uEn2
         ifq/30zJiBwc/q6kWRVfTT4/2L+ga+1eacGndw05XVUCF8Am9ivb1oCAfrUPC7Nt9w9y
         EwwQ==
X-Gm-Message-State: APuU4Z9OfX636Yt09yVIn77iiLZh1jZ/r+Cq1EE2scKvGqRYZE1TdufR
	++fbbgGVoZ1F2xgVD9O5OJmrM1XhBf7Li2yZEdnelE+W35Uy7e1Dq/kMab1QqA==
X-Gm-Gg: AYBFou1h010FtvMU/NI9IttBTxkIhu2Kx1y0Ikv5q6fNep02jkWe/9g01XCVRJTwKhJ
	9SSVF8FxTi8oFOaGVVZpr5NOczjM8+qdf1Kr/FO2hNix1V8+Uju4NfCezkNAjfXtr1IJBTpsC2V
	2/NVEpPFVt1u36qGPUIg7ab/gJMMOkDf2ZGQ2Sxv3F4hg9wG4O87MZL4Z/d8tdY/50OZ06LTiuH
	kqrdj9qqoSVFQ0taoe5mGlx61ox50GVpkKXfTOE8wiHUpDXWmnKOBcj2Q5ZDl5uiwtcNAXVK4W3
	5OA/FE/AVmhmUVxlek+bbxt6LhTDO3wnr9lET4uPuBQYsjA2MFTDrPc440/xu5Ld/It5qRcNJCX
	PUlvzwiwDy0ZH2wvCzTWw4vcZxYo+h/JKgIbV6ch/Gl07NZuF1d9wTS/pctscjwyyrG+l6mZePl
	d+ajToIzWnMmCDARpueEjbSJO/EdUIDcG7lI+tOCzYWvgIfyaosWlv+HXqgoPET1DneUBS/nKyQ
	vwEoiWt/mXP/81jvSfzP6ACIHkr3GGIi4gCOMgKPo/UFy8yeZoL34YJ2WWzmJA6NmLp4fj95QWK
	JetjT/w/UQOb2f0HMrDIPpG/LIsB+xNC4bv6HyN7BcstfqUfhRbstQ9Qc6mB3w==
X-Received: by 2002:a17:90b:17cd:b0:3ac:9e5e:d195 with SMTP id 98e67ed59e1d1-3ae89851212mr12224565a91.61.1793782723089;
        Wed, 04 Nov 2026 00:58:43 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3139981a91.1.2026.11.04.00.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:58:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 1/4] assimp: patch CVE-2026-117608
Date: Wed,  4 Nov 2026 21:58:31 +1300
Message-ID: <20261104085834.1877643-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 08:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131835
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-117608

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../assimp/assimp/CVE-2026-117608.patch       | 62 +++++++++++++++++++
 meta-oe/recipes-graphics/assimp/assimp_git.bb |  4 +-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/assimp/assimp/CVE-2026-117608.patch

diff --git a/meta-oe/recipes-graphics/assimp/assimp/CVE-2026-117608.patch b/meta-oe/recipes-graphics/assimp/assimp/CVE-2026-117608.patch
new file mode 100644
index 0000000000..2a388cb147
--- /dev/null
+++ b/meta-oe/recipes-graphics/assimp/assimp/CVE-2026-117608.patch
@@ -0,0 +1,62 @@
+From 9b9c149237ff7bf7f71db8eba7b6cc707e00e0bc Mon Sep 17 00:00:00 2001
+From: venkatchalla06 <111296179+venkatchalla06@users.noreply.github.com>
+Date: Sun, 25 Oct 2026 19:48:47 +0530
+Subject: [PATCH] MD2: compute the frame-table bounds check in 64-bit (integer
+ overflow) (#6963)
+
+The header validation rejects out-of-file offsets with
+    offsetFrames + numFrames * frameSize >= fileSize
+but numFrames is an attacker-controlled uint32 and frameSize is an unsigned
+int that grows with numVertices (another uint32 field), so the product is a
+32-bit multiply that can wrap. The AI_MAX_ALLOC guards above bound numFrames
+only against sizeof(MD2::Frame) (~44 bytes, ceiling ~48M), while frameSize can
+be far larger (e.g. numVertices=1014 -> 4096), so numFrames ~= 2^20 already
+wraps numFrames*frameSize to a small value and the check passes. The frame
+vertices are then read out of bounds (heap OOB read / info leak).
+
+Compute frameSize and the four offset+count*size checks in 64-bit so the
+products cannot wrap. Reachable from Assimp::Importer::ReadFile() on a crafted
+.md2 (MD2 is default-enabled). Confirmed with AddressSanitizer
+(heap-buffer-overflow READ in InternReadFile); valid .md2 files
+(dolphin/horse/flag/faerie) still load unchanged.
+
+Co-authored-by: Claude Opus 4.8 <noreply@anthropic.com>
+Co-authored-by: Kim Kulling <kimkulling@users.noreply.github.com>
+(cherry picked from commit 7dbc85d9218fae017d4fad70269e7569f7b0c870)
+
+CVE: CVE-2026-117608
+Upstream-Status: Backport [https://github.com/assimp/assimp/commit/7dbc85d9218fae017d4fad70269e7569f7b0c870]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ code/AssetLib/MD2/MD2Loader.cpp | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/code/AssetLib/MD2/MD2Loader.cpp b/code/AssetLib/MD2/MD2Loader.cpp
+index f7101560d..adce318f8 100644
+--- a/code/AssetLib/MD2/MD2Loader.cpp
++++ b/code/AssetLib/MD2/MD2Loader.cpp
+@@ -171,13 +171,17 @@ void MD2Importer::ValidateHeader( )
+     }
+ 
+     // -1 because Frame already contains one
+-    unsigned int frameSize = sizeof (MD2::Frame) + (m_pcHeader->numVertices - 1) * sizeof(MD2::Vertex);
+-
+-    if (m_pcHeader->offsetSkins     + m_pcHeader->numSkins * sizeof (MD2::Skin)         >= fileSize ||
+-        m_pcHeader->offsetTexCoords + m_pcHeader->numTexCoords * sizeof (MD2::TexCoord) >= fileSize ||
+-        m_pcHeader->offsetTriangles + m_pcHeader->numTriangles * sizeof (MD2::Triangle) >= fileSize ||
+-        m_pcHeader->offsetFrames    + m_pcHeader->numFrames * frameSize                 >= fileSize ||
+-        m_pcHeader->offsetEnd           > fileSize)
++    // Compute in 64-bit: numVertices/numFrames are attacker-controlled uint32 header
++    // fields, so numFrames * frameSize (frameSize itself grows with numVertices) overflows
++    // a 32-bit product and can wrap past the file-size check below. The AI_MAX_ALLOC guards
++    // above only bound each count against sizeof(element), not against this product.
++    const uint64_t frameSize = (uint64_t)sizeof(MD2::Frame) + (uint64_t)(m_pcHeader->numVertices - 1) * sizeof(MD2::Vertex);
++
++    if ((uint64_t)m_pcHeader->offsetSkins     + (uint64_t)m_pcHeader->numSkins     * sizeof(MD2::Skin)     >= fileSize ||
++        (uint64_t)m_pcHeader->offsetTexCoords + (uint64_t)m_pcHeader->numTexCoords * sizeof(MD2::TexCoord) >= fileSize ||
++        (uint64_t)m_pcHeader->offsetTriangles + (uint64_t)m_pcHeader->numTriangles * sizeof(MD2::Triangle) >= fileSize ||
++        (uint64_t)m_pcHeader->offsetFrames    + (uint64_t)m_pcHeader->numFrames    * frameSize             >= fileSize ||
++        m_pcHeader->offsetEnd > fileSize)
+     {
+         throw DeadlyImportError("Invalid MD2 header: Some offsets are outside the file");
+     }
diff --git a/meta-oe/recipes-graphics/assimp/assimp_git.bb b/meta-oe/recipes-graphics/assimp/assimp_git.bb
index 561ef50508..5fd56f719d 100644
--- a/meta-oe/recipes-graphics/assimp/assimp_git.bb
+++ b/meta-oe/recipes-graphics/assimp/assimp_git.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2d38c9e0d63058b051065fb7b1102a8"
 
 DEPENDS = "zlib"
 
-SRC_URI = "git://github.com/assimp/assimp.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/assimp/assimp.git;protocol=https;branch=master \
+           file://CVE-2026-117608.patch \
+"
 
 SRCREV = "fe1965b3e73f7c241265e8e5b3015764936a6ce5"
 
