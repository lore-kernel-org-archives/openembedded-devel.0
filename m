Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id A727C6010B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 22:35:21 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id e21-v6so601555pgv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 15:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qlZBgWDE5WxE4mmE4/pOOiYiCoG8MTG0ca0RgSGZ8Dk=;
	b=upxYZJzQdNk7+ZthnorPZ7J8gCuTdfvKSMvFwDbQMFV95nmKkfkZnNOZKb/wNJ5qE4
	A+3o5wkwoMt/lIYpk3ciEpVlz9LnNySSWEKw0cgNFSCdQ0RfcxfUh7+cmbcJVVcyT2EK
	ePKgLJFFGBp0pUj28qLHcQ64nHROor2abR4Bvq7enpCcArshJWMDAlE8xqJhGS7yNSZs
	BO6+9SrS33uHNTN9T8DsXTXJjg8rCXUrKggIyM47LDxkyMJdrl3RV2ubFKSnx68qcakt
	n+mCZuMC1UyDCqsTUMIf5hOKqaBlWZQpmVLAfVszendifBRG+OpE8VDyLYFnGflOfEan
	QtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qlZBgWDE5WxE4mmE4/pOOiYiCoG8MTG0ca0RgSGZ8Dk=;
	b=T6mximEQxbvdsleA/f9wtt1QvQWgrchEXnt1bMECJlx+qUw+73FdZ8e/lJTD/kW1+W
	tT2RV9kJ//dTLTOO4mgRFBixqX+gd7/kkBMbQbg0c9Jeo53Ws4OeaUtyFetovTGzCT0c
	K6INHG+wmoYbdoI7sp1ObHaTZFPtHR65OO84uoPPBRkbvuNBIPAQBJ47UWfzc8iGuAhQ
	tFoAF0j5bV1mbkVe5HDA56nKQIYzvFCAw3bfM+CQDz1sinjkVpJq6mxGX89+p54MdzCG
	LmBXo9Mr7yOeCcHeLmSeA3HCuPGc4gWMZxH+beKw7CvqvDuPICH4UpNW/FItOBLlkl10
	3V0Q==
X-Gm-Message-State: ALKqPwdAUdAwkRu4VoHIDOMq8lLOJO3e6ojje7ZPBhMm0gqRYggvJtaN
	5/F1dXffvW8oY5F37ZywBaL6UA==
X-Google-Smtp-Source: AB8JxZraGc94yECekdoU/TOopkmEkQ8FZLYRzxNuefSa+dJ0LxJ/hz1u8pCKttEJ5qcypqT/u1s2Ig==
X-Received: by 2002:a62:9696:: with SMTP id
	s22-v6mr17612756pfk.191.1526855722248; 
	Sun, 20 May 2018 15:35:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	203-v6sm21887763pfz.131.2018.05.20.15.35.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 May 2018 15:35:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2018 15:35:15 -0700
Message-Id: <20180520223517.9869-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180520223517.9869-1-raj.khem@gmail.com>
References: <20180520223517.9869-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/6] gtkmathview: Fix build with clang
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
X-List-Received-Date: Sun, 20 May 2018 22:35:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...formatting-for-modern-c-11-compilers.patch | 31 +++++++++++++++++++
 .../mml-widget/gtkmathview_0.8.0.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/0001-Fix-formatting-for-modern-c-11-compilers.patch

diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-Fix-formatting-for-modern-c-11-compilers.patch b/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-Fix-formatting-for-modern-c-11-compilers.patch
new file mode 100644
index 0000000000..8b0096630d
--- /dev/null
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-Fix-formatting-for-modern-c-11-compilers.patch
@@ -0,0 +1,31 @@
+From 90411a7f5e0e9582e79f0a8ccc1e2f158615e451 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 19 May 2018 23:18:11 -0700
+Subject: [PATCH] Fix formatting for modern c++11 compilers
+
+Fixes
+error: invalid suffix on literal; C++11 requires a space between literal and identifier [-Wreserved-user-defined-literal]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/backend/svg/SVG_RenderingContext.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/backend/svg/SVG_RenderingContext.cc b/src/backend/svg/SVG_RenderingContext.cc
+index 55d6097..0d50702 100644
+--- a/src/backend/svg/SVG_RenderingContext.cc
++++ b/src/backend/svg/SVG_RenderingContext.cc
+@@ -68,7 +68,7 @@ void
+ SVG_RenderingContext::documentStart(const BoundingBox& bbox)
+ {
+   beginDocument(bbox);
+-  metadata("Created by "PACKAGE" version "VERSION);
++  metadata("Created by " PACKAGE " version " VERSION);
+ }
+ 
+ void
+-- 
+2.17.0
+
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index df82bef634..9ee9e30352 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/GNOME/gtkmathview.git \
     file://0001-include-cstdio-to-get-printf-definitions.patch \
     file://0002-configure.ac-header-detection-of-hash_map-is-broken-.patch \
     file://0003-gcc-6.0-build-fixes.patch \
+    file://0001-Fix-formatting-for-modern-c-11-compilers.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.0


