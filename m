Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8993.1792456233347149181
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 17:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lAFncapI;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so4573531eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 17:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456233; x=1793061033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wquvnLFDrqKO/E3grZ4SFoQqgEEIH2SDwvkeLcGIcQY=;
        b=lAFncapIIuNLKfdsx18V41WluPfhUtZ1g/lNcmGDKdGeD9oNnUqT6TdzoXYHH9ID9W
         CpVSLCbNY0ilqKkKyuAPkk3A88GYo5C1tcGxI42KZaivsfWl/M/fbfBWeScHlUz3iZcz
         mmzlmDAYvw+vXS2C+ZzeE/oTqzXxw6v0G+qLHglR0o6eC0ijPLr3+aQvW8WqEIVuGfRG
         u9lt+Jy5suPBJURNMSS3Ox65DxgaQ7zMEGgvgzwNtgsFkxefb5Er+n2/ntcN5HAR3HFZ
         DSmK1YNlTFuXBhs5qV9RGriZg2kU96PdrCJyljcUmPj/FPU4Cd96Q/ccubYkbUoi/0Cc
         MP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456233; x=1793061033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wquvnLFDrqKO/E3grZ4SFoQqgEEIH2SDwvkeLcGIcQY=;
        b=x2sizEd37gPc6o8B7RfACl23NwRj606xMW0gJp3BXIxNB9cnf9mE2V8tMQicCt/pvu
         MLpJ0NdvOsy9t9M9M8nJflvjQvSXqi2hw/l3dBmga5wNEOAKKJIkSaNFOfPtQPaLN3XI
         J0GYCAn9BEeEAmzLs46SJJIM0bCrhAbSBHXkDNu/Kne/RpQ2iqD1ej1LJL8X44D6O7Ir
         Biwq3QfAQCA+qDnkCSb9NFWhrW44FgJDvDCot1qGvwSGwIxx062LZOwFeSaQfOb9LU4x
         qELRiudE9zD+EjYW1iQn7Kvhkf6gxtHiozcQO0+qAVwauEIRJFfb6I/ZEoPqXVhT6HO6
         375Q==
X-Gm-Message-State: AFq9FYKGs2jUKU3/JPNKFL7yArIgbhWvC9o8VnvTXfKloTGRqgek9K8T
	3fgwcu7dXGUIl89Gy8nf0N6lqK1LOtGxFuhLC/6GuZd5dBriqHJWpqCaUvglnKvezvU=
X-Gm-Gg: AYBFou265zMVdnYMSq5Y9rKHK6WB+sYFvNNmjjPoVKNvC0vn4HV0IF/8XS4f2ZxY8b3
	GO6Zi0XwiWxRyi9AVQG52BH/JDsZmE5ZE1N+j3W3otfSVF/OU1M0dIlVH3gMLrt0uNUYrHzIeaP
	uDYv9yJm4uAzESlIS4W4uo+pht115JMRgczMdd3o+vJKUfFzIPF1ZlIiTOYJhEYT4wUwzbr53Vp
	qT6GtTIFFJUES9s5ic9TXiDY99HztY8PFuN+4DXwEYHgLEq6X7OUpNYuIW6hlzvG6MU1xwF1q0m
	j+clVYXu6X7fWvGrOZ3tgdo7clW5sM+lKWMhXBBj+amY7vGCDrB8/C+QyswqY/mKbvHpzGgGxgP
	FKy9a/lljbCpMHZnqMSjBTVktGlos/TaldnHENWNHtVtcekvkJRm8Q9s5ADm7tPMav0RyI0iWNF
	xDcTzUdp9bumsc/BfjSQhHgy8T1K7IXREZNfkJ+M2iUT2gJ2qlFuZclrOqRp/PL9X01WZ0RTwB2
	9ByJtmMEFDtvHj+Exuiwv6L0yU5+/BhIsn5+JnEKqPixu3zkh9j6FQBSPbC0KExdgParooJBXX6
	b7c+6Pc1DVnH5SAYHJMQF6zM+8FJdrMJcMs5ijrU8cp/4Pj4oU+nlj06DaOCYsQJKibnjW5gbZf
	HhcgHMDtgunxCjk7UpQEyfNOgRHOBUQ31NshPQx67oidRYA839Z/AC+Cau8PhH7sGnnAFezJLxD
	yz2N9g3/lT9kAEgCTvHq5cj+ggJ7QyoS5/CvSJanA1+bXngg==
X-Received: by 2002:a05:7301:6447:b0:358:eccb:af7c with SMTP id 5a478bee46e88-361a312cb5emr17687067eec.33.1792456232319;
        Mon, 19 Oct 2026 17:30:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm35596579eec.13.2026.10.19.17.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:30:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 5/5] tiobench: Allow large file support with musl
Date: Mon, 19 Oct 2026 17:30:22 -0700
Message-ID: <20261020003022.1913623-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020003022.1913623-1-khem.raj@oss.qualcomm.com>
References: <20261020003022.1913623-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 00:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131151
Content-Type: text/plain; charset="utf-8"

USE_LARGEFILES requires _LFS64_LARGEFILE, which musl does not define
because its off_t is always 64-bit, so the build fails on musl:

  ./constants.h:36:2: error: no large file support available, remove -DLARGEFILES from makefile

