Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id E2A137FC4A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:52 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id x185so6089942pfc.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=l8sd7JxQ95LPC1jE1te+y/rASYuSf8lty3kwgPHK2Lg=;
	b=EfKUmk3qJLY+j2hDJnhsbl38wU/YGyopL9GwVxwZMHJlluaiOeqlSgVXlk3XV7AsgY
	Tl+5HSa/mp4SO2cqTrvUB6ev7tah2qWGbWew7L8yWrOGgayzfPlW0tEz8z8Zb9Z/lsgD
	SLh8e52xb6oDu36w2XxacOa6+h75LR5fMgFFv0L4Cho6OIIDBIUcj8Ksf3d8LOKRJNqb
	XWtE9yszlngJsCqF5gMvx15IP3r9COxs0rlnsro7cm0KnoJaRKh9mBgui3VWgXAPjNsJ
	p8OspAC5oVfTgy2shUwKBtLJuJ5YbQMgOn9vo+oV/R6OoL6pgAqPE/rWoa0PXdNe94Iy
	D3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=l8sd7JxQ95LPC1jE1te+y/rASYuSf8lty3kwgPHK2Lg=;
	b=hTc5SPdZIvVCgSNpzgA87Qe/28B1OPOqrOSdilC6Rn5zAE6Kzs4XOmo2DcS9dYp49M
	46ZTKgyt6yKkygtTsLBt1RL7aZoGhYhUEdkQiZW/WoMYhVoZ4Dnl4Y/6ksW73LRhLv79
	ngP4xpGcsfcCthiCDHJ4j5eE+jYhuIetV3VuyTR/udQLm3hGIXPTgw9IhoWdiU374Lg0
	WzPgzWtKoeQQlVbIzFd+ZB7vu/c8/S7Wib4VTctBR7HVRsBvja6UmbDw5iD7YXXYf3pi
	Iqy3MV/43CBe/63oHSAvkpVaMEqpekqnsU0timVkX0dv95C9mWSzSPNVecGPb3Ub4exH
	WM/A==
X-Gm-Message-State: APjAAAV/7/wueh9wyuIwZKpZkKcO8bgQ8TaneukVvGBQcCq/5Z0TsRRE
	0DaLd+HEk4BfdtUO2xVzOqabUjyRGfM=
X-Google-Smtp-Source: APXvYqwQ1RdTd+Gg9EhmY1w3tkIC4KjeRNsJwCnAHgE1mKOw6DZeSL6hi9jM9Kk2GjONKkQ7f6DDUg==
X-Received: by 2002:a63:9d0f:: with SMTP id i15mr9564805pgd.240.1576886813488; 
	Fri, 20 Dec 2019 16:06:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:21 -0800
Message-Id: <20191221000635.1573390-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 09/23] dcadec: Define BASELIB as a knob
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:53 -0000
Content-Transfer-Encoding: 8bit

Use https protocol in fetcher

Fixes

ERROR: dcadec-0.2.0-r0 do_package: QA Issue: dcadec: Files/directories were installed but not shipped in any package:
/usr/lib
/usr/lib/libdcadec.so.0
/usr/lib/libdcadec.so.0.1.0
/usr/lib/libdcadec.so
/usr/lib/pkgconfig
/usr/lib/pkgconfig/dcadec.pc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-define-BASELIB-make-variable.patch   | 31 +++++++++++++++++++
 .../recipes-multimedia/dca/dcadec_0.2.0.bb    |  8 +++--
 2 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/dca/dcadec/0001-define-BASELIB-make-variable.patch

diff --git a/meta-multimedia/recipes-multimedia/dca/dcadec/0001-define-BASELIB-make-variable.patch b/meta-multimedia/recipes-multimedia/dca/dcadec/0001-define-BASELIB-make-variable.patch
new file mode 100644
index 0000000000..adce802bc8
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/dca/dcadec/0001-define-BASELIB-make-variable.patch
@@ -0,0 +1,31 @@
+From 18cc69460d2a0c756880bd54fda36afb0173ea02 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Dec 2019 19:47:36 -0800
+Subject: [PATCH] define BASELIB make variable
+
+This helps to override the default libdir from environment
+
+Upstream-Status: Submitted [https://github.com/foo86/dcadec/pull/61]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a503698..8f323be 100644
+--- a/Makefile
++++ b/Makefile
+@@ -7,8 +7,9 @@ API_PATCH = 0
+ CFLAGS := -std=gnu99 -D_FILE_OFFSET_BITS=64 -Wall -Wextra -O3 -ffast-math -g -MMD $(CFLAGS)
+ 
+ PREFIX ?= /usr/local
++BASELIB ?= lib
+ BINDIR ?= $(PREFIX)/bin
+-LIBDIR ?= $(PREFIX)/lib
++LIBDIR ?= $(PREFIX)/$(BASELIB)
+ INCLUDEDIR ?= $(PREFIX)/include
+ 
+ SRC_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
+-- 
+2.24.1
+
diff --git a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
index 45b53c1191..1a51abc360 100644
--- a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
@@ -4,14 +4,16 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c"
 
 SRCREV = "b93deed1a231dd6dd7e39b9fe7d2abe05aa00158"
-SRC_URI = "git://github.com/foo86/dcadec.git;protocol=http"
+SRC_URI = "git://github.com/foo86/dcadec.git;protocol=https \
+           file://0001-define-BASELIB-make-variable.patch \
+          "
 
 S = "${WORKDIR}/git"
 
 inherit lib_package
 
-EXTRA_OEMAKE = "CONFIG_SHARED=1"
+EXTRA_OEMAKE = "CONFIG_SHARED=1 PREFIX=${prefix} BASELIB=${baselib}"
 
 do_install() {
-	oe_runmake install DESTDIR="${D}" PREFIX="${prefix}"
+	oe_runmake install DESTDIR="${D}"
 }
-- 
2.24.1


