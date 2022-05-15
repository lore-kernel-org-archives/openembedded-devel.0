Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4E3C433F5
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:44:30 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.16651.1652622260310032277
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dYr5HT5r;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id l11so11749760pgt.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=DEoUJF8ZwBbKz5HzRcJa8+XDXW6tMY+dt3tjqL+yRX8=;
        b=dYr5HT5rKr+0sPBI4d+biTnSpGc6vne4KFI9dcnzhFikPFVMFWrytNvB6sR/EvftiV
         vFgrOUbMXGheM+B2/icaGklQLQp9ZncHdhnO4FF+Cpp6vRaPMwP88o6tDlfvvEFN2PVD
         opuJSkA9DaMyo4dt0Wf8HVe6YQ7Ca0eIoNgnrdEEwd8v/VTQ3E0ZqP+ks72VSvDBvUVL
         8E/NPJJu0ciNQ1An06YuA2/0PQRdr6af4XovesSdfLAZeZvFOIT4oWTirVyFds2A0Rg6
         M4tJE0epl/Fg7+8MIIXRfvB/Kz5Zv9MGV7kEe26cvkmQLkpQX1xvBjTfnowEJvmE0BMm
         2wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DEoUJF8ZwBbKz5HzRcJa8+XDXW6tMY+dt3tjqL+yRX8=;
        b=lzW+TW+8tPJ6nRkSI2/u0XVSM3hrr+NAyc1D6GnE9yuJxgivpTAzfBdYpVzslfe8Dh
         xCSOuG81JEQifo0wk+YeCPu1PS9IP2jvOJg0qt73eGUEhrVGwJ/ADm7ndv5R/TD3bg02
         EqGc3lPQYz4wmyJYGvjU29lf/lh6Z/97uZrgMspw6DX2CEXVpyNqwfYN3d4gTveqtxLG
         B+GUUztpzdc9PWyxZvh60PDhGkGnYv39+GNmI6M7bfdNnVpgea6JXQORNhntQZXFVeUt
         RpRwH6ICy2kima9xdkLvxI0mqYxow/IWDpZK1csR7829i1qitO4Z8E8Po+yEzZXY357P
         3uKQ==
X-Gm-Message-State: AOAM530Sbg//YcFHPekKb6wztkSOHFD+b/jJ47+cmSVx5XtUjH9LOPLC
	/5gIbE6SouJtA++xTC1w9IDVSrca6QMxZA==
X-Google-Smtp-Source: 
 ABdhPJyMo8CaE2kH5HRVq5lmb/PElorzKi9Xkyz+cX9aGGiaKUXC2oOdghScoEHLWhS8A/37c9VH6w==
X-Received: by 2002:a63:ea4b:0:b0:3db:5325:d55a with SMTP id
 l11-20020a63ea4b000000b003db5325d55amr11706445pgk.588.1652622259571;
        Sun, 15 May 2022 06:44:19 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:48be:3d3d:c26:7949?
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a170902694100b0015e8d4eb2bcsm5107857plt.262.2022.05.15.06.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 May 2022 06:44:19 -0700 (PDT)
Message-ID: <dad022d1-ed06-4836-71f0-33b28c62729d@gmail.com>
Date: Sun, 15 May 2022 06:44:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [oe] [kirkstone][PATCH 1/3] devmem2: reinstate previous patches,
 removed by mistake
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>,
 openembedded-devel@lists.openembedded.org
References: <20220512234307.1189721-1-denis@denix.org>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220512234307.1189721-1-denis@denix.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:44:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97096



On 5/12/22 16:43, Denys Dmytriyenko wrote:
> This reverts commit 5e8f4720aaa3da7350ead06959cae0492133cd61.
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>

thanks, I already have this staged in stable/kirtkstone-nut

