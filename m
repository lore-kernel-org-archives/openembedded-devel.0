Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id C591273D1D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2015 15:05:03 +0000 (UTC)
Received: by widjs5 with SMTP id js5so12829030wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2015 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7bYpJSiAER1EQw2k3+l5UsFd128Bd7QKGGP07xvQ2LI=;
	b=CQOyY7g1EdDoHYg9Fa0b14pjsgTQKY6RCt1bJODDoK27cFC1uq8OOKajPlnCxWTPyv
	BSytPIP07G8PQhIDRB3fBMFVkA1LTAkMbJ+cbXB6k1RWYZrAZTJFkVXbKkc73oKP3mRw
	84fyEv4D1A74jg0V5nSq1K9yf2VQEft/yUJElLWYhTx3+YZcM9UhNicaX04bICsvZoQE
	C/XUsWetMkLHWi81Ij/fBIroyh75hm0fL9JoCa2XHwCadYfX52ZQqzT/yAd1ac2KmoId
	cTkZwdqoR/Dj6H/7aPebLwZmiAKiQUC8ks+BDZOSQj/lajn7NfQaZDjO+jmpiWTKKSUa
	1StA==
X-Received: by 10.194.8.99 with SMTP id q3mr41669605wja.88.1428419103921;
	Tue, 07 Apr 2015 08:05:03 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B505.dip0.t-ipconnect.de.
	[217.249.181.5]) by mx.google.com with ESMTPSA id
	dr7sm11370730wib.22.2015.04.07.08.05.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Apr 2015 08:05:03 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Apr 2015 17:04:34 +0200
Message-Id: <1428419079-30420-3-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
In-Reply-To: <1428419079-30420-2-git-send-email-sven.ebenfeld@gmail.com>
References: <1428419079-30420-1-git-send-email-sven.ebenfeld@gmail.com>
	<1428419079-30420-2-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH 2/7] icedtea7-native: fix build with gcc 4.9
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
X-List-Received-Date: Tue, 07 Apr 2015 15:05:05 -0000

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


