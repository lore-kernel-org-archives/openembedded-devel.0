Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
	[209.85.210.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7E813605EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 02:12:50 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id z9so4846604oth.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 18:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EMrmppHJU0yWX/cEoxbdsibdLYPOxzj6h/scr1QvDoQ=;
	b=gXlc9JaS9Ock4hWxHn0ZKLC83MbbVE1jNAEKDrdVfebzsqJcqnenc0qoivDDQv2Sfx
	8FOMInJjUcCUm346zjBLCKXTKDIbJ1RPyCQrZh/suQWqlZ7m6IHfM0pdPQ5QmvMSHf+Q
	vdq7kRqRnxdC5zA9wiEz3zrtKDbLBfEUDJWnAp9s1LThwB/1FW51yQjkoa2TgKiuYn2o
	PQ6V2oaQTn9P7U4wsTspt4JLb/cJsJT/1Xm/7TaDMH5s/Ay5wpXUhpcGyNSmzhxemYSl
	0WezFrEq5rkBgVUPP1ST33G9+8hxXe/NrCFbjhQh3fBeJiEMGZ/m5Yv5gfNW6HfYB+a4
	44kg==
X-Gm-Message-State: APjAAAWi3x/bQScewpiiZRiBzPYkr/d9AmbAcJTHCrO79163fArVG6R2
	mNtI0Gts4xQvydC4y/DfJ+s42yTI2c4=
X-Google-Smtp-Source: APXvYqzE5oILi1ibGxASBKvoGnTYZOemNzgw0ffB59BCD5U1bjx1xCvOtKtFkW3SqAuJRwbbdV5xtA==
X-Received: by 2002:a9d:6386:: with SMTP id w6mr8224828otk.115.1581300770937; 
	Sun, 09 Feb 2020 18:12:50 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id 5sm4032339otr.13.2020.02.09.18.12.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 18:12:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 21:12:34 -0500
Message-Id: <20200210021235.20614-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH 1/2] python3-backports-functools-lru-cache: consolidate inc and bb files into a single bb file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Feb 2020 02:12:50 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-backports-functools-lru-cache.inc  | 19 -----------------
 ...thon3-backports-functools-lru-cache_1.5.bb | 21 +++++++++++++++++--
 2 files changed, 19 insertions(+), 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-backports-functools-lru-cache.inc

diff --git a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache.inc b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache.inc
deleted file mode 100644
index bce44a28b4..0000000000
--- a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Backport of functools.lru_cache from Python 3.3"
-HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=57;endline=57;md5=98fc3658e5970d26f6b2109808c766be"
-
-PYPI_PACKAGE = "backports.functools_lru_cache"
-
-SRC_URI[md5sum] = "20f53f54cd3f04b3346ce75a54959754"
-SRC_URI[sha256sum] = "9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151fda4f1a"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-
-inherit pypi
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-threading \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.5.bb b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.5.bb
index 91fcc41fc7..9182792baf 100644
--- a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.5.bb
@@ -1,2 +1,19 @@
-require python-backports-functools-lru-cache.inc
-inherit setuptools3
+SUMMARY = "Backport of functools.lru_cache from Python 3.3"
+HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=57;endline=57;md5=98fc3658e5970d26f6b2109808c766be"
+
+PYPI_PACKAGE = "backports.functools_lru_cache"
+
+SRC_URI[md5sum] = "20f53f54cd3f04b3346ce75a54959754"
+SRC_URI[sha256sum] = "9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151fda4f1a"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-threading \
+    "
-- 
2.17.1


