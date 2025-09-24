Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C027ECAC5B0
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:28:47 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.11194.1758716927252731280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jMD3DS8g;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fc2d92d34so10011022a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716926; x=1759321726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djKoRLAncz7tCIy9KMRSr0P0EILpS0qx2sO3gOAQtlw=;
        b=jMD3DS8gf/KmdsuZERxUtHG9Fcel1tI5j332MAsVJXJEkfJRJ1TdHftNmPTBfZNxfg
         4EFxXvx2mB5cTOrgFhZc1ACEW43xOnrjyKTUJXC0a/1ybjbBCgeCNb21hntYJn0uOGhk
         h0dsSS/8z8DUG7Y46xTK9rtvQWvQYOofYm0kCyFGUXcNAgMMhlq7WfJlMQOqYot890vd
         z6aOOXgchIXdSY9r3wJxi6NB+qtJB8OH3Mxqo+npP0kxqUsDewE0YOrOnBKD/P/Ffz7T
         9iYQb1pGVwHl3InqVwn3H21BjlHYwsuMEUvESlYpJilCZ5aemEi/P1ANfq6d8+hrGmPv
         t4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716926; x=1759321726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djKoRLAncz7tCIy9KMRSr0P0EILpS0qx2sO3gOAQtlw=;
        b=N5X9aOHln4z8LjBxLbZ2dX+7qMhXjUbvYbYozhtaKWzPT+DTo4RCaRfZjYcPDi5YR7
         NTIL+m9eaDoU35ef0bK1HBTro3IXSB0ZLJbMsUiLkKrScmblRgXgmH4Y8UcglCtQMfpB
         F2i1s0ohzhqc7F/ml8BWccURoKWB28UbiorBHYNHHudsUsX5l7qUm4//qzg7/v4fRJlh
         MjUHxEmMyzNonwH5tN5vfQx6i6/P0LQgQytnIGjIAcdA6NdNwI6PtJX3YMIAmRuopqtK
         srmmiI3RCzj9P5K6L0QaWimvsMkWDmhP8/dQYHRDndMNzIBVG3yTy01UY6HXvHaBugmj
         F4iQ==
X-Gm-Message-State: AOJu0YwsFgq9PEhVa6utX3QPBIoNIRheKUxwjIDJq91Pqj+UiS/Jk7C7
	gIFoPS5OamGyn8BKfvBKEgXBJQaGyW4EKZmNwdeAgxdC4NDI43O/t4tF5t+Wbw==
X-Gm-Gg: ASbGncsARiw5R5okK1cLqWqI32ZFfom2PHFPXFV8XMDb+oudimSd2y9pVbMJlv/tjJK
	FJJB/qZWDOChQMfDGu/L/Jwqw3yjLfuqO/HESqcwtovZC1AWsNLYdWrDQsq/0q592W+u/grVO6J
	rh5CV80CTNX+Le0oZam9Zk49GAtgLbnloSLe3BF+/q4NChNT0NfbaID4fia2oO2flV2YW992xdB
	JklhsYdCWnXZ/lTC4gzP0wubgxqfuQI0srJhes9rHjmqU9zfGmRJQAO02/uSNRnEYOic/STC259
	xXwRqqbrk48tWw+5sg0kOzgCipVrCzi91D+ObZ4TqRj6H5oR90Io+3sq3kC1qFxNZmw1spe0npy
	gTWZkqUPgNmyIZkcCX1Mp
X-Google-Smtp-Source: AGHT+IEMmTnLkqG9f3iwUUd3eQHU0fYSgETtfEBrcqyUbMNM+FnXJxxQvFsvoLxu68Z7Xg7n+KjJkQ==
X-Received: by 2002:a05:6402:234b:b0:62f:64b0:9cc2 with SMTP id 4fb4d7f45d1cf-634677b6e57mr5999848a12.16.1758716925562;
        Wed, 24 Sep 2025 05:28:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 04/20] gnome-calculator: add opengl to REQUIRED_DISTRO_FEATURES
Date: Wed, 24 Sep 2025 14:28:22 +0200
Message-ID: <20250924122839.4184719-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119807

From: Mingli Yu <mingli.yu@windriver.com>

gnome-calculator depends on gtk4 which depends on libepoxy(an opengl
related library) [1].

Fixes:
   ERROR: Nothing PROVIDES 'gtk4-native' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb DEPENDS on or otherwise requires it)
  gtk4-native was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gnome-calculator', 'gtk4-native']

[1] https://github.com/anholt/libepoxy/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8df920252454762a1c84e2d899c8971dd2ca7342)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
index 31513a5f61..66a29a094e 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
@@ -26,7 +26,7 @@ inherit gnomebase gobject-introspection gnome-help vala gtk-icon-cache gettext f
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI[archive.sha256sum] = "33dab1bca43658d66520958b0f674cb0ad3185cfd30c12e459e7f69481c5c6a0"
 

