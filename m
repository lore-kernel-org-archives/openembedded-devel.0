Received: from [85.10.209.111] (helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <u.luckas@road.de>) id 1IrWcY-0001zE-9u
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2007 11:34:22 +0100
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id A09918F0050;
	Mon, 12 Nov 2007 11:33:01 +0100 (CET)
Received: from localhost.localdomain (ulitu.handy-pc.constin.de
	[192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id 7B2FEAD402B;
	Mon, 12 Nov 2007 11:33:01 +0100 (CET)
Received: from ip6-localhost (unknown [IPv6:::1])
	by localhost.localdomain (Postfix) with ESMTP id 54333D98C04;
	Mon, 12 Nov 2007 11:33:01 +0100 (CET)
From: Uli Luckas <u.luckas@road.de>
Organization: Road GmbH
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2007 11:32:59 +0100
User-Agent: KMail/1.9.7
MIME-Version: 1.0
X-Length: 1218
X-UID: 6
Message-Id: <200711121133.00600.u.luckas@road.de>
Subject: [PATCH] Userspace ATAG support for kexec
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2007 10:34:22 -0000
X-Groupsio-MsgNum: 3317
Content-Disposition: inline
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_cvCOH+rMLkJVdYg"

--Boundary-00=_cvCOH+rMLkJVdYg
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch for the kexec userspace tool adds support for propperly setting up 
ATAGs for the kexeced kernel. 
It uses information exported via /proc/atags to preserve all ATAGs except 
ATAG_INITRD, ATAG_INITRD2 and ATAG_CMDLINE. The ATAG_INITRD2 and ATAG_CMDLINE 
tags are set up according to command line options.
To start a kernel with nfs root via the usb gadget device for example a 
command line like this could be used:
kexec -l zImage --append="root=nfs nfsroot=192.168.1.1\:/oe-linux-rootfs 
ip=192.168.1.2:192.168.1.1:192.168.1.1:255.255.255.0:gadget:usb0:off rw"

This patch should be applied ontop of openembedded's "kexec-tools-arm.patch".
The patch posted in "[PATHC] ATAG export for the linux kernel" needs to be 
applied to the running kernel.

regards,
Uli Luckas

-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit

--Boundary-00=_cvCOH+rMLkJVdYg
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="kexec-arm-atags.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kexec-arm-atags.patch"

Index: kexec-tools-1.101/kexec/arch/arm/kexec-zImage-arm.c
===================================================================
--- kexec-tools-1.101.orig/kexec/arch/arm/kexec-zImage-arm.c
+++ kexec-tools-1.101/kexec/arch/arm/kexec-zImage-arm.c
@@ -1,11 +1,83 @@
+/*
+ * - 08/21/2007 ATAG support added by Uli Luckas <u.luckas@road.de>
+ *
+ */
 #define _GNU_SOURCE
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
 #include <errno.h>
 #include <limits.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <arch/options.h>
+#include <asm/page.h>
 #include "../../kexec.h"
 
+#define COMMAND_LINE_SIZE 1024
+#define BOOT_PARAMS_SIZE 1536
+
+struct tag_header {
+	uint32_t size;
+	uint32_t tag;
+};
+
+/* The list must start with an ATAG_CORE node */
+#define ATAG_CORE       0x54410001
+
+struct tag_core {
+	uint32_t flags;	    /* bit 0 = read-only */
+	uint32_t pagesize;
+	uint32_t rootdev;
+};
+
+/* it is allowed to have multiple ATAG_MEM nodes */
+#define ATAG_MEM	0x54410002
+
+struct tag_mem32 {
+	uint32_t   size;
+	uint32_t   start;  /* physical start address */
+};
+
+/* describes where the compressed ramdisk image lives (virtual address) */
+/*
+ * this one accidentally used virtual addresses - as such,
+ * it's deprecated.
+ */
+#define ATAG_INITRD     0x54410005
+
+/* describes where the compressed ramdisk image lives (physical address) */
+#define ATAG_INITRD2    0x54420005
+
+struct tag_initrd {
+        uint32_t start;    /* physical start address */
+        uint32_t size;     /* size of compressed ramdisk image in bytes */
+};
+
+/* command line: \0 terminated string */
+#define ATAG_CMDLINE    0x54410009
+
+struct tag_cmdline {
+	char    cmdline[1];     /* this is the minimum size */
+};
+
+/* The list ends with an ATAG_NONE node. */
+#define ATAG_NONE       0x00000000
+
+struct tag {
+	struct tag_header hdr;
+	union {
+		struct tag_core	 core;
+		struct tag_mem32	mem;
+		struct tag_initrd       initrd;
+		struct tag_cmdline      cmdline;
+	} u;
+};
+
+#define tag_next(t)     ((struct tag *)((uint32_t *)(t) + (t)->hdr.size))
+#define byte_size(t)    ((t)->hdr.size << 2)
+#define tag_size(type)  ((sizeof(struct tag_header) + sizeof(struct type) + 3) >> 2)
+
 int zImage_arm_probe(const char *buf, off_t len)
 {
 	/* 
@@ -14,21 +86,223 @@ int zImage_arm_probe(const char *buf, of
 	 */	
 	return 0;
 }
+
 void zImage_arm_usage(void)
 {
+	printf(	"     --command-line=STRING Set the kernel command line to STRING.\n"
+		"     --append=STRING       Set the kernel command line to STRING.\n"
+		"     --initrd=FILE         Use FILE as the kernel's initial ramdisk.\n"
+		"     --ramdisk=FILE        Use FILE as the kernel's initial ramdisk.\n"
+		);
 }
-int zImage_arm_load(int argc, char **argv, const char *buf, off_t len, 
+
+static
+unsigned long atag_read_addr(void)
+{
+	unsigned long addr;
+	int ret;
+	const char fn[]= "/proc/atags/addr";
+	FILE *fp;
+	fp = fopen(fn, "r");
+	if (!fp) {
+		fprintf(stderr, "Cannot open %s: %s\n", 
+			fn, strerror(errno));
+		return 0;
+	}
+	ret = fscanf(fp, "0x%08lx", &addr);
+	if (ret != 1) {
+		if (ferror(fp)) {
+			fprintf(stderr, "Cannot read %s: %s\n",
+				fn, strerror(errno));
+		} else {
+			fprintf(stderr, "Cannot parse %s (%d)\n",
+				fn, ret);
+		}
+		fclose(fp);
+		return 0;
+	}
+
+	fclose(fp);
+	return addr;
+}
+
+
+static
+struct tag * atag_read_tags(void)
+{
+	static unsigned long buf[BOOT_PARAMS_SIZE];
+	const char fn[]= "/proc/atags/tags";
+	FILE *fp;
+	fp = fopen(fn, "r");
+	if (!fp) {
+		fprintf(stderr, "Cannot open %s: %s\n", 
+			fn, strerror(errno));
+		return NULL;
+	}
+
+	fread(buf, sizeof(buf[1]), BOOT_PARAMS_SIZE, fp);
+	if (ferror(fp)) {
+		fprintf(stderr, "Cannot read %s: %s\n",
+			fn, strerror(errno));
+		fclose(fp);
+		return NULL;
+	}
+
+	fclose(fp);
+	return (struct tag *) buf;
+}
+
+
+static
+int atag_arm_load(struct kexec_info *info,
+	const char *command_line, off_t command_line_len,
+	const char *initrd, off_t initrd_len)
+{
+	const unsigned long addr = atag_read_addr();
+	const unsigned long base = addr & ~(getpagesize()-1);
+	const unsigned int offset = addr & (getpagesize()-1);
+	struct tag *saved_tags = atag_read_tags();
+	char *buf;
+	off_t len;
+	struct tag *params;
+	uint32_t *initrd_start;
+
+	if (!addr || !saved_tags)
+		return -1;
+	
+	buf = xmalloc(getpagesize());
+	if (!buf) {
+		fprintf(stderr, "Compiling ATAGs: out of memory\n");
+		return -1;
+	}
+
+	memset(buf, 0xff, getpagesize());
+	params = (struct tag *) (buf + offset);
+
+	// Copy tags
+	saved_tags = (struct tag *) saved_tags;
+	while(byte_size(saved_tags)) {
+		switch (saved_tags->hdr.tag) {
+		case ATAG_INITRD:
+		case ATAG_INITRD2:
+		case ATAG_CMDLINE:
+			// skip these tags
+			break;
+		default:
+			// copy all other tags
+			memcpy(params, saved_tags, byte_size(saved_tags));
+			params = tag_next(params);
+		}
+		saved_tags = tag_next(saved_tags);
+	}
+
+	if (initrd) {
+		params->hdr.size = tag_size(tag_initrd);
+		params->hdr.tag = ATAG_INITRD2;
+		initrd_start = &params->u.initrd.start;
+		params->u.initrd.size = initrd_len;
+		params = tag_next(params);
+	}
+
+	if (command_line) {
+		params->hdr.size = (sizeof(struct tag_header) + command_line_len + 3) >> 2;
+		params->hdr.tag = ATAG_CMDLINE;
+		memcpy(params->u.cmdline.cmdline, command_line,
+			command_line_len);
+		params->u.cmdline.cmdline[command_line_len - 1] = '\0';
+		params = tag_next(params);
+	}
+
+	params->hdr.size = 0;
+	params->hdr.tag = ATAG_NONE;
+
+	len = ((char *)params - buf) + sizeof(struct tag_header);
+
+	add_segment(info, buf, len, base, len);
+
+	if (initrd) {
+		struct memory_range *range;
+		int ranges;
+		get_memory_ranges(&range, &ranges);
+		*initrd_start = locate_hole(info, initrd_len, getpagesize(), range[0].start + 0x800000, ULONG_MAX, INT_MAX);
+		if (*initrd_start == ULONG_MAX)
+			return -1;
+		add_segment(info, initrd, initrd_len, *initrd_start, initrd_len);
+	}
+
+	return 0;
+}
+
+int zImage_arm_load(int argc, char **argv, const char *buf, off_t len,
 	struct kexec_info *info)
 {
 	unsigned long base;
 	unsigned int offset = 0x8000; /* 32k offset from memory start */
+	const char *command_line;
+	off_t command_line_len;
+	const char *ramdisk;
+	char *ramdisk_buf;
+	off_t ramdisk_length;
+	int opt;
+#define OPT_APPEND	'a'
+#define OPT_RAMDISK	'r'
+	static const struct option options[] = {
+		KEXEC_ARCH_OPTIONS
+		{ "command-line",	1, 0, OPT_APPEND },
+		{ "append",		1, 0, OPT_APPEND },
+		{ "initrd",		1, 0, OPT_RAMDISK },
+		{ "ramdisk",		1, 0, OPT_RAMDISK },
+		{ 0, 			0, 0, 0 },
+	};
+	static const char short_options[] = KEXEC_ARCH_OPT_STR "a:r:";
+
+	/*
+	 * Parse the command line arguments
+	 */
+	command_line = 0;
+	command_line_len = 0;
+	ramdisk = 0;
+	ramdisk_buf = 0;
+	ramdisk_length = 0;
+	while((opt = getopt_long(argc, argv, short_options, options, 0)) != -1) {
+		switch(opt) {
+		default:
+			/* Ignore core options */
+			if (opt < OPT_ARCH_MAX) {
+				break;
+			}
+		case '?':
+			usage();
+			return -1;
+		case OPT_APPEND:
+			command_line = optarg;
+			break;
+		case OPT_RAMDISK:
+			ramdisk = optarg;
+			break;
+		}
+	}
+	if (command_line) {
+		command_line_len = strlen(command_line) + 1;
+		if (command_line_len > COMMAND_LINE_SIZE)
+			command_line_len = COMMAND_LINE_SIZE;
+	}
+	if (ramdisk) {
+		ramdisk_buf = slurp_file(ramdisk, &ramdisk_length);
+	}
+
+	if(atag_arm_load(info,
+			 command_line, command_line_len,
+			 ramdisk_buf, ramdisk_length)    == -1)
+		return -1;
+
 	base = locate_hole(info,len+offset,0,0,ULONG_MAX,INT_MAX);
 	if (base == ULONG_MAX)
-	{
 		return -1;
-	}
+ 
 	base += offset;
 	add_segment(info,buf,len,base,len);
 	info->entry = (void*)base;
+
 	return 0;
 }

--Boundary-00=_cvCOH+rMLkJVdYg--
