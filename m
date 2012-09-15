Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TCyGI-00079E-2J
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 21:42:42 +0200
Received: by bkcik5 with SMTP id ik5so1688715bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2012 12:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=tgqq8UYGmImG6HTxOA18BG7scV4NEDmjdjUcJA1IMeA=;
	b=AmusNOmmgXpa79USD+IgcvH+ykBtUOnoGGiC02FM0ce5UKWm9yc/nQeQGxRNii4Rzj
	BYszmewtMFIYXqshkvzbchbb+JNMlNcDpYXtBluKAqaX++7xdrZoRVvqjuELRzYDnOE1
	0JnaeVFmItNAPcnNfdayJIzzgsuDMqOQ+rgHEDABL3Ft2fj0849XeUkA6iTgxF3EnF4w
	GaUZKpGkm5dvwe2RtCRZdh77RxwC021kIzHQNa9sm0FxH9HnOHjq7APiSfHGeGadDnxi
	VAPnLiHcvT/evCuwICXgZiEGqjaEa5NY50XSu5wgqpwDgVXSSHHKJGZZAbt7KMA0o02T
	6qZQ==
Received: by 10.204.156.73 with SMTP id v9mr2941932bkw.116.1347737405615;
	Sat, 15 Sep 2012 12:30:05 -0700 (PDT)
Received: from mizar.localdomain
	(host43-254-dynamic.30-79-r.retail.telecomitalia.it. [79.30.254.43])
	by mx.google.com with ESMTPS id y20sm2946727bkv.11.2012.09.15.12.30.02
	(version=SSLv3 cipher=OTHER); Sat, 15 Sep 2012 12:30:04 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Sep 2012 21:29:50 +0200
Message-Id: <1347737390-21615-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-initramfs][PATCH] linux-yocto: slob breaks usb networking, use slab
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
X-List-Received-Date: Sat, 15 Sep 2012 19:42:43 -0000

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



