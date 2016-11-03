Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 873BB71A8B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 23:44:05 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so6112540pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 16:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AZBauUnBHWLWKtTrHIkG6RfCOtvh9WUs/AFoxoROQtQ=;
	b=e0m3gcy7FrANCqhibGD3iwSfWNgGcSYPHkcnVuMPnp4YgTFIvUh5voQnsN774rxfzq
	DVc6LFpHpkkniNuXxwqLAJKP8U8SFlAVnRfktDsv9E9fBW4zWkg0fFZM+yJV719WNV7Q
	C347o9iCX5kUPOpZRZnsaJDxQy4vBaCtaKB+VelgYyvWXO7ZFu4icJ9bY0v5X6f1XOeE
	c2FIKcZHNqjniu+d+xGG0TBxITZ0kFNojQ91keBvIfY/R/AI8swWHILAtfeFxEAGXKAu
	UTOubOyAVUz+LVzIRKxwGx9hAi7UvPeaI22qLhA9oq/0bHCL+N9dYA6sAhUg4h1Ff3zF
	MtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AZBauUnBHWLWKtTrHIkG6RfCOtvh9WUs/AFoxoROQtQ=;
	b=jsUZdteDjxx361YmbhuvsTY1JPwfsbtrG3atpmPTmeWcNutGNCzlEevIYBumwjmkyr
	Hx7sc3rhK3Ubbe0FGrUf0B4xMaklJAM1BUB/eFP3YahPFV6/i31hqqsr2TX/iDnpZd8Y
	7BhbSkCsnWhGTG5w8huR5t+mz/n7eAFpji0OinQ/o0VCbfH8yyT9hfHFtDTC6zBJihhh
	U11PbIgO1c0cDVslSu+nOyvg68w1ckyyPhpN/aH3sk1JVbWv/8WBZUaQ7wGD5uLf5xPV
	DEipgcVV2okRq2zPixIwZvTKAYtRcK1Vt0SqKvi8JNTuaw/H9G7PoMX7RXZmuHbnximB
	kabg==
X-Gm-Message-State: ABUngvdLZF8jW57o7WfpYfsBZYkGIR1ax+qSuxA2z90jKrTJZ0DViHYOumXVzDdekHYYQQ==
X-Received: by 10.99.152.25 with SMTP id q25mr17742652pgd.36.1478216647547;
	Thu, 03 Nov 2016 16:44:07 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id pe4sm7357103pac.6.2016.11.03.16.44.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 16:44:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 16:44:02 -0700
Message-Id: <20161103234402.3085-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-multimedia][PATCH] kodi: Fix build with pic on x86_64
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
X-List-Received-Date: Thu, 03 Nov 2016 23:44:06 -0000

Upgrade 17.x to latest on master

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0012-Always-compile-libcpluff-as-PIC.patch     | 30 ++++++++++++++++++++++
 .../0005-Always-compile-libcpluff-as-PIC.patch     | 30 ++++++++++++++++++++++
 .../recipes-mediacenter/kodi/kodi_16.bb            |  1 +
 .../recipes-mediacenter/kodi/kodi_17.bb            |  3 ++-
 4 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0012-Always-compile-libcpluff-as-PIC.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-Always-compile-libcpluff-as-PIC.patch

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0012-Always-compile-libcpluff-as-PIC.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0012-Always-compile-libcpluff-as-PIC.patch
new file mode 100644
index 0000000..f4b22cd
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0012-Always-compile-libcpluff-as-PIC.patch
@@ -0,0 +1,30 @@
+From 1fa9026dbcaaf674aedc9734034869934845812a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 3 Nov 2016 13:10:00 -0700
+Subject: [PATCH] Always compile libcpluff as PIC
+
+Fixes errors e.g.
+
+ld: lib/cpluff/libcpluff/.libs/libcpluff.a(pcontrol.o): relocation R_X86_64_PC32 against symbol `cp_stop_plugins' can not be used when making a shared object; recompile with -fPIC
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5d47a4a..cd59129 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2636,7 +2636,7 @@ XB_CONFIG_MODULE([lib/cpluff], [
+     --prefix="${prefix}" --includedir="${includedir}" --libdir="${libdir}" --datadir="${datadir}" \
+     --host=$host_alias \
+     --build=$build_alias \
+-    --target=$target_alias CFLAGS="$CFLAGS" CC="$CC" CXX="$CXX" LDFLAGS="$LDFLAGS" LIBS=""
++    --target=$target_alias --with-pic=yes CFLAGS="$CFLAGS" CC="$CC" CXX="$CXX" LDFLAGS="$LDFLAGS" LIBS=""
+     #LDFLAGS="$LDFLAGS -Wl,-read_only_relocs,suppress"    
+ ], [0])
+ 
+-- 
+2.10.2
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-Always-compile-libcpluff-as-PIC.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-Always-compile-libcpluff-as-PIC.patch
new file mode 100644
index 0000000..f513334
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-Always-compile-libcpluff-as-PIC.patch
@@ -0,0 +1,30 @@
+From 603e8925a8b1609d483d866346a35fefbc66cfca Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 3 Nov 2016 13:10:00 -0700
+Subject: [PATCH 5/5] Always compile libcpluff as PIC
+
+Fixes errors e.g.
+
+ld: lib/cpluff/libcpluff/.libs/libcpluff.a(pcontrol.o): relocation R_X86_64_PC32 against symbol `cp_stop_plugins' can not be used when making a shared object; recompile with -fPIC
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b210b73..52d5f11 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2385,7 +2385,7 @@ XB_CONFIG_MODULE([lib/cpluff], [
+     --prefix="${prefix}" --includedir="${includedir}" --libdir="${libdir}" --datadir="${datadir}" \
+     --host=$host_alias \
+     --build=$build_alias \
+-    --target=$target_alias CFLAGS="$CFLAGS" CC="$CC" CXX="$CXX" LDFLAGS="$LDFLAGS" LIBS=""
++    --target=$target_alias --with-pic=yes CFLAGS="$CFLAGS" CC="$CC" CXX="$CXX" LDFLAGS="$LDFLAGS" LIBS=""
+     #LDFLAGS="$LDFLAGS -Wl,-read_only_relocs,suppress"
+ ], [0])
+ 
+-- 
+2.10.2
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb
index 38a53ee..02216fc 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb
@@ -76,6 +76,7 @@ SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Jarvis \
            file://0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch \
            file://0010-curl-support-version-7.5.0-and-upwards.patch \
            file://0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch \
+           file://0012-Always-compile-libcpluff-as-PIC.patch \
 "
 
 inherit autotools-brokensep gettext pythonnative
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index bdf077a..22b23c6 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -63,13 +63,14 @@ DEPENDS = " \
 
 PROVIDES = "xbmc"
 
-SRCREV = "32c7788e7cce711be5b7f3893c82dddd79658268"
+SRCREV = "7f6abd1dd6d1aefcb4303083f34aaa90a8df9fce"
 PV = "17.0+gitr${SRCPV}"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=master \
            file://0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
            file://0002-handle-SIGTERM.patch \
            file://0003-add-support-to-read-frequency-output-if-using-intel-.patch \
            file://0004-Disable-DVD-support.patch \
+           file://0005-Always-compile-libcpluff-as-PIC.patch \
 "
 
 inherit autotools-brokensep gettext pythonnative
-- 
2.10.2


