Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33623.1794851651832050693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=z7iY7N4K;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so9836801eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851651; x=1795456451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TulcDAaURXdiFl+tAgqNwRKFJcrH3ibA0whBhPLUPA=;
        b=z7iY7N4KUTrX/opnHU4WWJblahJbLAxwiOJxntrDyrYlcVebptEnrjNkoWBBbS2snM
         Uh1RlDbpgNN2+DbtVFGjFJwDV/R1/otBhoO2yMsCHH2dblcF13ZgGHQMF9SVY7v7sF9/
         RX9jJfCA8Vd8vsUKERLrxnN5aiCGJ1sFbRX+edXxxbc9JszdJ2G5Xal7O3vmAR2CdGqk
         pj0j9CxSz0qp70+mB6bwCfMZ7RgY+jCRENZ7n8/RQeMtG9RVFagzzpujVO2UtZdMCSF4
         sWf2sNUswmRpsRec313uoZ0vR0FopgJzJ8KB7XgT4+puUgGmS1uFC1Gh7hUoOeXUhHiX
         W3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851651; x=1795456451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TulcDAaURXdiFl+tAgqNwRKFJcrH3ibA0whBhPLUPA=;
        b=MA3x6uyqHtSa7NpSt2qoxeyfSE3nXqdrH3Vm8++PnN6vtAo7Hjva+O/1y/mfjUungN
         jrssiAHaiOGzgaYfsTD+XIbQFAPceFfc/arPByLfFKT57wakTzneyGcAWYAJ7aXrs4Bh
         C6VBqxTgXctgnoANdP1uvKJ3yr/Xd/Br2/Puv3EDrOr1powDRy81MxuE/8zqD+ZYblKn
         z0ukoYPvpT9JOYon0tDtXUtAZrZ8+/EBZ+UP1rzBIDFb9XTiFEOxU//1jK/dl108J7+D
         wslSiGyqtlHBPzUGrO4soZufShzmH80pZvIk0FlfQjj9WRC4FV6EBfdI4f7XXENcLTng
         QuOA==
X-Gm-Message-State: APuU4Z/dJw1qzoEy6PjaLMKfMsulA28aDwptOQSicKvFIqxasmaD1+M5
	YkvvOtoVT7cVYfOBQWO6BC4k2XCBWsylc9m0umLyu8VRkHP1Y9z8B8dPkBVmVtwC
X-Gm-Gg: AZFdTZd66jefK3n9N4SHdpEIPW0CfY5SxuPvIXA/QoV2nfMT8MBwJZjcG0JD9jatgd6
	wMmepWYfT/v8ORxxQsorksbxHKVMzXVdy4DjmEJxitMT9gJL0Ilw8Kskr+qFmgZnk/muTy3eT06
	TWL0sFcqRMnr81x0ceWzzib0aZoQXdoUtzS6YncCYGxI4J80VhXyuprvACYmVotTotU4kWHU7L1
	7Gvag9mLiQg7PaY8aoWrjb+2XFNlBLuHPeFeiOpmty2lK76Hopoia1cUVR8o+argRVt6lwXVDmm
	El/2j3dbCxNdPHSF2Yc1IpvpByOogZi5lg5K9zPulcc/Rrf6e+JTR9xgZeJpbK16xvWeuzuhttp
	EHPnYn3wsOMOqNlnUUHE0Gsd0M7ciRoKXlpA+dotJd45vzf0z2++5WeQQotnf2hKImOA+UpWU6a
	ha93LD3juPSrTlMGcuO4HUwPgY69SfkmlnNVWbaUOPPQ6/GcR0ZoTt2qzVkvH8i5DCpROGHXyN/
	/E6L7dvFVR/ESVkfjwArxjY/8TS4xEjiGHSAGZ1m9Ri2+9DvlEHtDdv/v/t5IncYb4m5y3ap0gN
	Y+zTlA5CETc8rhHRB4r6F8aLi3+j6JqQtdN5QlrEOn9RtkW31770qcpJNsdTD8CFVkj+nBVxR+3
	VDea7L1O+tYhmiL3P4kYCaRbw4Py3ThNHcTPRGnEiEzveyyHEURoHoozcTXDi66ijZom79L0nNM
	WrkD/vlqEfCxv07m+hL/sCcpwIzoCXeEeF5drMYa3QOo8MRGSOCwVUHgEIJEoi74wlN2eYS8GEl
	jK1gBVCanpnc2bLGGbO/sbYbhb7hzPzxgDGCK+VBBh1Nc/CNKdJmf8E32vvN2yIIA/URedyq7dB
	ILg8AAmjgnTrvw8zk2ISxNPuxw==