Add a patch that only requires a 64-bit off_t in that case. It also
replaces the %L length modifier on integer conversions with the standard
%ll, which musl's printf requires.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...1-Allow-large-file-support-with-musl.patch | 90 +++++++++++++++++++
 .../tiobench/tiobench_0.4.2+git.bb            |  4 +-
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench/0001-Allow-large-file-support-with-musl.patch

diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench/0001-Allow-large-file-support-with-musl.patch b/meta-oe/recipes-benchmark/tiobench/tiobench/0001-Allow-large-file-support-with-musl.patch
new file mode 100644
index 0000000000..632553c066
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench/0001-Allow-large-file-support-with-musl.patch
@@ -0,0 +1,90 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 18 Oct 2026 19:00:00 -0700
+Subject: [PATCH] Allow large file support with musl
+
+USE_LARGEFILES requires the libc to define _LFS64_LARGEFILE and errors
+out otherwise. musl does not define it: its off_t is always 64-bit and
+lseek64(), mmap64() and friends are aliases of the plain interfaces.
+So the build fails on musl:
+
+  ./constants.h:36:2: error: no large file support available, remove -DLARGEFILES from makefile
+
+When _LFS64_LARGEFILE is missing, only require a 64-bit off_t.
+
+Also replace the %L length modifier on integer conversions with the
+standard %ll. %L is only defined for long double, and musl's printf
+rejects it with integer conversions.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ constants.h       | 9 +++++++--
+ test_largefiles.c | 6 +++---
+ tiotest.c         | 2 +-
+ 3 files changed, 11 insertions(+), 6 deletions(-)
+
+--- a/constants.h
++++ b/constants.h
+@@ -33,7 +33,12 @@
+
+ #ifdef USE_LARGEFILES
+ #ifndef _LFS64_LARGEFILE
+-#error no large file support available, remove -DLARGEFILES from makefile
++/*
++ * musl does not define _LFS64_LARGEFILE: its off_t is always 64-bit and
++ * the *64 interfaces are plain aliases, so only require a 64-bit off_t.
++ */
++_Static_assert(sizeof(off_t) >= 8,
++	"no large file support available, remove -DLARGEFILES from makefile");
+ #endif
+ #endif
+
+@@ -83,7 +88,7 @@
+ #define TIO_ftruncate  ftruncate64
+ #define TIO_pread      pread64
+ #define TIO_pwrite     pwrite64
+-#define OFFSET_FORMAT  "0x%Lx"
++#define OFFSET_FORMAT  "0x%llx"
+ #else
+ typedef off_t          TIO_off_t;
+ #define TIO_lseek      lseek
+--- a/tiotest.c
++++ b/tiotest.c
+@@ -1411,7 +1411,7 @@
+
+ 			if(crc != d->bufferCrc)
+ 			{
+-				fprintf(stderr, "Thread(%lu) consistency check failed at offset %Lu\n", d->myNumber, (long long unsigned int)offset);
++				fprintf(stderr, "Thread(%lu) consistency check failed at offset %llu\n", d->myNumber, (long long unsigned int)offset);
+ 				return -1;
+ 			}
+ 		}
+--- a/test_largefiles.c
++++ b/test_largefiles.c
+@@ -57,7 +57,7 @@
+         exit(1);
+     }
+
+-    printf( xstr(TIO_ftruncate) "()'ing large test file to size %Lx\n", LARGEFILE_SIZE);
++    printf( xstr(TIO_ftruncate) "()'ing large test file to size %llx\n", LARGEFILE_SIZE);
+     rc = TIO_ftruncate(fd, LARGEFILE_SIZE); /* pre-allocate space */
+     if(rc != 0)
+     {
+@@ -67,7 +67,7 @@
+
+     for(offset = (TIO_off_t)0; offset + CHUNK_SIZE <= LARGEFILE_SIZE; offset += CHUNK_SIZE) {
+
+-        printf(xstr(TIO_lseek) "()ing to offset %Lx\n", offset);
++        printf(xstr(TIO_lseek) "()ing to offset %llx\n", offset);
+         offset_ret = TIO_lseek(fd, offset, SEEK_SET);
+         if (offset_ret != offset) {
+             perror("Error " xstr(TIO_lseek) "()ing");
+@@ -105,7 +105,7 @@
+         }
+         data = 0;
+
+-        printf(xstr(TIO_mmap) "()ing chunk of size %Lx at offset %Lx\n", CHUNK_SIZE, offset);
++        printf(xstr(TIO_mmap) "()ing chunk of size %llx at offset %llx\n", CHUNK_SIZE, offset);
+         file_loc = TIO_mmap((caddr_t )0, CHUNK_SIZE,
+                  PROT_READ | PROT_WRITE, MAP_SHARED, fd, (TIO_off_t)offset);
+         if (file_loc == MAP_FAILED) {
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb
index b42982686c..c773a8cc53 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/mkuoppal/tiobench"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"

-SRC_URI = "git://github.com/mkuoppal/tiobench.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/mkuoppal/tiobench.git;protocol=https;branch=master \
+           file://0001-Allow-large-file-support-with-musl.patch \
+           "

 SRCREV = "11c965c8c0f37927423fb4ea590df6c093cf2f1e"

