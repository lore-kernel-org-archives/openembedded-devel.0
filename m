Return-Path: <cengic@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3C860B43
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 17:45:09 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id p2so3046607ile.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 10:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=vnMsshhScrNg9mr3UYteyeOw4vkh8nprIFCRSGQReS0=;
	b=PznB2X0LSv7Sg0VyaoaLrKoNKKjaCVnZz7qgQWGKRNeNiO4CbHfT3XPkpVvn0BKdtB
	Y8xRipNXhjmZW0+MAvVX3taU886R4DPRHknKVxUwnZr0uBqAOAzaaL8tpPLjurVzx99Q
	drPAtWuAO+4Oc7ws1xmTajTO5YJ6HzlIEkSMV0VLgrpCVBPcw/w7z0z+b0z2+RYSWstH
	FQHoL180j0UovEK3/qak3p34hmpOuNoHKB2ORoehos/bJJOfraOud0uBR+qebRwK1HBZ
	8eK40bpqmG7JTskzFdzP0yeJAAb+uL3JDrRHvj+uT9iX4gwGXxaxH2YXSxONUrLXiFvY
	xSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=vnMsshhScrNg9mr3UYteyeOw4vkh8nprIFCRSGQReS0=;
	b=WgbUSGm4OYbtVQk/jP2bA4rPzmNkIXjqMR/iscUC0b8aahZqCdGZXLjIgS1kLdftdg
	dexTaSAfGvDXVDlMDgXHdiaDPCydUCuyAMvzuFQtn7Oe8hNT4OwGFYmT5k2GIVDd1drs
	agdlZ217Njn/GPwaurLCSk4yy8i2Va9txHPfmrQ27jCPgyscBrifkv49wcUEGFQDA9Kl
	B/xdGmsV1e4uQJ+CzTZM1cPJOJjcQwexHlPxa1F292iNxlADr1zmTmXaU3ymW7xYr36f
	BFCZixX82F+h5vcLUdeUKHqm9kVI/M04Yppobq2Dta8o5/xwlosgdjhkJwn/R0unP1Hq
	E/Mg==
X-Gm-Message-State: ANhLgQ1r/JwiirmfE5ok75wsz6hcH3ZUNwa9rDTHQI6ZeDS4o6C9Tc8M
	UkbslixV4JNJKSzSmZg3ImLJur6VHRRosRBBqPAoNerV
X-Google-Smtp-Source: ADFU+vswMPR1R5117tZ1Xodcy4hB4v1KaMBKbr6eBLlmBCX/VVeGvZ+Pm6QpKCwdoklCeB4+Q7AVJLUcqvb4c9Yl+y0=
X-Received: by 2002:a92:359b:: with SMTP id c27mr4200022ilf.148.1584639910044; 
	Thu, 19 Mar 2020 10:45:10 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?R29yYW4gxIxlbmdpxIc=?= <cengic@gmail.com>
Date: Thu, 19 Mar 2020 18:44:52 +0100
Message-ID: <CACT7hb=oPqWOCet1vzKT0i75=GRzRPpgHrfFEvK1aBTUD3Kx6A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe][PATCH] crash: fix crash-cross build on x86_64
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
X-List-Received-Date: Thu, 19 Mar 2020 17:45:09 -0000
Content-Type: text/plain; charset="UTF-8"

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

