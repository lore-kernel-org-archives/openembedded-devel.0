Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72233C4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.2733.1633977709235897333
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HTpk65uR;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id i12so46436485wrb.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1tyHxQV4Fno8zjmfL+fMLJPiwQnqpEFc+RqSbAvJkA4=;
        b=HTpk65uRBOJtn4z7VqMB8UQBp6/2vCgKPvjJTyOqXjHqwuyTc5B+/ff1Aj+rIv6jKM
         k4m0cnQK5IvkVmulpsJI9ASYAYFhlaI/kk+Mi0jPeGTqDsT0fZH9N93Kg/4VU5BcyKRB
         CwXRhJchFDFxib7JxzMcYuBEznAIKQg3vLCv2T/9LPN/RjtnbUOfREnVe6bsEx6FMLPC
         TdBUoerZ+Zion1GWQqPkQkVxbGH28L2jRadGoEqb4BHbMC5AaP1Pv65lV4KWLY2KFHD7
         XOBmH5vZ5uriQe5UFhVFITuW6OBzAWwpirabgbu4QvLVY9SWGFa0um9VK56Tbxlvohr8
         R/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tyHxQV4Fno8zjmfL+fMLJPiwQnqpEFc+RqSbAvJkA4=;
        b=19kOy0t4X6YeHhXBawLkKP+PAktuJJsCFzS4/55tEk1qhbbQ3/6ZYzEw3derDWkDKp
         /vGNdk6ns8wMTUNlPfCsiSguLDMt2OpvBafmaD6bn/vtJksnHwshE4cmppaP40mTqV2j
         VgSRN2KcRh8XWoHiywy1qtA4PU532oClI5Hx5z4iuELQz+j/BsZT7exD4rCC+oAnZfqG
         2t44uvKBGr9wlltWWBO5xEftp5LDpnow4noTIqw1S1zO7VhkieEYSXPHxS9oUq5btUJH
         MxgHOgU/EolzPXxRl71V5VjglsMP/iU4JywHOujF/oKewM4IG3wXED1/VNcXw2H16o0d
         MmsA==
X-Gm-Message-State: AOAM532p4NA4baFcJWcEbZB8MRDFDuUZDnk/2iSEibil5AWzaUdoCMm2
	CuVxlnf5vkb7V+NV4arg4rIGH0TbnAmN6A==
X-Google-Smtp-Source: 
 ABdhPJz9dGJCgsdwc5jDusMmJelx2sZBZ+84WvtMl5hfKf6hQVMdZfLWpFpJns5tS7fLjTSqIffFTw==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr681264wmj.39.1633977707890;
        Mon, 11 Oct 2021 11:41:47 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/24] python3-yappi: add python 3.10 fix
Date: Mon, 11 Oct 2021 20:41:20 +0200
Message-Id: <20211011184140.653609-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93218

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-yappi/python310.patch      | 51 +++++++++++++++++++
 .../python/python3-yappi_1.3.2.bb             |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-yappi/python310.patch

diff --git a/meta-python/recipes-devtools/python/python3-yappi/python310.patch b/meta-python/recipes-devtools/python/python3-yappi/python310.patch
new file mode 100644
index 000000000..6dd58ae96
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yappi/python310.patch
@@ -0,0 +1,51 @@
+From d40bc0e8230dd35e05222f5761e3d7f7a75fd46e Mon Sep 17 00:00:00 2001
+From: Alexander Shadchin <shadchin@yandex-team.ru>
+Date: Tue, 1 Jun 2021 02:31:12 +0300
+Subject: [PATCH] Adapt to Python 3.10 beta 1
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ yappi/_yappi.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/yappi/_yappi.c b/yappi/_yappi.c
+index 1721280..343130d 100644
+--- a/yappi/_yappi.c
++++ b/yappi/_yappi.c
+@@ -1258,7 +1258,11 @@ _resume_greenlet_ctx(_ctx *ctx)
+ static _ctx *
+ _bootstrap_thread(PyThreadState *ts)
+ {
++#if PY_VERSION_HEX < 0x030a00b1
+     ts->use_tracing = 1;
++#else
++    ts->cframe->use_tracing = 1;
++#endif
+     ts->c_profilefunc = _yapp_callback;
+     return NULL;
+ }
+@@ -1289,7 +1293,11 @@ _profile_thread(PyThreadState *ts)
+         ctx = (_ctx *)it->val;
+     }
+     
++#if PY_VERSION_HEX < 0x030a00b1
+     ts->use_tracing = 1;
++#else
++    ts->cframe->use_tracing = 1;
++#endif
+     ts->c_profilefunc = _yapp_callback;
+     ctx->id = ctx_id;
+     ctx->tid = ts->thread_id;
+@@ -1306,7 +1314,11 @@ _profile_thread(PyThreadState *ts)
+ static _ctx*
+ _unprofile_thread(PyThreadState *ts)
+ {
++#if PY_VERSION_HEX < 0x030a00b1
+     ts->use_tracing = 0;
++#else
++    ts->cframe->use_tracing = 0;
++#endif
+     ts->c_profilefunc = NULL;
+ 
+     return NULL; //dummy return for enum_threads() func. prototype
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
index 94988a744..7cfc84e75 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "a51d3e6e5563cc74b5bb82ed6e7bd44a9c1a7eae3d97e4d52e9465edb3
 SRC_URI += " \
     file://run-ptest \
     file://0001-Fix-imports-for-ptests.patch \
+    file://python310.patch \
 "
 
 inherit pypi setuptools3 ptest
-- 
2.20.1


