Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104FDC43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:55 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.2413.1654283989749368446
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WRqci4Oz;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id g184so7945808pgc.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SdR19qocfp0tYoWxdAqvGqdPRIK9CqfVWzNBQJxkJr8=;
        b=WRqci4OzI7sraNeT5mA/vbFc1dssQodzlhZFbT6MCrsU25IRuTVHqnJnFp15CXkhl7
         zpHqDRvtS0Jwe6taTT47pPPEnG+50P4KWvZBkyq3aBzPLU3jYg2nyj4AW5tQd1v7AJLb
         RegmEQxYYZWQXF92j4K+UeV5CzBzLH1lWcfcvyXjvpoP/eViP7QykOdiDPdF52ZLifAd
         6R/s2fDKlSJ5G3D07eLLQ5LMg5QenWjHnUa6MqEWGpphZz6VwNZag0C9XR8YyTWkAzLz
         Ge3LsAQforMzpWzDMzV+KnzgLXxqkAYh2ZBkkm5qso2yReoG3pSj5l56Pk0jyRrsQLm0
         Feww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SdR19qocfp0tYoWxdAqvGqdPRIK9CqfVWzNBQJxkJr8=;
        b=NtlkH0ck4pxHR+rTfeefmiJMjj7ijSNdD8RqWQIeGD5oqfbYskWknHxZvAwby/EBgC
         mhyfVa8LZpcRSBQ8wZVZNPV+rnBoHA6OBacT/RbcHUt37eqZdKO+PW3Y3WNBfEJpGLIT
         2ZucUBUj83qpX3e7URZHAdFp0ZE5m2fPU99zkBsQD3RmEMX1dRk4UPemWruL4/5RqRXZ
         K8Nb7F1cDQN8pQT10mSR9OFGA4pvpFE1P5St4BGI1iU/LmngWEcTMcWYeC0SH4CAynOO
         vxvCMl9HcENIXqNwxkpn4f+N3R880M55KAuVakhAcuMTZ4GodGcI7KnOCuQG9weqpJ6p
         pcgQ==
X-Gm-Message-State: AOAM533d/gFLC7rnIkzdCEAhNVGR1G7jyEH8kMQkp8IwaH37GJLLXdkS
	EJfJB3nzm9R50SDqxdS2QRspVZinFGM=
X-Google-Smtp-Source: 
 ABdhPJwHUDUXszC2wBzSb6miwqkPimotbGbfWinnXcffNAeGjITi36HyRVFa92kx+WAla2ltlZynAw==
X-Received: by 2002:a63:797:0:b0:3fc:da19:45a7 with SMTP id
 145-20020a630797000000b003fcda1945a7mr9157910pgh.326.1654283988781;
        Fri, 03 Jun 2022 12:19:48 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 19/20] devmem2: the source and patches moved to github
 repo
Date: Fri,  3 Jun 2022 12:17:18 -0700
Message-Id: 
 <4e66373fe9653317400098cf4ce8d29ec1a99026.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97408

From: Denys Dmytriyenko <denis@denix.org>

To cleanup metadata and improve source code management, github repo was
created here with all patches integrated:
https://github.com/denix0/devmem2

Update recipe accordingly, bump the version while at it to distinguish
from the original.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 356b488fb06bcacb0aa553518442b2d9574f16af)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...word-is-32-bit-and-add-support-for-6.patch | 70 --------------
 ...ort-different-page-sizes-at-run-time.patch | 35 -------
 .../devmem2/devmem2/devmem2-fixups-2.patch    | 91 -------------------
 .../devmem2/{devmem2.bb => devmem2_2.0.bb}    | 17 +---
 4 files changed, 3 insertions(+), 210 deletions(-)
 delete mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
 delete mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch
 delete mode 100644 meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
 rename meta-oe/recipes-support/devmem2/{devmem2.bb => devmem2_2.0.bb} (40%)

