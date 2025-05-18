Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63A6C54756
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 17:33:16 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.34328.1747589595371464029
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 10:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5hgdGZh;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742b614581dso2018524b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 10:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747589594; x=1748194394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AsrgDPcGt4n/bAJBeLU5/5Js/U3+d39On1CFBLCvV8=;
        b=S5hgdGZhZJyZ5cZ+16Agq89aVa3SLA/JNDq+EKLVxY3SChqJkTP4GuJycc7nvoL+9A
         LEo8pO/uJWAapEct9SqWHCJrx1CVrSyQFT9q738GEPqpXbPIc+/024ZVJovCp6yFLG1H
         cE9o9ubpwfZdD/S3y4vg28W0U7P5XvvvSJjcypnEqKDpama0jusiLtAe6HmvasU9Yx50
         OupF840CYp5p63PTvy0Zk7Qc7pK2oDc6kxvfvi7wqWHDqSHB2CMtQoUGkRPeLjUDR3oZ
         cRCaOvm8VJoenjJ5jinQQDivQZtDdvutz/TFMkdSFvOIW/NhwmnMKO1+UGjo6RTwJkcJ
         Q04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747589594; x=1748194394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AsrgDPcGt4n/bAJBeLU5/5Js/U3+d39On1CFBLCvV8=;
        b=P8+nXbQifcAlqmb3jgnkdW07eJFGXEh8oxhPfreAgYRXqHpcbejizMOqK3EIYxCV9g
         UmC741GxFUvTODYe2XhJXbchimDp01UfIhTHsc3tMQ2JO0W8MaRAzEHqGRprZCftdd5V
         qG4AgQ1HVaOjFyFWbsME8p0cc7By5BmRCzYikasPqfQWaQPbMZ2KKfcfg6FNhb5NMFET
         qG1AWPpjM3XtggBBSaXJclPKxy5sK38FIqGOJWkTECHzwqFtZC0rOKpTSaeB+iQdrH0m
         A7daLtl9nixEGISVZ9pdXTvH073VusgHAYJpA051JvXGTTrQh9mC1rDI6bYZ4T9uD6hO
         iuvA==
X-Gm-Message-State: AOJu0YxJUdA5ralSyb5idIFfmmkNAVL+pOI5P4Xky2kEQrMeQCFCzWCp
	bUPF3Y/I5Kx0Z/9by6EpDrclMbhzSl1yNmOvvtQpWAp3XxQhttjihBFLzfHbGGDR
X-Gm-Gg: ASbGnct4/Zc9YWaFGAmkNWSSSZ0aVjcbGNMlRBvja3reVG9pz2hC6EzBZTG78oEKteW
	1b/Jsc9qo6eWR0+FCLRp9ENWVIViIt46E0Jgg/NUdpHO6TiZnnWyUD9HjD1yWCwPe4mXj03BBvY
	+47ywYNMWWO8csIZCSzdheuqaxH3YZoEND468ErfiHntfYByOIYmUhGukHr4f19VuBzyzoLPtNN
	ceZdS//HlsPHcfZ7uX9f7XxtXchehVQg7kojfsJMD1R60P8NFD0CDUgqX/a15CMM70gLMy0Ev4o
	yFgpjNP8tur42+45J/boL6WpkDryPNWzf+LQ1SjzZ6E=
X-Google-Smtp-Source: AGHT+IGHo+XQ85uanOd2QGEOn6U5Ml0PQp3IuraTOAM7pla5oQpAy9IdsN1xhazxhXEJFbHauKo9Lg==
X-Received: by 2002:a05:6a00:94a7:b0:740:91eb:c66 with SMTP id d2e1a72fcca58-742acc906b0mr13754011b3a.3.1747589594476;
        Sun, 18 May 2025 10:33:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970bb2fsm4890177b3a.53.2025.05.18.10.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 10:33:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-propcache: Fix build with cython 3.1
Date: Sun, 18 May 2025 10:33:09 -0700
Message-ID: <20250518173309.3600728-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518173309.3600728-1-raj.khem@gmail.com>
References: <20250518173309.3600728-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 17:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117459

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-with-cython-3.1.x.patch    | 34 +++++++++++++++++++
 .../python/python3-propcache_0.3.1.bb         |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-propcache/0001-Fix-build-with-cython-3.1.x.patch

diff --git a/meta-python/recipes-devtools/python/python3-propcache/0001-Fix-build-with-cython-3.1.x.patch b/meta-python/recipes-devtools/python/python3-propcache/0001-Fix-build-with-cython-3.1.x.patch
new file mode 100644
index 0000000000..3b86b23c00
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-propcache/0001-Fix-build-with-cython-3.1.x.patch
@@ -0,0 +1,34 @@
+From 8d44d867f7cd86da4edf328e06b13778577ea4b7 Mon Sep 17 00:00:00 2001
+From: WXbet <57314510+WXbet@users.noreply.github.com>
+Date: Thu, 15 May 2025 21:54:48 +0200
+Subject: [PATCH] Fix build with cython 3.1.x
+
+closes #113
+
+Upstream-Status: Submitted [https://github.com/aio-libs/propcache/pull/114]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ packaging/pep517_backend/_backend.py | 2 +-
+ requirements/cython.txt              | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_backend/_backend.py
+index 7588db3..f75b83a 100644
+--- a/packaging/pep517_backend/_backend.py
++++ b/packaging/pep517_backend/_backend.py
+@@ -379,7 +379,7 @@ def get_requires_for_build_wheel(
+     elif sysconfig.get_config_var('Py_GIL_DISABLED'):
+         c_ext_build_deps = ['Cython ~= 3.1.0a1']
+     else:
+-        c_ext_build_deps = ['Cython ~= 3.0.12']
++        c_ext_build_deps = ['Cython ~= 3.1']
+ 
+     return _setuptools_get_requires_for_build_wheel(
+         config_settings=config_settings,
+diff --git a/requirements/cython.txt b/requirements/cython.txt
+index 69a1d6f..5b356ed 100644
+--- a/requirements/cython.txt
++++ b/requirements/cython.txt
+@@ -1 +1 @@
+-cython==3.0.12
++cython~=3.1
diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.3.1.bb b/meta-python/recipes-devtools/python/python3-propcache_0.3.1.bb
index 24b72f09c3..afa6822563 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.3.1.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/propcache"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
+SRC_URI += "file://0001-Fix-build-with-cython-3.1.x.patch"
 SRC_URI[sha256sum] = "40d980c33765359098837527e18eddefc9a24cea5b45e078a7f3bb5b032c6ecf"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest cython

