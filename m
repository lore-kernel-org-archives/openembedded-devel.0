Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 199277F96B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:35:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g24so7545816wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8jEPjIKwRl01Ucqrbe8KFgst0/QHYf1tNLDZyXL38Og=;
	b=QfPjDFj573L5d4Detkc7msbeq8kUIUvHkli496d/OmDuQvtUdsKr0RuciHUJssmBm+
	wbM1uo4iK33O2hqZrUJTsvGzNhFHu7OHv+isPcyCjgFVjosfcEoWMlX3qTXbO/JLeLy1
	RSX2DwP6m4stszsH+92UuY8xY6cCrmZ5igltgnVoFvGhSyVH02519I5lxeJySk61PgTp
	6En0f3bERVlwJUnbho1pIVDEUcR03ZnRmuj1rJpBBW/D55R3ukMP2os9F5gPyBJ1Ykv3
	8iJNLfWfbl1QOxAnDIBzhnw2RqYrxYaq24Pqxkx1Ka91fpmQkXpDRpaBF5izZkBD+Qpz
	DFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8jEPjIKwRl01Ucqrbe8KFgst0/QHYf1tNLDZyXL38Og=;
	b=Jpr0K6ysCYj+dHOS9fwuVxBhWRKKOmqNFBTBSydCg+FWQOnE5fANtBz2RWd8EQXscV
	wMifqexIuWCyjHU5Y3CLh9zCchPJf+A39tuRG7jejrsO5c2BjLm2K/1d2jVxRRM2JL41
	MVFah4qv3QMx+4hQ9RiVPx0zG0JD3rk84orxW5QxdJ1zEHX1lEnzFr0mgS+njq6vaYB2
	sA5K3GIIS4qKftmrxZCrdckixvr2YGq8l8en6EU8SWoTdPbYQmV4WQaUpTZuqeltELx1
	8GhCpiNnVauUIi02Lf2l6cnFkrdzGC8ELaikyqdOTu4PpGpi3GUcl4taRGyf30aAqURx
	dIJw==
X-Gm-Message-State: APjAAAVDIv7m/RvfWtj9aqgC9/bdmfdlZSSV1dHZP+CTbDTcOs4loZ+8
	HWk+/6g5v0mQ8H3kwAhG/FyI9BrH
X-Google-Smtp-Source: APXvYqzTa07bc2xamF5zle5ftFrE5m5X/UVMzI2ICuVkjUt6yOJDE8kXlivlkBLCu/ORmxkKTvmzyw==
X-Received: by 2002:a1c:6702:: with SMTP id b2mr12512924wmc.107.1572219358380; 
	Sun, 27 Oct 2019 16:35:58 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.35.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:35:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:27 +0100
Message-Id: <20191027233545.4146-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/19] itstool: rework native shebang and add class to make native itstool work
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
X-List-Received-Date: Sun, 27 Oct 2019 23:35:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

itstool was reworked in [1] to not use host's python. This patch introduced the
'-S' option for coreutils's env [2]. Unfortunately that option is relatively
young [3] and elder build-host don't support it [4].

The only way to get around this is:
* remove '-S' and -s' from native shebang
* add a class itstool.bbclass. This class depends itstool-native and creates a
  valid python3 runtime environment. Most notable in the environment is
  export PYTHONNOUSERSITE = "1"
  which does same as '-s' option: force python to avoid adding (host) user sites.

[1] http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/itstool/itstool/0001-Don-t-use-build-time-hardcoded-python-binary-path.patch?id=e5ac325b7974a346b218d1f43b92d06f5b0dd078
[2] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/itstool/itstool/0001-Don-t-use-build-time-hardcoded-python-binary-path.patch
[3] https://github.com/coreutils/coreutils/commit/668306ed86c8c79b0af0db8b9c882654ebb66db2#diff-83d9d52b1f12ac589739ab1334ae4f30
[4] https://errors.yoctoproject.org/Errors/Details/274743/

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/classes/itstool.bbclass               |  5 +++
 ...-build-time-hardcoded-python-binary-.patch | 35 +++++++++++++++++++
 ...d-time-hardcoded-python-binary-path.patch} |  0
 .../recipes-support/itstool/itstool_2.0.6.bb  |  6 ++--
 4 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/classes/itstool.bbclass
 create mode 100644 meta-oe/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
 rename meta-oe/recipes-support/itstool/itstool/{0001-Don-t-use-build-time-hardcoded-python-binary-path.patch => 0002-Don-t-use-build-time-hardcoded-python-binary-path.patch} (100%)

diff --git a/meta-oe/classes/itstool.bbclass b/meta-oe/classes/itstool.bbclass
new file mode 100644
index 000000000..45e3fb839
--- /dev/null
+++ b/meta-oe/classes/itstool.bbclass
@@ -0,0 +1,5 @@
+# helper class to prepare correct environment for native itstool
+
+inherit python3native
+
+DEPENDS_append = " itstool-native"
diff --git a/meta-oe/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch b/meta-oe/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
new file mode 100644
index 000000000..19a858bd7
--- /dev/null
+++ b/meta-oe/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
@@ -0,0 +1,35 @@
+From 335ef14fc801c9dfbe7e5692dc71cfbe72049d2b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 27 Oct 2019 16:38:52 +0100
+Subject: [PATCH] Native: Don't use build time hardcoded python binary path.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This is same patch as used for target build except that we do not use the
+'-S' and '-s' option because '-S' is relatively young [1] and elder build-host
+don't support it [2]
+
+[1] https://github.com/coreutils/coreutils/commit/668306ed86c8c79b0af0db8b9c882654ebb66db2#diff-83d9d52b1f12ac589739ab1334ae4f30
+[2] https://errors.yoctoproject.org/Errors/Details/274743/
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ itstool.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/itstool.in b/itstool.in
+index e64cd34..05d264f 100755
+--- a/itstool.in
++++ b/itstool.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON@ -s
++#!/usr/bin/env python3
+ #
+ # Copyright (c) 2010-2018 Shaun McCance <shaunm@gnome.org>
+ #
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-support/itstool/itstool/0001-Don-t-use-build-time-hardcoded-python-binary-path.patch b/meta-oe/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
similarity index 100%
rename from meta-oe/recipes-support/itstool/itstool/0001-Don-t-use-build-time-hardcoded-python-binary-path.patch
rename to meta-oe/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.6.bb b/meta-oe/recipes-support/itstool/itstool_2.0.6.bb
index b4b37aa01..8290c5e58 100644
--- a/meta-oe/recipes-support/itstool/itstool_2.0.6.bb
+++ b/meta-oe/recipes-support/itstool/itstool_2.0.6.bb
@@ -7,8 +7,10 @@ inherit autotools python3native
 
 DEPENDS = "libxml2-native"
 
-SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-Don-t-use-build-time-hardcoded-python-binary-path.patch"
+SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI_append_class-native = " file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
+SRC_URI_append_class-target = " file://0002-Don-t-use-build-time-hardcoded-python-binary-path.patch"
+
 SRC_URI[md5sum] = "4306eeba4f4aee6b393d14f9c3c57ca1"
 SRC_URI[sha256sum] = "6233cc22726a9a5a83664bf67d1af79549a298c23185d926c3677afa917b92a9"
 
-- 
2.21.0


