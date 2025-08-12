Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2482CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 15:46:04 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.77830.1755013559457175106
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Aug 2025 08:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: danismostlikely@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-741b8c26fc3so4641691a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 08:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755013558; x=1755618358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwseo/y1W4mle+K+z6BplH3NBZnBVEDm8Ecvb5XFz1o=;
        b=kqLrkuxFnv/j7MIRNJKAJsEgBkBo9fJCulIjBA4vdgvFi/1MAfrRD5a+tPpEELOKSe
         Pu76Dm6yeB28FbqCL/k7BPkziqwqt+b3OoFf14YLs16sqdYsyFvP0emgcZRFnmMsacHY
         JDcWH6Rg+fEnfx65mv/X+nnFc1lOQIWpigiVH6qD1rJgnOEeZmhuE44vOqyw/5scaF7T
         cyqNNAHpXVIl0dFTUGWqB/lI+ENa2inx72vVLpETeFXyyzWHCOnZ+VGbmkFQq0LtegGf
         djWwGncFD2yBOao4C2IjPFUgMo+06nQCQkmlOToihtirb/qjhfMbQK5lRDtOQ0mreG6M
         R0Lg==
X-Gm-Message-State: AOJu0YyAcwZ6+7Ly7+e6RRx0qgoPcjn7BOUd5vdzrKiUlPpWez4Aa+sk
	16HyuaecnPoJ4mWX+bzZ2LRqXqjJ1zRnruBI0yffePRH2K4mOag5mNBssUgM2Q==
X-Gm-Gg: ASbGncvQvBKQ+CjzHfT3GaSWEIhLxEKJGjE2homWLstaEIv672XQm49IsjjO+tdObgZ
	35t+hfdz3cHCCvj5FeBrgH4VrwyoF526Q0SSoYezgVAQy+7jKHh1jm/+bUxbwj5aNixTwoFjLJI
	bv+RCTsdmYZce+RrH6t+mU7l+p3Euk9UHluc62dGGzEvCi5ifKBYd0Z7nQiogzRaCHhT9RvqvX0
	P40H2JRYP+DUNH9Pc+9yCH9Huqy0/GQqunJ/qCR9sJbVGPRj4qAqNu8+SgvvfPpr2787wujLsx8
	g4bkxgVDWl/A82lbj2cCOuBHIFn3cF62vNjO2C/fzkc8jKqHBy+/HsLZKqVLie60ETgmquew7KX
	6gvsjCuQkA0mwrVjqZAw6tpUGA1I0+OpR3AbTVc1FCmjrERO80bVg78H2W78=
X-Google-Smtp-Source: AGHT+IHaUBFD4oqQrbiTQMLvOzB1kSStIFYqSltlvaqEZsi9qyXnXqOfEg/TwcOnqBIa9ahYkD4GyA==
X-Received: by 2002:a05:6830:370b:b0:73e:8b47:a3c3 with SMTP id 46e09a7af769-74374684d12mr126096a34.24.1755013558422;
        Tue, 12 Aug 2025 08:45:58 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9c36dc6sm3033903173.74.2025.08.12.08.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 08:45:57 -0700 (PDT)
From: Dan McGregor <dan.mcgregor@usask.ca>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-oe][PATCH] systemd-repart-native: clean up dependencies
Date: Tue, 12 Aug 2025 09:45:55 -0600
Message-ID: <20250812154555.4133668-1-dan.mcgregor@usask.ca>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 15:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118919

Specify -native versions of dependencies. These were satisfied
transitively through other dependencies, but we should specify
them explicitly. It also removes dependencies on the target
system for a native recipe.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb b/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
index 0ac695769c9..724d6fa049c 100644
--- a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
+++ b/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
@@ -19,9 +19,9 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANC
 DEPENDS = " \
     cryptsetup-native \
     gperf-native \
-    libcap \
+    libcap-native \
     python3-jinja2-native \
-    util-linux \
+    util-linux-native \
 "
 
 inherit meson pkgconfig gettext native

