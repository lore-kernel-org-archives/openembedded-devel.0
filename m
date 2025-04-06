Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F49C369A2
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 07:23:19 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.20651.1743924195160307471
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 00:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VPFiefHq;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ad5236e6fd6so3047934a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743924194; x=1744528994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5z673H83bTTCe3VLYHg/FLsYHEbwTRadFNI8YqenOA=;
        b=VPFiefHqjb3ru3YIwb5uTQWxbdNdDfza0TlaWW2cpstVDMcl/CWts6RDfxO4OIjDHS
         5Vbx12/dS+cMqa7LqoPTzvEU67s70XioEtREoR+BEojob0LhDzInrScBwlOZbITRpcqQ
         WS9ynRTTMgu389y/zNgIO5m5C0B0B01JgcjPQcm9yImxpwR8i2OlOPluQHwU+Mi156In
         nDHMJ5bU8QevT/bZSsC02Jz1gAAgm4QSfadEoD9QwlTVLCQXw7H1F2/821hmKX2K9g/3
         6+Xv+fBo6ftS8prnn+Ihh00CtwJy5dskcqomL7jhL4MlzVBEobXPJFcD0tOaj2+90Yz9
         /cLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743924194; x=1744528994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5z673H83bTTCe3VLYHg/FLsYHEbwTRadFNI8YqenOA=;
        b=PIchEqPOqUbFZa41KgowAEM53kQ7Vy+wkXrDcYKQrQlRlKdHs9DfWCDG0fdESV8NbY
         VOoaroN8O44ncEQDV7VZAUGyd2+vRgeLjpvh0y+lqFOkWmxcNiygd+6Crn4fDllFZqgR
         dC4K9Z2ElMC1FoRtNqlTIwl6zIrVANW37AEEwRBtSwW2zVmd67k2MkBRUXe80CyJnDWj
         MfhicyNqf8d9iwQX7wdmBQePyBEgsKnDhayfJFU+qvzDmAsm+wRCHP3C3sWIaR2nFsmg
         fPUR2lXEofO8H4p624xtsgfwnQDqkf/fktshjzXH2cjRCK8gHmElJBlMWeY5QxZ1Z0Sg
         Pveg==
X-Gm-Message-State: AOJu0YzYi6SJ6UOzqnJAOx8y9frnGvwlIn5MGAZ1ppttlKv+yoHABc2+
	qkAHz88zvQpg0lfK0OWavssHpdlgKmNur4l911UGagtwM6QRFuEcRYaUpKBu
X-Gm-Gg: ASbGncvVi1I3Qu2xk8HCP2A+B8eksHMi+sGc0kNFrJrd1IsHu5xGfMtFFhqjF1d38UX
	O7uJEHT9SjUD9O9RrntYfOY4aPskv9VzIV2LDu2p7irJaZ1tPGQc0NNg3EDvBHeRbwpOtk20nZE
	CsXQh5ol2awn6pLBlTy+xSOr+zctmrrhktUcv55od3/hh+7MKjO7Hqoh96G8i7ro5UVuxUXTxHn
	6dGiJI5gVZoMUNcuK5cFKRuWHJ9H4hnC0OuWJxw8+NybBAXhFA2WHbv6IMPbN/JzVHgCL0dJl1a
	sWNiMXR/rWVjdaszPdqgWIAfS4x3NhdsQaI5
X-Google-Smtp-Source: AGHT+IEv6F7L4uiUQ230OVFz30PQhUU7vBoFyAqcdJdsDmTg2yspYj9fKw3KcseyFrbI7H0B7SSyIw==
X-Received: by 2002:a17:90b:53c7:b0:2ee:8ea0:6b9c with SMTP id 98e67ed59e1d1-306a47e0664mr15657614a91.12.1743924193916;
        Sun, 06 Apr 2025 00:23:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561c98496sm11373673a91.0.2025.04.06.00.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 00:23:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] icon-slicer: Fix hotspot y coordinates
Date: Sun,  6 Apr 2025 00:23:07 -0700
Message-ID: <20250406072310.862374-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406072310.862374-1-raj.khem@gmail.com>
References: <20250406072310.862374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 07:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116606

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../icon-slicer/files/hotspotfix.patch        | 27 +++++++++++++++++++
 .../icon-slicer/icon-slicer_0.3.bb            |  6 +++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch

diff --git a/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch b/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch
new file mode 100644
index 0000000000..1f8730aba0
--- /dev/null
+++ b/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch
@@ -0,0 +1,27 @@
+Description: Fix hotspot y coordinate
+Author: Tim Swast <tswast@gmail.com>
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/main.c
++++ b/src/main.c
+@@ -103,7 +103,7 @@
+   if (n_channels == 3)
+     {
+       out->x = start_x;
+-      out->y = start_x;
++      out->y = start_y;
+       out->width = source->gridsize;
+       out->height = source->gridsize;
+       
+@@ -137,8 +137,8 @@
+ 		    {
+ 		      min_x = start_x + i;
+ 		      max_x = start_x + i + 1;
+-		      min_y = start_y + i;
+-		      max_y = start_y + i + 1;
++		      min_y = start_y + j;
++		      max_y = start_y + j + 1;
+ 
+ 		      found = TRUE;
+ 		    }
diff --git a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
index 991133185f..8079f871d1 100644
--- a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
+++ b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
@@ -1,10 +1,12 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gdk-pixbuf popt"
+DEPENDS = "gdk-pixbuf popt xcursorgen"
 
 SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BPN}-${PV}.tar.gz \
-           file://0001-Makefile.am-no-examples.patch"
+           file://0001-Makefile.am-no-examples.patch \
+           file://hotspotfix.patch \
+           "
 SRC_URI[sha256sum] = "05f0216dd0c25a17859de66357f64da5033375b6fbf5f31ca54867311160b64d"
 
 inherit autotools pkgconfig

