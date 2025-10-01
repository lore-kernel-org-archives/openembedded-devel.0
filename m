Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3816DCCD188
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:58 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.18459.1759326773954237558
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L9CW+JTa;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so14479868a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326772; x=1759931572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsiebbfBy4XlHwxnx2ZwI1Yc//y/5N9cyzLPeV+jd/M=;
        b=L9CW+JTa6UD2OyIAm1VB7jBOwpxzZ8XXJA/BpUm6ENHwvvVxoCb+y8HvUiI4dh+mAH
         uFsXx+NGn/NFCBR7nWgTTEcYk2T074jU13z+zW/YcrgZhs+M+qdOVj/f91+t977Lodeb
         I+7zaDEQJvHYsW+dSGoQF9fTVgkZGJ51u/RSAWyLZ5uoVdhwX3Dsc3H15rMjt5DuohiA
         tBKmbxY8JIFqN6BzyOqh+rWC28acnhbrVPCWEn2lQO/0GQA3XtpbEAn0rItcRIXW1bAD
         Oa1JqSsmsBmVjhwN/DPL4sKhbx1/g/ylDB2j2B0MxJ++pGhVDsmOYD5xSHY07jW+CIl5
         Z6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326772; x=1759931572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsiebbfBy4XlHwxnx2ZwI1Yc//y/5N9cyzLPeV+jd/M=;
        b=W4Jp5FwMgRKwDJ3rtNLtH/WFA3x9c4T5WXTXAUK6592VMjTc14uDT9xCb5cvmqJkTt
         5JdfuIY/RB2QEHwkYQ2IxbIEi+qUExUr0BS1NGZ/ZD1hLgCT7Zh+bYEIbzY46CRZPbpe
         P1MbRSPTxQlPQ3M1aUojAoiJEJs/LCl1KQp5MFN0zBeE152/BjvVquzLHs204pp/XPSu
         pC/yORnD71W2U+BRlCeH5e7d9JRQ5D2YWHMgzLNNKKkPy8ib1PLtJ8rnXtw/3CBABVOL
         3znNbqgt04hUFcSUssFMJOCDR5Lrt72P5y5C7CnzaMkkZoHhQD4KiK04JuheW1i4UHKE
         cgiQ==
X-Gm-Message-State: AOJu0YzDR/UtWiYreNOs1i7ty2wiMKy2Ls9q5CzFjB4QgJ1G2mr8uUHx
	YHaMIPPuIK9W4lwavuBVo/5xnLjb5TNaPRZug4b75zhUq9v/PgohHpIjN0RPmA==
X-Gm-Gg: ASbGnctL4krwd/Wff8svznomXuQ7mSuD8bEnsoLiTlMq0UhPBkV1qNpx0AJI94VuQQ2
	WKKnasjH/PJnzuj6GNL4rylh9HKmJI1DyQlH7xAZsjWJKQr2F7JwV/fXs08kkzKLwy/4zziUHp9
	dCmqMjY1N3Vjwgg9EvS66nmQcNCLj8fXslaXq2L5NLReOKae1RvDZDD32z0JX6rhvcLW37y9Nwo
	k2BC4EskZaRGUrYpdwWgxPeKRXFb4RPJrfsnpd6zOi+q1rEtr5hcN/9yAby85QJl4LiTWqTLBVE
	EjEm6IuFnLlKG67a8h3K+Q5REl57zswU1N2OoYhanejqN2Sh13FFsqJqNovc9QPKaGcyDhJDw2X
	rHnCFg3kwO9OqdjYnElHyA5IsDwxz65G610OVGSqqamhSMWp6PTmkpB0=
X-Google-Smtp-Source: AGHT+IEiXMofSSwQZPosNrrdJYAD/zxfMcm7hlP2I13ClSAHJYydfMsvWpcVKaZis7nrc4ceD2IowQ==
X-Received: by 2002:a05:6402:13d2:b0:61c:1b27:56d4 with SMTP id 4fb4d7f45d1cf-63678cfe8demr4061075a12.35.1759326772227;
        Wed, 01 Oct 2025 06:52:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 10/25] libsdl: fix CVE-2022-34568
Date: Wed,  1 Oct 2025 15:52:28 +0200
Message-ID: <20251001135243.1490753-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120125

From: Lee Chee Yang <chee.yang.lee@intel.com>

CVE-2022-34568 affected
From (including) 1.2.1
Up to (including) 1.2.15

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 49c97b4eefa6efc87f023c07ce6fbb7a93c79a0f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libsdl/libsdl-1.2.15/CVE-2022-34568.patch | 28 +++++++++++++++++++
 .../recipes-graphics/libsdl/libsdl_1.2.15.bb  |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2022-34568.patch

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2022-34568.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2022-34568.patch
new file mode 100644
index 0000000000..7561300cb3
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2022-34568.patch
@@ -0,0 +1,28 @@
+CVE: CVE-2022-34568
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/d7e00208738a0bc6af302723fe64908ac35b777b ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From d7e00208738a0bc6af302723fe64908ac35b777b Mon Sep 17 00:00:00 2001
+From: Ozkan Sezer <sezeroz@gmail.com>
+Date: Sat, 18 Jun 2022 14:55:00 +0300
+Subject: [PATCH] SDL_x11yuv.c: fix possible use-after-free
+
+Fixes: https://github.com/libsdl-org/SDL-1.2/issues/863
+---
+ src/video/x11/SDL_x11yuv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/video/x11/SDL_x11yuv.c b/src/video/x11/SDL_x11yuv.c
+index 62698dfd9..0d5754e3e 100644
+--- a/src/video/x11/SDL_x11yuv.c
++++ b/src/video/x11/SDL_x11yuv.c
+@@ -374,8 +374,8 @@ SDL_Overlay *X11_CreateYUVOverlay(_THIS, int width, int height, Uint32 format, S
+ #ifdef PITCH_WORKAROUND
+ 		if ( hwdata->image != NULL && hwdata->image->pitches[0] != (width*bpp) ) {
+ 			/* Ajust overlay width according to pitch */ 
+-			XFree(hwdata->image);
+ 			width = hwdata->image->pitches[0] / bpp;
++			XFree(hwdata->image);
+ 			hwdata->image = SDL_NAME(XvCreateImage)(GFX_Display, xv_port, format,
+ 								0, width, height);
+ 		}
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 4ec0dc6ca3..b7438bb423 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://CVE-2019-7638.patch \
            file://CVE-2019-7576.patch \
            file://CVE-2019-13616.patch \
+           file://CVE-2022-34568.patch \
           "
 
 UPSTREAM_CHECK_REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"

