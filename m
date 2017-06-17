Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6617197B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 17:21:50 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e187so1796368pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tViz5b15ihlCYZJkc3GCD3Gr4BR+ZFq8GCFyvKtNiE8=;
	b=iaki/jJVcn+MjHbcbzw9F3XVGNSZ1I2cvhX0BdNO3BMml157FkksUSW9XxLUS9q7Ii
	W8kzTYh84bvXtSmFLxwbdZS0Fpyhk0w6qbJveKJ47hxcKS83L2WK4C8QFnY6FhsTYu0K
	v9C7i00HKUDwU4e/vgRBlYkU5DCa8kmGN+WifO4WxIOgeyyD/OeMDNzcgmYOi5nAAOWM
	+p/NxBPt0CQ9ERUTSXh37gp02l4G/sXAe6gNcvLOnzpzc5vIeC1pJ4Di83RaE30Z372I
	w9Vx9aR+L8AyhofdFs1UB8yKBwxALYzk7vNczHUxey2EAn1D578qK7Th7wzAc+ed9Q6F
	AgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tViz5b15ihlCYZJkc3GCD3Gr4BR+ZFq8GCFyvKtNiE8=;
	b=YX8J/W43nU0VrA+Xc+d/w9EGdducfNeEIf7bPmK5luLY0cDkPS0ueWCc0krz3XlFMJ
	01qDec9uk/wU/WAlbJwdk0rto3w8PL5uPu9/aflS+CYHTqg/nr++gbzoqvDAXMCbeGpw
	Mk6/RD1t97YFsR3WDsRnGJr3AGy1aq6HFduhCfV71LXnKdRkio9N8YMRVqCn67A3xGi8
	zoLi3RP0ArtcM6EqSVTstV0vFqC78g4p+7e8Lfkv26h0iMvp1f395cXMfXo0F4xrinRq
	C6SlmS5bM7LxHVUgwlQCi18JIlKonteD39jYZU+FGfcMTRkHoqa1vvnQ1Z3+1l7p8a8L
	iVaw==
X-Gm-Message-State: AKS2vOxEB1J1bZPLGQNW12G4r5i9ClgvCwc2EvkKJn3gMoW+INQ4qFXp
	+u9WS3MYZmSXyShQ
X-Received: by 10.98.112.137 with SMTP id l131mr17226022pfc.186.1497720111783; 
	Sat, 17 Jun 2017 10:21:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	o12sm12201226pfi.9.2017.06.17.10.21.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Jun 2017 10:21:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jun 2017 10:21:34 -0700
Message-Id: <20170617172142.1311-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [meta-filesystems][PATCH 1/9] xfsprogs: Remove .la files in ${libdir}
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
X-List-Received-Date: Sat, 17 Jun 2017 17:21:52 -0000

Delete .la files and remove ${libdir} if empty
Fix build with musl

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
index f7e10cdfb..a9aee31b7 100644
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
+        rmdir ${D}${libdir}
 }
-- 
2.13.1


