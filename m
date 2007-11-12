Received: from [85.10.209.111] (helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <u.luckas@road.de>) id 1IrW9N-0005iX-Jf
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2007 11:04:13 +0100
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 23E308F0049;
	Mon, 12 Nov 2007 11:02:53 +0100 (CET)
Received: from localhost.localdomain (ulitu.handy-pc.constin.de
	[192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id 08F73AD402B;
	Mon, 12 Nov 2007 11:02:53 +0100 (CET)
Received: from ip6-localhost (unknown [IPv6:::1])
	by localhost.localdomain (Postfix) with ESMTP id D33F5D98C04;
	Mon, 12 Nov 2007 11:02:52 +0100 (CET)
From: Uli Luckas <u.luckas@road.de>
Organization: Road GmbH
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2007 11:02:51 +0100
User-Agent: KMail/1.9.7
References: <200711121044.32094.u.luckas@road.de>
In-Reply-To: <200711121044.32094.u.luckas@road.de>
MIME-Version: 1.0
Message-Id: <200711121102.51877.u.luckas@road.de>
Subject: Re: [PATHC] ATAG export for the linux kernel
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
X-List-Received-Date: Mon, 12 Nov 2007 10:04:13 -0000
Content-Type: text/plain;
  charset="ansi_x3.4-1968"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

And here comes the patch ...

Signed-off-by: Uli Luckas <u.luckas@road.de>
---
 arch/arm/kernel/Makefile |    2 +-
 arch/arm/kernel/atags.c  |  113 
++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/kernel/atags.h  |    2 +
 arch/arm/kernel/setup.c  |    3 +
 4 files changed, 119 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/kernel/atags.c
 create mode 100644 arch/arm/kernel/atags.h

diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index bb28087..188e1d1 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -8,7 +8,7 @@ AFLAGS_head.o := -DTEXT_OFFSET=$(TEXT_OFFSET)
 
 obj-y		:= compat.o entry-armv.o entry-common.o irq.o \
 		   process.o ptrace.o semaphore.o setup.o signal.o sys_arm.o \
-		   time.o traps.o
+		   time.o traps.o atags.o
 
 obj-$(CONFIG_ISA_DMA_API)	+= dma.o
 obj-$(CONFIG_ARCH_ACORN)	+= ecard.o 
diff --git a/arch/arm/kernel/atags.c b/arch/arm/kernel/atags.c
new file mode 100644
index 0000000..f0922a7
--- /dev/null
+++ b/arch/arm/kernel/atags.c
@@ -0,0 +1,113 @@
+#include <asm/setup.h>
+#include <linux/slab.h>
+#include <linux/proc_fs.h>
+#include <asm/page.h>
+
+struct buffer {
+        size_t size;
+        char *data;
+};
+
+static char atags_addr[12];
+
+static struct buffer addr_buffer =
+{
+        .size = sizeof(atags_addr) - 1,
+        .data = atags_addr,
+};
+static struct buffer tags_buffer;
+
+
+static int
+read_buffer(char* page, char** start, off_t off, int count,
+        int* eof, void* data)
+{
+        struct buffer *buffer = (struct buffer *)data;
+
+        if (off >= buffer->size) {
+                *eof = 1;
+                return 0;
+        }
+
+        count = min((int) (buffer->size - off), count);
+
+        memcpy(page, &buffer->data[off], count);
+
+        return count;
+}
+
+
+static int
+create_proc_entries(void)
+{
+        struct proc_dir_entry* atags_dir;
+        struct proc_dir_entry* addr_entry;
+        struct proc_dir_entry* tags_entry;
+
+        atags_dir = proc_mkdir("atags", NULL);
+        if(!atags_dir)
+                return -ENOMEM;
+
+        addr_entry = create_proc_read_entry("addr", 0400, atags_dir, 
read_buffer, &addr_buffer);
+        if(!addr_entry) {
+                remove_proc_entry("atags", NULL);
+                return -ENOMEM;
+        }
+
+        tags_entry = create_proc_read_entry("tags", 0400, atags_dir, 
read_buffer, &tags_buffer);
+        if(!tags_entry) {
+                remove_proc_entry("addr", atags_dir);
+                remove_proc_entry("atags", NULL);
+                return -ENOMEM;
+        }
+
+        return 0;
+}
+
+
+#define BOOT_PARAMS_SIZE 1536
+static unsigned long __initdata atags_phys;
+static char __initdata atags_copy_buf[BOOT_PARAMS_SIZE];
+static char __initdata *atags_copy;
+
+
+void __init save_atags(const unsigned long phys, const struct tag *tags) {
+        atags_phys = phys;
+        atags_copy = atags_copy_buf;
+        memcpy(atags_copy, tags, BOOT_PARAMS_SIZE);
+}
+
+
+static int
+__init init_atags_procfs(void)
+{
+        struct tag *tag;
+        int error;
+
+        if (!atags_copy) {
+                printk(KERN_WARNING "Exporting ATAGs: No saved tags 
found\n");
+                return -EIO;
+        }
+
+        snprintf(atags_addr, sizeof(atags_addr), "0x%08lx\n", atags_phys);
+        for (tag = (struct tag *) atags_copy; tag->hdr.size; tag = 
tag_next(tag))
+                ;
+
+        tags_buffer.size = ((char *) tag - atags_copy) + sizeof(tag->hdr);
+        tags_buffer.data = kmalloc(tags_buffer.size, GFP_KERNEL);
+        if (tags_buffer.data == NULL)
+                return -ENOMEM;
+        memcpy(tags_buffer.data, atags_copy, tags_buffer.size);
+
+        error = create_proc_entries();
+        if (error) {
+                printk(KERN_ERR "Exporting ATAGs: not enough memory\n");
+                kfree(tags_buffer.data);
+                tags_buffer.size = 0;
+                tags_buffer.data = NULL;
+        }
+
+        return error;
+}
+
+arch_initcall(init_atags_procfs);
diff --git a/arch/arm/kernel/atags.h b/arch/arm/kernel/atags.h
new file mode 100644
index 0000000..792c4a8
--- /dev/null
+++ b/arch/arm/kernel/atags.h
@@ -0,0 +1,2 @@
+extern void
+save_atags( unsigned long phys, struct tag *tags);
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 0453dcc..168b975 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -37,6 +37,7 @@
 #include <asm/mach/time.h>
 
 #include "compat.h"
+#include "atags.h"
 
 #ifndef MEM_SIZE
 #define MEM_SIZE	(16*1024*1024)
@@ -798,6 +799,8 @@ void __init setup_arch(char **cmdline_p)
 	if (tags->hdr.tag == ATAG_CORE) {
 		if (meminfo.nr_banks != 0)
 			squash_mem_tags(tags);
+		if (mdesc->boot_params)
+			save_atags(mdesc->boot_params, tags);
 		parse_tags(tags);
 	}
 
-- 
1.5.3.4



