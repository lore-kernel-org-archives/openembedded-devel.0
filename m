Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2957.1794165991446066364
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49318428d98so103335f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165990; x=1794770790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHDl24NLSpNG75vW22P8UpC7SMGAgkfDHOCapvtBZDQ=;
        b=kAg7xLW7Nsrmsp+B2UaPjK0o3y+Xlq6zf9Ap9b1eMpcS9NSTbUpmXhInbTih8iz6uG
         1aqRRUjWhmCIfAX/beRuZWp6Pq2u/wxkBnKnHL2zV3+DLP9WwA8XLQrSL/nMaO+QvVnr
         V9t+xhOxoltx4abPlYOpbmtvrKx5gInng+k3fStRvzhX3OFHUkkgmA5htwIDt+WFo7Mj
         mLBq2drUFo01UJGtJRW3l/+kgozwxGvqQBGKhOah4/lKvByopyULRN+hJ0cVM+oo/5Gn
         10D8M0FEHetbIr0WDpph1XSp3vQ1pQaX8NBU5gaR3BTENuRnHSoB4pYn/86NRuivUfHd
         aMmQ==
X-Gm-Message-State: APuU4Z+X7R295Akra+Uskp0pQdX1o9cFl6uBqW/xL/pzUkdRjXmI4bjT
	vntQxIDWo33D+vXaZlkeeeUxyvBHCRoa6xcsnrliRIPS+NeIhccUzqNqHyoMCw==
X-Gm-Gg: AYBFou1DKVEkEvPcwEiM7X3lMBOocF77LvTi6kPz9LOYvnucU/YlDguk2Eyrv79+RNG
	NKJT754KB7OgIRKNn+yYWXTZvPRrWsk02VxJKuIdN6ajEi5gBjOHHjaMx9yWf651zSGGDXD4mIo
	czjcB/qnAwRR3DValCD82N9OLMi7HOE1hh5if7cw68X80DSzgFh/jyeKeB8fTK5Qx14ekza6C9P
	Ctceytzt0qnABlo0knEQS8Rh8/N7i2pyimsF6dyWHSvHUL6JfrPt9gIl0nCg61sVdeCKIqznTqd
	xxpleMMr2uvs3ux1hwbMrVi2XsvJ0CWGVdJzQNAcD5gn+Ueqc6ohg6Vfmprl5CF7CLa+Uc322xI
	0kxs7tqqkk9mn/ckBgvVvcbAldhCVVKhpHAKv2tfcuQpt6AxJCcj+RWIdXlRzf8R1H5wPvjFiUa
	xfuQDcq6QJaxEoDZloxpwenlFJCMU/gdtFA/yAwdKZVDFaHByFgipWMklknkflaZGEGxL12Cdp4
	NW1K0gYpOYcOgA20N7qOj3a0/1b1Imy4JKK9d1ooVammHjvTJTCkX4PWKEWf/DPVsUQ9nCNn6Bx
	c9Crcw4cGomDey4zEoLkTZPmPUJkIo5ZIM3X6ST0gtsXeO5onUIYAJXzrJ1EofqXsgJyuieV8dc
	D8JWIur8Nco0dE6JyaWgDvu4V7iPy/Z7WqH5YCNO9oi/YEE7DE302Ul5xBRM=
X-Received: by 2002:a05:6000:1846:b0:494:bf39:21a5 with SMTP id ffacd0b85a97d-4958871d957mr4627411f8f.10.1794165989462;
        Sun, 08 Nov 2026 11:26:29 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:29 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 05/13] python3-lru-dict: upgrade 1.3.0 -> 1.4.1
Date: Sun,  8 Nov 2026 20:26:10 +0100
Message-ID: <20261108192623.1082770-6-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132027
Content-Type: text/plain; charset="utf-8"

Home Assistant 2026.11 pins lru-dict 1.4.1.

The sdist is now published as lru_dict-*.tar.gz, the default name, so
drop PYPI_PACKAGE_SDIST. 1.4.x pins the build to setuptools==80.9.0 and
no longer needs wheel; relax the setuptools pin with a patch and drop
the python3-wheel-native dependency.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 ...pyproject.toml-do-not-pin-setuptools.patch | 25 +++++++++++++++++++
 ...ict_1.3.0.bb => python3-lru-dict_1.4.1.bb} |  7 ++----
 2 files changed, 27 insertions(+), 5 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-lru-dict/0001-pyproject.toml-do-not-pin-setuptools.patch
 rename meta-python/recipes-devtools/python/{python3-lru-dict_1.3.0.bb => python3-lru-dict_1.4.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-lru-dict/0001-pyproject.toml-do-not-pin-setuptools.patch b/meta-python/recipes-devtools/python/python3-lru-dict/0001-pyproject.toml-do-not-pin-setuptools.patch
new file mode 100644
index 0000000000..4a41e98f01
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lru-dict/0001-pyproject.toml-do-not-pin-setuptools.patch
@@ -0,0 +1,25 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Thomas Roos <thomas@roosesweb.de>
+Date: Thu, 5 Nov 2026 22:30:00 +0100
+Subject: [PATCH] pyproject.toml: do not pin setuptools
+
+lru-dict 1.4.x pins the PEP 517 build to setuptools==80.9.0. OE-Core
+provides a newer setuptools, which builds the extension as well.
+
+Upstream-Status: Inappropriate [oe-specific]
+AI-Generated: Claude Code, Claude Opus 5.5
+Signed-off-by: Thomas Roos <thomas@roosesweb.de>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools==80.9.0"]
++requires = ["setuptools>=80.9.0"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb b/meta-python/recipes-devtools/python/python3-lru-dict_1.4.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-lru-dict_1.4.1.bb
index a1b3819d04..9dad9dc777 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.4.1.bb
@@ -4,10 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9d10a486ee04034fdef5162fd791f153"
 
-SRC_URI[sha256sum] = "54fd1966d6bd1fcde781596cb86068214edeebff1db13a2cea11079e3fd07b6b"
+SRC_URI += "file://0001-pyproject.toml-do-not-pin-setuptools.patch"
+SRC_URI[sha256sum] = "cc518ff2d38cc7a8ab56f9a6ae557f91e2e1524b57ed8e598e97f45a2bd708fc"
 
 inherit pypi python_setuptools_build_meta
-
-PYPI_PACKAGE_SDIST = "lru-dict"
-
-DEPENDS += "python3-wheel-native"
-- 
2.56.0

