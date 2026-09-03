Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C39C624DD
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:14 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4047.1788429005359701763
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GiB898LZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8557c3f270eso1325046b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429005; x=1789033805; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lm2QpSpFvF/DJsG27XJfFjdTfYNh8kpafJ8z1pv7rcU=;
        b=GiB898LZQrQ+OFHf6F7TiSiQndxfdvv+XviL/EFTKFiQdX+dnyJtp0/D9AclMeKGtr
         nv/704eMoFo6HPrDfOXJUjWwNE8TTTN2OucODXOw9UkvZHMr1xxeMo651TJnx0uQ9tJ8
         4roCh7tZ6UNrXMRqGyoR/jSvBRjIUCFWZdNsUTl5yHUSqvh+LRyojoopgN7VO/lPsbKm
         vRj48h1l4RALIO2r6Je9XoNL72xEHnH/Q/fhCepq908tP9TA1Qs1X2Ta/8igCYp3Vg0/
         1mpgHe+fMveEkzVNU81M9RbBnQU9kxrj53SYftOgzZCNTBjdwoW1G4JBucWwf6CQwcEE
         Detw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429005; x=1789033805;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lm2QpSpFvF/DJsG27XJfFjdTfYNh8kpafJ8z1pv7rcU=;
        b=b0ZMuw7LfhlOQJmIhppA5Mtrq9vEf63JKwl66ze6z70SEPQU5FxYDLlNAxCJdTx1sh
         Lpg1qWl+uzErIUaRe+xT5ApmdzJU9NBDdIsk5FdmzckTqddJYoXjXo9bfaqG3DQcjguF
         mwCWJn3i6dyoFZD5ExnQLBijv1ZesYtcjaXsW8GqfNMRnJbyE3tmDlgzuHQOzbIdxZRh
         dl8iH4KpMnxIuV/lyp4uMicBqSAviDbC0ZwSOWx8z9ZLAXKoGVGpa6MDBtXnzOGseY4K
         IOZS6OJSFZ8d9GRkU72K0H0j2Spr5Mor3RLm232xilb729cSNkRyj+n+EGvpF2y26v63
         GJoA==
X-Gm-Message-State: AFuF++nD5fm1dORnnxR07p8Ly6nkI/9qtrSVDRevkiHtw3wFSwdzoD6K
	O8yTR93bGOlZHMXIACGalb23+iXRZwL+gsx8OP8BzrUnRDNoraJAdR6DyMZf3nLF
X-Gm-Gg: AYBFou1XWJdY2FKyBLqvTuRWMsBokIFOgX/tpfTHGt1mmqYPTiRM7PNXqQR3xsah08u
	Az1RSM9PrbQzPY5iZMWulz+bmIHy/h3r/lL1Rh1Sp/9NSbPojsYiUg6VjMbzQJB+ENJXFGutiyX
	dKhUmIc6tr1K3Qn9d/jBxGavnyyXJLxEfSinBrpGiP8M571OKJbQpHoCS2I5h0ZVDdyMvsFwHjk
	nkNP3P9CoN1a0MONbNNwgo0DiUoNRtydW1XZt9UIqBWZQCw7uQncW6QXEioANbLE5ji4SV9RyC+
	VQm4/66/rA+X29fgOpINZlQadfpvOVvz1bR15++vyaX2OJNvXEPbq4ffG40NNpJnAlnt42MRv+J
	LS9DnWRQPxw1kMdFg+qMyg6bDz+p4iFb6273x+4tK91DZmo8KQN01Z6+pVZLVFR8egoxT59n+fD
	oiDQXyFYkECVwER6s4EHxphGlnDl5CPqHwz+1LqANJK6fBDTLKtxTjTE/pNfm/8noQ3SMY5nJCT
	sm+hlcpQb0=
X-Received: by 2002:a05:6a00:3021:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-85ed7158015mr16779738b3a.2.1788429004612;
        Thu, 03 Sep 2026 02:50:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 2/22] lcms: patch CVE-2026-42798
Date: Thu,  3 Sep 2026 21:49:33 +1200
Message-ID: <20260903094954.3240723-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129718

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-42798

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../lcms/lcms/CVE-2026-42798.patch            | 38 +++++++++++++++++++
 meta-oe/recipes-support/lcms/lcms_2.18.bb     |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patch

diff --git a/meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patch b/meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patch
new file mode 100644
index 0000000000..fa3f497be6
--- /dev/null
+++ b/meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patch
@@ -0,0 +1,38 @@
+From e05d3427b84028854177a417572e96543a40c3eb Mon Sep 17 00:00:00 2001
+From: Marti Maria <marti.maria@littlecms.com>
+Date: Thu, 19 Feb 2026 08:48:50 +0100
+Subject: [PATCH] Fix for ParseCube integer overflow in LUT allocation
+
+thanks to @zerojackyi for reporting
+
+(cherry picked from commit 6a686019825a89b715d16671f18d049523354176)
+
+CVE: CVE-2026-42798
+Upstream-Status: Backport [https://github.com/mm2/Little-CMS/commit/6a686019825a89b715d16671f18d049523354176]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/cmscgats.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmscgats.c b/src/cmscgats.c
+index 862eb91..7248d39 100644
+--- a/src/cmscgats.c
++++ b/src/cmscgats.c
+@@ -3180,7 +3180,16 @@ cmsBool ParseCube(cmsIT8* cube, cmsStage** Shaper, cmsStage** CLUT, char title[]
+ 
+             if (lut_size > 0) {
+ 
+-                int nodes = lut_size * lut_size * lut_size;
++                int nodes;
++                
++                /**
++                * Professional LUT‑generation tools (e.g., Nobe LutBake) list 65×65×65 as their highest supported size.                
++                */
++                if (lut_size > 65)
++                    return SynError(cube, "LUT size '%d' is over maximum of 65", lut_size);
++
++                nodes = lut_size * lut_size * lut_size;
++
+ 
+                 cmsFloat32Number* lut_table = (cmsFloat32Number*) _cmsMalloc(cube->ContextID, nodes * 3 * sizeof(cmsFloat32Number));
+                 if (lut_table == NULL) return FALSE;
diff --git a/meta-oe/recipes-support/lcms/lcms_2.18.bb b/meta-oe/recipes-support/lcms/lcms_2.18.bb
index 1ff3b3908f..501e1e2a79 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.18.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.18.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz \
            file://CVE-2026-41254_1.patch \
            file://CVE-2026-41254_2.patch \
+           file://CVE-2026-42798.patch \
            "
 SRC_URI[sha256sum] = "ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347"
 

