Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE3DC35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 10:12:59 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.18060.1742551975077934180
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 03:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H7EGrX4+;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso3145830a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 03:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742551973; x=1743156773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aVQkc7+X5aW9tRr1zhJMKqKUCSue9x6I6jbko2j18Q8=;
        b=H7EGrX4+bHW1SytlFMNJEOOmbDCGNgWghKhxzJDDRSDTJ9g917IM5AVmqpt43YUjsK
         J24M261uAJjVhqMLE9hLTU8tuJhWZVJLgWpvAnFkF5jMB7CwQVnk/d8ajCkKvVSNyl/b
         Anxc2SybFXh2jegNoZvHG5csfuNvWOamD0ALIoy4KBjLmpyuaFljVcpWl6qTCTNBhiXo
         voDuIqoYSfwKkgm6gQN9vdUhQS70IpHQuY/vuVsSH6u/4+FY9Xq9P9vRGxoMZxYXKqKr
         11BYen1wuI+NM2Bl18nMnZ/Kv6YxKKLzewpzuVvMSLwWXQwWcL+NHY8u8Vg4g+MhQu84
         G+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742551973; x=1743156773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVQkc7+X5aW9tRr1zhJMKqKUCSue9x6I6jbko2j18Q8=;
        b=puRO1oZhU6NgsbROTmvNOUZxsKbOHoYF7dTPttTpoQiAoJ8tkXqHDwWbCxySlZ2dob
         Hj1c8OcemmOEebBvvUPCZho5j7QTaMGvpItGueIy0plkt+bEm+1U9jchU3GfGGlQ24lx
         keu+DnGjajTfRSRg7rcVCf3HMh4lym91T8qIu1pW6DdKdKIBtHfJRFwEx/+Y2BeMb2zU
         rW1Vf8frbqmXyzKd9/qDtsVf9TUl+gzGwnRYdzF20ob0ifpIKIvi+fWZl4mbGr8Zhz9V
         OOW6iwp4UISDfUW2xfWZFRcOqLchiy0GrW8H3MerQ5aoJpV+nrgkaT5ctySy3sdqeV4O
         RQRQ==
X-Gm-Message-State: AOJu0YwyBT2MvHkQi2BbABoRP2qZgaQZMheEJ/IkDVrJdDFKFAO/tXow
	HldWql6op3wtfcyAvDAvuuGQvN6imyOkxItBuC+MfLs5m3zBX2Jrsnu04w==
X-Gm-Gg: ASbGncsnF9ui1QPR0Dep8SBWm0ES9E8M8f85HGm/gcGHECM0TKxkH+6ua0j4Fjowp0d
	EbrExcGzDD5pn3bxzMLHh4+qSmH+c8G4WBQSBCeEQ/p8JGg5lrtaRwUq0mLY0f3EV5dAneQUnX2
	c/g99TMDB/SQz5BMqioDWwRmg1x+Yr/gjYU3mJyqGR5DW3B8zvW78GSlTxtmn1CDNWG3Uxz+F6u
	Vsy/w0t07nmC9B+aR3Z3NWkkZ8edgDqCzafborQNoV6k2gjpNhcCW4ViHAID9ee3QLlzyR4DTdz
	jnxTM8aFjuiSrVbPK0GZCvBxPHzEb68ZTnAJRZzSYu9mn3IiXa4uH+k+yWXKrBggi24R5NkwfO9
	hyQ==
X-Google-Smtp-Source: AGHT+IEtMpBz5JUmnMbq5DDnAdMR7VvMvHsdpL5Yr/nxFaBMMjja6pcJd3OjWdaF6tekGa9icQBajg==
X-Received: by 2002:a05:6402:524b:b0:5e0:9f31:a27a with SMTP id 4fb4d7f45d1cf-5ebcd40775amr2437273a12.5.1742551973033;
        Fri, 21 Mar 2025 03:12:53 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5ebccfadd06sm1073520a12.36.2025.03.21.03.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 03:12:52 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] webrtc-audio-processing-1: fix build with gcc-15
Date: Fri, 21 Mar 2025 11:12:49 +0100
Message-ID: <20250321101249.3151299-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 10:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116181

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  http://errors.yoctoproject.org/Errors/Details/848476/
  ../webrtc-audio-processing-1.3/webrtc/api/task_queue/task_queue_base.h:53:32: error: 'uint32_t' has not been declared
   53 |                                uint32_t milliseconds) = 0;
      |                                ^~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...001-task_queue-fix-build-with-gcc-15.patch | 30 +++++++++++++++++++
 .../webrtc-audio-processing-1_1.3.bb          |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1/0001-task_queue-fix-build-with-gcc-15.patch

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1/0001-task_queue-fix-build-with-gcc-15.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1/0001-task_queue-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..0f7e7a18ea
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1/0001-task_queue-fix-build-with-gcc-15.patch
@@ -0,0 +1,30 @@
+From d8ba62262265fac19804cf52f99488ed226c9c51 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 21 Mar 2025 11:06:14 +0100
+Subject: [PATCH] task_queue: fix build with gcc-15
+
+* fixes:
+  http://errors.yoctoproject.org/Errors/Details/848476/
+  ../webrtc-audio-processing-1.3/webrtc/api/task_queue/task_queue_base.h:53:32: error: 'uint32_t' has not been declared
+   53 |                                uint32_t milliseconds) = 0;
+      |                                ^~~~~~~~
+
+Upstream-Status: Pending [uint32_t is no longer used here after "Bump to WebRTC M120 release" https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/commit/c6abf6cd3fbd688b111b339775cbd2d66d509ddc?page=2#66fd3af91f4a7b8a1dafa8180959efa4e32ac2f0]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ webrtc/api/task_queue/task_queue_base.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/webrtc/api/task_queue/task_queue_base.h b/webrtc/api/task_queue/task_queue_base.h
+index 90b1efd..63526a7 100644
+--- a/webrtc/api/task_queue/task_queue_base.h
++++ b/webrtc/api/task_queue/task_queue_base.h
+@@ -10,6 +10,7 @@
+ #ifndef API_TASK_QUEUE_TASK_QUEUE_BASE_H_
+ #define API_TASK_QUEUE_TASK_QUEUE_BASE_H_
+ 
++#include <cstdint>
+ #include <memory>
+ 
+ #include "api/task_queue/queued_task.h"
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
index c56ca53f89..15ddcdb04e 100644
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/webrtc-audio-processing-${PV}.tar.xz \
     file://0001-add-missing-header-for-musl.patch \
     file://0001-Fix-return-type-errors.patch \
+    file://0001-task_queue-fix-build-with-gcc-15.patch \
 "
 SRC_URI[sha256sum] = "2365e93e778d7b61b5d6e02d21c47d97222e9c7deff9e1d0838ad6ec2e86f1b9"
 S = "${WORKDIR}/webrtc-audio-processing-${PV}"

