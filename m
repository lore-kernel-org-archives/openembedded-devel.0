Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC24FC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 10:08:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.11851.1744686537239715528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 20:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d4iGO1yE;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227c7e57da2so44166625ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 20:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744686536; x=1745291336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PK6ajRB2xasE0F+j/BWIUsU7luWR0PtKH/bERBuzFRo=;
        b=d4iGO1yEi6cs8t2LcKqHGgE07Rn5o9LbawyvXCUS8Nbhpozbr4aAaZUokGlTXkI6os
         j4P0yZkdkBujykg81tp280v8PwmgfZgH/5qNJXQoG4iZ6N3wXzOqni3qGXvmdOdEnSOC
         7cqWVg+syxt41RrmEA5heZ4qbXLHmSvw8aECJIUgDIiF2byDsjGlyoI2PN7YDt5PVQ+8
         GtvhNtCpBC7IZQi2i4nT5l8tmWT33g8P+gsPwB5gMx18B/2lbDIZswHy016cKNWEq8jD
         sBUpqwWidxyX7kgnyUFyTad+DY3kH0mPslqVT+tQM2/t9LmfSHGH/MECTk6/3VsaFUMb
         /Drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744686536; x=1745291336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK6ajRB2xasE0F+j/BWIUsU7luWR0PtKH/bERBuzFRo=;
        b=Abcr9qkRXxBCgYunNum0lIASNZe8DFZ71ghqZlou3pz5hCsd2Yk/LRc/yQGseujAcy
         byFLwr6Prl4Qxrb9RJuQ31SzD2PEUjYUCIMGhp8wpX+MihjCi7gM5E0bzv1j06BJL2lO
         E2LNs4imVqPJUq3PSL3VHukV7u1hzFkXTutkj8nb6rybbYsB2M4IWVkshkKFJ2o9I72d
         zXvHHalXznbbJRlVXDdFaQL1WKAjWHdli1QeMYYthksVBOBulcMEvGzlUIpYHSZhshjE
         xb4sRmuFGAHW/mRSEXuepXNGkMBIE5lL0ozNA7oZ03uUK3k458EM2zwqjt+pVn03qUFg
         IRZQ==
X-Gm-Message-State: AOJu0YzQkhINSdwTKiYbGuVpX13EwabAw6oBRBa/JHV4s7ehMPJkZYEk
	OpT+/6VFEjJFOA7Xx5IDGGNYRTLMQd4tPu2TUHeb5YpzowqswGu3/ruzk+SW
X-Gm-Gg: ASbGnctYEl9sOxkBAVojrnGJyvBU2yL6DuruOZlLm9NCUfLlFti/UHT/DX7shiDC/Jl
	bW/zBVDc+sOzzueqOJnvmXd/0Ty51/ltxBnQ349aOkwiWnxE5JVnAHNn9dSMAveKUCIvBmBTL86
	xZej1yM69ZgnzoOB5FnUquGILzoX/gRoH0ykWgyz/9grbZxHgjRiVi5BA6yB8I36FHA08u/e0Dp
	fslftWEtuBAiNQGZVXJt17Aw18APcrvJYD2Xw15X1noo/tQau18tMShnQpvaQYDOHkj7YnyC9E/
	XffVPGIbm8ZziPqlyBG9DM4Fb7YFZFhYIXa2ko2ucX1GEAvx7C/J0SWyBv5euV3DrBEJ
X-Google-Smtp-Source: AGHT+IH8zvI9HdPisiva5KjRLTlogaUbkWjRunLTnFfJZUcsqTlecEcDfq4u4GPZaq2E0rnQjopWnw==
X-Received: by 2002:a17:903:1c4:b0:223:4341:a994 with SMTP id d9443c01a7336-22bea49e9d9mr192312665ad.9.1744686535457;
        Mon, 14 Apr 2025 20:08:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90d4:ea0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198a73sm7452236b3a.22.2025.04.14.20.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 20:08:54 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: A new logging library for C89-C++20
Date: Tue, 15 Apr 2025 10:08:38 +0700
Message-ID: <20250415030838.9058-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 10:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116860

- "simplelog-topic": A simple, stable, powerful of logging library.
- Desc: https://github.com/thuanalg/simplelog-topic

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/libsimplelog_git.bb          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
new file mode 100644
index 000000000..0415bf485
--- /dev/null
+++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
@@ -0,0 +1,21 @@
+
+SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
+DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
+HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https"
+
+# Modify these as desired
+PV = "1.0+git"
+SRCREV = "ff30ba71807db1d7e1962dd014c2bb0a060572a3"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE += "-DUNIX_LINUX=1"
+
+
-- 
2.47.1


