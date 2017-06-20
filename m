Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9F771A35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 06:47:15 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id u62so14095893pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 23:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vbOvflmLMQkcrmrdIyFg+442+QNIpy9KIrIXY0eenKI=;
	b=CT/AOOuQUv1prbPG1dXZdoTapdaWT/epYqWaFUjYPkzpu/5pEQ49sRRbfjUd2nhyvC
	ESGquZT+889bt8TvXSupOg+H2oLg6OjJiK9OXDyzmdoxaqCe3g+08WqY18vWbucsG5Dt
	ItcEPEh5+R61KrZePD8syZUAWGv/yIELwdIylrXPb8F3xh976IGkUwIpABp20yiOQjaC
	CvPgg7v6axxe6lWVnYcktrBneUekLZZ/cFW0Lgys85ZM4Y2mlu1rrhQIwAg8JCZmqwhe
	fnU5jufafnD4PKrChUZbutdW+DT7n4M+EWBGu/XG6ijvu7jzmYnhz8ZG8x/IJ3HKvObC
	MOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vbOvflmLMQkcrmrdIyFg+442+QNIpy9KIrIXY0eenKI=;
	b=cegjNkwR4rmkFC6cdKARj0nrFSZULE8nbYhKM/uGWxJMrMUhq9hZMvg9ce10EaSyx3
	M65ysli6q5w9pMpPfTL1CrkBUq13/Bochaa8ot752HZYwXQZ1//O5vKK6cXMhtsTyibP
	lAdH774C/CSofsqXeyjcWMqUaPMEmOchoB6/GdsVMOsABk0uDTCnlhDqEnL1Eko6m2o4
	RZboVIoXR85vhHSigqPx2PJD3TmnifPDN9hh0+9dJXFBVf6huhmifC80jy9Wt9E2YrGy
	4oNGAplIkjldbbOoag4t8V1IelozP//VFb5fcY9YfFcn+5MKYTJrHoXFTToosRoi53s0
	61Tw==
X-Gm-Message-State: AKS2vOyeI4IH9vfisX7q7YZ1FHd7KClsbuHYphxLTwY6ANUkvagIKjlS
	5QV0LcsZ7ZA1/QUu
X-Received: by 10.99.50.135 with SMTP id y129mr30633506pgy.238.1497941236253; 
	Mon, 19 Jun 2017 23:47:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	x27sm28180033pfe.113.2017.06.19.23.47.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 23:47:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Jun 2017 23:47:00 -0700
Message-Id: <20170620064701.28084-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [meta-filesystems][PATCH V2 1/2] xfsprogs: Remove .la files in ${libdir}
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
X-List-Received-Date: Tue, 20 Jun 2017 06:47:15 -0000

Delete .la files and remove ${libdir} if empty
Fix build with musl

Use --ignore-fail-on-non-empty with rmdir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fine-__-prefixed-version-of-intXY_t-types.patch | 58 ++++++++++++++++++++++
 .../recipes-utils/xfsprogs/xfsprogs_4.10.0.bb      |  5 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/0001-define-__-prefixed-version-of-intXY_t-types.patch

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-define-__-prefixed-version-of-intXY_t-types.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0001-define-__-prefixed-version-of-intXY_t-types.patch
new file mode 100644
index 000000000..951a1442c
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0001-define-__-prefixed-version-of-intXY_t-types.patch
@@ -0,0 +1,58 @@
+From 2b4714123cdecb558babb76074d0ab945bf5b177 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Jun 2017 18:59:10 -0700
+Subject: [PATCH] define __ prefixed version of intXY_t types
+
+This is required since musl does not define them
+unlike glibc
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/linux.h | 29 +++++++++++++++++++++++++++++
+ 1 file changed, 29 insertions(+)
+
+diff --git a/include/linux.h b/include/linux.h
+index 6a676ca..6976d83 100644
+--- a/include/linux.h
++++ b/include/linux.h
+@@ -40,6 +40,35 @@
+ # undef fsxattr
+ #endif
+ 
++#ifndef loff_t
++#define loff_t off_t
++#endif
++#ifndef __uint8_t
++#define __uint8_t uint8_t
++#endif
++#ifndef __uint16_t
++#define __uint16_t uint16_t
++#endif
++#ifndef __uint32_t
++#define __uint32_t uint32_t
++#endif
++#ifndef __uint64_t
++#define __uint64_t uint64_t
++#endif
++
++#ifndef __int8_t
++#define __int8_t int8_t
++#endif
++#ifndef __int16_t
++#define __int16_t int16_t
++#endif
++#ifndef __int32_t
++#define __int32_t int32_t
++#endif
++#ifndef __int64_t
++#define __int64_t int64_t
++#endif
++
+ static __inline__ int xfsctl(const char *path, int fd, int cmd, void *p)
+ {
+ 	return ioctl(fd, cmd, p);
+-- 
+2.13.1
+
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
index f7e10cdfb..50ab9872e 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=102f7fec3d53c7c8f0b7baf9bf9d76a8"
 DEPENDS = "util-linux util-linux-native"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://link_needed_libs.patch \
-"
+           file://0001-define-__-prefixed-version-of-intXY_t-types.patch \
+           "
 SRC_URI[md5sum] = "ddbb04493addf014db07a7e2b96b2804"
 SRC_URI[sha256sum] = "d8cb9ab2c686699d37914354ce3992b4aff3677093cbce06ad18bf798da8a8a7"
 
@@ -54,4 +55,6 @@ do_configure_prepend () {
 
 do_install_append() {
         oe_runmake 'DESTDIR=${D}' install install-dev
+        rm ${D}${libdir}/*.la
+        rmdir --ignore-fail-on-non-empty ${D}${libdir}
 }
-- 
2.13.1


