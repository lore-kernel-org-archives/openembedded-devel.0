Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1427.1793731039898249877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zYiWHsCC;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so4649497c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731039; x=1794335839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Guy0I91qw3sIoaWNcLghzUXAkO+zYUptDzp1uacYV30=;
        b=zYiWHsCCoVJYNyfa+Ij0Nq3maGrf5R6lADx2TR34e7j+6pTTvUF4+mvtDCOBbcql5u
         VymaxTCypbOlI+JxnRb2Zp4POv7l5HMQey847JU6x5jnyeXFcElwPeYDltA18Dt6FX+U
         2UXxz+1m4WHN9ObF+y3y+G4X2NIkBrNcTKm/6pj9pUa6pyjFcSgMt/WYP7X4mzdTYy+O
         nG+5oSNsZS87NOkY7le0ylbW3yjKm4mMfWJT8s92atVNlzRqsX68HIjDs3qC5xCQACIl
         Oo6hKXsUQ5wqhPO0L8npbpFsqP80AVQAHgZX4c7mdrwgL5AiVgdXDjLXSgBmFfvqStCg
         XSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731039; x=1794335839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Guy0I91qw3sIoaWNcLghzUXAkO+zYUptDzp1uacYV30=;
        b=a9Dyj5298rnoSwnAXdDCNwtKyLlYGwfKHlA3DPPoIGr4MKJo7BenXUMq/L405PPa59
         AS4LUfKgWJL0v8o6T1Y3DSbwm/d/U0QWnioe1Kf2u3Ng6GFFaUSb42/tR6AGtpNFepue
         e6woquf/Twk6K/YjpG0c3exRCRDnTzUvUIRJ4avpMRFUA1RKycX3vDSTtx89J2H7Lqwf
         MU7exb39vDjliYvrX0zDYAJAtESQ9I7PF4YQE/hYgQj/yFBLfZpWzqZCvjsBMklixUwN
         IStFQs1s1nsXWNn2efcnw7Qxa4sKEtrSc1sX4K306AM4j8WsXwJVYWEuGdl0CTxkB/wn
         ygOw==
X-Gm-Message-State: APuU4Z8IkkwqrXocDYZYG0kcjoLHHkxfew8FMZ+Te2XEFOAIuJIFHT32
	iN0N/3IvQytENmQWUbep3wsbWksPMSMazTB/vDT+vnnuZCNEM9NkrYVZ6DF3fA==
X-Gm-Gg: AYBFou3pEmT58ulftkLFaEstjTy9HWnPP19QTjVe0iAD0K6nWPp18dtDuUHN1hxiCVO
	HXCuSh/RirBJqzBnTO9pup16P7caiTw2yXS54XXPX/MAkxhYOtVyWbgC1nM427c+j4D6Wna2eeU
	+dLPSg+wRRS66OY7mkWEKCk6LGvo7Hvn7qzIYYHb2iwS9ZeTsA/JY/mGLX0frSB828faSPoTm0l
	/ZrarUV7HfQFpUqmucgpqFmsxdH7N6Yd7f9IYoo+3AksD7BdtSzNhAqtPMHlHiNWYiXcda4CD9A
	SUwlNlJGq6zwEUx9ZQgU9rADzWPBEzkHY6REXBBzdEfaCmRlf3PMi3oxnDM1kd0fPNlYRu+i04S
	r1ab9O8Xt8356lu2C06OoP190n1LY+77V3ENbV8x3JZHE4Jc1F5TE/hVTXJ7kGX2QPJlizi4rA1
	bcuXOP7LunXbD8XdbSM6Hz/N5WqCI+zxiZNJg+ZM9iAbiRhHdwW1Uz1sDJn/t7bTreY+M0CHbTf
	EtqVnKnb9leWH1rJ8rjEgVf+2Y92nmhzzbZjXeAvJE3fBTE/zoRdRgaDfngHWuWdsj3ckIA6h8w
	vZiPtMHNtWABO7deWgquLC0NiVbbgJLNr+uhzdvwSRxYtZh+ynKVJlsBQrVhDQ==
X-Received: by 2002:a05:7022:1101:b0:195:1a77:85cb with SMTP id a92af1059eb24-1ac57454ee8mr19426054c88.1.1793731039148;
        Tue, 03 Nov 2026 10:37:19 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:18 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 17/20] assimp: patch CVE-2026-117608
Date: Wed,  4 Nov 2026 07:36:37 +1300
Message-ID: <20261103183640.919438-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131815
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
 
