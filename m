Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB005C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 18:20:46 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.53499.1723486839143795848
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 11:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=DxY6rOVo;
 spf=pass (domain: baylibre.com, ip: 209.85.167.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3db1e4219f8so2612917b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 11:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723486838; x=1724091638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSW4qUrDGs0BByxmY2SmEysxFOw6u1r2y/hbLfHQfiw=;
        b=DxY6rOVos7wJZi9xg9JlIQEIR9wAhQa9ytWejAoWagKurHJ/6WRl5GZ/6TRlXXTlB9
         rXPx4jW2k3sKUgl4EXAG4ZIHWH49CY6yJV7/gGr/41pu5bCEZEIxxRYgQMFPvZ5Si+iW
         7pm2xEtIoCi6Nv43v0w24b6Hc53tT960s4jicV/7JAq4MFMn2En23ND2X+XTvv2NL0Fg
         aPpTPfxXQvs/225T3pC8LeqVjaCLOw2NWinqrt7LyX4rGouCnb8zoAksb8laFpXVepU9
         0A7finF4ZWlZH/+WTiSLMML3HBJvsmexizzmN6429V0EOXd2J1XqVdWE4a3Qvu+xpzuh
         HiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723486838; x=1724091638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSW4qUrDGs0BByxmY2SmEysxFOw6u1r2y/hbLfHQfiw=;
        b=KRLy45BXN3gnHRcDClHJuWWjSoL01twmosDS3VYkb/5Z18lQ64t4g3O/CIWRV3wHmn
         VOSsu/UetuQ6SqGZOQn7YkFmZv4SdJsnHvF5qivO2LaO+enOgagyDAEetH3Oc4BBwoLR
         SIWgniIB5NY5oeoK0l1mJvHF3nU2LQ+pj+q5PrAGOCpFRy4BPBqBq5KGgWvpNNdIXgnR
         Gp1ElSBfCsEgMFPPtJWTy0NasYPBt8gforsR19E8Sw8UEKgRHcibwmiY8EEVoCDy2+fD
         c3208BwP6JNVQ92WlbAuCQoJD0n8h0EPBTRjOoq3PnoeB7nQ6lEg1zZ686937EGva9zM
         B3tA==
X-Gm-Message-State: AOJu0YzO18B4ZmFr2EbdN9mn6LmJE/Yc5aNP4YC0NB3r4SZIHx1t0KYn
	I/FAgtQr96sXqnVHnaZRn6W3MMkYDfWvMz2zbty5y8vxCoMClYKg2YIZJ1OrlDhraUVzNrohaCP
	c
X-Google-Smtp-Source: AGHT+IGZJ5/6nPpQEOlqXztcEpHR+hxuF3oYiLbb/fv5af7J/aGWzgEcQnXXrmJcJjmEwGDQC3KsWQ==
X-Received: by 2002:a05:6808:13d2:b0:3da:ab89:a806 with SMTP id 5614622812f47-3dd1ee6d12emr1370193b6e.25.1723486838105;
        Mon, 12 Aug 2024 11:20:38 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4531c291bc6sm25390991cf.96.2024.08.12.11.20.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 11:20:37 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pandas: upgrade 2.0.3 -> 2.2.2
Date: Mon, 12 Aug 2024 14:20:36 -0400
Message-Id: <20240812182036.1132711-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 18:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111773

pandas 2.2.2 is the first version compatible with numpy 2.0.x.

The package now uses meson as the build backend, so change the recipe to
inherit that.

Its pyproject.toml pins required versions for Cython and meson, but
newer upstream pandas releases are using different versions and
compatibility strings, so just add an OE-specific patch to relax the
requirements a bit for us.

Changelog: https://pandas.pydata.org/pandas-docs/version/2.2.2/whatsnew/v2.2.2.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...t.toml-don-t-pin-dependency-versions.patch | 37 +++++++++++++++++++
 ...andas_2.0.3.bb => python3-pandas_2.2.2.bb} |  8 +++-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
 rename meta-python/recipes-devtools/python/{python3-pandas_2.0.3.bb => python3-pandas_2.2.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
new file mode 100644
index 000000000..f60f43a5b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
@@ -0,0 +1,37 @@
+From d46b8720a6bccb345f6bdd7ee2f5c357e7eb227b Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Mon, 12 Aug 2024 11:27:36 -0400
+Subject: [PATCH] pyproject.toml: don't pin dependency versions
+
+Pandas will fail to build if the exact versions aren't found, but newer
+ones actually work. Since newer versions of pandas are adjusting the
+requires section of pyproject toml further, just patch it for us.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ pyproject.toml | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index db9f055799..5158d60f59 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -2,10 +2,10 @@
+ # Minimum requirements for the build system to execute.
+ # See https://github.com/scipy/scipy/pull/12940 for the AIX issue.
+ requires = [
+-    "meson-python==0.13.1",
+-    "meson==1.2.1",
++    "meson-python>=0.13.1",
++    "meson>=1.2.1",
+     "wheel",
+-    "Cython==3.0.5",  # Note: sync with setup.py, environment.yml and asv.conf.json
++    "Cython>=3.0.5",  # Note: sync with setup.py, environment.yml and asv.conf.json
+     # Force numpy higher than 2.0rc1, so that built wheels are compatible
+     # with both numpy 1 and 2
+     "numpy>=2.0.0rc1",
+-- 
+2.39.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
index 91e76d991..ac8d46984 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
@@ -6,9 +6,13 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cb819092901ddb13a7d0a4f5e05f098a"
 
-SRC_URI[sha256sum] = "c02f372a88e0d17f36d3093a644c73cfc1788e876a7c4bcb4020a77512e2043c"
+SRC_URI += " \
+            file://0001-pyproject.toml-don-t-pin-dependency-versions.patch \
+            "
 
-inherit pypi setuptools3
+SRC_URI[sha256sum] = "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9c6c43093218de28b54"
+
+inherit pypi python_mesonpy
 
 DEPENDS += " \
     python3-cython-native \
-- 
2.39.2


