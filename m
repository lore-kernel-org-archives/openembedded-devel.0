Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 93DDC75591
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 23:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9460420BA1;
	Tue, 19 Jun 2018 23:42:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BchT4BVEIeak; Tue, 19 Jun 2018 23:42:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 60FF52088D;
	Tue, 19 Jun 2018 23:42:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id DA0721634AC;
	Tue, 19 Jun 2018 19:42:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2018 19:42:04 -0400
Message-Id: <1529451724-37869-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] devmem2: ensure word is 32-bit, add support for 64-bit double
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
X-List-Received-Date: Tue, 19 Jun 2018 23:42:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since sizeof(unsigned long) can be 8-byte on 64-bit architectures, use
uint32_t instead for "word" access to always be 4-byte/32-bit long.

Also introduce proper "double" 8-byte/64-bit access by using uint64_t.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb         |  4 +-
 ...sure-word-is-32-bit-and-add-support-for-6.patch | 70 ++++++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index c86eb2e..9bd1eb7 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf9862
 PR = "r7"
 
 SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
-           file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
+           file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
+           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch"
+
 S = "${WORKDIR}"
 
 CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
diff --git a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
new file mode 100644
index 0000000..ad8ae67
--- /dev/null
+++ b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
@@ -0,0 +1,70 @@
+From 1360a907879dd24041797a3b709d49aeac2ab444 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 29 May 2018 16:55:42 -0400
+Subject: [PATCH] devmem.c: ensure word is 32-bit and add support for 64-bit
+ double
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
+ 
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
++			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord, [d]ouble\n"
+ 			"\tdata    : data to be written\n\n",
+ 			argv[0]);
+ 		exit(1);
+@@ -103,9 +104,14 @@ int main(int argc, char **argv) {
+ 			read_result = *((unsigned short *) virt_addr);
+ 			break;
+ 		case 'w':
+-			data_size = sizeof(unsigned long);
++			data_size = sizeof(uint32_t);
+ 			virt_addr = fixup_addr(virt_addr, data_size);
+-			read_result = *((unsigned long *) virt_addr);
++			read_result = *((uint32_t *) virt_addr);
++			break;
++		case 'd':
++			data_size = sizeof(uint64_t);
++			virt_addr = fixup_addr(virt_addr, data_size);
++			read_result = *((uint64_t *) virt_addr);
+ 			break;
+ 		default:
+ 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
+@@ -129,9 +135,14 @@ int main(int argc, char **argv) {
+ 				read_result = *((unsigned short *) virt_addr);
+ 				break;
+ 			case 'w':
+-				virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
+-				*((unsigned long *) virt_addr) = write_val;
+-				read_result = *((unsigned long *) virt_addr);
++				virt_addr = fixup_addr(virt_addr, sizeof(uint32_t));
++				*((uint32_t *) virt_addr) = write_val;
++				read_result = *((uint32_t *) virt_addr);
++				break;
++			case 'd':
++				virt_addr = fixup_addr(virt_addr, sizeof(uint64_t));
++				*((uint64_t *) virt_addr) = write_val;
++				read_result = *((uint64_t *) virt_addr);
+ 				break;
+ 		}
+ 		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
+-- 
+2.7.4
+
-- 
2.7.4


