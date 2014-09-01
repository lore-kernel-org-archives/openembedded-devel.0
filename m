Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 25A7765D56
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 22:15:03 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id z2so6815144wiv.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Sep 2014 15:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hmWHZoKI6+TAQJVt1eK3D/Gfoux3qull0Y36DNWI2bk=;
	b=zQPz/zWTSZEyTgXrkB23G6661OT6jP9Xi08Wqb4WGvsnMFTST1gQb3ybf27rIPe7fm
	BDvJFlTZNGjxf576V+U+H54hi1TmJY3srJUfezbypFAPgHxV8eLLe94ZBDLLeRDB6AU0
	rGIDocz11x5qeBcfj2W3vHy53HsQXXYTF6gCxSHr+l20JPvKTWNvjHoxWtmD3Ubr+atT
	Del52Ayct8TNufIYtPKXlJj6W8lGzuKnrUjy/yQZEwjQHv/KDggLb7JTsWzPVWdRUXCA
	w9LZl3EdAW4c1IiAond78J0sfEnD+554rsuyYO/gqX3Y3gVHHnSxU/KQXG+15TM+lcZj
	EONg==
X-Received: by 10.180.86.65 with SMTP id n1mr24621124wiz.41.1409609704122;
	Mon, 01 Sep 2014 15:15:04 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host215-42-dynamic.183-80-r.retail.telecomitalia.it.
	[80.183.42.215])
	by mx.google.com with ESMTPSA id s7sm4895878wjo.48.2014.09.01.15.15.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Sep 2014 15:15:03 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Sep 2014 00:15:00 +0200
Message-Id: <1409609700-13719-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] klibc: klcc: consider --sysroot option and override gcc-cross encoded sysroot
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
X-List-Received-Date: Mon, 01 Sep 2014 22:15:05 -0000

For the recipes built with klcc-cross it is necessary to
pass --sysroot otherwise we default to the one encoded in gcc-cross which
actually is the 'first one' built.
The issue was revealed when building for armv4 after having built for armv5te:
the produced binaries did contain Illegal Instruction (bx lr).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass                       |  4 ++--
 .../klibc/klibc-2.0.4/klcc-consider-sysroot.patch          | 14 ++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc            |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index ca741cd..8690472 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -4,8 +4,8 @@ DEPENDS =+ "klcc-cross"
 # Default for klcc is to build static binaries.
 # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
 
-export CC = "${TARGET_PREFIX}klcc"
-export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc -march=armv4 -mthumb-interwork"
+export CC = "${TARGET_PREFIX}klcc --sysroot=${STAGING_DIR_TARGET}"
+export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc --sysroot=${STAGING_DIR_TARGET} -march=armv4 -mthumb-interwork"
 
 export CPP = "${CC} -E"
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
new file mode 100644
index 0000000..9bc4835
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
@@ -0,0 +1,14 @@
+diff --git a/klcc/klcc.in b/klcc/klcc.in
+index 43d0984..61e9385 100644
+--- a/klcc/klcc.in
++++ b/klcc/klcc.in
+@@ -204,6 +204,9 @@ while ( defined($a = shift(@ARGV)) ) {
+ 	# Libraries
+ 	push(@libs, $a);
+ 	push(@libs, shift(@ARGV)) if ( $2 eq '' );
++    } elsif ( $a =~ /^--([sysroot=])(.*)$/ ) {
++	# Override gcc encoded sysroot
++	push(@ccopt, $a);
+     } else {
+ 	die "$0: unknown option: $a\n";
+     }
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 0209b20..f3e9972 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -16,6 +16,7 @@ SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch \
                                     "
 SRC_URI += "file://klibc-linux-libc-dev.patch \
             file://staging.patch \
+            file://klcc-consider-sysroot.patch \
             "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


