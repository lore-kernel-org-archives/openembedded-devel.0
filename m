Return-Path: <cengic@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C37F60F9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 18:30:08 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h131so3374481iof.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 11:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=fITU+ysnlsJ1+08ZOs5Kjqgum+hLe/4Dq0UKFMjU4m0=;
	b=BsDBaiBH8iOyQX786pW7aGBLIKUITC9K/wt7XXchMY31upNo3w+WzSPhmLnehEnEbs
	28H7VEWJBlh74BPV3V3/WhgtBJyAouaylNRALTHwdn5GkCdMmJXA7Q8Femu6MMhGNnVy
	enWWBBvHM05BryNIsf24JyvYMnU5sGedpyMuqLgmbNE77uICB7fyZ5iBNCtEgWMKyYWd
	rDZJljjppn9S8f14HuWlc0wXjmNRs8PywCUHFU6H8ANNX3E/lQ3rTwBV/eQe6KxyTKfx
	GtpAY0InYsPP+4gU+C0OCeO1xFdgpqY/BFXbcoSTi8JzKBIcMouCav2oLQrvulLjTMqi
	r4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=fITU+ysnlsJ1+08ZOs5Kjqgum+hLe/4Dq0UKFMjU4m0=;
	b=WLAsbV3W7I4g8oEWufX3i26cKzIXkegTdydodupH7xrx3+wq6xxwwMlafAcCYkDoHs
	qgkIzc4r2hO1TUNQdsJYegZQZ2hfuUEJIfmUxs6uVK+PWNApKjqjqopEa9HKYNHBnvw4
	vMwA6+uZGt146s/zF/i39cpuHrsFwfoujVwnHVFPIf54mTvOzbldRfp+gr/x+OfeVKsz
	7PNdcEdJ5qfqJtoSZFMaUQ0vS/HPIwOdhXW13M6xS0IMJ3a28iOdxmFVT7QmZVp6j6MY
	9PfKbpSZw7006tcLSe3qlfgn6Gr85DKi6uMfSjbi4ot+jRkwagDXU6lV3s4tFi6S946D
	Aybg==
X-Gm-Message-State: ANhLgQ1IsD0vvYXORY3HGxbKs3Adc4Ppifc0eOW5Y3SRNoABgYYFx4zP
	qLeW9snaMK1MlOuAhkxpDC4hqgFUp3+WO1toBmDhZRRJ
X-Google-Smtp-Source: ADFU+vvlgc0kJ22XhxLmeLvRbN4blteCV+jp2ceFp02g/ZffxLAgSqSnMd1bX25nhica3k+JQv2jetrT9FdtnMVdXG0=
X-Received: by 2002:a05:6638:347:: with SMTP id
	x7mr4596883jap.38.1584642609810; 
	Thu, 19 Mar 2020 11:30:09 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?R29yYW4gxIxlbmdpxIc=?= <cengic@gmail.com>
Date: Thu, 19 Mar 2020 19:29:52 +0100
Message-ID: <CACT7hbnzmOgSGkv1MrtpBJSBw=8fUUAh+gpbZtku_rpdCn6Tuw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe][PATCH v2] crash: fix crash-cross build on x86_64
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
X-List-Received-Date: Thu, 19 Mar 2020 18:30:10 -0000
Content-Type: text/plain; charset="UTF-8"

From 3246fc2c813531a6f279e4d4a2071e8af35bdcf5 Mon Sep 17 00:00:00 2001
From: Goran Cengic <cengic@gmail.com>
Date: Thu, 19 Mar 2020 00:11:52 +0100
Subject: [PATCH] crash: fix crash-cross build on x86_64

Remove -m32 from CFLAGS even for -cross recipe. Also remove
${GDB_CONF_FLAGS} from GDB_TARGET variable (that is passed to the gdb
configuration) since the use of GDB_CONF_FLAGS is removed by
0001-cross_add_configure_option.patch.

Signed-off-by: Goran Cengic <cengic@gmail.com>
---
 meta-oe/recipes-kernel/crash/crash_7.2.8.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
b/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
index 61cc71f..5fc25f4 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
@@ -10,7 +10,7 @@ SECTION = "devel"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"

-DEPENDS = "zlib readline coreutils-native"
+DEPENDS = "zlib readline coreutils-native ncurses-native"

 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/crash-utility/${BPN}.git
<http://github.com/crash-utility/$%7BBPN%7D.git> \
@@ -49,9 +49,7 @@ EXTRA_OEMAKE = 'RPMPKG="${PV}" \
                 '

 EXTRA_OEMAKE_class-cross = 'RPMPKG="${PV}" \
-                            GDB_TARGET="${BUILD_SYS} \
-                                        \${GDB_CONF_FLAGS} \
-                                        --target=${TARGET_SYS}" \
+                            GDB_TARGET="${BUILD_SYS}
--target=${TARGET_SYS}" \
                             GDB_HOST="${BUILD_SYS}" \
                             GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
                             '
@@ -59,10 +57,6 @@ EXTRA_OEMAKE_class-cross = 'RPMPKG="${PV}" \
 EXTRA_OEMAKE_append_class-native = " LDFLAGS='${BUILD_LDFLAGS}'"
 EXTRA_OEMAKE_append_class-cross = " LDFLAGS='${BUILD_LDFLAGS}'"

-REMOVE_M32 = "sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define
TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g'
${S}/configure.c"
-
-REMOVE_M32_class-cross = ""
-
 do_configure() {
     :
 }
@@ -79,7 +73,7 @@ do_compile_prepend() {
     esac

     sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
-    ${REMOVE_M32}
+    sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define
TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g'
${S}/configure.c
     sed -i 's/&gt;/>/g' ${S}/Makefile
 }

-- 
2.7.4

