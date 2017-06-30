Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id D44C778268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:23 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id c73so66963924pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WPO+11jpoCG7cOglqNsQPfEM+tKU3Y0U0lZG2/4fdHA=;
	b=cpG+exdP1lisN7Hx6qD8b2mOIHDYU4JfnJ1H2TDj/M1rQKj9YXmEqTaesTZ0BlzUNz
	rkjzN0ATUx9sOuJ0UUC9+2sx7TkxkPfFIabFUrBi5Cl4hPid1WgNtmrlELR7H8DkIMEl
	0cruj6QCvpz3jjJ6k2w+2wHCZfT/yOZlgIK4PhvzRBmyQ6CpQN30JAs7ERIz+y8319ei
	ea/bfn5tfw5PXwvJHyuRc937ZPs0Cy/Cv8ASYmWl7SeUNuwfj+z0CS5qDixVR0/XZ7Uw
	abKgUqLpA2QSZ2RvWFPWYx5YXYcDDEs/huO/lW0ZGjaIxH/wcYy4KOSvmXHpUgJJlrh0
	dTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WPO+11jpoCG7cOglqNsQPfEM+tKU3Y0U0lZG2/4fdHA=;
	b=LetOfuegXIOsra0W4oQixMLTZTtsSl2LLAPTHi0ntAE7Byblth5hubQn44PWtad3oS
	2EPtZrDmUX6/U+rGv+5fZrq3TMQKAGRyvAoNNKar0sN2Xv0BNREcVgPHtO29O00ESqYJ
	lTxijzTcIMlBpwNGWjgTZ3K5VUl18HwgwZT019TAmYlKm5il/6lF77uSap6GjxLbZfq1
	ewAYoK+G+oHgr2fHGV9kwxkNQ0qPUUX2sMoz4ljd+g7mIpSw1KHzkJB/dTRoSjX6Nx83
	dIoWrOKP0jzfZZZg5ntyLWKDOejVmFU/fA8rObKSU4Xz2nSaDA+ufIaTSPYUOUA+z5wb
	+GPw==
X-Gm-Message-State: AKS2vOxg9eqdec8yNEJ8u/7C+jq5MFW9HyMDSqJyerxeyGEjcmXZhlsJ
	6j58p4SfK+UheYIU
X-Received: by 10.84.224.74 with SMTP id a10mr24076660plt.210.1498827624530;
	Fri, 30 Jun 2017 06:00:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:49 -0700
Message-Id: <20170630125957.3342-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/17] dietsplash: Fix build on mips
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...figure.ac-Do-not-demand-linker-hash-style.patch | 28 ++++++++++++++++++++++
 .../recipes-graphics/dietsplash/dietsplash_git.bb  |  6 +++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/dietsplash/dietsplash/0001-configure.ac-Do-not-demand-linker-hash-style.patch

diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash/0001-configure.ac-Do-not-demand-linker-hash-style.patch b/meta-oe/recipes-graphics/dietsplash/dietsplash/0001-configure.ac-Do-not-demand-linker-hash-style.patch
new file mode 100644
index 000000000..87e8637ee
--- /dev/null
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash/0001-configure.ac-Do-not-demand-linker-hash-style.patch
@@ -0,0 +1,28 @@
+From 65e8e3c9c69f41778b6308c2f8f3262c82c6f3e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Jun 2017 13:57:53 -0700
+Subject: [PATCH] configure.ac: Do not demand linker hash-style
+
+This helps fixing on architectures e.g. mips where gnu hash
+is not supported
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e1dba23..7bcc039 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -65,7 +65,6 @@ CC_CHECK_CFLAGS_APPEND([ \
+         -ffunction-sections \
+         -fdata-sections \
+ 	-Wl,-O1 \
+-	-Wl,--hash-style=gnu \
+         -Wl,--as-needed \
+         -Wl,--gc-sections])
+ 
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
index a88caf814..32f081592 100644
--- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PV = "0.3"
 PR = "r1"
 
-SRCREV = "f7aadacbe3c19e37ea938e00a5141b577fb74a5e"
-SRC_URI = "git://github.com/lucasdemarchi/dietsplash.git"
+SRCREV = "ef2e1a390e768e21e6a6268977580ee129a96633"
+SRC_URI = "git://github.com/lucasdemarchi/dietsplash.git \
+           file://0001-configure.ac-Do-not-demand-linker-hash-style.patch \
+           "
 
 inherit autotools
 
-- 
2.13.2


