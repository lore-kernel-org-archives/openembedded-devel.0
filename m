Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34341.1794851727929106662
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BUpKL+PZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380b40312e2so1302538eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851727; x=1795456527; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=evOzugwVAvMO7rckpiJley4lONtSJIVKvennkD6vDmA=;
        b=BUpKL+PZJ27aOyrDk+7beXU4G5+3oZnlgzAAoL+VhCWjLbgSfMpa43yWYmrBfat/g9
         o3qANHdHnvDOVHp1PRVVt8kwn4pLdf2/rM3XMSIa53ZbBwzvNdhE8aNyZBSSn682JOY+
         rB6LF9Dxk3qEe7Gss4GMlG6AB4dcNH1tUUc9YdYmDMlP5FoQ+eZyAe8DaEfik5tCdUDE
         hwUj7Vr1HuvYWHwmLj2BHGfnn9my9Vs4iJhUHwagn2DTwrytAauxmJorKySSolUGGJx8
         Am0scd6jUdFsKigU7ionsO/3eG+Y93dEsNjDeA++ZGhPgqZYNfn89pWqJdtwyVPKGEfy
         /f0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851727; x=1795456527;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evOzugwVAvMO7rckpiJley4lONtSJIVKvennkD6vDmA=;
        b=Pb/gXpYD7Rwk8wQ7m57VKvkIeiHcUp9YMlgNQfNmXGZD0fzAJ+DL5DTjR7+rOoO8Oe
         uMfAr2OWACh1d++og7rk1kE6ZiiQ/e4cpaHmgnD/9K8fnbemFcf6kKycTHFYVLrqyRj8
         6sGDELKBUYUoRk10MIQLVPvWeSD9iMyvSfRbNkK5ZvOPPgj1MTSNs8mxq0dvNzjWRNve
         DtjithgdVdXY2lkP/EpBXG2uy1/7CXP77wAl8IxIkv3e5wWeIMOmj88cwEttE2kO/wtg
         aLNIAYpUGNe3hnm1Rf/KL/h54ZluQJq4QBhNsEs25dgMzna8RAgOMh7SaexCtKSyprEw
         e/oA==
X-Gm-Message-State: APuU4Z9bdE/WBaSBhv5YLgSI/1uL/yTS62kHfAUC9dG9+q+i2jO2et0N
	UsVhUq1X8o6ul9hICiLscH0hu9wU6Gt4xb8STZGbVcEhoJeqHl7qhYQoOmWhFGO1
X-Gm-Gg: AZFdTZc7hEbj0C2kv69B6Uw3Z1a/bjLxOWhcYALRRj7pj6LREcYM1/QgFTAQBycOyBM
	LcrayQZQYjOAuQ+7jBN5AbunQ1pA7VamkhgZCzC3jUNmlJXqbMY+/+vkei4LtfPyMi/yCaxfpwY
	KygTauPtiNYvUYLcKjP5kF9xQLpPPJAfW+MCIxqG970k51LjHcL/lKyzSB2NEbPunlM7KgMxRGz
	sbQhKTlwzUfDmpTbswuz4o8VqHixvf5XAbTy1t1+Ivnds4FjT8MJNePCDzRZTjkWrPjeYhOiXrk
	CtC45IqzsG5mdGo2p6Md+gIq7ZtlwEDEGKqtRo5DXZRVZntyTadK+U/Omj+JovyrJb4CYl9eotx
	vdB5FHMVo3dqwg3LkXedEo4X08AqbtHT93NLeGygzyN64bcoFo4QiS4b1mQkm6Hwj9Ts16Kci++
	Q3lrUwmBDb30OLJLvuqsFVApGzAvkooiNVnaQsZw0Ma48N/3q9NiO+HGyidl0noWwE+RNGDx/iF
	ydOVe5AqFHIJberALrQN4h1k7+Fzx2nJyJgjQrwvIoVFwHucAS3uFj420ExUA9Gcb54+3WwLvt8
	W4tLAHLPp7xZqcJ1YbUN/DduHYenEvZFuNydpCuWr5XTkjt4x9Ge6DepU/OBhtUZSlRovkfUqcR
	2uYh702adutXMH8udfHNWbLK/3weLWNDIVgM3b5BfCwcekR5diRopMGPgrMe1Dr0jhqGJvDq9ta
	e0zxmzfRbNWdAdFATwa2zC/FLIl7wsBmkOY3qFLwuHTA7Ib1JV7q8BT8tMGX6J0VwJJQv9LvWp9
	gl2ThW7cbl11P6ksjs80hMAZ4TjKe6CH/qEpL42kreg9VPenE1m0+V04r6w2zfv7ZsOwzRi6YFV
	pld3vg==
