Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC328C43217
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 21:35:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2282.1651786528785689519
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 14:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BD3C940BE9;
	Thu,  5 May 2022 21:35:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bit0czmK7pju; Thu,  5 May 2022 21:35:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9E44040A3D;
	Thu,  5 May 2022 21:35:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5B0EC17491D; Thu,  5 May 2022 17:35:26 -0400 (EDT)
Date: Thu, 5 May 2022 17:35:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] devmem2: patches have been upstreamed
Message-ID: <20220505213526.GN9834@denix.org>
References: <20220302232833.GT661312@codepurple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302232833.GT661312@codepurple>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 May 2022 21:35:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96966

On Wed, Mar 02, 2022 at 03:28:33PM -0800, S. Lockwood-Childs wrote:
> quilt complains that both patches have already been applied,
> so drop them.

This is completely bogus! The source file[1] is 1-page long and it's very 
obvious that none of the below patches were applied. Moreover, none of the 
checksums (md5/sha256) in the recipe have changed, indicating the file hasn't 
been touched in years!

[1] http://www.free-electrons.com/pub/mirror/devmem2.c


> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
>  meta-oe/recipes-support/devmem2/devmem2.bb    |  3 +-
>  ...word-is-32-bit-and-add-support-for-6.patch | 70 --------------
>  .../devmem2/devmem2/devmem2-fixups-2.patch    | 91 -------------------
>  3 files changed, 1 insertion(+), 163 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
>  delete mode 100644 meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
> 
> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
> index 56ca7a1b3..d0a86184a 100644
> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> @@ -4,8 +4,7 @@ LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf9862
>  PR = "r7"
>  
>  SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
> -           file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
> -           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch"
> +          " 
>  
>  S = "${WORKDIR}"
>  
> diff --git a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
> deleted file mode 100644
> index 2a57f2989..000000000
> --- a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From 1360a907879dd24041797a3b709d49aeac2ab444 Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Tue, 29 May 2018 16:55:42 -0400
> -Subject: [PATCH] devmem.c: ensure word is 32-bit and add support for 64-bit
> - long
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - devmem2.c | 23 +++++++++++++++++------
> - 1 file changed, 17 insertions(+), 6 deletions(-)
> -
> -diff --git a/devmem2.c b/devmem2.c
> -index 5845381..68131b2 100644
> ---- a/devmem2.c
> -+++ b/devmem2.c
> -@@ -39,6 +39,7 @@
> - 
> - #include <stdio.h>
> - #include <stdlib.h>
> -+#include <stdint.h>
> - #include <unistd.h>
> - #include <string.h>
> - #include <errno.h>
> -@@ -69,7 +70,7 @@ int main(int argc, char **argv) {
> - 	if(argc < 2) {
> - 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
> - 			"\taddress : memory address to act upon\n"
> --			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord\n"
> -+			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord, [l]ong\n"
> - 			"\tdata    : data to be written\n\n",
> - 			argv[0]);
> - 		exit(1);
> -@@ -103,9 +104,14 @@ int main(int argc, char **argv) {
> - 			read_result = *((unsigned short *) virt_addr);
> - 			break;
> - 		case 'w':
> --			data_size = sizeof(unsigned long);
> -+			data_size = sizeof(uint32_t);
> - 			virt_addr = fixup_addr(virt_addr, data_size);
> --			read_result = *((unsigned long *) virt_addr);
> -+			read_result = *((uint32_t *) virt_addr);
> -+			break;
> -+		case 'l':
> -+			data_size = sizeof(uint64_t);
> -+			virt_addr = fixup_addr(virt_addr, data_size);
> -+			read_result = *((uint64_t *) virt_addr);
> - 			break;
> - 		default:
> - 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
> -@@ -129,9 +135,14 @@ int main(int argc, char **argv) {
> - 				read_result = *((unsigned short *) virt_addr);
> - 				break;
> - 			case 'w':
> --				virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
> --				*((unsigned long *) virt_addr) = write_val;
> --				read_result = *((unsigned long *) virt_addr);
> -+				virt_addr = fixup_addr(virt_addr, sizeof(uint32_t));
> -+				*((uint32_t *) virt_addr) = write_val;
> -+				read_result = *((uint32_t *) virt_addr);
> -+				break;
> -+			case 'l':
> -+				virt_addr = fixup_addr(virt_addr, sizeof(uint64_t));
> -+				*((uint64_t *) virt_addr) = write_val;
> -+				read_result = *((uint64_t *) virt_addr);
> - 				break;
> - 		}
> - 		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
> --- 
> -2.7.4
> -
> diff --git a/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch b/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
> deleted file mode 100644
> index 4517797fc..000000000
> --- a/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
> +++ /dev/null
> @@ -1,91 +0,0 @@
> ---- devmem2.c	2004-08-05 01:55:25.000000000 +0200
> -+++ devmem2_modif.c	2011-01-13 15:48:37.798799784 +0100
> -@@ -45,12 +45,16 @@
> - #define MAP_SIZE 4096UL
> - #define MAP_MASK (MAP_SIZE - 1)
> - 
> -+static inline void *fixup_addr(void *addr, size_t size);
> -+
> - int main(int argc, char **argv) {
> -     int fd;
> -     void *map_base, *virt_addr; 
> --	unsigned long read_result, writeval;
> -+	unsigned long read_result, write_val;
> - 	off_t target;
> - 	int access_type = 'w';
> -+	char fmt_str[128];
> -+	size_t data_size;
> - 	
> - 	if(argc < 2) {
> - 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
> -@@ -79,38 +83,51 @@
> -     virt_addr = map_base + (target & MAP_MASK);
> -     switch(access_type) {
> - 		case 'b':
> -+			data_size = sizeof(unsigned char);
> -+			virt_addr = fixup_addr(virt_addr, data_size);
> - 			read_result = *((unsigned char *) virt_addr);
> - 			break;
> - 		case 'h':
> -+			data_size = sizeof(unsigned short);
> -+			virt_addr = fixup_addr(virt_addr, data_size);
> - 			read_result = *((unsigned short *) virt_addr);
> - 			break;
> - 		case 'w':
> -+			data_size = sizeof(unsigned long);
> -+			virt_addr = fixup_addr(virt_addr, data_size);
> - 			read_result = *((unsigned long *) virt_addr);
> - 			break;
> - 		default:
> - 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
> - 			exit(2);
> - 	}
> --    printf("Value at address 0x%X (%p): 0x%X\n", target, virt_addr, read_result); 
> -+	sprintf(fmt_str, "Read at address  0x%%08lX (%%p): 0x%%0%dlX\n", 2*data_size);
> -+    printf(fmt_str, (unsigned long)target, virt_addr, read_result);
> -     fflush(stdout);
> - 
> - 	if(argc > 3) {
> --		writeval = strtoul(argv[3], 0, 0);
> -+		write_val = strtoul(argv[3], 0, 0);
> - 		switch(access_type) {
> - 			case 'b':
> --				*((unsigned char *) virt_addr) = writeval;
> -+				virt_addr = fixup_addr(virt_addr, sizeof(unsigned char));
> -+				*((unsigned char *) virt_addr) = write_val;
> - 				read_result = *((unsigned char *) virt_addr);
> - 				break;
> - 			case 'h':
> --				*((unsigned short *) virt_addr) = writeval;
> -+				virt_addr = fixup_addr(virt_addr, sizeof(unsigned short));
> -+				*((unsigned short *) virt_addr) = write_val;
> - 				read_result = *((unsigned short *) virt_addr);
> - 				break;
> - 			case 'w':
> --				*((unsigned long *) virt_addr) = writeval;
> -+				virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
> -+				*((unsigned long *) virt_addr) = write_val;
> - 				read_result = *((unsigned long *) virt_addr);
> - 				break;
> - 		}
> --		printf("Written 0x%X; readback 0x%X\n", writeval, read_result); 
> -+		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
> -+			"readback 0x%%0%dlX\n",	2*data_size, 2*data_size);
> -+		printf(fmt_str, (unsigned long)target, virt_addr,
> -+			write_val, read_result);
> - 		fflush(stdout);
> - 	}
> - 	
> -@@ -119,3 +136,12 @@
> -     return 0;
> - }
> - 
> -+static inline void *fixup_addr(void *addr, size_t size)
> -+{
> -+#ifdef FORCE_STRICT_ALIGNMENT
> -+	unsigned long aligned_addr = (unsigned long)addr;
> -+	aligned_addr &= ~(size - 1);
> -+	addr = (void *)aligned_addr;
> -+#endif
> -+	return addr;
> -+}
> -- 
> 2.20.1
> 

