Return-Path: <matthias.schoepfer@googlemail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB8E6C397
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 13:46:51 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id l2so2228372wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 06:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1pVVOTYVlUPo0ceohxfgb7PE/0azKgmXPOUUtOZYGgc=;
	b=J96RmloE4Np1U28y1z7uo+iRKQ2l9pLbCPg8CvfhCl113oYStpTYcuD4neQtHf8Dct
	yb/ctF7uK8Aynw+JLruCtTmXOhYPaeGM7HdaQjyL2ewP2Zm5fJQiIZIEeY/KV+BNhTLg
	rT2ZVb0b2OWooIbuWjn4gJj7ShLZATSi3aTySIX8LDX6oanD4sp7XLniXhTAuRRIp5mk
	2Z5n0kcNV4H1RSK7NuuIbgez+Mkp7On52oZjpaBrAHsODy3Qv0tUEmm2miiO6pa1IFyw
	jiVIFHS5BH3TI41d/VC4B8WPq31TnKtHlktMbTkFrOL/ix3c5/Nj0y5yT+v7sLKVKsfU
	RVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1pVVOTYVlUPo0ceohxfgb7PE/0azKgmXPOUUtOZYGgc=;
	b=WFwz4nIz0zS1CY+/DuafGmw3xi/AkzvMZUH8lcljwcb9Vivr9RW60HoZ4x0r4siikE
	GjihTcFOi5oBRMbf5arYJlhaHHhazvCLBaEEF5oGj46xNzGAQyMkOXM6zloKGd7VE167
	zR24YVXw3kOlbZxECsQCDoMf9GUzrMTuH0NwmKTwsvEc0ZKlyxSSmU/kWISCpJ10IpCH
	sD2x+L5D0nC7oeckJhJbXj6kwuBx2b2mx+DfGxrkXQ3RNqrYbcKzQ55WfZf/BYX2VDUA
	e8RHsoTbuzVSFLOoFqnlT9CTjBp1/3Frkx85Ue2xVAPeAzXtMOkPHddHTnwjK2p56jIb
	mutw==
X-Gm-Message-State: APjAAAU590itpc5yY6OYxRaVr4ABJoWrpS7pN0QZniu6rpFMnNFuBbln
	q5Z/9jB1cG71R2qyTxxaJRMuJ7sP
X-Google-Smtp-Source: APXvYqyHuMIIUPCVUBev/NStls1OtGjn+yb4i4PKX1JlezkvbJZbkLzHApgHrAkmoRTttOy0x098bA==
X-Received: by 2002:a7b:ca5a:: with SMTP id m26mr113402wml.134.1566395211928; 
	Wed, 21 Aug 2019 06:46:51 -0700 (PDT)
Received: from sl-hw-u100.kelle.grp ([213.168.66.146])
	by smtp.gmail.com with ESMTPSA id
	p13sm26099866wrw.90.2019.08.21.06.46.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Aug 2019 06:46:51 -0700 (PDT)
From: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
X-Google-Original-From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2019 15:46:46 +0200
Message-Id: <20190821134646.13589-1-matthias.schoepfer@ithinx.io>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Subject: [meta-java][PATCH] openjdk-8: fix build on machines with linux kernel 5.0+
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
X-List-Received-Date: Wed, 21 Aug 2019 13:46:51 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
---
 .../openjdk-8-release-172b11-common.inc       |  1 +
 ...fixing-build-for-kernel-versions-5.x.patch | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
index ad20585..eb7e38a 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
@@ -21,6 +21,7 @@ PATCHES_URI = "\
     ${LIBPNG_NEON_PATCH} \
     file://handle_extra_output.patch \
     file://hotspot-handle-gcc7-format-overflow.patch \
+    file://0001-fixing-build-for-kernel-versions-5.x.patch \
 "
 HOTSPOT_UB_PATCH = "\
     file://0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch \
diff --git a/recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch b/recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch
new file mode 100644
index 0000000..9b17b66
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch
@@ -0,0 +1,27 @@
+From 51b022bcc596aa85e72e8d8bb93ffc3be843b8b9 Mon Sep 17 00:00:00 2001
+From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
+Date: Wed, 21 Aug 2019 14:33:02 +0200
+Subject: [PATCH] fixing build for kernel versions 5.x
+
+This simply extends the possibility of having a version 5+ linux kernel
+
+
+Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
+
+---
+ hotspot/make/linux/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hotspot/make/linux/Makefile b/hotspot/make/linux/Makefile
+index 17c14097..02cb0b33 100644
+--- a/hotspot/make/linux/Makefile
++++ b/hotspot/make/linux/Makefile
+@@ -233,7 +233,7 @@ checks: check_os_version check_j2se_version
+ # Solaris 2.5.1, 2.6).
+ # Disable this check by setting DISABLE_HOTSPOT_OS_VERSION_CHECK=ok.
+ 
+-SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3% 4%
++SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3% 4% 5%
+ OS_VERSION := $(shell uname -r)
+ EMPTY_IF_NOT_SUPPORTED = $(filter $(SUPPORTED_OS_VERSION),$(OS_VERSION))
+ 
-- 
2.21.0


