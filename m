Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8F1F46C78
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 19:41:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63470.1775504504975514100
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 12:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MEq+1L2A;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so4033545e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775504503; x=1776109303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN/zBpkq47KttRLbKfYaDj0wAIMH6g4fX2XqNwt+dTo=;
        b=MEq+1L2AWwVsSRAvSrg5DOOpQNN9YoCvIFdoxaBZ25tKSflkmU5WWMakbz+yBq6uPA
         hC8M7nnM+XOnC+3fYIpvdP4EGAMaXHNABBiEB7GvD+F8u5plAml9sZzM78YWqNnkkPO2
         HVPhJ6eqjHUNyDzoXE+9eF3G46eLNSwrfj5MNSu6leguVSWbTxJFti/qX5ukLn7068jm
         9Ve0/K3HvHcMA/ptr5fzE5Tfz61KQfOuFHNfOk0eQA4282yTfpAazxqI6LXsFq18PHww
         6lLVZljZid6oYzgLZxgtc/aT0OlqGHVymYgbUZeel2FjzQbI3MH2c+Im5+BkLMT+tElD
         zE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775504503; x=1776109303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lN/zBpkq47KttRLbKfYaDj0wAIMH6g4fX2XqNwt+dTo=;
        b=e89udUb9C19fOCrG4KfA0Y4zI8Gun06hluhsGEwMYfxuOVbJZwcx8r3dEvHUdWG/qu
         740vPevIJSrl/rdFpHl7lU8wwJ6y9m2KnNY2PcwHBlr9Ma/qU5Qa0URZa7ULEXwl0JCZ
         MvdyxIJGDKSkhzTCcLl0EDaUtqEWUWIrHp8YvGbieAetZrasCYK3ZmSg8gvkAKbXTsc5
         BzmjAnkXgS1x6US3yL7Te+wf5l59Chd9nyrW1VlmAcsCyOnNeEKyQqaRzWje63liIT1r
         D0cR5QCW/pomUOjLwiygyCiBp+ayzE+FFqjuvRr7uLjlmz7Hbg2RAVXMC+knkwfrsAqB
         AoHA==
X-Gm-Message-State: AOJu0Yyxi0lC+eTlX8z9wchcB9wpN2I94pwycF5vQvXO2LvOI2CzmiGD
	EgJQ1BzC8//HdSGlb8muscKWIlnodQ/eoxF0N47CDgDdptH4RNiFv186dtIIlw==
X-Gm-Gg: AeBDieue+KDfBMXOEww55cVb7OVaKDh+li6QZUHStM8KvLe/m5br+SJVg+PgUJ3Kmgh
	lJTDRCU15VPllanEXi494ijK5EHQCLwB02S6dvvmxE5cHkna8M1qWuWUPh51JI3QxSo1o5EXfKY
	lrKWs+5KENH6Wo0jF+PjK1BbpvGqftcXjCpEx9elvgSPRe8HoiayvIgDPHVLgy8rxn5riPZ0JoG
	zQJNIxJwZMSegH8gwycPeuZsLU9K09yKjRz5dinuVlK+isHu4h+GVhZjzMUdMVZ9iTbgocw1MKC
	cjji8ZrAXu6w8opMsPhqBZ2+GsGiNt/UNfypFeUnhvDDdq3/FmiUhl4l6C4ENRwzExyiq1l6dKj
	6gKXEVfHfxt6MY9/vGexLa8NQzwbUKWHueQ/+xCusKbScGPf3ZIYby/5hX/qzMzrOiq0uxW3dj1
	g5H8risX5cOqa5lzCvqi38
X-Received: by 2002:a05:600c:3492:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-488b14fb9e4mr70447655e9.0.1775504503261;
        Mon, 06 Apr 2026 12:41:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a8ddfde7sm316825945e9.5.2026.04.06.12.41.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:41:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 2/2] gitlib: patch CVE-2025-31344
Date: Mon,  6 Apr 2026 21:41:41 +0200
Message-ID: <20260406194141.3893319-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406194141.3893319-1-skandigraun@gmail.com>
References: <20260406194141.3893319-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 19:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126066

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-31344

Backport the commit that mentions this CVE ID explicitly
in its message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../giflib/giflib/CVE-2025-31344.patch        | 28 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_5.2.2.bb   |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch

diff --git a/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch b/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch
new file mode 100644
index 0000000000..8f52154955
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch
@@ -0,0 +1,28 @@
+From 949bf7ded2c23449439e2c3e1f63368cf7985800 Mon Sep 17 00:00:00 2001
+From: "Eric S. Raymond" <esr@thyrsus.com>
+Date: Wed, 18 Feb 2026 18:06:50 -0500
+Subject: [PATCH] Resolve SourceForge bug #187: CVE-2025-31344
+
+CVE: CVE-2025-31344
+Upstream-Status: Backport [https://sourceforge.net/p/giflib/code/ci/7bbe8ea1a595bb7509ffa0a86b076e9b720e85af]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ gif2rgb.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index d51226d..4ce2104 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -329,6 +329,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
+ 			GifRow = ScreenBuffer[i];
+ 			GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
+ 			for (j = 0; j < ScreenWidth; j++) {
++				/* Check if color is within color palete */
++				if (GifRow[j] >= ColorMap->ColorCount) {
++					GIF_EXIT(GifErrorString(
++					    D_GIF_ERR_IMAGE_DEFECT));
++				}
+ 				ColorMapEntry = &ColorMap->Colors[GifRow[j]];
+ 				Buffers[0][j] = ColorMapEntry->Red;
+ 				Buffers[1][j] = ColorMapEntry->Green;
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
index 8226e9b6c7..c26f3cf160 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
@@ -11,7 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
            https://sourceforge.net/p/giflib/code/ci/d54b45b0240d455bbaedee4be5203d2703e59967/tree/doc/giflib-logo.gif?format=raw;subdir=${BP}/doc;name=logo;downloadfilename=giflib-logo.gif \
            file://0001-Makefile-fix-typo-in-soname-argument.patch \
            file://CVE-2026-23868.patch \
-"
+           file://CVE-2025-31344.patch \
+           "
 
 SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"
 SRC_URI[sha256sum] = "be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb"