-armin
> ---
>   meta-oe/recipes-support/devmem2/devmem2.bb    |  3 +-
>   ...word-is-32-bit-and-add-support-for-6.patch | 70 ++++++++++++++
>   .../devmem2/devmem2/devmem2-fixups-2.patch    | 91 +++++++++++++++++++
>   3 files changed, 163 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
>   create mode 100644 meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
>
> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
> index 92c05fe06..c6b8df5e4 100644
> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> @@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf9862
>   PR = "r7"
>   
>   SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
> -          "
> +           file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
> +           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch"
>   
>   S = "${WORKDIR}"
>   
> diff --git a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
> new file mode 100644
> index 000000000..2a57f2989
> --- /dev/null
> +++ b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
> @@ -0,0 +1,70 @@
> +From 1360a907879dd24041797a3b709d49aeac2ab444 Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Tue, 29 May 2018 16:55:42 -0400
> +Subject: [PATCH] devmem.c: ensure word is 32-bit and add support for 64-bit
> + long
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + devmem2.c | 23 +++++++++++++++++------
> + 1 file changed, 17 insertions(+), 6 deletions(-)
> +
> +diff --git a/devmem2.c b/devmem2.c
> +index 5845381..68131b2 100644
> +--- a/devmem2.c
> ++++ b/devmem2.c
> +@@ -39,6 +39,7 @@
> +
> + #include <stdio.h>
> + #include <stdlib.h>
> ++#include <stdint.h>
> + #include <unistd.h>
> + #include <string.h>
> + #include <errno.h>
> +@@ -69,7 +70,7 @@ int main(int argc, char **argv) {
> + 	if(argc < 2) {
> + 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
> + 			"\taddress : memory address to act upon\n"
> +-			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord\n"
> ++			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord, [l]ong\n"
> + 			"\tdata    : data to be written\n\n",
> + 			argv[0]);
> + 		exit(1);
> +@@ -103,9 +104,14 @@ int main(int argc, char **argv) {
> + 			read_result = *((unsigned short *) virt_addr);
> + 			break;
> + 		case 'w':
> +-			data_size = sizeof(unsigned long);
> ++			data_size = sizeof(uint32_t);
> + 			virt_addr = fixup_addr(virt_addr, data_size);
> +-			read_result = *((unsigned long *) virt_addr);
> ++			read_result = *((uint32_t *) virt_addr);
> ++			break;
> ++		case 'l':
> ++			data_size = sizeof(uint64_t);
> ++			virt_addr = fixup_addr(virt_addr, data_size);
> ++			read_result = *((uint64_t *) virt_addr);
> + 			break;
> + 		default:
> + 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
> +@@ -129,9 +135,14 @@ int main(int argc, char **argv) {
> + 				read_result = *((unsigned short *) virt_addr);
> + 				break;
> + 			case 'w':
> +-				virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
> +-				*((unsigned long *) virt_addr) = write_val;
> +-				read_result = *((unsigned long *) virt_addr);
> ++				virt_addr = fixup_addr(virt_addr, sizeof(uint32_t));
> ++				*((uint32_t *) virt_addr) = write_val;
> ++				read_result = *((uint32_t *) virt_addr);
> ++				break;
> ++			case 'l':
> ++				virt_addr = fixup_addr(virt_addr, sizeof(uint64_t));
> ++				*((uint64_t *) virt_addr) = write_val;
> ++				read_result = *((uint64_t *) virt_addr);
> + 				break;
> + 		}
> + 		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch b/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
> new file mode 100644
> index 000000000..4517797fc
> --- /dev/null
> +++ b/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
> @@ -0,0 +1,91 @@
> +--- devmem2.c	2004-08-05 01:55:25.000000000 +0200
> ++++ devmem2_modif.c	2011-01-13 15:48:37.798799784 +0100
> +@@ -45,12 +45,16 @@
> + #define MAP_SIZE 4096UL
> + #define MAP_MASK (MAP_SIZE - 1)
> +
> ++static inline void *fixup_addr(void *addr, size_t size);
> ++
> + int main(int argc, char **argv) {
> +     int fd;
> +     void *map_base, *virt_addr;
> +-	unsigned long read_result, writeval;
> ++	unsigned long read_result, write_val;
> + 	off_t target;
> + 	int access_type = 'w';
> ++	char fmt_str[128];
> ++	size_t data_size;
> + 	
> + 	if(argc < 2) {
> + 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
> +@@ -79,38 +83,51 @@
> +     virt_addr = map_base + (target & MAP_MASK);
> +     switch(access_type) {
> + 		case 'b':
> ++			data_size = sizeof(unsigned char);
> ++			virt_addr = fixup_addr(virt_addr, data_size);
> + 			read_result = *((unsigned char *) virt_addr);
> + 			break;
> + 		case 'h':
> ++			data_size = sizeof(unsigned short);
> ++			virt_addr = fixup_addr(virt_addr, data_size);
> + 			read_result = *((unsigned short *) virt_addr);
> + 			break;
> + 		case 'w':
> ++			data_size = sizeof(unsigned long);
> ++			virt_addr = fixup_addr(virt_addr, data_size);
> + 			read_result = *((unsigned long *) virt_addr);
> + 			break;
> + 		default:
> + 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
> + 			exit(2);
> + 	}
> +-    printf("Value at address 0x%X (%p): 0x%X\n", target, virt_addr, read_result);
> ++	sprintf(fmt_str, "Read at address  0x%%08lX (%%p): 0x%%0%dlX\n", 2*data_size);
> ++    printf(fmt_str, (unsigned long)target, virt_addr, read_result);
> +     fflush(stdout);
> +
> + 	if(argc > 3) {
> +-		writeval = strtoul(argv[3], 0, 0);
> ++		write_val = strtoul(argv[3], 0, 0);
> + 		switch(access_type) {
> + 			case 'b':
> +-				*((unsigned char *) virt_addr) = writeval;
> ++				virt_addr = fixup_addr(virt_addr, sizeof(unsigned char));
> ++				*((unsigned char *) virt_addr) = write_val;
> + 				read_result = *((unsigned char *) virt_addr);
> + 				break;
> + 			case 'h':
> +-				*((unsigned short *) virt_addr) = writeval;
> ++				virt_addr = fixup_addr(virt_addr, sizeof(unsigned short));
> ++				*((unsigned short *) virt_addr) = write_val;
> + 				read_result = *((unsigned short *) virt_addr);
> + 				break;
> + 			case 'w':
> +-				*((unsigned long *) virt_addr) = writeval;
> ++				virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
> ++				*((unsigned long *) virt_addr) = write_val;
> + 				read_result = *((unsigned long *) virt_addr);
> + 				break;
> + 		}
> +-		printf("Written 0x%X; readback 0x%X\n", writeval, read_result);
> ++		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
> ++			"readback 0x%%0%dlX\n",	2*data_size, 2*data_size);
> ++		printf(fmt_str, (unsigned long)target, virt_addr,
> ++			write_val, read_result);
> + 		fflush(stdout);
> + 	}
> + 	
> +@@ -119,3 +136,12 @@
> +     return 0;
> + }
> +
> ++static inline void *fixup_addr(void *addr, size_t size)
> ++{
> ++#ifdef FORCE_STRICT_ALIGNMENT
> ++	unsigned long aligned_addr = (unsigned long)addr;
> ++	aligned_addr &= ~(size - 1);
> ++	addr = (void *)aligned_addr;
> ++#endif
> ++	return addr;
> ++}
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97083): https://lists.openembedded.org/g/openembedded-devel/message/97083
> Mute This Topic: https://lists.openembedded.org/mt/91070558/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