diff --git a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
deleted file mode 100644
index 2a57f29891..0000000000
--- a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 1360a907879dd24041797a3b709d49aeac2ab444 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 29 May 2018 16:55:42 -0400
-Subject: [PATCH] devmem.c: ensure word is 32-bit and add support for 64-bit
- long
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- devmem2.c | 23 +++++++++++++++++------
- 1 file changed, 17 insertions(+), 6 deletions(-)
-
-diff --git a/devmem2.c b/devmem2.c
-index 5845381..68131b2 100644
---- a/devmem2.c
-+++ b/devmem2.c
-@@ -39,6 +39,7 @@
- 
- #include <stdio.h>
- #include <stdlib.h>
-+#include <stdint.h>
- #include <unistd.h>
- #include <string.h>
- #include <errno.h>
-@@ -69,7 +70,7 @@ int main(int argc, char **argv) {
- 	if(argc < 2) {
- 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
- 			"\taddress : memory address to act upon\n"
--			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord\n"
-+			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord, [l]ong\n"
- 			"\tdata    : data to be written\n\n",
- 			argv[0]);
- 		exit(1);
-@@ -103,9 +104,14 @@ int main(int argc, char **argv) {
- 			read_result = *((unsigned short *) virt_addr);
- 			break;
- 		case 'w':
--			data_size = sizeof(unsigned long);
-+			data_size = sizeof(uint32_t);
- 			virt_addr = fixup_addr(virt_addr, data_size);
--			read_result = *((unsigned long *) virt_addr);
-+			read_result = *((uint32_t *) virt_addr);
-+			break;
-+		case 'l':
-+			data_size = sizeof(uint64_t);
-+			virt_addr = fixup_addr(virt_addr, data_size);
-+			read_result = *((uint64_t *) virt_addr);
- 			break;
- 		default:
- 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
-@@ -129,9 +135,14 @@ int main(int argc, char **argv) {
- 				read_result = *((unsigned short *) virt_addr);
- 				break;
- 			case 'w':
--				virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
--				*((unsigned long *) virt_addr) = write_val;
--				read_result = *((unsigned long *) virt_addr);
-+				virt_addr = fixup_addr(virt_addr, sizeof(uint32_t));
-+				*((uint32_t *) virt_addr) = write_val;
-+				read_result = *((uint32_t *) virt_addr);
-+				break;
-+			case 'l':
-+				virt_addr = fixup_addr(virt_addr, sizeof(uint64_t));
-+				*((uint64_t *) virt_addr) = write_val;
-+				read_result = *((uint64_t *) virt_addr);
- 				break;
- 		}
- 		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch
deleted file mode 100644
index 0da0732c57..0000000000
--- a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0f6af48b2fbc71ec8abe862d3e9eb6da7b03538b Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Wed, 8 Aug 2018 14:38:00 -0400
-Subject: [PATCH] devmem2: support different page sizes at run-time
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- devmem2.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/devmem2.c b/devmem2.c
-index 68131b2..76af2d6 100644
---- a/devmem2.c
-+++ b/devmem2.c
-@@ -53,8 +53,6 @@
- #define FATAL do { fprintf(stderr, "Error at line %d, file %s (%d) [%s]\n", \
-   __LINE__, __FILE__, errno, strerror(errno)); exit(1); } while(0)
-  
--#define MAP_SIZE 4096UL
--#define MAP_MASK (MAP_SIZE - 1)
- 
- static inline void *fixup_addr(void *addr, size_t size);
- 
-@@ -66,6 +64,8 @@ int main(int argc, char **argv) {
- 	int access_type = 'w';
- 	char fmt_str[128];
- 	size_t data_size;
-+	unsigned long MAP_SIZE = sysconf(_SC_PAGE_SIZE);
-+	unsigned long MAP_MASK = (MAP_SIZE - 1);
- 	
- 	if(argc < 2) {
- 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch b/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
deleted file mode 100644
index 4517797fc7..0000000000
--- a/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
+++ /dev/null
@@ -1,91 +0,0 @@
---- devmem2.c	2004-08-05 01:55:25.000000000 +0200
-+++ devmem2_modif.c	2011-01-13 15:48:37.798799784 +0100
-@@ -45,12 +45,16 @@
- #define MAP_SIZE 4096UL
- #define MAP_MASK (MAP_SIZE - 1)
- 
-+static inline void *fixup_addr(void *addr, size_t size);
-+
- int main(int argc, char **argv) {
-     int fd;
-     void *map_base, *virt_addr; 
--	unsigned long read_result, writeval;
-+	unsigned long read_result, write_val;
- 	off_t target;
- 	int access_type = 'w';
-+	char fmt_str[128];
-+	size_t data_size;
- 	
- 	if(argc < 2) {
- 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
-@@ -79,38 +83,51 @@
-     virt_addr = map_base + (target & MAP_MASK);
-     switch(access_type) {
- 		case 'b':
-+			data_size = sizeof(unsigned char);
-+			virt_addr = fixup_addr(virt_addr, data_size);
- 			read_result = *((unsigned char *) virt_addr);
- 			break;
- 		case 'h':
-+			data_size = sizeof(unsigned short);
-+			virt_addr = fixup_addr(virt_addr, data_size);
- 			read_result = *((unsigned short *) virt_addr);
- 			break;
- 		case 'w':
-+			data_size = sizeof(unsigned long);
-+			virt_addr = fixup_addr(virt_addr, data_size);
- 			read_result = *((unsigned long *) virt_addr);
- 			break;
- 		default:
- 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
- 			exit(2);
- 	}
--    printf("Value at address 0x%X (%p): 0x%X\n", target, virt_addr, read_result); 
-+	sprintf(fmt_str, "Read at address  0x%%08lX (%%p): 0x%%0%dlX\n", 2*data_size);
-+    printf(fmt_str, (unsigned long)target, virt_addr, read_result);
-     fflush(stdout);
- 
- 	if(argc > 3) {
--		writeval = strtoul(argv[3], 0, 0);
-+		write_val = strtoul(argv[3], 0, 0);
- 		switch(access_type) {
- 			case 'b':
--				*((unsigned char *) virt_addr) = writeval;
-+				virt_addr = fixup_addr(virt_addr, sizeof(unsigned char));
-+				*((unsigned char *) virt_addr) = write_val;
- 				read_result = *((unsigned char *) virt_addr);
- 				break;
- 			case 'h':
--				*((unsigned short *) virt_addr) = writeval;
-+				virt_addr = fixup_addr(virt_addr, sizeof(unsigned short));
-+				*((unsigned short *) virt_addr) = write_val;
- 				read_result = *((unsigned short *) virt_addr);
- 				break;
- 			case 'w':
--				*((unsigned long *) virt_addr) = writeval;
-+				virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
-+				*((unsigned long *) virt_addr) = write_val;
- 				read_result = *((unsigned long *) virt_addr);
- 				break;
- 		}
--		printf("Written 0x%X; readback 0x%X\n", writeval, read_result); 
-+		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
-+			"readback 0x%%0%dlX\n",	2*data_size, 2*data_size);
-+		printf(fmt_str, (unsigned long)target, virt_addr,
-+			write_val, read_result);
- 		fflush(stdout);
- 	}
- 	
-@@ -119,3 +136,12 @@
-     return 0;
- }
- 
-+static inline void *fixup_addr(void *addr, size_t size)
-+{
-+#ifdef FORCE_STRICT_ALIGNMENT
-+	unsigned long aligned_addr = (unsigned long)addr;
-+	aligned_addr &= ~(size - 1);
-+	addr = (void *)aligned_addr;
-+#endif
-+	return addr;
-+}
diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
similarity index 40%
rename from meta-oe/recipes-support/devmem2/devmem2.bb
rename to meta-oe/recipes-support/devmem2/devmem2_2.0.bb
index 70d4135216..aee6bfe3da 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
@@ -1,22 +1,14 @@
 SUMMARY = "Simple program to read/write from/to any location in memory"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
-PR = "r7"
 
-SRC_URI = "https://bootlin.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
-           file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
-           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch \
-           file://0001-devmem2-support-different-page-sizes-at-run-time.patch \
-"
+SRC_URI = "git://github.com/denix0/devmem2.git;protocol=https;branch=main"
+SRCREV = "5b395a946894eb4f4ef5d07c80a50a88573a541e"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/git"
 
 CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
 
-python do_unpack:append() {
-    os.rename("devmem2-new.c", "devmem2.c")
-}
-
 do_compile() {
     ${CC} -o devmem2 devmem2.c ${CFLAGS} ${LDFLAGS}
 }
@@ -25,6 +17,3 @@ do_install() {
     install -d ${D}${bindir}
     install devmem2 ${D}${bindir}
 }
-
-SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
-SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639"
-- 
2.25.1


