Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlKt-0005rY-IH
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:42:43 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so4758840fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NquvO4c9fDFxTePOzVsobFKX08X6RqRpdBPLR43CtOI=;
	b=MbaH/vdl0OTH6qptiA5a6SkczW39onrKhXUUA2B43P3van8FL1m9m8tTf0hqZBJbqG
	ILlw5sx5nxhUH1LdNNDY4X7uvZjY+Wvgmg1N1s4hS7a0mKHLQuXp/GaqcOGxc2Ka7UWz
	N4B8v63LRQ92L9hAT9cjCZcVV/mL9zvxF56d4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ar+9PNw109EXVxdspsCAnoS9ZClWPQn2hNSCHl0dl2IIyikW8Gn6QHDR7N/zo0/zN8
	g0O3Vg2DusGI82Dmu+epfDJjsxPTUE5mk6ZK4eVayq2ItklCBpNhlCd3XZjZOH6+YSPO
	jn5i4simvPlwj7PlW0hzvRiVBJB/Qj6qBuc80=
Received: by 10.223.134.75 with SMTP id i11mr1610099fat.39.1305027600500;
	Tue, 10 May 2011 04:40:00 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 9sm2347924fat.15.2011.05.10.04.39.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:39:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:39:53 +0200
Message-Id: <eafad7e3037910c0c7fc96bae773be38be25eaac.1305027503.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305027503.git.Martin.Jansa@gmail.com>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/9] libxfixes, util-macros: drop from meta-oe, now they are in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 11:42:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb |   22 --------------------
 .../xorg-util/util-macros_1.13.0.bb                |   15 -------------
 .../xorg-util/xorg-util-common.inc                 |   11 ----------
 3 files changed, 0 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-util/util-macros_1.13.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-util/xorg-util-common.inc

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb b/meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb
deleted file mode 100644
index 4ca1ea2..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "XFixes: X Fixes extension library."
-
-DESCRIPTION = "X applications have often needed to work around various \
-shortcomings in the core X window system.  This extension is designed to \
-provide the minimal server-side support necessary to eliminate problems \
-caused by these workarounds."
-
-require xorg-lib-common.inc
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3c1ce42c334a6f5cccb0277556a053e0"
-
-DEPENDS += "virtual/libx11 xproto fixesproto xextproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "678071bd7f9f7467e2fc712d81022318"
-SRC_URI[sha256sum] = "537a2446129242737a35db40081be4bbcc126e56c03bf5f2b142b10a79cda2e3"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXfixes"
diff --git a/meta-oe/recipes-graphics/xorg-util/util-macros_1.13.0.bb b/meta-oe/recipes-graphics/xorg-util/util-macros_1.13.0.bb
deleted file mode 100644
index 3f4471a..0000000
--- a/meta-oe/recipes-graphics/xorg-util/util-macros_1.13.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-util-common.inc
-
-DESCRIPTION = "X autotools macros"
-PE = "1"
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
-
-ALLOW_EMPTY = "1"
-BBCLASSEXTEND = "native nativesdk"
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "31e9ddcbc1d8bc8c09ab180443974dd1"
-SRC_URI[sha256sum] = "7bff944fb120192e7fe1706e9c0b7e41666e7983ce3e2bdef0b7734392d9e695"
diff --git a/meta-oe/recipes-graphics/xorg-util/xorg-util-common.inc b/meta-oe/recipes-graphics/xorg-util/xorg-util-common.inc
deleted file mode 100644
index e5c8ce9..0000000
--- a/meta-oe/recipes-graphics/xorg-util/xorg-util-common.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-HOMEPAGE = "http://www.x.org"
-SECTION = "x11/utils"
-LICENSE = "MIT-X"
-
-INC_PR = "r2"
-
-SRC_URI = "${XORG_MIRROR}/individual/util/${BPN}-${PV}.tar.gz"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-inherit autotools pkgconfig
-- 
1.7.5.rc3



