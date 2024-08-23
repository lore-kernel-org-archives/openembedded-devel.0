Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E490AC52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 03:12:09 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.8349.1724382726113377848
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Aug 2024 20:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jvidBw4V;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7141d7b270dso1277159b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 20:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724382725; x=1724987525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8gRYAE+361zlzYKhElxRGjAm47AjH34f8/nu4HaiURQ=;
        b=jvidBw4VCyBXZQXZkX9jNF3ggusLLCjymPs4cedKZ0NE914Mdc2ATC8rbqHlKiyI2l
         y4tsT3OUsXm/uigwna0ld/AvJszXvHUW3if3yGow3k+TKvXA289L4n8lNl4IEGkp1dr9
         J0UMb0xq/Z7Cg02ojoiT4fFI8LI4XozQ83nmV1uucOFWaev1/qsW9uJ16T271jZcANK4
         qVGtC84TmQtfde6ObBMAzPNkTZnSv6HBMIWxJW4uV8T0Y8oJ2ORLDKjgFrwUkoxenPI6
         qjfKWNjZhniarkSP9f6YAx+PAlyU5ZuvkZOQKyaWJHwOGs3PDUCzQx7//dIQO3lNiG1k
         J0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724382725; x=1724987525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gRYAE+361zlzYKhElxRGjAm47AjH34f8/nu4HaiURQ=;
        b=iPXuIbpsTCwLFhPVgwdUQMGHiJTnNDzLIrEUi9/5DBFul0/w4wxSmI8M/Kg828jjP2
         2SrYA8+VnREjRdVsbjM9gwddd8H+m7ypsfaeFMH0cNTQDHFK9H4jhfhufiNgJwcgX1HP
         VOXrBGNl+je8U4ikPpsJWIA008BskhiTr4t7TnbkN+TimknUbx1D3ugSCCBdsd3iD2z+
         VgmQqGLPdJjOWiURAEyDwhHmr/NIsFWP5IZZDEbcU5PobuzaaIb6iZrLb7b0qoa8ItKJ
         Ob6larCwX/Sj5uq59ox91C+hABXfnuSVI0MPeOMKy38dRRu+MR43eMYAYz9C2eYEHYoH
         9QGA==
X-Gm-Message-State: AOJu0Yzi+n9rxdfiI8r/0OXkKhN3kb2864VIZeeJ9HHzbdRlUYLgMxj/
	8F8QBIQirP+LDZrfjL+/CYPt5ctKPG6rEIjZSzgC/ZJFLk/eEVojnEniOg==
X-Google-Smtp-Source: AGHT+IE6bLd4uQaI8M1hkVWP0oN4hAfFLHaETW24T5VaWW7ACuYfwHZUb7CZ1B8K1AjkL4RTPXCSYw==
X-Received: by 2002:a05:6a20:2d26:b0:1c9:efcb:db07 with SMTP id adf61e73a8af0-1cc8b41fe1fmr1226972637.2.1724382725120;
        Thu, 22 Aug 2024 20:12:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385fc6a3asm19225545ad.295.2024.08.22.20.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 20:12:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ftgl: Switch to maintained fork
Date: Thu, 22 Aug 2024 20:12:02 -0700
Message-ID: <20240823031202.3694483-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 03:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111907

As per [1], this repo is not being actively maintained therefore rebase
to a fork and pull request is also redirected.

[1] https://github.com/frankheckenbach/ftgl/pull/19#issuecomment-2306010295

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ftgl/0001-Fix-type-mismatch-with-latest-FreeType.patch    | 2 +-
 meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb                   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/ftgl/ftgl/0001-Fix-type-mismatch-with-latest-FreeType.patch b/meta-oe/recipes-graphics/ftgl/ftgl/0001-Fix-type-mismatch-with-latest-FreeType.patch
index e481e4e793..9c91b5be19 100644
--- a/meta-oe/recipes-graphics/ftgl/ftgl/0001-Fix-type-mismatch-with-latest-FreeType.patch
+++ b/meta-oe/recipes-graphics/ftgl/ftgl/0001-Fix-type-mismatch-with-latest-FreeType.patch
@@ -12,7 +12,7 @@ Fixes
 
 [1] https://gitlab.freedesktop.org/freetype/freetype/-/commit/044d142be7b6a93b6940367a1bc5847451ff4775
 
-Upstream-Status: Submitted [https://github.com/frankheckenbach/ftgl/pull/19]
+Upstream-Status: Submitted [https://github.com/HamzaM3/ftgl/pull/1]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/FTVectoriser.cpp | 2 +-
diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb b/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
index 85b0d68aa3..4db453bc66 100644
--- a/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
+++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
@@ -11,10 +11,10 @@ DEPENDS += " \
     freetype \
     freeglut \
 "
-SRCREV = "ddc77166651a71ae037ef3129a285440aa559b2d"
+SRCREV = "b787042cc1d1e4861337d5f9a6727e4c6900a4f2"
 PV .= "+git"
 
-SRC_URI = "git://github.com/frankheckenbach/ftgl;protocol=https;branch=master \
+SRC_URI = "git://github.com/HamzaM3/ftgl;protocol=https;branch=master \
            file://0001-Fix-type-mismatch-with-latest-FreeType.patch"
 
 S = "${WORKDIR}/git"