X-Received: by 2002:a05:693c:895a:20b0:369:f97f:72c1 with SMTP id 5a478bee46e88-3796721d051mr10888661eec.36.1794851727007;
        Mon, 16 Nov 2026 09:55:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 059/105] python3-platformdirs: upgrade 4.13.5 -> 4.14.5
Date: Mon, 16 Nov 2026 09:53:11 -0800
Message-ID: <20261116175359.342679-59-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132515
Content-Type: text/plain; charset="utf-8"

Add hatch-fancy-pypi-readme to DEPENDS, now required by the build. Drop
the strerror test patch, it is part of this release.

Changes:
- 4.14.0: new keyword-only ensure_exists for media directory
  functions such as user_documents_path.
- Many Unix/macOS hardening fixes for XDG_RUNTIME_DIR handling
  (reject symlinks, wrong owner or mode, replaceable parent, races),
  relative HOME treated as unset, os.pathsep in appname/version raises
  ValueError under multipath=True, linear-time user-dirs.dirs parsing.
- 4.14.2-4.14.5: dedupe equivalent XDG directory spellings, preserve
  trailing whitespace in absolute XDG values, fix "//runtime-<uid>"
  temporary runtime dir fallback.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-host-strerror-in-warning-tests-630.patch | 43 -------------------
 ...13.5.bb => python3-platformdirs_4.14.5.bb} |  7 ++-
 2 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-platformdirs/0001-test-unix-use-host-strerror-in-warning-tests-630.patch
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.13.5.bb => python3-platformdirs_4.14.5.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs/0001-test-unix-use-host-strerror-in-warning-tests-630.patch b/meta-python/recipes-devtools/python/python3-platformdirs/0001-test-unix-use-host-strerror-in-warning-tests-630.patch
deleted file mode 100644
index e702c7e842..0000000000
--- a/meta-python/recipes-devtools/python/python3-platformdirs/0001-test-unix-use-host-strerror-in-warning-tests-630.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c243545c7ee2561ed0b5475c1b43f626d1284111 Mon Sep 17 00:00:00 2001
-From: Yusuf Efe <120668197+yuefdev@users.noreply.github.com>
-Date: Wed, 28 Oct 2026 08:45:21 +0300
-Subject: [PATCH] =?UTF-8?q?=E2=9C=85=20test(unix):=20use=20host=20strerror?=
- =?UTF-8?q?=20in=20warning=20tests=20(#630)?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Co-authored-by: Bernát Gábor <gaborjbernat@gmail.com>
-
-Upstream-Status: Backport [https://github.com/tox-dev/platformdirs/commit/c243545c7ee2561ed0b5475c1b43f626d1284111]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- tests/test_unix.py | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/tests/test_unix.py b/tests/test_unix.py
-index e68f2b8..1afb622 100644
---- a/tests/test_unix.py
-+++ b/tests/test_unix.py
-@@ -1,6 +1,7 @@
- from __future__ import annotations
- 
- import contextlib
-+import errno
- import importlib
- import inspect
- import os
-@@ -401,8 +402,8 @@ _PROBLEMS: typing.Final = {
-     "mode-500": "has mode 0500, not 0700",
- }
- _UNREACHABLE: typing.Final = {
--    "file": "Not a directory",
--    "symlink-loop": "Too many levels of symbolic links",
-+    "file": os.strerror(errno.ENOTDIR),
-+    "symlink-loop": os.strerror(errno.ELOOP),
- }
- _DEFAULT_PREFIXES: typing.Final = {
-     "linux": "run/user",
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.14.5.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.14.5.bb
index a5bb41f283..be9e043d87 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.14.5.bb
@@ -3,15 +3,14 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0"
+SRC_URI[sha256sum] = "32e9921db7385aa8169bee4fe9501923e5715ba9fb7ea3b9c69b0d8e0639f7a1"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-SRC_URI += "file://run-ptest \
-            file://0001-test-unix-use-host-strerror-in-warning-tests-630.patch \
-            "
+SRC_URI += "file://run-ptest"
 
 DEPENDS += " \
+    python3-hatch-fancy-pypi-readme-native \
     python3-hatch-vcs-native \
 "
 
