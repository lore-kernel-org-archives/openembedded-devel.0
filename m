Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4A7D2A549
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.32576.1729107316328281300
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RBvRPugo;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4305413aec9so1938835e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107315; x=1729712115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k49IBJR8bXc/o80VRXI/rMWRmzApE+0YvQr456EUjlE=;
        b=RBvRPugo8EYm9aTtHc8vYzY/rLM8zXOzcRkXNvtItrbXtSvQqdVR/Leq7VhbD33blZ
         r8eq8eJI+cmnAp+W/Vhb6MQVJd93cxGJNlUwmp6qNrxF6g8IqovjbgaiBDaHFzLnQWul
         50o8KHb+HhD6lOns6ZLH6wKEC6wjKz+cStTHGUgJV4o/5I2rSTaks6GjMj5Iv2duS9Ro
         mCDDLYBqjUsT38H/TEUKMVbQEcMWpEUXXFBUH4838RUVdOOsEEJ4yml7wUJnGXlx2XyU
         SHd4+xnAyJOSDzau0xUHDEiptAjy6DdLhYvP6iqfCxuSa8lglVpvAAoPMTTC0mlzKZ9i
         ETlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107315; x=1729712115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k49IBJR8bXc/o80VRXI/rMWRmzApE+0YvQr456EUjlE=;
        b=xGLcbM+wVnSlnZbbj0my3e8IsKQ7stYw5TKanxqTb93Ftyd5m8EeucHtooDlnkiTMP
         ow3iFwTEFZN0fQc3Gotbc0yZvoSxRiEgSh19VN6wCb3LMP5r1GRppoL5Ub0h+TUE/CDF
         n0ZRJEs+PuhBgQxwBlyTro14+ePI4NouCMf3lOJJBoRTDoPASuH6XsJ/TqMd9SbHuTRi
         iA2mFau/1pWPL2usYLFnQ1qy+y1xlm+K+HBjqbgl10vu0QTPg5AyUKHNVLvQOISvVneH
         ah1wry9VDPuTnkVGP6W/bgPPrNzZdQv8j2D3quE8Kzvd2ZQkTY7Z8izap24tM3QHxO0I
         Ix+A==
X-Gm-Message-State: AOJu0YxpZ3rEpJVrjjeIVTOH35qk9P70xrpMbB/rNXxKb8pgxDTKRCBu
	llyyTGA6+gMwi3880cXUQ98lpmwpXAWjojSbz+nAXiXtCnqjaB1pHO4fOQ==
X-Google-Smtp-Source: AGHT+IHD9O04lS6YtufJVGSc+sIc14OSAZcYulwjCHKuoPK+nvAtXOM+286TT0QHqFElYX6BEBaAgQ==
X-Received: by 2002:a05:600c:510d:b0:42c:ba1f:5482 with SMTP id 5b1f17b1804b1-4314a3cdde9mr36347835e9.35.1729107314463;
        Wed, 16 Oct 2024 12:35:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/13] python3-geojson: backport python 3.13 patch
Date: Wed, 16 Oct 2024 21:34:56 +0200
Message-Id: <20241016193505.3459828-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112945

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-geojson/py3.13.patch       | 38 +++++++++++++++++++
 .../python/python3-geojson_3.1.0.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-geojson/py3.13.patch

diff --git a/meta-python/recipes-devtools/python/python3-geojson/py3.13.patch b/meta-python/recipes-devtools/python/python3-geojson/py3.13.patch
new file mode 100644
index 000000000..45618fa6d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-geojson/py3.13.patch
@@ -0,0 +1,38 @@
+From c13afff339e6b78f442785cc95f0eb66ddab3e7b Mon Sep 17 00:00:00 2001
+From: Bas Couwenberg <sebastic@xs4all.nl>
+Date: Fri, 4 Oct 2024 16:18:34 +0200
+Subject: [PATCH] Don't fail with Python 3.13. (#228)
+
+Upstream-Status: Backport [https://github.com/jazzband/geojson/commit/c13afff339e6b78f442785cc95f0eb66ddab3e7b]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ .github/workflows/test.yml | 2 +-
+ README.rst                 | 2 +-
+ setup.py                   | 5 +++--
+ tox.ini                    | 2 +-
+ 4 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 95b2823..004d3eb 100644
+--- a/setup.py
++++ b/setup.py
+@@ -17,8 +17,8 @@
+ 
+ 
+ major_version, minor_version = sys.version_info[:2]
+-if not (major_version == 3 and 7 <= minor_version <= 12):
+-    sys.stderr.write("Sorry, only Python 3.7 - 3.12 are "
++if not (major_version == 3 and 7 <= minor_version <= 13):
++    sys.stderr.write("Sorry, only Python 3.7 - 3.13 are "
+                      "supported at this time.\n")
+     exit(1)
+ 
+@@ -53,6 +53,7 @@
+         "Programming Language :: Python :: 3.10",
+         "Programming Language :: Python :: 3.11",
+         "Programming Language :: Python :: 3.12",
++        "Programming Language :: Python :: 3.13",
+         "Topic :: Scientific/Engineering :: GIS",
+     ]
+ )
+
diff --git a/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb b/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb
index 742f921e5..36f5fa09e 100644
--- a/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb
@@ -9,6 +9,7 @@ inherit pypi setuptools3 ptest
 
 SRC_URI += " \
 	file://run-ptest \
+        file://py3.13.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.39.5


