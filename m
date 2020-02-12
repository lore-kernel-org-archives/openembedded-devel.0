Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id A2AC3606BD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 19:20:19 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id j7so1329952plt.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 11:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=STQx8lmj9p29V5ov7VMg8ESYxwlgiK379+UZ2bAzqj8=;
	b=l/DpnIejTV3W+VLv8Q6lh45sAnJtWm66Dg2oi0cVGCqKRNNp7seTM+WeMD8+ohHYUV
	d05FC9lqlqmkIxPA9Q7f9XmByoBF+OziEIHUXV96Ku14FNmJqS8aw/eqQ3UaklEGdM0f
	/43ywYb6wyRzInGTaPcobjd2R7Bz+H2kNoWR83B4jUSLKtbSbTGsqYzobsphDEszRRS6
	VfmzJ8INHdE/0toS5h8git8NoJRWWcVc8UUlCOIcLYf9ISkXWrnSisYhNJDQwxkOEf2r
	n2WbivLIsiqojRRmt2p7W3f8N8etj50ZZS8hai2xDqfc/eviVf5NO0ZVISVzs/GQXpxE
	qVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=STQx8lmj9p29V5ov7VMg8ESYxwlgiK379+UZ2bAzqj8=;
	b=s4jI/b0zlC037yR4jaTA6PHqg7IRRHoBdPTrAzU5esuJ1v93Pl/Ekw09TzvF3RNtle
	jvJYVbDctdyYEt7QF0oEIRWlNHdOY4yR0N71OCOPX41YPLd4G24z0xCV2r4G/RPYTVvY
	TPs01m1HottIKJW96tkCGp0oVzqgN7wtOBgI5YlWJtqTZ74oZ3HgHbmi1ZRZgdDb2pNA
	/eSlcdYLH0SenoanyMu+Qx9aXHs0TsIMry6nW4IcPDW49aGrl1+a8H+smtFi5h/YutpQ
	U/5ow+0Y5oJ4ELNJwvdr+8AYrm79mWaptXWYr1B69sLk0M09muAT6neQ+FLAvoXYdMu5
	JFwQ==
X-Gm-Message-State: APjAAAXtweERIS2AmoAvZq+GvE9La7k7ycumbvSTU8Ugo2WZFOeBGaDJ
	CVPdDw6pfUM3VmG5FzISg/AxG0ISaBA=
X-Google-Smtp-Source: APXvYqy8/ZH9hgbDAoHCyzZQM8AD8cc5rjbF2ig7/e0c5bHOTUxd3bgoSbLTIXy7Zh/r1YoCCk/y0Q==
X-Received: by 2002:a17:902:523:: with SMTP id
	32mr9863826plf.148.1581535220271; 
	Wed, 12 Feb 2020 11:20:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	e38sm1205552pgm.82.2020.02.12.11.20.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 11:20:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Feb 2020 11:20:25 -0800
Message-Id: <20200212192025.2736436-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] meta-oe: Remove dnf dependent package for non-rpm package backend
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
X-List-Received-Date: Wed, 12 Feb 2020 19:20:19 -0000
Content-Transfer-Encoding: 8bit

dnf is not built when rpm is not in chosen backends

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb   | 5 ++++-
 .../recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb    | 1 +
 meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb        | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 929e7d5591..777623ba88 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -172,7 +172,8 @@ RDEPENDS_packagegroup-meta-oe-gnome ="\
     "
 
 RDEPENDS_packagegroup-meta-oe-graphics ="\
-    cairomm dietsplash directfb directfb-examples dnfdragora \
+    cairomm dietsplash directfb directfb-examples \
+    ${@bb.utils.contains("PACKAGE_CLASSES", "package_rpm", "dnfdragora dnf-plugin-tui", "", d)} \
     fbgrab fbida fontforge fvwm glm gphoto2 libgphoto2 \
     gtkperf jasper leptonica libmng libsdl2-image libsdl2-mixer libsdl2-net \
     libsdl-gfx libsdl-image libsdl-mixer libsdl-net libsdl-ttf \
@@ -190,6 +191,8 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "freeglut libsdl2-ttf", "", d)} \
     "
 
+
+
 RDEPENDS_packagegroup-meta-oe-kernel ="\
     agent-proxy broadcom-bt-firmware cpupower \
     crash ipmitool minicoredumper oprofile \
diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index a8367b5d91..5ecf649662 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -37,3 +37,4 @@ RDEPENDS_${PN} += " \
 "
 
 BBCLASSEXTEND = "nativesdk"
+PNBLACKLIST[dnf-plugin-tui] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
index 9cd1efb8e8..3f2dc3060b 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
@@ -28,3 +28,6 @@ EXTRA_OECMAKE = " -DWITH_MAN=OFF -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}
 BBCLASSEXTEND = "nativesdk"
 
 FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/ ${datadir}/ ${bindir}/ ${sysconfdir}/dnfdragora "
+
+PNBLACKLIST[dnfdragora] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
+
-- 
2.25.0


