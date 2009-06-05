Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MCZXT-0002FW-Hq
	for openembedded-devel@openembedded.org; Fri, 05 Jun 2009 15:32:55 +0200
Received: (qmail 29699 invoked by uid 813007); 5 Jun 2009 13:23:46 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Jun 2009 13:23:46 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri,  5 Jun 2009 15:24:30 +0200
Message-Id: <1244208273-14048-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
Subject: [PATCH 1/4] binutils: added Maverick support (done by Hasjim Williams)
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
X-List-Received-Date: Fri, 05 Jun 2009 13:32:57 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/binutils/binutils_2.18.bb            |    5 +-
 recipes/binutils/files/binutils-crunch.patch |  163 ++++++++++++++++++++++++++
 2 files changed, 167 insertions(+), 1 deletions(-)
 create mode 100644 recipes/binutils/files/binutils-crunch.patch

diff --git a/recipes/binutils/binutils_2.18.bb b/recipes/binutils/binutils_2.18.bb
index 0155fb1..3b650c6 100644
--- a/recipes/binutils/binutils_2.18.bb
+++ b/recipes/binutils/binutils_2.18.bb
@@ -1,4 +1,4 @@
-PR = "r5"
+PR = "r6"
 
 require binutils.inc
 LICENSE = "GPLv3"
@@ -18,3 +18,6 @@ SRC_URI = "\
 
 # powerpc patches
 SRC_URI += "file://binutils-2.16.1-e300c2c3.patch;patch=1"