X-Received: by 2002:a05:7301:11b:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37967316395mr12768907eec.25.1794851650943;
        Mon, 16 Nov 2026 09:54:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 006/105] python3-bidict: upgrade 0.23.1 -> 0.24.1
Date: Mon, 16 Nov 2026 09:52:18 -0800
Message-ID: <20261116175359.342679-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132462
Content-Type: text/plain; charset="utf-8"

Upstream builds with uv_build now; inherit python_uv_build and relax its
narrow uv_build version bound.

License-Update: Copyright year bump.

Changes:
- Breaking: requires Python 3.11 or newer (was 3.8); build backend is
  now uv_build; typing-extensions needed only before Python 3.12.
- Breaking: remove bidict.metadata and bidict.__version__ (use
  importlib.metadata); pickles written by 0.23.1 and earlier can no
  longer be read.
- Fix values() order mismatch with keys() on non-ordered bidicts, and
  make bulk update()/putall() fail clean (roll back) on any error.
- Bidict and its inverse now share the same key/value objects; fix
  non-reflexive (nan) key handling and OrderedBidict view set ops.
- Single-item writes are about 6x faster. 0.24.1 fixes the wheel
  RECORD file and a Python 3.15 test failure.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...oml-Relax-the-uv_build-version-bound.patch | 25 +++++++++++++++++++
 .../python/python3-bidict_0.23.1.bb           | 11 --------
 .../python/python3-bidict_0.24.1.bb           | 12 +++++++++
 3 files changed, 37 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-bidict/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-bidict_0.23.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-bidict_0.24.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-bidict/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch b/meta-python/recipes-devtools/python/python3-bidict/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
new file mode 100644
index 0000000000..e5647a4b11
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bidict/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
@@ -0,0 +1,25 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2026 23:07:01 -0800
+Subject: [PATCH] pyproject.toml: Relax the uv_build version bound
+
+uv_build is pinned to a narrow range upstream; build with the uv_build
+version that OE ships.
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -78,7 +78,7 @@
+ # The ceiling is only change control, and is what uv recommends (it warns without one). Keep it
+ # covering the uv in uv.lock, so `uv build` keeps using that uv's built-in uv_build rather than
+ # downloading one; update_dev_dependencies checks this.
+-requires = ["uv_build>=0.8.13,<0.12"]
++requires = ["uv_build>=0.8.13"]
+ build-backend = "uv_build"
+ 
+ [tool.ty.src]
diff --git a/meta-python/recipes-devtools/python/python3-bidict_0.23.1.bb b/meta-python/recipes-devtools/python/python3-bidict_0.23.1.bb
deleted file mode 100644
index cd9e365ff7..0000000000
--- a/meta-python/recipes-devtools/python/python3-bidict_0.23.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "The bidirectional mapping library for Python."
-DESCRIPTION = "The bidirectional mapping library for Python."
-HOMEPAGE = "https://bidict.readthedocs.io/"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e907308cc9356afa99ac0eec6b20211b"
-
-SRC_URI[sha256sum] = "03069d763bc387bbd20e7d49914e75fc4132a41937fa3405417e1a5a2d006d71"
-
-inherit pypi python_setuptools_build_meta
-
-DEPENDS += "python3-setuptools-scm-native"
diff --git a/meta-python/recipes-devtools/python/python3-bidict_0.24.1.bb b/meta-python/recipes-devtools/python/python3-bidict_0.24.1.bb
new file mode 100644
index 0000000000..4fc5ac85b2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bidict_0.24.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "The bidirectional mapping library for Python."
+DESCRIPTION = "The bidirectional mapping library for Python."
+HOMEPAGE = "https://bidict.readthedocs.io/"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=faf006af6b1264b57f6cca7283841ac4"
+
+SRC_URI += "file://0001-pyproject.toml-Relax-the-uv_build-version-bound.patch"
+SRC_URI[sha256sum] = "4dca6c17f0b01700e9f24359daa5ebabf7be022d99f4cb2a257b6af2a5076c88"
+
+inherit pypi python_uv_build
+
+DEPENDS += "python3-setuptools-scm-native"
