Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 152FE73285
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:41:14 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d196so5084709wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HaAVwXC3NCl47INMw7cdJW4mBAOw/mGzgN4LjxsbYns=;
	b=Dp8bzPQT7eY04XcBF0RVKVK+rJSoDunpYokCJu3J5ObBBnkmVtXCqXbDznLJrai9ot
	gBdC1ejOS/W/5uNDARrp+P1geleIv1tqQOPCmtNRm1M8drtgGqNX2N9u9vJxHa3bPq4l
	ZVr6KDHU9ZCBKcEHfFB2Uz79xehvy9M/YERnHM12227oEMXcEVbROHr51VtgxNlpQH3B
	kwJ35+e053li2F2xWOtjnRo1RtDhbgkFfJEezIiCO4C0mwS19161VgCyip3cuq/dHyGj
	Kq/0d0MM+NJi0f28bd99vBypN7kiveoQAF8/WRhVBkXvEsM57oNYFShNyu9gyi3IBkYJ
	2n/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HaAVwXC3NCl47INMw7cdJW4mBAOw/mGzgN4LjxsbYns=;
	b=QFXHtKDkrEQlnTTQe3Xv64F2BFpEG0eHj4R9cmyFhRx1MNqcHGtIBcDwB9vtMK9iFo
	jAk70qpmDD7Wh7D2XwX/N69SsrICrpWAM8FQc8Hj3nmJ8BGkUgm1a/axlJfLrrb41hu5
	iaN5cWol5xsjPgh5UaTKbuYVB/p0ZpFqbHvJE/gZtN0wqeJGcsWv+FhRt0YGFj5vmvIu
	ia6mBybrWS9c8HHpS261qIQEjgadQHkC8AinFiIafXzAnRsCNKzkffwVqxYeyHFFCIAV
	G1SK2YEBd927toJ9NuxEQ5SsZFvTC2wRFYgYH/T0IskvObFeqPx9Vkquf9JobrOTLJxJ
	CxWA==
X-Gm-Message-State: AE9vXwOTkyrOb6OhEl3HiATdaFWrTicw2FeVQDDQS1Xv9H+tOlLeONjAKYS7+372J7EIcg==
X-Received: by 10.28.145.137 with SMTP id t131mr24262971wmd.110.1472672475216; 
	Wed, 31 Aug 2016 12:41:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	x203sm25168692wmg.0.2016.08.31.12.41.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 12:41:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 21:40:58 +0200
Message-Id: <20160831194106.14065-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160831194106.14065-1-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/11] directfb: add PACKAGECONFIG for inputdrivers
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
X-List-Received-Date: Wed, 31 Aug 2016 19:41:15 -0000

* move tslib dependency to PACKAGECONFIG and don't add it explicitly
  through LDFLAGS, because it breaks the build now when tslib was removed
  from oe-core:
configure:4543: checking whether the C compiler works
configure:4565: x86_64-oe-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=/OE/build/shr-core/tmp-glibc/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/OE/build/shr-core/tmp-glibc/work/core2-64-oe-linux/directfb/1.7.7-r0=/usr/src/debug/directfb/1.7.7-r0 -fdebug-prefix-map=/OE/build/shr-core/tmp-glibc/sysroots/x86_64-linux= -fdebug-prefix-map=/OE/build/shr-core/tmp-glibc/sysroots/qemux86-64=  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -lts -lm conftest.c  >&5
/OE/build/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/6.2.0/ld: cannot find -lts
collect2: error: ld returned 1 exit status
configure:4569: $? = 1
configure:4607: result: no
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE_URL ""
| #define DIRECTFB_VERSION "1.7.7"
| #define DIRECTFB_VERSION_VENDOR ""
| /* end confdefs.h.  */
|
| int
| main ()
| {
|
|   ;
|   return 0;
| }
configure:4612: error: in `/OE/build/shr-core/tmp-glibc/work/core2-64-oe-linux/directfb/1.7.7-r0/build':
configure:4614: error: C compiler cannot create executables
See `config.log' for more details

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/directfb/directfb.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index 46e0838..fc272bd 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
 
 HOMEPAGE = "http://directfb.org"
-DEPENDS = "jpeg libpng freetype zlib tslib sysfsutils"
+DEPENDS = "jpeg libpng freetype zlib sysfsutils"
 
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.gz \
            file://configurefix.patch \
@@ -24,7 +24,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.g
 
 S = "${WORKDIR}/DirectFB-${PV}"
 
-LDFLAGS_append =" -lts -lm"
+LDFLAGS_append = " -lm"
 
 # Workaround for linking issues seen with armv7a + gold
 LDFLAGS_append_arm = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
@@ -33,11 +33,14 @@ BINCONFIG = "${bindir}/directfb-config"
 
 inherit autotools binconfig-disabled pkgconfig
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "linuxinput"
 PACKAGECONFIG[jpeg2000] = "--enable-jpeg2000,--disable-jpeg2000,jasper"
 PACKAGECONFIG[drmkms] = "--enable-drmkms,--disable-drmkms,libdrm"
 PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
 PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
+PACKAGECONFIG[tslib] = "--with-inputdrivers=tslib,,tslib"
+PACKAGECONFIG[linuxinput] = "--with-inputdrivers=linuxinput,,"
+PACKAGECONFIG[noinput] = "--with-inputdrivers=none,,"
 
 EXTRA_OECONF = "\
   --with-gfxdrivers=none \
-- 
2.9.2


