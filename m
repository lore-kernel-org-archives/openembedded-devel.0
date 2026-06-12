Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6206DCD98CF
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73412.1781278461236541490
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2026 08:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FmngXJ//;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b9318997so8596305e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781278459; x=1781883259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhINQoE7pnFD2FSw4eROeDJrs2Kllrn4t93Axt/3UA4=;
        b=FmngXJ//+8+jyZo5yxzd6G0LF7WtAVu8l/1PRpyiow5NVG7ZxFdV5ZB73+uEizEqi6
         z4GH/qIjoYdhLYGk/YVnrBQ/mYJYqFrhDUyq2MqFXxnN5J7GUouAAUUHSNk0JfsiU1UC
         9VzAqHuphciwEZFzdX+xeC9lD2/5+hjyZMX+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278459; x=1781883259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IhINQoE7pnFD2FSw4eROeDJrs2Kllrn4t93Axt/3UA4=;
        b=Tuaoi1tk4cbQsWw2cUwRvaB4mTnjQ4j8vdGIYUCGqq5ARGZYw9gC+AXFtgRkvNqf1e
         md6it3YxV+YjLuhktSqtyJ6TfR5b+pzT+dAnzAqymyxI6WZotq3/4QIMmsONFU0MyFTt
         Me3eajE5OORyspZhQI+FeRalpEbpxImL7wbVhE6KCrsrO4Nw5tPo9amud5AR7T2W0sqP
         HD00amqnpFg3dGJmlBuX/k80syWvl2ylcw9OucM37HVV1HjcoB8hLtKoOWjqXVgOLzHh
         XR7WxYwBU2cfax9C8cO7/9tcuw9g/fA2UhD6VaCk3gs2az8gJjjFMYmzCkboU4b/Npar
         Y4Ww==
X-Gm-Message-State: AOJu0YyIF3H2P5/Kxx1aVFOZedSb0TQ4NG16c3HDRB9NZ6Ha1PPzzS9k
	+i0j5g/LUmoW4dApuv+tDtqUAcVii1K4W6Ml4b5cGlKOR/wa5LtBbPAn1T7fofD7LMSclTxNynV
	g+9Ca
X-Gm-Gg: Acq92OEjoAkOS/6JBp7mzwabpvxD7J2HTogP9uQaez9zotZ/dLzJ2QvB4nHgmx2hSIW
	cfHy9wnZAQlzswdJjco3Dc06N+14dkuJXtG25JcUjJN8iafp2gwJNNYDHxEDv8iQkC4kxnob0Wd
	/WHz3Waa/mlNRTJ6KiZxS/Eni4e4ZzievuBN2CLnylmp0Kq84g1iWPG8tVmAQ1Nin0GfjwNGrMm
	Y+jXGBfGrQ+MJuPTYvKcX8rcc5zjq2eSOIXmZuuzWg9xF2MlFVKZQ5TO4xBuRsXQzJRjQ0d1HmC
	EL6z31bK3rdmRqIGK6Ihf9i7Ql5jM9WfK/qi+8kEiyQceZ9w7wS0hcTfnKhROLFe/dhhIcJeYkd
	9KKn22LcLAYv7CtNhGbEb3ieoCCTvZ0Wi9DfmhtQwip2eCi+T74SYwOKD+66rr0qPBj2HQTyDzI
	XtOoAq6LodhzYtG6Udh01ywAEPDV52ITg2KjjW
X-Received: by 2002:a05:600c:4e88:b0:490:b645:3213 with SMTP id 5b1f17b1804b1-490ec4deff2mr42434825e9.19.1781278459364;
        Fri, 12 Jun 2026 08:34:19 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm61187095e9.2.2026.06.12.08.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:18 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/8] python3-geojson: Upgrade 3.2.0 -> 3.3.0
Date: Fri, 12 Jun 2026 18:33:58 +0300
Message-ID: <20260612153404.3213552-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612153404.3213552-1-leon.anavi@konsulko.com>
References: <20260612153404.3213552-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 15:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127544

Upgrade to release 3.3.0:

