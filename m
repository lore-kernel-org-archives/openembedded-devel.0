Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MSfCZ-00039B-UD
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jul 2009 00:49:52 +0200
Received: by qyk35 with SMTP id 35so1474797qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=DvaE9yem4bWv6G5SjV5a/bS5ivnzgLi2tJded1mCmU4=;
	b=jqI+4zhJKMFQ1T/6kSDgUxar5z/dujmpqGgv67JSpSK3Pn0PX8dt/mdpao0UeMjAMc
	DbRD6DZIZzdChzAA+WKnyl6Wknk9w57G7E2ikbbMNQKlcSR36mBLyDSzMwxpH9jovWc9
	kVx9J7KC8r7HPfQHcNDko4e86BmbeV0y6qmVE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=V9cASxflx55wf7NSBW5+1oxUoWhGshRRRPlFAlFK8YK30dimpGXqgxNBu3n6KhFeNx
	MWT1tMkodpuLwet3FRl0LiaxGZiDQ7XwDRcA4EHLG2zyrECdpJXR6zfoRvGT6rgcwByH
	KQFoWyQ/Fk/uljA9ZqkP7MtkDib9+fVVenEFo=
Received: by 10.224.37.146 with SMTP id x18mr2273793qad.108.1248042957698;
	Sun, 19 Jul 2009 15:35:57 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 7sm6200723qwb.20.2009.07.19.15.35.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Jul 2009 15:35:57 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 70146610175; Sun, 19 Jul 2009 19:34:04 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jul 2009 19:33:57 -0300
Message-Id: <1248042838-7496-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.3.385.g60647
In-Reply-To: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
References: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] uClibc: use __always_inline instead of __inline__
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
X-List-Received-Date: Sun, 19 Jul 2009 22:49:55 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...Use-__always_inline-instead-of-__inline__.patch |  393 ++++++++++++++++++++
 recipes/uclibc/uclibc_0.9.30.1.bb                  |    1 +
 2 files changed, 394 insertions(+), 0 deletions(-)
 create mode 100644 recipes/uclibc/uclibc-0.9.30.1/0001-Use-__always_inline-instead-of-__inline__.patch

