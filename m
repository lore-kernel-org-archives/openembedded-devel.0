Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id C041F7F987
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:10:52 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id q8so3481470ljb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jan 2020 03:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Li6X10HGnfQkQpd7ctIuGJe7eAcNixL/iMjnonghhYI=;
	b=eE7aIidETYH6RS9Z7NnMGLLkQfWsq4XqyZ4pLHxP7BxPIjfa+sdWsyreimIy2zeuH/
	QcEbnd9dmtToid3Beb4RzIvEYQ3bbNBXqJbL0mWcQ9csnr4pnJB7OO+/f4qVN3BGHgBz
	FWBZ5UeCJi5QyuQ7LqfyIRtkMtRphjghhLPRzphp6+5e6nsqkyRT8Yu19E6EF//8Jglj
	+bGJt0uuLzDpNCRdDqIwxd3sr41uMhMQ9Zd+zd9fF9JZAQh8yQsdpM43kvUPjFhhuv1x
	54IMz0gx4GDd4og7UXevovW9RJawlpdOGioc116vtMYdlp1TE0SjUk7+16ZD1DHH7dZP
	rnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Li6X10HGnfQkQpd7ctIuGJe7eAcNixL/iMjnonghhYI=;
	b=NPbi/LUUqMrSOD3zgQ0Ujqk28SxCITVDkVmPU3Q7iBu+zb09YbqHhBfumugGO1JU98
	xkd4P7bh0v6uWt2KPEYbAbDxUeEw/w/hQ+rHrSwRJ2k0Jh0j8vh0TLLJrJRicOwYZ9jT
	NONKDUcUJbkremrGsXgyXSFtQEVDABhtQPYgWQlvxq+kNFJRZ6Wzy64b+9IiidLr8jjQ
	nuAA8azxc/DIn0CJpe10MCEilKCvhtS+bzNmooxQj2sH+ij47v61apMmVTV0XYg9q9WY
	0L2tSBfOXMGq6htSrAo6fun5G8SNMdhJzbjtKcnq2JckaLd09kuD9pYsaHbByYPGG3U0
	p0HQ==
X-Gm-Message-State: APjAAAUbIvRE/3o55lBfaTdXe5nil79xe2qc5OGyPKGHC5ibe6h86KYu
	XmAbjMDjEhJtXIiu3vRX+zNnaY1/
X-Google-Smtp-Source: APXvYqy4hrrIpQ4YA8tl1qDbOz9aSj4vlfVk0zzduIHGAV6mNGFj5bb+4JKboQMFdXy1oKh8CPYjXQ==
X-Received: by 2002:a2e:b1d4:: with SMTP id e20mr7515288lja.27.1580037052850; 
	Sun, 26 Jan 2020 03:10:52 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	r10sm6520573ljk.99.2020.01.26.03.10.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 03:10:52 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Jan 2020 12:10:35 +0100
Message-Id: <20200126111035.273501-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-java][g0hl1n/wip-jdk8u242ga][PATCH] Fix building openjre-8 242
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
X-List-Received-Date: Sun, 26 Jan 2020 11:10:53 -0000
Content-Transfer-Encoding: 8bit

Hi Richard,

I need something like this in order to build on my Fedora 31 host.
I'm using master branches of bitbake, oe-core, meta-openembedded.

Good thing is the crash I reported earlier seems to be fixed.

Cheers,
Jacob

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/openjdk/openjdk-8-release-common.inc   |  1 +
 recipes-core/openjdk/openjre-8_242.bb               |  2 +-
 .../openjdk/patches-openjdk-8/fix-build.patch       | 13 +++++++++++++
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/fix-build.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
index a8a653b..bd1b9c0 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -9,6 +9,7 @@ PATCHES_URI = "\
     file://0008-autoconf-fix-shark-build-common.patch \
     file://0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch \
     file://0010-autoconf-remove-shell-variables-from-autoheader.patch \
+    file://fix-build.patch \
     ${HOTSPOT_UB_PATCH} \
     file://2001-jdk-comparison-between-pointer-and-integer.patch \
     file://2002-jdk-Allow-using-a-system-installed-libjpeg.patch \
diff --git a/recipes-core/openjdk/openjre-8_242.bb b/recipes-core/openjdk/openjre-8_242.bb
index 4ed2e6b..2c8a6a5 100644
--- a/recipes-core/openjdk/openjre-8_242.bb
+++ b/recipes-core/openjdk/openjre-8_242.bb
@@ -11,7 +11,7 @@ do_install() {
     cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
     chown -R root:root ${D}${JRE_HOME}
     install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
-    find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
+    [ -d ${D}${JDK_HOME} ] && find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
 }
 
 FILES_${PN}_append = "\
diff --git a/recipes-core/openjdk/patches-openjdk-8/fix-build.patch b/recipes-core/openjdk/patches-openjdk-8/fix-build.patch
new file mode 100644
index 0000000..e35d0eb
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/fix-build.patch
@@ -0,0 +1,13 @@
+Index: jdk8u-jdk8u242-ga/jdk/make/gensrc/GensrcMisc.gmk
+===================================================================
+--- jdk8u-jdk8u242-ga.orig/jdk/make/gensrc/GensrcMisc.gmk
++++ jdk8u-jdk8u242-ga/jdk/make/gensrc/GensrcMisc.gmk
+@@ -76,7 +76,7 @@ $(eval $(call SetupNativeCompilation,BUI
+     INCLUDE_FILES := $(GENSRC_SOR_SRC_FILE), \
+     LANG := C, \
+     CC := $(BUILD_CC), \
+-    LDEXE := $(BUILD_LD), \
++    LDEXE := $(BUILD_CC), \
+     OBJECT_DIR := $(GENSRC_SOR_BIN), \
+     OUTPUT_DIR := $(GENSRC_SOR_BIN), \
+     PROGRAM := genSocketOptionRegistry))
-- 
2.24.1


