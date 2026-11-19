Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1860.1795113390174929289
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HueXN45X;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a05b210703so84058b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113389; x=1795718189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Guy0I91qw3sIoaWNcLghzUXAkO+zYUptDzp1uacYV30=;
        b=HueXN45XphcZv8BsjZ1qA4LxB70BXZIP1hfvH/lYTNRdTMuliMkJ3712FO/FWYkukF
         HDoa9iNruwUvxD38dkTch8yEeSQ9VCPsXWhhFerf6NE9eG+CHZiZHT4rv06mioxGOsca
         sLdckXDpKpEmyASXZHYn+wtLyOU8txiZURc9rTHPPZZahRHO5QbwMuXulphBcsP2dIBF
         ECYHn2x21FdOCpz0BjvdNZtrpBeZvG4Xf1FSIHb2hApyzRnZ1USdM932VN2wP43ytUxk
         P72ZPDmqeRSkKEKBoivR662NFySIH/BRz35jJTMW7DeEdTIYUvwWgHt3JSS6BnRLjj3U
         rFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113389; x=1795718189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Guy0I91qw3sIoaWNcLghzUXAkO+zYUptDzp1uacYV30=;
        b=Vy2BPLu5IHxgVQFQpXTwXifPZz7yjhqznfgeTWZ1Rbbw/okIgP70J/wqbg/PcaVPk6
         BcbKp4ljVy9n/KLTGw7JRTeTl3IXOrSzwuttPUK7AeswN/fopt85HFl6+ywlhEBYE8T3
         zYMjgRl0cuB4zaDli/J3cPvNY/cnXVjYtN7xTWxJ7RLjt+ZFeBiEuIsOKr7VRM6SA1vy
         zXCnJ78ebD9ERw3Qvo3J9VT5UPlU66NfdjtxzY3EJ7H8X8ANijEYXcIcSy5MFUTj9jNm
         W3uARp8kx69mGFM8DCArwDFS1X0kmPvRmtjy3gKzDe+sb5nzwR4n51ZwUvVx1tOth7Zh
         Ev6A==
X-Gm-Message-State: APuU4Z8udujxgmC8O2QwMJ1ocTPpwdAhxdtyKQFvCznyOIdOnq4Ln8k2
	h2PZhNw7IFzGoK9NqzSWg+A4AoYotITxFgyDTxbzaAApkFN/t3wjBA1fIjjFhw==
X-Gm-Gg: AYBFou1vfc7eeRxHYnI/jkJ/2YqIpDQgriNvMdwwGrGef/pJ1uSui+V+mIEV3tEcjk+
	enpmY3Jd/1ZJwupbSLEGvvfOMo+FRrjjH2q4N2uQfCljbWcAjhqW0iEtIJMhKoGv4PZD6u2Gxqs
	0J0Id2TzBBiCgtadKhIABCfnnbzjU5JZuvxZQBMuLFqXCjoxJ44jFxh5KOjqudbYUQA5Xf0pgbI
	ygjst+YsW2WNBwsZuT73t33Obm54ufMzqdkzKYM0BPS82Z15rlXwbV9+zIcxKSU7BjfqBSI/MBh
	KH938/Vk9C9bJrJu2ZPwpeLqAm1cfusKZcqEyMGv9L5G40Dy4M+A1mOQP12V/zNsHe0HM0LVacV
	5us1ms3SYOMLgWIlF7iEuxgd0OHE4WfVyYMR3enrj/3zX6YSIxFMauJ56zHXadXPszVkROFkjTH
	nO77XlS8/JcH39g/3FvXHJ/lX/T5v7oMiIJZpPMZTY26/nTcxAm8NZkQXBIQRdJaqkM/+XQoxrx
	b/qOz9GxeBhd5KLiLxcExWiUaXbLwErk9UD63o9rg46qoJkLl1Po4LzmevLSYKfRxJCa5gyBO3D
	pCl1G23HjNrq9ErTbkLorNBXLGYYJlUQINyVNYdTGDyXBb8aurOBHaQXegmX0w==
X-Received: by 2002:a05:6a00:1788:b0:88c:fa50:1a86 with SMTP id d2e1a72fcca58-8c87c09ec5fmr479277b3a.25.1795113389340;
        Thu, 19 Nov 2026 10:36:29 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:29 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 13/64] assimp: patch CVE-2026-117608
Date: Fri, 20 Nov 2026 07:32:41 +1300
Message-ID: <9a7dd7d8bb9684473f9f5079750ad517978c87d8.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132703
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
 
