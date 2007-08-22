Received: from [85.10.209.111] (helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <u.luckas@road.de>) id 1INpC1-0007rU-Ft
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2007 14:20:18 +0200
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 1F8AB390001;
	Wed, 22 Aug 2007 14:19:08 +0200 (CEST)
Received: from localhost.localdomain (ulitu.handy-pc.constin.de
	[192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id 1FF2BAD4600;
	Wed, 22 Aug 2007 14:19:07 +0200 (CEST)
Received: from ip6-localhost (ip6-localhost [IPv6:::1])
	by localhost.localdomain (Postfix) with ESMTP id CBF2ED981E5;
	Wed, 22 Aug 2007 14:19:06 +0200 (CEST)
From: Uli Luckas <u.luckas@road.de>
Organization: Road GmbH
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2007 14:19:04 +0200
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200708221419.05234.u.luckas@road.de>
Subject: [PATCH] kexec / ATAGs
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
X-List-Received-Date: Wed, 22 Aug 2007 12:20:20 -0000
X-Groupsio-MsgNum: 2740
Content-Disposition: inline
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_5mCzGa8zs3gmStt"

--Boundary-00=_5mCzGa8zs3gmStt
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I had a problem with kexec on ARM not setting up my memory in the new
kernel [1].
In the above thread two solutions have been proposed, which both were not 
sufficient for my special case. 
The first patch by Thomas Kunze did not set up memory as required by my board, 
the second patch by Mike Westerhof did set up memory (and other ATAGs) but did 
not allow passing of a new command line.

Attached you will find a PATCH to the kexec utility which sets up ATAGs to the 
new kernel.
It sets up ATAGs for the current memory configuration as found in /proc/iomem 
and ATAGs.
Aditionally it sets up ATAGs for a kernel command line and passes an initrd 
image if requested.

This patch applies on top of [2].

I'd like to push my patch upstream but this requires [2] to be upstream.
Could the original author push his patch (or the combined patches) upstream 
please? I'll add a signed-off line below to make it clear, that passing on my 
patch is ok.

Best regards
Uli Luckas

1) "kexec & 2 RAM banks"
http://lists.arm.linux.org.uk/pipermail/linux-arm-kernel/2007-July/041225.html
2) kexec-tools-arm.patch
http://www.openembedded.org/repo/org.openembedded.dev/packages/kexec/kexec-tools-1.101/kexec-tools-arm.patch

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

--Boundary-00=_5mCzGa8zs3gmStt
Content-Type: text/x-diff;
  charset="us-ascii";
  name="kexec-arm-atags.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kexec-arm-atags.patch"

Signed-off-by: Uli Luckas <u.luckas@road.de>

Index: kexec-tools-1.101/kexec/arch/arm/kexec-zImage-arm.c
===================================================================
--- kexec-tools-1.101.orig/kexec/arch/arm/kexec-zImage-arm.c
+++ kexec-tools-1.101/kexec/arch/arm/kexec-zImage-arm.c
@@ -1,11 +1,74 @@
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
+#define tag_size(type)  ((sizeof(struct tag_header) + sizeof(struct type) + 3) >> 2)
+
 int zImage_arm_probe(const char *buf, off_t len)
 {
 	/* 
@@ -14,21 +77,160 @@ int zImage_arm_probe(const char *buf, of
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
+int atag_arm_load(struct kexec_info *info,
+	const char *command_line, off_t command_line_len,
+	const char *initrd, off_t initrd_len)
+{
+	const unsigned long base = 0xa0000000;
+	const unsigned int offset = 0x0100;
+	struct memory_range *range;
+	int ranges;
+	char *buf;
+	off_t len;
+	struct tag *params;
+	int i;
+	uint32_t *initrd_start;
+
+	buf = xmalloc(PAGE_SIZE);
+	if (!buf)
+		return -1;
+
+	memset(buf, 0xff, offset);
+	params = (struct tag *) (buf + offset);
+
+	params->hdr.tag = ATAG_CORE;
+	params->hdr.size = tag_size(tag_core);
+	params->u.core.flags = 0;
+	params->u.core.pagesize = 0;
+	params->u.core.rootdev = 0;
+	params = tag_next(params);
+
+	get_memory_ranges(&range, &ranges);
+	for (i = 0; i < ranges; i++) {
+		if (range[i].type != RANGE_RAM)
+			continue;
+		params->hdr.tag = ATAG_MEM;
+		params->hdr.size = tag_size(tag_mem32);
+		params->u.mem.start = range[i].start;
+		params->u.mem.size = range[i].end - range[i].start;
+		params = tag_next(params);
+	}
+
+	if (initrd) {
+		params->hdr.tag = ATAG_INITRD2;
+		params->hdr.size = tag_size(tag_initrd);
+		initrd_start = &params->u.initrd.start;
+		params->u.initrd.size = initrd_len;
+		params = tag_next(params);
+	}
+
+	if (command_line) {
+		params->hdr.tag = ATAG_CMDLINE;
+		params->hdr.size = (sizeof(struct tag_header) + command_line_len + 3) >> 2;
+		memcpy(params->u.cmdline.cmdline, command_line,
+			command_line_len);
+		params->u.cmdline.cmdline[command_line_len - 1] = '\0';
+		params = tag_next(params);
+	}
+
+	params->hdr.tag = ATAG_NONE;
+	params->hdr.size = 0;
+
+	len = ((unsigned long)params - (unsigned long)buf) + sizeof(struct tag_header);
+
+	add_segment(info, buf, len, base, len);
+	
+	if (initrd) {
+		*initrd_start = locate_hole(info, initrd_len, PAGE_SIZE, range[0].start+ 0x800000, ULONG_MAX, INT_MAX);
+		if (base == ULONG_MAX)
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

--Boundary-00=_5mCzGa8zs3gmStt--
