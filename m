Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4B76AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 07:27:47 +0000 (UTC)
Received: by wiax7 with SMTP id x7so57728994wia.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6M9Kol95CWLMtwp3hhIJBq18CItcNYcFj47ehZwt0c4=;
	b=p9qqL+guV5yZW4Agi50X6r8tbqEv1j3tHZVz6YFNzVTGOcdVxAc5S5lkmbPGPfI3V1
	d6yqU4gAsox0yQX+4Tv1cb+aFPIGx/8IH3qx3gjRL6LqIMMfRJ9Ba7z+yFh0umiB57kn
	GiPySTkJZGxelcSt9kkuOj9MjCecdM4ZotdA5W9ZSxaQDzmxsz0oOUl5rUh1Or+EnAse
	39fkNvkNexG9JuNAhWkohBFC5nP0jt4zkD3SKtnsFTD12kDZyq4ibmYAsTHdq8MVv1Ef
	GVlATuArPwl27a5it1wP3yq+DZkTFQcmlAnXBPqvxaZ2e0L5CbGc8FLmJy8EHlIPAExx
	2UGg==
X-Received: by 10.194.222.197 with SMTP id qo5mr24954395wjc.142.1428910069122; 
	Mon, 13 Apr 2015 00:27:49 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B569.dip0.t-ipconnect.de.
	[217.249.181.105]) by mx.google.com with ESMTPSA id
	i10sm10139643wja.40.2015.04.13.00.27.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 00:27:48 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Apr 2015 09:27:32 +0200
Message-Id: <1428910057-23647-3-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
In-Reply-To: <1428910057-23647-2-git-send-email-sven.ebenfeld@gmail.com>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-2-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v2 2/7] icedtea7-native: fix build with gcc 4.9
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
X-List-Received-Date: Mon, 13 Apr 2015 07:27:48 -0000

The stabs debug format is not supported by our toolchain. It works if we
use gdb debug format.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../icedtea-change-to-gdb-debug-format.patch       | 29 ++++++++++++++++++++++
 recipes-core/icedtea/openjdk-7-release-03b147.inc  |  2 ++
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch

diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch
new file mode 100644
index 0000000..c0a3c9f
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
++DEBUG_CFLAGS += -ggdb
+ endif
+ 
+ ifneq ($(OBJCOPY),)
+@@ -244,7 +244,7 @@
+   FASTDEBUG_CFLAGS/zero  = -g
+   FASTDEBUG_CFLAGS += $(DEBUG_CFLAGS/$(BUILDARCH))
+   ifeq ($(FASTDEBUG_CFLAGS/$(BUILDARCH)),)
+-    FASTDEBUG_CFLAGS += -gstabs
++    FASTDEBUG_CFLAGS += -ggdb
+   endif
+ 
+   OPT_CFLAGS/ia64  = -g
+@@ -254,7 +254,7 @@
+   OPT_CFLAGS/zero  = -g
+   OPT_CFLAGS += $(OPT_CFLAGS/$(BUILDARCH))
+   ifeq ($(OPT_CFLAGS/$(BUILDARCH)),)
+-    OPT_CFLAGS += -gstabs
++    OPT_CFLAGS += -ggdb
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
1.8.1.rc3


