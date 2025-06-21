Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4E5C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:18:04 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.8111.1750515482525876909
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P1dPXIMy;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad8826c05f2so510516966b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 07:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750515480; x=1751120280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VacLqZOQUb4mvfXjmGGn+36SHz/eV5vjOaEZkKibt2Y=;
        b=P1dPXIMy68CJfgQxlVITZp6677TZFD70wsICfv5E03ZnH8ldlIzybdxEtreOxeDgaO
         0o+GbPVD/NotwwnCqSGL2eZnV4WTc7oJH7hyBPhVh/wJ3oWIU96K2lBwGPjKfjq9ErNM
         QONDiiS/mD9tEUjoS8HykMNBMG6TJAGBBppshAeQ0nPoB+LFpzZJ+Z+aaQk2nyg1gUPh
         Db4hYDGkVihCBWKwUwShcSzGgshdOowKfCZdNpouHLQg4jsaQVRnTD3xgFccA053mXzh
         vNT8Mz5K3FOdiJot2XN/TNqNQkF9kS/0M4ym9Y89Hjb2ktFujjjBh92bDKphdFhHJYXo
         Mj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515480; x=1751120280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VacLqZOQUb4mvfXjmGGn+36SHz/eV5vjOaEZkKibt2Y=;
        b=HOms2MnGg8L7Vw3FrOkDc41Uw5JJeIi87iqJSGxlmQ74Rh/nyTK6NLY+gUSLaQoeXu
         UpekLrmrL4/UtbN5fajcBJEgTowFedv0J2MAQMnssqfjjRIY0vL4Xcgtm53FYx2Ey/fZ
         FJsDiPoNtKAZLbaSu7IvZPwuevxjv9Z3sN7zskIFq6hmJYrJWo110caK0DlEVhWPniQN
         5IAfxTclwb6xov2i7z0lpmjXevLJUyo3QB6wzmcSuQ3wX/cJPf79lIAxPMVcZttsCVlA
         38p01P2QH3KjeBW3+htGVCki8tL+3oau5V3ZmdUiVdXu8QOM9gx1ssdi2eyS/rcgG4in
         9VhA==
X-Gm-Message-State: AOJu0Yzt8lH6v3SB9pdtiV72I75W+81YoYfGyulcivIWCNDbZov9lfOy
	vlsQs8pLF+DFvjQ9Ohc5bFLywiqZ+FTWscTwBWhxtDLsMnR13dfVMoA7ifobFdaS
X-Gm-Gg: ASbGncuQI3ah6MZfHFUG3pVFj7E4nMrn+MQDI2z+JmRqfi6UeQsRAyxH5GQvYMVAs7d
	Qzx/hNWTCITtxyEgnFA+2EwcsvY53yAlLLhVxWFT5hpfOsCtYr1natsuGihXOw3rzic3I4fKs2p
	bJiI68+sOI+tkerCau7oyGHjhMN+GbcioEfZS13/R5sDUbO4/Y7lzPbtz34ZsYDJY5+dGrU/hGk
	XMpOeYWqh6LQ97qsYbuxgBrwMBW0jiE2n54mMUSCtpyxn9HqDMCcFYgkEqaMR606YhPWzHZqcqQ
	0LbkZGTOVrfNcK7lonyez+Vi3reC+nUcv8rNbEZ/451ShwB2wPEqPmHzt5peBqyrqyRbrxIm9gI
	+VMOFsPRCDQIjEEfXVBDaPeBc7UgotCywQVYgQoEJ
X-Google-Smtp-Source: AGHT+IHGu14zEK3ez5+eM6dXlpc9JHnmI/KDMHizR2pXb3bWG91Yj3Y4XlHc7hcIjiNmYsJBqP6bRA==
X-Received: by 2002:a17:907:980a:b0:ad8:a4a8:103a with SMTP id a640c23a62f3a-ae0578d81d4mr669445866b.4.1750515480248;
        Sat, 21 Jun 2025 07:18:00 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bbcd9sm381148066b.144.2025.06.21.07.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:17:59 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-propcache: 0.3.1 -> 0.3.2
Date: Sat, 21 Jun 2025 16:17:15 +0200
Message-ID: <20250621141715.3978875-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 14:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118008

Drop patch which allows Cython 3.1.x as source now supports it.
---
 .../0001-Fix-build-with-cython-3.1.x.patch    | 34 -------------------
 ...he_0.3.1.bb => python3-propcache_0.3.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-propcache/0001-Fix-build-with-cython-3.1.x.patch
 rename meta-python/recipes-devtools/python/{python3-propcache_0.3.1.bb => python3-propcache_0.3.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-propcache/0001-Fix-build-with-cython-3.1.x.patch b/meta-python/recipes-devtools/python/python3-propcache/0001-Fix-build-with-cython-3.1.x.patch
deleted file mode 100644
index 3b86b23c00..0000000000
--- a/meta-python/recipes-devtools/python/python3-propcache/0001-Fix-build-with-cython-3.1.x.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 8d44d867f7cd86da4edf328e06b13778577ea4b7 Mon Sep 17 00:00:00 2001
-From: WXbet <57314510+WXbet@users.noreply.github.com>
-Date: Thu, 15 May 2025 21:54:48 +0200
-Subject: [PATCH] Fix build with cython 3.1.x
-
-closes #113
-
-Upstream-Status: Submitted [https://github.com/aio-libs/propcache/pull/114]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- packaging/pep517_backend/_backend.py | 2 +-
- requirements/cython.txt              | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_backend/_backend.py
-index 7588db3..f75b83a 100644
---- a/packaging/pep517_backend/_backend.py
-+++ b/packaging/pep517_backend/_backend.py
-@@ -379,7 +379,7 @@ def get_requires_for_build_wheel(
-     elif sysconfig.get_config_var('Py_GIL_DISABLED'):
-         c_ext_build_deps = ['Cython ~= 3.1.0a1']
-     else:
--        c_ext_build_deps = ['Cython ~= 3.0.12']
-+        c_ext_build_deps = ['Cython ~= 3.1']
- 
-     return _setuptools_get_requires_for_build_wheel(
-         config_settings=config_settings,
-diff --git a/requirements/cython.txt b/requirements/cython.txt
-index 69a1d6f..5b356ed 100644
---- a/requirements/cython.txt
-+++ b/requirements/cython.txt
-@@ -1 +1 @@
--cython==3.0.12
-+cython~=3.1
diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.3.1.bb b/meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-propcache_0.3.1.bb
rename to meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb
index afa6822563..e78d7b3428 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/propcache"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI += "file://0001-Fix-build-with-cython-3.1.x.patch"
-SRC_URI[sha256sum] = "40d980c33765359098837527e18eddefc9a24cea5b45e078a7f3bb5b032c6ecf"
+SRC_URI[sha256sum] = "20d7d62e4e7ef05f221e0db2856b979540686342e7dd9973b815599c7057e168"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest cython
 
-- 
2.43.0


