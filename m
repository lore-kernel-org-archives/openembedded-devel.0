Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 04E717805C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:45 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id e26so4364570pfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mDLjWwIfdVpcg0j2bHr5I8O1kAdvIdjycQvHkqMikqs=;
	b=YF3PeKzuePD96Ht3BRh0E50Eg9MeGnk4K7CezvZR5L13fOon1q3HLYSRbHNNegWTuL
	ODAHs71NczoTECmPZEtCbPF+0GJcIIUF6/mVa6BtwDQKsjz37OwUyU0EdW/5JIHyN3Ef
	f4pfpsLX34S6vy4MGYVjxuIq7Q1cnYmsUZ0dlvJB/Jq75vAhBQNZJ18QUv2ztUjmeSe/
	iZPZCmuOhOr0MDRwX6N4kg6nY2kLT8FP0gLbTnXviffTcnlk6KCw2nbuYVsjeZrGn5rd
	evbwHn1AVgaZ7Q+X8xUrcxYYV8rV8eqAglpUnAcuNXPw+T40j5A2GDu44mQwwXly2JlA
	4NkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mDLjWwIfdVpcg0j2bHr5I8O1kAdvIdjycQvHkqMikqs=;
	b=KHwyfUrRuxggsG0+L8TCLmRh5yCkHjzgPMrOVPGzvb/BblEO6fZFxx/yaUqpaVUVHU
	JNEm/DHY9irrpP0hcJWoAk7USXeqFQPd2LbY9y7Mpxy3I+2n7nBwGVOq6VNu48ZJPXhG
	6drVCM5w1Ag97BzJetD0Qni20KyzfZIoBXdhefVsmXl9Y3uBNk3icYqCrYj6qI+F3KA6
	YZ/X8BISD3io0Yg4HToHqrlNUvts6VGOnQ6+8ui41NPb4rbdp22PpIvx8coV7w0LfiIK
	MYcS6lnElKIuATqln6SpicQASGZ/UikS6NYAEdYzv7R124TsGIOTMu8PHKbZePcck7b9
	6beQ==
X-Gm-Message-State: AIVw110jke+V808jsG1C7C4eh8/T5RO+u68PZgRJ5e1HZdY/zRsJ1uhG
	mCkCe78dNRglDyiS
X-Received: by 10.101.90.135 with SMTP id c7mr790991pgt.168.1500347446746;
	Mon, 17 Jul 2017 20:10:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:12 -0700
Message-Id: <20170718031013.44536-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/17] lm_sensors: Fix build on musl
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-limit-sys-io.h-header-include-to-just-gl.patch | 88 ++++++++++++++++++++++
 .../recipes-support/lm_sensors/lmsensors_3.4.0.bb  |  6 ++
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch b/meta-oe/recipes-support/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch
new file mode 100644
index 000000000..fb3878dc3
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch
@@ -0,0 +1,88 @@
+From 727524453f115ddc05109e9bbb3d0e60a7db9185 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Jul 2017 15:05:50 -0700
+Subject: [PATCH] prog: Do not limit sys/io.h header include to just glibc
+
+musl provides it too.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ prog/dump/isadump.c | 6 ------
+ prog/dump/isaset.c  | 6 ------
+ prog/dump/superio.c | 5 -----
+ prog/dump/util.c    | 5 -----
+ 4 files changed, 22 deletions(-)
+
+diff --git a/prog/dump/isadump.c b/prog/dump/isadump.c
+index e0e6f00..8794537 100644
+--- a/prog/dump/isadump.c
++++ b/prog/dump/isadump.c
+@@ -36,13 +36,7 @@
+ #include "util.h"
+ #include "superio.h"
+ 
+-
+-/* To keep glibc2 happy */
+-#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
+ #include <sys/io.h>
+-#else
+-#include <asm/io.h>
+-#endif
+ 
+ #ifdef __powerpc__
+ unsigned long isa_io_base = 0; /* XXX for now */
+diff --git a/prog/dump/isaset.c b/prog/dump/isaset.c
+index e743755..85a4f64 100644
+--- a/prog/dump/isaset.c
++++ b/prog/dump/isaset.c
+@@ -32,13 +32,7 @@
+ #include <string.h>
+ #include "util.h"
+ 
+-
+-/* To keep glibc2 happy */
+-#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
+ #include <sys/io.h>
+-#else
+-#include <asm/io.h>
+-#endif
+ 
+ #ifdef __powerpc__
+ unsigned long isa_io_base = 0; /* XXX for now */
+diff --git a/prog/dump/superio.c b/prog/dump/superio.c
+index 64ef27b..906fe55 100644
+--- a/prog/dump/superio.c
++++ b/prog/dump/superio.c
+@@ -20,12 +20,7 @@
+ */
+ 
+ #include <stdlib.h>
+-
+-#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
+ #include <sys/io.h>
+-#else
+-#include <asm/io.h>
+-#endif
+ 
+ #include "superio.h"
+ 
+diff --git a/prog/dump/util.c b/prog/dump/util.c
+index 874c1b9..197fa64 100644
+--- a/prog/dump/util.c
++++ b/prog/dump/util.c
+@@ -11,12 +11,7 @@
+ #include <stdio.h>
+ #include "util.h"
+ 
+-/* To keep glibc2 happy */
+-#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
+ #include <sys/io.h>
+-#else
+-#include <asm/io.h>
+-#endif
+ 
+ /* Return 1 if we should continue, 0 if we should abort */
+ int user_ack(int def)
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
index dbc05a898..454a69f40 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/groeck/lm-sensors/archive/V3-4-0.tar.gz \
            file://fancontrol.init \
            file://sensord.init \
            file://0001-lmsensors-sensors-detect-print-a-special-message-whe.patch \
+           file://0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch \
 "
 SRC_URI[md5sum] = "1e9f117cbfa11be1955adc96df71eadb"
 SRC_URI[sha256sum] = "e334c1c2b06f7290e3e66bdae330a5d36054701ffd47a5dde7a06f9a7402cb4e"
@@ -37,6 +38,11 @@ EXTRA_OEMAKE = 'EXLDFLAGS="${LDFLAGS}" \
         CC="${CC}" AR="${AR}"'
 
 do_compile() {
+    sed -i -e 's:^# \(PROG_EXTRA\):\1:' ${S}/Makefile
+    # Respect LDFLAGS
+    sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
+    sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g' \
+                ${S}/lib/Module.mk
     oe_runmake user PROG_EXTRA="sensors sensord"
 }
 
-- 
2.13.3


