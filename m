Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 301C465CAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 20:13:14 +0000 (UTC)
Received: by widdi4 with SMTP id di4so113646426wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 13:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PR05/Yi0a906Yodpy2nq7vSppiHRgdeiu9HWtWGbPr4=;
	b=TaKSxB4+WtCrY72McJeol0hjv/YpQu1hB5O75CaFfr5xoWcDfMTYEDZsSxaxbZ/Jma
	BUOE1zOHCezp+QyN+5MFnbduajUy6YWMb2n2q3nKr9xlNz/MzcYs9kJdHHkQh0p57smd
	cDslclc/lcdimXyfEjmDU+K3o2iyDqI5JsYcHrf7WRnjGquhw5ZRXiL+LY9+6hk5+2zu
	Y29eE+bj5x3dBSgfEDKC+JZBi1NWFqw18w8GdhYFE5Iw9ORh2xcNLIjb2ZjtASUkShP1
	Diseb48ewnaHXO/Ds8JbdcExOy3EgS89CRhKjq/lRzqy19mypKW3L1E48NTBoYjpYZ1s
	nzmA==
X-Received: by 10.180.231.40 with SMTP id td8mr24210562wic.9.1430165595272;
	Mon, 27 Apr 2015 13:13:15 -0700 (PDT)
Received: from ubuntu.ebenfeld.local (ip-84-119-99-153.unity-media.net.
	[84.119.99.153]) by mx.google.com with ESMTPSA id
	cf12sm30848805wjb.10.2015.04.27.13.13.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 13:13:14 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 22:12:57 +0200
Message-Id: <1430165584-5634-3-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v3 02/10] icedtea7-native: fix build with gcc 4.9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Apr 2015 20:13:15 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../icedtea-change-to-gdb-debug-format.patch       | 29 ++++++++++++++++++++++
 recipes-core/icedtea/openjdk-7-release-03b147.inc  |  2 ++
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch

diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch
new file mode 100644
index 0000000..813dc97
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch
@@ -0,0 +1,29 @@
+--- openjdk/hotspot/make/linux/makefiles/gcc.make	2015-04-02 08:02:31.301728214 +0200
++++ openjdk/hotspot/make/linux/makefiles/gcc.make.new	2015-04-02 08:19:55.502171268 +0200
+@@ -233,7 +233,7 @@
+ DEBUG_CFLAGS/ppc   = -g
+ DEBUG_CFLAGS += $(DEBUG_CFLAGS/$(BUILDARCH))
+ ifeq ($(DEBUG_CFLAGS/$(BUILDARCH)),)
+-DEBUG_CFLAGS += -gstabs
++DEBUG_CFLAGS += -g
+ endif
+ 
+ ifneq ($(OBJCOPY),)
+@@ -244,7 +244,7 @@
+   FASTDEBUG_CFLAGS/zero  = -g
+   FASTDEBUG_CFLAGS += $(DEBUG_CFLAGS/$(BUILDARCH))
+   ifeq ($(FASTDEBUG_CFLAGS/$(BUILDARCH)),)
+-    FASTDEBUG_CFLAGS += -gstabs
++    FASTDEBUG_CFLAGS += -g
+   endif
+ 
+   OPT_CFLAGS/ia64  = -g
+@@ -254,7 +254,7 @@
+   OPT_CFLAGS/zero  = -g
+   OPT_CFLAGS += $(OPT_CFLAGS/$(BUILDARCH))
+   ifeq ($(OPT_CFLAGS/$(BUILDARCH)),)
+-    OPT_CFLAGS += -gstabs
++    OPT_CFLAGS += -g
+   endif
+ endif
+ 
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index 47813cd..01e7a3d 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -81,6 +81,7 @@ OPENJDK_PATCHES = " \
         file://icedtea-jdk-sane-x86-arch.patch;apply=no \
 	file://icedtea-flags.patch;apply=no \
 	file://icedtea-openjdk-remove-currency-data-generation-expi.patch;apply=no \
+	file://icedtea-change-to-gdb-debug-format.patch;apply=no \
         "
 
 export DISTRIBUTION_PATCHES = " \
@@ -91,4 +92,5 @@ export DISTRIBUTION_PATCHES = " \
         patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-flags.patch \
 	patches/icedtea-openjdk-remove-currency-data-generation-expi.patch \
+	patches/icedtea-change-to-gdb-debug-format.patch \
         "
-- 
1.9.1


