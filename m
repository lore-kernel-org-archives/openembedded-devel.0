Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.681.1793419073847338223
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=X+n0T/1O;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so728914eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 20:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419073; x=1794023873; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rhpetL3Av6z+JzJlKsX/TfCIVzK+aSR26uaQ1p25Hhk=;
        b=X+n0T/1O/48tWjNFuWq3gT8EfPSHqwhSD5vCIzOrXmWkHGW3a4Qw62obdnrro8C9/r
         tt02SO7oT+kZxwEVJ1LarHEcf5X/UhQz3pexGpTlqOJ7IYBB0ZDMYj8suwrZ2jQ8GCz/
         QTGovjLRTwIHhJRPjp+nFnL0Ki2T9sBdOq2/fDGQLhE3n/2hHkN7PPiassdFOyXsN9d9
         +QJBVKIyCYWGqc2xBDB4EGS17j8bgTbfcRF0FahplqALhQ2/LO5gqbGEoe9+PJxG/6y5
         VzFppc3dxE/Qkby686wA2ibRT9zkZXJ4rI6FnO+JQbaIueoW4rAFEujt/6av1eA/jiv6
         jLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419073; x=1794023873;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rhpetL3Av6z+JzJlKsX/TfCIVzK+aSR26uaQ1p25Hhk=;
        b=WJmqc9PQVRaBbxN2CY9CgQnMx43ykpb0zIP5w7cWMWB1RwaC2mvVTIopoPRUmki+Vj
         rOf7byAITNUu0xw9yg41Oatqh0YSJU+X9legvFJ9MpVzZhXc+Aj9FhyKpgo0LJJvZ1Ik
         HgKfVRGiiCxe7iH7tL7HJIDE/QI4fojI+oRQ7a8sEUjUrdEGSJzWqMMbDt2M1yQaW6XA
         zPupl1tyCsMBlKxZLuQdWVGBUW3U+b5y7ncbWZtRXs53z9Ff0EMArBJQpDULITNIGgTf
         6wcQgiApGp9XjVKiinBUiKRmcrnLxcAYoOn7m2yLse5kNX9cJfDdUwbOthx2Phn9QcZB
         nZ0w==
X-Gm-Message-State: AFq9FYKOCYJS9HC+eA9pTyNhOCNLlf2tasXfVhHEkEgeiCvq6nl9/Xie
	xAXsC6w07KlI8KiEqW+URfIVik0l85MzMBgwnWioMgc+MZdrq7pGZGzrw+CBlotngK0=
X-Gm-Gg: AYBFou3Okn4EGmY1Ujz1BNaM1JmMud5hvW64XOP9aOYahErYvqW4pNlMB3NbYb9FHVU
	m26rN9EgZ5GWHpQ61HZ5q7t+hzZf0nvIDXWYotFlvm2CXfe9MlzsO+FU0zsFOtXhpEhVBpJBbad
	P7UNWYB7Rfv8lJ5MeV7vhHvEl2xDD9uAPicuUTXndtQ9XWnhcbbySsmJqTTcpZc5voaQuophOFG
	wP6kXN3hVvsokXu/ZgLqZQSkBvsHn93/I7J6TlB6QI4pfndOyp17G/fBiNK8QgBCdeHlhoEujgg
	8QuM0hVnoME7L0hOxT5oPh0kTRtEJjyiv9pDuYJIlPPn2PKN4pDtK6TZkK/sFfB20BGfYnEUfaO
	6QFcL/kd6apWP4Irs8d0Swl1mc7TTDz46Hcbr0iodcHDT7OhjLkM/aBN8qxRoGyfjmAmhZithpH
	K9sVXYVVNhK1+FFZyRSSWpkMQzPAYAm9P0R9fx+MVIRex2i2H16rWbGIaXZRAyfrOQK/VjIwKtN
	NyGDMt1xfccYzK5M/CQQ+WtEdQVNLAljLasuG/zcb/uNFYVlEI0V/BIfugT1ShYT0nhr8RoHoaa
	XPXpLP9/vUzBbZFrJhWReyFa+3VzGPv1k3lDdudw/6Es7SFPB3ENAQ53y6M4spSpxJDDeFa3usO
	RzGY3bLs4yxfzhmzFeZFYYI1RjR72whTlR10fC/x7x5P4H/NvG6j4LCc7crHi89I0trbdsQUpkB
	RVj1BzZ7lJQ52b1Xr+7XAKARMkpcPtoq9KDbBuKEYJydEciUovGr+0akJ/y1EcFUxfXtmqbVRqI
	O+y1QcOhfb0EmS4fCeVbvpzq5Vn4/uFMsiHbl1sFPEyhBBeNQojV9Rzbrbmp7uRK5pt4iKR4rOC
	NFPp
