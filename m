Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CBBC3ABA4
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 19:37:14 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.121154.1726429032380608939
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 12:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dza7WHHs;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fee6435a34so32336145ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726429031; x=1727033831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aRt3y1GRrbZnCOJoJEnwUNdBrisrNATOggRK9GEc8VY=;
        b=Dza7WHHsMMlftPTZ+rKRWj3IneIw4Am2w80j6OT0OzHsmUV4EQZE/ECUv64UqPzLtG
         H72+cMauMY8S4Zf9mopklt6i8b+6ED0vT7ushigSaTBPwdvVHrThZWnmtRW+a8LqfbLz
         KQfY0VpDzHhw1HQKgKE2qRURZ4oQFc1P7EEF+AkfDnOlh6Kjfb4WfI4/cQppl8mnOt8J
         7JfY8XO2v7LlbjaE/RIxuwpc444g3EdjB0DCqBFqq6waEWHHh8FFeLbSBlLfehIUWr97
         3KO+UhSYV6NxXAdOx4TmVrlCvWKYAau+E0su2n9hOXy4/BFMaoKPdpYhV9i6pus3OHK+
         0PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726429031; x=1727033831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRt3y1GRrbZnCOJoJEnwUNdBrisrNATOggRK9GEc8VY=;
        b=D4+07nSMV1Rn25Fbo3VTdkb3cAOC/O4Cq7jCW1RkmzEVgJ4Sj2kxu+wauEt7+1cQYY
         XeSS63lB0ltzWeWPUHk2Tf1ap9BB+qcd9+qvjl465x8DtojPfinYTaNs0vT6J06adimG
         t7m3ibrrQeOH+sm0taIvu6mmBTCvbsG7QmLZ4wAyAm4y5d4CZ+m4y0+8BzR5zh80xw36
         byFuZ8U80u9uGIIFjGhrbkBVJkfgXobKO9FkL8+Wi80T6dXyfUuxd/kZFm7Ox844zw7i
         Zv2moTpbYFwfg8glRJ/RqfwSVDDS8VWomN4UmBdcrKAGGTJzwwL4l3dcf71QrlrWd2ir
         ebkg==
X-Gm-Message-State: AOJu0YyeoXPlJI3mrg1pWAhH8DatAokhzR782iISQDyGDPiobxST2PoS
	C8/35gHsCAzAImVdQ03GUEYAAOxFtm/ybMlSE8wB0xj5SazL4EOsivg3StRo
X-Google-Smtp-Source: AGHT+IE7Os8tyQOHaF4zdWl46ZvEBjjJRHXL4PouU/qO7i5byc9PLP4iNhPYFQrFeURfwHhZnI42XA==
X-Received: by 2002:a17:902:c404:b0:205:7180:bb59 with SMTP id d9443c01a7336-2076e35e998mr174651675ad.21.1726429031358;
        Sun, 15 Sep 2024 12:37:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9c53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207947364d5sm24688795ad.282.2024.09.15.12.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 12:37:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-pillow: Add missing rdep on py3-compile for ptests
Date: Sun, 15 Sep 2024 12:37:06 -0700
Message-ID: <20240915193709.1131399-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 19:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112311

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb
index 2a9d9217f6..a9cb903ac1 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb
@@ -41,12 +41,13 @@ RDEPENDS:${PN} += " \
     python3-numbers \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxcb', '', d)} \
 "
-
+# python3-compile for filecmp module
 RDEPENDS:${PN}-ptest += " \
     bash \
     ghostscript \
     jpeg-tools \
     libwebp \
+    python3-compile \
     python3-core \
     python3-image \
     python3-mmap \

