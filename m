Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37968.1795594145697755926
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fG0o/+mG;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385d8a00598so8058626eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594145; x=1796198945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIJh8lOpx0iNOxFXMALLiDwBG7ruog7SQAGtes5zd1A=;
        b=fG0o/+mGDM9t4vlOobKmeSuukDQfbTJczesApXuHed55ImyW44B7KMpuEQAz/GtWEW
         NPfuKmtFilmXaZTl9EBNs2kjhPu7v+G97V09ZOgbdtOxIclMk5ByO23JQ1NxjZ/m+JOJ
         tq5duEldAeWoFg8f1wKQ46eqK4CHQuP9MiYGIJTcPuQXrNUgNTNqyNCTzhHVZyxXMdM2
         sBoEsGoQNorkxgTYwgPswzLy4McoYIcDmx73XV1YsqN3IUxOrvYD9DbYyeJxNKY/W3ZK
         wXp6qCqDfpmb09kxmDv18kTZpFYu2+IK4jn1AFa9TinSePLXc6jWQIl5IZFM3TWz+Fpf
         PPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594145; x=1796198945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIJh8lOpx0iNOxFXMALLiDwBG7ruog7SQAGtes5zd1A=;
        b=hJWS1bm2Smp4LzBGHRnd0QWiprZv2mdXcFGrdrvJu9TH3D9gkxortOki7wFFpoz+rd
         N2Zj4UdOJ18cPEdq1Rv88kZZn2dHieXiXWyvEhS8k6cNs7bys4pCP7LkOcZwX7BIThGx
         sDbWAYXbSEvfG/a/nJbUyxhbdJJ8+QqIe1eEIlu14dErSQK4OO4vxTn07cBfqeOYTetc
         a9kVsn1E3iTUGR6RpvbaZapDsh27SRQrU19GTV4v1NgZh9dkXYLfoXTzaW9VUDSJm2VZ
         4RUFBJmctDVo47jFJZ+VKfL27nZlw6MMCp5Q5+v/eTiCQrMIYOhT/+IP2V8U+zPxOLs5
         M7Wg==
X-Gm-Message-State: APuU4Z89rfePwcEdrgBR2sZ8UgooQC2raDgwKE8ZxBNrFncfprxrLKrf
	/LzeAhzj62fmkFb559E7NaSsRz3Ig7XrNqji2w9l/XYQcqpq1QpmccrMOcmmBeL6
X-Gm-Gg: AZFdTZcCLX9mNHpXGhbGkmaKQQjJQvD6Ur9D8GJjpYuyiARWhPzLPvnWObdmeEG+n/l
	V9Ify28iV0YVEl09hS/Hm2M4TyP8eGG5c+ymG5wM+uN6xY1l4DlyYDJStUmEQBMNxEr0q3CwOw4
	gUe70MyTSo2/p9xt+uoi30sGYZrda9Ad4lmHYpKzTDGY0nLzv14AHd4153r2EGQ8rYzzKJiP6HI
	HGrmrufCNlgZNa2D1Ad9hF/1Frw2rQ/fUOIcUBRcnc6dsTHwMloE44LYTWJjsOTGibivHjdrrKn
	x1PZJKKxvSSy3zsvosylJ1lGfLMVHW7Izoh5M+jVqt34jJfX9yBRlwnAI99OEOrv+qoe/oqPTge
	Ik/sD6g+K+0IdJbSVNmMVdXUT7qg+pTixjhcGCoEkuFSvEdz+czxNNC/FXLEG6VxARDtB1w4hCQ
	0Pb0ul9hLKA06AdO68TV30ApfutRHj9LjgbUKj5B8OJaP2oPP27+6HaLoDvlz3HQCBFKu+bpr7j
	2ZHdSzd0mBxBU3TwrpCzH9mRerKgJej3vo9smNFIJ+Dp+dL0vXIUnXjmLBB2MJ6EMkf/vNazXzH
	XzU8kNG9FOzq3Kn1+nEObva8nD/muk07YftUy+mR5wwnRi1A+x1ogc84Sv4IQ6cWtLG0aer7TiK
	yO+lc3Rux9qPtGeIru9Opng/ixH8enyqjQbD7vPq11vedRcLqYPl+rAA9P3EnYJWjvQoPrQ5inh
	yPuvYw8LZF9YIM8C/TJ3ICrmikAtcGG5tuz2TDZGGrjcbIlCis98aczWPpZU8/3NZSifc8JWTZc
	lY4Bs4uHuYUWpCcek0PWtVsmCpciNBn3TnpP1is8CvhMzGYKTg2gvKgxPgfsjVwxDGJp8l7n6FF
	MNYsq9FBKI/9Ltl7K8rEAgjhrg==
