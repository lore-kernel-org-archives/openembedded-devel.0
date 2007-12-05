Received: from [64.233.184.231] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <hvontres@gmail.com>) id 1J01V5-0001St-9U
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2007 22:09:47 +0100
Received: by wr-out-0506.google.com with SMTP id c30so3468276wra
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2007 13:06:07 -0800 (PST)
Received: by 10.142.232.20 with SMTP id e20mr133529wfh.1196888766041;
	Wed, 05 Dec 2007 13:06:06 -0800 (PST)
Received: by 10.143.11.12 with HTTP; Wed, 5 Dec 2007 13:06:06 -0800 (PST)
Message-ID: <a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>
Date: Wed, 5 Dec 2007 13:06:06 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: "Uli Luckas" <u.luckas@road.de>
In-Reply-To: <200711121102.51877.u.luckas@road.de>
MIME-Version: 1.0
References: <200711121044.32094.u.luckas@road.de>
	<200711121102.51877.u.luckas@road.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 05 Dec 2007 21:09:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 12, 2007 2:02 AM, Uli Luckas <u.luckas@road.de> wrote:

> And here comes the patch ...
>
> Signed-off-by: Uli Luckas <u.luckas@road.de>
> ---
>  arch/arm/kernel/Makefile |    2 +-
>  arch/arm/kernel/atags.c  |  113
> ++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm/kernel/atags.h  |    2 +
>  arch/arm/kernel/setup.c  |    3 +
>  4 files changed, 119 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/kernel/atags.c
>  create mode 100644 arch/arm/kernel/atags.h
>
> diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> index bb28087..188e1d1 100644
> --- a/arch/arm/kernel/Makefile
> +++ b/arch/arm/kernel/Makefile
> @@ -8,7 +8,7 @@ AFLAGS_head.o := -DTEXT_OFFSET=$(TEXT_OFFSET)
>
>  obj-y          := compat.o entry-armv.o entry-common.o irq.o \
>                   process.o ptrace.o semaphore.o setup.o signal.osys_arm.o \
> -                  time.o traps.o
> +                  time.o traps.o atags.o
>
>  obj-$(CONFIG_ISA_DMA_API)      += dma.o
>  obj-$(CONFIG_ARCH_ACORN)       += ecard.o
> diff --git a/arch/arm/kernel/atags.c b/arch/arm/kernel/atags.c
> new file mode 100644
> index 0000000..f0922a7
> --- /dev/null
> +++ b/arch/arm/kernel/atags.c
> @@ -0,0 +1,113 @@
> +#include <asm/setup.h>
> +#include <linux/slab.h>
> +#include <linux/proc_fs.h>
> +#include <asm/page.h>
> +
> +struct buffer {
> +        size_t size;
> +        char *data;
> +};
> +
> +static char atags_addr[12];
> +
> +static struct buffer addr_buffer =
> +{
> +        .size = sizeof(atags_addr) - 1,
> +        .data = atags_addr,
> +};
> +static struct buffer tags_buffer;
> +
> +
> +static int
> +read_buffer(char* page, char** start, off_t off, int count,
> +        int* eof, void* data)
> +{
> +        struct buffer *buffer = (struct buffer *)data;
> +
> +        if (off >= buffer->size) {
> +                *eof = 1;
> +                return 0;
> +        }
> +
> +        count = min((int) (buffer->size - off), count);
> +
> +        memcpy(page, &buffer->data[off], count);
> +
> +        return count;
> +}
> +
> +
> +static int
> +create_proc_entries(void)
> +{
> +        struct proc_dir_entry* atags_dir;
> +        struct proc_dir_entry* addr_entry;
> +        struct proc_dir_entry* tags_entry;
> +
> +        atags_dir = proc_mkdir("atags", NULL);
> +        if(!atags_dir)
> +                return -ENOMEM;
> +
> +        addr_entry = create_proc_read_entry("addr", 0400, atags_dir,
> read_buffer, &addr_buffer);
> +        if(!addr_entry) {
> +                remove_proc_entry("atags", NULL);
> +                return -ENOMEM;
> +        }
> +
> +        tags_entry = create_proc_read_entry("tags", 0400, atags_dir,
> read_buffer, &tags_buffer);
> +        if(!tags_entry) {
> +                remove_proc_entry("addr", atags_dir);
> +                remove_proc_entry("atags", NULL);
> +                return -ENOMEM;
> +        }
> +
> +        return 0;
> +}
> +
> +
> +#define BOOT_PARAMS_SIZE 1536
> +static unsigned long __initdata atags_phys;
> +static char __initdata atags_copy_buf[BOOT_PARAMS_SIZE];
> +static char __initdata *atags_copy;
> +
> +
> +void __init save_atags(const unsigned long phys, const struct tag *tags)
> {
> +        atags_phys = phys;
> +        atags_copy = atags_copy_buf;
> +        memcpy(atags_copy, tags, BOOT_PARAMS_SIZE);
> +}
> +
> +
> +static int
> +__init init_atags_procfs(void)
> +{
> +        struct tag *tag;
> +        int error;
> +
> +        if (!atags_copy) {
> +                printk(KERN_WARNING "Exporting ATAGs: No saved tags
> found\n");
> +                return -EIO;
> +        }
> +
> +        snprintf(atags_addr, sizeof(atags_addr), "0x%08lx\n",
> atags_phys);
> +        for (tag = (struct tag *) atags_copy; tag->hdr.size; tag =
> tag_next(tag))
> +                ;
> +
> +        tags_buffer.size = ((char *) tag - atags_copy) +
> sizeof(tag->hdr);
> +        tags_buffer.data = kmalloc(tags_buffer.size, GFP_KERNEL);
> +        if (tags_buffer.data == NULL)
> +                return -ENOMEM;
> +        memcpy(tags_buffer.data, atags_copy, tags_buffer.size);
> +
> +        error = create_proc_entries();
> +        if (error) {
> +                printk(KERN_ERR "Exporting ATAGs: not enough memory\n");
> +                kfree(tags_buffer.data);
> +                tags_buffer.size = 0;
> +                tags_buffer.data = NULL;
> +        }
> +
> +        return error;
> +}
> +
> +arch_initcall(init_atags_procfs);
> diff --git a/arch/arm/kernel/atags.h b/arch/arm/kernel/atags.h
> new file mode 100644
> index 0000000..792c4a8
> --- /dev/null
> +++ b/arch/arm/kernel/atags.h
> @@ -0,0 +1,2 @@
> +extern void
> +save_atags( unsigned long phys, struct tag *tags);
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 0453dcc..168b975 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -37,6 +37,7 @@
>  #include <asm/mach/time.h>
>
>  #include "compat.h"
> +#include "atags.h"
>
>  #ifndef MEM_SIZE
>  #define MEM_SIZE       (16*1024*1024)
> @@ -798,6 +799,8 @@ void __init setup_arch(char **cmdline_p)
>        if (tags->hdr.tag == ATAG_CORE) {
>                if (meminfo.nr_banks != 0)
>                        squash_mem_tags(tags);
> +               if (mdesc->boot_params)
> +                       save_atags(mdesc->boot_params, tags);
>                parse_tags(tags);
>        }
>
> --
> 1.5.3.4
>
>
Tested on 2.6.21 and 2.6.17 for poodle. Thank you very much. Any Chance you
could push this upstream?

-- 
Henry von Tresckow (hvontres)

