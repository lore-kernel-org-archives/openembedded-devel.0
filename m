Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AA5C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 21:51:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.2637.1651787488871576643
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 14:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B9B0140BE9
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  5 May 2022 21:51:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IA4fm2I-ziLo
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2022 21:51:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9BE5F40A3D
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  5 May 2022 21:51:27 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 49ACE17491C;
	Thu,  5 May 2022 17:51:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 1/2] devmem2: reinstate previous patches, removed by mistake
Date: Thu,  5 May 2022 21:51:25 +0000
Message-Id: <20220505215126.342916-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 May 2022 21:51:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96967

This reverts commit 5e8f4720aaa3da7350ead06959cae0492133cd61.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-oe/recipes-support/devmem2/devmem2.bb    |  3 +-
 ...word-is-32-bit-and-add-support-for-6.patch | 70 ++++++++++++++
 .../devmem2/devmem2/devmem2-fixups-2.patch    | 91 +++++++++++++++++++
 3 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c=
-ensure-word-is-32-bit-and-add-support-for-6.patch
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/devmem2-fixup=
s-2.patch

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes=
-support/devmem2/devmem2.bb
index 92c05fe06..c6b8df5e4 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM =3D "file://devmem2.c;endline=3D38;md5=3D=
a9eb9f3890384519f435aedf9862
 PR =3D "r7"
=20
 SRC_URI =3D "http://www.free-electrons.com/pub/mirror/devmem2.c;download=
filename=3Ddevmem2-new.c \
-          "=20
+           file://devmem2-fixups-2.patch;apply=3Dyes;striplevel=3D0 \
+           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-fo=
r-6.patch"
=20
 S =3D "${WORKDIR}"
