Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id EA2B27E9FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 14:48:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s3so1130248wms.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jul 2019 07:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5AFQ+yplpft1m4lMIRaO9u9jYAb1DIJwGnjxbjLcja8=;
	b=bgWQSc9c7CnzQnnG1walrWg7/tDUQFoIQau8816FBJK8W6jvOqgWJm3wWX1EkLsRlv
	jK7TIixFTEhw9H/PlqOS4VF49x6wMCD2b1wOGjm0OjiUeS/t1YqEGHARzDogzWZna9AT
	Pag4BTGvHC26BH1znxaFdXl5hWEDVh2JmbEp77nbVKZFtwz/aqnJICFyA44iOiZWZPYv
	yG07NHNuo92FhRyrKVF4Lr0w2lZMeKIQbZp5LMNv/jDsjufnjw7rqf+m+/O5PbUTZOup
	7aF1f0EFIRUw+XnCFvwmdvdgacx9RK6iNqVz2JSyrTQRv0b3ReJjtJjK3CFG6eKQbYNt
	+wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5AFQ+yplpft1m4lMIRaO9u9jYAb1DIJwGnjxbjLcja8=;
	b=gVEVB1m4kQ1yTEkWWeqwDzwNL/fOOxT1DE4gQkJYKY8ZjNZPuMN/kWcQQukBQsSr6J
	am4t2zbvKRufm1ggTIoUL7XDdJnCGeQ0ejgrZ2oXETZ9QWvkjwdFPTpdtI9wYhVSNfUS
	3Y+ma+2XoFTn+NWOut6ZJG5a1eoKNvwS3OXfMLafCMavaDJFtj93DMF7742K/QO65JdN
	uqKkx9aW9oejp8QIygLebg5EY5t4oVRJXLo8ProAXtlJr8n4zlAiNPE+Tzy8pgxgp1lf
	o3A8wrP66GiOvqFI/rjN8ltGzaHPBwXOe5MHReR6h5aFItQl46w+0zuq/faCHSMfL/Zk
	rluA==
X-Gm-Message-State: APjAAAVKVXwCE/s+UVHbnJUTT4uTNIcw0DzvBHXAKM64iyV+WQwXBfFi
	mcjZb/R1b8TX3JSFyalMatyOzutV
X-Google-Smtp-Source: APXvYqybW3dYAWsm16eERY1+FxOvCWj/lV9fINCiu7kcFbRQZ2DbfP2B6XuDavp/nyGVGjHVivWioQ==
X-Received: by 2002:a1c:f918:: with SMTP id x24mr3534212wmh.132.1562078898360; 
	Tue, 02 Jul 2019 07:48:18 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	o20sm34473790wrh.8.2019.07.02.07.48.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jul 2019 07:48:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2019 14:48:14 +0000
Message-Id: <20190702144816.7520-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/3] safec: drop aarch64 from COMPATIBLE_HOST
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
X-List-Received-Date: Tue, 02 Jul 2019 14:48:18 -0000

fails for aarch64, I've noticed it in world build for raspberrypi3-64:

aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type
  -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter -Wno-error=missing-field-initializers -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot= -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native= -c ../../git/src/wchar/wcscpy_s.c  -fPIC -DPIC -o wchar/.libs/wcscpy_s.o
{standard input}: Assembler messages:
{standard input}:161: Error: unknown mnemonic `memory_barrier' -- `memory_barrier'
{standard input}:389: Error: unknown mnemonic `memory_barrier' -- `memory_barrier'
{standard input}:649: Error: unknown mnemonic `memory_barrier' -- `memory_barrier'
aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type
  -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter -Wno-error=missing-field-initializers -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot= -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native= -c ../../git/src/wchar/wcsncpy_s.c  -fPIC -DPIC -o wchar/.libs/wcsncpy_s.o
aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type
  -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter -Wno-error=missing-field-initializers -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot= -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native= -c ../../git/src/wchar/wmemcpy_s.c  -fPIC -DPIC -o wchar/.libs/wmemcpy_s.o
../aarch64-webos-linux-libtool  --tag=CC   --mode=compile aarch64-webos-linux-gcc  -mcpu=cortex-a53+crc -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -I../../git/include  -I../include -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type
  -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter -Wno-error=missing-field-initializers  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0                      -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0                      -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=   -c -o wchar/wscanf_s.lo ../../git/src/wchar/wscanf_s.c
../aarch64-webos-linux-libtool  --tag=CC   --mode=compile aarch64-webos-linux-gcc  -mcpu=cortex-a53+crc -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -I../../git/include  -I../include -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type
  -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter -Wno-error=missing-field-initializers  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0                      -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0                      -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=   -c -o wchar/vfwscanf_s.lo ../../git/src/wchar/vfwscanf_s.c
Makefile:1432: recipe for target 'mem/mem_primitives_lib.lo' failed
make[2]: *** [mem/mem_primitives_lib.lo] Error 1
make[2]: *** Waiting for unfinished jobs....

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/safec/safec_3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb b/meta-oe/recipes-core/safec/safec_3.4.bb
index d55d081f34..b4c125faf4 100644
--- a/meta-oe/recipes-core/safec/safec_3.4.bb
+++ b/meta-oe/recipes-core/safec/safec_3.4.bb
@@ -10,6 +10,6 @@ S = "${WORKDIR}/git"
 SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
 SRC_URI = "git://github.com/rurban/safeclib.git"
 
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm).*-linux'
 
 RDEPENDS_${PN} = "perl"
-- 
2.17.1


