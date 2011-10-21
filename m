Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RHEvB-00046A-Sg
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 15:14:02 +0200
Received: from iph4.telenor.se (iph4.telenor.se [195.54.127.135])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 96F7AC1C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 14:50:51 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AjVCABhqoU5T4zkNPGdsb2JhbABDqRsZAQEBATcygW4BIAEMJAEKIzAYB0sKLYgCBqYkAY1YgzaBboMcBJQBkVw
X-IronPort-AV: E=Sophos;i="4.69,385,1315173600"; d="scan'208";a="1991615186"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	nazgul.atmel.com) ([83.227.57.13])
	by iph4.telenor.se with ESMTP; 21 Oct 2011 14:50:33 +0200
From: ulf_samuelsson@telia.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 14:50:31 +0200
Message-Id: <1319201431-18119-1-git-send-email-ulf_samuelsson@telia.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Ulf Samuelsson <ulf_samuelsson@telia.com>,
	Ulf Samuelsson <ulf.samuelsson@telia.com>
Subject: [PATCH v2] binutils-2.20.1: Change source package to binutils-2.20.1a
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
X-List-Received-Date: Fri, 21 Oct 2011 13:14:02 -0000

From: Ulf Samuelsson <ulf_samuelsson@telia.com>

2.20.1 is now 2.20.1a.
Patches and diff -r1 backported from openembedded-core
meta-openembedded/meta-oe/recipes-devtools/binutils

When extracting the 2.20.1a sources, the directory name is still 2.20.1

$ LANG=C diff -rq binutils-2.20.1 binutils-2.20.1a
Only in binutils-2.20.1a: cgen
Files binutils-2.20.1/md5.sum and binutils-2.20.1a/md5.sum differ
Files binutils-2.20.1/opcodes/m32c-desc.c and binutils-2.20.1a/opcodes/m32c-desc.c differ
Files binutils-2.20.1/opcodes/mep-asm.c and binutils-2.20.1a/opcodes/mep-asm.c differ
Files binutils-2.20.1/opcodes/mep-opc.c and binutils-2.20.1a/opcodes/mep-opc.c differ

Signed-Off-By: Ulf Samuelsson <ulf.samuelsson@telia.com>
---
 .../152_arm_branches_to_weak_symbols.patch         |  240 +++++++++++++++++++
 .../binutils-2.20.1/200_elflink_%B_fixes.patch     |   65 +++++
 .../201_elflink_improve_noaddneeded_errors.patch   |   70 ++++++
 .../202_elflink_noaddneeded_vs_weak.patch          |   87 +++++++
 .../binutils-2.20.1/binutils-mips-pie.patch        |   29 +++
 .../binutils/binutils-2.20.1/binutils-poison.patch |  253 ++++++++++++++++++++
 .../binutils-2.20.1/libiberty_path_fix.patch       |   20 ++
 .../binutils-2.20.1/libtool-rpath-fix.patch        |   36 +++
 recipes/binutils/binutils_2.20.1.bb                |   16 +-
 9 files changed, 812 insertions(+), 4 deletions(-)
 create mode 100644 recipes/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch
 create mode 100644 recipes/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch
 create mode 100644 recipes/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
 create mode 100644 recipes/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch
 create mode 100644 recipes/binutils/binutils-2.20.1/binutils-mips-pie.patch
 create mode 100644 recipes/binutils/binutils-2.20.1/binutils-poison.patch
 create mode 100644 recipes/binutils/binutils-2.20.1/libiberty_path_fix.patch
 create mode 100644 recipes/binutils/binutils-2.20.1/libtool-rpath-fix.patch

