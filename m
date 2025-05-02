Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3578AC3ABAC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 22:50:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.1342.1746226202833267588
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 May 2025 15:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PA38sJN0;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso15949125e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 15:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746226201; x=1746831001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPqOtAkQLSyqgEJLJ37Tmc2tzAEmNSr8wa+wiO9FgRM=;
        b=PA38sJN0FHFN0RyPKWnqvSm6WRlv5T6fuGTQ9yn3AK0fkMFDEXpbz51ga1trNykDAH
         oAOD0VQKxjCSM83LIuLPS9fzBb3G9SYhy89q35Pr5fxJWkyFekz2dUbr1RrNRCan3Axr
         fgecwgqyXztiQlXCbcWy4oSwmUY5IWLO0XSh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226201; x=1746831001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPqOtAkQLSyqgEJLJ37Tmc2tzAEmNSr8wa+wiO9FgRM=;
        b=Q4ReX2RCpbnaozyC3xUt28R68rFlNY0SpOrhD2lYlpYdQHBK3HlPHWn6IYLr1fc0jZ
         7eEjVLfrOdRT+nR8kyBD7YhjBN8VvE/zCZRi0otoDA+KQpt4xTNXOMFznZP3hpkBElt8
         8KOHDVH5XAVAb7z801JsWaiyZoLrl7auz3erR6n7XpFXq5eLepBCc3i6jRjl+KRoH/Vz
         hUQPkILURErPMoKlYnJ22AXN8gY6hbWB8kXkl5PdUe/mKWxq6SxP5E1PRB813SZ6zBUn
         +88c4d5wBPEiaOGGhg8KHCVTwbTGXxSSJrztQLe1RzN/Orgx8wbyynZlnkyyRwQGqkxy
         /OTw==
X-Gm-Message-State: AOJu0Ywqs4lrZ7q4gnPt6kKGvTTlDGkOrOY29H1dHblE3RDfHGeNcKeZ
	7KN1E4R7SUxNV/gJzyGJFEl/Pf6KKUQAL3j8oR9l2r0Xn3CoETKMNmzN4+M3rkArFM+w4dq04Ro
	k
X-Gm-Gg: ASbGncuXPtHpyxsx22Fvmhj0L5yWix1D5IQLCpMfZ3xeLO4yGHRh+OerXQEATrOLREj
	kPiXf2rZgqMJ6dvW0YEEat7+TTH+zeFpq+DWHcwpVUbIaZyZ7HGPC72n+Sx8N1T0MKvHQRg8x15
	NjsiHAFr6CQRdW0tWe4GSqTo8nX5yTa/vNHF7pTMOwg+9SjjX2foxZOypNL7ETA70GUeFov7Zzv
	NZ4OJMAQu4wK7L7ejjKO+D+tLfiNe+fyMvfkdnyKkeBdXQQA7m02F5qmJDpny4HM/mJhrL+hLZO
	Y4XyX74PBg91Ta7iAfcX2atklk7/yZK2hgSTM2C9QJLXSkdWOrdAjgMlQdptlfVom+7uWfLZTAf
	0eGagD6FJ3x0BSXFsvITifP5viEhZUIMOooeAk9JakG/+6lDc
X-Google-Smtp-Source: AGHT+IHmOShT5EF7c3R5tNzX6wyS7MH47dTe5I+Ap9Z4Yx/n68RgDdQkRgooK1qEC8/DjoqNag1Q/g==
X-Received: by 2002:a05:600c:1c9e:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-441bbeda8a4mr45085415e9.16.1746226200944;
        Fri, 02 May 2025 15:50:00 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa008565a33a7c41f265.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8565:a33a:7c41:f265])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc50esm58235205e9.8.2025.05.02.15.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:50:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH 3/3] python3-evdev: add ptest
Date: Sat,  3 May 2025 00:49:45 +0200
Message-Id: <20250502224945.3081334-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502224945.3081334-1-yoann.congal@smile.fr>
References: <20250502224945.3081334-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 22:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117283

From: Yoann Congal <yoann.congal@smile.fr>

root@qemux86-64:~# ptest-runner python3-evdev
START: ptest-runner
2025-05-02T22:19
BEGIN: /usr/lib/python3-evdev/ptest
[   61.988046] input: test-py-evdev-uinput as /devices/virtual/input/input18
[   61.990878] input: test-py-evdev-uinput as /devices/virtual/input/input19
[   61.993060] input: test-py-evdev-uinput as /devices/virtual/input/input20
[   61.994497] input: py-evdev-uinput as /devices/virtual/input/input21
[   61.996659] input: test-py-evdev-uinput as /devices/virtual/input/input22
PASS: tests/test_ecodes.py:test_equality
PASS: tests/test_ecodes.py:test_access
PASS: tests/test_ecodes.py:test_overlap
PASS: tests/test_ecodes.py:test_generated
PASS: tests/test_events.py:test_categorize
PASS: tests/test_events.py:test_keyevent
PASS: tests/test_uinput.py:test_open
PASS: tests/test_uinput.py:test_open_context
PASS: tests/test_uinput.py:test_maxnamelen
PASS: tests/test_uinput.py:test_enable_events
PASS: tests/test_uinput.py:test_abs_values
PASS: tests/test_uinput.py:test_write
PASS: tests/test_uinput.py:test_not_a_character_device
PASS: tests/test_uinput.py:test_not_a_character_device_2
PASS: tests/test_uinput.py:test_not_a_character_device_3
PASS: tests/test_util.py:test_match_ecodes_a
============================================================================
Testsuite summary
DURATION: 0
END: /usr/lib/python3-evdev/ptest
2025-05-02T22:19
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 +
 meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index a1465dac7c..b953ae2502 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -23,6 +23,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-dasbus \
     python3-dominate \
     python3-dnspython \
+    python3-evdev \
     python3-execnet \
     python3-fastjsonschema \
     python3-fastnumbers \
diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
index dc777cb987..993dfca1e6 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d7bd1cc4c71b706c7e2d4053aef50f2a"
 
 SRC_URI[sha256sum] = "5d3278892ce1f92a74d6bf888cc8525d9f68af85dbe336c95d1c87fb8f423069"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 do_compile:prepend() {
     rm -rf ${S}/evdev/ecodes.c