+
+# ep93xx crunch patches
+SRC_URI_append_ep9312 = " file://binutils-crunch.patch;patch=1"
diff --git a/recipes/binutils/files/binutils-crunch.patch b/recipes/binutils/files/binutils-crunch.patch
new file mode 100644
index 0000000..79771aa
--- /dev/null
+++ b/recipes/binutils/files/binutils-crunch.patch
@@ -0,0 +1,163 @@
+--- binutils-2.18-original/gas/config/tc-arm.c	2007-05-18 13:45:49.000000000 +1000
++++ binutils-2.18/gas/config/tc-arm.c	2008-04-03 12:38:28.000000000 +1000
+@@ -3573,6 +3575,140 @@
+   ignore_rest_of_line ();
+ }
+ 
++/* Parse a directive saving Maverick Crunch double registers.  */
++
++static void
++s_arm_unwind_save_mvd (void)
++{
++  int reg;
++  int hi_reg;
++  int i;
++  unsigned mask = 0;
++  valueT op;
++
++  if (*input_line_pointer == '{')
++    input_line_pointer++;
++
++  do
++    {
++      reg = arm_reg_parse (&input_line_pointer, REG_TYPE_MVD);
++
++      if (reg == FAIL)
++	{
++	  as_bad (_(reg_expected_msgs[REG_TYPE_MVD]));
++	  goto error;
++	}
++
++      if (mask >> reg)
++        as_tsktsk (_("register list not in ascending order"));
++      mask |= 1 << reg;
++
++      if (*input_line_pointer == '-')
++	{
++	  input_line_pointer++;
++	  hi_reg = arm_reg_parse (&input_line_pointer, REG_TYPE_MVD);
++	  if (hi_reg == FAIL)
++	    {
++	      as_bad (_(reg_expected_msgs[REG_TYPE_MVD]));
++	      goto error;
++	    }
++	  else if (reg >= hi_reg)
++	    {
++	      as_bad (_("bad register range"));
++	      goto error;
++	    }
++	  for (; reg < hi_reg; reg++)
++	    mask |= 1 << reg;
++	}
++    }
++  while (skip_past_comma (&input_line_pointer) != FAIL);
++
++  if (*input_line_pointer == '}')
++    input_line_pointer++;
++
++  demand_empty_rest_of_line ();
++
++  /* Generate any deferred opcodes because we're going to be looking at
++     the list.	*/
++  flush_pending_unwind ();
++
++  for (i = 0; i < 16; i++)
++    {
++      if (mask & (1 << i))
++	unwind.frame_size += 8;
++    }
++
++  /* Attempt to combine with a previous opcode.	 We do this because gcc
++     likes to output separate unwind directives for a single block of
++     registers.	 */
++  if (unwind.opcode_count > 0)
++    {
++      i = unwind.opcodes[unwind.opcode_count - 1];
++      if ((i & 0xf8) == 0xd8)
++        {
++          i &= 7;
++          /* Only merge if the blocks are contiguous.  */
++          if (i < 6)
++	         {
++               if ((mask & 0xfe00) == (1 << 9))
++		        {
++                 mask |= ((1 << (i + 11)) - 1) & 0xfc00;
++                 unwind.opcode_count--;
++               }
++	         }
++          else if (i == 6 && unwind.opcode_count >= 2)
++	         {
++	      i = unwind.opcodes[unwind.opcode_count - 2];
++	      reg = i >> 4;
++	      i &= 0xf;
++
++	      op = 0xffff << (reg - 1);
++         if (reg > 0
++		     && ((mask & op) == (1u << (reg - 1))))
++		   {
++		     op = (1 << (reg + i + 1)) - 1;
++		     op &= ~((1 << reg) - 1);
++		     mask |= op;
++		     unwind.opcode_count -= 2;
++		   }
++        }
++      }
++    }
++
++  hi_reg = 15;
++  /* We want to generate opcodes in the order the registers have been
++     saved, ie. descending order.  */
++  for (reg = 15; reg >= -1; reg--)
++    {
++      /* Save registers in blocks.  */
++      if (reg < 0
++	  || !(mask & (1 << reg)))
++	{
++	  /* We found an unsaved reg.  Generate opcodes to save the
++	     preceeding block.	*/
++	  if (reg != hi_reg)
++	    {
++	      if (reg == 9)
++		{
++		  /* Short form.  */
++		  op = 0xd8 | (hi_reg - 10);
++		  add_unwind_opcode (op, 1);
++		}
++	      else
++		{
++		  /* Long form.	 */
++		  op = 0xde00 | ((reg + 1) << 4) | ((hi_reg - reg) - 1);
++		  add_unwind_opcode (op, 2);
++		}
++	    }
++	  hi_reg = reg - 1;
++	}
++    }
++
++  return;
++error:
++  ignore_rest_of_line ();
++}
+ 
+ /* Parse an unwind_save directive.
+    If the argument is non-zero, this is a .vsave directive.  */
+@@ -3624,6 +3760,8 @@
+     case REG_TYPE_MMXWR:  s_arm_unwind_save_mmxwr ();  return;
+     case REG_TYPE_MMXWCG: s_arm_unwind_save_mmxwcg (); return;
+ 
++    case REG_TYPE_MVD:    s_arm_unwind_save_mvd (); return;    
++
+     default:
+       as_bad (_(".unwind_save does not support this kind of register"));
+       ignore_rest_of_line ();
+@@ -14256,8 +14394,8 @@
+   REGDEF(FPSID,0,VFC), REGDEF(FPSCR,1,VFC), REGDEF(FPEXC,8,VFC),
+ 
+   /* Maverick DSP coprocessor registers.  */
+-  REGSET(mvf,MVF),  REGSET(mvd,MVD),  REGSET(mvfx,MVFX),  REGSET(mvdx,MVDX),
+-  REGSET(MVF,MVF),  REGSET(MVD,MVD),  REGSET(MVFX,MVFX),  REGSET(MVDX,MVDX),
++  REGSET(mv,MVD),  REGSET(mvf,MVF),  REGSET(mvd,MVD),  REGSET(mvfx,MVFX),  REGSET(mvdx,MVDX),
++  REGSET(MV,MVD),  REGSET(MVF,MVF),  REGSET(MVD,MVD),  REGSET(MVFX,MVFX),  REGSET(MVDX,MVDX),
+ 
+   REGNUM(mvax,0,MVAX), REGNUM(mvax,1,MVAX),
+   REGNUM(mvax,2,MVAX), REGNUM(mvax,3,MVAX),
-- 
1.6.3.1