diff --git a/recipes/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch b/recipes/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch
new file mode 100644
index 0000000..48523f8
--- /dev/null
+++ b/recipes/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch
@@ -0,0 +1,240 @@
+#!/bin/sh -e
+## 152_arm_branches_to_weak_symbols.dpatch
+##
+## DP: Description: http://sourceware.org/ml/binutils/2010-04/msg00446.html
+## DP: Description: taken from the trunk
+
+if [ $# -ne 1 ]; then
+    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+    exit 1
+fi
+
+[ -f debian/patches/00patch-opts ] && . debian/patches/00patch-opts
+patch_opts="${patch_opts:--f --no-backup-if-mismatch}"
+
+case "$1" in
+       -patch) patch $patch_opts -p0 < $0;;
+       -unpatch) patch $patch_opts -p0 -R < $0;;
+        *)
+                echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+                exit 1;;
+esac
+
+exit 0
+
+gas/
+
+2010-05-04  Nick Clifton  <nickc@redhat.com>
+
+	* write.c (fixup_segment): Revert previous delta.
+	* config/tc-arm.h (TC_FORCE_RELOCATION_LOCAL): Also force the
+	generation of relocations for fixups against weak symbols.
+
+2010-04-29  Nathan Sidwell  <nathan@codesourcery.com>
+
+	* write.c (fixup_segment): Do not assume we know the section a
+	defined weak symbol is in.
+	* config/tc-arm.c (relax_adr, relax_branch, md_apply_fix): Treat
+	weak symbols as not known to be in the same section, even if they
+	are defined.
+
+gas/testsuite/
+
+2010-04-29  Nathan Sidwell  <nathan@codesourcery.com>
+
+	* gas/arm/weakdef-1.s: New.
+	* gas/arm/weakdef-1.d: New.
+	* gas/arm/weakdef-2.s: New.
+	* gas/arm/weakdef-2.d: New.
+	* gas/arm/weakdef-2.l: New.
+
+@DPATCH@
+diff -urN gas.orig/config/tc-arm.c gas/config/tc-arm.c
+--- a/gas/config/tc-arm.c	2010-02-22 08:06:52.000000000 +0000
++++ b/gas/config/tc-arm.c	2010-05-06 12:52:25.391085365 +0000
+@@ -18207,7 +18207,8 @@
+ 
+   /* Assume worst case for symbols not known to be in the same section.  */
+   if (!S_IS_DEFINED (fragp->fr_symbol)
+-      || sec != S_GET_SEGMENT (fragp->fr_symbol))
++      || sec != S_GET_SEGMENT (fragp->fr_symbol)
++      || S_IS_WEAK (fragp->fr_symbol))
+     return 4;
+ 
+   val = relaxed_symbol_addr (fragp, stretch);
+@@ -18250,7 +18251,8 @@
+ 
+   /* Assume worst case for symbols not known to be in the same section.  */
+   if (!S_IS_DEFINED (fragp->fr_symbol)
+-      || sec != S_GET_SEGMENT (fragp->fr_symbol))
++      || sec != S_GET_SEGMENT (fragp->fr_symbol)
++      || S_IS_WEAK (fragp->fr_symbol))
+     return 4;
+ 
+ #ifdef OBJ_ELF
+@@ -19463,22 +19465,23 @@
+ 	 not have a reloc for it, so tc_gen_reloc will reject it.  */
+       fixP->fx_done = 1;
+ 
+-      if (fixP->fx_addsy
+-	  && ! S_IS_DEFINED (fixP->fx_addsy))
++      if (fixP->fx_addsy)
+ 	{
+-	  as_bad_where (fixP->fx_file, fixP->fx_line,
+-			_("undefined symbol %s used as an immediate value"),
+-			S_GET_NAME (fixP->fx_addsy));
+-	  break;
+-	}
++	  const char *msg = 0;
+ 
+-      if (fixP->fx_addsy
+-	  && S_GET_SEGMENT (fixP->fx_addsy) != seg)
+-	{
+-	  as_bad_where (fixP->fx_file, fixP->fx_line,
+-			_("symbol %s is in a different section"),
+-			S_GET_NAME (fixP->fx_addsy));
+-	  break;
++	  if (! S_IS_DEFINED (fixP->fx_addsy))
++	    msg = _("undefined symbol %s used as an immediate value");
++	  else if (S_GET_SEGMENT (fixP->fx_addsy) != seg)
++	    msg = _("symbol %s is in a different section");
++	  else if (S_IS_WEAK (fixP->fx_addsy))
++	    msg = _("symbol %s is weak and may be overridden later");
++
++	  if (msg)
++	    {
++	      as_bad_where (fixP->fx_file, fixP->fx_line,
++			    msg, S_GET_NAME (fixP->fx_addsy));
++	      break;
++	    }
+ 	}
+ 
+       newimm = encode_arm_immediate (value);
+@@ -19504,24 +19507,25 @@
+ 	unsigned int highpart = 0;
+ 	unsigned int newinsn  = 0xe1a00000; /* nop.  */
+ 
+-	if (fixP->fx_addsy
+-	    && ! S_IS_DEFINED (fixP->fx_addsy))
++	if (fixP->fx_addsy)
+ 	  {
+-	    as_bad_where (fixP->fx_file, fixP->fx_line,
+-			  _("undefined symbol %s used as an immediate value"),
+-			  S_GET_NAME (fixP->fx_addsy));
+-	    break;
+-	  }
++	    const char *msg = 0;
+ 
+-	if (fixP->fx_addsy
+-	    && S_GET_SEGMENT (fixP->fx_addsy) != seg)
+-	  {
+-	    as_bad_where (fixP->fx_file, fixP->fx_line,
+-			  _("symbol %s is in a different section"),
+-			  S_GET_NAME (fixP->fx_addsy));
+-	    break;
++	    if (! S_IS_DEFINED (fixP->fx_addsy))
++	      msg = _("undefined symbol %s used as an immediate value");
++	    else if (S_GET_SEGMENT (fixP->fx_addsy) != seg)
++	      msg = _("symbol %s is in a different section");
++	    else if (S_IS_WEAK (fixP->fx_addsy))
++	      msg = _("symbol %s is weak and may be overridden later");
++
++	    if (msg)
++	      {
++		as_bad_where (fixP->fx_file, fixP->fx_line,
++			      msg, S_GET_NAME (fixP->fx_addsy));
++		break;
++	      }
+ 	  }
+-
++	
+ 	newimm = encode_arm_immediate (value);
+ 	temp = md_chars_to_number (buf, INSN_SIZE);
+ 
+diff -urN gas.orig/config/tc-arm.h gas/config/tc-arm.h
+--- a/gas/config/tc-arm.h	2009-09-01 00:24:01.000000000 +0000
++++ b/gas/config/tc-arm.h	2010-05-06 12:53:42.784835970 +0000
+@@ -183,6 +183,7 @@
+   (!(FIX)->fx_pcrel					\
+    || (FIX)->fx_r_type == BFD_RELOC_ARM_GOT32		\
+    || (FIX)->fx_r_type == BFD_RELOC_32			\
++   || ((FIX)->fx_addsy != NULL && S_IS_WEAK ((FIX)->fx_addsy))	\
+    || TC_FORCE_RELOCATION (FIX))
+ 
+ /* Force output of R_ARM_REL32 relocations against thumb function symbols.
+diff -urN gas.orig/testsuite/gas/arm/weakdef-1.d gas/testsuite/gas/arm/weakdef-1.d
+--- a/gas/testsuite/gas/arm/weakdef-1.d	1970-01-01 00:00:00.000000000 +0000
++++ b/gas/testsuite/gas/arm/weakdef-1.d	2010-05-06 12:52:25.391085365 +0000
+@@ -0,0 +1,20 @@
++# name: Thumb branch to weak
++# as:
++# objdump: -dr
++# This test is only valid on ELF based ports.
++#not-target: *-*-*coff *-*-pe *-*-wince *-*-*aout* *-*-netbsd *-*-riscix*
++
++.*: +file format .*arm.*
++
++
++Disassembly of section .text:
++
++0+000 <Weak>:
++   0:	e7fe      	b.n	2 <Strong>
++			0: R_ARM_THM_JUMP11	Strong
++
++0+002 <Strong>:
++   2:	f7ff bffe 	b.w	0 <Random>
++			2: R_ARM_THM_JUMP24	Random
++   6:	f7ff bffe 	b.w	0 <Weak>
++			6: R_ARM_THM_JUMP24	Weak
+diff -urN gas.orig/testsuite/gas/arm/weakdef-1.s gas/testsuite/gas/arm/weakdef-1.s
+--- a/gas/testsuite/gas/arm/weakdef-1.s	1970-01-01 00:00:00.000000000 +0000
++++ b/gas/testsuite/gas/arm/weakdef-1.s	2010-05-06 12:52:25.391085365 +0000
+@@ -0,0 +1,18 @@
++	.syntax unified
++	.text
++	.thumb
++
++	.globl	Weak
++	.weak	Weak
++	.thumb_func
++	.type	Weak, %function
++Weak:
++	b	Strong
++	.size	Weak, .-Weak
++	
++	.globl	Strong
++	.type	Strong, %function
++Strong:
++	b	Random
++	b	Weak
++	.size	Strong, .-Strong
+diff -urN gas.orig/testsuite/gas/arm/weakdef-2.d gas/testsuite/gas/arm/weakdef-2.d
+--- a/gas/testsuite/gas/arm/weakdef-2.d	1970-01-01 00:00:00.000000000 +0000
++++ b/gas/testsuite/gas/arm/weakdef-2.d	2010-05-06 12:52:25.391085365 +0000
+@@ -0,0 +1,5 @@
++# name: adr of weak
++# as:
++# error-output: weakdef-2.l
++# This test is only valid on ELF based ports.
++#not-target: *-*-*coff *-*-pe *-*-wince *-*-*aout* *-*-netbsd *-*-riscix*
+diff -urN gas.orig/testsuite/gas/arm/weakdef-2.l gas/testsuite/gas/arm/weakdef-2.l
+--- a/gas/testsuite/gas/arm/weakdef-2.l	1970-01-01 00:00:00.000000000 +0000
++++ b/gas/testsuite/gas/arm/weakdef-2.l	2010-05-06 12:52:25.391085365 +0000
+@@ -0,0 +1,3 @@
++[^:]*: Assembler messages:
++[^:]*:9: Error: symbol Weak is weak and may be overridden later
++[^:]*:10: Error: symbol Weak is weak and may be overridden later
+diff -urN gas.orig/testsuite/gas/arm/weakdef-2.s gas/testsuite/gas/arm/weakdef-2.s
+--- a/gas/testsuite/gas/arm/weakdef-2.s	1970-01-01 00:00:00.000000000 +0000
++++ b/gas/testsuite/gas/arm/weakdef-2.s	2010-05-06 12:52:25.391085365 +0000
+@@ -0,0 +1,10 @@
++	.syntax unified
++	.text
++	.globl	Strong
++Strong:	
++	adrl	r0,Strong
++	adr	r0,Strong
++	.globl	Weak
++	.weak	Weak
++Weak:	adrl	r0,Weak
++	adr	r0,Weak
diff --git a/recipes/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch b/recipes/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch
new file mode 100644
index 0000000..ac81685
--- /dev/null
+++ b/recipes/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch
@@ -0,0 +1,65 @@
+#! /bin/sh /usr/share/dpatch/dpatch-run
+## 200_elflink_%B_fixes.dpatch by  <kirr@landau.phys.spbu.ru>
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Description: Fixes several msgs; needed for later elflink patches
+## DP: Upstream status: submitted upstream for binutils-2_20-branch
+
+2010-08-07  Kirill Smelkov  <kirr@landau.phys.spbu.ru>
+
+	Backport from mainline:
+	2009-10-12  Roland McGrath  <roland@frob.com>
+
+	* elflink.c (elf_link_add_object_symbols, _bfd_elf_merge_symbol):
+	Fix %s that should be %B in several message formats.
+
+@DPATCH@
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index c42c6e1..4a348de 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -1110,19 +1110,19 @@ _bfd_elf_merge_symbol (bfd *abfd,
+ 
+       if (tdef && ntdef)
+ 	(*_bfd_error_handler)
+-	  (_("%s: TLS definition in %B section %A mismatches non-TLS definition in %B section %A"),
++	  (_("%B: TLS definition in %B section %A mismatches non-TLS definition in %B section %A"),
+ 	   tbfd, tsec, ntbfd, ntsec, h->root.root.string);
+       else if (!tdef && !ntdef)
+ 	(*_bfd_error_handler)
+-	  (_("%s: TLS reference in %B mismatches non-TLS reference in %B"),
++	  (_("%B: TLS reference in %B mismatches non-TLS reference in %B"),
+ 	   tbfd, ntbfd, h->root.root.string);
+       else if (tdef)
+ 	(*_bfd_error_handler)
+-	  (_("%s: TLS definition in %B section %A mismatches non-TLS reference in %B"),
++	  (_("%B: TLS definition in %B section %A mismatches non-TLS reference in %B"),
+ 	   tbfd, tsec, ntbfd, h->root.root.string);
+       else
+ 	(*_bfd_error_handler)
+-	  (_("%s: TLS reference in %B mismatches non-TLS definition in %B section %A"),
++	  (_("%B: TLS reference in %B mismatches non-TLS definition in %B section %A"),
+ 	   tbfd, ntbfd, ntsec, h->root.root.string);
+ 
+       bfd_set_error (bfd_error_bad_value);
+@@ -4437,7 +4437,7 @@ error_free_dyn:
+ 	      if ((elf_dyn_lib_class (abfd) & DYN_NO_NEEDED) != 0)
+ 		{
+ 		  (*_bfd_error_handler)
+-		    (_("%s: invalid DSO for symbol `%s' definition"),
++		    (_("%B: invalid DSO for symbol `%s' definition"),
+ 		     abfd, name);
+ 		  bfd_set_error (bfd_error_bad_value);
+ 		  goto error_free_vers;
+@@ -12495,7 +12495,7 @@ _bfd_elf_get_dynamic_reloc_section (bfd *       abfd,
+    section does not exist it is created and attached to the DYNOBJ
+    bfd and stored in the SRELOC field of SEC's elf_section_data
+    structure.
+-   
++
+    ALIGNMENT is the alignment for the newly created section and
+    IS_RELA defines whether the name should be .rela.<SEC's name>
+    or .rel.<SEC's name>.  The section name is looked up in the
+-- 
+1.7.2.1.44.g721e7
+
diff --git a/recipes/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch b/recipes/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
new file mode 100644
index 0000000..85675a3
--- /dev/null
+++ b/recipes/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
@@ -0,0 +1,70 @@
+#! /bin/sh /usr/share/dpatch/dpatch-run
+## 201_elflink_improve_errors.dpatch by  <kirr@landau.phys.spbu.ru>
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Improves error messages regarding -no-add-needed cases; needed for 
+## DP: later elflink patches
+## DP: Upstream status: submitted upstream for binutils-2_20-branch
+
+2010-08-07  Kirill Smelkov  <kirr@landau.phys.spbu.ru>
+
+	Backport from mainline:
+	2009-11-05  Nick Clifton  <nickc@redhat.com>
+
+	* elflink.c (elf_link_add_object_symbols): Improve error
+	message generated when a symbol is left unresolved because a
+	--no-add-needed command line option has prevented the
+	inclusion of the DSO defining it.
+
+@DPATCH@
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 4a348de..10eee8c 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -3866,6 +3866,7 @@ error_free_dyn:
+       bfd_boolean common;
+       unsigned int old_alignment;
+       bfd *old_bfd;
++      bfd * undef_bfd = NULL;
+ 
+       override = FALSE;
+ 
+@@ -4097,6 +4098,20 @@ error_free_dyn:
+ 	      name = newname;
+ 	    }
+ 
++	  /* If this is a definition of a previously undefined symbol
++	     make a note of the bfd that contained the reference in
++	     case we need to refer to it later on in error messages.  */
++	  if (! bfd_is_und_section (sec))
++	    {
++	      h = elf_link_hash_lookup (elf_hash_table (info), name, FALSE, FALSE, FALSE);
++
++	      if (h != NULL
++		  && (h->root.type == bfd_link_hash_undefined
++		      || h->root.type == bfd_link_hash_undefweak)
++		  && h->root.u.undef.abfd)
++		undef_bfd = h->root.u.undef.abfd;
++	    }
++
+ 	  if (!_bfd_elf_merge_symbol (abfd, info, name, isym, &sec,
+ 				      &value, &old_alignment,
+ 				      sym_hash, &skip, &override,
+@@ -4437,9 +4452,12 @@ error_free_dyn:
+ 	      if ((elf_dyn_lib_class (abfd) & DYN_NO_NEEDED) != 0)
+ 		{
+ 		  (*_bfd_error_handler)
+-		    (_("%B: invalid DSO for symbol `%s' definition"),
++		    (_("%B: undefined reference to symbol '%s'"),
++		     undef_bfd == NULL ? info->output_bfd : undef_bfd, name);
++		  (*_bfd_error_handler)
++		    (_("note: '%s' is defined in DSO %B so try adding it to the linker command line"),
+ 		     abfd, name);
+-		  bfd_set_error (bfd_error_bad_value);
++		  bfd_set_error (bfd_error_invalid_operation);
+ 		  goto error_free_vers;
+ 		}
+ 
+-- 
+1.7.2.1.44.g721e7
+
diff --git a/recipes/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch b/recipes/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch
new file mode 100644
index 0000000..a7dbc7a
--- /dev/null
+++ b/recipes/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch
@@ -0,0 +1,87 @@
+#! /bin/sh /usr/share/dpatch/dpatch-run
+## 202_elflink_noaddneeded_vs_weak.dpatch by  <kirr@landau.phys.spbu.ru>
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Fixes '-no-add-needed breaks linking with weak symbols'
+## DP: Upstream status: submitted upstream for binutils-2_20-branch
+
+
+2010-08-07  Kirill Smelkov  <kirr@landau.phys.spbu.ru>
+
+	Backport from mainline:
+	2010-01-21  Nick Clifton  <nickc@redhat.com>
+
+	* elflink.c (elf_link_add_object_symbols): Look up name of
+	undefined symbol both before and after versioning has been
+	applied.  Do not bother with symbols that are weakly undefined.
+
+
+@DPATCH@
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 10eee8c..e058064 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -3991,6 +3991,20 @@ error_free_dyn:
+ 	  unsigned int vernum = 0;
+ 	  bfd_boolean skip;
+ 
++	  /* If this is a definition of a symbol which was previously
++	     referenced in a non-weak manner then make a note of the bfd
++	     that contained the reference.  This is used if we need to
++	     refer to the source of the reference later on.  */
++	  if (! bfd_is_und_section (sec))
++	    {
++	      h = elf_link_hash_lookup (elf_hash_table (info), name, FALSE, FALSE, FALSE);
++
++	      if (h != NULL
++		  && h->root.type == bfd_link_hash_undefined
++		  && h->root.u.undef.abfd)
++		undef_bfd = h->root.u.undef.abfd;
++	    }
++	  
+ 	  if (ever == NULL)
+ 	    {
+ 	      if (info->default_imported_symver)
+@@ -4098,16 +4112,15 @@ error_free_dyn:
+ 	      name = newname;
+ 	    }
+ 
+-	  /* If this is a definition of a previously undefined symbol
+-	     make a note of the bfd that contained the reference in
+-	     case we need to refer to it later on in error messages.  */
+-	  if (! bfd_is_und_section (sec))
++	  /* If necessary, make a second attempt to locate the bfd
++	     containing an unresolved, non-weak reference to the
++	     current symbol.  */
++	  if (! bfd_is_und_section (sec) && undef_bfd == NULL)
+ 	    {
+ 	      h = elf_link_hash_lookup (elf_hash_table (info), name, FALSE, FALSE, FALSE);
+ 
+ 	      if (h != NULL
+-		  && (h->root.type == bfd_link_hash_undefined
+-		      || h->root.type == bfd_link_hash_undefweak)
++		  && h->root.type == bfd_link_hash_undefined
+ 		  && h->root.u.undef.abfd)
+ 		undef_bfd = h->root.u.undef.abfd;
+ 	    }
+@@ -4448,12 +4461,14 @@ error_free_dyn:
+ 	      /* A symbol from a library loaded via DT_NEEDED of some
+ 		 other library is referenced by a regular object.
+ 		 Add a DT_NEEDED entry for it.  Issue an error if
+-		 --no-add-needed is used.  */
+-	      if ((elf_dyn_lib_class (abfd) & DYN_NO_NEEDED) != 0)
++		 --no-add-needed is used and the reference was not
++		 a weak one.  */
++	      if (undef_bfd != NULL
++		  && (elf_dyn_lib_class (abfd) & DYN_NO_NEEDED) != 0)
+ 		{
+ 		  (*_bfd_error_handler)
+ 		    (_("%B: undefined reference to symbol '%s'"),
+-		     undef_bfd == NULL ? info->output_bfd : undef_bfd, name);
++		     undef_bfd, name);
+ 		  (*_bfd_error_handler)
+ 		    (_("note: '%s' is defined in DSO %B so try adding it to the linker command line"),
+ 		     abfd, name);
+-- 
+1.7.2.1.44.g721e7
+
diff --git a/recipes/binutils/binutils-2.20.1/binutils-mips-pie.patch b/recipes/binutils/binutils-2.20.1/binutils-mips-pie.patch
new file mode 100644
index 0000000..c71f0ad
--- /dev/null
+++ b/recipes/binutils/binutils-2.20.1/binutils-mips-pie.patch
@@ -0,0 +1,29 @@
+# "-fPIE" always triggers segmentation fault in ld.so.1 on mips platform,
+# which was first saw on dbus-daemon. Below borrow the binutils fix from
+# binutils bugzilla:
+#
+#	http://sourceware.org/bugzilla/show_bug.cgi?id=10858
+#
+# Its commit message says:
+#	* elfxx-mips.c (mips_elf_create_dynamic_relocation): Use section
+#	sym dynindx for relocs against defined syms in PIEs.
+#
+# It's in upstream CVS now (rev 1.267), but not in current release
+#
+# By Kevin Tian <kevin.tian@intel.com>, 2010-07-15
+
+diff --git a/elfxx-mips.c b/elfxx-mips.c
+index 3a1c8ba..f6c2c1c 100644
+--- binutils-2.20.1.orig/bfd/elfxx-mips.c
++++ binutils-2.20.1/bfd/elfxx-mips.c
+@@ -5688,9 +5688,7 @@ mips_elf_create_dynamic_relocation (bfd *output_bfd,
+ 
+   /* We must now calculate the dynamic symbol table index to use
+      in the relocation.  */
+-  if (h != NULL
+-      && (!h->root.def_regular
+-	  || (info->shared && !info->symbolic && !h->root.forced_local)))
++  if (h != NULL && ! SYMBOL_REFERENCES_LOCAL (info, &h->root))
+     {
+       indx = h->root.dynindx;
+       if (SGI_COMPAT (output_bfd))
diff --git a/recipes/binutils/binutils-2.20.1/binutils-poison.patch b/recipes/binutils/binutils-2.20.1/binutils-poison.patch
new file mode 100644
index 0000000..c2f1927
--- /dev/null
+++ b/recipes/binutils/binutils-2.20.1/binutils-poison.patch
@@ -0,0 +1,253 @@
+This patch is recived from Mark Hatle
+
+purpose:  warn for uses of system directories when cross linking
+
+Signed-Off-By: Mark Hatle <mark.hatle@windriver.com>
+
+Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
+
+2008-07-02  Joseph Myers  <joseph@codesourcery.com>
+
+	ld/
+	* ld.h (args_type): Add error_poison_system_directories.
+	* ld.texinfo (--error-poison-system-directories): Document.
+	* ldfile.c (ldfile_add_library_path): Check
+	command_line.error_poison_system_directories.
+	* ldmain.c (main): Initialize
+	command_line.error_poison_system_directories.
+	* lexsup.c (enum option_values): Add
+	OPTION_ERROR_POISON_SYSTEM_DIRECTORIES.
+	(ld_options): Add --error-poison-system-directories.
+	(parse_args): Handle new option.	
+
+2007-06-13  Joseph Myers  <joseph@codesourcery.com>
+
+	ld/
+	* config.in: Regenerate.
+	* ld.h (args_type): Add poison_system_directories.
+	* ld.texinfo (--no-poison-system-directories): Document.
+	* ldfile.c (ldfile_add_library_path): Check
+	command_line.poison_system_directories.
+	* ldmain.c (main): Initialize
+	command_line.poison_system_directories.
+	* lexsup.c (enum option_values): Add
+	OPTION_NO_POISON_SYSTEM_DIRECTORIES.
+	(ld_options): Add --no-poison-system-directories.
+	(parse_args): Handle new option.
+
+2007-04-20  Joseph Myers  <joseph@codesourcery.com>
+
+	Merge from Sourcery G++ binutils 2.17:
+
+	2007-03-20  Joseph Myers  <joseph@codesourcery.com>
+	Based on patch by Mark Hatle <mark.hatle@windriver.com>.
+	ld/
+	* configure.in (--enable-poison-system-directories): New option.
+	* configure, config.in: Regenerate.
+	* ldfile.c (ldfile_add_library_path): If
+	ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
+	/usr/lib, /usr/local/lib or /usr/X11R6/lib.
+
+Index: binutils-2.20.1/ld/config.in
+===================================================================
+--- binutils-2.20.1.orig/ld/config.in
++++ binutils-2.20.1/ld/config.in
+@@ -4,6 +4,9 @@
+    language is requested. */
+ #undef ENABLE_NLS
+ 
++/* Define to warn for use of native system library directories */
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++
+ /* Additional extension a shared object might have. */
+ #undef EXTRA_SHLIB_EXTENSION
+ 
+Index: binutils-2.20.1/ld/configure.in
+===================================================================
+--- binutils-2.20.1.orig/ld/configure.in
++++ binutils-2.20.1/ld/configure.in
+@@ -69,6 +69,16 @@ AC_SUBST(use_sysroot)
+ AC_SUBST(TARGET_SYSTEM_ROOT)
+ AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
+ 
++AC_ARG_ENABLE([poison-system-directories],
++	      AS_HELP_STRING([--enable-poison-system-directories],
++			     [warn for use of native system library directories]),,
++	      [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++	    [1],
++	    [Define to warn for use of native system library directories])
++fi
++
+ AC_ARG_ENABLE([got],
+ AS_HELP_STRING([--enable-got=<type>],
+                [GOT handling scheme (target, single, negative, multigot)]),
+Index: binutils-2.20.1/ld/ld.h
+===================================================================
+--- binutils-2.20.1.orig/ld/ld.h
++++ binutils-2.20.1/ld/ld.h
+@@ -176,6 +176,14 @@ typedef struct {
+      input files.  */
+   bfd_boolean accept_unknown_input_arch;
+ 
++  /* If TRUE (the default) warn for uses of system directories when
++     cross linking.  */
++  bfd_boolean poison_system_directories;
++
++  /* If TRUE (default FALSE) give an error for uses of system
++     directories when cross linking instead of a warning.  */
++  bfd_boolean error_poison_system_directories;
++
+   /* Big or little endian as set on command line.  */
+   enum endian_enum endian;
+ 
+Index: binutils-2.20.1/ld/ld.texinfo
+===================================================================
+--- binutils-2.20.1.orig/ld/ld.texinfo
++++ binutils-2.20.1/ld/ld.texinfo
+@@ -2084,6 +2084,18 @@ string identifying the original linked f
+ 
+ Passing @code{none} for @var{style} disables the setting from any
+ @code{--build-id} options earlier on the command line.
++
++@kindex --no-poison-system-directories
++@item --no-poison-system-directories
++Do not warn for @option{-L} options using system directories such as
++@file{/usr/lib} when cross linking.  This option is intended for use
++in chroot environments when such directories contain the correct
++libraries for the target system rather than the host.
++
++@kindex --error-poison-system-directories
++@item --error-poison-system-directories
++Give an error instead of a warning for @option{-L} options using
++system directories when cross linking.
+ @end table
+ 
+ @c man end
+Index: binutils-2.20.1/ld/ldfile.c
+===================================================================
+--- binutils-2.20.1.orig/ld/ldfile.c
++++ binutils-2.20.1/ld/ldfile.c
+@@ -120,6 +120,23 @@ ldfile_add_library_path (const char *nam
+     {
+       new_dirs->name = xstrdup (name);
+       new_dirs->sysrooted = is_sysrooted_pathname (name, FALSE);
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++      if (command_line.poison_system_directories
++	  && ((!strncmp (name, "/lib", 4))
++	      || (!strncmp (name, "/usr/lib", 8))
++	      || (!strncmp (name, "/usr/local/lib", 14))
++	      || (!strncmp (name, "/usr/X11R6/lib", 14))))
++	{
++	  if (command_line.error_poison_system_directories)
++	    einfo (_("%X%P: error: library search path \"%s\" is unsafe for "
++		     "cross-compilation\n"), name);
++	  else
++	    einfo (_("%P: warning: library search path \"%s\" is unsafe for "
++		     "cross-compilation\n"), name);
++	}
++#endif
++
+     }
+ }
+ 
+Index: binutils-2.20.1/ld/ldmain.c
+===================================================================
+--- binutils-2.20.1.orig/ld/ldmain.c
++++ binutils-2.20.1/ld/ldmain.c
+@@ -252,6 +252,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = TRUE;
+   command_line.warn_search_mismatch = TRUE;
+   command_line.check_section_addresses = -1;
++  command_line.poison_system_directories = TRUE;
++  command_line.error_poison_system_directories = FALSE;
+ 
+   /* We initialize DEMANGLING based on the environment variable
+      COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+Index: binutils-2.20.1/ld/lexsup.c
+===================================================================
+--- binutils-2.20.1.orig/ld/lexsup.c
++++ binutils-2.20.1/ld/lexsup.c
+@@ -166,7 +166,9 @@ enum option_values
+   OPTION_WARN_SHARED_TEXTREL,
+   OPTION_WARN_ALTERNATE_EM,
+   OPTION_REDUCE_MEMORY_OVERHEADS,
+-  OPTION_DEFAULT_SCRIPT
++  OPTION_DEFAULT_SCRIPT,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES
+ };
+ 
+ /* The long options.  This structure is used for both the option
+@@ -575,6 +577,14 @@ static const struct ld_option ld_options
+     TWO_DASHES },
+   { {"wrap", required_argument, NULL, OPTION_WRAP},
+     '\0', N_("SYMBOL"), N_("Use wrapper functions for SYMBOL"), TWO_DASHES },
++  { {"no-poison-system-directories", no_argument, NULL,
++     OPTION_NO_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Do not warn for -L options using system directories"),
++    TWO_DASHES },
++  { {"error-poison-system-directories", no_argument, NULL,
++     OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++    '\0', NULL, N_("Give an error for -L options using system directories"),
++    TWO_DASHES },
+ };
+ 
+ #define OPTION_COUNT ARRAY_SIZE (ld_options)
+@@ -1480,6 +1490,14 @@ parse_args (unsigned argc, char **argv)
+               einfo (_("%P%X: --hash-size needs a numeric argument\n"));
+           }
+           break;
++
++	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
++	  command_line.poison_system_directories = FALSE;
++	  break;
++
++	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
++	  command_line.error_poison_system_directories = TRUE;
++	  break;
+ 	}
+     }
+ 
+diff -ur binutils-2.20.1.orig/ld/configure binutils-2.20.1/ld/configure
+--- binutils-2.20.1.orig/ld/configure	2010-03-03 08:06:22.000000000 -0600
++++ binutils-2.20.1/ld/configure	2010-09-30 11:19:35.776990594 -0500
+@@ -901,6 +904,7 @@
+ enable_targets
+ enable_64_bit_bfd
+ with_sysroot
++enable_poison_system_directories
+ enable_got
+ enable_werror
+ enable_build_warnings
+@@ -1548,6 +1552,8 @@
+ 			  (and sometimes confusing) to the casual installer
+   --enable-targets        alternative target configurations
+   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
++  --enable-poison-system-directories
++                          warn for use of native system library directories
+   --enable-got=<type>     GOT handling scheme (target, single, negative,
+                           multigot)
+   --enable-werror         treat compile warnings as errors
+@@ -4302,6 +4334,19 @@
+ 
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
++
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
++
+ # Check whether --enable-got was given.
+ if test "${enable_got+set}" = set; then :
+   enableval=$enable_got; case "${enableval}" in
diff --git a/recipes/binutils/binutils-2.20.1/libiberty_path_fix.patch b/recipes/binutils/binutils-2.20.1/libiberty_path_fix.patch
new file mode 100644
index 0000000..36a14d7
--- /dev/null
+++ b/recipes/binutils/binutils-2.20.1/libiberty_path_fix.patch
@@ -0,0 +1,20 @@
+don't let the distro compiler point to the wrong installation location
+
+Thanks to RP for helping find the source code causing the issue.
+
+2010/08/13
+Nitin A Kamble <nitin.a.kamble@intel.com>
+Index: binutils-2.20.1/libiberty/Makefile.in
+===================================================================
+--- binutils-2.20.1.orig/libiberty/Makefile.in
++++ binutils-2.20.1/libiberty/Makefile.in
+@@ -327,7 +327,8 @@ install: install_to_$(INSTALL_DEST) inst
+ # multilib-specific flags, it's overridden by FLAGS_TO_PASS from the
+ # default multilib, so we have to take CFLAGS into account as well,
+ # since it will be passed the multilib flags.
+-MULTIOSDIR = `$(CC) $(CFLAGS) -print-multi-os-directory`
++#MULTIOSDIR = `$(CC) $(CFLAGS) -print-multi-os-directory`
++MULTIOSDIR = ""
+ install_to_libdir: all
+ 	${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR)
+ 	$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n
diff --git a/recipes/binutils/binutils-2.20.1/libtool-rpath-fix.patch b/recipes/binutils/binutils-2.20.1/libtool-rpath-fix.patch
new file mode 100644
index 0000000..a0058c1
--- /dev/null
+++ b/recipes/binutils/binutils-2.20.1/libtool-rpath-fix.patch
@@ -0,0 +1,36 @@
+Enabling sysroot support in libtool exposed a bug where the final
+library had an RPATH encoded into it which still pointed to the
+sysroot. This works around the issue until it gets sorted out
+upstream.
+
+Fix suggested by Richard Purdie <richard.purdie@linuxfoundation.org> 
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+diff -urN binutils-2.21.orig//ltmain.sh binutils-2.21/ltmain.sh
+--- binutils-2.21.orig//ltmain.sh	2011-01-18 11:50:40.821710085 -0800
++++ binutils-2.21/ltmain.sh	2011-01-18 11:51:38.774952785 -0800
+@@ -8035,9 +8035,11 @@
+ 	  test "$opt_mode" != relink && rpath="$compile_rpath$rpath"
+ 	  for libdir in $rpath; do
+ 	    if test -n "$hardcode_libdir_flag_spec"; then
++		  func_replace_sysroot "$libdir"
++		  libdir=$func_replace_sysroot_result
++		  func_stripname '=' '' "$libdir"
++		  libdir=$func_stripname_result
+ 	      if test -n "$hardcode_libdir_separator"; then
+-		func_replace_sysroot "$libdir"
+-		libdir=$func_replace_sysroot_result
+ 		if test -z "$hardcode_libdirs"; then
+ 		  hardcode_libdirs="$libdir"
+ 		else
+@@ -8770,6 +8772,10 @@
+       hardcode_libdirs=
+       for libdir in $compile_rpath $finalize_rpath; do
+ 	if test -n "$hardcode_libdir_flag_spec"; then
++	  func_replace_sysroot "$libdir"
++	  libdir=$func_replace_sysroot_result
++	  func_stripname '=' '' "$libdir"
++	  libdir=$func_stripname_result
+ 	  if test -n "$hardcode_libdir_separator"; then
+ 	    if test -z "$hardcode_libdirs"; then
+ 	      hardcode_libdirs="$libdir"
diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
index 5154e2d..4c3b17b 100644
--- a/recipes/binutils/binutils_2.20.1.bb
+++ b/recipes/binutils/binutils_2.20.1.bb
@@ -1,13 +1,13 @@
 require binutils.inc
 LICENSE = "GPLv3"
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 EXTRA_OECONF += "--disable-werror"
 
 #COMPATIBLE_TARGET_SYS = "."
 
 SRC_URI = "\
-     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2;name=tarball \
+     ${GNU_MIRROR}/binutils/binutils-${PV}a.tar.bz2;name=tarball \
      file://binutils-uclibc-100-uclibc-conf.patch \
      file://110-arm-eabi-conf.patch \
      file://binutils-uclibc-300-001_ld_makefile_patch.patch \
@@ -16,7 +16,15 @@ SRC_URI = "\
      file://binutils-uclibc-gas-needs-libm.patch \
      file://binutils-x86_64_i386_biarch.patch \
      ${@['file://libtool-update.patch','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == 'yes']} \
+     file://binutils-mips-pie.patch \
      file://binutils-2.19.1-ld-sysroot.patch \
+     file://libiberty_path_fix.patch \
+     file://binutils-poison.patch \
+     file://libtool-rpath-fix.patch \
+     file://152_arm_branches_to_weak_symbols.patch \
+     file://200_elflink_%B_fixes.patch \
+     file://201_elflink_improve_noaddneeded_errors.patch \
+     file://202_elflink_noaddneeded_vs_weak.patch \
      "
 
 SRC_URI_append_nios2 =" \
@@ -24,8 +32,8 @@ SRC_URI_append_nios2 =" \
 	file://binutils-nios2.patch \
 	"
 
-SRC_URI[tarball.sha256sum] = "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8"
-SRC_URI[tarball.md5sum] = "9cdfb9d6ec0578c166d3beae5e15c4e5"
+SRC_URI[tarball.sha256sum] = "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
+SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
 
 # powerpc patches
 SRC_URI += "\
-- 
1.7.5.4



