Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TCzE3-0008Cd-Tb
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 22:44:27 +0200
Received: by weyr6 with SMTP id r6so3145107wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2012 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=tgqq8UYGmImG6HTxOA18BG7scV4NEDmjdjUcJA1IMeA=;
	b=EF9sHkwvGkVJNCTeEfiKILBKNQLJ/ua0nor0nybDu4GTk0qIchAZRNy4pphWkbFIAc
	Kj1EmfaH1nWLz+ClCYFFFOWENik9HKrmIDhZFYLDHUuFuxnegfnrx2jzJUeR9G3yyfeJ
	WJ1ZTDGd9QYb3eLGdZe0iXwr+WcW8tZu57FeMy84wWLOefiZYTeoNfA9fAl/X+4IqmIH
	i4ZhSb1sYbH81V4+i9I3kXeZjGxDs66+lLd8vzLjF/UeZyQqa5eyOp5JQRzgrYdLmy7v
	qvFVIMc/GxNB4Heoze2bFGHPaI7U+dm49jt8JTkFX5+yQvLvVdHOVkRVKoi6e9at2Tqs
	yVNw==
Received: by 10.180.109.129 with SMTP id hs1mr6493480wib.0.1347741111457;
	Sat, 15 Sep 2012 13:31:51 -0700 (PDT)
Received: from mizar.localdomain
	(host43-254-dynamic.30-79-r.retail.telecomitalia.it. [79.30.254.43])
	by mx.google.com with ESMTPS id hv8sm11641099wib.0.2012.09.15.13.31.49
	(version=SSLv3 cipher=OTHER); Sat, 15 Sep 2012 13:31:50 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Sep 2012 22:31:44 +0200
Message-Id: <1347741104-18615-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH] linux-yocto: slob breaks usb networking, use slab
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
X-List-Received-Date: Sat, 15 Sep 2012 20:44:28 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto/akita/akita.cfg   |    4 ++--
 recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg     |    4 ++--
 recipes-kernel/linux/linux-yocto/collie/collie.cfg |    4 ++--
 recipes-kernel/linux/linux-yocto/poodle/poodle.cfg |    4 ++--
 recipes-kernel/linux/linux-yocto/spitz/spitz.cfg   |    4 ++--
 recipes-kernel/linux/linux-yocto/tosa/tosa.cfg     |    4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto/akita/akita.cfg b/recipes-kernel/linux/linux-yocto/akita/akita.cfg
index 6f0db54..e7ecdde 100644
--- a/recipes-kernel/linux/linux-yocto/akita/akita.cfg
+++ b/recipes-kernel/linux/linux-yocto/akita/akita.cfg
@@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
 # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
 CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_COMPAT_BRK=y
-# CONFIG_SLAB is not set
+CONFIG_SLAB=y
 # CONFIG_SLUB is not set
-CONFIG_SLOB=y
+# CONFIG_SLOB is not set
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=m
 CONFIG_HAVE_OPROFILE=y
diff --git a/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg b/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
index 5655f0d..f8d3f4d 100644
--- a/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
+++ b/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
@@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
 # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
 CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_COMPAT_BRK=y
-# CONFIG_SLAB is not set
+CONFIG_SLAB=y
 # CONFIG_SLUB is not set
-CONFIG_SLOB=y
+# CONFIG_SLOB is not set
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=m
 CONFIG_HAVE_OPROFILE=y
diff --git a/recipes-kernel/linux/linux-yocto/collie/collie.cfg b/recipes-kernel/linux/linux-yocto/collie/collie.cfg
index 4cc5f56..2f5ead7 100644
--- a/recipes-kernel/linux/linux-yocto/collie/collie.cfg
+++ b/recipes-kernel/linux/linux-yocto/collie/collie.cfg
@@ -129,9 +129,9 @@ CONFIG_PERF_EVENTS=y
 # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
 CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_COMPAT_BRK=y
-# CONFIG_SLAB is not set
+CONFIG_SLAB=y
 # CONFIG_SLUB is not set
-CONFIG_SLOB=y
+# CONFIG_SLOB is not set
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=m
 CONFIG_HAVE_OPROFILE=y
diff --git a/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg b/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
index c20557e..644ff69 100644
--- a/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
+++ b/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
@@ -129,9 +129,9 @@ CONFIG_PERF_EVENTS=y
 # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
 CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_COMPAT_BRK=y
-# CONFIG_SLAB is not set
+CONFIG_SLAB=y
 # CONFIG_SLUB is not set
-CONFIG_SLOB=y
+# CONFIG_SLOB is not set
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=m
 CONFIG_HAVE_OPROFILE=y
diff --git a/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg b/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
index f3f6561..6a26182 100644
--- a/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
+++ b/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
@@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
 # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
 CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_COMPAT_BRK=y
-# CONFIG_SLAB is not set
+CONFIG_SLAB=y
 # CONFIG_SLUB is not set
-CONFIG_SLOB=y
+# CONFIG_SLOB is not set
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=m
 CONFIG_HAVE_OPROFILE=y
diff --git a/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg b/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
index 31c6da3..013112f 100644
--- a/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
+++ b/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
@@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
 # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
 CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_COMPAT_BRK=y
-# CONFIG_SLAB is not set
+CONFIG_SLAB=y
 # CONFIG_SLUB is not set
-CONFIG_SLOB=y
+# CONFIG_SLOB is not set
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=m
 CONFIG_HAVE_OPROFILE=y
-- 
1.7.8.6