X-Received: by 2002:a05:693c:415a:20b0:36a:50f2:a5a5 with SMTP id 5a478bee46e88-36a50f2a73emr2292548eec.2.1793419073077;
        Fri, 30 Oct 2026 20:57:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm13687837eec.23.2026.10.30.20.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:57:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 02/10] python3-platformdirs: Fix ptest failures on musl
Date: Fri, 30 Oct 2026 20:57:39 -0700
Message-ID: <20261031035748.2130261-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
References: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 03:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131712
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

test_runtime_dir_unreachable_xdg_runtime_dir_warns hardcodes the glibc
strerror(ELOOP) text "Too many levels of symbolic links", whereas musl
reports "Symbolic link loop". Backport the upstream fix which uses
os.strerror() instead.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-host-strerror-in-warning-tests-630.patch | 43 +++++++++++++++++++
 .../python/python3-platformdirs_4.13.5.bb     |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-platformdirs/0001-test-unix-use-host-strerror-in-warning-tests-630.patch

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs/0001-test-unix-use-host-strerror-in-warning-tests-630.patch b/meta-python/recipes-devtools/python/python3-platformdirs/0001-test-unix-use-host-strerror-in-warning-tests-630.patch
new file mode 100644
index 0000000000..e702c7e842
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-platformdirs/0001-test-unix-use-host-strerror-in-warning-tests-630.patch
@@ -0,0 +1,43 @@
+From c243545c7ee2561ed0b5475c1b43f626d1284111 Mon Sep 17 00:00:00 2001
+From: Yusuf Efe <120668197+yuefdev@users.noreply.github.com>
+Date: Wed, 28 Oct 2026 08:45:21 +0300
+Subject: [PATCH] =?UTF-8?q?=E2=9C=85=20test(unix):=20use=20host=20strerror?=
+ =?UTF-8?q?=20in=20warning=20tests=20(#630)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Co-authored-by: Bernát Gábor <gaborjbernat@gmail.com>
+
+Upstream-Status: Backport [https://github.com/tox-dev/platformdirs/commit/c243545c7ee2561ed0b5475c1b43f626d1284111]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/test_unix.py | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/tests/test_unix.py b/tests/test_unix.py
+index e68f2b8..1afb622 100644
+--- a/tests/test_unix.py
++++ b/tests/test_unix.py
+@@ -1,6 +1,7 @@
+ from __future__ import annotations
+ 
+ import contextlib
++import errno
+ import importlib
+ import inspect
+ import os
+@@ -401,8 +402,8 @@ _PROBLEMS: typing.Final = {
+     "mode-500": "has mode 0500, not 0700",
+ }
+ _UNREACHABLE: typing.Final = {
+-    "file": "Not a directory",
+-    "symlink-loop": "Too many levels of symbolic links",
++    "file": os.strerror(errno.ENOTDIR),
++    "symlink-loop": os.strerror(errno.ELOOP),
+ }
+ _DEFAULT_PREFIXES: typing.Final = {
+     "linux": "run/user",
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
index 40c7b25333..a5bb41f283 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
@@ -7,7 +7,9 @@ SRC_URI[sha256sum] = "05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb4754
 
 inherit pypi python_hatchling ptest-python-pytest
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://0001-test-unix-use-host-strerror-in-warning-tests-630.patch \
+            "
 
 DEPENDS += " \
     python3-hatch-vcs-native \
