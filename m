Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MM5T6-0002h2-28
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:27:44 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MM5HW-0005Gi-6Y
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 19:15:46 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:15:46 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:15:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Jul 2009 21:15:35 +0200
Message-ID: <h2gckn$bts$1@ger.gmane.org>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
	<1246474461-16671-8-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090622 Shredder/3.0b3pre
In-Reply-To: <1246474461-16671-8-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 013/125] qemu 0.10.3: port OE patches, make preferable version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jul 2009 19:27:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-07-09 20:54, Marcin Juszkiewicz wrote:
> From: Roman I Khimov<khimov@altell.ru>
>
> Fixes binary locale generation broken by
> 6065fa491c009118ae282ae933215649cccfcd24.
>
> Tested to work on ARM OABI (simpad), ARM EABI (qemuarm), PowerPC (efika)
> and i686 (x86-prescott).
>
> Acked-by: Philipp Zabel<philipp.zabel@gmail.com>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   recipes/qemu/qemu-0.10.3/06_exit_segfault.patch    |   45 ++++++++++++++++
>   recipes/qemu/qemu-0.10.3/11_signal_sigaction.patch |   21 ++++++++
>   recipes/qemu/qemu-0.10.3/22_net_tuntap_stall.patch |   13 +++++
>   recipes/qemu/qemu-0.10.3/31_syscalls.patch         |   22 ++++++++
>   recipes/qemu/qemu-0.10.3/32_syscall_sysctl.patch   |   55 ++++++++++++++++++++
>   recipes/qemu/qemu-0.10.3/52_ne2000_return.patch    |   17 ++++++
>   recipes/qemu/qemu-0.10.3/61_safe_64bit_int.patch   |   27 ++++++++++
>   recipes/qemu/qemu-0.10.3/63_sparc_build.patch      |   18 ++++++
>   .../qemu/qemu-0.10.3/64_ppc_asm_constraints.patch  |   18 ++++++
>   recipes/qemu/qemu-0.10.3/66_tls_ld.patch           |   55 ++++++++++++++++++++
>   recipes/qemu/qemu-0.10.3/91-oh-sdl-cursor.patch    |   18 ++++++
>   .../qemu/qemu-0.10.3/fix_baum_c_compilation.patch  |   30 +++++++++++
>   recipes/qemu/qemu-0.10.3/fix_segfault.patch        |   37 +++++++++++++
>   recipes/qemu/qemu-0.10.3/no-strip.patch            |   26 +++++++++
>   recipes/qemu/qemu_0.10.3.bb                        |   17 +++++-
>   15 files changed, 417 insertions(+), 2 deletions(-)
>   create mode 100644 recipes/qemu/qemu-0.10.3/06_exit_segfault.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/11_signal_sigaction.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/22_net_tuntap_stall.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/31_syscalls.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/32_syscall_sysctl.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/52_ne2000_return.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/61_safe_64bit_int.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/63_sparc_build.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/64_ppc_asm_constraints.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/66_tls_ld.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/91-oh-sdl-cursor.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/fix_baum_c_compilation.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/fix_segfault.patch
>   create mode 100644 recipes/qemu/qemu-0.10.3/no-strip.patch
>
> diff --git a/recipes/qemu/qemu-0.10.3/06_exit_segfault.patch b/recipes/qemu/qemu-0.10.3/06_exit_segfault.patch
> new file mode 100644
> index 0000000..bc02d31
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/06_exit_segfault.patch
> @@ -0,0 +1,45 @@
> +#DPATCHLEVEL=0
> +---
> +# linux-user/main.c |    8 ++++----
> +# 1 file changed, 4 insertions(+), 4 deletions(-)
> +#
> +Index: linux-user/main.c
> +===================================================================
> +--- linux-user/main.c.orig	2008-04-24 20:15:46.000000000 +0100
> ++++ linux-user/main.c	2008-04-24 20:15:53.000000000 +0100
> +@@ -765,7 +765,7 @@
> +         default:
> +             printf ("Unhandled trap: 0x%x\n", trapnr);
> +             cpu_dump_state(env, stderr, fprintf, 0);
> +-            exit (1);
> ++            _exit (1);
> +         }
> +         process_pending_signals (env);
> +     }
> +@@ -1697,7 +1697,7 @@
> +         default:
> +             printf ("Unhandled trap: 0x%x\n", trapnr);
> +             cpu_dump_state(env, stderr, fprintf, 0);
> +-            exit (1);
> ++            _exit (1);
> +         }
> +         process_pending_signals (env);
> +     }
> +@@ -2026,7 +2026,7 @@
> +                 for(item = cpu_log_items; item->mask != 0; item++) {
> +                     printf("%-10s %s\n", item->name, item->help);
> +                 }
> +-                exit(1);
> ++                _exit(1);
> +             }
> +             cpu_set_log(mask);
> +         } else if (!strcmp(r, "s")) {
> +@@ -2045,7 +2045,7 @@
> +             if (qemu_host_page_size == 0 ||
> +                 (qemu_host_page_size&  (qemu_host_page_size - 1)) != 0) {
> +                 fprintf(stderr, "page size must be a power of two\n");
> +-                exit(1);
> ++                _exit(1);
> +             }
> +         } else if (!strcmp(r, "g")) {
> +             gdbstub_port = atoi(argv[optind++]);
> diff --git a/recipes/qemu/qemu-0.10.3/11_signal_sigaction.patch b/recipes/qemu/qemu-0.10.3/11_signal_sigaction.patch
> new file mode 100644
> index 0000000..cd56541
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/11_signal_sigaction.patch
> @@ -0,0 +1,21 @@
> +#DPATCHLEVEL=0
> +---
> +# linux-user/signal.c |    5 +++++
> +# 1 file changed, 5 insertions(+)
> +#
> +Index: linux-user/signal.c
> +===================================================================
> +--- linux-user/signal.c.orig	2008-04-24 20:15:55.000000000 +0100
> ++++ linux-user/signal.c	2008-04-24 20:15:57.000000000 +0100
> +@@ -512,6 +512,11 @@
> +
> +     if (sig<  1 || sig>  TARGET_NSIG || sig == SIGKILL || sig == SIGSTOP)
> +         return -EINVAL;
> ++
> ++    /* no point doing the stuff as those are not allowed for sigaction */
> ++    if ((sig == TARGET_SIGKILL) || (sig == TARGET_SIGSTOP))
> ++        return -EINVAL;
> ++
> +     k =&sigact_table[sig - 1];
> + #if defined(DEBUG_SIGNAL)
> +     fprintf(stderr, "sigaction sig=%d act=0x%08x, oact=0x%08x\n",
> diff --git a/recipes/qemu/qemu-0.10.3/22_net_tuntap_stall.patch b/recipes/qemu/qemu-0.10.3/22_net_tuntap_stall.patch
> new file mode 100644
> index 0000000..993960b
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/22_net_tuntap_stall.patch
> @@ -0,0 +1,13 @@
> +Index: qemu-0.10.3/net.c
> +===================================================================
> +--- qemu-0.10.3.orig/net.c	2009-05-19 17:46:54.650870195 +0400
> ++++ qemu-0.10.3/net.c	2009-05-19 17:47:05.612854521 +0400
> +@@ -955,7 +955,7 @@
> +         return -1;
> +     }
> +     memset(&ifr, 0, sizeof(ifr));
> +-    ifr.ifr_flags = IFF_TAP | IFF_NO_PI;
> ++    ifr.ifr_flags = IFF_TAP | IFF_NO_PI | IFF_ONE_QUEUE;
> +     if (ifname[0] != '\0')
> +         pstrcpy(ifr.ifr_name, IFNAMSIZ, ifname);
> +     else
> diff --git a/recipes/qemu/qemu-0.10.3/31_syscalls.patch b/recipes/qemu/qemu-0.10.3/31_syscalls.patch
> new file mode 100644
> index 0000000..20a1499
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/31_syscalls.patch
> @@ -0,0 +1,22 @@
> +Index: linux-user/syscall.c
> +===================================================================
> +--- linux-user/syscall.c.orig	2008-04-24 20:15:46.000000000 +0100
> ++++ linux-user/syscall.c	2008-04-24 20:15:59.000000000 +0100
> +@@ -250,6 +250,7 @@
> + extern int setresgid(gid_t, gid_t, gid_t);
> + extern int getresgid(gid_t *, gid_t *, gid_t *);
> + extern int setgroups(int, gid_t *);
> ++extern int uselib(const char*);
> +
> + #define ERRNO_TABLE_SIZE 1200
> +
> +@@ -4041,7 +4042,8 @@
> + #endif
> + #ifdef TARGET_NR_uselib
> +     case TARGET_NR_uselib:
> +-        goto unimplemented;
> ++        ret = get_errno(uselib(path((const char*)arg1)));
> ++        break;
> + #endif
> + #ifdef TARGET_NR_swapon
> +     case TARGET_NR_swapon:
> diff --git a/recipes/qemu/qemu-0.10.3/32_syscall_sysctl.patch b/recipes/qemu/qemu-0.10.3/32_syscall_sysctl.patch
> new file mode 100644
> index 0000000..2a670c9
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/32_syscall_sysctl.patch
> @@ -0,0 +1,55 @@
> +#DPATCHLEVEL=0
> +---
> +# linux-user/syscall.c |   32 +++++++++++++++++++++++++++++---
> +# 1 file changed, 29 insertions(+), 3 deletions(-)
> +#
> +Index: linux-user/syscall.c
> +===================================================================
> +--- linux-user/syscall.c.orig	2009-05-19 17:50:28.000000000 +0400
> ++++ linux-user/syscall.c	2009-05-19 17:52:19.094103462 +0400
> +@@ -55,6 +55,7 @@
> + #include<netinet/ip.h>
> + #include<netinet/tcp.h>
> + #include<qemu-common.h>
> ++#include<sys/sysctl.h>
> + #ifdef HAVE_GPROF
> + #include<sys/gmon.h>
> + #endif
> +@@ -5193,9 +5194,34 @@
> +         break;
> + #endif
> +     case TARGET_NR__sysctl:
> +-        /* We don't implement this, but ENOTDIR is always a safe
> +-           return value. */
> +-        ret = -TARGET_ENOTDIR;
> ++        {
> ++            struct __sysctl_args *args = (struct __sysctl_args *) arg1;
> ++            int *name_target, *name, nlen, *oldlenp, oldlen, newlen, i;
> ++            void *oldval, *newval;
> ++
> ++            name_target = (int *) tswapl((long) args->name);
> ++            nlen = tswapl(args->nlen);
> ++            oldval = (void *) tswapl((long) args->oldval);
> ++            oldlenp = (int *) tswapl((long) args->oldlenp);
> ++            oldlen = tswapl(*oldlenp);
> ++            newval = (void *) tswapl((long) args->newval);
> ++            newlen = tswapl(args->newlen);
> ++
> ++            name = alloca(nlen * sizeof (int));
> ++            for (i = 0; i<  nlen; i++)
> ++                name[i] = tswapl(name_target[i]);
> ++
> ++            if (nlen == 2&&  name[0] == CTL_KERN&&  name[1] == KERN_VERSION) {
> ++                ret = get_errno(
> ++                        sysctl(name, nlen, oldval,&oldlen, newval, newlen));
> ++                if (!is_error(ret)) {
> ++                    *oldlenp = tswapl(oldlen);
> ++                }
> ++            } else {
> ++                gemu_log("qemu: Unsupported sysctl name\n");
> ++                ret = -ENOSYS;
> ++            }
> ++        }
> +         break;
> +     case TARGET_NR_sched_setparam:
> +         {
> diff --git a/recipes/qemu/qemu-0.10.3/52_ne2000_return.patch b/recipes/qemu/qemu-0.10.3/52_ne2000_return.patch
> new file mode 100644
> index 0000000..e364bff
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/52_ne2000_return.patch
> @@ -0,0 +1,17 @@
> +---
> + hw/ne2000.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: trunk/hw/ne2000.c
> +===================================================================
> +--- trunk.orig/hw/ne2000.c	2008-04-24 20:15:46.000000000 +0100
> ++++ trunk/hw/ne2000.c	2008-04-24 20:16:05.000000000 +0100
> +@@ -217,7 +217,7 @@
> +     NE2000State *s = opaque;
> +
> +     if (s->cmd&  E8390_STOP)
> +-        return 1;
> ++        return 0;
> +     return !ne2000_buffer_full(s);
> + }
> +
> diff --git a/recipes/qemu/qemu-0.10.3/61_safe_64bit_int.patch b/recipes/qemu/qemu-0.10.3/61_safe_64bit_int.patch
> new file mode 100644
> index 0000000..80e7b22
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/61_safe_64bit_int.patch
> @@ -0,0 +1,27 @@
> +#DPATCHLEVEL=0
> +---
> +# dyngen-exec.h |    4 ++--
> +# 1 file changed, 2 insertions(+), 2 deletions(-)
> +#
> +Index: dyngen-exec.h
> +===================================================================
> +--- dyngen-exec.h.orig	2009-05-01 21:02:44.000000000 +0400
> ++++ dyngen-exec.h	2009-05-19 17:56:28.164854448 +0400
> +@@ -41,7 +41,7 @@
> + // Linux/Sparc64 defines uint64_t
> + #if !(defined (__sparc_v9__)&&  defined(__linux__))&&  !(defined(__APPLE__)&&  defined(__x86_64__))
> + /* XXX may be done for all 64 bits targets ? */
> +-#if defined (__x86_64__) || defined(__ia64) || defined(__s390x__) || defined(__alpha__) || defined(_ARCH_PPC64)
> ++#if defined (__x86_64__) || defined(__ia64) || defined(__s390x__) || defined(__alpha__) || defined(_ARCH_PPC64) || defined(__sparc__)
> + typedef unsigned long uint64_t;
> + #else
> + typedef unsigned long long uint64_t;
> +@@ -58,7 +58,7 @@
> + typedef signed int int32_t;
> + // Linux/Sparc64 defines int64_t
> + #if !(defined (__sparc_v9__)&&  defined(__linux__))&&  !(defined(__APPLE__)&&  defined(__x86_64__))
> +-#if defined (__x86_64__) || defined(__ia64) || defined(__s390x__) || defined(__alpha__) || defined(_ARCH_PPC64)
> ++#if defined (__x86_64__) || defined(__ia64) || defined(__s390x__) || defined(__alpha__) || defined(_ARCH_PPC64) || defined(__sparc__)
> + typedef signed long int64_t;
> + #else
> + typedef signed long long int64_t;
> diff --git a/recipes/qemu/qemu-0.10.3/63_sparc_build.patch b/recipes/qemu/qemu-0.10.3/63_sparc_build.patch
> new file mode 100644
> index 0000000..097f55a
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/63_sparc_build.patch
> @@ -0,0 +1,18 @@
> +#DPATCHLEVEL=0
> +---
> +# sparc.ld |    2 +-
> +# 1 file changed, 1 insertion(+), 1 deletion(-)
> +#
> +Index: sparc.ld
> +===================================================================
> +--- sparc.ld.orig	2008-04-24 20:15:46.000000000 +0100
> ++++ sparc.ld	2008-04-24 20:16:07.000000000 +0100
> +@@ -6,7 +6,7 @@
> + SECTIONS
> + {
> +   /* Read-only sections, merged into text segment: */
> +-  . = 0x60000000 + SIZEOF_HEADERS;
> ++  . = 0x60000000 + 0x400;
> +   .interp     : { *(.interp)    }
> +   .hash          : { *(.hash)           }
> +   .dynsym        : { *(.dynsym)         }
> diff --git a/recipes/qemu/qemu-0.10.3/64_ppc_asm_constraints.patch b/recipes/qemu/qemu-0.10.3/64_ppc_asm_constraints.patch
> new file mode 100644
> index 0000000..7562daf
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/64_ppc_asm_constraints.patch
> @@ -0,0 +1,18 @@
> +#DPATCHLEVEL=1
> +---
> +# cpu-all.h |    2 +-
> +# 1 file changed, 1 insertion(+), 1 deletion(-)
> +#
> +Index: qemu-0.10.3/cpu-all.h
> +===================================================================
> +--- qemu-0.10.3.orig/cpu-all.h	2009-05-01 21:02:44.000000000 +0400
> ++++ qemu-0.10.3/cpu-all.h	2009-05-19 17:59:28.357103179 +0400
> +@@ -288,7 +288,7 @@
> + static inline void stl_le_p(void *ptr, int v)
> + {
> + #ifdef _ARCH_PPC
> +-    __asm__ __volatile__ ("stwbrx %1,0,%2" : "=m" (*(uint32_t *)ptr) : "r" (v), "r" (ptr));
> ++     __asm__ __volatile__ ("stwbrx %0,0,%1" : : "r" (v), "r" (ptr) : "memory");
> + #else
> +     uint8_t *p = ptr;
> +     p[0] = v;
> diff --git a/recipes/qemu/qemu-0.10.3/66_tls_ld.patch b/recipes/qemu/qemu-0.10.3/66_tls_ld.patch
> new file mode 100644
> index 0000000..cbd3f87
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/66_tls_ld.patch
> @@ -0,0 +1,55 @@
> +---
> + arm.ld  |    7 +++++++
> + i386.ld |    7 +++++++
> + 2 files changed, 14 insertions(+)
> +
> +Index: arm.ld
> +===================================================================
> +--- arm.ld.orig	2008-04-24 20:15:45.000000000 +0100
> ++++ arm.ld	2008-04-24 20:16:11.000000000 +0100
> +@@ -26,6 +26,10 @@
> +     { *(.rel.rodata) *(.rel.gnu.linkonce.r*) }
> +   .rela.rodata   :
> +     { *(.rela.rodata) *(.rela.gnu.linkonce.r*) }
> ++  .rel.tdata     : { *(.rel.tdata .rel.tdata.* .rel.gnu.linkonce.td.*) }
> ++  .rela.tdata    : { *(.rela.tdata .rela.tdata.* .rela.gnu.linkonce.td.*) }
> ++  .rel.tbss      : { *(.rel.tbss .rel.tbss.* .rel.gnu.linkonce.tb.*) }
> ++  .rela.tbss     : { *(.rela.tbss .rela.tbss.* .rela.gnu.linkonce.tb.*) }
> +   .rel.got       : { *(.rel.got)		}
> +   .rela.got      : { *(.rela.got)		}
> +   .rel.ctors     : { *(.rel.ctors)	}
> +@@ -58,6 +62,9 @@
> +   .ARM.exidx   : { *(.ARM.exidx* .gnu.linkonce.armexidx.*) }
> +    __exidx_end = .;
> +   .reginfo : { *(.reginfo) }
> ++  /* Thread Local Storage sections  */
> ++  .tdata	  : { *(.tdata .tdata.* .gnu.linkonce.td.*) }
> ++  .tbss		  : { *(.tbss .tbss.* .gnu.linkonce.tb.*) *(.tcommon) }
> +   /* Adjust the address for the data segment.  We want to adjust up to
> +      the same address within the page on the next page up.  */
> +   . = ALIGN(0x100000) + (.&  (0x100000 - 1));
> +Index: i386.ld
> +===================================================================
> +--- i386.ld.orig	2008-04-24 20:15:45.000000000 +0100
> ++++ i386.ld	2008-04-24 20:16:11.000000000 +0100
> +@@ -28,6 +28,10 @@
> +     { *(.rel.rodata) *(.rel.gnu.linkonce.r*) }
> +   .rela.rodata   :
> +     { *(.rela.rodata) *(.rela.gnu.linkonce.r*) }
> ++  .rel.tdata     : { *(.rel.tdata .rel.tdata.* .rel.gnu.linkonce.td.*) }
> ++  .rela.tdata    : { *(.rela.tdata .rela.tdata.* .rela.gnu.linkonce.td.*) }
> ++  .rel.tbss      : { *(.rel.tbss .rel.tbss.* .rel.gnu.linkonce.tb.*) }
> ++  .rela.tbss     : { *(.rela.tbss .rela.tbss.* .rela.gnu.linkonce.tb.*) }
> +   .rel.got       : { *(.rel.got)		}
> +   .rela.got      : { *(.rela.got)		}
> +   .rel.ctors     : { *(.rel.ctors)	}
> +@@ -53,6 +57,9 @@
> +   _etext = .;
> +   PROVIDE (etext = .);
> +   .fini      : { *(.fini)    } =0x47ff041f
> ++  /* Thread Local Storage sections  */
> ++  .tdata	  : { *(.tdata .tdata.* .gnu.linkonce.td.*) }
> ++  .tbss		  : { *(.tbss .tbss.* .gnu.linkonce.tb.*) *(.tcommon) }
> +   . = ALIGN(32 / 8);
> +   PROVIDE (__preinit_array_start = .);
> +   .preinit_array     : { *(.preinit_array) }
> diff --git a/recipes/qemu/qemu-0.10.3/91-oh-sdl-cursor.patch b/recipes/qemu/qemu-0.10.3/91-oh-sdl-cursor.patch
> new file mode 100644
> index 0000000..b3d95a4
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/91-oh-sdl-cursor.patch
> @@ -0,0 +1,18 @@
> +=== modified file 'sdl.c'
> +---
> + sdl.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: sdl.c
> +===================================================================
> +--- sdl.c.orig	2008-04-24 20:15:45.000000000 +0100
> ++++ sdl.c	2008-04-24 20:16:12.000000000 +0100
> +@@ -247,7 +247,7 @@
> +
> +     if (kbd_mouse_is_absolute()) {
> +         SDL_ShowCursor(1);
> +-        SDL_SetCursor(sdl_cursor_hidden);
> ++        /* SDL_SetCursor(sdl_cursor_hidden); */
> +     } else {
> +         SDL_ShowCursor(0);
> +     }
> diff --git a/recipes/qemu/qemu-0.10.3/fix_baum_c_compilation.patch b/recipes/qemu/qemu-0.10.3/fix_baum_c_compilation.patch
> new file mode 100644
> index 0000000..a2eb438
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/fix_baum_c_compilation.patch
> @@ -0,0 +1,30 @@
> +Index: trunk/hw/baum.c
> +===================================================================
> +--- trunk.orig/hw/baum.c	2008-11-29 05:12:40.418390606 +0300
> ++++ trunk/hw/baum.c	2008-11-29 05:13:11.498378426 +0300
> +@@ -569,8 +569,10 @@ CharDriverState *chr_baum_init(void)
> +     CharDriverState *chr;
> +     brlapi_handle_t *handle;
> + #ifdef CONFIG_SDL
> ++#ifdef SDL_VIDEO_DRIVER_X11
> +     SDL_SysWMinfo info;
> + #endif
> ++#endif
> +     int tty;
> +
> +     baum = qemu_mallocz(sizeof(BaumDriverState));
> +@@ -605,12 +607,14 @@ CharDriverState *chr_baum_init(void)
> +     }
> +
> + #ifdef CONFIG_SDL
> ++#ifdef SDL_VIDEO_DRIVER_X11
> +     memset(&info, 0, sizeof(info));
> +     SDL_VERSION(&info.version);
> +     if (SDL_GetWMInfo(&info))
> +         tty = info.info.x11.wmwindow;
> +     else
> + #endif
> ++#endif
> +         tty = BRLAPI_TTY_DEFAULT;
> +
> +     if (brlapi__enterTtyMode(handle, tty, NULL) == -1) {
> diff --git a/recipes/qemu/qemu-0.10.3/fix_segfault.patch b/recipes/qemu/qemu-0.10.3/fix_segfault.patch
> new file mode 100644
> index 0000000..32ca3c0
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/fix_segfault.patch
> @@ -0,0 +1,37 @@
> +---
> + linux-user/syscall.c |   22 ----------------------
> + 1 file changed, 22 deletions(-)
> +
> +Index: qemu-0.10.3/linux-user/syscall.c
> +===================================================================
> +--- qemu-0.10.3.orig/linux-user/syscall.c	2009-05-19 18:18:04.000000000 +0400
> ++++ qemu-0.10.3/linux-user/syscall.c	2009-05-19 18:18:40.397103379 +0400
> +@@ -6024,28 +6024,6 @@
> +         goto unimplemented_nowarn;
> + #endif
> +
> +-#ifdef TARGET_NR_clock_gettime
> +-    case TARGET_NR_clock_gettime:
> +-    {
> +-        struct timespec ts;
> +-        ret = get_errno(clock_gettime(arg1,&ts));
> +-        if (!is_error(ret)) {
> +-            host_to_target_timespec(arg2,&ts);
> +-        }
> +-        break;
> +-    }
> +-#endif
> +-#ifdef TARGET_NR_clock_getres
> +-    case TARGET_NR_clock_getres:
> +-    {
> +-        struct timespec ts;
> +-        ret = get_errno(clock_getres(arg1,&ts));
> +-        if (!is_error(ret)) {
> +-            host_to_target_timespec(arg2,&ts);
> +-        }
> +-        break;
> +-    }
> +-#endif
> + #ifdef TARGET_NR_clock_nanosleep
> +     case TARGET_NR_clock_nanosleep:
> +     {
> diff --git a/recipes/qemu/qemu-0.10.3/no-strip.patch b/recipes/qemu/qemu-0.10.3/no-strip.patch
> new file mode 100644
> index 0000000..4813dd4
> --- /dev/null
> +++ b/recipes/qemu/qemu-0.10.3/no-strip.patch
> @@ -0,0 +1,26 @@
> +Index: trunk/Makefile
> +===================================================================
> +--- trunk.orig/Makefile	2008-04-24 20:15:37.000000000 +0100
> ++++ trunk/Makefile	2008-04-24 20:16:30.000000000 +0100
> +@@ -196,7 +196,7 @@
> + install: all $(if $(BUILD_DOCS),install-doc)
> + 	mkdir -p "$(DESTDIR)$(bindir)"
> + ifneq ($(TOOLS),)
> +-	$(INSTALL) -m 755 -s $(TOOLS) "$(DESTDIR)$(bindir)"
> ++	$(INSTALL) -m 755 $(TOOLS) "$(DESTDIR)$(bindir)"
> + endif
> + 	mkdir -p "$(DESTDIR)$(datadir)"
> + 	set -e; for x in bios.bin vgabios.bin vgabios-cirrus.bin ppc_rom.bin \
> +Index: trunk/Makefile.target
> +===================================================================
> +--- trunk.orig/Makefile.target	2008-04-24 20:15:37.000000000 +0100
> ++++ trunk/Makefile.target	2008-04-24 20:16:30.000000000 +0100
> +@@ -685,7 +685,7 @@
> +
> + install: all
> + ifneq ($(PROGS),)
> +-	$(INSTALL) -m 755 -s $(PROGS) "$(DESTDIR)$(bindir)"
> ++	$(INSTALL) -m 755 $(PROGS) "$(DESTDIR)$(bindir)"
> + endif
> +
> + # Include automatically generated dependency files
> diff --git a/recipes/qemu/qemu_0.10.3.bb b/recipes/qemu/qemu_0.10.3.bb
> index d6ad1d7..f65f60d 100644
> --- a/recipes/qemu/qemu_0.10.3.bb
> +++ b/recipes/qemu/qemu_0.10.3.bb
> @@ -1,14 +1,27 @@
>   LICENSE = "GPL"
>   DEPENDS = "zlib"
>
> -# Need to port OE patches there
> -DEFAULT_PREFERENCE = "-1"
> +PR = "r1"
>
>   FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
>   FILESDIR = "${WORKDIR}"
>
>   SRC_URI = "\
>       http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz \
> +    file://06_exit_segfault.patch;patch=1;pnum=0 \
> +    file://11_signal_sigaction.patch;patch=1;pnum=0 \
> +    file://22_net_tuntap_stall.patch;patch=1 \
> +    file://31_syscalls.patch;patch=1;pnum=0 \
> +    file://32_syscall_sysctl.patch;patch=1;pnum=0 \
> +    file://52_ne2000_return.patch;patch=1 \
> +    file://61_safe_64bit_int.patch;patch=1;pnum=0 \
> +    file://63_sparc_build.patch;patch=1;pnum=0 \
> +    file://64_ppc_asm_constraints.patch;patch=1 \
> +    file://66_tls_ld.patch;patch=1;pnum=0 \
> +    file://91-oh-sdl-cursor.patch;patch=1;pnum=0 \
> +    file://fix_segfault.patch;patch=1 \
> +    file://no-strip.patch;patch=1 \
> +    file://fix_baum_c_compilation.patch;patch=1 \
>       "
>
>   S = "${WORKDIR}/qemu-${PV}"




