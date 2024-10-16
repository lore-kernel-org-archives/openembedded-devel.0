Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A73D2A551
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:19 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.32011.1729107317583708908
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gqkqLCOZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d325beee2so57212f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107316; x=1729712116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTcvQ8vnSxpeuZJnNTxl3Pd+Mv5gnie7unyaJ79YXRU=;
        b=gqkqLCOZBo0LXjXQKyB6sfGXLUuCgTAU/S05Ep++0V681CXcp1bxcL/s1uGHlrzlA3
         IPsJ1+NWGVRER9CzWIrPdTycO7NExoHDMvuxouZvraRTQjqRiVaAjj+KA1+qftN/gPKY
         G8FFmmbE+OgnMpoMcv9/Lf4i2vFYqFvqPeRjj82r/Vcy3hNMyWFsIaBbu+e/qHZm/7Lv
         yh7aeGTX6kk4o39ebztk8oF+Jyftvcz4oUB7TH6XwNAUiOUEgEwuLDhUMn5z2J2COl04
         VTYmKEt5m/7mSqVuABDI5f29OoOvVAsoMqi5ygtZEiXmn0qGsh8luPhii/uFFdoXIh+7
         DStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107316; x=1729712116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTcvQ8vnSxpeuZJnNTxl3Pd+Mv5gnie7unyaJ79YXRU=;
        b=US1eEpP0BvlSCkJr332PvqVPPk9QtWzhx7DeAaXpD5laup2qTEG5r15R1YyHNk+3Zw
         mUGWWA9yg3xccBEyEuWziShKnpXBMN3rGxZ1P6LdqB1/pZNA8Zjx1TBbdJ5r5l9dHodj
         +9XnbWeeHD0mzDi658Az6DnBvIo0HHbim2pWOpPg9pnDE+MyPTRWEXGp5A+4RL/Grb9Y
         adH7pvNDfyipBwEg0us+GtYaelWzxN9RENrge9vQQ0/VRwwG453u30wZu8YT5NUpEWUo
         bllEzFg8onNRvU/4gu2n3se4xSjj53Rb3Mn10/+08hafZEC+mZhCSInalqEJYcfGMjH/
         gKcw==
X-Gm-Message-State: AOJu0Yxxk5U57nEYgOjspmoNIvu1vNkEV74v4AhoREJTHkFOzYx2RmVR
	P2obCSIlrcxCO1gEn2akQBfRZ/JHiWeIfxU/+bYlcTnysKyXid0Sg3ZdVA==
X-Google-Smtp-Source: AGHT+IHxeag5EiLdSgFcMrydYDgr4z9QOkEeLMkuNJ6d3vBFtqFmV85jo0v9/ML4RNkA22P8QjDx7w==
X-Received: by 2002:a5d:6d83:0:b0:37d:42ce:f3a5 with SMTP id ffacd0b85a97d-37d5fec9a48mr13011795f8f.12.1729107315806;
        Wed, 16 Oct 2024 12:35:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/13] python3-yappi: backport a python 3.13 patch
Date: Wed, 16 Oct 2024 21:34:58 +0200
Message-Id: <20241016193505.3459828-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112947

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-yappi/py3.13.patch         | 43 +++++++++++++++++++
 .../python/python3-yappi_1.6.0.bb             |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-yappi/py3.13.patch

diff --git a/meta-python/recipes-devtools/python/python3-yappi/py3.13.patch b/meta-python/recipes-devtools/python/python3-yappi/py3.13.patch
new file mode 100644
index 000000000..48d81d56e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yappi/py3.13.patch
@@ -0,0 +1,43 @@
+From defc0291039184b640779e38471ece5e6d3c8cb8 Mon Sep 17 00:00:00 2001
+From: Alfredo Moralejo <amoralej@redhat.com>
+Date: Tue, 2 Jul 2024 10:48:24 +0200
+Subject: [PATCH] Add support for python 3.13
+
+_PyEval_SetProfile() has been moved to internal pycore_ceval.h and it is
+not longer exported [1]. PyEval_SetProfileAllThreads was introduced in 3.12 [2].
+
+[1] https://github.com/python/cpython/commit/c494fb333b57bdf43fc90189fc29a00c293b2987
+[2] https://github.com/python/cpython/commits/76af5c9153394f3d07562427168711a68f54ec66
+
+Upstream-Status: Backport [https://github.com/sumerc/yappi/commit/defc0291039184b640779e38471ece5e6d3c8cb8]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ yappi/_yappi.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/yappi/_yappi.c b/yappi/_yappi.c
+index 459f4dd..56187c9 100644
+--- a/yappi/_yappi.c
++++ b/yappi/_yappi.c
+@@ -1284,7 +1284,9 @@ _resume_greenlet_ctx(_ctx *ctx)
+ static void 
+ _eval_setprofile(PyThreadState *ts)
+ {
+-#if PY_VERSION_HEX > 0x030b0000
++#if PY_VERSION_HEX > 0x030c0000
++    PyEval_SetProfileAllThreads(_yapp_callback, NULL);
++#elif PY_VERSION_HEX > 0x030b0000
+     _PyEval_SetProfile(ts, _yapp_callback, NULL);
+ #elif PY_VERSION_HEX < 0x030a00b1
+     ts->use_tracing = 1;
+@@ -1298,7 +1300,9 @@ _eval_setprofile(PyThreadState *ts)
+ static void
+ _eval_unsetprofile(PyThreadState *ts)
+ {
+-#if PY_VERSION_HEX > 0x030b0000
++#if PY_VERSION_HEX > 0x030c0000
++    PyEval_SetProfileAllThreads(NULL, NULL);
++#elif PY_VERSION_HEX > 0x030b0000
+     _PyEval_SetProfile(ts, NULL, NULL);
+ #elif PY_VERSION_HEX < 0x030a00b1
+     ts->use_tracing = 0;
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb b/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
index 4349cab1e..80d5012be 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
@@ -10,6 +10,7 @@ SRC_URI += " \
     file://run-ptest \
     file://0001-test_functionality-convert-line-endings-to-Unix.patch \
     file://0002-Fix-import-of-tests.utils-to-enable-pytest.patch \
+    file://py3.13.patch \
 "
 
 inherit pypi python_setuptools_build_meta ptest
-- 
2.39.5


