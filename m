Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.5811.1602814931886108545
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 19:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VTr8GoDe;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id az3so520217pjb.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2020 19:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Au9ld38DzBB+PuyGksiCoTBfYe/zFSK8E/yd79Ioh3U=;
        b=VTr8GoDeuCvy2K6pv3QgAVOleAIkmTFnLxnEumQSAUP4dZsNFj8XFnQwfWKz3xLaZR
         FCIBpMKjWR8iceDzf6eCS2po6nm/+M+ZMe68wqxuRprI4ZMLhLYyzt5y+xhwRc7T+sWj
         1MA9HTZgn5v0dfiecZ2snR9DAkNU5AEKxy8oCsUZzQkRBxUzFCoVudp+qMOglxhoJMpd
         MzC7qUdVGvaGu26r7iwc7Ptxx4qCyyJ23rD+G/UQnPj0oihom95VahE3G5kHbXQXVJx2
         dewuvo0/lihHZsZbsejIczKwQ13Mv8o9whLsW5La24G0CS0GSKdY7zCypPUbZe5QSTAC
         fyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Au9ld38DzBB+PuyGksiCoTBfYe/zFSK8E/yd79Ioh3U=;
        b=QYP7/sm3TM80vcwCs3sXx9vXbgd0qH25AlKIk08Y83NVCiVWjJ+8dnQAmwxpwMr0fA
         TBPNyGjClGMGbox0XFYE9SS6obSAePlUaFgkFBvl6rkzVUmPL+ETnNT4ialGryDB88OD
         3QlZhlkZSekzUxugZDQjkY4M6dSMybwyb+h9NAw9Lk52l7JVQzot9oyi4t20e8UQVitv
         TT4pcwgrlQ3PqY2X1uhX7WbIpIOKJhEpTy0Pb4e5D1IKUgWTwdl5WWG72BFnnAvn+yD8
         myhOIIAz1/D/3kkY1vEA3HH3KP5uc4gAIT/ux20GlgxRxflv23P+nKLzVxnKyYpYAgx3
         BH2Q==
X-Gm-Message-State: AOAM533ijNQIdctaQ/XuLf5vt4sindt/Pbkin3toBjdrfef3YB6x4imf
	MbsA9HDd5YGM3hs2xI081ZzdwowSVzZQ6g==
X-Google-Smtp-Source: ABdhPJxXeeluOncSo5kiszDEKf2eDV/acpXCI9ToPMBQnfew7hBff4qtFOJr4vcAm4F85tJhAhr6aw==
X-Received: by 2002:a17:90b:3d5:: with SMTP id go21mr1706825pjb.149.1602814931178;
        Thu, 15 Oct 2020 19:22:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id gi20sm711123pjb.28.2020.10.15.19.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 19:22:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] gnome-doc-utils-stub: Use new license names in LIC_FILES_CHKSUM
Date: Thu, 15 Oct 2020 19:22:06 -0700
Message-Id: <20201016022206.489864-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016022206.489864-1-raj.khem@gmail.com>
References: <20201016022206.489864-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
index d6da51b0de..f7fbedd6e0 100644
--- a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
+++ b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "This recipe provides m4 macros from gnome-doc-utils project, so \
 that dependent recipes can build. Gnome-doc-utils itself is no longer packaged because \
 it requires libxml2 and python 2 at the same time, which can no longer be satisfied. "
 LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
-                    file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
+                    file://${COREBASE}/meta/files/common-licenses/LGPL-2.1-only;md5=1a6d268fd218675ffea8be556788b780"
 SRC_URI = "file://gnome-doc-utils.m4"
 
 PROVIDES = "gnome-doc-utils"
-- 
2.28.0

