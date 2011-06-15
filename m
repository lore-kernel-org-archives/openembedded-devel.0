Received: from outbound.icp-osb-irony-out9.iinet.net.au ([203.59.1.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QWext-0000O9-V4
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 03:32:40 +0200
X-IronPort-AV: E=Sophos;i="4.65,368,1304265600"; 
   d="scan'208";a="7219177"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by outbound.icp-osb-irony-out9.iinet.net.au with ESMTP;
	15 Jun 2011 09:25:41 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2011 09:26:11 +0800
Message-Id: <1308101171-20619-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Cc: James Limbouris <james@digitalmatter.com.au>
Subject: [PATCH] elfutils: Added recipe for elfutils-0.148 from oe-core.
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
X-List-Received-Date: Wed, 15 Jun 2011 01:32:40 -0000

This resolves a build issue with 0.143 in which strip.c
uses stat64 without an appropriate header.

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 recipes/elfutils/elfutils-0.148/arm_backend.diff   |  449 +++++
 recipes/elfutils/elfutils-0.148/do-autoreconf.diff |  339 ++++
 recipes/elfutils/elfutils-0.148/elf_additions.diff |   71 +
 .../elfutils/elfutils-0.148/elfutils-fsize.patch   |   39 +
 recipes/elfutils/elfutils-0.148/hppa_backend.diff  |  801 +++++++++
 recipes/elfutils/elfutils-0.148/i386_dis.h         | 1657 +++++++++++++++++++
 recipes/elfutils/elfutils-0.148/m68k_backend.diff  |  309 ++++
 recipes/elfutils/elfutils-0.148/mempcpy.patch      |   25 +
 recipes/elfutils/elfutils-0.148/mips_backend.diff  |  713 ++++++++
 .../elfutils-0.148/redhat-portability.diff         | 1124 +++++++++++++
 .../elfutils/elfutils-0.148/redhat-robustify.diff  | 1709 ++++++++++++++++++++
 .../elfutils/elfutils-0.148/remove-unused.patch    |  154 ++
 .../elfutils-0.148/testsuite-ignore-elflint.diff   |   21 +
 .../elfutils/elfutils-0.148/uclibc-support.patch   |   91 ++
 recipes/elfutils/elfutils-0.148/x86_64_dis.h       | 1632 +++++++++++++++++++
 recipes/elfutils/elfutils_0.148.bb                 |   61 +
 16 files changed, 9195 insertions(+), 0 deletions(-)
 create mode 100644 recipes/elfutils/elfutils-0.148/arm_backend.diff
 create mode 100644 recipes/elfutils/elfutils-0.148/do-autoreconf.diff
 create mode 100644 recipes/elfutils/elfutils-0.148/elf_additions.diff
 create mode 100644 recipes/elfutils/elfutils-0.148/elfutils-fsize.patch
 create mode 100644 recipes/elfutils/elfutils-0.148/hppa_backend.diff
 create mode 100644 recipes/elfutils/elfutils-0.148/i386_dis.h
 create mode 100644 recipes/elfutils/elfutils-0.148/m68k_backend.diff
 create mode 100644 recipes/elfutils/elfutils-0.148/mempcpy.patch
 create mode 100644 recipes/elfutils/elfutils-0.148/mips_backend.diff
 create mode 100644 recipes/elfutils/elfutils-0.148/redhat-portability.diff
 create mode 100644 recipes/elfutils/elfutils-0.148/redhat-robustify.diff
 create mode 100644 recipes/elfutils/elfutils-0.148/remove-unused.patch
 create mode 100644 recipes/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff
 create mode 100644 recipes/elfutils/elfutils-0.148/uclibc-support.patch
 create mode 100644 recipes/elfutils/elfutils-0.148/x86_64_dis.h
 create mode 100644 recipes/elfutils/elfutils_0.148.bb

diff --git a/recipes/elfutils/elfutils-0.148/arm_backend.diff b/recipes/elfutils/elfutils-0.148/arm_backend.diff
new file mode 100644
index 0000000..d4e4675
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/arm_backend.diff
@@ -0,0 +1,449 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.146/backends/arm_init.c
+===================================================================
+--- elfutils-0.146.orig/backends/arm_init.c	2009-04-21 14:50:01.000000000 +0000
++++ elfutils-0.146/backends/arm_init.c	2010-04-24 10:11:13.000000000 +0000
+@@ -32,21 +32,32 @@
+ #define RELOC_PREFIX	R_ARM_
+ #include "libebl_CPU.h"
+ 
++#include "libebl_arm.h"
++
+ /* This defines the common reloc hooks based on arm_reloc.def.  */
+ #include "common-reloc.c"
+ 
+ 
+ const char *
+ arm_init (elf, machine, eh, ehlen)
+-     Elf *elf __attribute__ ((unused));
++     Elf *elf;
+      GElf_Half machine __attribute__ ((unused));
+      Ebl *eh;
+      size_t ehlen;
+ {
++  int soft_float = 0;
++
+   /* Check whether the Elf_BH object has a sufficent size.  */
+   if (ehlen < sizeof (Ebl))
+     return NULL;
+ 
++  if (elf) {
++    GElf_Ehdr ehdr_mem;
++    GElf_Ehdr *ehdr = gelf_getehdr (elf, &ehdr_mem);
++    if (ehdr && (ehdr->e_flags & EF_ARM_SOFT_FLOAT))
++      soft_float = 1;
++  }
++
+   /* We handle it.  */
+   eh->name = "ARM";
+   arm_init_reloc (eh);
+@@ -58,7 +69,10 @@
+   HOOK (eh, core_note);
+   HOOK (eh, auxv_info);
+   HOOK (eh, check_object_attribute);
+-  HOOK (eh, return_value_location);
++  if (soft_float)
++    eh->return_value_location = arm_return_value_location_soft;
++  else
++    eh->return_value_location = arm_return_value_location_hard;
+ 
+   return MODVERSION;
+ }
+Index: elfutils-0.146/backends/arm_regs.c
+===================================================================
+--- elfutils-0.146.orig/backends/arm_regs.c	2009-04-21 14:50:01.000000000 +0000
++++ elfutils-0.146/backends/arm_regs.c	2010-04-24 10:11:13.000000000 +0000
+@@ -28,6 +28,7 @@
+ #endif
+ 
+ #include <string.h>
++#include <stdio.h>
+ #include <dwarf.h>
+ 
+ #define BACKEND arm_
+@@ -58,7 +59,15 @@
+       namelen = 2;
+       break;
+ 
+-    case 10 ... 12:
++    case 10 ... 11:
++      name[0] = 'r';
++      name[1] = '1';
++      name[2] = regno % 10 + '0';
++      namelen = 3;
++      break;
++
++    case 12:
++      *type = DW_ATE_unsigned;
+       name[0] = 'r';
+       name[1] = '1';
+       name[2] = regno % 10 + '0';
+@@ -73,6 +82,9 @@
+       break;
+ 
+     case 16 + 0 ... 16 + 7:
++      /* AADWARF says that there are no registers in that range,
++       * but gcc maps FPA registers here
++       */
+       regno += 96 - 16;
+       /* Fall through.  */
+     case 96 + 0 ... 96 + 7:
+@@ -84,11 +96,139 @@
+       namelen = 2;
+       break;
+ 
++    case 64 + 0 ... 64 + 9:
++      *setname = "VFP";
++      *bits = 32;
++      *type = DW_ATE_float;
++      name[0] = 's';
++      name[1] = regno - 64 + '0';
++      namelen = 2;
++      break;
++
++    case 64 + 10 ... 64 + 31:
++      *setname = "VFP";
++      *bits = 32;
++      *type = DW_ATE_float;
++      name[0] = 's';
++      name[1] = (regno - 64) / 10 + '0';
++      name[2] = (regno - 64) % 10 + '0';
++      namelen = 3;
++      break;
++
++    case 104 + 0 ... 104 + 7:
++      /* XXX TODO:
++       * This can be either intel wireless MMX general purpose/control
++       * registers or xscale accumulator, which have different usage.
++       * We only have the intel wireless MMX here now.
++       * The name needs to be changed for the xscale accumulator too. */
++      *setname = "MMX";
++      *type = DW_ATE_unsigned;
++      *bits = 32;
++      memcpy(name, "wcgr", 4);
++      name[4] = regno - 104 + '0';
++      namelen = 5;
++      break;
++
++    case 112 + 0 ... 112 + 9:
++      *setname = "MMX";
++      *type = DW_ATE_unsigned;
++      *bits = 64;
++      name[0] = 'w';
++      name[1] = 'r';
++      name[2] = regno - 112 + '0';
++      namelen = 3;
++      break;
++
++    case 112 + 10 ... 112 + 15:
++      *setname = "MMX";
++      *type = DW_ATE_unsigned;
++      *bits = 64;
++      name[0] = 'w';
++      name[1] = 'r';
++      name[2] = '1';
++      name[3] = regno - 112 - 10 + '0';
++      namelen = 4;
++      break;
++
+     case 128:
++      *setname = "special";
+       *type = DW_ATE_unsigned;
+       return stpcpy (name, "spsr") + 1 - name;
+ 
++    case 129:
++      *setname = "special";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_fiq") + 1 - name;
++
++    case 130:
++      *setname = "special";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_irq") + 1 - name;
++
++    case 131:
++      *setname = "special";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_abt") + 1 - name;
++
++    case 132:
++      *setname = "special";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_und") + 1 - name;
++
++    case 133:
++      *setname = "special";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_svc") + 1 - name;
++
++    case 144 ... 150:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_usr", regno - 144 + 8) + 1;
++
++    case 151 ... 157:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_fiq", regno - 151 + 8) + 1;
++
++    case 158 ... 159:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_irq", regno - 158 + 13) + 1;
++
++    case 160 ... 161:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_abt", regno - 160 + 13) + 1;
++
++    case 162 ... 163:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_und", regno - 162 + 13) + 1;
++
++    case 164 ... 165:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_svc", regno - 164 + 13) + 1;
++
++    case 192 ... 199:
++     *setname = "MMX";
++      *bits = 32;
++      *type = DW_ATE_unsigned;
++      name[0] = 'w';
++      name[1] = 'c';
++      name[2] = regno - 192 + '0';
++      namelen = 3;
++      break;
++
+     case 256 + 0 ... 256 + 9:
++      /* XXX TODO: Neon also uses those registers and can contain
++       * both float and integers */
+       *setname = "VFP";
+       *type = DW_ATE_float;
+       *bits = 64;
+Index: elfutils-0.146/backends/arm_retval.c
+===================================================================
+--- elfutils-0.146.orig/backends/arm_retval.c	2010-01-12 16:57:54.000000000 +0000
++++ elfutils-0.146/backends/arm_retval.c	2010-04-24 10:11:13.000000000 +0000
+@@ -45,6 +45,13 @@
+ #define nloc_intreg	1
+ #define nloc_intregs(n)	(2 * (n))
+ 
++/* f1  */ /* XXX TODO: f0 can also have number 96 if program was compiled with -mabi=aapcs */
++static const Dwarf_Op loc_fpreg[] =
++  {
++    { .atom = DW_OP_reg16 },
++  };
++#define nloc_fpreg  1
++
+ /* The return value is a structure and is actually stored in stack space
+    passed in a hidden argument by the caller.  But, the compiler
+    helpfully returns the address of that space in r0.  */
+@@ -55,8 +62,9 @@
+ #define nloc_aggregate 1
+ 
+ 
+-int
+-arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++static int
++arm_return_value_location_ (Dwarf_Die *functypedie, const Dwarf_Op **locp,
++		            int soft_float)
+ {
+   /* Start with the function's type, and get the DW_AT_type attribute,
+      which is the type of the return value.  */
+@@ -109,14 +117,31 @@
+ 	  else
+ 	    return -1;
+ 	}
++      if (tag == DW_TAG_base_type)
++	{
++	  Dwarf_Word encoding;
++	  if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
++	                       &attr_mem), &encoding) != 0)
++	    return -1;
++
++	  if ((encoding == DW_ATE_float) && !soft_float)
++	    {
++	      *locp = loc_fpreg;
++	      if (size <= 8)
++		return nloc_fpreg;
++	      goto aggregate;
++	    }
++	}
+       if (size <= 16)
+ 	{
+ 	intreg:
+ 	  *locp = loc_intreg;
+ 	  return size <= 4 ? nloc_intreg : nloc_intregs ((size + 3) / 4);
+ 	}
++      /* fall through. */
+ 
+     aggregate:
++      /* XXX TODO sometimes aggregates are returned in r0 (-mabi=aapcs) */
+       *locp = loc_aggregate;
+       return nloc_aggregate;
+ 
+@@ -135,3 +160,18 @@
+      DWARF and might be valid.  */
+   return -2;
+ }
++
++/* return location for -mabi=apcs-gnu -msoft-float */
++int
++arm_return_value_location_soft (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++{
++   return arm_return_value_location_ (functypedie, locp, 1);
++}
++
++/* return location for -mabi=apcs-gnu -mhard-float (current default) */
++int
++arm_return_value_location_hard (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++{
++   return arm_return_value_location_ (functypedie, locp, 0);
++}
++
+Index: elfutils-0.146/libelf/elf.h
+===================================================================
+--- elfutils-0.146.orig/libelf/elf.h	2010-04-24 10:11:11.000000000 +0000
++++ elfutils-0.146/libelf/elf.h	2010-04-24 10:11:13.000000000 +0000
+@@ -2290,6 +2290,9 @@
+ #define EF_ARM_EABI_VER4	0x04000000
+ #define EF_ARM_EABI_VER5	0x05000000
+ 
++/* EI_OSABI values */
++#define ELFOSABI_ARM_AEABI    64      /* Contains symbol versioning. */
++
+ /* Additional symbol types for Thumb.  */
+ #define STT_ARM_TFUNC		STT_LOPROC /* A Thumb function.  */
+ #define STT_ARM_16BIT		STT_HIPROC /* A Thumb label.  */
+@@ -2307,12 +2310,19 @@
+ 
+ /* Processor specific values for the Phdr p_type field.  */
+ #define PT_ARM_EXIDX		(PT_LOPROC + 1)	/* ARM unwind segment.  */
++#define PT_ARM_UNWIND		PT_ARM_EXIDX
+ 
+ /* Processor specific values for the Shdr sh_type field.  */
+ #define SHT_ARM_EXIDX		(SHT_LOPROC + 1) /* ARM unwind section.  */
+ #define SHT_ARM_PREEMPTMAP	(SHT_LOPROC + 2) /* Preemption details.  */
+ #define SHT_ARM_ATTRIBUTES	(SHT_LOPROC + 3) /* ARM attributes section.  */
+ 
++/* Processor specific values for the Dyn d_tag field.  */
++#define DT_ARM_RESERVED1	(DT_LOPROC + 0)
++#define DT_ARM_SYMTABSZ		(DT_LOPROC + 1)
++#define DT_ARM_PREEMTMAB	(DT_LOPROC + 2)
++#define DT_ARM_RESERVED2	(DT_LOPROC + 3)
++#define DT_ARM_NUM		4
+ 
+ /* ARM relocs.  */
+ 
+@@ -2344,12 +2354,75 @@
+ #define R_ARM_GOTPC		25	/* 32 bit PC relative offset to GOT */
+ #define R_ARM_GOT32		26	/* 32 bit GOT entry */
+ #define R_ARM_PLT32		27	/* 32 bit PLT address */
++#define R_ARM_CALL		28
++#define R_ARM_JUMP24		29
++#define R_ARM_THM_JUMP24	30
++#define R_ARM_BASE_ABS		31
+ #define R_ARM_ALU_PCREL_7_0	32
+ #define R_ARM_ALU_PCREL_15_8	33
+ #define R_ARM_ALU_PCREL_23_15	34
+ #define R_ARM_LDR_SBREL_11_0	35
+ #define R_ARM_ALU_SBREL_19_12	36
+ #define R_ARM_ALU_SBREL_27_20	37
++#define R_ARM_TARGET1		38
++#define R_ARM_SBREL31		39
++#define R_ARM_V4BX		40
++#define R_ARM_TARGET2		41
++#define R_ARM_PREL31		42
++#define R_ARM_MOVW_ABS_NC	43
++#define R_ARM_MOVT_ABS		44
++#define R_ARM_MOVW_PREL_NC	45
++#define R_ARM_MOVT_PREL		46
++#define R_ARM_THM_MOVW_ABS_NC	47
++#define R_ARM_THM_MOVT_ABS	48
++#define R_ARM_THM_MOVW_PREL_NC	49
++#define R_ARM_THM_MOVT_PREL	50
++#define R_ARM_THM_JUMP19	51
++#define R_ARM_THM_JUMP6		52
++#define R_ARM_THM_ALU_PREL_11_0	53
++#define R_ARM_THM_PC12		54
++#define R_ARM_ABS32_NOI		55
++#define R_ARM_REL32_NOI		56
++#define R_ARM_ALU_PC_G0_NC	57
++#define R_ARM_ALU_PC_G0		58
++#define R_ARM_ALU_PC_G1_NC	59
++#define R_ARM_ALU_PC_G1		60
++#define R_ARM_ALU_PC_G2		61
++#define R_ARM_LDR_PC_G1		62
++#define R_ARM_LDR_PC_G2		63
++#define R_ARM_LDRS_PC_G0	64
++#define R_ARM_LDRS_PC_G1	65
++#define R_ARM_LDRS_PC_G2	66
++#define R_ARM_LDC_PC_G0		67
++#define R_ARM_LDC_PC_G1		68
++#define R_ARM_LDC_PC_G2		69
++#define R_ARM_ALU_SB_G0_NC	70
++#define R_ARM_ALU_SB_G0		71
++#define R_ARM_ALU_SB_G1_NC	72
++#define R_ARM_ALU_SB_G1		73
++#define R_ARM_ALU_SB_G2		74
++#define R_ARM_LDR_SB_G0		75
++#define R_ARM_LDR_SB_G1		76
++#define R_ARM_LDR_SB_G2		77
++#define R_ARM_LDRS_SB_G0	78
++#define R_ARM_LDRS_SB_G1	79
++#define R_ARM_LDRS_SB_G2	80
++#define R_ARM_LDC_G0		81
++#define R_ARM_LDC_G1		82
++#define R_ARM_LDC_G2		83
++#define R_ARM_MOVW_BREL_NC	84
++#define R_ARM_MOVT_BREL		85
++#define R_ARM_MOVW_BREL		86
++#define R_ARM_THM_MOVW_BREL_NC	87
++#define R_ARM_THM_MOVT_BREL	88
++#define R_ARM_THM_MOVW_BREL	89
++/* 90-93 unallocated */
++#define R_ARM_PLT32_ABS		94
++#define R_ARM_GOT_ABS		95
++#define R_ARM_GOT_PREL		96
++#define R_ARM_GOT_BREL12	97
++#define R_ARM_GOTOFF12		98
++#define R_ARM_GOTRELAX		99
+ #define R_ARM_GNU_VTENTRY	100
+ #define R_ARM_GNU_VTINHERIT	101
+ #define R_ARM_THM_PC11		102	/* thumb unconditional branch */
+@@ -2364,6 +2437,12 @@
+ 					   static TLS block offset */
+ #define R_ARM_TLS_LE32		108	/* 32 bit offset relative to static
+ 					   TLS block */
++#define R_ARM_TLS_LDO12		109
++#define R_ARM_TLS_LE12		110
++#define R_ARM_TLS_IE12GP	111
++/* 112 - 127 private range */
++#define R_ARM_ME_TOO		128	/* obsolete */
++
+ #define R_ARM_RXPC25		249
+ #define R_ARM_RSBREL32		250
+ #define R_ARM_THM_RPC22		251
+Index: elfutils-0.146/backends/libebl_arm.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.146/backends/libebl_arm.h	2010-04-24 10:11:13.000000000 +0000
+@@ -0,0 +1,9 @@
++#ifndef _LIBEBL_ARM_H
++#define _LIBEBL_ARM_H 1
++
++#include <libdw.h>
++
++extern int arm_return_value_location_soft(Dwarf_Die *, const Dwarf_Op **locp);
++extern int arm_return_value_location_hard(Dwarf_Die *, const Dwarf_Op **locp);
++
++#endif
diff --git a/recipes/elfutils/elfutils-0.148/do-autoreconf.diff b/recipes/elfutils/elfutils-0.148/do-autoreconf.diff
new file mode 100644
index 0000000..dd35c57
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/do-autoreconf.diff
@@ -0,0 +1,339 @@
+Upstream-Status: Backport
+
+Generated by copying the whole dir, running `sh debian/autogen.sh` and diffing.
+
+Index: elfutils-0.148/backends/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/backends/Makefile.in	2010-07-03 13:07:10.000000000 +0000
++++ elfutils-0.148/backends/Makefile.in	2010-07-03 13:13:52.000000000 +0000
+@@ -77,39 +77,54 @@
+ am__objects_4 = ia64_init.$(OBJEXT) ia64_symbol.$(OBJEXT) \
+ 	ia64_regs.$(OBJEXT) ia64_retval.$(OBJEXT)
+ libebl_ia64_pic_a_OBJECTS = $(am_libebl_ia64_pic_a_OBJECTS)
++libebl_m68k_pic_a_AR = $(AR) $(ARFLAGS)
++libebl_m68k_pic_a_LIBADD =
++am__objects_5 = m68k_init.$(OBJEXT) m68k_symbol.$(OBJEXT) \
++	m68k_regs.$(OBJEXT)
++libebl_m68k_pic_a_OBJECTS = $(am_libebl_m68k_pic_a_OBJECTS)
++libebl_mips_pic_a_AR = $(AR) $(ARFLAGS)
++libebl_mips_pic_a_LIBADD =
++am__objects_6 = mips_init.$(OBJEXT) mips_symbol.$(OBJEXT) \
++	mips_regs.$(OBJEXT) mips_retval.$(OBJEXT)
++libebl_mips_pic_a_OBJECTS = $(am_libebl_mips_pic_a_OBJECTS)
++libebl_parisc_pic_a_AR = $(AR) $(ARFLAGS)
++libebl_parisc_pic_a_LIBADD =
++am__objects_7 = parisc_init.$(OBJEXT) parisc_symbol.$(OBJEXT) \
++	parisc_regs.$(OBJEXT) parisc_retval.$(OBJEXT)
++libebl_parisc_pic_a_OBJECTS = $(am_libebl_parisc_pic_a_OBJECTS)
+ libebl_ppc64_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_ppc64_pic_a_LIBADD =
+-am__objects_5 = ppc64_init.$(OBJEXT) ppc64_symbol.$(OBJEXT) \
++am__objects_8 = ppc64_init.$(OBJEXT) ppc64_symbol.$(OBJEXT) \
+ 	ppc64_retval.$(OBJEXT) ppc64_corenote.$(OBJEXT) \
+ 	ppc_regs.$(OBJEXT) ppc_auxv.$(OBJEXT) ppc_attrs.$(OBJEXT) \
+ 	ppc_syscall.$(OBJEXT)
+ libebl_ppc64_pic_a_OBJECTS = $(am_libebl_ppc64_pic_a_OBJECTS)
+ libebl_ppc_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_ppc_pic_a_LIBADD =
+-am__objects_6 = ppc_init.$(OBJEXT) ppc_symbol.$(OBJEXT) \
++am__objects_9 = ppc_init.$(OBJEXT) ppc_symbol.$(OBJEXT) \
+ 	ppc_retval.$(OBJEXT) ppc_regs.$(OBJEXT) ppc_corenote.$(OBJEXT) \
+ 	ppc_auxv.$(OBJEXT) ppc_attrs.$(OBJEXT) ppc_syscall.$(OBJEXT)
+ libebl_ppc_pic_a_OBJECTS = $(am_libebl_ppc_pic_a_OBJECTS)
+ libebl_s390_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_s390_pic_a_LIBADD =
+-am__objects_7 = s390_init.$(OBJEXT) s390_symbol.$(OBJEXT) \
++am__objects_10 = s390_init.$(OBJEXT) s390_symbol.$(OBJEXT) \
+ 	s390_regs.$(OBJEXT) s390_retval.$(OBJEXT)
+ libebl_s390_pic_a_OBJECTS = $(am_libebl_s390_pic_a_OBJECTS)
+ libebl_sh_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_sh_pic_a_LIBADD =
+-am__objects_8 = sh_init.$(OBJEXT) sh_symbol.$(OBJEXT) \
++am__objects_11 = sh_init.$(OBJEXT) sh_symbol.$(OBJEXT) \
+ 	sh_corenote.$(OBJEXT) sh_regs.$(OBJEXT) sh_retval.$(OBJEXT)
+ libebl_sh_pic_a_OBJECTS = $(am_libebl_sh_pic_a_OBJECTS)
+ libebl_sparc_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_sparc_pic_a_LIBADD =
+-am__objects_9 = sparc_init.$(OBJEXT) sparc_symbol.$(OBJEXT) \
++am__objects_12 = sparc_init.$(OBJEXT) sparc_symbol.$(OBJEXT) \
+ 	sparc_regs.$(OBJEXT) sparc_retval.$(OBJEXT) \
+ 	sparc_corenote.$(OBJEXT) sparc64_corenote.$(OBJEXT) \
+ 	sparc_auxv.$(OBJEXT)
+ libebl_sparc_pic_a_OBJECTS = $(am_libebl_sparc_pic_a_OBJECTS)
+ libebl_x86_64_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_x86_64_pic_a_LIBADD =
+-am__objects_10 = x86_64_init.$(OBJEXT) x86_64_symbol.$(OBJEXT) \
++am__objects_13 = x86_64_init.$(OBJEXT) x86_64_symbol.$(OBJEXT) \
+ 	x86_64_corenote.$(OBJEXT) x86_64_cfi.$(OBJEXT) \
+ 	x86_64_retval.$(OBJEXT) x86_64_regs.$(OBJEXT) \
+ 	i386_auxv.$(OBJEXT) x86_64_syscall.$(OBJEXT)
+@@ -124,15 +139,18 @@
+ LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ SOURCES = $(libebl_alpha_pic_a_SOURCES) $(libebl_arm_pic_a_SOURCES) \
+ 	$(libebl_i386_pic_a_SOURCES) $(libebl_ia64_pic_a_SOURCES) \
+-	$(libebl_ppc64_pic_a_SOURCES) $(libebl_ppc_pic_a_SOURCES) \
+-	$(libebl_s390_pic_a_SOURCES) $(libebl_sh_pic_a_SOURCES) \
+-	$(libebl_sparc_pic_a_SOURCES) $(libebl_x86_64_pic_a_SOURCES)
+-DIST_SOURCES = $(libebl_alpha_pic_a_SOURCES) \
+-	$(libebl_arm_pic_a_SOURCES) $(libebl_i386_pic_a_SOURCES) \
+-	$(libebl_ia64_pic_a_SOURCES) $(libebl_ppc64_pic_a_SOURCES) \
++	$(libebl_m68k_pic_a_SOURCES) $(libebl_mips_pic_a_SOURCES) \
++	$(libebl_parisc_pic_a_SOURCES) $(libebl_ppc64_pic_a_SOURCES) \
+ 	$(libebl_ppc_pic_a_SOURCES) $(libebl_s390_pic_a_SOURCES) \
+ 	$(libebl_sh_pic_a_SOURCES) $(libebl_sparc_pic_a_SOURCES) \
+ 	$(libebl_x86_64_pic_a_SOURCES)
++DIST_SOURCES = $(libebl_alpha_pic_a_SOURCES) \
++	$(libebl_arm_pic_a_SOURCES) $(libebl_i386_pic_a_SOURCES) \
++	$(libebl_ia64_pic_a_SOURCES) $(libebl_m68k_pic_a_SOURCES) \
++	$(libebl_mips_pic_a_SOURCES) $(libebl_parisc_pic_a_SOURCES) \
++	$(libebl_ppc64_pic_a_SOURCES) $(libebl_ppc_pic_a_SOURCES) \
++	$(libebl_s390_pic_a_SOURCES) $(libebl_sh_pic_a_SOURCES) \
++	$(libebl_sparc_pic_a_SOURCES) $(libebl_x86_64_pic_a_SOURCES)
+ DATA = $(noinst_DATA)
+ HEADERS = $(noinst_HEADERS)
+ ETAGS = etags
+@@ -270,11 +288,12 @@
+ CLEANFILES = *.gcno *.gcda $(foreach m,$(modules), libebl_$(m).map \
+ 	libebl_$(m).so $(am_libebl_$(m)_pic_a_OBJECTS))
+ textrel_check = if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
+-modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390
++modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 parisc mips m68k
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a \
+ 	     libebl_sparc_pic.a libebl_ppc_pic.a libebl_ppc64_pic.a \
+-	     libebl_s390_pic.a
++	     libebl_s390_pic.a libebl_parisc_pic.a libebl_mips_pic.a \
++	     libebl_m68k_pic.a
+ 
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+@@ -328,6 +347,15 @@
+ s390_SRCS = s390_init.c s390_symbol.c s390_regs.c s390_retval.c
+ libebl_s390_pic_a_SOURCES = $(s390_SRCS)
+ am_libebl_s390_pic_a_OBJECTS = $(s390_SRCS:.c=.os)
++parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
++libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
++am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
++mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
++libebl_mips_pic_a_SOURCES = $(mips_SRCS)
++am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
++m68k_SRCS = m68k_init.c m68k_symbol.c m68k_regs.c
++libebl_m68k_pic_a_SOURCES = $(m68k_SRCS)
++am_libebl_m68k_pic_a_OBJECTS = $(m68k_SRCS:.c=.os)
+ noinst_HEADERS = libebl_CPU.h common-reloc.c linux-core-note.c x86_corenote.c
+ EXTRA_DIST = $(foreach m,$(modules),$($(m)_SRCS)) $(modules:=_reloc.def)
+ all: all-am
+@@ -383,6 +411,18 @@
+ 	-rm -f libebl_ia64_pic.a
+ 	$(libebl_ia64_pic_a_AR) libebl_ia64_pic.a $(libebl_ia64_pic_a_OBJECTS) $(libebl_ia64_pic_a_LIBADD)
+ 	$(RANLIB) libebl_ia64_pic.a
++libebl_m68k_pic.a: $(libebl_m68k_pic_a_OBJECTS) $(libebl_m68k_pic_a_DEPENDENCIES) 
++	-rm -f libebl_m68k_pic.a
++	$(libebl_m68k_pic_a_AR) libebl_m68k_pic.a $(libebl_m68k_pic_a_OBJECTS) $(libebl_m68k_pic_a_LIBADD)
++	$(RANLIB) libebl_m68k_pic.a
++libebl_mips_pic.a: $(libebl_mips_pic_a_OBJECTS) $(libebl_mips_pic_a_DEPENDENCIES) 
++	-rm -f libebl_mips_pic.a
++	$(libebl_mips_pic_a_AR) libebl_mips_pic.a $(libebl_mips_pic_a_OBJECTS) $(libebl_mips_pic_a_LIBADD)
++	$(RANLIB) libebl_mips_pic.a
++libebl_parisc_pic.a: $(libebl_parisc_pic_a_OBJECTS) $(libebl_parisc_pic_a_DEPENDENCIES) 
++	-rm -f libebl_parisc_pic.a
++	$(libebl_parisc_pic_a_AR) libebl_parisc_pic.a $(libebl_parisc_pic_a_OBJECTS) $(libebl_parisc_pic_a_LIBADD)
++	$(RANLIB) libebl_parisc_pic.a
+ libebl_ppc64_pic.a: $(libebl_ppc64_pic_a_OBJECTS) $(libebl_ppc64_pic_a_DEPENDENCIES) 
+ 	-rm -f libebl_ppc64_pic.a
+ 	$(libebl_ppc64_pic_a_AR) libebl_ppc64_pic.a $(libebl_ppc64_pic_a_OBJECTS) $(libebl_ppc64_pic_a_LIBADD)
+@@ -439,6 +479,17 @@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ia64_regs.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ia64_retval.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ia64_symbol.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/m68k_init.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/m68k_regs.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/m68k_symbol.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mips_init.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mips_regs.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mips_retval.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mips_symbol.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/parisc_init.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/parisc_regs.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/parisc_retval.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/parisc_symbol.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ppc64_corenote.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ppc64_init.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ppc64_retval.Po@am__quote@
+Index: elfutils-0.148/configure
+===================================================================
+--- elfutils-0.148.orig/configure	2010-07-03 13:06:16.000000000 +0000
++++ elfutils-0.148/configure	2010-07-03 13:13:49.000000000 +0000
+@@ -602,6 +602,8 @@
+ base_cpu
+ NATIVE_LD_FALSE
+ NATIVE_LD_TRUE
++LD_AS_NEEDED
++WEXTRA
+ LEXLIB
+ LEX_OUTPUT_ROOT
+ LEX
+@@ -3852,6 +3854,130 @@
+   as_fn_error "gcc with C99 support required" "$LINENO" 5
+ fi
+ 
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for -Wextra option to $CC" >&5
++$as_echo_n "checking for -Wextra option to $CC... " >&6; }
++if test "${ac_cv_cc_wextra+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  old_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -Wextra"
++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++void foo (void) { }
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++  ac_cv_cc_wextra=yes
++else
++  ac_cv_cc_wextra=no
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++CFLAGS="$old_CFLAGS"
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_cc_wextra" >&5
++$as_echo "$ac_cv_cc_wextra" >&6; }
++
++if test "x$ac_cv_cc_wextra" = xyes; then :
++  WEXTRA=-Wextra
++else
++  WEXTRA=-W
++fi
++
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for -fgnu89-inline option to $CC" >&5
++$as_echo_n "checking for -fgnu89-inline option to $CC... " >&6; }
++if test "${ac_cv_cc_gnu89_inline+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  old_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -fgnu89-inline -Werror"
++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++void foo (void)
++{
++  inline void bar (void) {}
++  bar ();
++}
++extern inline void baz (void) {}
++
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++  ac_cv_cc_gnu89_inline=yes
++else
++  ac_cv_cc_gnu89_inline=no
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++CFLAGS="$old_CFLAGS"
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_cc_gnu89_inline" >&5
++$as_echo "$ac_cv_cc_gnu89_inline" >&6; }
++if test "x$ac_cv_cc_gnu89_inline" = xyes; then :
++  WEXTRA="${WEXTRA:+$WEXTRA }-fgnu89-inline"
++fi
++
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for --as-needed linker option" >&5
++$as_echo_n "checking for --as-needed linker option... " >&6; }
++if test "${ac_cv_as_needed+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  cat > conftest.c <<EOF
++int main (void) { return 0; }
++EOF
++if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS
++			    -fPIC -shared -o conftest.so conftest.c
++			    -Wl,--as-needed 1>&5'
++  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
++  (eval $ac_try) 2>&5
++  ac_status=$?
++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
++  test $ac_status = 0; }; }
++then
++  ac_cv_as_needed=yes
++else
++  ac_cv_as_needed=no
++fi
++rm -f conftest*
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_as_needed" >&5
++$as_echo "$ac_cv_as_needed" >&6; }
++if test "x$ac_cv_as_needed" = xyes; then :
++  LD_AS_NEEDED=-Wl,--as-needed
++else
++  LD_AS_NEEDED=
++fi
++
++
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for __builtin_popcount" >&5
++$as_echo_n "checking for __builtin_popcount... " >&6; }
++if test "${ac_cv_popcount+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++int
++main ()
++{
++exit (__builtin_popcount (127));
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_link "$LINENO"; then :
++  ac_cv_popcount=yes
++else
++  ac_cv_popcount=no
++fi
++rm -f core conftest.err conftest.$ac_objext \
++    conftest$ac_exeext conftest.$ac_ext
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_popcount" >&5
++$as_echo "$ac_cv_popcount" >&6; }
++if test "x$ac_cv_popcount" = xyes; then :
++
++$as_echo "#define HAVE_BUILTIN_POPCOUNT 1" >>confdefs.h
++
++fi
++
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for __thread support" >&5
+ $as_echo_n "checking for __thread support... " >&6; }
+ if test "${ac_cv_tls+set}" = set; then :
+@@ -3888,7 +4014,13 @@
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_tls" >&5
+ $as_echo "$ac_cv_tls" >&6; }
+ if test "x$ac_cv_tls" != xyes; then :
+-  as_fn_error "__thread support required" "$LINENO" 5
++  if test "$use_locks" = yes; then :
++  as_fn_error "--enable-thread-safety requires __thread support" "$LINENO" 5
++else
++
++$as_echo "#define __thread /* empty: no multi-thread support */" >>confdefs.h
++
++fi
+ fi
+ 
+ # Check whether --enable-largefile was given.
+@@ -4874,7 +5006,7 @@
+ 
+ # 1.234<whatever> -> 1234<whatever>
+ case "$PACKAGE_VERSION" in
+-[0-9].*) eu_version="${PACKAGE_VERSION/./}" ;;
++[0-9].*) eu_version=`echo "$PACKAGE_VERSION" | sed 's@\.@@'` ;;
+ *)     	   as_fn_error "confused by version number '$PACKAGE_VERSION'" "$LINENO" 5 ;;
+ esac
+ case "$eu_version" in
+@@ -4903,7 +5035,7 @@
+ esac
+ 
+ # Round up to the next release API (x.y) version.
+-eu_version=$[($eu_version + 999) / 1000]
++eu_version=`expr \( $eu_version + 999 \) / 1000`
+ 
+ cat >confcache <<\_ACEOF
+ # This file is a shell script that caches the results of configure
diff --git a/recipes/elfutils/elfutils-0.148/elf_additions.diff b/recipes/elfutils/elfutils-0.148/elf_additions.diff
new file mode 100644
index 0000000..5baa709
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/elf_additions.diff
@@ -0,0 +1,71 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.146/libelf/elf.h
+===================================================================
+--- elfutils-0.146.orig/libelf/elf.h	2010-04-24 10:13:50.000000000 +0000
++++ elfutils-0.146/libelf/elf.h	2010-04-24 10:22:43.000000000 +0000
+@@ -143,6 +143,7 @@
+ #define ELFOSABI_HPUX		1	/* HP-UX */
+ #define ELFOSABI_NETBSD		2	/* NetBSD.  */
+ #define ELFOSABI_LINUX		3	/* Linux.  */
++#define ELFOSABI_HURD		4	/* GNU/Hurd */
+ #define ELFOSABI_SOLARIS	6	/* Sun Solaris.  */
+ #define ELFOSABI_AIX		7	/* IBM AIX.  */
+ #define ELFOSABI_IRIX		8	/* SGI Irix.  */
+@@ -150,8 +151,13 @@
+ #define ELFOSABI_TRU64		10	/* Compaq TRU64 UNIX.  */
+ #define ELFOSABI_MODESTO	11	/* Novell Modesto.  */
+ #define ELFOSABI_OPENBSD	12	/* OpenBSD.  */
++#define ELFOSABI_OPENVMS	13	/* OpenVMS */
++#define ELFOSABI_NSK		14	/* Hewlett-Packard Non-Stop Kernel */
++#define ELFOSABI_AROS		15	/* Amiga Research OS */
++/* 64-255 Architecture-specific value range */
+ #define ELFOSABI_ARM_AEABI	64	/* ARM EABI */
+ #define ELFOSABI_ARM		97	/* ARM */
++/* This is deprecated? It's not in the latest version anymore. */
+ #define ELFOSABI_STANDALONE	255	/* Standalone (embedded) application */
+ 
+ #define EI_ABIVERSION	8		/* ABI version */
+@@ -206,7 +212,7 @@
+ #define EM_H8_300H	47		/* Hitachi H8/300H */
+ #define EM_H8S		48		/* Hitachi H8S */
+ #define EM_H8_500	49		/* Hitachi H8/500 */
+-#define EM_IA_64	50		/* Intel Merced */
++#define EM_IA_64	50		/* Intel IA64 */
+ #define EM_MIPS_X	51		/* Stanford MIPS-X */
+ #define EM_COLDFIRE	52		/* Motorola Coldfire */
+ #define EM_68HC12	53		/* Motorola M68HC12 */
+@@ -220,7 +226,8 @@
+ #define EM_TINYJ	61		/* Advanced Logic Corp. Tinyj emb.fam*/
+ #define EM_X86_64	62		/* AMD x86-64 architecture */
+ #define EM_PDSP		63		/* Sony DSP Processor */
+-
++#define	EM_PDP10	64		/* Digital Equipment Corp. PDP-10 */
++#define EM_PDP11	65		/* Digital Equipment Corp. PDP-11 */
+ #define EM_FX66		66		/* Siemens FX66 microcontroller */
+ #define EM_ST9PLUS	67		/* STMicroelectronics ST9+ 8/16 mc */
+ #define EM_ST7		68		/* STmicroelectronics ST7 8 bit mc */
+@@ -250,7 +257,22 @@
+ #define EM_OPENRISC	92		/* OpenRISC 32-bit embedded processor */
+ #define EM_ARC_A5	93		/* ARC Cores Tangent-A5 */
+ #define EM_XTENSA	94		/* Tensilica Xtensa Architecture */
+-#define EM_NUM		95
++#define	EM_VIDEOCORE	95		/* Alphamosaic VideoCore processor */
++#define	EM_TMM_GPP	96		/* Thompson Multimedia General Purpose Processor */
++#define	EM_NS32K	97		/* National Semiconductor 32000 series */
++#define	EM_TPC		98		/* Tenor Network TPC processor */
++#define	EM_SNP1K	99		/* Trebia SNP 1000 processor */
++#define	EM_ST200	100		/* STMicroelectronics (www.st.com) ST200 microcontroller */
++#define EM_IP2K         101		/* Ubicom IP2XXX microcontroller family */
++#define	EM_MAX		102		/* MAX Processor */
++#define EM_CR           103		/* National Semiconductor CompactRISC */
++#define	EM_F2MC16	104		/* Fujitsu F2MC16 */
++#define EM_MSP430       105		/* TI msp430 micro controller */
++#define EM_BLACKFIN     106		/* Analog Devices Blackfin (DSP) processor */
++#define EM_SE_C33	107		/* S1C33 Family of Seiko Epson processors */
++#define	EM_SEP		108		/* Sharp embedded microprocessor */
++#define EM_ARCA		109		/* Arca RISC Microprocessor */
++#define EM_NUM		110
+ 
+ /* If it is necessary to assign new unofficial EM_* values, please
+    pick large random numbers (0x8523, 0xa7f2, etc.) to minimize the
diff --git a/recipes/elfutils/elfutils-0.148/elfutils-fsize.patch b/recipes/elfutils/elfutils-0.148/elfutils-fsize.patch
new file mode 100644
index 0000000..0ff353d
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/elfutils-fsize.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Backport
+
+The ELF_T_LIB and ELF_T_GNUHASH sizes were missing from fsize table.
+
+This could cause a failure in the elf*_xlatetof function.
+
+diff -ur elfutils-0.148.orig/libelf/exttypes.h elfutils-0.148/libelf/exttypes.h
+--- elfutils-0.148.orig/libelf/exttypes.h	2009-01-08 12:56:37.000000000 -0800
++++ elfutils-0.148/libelf/exttypes.h	2010-08-18 14:00:33.000000000 -0700
+@@ -94,6 +94,7 @@
+ Vernaux32 (Ext_);
+ Syminfo32 (Ext_);
+ Move32 (Ext_);
++Lib32 (Ext_);
+ auxv_t32 (Ext_);
+ 
+ Ehdr64 (Ext_);
+@@ -110,6 +111,7 @@
+ Vernaux64 (Ext_);
+ Syminfo64 (Ext_);
+ Move64 (Ext_);
++Lib64 (Ext_);
+ auxv_t64 (Ext_);
+ 
+ #undef START
+diff -ur elfutils-0.148.orig/libelf/gelf_fsize.c elfutils-0.148/libelf/gelf_fsize.c
+--- elfutils-0.148.orig/libelf/gelf_fsize.c	2009-01-08 12:56:37.000000000 -0800
++++ elfutils-0.148/libelf/gelf_fsize.c	2010-08-18 14:11:57.000000000 -0700
+@@ -87,7 +87,9 @@
+       [ELF_T_NHDR]	= sizeof (ElfW2(LIBELFBITS, Ext_Nhdr)),		      \
+       [ELF_T_SYMINFO]	= sizeof (ElfW2(LIBELFBITS, Ext_Syminfo)),	      \
+       [ELF_T_MOVE]	= sizeof (ElfW2(LIBELFBITS, Ext_Move)),		      \
+-      [ELF_T_AUXV]	= sizeof (ElfW2(LIBELFBITS, Ext_auxv_t))
++      [ELF_T_LIB]	= sizeof (ElfW2(LIBELFBITS, Ext_Lib)),		      \
++      [ELF_T_AUXV]	= sizeof (ElfW2(LIBELFBITS, Ext_auxv_t)),	      \
++      [ELF_T_GNUHASH]	= ELFW2(LIBELFBITS, FSZ_WORD)
+       TYPE_SIZES (32)
+     },
+     [ELFCLASS64 - 1] = {
diff --git a/recipes/elfutils/elfutils-0.148/hppa_backend.diff b/recipes/elfutils/elfutils-0.148/hppa_backend.diff
new file mode 100644
index 0000000..a86b97c
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/hppa_backend.diff
@@ -0,0 +1,801 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.146/backends/parisc_init.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.146/backends/parisc_init.c	2010-04-24 10:10:50.000000000 +0000
+@@ -0,0 +1,74 @@
++/* Initialization of PA-RISC specific backend library.
++   Copyright (C) 2002, 2005, 2006 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++   Written by Ulrich Drepper <drepper@redhat.com>, 2002.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#define BACKEND		parisc_
++#define RELOC_PREFIX	R_PARISC_
++#include "libebl_CPU.h"
++#include "libebl_parisc.h"
++
++/* This defines the common reloc hooks based on parisc_reloc.def.  */
++#include "common-reloc.c"
++
++
++const char *
++parisc_init (elf, machine, eh, ehlen)
++     Elf *elf __attribute__ ((unused));
++     GElf_Half machine __attribute__ ((unused));
++     Ebl *eh;
++     size_t ehlen;
++{
++  int pa64 = 0;
++
++  /* Check whether the Elf_BH object has a sufficent size.  */
++  if (ehlen < sizeof (Ebl))
++    return NULL;
++
++  if (elf) {
++    GElf_Ehdr ehdr_mem;
++    GElf_Ehdr *ehdr = gelf_getehdr (elf, &ehdr_mem);
++    if (ehdr && (ehdr->e_flags & EF_PARISC_WIDE))
++      pa64 = 1;
++  }
++  /* We handle it.  */
++  eh->name = "PA-RISC";
++  parisc_init_reloc (eh);
++  HOOK (eh, reloc_simple_type);
++  HOOK (eh, machine_flag_check);
++  HOOK (eh, symbol_type_name);
++  HOOK (eh, segment_type_name);
++  HOOK (eh, section_type_name);
++  HOOK (eh, register_info);
++  if (pa64)
++    eh->return_value_location = parisc_return_value_location_64;
++  else
++    eh->return_value_location = parisc_return_value_location_32;
++
++  return MODVERSION;
++}
+Index: elfutils-0.146/backends/parisc_regs.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.146/backends/parisc_regs.c	2010-04-24 10:10:50.000000000 +0000
+@@ -0,0 +1,159 @@
++/* Register names and numbers for PA-RISC DWARF.
++   Copyright (C) 2005, 2006 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <string.h>
++#include <dwarf.h>
++
++#define BACKEND parisc_
++#include "libebl_CPU.h"
++
++ssize_t
++parisc_register_info (Ebl *ebl, int regno, char *name, size_t namelen,
++		     const char **prefix, const char **setname,
++		     int *bits, int *type)
++{
++  int pa64 = 0;
++
++  if (ebl->elf) {
++    GElf_Ehdr ehdr_mem;
++    GElf_Ehdr *ehdr = gelf_getehdr (ebl->elf, &ehdr_mem);
++    if (ehdr->e_flags & EF_PARISC_WIDE)
++      pa64 = 1;
++  }
++
++  int nregs = pa64 ? 127 : 128;
++
++  if (name == NULL)
++    return nregs;
++
++  if (regno < 0 || regno >= nregs || namelen < 6)
++    return -1;
++
++  *prefix = "%";
++
++  if (regno < 32)
++  {
++    *setname = "integer";
++    *type = DW_ATE_signed;
++    if (pa64)
++    {
++	*bits = 64;
++    }
++    else
++    {
++    	*bits = 32;
++    }
++  }
++  else if (regno == 32)
++  {
++    *setname = "special";
++    if (pa64)
++    {
++	*bits = 6;
++    }
++    else
++    {
++    	*bits = 5;
++    }
++    *type = DW_ATE_unsigned;
++  }
++  else
++  {
++    *setname = "FPU";
++    *type = DW_ATE_float;
++    if (pa64)
++    {
++	*bits = 64;
++    }
++    else
++    {
++    	*bits = 32;
++    }
++  }
++
++  if (regno < 33) {
++    switch (regno)
++      {
++      case 0 ... 9:
++        name[0] = 'r';
++        name[1] = regno + '0';
++        namelen = 2;
++        break;
++      case 10 ... 31:
++        name[0] = 'r';
++        name[1] = regno / 10 + '0';
++        name[2] = regno % 10 + '0';
++        namelen = 3;
++        break;
++      case 32:
++	*prefix = NULL;
++	name[0] = 'S';
++	name[1] = 'A';
++	name[2] = 'R';
++	namelen = 3;
++	break;
++      }
++  }
++  else {
++    if (pa64 && ((regno - 72) % 2)) {
++      *setname = NULL;
++      return 0;
++    }
++
++    switch (regno)
++      {
++      case 72 + 0 ... 72 + 11:
++        name[0] = 'f';
++	name[1] = 'r';
++        name[2] = (regno + 8 - 72) / 2 + '0';
++        namelen = 3;
++        if ((regno + 8 - 72) % 2) {
++	  name[3] = 'R';
++	  namelen++;
++        }
++        break;
++      case 72 + 12 ... 72 + 55:
++        name[0] = 'f';
++	name[1] = 'r';
++        name[2] = (regno + 8 - 72) / 2 / 10 + '0';
++        name[3] = (regno + 8 - 72) / 2 % 10 + '0';
++        namelen = 4;
++        if ((regno + 8 - 72) % 2) {
++	  name[4] = 'R';
++	  namelen++;
++        }
++        break;
++      default:
++        *setname = NULL;
++        return 0;
++      }
++  }
++  name[namelen++] = '\0';
++  return namelen;
++}
+Index: elfutils-0.146/backends/parisc_reloc.def
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.146/backends/parisc_reloc.def	2010-04-24 10:10:50.000000000 +0000
+@@ -0,0 +1,128 @@
++/* List the relocation types for PA-RISC.  -*- C -*-
++   Copyright (C) 2005 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++/*	    NAME,		REL|EXEC|DYN	*/
++
++RELOC_TYPE (NONE,		EXEC|DYN)
++RELOC_TYPE (DIR32,		REL|EXEC|DYN)
++RELOC_TYPE (DIR21L,		REL|EXEC|DYN)
++RELOC_TYPE (DIR17R,		REL)
++RELOC_TYPE (DIR17F,		REL)
++RELOC_TYPE (DIR14R,		REL|DYN)
++RELOC_TYPE (PCREL32,		REL)
++RELOC_TYPE (PCREL21L,		REL)
++RELOC_TYPE (PCREL17R,		REL)
++RELOC_TYPE (PCREL17F,		REL)
++RELOC_TYPE (PCREL14R,		REL|EXEC)
++RELOC_TYPE (DPREL21L,		REL)
++RELOC_TYPE (DPREL14WR,		REL)
++RELOC_TYPE (DPREL14DR,          REL)
++RELOC_TYPE (DPREL14R,		REL)
++RELOC_TYPE (GPREL21L,		0)
++RELOC_TYPE (GPREL14R,		0)
++RELOC_TYPE (LTOFF21L,		REL)
++RELOC_TYPE (LTOFF14R,		REL)
++RELOC_TYPE (DLTIND14F,		0)
++RELOC_TYPE (SETBASE,		0)
++RELOC_TYPE (SECREL32,		REL)
++RELOC_TYPE (BASEREL21L,		0)
++RELOC_TYPE (BASEREL17R,		0)
++RELOC_TYPE (BASEREL14R,		0)
++RELOC_TYPE (SEGBASE,		0)
++RELOC_TYPE (SEGREL32,		REL)
++RELOC_TYPE (PLTOFF21L,		0)
++RELOC_TYPE (PLTOFF14R,		0)
++RELOC_TYPE (PLTOFF14F,		0)
++RELOC_TYPE (LTOFF_FPTR32,	0)
++RELOC_TYPE (LTOFF_FPTR21L,	0)
++RELOC_TYPE (LTOFF_FPTR14R,	0)
++RELOC_TYPE (FPTR64,		0)
++RELOC_TYPE (PLABEL32,		REL|DYN)
++RELOC_TYPE (PCREL64,		0)
++RELOC_TYPE (PCREL22C,		0)
++RELOC_TYPE (PCREL22F,		0)
++RELOC_TYPE (PCREL14WR,		0)
++RELOC_TYPE (PCREL14DR,		0)
++RELOC_TYPE (PCREL16F,		0)
++RELOC_TYPE (PCREL16WF,		0)
++RELOC_TYPE (PCREL16DF,		0)
++RELOC_TYPE (DIR64,		REL|DYN)
++RELOC_TYPE (DIR14WR,		REL)
++RELOC_TYPE (DIR14DR,		REL)
++RELOC_TYPE (DIR16F,		REL)
++RELOC_TYPE (DIR16WF,		REL)
++RELOC_TYPE (DIR16DF,		REL)
++RELOC_TYPE (GPREL64,		0)
++RELOC_TYPE (GPREL14WR,		0)
++RELOC_TYPE (GPREL14DR,		0)
++RELOC_TYPE (GPREL16F,		0)
++RELOC_TYPE (GPREL16WF,		0)
++RELOC_TYPE (GPREL16DF,		0)
++RELOC_TYPE (LTOFF64,		0)
++RELOC_TYPE (LTOFF14WR,		0)
++RELOC_TYPE (LTOFF14DR,		0)
++RELOC_TYPE (LTOFF16F,		0)
++RELOC_TYPE (LTOFF16WF,		0)
++RELOC_TYPE (LTOFF16DF,		0)
++RELOC_TYPE (SECREL64,		0)
++RELOC_TYPE (BASEREL14WR,	0)
++RELOC_TYPE (BASEREL14DR,	0)
++RELOC_TYPE (SEGREL64,		0)
++RELOC_TYPE (PLTOFF14WR,		0)
++RELOC_TYPE (PLTOFF14DR,		0)
++RELOC_TYPE (PLTOFF16F,		0)
++RELOC_TYPE (PLTOFF16WF,		0)
++RELOC_TYPE (PLTOFF16DF,		0)
++RELOC_TYPE (LTOFF_FPTR64,	0)
++RELOC_TYPE (LTOFF_FPTR14WR,	0)
++RELOC_TYPE (LTOFF_FPTR14DR,	0)
++RELOC_TYPE (LTOFF_FPTR16F,	0)
++RELOC_TYPE (LTOFF_FPTR16WF,	0)
++RELOC_TYPE (LTOFF_FPTR16DF,	0)
++RELOC_TYPE (COPY,		EXEC)
++RELOC_TYPE (IPLT,		EXEC|DYN)
++RELOC_TYPE (EPLT,		0)
++RELOC_TYPE (TPREL32,		DYN)
++RELOC_TYPE (TPREL21L,		0)
++RELOC_TYPE (TPREL14R,		0)
++RELOC_TYPE (LTOFF_TP21L,	0)
++RELOC_TYPE (LTOFF_TP14R,	0)
++RELOC_TYPE (LTOFF_TP14F,	0)
++RELOC_TYPE (TPREL64,		0)
++RELOC_TYPE (TPREL14WR,		0)
++RELOC_TYPE (TPREL14DR,		0)
++RELOC_TYPE (TPREL16F,		0)
++RELOC_TYPE (TPREL16WF,		0)
++RELOC_TYPE (TPREL16DF,		0)
++RELOC_TYPE (LTOFF_TP64,		0)
++RELOC_TYPE (LTOFF_TP14WR,	0)
++RELOC_TYPE (LTOFF_TP14DR,	0)
++RELOC_TYPE (LTOFF_TP16F,	0)
++RELOC_TYPE (LTOFF_TP16WF,	0)
++RELOC_TYPE (LTOFF_TP16DF,	0)
++RELOC_TYPE (TLS_DTPMOD32,	DYN)
++RELOC_TYPE (TLS_DTPMOD64,	DYN)
++
++#define NO_RELATIVE_RELOC       1
+Index: elfutils-0.146/backends/parisc_retval.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.146/backends/parisc_retval.c	2010-04-24 10:10:50.000000000 +0000
+@@ -0,0 +1,213 @@
++/* Function return value location for Linux/PA-RISC ABI.
++   Copyright (C) 2005 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <assert.h>
++#include <dwarf.h>
++
++#define BACKEND parisc_
++#include "libebl_CPU.h"
++#include "libebl_parisc.h"
++
++/* %r28, or pair %r28, %r29.  */
++static const Dwarf_Op loc_intreg32[] =
++  {
++    { .atom = DW_OP_reg28 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_reg29 }, { .atom = DW_OP_piece, .number = 4 },
++  };
++
++static const Dwarf_Op loc_intreg[] =
++  {
++    { .atom = DW_OP_reg28 }, { .atom = DW_OP_piece, .number = 8 },
++    { .atom = DW_OP_reg29 }, { .atom = DW_OP_piece, .number = 8 },
++  };
++#define nloc_intreg	1
++#define nloc_intregpair	4
++
++/* %fr4L, or pair %fr4L, %fr4R on pa-32 */
++static const Dwarf_Op loc_fpreg32[] =
++  {
++    { .atom = DW_OP_regx, .number = 72 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_regx, .number = 73 }, { .atom = DW_OP_piece, .number = 4 },
++  };
++#define nloc_fpreg32 2
++#define nloc_fpregpair32 4
++
++/* $fr4 */
++static const Dwarf_Op loc_fpreg[] =
++  {
++    { .atom = DW_OP_regx, .number = 72 },
++  };
++#define nloc_fpreg  1
++
++#if 0
++/* The return value is a structure and is actually stored in stack space
++   passed in a hidden argument by the caller. Address of the location is stored
++   in %r28 before function call, but it may be changed by function. */
++static const Dwarf_Op loc_aggregate[] =
++  {
++    { .atom = DW_OP_breg28 },
++  };
++#define nloc_aggregate 1
++#endif
++
++static int
++parisc_return_value_location_ (Dwarf_Die *functypedie, const Dwarf_Op **locp, int pa64)
++{
++  Dwarf_Word regsize = pa64 ? 8 : 4;
++
++  /* Start with the function's type, and get the DW_AT_type attribute,
++     which is the type of the return value.  */
++
++  Dwarf_Attribute attr_mem;
++  Dwarf_Attribute *attr = dwarf_attr_integrate (functypedie, DW_AT_type, &attr_mem);
++  if (attr == NULL)
++    /* The function has no return value, like a `void' function in C.  */
++    return 0;
++
++  Dwarf_Die die_mem;
++  Dwarf_Die *typedie = dwarf_formref_die (attr, &die_mem);
++  int tag = dwarf_tag (typedie);
++
++  /* Follow typedefs and qualifiers to get to the actual type.  */
++  while (tag == DW_TAG_typedef
++	 || tag == DW_TAG_const_type || tag == DW_TAG_volatile_type
++	 || tag == DW_TAG_restrict_type || tag == DW_TAG_mutable_type)
++    {
++      attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
++      typedie = dwarf_formref_die (attr, &die_mem);
++      tag = dwarf_tag (typedie);
++    }
++
++  switch (tag)
++    {
++    case -1:
++      return -1;
++
++    case DW_TAG_subrange_type:
++      if (! dwarf_hasattr_integrate (typedie, DW_AT_byte_size))
++	{
++	  attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
++	  typedie = dwarf_formref_die (attr, &die_mem);
++	  tag = dwarf_tag (typedie);
++	}
++      /* Fall through.  */
++
++    case DW_TAG_base_type:
++    case DW_TAG_enumeration_type:
++    case DW_TAG_pointer_type:
++    case DW_TAG_ptr_to_member_type:
++      {
++        Dwarf_Word size;
++	if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_byte_size,
++					 &attr_mem), &size) != 0)
++	  {
++	    if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
++	      size = 4;
++	    else
++	      return -1;
++	  }
++	if (tag == DW_TAG_base_type)
++	  {
++	    Dwarf_Word encoding;
++	    if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
++					     &attr_mem), &encoding) != 0)
++	      return -1;
++
++	    if (encoding == DW_ATE_float)
++	      {
++		if (pa64) {
++		  *locp = loc_fpreg;
++		  if (size <= 8)
++		      return nloc_fpreg;
++		}
++		else {
++		  *locp = loc_fpreg32;
++		  if (size <= 4)
++		    return nloc_fpreg32;
++		  else if (size <= 8)
++		    return nloc_fpregpair32;
++		}
++		goto aggregate;
++	      }
++	  }
++	if (pa64)
++	  *locp = loc_intreg;
++	else
++	  *locp = loc_intreg32;
++	if (size <= regsize)
++	  return nloc_intreg;
++	if (size <= 2 * regsize)
++	  return nloc_intregpair;
++
++	/* Else fall through.  */
++      }
++
++    case DW_TAG_structure_type:
++    case DW_TAG_class_type:
++    case DW_TAG_union_type:
++    case DW_TAG_array_type:
++    aggregate: {
++        Dwarf_Word size;
++	if (dwarf_aggregate_size (typedie, &size) != 0)
++	  return -1;
++	if (pa64)
++          *locp = loc_intreg;
++	else
++	  *locp = loc_intreg32;
++        if (size <= regsize)
++	  return nloc_intreg;
++        if (size <= 2 * regsize)
++	  return nloc_intregpair;
++#if 0
++	/* there should be some way to know this location... But I do not see it. */
++        *locp = loc_aggregate;
++        return nloc_aggregate;
++#endif
++	/* fall through.  */
++      }
++    }
++
++  /* XXX We don't have a good way to return specific errors from ebl calls.
++     This value means we do not understand the type, but it is well-formed
++     DWARF and might be valid.  */
++  return -2;
++}
++
++int
++parisc_return_value_location_32 (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++{
++  return parisc_return_value_location_ (functypedie, locp, 0);
++}
++
++int
++parisc_return_value_location_64 (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++{
++  return parisc_return_value_location_ (functypedie, locp, 1);
++}
++
+Index: elfutils-0.146/backends/parisc_symbol.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.146/backends/parisc_symbol.c	2010-04-24 10:10:50.000000000 +0000
+@@ -0,0 +1,112 @@
++/* PA-RISC specific symbolic name handling.
++   Copyright (C) 2002, 2005 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++   Written by Ulrich Drepper <drepper@redhat.com>, 2002.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <elf.h>
++#include <stddef.h>
++
++#define BACKEND		parisc_
++#include "libebl_CPU.h"
++
++const char *
++parisc_segment_type_name (int segment, char *buf __attribute__ ((unused)),
++			size_t len __attribute__ ((unused)))
++{
++  switch (segment)
++    {
++    case PT_PARISC_ARCHEXT:
++      return "PARISC_ARCHEXT";
++    case PT_PARISC_UNWIND:
++      return "PARISC_UNWIND";
++    default:
++      break;
++    }
++  return NULL;
++}
++
++/* Return symbolic representation of symbol type.  */
++const char *
++parisc_symbol_type_name(int symbol, char *buf __attribute__ ((unused)),
++    size_t len __attribute__ ((unused)))
++{
++	if (symbol == STT_PARISC_MILLICODE)
++	  return "PARISC_MILLI";
++	return NULL;
++}
++
++/* Return symbolic representation of section type.  */
++const char *
++parisc_section_type_name (int type,
++			char *buf __attribute__ ((unused)),
++			size_t len __attribute__ ((unused)))
++{
++  switch (type)
++    {
++    case SHT_PARISC_EXT:
++      return "PARISC_EXT";
++    case SHT_PARISC_UNWIND:
++      return "PARISC_UNWIND";
++    case SHT_PARISC_DOC:
++      return "PARISC_DOC";
++    }
++
++  return NULL;
++}
++
++/* Check whether machine flags are valid.  */
++bool
++parisc_machine_flag_check (GElf_Word flags)
++{
++  if (flags &~ (EF_PARISC_TRAPNIL | EF_PARISC_EXT | EF_PARISC_LSB |
++	EF_PARISC_WIDE | EF_PARISC_NO_KABP |
++	EF_PARISC_LAZYSWAP | EF_PARISC_ARCH))
++    return 0;
++
++  GElf_Word arch = flags & EF_PARISC_ARCH;
++
++  return ((arch == EFA_PARISC_1_0) || (arch == EFA_PARISC_1_1) ||
++      (arch == EFA_PARISC_2_0));
++}
++
++/* Check for the simple reloc types.  */
++Elf_Type
++parisc_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type)
++{
++  switch (type)
++    {
++    case R_PARISC_DIR64:
++    case R_PARISC_SECREL64:
++      return ELF_T_XWORD;
++    case R_PARISC_DIR32:
++    case R_PARISC_SECREL32:
++      return ELF_T_WORD;
++    default:
++      return ELF_T_NUM;
++    }
++}
+Index: elfutils-0.146/backends/libebl_parisc.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.146/backends/libebl_parisc.h	2010-04-24 10:10:50.000000000 +0000
+@@ -0,0 +1,9 @@
++#ifndef _LIBEBL_HPPA_H
++#define _LIBEBL_HPPA_H 1
++
++#include <libdw.h>
++
++extern int parisc_return_value_location_32(Dwarf_Die *, const Dwarf_Op **locp);
++extern int parisc_return_value_location_64(Dwarf_Die *, const Dwarf_Op **locp);
++
++#endif
+Index: elfutils-0.146/backends/Makefile.am
+===================================================================
+--- elfutils-0.146.orig/backends/Makefile.am	2010-04-24 10:10:41.000000000 +0000
++++ elfutils-0.146/backends/Makefile.am	2010-04-24 10:10:50.000000000 +0000
+@@ -29,11 +29,11 @@
+ 	   -I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
+ 
+ 
+-modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390
++modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 parisc
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a \
+ 	     libebl_sparc_pic.a libebl_ppc_pic.a libebl_ppc64_pic.a \
+-	     libebl_s390_pic.a
++	     libebl_s390_pic.a libebl_parisc_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -95,6 +95,9 @@
+ libebl_s390_pic_a_SOURCES = $(s390_SRCS)
+ am_libebl_s390_pic_a_OBJECTS = $(s390_SRCS:.c=.os)
+ 
++parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
++libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
++am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ 	@rm -f $(@:.so=.map)
+Index: elfutils-0.146/libelf/elf.h
+===================================================================
+--- elfutils-0.146.orig/libelf/elf.h	2010-04-13 20:08:02.000000000 +0000
++++ elfutils-0.146/libelf/elf.h	2010-04-24 10:10:50.000000000 +0000
+@@ -1789,16 +1789,24 @@
+ #define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
+ #define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
+ #define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
++#define R_PARISC_DPREL14WR	19
++#define R_PARISC_DPREL14DR	20
+ #define R_PARISC_DPREL14R	22	/* Right 14 bits of rel. address.  */
+ #define R_PARISC_GPREL21L	26	/* GP-relative, left 21 bits.  */
+ #define R_PARISC_GPREL14R	30	/* GP-relative, right 14 bits.  */
+ #define R_PARISC_LTOFF21L	34	/* LT-relative, left 21 bits.  */
+ #define R_PARISC_LTOFF14R	38	/* LT-relative, right 14 bits.  */
++#define R_PARISC_DLTIND14F	39
++#define R_PARISC_SETBASE	40
+ #define R_PARISC_SECREL32	41	/* 32 bits section rel. address.  */
++#define R_PARISC_BASEREL21L	42
++#define R_PARISC_BASEREL17R	43
++#define R_PARISC_BASEREL14R	46
+ #define R_PARISC_SEGBASE	48	/* No relocation, set segment base.  */
+ #define R_PARISC_SEGREL32	49	/* 32 bits segment rel. address.  */
+ #define R_PARISC_PLTOFF21L	50	/* PLT rel. address, left 21 bits.  */
+ #define R_PARISC_PLTOFF14R	54	/* PLT rel. address, right 14 bits.  */
++#define R_PARISC_PLTOFF14F	55
+ #define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
+ #define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
+ #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
+@@ -1807,6 +1815,7 @@
+ #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
+ #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
+ #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
++#define R_PARISC_PCREL22C	73
+ #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
+ #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
+ #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
+@@ -1832,6 +1841,8 @@
+ #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
+ #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
+ #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
++#define R_PARISC_BASEREL14WR	107
++#define R_PARISC_BASEREL14DR	108
+ #define R_PARISC_SEGREL64	112	/* 64 bits segment rel. address.  */
+ #define R_PARISC_PLTOFF14WR	115	/* PLT-rel. address, right 14 bits.  */
+ #define R_PARISC_PLTOFF14DR	116	/* PLT-rel. address, right 14 bits.  */
diff --git a/recipes/elfutils/elfutils-0.148/i386_dis.h b/recipes/elfutils/elfutils-0.148/i386_dis.h
new file mode 100644
index 0000000..a5cc01f
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/i386_dis.h
@@ -0,0 +1,1657 @@
+#define MNEMONIC_BITS 10
+#define SUFFIX_BITS 3
+#define FCT1_BITS 7
+#define STR1_BITS 4
+#define OFF1_1_BITS 7
+#define OFF1_1_BIAS 3
+#define OFF1_2_BITS 7
+#define OFF1_2_BIAS 4
+#define OFF1_3_BITS 1
+#define OFF1_3_BIAS 7
+#define FCT2_BITS 6
+#define STR2_BITS 2
+#define OFF2_1_BITS 7
+#define OFF2_1_BIAS 5
+#define OFF2_2_BITS 7
+#define OFF2_2_BIAS 4
+#define OFF2_3_BITS 4
+#define OFF2_3_BIAS 7
+#define FCT3_BITS 4
+#define STR3_BITS 1
+#define OFF3_1_BITS 6
+#define OFF3_1_BIAS 10
+#define OFF3_2_BITS 1
+#define OFF3_2_BIAS 21
+
+#include <i386_data.h>
+
+#define suffix_none 0
+#define suffix_w 1
+#define suffix_w0 2
+#define suffix_W 3
+#define suffix_tttn 4
+#define suffix_D 7
+#define suffix_w1 5
+#define suffix_W1 6
+
+static const opfct_t op1_fct[] =
+{
+  NULL,
+  FCT_MOD$R_M,
+  FCT_Mod$R_m,
+  FCT_abs,
+  FCT_ax,
+  FCT_ax$w,
+  FCT_ccc,
+  FCT_ddd,
+  FCT_disp8,
+  FCT_ds_bx,
+  FCT_ds_si,
+  FCT_dx,
+  FCT_es_di,
+  FCT_freg,
+  FCT_imm$s,
+  FCT_imm$w,
+  FCT_imm16,
+  FCT_imm8,
+  FCT_imms8,
+  FCT_mmxreg,
+  FCT_mod$16r_m,
+  FCT_mod$64r_m,
+  FCT_mod$8r_m,
+  FCT_mod$r_m,
+  FCT_mod$r_m$w,
+  FCT_reg,
+  FCT_reg$w,
+  FCT_reg16,
+  FCT_reg64,
+  FCT_rel,
+  FCT_sel,
+  FCT_sreg2,
+  FCT_sreg3,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op1_str[] =
+  "%ax\0"
+  "%cl\0"
+  "%eax\0"
+  "%st\0"
+  "%xmm0\0"
+  "*";
+static const uint8_t op1_str_idx[] = {
+  0,
+  4,
+  8,
+  13,
+  17,
+  23,
+};
+static const opfct_t op2_fct[] =
+{
+  NULL,
+  FCT_MOD$R_M,
+  FCT_Mod$R_m,
+  FCT_abs,
+  FCT_absval,
+  FCT_ax$w,
+  FCT_ccc,
+  FCT_ddd,
+  FCT_ds_si,
+  FCT_dx,
+  FCT_es_di,
+  FCT_freg,
+  FCT_imm8,
+  FCT_mmxreg,
+  FCT_mod$64r_m,
+  FCT_mod$r_m,
+  FCT_mod$r_m$w,
+  FCT_moda$r_m,
+  FCT_reg,
+  FCT_reg$w,
+  FCT_reg64,
+  FCT_sreg3,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op2_str[] =
+  "%ecx\0"
+  "%st";
+static const uint8_t op2_str_idx[] = {
+  0,
+  5,
+};
+static const opfct_t op3_fct[] =
+{
+  NULL,
+  FCT_mmxreg,
+  FCT_mod$r_m,
+  FCT_reg,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op3_str[] =
+  "%edx";
+static const uint8_t op3_str_idx[] = {
+  0,
+};
+static const struct instr_enc instrtab[] =
+{
+  { .mnemonic = MNE_aaa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_aad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_aam, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_aas, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsubpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsubps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_arpl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bound, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 17, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bsf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bswap, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 25, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bt, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bts, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bts, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_call, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_call, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 21, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lcall, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 30, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 4, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lcall, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 21, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cli, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_syscall, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clts, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysenter, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysexit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmov, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmps, .rep = 0, .repe = 1, .suffix = 1, .modrm = 0, .fct1 = 12, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 8, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpxchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 11, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 8, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpxchg8b, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cpuid, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtdq2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttpd2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_daa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_das, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_dec, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_dec, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 25, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_div, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_emms, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_enter, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 12, .str2 = 0, .off2_1 = 19, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fchs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fabs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ftst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxam, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldl2t, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldl2e, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldpi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldlg2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldln2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldz, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_f2xm1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fyl2x, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fptan, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fpatan, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxtract, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fprem1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdecstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fincstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fprem, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fyl2xp1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsqrt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsincos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_frndint, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fscale, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsin, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fst, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstp, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldenv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldcw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstenv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstcw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_faddp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fiadd, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmove, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmulp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fimul, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisub, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisubr, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 1, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fbld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fbstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fchs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fclex, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_finit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fwait, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnclex, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmove, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovne, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcom, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcom, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomp, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcompp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdecstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivrl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ffree, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ficom, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ficomp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fild, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fildl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fildll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fincstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fninit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fist, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fistp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fistpll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisttp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisttpll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstpt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucom, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_frstor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnsave, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hlt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_idiv, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 14, .str1 = 0, .off1_1 = 13, .off1_2 = 2, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_in, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_in, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 11, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_inc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_inc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 25, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ins, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 11, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_int, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_int3, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_into, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_invd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_swapgs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_invlpg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_iret, .rep = 0, .repe = 0, .suffix = 6, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_j, .rep = 0, .repe = 0, .suffix = 4, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_j, .rep = 0, .repe = 0, .suffix = 4, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_set, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 21, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ljmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 30, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 4, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ljmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 21, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lahf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lar, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lds, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lea, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_leave, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_les, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lfs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lgs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lgdt, .rep = 0, .repe = 0, .suffix = 2, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lidt, .rep = 0, .repe = 0, .suffix = 2, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lmsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lock, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lods, .rep = 1, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loope, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loopne, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lsl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ltr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 3, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 35, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 37, .off1_2 = 3, .off1_3 = 0, .fct2 = 3, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 6, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 6, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 7, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 7, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 21, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movs, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsbl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movswl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movzbl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movzwl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mul, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_neg, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pause, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_nop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_popcnt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_not, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_out, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 12, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_out, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 9, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_outs, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 9, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_popf, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 25, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 25, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 14, .str1 = 0, .off1_1 = 5, .off1_2 = 2, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 31, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pusha, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_popa, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pushf, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdmsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdpmc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdtsc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ret, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ret, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sahf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_scas, .rep = 0, .repe = 1, .suffix = 0, .modrm = 0, .fct1 = 12, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_set, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_vmcall, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmlaunch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmresume, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmxoff, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmread, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 28, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 14, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmwrite, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sgdtl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_monitor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 3, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 1, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 4, .str3 = 1, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mwait, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 3, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 1, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sidtl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_smsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_std, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sti, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stos, .rep = 1, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_str, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ud2a, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_verr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_verw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_wbinvd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetchw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetchnta, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht0, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_nop, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_wrmsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 11, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 8, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 4, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xlat, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 9, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_emms, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pand, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pand, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pandn, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pandn, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_por, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_por, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pxor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pxor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpeqps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpltps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpleps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpunordps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpneqps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnltps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnleps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpordps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpeqss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpltss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpless, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpunordss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpneqss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnltss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnless, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpordss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxrstor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxsave, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ldmxcsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stmxcsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movupd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movups, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movupd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movups, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movddup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsldup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpcklpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpcklps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpckhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpckhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movshdup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movapd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movaps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movapd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movaps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsi2sd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsi2ss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpi2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpi2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttsd2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttss2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttpd2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttps2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsd2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtss2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ucomisd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ucomiss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_comisd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_comiss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_getsec, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movmskpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movmskps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsqrtss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsqrtps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcpss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcpps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_orpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_orps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xorpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xorps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsd2ss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtss2sd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttps2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtdq2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packsswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packsswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packuswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packuswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packssdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packssdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklqdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhqdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshuflw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_haddpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_haddps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hsubpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hsubps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movnti, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_pextrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pextrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_shufpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_shufps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmullw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmullw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdq2q, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 19, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovmskb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovmskb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 19, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lddqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuludq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuludq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maskmovdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maskmovq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 19, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhrsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhrsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_palignr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_palignr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_vmclear, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmxon, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmptrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmptrst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clflush, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_blendps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendvps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendvpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_dpps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_dppd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_insertps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_movntdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mpsadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_packusdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pblendvb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pblendw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpestri, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpestrm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpistri, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpistrm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phminposuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxud, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminud, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxwq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxwq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ptest, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_roundps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 31, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+};
+static const uint8_t match_data[] =
+{
+  0x11, 0x37,
+  0x22, 0xd5, 0xa,
+  0x22, 0xd4, 0xa,
+  0x11, 0x3f,
+  0x1, 0xfe, 0x14,
+  0x2, 0xfe, 0x80, 0x38, 0x10,
+  0x2, 0xfe, 0x82, 0x38, 0x10,
+  0x2, 0xfe, 0x10, 0, 0,
+  0x2, 0xfe, 0x12, 0, 0,
+  0x1, 0xfe, 0x4,
+  0x2, 0xfe, 0x80, 0x38, 0,
+  0x12, 0x83, 0x38, 0,
+  0x2, 0xfe, 0, 0, 0,
+  0x2, 0xfe, 0x2, 0, 0,
+  0x34, 0x66, 0xf, 0xd0, 0, 0,
+  0x34, 0xf2, 0xf, 0xd0, 0, 0,
+  0x1, 0xfe, 0x24,
+  0x2, 0xfe, 0x80, 0x38, 0x20,
+  0x2, 0xfe, 0x82, 0x38, 0x20,
+  0x2, 0xfe, 0x20, 0, 0,
+  0x2, 0xfe, 0x22, 0, 0,
+  0x34, 0x66, 0xf, 0x54, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x34, 0x66, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x12, 0x63, 0, 0,
+  0x12, 0x62, 0, 0,
+  0x23, 0xf, 0xbc, 0, 0,
+  0x23, 0xf, 0xbd, 0, 0,
+  0x12, 0xf, 0xf8, 0xc8,
+  0x23, 0xf, 0xa3, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x20,
+  0x23, 0xf, 0xbb, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x38,
+  0x23, 0xf, 0xb3, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x30,
+  0x23, 0xf, 0xab, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x28,
+  0x11, 0xe8,
+  0x12, 0xff, 0x38, 0x10,
+  0x11, 0x9a,
+  0x12, 0xff, 0x38, 0x18,
+  0x11, 0x98,
+  0x11, 0x99,
+  0x11, 0xf8,
+  0x11, 0xfc,
+  0x11, 0xfa,
+  0x22, 0xf, 0x5,
+  0x22, 0xf, 0x6,
+  0x22, 0xf, 0x7,
+  0x22, 0xf, 0x34,
+  0x22, 0xf, 0x35,
+  0x11, 0xf5,
+  0x13, 0xf, 0xf0, 0x40, 0, 0,
+  0x1, 0xfe, 0x3c,
+  0x2, 0xfe, 0x80, 0x38, 0x38,
+  0x12, 0x83, 0x38, 0x38,
+  0x2, 0xfe, 0x38, 0, 0,
+  0x2, 0xfe, 0x3a, 0, 0,
+  0x34, 0xf2, 0xf, 0xc2, 0, 0,
+  0x34, 0xf3, 0xf, 0xc2, 0, 0,
+  0x34, 0x66, 0xf, 0xc2, 0, 0,
+  0x23, 0xf, 0xc2, 0, 0,
+  0x1, 0xfe, 0xa6,
+  0x13, 0xf, 0xfe, 0xb0, 0, 0,
+  0x23, 0xf, 0xc7, 0x38, 0x8,
+  0x22, 0xf, 0xa2,
+  0x34, 0xf3, 0xf, 0xe6, 0, 0,
+  0x34, 0xf2, 0xf, 0xe6, 0, 0,
+  0x34, 0x66, 0xf, 0xe6, 0, 0,
+  0x11, 0x27,
+  0x11, 0x2f,
+  0x2, 0xfe, 0xfe, 0x38, 0x8,
+  0x1, 0xf8, 0x48,
+  0x2, 0xfe, 0xf6, 0x38, 0x30,
+  0x22, 0xf, 0x77,
+  0x11, 0xc8,
+  0x22, 0xd9, 0xd0,
+  0x22, 0xd9, 0xe0,
+  0x22, 0xd9, 0xe1,
+  0x22, 0xd9, 0xe4,
+  0x22, 0xd9, 0xe5,
+  0x22, 0xd9, 0xe8,
+  0x22, 0xd9, 0xe9,
+  0x22, 0xd9, 0xea,
+  0x22, 0xd9, 0xeb,
+  0x22, 0xd9, 0xec,
+  0x22, 0xd9, 0xed,
+  0x22, 0xd9, 0xee,
+  0x22, 0xd9, 0xf0,
+  0x22, 0xd9, 0xf1,
+  0x22, 0xd9, 0xf2,
+  0x22, 0xd9, 0xf3,
+  0x22, 0xd9, 0xf4,
+  0x22, 0xd9, 0xf5,
+  0x22, 0xd9, 0xf6,
+  0x22, 0xd9, 0xf7,
+  0x22, 0xd9, 0xf8,
+  0x22, 0xd9, 0xf9,
+  0x22, 0xd9, 0xfa,
+  0x22, 0xd9, 0xfb,
+  0x22, 0xd9, 0xfc,
+  0x22, 0xd9, 0xfd,
+  0x22, 0xd9, 0xfe,
+  0x22, 0xd9, 0xff,
+  0x12, 0xd8, 0xf8, 0xc0,
+  0x12, 0xdc, 0xf8, 0xc0,
+  0x2, 0xfb, 0xd8, 0x38, 0,
+  0x12, 0xd8, 0xf8, 0xc8,
+  0x12, 0xdc, 0xf8, 0xc8,
+  0x2, 0xfb, 0xd8, 0x38, 0x8,
+  0x12, 0xd8, 0xf8, 0xe0,
+  0x12, 0xdc, 0xf8, 0xe0,
+  0x2, 0xfb, 0xd8, 0x38, 0x20,
+  0x12, 0xd8, 0xf8, 0xe8,
+  0x12, 0xdc, 0xf8, 0xe8,
+  0x2, 0xfb, 0xd8, 0x38, 0x28,
+  0x12, 0xdd, 0xf8, 0xd0,
+  0x2, 0xfb, 0xd9, 0x38, 0x10,
+  0x12, 0xdd, 0xf8, 0xd8,
+  0x2, 0xfb, 0xd9, 0x38, 0x18,
+  0x12, 0xd9, 0x38, 0x20,
+  0x12, 0xd9, 0x38, 0x28,
+  0x12, 0xd9, 0x38, 0x30,
+  0x12, 0xd9, 0x38, 0x38,
+  0x12, 0xd9, 0xf8, 0xc8,
+  0x12, 0xde, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xc0,
+  0x2, 0xfb, 0xda, 0x38, 0,
+  0x12, 0xda, 0xf8, 0xc8,
+  0x12, 0xde, 0xf8, 0xc8,
+  0x2, 0xfb, 0xda, 0x38, 0x8,
+  0x12, 0xde, 0xf8, 0xe0,
+  0x2, 0xfb, 0xda, 0x38, 0x20,
+  0x12, 0xde, 0xf8, 0xe8,
+  0x2, 0xfb, 0xda, 0x38, 0x28,
+  0x22, 0xdf, 0xe0,
+  0x12, 0xdf, 0x38, 0x20,
+  0x12, 0xdf, 0xf8, 0xf0,
+  0x12, 0xdf, 0x38, 0x30,
+  0x22, 0xd9, 0xe0,
+  0x33, 0x9b, 0xdb, 0xe2,
+  0x33, 0x9b, 0xdb, 0xe3,
+  0x11, 0x9b,
+  0x22, 0xdb, 0xe2,
+  0x12, 0xda, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xc8,
+  0x12, 0xda, 0xf8, 0xd0,
+  0x12, 0xda, 0xf8, 0xd8,
+  0x12, 0xdb, 0xf8, 0xc0,
+  0x12, 0xdb, 0xf8, 0xc8,
+  0x12, 0xdb, 0xf8, 0xd0,
+  0x12, 0xdb, 0xf8, 0xd8,
+  0x12, 0xd8, 0xf8, 0xd0,
+  0x2, 0xfb, 0xd8, 0x38, 0x10,
+  0x12, 0xd8, 0xf8, 0xd8,
+  0x2, 0xfb, 0xd8, 0x38, 0x18,
+  0x22, 0xde, 0xd9,
+  0x12, 0xdb, 0xf8, 0xf0,
+  0x12, 0xdf, 0xf8, 0xf0,
+  0x12, 0xdb, 0xf8, 0xe8,
+  0x12, 0xdf, 0xf8, 0xe8,
+  0x22, 0xd9, 0xff,
+  0x22, 0xd9, 0xf6,
+  0x12, 0xd8, 0xf8, 0xf0,
+  0x12, 0xdc, 0xf8, 0xf0,
+  0x2, 0xfb, 0xd8, 0x38, 0x30,
+  0x12, 0xda, 0x38, 0x30,
+  0x12, 0xde, 0xf8, 0xf0,
+  0x12, 0xde, 0x38, 0x30,
+  0x12, 0xde, 0xf8, 0xf8,
+  0x12, 0xd8, 0xf8, 0xf8,
+  0x12, 0xdc, 0xf8, 0xf8,
+  0x2, 0xfb, 0xd8, 0x38, 0x38,
+  0x12, 0xda, 0x38, 0x38,
+  0x12, 0xde, 0x38, 0x38,
+  0x12, 0xde, 0xf8, 0xf0,
+  0x12, 0xdd, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xd0,
+  0x2, 0xfb, 0xda, 0x38, 0x10,
+  0x12, 0xda, 0xf8, 0xd8,
+  0x2, 0xfb, 0xda, 0x38, 0x18,
+  0x12, 0xdf, 0x38, 0,
+  0x12, 0xdb, 0x38, 0,
+  0x12, 0xdf, 0x38, 0x28,
+  0x22, 0xd9, 0xf7,
+  0x22, 0xdb, 0xe3,
+  0x2, 0xfb, 0xdb, 0x38, 0x10,
+  0x2, 0xfb, 0xdb, 0x38, 0x18,
+  0x12, 0xdf, 0x38, 0x38,
+  0x2, 0xfb, 0xdb, 0x38, 0x8,
+  0x12, 0xdd, 0x38, 0x8,
+  0x12, 0xdb, 0x38, 0x28,
+  0x12, 0xdb, 0x38, 0x38,
+  0x12, 0xd9, 0xf8, 0xc0,
+  0x2, 0xfb, 0xd9, 0x38, 0,
+  0x12, 0xdd, 0xf8, 0xe0,
+  0x12, 0xdd, 0x38, 0x20,
+  0x12, 0xdd, 0xf8, 0xe8,
+  0x12, 0xdd, 0x38, 0x30,
+  0x12, 0xdd, 0x38, 0x38,
+  0x11, 0xf4,
+  0x2, 0xfe, 0xf6, 0x38, 0x38,
+  0x2, 0xfe, 0xf6, 0x38, 0x28,
+  0x23, 0xf, 0xaf, 0, 0,
+  0x2, 0xfd, 0x69, 0, 0,
+  0x1, 0xfe, 0xe4,
+  0x1, 0xfe, 0xec,
+  0x2, 0xfe, 0xfe, 0x38, 0,
+  0x1, 0xf8, 0x40,
+  0x1, 0xfe, 0x6c,
+  0x11, 0xcd,
+  0x11, 0xcc,
+  0x11, 0xce,
+  0x22, 0xf, 0x8,
+  0x33, 0xf, 0x1, 0xf8,
+  0x23, 0xf, 0x1, 0x38, 0x38,
+  0x11, 0xcf,
+  0x1, 0xf0, 0x70,
+  0x12, 0xf, 0xf0, 0x80,
+  0x13, 0xf, 0xf0, 0x90, 0x38, 0,
+  0x11, 0xe3,
+  0x11, 0xeb,
+  0x11, 0xe9,
+  0x12, 0xff, 0x38, 0x20,
+  0x11, 0xea,
+  0x12, 0xff, 0x38, 0x28,
+  0x11, 0x9f,
+  0x23, 0xf, 0x2, 0, 0,
+  0x12, 0xc5, 0, 0,
+  0x12, 0x8d, 0, 0,
+  0x11, 0xc9,
+  0x12, 0xc4, 0, 0,
+  0x23, 0xf, 0xb4, 0, 0,
+  0x23, 0xf, 0xb5, 0, 0,
+  0x23, 0xf, 0x1, 0x38, 0x10,
+  0x23, 0xf, 0x1, 0x38, 0x18,
+  0x23, 0xf, 0, 0x38, 0x10,
+  0x23, 0xf, 0x1, 0x38, 0x30,
+  0x11, 0xf0,
+  0x1, 0xfe, 0xac,
+  0x11, 0xe2,
+  0x11, 0xe1,
+  0x11, 0xe0,
+  0x23, 0xf, 0x3, 0, 0,
+  0x23, 0xf, 0xb2, 0, 0,
+  0x23, 0xf, 0, 0x38, 0x18,
+  0x2, 0xfe, 0x88, 0, 0,
+  0x2, 0xfe, 0x8a, 0, 0,
+  0x2, 0xfe, 0xc6, 0x38, 0,
+  0x1, 0xf0, 0xb0,
+  0x1, 0xfe, 0xa0,
+  0x1, 0xfe, 0xa2,
+  0x23, 0xf, 0x20, 0xc0, 0xc0,
+  0x23, 0xf, 0x22, 0xc0, 0xc0,
+  0x23, 0xf, 0x21, 0xc0, 0xc0,
+  0x23, 0xf, 0x23, 0xc0, 0xc0,
+  0x12, 0x8c, 0, 0,
+  0x12, 0x8e, 0, 0,
+  0x1, 0xfe, 0xa4,
+  0x23, 0xf, 0xbe, 0, 0,
+  0x23, 0xf, 0xbf, 0, 0,
+  0x23, 0xf, 0xb6, 0, 0,
+  0x23, 0xf, 0xb7, 0, 0,
+  0x2, 0xfe, 0xf6, 0x38, 0x20,
+  0x2, 0xfe, 0xf6, 0x38, 0x18,
+  0x22, 0xf3, 0x90,
+  0x11, 0x90,
+  0x34, 0xf3, 0xf, 0xb8, 0, 0,
+  0x2, 0xfe, 0xf6, 0x38, 0x10,
+  0x2, 0xfe, 0x8, 0, 0,
+  0x2, 0xfe, 0xa, 0, 0,
+  0x2, 0xfe, 0x80, 0x38, 0x8,
+  0x2, 0xfe, 0x82, 0x38, 0x8,
+  0x1, 0xfe, 0xc,
+  0x1, 0xfe, 0xe6,
+  0x1, 0xfe, 0xee,
+  0x1, 0xfe, 0x6e,
+  0x12, 0x8f, 0x38, 0,
+  0x12, 0xf, 0xc7, 0x81,
+  0x11, 0x9d,
+  0x12, 0xff, 0x38, 0x30,
+  0x1, 0xf8, 0x50,
+  0x1, 0xf8, 0x58,
+  0x1, 0xfd, 0x68,
+  0x1, 0xe7, 0x6,
+  0x12, 0xf, 0xc7, 0x80,
+  0x11, 0x60,
+  0x11, 0x61,
+  0x11, 0x9c,
+  0x2, 0xfe, 0xd0, 0x38, 0x10,
+  0x2, 0xfe, 0xd2, 0x38, 0x10,
+  0x2, 0xfe, 0xc0, 0x38, 0x10,
+  0x2, 0xfe, 0xd0, 0x38, 0x18,
+  0x2, 0xfe, 0xd2, 0x38, 0x18,
+  0x2, 0xfe, 0xc0, 0x38, 0x18,
+  0x22, 0xf, 0x32,
+  0x22, 0xf, 0x33,
+  0x22, 0xf, 0x31,
+  0x11, 0xc3,
+  0x11, 0xc2,
+  0x11, 0xcb,
+  0x11, 0xca,
+  0x2, 0xfe, 0xd0, 0x38, 0,
+  0x2, 0xfe, 0xd2, 0x38, 0,
+  0x2, 0xfe, 0xc0, 0x38, 0,
+  0x2, 0xfe, 0xd0, 0x38, 0x8,
+  0x2, 0xfe, 0xd2, 0x38, 0x8,
+  0x2, 0xfe, 0xc0, 0x38, 0x8,
+  0x22, 0xf, 0xaa,
+  0x11, 0x9e,
+  0x2, 0xfe, 0xd0, 0x38, 0x38,
+  0x2, 0xfe, 0xd2, 0x38, 0x38,
+  0x2, 0xfe, 0xc0, 0x38, 0x38,
+  0x2, 0xfe, 0x18, 0, 0,
+  0x2, 0xfe, 0x1a, 0, 0,
+  0x1, 0xfe, 0x1c,
+  0x2, 0xfe, 0x80, 0x38, 0x18,
+  0x2, 0xfe, 0x82, 0x38, 0x18,
+  0x1, 0xfe, 0xae,
+  0x13, 0xf, 0xf0, 0x90, 0x38, 0,
+  0x2, 0xfe, 0xd0, 0x38, 0x20,
+  0x2, 0xfe, 0xd2, 0x38, 0x20,
+  0x2, 0xfe, 0xc0, 0x38, 0x20,
+  0x2, 0xfe, 0xd0, 0x38, 0x28,
+  0x23, 0xf, 0xa4, 0, 0,
+  0x23, 0xf, 0xa5, 0, 0,
+  0x2, 0xfe, 0xd2, 0x38, 0x28,
+  0x2, 0xfe, 0xc0, 0x38, 0x28,
+  0x23, 0xf, 0xac, 0, 0,
+  0x23, 0xf, 0xad, 0, 0,
+  0x33, 0xf, 0x1, 0xc1,
+  0x33, 0xf, 0x1, 0xc2,
+  0x33, 0xf, 0x1, 0xc3,
+  0x33, 0xf, 0x1, 0xc4,
+  0x23, 0xf, 0x78, 0, 0,
+  0x23, 0xf, 0x79, 0, 0,
+  0x23, 0xf, 0x1, 0x38, 0,
+  0x33, 0xf, 0x1, 0xc8,
+  0x33, 0xf, 0x1, 0xc9,
+  0x23, 0xf, 0x1, 0x38, 0x8,
+  0x23, 0xf, 0, 0x38, 0,
+  0x23, 0xf, 0x1, 0x38, 0x20,
+  0x11, 0xf9,
+  0x11, 0xfd,
+  0x11, 0xfb,
+  0x1, 0xfe, 0xaa,
+  0x23, 0xf, 0, 0x38, 0x8,
+  0x2, 0xfe, 0x28, 0, 0,
+  0x2, 0xfe, 0x2a, 0, 0,
+  0x1, 0xfe, 0x2c,
+  0x2, 0xfe, 0x80, 0x38, 0x28,
+  0x2, 0xfe, 0x82, 0x38, 0x28,
+  0x2, 0xfe, 0x84, 0, 0,
+  0x1, 0xfe, 0xa8,
+  0x2, 0xfe, 0xf6, 0x38, 0,
+  0x22, 0xf, 0xb,
+  0x23, 0xf, 0, 0x38, 0x20,
+  0x23, 0xf, 0, 0x38, 0x28,
+  0x22, 0xf, 0x9,
+  0x23, 0xf, 0xd, 0x38, 0,
+  0x23, 0xf, 0xd, 0x38, 0x8,
+  0x23, 0xf, 0x18, 0x38, 0,
+  0x23, 0xf, 0x18, 0x38, 0x8,
+  0x23, 0xf, 0x18, 0x38, 0x10,
+  0x23, 0xf, 0x18, 0x38, 0x18,
+  0x23, 0xf, 0x1f, 0, 0,
+  0x22, 0xf, 0x30,
+  0x13, 0xf, 0xfe, 0xc0, 0, 0,
+  0x2, 0xfe, 0x86, 0, 0,
+  0x1, 0xf8, 0x90,
+  0x11, 0xd7,
+  0x2, 0xfe, 0x30, 0, 0,
+  0x2, 0xfe, 0x32, 0, 0,
+  0x1, 0xfe, 0x34,
+  0x2, 0xfe, 0x80, 0x38, 0x30,
+  0x2, 0xfe, 0x82, 0x38, 0x30,
+  0x22, 0xf, 0x77,
+  0x34, 0x66, 0xf, 0xdb, 0, 0,
+  0x23, 0xf, 0xdb, 0, 0,
+  0x34, 0x66, 0xf, 0xdf, 0, 0,
+  0x23, 0xf, 0xdf, 0, 0,
+  0x34, 0x66, 0xf, 0xf5, 0, 0,
+  0x23, 0xf, 0xf5, 0, 0,
+  0x34, 0x66, 0xf, 0xeb, 0, 0,
+  0x23, 0xf, 0xeb, 0, 0,
+  0x34, 0x66, 0xf, 0xef, 0, 0,
+  0x23, 0xf, 0xef, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x1,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x2,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x3,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x4,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x5,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x6,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x7,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x1,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x2,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x3,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x4,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x5,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x6,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x7,
+  0x23, 0xf, 0xae, 0x38, 0x8,
+  0x23, 0xf, 0xae, 0x38, 0,
+  0x23, 0xf, 0xae, 0x38, 0x10,
+  0x23, 0xf, 0xae, 0x38, 0x18,
+  0x34, 0xf2, 0xf, 0x10, 0, 0,
+  0x34, 0xf3, 0xf, 0x10, 0, 0,
+  0x34, 0x66, 0xf, 0x10, 0, 0,
+  0x23, 0xf, 0x10, 0, 0,
+  0x34, 0xf2, 0xf, 0x11, 0, 0,
+  0x34, 0xf3, 0xf, 0x11, 0, 0,
+  0x34, 0x66, 0xf, 0x11, 0, 0,
+  0x23, 0xf, 0x11, 0, 0,
+  0x34, 0xf2, 0xf, 0x12, 0, 0,
+  0x34, 0xf3, 0xf, 0x12, 0, 0,
+  0x34, 0x66, 0xf, 0x12, 0, 0,
+  0x23, 0xf, 0x12, 0xc0, 0xc0,
+  0x23, 0xf, 0x12, 0, 0,
+  0x34, 0x66, 0xf, 0x13, 0xc0, 0xc0,
+  0x23, 0xf, 0x13, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x13, 0, 0,
+  0x23, 0xf, 0x13, 0, 0,
+  0x34, 0x66, 0xf, 0x14, 0, 0,
+  0x23, 0xf, 0x14, 0, 0,
+  0x34, 0x66, 0xf, 0x15, 0, 0,
+  0x23, 0xf, 0x15, 0, 0,
+  0x34, 0xf3, 0xf, 0x16, 0, 0,
+  0x34, 0x66, 0xf, 0x16, 0, 0,
+  0x23, 0xf, 0x16, 0xc0, 0xc0,
+  0x23, 0xf, 0x16, 0, 0,
+  0x34, 0x66, 0xf, 0x17, 0xc0, 0xc0,
+  0x23, 0xf, 0x17, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x17, 0, 0,
+  0x23, 0xf, 0x17, 0, 0,
+  0x34, 0x66, 0xf, 0x28, 0, 0,
+  0x23, 0xf, 0x28, 0, 0,
+  0x34, 0x66, 0xf, 0x29, 0, 0,
+  0x23, 0xf, 0x29, 0, 0,
+  0x34, 0xf2, 0xf, 0x2a, 0, 0,
+  0x34, 0xf3, 0xf, 0x2a, 0, 0,
+  0x34, 0x66, 0xf, 0x2a, 0, 0,
+  0x23, 0xf, 0x2a, 0, 0,
+  0x34, 0x66, 0xf, 0x2b, 0, 0,
+  0x23, 0xf, 0x2b, 0, 0,
+  0x34, 0xf2, 0xf, 0x2c, 0, 0,
+  0x34, 0xf3, 0xf, 0x2c, 0, 0,
+  0x34, 0x66, 0xf, 0x2c, 0, 0,
+  0x23, 0xf, 0x2c, 0, 0,
+  0x34, 0x66, 0xf, 0x2d, 0, 0,
+  0x34, 0xf2, 0xf, 0x2d, 0, 0,
+  0x34, 0xf3, 0xf, 0x2d, 0, 0,
+  0x23, 0xf, 0x2d, 0, 0,
+  0x34, 0x66, 0xf, 0x2e, 0, 0,
+  0x23, 0xf, 0x2e, 0, 0,
+  0x34, 0x66, 0xf, 0x2f, 0, 0,
+  0x23, 0xf, 0x2f, 0, 0,
+  0x22, 0xf, 0x37,
+  0x34, 0x66, 0xf, 0x50, 0xc0, 0xc0,
+  0x23, 0xf, 0x50, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x51, 0, 0,
+  0x34, 0xf2, 0xf, 0x51, 0, 0,
+  0x34, 0xf3, 0xf, 0x51, 0, 0,
+  0x23, 0xf, 0x51, 0, 0,
+  0x34, 0xf3, 0xf, 0x52, 0, 0,
+  0x23, 0xf, 0x52, 0, 0,
+  0x34, 0xf3, 0xf, 0x53, 0, 0,
+  0x23, 0xf, 0x53, 0, 0,
+  0x34, 0x66, 0xf, 0x54, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x34, 0x66, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x34, 0x66, 0xf, 0x56, 0, 0,
+  0x23, 0xf, 0x56, 0, 0,
+  0x34, 0x66, 0xf, 0x57, 0, 0,
+  0x23, 0xf, 0x57, 0, 0,
+  0x34, 0xf2, 0xf, 0x58, 0, 0,
+  0x34, 0xf3, 0xf, 0x58, 0, 0,
+  0x34, 0x66, 0xf, 0x58, 0, 0,
+  0x23, 0xf, 0x58, 0, 0,
+  0x34, 0xf2, 0xf, 0x59, 0, 0,
+  0x34, 0xf3, 0xf, 0x59, 0, 0,
+  0x34, 0x66, 0xf, 0x59, 0, 0,
+  0x23, 0xf, 0x59, 0, 0,
+  0x34, 0xf2, 0xf, 0x5a, 0, 0,
+  0x34, 0xf3, 0xf, 0x5a, 0, 0,
+  0x34, 0x66, 0xf, 0x5a, 0, 0,
+  0x23, 0xf, 0x5a, 0, 0,
+  0x34, 0x66, 0xf, 0x5b, 0, 0,
+  0x34, 0xf3, 0xf, 0x5b, 0, 0,
+  0x23, 0xf, 0x5b, 0, 0,
+  0x34, 0xf2, 0xf, 0x5c, 0, 0,
+  0x34, 0xf3, 0xf, 0x5c, 0, 0,
+  0x34, 0x66, 0xf, 0x5c, 0, 0,
+  0x23, 0xf, 0x5c, 0, 0,
+  0x34, 0xf2, 0xf, 0x5d, 0, 0,
+  0x34, 0xf3, 0xf, 0x5d, 0, 0,
+  0x34, 0x66, 0xf, 0x5d, 0, 0,
+  0x23, 0xf, 0x5d, 0, 0,
+  0x34, 0xf2, 0xf, 0x5e, 0, 0,
+  0x34, 0xf3, 0xf, 0x5e, 0, 0,
+  0x34, 0x66, 0xf, 0x5e, 0, 0,
+  0x23, 0xf, 0x5e, 0, 0,
+  0x34, 0xf2, 0xf, 0x5f, 0, 0,
+  0x34, 0xf3, 0xf, 0x5f, 0, 0,
+  0x34, 0x66, 0xf, 0x5f, 0, 0,
+  0x23, 0xf, 0x5f, 0, 0,
+  0x34, 0x66, 0xf, 0x60, 0, 0,
+  0x23, 0xf, 0x60, 0, 0,
+  0x34, 0x66, 0xf, 0x61, 0, 0,
+  0x23, 0xf, 0x61, 0, 0,
+  0x34, 0x66, 0xf, 0x62, 0, 0,
+  0x23, 0xf, 0x62, 0, 0,
+  0x34, 0x66, 0xf, 0x63, 0, 0,
+  0x23, 0xf, 0x63, 0, 0,
+  0x34, 0x66, 0xf, 0x64, 0, 0,
+  0x23, 0xf, 0x64, 0, 0,
+  0x34, 0x66, 0xf, 0x65, 0, 0,
+  0x23, 0xf, 0x65, 0, 0,
+  0x34, 0x66, 0xf, 0x66, 0, 0,
+  0x23, 0xf, 0x66, 0, 0,
+  0x34, 0x66, 0xf, 0x67, 0, 0,
+  0x23, 0xf, 0x67, 0, 0,
+  0x34, 0x66, 0xf, 0x68, 0, 0,
+  0x23, 0xf, 0x68, 0, 0,
+  0x34, 0x66, 0xf, 0x69, 0, 0,
+  0x23, 0xf, 0x69, 0, 0,
+  0x34, 0x66, 0xf, 0x6a, 0, 0,
+  0x23, 0xf, 0x6a, 0, 0,
+  0x34, 0x66, 0xf, 0x6b, 0, 0,
+  0x23, 0xf, 0x6b, 0, 0,
+  0x34, 0x66, 0xf, 0x6c, 0, 0,
+  0x34, 0x66, 0xf, 0x6d, 0, 0,
+  0x34, 0x66, 0xf, 0x6e, 0, 0,
+  0x23, 0xf, 0x6e, 0, 0,
+  0x34, 0x66, 0xf, 0x6f, 0, 0,
+  0x34, 0xf3, 0xf, 0x6f, 0, 0,
+  0x23, 0xf, 0x6f, 0, 0,
+  0x34, 0x66, 0xf, 0x70, 0, 0,
+  0x34, 0xf2, 0xf, 0x70, 0, 0,
+  0x34, 0xf3, 0xf, 0x70, 0, 0,
+  0x23, 0xf, 0x70, 0, 0,
+  0x34, 0x66, 0xf, 0x74, 0, 0,
+  0x23, 0xf, 0x74, 0, 0,
+  0x34, 0x66, 0xf, 0x75, 0, 0,
+  0x23, 0xf, 0x75, 0, 0,
+  0x34, 0x66, 0xf, 0x76, 0, 0,
+  0x23, 0xf, 0x76, 0, 0,
+  0x34, 0x66, 0xf, 0x7c, 0, 0,
+  0x34, 0xf2, 0xf, 0x7c, 0, 0,
+  0x34, 0x66, 0xf, 0x7d, 0, 0,
+  0x34, 0xf2, 0xf, 0x7d, 0, 0,
+  0x34, 0x66, 0xf, 0x7e, 0, 0,
+  0x34, 0xf3, 0xf, 0x7e, 0, 0,
+  0x23, 0xf, 0x7e, 0, 0,
+  0x34, 0x66, 0xf, 0x7f, 0, 0,
+  0x34, 0xf3, 0xf, 0x7f, 0, 0,
+  0x23, 0xf, 0x7f, 0, 0,
+  0x23, 0xf, 0xc3, 0, 0,
+  0x34, 0x66, 0xf, 0xc4, 0, 0,
+  0x23, 0xf, 0xc4, 0, 0,
+  0x34, 0x66, 0xf, 0xc5, 0xc0, 0xc0,
+  0x23, 0xf, 0xc5, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xc6, 0, 0,
+  0x23, 0xf, 0xc6, 0, 0,
+  0x34, 0x66, 0xf, 0xd1, 0, 0,
+  0x23, 0xf, 0xd1, 0, 0,
+  0x34, 0x66, 0xf, 0xd2, 0, 0,
+  0x23, 0xf, 0xd2, 0, 0,
+  0x34, 0x66, 0xf, 0xd3, 0, 0,
+  0x23, 0xf, 0xd3, 0, 0,
+  0x34, 0x66, 0xf, 0xd4, 0, 0,
+  0x23, 0xf, 0xd4, 0, 0,
+  0x34, 0x66, 0xf, 0xd5, 0, 0,
+  0x23, 0xf, 0xd5, 0, 0,
+  0x34, 0x66, 0xf, 0xd6, 0, 0,
+  0x34, 0xf2, 0xf, 0xd6, 0xc0, 0xc0,
+  0x34, 0xf3, 0xf, 0xd6, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xd7, 0xc0, 0xc0,
+  0x23, 0xf, 0xd7, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xd8, 0, 0,
+  0x23, 0xf, 0xd8, 0, 0,
+  0x34, 0x66, 0xf, 0xd9, 0, 0,
+  0x23, 0xf, 0xd9, 0, 0,
+  0x34, 0x66, 0xf, 0xda, 0, 0,
+  0x23, 0xf, 0xda, 0, 0,
+  0x34, 0x66, 0xf, 0xdc, 0, 0,
+  0x23, 0xf, 0xdc, 0, 0,
+  0x34, 0x66, 0xf, 0xdd, 0, 0,
+  0x23, 0xf, 0xdd, 0, 0,
+  0x34, 0x66, 0xf, 0xde, 0, 0,
+  0x23, 0xf, 0xde, 0, 0,
+  0x34, 0x66, 0xf, 0xe0, 0, 0,
+  0x23, 0xf, 0xe0, 0, 0,
+  0x34, 0x66, 0xf, 0xe1, 0, 0,
+  0x23, 0xf, 0xe1, 0, 0,
+  0x34, 0x66, 0xf, 0xe2, 0, 0,
+  0x23, 0xf, 0xe2, 0, 0,
+  0x34, 0x66, 0xf, 0xe3, 0, 0,
+  0x23, 0xf, 0xe3, 0, 0,
+  0x34, 0x66, 0xf, 0xe4, 0, 0,
+  0x23, 0xf, 0xe4, 0, 0,
+  0x34, 0x66, 0xf, 0xe5, 0, 0,
+  0x23, 0xf, 0xe5, 0, 0,
+  0x34, 0x66, 0xf, 0xe7, 0, 0,
+  0x23, 0xf, 0xe7, 0, 0,
+  0x34, 0x66, 0xf, 0xe8, 0, 0,
+  0x23, 0xf, 0xe8, 0, 0,
+  0x34, 0x66, 0xf, 0xe9, 0, 0,
+  0x23, 0xf, 0xe9, 0, 0,
+  0x34, 0x66, 0xf, 0xea, 0, 0,
+  0x23, 0xf, 0xea, 0, 0,
+  0x34, 0x66, 0xf, 0xec, 0, 0,
+  0x23, 0xf, 0xec, 0, 0,
+  0x34, 0x66, 0xf, 0xed, 0, 0,
+  0x23, 0xf, 0xed, 0, 0,
+  0x34, 0x66, 0xf, 0xee, 0, 0,
+  0x23, 0xf, 0xee, 0, 0,
+  0x34, 0xf2, 0xf, 0xf0, 0, 0,
+  0x34, 0x66, 0xf, 0xf1, 0, 0,
+  0x23, 0xf, 0xf1, 0, 0,
+  0x34, 0x66, 0xf, 0xf2, 0, 0,
+  0x23, 0xf, 0xf2, 0, 0,
+  0x34, 0x66, 0xf, 0xf3, 0, 0,
+  0x23, 0xf, 0xf3, 0, 0,
+  0x34, 0x66, 0xf, 0xf4, 0, 0,
+  0x23, 0xf, 0xf4, 0, 0,
+  0x34, 0x66, 0xf, 0xf6, 0, 0,
+  0x23, 0xf, 0xf6, 0, 0,
+  0x34, 0x66, 0xf, 0xf7, 0xc0, 0xc0,
+  0x23, 0xf, 0xf7, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xf8, 0, 0,
+  0x23, 0xf, 0xf8, 0, 0,
+  0x34, 0x66, 0xf, 0xf9, 0, 0,
+  0x23, 0xf, 0xf9, 0, 0,
+  0x34, 0x66, 0xf, 0xfa, 0, 0,
+  0x23, 0xf, 0xfa, 0, 0,
+  0x34, 0x66, 0xf, 0xfb, 0, 0,
+  0x23, 0xf, 0xfb, 0, 0,
+  0x34, 0x66, 0xf, 0xfc, 0, 0,
+  0x23, 0xf, 0xfc, 0, 0,
+  0x34, 0x66, 0xf, 0xfd, 0, 0,
+  0x23, 0xf, 0xfd, 0, 0,
+  0x34, 0x66, 0xf, 0xfe, 0, 0,
+  0x23, 0xf, 0xfe, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0, 0, 0,
+  0x34, 0xf, 0x38, 0, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1, 0, 0,
+  0x34, 0xf, 0x38, 0x1, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2, 0, 0,
+  0x34, 0xf, 0x38, 0x2, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3, 0, 0,
+  0x34, 0xf, 0x38, 0x3, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x4, 0, 0,
+  0x34, 0xf, 0x38, 0x4, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x5, 0, 0,
+  0x34, 0xf, 0x38, 0x5, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x6, 0, 0,
+  0x34, 0xf, 0x38, 0x6, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x7, 0, 0,
+  0x34, 0xf, 0x38, 0x7, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x8, 0, 0,
+  0x34, 0xf, 0x38, 0x8, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x9, 0, 0,
+  0x34, 0xf, 0x38, 0x9, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0xa, 0, 0,
+  0x34, 0xf, 0x38, 0xa, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0xb, 0, 0,
+  0x34, 0xf, 0x38, 0xb, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1c, 0, 0,
+  0x34, 0xf, 0x38, 0x1c, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1d, 0, 0,
+  0x34, 0xf, 0x38, 0x1d, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1e, 0, 0,
+  0x34, 0xf, 0x38, 0x1e, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xf, 0, 0,
+  0x34, 0xf, 0x3a, 0xf, 0, 0,
+  0x34, 0x66, 0xf, 0xc7, 0x38, 0x30,
+  0x34, 0xf3, 0xf, 0xc7, 0x38, 0x30,
+  0x23, 0xf, 0xc7, 0x38, 0x30,
+  0x23, 0xf, 0xc7, 0x38, 0x38,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xd0,
+  0x23, 0xf, 0x71, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xe0,
+  0x23, 0xf, 0x71, 0xf8, 0xe0,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xf0,
+  0x23, 0xf, 0x71, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xd0,
+  0x23, 0xf, 0x72, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xe0,
+  0x23, 0xf, 0x72, 0xf8, 0xe0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xf0,
+  0x23, 0xf, 0x72, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xd0,
+  0x23, 0xf, 0x73, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xd8,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xf0,
+  0x23, 0xf, 0x73, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xf8,
+  0x33, 0xf, 0xae, 0xe8,
+  0x33, 0xf, 0xae, 0xf0,
+  0x33, 0xf, 0xae, 0xf8,
+  0x23, 0xf, 0xae, 0x38, 0x38,
+  0x23, 0xf, 0xf, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xc, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xd, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x14, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x15, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x40, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x41, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x21, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2a, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x42, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2b, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x10, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xe, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x29, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x61, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x60, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x63, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x62, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x37, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x41, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x20, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x22, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3c, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3d, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3f, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3e, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x38, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x39, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3b, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3a, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x20, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x21, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x22, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x23, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x24, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x25, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x30, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x31, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x32, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x33, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x34, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x35, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x28, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x40, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x17, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x8, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x9, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xa, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xb, 0, 0,
+  0x1, 0xe7, 0x7,
+};
diff --git a/recipes/elfutils/elfutils-0.148/m68k_backend.diff b/recipes/elfutils/elfutils-0.148/m68k_backend.diff
new file mode 100644
index 0000000..5b621f9
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/m68k_backend.diff
@@ -0,0 +1,309 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.146/backends/m68k_init.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.146/backends/m68k_init.c	2010-04-24 10:11:38.000000000 +0000
+@@ -0,0 +1,49 @@
++/* Initialization of m68k specific backend library.
++   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
++
++   This software is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   This softare is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with this software; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++*/
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#define BACKEND		m68k_
++#define RELOC_PREFIX	R_68K_
++#include "libebl_CPU.h"
++
++/* This defines the common reloc hooks based on m68k_reloc.def.  */
++#include "common-reloc.c"
++
++
++const char *
++m68k_init (elf, machine, eh, ehlen)
++     Elf *elf __attribute__ ((unused));
++     GElf_Half machine __attribute__ ((unused));
++     Ebl *eh;
++     size_t ehlen;
++{
++  /* Check whether the Elf_BH object has a sufficent size.  */
++  if (ehlen < sizeof (Ebl))
++    return NULL;
++
++  /* We handle it.  */
++  eh->name = "m68k";
++  m68k_init_reloc (eh);
++  HOOK (eh, reloc_simple_type);
++  HOOK (eh, register_info);
++
++  return MODVERSION;
++}
+Index: elfutils-0.146/backends/m68k_regs.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.146/backends/m68k_regs.c	2010-04-24 10:11:38.000000000 +0000
+@@ -0,0 +1,106 @@
++/* Register names and numbers for m68k DWARF.
++   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
++
++   This software is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   This software is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with this software; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <string.h>
++#include <dwarf.h>
++
++#define BACKEND m68k_
++#include "libebl_CPU.h"
++
++ssize_t
++m68k_register_info (Ebl *ebl __attribute__ ((unused)),
++		   int regno, char *name, size_t namelen,
++		   const char **prefix, const char **setname,
++		   int *bits, int *type)
++{
++	if (name == NULL)
++		return 25;
++
++	if (regno < 0 || regno > 24 || namelen < 5)
++		return -1;
++
++	*prefix = "%";
++	*bits = 32;
++	*type = (regno < 8 ? DW_ATE_signed
++		: regno < 16 ? DW_ATE_address : DW_ATE_float);
++
++	if (regno < 8)
++	{
++		*setname = "integer";
++	}
++	else if (regno < 16)
++	{
++		*setname = "address";
++	}
++	else if (regno < 24)
++	{
++		*setname = "FPU";
++	}
++	else
++	{
++		*setname = "address";
++		*type = DW_ATE_address;
++	}
++
++	switch (regno)
++	{
++	case 0 ... 7:
++		name[0] = 'd';
++		name[1] = regno + '0';
++		namelen = 2;
++		break;
++
++	case 8 ... 13:
++		name[0] = 'a';
++		name[1] = regno - 8 + '0';
++		namelen = 2;
++		break;
++
++	case 14:
++		name[0] = 'f';
++		name[1] = 'p';
++   		namelen = 2;
++		break;
++
++	case 15:
++		name[0] = 's';
++		name[1] = 'p';
++   		namelen = 2;
++		break;
++
++	case 16 ... 23:
++		name[0] = 'f';
++		name[1] = 'p';
++		name[2] = regno - 16 + '0';
++   		namelen = 3;
++		break;
++
++	case 24:
++		name[0] = 'p';
++		name[1] = 'c';
++		namelen = 2;
++	}
++
++	name[namelen++] = '\0';
++	return namelen;
++}
++
+Index: elfutils-0.146/backends/m68k_reloc.def
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.146/backends/m68k_reloc.def	2010-04-24 10:11:38.000000000 +0000
+@@ -0,0 +1,45 @@
++/* List the relocation types for m68k.  -*- C -*-
++   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
++
++   This software is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   This software is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with this software; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++*/
++
++/* 	    NAME,		REL|EXEC|DYN	*/
++
++RELOC_TYPE (NONE,		0)
++RELOC_TYPE (32,			REL|EXEC|DYN)
++RELOC_TYPE (16,			REL)
++RELOC_TYPE (8,			REL)
++RELOC_TYPE (PC32,		REL|EXEC|DYN)
++RELOC_TYPE (PC16,		REL)
++RELOC_TYPE (PC8,		REL)
++RELOC_TYPE (GOT32,		REL)
++RELOC_TYPE (GOT16,		REL)
++RELOC_TYPE (GOT8,		REL)
++RELOC_TYPE (GOT32O,		REL)
++RELOC_TYPE (GOT16O,		REL)
++RELOC_TYPE (GOT8O,		REL)
++RELOC_TYPE (PLT32,		REL)
++RELOC_TYPE (PLT16,		REL)
++RELOC_TYPE (PLT8,		REL)
++RELOC_TYPE (PLT32O,		REL)
++RELOC_TYPE (PLT16O,		REL)
++RELOC_TYPE (PLT8O,		REL)
++RELOC_TYPE (COPY,		EXEC)
++RELOC_TYPE (GLOB_DAT,		EXEC|DYN)
++RELOC_TYPE (JMP_SLOT,		EXEC|DYN)
++RELOC_TYPE (RELATIVE,		EXEC|DYN)
++RELOC_TYPE (GNU_VTINHERIT,	REL)
++RELOC_TYPE (GNU_VTENTRY,	REL)
++
+Index: elfutils-0.146/libelf/elf.h
+===================================================================
+--- elfutils-0.146.orig/libelf/elf.h	2010-04-24 10:11:13.000000000 +0000
++++ elfutils-0.146/libelf/elf.h	2010-04-24 10:13:50.000000000 +0000
+@@ -1125,6 +1125,9 @@
+ #define R_68K_GLOB_DAT	20		/* Create GOT entry */
+ #define R_68K_JMP_SLOT	21		/* Create PLT entry */
+ #define R_68K_RELATIVE	22		/* Adjust by program base */
++/* The next 2 are GNU extensions to enable C++ vtable garbage collection.  */
++#define R_68K_GNU_VTINHERIT 23
++#define R_68K_GNU_VTENTRY   24
+ #define R_68K_TLS_GD32      25          /* 32 bit GOT offset for GD */
+ #define R_68K_TLS_GD16      26          /* 16 bit GOT offset for GD */
+ #define R_68K_TLS_GD8       27          /* 8 bit GOT offset for GD */
+Index: elfutils-0.146/backends/Makefile.am
+===================================================================
+--- elfutils-0.146.orig/backends/Makefile.am	2010-04-24 10:11:23.000000000 +0000
++++ elfutils-0.146/backends/Makefile.am	2010-04-24 10:11:38.000000000 +0000
+@@ -29,11 +29,12 @@
+ 	   -I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
+ 
+ 
+-modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 parisc mips
++modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 parisc mips m68k
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a \
+ 	     libebl_sparc_pic.a libebl_ppc_pic.a libebl_ppc64_pic.a \
+-	     libebl_s390_pic.a libebl_parisc_pic.a libebl_mips_pic.a
++	     libebl_s390_pic.a libebl_parisc_pic.a libebl_mips_pic.a \
++	     libebl_m68k_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -103,6 +104,10 @@
+ libebl_mips_pic_a_SOURCES = $(mips_SRCS)
+ am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
+ 
++m68k_SRCS = m68k_init.c m68k_symbol.c m68k_regs.c
++libebl_m68k_pic_a_SOURCES = $(m68k_SRCS)
++am_libebl_m68k_pic_a_OBJECTS = $(m68k_SRCS:.c=.os)
++
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ 	@rm -f $(@:.so=.map)
+ 	echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
+Index: elfutils-0.146/backends/m68k_symbol.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.146/backends/m68k_symbol.c	2010-04-24 10:11:38.000000000 +0000
+@@ -0,0 +1,43 @@
++/* m68k specific symbolic name handling.
++   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
++
++   This software is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   This software distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with this software; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++*/
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <elf.h>
++#include <stddef.h>
++
++#define BACKEND		m68k_
++#include "libebl_CPU.h"
++
++/* Check for the simple reloc types.  */
++Elf_Type
++m68k_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type)
++{
++  switch (type)
++    {
++    case R_68K_32:
++      return ELF_T_SWORD;
++    case R_68K_16:
++      return ELF_T_HALF;
++    case R_68K_8:
++      return ELF_T_BYTE;
++    default:
++      return ELF_T_NUM;
++    }
++}
diff --git a/recipes/elfutils/elfutils-0.148/mempcpy.patch b/recipes/elfutils/elfutils-0.148/mempcpy.patch
new file mode 100644
index 0000000..218a57b
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/mempcpy.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Backport
+
+uclibc does not export __mempcpy like glibc so we alias it here.
+This patch may make sense for upstream but elfutils uses more
+glibc specific features like obstack_printf which are missing in
+uclibc they need to be fixed along to make it work all the way
+
+Upstream-Status: Inappropriate[Elfutils uses more glibc specific features]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: elfutils-0.148/libelf/elf_begin.c
+===================================================================
+--- elfutils-0.148.orig/libelf/elf_begin.c
++++ elfutils-0.148/libelf/elf_begin.c
+@@ -68,6 +68,9 @@
+ #include "libelfP.h"
+ #include "common.h"
+ 
++#ifdef __UCLIBC__
++#define __mempcpy mempcpy
++#endif
+ 
+ /* Create descriptor for archive in memory.  */
+ static inline Elf *
diff --git a/recipes/elfutils/elfutils-0.148/mips_backend.diff b/recipes/elfutils/elfutils-0.148/mips_backend.diff
new file mode 100644
index 0000000..3f81a75
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/mips_backend.diff
@@ -0,0 +1,713 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.145/backends/mips_init.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.145/backends/mips_init.c	2010-02-24 18:57:35.000000000 +0000
+@@ -0,0 +1,60 @@
++/* Initialization of mips specific backend library.
++   Copyright (C) 2006 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#define BACKEND		mips_
++#define RELOC_PREFIX	R_MIPS_
++#include "libebl_CPU.h"
++
++/* This defines the common reloc hooks based on mips_reloc.def.  */
++#include "common-reloc.c"
++
++const char *
++mips_init (elf, machine, eh, ehlen)
++     Elf *elf __attribute__ ((unused));
++     GElf_Half machine __attribute__ ((unused));
++     Ebl *eh;
++     size_t ehlen;
++{
++  /* Check whether the Elf_BH object has a sufficent size.  */
++  if (ehlen < sizeof (Ebl))
++    return NULL;
++
++  /* We handle it.  */
++  if (machine == EM_MIPS)
++    eh->name = "MIPS R3000 big-endian";
++  else if (machine == EM_MIPS_RS3_LE)
++    eh->name = "MIPS R3000 little-endian";
++
++  mips_init_reloc (eh);
++  HOOK (eh, reloc_simple_type);
++  HOOK (eh, return_value_location);
++  HOOK (eh, register_info);
++
++  return MODVERSION;
++}
+Index: elfutils-0.145/backends/mips_regs.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.145/backends/mips_regs.c	2010-02-24 18:57:35.000000000 +0000
+@@ -0,0 +1,104 @@
++/* Register names and numbers for MIPS DWARF.
++   Copyright (C) 2006 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <string.h>
++#include <dwarf.h>
++
++#define BACKEND mips_
++#include "libebl_CPU.h"
++
++ssize_t
++mips_register_info (Ebl *ebl __attribute__((unused)),
++		    int regno, char *name, size_t namelen,
++		    const char **prefix, const char **setname,
++		    int *bits, int *type)
++{
++  if (name == NULL)
++    return 66;
++
++  if (regno < 0 || regno > 65 || namelen < 4)
++    return -1;
++
++  *prefix = "$";
++
++  if (regno < 32)
++    {
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      if (regno < 32 + 10)
++        {
++          name[0] = regno + '0';
++          namelen = 1;
++        }
++      else
++        {
++          name[0] = (regno / 10) + '0';
++          name[1] = (regno % 10) + '0';
++          namelen = 2;
++        }
++    }
++  else if (regno < 64)
++    {
++      *setname = "FPU";
++      *type = DW_ATE_float;
++      *bits = 32;
++      name[0] = 'f';
++      if (regno < 32 + 10)
++	{
++	  name[1] = (regno - 32) + '0';
++	  namelen = 2;
++	}
++      else
++	{
++	  name[1] = (regno - 32) / 10 + '0';
++	  name[2] = (regno - 32) % 10 + '0';
++	  namelen = 3;
++	}
++    }
++  else if (regno == 64)
++    {
++      *type = DW_ATE_signed;
++      *bits = 32;
++      name[0] = 'h';
++      name[1] = 'i';
++      namelen = 2;
++    }
++  else
++    {
++      *type = DW_ATE_signed;
++      *bits = 32;
++      name[0] = 'l';
++      name[1] = 'o';
++      namelen = 2;
++    }
++
++  name[namelen++] = '\0';
++  return namelen;
++}
+Index: elfutils-0.145/backends/mips_reloc.def
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.145/backends/mips_reloc.def	2010-02-24 18:57:35.000000000 +0000
+@@ -0,0 +1,79 @@
++/* List the relocation types for mips.  -*- C -*-
++   Copyright (C) 2006 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++/* 	    NAME,		REL|EXEC|DYN	*/
++
++RELOC_TYPE (NONE,               0)
++RELOC_TYPE (16,                 0)
++RELOC_TYPE (32,                 0)
++RELOC_TYPE (REL32,              0)
++RELOC_TYPE (26,                 0)
++RELOC_TYPE (HI16,               0)
++RELOC_TYPE (LO16,               0)
++RELOC_TYPE (GPREL16,            0)
++RELOC_TYPE (LITERAL,            0)
++RELOC_TYPE (GOT16,              0)
++RELOC_TYPE (PC16,               0)
++RELOC_TYPE (CALL16,             0)
++RELOC_TYPE (GPREL32,            0)
++
++RELOC_TYPE (SHIFT5,             0)
++RELOC_TYPE (SHIFT6,             0)
++RELOC_TYPE (64,                 0)
++RELOC_TYPE (GOT_DISP,           0)
++RELOC_TYPE (GOT_PAGE,           0)
++RELOC_TYPE (GOT_OFST,           0)
++RELOC_TYPE (GOT_HI16,           0)
++RELOC_TYPE (GOT_LO16,           0)
++RELOC_TYPE (SUB,                0)
++RELOC_TYPE (INSERT_A,           0)
++RELOC_TYPE (INSERT_B,           0)
++RELOC_TYPE (DELETE,             0)
++RELOC_TYPE (HIGHER,             0)
++RELOC_TYPE (HIGHEST,            0)
++RELOC_TYPE (CALL_HI16,          0)
++RELOC_TYPE (CALL_LO16,          0)
++RELOC_TYPE (SCN_DISP,           0)
++RELOC_TYPE (REL16,              0)
++RELOC_TYPE (ADD_IMMEDIATE,      0)
++RELOC_TYPE (PJUMP,              0)
++RELOC_TYPE (RELGOT,             0)
++RELOC_TYPE (JALR,               0)
++RELOC_TYPE (TLS_DTPMOD32,       0)
++RELOC_TYPE (TLS_DTPREL32,       0)
++RELOC_TYPE (TLS_DTPMOD64,       0)
++RELOC_TYPE (TLS_DTPREL64,       0)
++RELOC_TYPE (TLS_GD,             0)
++RELOC_TYPE (TLS_LDM,            0)
++RELOC_TYPE (TLS_DTPREL_HI16,    0)
++RELOC_TYPE (TLS_DTPREL_LO16,    0)
++RELOC_TYPE (TLS_GOTTPREL,       0)
++RELOC_TYPE (TLS_TPREL32,        0)
++RELOC_TYPE (TLS_TPREL64,        0)
++RELOC_TYPE (TLS_TPREL_HI16,     0)
++RELOC_TYPE (TLS_TPREL_LO16,     0)
++
++#define NO_COPY_RELOC 1
++#define NO_RELATIVE_RELOC 1
+Index: elfutils-0.145/backends/mips_retval.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.145/backends/mips_retval.c	2010-02-24 18:57:35.000000000 +0000
+@@ -0,0 +1,321 @@
++/* Function return value location for Linux/mips ABI.
++   Copyright (C) 2005 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <string.h>
++#include <assert.h>
++#include <dwarf.h>
++#include <elf.h>
++
++#include "../libebl/libeblP.h"
++#include "../libdw/libdwP.h"
++
++#define BACKEND mips_
++#include "libebl_CPU.h"
++
++/* The ABI of the file.  Also see EF_MIPS_ABI2 above. */
++#define EF_MIPS_ABI		0x0000F000
++
++/* The original o32 abi. */
++#define E_MIPS_ABI_O32          0x00001000
++
++/* O32 extended to work on 64 bit architectures */
++#define E_MIPS_ABI_O64          0x00002000
++
++/* EABI in 32 bit mode */
++#define E_MIPS_ABI_EABI32       0x00003000
++
++/* EABI in 64 bit mode */
++#define E_MIPS_ABI_EABI64       0x00004000
++
++/* All the possible MIPS ABIs. */
++enum mips_abi
++  {
++    MIPS_ABI_UNKNOWN = 0,
++    MIPS_ABI_N32,
++    MIPS_ABI_O32,
++    MIPS_ABI_N64,
++    MIPS_ABI_O64,
++    MIPS_ABI_EABI32,
++    MIPS_ABI_EABI64,
++    MIPS_ABI_LAST
++  };
++
++/* Find the mips ABI of the current file */
++enum mips_abi find_mips_abi(Elf *elf)
++{
++  GElf_Ehdr ehdr_mem;
++  GElf_Ehdr *ehdr = gelf_getehdr (elf, &ehdr_mem);
++
++  if (ehdr == NULL)
++    return MIPS_ABI_LAST;
++
++  GElf_Word elf_flags = ehdr->e_flags;
++
++  /* Check elf_flags to see if it specifies the ABI being used.  */
++  switch ((elf_flags & EF_MIPS_ABI))
++    {
++    case E_MIPS_ABI_O32:
++      return MIPS_ABI_O32;
++    case E_MIPS_ABI_O64:
++      return MIPS_ABI_O64;
++    case E_MIPS_ABI_EABI32:
++      return MIPS_ABI_EABI32;
++    case E_MIPS_ABI_EABI64:
++      return MIPS_ABI_EABI64;
++    default:
++      if ((elf_flags & EF_MIPS_ABI2))
++	return MIPS_ABI_N32;
++    }
++
++  /* GCC creates a pseudo-section whose name describes the ABI.  */
++  size_t shstrndx;
++  if (elf_getshdrstrndx (elf, &shstrndx) < 0)
++    return MIPS_ABI_LAST;
++
++  const char *name;
++  Elf_Scn *scn = NULL;
++  while ((scn = elf_nextscn (elf, scn)) != NULL)
++    {
++      GElf_Shdr shdr_mem;
++      GElf_Shdr *shdr = gelf_getshdr (scn, &shdr_mem);
++      if (shdr == NULL)
++        return MIPS_ABI_LAST;
++
++      name = elf_strptr (elf, shstrndx, shdr->sh_name) ?: "";
++      if (strncmp (name, ".mdebug.", 8) != 0)
++        continue;
++
++      if (strcmp (name, ".mdebug.abi32") == 0)
++        return MIPS_ABI_O32;
++      else if (strcmp (name, ".mdebug.abiN32") == 0)
++        return MIPS_ABI_N32;
++      else if (strcmp (name, ".mdebug.abi64") == 0)
++        return MIPS_ABI_N64;
++      else if (strcmp (name, ".mdebug.abiO64") == 0)
++        return MIPS_ABI_O64;
++      else if (strcmp (name, ".mdebug.eabi32") == 0)
++        return MIPS_ABI_EABI32;
++      else if (strcmp (name, ".mdebug.eabi64") == 0)
++        return MIPS_ABI_EABI64;
++      else
++        return MIPS_ABI_UNKNOWN;
++    }
++
++  return MIPS_ABI_UNKNOWN;
++}
++
++unsigned int
++mips_abi_regsize (enum mips_abi abi)
++{
++  switch (abi)
++    {
++    case MIPS_ABI_EABI32:
++    case MIPS_ABI_O32:
++      return 4;
++    case MIPS_ABI_N32:
++    case MIPS_ABI_N64:
++    case MIPS_ABI_O64:
++    case MIPS_ABI_EABI64:
++      return 8;
++    case MIPS_ABI_UNKNOWN:
++    case MIPS_ABI_LAST:
++    default:
++      return 0;
++    }
++}
++
++
++/* $v0 or pair $v0, $v1 */
++static const Dwarf_Op loc_intreg_o32[] =
++  {
++    { .atom = DW_OP_reg2 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_reg3 }, { .atom = DW_OP_piece, .number = 4 },
++  };
++
++static const Dwarf_Op loc_intreg[] =
++  {
++    { .atom = DW_OP_reg2 }, { .atom = DW_OP_piece, .number = 8 },
++    { .atom = DW_OP_reg3 }, { .atom = DW_OP_piece, .number = 8 },
++  };
++#define nloc_intreg	1
++#define nloc_intregpair	4
++
++/* $f0 (float), or pair $f0, $f1 (double).
++ * f2/f3 are used for COMPLEX (= 2 doubles) returns in Fortran */
++static const Dwarf_Op loc_fpreg_o32[] =
++  {
++    { .atom = DW_OP_regx, .number = 32 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_regx, .number = 33 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_regx, .number = 34 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_regx, .number = 35 }, { .atom = DW_OP_piece, .number = 4 },
++  };
++
++/* $f0, or pair $f0, $f2.  */
++static const Dwarf_Op loc_fpreg[] =
++  {
++    { .atom = DW_OP_regx, .number = 32 }, { .atom = DW_OP_piece, .number = 8 },
++    { .atom = DW_OP_regx, .number = 34 }, { .atom = DW_OP_piece, .number = 8 },
++  };
++#define nloc_fpreg  1
++#define nloc_fpregpair 4
++#define nloc_fpregquad 8
++
++/* The return value is a structure and is actually stored in stack space
++   passed in a hidden argument by the caller.  But, the compiler
++   helpfully returns the address of that space in $v0.  */
++static const Dwarf_Op loc_aggregate[] =
++  {
++    { .atom = DW_OP_breg2, .number = 0 }
++  };
++#define nloc_aggregate 1
++
++int
++mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++{
++  /* First find the ABI used by the elf object */
++  enum mips_abi abi = find_mips_abi(functypedie->cu->dbg->elf);
++
++  /* Something went seriously wrong while trying to figure out the ABI */
++  if (abi == MIPS_ABI_LAST)
++    return -1;
++
++  /* We couldn't identify the ABI, but the file seems valid */
++  if (abi == MIPS_ABI_UNKNOWN)
++    return -2;
++
++  /* Can't handle EABI variants */
++  if ((abi == MIPS_ABI_EABI32) || (abi == MIPS_ABI_EABI64))
++    return -2;
++
++  unsigned int regsize = mips_abi_regsize (abi);
++  if (!regsize)
++    return -2;
++
++  /* Start with the function's type, and get the DW_AT_type attribute,
++     which is the type of the return value.  */
++
++  Dwarf_Attribute attr_mem;
++  Dwarf_Attribute *attr = dwarf_attr_integrate (functypedie, DW_AT_type, &attr_mem);
++  if (attr == NULL)
++    /* The function has no return value, like a `void' function in C.  */
++    return 0;
++
++  Dwarf_Die die_mem;
++  Dwarf_Die *typedie = dwarf_formref_die (attr, &die_mem);
++  int tag = dwarf_tag (typedie);
++
++  /* Follow typedefs and qualifiers to get to the actual type.  */
++  while (tag == DW_TAG_typedef
++	 || tag == DW_TAG_const_type || tag == DW_TAG_volatile_type
++	 || tag == DW_TAG_restrict_type || tag == DW_TAG_mutable_type)
++    {
++      attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
++      typedie = dwarf_formref_die (attr, &die_mem);
++      tag = dwarf_tag (typedie);
++    }
++
++  switch (tag)
++    {
++    case -1:
++      return -1;
++
++    case DW_TAG_subrange_type:
++      if (! dwarf_hasattr_integrate (typedie, DW_AT_byte_size))
++	{
++	  attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
++	  typedie = dwarf_formref_die (attr, &die_mem);
++	  tag = dwarf_tag (typedie);
++	}
++      /* Fall through.  */
++
++    case DW_TAG_base_type:
++    case DW_TAG_enumeration_type:
++    case DW_TAG_pointer_type:
++    case DW_TAG_ptr_to_member_type:
++      {
++        Dwarf_Word size;
++	if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_byte_size,
++					 &attr_mem), &size) != 0)
++	  {
++	    if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
++	      size = regsize;
++	    else
++	      return -1;
++	  }
++	if (tag == DW_TAG_base_type)
++	  {
++	    Dwarf_Word encoding;
++	    if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
++					     &attr_mem), &encoding) != 0)
++	      return -1;
++
++#define ABI_LOC(loc, regsize) ((regsize) == 4 ? (loc ## _o32) : (loc))
++
++	    if (encoding == DW_ATE_float)
++	      {
++		*locp = ABI_LOC(loc_fpreg, regsize);
++		if (size <= regsize)
++		    return nloc_fpreg;
++
++		if (size <= 2*regsize)
++                  return nloc_fpregpair;
++
++		if (size <= 4*regsize && abi == MIPS_ABI_O32)
++                  return nloc_fpregquad;
++
++		goto aggregate;
++	      }
++	  }
++	*locp = ABI_LOC(loc_intreg, regsize);
++	if (size <= regsize)
++	  return nloc_intreg;
++	if (size <= 2*regsize)
++	  return nloc_intregpair;
++
++	/* Else fall through. Shouldn't happen though (at least with gcc) */
++      }
++
++    case DW_TAG_structure_type:
++    case DW_TAG_class_type:
++    case DW_TAG_union_type:
++    case DW_TAG_array_type:
++    aggregate:
++      /* XXX TODO: Can't handle structure return with other ABI's yet :-/ */
++      if ((abi != MIPS_ABI_O32) && (abi != MIPS_ABI_O64))
++        return -2;
++
++      *locp = loc_aggregate;
++      return nloc_aggregate;
++    }
++
++  /* XXX We don't have a good way to return specific errors from ebl calls.
++     This value means we do not understand the type, but it is well-formed
++     DWARF and might be valid.  */
++  return -2;
++}
+Index: elfutils-0.145/backends/mips_symbol.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.145/backends/mips_symbol.c	2010-02-24 18:57:35.000000000 +0000
+@@ -0,0 +1,52 @@
++/* MIPS specific symbolic name handling.
++   Copyright (C) 2002, 2003, 2005 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++   Written by Jakub Jelinek <jakub@redhat.com>, 2002.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <elf.h>
++#include <stddef.h>
++
++#define BACKEND		mips_
++#include "libebl_CPU.h"
++
++/* Check for the simple reloc types.  */
++Elf_Type
++mips_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type)
++{
++  switch (type)
++    {
++    case R_MIPS_16:
++      return ELF_T_HALF;
++    case R_MIPS_32:
++      return ELF_T_WORD;
++    case R_MIPS_64:
++      return ELF_T_XWORD;
++    default:
++      return ELF_T_NUM;
++    }
++}
+Index: elfutils-0.145/libebl/eblopenbackend.c
+===================================================================
+--- elfutils-0.145.orig/libebl/eblopenbackend.c	2010-02-24 18:55:51.000000000 +0000
++++ elfutils-0.145/libebl/eblopenbackend.c	2010-02-24 18:57:35.000000000 +0000
+@@ -91,6 +91,8 @@
+   { "sparc", "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
+   { "sparc", "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
+   { "s390", "ebl_s390", "s390", 4, EM_S390, 0, 0 },
++  { "mips", "elf_mips", "mips", 4, EM_MIPS, 0, 0 },
++  { "mips", "elf_mipsel", "mipsel", 4, EM_MIPS_RS3_LE, 0, 0 },
+ 
+   { "m32", "elf_m32", "m32", 3, EM_M32, 0, 0 },
+   { "m68k", "elf_m68k", "m68k", 4, EM_68K, 0, 0 },
+Index: elfutils-0.145/backends/common-reloc.c
+===================================================================
+--- elfutils-0.145.orig/backends/common-reloc.c	2010-02-24 18:55:51.000000000 +0000
++++ elfutils-0.145/backends/common-reloc.c	2010-02-24 18:57:35.000000000 +0000
+@@ -109,11 +109,13 @@
+ }
+ 
+ 
++#ifndef NO_COPY_RELOC
+ bool
+ EBLHOOK(copy_reloc_p) (int reloc)
+ {
+   return reloc == R_TYPE (COPY);
+ }
++#endif
+ 
+ bool
+ EBLHOOK(none_reloc_p) (int reloc)
+@@ -135,7 +137,9 @@
+   ebl->reloc_type_name = EBLHOOK(reloc_type_name);
+   ebl->reloc_type_check = EBLHOOK(reloc_type_check);
+   ebl->reloc_valid_use = EBLHOOK(reloc_valid_use);
++#ifndef NO_COPY_RELOC
+   ebl->copy_reloc_p = EBLHOOK(copy_reloc_p);
++#endif
+   ebl->none_reloc_p = EBLHOOK(none_reloc_p);
+ #ifndef NO_RELATIVE_RELOC
+   ebl->relative_reloc_p = EBLHOOK(relative_reloc_p);
+Index: elfutils-0.145/backends/Makefile.am
+===================================================================
+--- elfutils-0.145.orig/backends/Makefile.am	2010-02-24 18:57:26.000000000 +0000
++++ elfutils-0.145/backends/Makefile.am	2010-02-24 18:57:57.000000000 +0000
+@@ -29,11 +29,11 @@
+ 	   -I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
+ 
+ 
+-modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 parisc
++modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 parisc mips
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a \
+ 	     libebl_sparc_pic.a libebl_ppc_pic.a libebl_ppc64_pic.a \
+-	     libebl_s390_pic.a libebl_parisc_pic.a
++	     libebl_s390_pic.a libebl_parisc_pic.a libebl_mips_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -99,6 +99,10 @@
+ libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
+ am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
++mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
++libebl_mips_pic_a_SOURCES = $(mips_SRCS)
++am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
++
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ 	@rm -f $(@:.so=.map)
+ 	echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
diff --git a/recipes/elfutils/elfutils-0.148/redhat-portability.diff b/recipes/elfutils/elfutils-0.148/redhat-portability.diff
new file mode 100644
index 0000000..4b3bd64
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/redhat-portability.diff
@@ -0,0 +1,1124 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.148/backends/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/backends/ChangeLog	2010-04-13 20:08:02.000000000 +0000
++++ elfutils-0.148/backends/ChangeLog	2010-07-03 13:04:07.000000000 +0000
+@@ -106,6 +106,10 @@
+ 	* ppc_attrs.c (ppc_check_object_attribute): Handle tag
+ 	GNU_Power_ABI_Struct_Return.
+ 
++2009-01-23  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (libebl_%.so): Use $(LD_AS_NEEDED).
++
+ 2008-10-04  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* i386_reloc.def: Fix entries for TLS_GOTDESC, TLS_DESC_CALL, and
+@@ -433,6 +437,11 @@
+ 	* sparc_init.c: Likewise.
+ 	* x86_64_init.c: Likewise.
+ 
++2005-11-22  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (LD_AS_NEEDED): New variable, substituted by configure.
++	(libebl_%.so rule): Use it in place of -Wl,--as-needed.
++
+ 2005-11-19  Roland McGrath  <roland@redhat.com>
+ 
+ 	* ppc64_reloc.def: REL30 -> ADDR30.
+@@ -455,6 +464,9 @@
+ 	* Makefile.am (uninstall): Don't try to remove $(pkgincludedir).
+ 	(CLEANFILES): Add libebl_$(m).so.
+ 
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 	* ppc_reloc.def: Update bits per Alan Modra <amodra@bigpond.net.au>.
+ 	* ppc64_reloc.def: Likewise.
+ 
+Index: elfutils-0.148/backends/Makefile.am
+===================================================================
+--- elfutils-0.148.orig/backends/Makefile.am	2010-04-13 20:08:02.000000000 +0000
++++ elfutils-0.148/backends/Makefile.am	2010-07-03 13:04:07.000000000 +0000
+@@ -103,7 +103,7 @@
+ 	$(LINK) -shared -o $(@:.map=.so) \
+ 		-Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
+ 		-Wl,--version-script,$(@:.so=.map) \
+-		-Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw) $(libmudflap)
++		-Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw) $(libmudflap)
+ 	$(textrel_check)
+ 
+ libebl_i386.so: $(cpu_i386)
+Index: elfutils-0.148/backends/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/backends/Makefile.in	2010-06-28 19:07:33.000000000 +0000
++++ elfutils-0.148/backends/Makefile.in	2010-07-03 13:04:07.000000000 +0000
+@@ -165,6 +165,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -194,6 +195,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -257,7 +259,7 @@
+ 	-I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+ 	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+ 	$(am__append_1)
+ @MUDFLAP_FALSE@libmudflap = 
+@@ -698,7 +700,7 @@
+ 	$(LINK) -shared -o $(@:.map=.so) \
+ 		-Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
+ 		-Wl,--version-script,$(@:.so=.map) \
+-		-Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw) $(libmudflap)
++		-Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw) $(libmudflap)
+ 	$(textrel_check)
+ 
+ libebl_i386.so: $(cpu_i386)
+Index: elfutils-0.148/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/ChangeLog	2010-04-21 14:26:40.000000000 +0000
++++ elfutils-0.148/ChangeLog	2010-07-03 13:04:07.000000000 +0000
+@@ -2,6 +2,10 @@
+ 
+ 	* configure.ac (LOCALEDIR, DATADIRNAME): Removed.
+ 
++2009-11-22  Roland McGrath  <roland@redhat.com>
++
++	* configure.ac: Use sed and expr instead of modern bash extensions.
++
+ 2009-09-21  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* configure.ac: Update for more modern autoconf.
+@@ -10,6 +14,10 @@
+ 
+ 	* configure.ac (zip_LIBS): Check for liblzma too.
+ 
++2009-08-17  Roland McGrath  <roland@redhat.com>
++
++	* configure.ac: Check for -fgnu89-inline; add it to WEXTRA if it works.
++
+ 2009-04-19  Roland McGrath  <roland@redhat.com>
+ 
+ 	* configure.ac (eu_version): Round down here, not in version.h macros.
+@@ -21,6 +29,8 @@
+ 
+ 2009-01-23  Roland McGrath  <roland@redhat.com>
+ 
++	* configure.ac: Check for __builtin_popcount.
++
+ 	* configure.ac (zlib check): Check for gzdirect, need zlib >= 1.2.2.3.
+ 
+ 	* configure.ac (__thread check): Use AC_LINK_IFELSE, in case of
+@@ -101,6 +111,10 @@
+ 	* configure.ac: Add dummy automake conditional to get dependencies
+ 	for non-generic linker right.  See src/Makefile.am.
+ 
++2005-11-22  Roland McGrath  <roland@redhat.com>
++
++	* configure.ac: Check for --as-needed linker option.
++
+ 2005-11-18  Roland McGrath  <roland@redhat.com>
+ 
+ 	* Makefile.am (DISTCHECK_CONFIGURE_FLAGS): New variable.
+@@ -148,6 +162,17 @@
+ 	* Makefile.am (all_SUBDIRS): Add libdwfl.
+ 	* configure.ac: Write libdwfl/Makefile.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* configure.ac (WEXTRA): Check for -Wextra and set this substitution.
++
++	* configure.ac: Check for struct stat st_?tim members.
++	* src/strip.c (process_file): Use st_?time if st_?tim are not there.
++
++	* configure.ac: Check for futimes function.
++	* src/strip.c (handle_elf) [! HAVE_FUTIMES]: Use utimes instead.
++	(handle_ar) [! HAVE_FUTIMES]: Likewise.
++
+ 2005-05-19  Roland McGrath  <roland@redhat.com>
+ 
+ 	* configure.ac [AH_BOTTOM] (INTDECL, _INTDECL): New macros.
+Index: elfutils-0.148/config/eu.am
+===================================================================
+--- elfutils-0.148.orig/config/eu.am	2010-04-21 14:26:40.000000000 +0000
++++ elfutils-0.148/config/eu.am	2010-07-03 13:04:07.000000000 +0000
+@@ -25,11 +25,14 @@
+ ## <http://www.openinventionnetwork.com>.
+ ##
+ 
++WEXTRA = @WEXTRA@
++LD_AS_NEEDED = @LD_AS_NEEDED@
++
+ DEFS = -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"${localedir}"'
+ INCLUDES = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow \
+ 	    $(if $($(*F)_no_Werror),,-Werror) \
+-	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
++	    $(if $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) \
+ 	    $(if $($(*F)_no_Wformat),-Wno-format,-Wformat=2) \
+ 	    $($(*F)_CFLAGS)
+ 
+Index: elfutils-0.148/config/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/config/Makefile.in	2010-06-28 19:07:34.000000000 +0000
++++ elfutils-0.148/config/Makefile.in	2010-07-03 13:04:07.000000000 +0000
+@@ -76,6 +76,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -105,6 +106,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+Index: elfutils-0.148/config.h.in
+===================================================================
+--- elfutils-0.148.orig/config.h.in	2010-06-28 19:07:37.000000000 +0000
++++ elfutils-0.148/config.h.in	2010-07-03 13:04:07.000000000 +0000
+@@ -1,5 +1,8 @@
+ /* config.h.in.  Generated from configure.ac by autoheader.  */
+ 
++/* Have __builtin_popcount. */
++#undef HAVE_BUILTIN_POPCOUNT
++
+ /* $libdir subdirectory containing libebl modules. */
+ #undef LIBEBL_SUBDIR
+ 
+@@ -55,4 +58,7 @@
+ /* Define for large files, on AIX-style hosts. */
+ #undef _LARGE_FILES
+ 
++/* Stubbed out if missing compiler support. */
++#undef __thread
++
+ #include <eu-config.h>
+Index: elfutils-0.148/configure.ac
+===================================================================
+--- elfutils-0.148.orig/configure.ac	2010-06-28 19:07:26.000000000 +0000
++++ elfutils-0.148/configure.ac	2010-07-03 13:04:07.000000000 +0000
+@@ -73,6 +73,54 @@
+ AS_IF([test "x$ac_cv_c99" != xyes],
+       AC_MSG_ERROR([gcc with C99 support required]))
+ 
++AC_CACHE_CHECK([for -Wextra option to $CC], ac_cv_cc_wextra, [dnl
++old_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -Wextra"
++AC_COMPILE_IFELSE([void foo (void) { }],
++		  ac_cv_cc_wextra=yes, ac_cv_cc_wextra=no)
++CFLAGS="$old_CFLAGS"])
++AC_SUBST(WEXTRA)
++AS_IF([test "x$ac_cv_cc_wextra" = xyes], [WEXTRA=-Wextra], [WEXTRA=-W])
++
++AC_CACHE_CHECK([for -fgnu89-inline option to $CC], ac_cv_cc_gnu89_inline, [dnl
++old_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -fgnu89-inline -Werror"
++AC_COMPILE_IFELSE([
++void foo (void)
++{
++  inline void bar (void) {}
++  bar ();
++}
++extern inline void baz (void) {}
++], ac_cv_cc_gnu89_inline=yes, ac_cv_cc_gnu89_inline=no)
++CFLAGS="$old_CFLAGS"])
++AS_IF([test "x$ac_cv_cc_gnu89_inline" = xyes],
++      [WEXTRA="${WEXTRA:+$WEXTRA }-fgnu89-inline"])
++
++AC_CACHE_CHECK([for --as-needed linker option],
++	       ac_cv_as_needed, [dnl
++cat > conftest.c <<EOF
++int main (void) { return 0; }
++EOF
++if AC_TRY_COMMAND([${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS
++			    -fPIC -shared -o conftest.so conftest.c
++			    -Wl,--as-needed 1>&AS_MESSAGE_LOG_FD])
++then
++  ac_cv_as_needed=yes
++else
++  ac_cv_as_needed=no
++fi
++rm -f conftest*])
++AS_IF([test "x$ac_cv_as_needed" = xyes],
++      [LD_AS_NEEDED=-Wl,--as-needed], [LD_AS_NEEDED=])
++AC_SUBST(LD_AS_NEEDED)
++
++AC_CACHE_CHECK([for __builtin_popcount], ac_cv_popcount, [dnl
++AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[exit (__builtin_popcount (127));]])],
++	       ac_cv_popcount=yes, ac_cv_popcount=no)])
++AS_IF([test "x$ac_cv_popcount" = xyes],
++      [AC_DEFINE([HAVE_BUILTIN_POPCOUNT], [1], [Have __builtin_popcount.])])
++
+ AC_CACHE_CHECK([for __thread support], ac_cv_tls, [dnl
+ # Use the same flags that we use for our DSOs, so the test is representative.
+ # Some old compiler/linker/libc combinations fail some ways and not others.
+@@ -88,7 +136,10 @@
+ CFLAGS="$save_CFLAGS"
+ LDFLAGS="$save_LDFLAGS"])
+ AS_IF([test "x$ac_cv_tls" != xyes],
+-      AC_MSG_ERROR([__thread support required]))
++      [AS_IF([test "$use_locks" = yes],
++	     [AC_MSG_ERROR([--enable-thread-safety requires __thread support])],
++	     [AC_DEFINE([__thread], [/* empty: no multi-thread support */],
++			[Stubbed out if missing compiler support.])])])
+ 
+ dnl This test must come as early as possible after the compiler configuration
+ dnl tests, because the choice of the file model can (in principle) affect
+@@ -251,7 +302,7 @@
+ 
+ # 1.234<whatever> -> 1234<whatever>
+ case "$PACKAGE_VERSION" in
+-[[0-9]].*) eu_version="${PACKAGE_VERSION/./}" ;;
++[[0-9]].*) eu_version=`echo "$PACKAGE_VERSION" | sed 's@\.@@'` ;;
+ *)     	   AC_MSG_ERROR([confused by version number '$PACKAGE_VERSION']) ;;
+ esac
+ case "$eu_version" in
+@@ -280,6 +331,6 @@
+ esac
+ 
+ # Round up to the next release API (x.y) version.
+-[eu_version=$[($eu_version + 999) / 1000]]
++eu_version=`expr \( $eu_version + 999 \) / 1000`
+ 
+ AC_OUTPUT
+Index: elfutils-0.148/lib/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/lib/ChangeLog	2010-06-28 19:05:56.000000000 +0000
++++ elfutils-0.148/lib/ChangeLog	2010-07-03 13:04:07.000000000 +0000
+@@ -14,6 +14,9 @@
+ 
+ 2009-01-23  Roland McGrath  <roland@redhat.com>
+ 
++	* eu-config.h [! HAVE_BUILTIN_POPCOUNT]
++	(__builtin_popcount): New inline function.
++
+ 	* eu-config.h: Add multiple inclusion protection.
+ 
+ 2009-01-17  Ulrich Drepper  <drepper@redhat.com>
+@@ -70,6 +73,11 @@
+ 	* Makefile.am (libeu_a_SOURCES): Add it.
+ 	* system.h: Declare crc32_file.
+ 
++2005-02-07  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-04-30  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* Makefile.am: Use -ffunction-sections for xmalloc.c.
+Index: elfutils-0.148/lib/eu-config.h
+===================================================================
+--- elfutils-0.148.orig/lib/eu-config.h	2009-08-12 14:23:22.000000000 +0000
++++ elfutils-0.148/lib/eu-config.h	2010-07-03 13:04:07.000000000 +0000
+@@ -182,6 +182,17 @@
+ /* This macro is used by the tests conditionalize for standalone building.  */
+ #define ELFUTILS_HEADER(name) <lib##name.h>
+ 
++#ifndef HAVE_BUILTIN_POPCOUNT
++# define __builtin_popcount hakmem_popcount
++static inline unsigned int __attribute__ ((unused))
++hakmem_popcount (unsigned int x)
++{
++  /* HAKMEM 169 */
++  unsigned int n = x - ((x >> 1) & 033333333333) - ((x >> 2) & 011111111111);
++  return ((n + (n >> 3)) & 030707070707) % 63;
++}
++#endif	/* HAVE_BUILTIN_POPCOUNT */
++
+ 
+ #ifdef SHARED
+ # define OLD_VERSION(name, version) \
+Index: elfutils-0.148/lib/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/lib/Makefile.in	2010-06-28 19:07:33.000000000 +0000
++++ elfutils-0.148/lib/Makefile.in	2010-07-03 13:04:07.000000000 +0000
+@@ -99,6 +99,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -128,6 +129,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -190,7 +192,7 @@
+ 	-I$(srcdir)/../libelf
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+ 	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+ 	$(am__append_1) -fpic
+ @MUDFLAP_FALSE@libmudflap = 
+Index: elfutils-0.148/libasm/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/libasm/ChangeLog	2010-03-05 05:48:23.000000000 +0000
++++ elfutils-0.148/libasm/ChangeLog	2010-07-03 13:04:07.000000000 +0000
+@@ -67,6 +67,11 @@
+ 	* asm_error.c: Add new error ASM_E_IOERROR.
+ 	* libasmP.h: Add ASM_E_IOERROR definition.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-02-15  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* Makefile.am (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
+Index: elfutils-0.148/libasm/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/libasm/Makefile.in	2010-06-28 19:07:33.000000000 +0000
++++ elfutils-0.148/libasm/Makefile.in	2010-07-03 13:04:07.000000000 +0000
+@@ -147,6 +147,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -176,6 +177,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -239,7 +241,7 @@
+ 	-I$(top_srcdir)/libdw
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+ 	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+ 	$(am__append_1)
+ @MUDFLAP_FALSE@libmudflap = 
+Index: elfutils-0.148/libcpu/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/libcpu/ChangeLog	2010-03-05 05:48:23.000000000 +0000
++++ elfutils-0.148/libcpu/ChangeLog	2010-07-03 13:04:07.000000000 +0000
+@@ -9,6 +9,9 @@
+ 
+ 2009-01-23  Roland McGrath  <roland@redhat.com>
+ 
++	* i386_disasm.c (i386_disasm): Add abort after assert-constant for old
++	compilers that don't realize it's noreturn.
++
+ 	* Makefile.am (i386_parse_CFLAGS): Use quotes around command
+ 	substitution that can produce leading whitespace.
+ 
+@@ -338,6 +341,11 @@
+ 	* defs/i386.doc: New file.
+ 	* defs/x86_64: New file.
+ 
++2005-04-04  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it instead of -Wextra.
++
+ 2005-02-15  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* Makefile (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
+Index: elfutils-0.148/libcpu/i386_disasm.c
+===================================================================
+--- elfutils-0.148.orig/libcpu/i386_disasm.c	2009-01-08 20:56:36.000000000 +0000
++++ elfutils-0.148/libcpu/i386_disasm.c	2010-07-03 13:04:07.000000000 +0000
+@@ -791,6 +791,7 @@
+ 
+ 			default:
+ 			  assert (! "INVALID not handled");
++			  abort ();
+ 			}
+ 		    }
+ 		  else
+Index: elfutils-0.148/libcpu/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/libcpu/Makefile.in	2010-06-28 19:07:33.000000000 +0000
++++ elfutils-0.148/libcpu/Makefile.in	2010-07-03 13:04:07.000000000 +0000
+@@ -116,6 +116,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = lex.$(<F:lex.l=)
+@@ -145,6 +146,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -208,7 +210,7 @@
+ 	-I$(srcdir)/../libdw -I$(srcdir)/../libasm
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+ 	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+ 	$(am__append_1) -fpic -fdollars-in-identifiers
+ @MUDFLAP_FALSE@libmudflap = 
+Index: elfutils-0.148/libdw/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/libdw/ChangeLog	2010-06-28 19:05:56.000000000 +0000
++++ elfutils-0.148/libdw/ChangeLog	2010-07-03 13:04:07.000000000 +0000
+@@ -276,6 +276,10 @@
+ 
+ 	* dwarf_hasattr_integrate.c: Integrate DW_AT_specification too.
+ 
++2009-08-17  Roland McGrath  <roland@redhat.com>
++
++	* libdw.h: Disable extern inlines for GCC 4.2.
++
+ 2009-08-10  Roland McGrath  <roland@redhat.com>
+ 
+ 	* dwarf_getscopevar.c: Use dwarf_diename.
+@@ -1044,6 +1048,11 @@
+ 
+ 2005-05-31  Roland McGrath  <roland@redhat.com>
+ 
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
+ 	* dwarf_formref_die.c (dwarf_formref_die): Add CU header offset to
+ 	formref offset.
+ 
+Index: elfutils-0.148/libdw/libdw.h
+===================================================================
+--- elfutils-0.148.orig/libdw/libdw.h	2010-06-28 19:05:56.000000000 +0000
++++ elfutils-0.148/libdw/libdw.h	2010-07-03 13:04:07.000000000 +0000
+@@ -842,7 +842,7 @@
+ 
+ 
+ /* Inline optimizations.  */
+-#ifdef __OPTIMIZE__
++#if defined __OPTIMIZE__ && !(__GNUC__ == 4 && __GNUC_MINOR__ == 2)
+ /* Return attribute code of given attribute.  */
+ __libdw_extern_inline unsigned int
+ dwarf_whatattr (Dwarf_Attribute *attr)
+Index: elfutils-0.148/libdw/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/libdw/Makefile.in	2010-06-28 19:07:33.000000000 +0000
++++ elfutils-0.148/libdw/Makefile.in	2010-07-03 13:04:07.000000000 +0000
+@@ -191,6 +191,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -220,6 +221,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -282,7 +284,7 @@
+ 	-I$(srcdir)/../libelf
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+ 	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+ 	$(am__append_1) $(am__append_2)
+ @MUDFLAP_FALSE@libmudflap = 
+Index: elfutils-0.148/libdwfl/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/libdwfl/ChangeLog	2010-06-28 19:05:56.000000000 +0000
++++ elfutils-0.148/libdwfl/ChangeLog	2010-07-03 13:04:07.000000000 +0000
+@@ -1265,6 +1265,11 @@
+ 
+ 2005-07-21  Roland McGrath  <roland@redhat.com>
+ 
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
++2005-07-21  Roland McGrath  <roland@redhat.com>
++
+ 	* Makefile.am (noinst_HEADERS): Add loc2c.c.
+ 
+ 	* test2.c (main): Check sscanf result to quiet warning.
+Index: elfutils-0.148/libdwfl/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/libdwfl/Makefile.in	2010-06-28 19:07:33.000000000 +0000
++++ elfutils-0.148/libdwfl/Makefile.in	2010-07-03 13:04:07.000000000 +0000
+@@ -181,6 +181,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -210,6 +211,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -273,7 +275,7 @@
+ 	-I$(srcdir)/../libdw
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+ 	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+ 	$(am__append_1)
+ @MUDFLAP_FALSE@libmudflap = 
+Index: elfutils-0.148/libebl/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/libebl/ChangeLog	2010-03-05 05:48:23.000000000 +0000
++++ elfutils-0.148/libebl/ChangeLog	2010-07-03 13:04:07.000000000 +0000
+@@ -624,6 +624,11 @@
+ 	* Makefile.am (libebl_*_so_SOURCES): Set to $(*_SRCS) so dependency
+ 	tracking works right.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-05-21  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* libebl_x86_64.map: Add x86_64_core_note.
+Index: elfutils-0.148/libebl/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/libebl/Makefile.in	2010-06-28 19:07:34.000000000 +0000
++++ elfutils-0.148/libebl/Makefile.in	2010-07-03 13:04:07.000000000 +0000
+@@ -143,6 +143,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -172,6 +173,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -235,7 +237,7 @@
+ 	-I$(srcdir)/../libasm
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+ 	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+ 	$(am__append_1) -fpic
+ @MUDFLAP_FALSE@libmudflap = 
+Index: elfutils-0.148/libelf/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/libelf/ChangeLog	2010-06-14 21:17:20.000000000 +0000
++++ elfutils-0.148/libelf/ChangeLog	2010-07-03 13:04:07.000000000 +0000
+@@ -657,6 +657,11 @@
+ 
+ 	* elf.h: Update from glibc.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-05-08  Roland McGrath  <roland@redhat.com>
+ 
+ 	* elf_begin.c (read_file) [_MUDFLAP]: Don't use mmap for now.
+Index: elfutils-0.148/libelf/common.h
+===================================================================
+--- elfutils-0.148.orig/libelf/common.h	2009-01-08 20:56:36.000000000 +0000
++++ elfutils-0.148/libelf/common.h	2010-07-03 13:04:07.000000000 +0000
+@@ -160,7 +160,7 @@
+   (Var) = (sizeof (Var) == 1						      \
+ 	   ? (unsigned char) (Var)					      \
+ 	   : (sizeof (Var) == 2						      \
+-	      ? bswap_16 (Var)						      \
++	      ? (unsigned short int) bswap_16 (Var)			      \
+ 	      : (sizeof (Var) == 4					      \
+ 		 ? bswap_32 (Var)					      \
+ 		 : bswap_64 (Var))))
+@@ -169,7 +169,7 @@
+   (Dst) = (sizeof (Var) == 1						      \
+ 	   ? (unsigned char) (Var)					      \
+ 	   : (sizeof (Var) == 2						      \
+-	      ? bswap_16 (Var)						      \
++	      ? (unsigned short int) bswap_16 (Var)			      \
+ 	      : (sizeof (Var) == 4					      \
+ 		 ? bswap_32 (Var)					      \
+ 		 : bswap_64 (Var))))
+Index: elfutils-0.148/libelf/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/libelf/Makefile.in	2010-06-28 19:07:34.000000000 +0000
++++ elfutils-0.148/libelf/Makefile.in	2010-07-03 13:04:07.000000000 +0000
+@@ -189,6 +189,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -218,6 +219,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -279,7 +281,7 @@
+ INCLUDES = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+ 	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+ 	$(am__append_1) $(am__append_2)
+ @MUDFLAP_FALSE@libmudflap = 
+Index: elfutils-0.148/m4/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/m4/Makefile.in	2010-06-28 19:07:34.000000000 +0000
++++ elfutils-0.148/m4/Makefile.in	2010-07-03 13:04:07.000000000 +0000
+@@ -75,6 +75,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -104,6 +105,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+Index: elfutils-0.148/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/Makefile.in	2010-06-28 19:07:33.000000000 +0000
++++ elfutils-0.148/Makefile.in	2010-07-03 13:04:07.000000000 +0000
+@@ -155,6 +155,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -184,6 +185,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+Index: elfutils-0.148/src/addr2line.c
+===================================================================
+--- elfutils-0.148.orig/src/addr2line.c	2010-05-28 14:38:30.000000000 +0000
++++ elfutils-0.148/src/addr2line.c	2010-07-03 13:05:40.000000000 +0000
+@@ -447,10 +447,10 @@
+       bool parsed = false;
+       int i, j;
+       char *name = NULL;
+-      if (sscanf (string, "(%m[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
++      if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
+ 	  && string[i] == '\0')
+ 	parsed = adjust_to_section (name, &addr, dwfl);
+-      switch (sscanf (string, "%m[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
++      switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
+ 	{
+ 	default:
+ 	  break;
+Index: elfutils-0.148/src/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/src/ChangeLog	2010-06-28 19:05:56.000000000 +0000
++++ elfutils-0.148/src/ChangeLog	2010-07-03 13:04:08.000000000 +0000
+@@ -165,8 +165,16 @@
+ 	* readelf.c (attr_callback): Use print_block only when we don't use
+ 	print_ops.
+ 
++2009-08-17  Roland McGrath  <roland@redhat.com>
++
++	* ld.h: Disable extern inlines for GCC 4.2.
++
+ 2009-08-14  Roland McGrath  <roland@redhat.com>
+ 
++	* strings.c (read_block): Conditionalize posix_fadvise use
++	on [POSIX_FADV_SEQUENTIAL].
++	From Petr Salinger <Petr.Salinger@seznam.cz>.
++
+ 	* ar.c (do_oper_extract): Use pathconf instead of statfs.
+ 
+ 2009-08-01  Ulrich Drepper  <drepper@redhat.com>
+@@ -330,6 +338,8 @@
+ 	* readelf.c (print_debug_frame_section): Use t instead of j formats
+ 	for ptrdiff_t OFFSET.
+ 
++	* addr2line.c (handle_address): Use %a instead of %m for compatibility.
++
+ 2009-01-21  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elflint.c (check_program_header): Fix typo in .eh_frame_hdr section
+@@ -513,6 +523,11 @@
+ 	that matches its PT_LOAD's p_flags &~ PF_W.  On sparc, PF_X really
+ 	is valid in RELRO.
+ 
++2008-03-01  Roland McGrath  <roland@redhat.com>
++
++	* readelf.c (dump_archive_index): Tweak portability hack
++	to match [__GNUC__ < 4] too.
++
+ 2008-02-29  Roland McGrath  <roland@redhat.com>
+ 
+ 	* readelf.c (print_attributes): Add a cast.
+@@ -764,6 +779,8 @@
+ 
+ 	* readelf.c (hex_dump): Fix rounding error in whitespace calculation.
+ 
++	* Makefile.am (readelf_no_Werror): New variable.
++
+ 2007-10-15  Roland McGrath  <roland@redhat.com>
+ 
+ 	* make-debug-archive.in: New file.
+@@ -1203,6 +1220,10 @@
+ 	* elflint.c (valid_e_machine): Add EM_ALPHA.
+ 	Reported by Christian Aichinger <Greek0@gmx.net>.
+ 
++	* strings.c (map_file): Define POSIX_MADV_SEQUENTIAL to
++	MADV_SEQUENTIAL if undefined.  	Don't call posix_madvise
++	if neither is defined.
++
+ 2006-08-08  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elflint.c (check_dynamic): Don't require DT_HASH for DT_SYMTAB.
+@@ -1279,6 +1300,10 @@
+ 	* Makefile.am: Add hacks to create dependency files for non-generic
+ 	linker.
+ 
++2006-04-05  Roland McGrath  <roland@redhat.com>
++
++	* strings.c (MAP_POPULATE): Define to 0 if undefined.
++
+ 2006-06-12  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* ldgeneric.c (ld_generic_generate_sections): Don't create .interp
+@@ -1627,6 +1652,11 @@
+ 	* readelf.c (print_debug_loc_section): Fix indentation for larger
+ 	address size.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-05-30  Roland McGrath  <roland@redhat.com>
+ 
+ 	* readelf.c (print_debug_line_section): Print section offset of each
+Index: elfutils-0.148/src/findtextrel.c
+===================================================================
+--- elfutils-0.148.orig/src/findtextrel.c	2009-02-11 01:12:59.000000000 +0000
++++ elfutils-0.148/src/findtextrel.c	2010-07-03 13:04:08.000000000 +0000
+@@ -490,7 +490,11 @@
+ 
+ 
+ static void
+-check_rel (size_t nsegments, struct segments segments[nsegments],
++check_rel (size_t nsegments, struct segments segments[
++#if __GNUC__ >= 4
++						      nsegments
++#endif
++	   ],
+ 	   GElf_Addr addr, Elf *elf, Elf_Scn *symscn, Dwarf *dw,
+ 	   const char *fname, bool more_than_one, void **knownsrcs)
+ {
+Index: elfutils-0.148/src/ld.h
+===================================================================
+--- elfutils-0.148.orig/src/ld.h	2009-06-13 22:39:51.000000000 +0000
++++ elfutils-0.148/src/ld.h	2010-07-03 13:04:08.000000000 +0000
+@@ -1122,6 +1122,7 @@
+ 
+ /* Checked whether the symbol is undefined and referenced from a DSO.  */
+ extern bool linked_from_dso_p (struct scninfo *scninfo, size_t symidx);
++#if defined __OPTIMIZE__ && !(__GNUC__ == 4 && __GNUC_MINOR__ == 2)
+ #ifdef __GNUC_STDC_INLINE__
+ __attribute__ ((__gnu_inline__))
+ #endif
+@@ -1139,5 +1140,6 @@
+ 
+   return sym->defined && sym->in_dso;
+ }
++#endif	/* Optimizing and not GCC 4.2.  */
+ 
+ #endif	/* ld.h */
+Index: elfutils-0.148/src/Makefile.am
+===================================================================
+--- elfutils-0.148.orig/src/Makefile.am	2010-03-05 05:48:23.000000000 +0000
++++ elfutils-0.148/src/Makefile.am	2010-07-03 13:04:08.000000000 +0000
+@@ -99,6 +99,9 @@
+ # XXX While the file is not finished, don't warn about this
+ ldgeneric_no_Wunused = yes
+ 
++# Buggy old compilers.
++readelf_no_Werror = yes
++
+ readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+ nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+ size_LDADD = $(libelf) $(libeu) $(libmudflap)
+Index: elfutils-0.148/src/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/src/Makefile.in	2010-06-28 19:07:34.000000000 +0000
++++ elfutils-0.148/src/Makefile.in	2010-07-03 13:04:08.000000000 +0000
+@@ -228,6 +228,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -257,6 +258,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -321,7 +323,7 @@
+ 	-I$(srcdir)/../libasm
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+ 	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+ 	$(am__append_1)
+ @MUDFLAP_FALSE@libmudflap = 
+@@ -368,6 +370,9 @@
+ addr2line_no_Wformat = yes
+ # XXX While the file is not finished, don't warn about this
+ ldgeneric_no_Wunused = yes
++
++# Buggy old compilers.
++readelf_no_Werror = yes
+ readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+ nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+ size_LDADD = $(libelf) $(libeu) $(libmudflap)
+Index: elfutils-0.148/src/readelf.c
+===================================================================
+--- elfutils-0.148.orig/src/readelf.c	2010-06-28 19:05:56.000000000 +0000
++++ elfutils-0.148/src/readelf.c	2010-07-03 13:04:08.000000000 +0000
+@@ -7845,7 +7845,7 @@
+ 	  if (unlikely (elf_rand (elf, as_off) == 0)
+ 	      || unlikely ((subelf = elf_begin (-1, ELF_C_READ_MMAP, elf))
+ 			   == NULL))
+-#if __GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 7)
++#if __GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 7) || __GNUC__ < 4
+ 	    while (1)
+ #endif
+ 	      error (EXIT_FAILURE, 0,
+Index: elfutils-0.148/src/strings.c
+===================================================================
+--- elfutils-0.148.orig/src/strings.c	2009-02-11 01:12:59.000000000 +0000
++++ elfutils-0.148/src/strings.c	2010-07-03 13:04:08.000000000 +0000
+@@ -51,6 +51,10 @@
+ 
+ #include <system.h>
+ 
++#ifndef MAP_POPULATE
++# define MAP_POPULATE 0
++#endif
++
+ 
+ /* Prototypes of local functions.  */
+ static int read_fd (int fd, const char *fname, off64_t fdlen);
+@@ -491,8 +495,13 @@
+ 		    fd, start_off);
+       if (mem != MAP_FAILED)
+ 	{
++#if !defined POSIX_MADV_SEQUENTIAL && defined MADV_SEQUENTIAL
++# define POSIX_MADV_SEQUENTIAL MADV_SEQUENTIAL
++#endif
++#ifdef POSIX_MADV_SEQUENTIAL
+ 	  /* We will go through the mapping sequentially.  */
+ 	  (void) posix_madvise (mem, map_size, POSIX_MADV_SEQUENTIAL);
++#endif
+ 	  break;
+ 	}
+       if (errno != EINVAL && errno != ENOMEM)
+@@ -586,9 +595,11 @@
+       elfmap_off = from & ~(ps - 1);
+       elfmap_base = elfmap = map_file (fd, elfmap_off, fdlen, &elfmap_size);
+ 
++#ifdef POSIX_FADV_SEQUENTIAL
+       if (unlikely (elfmap == MAP_FAILED))
+ 	/* Let the kernel know we are going to read everything in sequence.  */
+ 	(void) posix_fadvise (fd, 0, 0, POSIX_FADV_SEQUENTIAL);
++#endif
+     }
+ 
+   if (unlikely (elfmap == MAP_FAILED))
+Index: elfutils-0.148/src/strip.c
+===================================================================
+--- elfutils-0.148.orig/src/strip.c	2010-01-15 09:05:55.000000000 +0000
++++ elfutils-0.148/src/strip.c	2010-07-03 13:04:08.000000000 +0000
+@@ -53,6 +53,12 @@
+ #include <libebl.h>
+ #include <system.h>
+ 
++#ifdef HAVE_FUTIMES
++# define FUTIMES(fd, fname, tvp) futimes (fd, tvp)
++#else
++# define FUTIMES(fd, fname, tvp) utimes (fname, tvp)
++#endif
++
+ 
+ /* Name and version of program.  */
+ static void print_version (FILE *stream, struct argp_state *state);
+@@ -301,8 +307,18 @@
+ 
+       /* If we have to preserve the timestamp, we need it in the
+ 	 format utimes() understands.  */
++#ifdef HAVE_STRUCT_STAT_ST_ATIM
+       TIMESPEC_TO_TIMEVAL (&tv[0], &pre_st.st_atim);
++#else
++      tv[0].tv_sec = pre_st.st_atime;
++      tv[0].tv_usec = 0;
++#endif
++#ifdef HAVE_STRUCT_STAT_ST_MTIM
+       TIMESPEC_TO_TIMEVAL (&tv[1], &pre_st.st_mtim);
++#else
++      tv[1].tv_sec = pre_st.st_atime;
++      tv[1].tv_usec = 0;
++#endif
+     }
+ 
+   /* Open the file.  */
+@@ -1747,7 +1763,7 @@
+   /* If requested, preserve the timestamp.  */
+   if (tvp != NULL)
+     {
+-      if (futimes (fd, tvp) != 0)
++      if (FUTIMES (fd, output_fname, tvp) != 0)
+ 	{
+ 	  error (0, errno, gettext ("\
+ cannot set access and modification date of '%s'"),
+@@ -1804,7 +1820,7 @@
+ 
+   if (tvp != NULL)
+     {
+-      if (unlikely (futimes (fd, tvp) != 0))
++      if (unlikely (FUTIMES (fd, fname, tvp) != 0))
+ 	{
+ 	  error (0, errno, gettext ("\
+ cannot set access and modification date of '%s'"), fname);
+Index: elfutils-0.148/tests/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/tests/ChangeLog	2010-06-28 19:05:56.000000000 +0000
++++ elfutils-0.148/tests/ChangeLog	2010-07-03 13:04:08.000000000 +0000
+@@ -154,6 +154,8 @@
+ 
+ 2008-01-21  Roland McGrath  <roland@redhat.com>
+ 
++	* line2addr.c (main): Revert last change.
++
+ 	* testfile45.S.bz2: Add tests for cltq, cqto.
+ 	* testfile45.expect.bz2: Adjust.
+ 
+@@ -862,6 +864,11 @@
+ 	* Makefile.am (TESTS): Add run-elflint-test.sh.
+ 	(EXTRA_DIST): Add run-elflint-test.sh and testfile18.bz2.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-05-24  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* get-files.c (main): Use correct format specifier.
+Index: elfutils-0.148/tests/line2addr.c
+===================================================================
+--- elfutils-0.148.orig/tests/line2addr.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/tests/line2addr.c	2010-07-03 13:04:08.000000000 +0000
+@@ -132,7 +132,7 @@
+     {
+       struct args a = { .arg = argv[cnt] };
+ 
+-      switch (sscanf (a.arg, "%m[^:]:%d", &a.file, &a.line))
++      switch (sscanf (a.arg, "%a[^:]:%d", &a.file, &a.line))
+ 	{
+ 	default:
+ 	case 0:
+Index: elfutils-0.148/tests/Makefile.in
+===================================================================
+--- elfutils-0.148.orig/tests/Makefile.in	2010-06-28 19:07:34.000000000 +0000
++++ elfutils-0.148/tests/Makefile.in	2010-07-03 13:04:08.000000000 +0000
+@@ -372,6 +372,7 @@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -401,6 +402,7 @@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -462,7 +464,7 @@
+ INCLUDES = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. $(am__append_2)
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+ 	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+ 	$(am__append_1)
+ @MUDFLAP_FALSE@libmudflap = 
diff --git a/recipes/elfutils/elfutils-0.148/redhat-robustify.diff b/recipes/elfutils/elfutils-0.148/redhat-robustify.diff
new file mode 100644
index 0000000..cd39854
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/redhat-robustify.diff
@@ -0,0 +1,1709 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.148/libelf/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/libelf/ChangeLog	2010-07-03 13:07:10.000000000 +0000
++++ elfutils-0.148/libelf/ChangeLog	2010-07-03 13:07:11.000000000 +0000
+@@ -649,10 +649,53 @@
+ 	If section content hasn't been read yet, do it before looking for the
+ 	block size.  If no section data present, infer size of section header.
+ 
++2005-05-14  Jakub Jelinek  <jakub@redhat.com>
++
++	* libelfP.h (INVALID_NDX): Define.
++	* gelf_getdyn.c (gelf_getdyn): Use it.  Remove ndx < 0 test if any.
++	* gelf_getlib.c (gelf_getlib): Likewise.
++	* gelf_getmove.c (gelf_getmove): Likewise.
++	* gelf_getrel.c (gelf_getrel): Likewise.
++	* gelf_getrela.c (gelf_getrela): Likewise.
++	* gelf_getsym.c (gelf_getsym): Likewise.
++	* gelf_getsyminfo.c (gelf_getsyminfo): Likewise.
++	* gelf_getsymshndx.c (gelf_getsymshndx): Likewise.
++	* gelf_getversym.c (gelf_getversym): Likewise.
++	* gelf_update_dyn.c (gelf_update_dyn): Likewise.
++	* gelf_update_lib.c (gelf_update_lib): Likewise.
++	* gelf_update_move.c (gelf_update_move): Likewise.
++	* gelf_update_rel.c (gelf_update_rel): Likewise.
++	* gelf_update_rela.c (gelf_update_rela): Likewise.
++	* gelf_update_sym.c (gelf_update_sym): Likewise.
++	* gelf_update_syminfo.c (gelf_update_syminfo): Likewise.
++	* gelf_update_symshndx.c (gelf_update_symshndx): Likewise.
++	* gelf_update_versym.c (gelf_update_versym): Likewise.
++	* elf_newscn.c (elf_newscn): Check for overflow.
++	* elf32_updatefile.c (__elfw2(LIBELFBITS,updatemmap)): Likewise.
++	(__elfw2(LIBELFBITS,updatefile)): Likewise.
++	* elf_begin.c (file_read_elf): Likewise.
++	* elf32_newphdr.c (elfw2(LIBELFBITS,newphdr)): Likewise.
++	* elf_getarsym.c (elf_getarsym): Likewise.
++	* elf32_getshdr.c (elfw2(LIBELFBITS,getshdr)): Likewise.
+ 2005-05-11  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elf.h: Update again.
+ 
++2005-05-17  Jakub Jelinek  <jakub@redhat.com>
++
++	* elf32_getphdr.c (elfw2(LIBELFBITS,getphdr)): Check if program header
++	table fits into object's bounds.
++	* elf_getshstrndx.c (elf_getshstrndx): Add elf->start_offset to
++	elf->map_address.  Check if first section header fits into object's
++	bounds.
++	* elf32_getshdr.c (elfw2(LIBELFBITS,getshdr)):
++	Check if section header table fits into object's bounds.
++	* elf_begin.c (get_shnum): Ensure section headers fits into
++	object's bounds.
++	(file_read_elf): Make sure scncnt is small enough to allocate both
++	ElfXX_Shdr and Elf_Scn array.  Make sure section and program header
++	tables fit into object's bounds.  Avoid memory leak on failure.
++
+ 2005-05-09  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elf.h: Update from glibc.
+Index: elfutils-0.148/libelf/elf32_getphdr.c
+===================================================================
+--- elfutils-0.148.orig/libelf/elf32_getphdr.c	2010-04-21 14:26:40.000000000 +0000
++++ elfutils-0.148/libelf/elf32_getphdr.c	2010-07-03 13:07:11.000000000 +0000
+@@ -114,6 +114,16 @@
+ 
+       if (elf->map_address != NULL)
+ 	{
++	  /* First see whether the information in the ELF header is
++	     valid and it does not ask for too much.  */
++	  if (unlikely (ehdr->e_phoff >= elf->maximum_size)
++	      || unlikely (elf->maximum_size - ehdr->e_phoff < size))
++	    {
++	      /* Something is wrong.  */
++	      __libelf_seterrno (ELF_E_INVALID_PHDR);
++	      goto out;
++	    }
++
+ 	  /* All the data is already mapped.  Use it.  */
+ 	  void *file_phdr = ((char *) elf->map_address
+ 			     + elf->start_offset + ehdr->e_phoff);
+Index: elfutils-0.148/libelf/elf32_getshdr.c
+===================================================================
+--- elfutils-0.148.orig/libelf/elf32_getshdr.c	2009-06-13 22:41:42.000000000 +0000
++++ elfutils-0.148/libelf/elf32_getshdr.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Return section header.
+-   Copyright (C) 1998, 1999, 2000, 2001, 2002, 2005, 2007, 2009 Red Hat, Inc.
++   Copyright (C) 1998-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 1998.
+ 
+@@ -81,7 +81,8 @@
+     goto out;
+ 
+   size_t shnum;
+-  if (__elf_getshdrnum_rdlock (elf, &shnum) != 0)
++  if (__elf_getshdrnum_rdlock (elf, &shnum) != 0
++      || shnum > SIZE_MAX / sizeof (ElfW2(LIBELFBITS,Shdr)))
+     goto out;
+   size_t size = shnum * sizeof (ElfW2(LIBELFBITS,Shdr));
+ 
+@@ -98,6 +99,16 @@
+ 
+   if (elf->map_address != NULL)
+     {
++      /* First see whether the information in the ELF header is
++	 valid and it does not ask for too much.  */
++      if (unlikely (ehdr->e_shoff >= elf->maximum_size)
++	  || unlikely (elf->maximum_size - ehdr->e_shoff < size))
++	{
++	  /* Something is wrong.  */
++	  __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
++	  goto free_and_out;
++	}
++
+       ElfW2(LIBELFBITS,Shdr) *notcvt;
+ 
+       /* All the data is already mapped.  If we could use it
+Index: elfutils-0.148/libelf/elf32_newphdr.c
+===================================================================
+--- elfutils-0.148.orig/libelf/elf32_newphdr.c	2010-01-12 16:57:54.000000000 +0000
++++ elfutils-0.148/libelf/elf32_newphdr.c	2010-07-03 13:07:11.000000000 +0000
+@@ -135,6 +135,12 @@
+ 	   || count == PN_XNUM
+ 	   || elf->state.ELFW(elf,LIBELFBITS).phdr == NULL)
+     {
++      if (unlikely (count > SIZE_MAX / sizeof (ElfW2(LIBELFBITS,Phdr))))
++	{
++	  result = NULL;
++	  goto out;
++	}
++
+       /* Allocate a new program header with the appropriate number of
+ 	 elements.  */
+       result = (ElfW2(LIBELFBITS,Phdr) *)
+Index: elfutils-0.148/libelf/elf32_updatefile.c
+===================================================================
+--- elfutils-0.148.orig/libelf/elf32_updatefile.c	2010-01-12 16:57:54.000000000 +0000
++++ elfutils-0.148/libelf/elf32_updatefile.c	2010-07-03 13:07:11.000000000 +0000
+@@ -223,6 +223,9 @@
+   /* Write all the sections.  Well, only those which are modified.  */
+   if (shnum > 0)
+     {
++      if (unlikely (shnum > SIZE_MAX / sizeof (Elf_Scn *)))
++ 	return 1;
++
+       Elf_ScnList *list = &elf->state.ELFW(elf,LIBELFBITS).scns;
+       Elf_Scn **scns = (Elf_Scn **) alloca (shnum * sizeof (Elf_Scn *));
+       char *const shdr_start = ((char *) elf->map_address + elf->start_offset
+@@ -645,6 +648,10 @@
+   /* Write all the sections.  Well, only those which are modified.  */
+   if (shnum > 0)
+     {
++      if (unlikely (shnum > SIZE_MAX / (sizeof (Elf_Scn *)
++					+ sizeof (ElfW2(LIBELFBITS,Shdr)))))
++	return 1;
++
+       off_t shdr_offset = elf->start_offset + ehdr->e_shoff;
+ #if EV_NUM != 2
+       xfct_t shdr_fctp = __elf_xfctstom[__libelf_version - 1][EV_CURRENT - 1][ELFW(ELFCLASS, LIBELFBITS) - 1][ELF_T_SHDR];
+Index: elfutils-0.148/libelf/elf_begin.c
+===================================================================
+--- elfutils-0.148.orig/libelf/elf_begin.c	2010-04-21 14:26:40.000000000 +0000
++++ elfutils-0.148/libelf/elf_begin.c	2010-07-03 13:07:11.000000000 +0000
+@@ -165,7 +165,8 @@
+ 
+       if (unlikely (result == 0) && ehdr.e32->e_shoff != 0)
+ 	{
+-	  if (ehdr.e32->e_shoff + sizeof (Elf32_Shdr) > maxsize)
++	  if (unlikely (ehdr.e32->e_shoff >= maxsize)
++	      || unlikely (maxsize - ehdr.e32->e_shoff < sizeof (Elf32_Shdr)))
+ 	    /* Cannot read the first section header.  */
+ 	    return 0;
+ 
+@@ -213,7 +214,8 @@
+ 
+       if (unlikely (result == 0) && ehdr.e64->e_shoff != 0)
+ 	{
+-	  if (ehdr.e64->e_shoff + sizeof (Elf64_Shdr) > maxsize)
++	  if (unlikely (ehdr.e64->e_shoff >= maxsize)
++	      || unlikely (ehdr.e64->e_shoff + sizeof (Elf64_Shdr) > maxsize))
+ 	    /* Cannot read the first section header.  */
+ 	    return 0;
+ 
+@@ -285,6 +287,15 @@
+     /* Could not determine the number of sections.  */
+     return NULL;
+ 
++  /* Check for too many sections.  */
++  if (e_ident[EI_CLASS] == ELFCLASS32)
++    {
++      if (scncnt > SIZE_MAX / (sizeof (Elf_Scn) + sizeof (Elf32_Shdr)))
++	return NULL;
++    }
++  else if (scncnt > SIZE_MAX / (sizeof (Elf_Scn) + sizeof (Elf64_Shdr)))
++    return NULL;
++
+   /* We can now allocate the memory.  Even if there are no section headers,
+      we allocate space for a zeroth section in case we need it later.  */
+   const size_t scnmax = (scncnt ?: (cmd == ELF_C_RDWR || cmd == ELF_C_RDWR_MMAP)
+@@ -324,6 +335,16 @@
+ 	{
+ 	  /* We can use the mmapped memory.  */
+ 	  elf->state.elf32.ehdr = ehdr;
++
++	  if (unlikely (ehdr->e_shoff >= maxsize)
++	      || unlikely (maxsize - ehdr->e_shoff
++			   < scncnt * sizeof (Elf32_Shdr)))
++	    {
++	    free_and_out:
++	      free (elf);
++	      __libelf_seterrno (ELF_E_INVALID_FILE);
++	      return NULL;
++	    }
+ 	  elf->state.elf32.shdr
+ 	    = (Elf32_Shdr *) ((char *) ehdr + ehdr->e_shoff);
+ 
+@@ -410,6 +431,11 @@
+ 	{
+ 	  /* We can use the mmapped memory.  */
+ 	  elf->state.elf64.ehdr = ehdr;
++
++	  if (unlikely (ehdr->e_shoff >= maxsize)
++	      || unlikely (ehdr->e_shoff
++			   + scncnt * sizeof (Elf32_Shdr) > maxsize))
++	    goto free_and_out;
+ 	  elf->state.elf64.shdr
+ 	    = (Elf64_Shdr *) ((char *) ehdr + ehdr->e_shoff);
+ 
+Index: elfutils-0.148/libelf/elf_getarsym.c
+===================================================================
+--- elfutils-0.148.orig/libelf/elf_getarsym.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/elf_getarsym.c	2010-07-03 13:07:11.000000000 +0000
+@@ -179,6 +179,9 @@
+       size_t index_size = atol (tmpbuf);
+ 
+       if (SARMAG + sizeof (struct ar_hdr) + index_size > elf->maximum_size
++#if SIZE_MAX <= 4294967295U
++	  || n >= SIZE_MAX / sizeof (Elf_Arsym)
++#endif
+ 	  || n * sizeof (uint32_t) > index_size)
+ 	{
+ 	  /* This index table cannot be right since it does not fit into
+Index: elfutils-0.148/libelf/elf_getshdrstrndx.c
+===================================================================
+--- elfutils-0.148.orig/libelf/elf_getshdrstrndx.c	2009-06-13 22:31:35.000000000 +0000
++++ elfutils-0.148/libelf/elf_getshdrstrndx.c	2010-07-03 13:07:11.000000000 +0000
+@@ -125,10 +125,25 @@
+ 	      if (elf->map_address != NULL
+ 		  && elf->state.elf32.ehdr->e_ident[EI_DATA] == MY_ELFDATA
+ 		  && (ALLOW_UNALIGNED
+-		      || (((size_t) ((char *) elf->map_address + offset))
++		      || (((size_t) ((char *) elf->map_address
++			   + elf->start_offset + offset))
+ 			  & (__alignof__ (Elf32_Shdr) - 1)) == 0))
+-		/* We can directly access the memory.  */
+-		num = ((Elf32_Shdr *) (elf->map_address + offset))->sh_link;
++		{
++		  /* First see whether the information in the ELF header is
++		     valid and it does not ask for too much.  */
++		  if (unlikely (elf->maximum_size - offset
++				< sizeof (Elf32_Shdr)))
++		    {
++		      /* Something is wrong.  */
++		      __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
++		      result = -1;
++		      goto out;
++		    }
++
++		  /* We can directly access the memory.  */
++		  num = ((Elf32_Shdr *) (elf->map_address + elf->start_offset
++					 + offset))->sh_link;
++		}
+ 	      else
+ 		{
+ 		  /* We avoid reading in all the section headers.  Just read
+@@ -163,10 +178,25 @@
+ 	      if (elf->map_address != NULL
+ 		  && elf->state.elf64.ehdr->e_ident[EI_DATA] == MY_ELFDATA
+ 		  && (ALLOW_UNALIGNED
+-		      || (((size_t) ((char *) elf->map_address + offset))
++		      || (((size_t) ((char *) elf->map_address
++			   + elf->start_offset + offset))
+ 			  & (__alignof__ (Elf64_Shdr) - 1)) == 0))
+-		/* We can directly access the memory.  */
+-		num = ((Elf64_Shdr *) (elf->map_address + offset))->sh_link;
++		{
++		  /* First see whether the information in the ELF header is
++		     valid and it does not ask for too much.  */
++		  if (unlikely (elf->maximum_size - offset
++				< sizeof (Elf64_Shdr)))
++		    {
++		      /* Something is wrong.  */
++		      __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
++		      result = -1;
++		      goto out;
++		    }
++
++		  /* We can directly access the memory.  */
++		  num = ((Elf64_Shdr *) (elf->map_address + elf->start_offset
++					 + offset))->sh_link;
++		}
+ 	      else
+ 		{
+ 		  /* We avoid reading in all the section headers.  Just read
+Index: elfutils-0.148/libelf/elf_newscn.c
+===================================================================
+--- elfutils-0.148.orig/libelf/elf_newscn.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/elf_newscn.c	2010-07-03 13:07:11.000000000 +0000
+@@ -104,10 +104,18 @@
+   else
+     {
+       /* We must allocate a new element.  */
+-      Elf_ScnList *newp;
++      Elf_ScnList *newp = NULL;
+ 
+       assert (elf->state.elf.scnincr > 0);
+ 
++      if (
++#if SIZE_MAX <= 4294967295U
++	  likely (elf->state.elf.scnincr
++		  < SIZE_MAX / 2 / sizeof (Elf_Scn) - sizeof (Elf_ScnList))
++#else
++	  1
++#endif
++	  )
+       newp = (Elf_ScnList *) calloc (sizeof (Elf_ScnList)
+ 				     + ((elf->state.elf.scnincr *= 2)
+ 					* sizeof (Elf_Scn)), 1);
+Index: elfutils-0.148/libelf/gelf_getdyn.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_getdyn.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_getdyn.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get information from dynamic table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -93,7 +93,7 @@
+ 	 table entries has to be adopted.  The user better has provided
+ 	 a buffer where we can store the information.  While copying the
+ 	 data we are converting the format.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -114,7 +114,7 @@
+ 
+       /* The data is already in the correct form.  Just make sure the
+ 	 index is OK.  */
+-      if (unlikely ((ndx + 1) * sizeof (GElf_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, GElf_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.148/libelf/gelf_getlib.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_getlib.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_getlib.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get library from table at the given index.
+-   Copyright (C) 2004 Red Hat, Inc.
++   Copyright (C) 2004-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2004.
+ 
+@@ -86,7 +86,7 @@
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+   GElf_Lib *result = NULL;
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Lib) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Lib, data))
+     __libelf_seterrno (ELF_E_INVALID_INDEX);
+   else
+     {
+Index: elfutils-0.148/libelf/gelf_getmove.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_getmove.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_getmove.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get move structure at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -83,7 +83,7 @@
+ 
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Move) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Move, data))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       goto out;
+Index: elfutils-0.148/libelf/gelf_getrela.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_getrela.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_getrela.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get RELA relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -71,12 +71,6 @@
+   if (data_scn == NULL)
+     return NULL;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return NULL;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_RELA))
+     {
+       __libelf_seterrno (ELF_E_INVALID_HANDLE);
+@@ -93,7 +87,7 @@
+   if (scn->elf->class == ELFCLASS32)
+     {
+       /* We have to convert the data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+@@ -114,7 +108,7 @@
+     {
+       /* Simply copy the data after we made sure we are actually getting
+ 	 correct data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+Index: elfutils-0.148/libelf/gelf_getrel.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_getrel.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_getrel.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get REL relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -71,12 +71,6 @@
+   if (data_scn == NULL)
+     return NULL;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return NULL;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_REL))
+     {
+       __libelf_seterrno (ELF_E_INVALID_HANDLE);
+@@ -93,7 +87,7 @@
+   if (scn->elf->class == ELFCLASS32)
+     {
+       /* We have to convert the data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+@@ -113,7 +107,7 @@
+     {
+       /* Simply copy the data after we made sure we are actually getting
+ 	 correct data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+Index: elfutils-0.148/libelf/gelf_getsym.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_getsym.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_getsym.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get symbol information from symbol table at the given index.
+-   Copyright (C) 1999, 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 1999-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 1999.
+ 
+@@ -90,7 +90,7 @@
+ 	 table entries has to be adopted.  The user better has provided
+ 	 a buffer where we can store the information.  While copying the
+ 	 data we are converting the format.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > data->d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, data))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -119,7 +119,7 @@
+ 
+       /* The data is already in the correct form.  Just make sure the
+ 	 index is OK.  */
+-      if (unlikely ((ndx + 1) * sizeof (GElf_Sym) > data->d_size))
++      if (INVALID_NDX (ndx, GElf_Sym, data))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.148/libelf/gelf_getsyminfo.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_getsyminfo.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_getsyminfo.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get additional symbol information from symbol table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -84,7 +84,7 @@
+ 
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Syminfo) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Syminfo, data))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       goto out;
+Index: elfutils-0.148/libelf/gelf_getsymshndx.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_getsymshndx.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_getsymshndx.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,6 +1,6 @@
+ /* Get symbol information and separate section index from symbol table
+    at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -90,7 +90,7 @@
+      section index table.  */
+   if (likely (shndxdata_scn != NULL))
+     {
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Word) > shndxdata_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Word, &shndxdata_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -110,7 +110,7 @@
+ 	 table entries has to be adopted.  The user better has provided
+ 	 a buffer where we can store the information.  While copying the
+ 	 data we are converting the format.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > symdata->d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, symdata))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -139,7 +139,7 @@
+ 
+       /* The data is already in the correct form.  Just make sure the
+ 	 index is OK.  */
+-      if (unlikely ((ndx + 1) * sizeof (GElf_Sym) > symdata->d_size))
++      if (INVALID_NDX (ndx, GElf_Sym, symdata))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.148/libelf/gelf_getversym.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_getversym.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_getversym.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get symbol version information at the given index.
+-   Copyright (C) 1999, 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 1999-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 1999.
+ 
+@@ -92,7 +92,7 @@
+ 
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Versym) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Versym, data))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       result = NULL;
+Index: elfutils-0.148/libelf/gelf_update_dyn.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_update_dyn.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_update_dyn.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update information in dynamic table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -71,12 +71,6 @@
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_DYN))
+     {
+       /* The type of the data better should match.  */
+@@ -102,7 +96,7 @@
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -116,7 +110,7 @@
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.148/libelf/gelf_update_lib.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_update_lib.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_update_lib.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update library in table at the given index.
+-   Copyright (C) 2004 Red Hat, Inc.
++   Copyright (C) 2004-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2004.
+ 
+@@ -68,12 +68,6 @@
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   Elf_Data_Scn *data_scn = (Elf_Data_Scn *) data;
+   if (unlikely (data_scn->d.d_type != ELF_T_LIB))
+     {
+@@ -87,7 +81,7 @@
+ 
+   /* Check whether we have to resize the data buffer.  */
+   int result = 0;
+-  if (unlikely ((ndx + 1) * sizeof (Elf64_Lib) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, Elf64_Lib, &data_scn->d))
+     __libelf_seterrno (ELF_E_INVALID_INDEX);
+   else
+     {
+Index: elfutils-0.148/libelf/gelf_update_move.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_update_move.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_update_move.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update move structure at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -75,8 +75,7 @@
+   assert (sizeof (GElf_Move) == sizeof (Elf64_Move));
+ 
+   /* Check whether we have to resize the data buffer.  */
+-  if (unlikely (ndx < 0)
+-      || unlikely ((ndx + 1) * sizeof (GElf_Move) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, GElf_Move, &data_scn->d))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       return 0;
+Index: elfutils-0.148/libelf/gelf_update_rela.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_update_rela.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_update_rela.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update RELA relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -68,12 +68,6 @@
+   if (dst == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_RELA))
+     {
+       /* The type of the data better should match.  */
+@@ -101,7 +95,7 @@
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -117,7 +111,7 @@
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.148/libelf/gelf_update_rel.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_update_rel.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_update_rel.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update REL relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -68,12 +68,6 @@
+   if (dst == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_REL))
+     {
+       /* The type of the data better should match.  */
+@@ -99,7 +93,7 @@
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -114,7 +108,7 @@
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.148/libelf/gelf_update_sym.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_update_sym.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_update_sym.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update symbol information in symbol table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -72,12 +72,6 @@
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_SYM))
+     {
+       /* The type of the data better should match.  */
+@@ -102,7 +96,7 @@
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -125,7 +119,7 @@
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Sym) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Sym, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.148/libelf/gelf_update_syminfo.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_update_syminfo.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_update_syminfo.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update additional symbol information in symbol table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -72,12 +72,6 @@
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_SYMINFO))
+     {
+       /* The type of the data better should match.  */
+@@ -93,7 +87,7 @@
+   rwlock_wrlock (scn->elf->lock);
+ 
+   /* Check whether we have to resize the data buffer.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Syminfo) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, GElf_Syminfo, &data_scn->d))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       goto out;
+Index: elfutils-0.148/libelf/gelf_update_symshndx.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_update_symshndx.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_update_symshndx.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,6 +1,6 @@
+ /* Update symbol information and section index in symbol table at the
+    given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -77,12 +77,6 @@
+   if (symdata == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (symdata_scn->d.d_type != ELF_T_SYM))
+     {
+       /* The type of the data better should match.  */
+@@ -128,7 +122,7 @@
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > symdata_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, &symdata_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -151,7 +145,7 @@
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Sym) > symdata_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Sym, &symdata_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.148/libelf/gelf_update_versym.c
+===================================================================
+--- elfutils-0.148.orig/libelf/gelf_update_versym.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.148/libelf/gelf_update_versym.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update symbol version information.
+-   Copyright (C) 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2001-2009 Red Hat, Inc.
+    This file is part of Red Hat elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2001.
+ 
+@@ -75,8 +75,7 @@
+   assert (sizeof (GElf_Versym) == sizeof (Elf64_Versym));
+ 
+   /* Check whether we have to resize the data buffer.  */
+-  if (unlikely (ndx < 0)
+-      || unlikely ((ndx + 1) * sizeof (GElf_Versym) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, GElf_Versym, &data_scn->d))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       return 0;
+Index: elfutils-0.148/libelf/libelfP.h
+===================================================================
+--- elfutils-0.148.orig/libelf/libelfP.h	2010-01-12 16:57:54.000000000 +0000
++++ elfutils-0.148/libelf/libelfP.h	2010-07-03 13:07:11.000000000 +0000
+@@ -608,4 +608,8 @@
+ /* Align offset to 4 bytes as needed for note name and descriptor data.  */
+ #define NOTE_ALIGN(n)	(((n) + 3) & -4U)
+ 
++/* Convenience macro.  */
++#define INVALID_NDX(ndx, type, data) \
++  unlikely ((data)->d_size / sizeof (type) <= (unsigned int) (ndx))
++
+ #endif  /* libelfP.h */
+Index: elfutils-0.148/src/ChangeLog
+===================================================================
+--- elfutils-0.148.orig/src/ChangeLog	2010-07-03 13:07:10.000000000 +0000
++++ elfutils-0.148/src/ChangeLog	2010-07-03 13:07:11.000000000 +0000
+@@ -1640,6 +1640,16 @@
+ 	object symbols or symbols with unknown type.
+ 	(check_rel): Likewise.
+ 
++2005-06-09  Roland McGrath  <roland@redhat.com>
++
++	* readelf.c (handle_dynamic, handle_symtab): Check for bogus sh_link.
++	(handle_verneed, handle_verdef, handle_versym, handle_hash): Likewise.
++	(handle_scngrp): Check for bogus sh_info.
++
++	* strip.c (handle_elf): Check for bogus values in sh_link, sh_info,
++	st_shndx, e_shstrndx, and SHT_GROUP or SHT_SYMTAB_SHNDX data.
++	Don't use assert on input values, instead bail with "illformed" error.
++
+ 2005-06-08  Roland McGrath  <roland@redhat.com>
+ 
+ 	* readelf.c (print_ops): Add consts.
+@@ -1690,6 +1700,19 @@
+ 
+ 	* readelf.c (dwarf_tag_string): Add new tags.
+ 
++2005-05-17  Jakub Jelinek  <jakub@redhat.com>
++
++	* elflint.c (check_hash): Don't check entries beyond end of section.
++	(check_note): Don't crash if gelf_rawchunk fails.
++	(section_name): Return <invalid> if gelf_getshdr returns NULL.
++
++2005-05-14  Jakub Jelinek  <jakub@redhat.com>
++
++	* elflint.c (section_name): Return "<invalid>" instead of
++	crashing on invalid section name.
++	(check_symtab, is_rel_dyn, check_rela, check_rel, check_dynamic,
++	check_symtab_shndx, check_hash, check_versym): Robustify.
++
+ 2005-05-08  Roland McGrath  <roland@redhat.com>
+ 
+ 	* strip.c (handle_elf): Don't translate hash and versym data formats,
+Index: elfutils-0.148/src/elflint.c
+===================================================================
+--- elfutils-0.148.orig/src/elflint.c	2010-04-13 20:08:02.000000000 +0000
++++ elfutils-0.148/src/elflint.c	2010-07-03 13:07:11.000000000 +0000
+@@ -131,6 +131,10 @@
+ /* Array to count references in section groups.  */
+ static int *scnref;
+ 
++/* Numbers of sections and program headers.  */
++static unsigned int shnum;
++static unsigned int phnum;
++
+ 
+ int
+ main (int argc, char *argv[])
+@@ -319,10 +323,19 @@
+ {
+   GElf_Shdr shdr_mem;
+   GElf_Shdr *shdr;
++  const char *ret;
++
++  if ((unsigned int) idx > shnum)
++    return "<invalid>";
+ 
+   shdr = gelf_getshdr (elf_getscn (ebl->elf, idx), &shdr_mem);
++  if (shdr == NULL)
++    return "<invalid>";
+ 
+-  return elf_strptr (ebl->elf, shstrndx, shdr->sh_name);
++  ret = elf_strptr (ebl->elf, shstrndx, shdr->sh_name);
++  if (ret == NULL)
++    return "<invalid>";
++  return ret;
+ }
+ 
+ 
+@@ -344,11 +357,6 @@
+   (sizeof (valid_e_machine) / sizeof (valid_e_machine[0]))
+ 
+ 
+-/* Numbers of sections and program headers.  */
+-static unsigned int shnum;
+-static unsigned int phnum;
+-
+-
+ static void
+ check_elf_header (Ebl *ebl, GElf_Ehdr *ehdr, size_t size)
+ {
+@@ -632,7 +640,8 @@
+ 	  }
+       }
+ 
+-  if (shdr->sh_entsize != gelf_fsize (ebl->elf, ELF_T_SYM, 1, EV_CURRENT))
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_SYM, 1, EV_CURRENT);
++  if (shdr->sh_entsize != sh_entsize)
+     ERROR (gettext ("\
+ section [%2u] '%s': entry size is does not match ElfXX_Sym\n"),
+ 	   idx, section_name (ebl, idx));
+@@ -670,7 +679,7 @@
+ 	       xndxscnidx, section_name (ebl, xndxscnidx));
+     }
+ 
+-  for (size_t cnt = 1; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  for (size_t cnt = 1; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       sym = gelf_getsymshndx (data, xndxdata, cnt, &sym_mem, &xndx);
+       if (sym == NULL)
+@@ -690,7 +699,8 @@
+       else
+ 	{
+ 	  name = elf_strptr (ebl->elf, shdr->sh_link, sym->st_name);
+-	  assert (name != NULL);
++	  assert (name != NULL
++		  || strshdr->sh_type != SHT_STRTAB);
+ 	}
+ 
+       if (sym->st_shndx == SHN_XINDEX)
+@@ -1038,9 +1048,11 @@
+     {
+       GElf_Shdr rcshdr_mem;
+       const GElf_Shdr *rcshdr = gelf_getshdr (scn, &rcshdr_mem);
+-      assert (rcshdr != NULL);
+ 
+-      if (rcshdr->sh_type == SHT_DYNAMIC)
++      if (rcshdr == NULL)
++	break;
++
++      if (rcshdr->sh_type == SHT_DYNAMIC && rcshdr->sh_entsize)
+ 	{
+ 	  /* Found the dynamic section.  Look through it.  */
+ 	  Elf_Data *d = elf_getdata (scn, NULL);
+@@ -1050,7 +1062,9 @@
+ 	    {
+ 	      GElf_Dyn dyn_mem;
+ 	      GElf_Dyn *dyn = gelf_getdyn (d, cnt, &dyn_mem);
+-	      assert (dyn != NULL);
++
++	      if (dyn == NULL)
++		break;
+ 
+ 	      if (dyn->d_tag == DT_RELCOUNT)
+ 		{
+@@ -1064,7 +1078,9 @@
+ 		      /* Does the number specified number of relative
+ 			 relocations exceed the total number of
+ 			 relocations?  */
+-		      if (dyn->d_un.d_val > shdr->sh_size / shdr->sh_entsize)
++		      if (shdr->sh_entsize != 0
++			  && dyn->d_un.d_val > (shdr->sh_size
++						/ shdr->sh_entsize))
+ 			ERROR (gettext ("\
+ section [%2d] '%s': DT_RELCOUNT value %d too high for this section\n"),
+ 			       idx, section_name (ebl, idx),
+@@ -1224,7 +1240,8 @@
+ 	}
+     }
+ 
+-  if (shdr->sh_entsize != gelf_fsize (ebl->elf, reltype, 1, EV_CURRENT))
++  size_t sh_entsize = gelf_fsize (ebl->elf, reltype, 1, EV_CURRENT);
++  if (shdr->sh_entsize != sh_entsize)
+     ERROR (gettext (reltype == ELF_T_RELA ? "\
+ section [%2d] '%s': section entry size does not match ElfXX_Rela\n" : "\
+ section [%2d] '%s': section entry size does not match ElfXX_Rel\n"),
+@@ -1447,7 +1464,8 @@
+   Elf_Data *symdata = elf_getdata (symscn, NULL);
+   enum load_state state = state_undecided;
+ 
+-  for (size_t cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_RELA, 1, EV_CURRENT);
++  for (size_t cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Rela rela_mem;
+       GElf_Rela *rela = gelf_getrela (data, cnt, &rela_mem);
+@@ -1497,7 +1515,8 @@
+   Elf_Data *symdata = elf_getdata (symscn, NULL);
+   enum load_state state = state_undecided;
+ 
+-  for (size_t cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_REL, 1, EV_CURRENT);
++  for (size_t cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Rel rel_mem;
+       GElf_Rel *rel = gelf_getrel (data, cnt, &rel_mem);
+@@ -1600,7 +1619,8 @@
+ 	   shdr->sh_link, section_name (ebl, shdr->sh_link),
+ 	   idx, section_name (ebl, idx));
+ 
+-  if (shdr->sh_entsize != gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT))
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT);
++  if (shdr->sh_entsize != sh_entsize)
+     ERROR (gettext ("\
+ section [%2d] '%s': section entry size does not match ElfXX_Dyn\n"),
+ 	   idx, section_name (ebl, idx));
+@@ -1610,7 +1630,7 @@
+ 	   idx, section_name (ebl, idx));
+ 
+   bool non_null_warned = false;
+-  for (cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  for (cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Dyn dyn_mem;
+       GElf_Dyn *dyn = gelf_getdyn (data, cnt, &dyn_mem);
+@@ -1891,6 +1911,8 @@
+ 	   idx, section_name (ebl, idx));
+ 
+   if (symshdr != NULL
++      && shdr->sh_entsize
++      && symshdr->sh_entsize
+       && (shdr->sh_size / shdr->sh_entsize
+ 	  < symshdr->sh_size / symshdr->sh_entsize))
+     ERROR (gettext ("\
+@@ -1917,6 +1939,12 @@
+     }
+ 
+   Elf_Data *data = elf_getdata (elf_getscn (ebl->elf, idx), NULL);
++  if (data == NULL)
++    {
++      ERROR (gettext ("section [%2d] '%s': cannot get section data\n"),
++ 	     idx, section_name (ebl, idx));
++      return;
++    }
+ 
+   if (*((Elf32_Word *) data->d_buf) != 0)
+     ERROR (gettext ("symbol 0 should have zero extended section index\n"));
+@@ -1959,7 +1987,7 @@
+ 
+   size_t maxidx = nchain;
+ 
+-  if (symshdr != NULL)
++  if (symshdr != NULL && symshdr->sh_entsize != 0)
+     {
+       size_t symsize = symshdr->sh_size / symshdr->sh_entsize;
+ 
+@@ -1970,18 +1998,28 @@
+       maxidx = symsize;
+     }
+ 
++  Elf32_Word *buf = (Elf32_Word *) data->d_buf;
++  Elf32_Word *end = (Elf32_Word *) ((char *) data->d_buf + shdr->sh_size);
+   size_t cnt;
+   for (cnt = 2; cnt < 2 + nbucket; ++cnt)
+-    if (((Elf32_Word *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash bucket reference %zu out of bounds\n"),
+ 	     idx, section_name (ebl, idx), cnt - 2);
++    }
+ 
+   for (; cnt < 2 + nbucket + nchain; ++cnt)
+-    if (((Elf32_Word *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash chain reference %zu out of bounds\n"),
+ 	     idx, section_name (ebl, idx), cnt - 2 - nbucket);
++    }
+ }
+ 
+ 
+@@ -2011,18 +2049,28 @@
+       maxidx = symsize;
+     }
+ 
++  Elf64_Xword *buf = (Elf64_Xword *) data->d_buf;
++  Elf64_Xword *end = (Elf64_Xword *) ((char *) data->d_buf + shdr->sh_size);
+   size_t cnt;
+   for (cnt = 2; cnt < 2 + nbucket; ++cnt)
+-    if (((Elf64_Xword *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash bucket reference %zu out of bounds\n"),
+ 	     idx, section_name (ebl, idx), cnt - 2);
++    }
+ 
+   for (; cnt < 2 + nbucket + nchain; ++cnt)
+-    if (((Elf64_Xword *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash chain reference %" PRIu64 " out of bounds\n"),
+-	     idx, section_name (ebl, idx), (uint64_t) (cnt - 2 - nbucket));
++	       idx, section_name (ebl, idx), (uint64_t) cnt - 2 - nbucket);
++    }
+ }
+ 
+ 
+@@ -2047,7 +2095,7 @@
+   if (shdr->sh_size < (4 + bitmask_words + nbuckets) * sizeof (Elf32_Word))
+     {
+       ERROR (gettext ("\
+-section [%2d] '%s': hash table section is too small (is %ld, expected at least%ld)\n"),
++section [%2d] '%s': hash table section is too small (is %ld, expected at least %ld)\n"),
+ 	     idx, section_name (ebl, idx), (long int) shdr->sh_size,
+ 	     (long int) ((4 + bitmask_words + nbuckets) * sizeof (Elf32_Word)));
+       return;
+@@ -2719,8 +2767,9 @@
+ 
+   /* The number of elements in the version symbol table must be the
+      same as the number of symbols.  */
+-  if (shdr->sh_size / shdr->sh_entsize
+-      != symshdr->sh_size / symshdr->sh_entsize)
++  if (shdr->sh_entsize && symshdr->sh_entsize
++      && (shdr->sh_size / shdr->sh_entsize
++	  != symshdr->sh_size / symshdr->sh_entsize))
+     ERROR (gettext ("\
+ section [%2d] '%s' has different number of entries than symbol table [%2d] '%s'\n"),
+ 	   idx, section_name (ebl, idx),
+Index: elfutils-0.148/src/readelf.c
+===================================================================
+--- elfutils-0.148.orig/src/readelf.c	2010-07-03 13:07:10.000000000 +0000
++++ elfutils-0.148/src/readelf.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1172,6 +1172,8 @@
+   Elf32_Word *grpref = (Elf32_Word *) data->d_buf;
+ 
+   GElf_Sym sym_mem;
++  GElf_Sym *sym = gelf_getsym (symdata, shdr->sh_info, &sym_mem);
++
+   printf ((grpref[0] & GRP_COMDAT)
+ 	  ? ngettext ("\
+ \nCOMDAT section group [%2zu] '%s' with signature '%s' contains %zu entry:\n",
+@@ -1184,8 +1186,8 @@
+ 		      data->d_size / sizeof (Elf32_Word) - 1),
+ 	  elf_ndxscn (scn),
+ 	  elf_strptr (ebl->elf, shstrndx, shdr->sh_name),
+-	  elf_strptr (ebl->elf, symshdr->sh_link,
+-		      gelf_getsym (symdata, shdr->sh_info, &sym_mem)->st_name)
++	  (sym == NULL ? NULL
++	   : elf_strptr (ebl->elf, symshdr->sh_link, sym->st_name))
+ 	  ?: gettext ("<INVALID SYMBOL>"),
+ 	  data->d_size / sizeof (Elf32_Word) - 1);
+ 
+@@ -1336,7 +1338,8 @@
+ handle_dynamic (Ebl *ebl, Elf_Scn *scn, GElf_Shdr *shdr)
+ {
+   int class = gelf_getclass (ebl->elf);
+-  GElf_Shdr glink;
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink;
+   Elf_Data *data;
+   size_t cnt;
+   size_t shstrndx;
+@@ -1351,6 +1354,11 @@
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
++  glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link), &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   printf (ngettext ("\
+ \nDynamic segment contains %lu entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+@@ -1360,9 +1368,7 @@
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+   fputs_unlocked (gettext ("  Type              Value\n"), stdout);
+ 
+   for (cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
+@@ -1945,6 +1951,13 @@
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   /* Now we can compute the number of entries in the section.  */
+   unsigned int nsyms = data->d_size / (class == ELFCLASS32
+ 				       ? sizeof (Elf32_Sym)
+@@ -1955,15 +1968,12 @@
+ 		    nsyms),
+ 	  (unsigned int) elf_ndxscn (scn),
+ 	  elf_strptr (ebl->elf, shstrndx, shdr->sh_name), nsyms);
+-  GElf_Shdr glink;
+   printf (ngettext (" %lu local symbol  String table: [%2u] '%s'\n",
+ 		    " %lu local symbols  String table: [%2u] '%s'\n",
+ 		    shdr->sh_info),
+ 	  (unsigned long int) shdr->sh_info,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   fputs_unlocked (class == ELFCLASS32
+ 		  ? gettext ("\
+@@ -2199,7 +2209,13 @@
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
+-  GElf_Shdr glink;
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   printf (ngettext ("\
+ \nVersion needs section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+@@ -2210,9 +2226,7 @@
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   unsigned int offset = 0;
+   for (int cnt = shdr->sh_info; --cnt >= 0; )
+@@ -2265,8 +2279,14 @@
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   int class = gelf_getclass (ebl->elf);
+-  GElf_Shdr glink;
+   printf (ngettext ("\
+ \nVersion definition section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+@@ -2278,9 +2298,7 @@
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   unsigned int offset = 0;
+   for (int cnt = shdr->sh_info; --cnt >= 0; )
+@@ -2542,8 +2560,14 @@
+       filename = NULL;
+     }
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   /* Print the header.  */
+-  GElf_Shdr glink;
+   printf (ngettext ("\
+ \nVersion symbols section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'",
+ 		    "\
+@@ -2555,9 +2579,7 @@
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   /* Now we can finally look at the actual contents of this section.  */
+   for (unsigned int cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
+@@ -2609,7 +2631,17 @@
+   for (Elf32_Word cnt = 0; cnt < nbucket; ++cnt)
+     ++counts[lengths[cnt]];
+ 
+-  GElf_Shdr glink;
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf,
++					       shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    {
++      error (0, 0, gettext ("invalid sh_link value in section %Zu"),
++	     elf_ndxscn (scn));
++      return;
++    }
++
+   printf (ngettext ("\
+ \nHistogram for bucket list length in section [%2u] '%s' (total of %d bucket):\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+@@ -2622,9 +2654,7 @@
+ 	  shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   if (extrastr != NULL)
+     fputs (extrastr, stdout);
+@@ -4312,6 +4342,16 @@
+       return;
+     }
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink;
++  glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link), &glink_mem);
++  if (glink == NULL)
++    {
++      error (0, 0, gettext ("invalid sh_link value in section %Zu"),
++	     elf_ndxscn (scn));
++      return;
++    }
++
+   printf (ngettext ("\
+ \nDWARF section [%2zu] '%s' at offset %#" PRIx64 " contains %zu entry:\n",
+ 		    "\
+Index: elfutils-0.148/src/strip.c
+===================================================================
+--- elfutils-0.148.orig/src/strip.c	2010-07-03 13:07:10.000000000 +0000
++++ elfutils-0.148/src/strip.c	2010-07-03 13:07:11.000000000 +0000
+@@ -561,6 +561,11 @@
+       goto fail_close;
+     }
+ 
++  if (shstrndx >= shnum)
++    goto illformed;
++
++#define elf_assert(test) do { if (!(test)) goto illformed; } while (0)
++
+   /* Storage for section information.  We leave room for two more
+      entries since we unconditionally create a section header string
+      table.  Maybe some weird tool created an ELF file without one.
+@@ -582,7 +587,7 @@
+     {
+       /* This should always be true (i.e., there should not be any
+ 	 holes in the numbering).  */
+-      assert (elf_ndxscn (scn) == cnt);
++      elf_assert (elf_ndxscn (scn) == cnt);
+ 
+       shdr_info[cnt].scn = scn;
+ 
+@@ -595,6 +600,7 @@
+ 					shdr_info[cnt].shdr.sh_name);
+       if (shdr_info[cnt].name == NULL)
+ 	{
++	illformed:
+ 	  error (0, 0, gettext ("illformed file '%s'"), fname);
+ 	  goto fail_close;
+ 	}
+@@ -604,6 +610,8 @@
+ 
+       /* Remember the shdr.sh_link value.  */
+       shdr_info[cnt].old_sh_link = shdr_info[cnt].shdr.sh_link;
++      if (shdr_info[cnt].old_sh_link >= shnum)
++	goto illformed;
+ 
+       /* Sections in files other than relocatable object files which
+ 	 are not loaded can be freely moved by us.  In relocatable
+@@ -616,7 +624,7 @@
+ 	 appropriate reference.  */
+       if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB_SHNDX))
+ 	{
+-	  assert (shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx == 0);
++	  elf_assert (shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx == 0);
+ 	  shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx = cnt;
+ 	}
+       else if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_GROUP))
+@@ -633,7 +641,12 @@
+ 	  for (inner = 1;
+ 	       inner < shdr_info[cnt].data->d_size / sizeof (Elf32_Word);
+ 	       ++inner)
++	    {
++	      if (grpref[inner] < shnum)
+ 	    shdr_info[grpref[inner]].group_idx = cnt;
++	      else
++		goto illformed;
++	    }
+ 
+ 	  if (inner == 1 || (inner == 2 && (grpref[0] & GRP_COMDAT) == 0))
+ 	    /* If the section group contains only one element and this
+@@ -644,7 +657,7 @@
+ 	}
+       else if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_GNU_versym))
+ 	{
+-	  assert (shdr_info[shdr_info[cnt].shdr.sh_link].version_idx == 0);
++	  elf_assert (shdr_info[shdr_info[cnt].shdr.sh_link].version_idx == 0);
+ 	  shdr_info[shdr_info[cnt].shdr.sh_link].version_idx = cnt;
+ 	}
+ 
+@@ -652,7 +665,7 @@
+ 	 discarded right away.  */
+       if ((shdr_info[cnt].shdr.sh_flags & SHF_GROUP) != 0)
+ 	{
+-	  assert (shdr_info[cnt].group_idx != 0);
++	  elf_assert (shdr_info[cnt].group_idx != 0);
+ 
+ 	  if (shdr_info[shdr_info[cnt].group_idx].idx == 0)
+ 	    {
+@@ -727,11 +740,15 @@
+ 	    {
+ 	      /* If a relocation section is marked as being removed make
+ 		 sure the section it is relocating is removed, too.  */
+-	      if ((shdr_info[cnt].shdr.sh_type == SHT_REL
++	      if (shdr_info[cnt].shdr.sh_type == SHT_REL
+ 		   || shdr_info[cnt].shdr.sh_type == SHT_RELA)
+-		  && shdr_info[shdr_info[cnt].shdr.sh_info].idx != 0)
++		{
++		  if (shdr_info[cnt].shdr.sh_info >= shnum)
++		    goto illformed;
++		  else if (shdr_info[shdr_info[cnt].shdr.sh_info].idx != 0)
+ 		shdr_info[cnt].idx = 1;
+ 	    }
++	    }
+ 
+ 	  if (shdr_info[cnt].idx == 1)
+ 	    {
+@@ -758,7 +775,7 @@
+ 		  if (shdr_info[cnt].symtab_idx != 0
+ 		      && shdr_info[shdr_info[cnt].symtab_idx].data == NULL)
+ 		    {
+-		      assert (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB);
++		      elf_assert (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB);
+ 
+ 		      shdr_info[shdr_info[cnt].symtab_idx].data
+ 			= elf_getdata (shdr_info[shdr_info[cnt].symtab_idx].scn,
+@@ -798,6 +815,9 @@
+ 		      else if (scnidx == SHN_XINDEX)
+ 			scnidx = xndx;
+ 
++		      if (scnidx >= shnum)
++			goto illformed;
++
+ 		      if (shdr_info[scnidx].idx == 0)
+ 			/* This symbol table has a real symbol in
+ 			   a discarded section.  So preserve the
+@@ -828,12 +848,16 @@
+ 		}
+ 
+ 	      /* Handle references through sh_info.  */
+-	      if (SH_INFO_LINK_P (&shdr_info[cnt].shdr)
+-		  && shdr_info[shdr_info[cnt].shdr.sh_info].idx == 0)
++	      if (SH_INFO_LINK_P (&shdr_info[cnt].shdr))
++		{
++		  if (shdr_info[cnt].shdr.sh_info >= shnum)
++		    goto illformed;
++		  else if ( shdr_info[shdr_info[cnt].shdr.sh_info].idx == 0)
+ 		{
+ 		  shdr_info[shdr_info[cnt].shdr.sh_info].idx = 1;
+ 		  changes |= shdr_info[cnt].shdr.sh_info < cnt;
+ 		}
++		}
+ 
+ 	      /* Mark the section as investigated.  */
+ 	      shdr_info[cnt].idx = 2;
+@@ -972,7 +996,7 @@
+ 	  error (EXIT_FAILURE, 0, gettext ("while generating output file: %s"),
+ 		 elf_errmsg (-1));
+ 
+-	assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
++	elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
+ 
+ 	/* Add this name to the section header string table.  */
+ 	shdr_info[cnt].se = ebl_strtabadd (shst, shdr_info[cnt].name, 0);
+@@ -1009,7 +1033,7 @@
+ 	error (EXIT_FAILURE, 0,
+ 	       gettext ("while create section header section: %s"),
+ 	       elf_errmsg (-1));
+-      assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
++      elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
+ 
+       shdr_info[cnt].data = elf_newdata (shdr_info[cnt].newscn);
+       if (shdr_info[cnt].data == NULL)
+@@ -1065,7 +1089,7 @@
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("while create section header section: %s"),
+ 	   elf_errmsg (-1));
+-  assert (elf_ndxscn (shdr_info[cnt].newscn) == idx);
++  elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == idx);
+ 
+   /* Finalize the string table and fill in the correct indices in the
+      section headers.  */
+@@ -1155,20 +1179,20 @@
+ 		    shndxdata = elf_getdata (shdr_info[shdr_info[cnt].symtab_idx].scn,
+ 					     NULL);
+ 
+-		    assert ((versiondata->d_size / sizeof (Elf32_Word))
++		    elf_assert ((versiondata->d_size / sizeof (Elf32_Word))
+ 			    >= shdr_info[cnt].data->d_size / elsize);
+ 		  }
+ 
+ 		if (shdr_info[cnt].version_idx != 0)
+ 		  {
+-		    assert (shdr_info[cnt].shdr.sh_type == SHT_DYNSYM);
++		    elf_assert (shdr_info[cnt].shdr.sh_type == SHT_DYNSYM);
+ 		    /* This section has associated version
+ 		       information.  We have to modify that
+ 		       information, too.  */
+ 		    versiondata = elf_getdata (shdr_info[shdr_info[cnt].version_idx].scn,
+ 					       NULL);
+ 
+-		    assert ((versiondata->d_size / sizeof (GElf_Versym))
++		    elf_assert ((versiondata->d_size / sizeof (GElf_Versym))
+ 			    >= shdr_info[cnt].data->d_size / elsize);
+ 		  }
+ 
+@@ -1223,7 +1247,7 @@
+ 		      sec = shdr_info[sym->st_shndx].idx;
+ 		    else
+ 		      {
+-			assert (shndxdata != NULL);
++			elf_assert (shndxdata != NULL);
+ 
+ 			sec = shdr_info[xshndx].idx;
+ 		      }
+@@ -1244,7 +1268,7 @@
+ 			    nxshndx = sec;
+ 			  }
+ 
+-			assert (sec < SHN_LORESERVE || shndxdata != NULL);
++			elf_assert (sec < SHN_LORESERVE || shndxdata != NULL);
+ 
+ 			if ((inner != destidx || nshndx != sym->st_shndx
+ 			     || (shndxdata != NULL && nxshndx != xshndx))
+@@ -1268,7 +1292,7 @@
+ 			     || shdr_info[cnt].debug_data == NULL)
+ 		      /* This is a section symbol for a section which has
+ 			 been removed.  */
+-		      assert (GELF_ST_TYPE (sym->st_info) == STT_SECTION);
++		      elf_assert (GELF_ST_TYPE (sym->st_info) == STT_SECTION);
+ 		  }
+ 
+ 		if (destidx != inner)
+@@ -1455,11 +1479,11 @@
+ 		  {
+ 		    GElf_Sym sym_mem;
+ 		    GElf_Sym *sym = gelf_getsym (symd, inner, &sym_mem);
+-		    assert (sym != NULL);
++		    elf_assert (sym != NULL);
+ 
+ 		    const char *name = elf_strptr (elf, strshndx,
+ 						   sym->st_name);
+-		    assert (name != NULL);
++		    elf_assert (name != NULL);
+ 		    size_t hidx = elf_hash (name) % nbucket;
+ 
+ 		    if (bucket[hidx] == 0)
+@@ -1478,7 +1502,7 @@
+ 	    else
+ 	      {
+ 		/* Alpha and S390 64-bit use 64-bit SHT_HASH entries.  */
+-		assert (shdr_info[cnt].shdr.sh_entsize
++		elf_assert (shdr_info[cnt].shdr.sh_entsize
+ 			== sizeof (Elf64_Xword));
+ 
+ 		Elf64_Xword *bucket = (Elf64_Xword *) hashd->d_buf;
+@@ -1509,11 +1533,11 @@
+ 		  {
+ 		    GElf_Sym sym_mem;
+ 		    GElf_Sym *sym = gelf_getsym (symd, inner, &sym_mem);
+-		    assert (sym != NULL);
++		    elf_assert (sym != NULL);
+ 
+ 		    const char *name = elf_strptr (elf, strshndx,
+ 						   sym->st_name);
+-		    assert (name != NULL);
++		    elf_assert (name != NULL);
+ 		    size_t hidx = elf_hash (name) % nbucket;
+ 
+ 		    if (bucket[hidx] == 0)
diff --git a/recipes/elfutils/elfutils-0.148/remove-unused.patch b/recipes/elfutils/elfutils-0.148/remove-unused.patch
new file mode 100644
index 0000000..6a19791
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/remove-unused.patch
@@ -0,0 +1,154 @@
+Upstream-Status: Backport
+
+Remove unused variables from the code to prevent -Werror causing a build
+failure on hosts with GCC 4.6.
+
+These changes are all upstream so should not be required once we've updated
+to elfutils 0.152 or later. Therefore this patch consolidates several
+changes from elfutils upstream by Roland McGrath into a single file so that
+it's easier to remove later once we upgrade.
+Links to upstream gitweb of the consolidated commits follow:
+- http://git.fedorahosted.org/git?p=elfutils.git;a=commit;h=7094d00a169afb27e0323f8580e817798ae7c240
+- http://git.fedorahosted.org/git?p=elfutils.git;a=commit;h=fd992543185126eb0280c1ee0883e073020499b4
+- http://git.fedorahosted.org/git?p=elfutils.git;a=commit;h=4db89f04bb59327abd7a3b60e88f2e7e73c65c79
+- http://git.fedorahosted.org/git?p=elfutils.git;a=commit;h=8f6c1795ab9d41f03805eebd55767070ade55aac
+- http://git.fedorahosted.org/git?p=elfutils.git;a=commit;h=240784b48aa276822c5a61c9ad6a4355051ce259
+
+Joshua Lock <josh@linux.intel.com> - 06/04/11
+
+Index: elfutils-0.148/libasm/asm_newscn.c
+===================================================================
+--- elfutils-0.148.orig/libasm/asm_newscn.c
++++ elfutils-0.148/libasm/asm_newscn.c
+@@ -162,7 +162,6 @@ asm_newscn (ctx, scnname, type, flags)
+      GElf_Xword flags;
+ {
+   size_t scnname_len = strlen (scnname) + 1;
+-  unsigned long int hval;
+   AsmScn_t *result;
+ 
+   /* If no context is given there might be an earlier error.  */
+@@ -180,8 +179,6 @@ asm_newscn (ctx, scnname, type, flags)
+       return NULL;
+     }
+ 
+-  hval = elf_hash (scnname);
+-
+   rwlock_wrlock (ctx->lock);
+ 
+   /* This is a new section.  */
+Index: elfutils-0.148/src/elflint.c
+===================================================================
+--- elfutils-0.148.orig/src/elflint.c
++++ elfutils-0.148/src/elflint.c
+@@ -707,9 +707,10 @@ section [%2d] '%s': symbol %zu: invalid 
+ 	{
+ 	  if (xndxdata == NULL)
+ 	    {
+-	      ERROR (gettext ("\
++	      if (!no_xndx_warned)
++		ERROR (gettext ("\
+ section [%2d] '%s': symbol %zu: too large section index but no extended section index section\n"),
+-		     idx, section_name (ebl, idx), cnt);
++		       idx, section_name (ebl, idx), cnt);
+ 	      no_xndx_warned = true;
+ 	    }
+ 	  else if (xndx < SHN_LORESERVE)
+@@ -1592,10 +1593,6 @@ check_dynamic (Ebl *ebl, GElf_Ehdr *ehdr
+       [DT_STRSZ] = true,
+       [DT_SYMENT] = true
+     };
+-  GElf_Addr reladdr = 0;
+-  GElf_Word relsz = 0;
+-  GElf_Addr pltreladdr = 0;
+-  GElf_Word pltrelsz = 0;
+ 
+   memset (has_dt, '\0', sizeof (has_dt));
+   memset (has_val_dt, '\0', sizeof (has_val_dt));
+@@ -1694,15 +1691,6 @@ section [%2d] '%s': entry %zu: level 2 t
+ section [%2d] '%s': entry %zu: DT_PLTREL value must be DT_REL or DT_RELA\n"),
+ 	       idx, section_name (ebl, idx), cnt);
+ 
+-      if (dyn->d_tag == DT_REL)
+-	reladdr = dyn->d_un.d_ptr;
+-      if (dyn->d_tag == DT_RELSZ)
+-	relsz = dyn->d_un.d_val;
+-      if (dyn->d_tag == DT_JMPREL)
+-	pltreladdr = dyn->d_un.d_ptr;
+-      if (dyn->d_tag == DT_PLTRELSZ)
+-	pltrelsz = dyn->d_un.d_val;
+-
+       /* Check that addresses for entries are in loaded segments.  */
+       switch (dyn->d_tag)
+ 	{
+Index: elfutils-0.148/src/ldgeneric.c
+===================================================================
+--- elfutils-0.148.orig/src/ldgeneric.c
++++ elfutils-0.148/src/ldgeneric.c
+@@ -285,12 +285,10 @@ static int
+ check_for_duplicate2 (struct usedfiles *newp, struct usedfiles *list)
+ {
+   struct usedfiles *first;
+-  struct usedfiles *prevp;
+ 
+   if (list == NULL)
+     return 0;
+ 
+-  prevp = list;
+   list = first = list->next;
+   do
+     {
+Index: elfutils-0.148/src/ldscript.y
+===================================================================
+--- elfutils-0.148.orig/src/ldscript.y
++++ elfutils-0.148/src/ldscript.y
+@@ -802,12 +802,9 @@ add_versions (struct version *versions)
+ 
+   do
+     {
+-      struct version *oldp;
+-
+       add_id_list (versions->versionname, versions->local_names, true);
+       add_id_list (versions->versionname, versions->global_names, false);
+ 
+-      oldp = versions;
+       versions = versions->next;
+     }
+   while (versions != NULL);
+Index: elfutils-0.148/src/unstrip.c
+===================================================================
+--- elfutils-0.148.orig/src/unstrip.c
++++ elfutils-0.148/src/unstrip.c
+@@ -1301,7 +1301,6 @@ more sections in stripped file than debu
+   /* Match each debuginfo section with its corresponding stripped section.  */
+   bool check_prelink = false;
+   Elf_Scn *unstripped_symtab = NULL;
+-  size_t unstripped_strtab_ndx = SHN_UNDEF;
+   size_t alloc_avail = 0;
+   scn = NULL;
+   while ((scn = elf_nextscn (unstripped, scn)) != NULL)
+@@ -1313,7 +1312,6 @@ more sections in stripped file than debu
+       if (shdr->sh_type == SHT_SYMTAB)
+ 	{
+ 	  unstripped_symtab = scn;
+-	  unstripped_strtab_ndx = shdr->sh_link;
+ 	  continue;
+ 	}
+ 
+Index: elfutils-0.148/src/ldscript.c
+===================================================================
+--- elfutils-0.148.orig/src/ldscript.c
++++ elfutils-0.148/src/ldscript.c
+@@ -2728,12 +2728,9 @@ add_versions (struct version *versions)
+ 
+   do
+     {
+-      struct version *oldp;
+-
+       add_id_list (versions->versionname, versions->local_names, true);
+       add_id_list (versions->versionname, versions->global_names, false);
+ 
+-      oldp = versions;
+       versions = versions->next;
+     }
+   while (versions != NULL);
diff --git a/recipes/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff b/recipes/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff
new file mode 100644
index 0000000..d792d5f
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff
@@ -0,0 +1,21 @@
+Upstream-Status: Backport
+
+On many architectures this test fails because binaries/libs produced by
+binutils don't pass elflint. However elfutils shouldn't FTBFS because of this.
+
+So we run the tests on all archs to see what breaks, but if it breaks we ignore
+the result (exitcode 77 means: this test was skipped).
+
+Index: elfutils-0.128/tests/run-elflint-self.sh
+===================================================================
+--- elfutils-0.128.orig/tests/run-elflint-self.sh	2007-07-08 21:46:16.000000000 +0000
++++ elfutils-0.128/tests/run-elflint-self.sh	2007-07-08 21:46:49.000000000 +0000
+@@ -32,7 +32,7 @@
+ #  echo $1
+   if [ -f $1 ]; then
+     testrun ../src/elflint --quiet --gnu-ld $1 ||
+-    { echo "*** failure in $1"; status=1; }
++    { echo "*** failure in $1"; status=77; }
+   fi
+ }
+ 
diff --git a/recipes/elfutils/elfutils-0.148/uclibc-support.patch b/recipes/elfutils/elfutils-0.148/uclibc-support.patch
new file mode 100644
index 0000000..3cf16ac
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/uclibc-support.patch
@@ -0,0 +1,91 @@
+on uclibc systems libintl and libuargp are separate from libc.
+so they need to be specified on commandline when we use proxy-libintl
+then libintl is a static archive so it should be listed last since
+elfutils does not respect disable-nls we need to link in libintl
+
+We add a new option --enable-uclibc which will be used to control
+the uclibc specific configurations during build.
+
+Signed-off-by: Khem Raj <raj.khem>
+
+Upstream-Status: Inappropriate [uclibc specific]
+
+Index: elfutils-0.148/configure.ac
+===================================================================
+--- elfutils-0.148.orig/configure.ac
++++ elfutils-0.148/configure.ac
+@@ -55,9 +55,16 @@ AS_IF([test "$use_locks" = yes], [AC_DEF
+ 
+ AH_TEMPLATE([USE_LOCKS], [Defined if libraries should be thread-safe.])
+ 
++AC_ARG_ENABLE([uclibc],
++AS_HELP_STRING([--enable-uclibc], [Use uclibc for system libraries]),
++use_uclibc=yes, use_uclibc=no)
++AM_CONDITIONAL(USE_UCLIBC, test "$use_uclibc" = yes)
++AS_IF([test "$use_uclibc" = yes], [AC_DEFINE(USE_UCLIBC)])
++
++AH_TEMPLATE([USE_UCLIBC], [Defined if uclibc libraries are used.])
++
+ dnl Add all the languages for which translations are available.
+ ALL_LINGUAS=
+-
+ AC_PROG_CC
+ AC_PROG_RANLIB
+ AC_PROG_YACC
+Index: elfutils-0.148/libelf/Makefile.am
+===================================================================
+--- elfutils-0.148.orig/libelf/Makefile.am
++++ elfutils-0.148/libelf/Makefile.am
+@@ -93,7 +93,12 @@ if !MUDFLAP
+ libelf_pic_a_SOURCES =
+ am_libelf_pic_a_OBJECTS = $(libelf_a_SOURCES:.c=.os)
+ 
++
+ libelf_so_LDLIBS =
++if USE_UCLIBC
++libelf_so_LDLIBS += -lintl -luargp
++endif
++
+ if USE_LOCKS
+ libelf_so_LDLIBS += -lpthread
+ endif
+Index: elfutils-0.148/libdw/Makefile.am
+===================================================================
+--- elfutils-0.148.orig/libdw/Makefile.am
++++ elfutils-0.148/libdw/Makefile.am
+@@ -98,6 +98,11 @@ if !MUDFLAP
+ libdw_pic_a_SOURCES =
+ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
+ 
++libdw_so_LDLIBS =
++if USE_UCLIBC
++libdw_so_LDLIBS += -lintl -luargp
++endif
++
+ libdw_so_SOURCES =
+ libdw.so: $(srcdir)/libdw.map libdw_pic.a \
+ 	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a \
+@@ -108,7 +113,7 @@ libdw.so: $(srcdir)/libdw.map libdw_pic.
+ 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
+ 		-Wl,--version-script,$<,--no-undefined \
+ 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
+-		-ldl $(zip_LIBS)
++		-ldl $(zip_LIBS) $(libdw_so_LDLIBS)
+ 	if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
+ 	ln -fs $@ $@.$(VERSION)
+ 
+Index: elfutils-0.148/libcpu/Makefile.am
+===================================================================
+--- elfutils-0.148.orig/libcpu/Makefile.am
++++ elfutils-0.148/libcpu/Makefile.am
+@@ -63,6 +63,10 @@ i386_parse_CFLAGS = -DNMNES="`wc -l < i3
+ i386_lex.o: i386_parse.h
+ i386_gendis_LDADD = $(libeu) -lm $(libmudflap)
+ 
++if USE_UCLIBC
++i386_gendis_LDADD += -luargp -lintl
++endif
++
+ i386_parse.h: i386_parse.c ;
+ 
+ noinst_HEADERS = memory-access.h i386_parse.h i386_data.h
diff --git a/recipes/elfutils/elfutils-0.148/x86_64_dis.h b/recipes/elfutils/elfutils-0.148/x86_64_dis.h
new file mode 100644
index 0000000..a0198be
--- /dev/null
+++ b/recipes/elfutils/elfutils-0.148/x86_64_dis.h
@@ -0,0 +1,1632 @@
+#define MNEMONIC_BITS 10
+#define SUFFIX_BITS 3
+#define FCT1_BITS 7
+#define STR1_BITS 4
+#define OFF1_1_BITS 7
+#define OFF1_1_BIAS 3
+#define OFF1_2_BITS 7
+#define OFF1_2_BIAS 4
+#define OFF1_3_BITS 1
+#define OFF1_3_BIAS 7
+#define FCT2_BITS 6
+#define STR2_BITS 2
+#define OFF2_1_BITS 7
+#define OFF2_1_BIAS 5
+#define OFF2_2_BITS 7
+#define OFF2_2_BIAS 4
+#define OFF2_3_BITS 4
+#define OFF2_3_BIAS 7
+#define FCT3_BITS 4
+#define STR3_BITS 1
+#define OFF3_1_BITS 6
+#define OFF3_1_BIAS 10
+#define OFF3_2_BITS 1
+#define OFF3_2_BIAS 21
+
+#include <i386_data.h>
+
+#define suffix_none 0
+#define suffix_w 1
+#define suffix_w0 2
+#define suffix_W 3
+#define suffix_tttn 4
+#define suffix_D 7
+#define suffix_w1 5
+#define suffix_W1 6
+
+static const opfct_t op1_fct[] =
+{
+  NULL,
+  FCT_MOD$R_M,
+  FCT_Mod$R_m,
+  FCT_abs,
+  FCT_ax,
+  FCT_ax$w,
+  FCT_ccc,
+  FCT_ddd,
+  FCT_disp8,
+  FCT_ds_bx,
+  FCT_ds_si,
+  FCT_dx,
+  FCT_es_di,
+  FCT_freg,
+  FCT_imm$s,
+  FCT_imm$w,
+  FCT_imm16,
+  FCT_imm64$w,
+  FCT_imm8,
+  FCT_imms8,
+  FCT_mmxreg,
+  FCT_mod$16r_m,
+  FCT_mod$64r_m,
+  FCT_mod$8r_m,
+  FCT_mod$r_m,
+  FCT_mod$r_m$w,
+  FCT_reg,
+  FCT_reg$w,
+  FCT_reg64,
+  FCT_rel,
+  FCT_sel,
+  FCT_sreg2,
+  FCT_sreg3,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op1_str[] =
+  "%ax\0"
+  "%cl\0"
+  "%rax\0"
+  "%st\0"
+  "%xmm0\0"
+  "*";
+static const uint8_t op1_str_idx[] = {
+  0,
+  4,
+  8,
+  13,
+  17,
+  23,
+};
+static const opfct_t op2_fct[] =
+{
+  NULL,
+  FCT_MOD$R_M,
+  FCT_Mod$R_m,
+  FCT_abs,
+  FCT_absval,
+  FCT_ax$w,
+  FCT_ccc,
+  FCT_ddd,
+  FCT_ds_si,
+  FCT_dx,
+  FCT_es_di,
+  FCT_freg,
+  FCT_imm8,
+  FCT_mmxreg,
+  FCT_mod$64r_m,
+  FCT_mod$r_m,
+  FCT_mod$r_m$w,
+  FCT_oreg,
+  FCT_oreg$w,
+  FCT_reg,
+  FCT_reg$w,
+  FCT_reg64,
+  FCT_sreg3,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op2_str[] =
+  "%rcx\0"
+  "%st";
+static const uint8_t op2_str_idx[] = {
+  0,
+  5,
+};
+static const opfct_t op3_fct[] =
+{
+  NULL,
+  FCT_mmxreg,
+  FCT_mod$r_m,
+  FCT_reg,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op3_str[] =
+  "%rdx";
+static const uint8_t op3_str_idx[] = {
+  0,
+};
+static const struct instr_enc instrtab[] =
+{
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsubpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsubps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movslq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 21, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bsf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bswap, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 26, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bt, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bts, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bts, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_call, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_call, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 22, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lcall, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 22, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cli, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_syscall, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clts, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysenter, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysexit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmov, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmps, .rep = 0, .repe = 1, .suffix = 1, .modrm = 0, .fct1 = 12, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 8, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpxchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 15, .off1_2 = 11, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 8, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cpuid, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtdq2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttpd2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_dec, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_div, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_emms, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_enter, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 12, .str2 = 0, .off2_1 = 19, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fchs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fabs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ftst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxam, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldl2t, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldl2e, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldpi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldlg2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldln2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldz, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_f2xm1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fyl2x, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fptan, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fpatan, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxtract, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fprem1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdecstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fincstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fprem, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fyl2xp1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsqrt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsincos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_frndint, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fscale, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsin, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fst, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstp, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldenv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldcw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstenv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstcw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_faddp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fiadd, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmove, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmulp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fimul, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisub, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisubr, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 1, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fbld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fbstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fchs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fclex, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_finit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fwait, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnclex, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmove, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovne, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcom, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcom, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomp, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcompp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdecstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivrl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ffree, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ficom, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ficomp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fild, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fildl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fildll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fincstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fninit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fist, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fistp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fistpll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisttp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisttpll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstpt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucom, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_frstor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnsave, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hlt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_idiv, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 14, .str1 = 0, .off1_1 = 13, .off1_2 = 2, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_in, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_in, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 11, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_inc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ins, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 11, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_int, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_int3, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_invd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_swapgs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_invlpg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_iret, .rep = 0, .repe = 0, .suffix = 6, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_j, .rep = 0, .repe = 0, .suffix = 4, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_j, .rep = 0, .repe = 0, .suffix = 4, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_set, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 22, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ljmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 30, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 4, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ljmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 22, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lahf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lar, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lea, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_leave, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lfs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lgs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lgdt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lidt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lmsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lock, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lods, .rep = 1, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loope, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loopne, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lsl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ltr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 3, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 35, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 37, .off1_2 = 3, .off1_3 = 0, .fct2 = 3, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 6, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 21, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 6, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 7, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 21, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 7, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 22, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movs, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsbl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movswl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movzbl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movzwl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mul, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_neg, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pause, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_popcnt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_not, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_out, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 12, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_out, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 9, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_outs, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 9, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_popf, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pushq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 14, .str1 = 0, .off1_1 = 5, .off1_2 = 2, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 31, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pushf, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdmsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdpmc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdtsc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ret, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ret, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sahf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_scas, .rep = 0, .repe = 1, .suffix = 0, .modrm = 0, .fct1 = 12, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_set, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_vmcall, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmlaunch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmresume, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmxoff, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmread, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 28, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 14, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmwrite, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 21, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sgdt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_monitor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 3, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 1, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 4, .str3 = 1, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mwait, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 3, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 1, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sidt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_smsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_std, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sti, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stos, .rep = 1, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_str, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ud2a, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_verr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_verw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_wbinvd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetchw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetchnta, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht0, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_nop, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_wrmsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 15, .off1_2 = 11, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 8, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 4, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 17, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xlat, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 9, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_emms, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pand, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pand, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pandn, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pandn, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_por, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_por, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pxor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pxor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpeqps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpltps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpleps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpunordps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpneqps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnltps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnleps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpordps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpeqss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpltss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpless, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpunordss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpneqss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnltss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnless, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpordss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxrstor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxsave, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ldmxcsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stmxcsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movupd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movups, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movupd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movups, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movddup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsldup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpcklpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpcklps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpckhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpckhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movshdup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movapd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movaps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movapd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movaps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsi2sd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsi2ss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpi2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpi2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttsd2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttss2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttpd2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttps2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsd2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtss2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ucomisd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ucomiss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_comisd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_comiss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_getsec, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movmskpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movmskps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsqrtss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsqrtps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcpss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcpps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_orpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_orps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xorpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xorps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsd2ss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtss2sd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttps2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtdq2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packsswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packsswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packuswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packuswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packssdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packssdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklqdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhqdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshuflw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_haddpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_haddps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hsubpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hsubps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movnti, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_pextrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pextrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_shufpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_shufps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmullw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmullw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdq2q, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 20, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovmskb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovmskb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 20, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lddqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuludq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuludq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maskmovdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maskmovq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 20, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhrsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhrsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_palignr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_palignr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_vmclear, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmxon, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmptrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmptrst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clflush, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_blendps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendvps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendvpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_dpps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_dppd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_insertps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_movntdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mpsadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_packusdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pblendvb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pblendw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpestri, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpestrm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpistri, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpistrm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phminposuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxud, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminud, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxwq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxwq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ptest, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_roundps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 31, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+};
+static const uint8_t match_data[] =
+{
+  0x1, 0xfe, 0x14,
+  0x2, 0xfe, 0x80, 0x38, 0x10,
+  0x2, 0xfe, 0x82, 0x38, 0x10,
+  0x2, 0xfe, 0x10, 0, 0,
+  0x2, 0xfe, 0x12, 0, 0,
+  0x1, 0xfe, 0x4,
+  0x2, 0xfe, 0x80, 0x38, 0,
+  0x12, 0x83, 0x38, 0,
+  0x2, 0xfe, 0, 0, 0,
+  0x2, 0xfe, 0x2, 0, 0,
+  0x34, 0x66, 0xf, 0xd0, 0, 0,
+  0x34, 0xf2, 0xf, 0xd0, 0, 0,
+  0x1, 0xfe, 0x24,
+  0x2, 0xfe, 0x80, 0x38, 0x20,
+  0x2, 0xfe, 0x82, 0x38, 0x20,
+  0x2, 0xfe, 0x20, 0, 0,
+  0x2, 0xfe, 0x22, 0, 0,
+  0x34, 0x66, 0xf, 0x54, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x34, 0x66, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x12, 0x63, 0, 0,
+  0x23, 0xf, 0xbc, 0, 0,
+  0x23, 0xf, 0xbd, 0, 0,
+  0x12, 0xf, 0xf8, 0xc8,
+  0x23, 0xf, 0xa3, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x20,
+  0x23, 0xf, 0xbb, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x38,
+  0x23, 0xf, 0xb3, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x30,
+  0x23, 0xf, 0xab, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x28,
+  0x11, 0xe8,
+  0x12, 0xff, 0x38, 0x10,
+  0x12, 0xff, 0x38, 0x18,
+  0x11, 0x98,
+  0x11, 0x99,
+  0x11, 0xf8,
+  0x11, 0xfc,
+  0x11, 0xfa,
+  0x22, 0xf, 0x5,
+  0x22, 0xf, 0x6,
+  0x22, 0xf, 0x7,
+  0x22, 0xf, 0x34,
+  0x22, 0xf, 0x35,
+  0x11, 0xf5,
+  0x13, 0xf, 0xf0, 0x40, 0, 0,
+  0x1, 0xfe, 0x3c,
+  0x2, 0xfe, 0x80, 0x38, 0x38,
+  0x12, 0x83, 0x38, 0x38,
+  0x2, 0xfe, 0x38, 0, 0,
+  0x2, 0xfe, 0x3a, 0, 0,
+  0x34, 0xf2, 0xf, 0xc2, 0, 0,
+  0x34, 0xf3, 0xf, 0xc2, 0, 0,
+  0x34, 0x66, 0xf, 0xc2, 0, 0,
+  0x23, 0xf, 0xc2, 0, 0,
+  0x1, 0xfe, 0xa6,
+  0x13, 0xf, 0xfe, 0xb0, 0, 0,
+  0x23, 0xf, 0xc7, 0x38, 0x8,
+  0x22, 0xf, 0xa2,
+  0x34, 0xf3, 0xf, 0xe6, 0, 0,
+  0x34, 0xf2, 0xf, 0xe6, 0, 0,
+  0x34, 0x66, 0xf, 0xe6, 0, 0,
+  0x2, 0xfe, 0xfe, 0x38, 0x8,
+  0x2, 0xfe, 0xf6, 0x38, 0x30,
+  0x22, 0xf, 0x77,
+  0x11, 0xc8,
+  0x22, 0xd9, 0xd0,
+  0x22, 0xd9, 0xe0,
+  0x22, 0xd9, 0xe1,
+  0x22, 0xd9, 0xe4,
+  0x22, 0xd9, 0xe5,
+  0x22, 0xd9, 0xe8,
+  0x22, 0xd9, 0xe9,
+  0x22, 0xd9, 0xea,
+  0x22, 0xd9, 0xeb,
+  0x22, 0xd9, 0xec,
+  0x22, 0xd9, 0xed,
+  0x22, 0xd9, 0xee,
+  0x22, 0xd9, 0xf0,
+  0x22, 0xd9, 0xf1,
+  0x22, 0xd9, 0xf2,
+  0x22, 0xd9, 0xf3,
+  0x22, 0xd9, 0xf4,
+  0x22, 0xd9, 0xf5,
+  0x22, 0xd9, 0xf6,
+  0x22, 0xd9, 0xf7,
+  0x22, 0xd9, 0xf8,
+  0x22, 0xd9, 0xf9,
+  0x22, 0xd9, 0xfa,
+  0x22, 0xd9, 0xfb,
+  0x22, 0xd9, 0xfc,
+  0x22, 0xd9, 0xfd,
+  0x22, 0xd9, 0xfe,
+  0x22, 0xd9, 0xff,
+  0x12, 0xd8, 0xf8, 0xc0,
+  0x12, 0xdc, 0xf8, 0xc0,
+  0x2, 0xfb, 0xd8, 0x38, 0,
+  0x12, 0xd8, 0xf8, 0xc8,
+  0x12, 0xdc, 0xf8, 0xc8,
+  0x2, 0xfb, 0xd8, 0x38, 0x8,
+  0x12, 0xd8, 0xf8, 0xe0,
+  0x12, 0xdc, 0xf8, 0xe0,
+  0x2, 0xfb, 0xd8, 0x38, 0x20,
+  0x12, 0xd8, 0xf8, 0xe8,
+  0x12, 0xdc, 0xf8, 0xe8,
+  0x2, 0xfb, 0xd8, 0x38, 0x28,
+  0x12, 0xdd, 0xf8, 0xd0,
+  0x2, 0xfb, 0xd9, 0x38, 0x10,
+  0x12, 0xdd, 0xf8, 0xd8,
+  0x2, 0xfb, 0xd9, 0x38, 0x18,
+  0x12, 0xd9, 0x38, 0x20,
+  0x12, 0xd9, 0x38, 0x28,
+  0x12, 0xd9, 0x38, 0x30,
+  0x12, 0xd9, 0x38, 0x38,
+  0x12, 0xd9, 0xf8, 0xc8,
+  0x12, 0xde, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xc0,
+  0x2, 0xfb, 0xda, 0x38, 0,
+  0x12, 0xda, 0xf8, 0xc8,
+  0x12, 0xde, 0xf8, 0xc8,
+  0x2, 0xfb, 0xda, 0x38, 0x8,
+  0x12, 0xde, 0xf8, 0xe0,
+  0x2, 0xfb, 0xda, 0x38, 0x20,
+  0x12, 0xde, 0xf8, 0xe8,
+  0x2, 0xfb, 0xda, 0x38, 0x28,
+  0x22, 0xdf, 0xe0,
+  0x12, 0xdf, 0x38, 0x20,
+  0x12, 0xdf, 0xf8, 0xf0,
+  0x12, 0xdf, 0x38, 0x30,
+  0x22, 0xd9, 0xe0,
+  0x33, 0x9b, 0xdb, 0xe2,
+  0x33, 0x9b, 0xdb, 0xe3,
+  0x11, 0x9b,
+  0x22, 0xdb, 0xe2,
+  0x12, 0xda, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xc8,
+  0x12, 0xda, 0xf8, 0xd0,
+  0x12, 0xda, 0xf8, 0xd8,
+  0x12, 0xdb, 0xf8, 0xc0,
+  0x12, 0xdb, 0xf8, 0xc8,
+  0x12, 0xdb, 0xf8, 0xd0,
+  0x12, 0xdb, 0xf8, 0xd8,
+  0x12, 0xd8, 0xf8, 0xd0,
+  0x2, 0xfb, 0xd8, 0x38, 0x10,
+  0x12, 0xd8, 0xf8, 0xd8,
+  0x2, 0xfb, 0xd8, 0x38, 0x18,
+  0x22, 0xde, 0xd9,
+  0x12, 0xdb, 0xf8, 0xf0,
+  0x12, 0xdf, 0xf8, 0xf0,
+  0x12, 0xdb, 0xf8, 0xe8,
+  0x12, 0xdf, 0xf8, 0xe8,
+  0x22, 0xd9, 0xff,
+  0x22, 0xd9, 0xf6,
+  0x12, 0xd8, 0xf8, 0xf0,
+  0x12, 0xdc, 0xf8, 0xf0,
+  0x2, 0xfb, 0xd8, 0x38, 0x30,
+  0x12, 0xda, 0x38, 0x30,
+  0x12, 0xde, 0xf8, 0xf0,
+  0x12, 0xde, 0x38, 0x30,
+  0x12, 0xde, 0xf8, 0xf8,
+  0x12, 0xd8, 0xf8, 0xf8,
+  0x12, 0xdc, 0xf8, 0xf8,
+  0x2, 0xfb, 0xd8, 0x38, 0x38,
+  0x12, 0xda, 0x38, 0x38,
+  0x12, 0xde, 0x38, 0x38,
+  0x12, 0xde, 0xf8, 0xf0,
+  0x12, 0xdd, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xd0,
+  0x2, 0xfb, 0xda, 0x38, 0x10,
+  0x12, 0xda, 0xf8, 0xd8,
+  0x2, 0xfb, 0xda, 0x38, 0x18,
+  0x12, 0xdf, 0x38, 0,
+  0x12, 0xdb, 0x38, 0,
+  0x12, 0xdf, 0x38, 0x28,
+  0x22, 0xd9, 0xf7,
+  0x22, 0xdb, 0xe3,
+  0x2, 0xfb, 0xdb, 0x38, 0x10,
+  0x2, 0xfb, 0xdb, 0x38, 0x18,
+  0x12, 0xdf, 0x38, 0x38,
+  0x2, 0xfb, 0xdb, 0x38, 0x8,
+  0x12, 0xdd, 0x38, 0x8,
+  0x12, 0xdb, 0x38, 0x28,
+  0x12, 0xdb, 0x38, 0x38,
+  0x12, 0xd9, 0xf8, 0xc0,
+  0x2, 0xfb, 0xd9, 0x38, 0,
+  0x12, 0xdd, 0xf8, 0xe0,
+  0x12, 0xdd, 0x38, 0x20,
+  0x12, 0xdd, 0xf8, 0xe8,
+  0x12, 0xdd, 0x38, 0x30,
+  0x12, 0xdd, 0x38, 0x38,
+  0x11, 0xf4,
+  0x2, 0xfe, 0xf6, 0x38, 0x38,
+  0x2, 0xfe, 0xf6, 0x38, 0x28,
+  0x23, 0xf, 0xaf, 0, 0,
+  0x2, 0xfd, 0x69, 0, 0,
+  0x1, 0xfe, 0xe4,
+  0x1, 0xfe, 0xec,
+  0x2, 0xfe, 0xfe, 0x38, 0,
+  0x1, 0xfe, 0x6c,
+  0x11, 0xcd,
+  0x11, 0xcc,
+  0x22, 0xf, 0x8,
+  0x33, 0xf, 0x1, 0xf8,
+  0x23, 0xf, 0x1, 0x38, 0x38,
+  0x11, 0xcf,
+  0x1, 0xf0, 0x70,
+  0x12, 0xf, 0xf0, 0x80,
+  0x13, 0xf, 0xf0, 0x90, 0x38, 0,
+  0x11, 0xe3,
+  0x11, 0xeb,
+  0x11, 0xe9,
+  0x12, 0xff, 0x38, 0x20,
+  0x11, 0xea,
+  0x12, 0xff, 0x38, 0x28,
+  0x11, 0x9f,
+  0x23, 0xf, 0x2, 0, 0,
+  0x12, 0x8d, 0, 0,
+  0x11, 0xc9,
+  0x23, 0xf, 0xb4, 0, 0,
+  0x23, 0xf, 0xb5, 0, 0,
+  0x23, 0xf, 0x1, 0x38, 0x10,
+  0x23, 0xf, 0x1, 0x38, 0x18,
+  0x23, 0xf, 0, 0x38, 0x10,
+  0x23, 0xf, 0x1, 0x38, 0x30,
+  0x11, 0xf0,
+  0x1, 0xfe, 0xac,
+  0x11, 0xe2,
+  0x11, 0xe1,
+  0x11, 0xe0,
+  0x23, 0xf, 0x3, 0, 0,
+  0x23, 0xf, 0xb2, 0, 0,
+  0x23, 0xf, 0, 0x38, 0x18,
+  0x2, 0xfe, 0x88, 0, 0,
+  0x2, 0xfe, 0x8a, 0, 0,
+  0x2, 0xfe, 0xc6, 0x38, 0,
+  0x1, 0xf0, 0xb0,
+  0x1, 0xfe, 0xa0,
+  0x1, 0xfe, 0xa2,
+  0x23, 0xf, 0x20, 0xc0, 0xc0,
+  0x23, 0xf, 0x22, 0xc0, 0xc0,
+  0x23, 0xf, 0x21, 0xc0, 0xc0,
+  0x23, 0xf, 0x23, 0xc0, 0xc0,
+  0x12, 0x8c, 0, 0,
+  0x12, 0x8e, 0, 0,
+  0x1, 0xfe, 0xa4,
+  0x23, 0xf, 0xbe, 0, 0,
+  0x23, 0xf, 0xbf, 0, 0,
+  0x23, 0xf, 0xb6, 0, 0,
+  0x23, 0xf, 0xb7, 0, 0,
+  0x2, 0xfe, 0xf6, 0x38, 0x20,
+  0x2, 0xfe, 0xf6, 0x38, 0x18,
+  0x22, 0xf3, 0x90,
+  0x11, 0x90,
+  0x34, 0xf3, 0xf, 0xb8, 0, 0,
+  0x2, 0xfe, 0xf6, 0x38, 0x10,
+  0x2, 0xfe, 0x8, 0, 0,
+  0x2, 0xfe, 0xa, 0, 0,
+  0x2, 0xfe, 0x80, 0x38, 0x8,
+  0x2, 0xfe, 0x82, 0x38, 0x8,
+  0x1, 0xfe, 0xc,
+  0x1, 0xfe, 0xe6,
+  0x1, 0xfe, 0xee,
+  0x1, 0xfe, 0x6e,
+  0x12, 0x8f, 0xf8, 0xc0,
+  0x12, 0x8f, 0x38, 0,
+  0x12, 0xf, 0xc7, 0x81,
+  0x11, 0x9d,
+  0x12, 0xff, 0xf8, 0xf0,
+  0x12, 0xff, 0x38, 0x30,
+  0x1, 0xf8, 0x50,
+  0x1, 0xf8, 0x58,
+  0x1, 0xfd, 0x68,
+  0x1, 0xe7, 0x6,
+  0x12, 0xf, 0xc7, 0x80,
+  0x11, 0x9c,
+  0x2, 0xfe, 0xd0, 0x38, 0x10,
+  0x2, 0xfe, 0xd2, 0x38, 0x10,
+  0x2, 0xfe, 0xc0, 0x38, 0x10,
+  0x2, 0xfe, 0xd0, 0x38, 0x18,
+  0x2, 0xfe, 0xd2, 0x38, 0x18,
+  0x2, 0xfe, 0xc0, 0x38, 0x18,
+  0x22, 0xf, 0x32,
+  0x22, 0xf, 0x33,
+  0x22, 0xf, 0x31,
+  0x11, 0xc3,
+  0x11, 0xc2,
+  0x11, 0xcb,
+  0x11, 0xca,
+  0x2, 0xfe, 0xd0, 0x38, 0,
+  0x2, 0xfe, 0xd2, 0x38, 0,
+  0x2, 0xfe, 0xc0, 0x38, 0,
+  0x2, 0xfe, 0xd0, 0x38, 0x8,
+  0x2, 0xfe, 0xd2, 0x38, 0x8,
+  0x2, 0xfe, 0xc0, 0x38, 0x8,
+  0x22, 0xf, 0xaa,
+  0x11, 0x9e,
+  0x2, 0xfe, 0xd0, 0x38, 0x38,
+  0x2, 0xfe, 0xd2, 0x38, 0x38,
+  0x2, 0xfe, 0xc0, 0x38, 0x38,
+  0x2, 0xfe, 0x18, 0, 0,
+  0x2, 0xfe, 0x1a, 0, 0,
+  0x1, 0xfe, 0x1c,
+  0x2, 0xfe, 0x80, 0x38, 0x18,
+  0x2, 0xfe, 0x82, 0x38, 0x18,
+  0x1, 0xfe, 0xae,
+  0x13, 0xf, 0xf0, 0x90, 0x38, 0,
+  0x2, 0xfe, 0xd0, 0x38, 0x20,
+  0x2, 0xfe, 0xd2, 0x38, 0x20,
+  0x2, 0xfe, 0xc0, 0x38, 0x20,
+  0x2, 0xfe, 0xd0, 0x38, 0x28,
+  0x23, 0xf, 0xa4, 0, 0,
+  0x23, 0xf, 0xa5, 0, 0,
+  0x2, 0xfe, 0xd2, 0x38, 0x28,
+  0x2, 0xfe, 0xc0, 0x38, 0x28,
+  0x23, 0xf, 0xac, 0, 0,
+  0x23, 0xf, 0xad, 0, 0,
+  0x33, 0xf, 0x1, 0xc1,
+  0x33, 0xf, 0x1, 0xc2,
+  0x33, 0xf, 0x1, 0xc3,
+  0x33, 0xf, 0x1, 0xc4,
+  0x23, 0xf, 0x78, 0, 0,
+  0x23, 0xf, 0x79, 0, 0,
+  0x23, 0xf, 0x1, 0x38, 0,
+  0x33, 0xf, 0x1, 0xc8,
+  0x33, 0xf, 0x1, 0xc9,
+  0x23, 0xf, 0x1, 0x38, 0x8,
+  0x23, 0xf, 0, 0x38, 0,
+  0x23, 0xf, 0x1, 0x38, 0x20,
+  0x11, 0xf9,
+  0x11, 0xfd,
+  0x11, 0xfb,
+  0x1, 0xfe, 0xaa,
+  0x23, 0xf, 0, 0x38, 0x8,
+  0x2, 0xfe, 0x28, 0, 0,
+  0x2, 0xfe, 0x2a, 0, 0,
+  0x1, 0xfe, 0x2c,
+  0x2, 0xfe, 0x80, 0x38, 0x28,
+  0x2, 0xfe, 0x82, 0x38, 0x28,
+  0x2, 0xfe, 0x84, 0, 0,
+  0x1, 0xfe, 0xa8,
+  0x2, 0xfe, 0xf6, 0x38, 0,
+  0x22, 0xf, 0xb,
+  0x23, 0xf, 0, 0x38, 0x20,
+  0x23, 0xf, 0, 0x38, 0x28,
+  0x22, 0xf, 0x9,
+  0x23, 0xf, 0xd, 0x38, 0,
+  0x23, 0xf, 0xd, 0x38, 0x8,
+  0x23, 0xf, 0x18, 0x38, 0,
+  0x23, 0xf, 0x18, 0x38, 0x8,
+  0x23, 0xf, 0x18, 0x38, 0x10,
+  0x23, 0xf, 0x18, 0x38, 0x18,
+  0x23, 0xf, 0x1f, 0, 0,
+  0x22, 0xf, 0x30,
+  0x13, 0xf, 0xfe, 0xc0, 0, 0,
+  0x2, 0xfe, 0x86, 0, 0,
+  0x1, 0xf8, 0x90,
+  0x11, 0xd7,
+  0x2, 0xfe, 0x30, 0, 0,
+  0x2, 0xfe, 0x32, 0, 0,
+  0x1, 0xfe, 0x34,
+  0x2, 0xfe, 0x80, 0x38, 0x30,
+  0x2, 0xfe, 0x82, 0x38, 0x30,
+  0x22, 0xf, 0x77,
+  0x34, 0x66, 0xf, 0xdb, 0, 0,
+  0x23, 0xf, 0xdb, 0, 0,
+  0x34, 0x66, 0xf, 0xdf, 0, 0,
+  0x23, 0xf, 0xdf, 0, 0,
+  0x34, 0x66, 0xf, 0xf5, 0, 0,
+  0x23, 0xf, 0xf5, 0, 0,
+  0x34, 0x66, 0xf, 0xeb, 0, 0,
+  0x23, 0xf, 0xeb, 0, 0,
+  0x34, 0x66, 0xf, 0xef, 0, 0,
+  0x23, 0xf, 0xef, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x1,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x2,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x3,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x4,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x5,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x6,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x7,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x1,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x2,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x3,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x4,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x5,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x6,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x7,
+  0x23, 0xf, 0xae, 0x38, 0x8,
+  0x23, 0xf, 0xae, 0x38, 0,
+  0x23, 0xf, 0xae, 0x38, 0x10,
+  0x23, 0xf, 0xae, 0x38, 0x18,
+  0x34, 0xf2, 0xf, 0x10, 0, 0,
+  0x34, 0xf3, 0xf, 0x10, 0, 0,
+  0x34, 0x66, 0xf, 0x10, 0, 0,
+  0x23, 0xf, 0x10, 0, 0,
+  0x34, 0xf2, 0xf, 0x11, 0, 0,
+  0x34, 0xf3, 0xf, 0x11, 0, 0,
+  0x34, 0x66, 0xf, 0x11, 0, 0,
+  0x23, 0xf, 0x11, 0, 0,
+  0x34, 0xf2, 0xf, 0x12, 0, 0,
+  0x34, 0xf3, 0xf, 0x12, 0, 0,
+  0x34, 0x66, 0xf, 0x12, 0, 0,
+  0x23, 0xf, 0x12, 0xc0, 0xc0,
+  0x23, 0xf, 0x12, 0, 0,
+  0x34, 0x66, 0xf, 0x13, 0xc0, 0xc0,
+  0x23, 0xf, 0x13, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x13, 0, 0,
+  0x23, 0xf, 0x13, 0, 0,
+  0x34, 0x66, 0xf, 0x14, 0, 0,
+  0x23, 0xf, 0x14, 0, 0,
+  0x34, 0x66, 0xf, 0x15, 0, 0,
+  0x23, 0xf, 0x15, 0, 0,
+  0x34, 0xf3, 0xf, 0x16, 0, 0,
+  0x34, 0x66, 0xf, 0x16, 0, 0,
+  0x23, 0xf, 0x16, 0xc0, 0xc0,
+  0x23, 0xf, 0x16, 0, 0,
+  0x34, 0x66, 0xf, 0x17, 0xc0, 0xc0,
+  0x23, 0xf, 0x17, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x17, 0, 0,
+  0x23, 0xf, 0x17, 0, 0,
+  0x34, 0x66, 0xf, 0x28, 0, 0,
+  0x23, 0xf, 0x28, 0, 0,
+  0x34, 0x66, 0xf, 0x29, 0, 0,
+  0x23, 0xf, 0x29, 0, 0,
+  0x34, 0xf2, 0xf, 0x2a, 0, 0,
+  0x34, 0xf3, 0xf, 0x2a, 0, 0,
+  0x34, 0x66, 0xf, 0x2a, 0, 0,
+  0x23, 0xf, 0x2a, 0, 0,
+  0x34, 0x66, 0xf, 0x2b, 0, 0,
+  0x23, 0xf, 0x2b, 0, 0,
+  0x34, 0xf2, 0xf, 0x2c, 0, 0,
+  0x34, 0xf3, 0xf, 0x2c, 0, 0,
+  0x34, 0x66, 0xf, 0x2c, 0, 0,
+  0x23, 0xf, 0x2c, 0, 0,
+  0x34, 0x66, 0xf, 0x2d, 0, 0,
+  0x34, 0xf2, 0xf, 0x2d, 0, 0,
+  0x34, 0xf3, 0xf, 0x2d, 0, 0,
+  0x23, 0xf, 0x2d, 0, 0,
+  0x34, 0x66, 0xf, 0x2e, 0, 0,
+  0x23, 0xf, 0x2e, 0, 0,
+  0x34, 0x66, 0xf, 0x2f, 0, 0,
+  0x23, 0xf, 0x2f, 0, 0,
+  0x22, 0xf, 0x37,
+  0x34, 0x66, 0xf, 0x50, 0xc0, 0xc0,
+  0x23, 0xf, 0x50, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x51, 0, 0,
+  0x34, 0xf2, 0xf, 0x51, 0, 0,
+  0x34, 0xf3, 0xf, 0x51, 0, 0,
+  0x23, 0xf, 0x51, 0, 0,
+  0x34, 0xf3, 0xf, 0x52, 0, 0,
+  0x23, 0xf, 0x52, 0, 0,
+  0x34, 0xf3, 0xf, 0x53, 0, 0,
+  0x23, 0xf, 0x53, 0, 0,
+  0x34, 0x66, 0xf, 0x54, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x34, 0x66, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x34, 0x66, 0xf, 0x56, 0, 0,
+  0x23, 0xf, 0x56, 0, 0,
+  0x34, 0x66, 0xf, 0x57, 0, 0,
+  0x23, 0xf, 0x57, 0, 0,
+  0x34, 0xf2, 0xf, 0x58, 0, 0,
+  0x34, 0xf3, 0xf, 0x58, 0, 0,
+  0x34, 0x66, 0xf, 0x58, 0, 0,
+  0x23, 0xf, 0x58, 0, 0,
+  0x34, 0xf2, 0xf, 0x59, 0, 0,
+  0x34, 0xf3, 0xf, 0x59, 0, 0,
+  0x34, 0x66, 0xf, 0x59, 0, 0,
+  0x23, 0xf, 0x59, 0, 0,
+  0x34, 0xf2, 0xf, 0x5a, 0, 0,
+  0x34, 0xf3, 0xf, 0x5a, 0, 0,
+  0x34, 0x66, 0xf, 0x5a, 0, 0,
+  0x23, 0xf, 0x5a, 0, 0,
+  0x34, 0x66, 0xf, 0x5b, 0, 0,
+  0x34, 0xf3, 0xf, 0x5b, 0, 0,
+  0x23, 0xf, 0x5b, 0, 0,
+  0x34, 0xf2, 0xf, 0x5c, 0, 0,
+  0x34, 0xf3, 0xf, 0x5c, 0, 0,
+  0x34, 0x66, 0xf, 0x5c, 0, 0,
+  0x23, 0xf, 0x5c, 0, 0,
+  0x34, 0xf2, 0xf, 0x5d, 0, 0,
+  0x34, 0xf3, 0xf, 0x5d, 0, 0,
+  0x34, 0x66, 0xf, 0x5d, 0, 0,
+  0x23, 0xf, 0x5d, 0, 0,
+  0x34, 0xf2, 0xf, 0x5e, 0, 0,
+  0x34, 0xf3, 0xf, 0x5e, 0, 0,
+  0x34, 0x66, 0xf, 0x5e, 0, 0,
+  0x23, 0xf, 0x5e, 0, 0,
+  0x34, 0xf2, 0xf, 0x5f, 0, 0,
+  0x34, 0xf3, 0xf, 0x5f, 0, 0,
+  0x34, 0x66, 0xf, 0x5f, 0, 0,
+  0x23, 0xf, 0x5f, 0, 0,
+  0x34, 0x66, 0xf, 0x60, 0, 0,
+  0x23, 0xf, 0x60, 0, 0,
+  0x34, 0x66, 0xf, 0x61, 0, 0,
+  0x23, 0xf, 0x61, 0, 0,
+  0x34, 0x66, 0xf, 0x62, 0, 0,
+  0x23, 0xf, 0x62, 0, 0,
+  0x34, 0x66, 0xf, 0x63, 0, 0,
+  0x23, 0xf, 0x63, 0, 0,
+  0x34, 0x66, 0xf, 0x64, 0, 0,
+  0x23, 0xf, 0x64, 0, 0,
+  0x34, 0x66, 0xf, 0x65, 0, 0,
+  0x23, 0xf, 0x65, 0, 0,
+  0x34, 0x66, 0xf, 0x66, 0, 0,
+  0x23, 0xf, 0x66, 0, 0,
+  0x34, 0x66, 0xf, 0x67, 0, 0,
+  0x23, 0xf, 0x67, 0, 0,
+  0x34, 0x66, 0xf, 0x68, 0, 0,
+  0x23, 0xf, 0x68, 0, 0,
+  0x34, 0x66, 0xf, 0x69, 0, 0,
+  0x23, 0xf, 0x69, 0, 0,
+  0x34, 0x66, 0xf, 0x6a, 0, 0,
+  0x23, 0xf, 0x6a, 0, 0,
+  0x34, 0x66, 0xf, 0x6b, 0, 0,
+  0x23, 0xf, 0x6b, 0, 0,
+  0x34, 0x66, 0xf, 0x6c, 0, 0,
+  0x34, 0x66, 0xf, 0x6d, 0, 0,
+  0x34, 0x66, 0xf, 0x6e, 0, 0,
+  0x23, 0xf, 0x6e, 0, 0,
+  0x34, 0x66, 0xf, 0x6f, 0, 0,
+  0x34, 0xf3, 0xf, 0x6f, 0, 0,
+  0x23, 0xf, 0x6f, 0, 0,
+  0x34, 0x66, 0xf, 0x70, 0, 0,
+  0x34, 0xf2, 0xf, 0x70, 0, 0,
+  0x34, 0xf3, 0xf, 0x70, 0, 0,
+  0x23, 0xf, 0x70, 0, 0,
+  0x34, 0x66, 0xf, 0x74, 0, 0,
+  0x23, 0xf, 0x74, 0, 0,
+  0x34, 0x66, 0xf, 0x75, 0, 0,
+  0x23, 0xf, 0x75, 0, 0,
+  0x34, 0x66, 0xf, 0x76, 0, 0,
+  0x23, 0xf, 0x76, 0, 0,
+  0x34, 0x66, 0xf, 0x7c, 0, 0,
+  0x34, 0xf2, 0xf, 0x7c, 0, 0,
+  0x34, 0x66, 0xf, 0x7d, 0, 0,
+  0x34, 0xf2, 0xf, 0x7d, 0, 0,
+  0x34, 0x66, 0xf, 0x7e, 0, 0,
+  0x34, 0xf3, 0xf, 0x7e, 0, 0,
+  0x23, 0xf, 0x7e, 0, 0,
+  0x34, 0x66, 0xf, 0x7f, 0, 0,
+  0x34, 0xf3, 0xf, 0x7f, 0, 0,
+  0x23, 0xf, 0x7f, 0, 0,
+  0x23, 0xf, 0xc3, 0, 0,
+  0x34, 0x66, 0xf, 0xc4, 0, 0,
+  0x23, 0xf, 0xc4, 0, 0,
+  0x34, 0x66, 0xf, 0xc5, 0xc0, 0xc0,
+  0x23, 0xf, 0xc5, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xc6, 0, 0,
+  0x23, 0xf, 0xc6, 0, 0,
+  0x34, 0x66, 0xf, 0xd1, 0, 0,
+  0x23, 0xf, 0xd1, 0, 0,
+  0x34, 0x66, 0xf, 0xd2, 0, 0,
+  0x23, 0xf, 0xd2, 0, 0,
+  0x34, 0x66, 0xf, 0xd3, 0, 0,
+  0x23, 0xf, 0xd3, 0, 0,
+  0x34, 0x66, 0xf, 0xd4, 0, 0,
+  0x23, 0xf, 0xd4, 0, 0,
+  0x34, 0x66, 0xf, 0xd5, 0, 0,
+  0x23, 0xf, 0xd5, 0, 0,
+  0x34, 0x66, 0xf, 0xd6, 0, 0,
+  0x34, 0xf2, 0xf, 0xd6, 0xc0, 0xc0,
+  0x34, 0xf3, 0xf, 0xd6, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xd7, 0xc0, 0xc0,
+  0x23, 0xf, 0xd7, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xd8, 0, 0,
+  0x23, 0xf, 0xd8, 0, 0,
+  0x34, 0x66, 0xf, 0xd9, 0, 0,
+  0x23, 0xf, 0xd9, 0, 0,
+  0x34, 0x66, 0xf, 0xda, 0, 0,
+  0x23, 0xf, 0xda, 0, 0,
+  0x34, 0x66, 0xf, 0xdc, 0, 0,
+  0x23, 0xf, 0xdc, 0, 0,
+  0x34, 0x66, 0xf, 0xdd, 0, 0,
+  0x23, 0xf, 0xdd, 0, 0,
+  0x34, 0x66, 0xf, 0xde, 0, 0,
+  0x23, 0xf, 0xde, 0, 0,
+  0x34, 0x66, 0xf, 0xe0, 0, 0,
+  0x23, 0xf, 0xe0, 0, 0,
+  0x34, 0x66, 0xf, 0xe1, 0, 0,
+  0x23, 0xf, 0xe1, 0, 0,
+  0x34, 0x66, 0xf, 0xe2, 0, 0,
+  0x23, 0xf, 0xe2, 0, 0,
+  0x34, 0x66, 0xf, 0xe3, 0, 0,
+  0x23, 0xf, 0xe3, 0, 0,
+  0x34, 0x66, 0xf, 0xe4, 0, 0,
+  0x23, 0xf, 0xe4, 0, 0,
+  0x34, 0x66, 0xf, 0xe5, 0, 0,
+  0x23, 0xf, 0xe5, 0, 0,
+  0x34, 0x66, 0xf, 0xe7, 0, 0,
+  0x23, 0xf, 0xe7, 0, 0,
+  0x34, 0x66, 0xf, 0xe8, 0, 0,
+  0x23, 0xf, 0xe8, 0, 0,
+  0x34, 0x66, 0xf, 0xe9, 0, 0,
+  0x23, 0xf, 0xe9, 0, 0,
+  0x34, 0x66, 0xf, 0xea, 0, 0,
+  0x23, 0xf, 0xea, 0, 0,
+  0x34, 0x66, 0xf, 0xec, 0, 0,
+  0x23, 0xf, 0xec, 0, 0,
+  0x34, 0x66, 0xf, 0xed, 0, 0,
+  0x23, 0xf, 0xed, 0, 0,
+  0x34, 0x66, 0xf, 0xee, 0, 0,
+  0x23, 0xf, 0xee, 0, 0,
+  0x34, 0xf2, 0xf, 0xf0, 0, 0,
+  0x34, 0x66, 0xf, 0xf1, 0, 0,
+  0x23, 0xf, 0xf1, 0, 0,
+  0x34, 0x66, 0xf, 0xf2, 0, 0,
+  0x23, 0xf, 0xf2, 0, 0,
+  0x34, 0x66, 0xf, 0xf3, 0, 0,
+  0x23, 0xf, 0xf3, 0, 0,
+  0x34, 0x66, 0xf, 0xf4, 0, 0,
+  0x23, 0xf, 0xf4, 0, 0,
+  0x34, 0x66, 0xf, 0xf6, 0, 0,
+  0x23, 0xf, 0xf6, 0, 0,
+  0x34, 0x66, 0xf, 0xf7, 0xc0, 0xc0,
+  0x23, 0xf, 0xf7, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xf8, 0, 0,
+  0x23, 0xf, 0xf8, 0, 0,
+  0x34, 0x66, 0xf, 0xf9, 0, 0,
+  0x23, 0xf, 0xf9, 0, 0,
+  0x34, 0x66, 0xf, 0xfa, 0, 0,
+  0x23, 0xf, 0xfa, 0, 0,
+  0x34, 0x66, 0xf, 0xfb, 0, 0,
+  0x23, 0xf, 0xfb, 0, 0,
+  0x34, 0x66, 0xf, 0xfc, 0, 0,
+  0x23, 0xf, 0xfc, 0, 0,
+  0x34, 0x66, 0xf, 0xfd, 0, 0,
+  0x23, 0xf, 0xfd, 0, 0,
+  0x34, 0x66, 0xf, 0xfe, 0, 0,
+  0x23, 0xf, 0xfe, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0, 0, 0,
+  0x34, 0xf, 0x38, 0, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1, 0, 0,
+  0x34, 0xf, 0x38, 0x1, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2, 0, 0,
+  0x34, 0xf, 0x38, 0x2, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3, 0, 0,
+  0x34, 0xf, 0x38, 0x3, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x4, 0, 0,
+  0x34, 0xf, 0x38, 0x4, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x5, 0, 0,
+  0x34, 0xf, 0x38, 0x5, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x6, 0, 0,
+  0x34, 0xf, 0x38, 0x6, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x7, 0, 0,
+  0x34, 0xf, 0x38, 0x7, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x8, 0, 0,
+  0x34, 0xf, 0x38, 0x8, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x9, 0, 0,
+  0x34, 0xf, 0x38, 0x9, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0xa, 0, 0,
+  0x34, 0xf, 0x38, 0xa, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0xb, 0, 0,
+  0x34, 0xf, 0x38, 0xb, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1c, 0, 0,
+  0x34, 0xf, 0x38, 0x1c, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1d, 0, 0,
+  0x34, 0xf, 0x38, 0x1d, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1e, 0, 0,
+  0x34, 0xf, 0x38, 0x1e, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xf, 0, 0,
+  0x34, 0xf, 0x3a, 0xf, 0, 0,
+  0x34, 0x66, 0xf, 0xc7, 0x38, 0x30,
+  0x34, 0xf3, 0xf, 0xc7, 0x38, 0x30,
+  0x23, 0xf, 0xc7, 0x38, 0x30,
+  0x23, 0xf, 0xc7, 0x38, 0x38,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xd0,
+  0x23, 0xf, 0x71, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xe0,
+  0x23, 0xf, 0x71, 0xf8, 0xe0,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xf0,
+  0x23, 0xf, 0x71, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xd0,
+  0x23, 0xf, 0x72, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xe0,
+  0x23, 0xf, 0x72, 0xf8, 0xe0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xf0,
+  0x23, 0xf, 0x72, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xd0,
+  0x23, 0xf, 0x73, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xd8,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xf0,
+  0x23, 0xf, 0x73, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xf8,
+  0x33, 0xf, 0xae, 0xe8,
+  0x33, 0xf, 0xae, 0xf0,
+  0x33, 0xf, 0xae, 0xf8,
+  0x23, 0xf, 0xae, 0x38, 0x38,
+  0x23, 0xf, 0xf, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xc, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xd, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x14, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x15, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x40, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x41, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x21, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2a, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x42, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2b, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x10, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xe, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x29, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x61, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x60, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x63, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x62, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x37, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x41, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x20, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x22, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3c, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3d, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3f, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3e, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x38, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x39, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3b, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3a, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x20, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x21, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x22, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x23, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x24, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x25, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x30, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x31, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x32, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x33, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x34, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x35, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x28, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x40, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x17, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x8, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x9, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xa, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xb, 0, 0,
+  0x1, 0xe7, 0x7,
+};
diff --git a/recipes/elfutils/elfutils_0.148.bb b/recipes/elfutils/elfutils_0.148.bb
new file mode 100644
index 0000000..c7ae6d5
--- /dev/null
+++ b/recipes/elfutils/elfutils_0.148.bb
@@ -0,0 +1,61 @@
+DESCRIPTION = "A collection of utilities and DSOs to handle compiled objects."
+HOMEPAGE = "https://fedorahosted.org/elfutils"
+SECTION = "base"
+LICENSE = "OSL"
+DEPENDS = "libtool bzip2 zlib"
+
+PR = "r2"
+
+SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "a0bed1130135f17ad27533b0034dba8d"
+SRC_URI[sha256sum] = "8aebfa4a745db21cf5429c9541fe482729b62efc7e53e9110151b4169fe887da"
+
+# pick the patch from debian
+# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.148-1.debian.tar.gz
+
+SRC_URI += "\
+        file://redhat-portability.diff \
+        file://redhat-robustify.diff \
+        file://hppa_backend.diff \
+        file://arm_backend.diff \
+        file://mips_backend.diff \
+        file://m68k_backend.diff \
+        file://do-autoreconf.diff \
+        file://testsuite-ignore-elflint.diff \
+        file://elf_additions.diff \
+	file://elfutils-fsize.patch \
+	file://remove-unused.patch \
+	file://mempcpy.patch \
+"
+
+# The buildsystem wants to generate 2 .h files from source using a binary it just built,
+# which can not pass the cross compiling, so let's work around it by adding 2 .h files
+# along with the do_configure_prepend()
+
+SRC_URI += "\
+        file://i386_dis.h \
+        file://x86_64_dis.h \
+"
+inherit autotools gettext
+
+do_configure_prepend() {
+	sed -i 's:./i386_gendis:echo\ \#:g' ${S}/libcpu/Makefile.am
+
+	cp ${WORKDIR}/*dis.h ${S}/libcpu
+}
+
+# Package utilities separately
+PACKAGES =+ "${PN}-binutils"
+FILES_${PN}-binutils = "\
+    ${bindir}/eu-addr2line \
+    ${bindir}/eu-ld \
+    ${bindir}/eu-nm \
+    ${bindir}/eu-readelf \
+    ${bindir}/eu-size \
+    ${bindir}/eu-strip"
+# Fix library issues
+FILES_${PN} =+ "${libdir}/*-${PV}.so"
+
+# The elfutils package contains symlinks that trip up insane
+INSANE_SKIP_elfutils = "1"
-- 
1.7.3.4



