Return-Path: <sjl@vctlabs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC830C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 23:28:37 +0000 (UTC)
Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web08.4875.1646263716509105150
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 15:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: vctlabs.com, ip: 207.154.65.135,
 mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 112)
	id 1705128025C; Wed,  2 Mar 2022 15:30:33 -0800 (PST)
Received: from codepurple (c-73-158-3-176.hsd1.ca.comcast.net [73.158.3.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by dent.vctlabs.com (Postfix) with ESMTPSA id 7595E280197
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 15:30:32 -0800 (PST)
Date: Wed, 2 Mar 2022 15:28:33 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] devmem2: patches have been upstreamed
Message-ID: <20220302232833.GT661312@codepurple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 23:28:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95720

quilt complains that both patches have already been applied,
so drop them.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb    |  3 +-
 ...word-is-32-bit-and-add-support-for-6.patch | 70 --------------
 .../devmem2/devmem2/devmem2-fixups-2.patch    | 91 -------------------
 3 files changed, 1 insertion(+), 163 deletions(-)
 delete mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
 delete mode 100644 meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index 56ca7a1b3..d0a86184a 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -4,8 +4,7 @@ LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf9862
 PR = "r7"
 
 SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
-           file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
-           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch"
+          " 
 
 S = "${WORKDIR}"
 
diff --git a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
deleted file mode 100644
index 2a57f2989..000000000
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
diff --git a/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch b/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
deleted file mode 100644
index 4517797fc..000000000
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
-- 
2.20.1


