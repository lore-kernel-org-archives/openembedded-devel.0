Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 468736FAEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 21:09:37 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id d1so221727wiv.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 14:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=A18YT5/r9/lYvfy5q6vrLkVKLiOxf85snkYW5ine6NY=;
	b=d315aHcEvOnrCJqUaxuNvnWHSukDk+522zNXKlgIXHBK3xrpAtC3JYzYQq0DXR72b6
	V20Cw0ITCgFBJdGEMZaLmlxOykbUxWo+1uNIIxqYwoMiXG/THaAcl0vhhawKHESke3//
	H6QwKJgC/sXtHzFkocKPLN0CrfxVetvDABWXEI8bxAJ7p9YNSNqJkZm1nOqsFefuteEy
	+6VBBcVv0L7Bd0S/+uEox/4j4twPl9ilmFtYbQWPhoRzQ+REWZsLIlVcTcRv90K8ijct
	ScWX6sfy3dnhNREOFWsU3QQCi7TOozCMV76rz1OIddKnNqVJ0m1WaqYxgYlK73kxFgrH
	DZXw==
X-Received: by 10.180.84.193 with SMTP id b1mr585135wiz.40.1411160978703;
	Fri, 19 Sep 2014 14:09:38 -0700 (PDT)
Received: from mizar.208.67.220.220 ([87.13.50.36])
	by mx.google.com with ESMTPSA id mc20sm3312135wic.2.2014.09.19.14.09.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Sep 2014 14:09:37 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Sep 2014 23:09:29 +0200
Message-Id: <1411160969-15259-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH v2] klibc: klcc: consider --sysroot option and override gcc-cross encoded sysroot
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
X-List-Received-Date: Fri, 19 Sep 2014 21:09:39 -0000

For the recipes built with klcc-cross it is necessary to
pass --sysroot otherwise we default to the one encoded in gcc-cross which
actually is the 'first one' built.
The issue was revealed when building for armv4 after having built for armv5te:
the produced binaries did contain Illegal Instruction (bx lr).

Use ${TOOLCHAIN_OPTIONS} variable to specify --sysroot=${STAGING_DIR_TARGET}

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass                       |  4 ++--
 .../klibc/klibc-2.0.4/klcc-consider-sysroot.patch          | 14 ++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc            |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index ca741cd..f864104 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -4,8 +4,8 @@ DEPENDS =+ "klcc-cross"
 # Default for klcc is to build static binaries.
 # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
 
-export CC = "${TARGET_PREFIX}klcc"
-export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc -march=armv4 -mthumb-interwork"
+export CC = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
+export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
 
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


