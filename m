Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A1AC9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 01:37:18 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49247.1790559437455013496
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 18:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SF0Tw/dX;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso1012355a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 18:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790559437; x=1791164237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qE0ESAyBwp4wLZH96CRXriyvmPBp8w/QAAWxEk89+K4=;
        b=SF0Tw/dXSDCCbzGBOAp/yuj88xNCUT4GyZlXp26ySLr094oIxG4Jauf4U+7y3UV3zX
         NWOyA/krnYZiXuVgtllmdETzaKhPpqHsuSPrnOJJCmprkkm9KwTj7ain1z71S/iZy7cl
         8/UqU0VXStC1zq2BB2SAu4LNXQqjSz9Ub1S8fJFyzx+AxSAU83wQHznYhMAR92rYYp8+
         c0g4eoRRxVOZWcpB9WgmdHSNY1LfcM/xkbHA7dF3Q/REw7pK5ghtzqH/BHpC4jsCOycS
         7ud3buy7Ojr0zOJw8ZEvVo0iZ7kvxyEMN8Me/wVwLkrraPt2I5XlUGBHxJUMluzBxuju
         8jyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790559437; x=1791164237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qE0ESAyBwp4wLZH96CRXriyvmPBp8w/QAAWxEk89+K4=;
        b=R5b9IYqiZjYdKsvv9g+OSm4nXxbgph37EBAR6Jkl+qOiLOY1rJPn/n9PQ0ydrdXG3v
         7gMpJh/Tjdhny4QNQVuUti2z/HSCCMhSRJAVs5Tf60QLXKssXDgW86cY52AtANNCnjpV
         m+lMBjefIWFyAnZWLavuf0oJFN/JxJqMIBZqMDw/mDw54IHJslOuQIDFP/0utO9Ficae
         B9jSR7OVfYmmv/1+KDzO5IkLf+3WRWeaDsW8szZoBKCsd5jRaieX/qHs5WNpMag5b7mq
         QsW5MTtZArGGCJWd9GpSt3PgFAdsjRUqaktKLtGMVbUTy/B4ExbOdWefb7RFyJZvE2rS
         aH4Q==
X-Gm-Message-State: AFq9FYImJ6kDc19etYDwILLdwmYRlf5CEhfIc//9jRdJdoDkmt4DyH7p
	GYSgpCOLgZhNOxWJVbMxuEcxhgZ2nP0oQn+2ou93GaK2cGYyh41s30LacirJMw==
X-Gm-Gg: AYBFou1QJuGRY6XjHJS0hk3zgKt8L1pp5rlFNyoCtAdzHc3LEBPbvSFlkRf0DMrdsCK
	ugBQkOp/OYbmfvfFcNzU3qusp3MRE6hizG1Ipa6bEUJEB4Y/yAhAw4geAz6h8KQdSaFjjaNhbD2
	Vugn1GqrUXfm3SJvNGfyFxzHdRftmvtgXdBfJckhILNLaHbeL4LtdHNExMopH6nUohnYksuabJn
	UA60bpL//KL/BR5c8/+vaEcH/OIEKnkisEspSbFro7OWnSiLyA1cOk8KQMswChU6znspA5s6I9+
	Eu7OgS91AMpG+ZS6yxjiWsaxhRg9izxWSLz4i46K9sUcP7F3a3dAFObEwr/UUC7s/VTI8MhQjTE
	/JA+qzwPw34ogzgWH9L/+xGEdj5nLHBD4RdSx7dFZrV9HNrgUYZYcL5cOLDw2FmmRFxKKzbRk+X
	GkLoB7N3W9+c/p/1KCNXUANCNk8ddgMiBjx9JCAVWMdE2tl/7GUVlRzfLj0cLQX/wJkWjtLq5/U
	DKUuTlw4KgwXnmjwMVTafs9FmXK9T79Nw==
X-Received: by 2002:a17:90a:dfcd:b0:39e:6c69:34db with SMTP id 98e67ed59e1d1-3a098fc5339mr8816576a91.63.1790559436688;
        Sun, 27 Sep 2026 18:37:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09773e7c3sm23770827a91.17.2026.09.27.18.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:37:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v2 1/1] pocketpy: upgrade 2.1.8 -> 2.2.0
Date: Mon, 28 Sep 2026 14:37:08 +1300
Message-ID: <20260928013709.2591219-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 01:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130420

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pocketpy/pocketpy/releases/tag/v2.2.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...nclude-threads.h-for-c11_thrd__yield.patch | 31 +++++++++++++++++++
 .../{pocketpy_2.1.8.bb => pocketpy_2.2.0.bb}  |  6 ++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/pocketpy/pocketpy/0001-time-include-threads.h-for-c11_thrd__yield.patch
 rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.1.8.bb => pocketpy_2.2.0.bb} (87%)

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy/0001-time-include-threads.h-for-c11_thrd__yield.patch b/meta-oe/recipes-devtools/pocketpy/pocketpy/0001-time-include-threads.h-for-c11_thrd__yield.patch
new file mode 100644
index 0000000000..b4300128fa
--- /dev/null
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy/0001-time-include-threads.h-for-c11_thrd__yield.patch
@@ -0,0 +1,31 @@
+From e3c1a60242c551fd7db266b9d0db6b3710d057fd Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Mon, 28 Sep 2026 14:20:30 +1300
+Subject: [PATCH] time: include threads.h for c11_thrd__yield
+
+time_sleep() calls c11_thrd__yield() when PK_ENABLE_THREADS is set,
+but time.c does not include pocketpy/common/threads.h. This only
+builds with the CMake Unity build, where an earlier translation unit
+pulls in the header. With PK_BUILD_WITH_UNITY=OFF it fails with:
+
+  error: implicit declaration of function 'c11_thrd__yield'
+
+Upstream-Status: Submitted [https://github.com/pocketpy/pocketpy/pull/546]
+Assisted-by: GitHub Copilot:claude-opus-5.5
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/modules/time.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/modules/time.c b/src/modules/time.c
+index fd16a57..ac18037 100644
+--- a/src/modules/time.c
++++ b/src/modules/time.c
+@@ -10,6 +10,7 @@
+ #endif
+ 
+ #include "pocketpy/pocketpy.h"
++#include "pocketpy/common/threads.h"
+ #include <assert.h>
+ 
+ #define NANOS_PER_SEC 1000000000
diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
similarity index 87%
rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
index 7f3775941a..5df9301880 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
@@ -13,8 +13,10 @@ BUGTRACKER = "https://github.com/pocketpy/pocketpy/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=224889df377610675315e194ac59276c"
 
-SRC_URI = "git://github.com/pocketpy/pocketpy.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "a2f16e5f1f5fcc3b3d2cc1bdacfc3a027dfe2d76"
+SRC_URI = "git://github.com/pocketpy/pocketpy.git;protocol=https;branch=main;tag=v${PV} \
+           file://0001-time-include-threads.h-for-c11_thrd__yield.patch \
+           "
+SRCREV = "6cbece9ebc98c19fa2c189dc6963b421c22c40ae"
 
 
 inherit cmake