diff --git a/recipes/uclibc/uclibc-0.9.30.1/0001-Use-__always_inline-instead-of-__inline__.patch b/recipes/uclibc/uclibc-0.9.30.1/0001-Use-__always_inline-instead-of-__inline__.patch
new file mode 100644
index 0000000..a9c7a4f
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.30.1/0001-Use-__always_inline-instead-of-__inline__.patch
@@ -0,0 +1,393 @@
+From c190f738e1b0e87658ea5f86c057fb147dc19428 Mon Sep 17 00:00:00 2001
+From: Carmelo Amoroso <carmelo.amoroso@st.com>
+Date: Thu, 5 Mar 2009 13:28:55 +0000
+Subject: [PATCH] Use __always_inline instead of __inline__
+
+---
+ ldso/ldso/arm/dl-sysdep.h     |    8 ++++----
+ ldso/ldso/bfin/dl-sysdep.h    |    2 +-
+ ldso/ldso/cris/dl-sysdep.h    |    6 +++---
+ ldso/ldso/i386/dl-sysdep.h    |   10 +++++-----
+ ldso/ldso/m68k/dl-sysdep.h    |    6 +++---
+ ldso/ldso/mips/dl-sysdep.h    |    8 ++++----
+ ldso/ldso/powerpc/dl-sysdep.h |    8 ++++----
+ ldso/ldso/sh/dl-sysdep.h      |    8 ++++----
+ ldso/ldso/sh64/dl-sysdep.h    |    6 +++---
+ ldso/ldso/sparc/dl-sysdep.h   |    8 ++++----
+ ldso/ldso/xtensa/dl-sysdep.h  |    6 +++---
+ 11 files changed, 38 insertions(+), 38 deletions(-)
+
+diff --git a/ldso/ldso/arm/dl-sysdep.h b/ldso/ldso/arm/dl-sysdep.h
+index eea3b98..5191dd7 100644
+--- a/ldso/ldso/arm/dl-sysdep.h
++++ b/ldso/ldso/arm/dl-sysdep.h
+@@ -15,7 +15,7 @@
+   GOT_BASE[1] = (unsigned long) MODULE; \
+ }
+ 
+-static __inline__ unsigned long arm_modulus(unsigned long m, unsigned long p)
++static __always_inline unsigned long arm_modulus(unsigned long m, unsigned long p)
+ {
+ 	unsigned long i,t,inc;
+ 	i=p; t=0;
+@@ -67,7 +67,7 @@ unsigned long _dl_linux_resolver(struct elf_resolve * tpnt, int reloc_entry);
+    first element of the GOT.  We used to use the PIC register to do this
+    without a constant pool reference, but GCC 4.2 will use a pseudo-register
+    for the PIC base, so it may not be in r10.  */
+-static __inline__ Elf32_Addr __attribute__ ((unused))
++static __always_inline Elf32_Addr __attribute__ ((unused))
+ elf_machine_dynamic (void)
+ {
+   Elf32_Addr dynamic;
+@@ -99,7 +99,7 @@ elf_machine_dynamic (void)
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr __attribute__ ((unused))
++static __always_inline Elf32_Addr __attribute__ ((unused))
+ elf_machine_load_address (void)
+ {
+ 	extern void __dl_start __asm__ ("_dl_start");
+@@ -123,7 +123,7 @@ elf_machine_load_address (void)
+ 	return pcrel_addr - got_addr;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+diff --git a/ldso/ldso/bfin/dl-sysdep.h b/ldso/ldso/bfin/dl-sysdep.h
+index 3c88da4..f0c5129 100644
+--- a/ldso/ldso/bfin/dl-sysdep.h
++++ b/ldso/ldso/bfin/dl-sysdep.h
+@@ -210,7 +210,7 @@ while (0)
+ #endif
+ 
+ #include <elf.h>
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (DL_LOADADDR_TYPE load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+diff --git a/ldso/ldso/cris/dl-sysdep.h b/ldso/ldso/cris/dl-sysdep.h
+index ffb763a..e454c10 100644
+--- a/ldso/ldso/cris/dl-sysdep.h
++++ b/ldso/ldso/cris/dl-sysdep.h
+@@ -37,7 +37,7 @@ extern unsigned long _dl_linux_resolver(struct elf_resolve *tpnt, int reloc_entr
+      || ((type) == R_CRIS_GLOB_DAT)) * ELF_RTYPE_CLASS_PLT)	\
+    | (((type) == R_CRIS_COPY) * ELF_RTYPE_CLASS_COPY))
+ 
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_dynamic(void)
+ {
+ 	/* Don't just set this to an asm variable "r0" since that's not logical
+@@ -59,7 +59,7 @@ elf_machine_dynamic(void)
+    there's some other symbol we could use, that we don't *have* to force a
+    GOT entry for.  */
+ 
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_load_address(void)
+ {
+ 	Elf32_Addr gotaddr_diff;
+@@ -93,7 +93,7 @@ elf_machine_load_address(void)
+ 	return gotaddr_diff;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative(Elf32_Addr load_off, const Elf32_Addr rel_addr,
+                      Elf32_Word relative_count)
+ {
+diff --git a/ldso/ldso/i386/dl-sysdep.h b/ldso/ldso/i386/dl-sysdep.h
+index 77fa372..6e84861 100644
+--- a/ldso/ldso/i386/dl-sysdep.h
++++ b/ldso/ldso/i386/dl-sysdep.h
+@@ -37,8 +37,8 @@ extern unsigned long _dl_linux_resolver(struct elf_resolve * tpnt, int reloc_ent
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  */
+-static __inline__ Elf32_Addr elf_machine_dynamic (void) attribute_unused;
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr elf_machine_dynamic (void) attribute_unused;
++static __always_inline Elf32_Addr
+ elf_machine_dynamic (void)
+ {
+ 	register Elf32_Addr *got __asm__ ("%ebx");
+@@ -47,8 +47,8 @@ elf_machine_dynamic (void)
+ 
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr elf_machine_load_address (void) attribute_unused;
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr elf_machine_load_address (void) attribute_unused;
++static __always_inline Elf32_Addr
+ elf_machine_load_address (void)
+ {
+ 	/* It doesn't matter what variable this is, the reference never makes
+@@ -61,7 +61,7 @@ elf_machine_load_address (void)
+ 	return addr;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+diff --git a/ldso/ldso/m68k/dl-sysdep.h b/ldso/ldso/m68k/dl-sysdep.h
+index 8e26e20..259cb84 100644
+--- a/ldso/ldso/m68k/dl-sysdep.h
++++ b/ldso/ldso/m68k/dl-sysdep.h
+@@ -39,7 +39,7 @@ extern unsigned long _dl_linux_resolver (struct elf_resolve *, int);
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_dynamic (void)
+ {
+ 	register Elf32_Addr *got __asm__ ("%a5");
+@@ -48,7 +48,7 @@ elf_machine_dynamic (void)
+ 
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_load_address (void)
+ {
+ 	Elf32_Addr addr;
+@@ -58,7 +58,7 @@ elf_machine_load_address (void)
+ 	return addr;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+diff --git a/ldso/ldso/mips/dl-sysdep.h b/ldso/ldso/mips/dl-sysdep.h
+index cf6b28b..30d84fb 100644
+--- a/ldso/ldso/mips/dl-sysdep.h
++++ b/ldso/ldso/mips/dl-sysdep.h
+@@ -169,7 +169,7 @@ void _dl_perform_mips_global_got_relocations(struct elf_resolve *tpnt, int lazy)
+ 
+ #define OFFSET_GP_GOT 0x7ff0
+ 
+-static __inline__ ElfW(Addr) *
++static __always_inline ElfW(Addr) *
+ elf_mips_got_from_gpreg (ElfW(Addr) gpreg)
+ {
+ 	/* FIXME: the offset of gp from GOT may be system-dependent. */
+@@ -179,7 +179,7 @@ elf_mips_got_from_gpreg (ElfW(Addr) gpreg)
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  We assume its $gp points to the primary GOT.  */
+-static __inline__ ElfW(Addr)
++static __always_inline ElfW(Addr)
+ elf_machine_dynamic (void)
+ {
+ 	register ElfW(Addr) gp __asm__ ("$28");
+@@ -198,7 +198,7 @@ elf_machine_dynamic (void)
+ #endif
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ ElfW(Addr)
++static __always_inline ElfW(Addr)
+ elf_machine_load_address (void)
+ {
+ 	ElfW(Addr) addr;
+@@ -214,7 +214,7 @@ elf_machine_load_address (void)
+ 	return addr;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (ElfW(Addr) load_off, const ElfW(Addr) rel_addr,
+ 		      ElfW(Word) relative_count)
+ {
+diff --git a/ldso/ldso/powerpc/dl-sysdep.h b/ldso/ldso/powerpc/dl-sysdep.h
+index fdbf564..f33214c 100644
+--- a/ldso/ldso/powerpc/dl-sysdep.h
++++ b/ldso/ldso/powerpc/dl-sysdep.h
+@@ -85,7 +85,7 @@ void _dl_init_got(unsigned long *lpnt,struct elf_resolve *tpnt);
+ #define ELF_MACHINE_PLTREL_OVERLAP 1
+ 
+ /* Return the value of the GOT pointer.  */
+-static __inline__ Elf32_Addr * __attribute__ ((const))
++static __always_inline Elf32_Addr * __attribute__ ((const))
+ ppc_got (void)
+ {
+ 	Elf32_Addr *got;
+@@ -104,14 +104,14 @@ ppc_got (void)
+ 
+ /* Return the link-time address of _DYNAMIC, stored as
+    the first value in the GOT. */
+-static __inline__ Elf32_Addr __attribute__ ((const))
++static __always_inline Elf32_Addr __attribute__ ((const))
+ elf_machine_dynamic (void)
+ {
+ 	return *ppc_got();
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr __attribute__ ((const))
++static __always_inline Elf32_Addr __attribute__ ((const))
+ elf_machine_load_address (void)
+ {
+   Elf32_Addr *branchaddr;
+@@ -159,7 +159,7 @@ elf_machine_load_address (void)
+   return runtime_dynamic - elf_machine_dynamic ();
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+diff --git a/ldso/ldso/sh/dl-sysdep.h b/ldso/ldso/sh/dl-sysdep.h
+index daedda5..d4fc784 100644
+--- a/ldso/ldso/sh/dl-sysdep.h
++++ b/ldso/ldso/sh/dl-sysdep.h
+@@ -25,7 +25,7 @@
+ struct elf_resolve;
+ extern unsigned long _dl_linux_resolver(struct elf_resolve * tpnt, int reloc_entry);
+ 
+-static __inline__ unsigned int
++static __always_inline unsigned int
+ _dl_urem(unsigned int n, unsigned int base)
+ {
+   int res;
+@@ -95,7 +95,7 @@ _dl_urem(unsigned int n, unsigned int base)
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  */
+-static __inline__ Elf32_Addr __attribute__ ((unused))
++static __always_inline Elf32_Addr __attribute__ ((unused))
+ elf_machine_dynamic (void)
+ {
+ 	register Elf32_Addr *got;
+@@ -104,7 +104,7 @@ elf_machine_dynamic (void)
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr __attribute__ ((unused))
++static __always_inline Elf32_Addr __attribute__ ((unused))
+ elf_machine_load_address (void)
+ {
+ 	Elf32_Addr addr;
+@@ -146,7 +146,7 @@ elf_machine_load_address (void)
+     } \
+   }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+diff --git a/ldso/ldso/sh64/dl-sysdep.h b/ldso/ldso/sh64/dl-sysdep.h
+index fc67b12..15d9b5e 100644
+--- a/ldso/ldso/sh64/dl-sysdep.h
++++ b/ldso/ldso/sh64/dl-sysdep.h
+@@ -41,7 +41,7 @@ extern unsigned long _dl_linux_resolver(struct elf_resolve * tpnt, int reloc_ent
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  */
+-static __inline__ Elf32_Addr elf_machine_dynamic(void)
++static __always_inline Elf32_Addr elf_machine_dynamic(void)
+ {
+ 	register Elf32_Addr *got;
+ 
+@@ -69,7 +69,7 @@ static __inline__ Elf32_Addr elf_machine_dynamic(void)
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr elf_machine_load_address(void)
++static __always_inline Elf32_Addr elf_machine_load_address(void)
+ {
+ 	Elf32_Addr addr;
+ 
+@@ -122,7 +122,7 @@ static __inline__ Elf32_Addr elf_machine_load_address(void)
+ 	}						\
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative(Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		     Elf32_Word relative_count)
+ {
+diff --git a/ldso/ldso/sparc/dl-sysdep.h b/ldso/ldso/sparc/dl-sysdep.h
+index 7936517..ebfa268 100644
+--- a/ldso/ldso/sparc/dl-sysdep.h
++++ b/ldso/ldso/sparc/dl-sysdep.h
+@@ -52,7 +52,7 @@ unsigned long _dl_linux_resolver(struct elf_resolve * tpnt, int reloc_entry);
+ 
+ #ifndef COMPILE_ASM
+ /* Cheap modulo implementation, taken from arm/ld_sysdep.h. */
+-static __inline__ unsigned long
++static __always_inline unsigned long
+ sparc_mod(unsigned long m, unsigned long p)
+ {
+ 	unsigned long i, t, inc;
+@@ -118,7 +118,7 @@ do {    register Elf32_Addr pc __asm__("o7"); \
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_dynamic (void)
+ {
+ 	register Elf32_Addr *got __asm__ ("%l7");
+@@ -129,7 +129,7 @@ elf_machine_dynamic (void)
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_load_address (void)
+ {
+ 	register Elf32_Addr *pc __asm__ ("%o7"), *got __asm__ ("%l7");
+@@ -148,7 +148,7 @@ elf_machine_load_address (void)
+ 	return (Elf32_Addr) got - *got + (pc[2] - pc[3]) * 4 - 4;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+diff --git a/ldso/ldso/xtensa/dl-sysdep.h b/ldso/ldso/xtensa/dl-sysdep.h
+index daae428..07b9b79 100644
+--- a/ldso/ldso/xtensa/dl-sysdep.h
++++ b/ldso/ldso/xtensa/dl-sysdep.h
+@@ -85,7 +85,7 @@ extern unsigned long _dl_linux_resolver (struct elf_resolve *, int);
+   (((type) == R_XTENSA_JMP_SLOT) * ELF_RTYPE_CLASS_PLT)
+ 
+ /* Return the link-time address of _DYNAMIC.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_dynamic (void)
+ {
+   /* This function is only used while bootstrapping the runtime linker.
+@@ -95,7 +95,7 @@ elf_machine_dynamic (void)
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_load_address (void)
+ {
+   Elf32_Addr addr, tmp;
+@@ -116,7 +116,7 @@ elf_machine_load_address (void)
+   return addr - 3;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+-- 
+1.6.3.3.444.g4ecbc
+
diff --git a/recipes/uclibc/uclibc_0.9.30.1.bb b/recipes/uclibc/uclibc_0.9.30.1.bb
index 3ddaad4..a9b1de5 100644
--- a/recipes/uclibc/uclibc_0.9.30.1.bb
+++ b/recipes/uclibc/uclibc_0.9.30.1.bb
@@ -20,6 +20,7 @@ SRC_URI += "file://uClibc.machine file://uClibc.distro \
 	    file://pthread_atfork.patch;patch=1 \
 	    file://uclibc_ldso_use_O0.patch;patch=1 \
 	    file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch;patch=1 \
+            file://0001-Use-__always_inline-instead-of-__inline__.patch;patch=1 \
 	   "
 #recent versions uclibc require real kernel headers
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.6.3.3.385.g60647