- __all__ must be a sequence of strings: fix __init__.py and factory.py
- remove simplejson
- Add support for Python 3.14
- Remove EOL Python version support
- Update GH action versions for Node 24
- fix: convert dict features to Feature objects in FeatureCollection

Drop 0001-Allow-install-over-python-3.14-329.patch because it
has been applied in the upstream of the project.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...1-Allow-install-over-python-3.14-329.patch | 56 -------------------
 ...json_3.2.0.bb => python3-geojson_3.3.0.bb} |  8 +--
 2 files changed, 2 insertions(+), 62 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-geojson/0001-Allow-install-over-python-3.14-329.patch
 rename meta-python/recipes-devtools/python/{python3-geojson_3.2.0.bb => python3-geojson_3.3.0.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-geojson/0001-Allow-install-over-python-3.14-329.patch b/meta-python/recipes-devtools/python/python3-geojson/0001-Allow-install-over-python-3.14-329.patch
deleted file mode 100644
index c0022bcad7..0000000000
--- a/meta-python/recipes-devtools/python/python3-geojson/0001-Allow-install-over-python-3.14-329.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2584c0de5651bd694499449f9da5321b15597270 Mon Sep 17 00:00:00 2001
-From: adelplanque <alaindelplanque@mailoo.org>
-Date: Wed, 17 Dec 2025 22:22:28 +0100
-Subject: [PATCH] Allow install over python 3.14 (#329)
-
-All tests pass over python 3.14.2
-
-Upstream-Status: Submitted [https://github.com/jazzband/geojson/pull/240]
-
-Backport the relevant parts of an upstream PR to allow build with Python 3.14.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- README.rst                 | 2 +-
- setup.py                   | 5 +++--
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/README.rst b/README.rst
-index 26dc790..e3ac38a 100644
---- a/README.rst
-+++ b/README.rst
-@@ -29,7 +29,7 @@ This Python library contains:
- Installation
- ------------
- 
--geojson is compatible with Python 3.7 - 3.13. The recommended way to install is via pip_:
-+geojson is compatible with Python 3.7 - 3.14. The recommended way to install is via pip_:
- 
- .. code::
- 
-diff --git a/setup.py b/setup.py
-index 004d3eb..db277f1 100644
---- a/setup.py
-+++ b/setup.py
-@@ -17,8 +17,8 @@ else:
- 
- 
- major_version, minor_version = sys.version_info[:2]
--if not (major_version == 3 and 7 <= minor_version <= 13):
--    sys.stderr.write("Sorry, only Python 3.7 - 3.13 are "
-+if not (major_version == 3 and 7 <= minor_version <= 14):
-+    sys.stderr.write("Sorry, only Python 3.7 - 3.14 are "
-                      "supported at this time.\n")
-     exit(1)
- 
-@@ -54,6 +54,7 @@ setup(
-         "Programming Language :: Python :: 3.11",
-         "Programming Language :: Python :: 3.12",
-         "Programming Language :: Python :: 3.13",
-+        "Programming Language :: Python :: 3.14",
-         "Topic :: Scientific/Engineering :: GIS",
-     ]
- )
--- 
-2.52.0
-
diff --git a/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb b/meta-python/recipes-devtools/python/python3-geojson_3.3.0.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-geojson_3.3.0.bb
index cdb019ebd5..8b3d5cfd81 100644
--- a/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geojson_3.3.0.bb
@@ -1,13 +1,9 @@
 SUMMARY = "Python bindings and utilities for GeoJSON"
 HOMEPAGE = "https://pypi.org/project/geojson/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=f77f2ed49768c8d4c79ba874c0f94d8a"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=127b4a863485faf7c57d12dc2c1f60b3"
 
-SRC_URI[sha256sum] = "b860baba1e8c6f71f8f5f6e3949a694daccf40820fa8f138b3f712bd85804903"
-
-SRC_URI += " \
-    file://0001-Allow-install-over-python-3.14-329.patch \
-"
+SRC_URI[sha256sum] = "92e83b9cb378a450b42f1207bb9b2a031f9fc89185f335153c44369b8b8b71fd"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.47.3