X-Received: by 2002:a05:7300:d941:b0:385:4b9:18e9 with SMTP id 5a478bee46e88-3856f94f874mr18436793eec.18.1795594145000;
        Wed, 25 Nov 2026 00:09:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:09:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 11/14] python3-yappi: Fix coroutine call counts with Python 3.15
Date: Wed, 25 Nov 2026 00:07:22 -0800
Message-ID: <20261125080732.2419614-72-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133069
Content-Type: text/plain; charset="utf-8"

yappi decides whether a coroutine frame is being resumed with
IS_SUSPENDED(), which has a Python 3.14-only branch that checks for a
YIELD_VALUE instruction. With Python 3.15 it falls back to the check
meant for Python < 3.13, so each resume is counted as a new call and
six asyncio ptests fail, e.g.:

  tests/test_asyncio.py:SingleThreadTests.test_issue58
  AssertionError: 2 != 4 : async_sleep 2 0 4.005451 2.002725

Use the 3.14 check for 3.14 and later. ptest: 101/101 pass on
qemux86-64 (glibc, systemd).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-coroutines-on-Python-3.15-and-newer.patch | 36 +++++++++++++++++++
 .../python/python3-yappi_1.7.6.bb             |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-yappi/0003-Detect-suspended-coroutines-on-Python-3.15-and-newer.patch

diff --git a/meta-python/recipes-devtools/python/python3-yappi/0003-Detect-suspended-coroutines-on-Python-3.15-and-newer.patch b/meta-python/recipes-devtools/python/python3-yappi/0003-Detect-suspended-coroutines-on-Python-3.15-and-newer.patch
new file mode 100644
index 0000000000..748cadbbe4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yappi/0003-Detect-suspended-coroutines-on-Python-3.15-and-newer.patch
@@ -0,0 +1,36 @@
+From 99e422d5bcf9edff8427f9ccb5476ffec64c3348 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 24 Nov 2026 12:39:11 -0800
+Subject: [PATCH] Detect suspended coroutines on Python 3.15 and newer
+
+IS_SUSPENDED() checks the current instruction for YIELD_VALUE only when
+PY_MINOR_VERSION is 14. On 3.15 it falls back to the gi_frame_state
+check meant for Python < 3.13, which does not detect the suspension, so
+every resume of a coroutine counts as a new call and the asyncio tests
+fail, e.g.:
+
+  test_asyncio.py::SingleThreadTests::test_issue58
+  AssertionError: 2 != 4 : async_sleep 2 0 4.005451 2.002725
+
+Use the instruction check for 3.14 and later.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ yappi/_yappi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/yappi/_yappi.c b/yappi/_yappi.c
+index 8b867ef..ffd9e68 100644
+--- a/yappi/_yappi.c
++++ b/yappi/_yappi.c
+@@ -228,7 +228,7 @@ IS_SUSPENDED(PyFrameObject *frame) {
+     if (gen == NULL) {
+         return 0;
+     }
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION == 14
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 14
+     unsigned char curr_op_code = (*frame->f_frame->instr_ptr).op.code;
+     return curr_op_code == YIELD_VALUE || curr_op_code == INSTRUMENTED_YIELD_VALUE;
+ #elif PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION == 13
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.7.6.bb b/meta-python/recipes-devtools/python/python3-yappi_1.7.6.bb
index fefed051ab..be47e4ea40 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.7.6.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.7.6.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "c94281936af77c00c6ac2306a0e7f85a67e354d717120df85fcc5dfb92
 
 SRC_URI += " \
            file://0002-Fix-import-of-tests.utils-to-enable-pytest.patch \
+           file://0003-Detect-suspended-coroutines-on-Python-3.15-and-newer.patch \
            "
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