=20
diff --git a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure=
-word-is-32-bit-and-add-support-for-6.patch b/meta-oe/recipes-support/dev=
mem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.pa=
tch
new file mode 100644
index 000000000..2a57f2989
--- /dev/null
+++ b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-i=
s-32-bit-and-add-support-for-6.patch
@@ -0,0 +1,70 @@
+From 1360a907879dd24041797a3b709d49aeac2ab444 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 29 May 2018 16:55:42 -0400
+Subject: [PATCH] devmem.c: ensure word is 32-bit and add support for 64-=
bit
+ long
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ devmem2.c | 23 +++++++++++++++++------
+ 1 file changed, 17 insertions(+), 6 deletions(-)
+
+diff --git a/devmem2.c b/devmem2.c
+index 5845381..68131b2 100644
+--- a/devmem2.c
++++ b/devmem2.c
+@@ -39,6 +39,7 @@
+=20
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <unistd.h>
+ #include <string.h>
+ #include <errno.h>
+@@ -69,7 +70,7 @@ int main(int argc, char **argv) {
+ 	if(argc < 2) {
+ 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
+ 			"\taddress : memory address to act upon\n"
+-			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord\n"
++			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord, [l]=
ong\n"
+ 			"\tdata    : data to be written\n\n",
+ 			argv[0]);
+ 		exit(1);
+@@ -103,9 +104,14 @@ int main(int argc, char **argv) {
+ 			read_result =3D *((unsigned short *) virt_addr);
+ 			break;
+ 		case 'w':
+-			data_size =3D sizeof(unsigned long);
++			data_size =3D sizeof(uint32_t);
+ 			virt_addr =3D fixup_addr(virt_addr, data_size);
+-			read_result =3D *((unsigned long *) virt_addr);
++			read_result =3D *((uint32_t *) virt_addr);
++			break;
++		case 'l':
++			data_size =3D sizeof(uint64_t);
++			virt_addr =3D fixup_addr(virt_addr, data_size);
++			read_result =3D *((uint64_t *) virt_addr);
+ 			break;
+ 		default:
+ 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
+@@ -129,9 +135,14 @@ int main(int argc, char **argv) {
+ 				read_result =3D *((unsigned short *) virt_addr);
+ 				break;
+ 			case 'w':
+-				virt_addr =3D fixup_addr(virt_addr, sizeof(unsigned long));
+-				*((unsigned long *) virt_addr) =3D write_val;
+-				read_result =3D *((unsigned long *) virt_addr);
++				virt_addr =3D fixup_addr(virt_addr, sizeof(uint32_t));
++				*((uint32_t *) virt_addr) =3D write_val;
++				read_result =3D *((uint32_t *) virt_addr);
++				break;
++			case 'l':
++				virt_addr =3D fixup_addr(virt_addr, sizeof(uint64_t));
++				*((uint64_t *) virt_addr) =3D write_val;
++				read_result =3D *((uint64_t *) virt_addr);
+ 				break;
+ 		}
+ 		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
+--=20
+2.7.4
+
diff --git a/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.pat=
ch b/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
new file mode 100644
index 000000000..4517797fc
--- /dev/null
+++ b/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
@@ -0,0 +1,91 @@
+--- devmem2.c	2004-08-05 01:55:25.000000000 +0200
++++ devmem2_modif.c	2011-01-13 15:48:37.798799784 +0100
+@@ -45,12 +45,16 @@
+ #define MAP_SIZE 4096UL
+ #define MAP_MASK (MAP_SIZE - 1)
+=20
++static inline void *fixup_addr(void *addr, size_t size);
++
+ int main(int argc, char **argv) {
+     int fd;
+     void *map_base, *virt_addr;=20
+-	unsigned long read_result, writeval;
++	unsigned long read_result, write_val;
+ 	off_t target;
+ 	int access_type =3D 'w';
++	char fmt_str[128];
++	size_t data_size;
+ =09
+ 	if(argc < 2) {
+ 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
+@@ -79,38 +83,51 @@
+     virt_addr =3D map_base + (target & MAP_MASK);
+     switch(access_type) {
+ 		case 'b':
++			data_size =3D sizeof(unsigned char);
++			virt_addr =3D fixup_addr(virt_addr, data_size);
+ 			read_result =3D *((unsigned char *) virt_addr);
+ 			break;
+ 		case 'h':
++			data_size =3D sizeof(unsigned short);
++			virt_addr =3D fixup_addr(virt_addr, data_size);
+ 			read_result =3D *((unsigned short *) virt_addr);
+ 			break;
+ 		case 'w':
++			data_size =3D sizeof(unsigned long);
++			virt_addr =3D fixup_addr(virt_addr, data_size);
+ 			read_result =3D *((unsigned long *) virt_addr);
+ 			break;
+ 		default:
+ 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
+ 			exit(2);
+ 	}
+-    printf("Value at address 0x%X (%p): 0x%X\n", target, virt_addr, rea=
d_result);=20
++	sprintf(fmt_str, "Read at address  0x%%08lX (%%p): 0x%%0%dlX\n", 2*dat=
a_size);
++    printf(fmt_str, (unsigned long)target, virt_addr, read_result);
+     fflush(stdout);
+=20
+ 	if(argc > 3) {
+-		writeval =3D strtoul(argv[3], 0, 0);
++		write_val =3D strtoul(argv[3], 0, 0);
+ 		switch(access_type) {
+ 			case 'b':
+-				*((unsigned char *) virt_addr) =3D writeval;
++				virt_addr =3D fixup_addr(virt_addr, sizeof(unsigned char));
++				*((unsigned char *) virt_addr) =3D write_val;
+ 				read_result =3D *((unsigned char *) virt_addr);
+ 				break;
+ 			case 'h':
+-				*((unsigned short *) virt_addr) =3D writeval;
++				virt_addr =3D fixup_addr(virt_addr, sizeof(unsigned short));
++				*((unsigned short *) virt_addr) =3D write_val;
+ 				read_result =3D *((unsigned short *) virt_addr);
+ 				break;
+ 			case 'w':
+-				*((unsigned long *) virt_addr) =3D writeval;
++				virt_addr =3D fixup_addr(virt_addr, sizeof(unsigned long));
++				*((unsigned long *) virt_addr) =3D write_val;
+ 				read_result =3D *((unsigned long *) virt_addr);
+ 				break;
+ 		}
+-		printf("Written 0x%X; readback 0x%X\n", writeval, read_result);=20
++		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
++			"readback 0x%%0%dlX\n",	2*data_size, 2*data_size);
++		printf(fmt_str, (unsigned long)target, virt_addr,
++			write_val, read_result);
+ 		fflush(stdout);
+ 	}
+ =09
+@@ -119,3 +136,12 @@
+     return 0;
+ }
+=20
++static inline void *fixup_addr(void *addr, size_t size)
++{
++#ifdef FORCE_STRICT_ALIGNMENT
++	unsigned long aligned_addr =3D (unsigned long)addr;
++	aligned_addr &=3D ~(size - 1);
++	addr =3D (void *)aligned_addr;
++#endif
++	return addr;
++}
--=20
2.25.1


