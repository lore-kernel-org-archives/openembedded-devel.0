Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2958.1794165991941351371
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so165512f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165990; x=1794770790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJ3Vg80O9e9uNOLSoMlkjpA+499jQb4E0E6XhAilXyQ=;
        b=uSbDdvJjFtPK8McTupffHO9BfrRzwuG9/7XgRsNZCJvDcbJaSMJwyMu79MYF1vnt7h
         yMEmEj5uGXf9rKXKyRBDRSciCW1mcckeXCO+QoMYLPGu6hBPLpWVvxwiZxmqFilo7znh
         yqxejeb8BPC5Cu92sjP564nHG7garofusWoyPk2iEmiGGNfYODHUSkHQlsahLM17pJi4
         wMPDUjNQ3ro/0zgn9TQFk2McEi0GNdDml83+c+P40SzhWoHlGxU2DqaVnIRc8DaLLGDq
         1adbMObjqxevPD5NYDAohxQO36qt/JFbK9WJ+FMUovYIwM6dYKakKaxrGdffqhhVgQN7
         fV2w==
X-Gm-Message-State: APuU4Z8SvT9Lc2O2jvtsQDghmpK65gaqtfv+NyRpocjhC+RZOq8sJwb8
	AO9m4r1B0+/jd5HmOdWILcLnf+nyyrls4jkHdYhZ3gPdrw5NSdL5AWiGZJVvVA==
X-Gm-Gg: AYBFou01OaZy77VCvj0427/0AR9ajFo8Zo+VX2goYAdYoMqYakFnDMiH28e7CHXZ6A/
	5svdSbzGdIjHwq+vFW5ThgZVaEG4UJ0SjKj4cO1NDOVL5HxAoIsArXMDW/gXwFrIzhSeJZ+2D1L
	idwFGVW/8bVR+PWUs277VlWqve+zKnWuGotW1MDKR6bV1XRN1s1Zi+MyAzyBxccsukr6eKP66re
	Z1MLlqZA9Iz6CtM5N5hg8GVFtKxtRPJ+wot7JknAqz6GyDb4qBocN/NZuQdB7UCQwcRw0JdhLR0
	/hDAkllMKhwe0DbV3CIX2yI+72PLI3xv+2+h0dt+H/ag573ZSaU7VRgglcpk7M3g/z+NuoINLxN
	jTkVXRBMdkztoPhZnDGCbLJa9JEV43N3uppX+X4XNSR67pIdiAUNnqKxOICviwkMFfgr/Cnumw0
	/OszBXRAWEQZgFtPR5pichM1CErygRe5dQ4dH9BA0uqb1/aECwxc8nIYhp2sztP8BlMBxWaPfVe
	zPQQJ8BdpOPW1ehRhML+jM2HyKrRRcRok9FzxfwsiIv6a9uFJ4+mFr7N6JDbxbVE+oqdcfum+lX
	KtLZoC7JQo+yx9/WElY20/T3V1I8RiTM1zaVFcdYv6WqPj/F1jW4ulwzSJbd4BbIkcpPrCDwpEY
	qn2p2oiaamFHyFuxJpUu0qkpddjElAmQJLk6MdJ5W2+akuobk4uO5eONrCQ==
X-Received: by 2002:a5d:5e03:0:b0:486:f907:ebec with SMTP id ffacd0b85a97d-4958363c8b4mr4280981f8f.31.1794165989989;
        Sun, 08 Nov 2026 11:26:29 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:29 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 06/13] python3-pytest-socket: upgrade 0.7.0 -> 0.8.1
Date: Sun,  8 Nov 2026 20:26:11 +0100
Message-ID: <20261108192623.1082770-7-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132028
Content-Type: text/plain; charset="utf-8"

Home Assistant 2026.11 pins pytest-socket 0.8.1 in its test
requirements.

0.8.x builds with uv_build instead of poetry-core. Backport the upstream
change that allows uv_build < 0.14, since OE-Core provides 0.13.7.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 ...1-pyproject.toml-allow-uv_build-0.13.patch | 25 +++++++++++++++++++
 ....7.0.bb => python3-pytest-socket_0.8.1.bb} |  5 ++--
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-socket/0001-pyproject.toml-allow-uv_build-0.13.patch
 rename meta-python/recipes-devtools/python/{python3-pytest-socket_0.7.0.bb => python3-pytest-socket_0.8.1.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-socket/0001-pyproject.toml-allow-uv_build-0.13.patch b/meta-python/recipes-devtools/python/python3-pytest-socket/0001-pyproject.toml-allow-uv_build-0.13.patch
new file mode 100644
index 0000000000..6a1c364310
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-socket/0001-pyproject.toml-allow-uv_build-0.13.patch
@@ -0,0 +1,25 @@
+From e3ed717f36fe4794adc50712873e7c33fd43a581 Mon Sep 17 00:00:00 2001
+From: Mike Fiedler <miketheman@gmail.com>
+Date: Mon, 12 Oct 2026 13:05:41 -0400
+Subject: [PATCH] pyproject.toml: allow uv_build 0.13
+
+Only the build-system part of the upstream commit "chore: add Python
+3.15 support", which raised the uv_build bound to < 0.14.0.
+
+Upstream-Status: Backport [https://github.com/miketheman/pytest-socket/commit/e3ed717f36fe4794adc50712873e7c33fd43a581]
+AI-Generated: Claude Code, Claude Opus 5.5
+Signed-off-by: Thomas Roos <thomas@roosesweb.de>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -92,5 +92,5 @@
+ ]
+ 
+ [build-system]
+-requires = ["uv_build>=0.7.20,<0.13.0"]
++requires = ["uv_build>=0.7.20,<0.14.0"]
+ build-backend = "uv_build"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pytest-socket_0.8.1.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-socket_0.8.1.bb
index 5ae9bdfa5f..b320feebb1 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-socket_0.8.1.bb
@@ -3,9 +3,10 @@ HOMEPAGE = "https://github.com/miketheman/pytest-socket"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1752f63a3a8a02fed42e580e9b94a081"
 
-SRC_URI[sha256sum] = "71ab048cbbcb085c15a4423b73b619a8b35d6a307f46f78ea46be51b1b7e11b3"
+SRC_URI += "file://0001-pyproject.toml-allow-uv_build-0.13.patch"
+SRC_URI[sha256sum] = "2f57787914ad2e1308d09ce141b95c3e55741fbb4fb7b7556593a6b063e0c9c7"
 
-inherit pypi python_poetry_core
+inherit pypi python_uv_build
 
 RDEPENDS:${PN} = "python3-pytest"
 
-- 
2.56.0

