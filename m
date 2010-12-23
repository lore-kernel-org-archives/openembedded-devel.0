Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVgcj-0006Ad-3q for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 09:34:09 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVgcV-0002od-07 for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 09:33:55 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 09:33:54 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 09:33:54 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 23 Dec 2010 09:33:37 +0100
Message-ID: <iev1h1$u4m$1@dough.gmane.org>
References: <1292911102-13199-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1292911102-13199-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] gcc-4.5: Apply patches upto 2010.12 release of linaro gcc
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
X-List-Received-Date: Thu, 23 Dec 2010 08:34:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 21-12-10 06:58, Khem Raj wrote:
> This patch brings in more Linaro patches. So far I have built a x11-image
> for qemuarm and it has shown no issues. I plan to test it more thoroughly
> in coming days on different arches and different images and also run gcc
> regression testsuite for them. But while I do this I wanted to bring it to
> everyone who would be interested to try and test the patch out and report
> any issues one sees and we could weed them out before installing this patch
> 
> -Khem
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Koen Kooi <koen@openembedded.org>

Tested for armv7a


> ---
>  recipes/gcc/gcc-4.5.inc                            |   20 +-
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch |   94 ++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch |  114 ++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch |  687 +++++++++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch |  128 ++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch |   41 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch | 1257 ++++++++++++++++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch |   70 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch |   40 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch |   30 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch |   32 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch |  209 +++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch |   27 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch | 1500 ++++++++++++++++++++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch |   78 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch |   33 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch |   23 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch |  873 ++++++++++++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch |  183 +++
>  19 files changed, 5438 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch
> 
> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
> index a44fe1a..d5c17e7 100644
> --- a/recipes/gcc/gcc-4.5.inc
> +++ b/recipes/gcc/gcc-4.5.inc
> @@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
>  
>  
> -INC_PR = "r26"
> +INC_PR = "r27"
>  
>  SRCREV = "167948"
>  PV = "4.5"
> @@ -136,6 +136,24 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
>  	   file://linaro/gcc-4.5-linaro-r99418.patch \
>  	   file://linaro/gcc-4.5-linaro-r99419.patch \
>  	   file://linaro/gcc-4.5-linaro-r99420.patch \
> +	   file://linaro/gcc-4.5-linaro-r99421.patch \
> +	   file://linaro/gcc-4.5-linaro-r99423.patch \
> +	   file://linaro/gcc-4.5-linaro-r99424.patch \
> +	   file://linaro/gcc-4.5-linaro-r99425.patch \
> +	   file://linaro/gcc-4.5-linaro-r99426.patch \
> +	   file://linaro/gcc-4.5-linaro-r99429.patch \
> +	   file://linaro/gcc-4.5-linaro-r99432.patch \
> +	   file://linaro/gcc-4.5-linaro-r99433.patch \
> +	   file://linaro/gcc-4.5-linaro-r99434.patch \
> +	   file://linaro/gcc-4.5-linaro-r99435.patch \
> +	   file://linaro/gcc-4.5-linaro-r99436.patch \
> +	   file://linaro/gcc-4.5-linaro-r99437.patch \
> +	   file://linaro/gcc-4.5-linaro-r99439.patch \
> +	   file://linaro/gcc-4.5-linaro-r99440.patch \
> +	   file://linaro/gcc-4.5-linaro-r99441.patch \
> +	   file://linaro/gcc-4.5-linaro-r99442.patch \
> +	   file://linaro/gcc-4.5-linaro-r99443.patch \
> +	   file://linaro/gcc-4.5-linaro-r99444.patch \
>  	   file://gcc-scalar-widening-pr45847.patch \
>  	   file://gcc-arm-qihi-split-PR46883.patch \
>  	  "
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch
> new file mode 100644
> index 0000000..3a45ee5
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch
> @@ -0,0 +1,94 @@
> +2010-10-20  Nathan Froyd  <froydnj@codesourcery.com>
> +
> +	Issue #9781
> +
> +	Backport from mainline:
> +
> +	gcc/
> +	2010-10-20  Nathan Froyd  <froydnj@codesourcery.com>
> +
> +	* ifcvt.c (noce_emit_cmove): If both of the values are SUBREGs, try
> +	emitting the conditional move in the inner mode of the SUBREG.
> +
> +
> +=== modified file 'gcc/ifcvt.c'
> +--- old/gcc/ifcvt.c	2010-10-15 10:01:07 +0000
> ++++ new/gcc/ifcvt.c	2010-11-04 12:11:15 +0000
> +@@ -1338,6 +1338,9 @@
> + noce_emit_cmove (struct noce_if_info *if_info, rtx x, enum rtx_code code,
> + 		 rtx cmp_a, rtx cmp_b, rtx vfalse, rtx vtrue)
> + {
> ++  rtx target;
> ++  int unsignedp;
> ++
> +   /* If earliest == jump, try to build the cmove insn directly.
> +      This is helpful when combine has created some complex condition
> +      (like for alpha's cmovlbs) that we can't hope to regenerate
> +@@ -1372,10 +1375,62 @@
> +     return NULL_RTX;
> + 
> + #if HAVE_conditional_move
> +-  return emit_conditional_move (x, code, cmp_a, cmp_b, VOIDmode,
> +-				vtrue, vfalse, GET_MODE (x),
> +-			        (code == LTU || code == GEU
> +-				 || code == LEU || code == GTU));
> ++  unsignedp = (code == LTU || code == GEU
> ++	       || code == LEU || code == GTU);
> ++
> ++  target = emit_conditional_move (x, code, cmp_a, cmp_b, VOIDmode,
> ++				  vtrue, vfalse, GET_MODE (x),
> ++				  unsignedp);
> ++  if (target)
> ++    return target;
> ++
> ++  /* We might be faced with a situation like:
> ++
> ++     x = (reg:M TARGET)
> ++     vtrue = (subreg:M (reg:N VTRUE) BYTE)
> ++     vfalse = (subreg:M (reg:N VFALSE) BYTE)
> ++
> ++     We can't do a conditional move in mode M, but it's possible that we
> ++     could do a conditional move in mode N instead and take a subreg of
> ++     the result.
> ++
> ++     If we can't create new pseudos, though, don't bother.  */
> ++  if (reload_completed)
> ++    return NULL_RTX;
> ++
> ++  if (GET_CODE (vtrue) == SUBREG && GET_CODE (vfalse) == SUBREG)
> ++    {
> ++      rtx reg_vtrue = SUBREG_REG (vtrue);
> ++      rtx reg_vfalse = SUBREG_REG (vfalse);
> ++      unsigned int byte_vtrue = SUBREG_BYTE (vtrue);
> ++      unsigned int byte_vfalse = SUBREG_BYTE (vfalse);
> ++      rtx promoted_target;
> ++
> ++      if (GET_MODE (reg_vtrue) != GET_MODE (reg_vfalse)
> ++	  || byte_vtrue != byte_vfalse
> ++	  || (SUBREG_PROMOTED_VAR_P (vtrue)
> ++	      != SUBREG_PROMOTED_VAR_P (vfalse))
> ++	  || (SUBREG_PROMOTED_UNSIGNED_P (vtrue)
> ++	      != SUBREG_PROMOTED_UNSIGNED_P (vfalse)))
> ++	return NULL_RTX;
> ++
> ++      promoted_target = gen_reg_rtx (GET_MODE (reg_vtrue));
> ++
> ++      target = emit_conditional_move (promoted_target, code, cmp_a, cmp_b,
> ++				      VOIDmode, reg_vtrue, reg_vfalse,
> ++				      GET_MODE (reg_vtrue), unsignedp);
> ++      /* Nope, couldn't do it in that mode either.  */
> ++      if (!target)
> ++	return NULL_RTX;
> ++
> ++      target = gen_rtx_SUBREG (GET_MODE (vtrue), promoted_target, byte_vtrue);
> ++      SUBREG_PROMOTED_VAR_P (target) = SUBREG_PROMOTED_VAR_P (vtrue);
> ++      SUBREG_PROMOTED_UNSIGNED_SET (target, SUBREG_PROMOTED_UNSIGNED_P (vtrue));
> ++      emit_move_insn (x, target);
> ++      return x;
> ++    }
> ++  else
> ++    return NULL_RTX;
> + #else
> +   /* We'll never get here, as noce_process_if_block doesn't call the
> +      functions involved.  Ifdef code, however, should be discouraged
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch
> new file mode 100644
> index 0000000..80dbe3f
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch
> @@ -0,0 +1,114 @@
> +2010-10-25  Jie Zhang  <jie@codesourcery.com>
> +
> +	Issue #9812
> +
> +	Backport from mainline:
> +
> +	gcc/
> +	2010-10-25  Jie Zhang  <jie@codesourcery.com>
> +	* combine.c (try_combine): If insns need to be kept around,
> +	check that they can be copied in the merged instruction.
> +
> +	gcc/testsuite/
> +	2010-10-25  Jie Zhang  <jie@codesourcery.com>
> +	* g++.dg/opt/combine.c: New test.
> +
> +=== modified file 'gcc/combine.c'
> +--- old/gcc/combine.c	2010-09-20 22:37:32 +0000
> ++++ new/gcc/combine.c	2010-11-04 12:39:28 +0000
> +@@ -2809,6 +2809,17 @@
> +     = i1 && ! (i1_feeds_i3 ? dead_or_set_p (i3, i1dest)
> + 	       : (dead_or_set_p (i3, i1dest) || dead_or_set_p (i2, i1dest)));
> + 
> ++  /* We are about to copy insns for the case where they need to be kept
> ++     around.  Check that they can be copied in the merged instruction.  */
> ++
> ++  if (targetm.cannot_copy_insn_p
> ++      && ((added_sets_2 && targetm.cannot_copy_insn_p (i2))
> ++	  || (i1 && added_sets_1 && targetm.cannot_copy_insn_p (i1))))
> ++    {
> ++      undo_all ();
> ++      return 0;
> ++    }
> ++
> +   /* If the set in I2 needs to be kept around, we must make a copy of
> +      PATTERN (I2), so that when we substitute I1SRC for I1DEST in
> +      PATTERN (I2), we are only substituting for the original I1DEST, not into
> +
> +=== added file 'gcc/testsuite/g++.dg/opt/combine.C'
> +--- old/gcc/testsuite/g++.dg/opt/combine.C	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/g++.dg/opt/combine.C	2010-11-04 12:39:28 +0000
> +@@ -0,0 +1,72 @@
> ++// { dg-do assemble { target fpic } }
> ++// { dg-options "-O2 -fweb -fPIC -fvisibility=hidden" }
> ++
> ++class QBasicAtomicInt
> ++{
> ++public:
> ++  volatile int _q_value;
> ++  inline operator int () const {return _q_value;}
> ++};
> ++class QVariant;
> ++class QScriptContext;
> ++class QScriptEngine;
> ++class QScriptValue
> ++{
> ++public:
> ++  QVariant toVariant () const;
> ++};
> ++class QScriptDebuggerBackendPrivate
> ++{
> ++  static QScriptValue trace (QScriptContext *context);
> ++};
> ++template <typename T> struct QMetaTypeId { };
> ++template <typename T> struct QMetaTypeId2
> ++{
> ++  static inline int qt_metatype_id ()
> ++  {
> ++    return QMetaTypeId<T>::qt_metatype_id () ;
> ++  }
> ++};
> ++template <typename T> inline int qMetaTypeId (T * = 0)
> ++{
> ++  return QMetaTypeId2<T>::qt_metatype_id () ;
> ++}
> ++class QVariant { };
> ++template<typename T> inline T qvariant_cast (const QVariant &v)
> ++{
> ++  const int vid = qMetaTypeId<T> ((0)) ;
> ++};
> ++class QScriptContext
> ++{
> ++public: 
> ++  QScriptValue callee () const;
> ++};
> ++class QScriptEngine  
> ++{
> ++public:
> ++  static bool convertV2 (const QScriptValue &value , int type , void *ptr) ;
> ++};
> ++inline bool qscriptvalue_cast_helper (const QScriptValue &value , int type , void *ptr)
> ++{
> ++  return QScriptEngine::convertV2 (value, type, ptr) ;
> ++}
> ++template<typename T> T qscriptvalue_cast (const QScriptValue &value)
> ++{
> ++  T t;
> ++  const int id = qMetaTypeId<T> () ;
> ++  if ( qscriptvalue_cast_helper (value, id, &t))
> ++    return qvariant_cast<T> (value.toVariant ()) ;
> ++}
> ++template <> struct QMetaTypeId< QScriptDebuggerBackendPrivate* >
> ++{
> ++  static int qt_metatype_id ()
> ++  {
> ++    static QBasicAtomicInt metatype_id = { (0) };
> ++    return metatype_id;
> ++  }
> ++};
> ++QScriptValue QScriptDebuggerBackendPrivate::trace (QScriptContext *context)
> ++{
> ++  QScriptValue data = context->callee () ;
> ++  QScriptDebuggerBackendPrivate *self = qscriptvalue_cast<QScriptDebuggerBackendPrivate*> (data) ;
> ++}
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch
> new file mode 100644
> index 0000000..b6c6532
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch
> @@ -0,0 +1,687 @@
> +	Issue #1259
> +
> +	Backport from mainline:
> +
> +	gcc/
> +	2010-10-22  Jie Zhang  <jie@codesourcery.com>
> +
> +	* expr.c (emit_group_load_1): Update calls to extract_bit_field.
> +	(copy_blkmode_from_reg): Likewise.
> +	(read_complex_part): Likewise.
> +	(expand_expr_real_1): Calculate packedp and pass it to
> +	extract_bit_field.
> +	* expr.h (extract_bit_field): Update declaration.
> +	* calls.c (store_unaligned_arguments_into_pseudos): Update call
> +	to extract_bit_field.
> +	* expmed.c (extract_fixed_bit_field): Update calls to
> +	extract_fixed_bit_field.
> +	(store_split_bit_field): Likewise.
> +	(extract_bit_field_1): Add new argument packedp.
> +	(extract_bit_field): Add new argument packedp.
> +	(extract_fixed_bit_field): Add new argument packedp and let
> +	packed attribute override volatile.
> +	* stmt.c (expand_return): Update call to extract_bit_field.
> +
> +	2010-10-15  Jie Zhang  <jie@codesourcery.com>
> +
> +	* doc/invoke.texi: Add -fstrict-volatile-bitfields to
> +	Option Summary and Index.
> +
> +	2010-07-13  DJ Delorie  <dj@redhat.com>
> +
> +	* config/h8300/h8300.c (h8300_init_once): Default to
> +	-fstrict_volatile_bitfields.
> +
> +	* config/sh/sh.c (sh_override_options): Default to
> +	-fstrict_volatile_bitfields.
> +
> +	* config/rx/rx.c (rx_option_override): New.
> +
> +	* config/m32c/m32c.c (m32c_override_options): Default to
> +	-fstrict_volatile_bitfields.
> +
> +	2010-06-16  DJ Delorie  <dj@redhat.com>
> +
> +	* common.opt (-fstrict-volatile-bitfields): new.
> +	* doc/invoke.texi: Document it.
> +	* fold-const.c (optimize_bit_field_compare): For volatile
> +	bitfields, use the field's type to determine the mode, not the
> +	field's size.
> +	* expr.c (expand_assignment): Likewise.
> +	(get_inner_reference): Likewise.
> +	(expand_expr_real_1): Likewise.
> +	* expmed.c (store_fixed_bit_field): Likewise.
> +	(extract_bit_field_1): Likewise.
> +	(extract_fixed_bit_field): Likewise.
> +
> +	gcc/testsuite/
> +	2010-08-19  Uros Bizjak  <ubizjak@gmail.com>
> +
> +	PR testsuite/45324
> +	* gcc.target/i386/volatile-bitfields-1.c: Also scan movb.
> +
> +	2010-06-16  DJ Delorie  <dj@redhat.com>
> +
> +	* gcc.target/i386/volatile-bitfields-1.c: New.
> +	* gcc.target/i386/volatile-bitfields-2.c: New.
> +
> +=== modified file 'gcc/calls.c'
> +--- old/gcc/calls.c	2010-10-04 00:50:43 +0000
> ++++ new/gcc/calls.c	2010-11-04 12:43:52 +0000
> +@@ -878,7 +878,7 @@
> + 	    int bitsize = MIN (bytes * BITS_PER_UNIT, BITS_PER_WORD);
> + 
> + 	    args[i].aligned_regs[j] = reg;
> +-	    word = extract_bit_field (word, bitsize, 0, 1, NULL_RTX,
> ++	    word = extract_bit_field (word, bitsize, 0, 1, false, NULL_RTX,
> + 				      word_mode, word_mode);
> + 
> + 	    /* There is no need to restrict this code to loading items
> +
> +=== modified file 'gcc/common.opt'
> +--- old/gcc/common.opt	2010-07-29 14:59:35 +0000
> ++++ new/gcc/common.opt	2010-11-04 12:43:52 +0000
> +@@ -613,6 +613,10 @@
> + Common Report Var(flag_loop_block) Optimization
> + Enable Loop Blocking transformation
> + 
> ++fstrict-volatile-bitfields
> ++Common Report Var(flag_strict_volatile_bitfields) Init(-1)
> ++Force bitfield accesses to match their type width
> ++
> + fguess-branch-probability
> + Common Report Var(flag_guess_branch_prob) Optimization
> + Enable guessing of branch probabilities
> +
> +=== modified file 'gcc/config/h8300/h8300.c'
> +--- old/gcc/config/h8300/h8300.c	2010-04-02 18:54:46 +0000
> ++++ new/gcc/config/h8300/h8300.c	2010-11-04 12:43:52 +0000
> +@@ -403,6 +403,10 @@
> + 	 restore er6 though, so bump up the cost.  */
> +       h8300_move_ratio = 6;
> +     }
> ++
> ++  /* This target defaults to strict volatile bitfields.  */
> ++  if (flag_strict_volatile_bitfields < 0)
> ++    flag_strict_volatile_bitfields = 1;
> + }
> + 
> + /* Implement REG_CLASS_FROM_LETTER.
> +
> +=== modified file 'gcc/config/m32c/m32c.c'
> +--- old/gcc/config/m32c/m32c.c	2009-10-22 18:46:26 +0000
> ++++ new/gcc/config/m32c/m32c.c	2010-11-04 12:43:52 +0000
> +@@ -428,6 +428,10 @@
> + 
> +   if (TARGET_A24)
> +     flag_ivopts = 0;
> ++
> ++  /* This target defaults to strict volatile bitfields.  */
> ++  if (flag_strict_volatile_bitfields < 0)
> ++    flag_strict_volatile_bitfields = 1;
> + }
> + 
> + /* Defining data structures for per-function information */
> +
> +=== modified file 'gcc/config/rx/rx.c'
> +--- old/gcc/config/rx/rx.c	2010-07-27 14:39:53 +0000
> ++++ new/gcc/config/rx/rx.c	2010-11-04 12:43:52 +0000
> +@@ -2187,6 +2187,14 @@
> +     }
> + }
> + 
> ++static void
> ++rx_option_override (void)
> ++{
> ++  /* This target defaults to strict volatile bitfields.  */
> ++  if (flag_strict_volatile_bitfields < 0)
> ++    flag_strict_volatile_bitfields = 1;
> ++}
> ++
> + 
> + static bool
> + rx_allocate_stack_slots_for_args (void)
> +@@ -2759,6 +2767,9 @@
> + #undef  TARGET_CC_MODES_COMPATIBLE
> + #define TARGET_CC_MODES_COMPATIBLE		rx_cc_modes_compatible
> + 
> ++#undef  TARGET_OPTION_OVERRIDE
> ++#define TARGET_OPTION_OVERRIDE			rx_option_override
> ++
> + struct gcc_target targetm = TARGET_INITIALIZER;
> + 
> + /* #include "gt-rx.h" */
> +
> +=== modified file 'gcc/config/sh/sh.c'
> +--- old/gcc/config/sh/sh.c	2010-05-05 21:12:17 +0000
> ++++ new/gcc/config/sh/sh.c	2010-11-04 12:43:52 +0000
> +@@ -950,6 +950,10 @@
> + 
> +   if (sh_fixed_range_str)
> +     sh_fix_range (sh_fixed_range_str);
> ++
> ++  /* This target defaults to strict volatile bitfields.  */
> ++  if (flag_strict_volatile_bitfields < 0)
> ++    flag_strict_volatile_bitfields = 1;
> + }
> + 
> + /* Print the operand address in x to the stream.  */
> +
> +=== modified file 'gcc/doc/invoke.texi'
> +--- old/gcc/doc/invoke.texi	2010-10-04 00:50:43 +0000
> ++++ new/gcc/doc/invoke.texi	2010-11-04 12:43:52 +0000
> +@@ -922,7 +922,7 @@
> + -fargument-noalias-global  -fargument-noalias-anything @gol
> + -fleading-underscore  -ftls-model=@var{model} @gol
> + -ftrapv  -fwrapv  -fbounds-check @gol
> +--fvisibility}
> ++-fvisibility -fstrict-volatile-bitfields}
> + @end table
> + 
> + @menu
> +@@ -17629,6 +17629,33 @@
> + An overview of these techniques, their benefits and how to use them
> + is at @w{@uref{http://gcc.gnu.org/wiki/Visibility}}.
> + 
> ++@item -fstrict-volatile-bitfields
> ++@opindex fstrict-volatile-bitfields
> ++This option should be used if accesses to volatile bitfields (or other
> ++structure fields, although the compiler usually honors those types
> ++anyway) should use a single access in a mode of the same size as the
> ++container's type, aligned to a natural alignment if possible.  For
> ++example, targets with memory-mapped peripheral registers might require
> ++all such accesses to be 16 bits wide; with this flag the user could
> ++declare all peripheral bitfields as ``unsigned short'' (assuming short
> ++is 16 bits on these targets) to force GCC to use 16 bit accesses
> ++instead of, perhaps, a more efficient 32 bit access.
> ++
> ++If this option is disabled, the compiler will use the most efficient
> ++instruction.  In the previous example, that might be a 32-bit load
> ++instruction, even though that will access bytes that do not contain
> ++any portion of the bitfield, or memory-mapped registers unrelated to
> ++the one being updated.
> ++
> ++If the target requires strict alignment, and honoring the container
> ++type would require violating this alignment, a warning is issued.
> ++However, the access happens as the user requested, under the
> ++assumption that the user knows something about the target hardware
> ++that GCC is unaware of.
> ++
> ++The default value of this option is determined by the application binary
> ++interface for the target processor.
> ++
> + @end table
> + 
> + @c man end
> +
> +=== modified file 'gcc/expmed.c'
> +--- old/gcc/expmed.c	2010-10-04 00:50:43 +0000
> ++++ new/gcc/expmed.c	2010-11-04 12:43:52 +0000
> +@@ -47,7 +47,7 @@
> + static rtx extract_fixed_bit_field (enum machine_mode, rtx,
> + 				    unsigned HOST_WIDE_INT,
> + 				    unsigned HOST_WIDE_INT,
> +-				    unsigned HOST_WIDE_INT, rtx, int);
> ++				    unsigned HOST_WIDE_INT, rtx, int, bool);
> + static rtx mask_rtx (enum machine_mode, int, int, int);
> + static rtx lshift_value (enum machine_mode, rtx, int, int);
> + static rtx extract_split_bit_field (rtx, unsigned HOST_WIDE_INT,
> +@@ -904,8 +904,14 @@
> +       if (GET_MODE_BITSIZE (mode) == 0
> + 	  || GET_MODE_BITSIZE (mode) > GET_MODE_BITSIZE (word_mode))
> + 	mode = word_mode;
> +-      mode = get_best_mode (bitsize, bitpos + offset * BITS_PER_UNIT,
> +-			    MEM_ALIGN (op0), mode, MEM_VOLATILE_P (op0));
> ++
> ++      if (MEM_VOLATILE_P (op0)
> ++          && GET_MODE_BITSIZE (GET_MODE (op0)) > 0
> ++	  && flag_strict_volatile_bitfields > 0)
> ++	mode = GET_MODE (op0);
> ++      else
> ++	mode = get_best_mode (bitsize, bitpos + offset * BITS_PER_UNIT,
> ++			      MEM_ALIGN (op0), mode, MEM_VOLATILE_P (op0));
> + 
> +       if (mode == VOIDmode)
> + 	{
> +@@ -1099,7 +1105,7 @@
> + 	       endianness compensation) to fetch the piece we want.  */
> + 	    part = extract_fixed_bit_field (word_mode, value, 0, thissize,
> + 					    total_bits - bitsize + bitsdone,
> +-					    NULL_RTX, 1);
> ++					    NULL_RTX, 1, false);
> + 	}
> +       else
> + 	{
> +@@ -1110,7 +1116,7 @@
> + 			    & (((HOST_WIDE_INT) 1 << thissize) - 1));
> + 	  else
> + 	    part = extract_fixed_bit_field (word_mode, value, 0, thissize,
> +-					    bitsdone, NULL_RTX, 1);
> ++					    bitsdone, NULL_RTX, 1, false);
> + 	}
> + 
> +       /* If OP0 is a register, then handle OFFSET here.
> +@@ -1176,7 +1182,8 @@
> + 
> + static rtx
> + extract_bit_field_1 (rtx str_rtx, unsigned HOST_WIDE_INT bitsize,
> +-		     unsigned HOST_WIDE_INT bitnum, int unsignedp, rtx target,
> ++		     unsigned HOST_WIDE_INT bitnum,
> ++		     int unsignedp, bool packedp, rtx target,
> + 		     enum machine_mode mode, enum machine_mode tmode,
> + 		     bool fallback_p)
> + {
> +@@ -1378,6 +1385,14 @@
> + 	    ? mode_for_size (bitsize, GET_MODE_CLASS (tmode), 0)
> + 	    : mode);
> + 
> ++  /* If the bitfield is volatile, we need to make sure the access
> ++     remains on a type-aligned boundary.  */
> ++  if (GET_CODE (op0) == MEM
> ++      && MEM_VOLATILE_P (op0)
> ++      && GET_MODE_BITSIZE (GET_MODE (op0)) > 0
> ++      && flag_strict_volatile_bitfields > 0)
> ++    goto no_subreg_mode_swap;
> ++
> +   if (((bitsize >= BITS_PER_WORD && bitsize == GET_MODE_BITSIZE (mode)
> + 	&& bitpos % BITS_PER_WORD == 0)
> +        || (mode1 != BLKmode
> +@@ -1450,7 +1465,7 @@
> + 	  rtx result_part
> + 	    = extract_bit_field (op0, MIN (BITS_PER_WORD,
> + 					   bitsize - i * BITS_PER_WORD),
> +-				 bitnum + bit_offset, 1, target_part, mode,
> ++				 bitnum + bit_offset, 1, false, target_part, mode,
> + 				 word_mode);
> + 
> + 	  gcc_assert (target_part);
> +@@ -1649,7 +1664,7 @@
> + 	      xop0 = adjust_address (op0, bestmode, xoffset);
> + 	      xop0 = force_reg (bestmode, xop0);
> + 	      result = extract_bit_field_1 (xop0, bitsize, xbitpos,
> +-					    unsignedp, target,
> ++					    unsignedp, packedp, target,
> + 					    mode, tmode, false);
> + 	      if (result)
> + 		return result;
> +@@ -1663,7 +1678,7 @@
> +     return NULL;
> + 
> +   target = extract_fixed_bit_field (int_mode, op0, offset, bitsize,
> +-				    bitpos, target, unsignedp);
> ++				    bitpos, target, unsignedp, packedp);
> +   return convert_extracted_bit_field (target, mode, tmode, unsignedp);
> + }
> + 
> +@@ -1674,6 +1689,7 @@
> + 
> +    STR_RTX is the structure containing the byte (a REG or MEM).
> +    UNSIGNEDP is nonzero if this is an unsigned bit field.
> ++   PACKEDP is nonzero if the field has the packed attribute.
> +    MODE is the natural mode of the field value once extracted.
> +    TMODE is the mode the caller would like the value to have;
> +    but the value may be returned with type MODE instead.
> +@@ -1685,10 +1701,10 @@
> + 
> + rtx
> + extract_bit_field (rtx str_rtx, unsigned HOST_WIDE_INT bitsize,
> +-		   unsigned HOST_WIDE_INT bitnum, int unsignedp, rtx target,
> +-		   enum machine_mode mode, enum machine_mode tmode)
> ++		   unsigned HOST_WIDE_INT bitnum, int unsignedp, bool packedp,
> ++		   rtx target, enum machine_mode mode, enum machine_mode tmode)
> + {
> +-  return extract_bit_field_1 (str_rtx, bitsize, bitnum, unsignedp,
> ++  return extract_bit_field_1 (str_rtx, bitsize, bitnum, unsignedp, packedp,
> + 			      target, mode, tmode, true);
> + }
> + 
> +@@ -1704,6 +1720,8 @@
> +      which is significant on bigendian machines.)
> + 
> +    UNSIGNEDP is nonzero for an unsigned bit field (don't sign-extend value).
> ++   PACKEDP is true if the field has the packed attribute.
> ++
> +    If TARGET is nonzero, attempts to store the value there
> +    and return TARGET, but this is not guaranteed.
> +    If TARGET is not used, create a pseudo-reg of mode TMODE for the value.  */
> +@@ -1713,7 +1731,7 @@
> + 			 unsigned HOST_WIDE_INT offset,
> + 			 unsigned HOST_WIDE_INT bitsize,
> + 			 unsigned HOST_WIDE_INT bitpos, rtx target,
> +-			 int unsignedp)
> ++			 int unsignedp, bool packedp)
> + {
> +   unsigned int total_bits = BITS_PER_WORD;
> +   enum machine_mode mode;
> +@@ -1730,8 +1748,19 @@
> + 	 includes the entire field.  If such a mode would be larger than
> + 	 a word, we won't be doing the extraction the normal way.  */
> + 
> +-      mode = get_best_mode (bitsize, bitpos + offset * BITS_PER_UNIT,
> +-			    MEM_ALIGN (op0), word_mode, MEM_VOLATILE_P (op0));
> ++      if (MEM_VOLATILE_P (op0)
> ++	  && flag_strict_volatile_bitfields > 0)
> ++	{
> ++	  if (GET_MODE_BITSIZE (GET_MODE (op0)) > 0)
> ++	    mode = GET_MODE (op0);
> ++	  else if (target && GET_MODE_BITSIZE (GET_MODE (target)) > 0)
> ++	    mode = GET_MODE (target);
> ++	  else
> ++	    mode = tmode;
> ++	}
> ++      else
> ++	mode = get_best_mode (bitsize, bitpos + offset * BITS_PER_UNIT,
> ++			      MEM_ALIGN (op0), word_mode, MEM_VOLATILE_P (op0));
> + 
> +       if (mode == VOIDmode)
> + 	/* The only way this should occur is if the field spans word
> +@@ -1752,12 +1781,67 @@
> + 		     * BITS_PER_UNIT);
> + 	}
> + 
> +-      /* Get ref to an aligned byte, halfword, or word containing the field.
> +-	 Adjust BITPOS to be position within a word,
> +-	 and OFFSET to be the offset of that word.
> +-	 Then alter OP0 to refer to that word.  */
> +-      bitpos += (offset % (total_bits / BITS_PER_UNIT)) * BITS_PER_UNIT;
> +-      offset -= (offset % (total_bits / BITS_PER_UNIT));
> ++      /* If we're accessing a volatile MEM, we can't do the next
> ++	 alignment step if it results in a multi-word access where we
> ++	 otherwise wouldn't have one.  So, check for that case
> ++	 here.  */
> ++      if (MEM_P (op0)
> ++	  && MEM_VOLATILE_P (op0)
> ++	  && flag_strict_volatile_bitfields > 0
> ++	  && bitpos + bitsize <= total_bits
> ++	  && bitpos + bitsize + (offset % (total_bits / BITS_PER_UNIT)) * BITS_PER_UNIT > total_bits)
> ++	{
> ++	  if (STRICT_ALIGNMENT)
> ++	    {
> ++	      static bool informed_about_misalignment = false;
> ++	      bool warned;
> ++
> ++	      if (packedp)
> ++		{
> ++		  if (bitsize == total_bits)
> ++		    warned = warning_at (input_location, OPT_fstrict_volatile_bitfields,
> ++					 "multiple accesses to volatile structure member"
> ++					 " because of packed attribute");
> ++		  else
> ++		    warned = warning_at (input_location, OPT_fstrict_volatile_bitfields,
> ++					 "multiple accesses to volatile structure bitfield"
> ++					 " because of packed attribute");
> ++
> ++		  return extract_split_bit_field (op0, bitsize,
> ++						  bitpos + offset * BITS_PER_UNIT,
> ++						  unsignedp);
> ++		}
> ++
> ++	      if (bitsize == total_bits)
> ++		warned = warning_at (input_location, OPT_fstrict_volatile_bitfields,
> ++				     "mis-aligned access used for structure member");
> ++	      else
> ++		warned = warning_at (input_location, OPT_fstrict_volatile_bitfields,
> ++				     "mis-aligned access used for structure bitfield");
> ++
> ++	      if (! informed_about_misalignment && warned)
> ++		{
> ++		  informed_about_misalignment = true;
> ++		  inform (input_location,
> ++			  "When a volatile object spans multiple type-sized locations,"
> ++			  " the compiler must choose between using a single mis-aligned access to"
> ++			  " preserve the volatility, or using multiple aligned accesses to avoid"
> ++			  " runtime faults.  This code may fail at runtime if the hardware does"
> ++			  " not allow this access.");
> ++		}
> ++	    }
> ++	}
> ++      else
> ++	{
> ++
> ++	  /* Get ref to an aligned byte, halfword, or word containing the field.
> ++	     Adjust BITPOS to be position within a word,
> ++	     and OFFSET to be the offset of that word.
> ++	     Then alter OP0 to refer to that word.  */
> ++	  bitpos += (offset % (total_bits / BITS_PER_UNIT)) * BITS_PER_UNIT;
> ++	  offset -= (offset % (total_bits / BITS_PER_UNIT));
> ++	}
> ++
> +       op0 = adjust_address (op0, mode, offset);
> +     }
> + 
> +@@ -1966,7 +2050,7 @@
> + 	 extract_fixed_bit_field wants offset in bytes.  */
> +       part = extract_fixed_bit_field (word_mode, word,
> + 				      offset * unit / BITS_PER_UNIT,
> +-				      thissize, thispos, 0, 1);
> ++				      thissize, thispos, 0, 1, false);
> +       bitsdone += thissize;
> + 
> +       /* Shift this part into place for the result.  */
> +
> +=== modified file 'gcc/expr.c'
> +--- old/gcc/expr.c	2010-10-04 00:50:43 +0000
> ++++ new/gcc/expr.c	2010-11-04 12:43:52 +0000
> +@@ -1749,7 +1749,7 @@
> + 		  && (!REG_P (tmps[i]) || GET_MODE (tmps[i]) != mode))
> + 		tmps[i] = extract_bit_field (tmps[i], bytelen * BITS_PER_UNIT,
> + 					     (bytepos % slen0) * BITS_PER_UNIT,
> +-					     1, NULL_RTX, mode, mode);
> ++					     1, false, NULL_RTX, mode, mode);
> + 	    }
> + 	  else
> + 	    {
> +@@ -1759,7 +1759,7 @@
> + 	      mem = assign_stack_temp (GET_MODE (src), slen, 0);
> + 	      emit_move_insn (mem, src);
> + 	      tmps[i] = extract_bit_field (mem, bytelen * BITS_PER_UNIT,
> +-					   0, 1, NULL_RTX, mode, mode);
> ++					   0, 1, false, NULL_RTX, mode, mode);
> + 	    }
> + 	}
> +       /* FIXME: A SIMD parallel will eventually lead to a subreg of a
> +@@ -1800,7 +1800,7 @@
> + 	tmps[i] = src;
> +       else
> + 	tmps[i] = extract_bit_field (src, bytelen * BITS_PER_UNIT,
> +-				     bytepos * BITS_PER_UNIT, 1, NULL_RTX,
> ++				     bytepos * BITS_PER_UNIT, 1, false, NULL_RTX,
> + 				     mode, mode);
> + 
> +       if (shift)
> +@@ -2213,7 +2213,7 @@
> + 	 bitpos for the destination store (left justified).  */
> +       store_bit_field (dst, bitsize, bitpos % BITS_PER_WORD, copy_mode,
> + 		       extract_bit_field (src, bitsize,
> +-					  xbitpos % BITS_PER_WORD, 1,
> ++					  xbitpos % BITS_PER_WORD, 1, false,
> + 					  NULL_RTX, copy_mode, copy_mode));
> +     }
> + 
> +@@ -2970,7 +2970,7 @@
> +     }
> + 
> +   return extract_bit_field (cplx, ibitsize, imag_p ? ibitsize : 0,
> +-			    true, NULL_RTX, imode, imode);
> ++			    true, false, NULL_RTX, imode, imode);
> + }
> + 
> + /* A subroutine of emit_move_insn_1.  Yet another lowpart generator.
> +@@ -4233,6 +4233,13 @@
> + 
> +       to_rtx = expand_normal (tem);
> + 
> ++      /* If the bitfield is volatile, we want to access it in the
> ++	 field's mode, not the computed mode.  */
> ++      if (volatilep
> ++	  && GET_CODE (to_rtx) == MEM
> ++	  && flag_strict_volatile_bitfields > 0)
> ++	to_rtx = adjust_address (to_rtx, mode1, 0);
> ++ 
> +       if (offset != 0)
> + 	{
> + 	  enum machine_mode address_mode;
> +@@ -5993,6 +6000,12 @@
> + 	mode = DECL_MODE (field);
> +       else if (DECL_MODE (field) == BLKmode)
> + 	blkmode_bitfield = true;
> ++      else if (TREE_THIS_VOLATILE (exp)
> ++	       && flag_strict_volatile_bitfields > 0)
> ++	/* Volatile bitfields should be accessed in the mode of the
> ++	     field's type, not the mode computed based on the bit
> ++	     size.  */
> ++	mode = TYPE_MODE (DECL_BIT_FIELD_TYPE (field));
> + 
> +       *punsignedp = DECL_UNSIGNED (field);
> +     }
> +@@ -8848,6 +8861,7 @@
> + 	HOST_WIDE_INT bitsize, bitpos;
> + 	tree offset;
> + 	int volatilep = 0, must_force_mem;
> ++	bool packedp = false;
> + 	tree tem = get_inner_reference (exp, &bitsize, &bitpos, &offset,
> + 					&mode1, &unsignedp, &volatilep, true);
> + 	rtx orig_op0, memloc;
> +@@ -8857,6 +8871,11 @@
> + 	   infinitely recurse.  */
> + 	gcc_assert (tem != exp);
> + 
> ++	if (TYPE_PACKED (TREE_TYPE (TREE_OPERAND (exp, 0)))
> ++	    || (TREE_CODE (TREE_OPERAND (exp, 1)) == FIELD_DECL
> ++		&& DECL_PACKED (TREE_OPERAND (exp, 1))))
> ++	  packedp = true;
> ++
> + 	/* If TEM's type is a union of variable size, pass TARGET to the inner
> + 	   computation, since it will need a temporary and TARGET is known
> + 	   to have to do.  This occurs in unchecked conversion in Ada.  */
> +@@ -8873,6 +8892,14 @@
> + 			  || modifier == EXPAND_STACK_PARM)
> + 			 ? modifier : EXPAND_NORMAL);
> + 
> ++
> ++	/* If the bitfield is volatile, we want to access it in the
> ++	   field's mode, not the computed mode.  */
> ++	if (volatilep
> ++	    && GET_CODE (op0) == MEM
> ++	    && flag_strict_volatile_bitfields > 0)
> ++	  op0 = adjust_address (op0, mode1, 0);
> ++
> + 	mode2
> + 	  = CONSTANT_P (op0) ? TYPE_MODE (TREE_TYPE (tem)) : GET_MODE (op0);
> + 
> +@@ -8998,6 +9025,9 @@
> + 		&& GET_MODE_CLASS (mode) != MODE_COMPLEX_FLOAT
> + 		&& modifier != EXPAND_CONST_ADDRESS
> + 		&& modifier != EXPAND_INITIALIZER)
> ++	    /* If the field is volatile, we always want an aligned
> ++	       access.  */
> ++	    || (volatilep && flag_strict_volatile_bitfields > 0)
> + 	    /* If the field isn't aligned enough to fetch as a memref,
> + 	       fetch it as a bit field.  */
> + 	    || (mode1 != BLKmode
> +@@ -9058,7 +9088,7 @@
> + 	    if (MEM_P (op0) && REG_P (XEXP (op0, 0)))
> + 	      mark_reg_pointer (XEXP (op0, 0), MEM_ALIGN (op0));
> + 
> +-	    op0 = extract_bit_field (op0, bitsize, bitpos, unsignedp,
> ++	    op0 = extract_bit_field (op0, bitsize, bitpos, unsignedp, packedp,
> + 				     (modifier == EXPAND_STACK_PARM
> + 				      ? NULL_RTX : target),
> + 				     ext_mode, ext_mode);
> +
> +=== modified file 'gcc/expr.h'
> +--- old/gcc/expr.h	2010-02-19 09:53:51 +0000
> ++++ new/gcc/expr.h	2010-11-04 12:43:52 +0000
> +@@ -802,7 +802,7 @@
> + extern void store_bit_field (rtx, unsigned HOST_WIDE_INT,
> + 			     unsigned HOST_WIDE_INT, enum machine_mode, rtx);
> + extern rtx extract_bit_field (rtx, unsigned HOST_WIDE_INT,
> +-			      unsigned HOST_WIDE_INT, int, rtx,
> ++			      unsigned HOST_WIDE_INT, int, bool, rtx,
> + 			      enum machine_mode, enum machine_mode);
> + extern rtx extract_low_bits (enum machine_mode, enum machine_mode, rtx);
> + extern rtx expand_mult (enum machine_mode, rtx, rtx, rtx, int);
> +
> +=== modified file 'gcc/fold-const.c'
> +--- old/gcc/fold-const.c	2010-10-04 00:50:43 +0000
> ++++ new/gcc/fold-const.c	2010-11-04 12:43:52 +0000
> +@@ -4208,11 +4208,16 @@
> + 
> +   /* See if we can find a mode to refer to this field.  We should be able to,
> +      but fail if we can't.  */
> +-  nmode = get_best_mode (lbitsize, lbitpos,
> +-			 const_p ? TYPE_ALIGN (TREE_TYPE (linner))
> +-			 : MIN (TYPE_ALIGN (TREE_TYPE (linner)),
> +-				TYPE_ALIGN (TREE_TYPE (rinner))),
> +-			 word_mode, lvolatilep || rvolatilep);
> ++  if (lvolatilep
> ++      && GET_MODE_BITSIZE (lmode) > 0
> ++      && flag_strict_volatile_bitfields > 0)
> ++    nmode = lmode;
> ++  else
> ++    nmode = get_best_mode (lbitsize, lbitpos,
> ++			   const_p ? TYPE_ALIGN (TREE_TYPE (linner))
> ++			   : MIN (TYPE_ALIGN (TREE_TYPE (linner)),
> ++				  TYPE_ALIGN (TREE_TYPE (rinner))),
> ++			   word_mode, lvolatilep || rvolatilep);
> +   if (nmode == VOIDmode)
> +     return 0;
> + 
> +
> +=== modified file 'gcc/stmt.c'
> +--- old/gcc/stmt.c	2010-08-13 11:53:46 +0000
> ++++ new/gcc/stmt.c	2010-11-04 12:43:52 +0000
> +@@ -1751,7 +1751,7 @@
> + 	     xbitpos for the destination store (right justified).  */
> + 	  store_bit_field (dst, bitsize, xbitpos % BITS_PER_WORD, word_mode,
> + 			   extract_bit_field (src, bitsize,
> +-					      bitpos % BITS_PER_WORD, 1,
> ++					      bitpos % BITS_PER_WORD, 1, false,
> + 					      NULL_RTX, word_mode, word_mode));
> + 	}
> + 
> +
> +=== added file 'gcc/testsuite/gcc.target/i386/volatile-bitfields-1.c'
> +--- old/gcc/testsuite/gcc.target/i386/volatile-bitfields-1.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.target/i386/volatile-bitfields-1.c	2010-11-04 12:43:52 +0000
> +@@ -0,0 +1,17 @@
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2 -fstrict-volatile-bitfields" } */
> ++
> ++typedef struct {
> ++  char a:1;
> ++  char b:7;
> ++  int c;
> ++} BitStruct;
> ++
> ++volatile BitStruct bits;
> ++
> ++int foo ()
> ++{
> ++  return bits.b;
> ++}
> ++
> ++/* { dg-final { scan-assembler "mov(b|zbl).*bits" } } */
> +
> +=== added file 'gcc/testsuite/gcc.target/i386/volatile-bitfields-2.c'
> +--- old/gcc/testsuite/gcc.target/i386/volatile-bitfields-2.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.target/i386/volatile-bitfields-2.c	2010-11-04 12:43:52 +0000
> +@@ -0,0 +1,17 @@
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2 -fno-strict-volatile-bitfields" } */
> ++
> ++typedef struct {
> ++  char a:1;
> ++  char b:7;
> ++  int c;
> ++} BitStruct;
> ++
> ++volatile BitStruct bits;
> ++
> ++int foo ()
> ++{
> ++  return bits.b;
> ++}
> ++
> ++/* { dg-final { scan-assembler "movl.*bits" } } */
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch
> new file mode 100644
> index 0000000..17839c0
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch
> @@ -0,0 +1,128 @@
> +2010-10-26  Jie Zhang  <jie@codesourcery.com>
> +
> +	Issue #1259
> +
> +	Backport from mainline:
> +
> +	gcc/
> +	2010-10-26  Jie Zhang  <jie@codesourcery.com>
> +
> +	* stor-layout.c (layout_decl): Use the field's type to
> +	determine the mode and keep DECL_BIT_FIELD for a volatile
> +	bit-field.
> +	* config/arm/arm.c (arm_override_options): Default to
> +	-fstrict-volatile-bitfields.
> +
> +	gcc/testsuite/
> +	2010-10-26  Jie Zhang  <jie@codesourcery.com>
> +
> +	* gcc.target/arm/volatile-bitfields-1.c: New test.
> +	* gcc.target/arm/volatile-bitfields-2.c: New test.
> +	* gcc.target/arm/volatile-bitfields-3.c: New test.
> +
> +=== modified file 'gcc/config/arm/arm.c'
> +--- old/gcc/config/arm/arm.c	2010-11-04 10:45:05 +0000
> ++++ new/gcc/config/arm/arm.c	2010-11-04 12:49:37 +0000
> +@@ -1933,6 +1933,10 @@
> +        calculation, which is 2 instructions.  */
> +     set_param_value ("gcse-unrestricted-cost", 2);
> + 
> ++  /* ARM EABI defaults to strict volatile bitfields.  */
> ++  if (TARGET_AAPCS_BASED && flag_strict_volatile_bitfields < 0)
> ++    flag_strict_volatile_bitfields = 1;
> ++
> +   /* Register global variables with the garbage collector.  */
> +   arm_add_gc_roots ();
> + 
> +
> +=== modified file 'gcc/stor-layout.c'
> +--- old/gcc/stor-layout.c	2010-04-02 18:54:46 +0000
> ++++ new/gcc/stor-layout.c	2010-11-04 12:49:37 +0000
> +@@ -593,11 +593,14 @@
> + 	    }
> + 
> + 	  /* See if we can use an ordinary integer mode for a bit-field.
> +-	     Conditions are: a fixed size that is correct for another mode
> +-	     and occupying a complete byte or bytes on proper boundary.  */
> ++	     Conditions are: a fixed size that is correct for another mode,
> ++	     occupying a complete byte or bytes on proper boundary,
> ++	     and not volatile or not -fstrict-volatile-bitfields.  */
> + 	  if (TYPE_SIZE (type) != 0
> + 	      && TREE_CODE (TYPE_SIZE (type)) == INTEGER_CST
> +-	      && GET_MODE_CLASS (TYPE_MODE (type)) == MODE_INT)
> ++	      && GET_MODE_CLASS (TYPE_MODE (type)) == MODE_INT
> ++	      && !(TREE_THIS_VOLATILE (decl)
> ++		   && flag_strict_volatile_bitfields > 0))
> + 	    {
> + 	      enum machine_mode xmode
> + 		= mode_for_size_tree (DECL_SIZE (decl), MODE_INT, 1);
> +
> +=== added file 'gcc/testsuite/gcc.target/arm/volatile-bitfields-1.c'
> +--- old/gcc/testsuite/gcc.target/arm/volatile-bitfields-1.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.target/arm/volatile-bitfields-1.c	2010-11-04 12:49:37 +0000
> +@@ -0,0 +1,18 @@
> ++/* { dg-require-effective-target arm_eabi } */
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2" } */
> ++
> ++typedef struct {
> ++  char a:1;
> ++  char b:7;
> ++  int c;
> ++} BitStruct;
> ++
> ++volatile BitStruct bits;
> ++
> ++int foo ()
> ++{
> ++  return bits.b;
> ++}
> ++
> ++/* { dg-final { scan-assembler "ldrb\[\\t \]+\[^\n\]*,\[\\t \]*\\\[\[^\n\]*\\\]" } } */
> +
> +=== added file 'gcc/testsuite/gcc.target/arm/volatile-bitfields-2.c'
> +--- old/gcc/testsuite/gcc.target/arm/volatile-bitfields-2.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.target/arm/volatile-bitfields-2.c	2010-11-04 12:49:37 +0000
> +@@ -0,0 +1,18 @@
> ++/* { dg-require-effective-target arm_eabi } */
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2" } */
> ++
> ++typedef struct {
> ++  volatile unsigned long a:8;
> ++  volatile unsigned long b:8;
> ++  volatile unsigned long c:16;
> ++} BitStruct;
> ++
> ++BitStruct bits;
> ++
> ++unsigned long foo ()
> ++{
> ++  return bits.b;
> ++}
> ++
> ++/* { dg-final { scan-assembler "ldr\[\\t \]+\[^\n\]*,\[\\t \]*\\\[\[^\n\]*\\\]" } } */
> +
> +=== added file 'gcc/testsuite/gcc.target/arm/volatile-bitfields-3.c'
> +--- old/gcc/testsuite/gcc.target/arm/volatile-bitfields-3.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.target/arm/volatile-bitfields-3.c	2010-11-04 12:49:37 +0000
> +@@ -0,0 +1,18 @@
> ++/* { dg-require-effective-target arm_eabi } */
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2" } */
> ++
> ++typedef struct {
> ++  volatile unsigned long a:8;
> ++  volatile unsigned long b:8;
> ++  volatile unsigned long c:16;
> ++} BitStruct;
> ++
> ++BitStruct bits;
> ++
> ++unsigned long foo ()
> ++{
> ++  return bits.c;
> ++}
> ++
> ++/* { dg-final { scan-assembler "ldr\[\\t \]+\[^\n\]*,\[\\t \]*\\\[\[^\n\]*\\\]" } } */
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch
> new file mode 100644
> index 0000000..cf06e1f
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch
> @@ -0,0 +1,41 @@
> +	Backport from mainline:
> +
> +	gcc/
> +	2010-10-26  Jie Zhang  <jie@codesourcery.com>
> +
> +	* doc/invoke.texi: Improve documentation of
> +	-fstrict-volatile-bitfields.
> +
> +=== modified file 'gcc/doc/invoke.texi'
> +--- old/gcc/doc/invoke.texi	2010-11-04 12:43:52 +0000
> ++++ new/gcc/doc/invoke.texi	2010-11-04 14:29:09 +0000
> +@@ -17633,8 +17633,8 @@
> + @opindex fstrict-volatile-bitfields
> + This option should be used if accesses to volatile bitfields (or other
> + structure fields, although the compiler usually honors those types
> +-anyway) should use a single access in a mode of the same size as the
> +-container's type, aligned to a natural alignment if possible.  For
> ++anyway) should use a single access of the width of the
> ++field's type, aligned to a natural alignment if possible.  For
> + example, targets with memory-mapped peripheral registers might require
> + all such accesses to be 16 bits wide; with this flag the user could
> + declare all peripheral bitfields as ``unsigned short'' (assuming short
> +@@ -17647,11 +17647,13 @@
> + any portion of the bitfield, or memory-mapped registers unrelated to
> + the one being updated.
> + 
> +-If the target requires strict alignment, and honoring the container
> ++If the target requires strict alignment, and honoring the field
> + type would require violating this alignment, a warning is issued.
> +-However, the access happens as the user requested, under the
> +-assumption that the user knows something about the target hardware
> +-that GCC is unaware of.
> ++If the field has @code{packed} attribute, the access is done without
> ++honoring the field type.  If the field doesn't have @code{packed}
> ++attribute, the access is done honoring the field type.  In both cases,
> ++GCC assumes that the user knows something about the target hardware
> ++that it is unaware of.
> + 
> + The default value of this option is determined by the application binary
> + interface for the target processor.
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch
> new file mode 100644
> index 0000000..63ba95e
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch
> @@ -0,0 +1,1257 @@
> +2010-11-09  Michael Hope  <michael.hope@linaro.org>
> +
> +	Revert:
> +
> +	Backport from mainline:
> +
> +	2010-07-15  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	gcc/
> +	* postreload.c (last_label_ruid, first_index_reg, last_index_reg):
> +	New static variables.
> +	(reload_combine_recognize_pattern): New static function, broken out
> +	of reload_combine.
> +	(reload_combine): Use it.  Only initialize first_index_reg and
> +	last_index_reg once.
> +
> +	2010-07-17  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	PR target/42235
> +	gcc/
> +	* postreload.c (reload_cse_move2add): Return bool, true if anything.
> +	changed.  All callers changed.
> +	(move2add_use_add2_insn): Likewise.
> +	(move2add_use_add3_insn): Likewise.
> +	(reload_cse_regs): If reload_cse_move2add changed anything, rerun
> +	reload_combine.
> +	(RELOAD_COMBINE_MAX_USES): Bump to 16.
> +	(last_jump_ruid): New static variable.
> +	(struct reg_use): New members CONTAINING_MEM and RUID.
> +	(reg_state): New members ALL_OFFSETS_MATCH and REAL_STORE_RUID.
> +	(reload_combine_split_one_ruid, reload_combine_split_ruids,
> +	reload_combine_purge_insn_uses, reload_combine_closest_single_use
> +	reload_combine_purge_reg_uses_after_ruid,
> +	reload_combine_recognize_const_pattern): New static functions.
> +	(reload_combine_recognize_pattern): Verify that ALL_OFFSETS_MATCH
> +	is true for our reg and that we have available index regs.
> +	(reload_combine_note_use): New args RUID and CONTAINING_MEM.  All
> +	callers changed.  Use them to initialize fields in struct reg_use.
> +	(reload_combine): Initialize last_jump_ruid.  Be careful when to
> +	take PREV_INSN of the scanned insn.  Update REAL_STORE_RUID fields.
> +	Call reload_combine_recognize_const_pattern.
> +	(reload_combine_note_store): Update REAL_STORE_RUID field.
> +
> +	gcc/testsuite/
> +	* gcc.target/arm/pr42235.c: New test.
> +
> +	2010-07-19  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	gcc/
> +	* postreload.c (reload_combine_closest_single_use): Ignore the
> +	number of uses for DEBUG_INSNs.
> +	(fixup_debug_insns): New static function.
> +	(reload_combine_recognize_const_pattern): Use it.  Don't let the
> +	main loop be affected by DEBUG_INSNs.
> +	Really disallow moving adds past a jump insn.
> +	(reload_combine_recognize_pattern): Don't update use_ruid here.
> +	(reload_combine_note_use): Do it here.
> +	(reload_combine): Use control_flow_insn_p rather than JUMP_P.
> +
> +	2010-07-20  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	gcc/
> +	* postreload.c (fixup_debug_insns): Remove arg REGNO.  New args
> +	FROM and TO.  All callers changed.  Don't look for tracked uses,
> +	just scan the RTL for DEBUG_INSNs and substitute.
> +	(reload_combine_recognize_pattern): Call fixup_debug_insns.
> +	(reload_combine): Ignore DEBUG_INSNs.
> +
> +	2010-07-22  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	PR bootstrap/44970
> +	PR middle-end/45009
> +	gcc/
> +	* postreload.c: Include "target.h".
> +	(reload_combine_closest_single_use): Don't take DEBUG_INSNs
> +	into account.
> +	(fixup_debug_insns): Don't copy the rtx.
> +	(reload_combine_recognize_const_pattern): DEBUG_INSNs can't have uses.
> +	Don't copy when replacing.  Call fixup_debug_insns in the case where
> +	we merged one add with another.
> +	(reload_combine_recognize_pattern): Fail if there aren't any uses.
> +	Try harder to determine whether we're picking a valid index register.
> +	Don't set store_ruid for an insn we're going to scan in the
> +	next iteration.
> +	(reload_combine): Remove unused code.
> +	(reload_combine_note_use): When updating use information for
> +	an old insn, ignore a use that occurs after store_ruid.
> +	* Makefile.in (postreload.o): Update dependencies.
> +
> +	2010-07-27  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	gcc/
> +	* postreload.c (reload_combine_recognize_const_pattern): Move test
> +	for limiting the insn movement to the right scope.
> +
> +	2010-07-27  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	gcc/
> +	* postreload.c (try_replace_in_use): New static function.
> +	(reload_combine_recognize_const_pattern): Use it here.  Allow
> +	substituting into a final add insn, and substituting into a memory
> +	reference in an insn that sets the reg.
> +
> +=== modified file 'gcc/Makefile.in'
> +--- old/gcc/Makefile.in	2010-10-14 11:25:44 +0000
> ++++ new/gcc/Makefile.in	2010-11-08 22:08:43 +0000
> +@@ -3155,7 +3155,7 @@
> +    $(RTL_H) $(REAL_H) $(FLAGS_H) $(EXPR_H) $(OPTABS_H) reload.h $(REGS_H) \
> +    hard-reg-set.h insn-config.h $(BASIC_BLOCK_H) $(RECOG_H) output.h \
> +    $(FUNCTION_H) $(TOPLEV_H) cselib.h $(TM_P_H) $(EXCEPT_H) $(TREE_H) $(MACHMODE_H) \
> +-   $(OBSTACK_H) $(TARGET_H) $(TIMEVAR_H) $(TREE_PASS_H) $(DF_H) $(DBGCNT_H)
> ++   $(OBSTACK_H) $(TIMEVAR_H) $(TREE_PASS_H) $(DF_H) $(DBGCNT_H)
> + postreload-gcse.o : postreload-gcse.c $(CONFIG_H) $(SYSTEM_H) coretypes.h \
> +    $(TM_H) $(RTL_H) $(REGS_H) hard-reg-set.h $(FLAGS_H) insn-config.h \
> +    $(RECOG_H) $(EXPR_H) $(BASIC_BLOCK_H) $(FUNCTION_H) output.h $(TOPLEV_H) \
> +
> +=== modified file 'gcc/postreload.c'
> +--- old/gcc/postreload.c	2010-10-14 11:32:02 +0000
> ++++ new/gcc/postreload.c	2010-11-08 22:08:43 +0000
> +@@ -44,7 +44,6 @@
> + #include "toplev.h"
> + #include "except.h"
> + #include "tree.h"
> +-#include "target.h"
> + #include "timevar.h"
> + #include "tree-pass.h"
> + #include "df.h"
> +@@ -57,10 +56,10 @@
> + static int reload_cse_simplify_operands (rtx, rtx);
> + 
> + static void reload_combine (void);
> +-static void reload_combine_note_use (rtx *, rtx, int, rtx);
> ++static void reload_combine_note_use (rtx *, rtx);
> + static void reload_combine_note_store (rtx, const_rtx, void *);
> + 
> +-static bool reload_cse_move2add (rtx);
> ++static void reload_cse_move2add (rtx);
> + static void move2add_note_store (rtx, const_rtx, void *);
> + 
> + /* Call cse / combine like post-reload optimization phases.
> +@@ -68,16 +67,11 @@
> + void
> + reload_cse_regs (rtx first ATTRIBUTE_UNUSED)
> + {
> +-  bool moves_converted;
> +   reload_cse_regs_1 (first);
> +   reload_combine ();
> +-  moves_converted = reload_cse_move2add (first);
> ++  reload_cse_move2add (first);
> +   if (flag_expensive_optimizations)
> +-    {
> +-      if (moves_converted)
> +-	reload_combine ();
> +-      reload_cse_regs_1 (first);
> +-    }
> ++    reload_cse_regs_1 (first);
> + }
> + 
> + /* See whether a single set SET is a noop.  */
> +@@ -666,43 +660,30 @@
> + 
> + /* The maximum number of uses of a register we can keep track of to
> +    replace them with reg+reg addressing.  */
> +-#define RELOAD_COMBINE_MAX_USES 16
> ++#define RELOAD_COMBINE_MAX_USES 6
> + 
> +-/* Describes a recorded use of a register.  */
> +-struct reg_use
> +-{
> +-  /* The insn where a register has been used.  */
> +-  rtx insn;
> +-  /* Points to the memory reference enclosing the use, if any, NULL_RTX
> +-     otherwise.  */
> +-  rtx containing_mem;
> +-  /* Location of the register withing INSN.  */
> +-  rtx *usep;
> +-  /* The reverse uid of the insn.  */
> +-  int ruid;
> +-};
> ++/* INSN is the insn where a register has been used, and USEP points to the
> ++   location of the register within the rtl.  */
> ++struct reg_use { rtx insn, *usep; };
> + 
> + /* If the register is used in some unknown fashion, USE_INDEX is negative.
> +    If it is dead, USE_INDEX is RELOAD_COMBINE_MAX_USES, and STORE_RUID
> +-   indicates where it is first set or clobbered.
> ++   indicates where it becomes live again.
> +    Otherwise, USE_INDEX is the index of the last encountered use of the
> +-   register (which is first among these we have seen since we scan backwards).
> +-   USE_RUID indicates the first encountered, i.e. last, of these uses.
> +-   If ALL_OFFSETS_MATCH is true, all encountered uses were inside a PLUS
> +-   with a constant offset; OFFSET contains this constant in that case.
> ++   register (which is first among these we have seen since we scan backwards),
> ++   OFFSET contains the constant offset that is added to the register in
> ++   all encountered uses, and USE_RUID indicates the first encountered, i.e.
> ++   last, of these uses.
> +    STORE_RUID is always meaningful if we only want to use a value in a
> +    register in a different place: it denotes the next insn in the insn
> +-   stream (i.e. the last encountered) that sets or clobbers the register.
> +-   REAL_STORE_RUID is similar, but clobbers are ignored when updating it.  */
> ++   stream (i.e. the last encountered) that sets or clobbers the register.  */
> + static struct
> +   {
> +     struct reg_use reg_use[RELOAD_COMBINE_MAX_USES];
> ++    int use_index;
> +     rtx offset;
> +-    int use_index;
> +     int store_ruid;
> +-    int real_store_ruid;
> +     int use_ruid;
> +-    bool all_offsets_match;
> +   } reg_state[FIRST_PSEUDO_REGISTER];
> + 
> + /* Reverse linear uid.  This is increased in reload_combine while scanning
> +@@ -710,548 +691,42 @@
> +    and the store_ruid / use_ruid fields in reg_state.  */
> + static int reload_combine_ruid;
> + 
> +-/* The RUID of the last label we encountered in reload_combine.  */
> +-static int last_label_ruid;
> +-
> +-/* The RUID of the last jump we encountered in reload_combine.  */
> +-static int last_jump_ruid;
> +-
> +-/* The register numbers of the first and last index register.  A value of
> +-   -1 in LAST_INDEX_REG indicates that we've previously computed these
> +-   values and found no suitable index registers.  */
> +-static int first_index_reg = -1;
> +-static int last_index_reg;
> +-
> + #define LABEL_LIVE(LABEL) \
> +   (label_live[CODE_LABEL_NUMBER (LABEL) - min_labelno])
> + 
> +-/* Subroutine of reload_combine_split_ruids, called to fix up a single
> +-   ruid pointed to by *PRUID if it is higher than SPLIT_RUID.  */
> +-
> +-static inline void
> +-reload_combine_split_one_ruid (int *pruid, int split_ruid)
> +-{
> +-  if (*pruid > split_ruid)
> +-    (*pruid)++;
> +-}
> +-
> +-/* Called when we insert a new insn in a position we've already passed in
> +-   the scan.  Examine all our state, increasing all ruids that are higher
> +-   than SPLIT_RUID by one in order to make room for a new insn.  */
> +-
> +-static void
> +-reload_combine_split_ruids (int split_ruid)
> +-{
> +-  unsigned i;
> +-
> +-  reload_combine_split_one_ruid (&reload_combine_ruid, split_ruid);
> +-  reload_combine_split_one_ruid (&last_label_ruid, split_ruid);
> +-  reload_combine_split_one_ruid (&last_jump_ruid, split_ruid);
> +-
> +-  for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
> +-    {
> +-      int j, idx = reg_state[i].use_index;
> +-      reload_combine_split_one_ruid (&reg_state[i].use_ruid, split_ruid);
> +-      reload_combine_split_one_ruid (&reg_state[i].store_ruid, split_ruid);
> +-      reload_combine_split_one_ruid (&reg_state[i].real_store_ruid,
> +-				     split_ruid);
> +-      if (idx < 0)
> +-	continue;
> +-      for (j = idx; j < RELOAD_COMBINE_MAX_USES; j++)
> +-	{
> +-	  reload_combine_split_one_ruid (&reg_state[i].reg_use[j].ruid,
> +-					 split_ruid);
> +-	}
> +-    }
> +-}
> +-
> +-/* Called when we are about to rescan a previously encountered insn with
> +-   reload_combine_note_use after modifying some part of it.  This clears all
> +-   information about uses in that particular insn.  */
> +-
> +-static void
> +-reload_combine_purge_insn_uses (rtx insn)
> +-{
> +-  unsigned i;
> +-
> +-  for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
> +-    {
> +-      int j, k, idx = reg_state[i].use_index;
> +-      if (idx < 0)
> +-	continue;
> +-      j = k = RELOAD_COMBINE_MAX_USES;
> +-      while (j-- > idx)
> +-	{
> +-	  if (reg_state[i].reg_use[j].insn != insn)
> +-	    {
> +-	      k--;
> +-	      if (k != j)
> +-		reg_state[i].reg_use[k] = reg_state[i].reg_use[j];
> +-	    }
> +-	}
> +-      reg_state[i].use_index = k;
> +-    }
> +-}
> +-
> +-/* Called when we need to forget about all uses of REGNO after an insn
> +-   which is identified by RUID.  */
> +-
> +-static void
> +-reload_combine_purge_reg_uses_after_ruid (unsigned regno, int ruid)
> +-{
> +-  int j, k, idx = reg_state[regno].use_index;
> +-  if (idx < 0)
> +-    return;
> +-  j = k = RELOAD_COMBINE_MAX_USES;
> +-  while (j-- > idx)
> +-    {
> +-      if (reg_state[regno].reg_use[j].ruid >= ruid)
> +-	{
> +-	  k--;
> +-	  if (k != j)
> +-	    reg_state[regno].reg_use[k] = reg_state[regno].reg_use[j];
> +-	}
> +-    }
> +-  reg_state[regno].use_index = k;
> +-}
> +-
> +-/* Find the use of REGNO with the ruid that is highest among those
> +-   lower than RUID_LIMIT, and return it if it is the only use of this
> +-   reg in the insn.  Return NULL otherwise.  */
> +-
> +-static struct reg_use *
> +-reload_combine_closest_single_use (unsigned regno, int ruid_limit)
> +-{
> +-  int i, best_ruid = 0;
> +-  int use_idx = reg_state[regno].use_index;
> +-  struct reg_use *retval;
> +-
> +-  if (use_idx < 0)
> +-    return NULL;
> +-  retval = NULL;
> +-  for (i = use_idx; i < RELOAD_COMBINE_MAX_USES; i++)
> +-    {
> +-      struct reg_use *use = reg_state[regno].reg_use + i; 
> +-      int this_ruid = use->ruid;
> +-      if (this_ruid >= ruid_limit)
> +-	continue;
> +-      if (this_ruid > best_ruid)
> +-	{
> +-	  best_ruid = this_ruid;
> +-	  retval = use;
> +-	}
> +-      else if (this_ruid == best_ruid)
> +-	retval = NULL;
> +-    }
> +-  if (last_label_ruid >= best_ruid)
> +-    return NULL;
> +-  return retval;
> +-}
> +-
> +-/* After we've moved an add insn, fix up any debug insns that occur
> +-   between the old location of the add and the new location.  REG is
> +-   the destination register of the add insn; REPLACEMENT is the
> +-   SET_SRC of the add.  FROM and TO specify the range in which we
> +-   should make this change on debug insns.  */
> +-
> +-static void
> +-fixup_debug_insns (rtx reg, rtx replacement, rtx from, rtx to)
> +-{
> +-  rtx insn;
> +-  for (insn = from; insn != to; insn = NEXT_INSN (insn))
> +-    {
> +-      rtx t;
> +-
> +-      if (!DEBUG_INSN_P (insn))
> +-	continue;
> +-      
> +-      t = INSN_VAR_LOCATION_LOC (insn);
> +-      t = simplify_replace_rtx (t, reg, replacement);
> +-      validate_change (insn, &INSN_VAR_LOCATION_LOC (insn), t, 0);
> +-    }
> +-}
> +-
> +-/* Subroutine of reload_combine_recognize_const_pattern.  Try to replace REG
> +-   with SRC in the insn described by USE, taking costs into account.  Return
> +-   true if we made the replacement.  */
> +-
> +-static bool
> +-try_replace_in_use (struct reg_use *use, rtx reg, rtx src)
> +-{
> +-  rtx use_insn = use->insn;
> +-  rtx mem = use->containing_mem;
> +-  bool speed = optimize_bb_for_speed_p (BLOCK_FOR_INSN (use_insn));
> +-
> +-  if (mem != NULL_RTX)
> +-    {
> +-      addr_space_t as = MEM_ADDR_SPACE (mem);
> +-      rtx oldaddr = XEXP (mem, 0);
> +-      rtx newaddr = NULL_RTX;
> +-      int old_cost = address_cost (oldaddr, GET_MODE (mem), as, speed);
> +-      int new_cost;
> +-
> +-      newaddr = simplify_replace_rtx (oldaddr, reg, src);
> +-      if (memory_address_addr_space_p (GET_MODE (mem), newaddr, as))
> +-	{
> +-	  XEXP (mem, 0) = newaddr;
> +-	  new_cost = address_cost (newaddr, GET_MODE (mem), as, speed);
> +-	  XEXP (mem, 0) = oldaddr;
> +-	  if (new_cost <= old_cost
> +-	      && validate_change (use_insn,
> +-				  &XEXP (mem, 0), newaddr, 0))
> +-	    return true;
> +-	}
> +-    }
> +-  else
> +-    {
> +-      rtx new_set = single_set (use_insn);
> +-      if (new_set
> +-	  && REG_P (SET_DEST (new_set))
> +-	  && GET_CODE (SET_SRC (new_set)) == PLUS
> +-	  && REG_P (XEXP (SET_SRC (new_set), 0))
> +-	  && CONSTANT_P (XEXP (SET_SRC (new_set), 1)))
> +-	{
> +-	  rtx new_src;
> +-	  int old_cost = rtx_cost (SET_SRC (new_set), SET, speed);
> +-
> +-	  gcc_assert (rtx_equal_p (XEXP (SET_SRC (new_set), 0), reg));
> +-	  new_src = simplify_replace_rtx (SET_SRC (new_set), reg, src);
> +-
> +-	  if (rtx_cost (new_src, SET, speed) <= old_cost
> +-	      && validate_change (use_insn, &SET_SRC (new_set),
> +-				  new_src, 0))
> +-	    return true;
> +-	}
> +-    }
> +-  return false;
> +-}
> +-
> +-/* Called by reload_combine when scanning INSN.  This function tries to detect
> +-   patterns where a constant is added to a register, and the result is used
> +-   in an address.
> +-   Return true if no further processing is needed on INSN; false if it wasn't
> +-   recognized and should be handled normally.  */
> +-
> +-static bool
> +-reload_combine_recognize_const_pattern (rtx insn)
> +-{
> +-  int from_ruid = reload_combine_ruid;
> +-  rtx set, pat, reg, src, addreg;
> +-  unsigned int regno;
> +-  struct reg_use *use;
> +-  bool must_move_add;
> +-  rtx add_moved_after_insn = NULL_RTX;
> +-  int add_moved_after_ruid = 0;
> +-  int clobbered_regno = -1;
> +-
> +-  set = single_set (insn);
> +-  if (set == NULL_RTX)
> +-    return false;
> +-
> +-  reg = SET_DEST (set);
> +-  src = SET_SRC (set);
> +-  if (!REG_P (reg)
> +-      || hard_regno_nregs[REGNO (reg)][GET_MODE (reg)] != 1
> +-      || GET_MODE (reg) != Pmode
> +-      || reg == stack_pointer_rtx)
> +-    return false;
> +-
> +-  regno = REGNO (reg);
> +-
> +-  /* We look for a REG1 = REG2 + CONSTANT insn, followed by either
> +-     uses of REG1 inside an address, or inside another add insn.  If
> +-     possible and profitable, merge the addition into subsequent
> +-     uses.  */
> +-  if (GET_CODE (src) != PLUS
> +-      || !REG_P (XEXP (src, 0))
> +-      || !CONSTANT_P (XEXP (src, 1)))
> +-    return false;
> +-
> +-  addreg = XEXP (src, 0);
> +-  must_move_add = rtx_equal_p (reg, addreg);
> +-
> +-  pat = PATTERN (insn);
> +-  if (must_move_add && set != pat)
> +-    {
> +-      /* We have to be careful when moving the add; apart from the
> +-	 single_set there may also be clobbers.  Recognize one special
> +-	 case, that of one clobber alongside the set (likely a clobber
> +-	 of the CC register).  */
> +-      gcc_assert (GET_CODE (PATTERN (insn)) == PARALLEL);
> +-      if (XVECLEN (pat, 0) != 2 || XVECEXP (pat, 0, 0) != set
> +-	  || GET_CODE (XVECEXP (pat, 0, 1)) != CLOBBER
> +-	  || !REG_P (XEXP (XVECEXP (pat, 0, 1), 0)))
> +-	return false;
> +-      clobbered_regno = REGNO (XEXP (XVECEXP (pat, 0, 1), 0));
> +-    }
> +-
> +-  do
> +-    {
> +-      use = reload_combine_closest_single_use (regno, from_ruid);
> +-
> +-      if (use)
> +-	/* Start the search for the next use from here.  */
> +-	from_ruid = use->ruid;
> +-
> +-      if (use && GET_MODE (*use->usep) == Pmode)
> +-	{
> +-	  bool delete_add = false;
> +-	  rtx use_insn = use->insn;
> +-	  int use_ruid = use->ruid;
> +-
> +-	  /* Avoid moving the add insn past a jump.  */
> +-	  if (must_move_add && use_ruid <= last_jump_ruid)
> +-	    break;
> +-
> +-	  /* If the add clobbers another hard reg in parallel, don't move
> +-	     it past a real set of this hard reg.  */
> +-	  if (must_move_add && clobbered_regno >= 0
> +-	      && reg_state[clobbered_regno].real_store_ruid >= use_ruid)
> +-	    break;
> +-
> +-	  gcc_assert (reg_state[regno].store_ruid <= use_ruid);
> +-	  /* Avoid moving a use of ADDREG past a point where it is stored.  */
> +-	  if (reg_state[REGNO (addreg)].store_ruid > use_ruid)
> +-	    break;
> +-
> +-	  /* We also must not move the addition past an insn that sets
> +-	     the same register, unless we can combine two add insns.  */
> +-	  if (must_move_add && reg_state[regno].store_ruid == use_ruid)
> +-	    {
> +-	      if (use->containing_mem == NULL_RTX)
> +-		delete_add = true;
> +-	      else
> +-		break;
> +-	    }
> +-
> +-	  if (try_replace_in_use (use, reg, src))
> +-	    {
> +-	      reload_combine_purge_insn_uses (use_insn);
> +-	      reload_combine_note_use (&PATTERN (use_insn), use_insn,
> +-				       use_ruid, NULL_RTX);
> +-
> +-	      if (delete_add)
> +-		{
> +-		  fixup_debug_insns (reg, src, insn, use_insn);
> +-		  delete_insn (insn);
> +-		  return true;
> +-		}
> +-	      if (must_move_add)
> +-		{
> +-		  add_moved_after_insn = use_insn;
> +-		  add_moved_after_ruid = use_ruid;
> +-		}
> +-	      continue;
> +-	    }
> +-	}
> +-      /* If we get here, we couldn't handle this use.  */
> +-      if (must_move_add)
> +-	break;
> +-    }
> +-  while (use);
> +-
> +-  if (!must_move_add || add_moved_after_insn == NULL_RTX)
> +-    /* Process the add normally.  */
> +-    return false;
> +-
> +-  fixup_debug_insns (reg, src, insn, add_moved_after_insn);
> +-
> +-  reorder_insns (insn, insn, add_moved_after_insn);
> +-  reload_combine_purge_reg_uses_after_ruid (regno, add_moved_after_ruid);
> +-  reload_combine_split_ruids (add_moved_after_ruid - 1);
> +-  reload_combine_note_use (&PATTERN (insn), insn,
> +-			   add_moved_after_ruid, NULL_RTX);
> +-  reg_state[regno].store_ruid = add_moved_after_ruid;
> +-
> +-  return true;
> +-}
> +-
> +-/* Called by reload_combine when scanning INSN.  Try to detect a pattern we
> +-   can handle and improve.  Return true if no further processing is needed on
> +-   INSN; false if it wasn't recognized and should be handled normally.  */
> +-
> +-static bool
> +-reload_combine_recognize_pattern (rtx insn)
> +-{
> +-  rtx set, reg, src;
> +-  unsigned int regno;
> +-
> +-  set = single_set (insn);
> +-  if (set == NULL_RTX)
> +-    return false;
> +-
> +-  reg = SET_DEST (set);
> +-  src = SET_SRC (set);
> +-  if (!REG_P (reg)
> +-      || hard_regno_nregs[REGNO (reg)][GET_MODE (reg)] != 1)
> +-    return false;
> +-
> +-  regno = REGNO (reg);
> +-
> +-  /* Look for (set (REGX) (CONST_INT))
> +-     (set (REGX) (PLUS (REGX) (REGY)))
> +-     ...
> +-     ... (MEM (REGX)) ...
> +-     and convert it to
> +-     (set (REGZ) (CONST_INT))
> +-     ...
> +-     ... (MEM (PLUS (REGZ) (REGY)))... .
> +-
> +-     First, check that we have (set (REGX) (PLUS (REGX) (REGY)))
> +-     and that we know all uses of REGX before it dies.
> +-     Also, explicitly check that REGX != REGY; our life information
> +-     does not yet show whether REGY changes in this insn.  */
> +-
> +-  if (GET_CODE (src) == PLUS
> +-      && reg_state[regno].all_offsets_match
> +-      && last_index_reg != -1
> +-      && REG_P (XEXP (src, 1))
> +-      && rtx_equal_p (XEXP (src, 0), reg)
> +-      && !rtx_equal_p (XEXP (src, 1), reg)
> +-      && reg_state[regno].use_index >= 0
> +-      && reg_state[regno].use_index < RELOAD_COMBINE_MAX_USES
> +-      && last_label_ruid < reg_state[regno].use_ruid)
> +-    {
> +-      rtx base = XEXP (src, 1);
> +-      rtx prev = prev_nonnote_insn (insn);
> +-      rtx prev_set = prev ? single_set (prev) : NULL_RTX;
> +-      rtx index_reg = NULL_RTX;
> +-      rtx reg_sum = NULL_RTX;
> +-      int i;
> +-
> +-      /* Now we need to set INDEX_REG to an index register (denoted as
> +-	 REGZ in the illustration above) and REG_SUM to the expression
> +-	 register+register that we want to use to substitute uses of REG
> +-	 (typically in MEMs) with.  First check REG and BASE for being
> +-	 index registers; we can use them even if they are not dead.  */
> +-      if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS], regno)
> +-	  || TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS],
> +-				REGNO (base)))
> +-	{
> +-	  index_reg = reg;
> +-	  reg_sum = src;
> +-	}
> +-      else
> +-	{
> +-	  /* Otherwise, look for a free index register.  Since we have
> +-	     checked above that neither REG nor BASE are index registers,
> +-	     if we find anything at all, it will be different from these
> +-	     two registers.  */
> +-	  for (i = first_index_reg; i <= last_index_reg; i++)
> +-	    {
> +-	      if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS], i)
> +-		  && reg_state[i].use_index == RELOAD_COMBINE_MAX_USES
> +-		  && reg_state[i].store_ruid <= reg_state[regno].use_ruid
> +-		  && (call_used_regs[i] || df_regs_ever_live_p (i))
> +-		  && (!frame_pointer_needed || i != HARD_FRAME_POINTER_REGNUM)
> +-		  && !fixed_regs[i] && !global_regs[i]
> +-		  && hard_regno_nregs[i][GET_MODE (reg)] == 1
> +-		  && targetm.hard_regno_scratch_ok (i))
> +-		{
> +-		  index_reg = gen_rtx_REG (GET_MODE (reg), i);
> +-		  reg_sum = gen_rtx_PLUS (GET_MODE (reg), index_reg, base);
> +-		  break;
> +-		}
> +-	    }
> +-	}
> +-
> +-      /* Check that PREV_SET is indeed (set (REGX) (CONST_INT)) and that
> +-	 (REGY), i.e. BASE, is not clobbered before the last use we'll
> +-	 create.  */
> +-      if (reg_sum
> +-	  && prev_set
> +-	  && CONST_INT_P (SET_SRC (prev_set))
> +-	  && rtx_equal_p (SET_DEST (prev_set), reg)
> +-	  && (reg_state[REGNO (base)].store_ruid
> +-	      <= reg_state[regno].use_ruid))
> +-	{
> +-	  /* Change destination register and, if necessary, the constant
> +-	     value in PREV, the constant loading instruction.  */
> +-	  validate_change (prev, &SET_DEST (prev_set), index_reg, 1);
> +-	  if (reg_state[regno].offset != const0_rtx)
> +-	    validate_change (prev,
> +-			     &SET_SRC (prev_set),
> +-			     GEN_INT (INTVAL (SET_SRC (prev_set))
> +-				      + INTVAL (reg_state[regno].offset)),
> +-			     1);
> +-
> +-	  /* Now for every use of REG that we have recorded, replace REG
> +-	     with REG_SUM.  */
> +-	  for (i = reg_state[regno].use_index;
> +-	       i < RELOAD_COMBINE_MAX_USES; i++)
> +-	    validate_unshare_change (reg_state[regno].reg_use[i].insn,
> +-				     reg_state[regno].reg_use[i].usep,
> +-				     /* Each change must have its own
> +-					replacement.  */
> +-				     reg_sum, 1);
> +-
> +-	  if (apply_change_group ())
> +-	    {
> +-	      struct reg_use *lowest_ruid = NULL;
> +-
> +-	      /* For every new use of REG_SUM, we have to record the use
> +-		 of BASE therein, i.e. operand 1.  */
> +-	      for (i = reg_state[regno].use_index;
> +-		   i < RELOAD_COMBINE_MAX_USES; i++)
> +-		{
> +-		  struct reg_use *use = reg_state[regno].reg_use + i;
> +-		  reload_combine_note_use (&XEXP (*use->usep, 1), use->insn,
> +-					   use->ruid, use->containing_mem);
> +-		  if (lowest_ruid == NULL || use->ruid < lowest_ruid->ruid)
> +-		    lowest_ruid = use;
> +-		}
> +-
> +-	      fixup_debug_insns (reg, reg_sum, insn, lowest_ruid->insn);
> +-
> +-	      /* Delete the reg-reg addition.  */
> +-	      delete_insn (insn);
> +-
> +-	      if (reg_state[regno].offset != const0_rtx)
> +-		/* Previous REG_EQUIV / REG_EQUAL notes for PREV
> +-		   are now invalid.  */
> +-		remove_reg_equal_equiv_notes (prev);
> +-
> +-	      reg_state[regno].use_index = RELOAD_COMBINE_MAX_USES;
> +-	      return true;
> +-	    }
> +-	}
> +-    }
> +-  return false;
> +-}
> +-
> + static void
> + reload_combine (void)
> + {
> +-  rtx insn, prev;
> ++  rtx insn, set;
> ++  int first_index_reg = -1;
> ++  int last_index_reg = 0;
> +   int i;
> +   basic_block bb;
> +   unsigned int r;
> ++  int last_label_ruid;
> +   int min_labelno, n_labels;
> +   HARD_REG_SET ever_live_at_start, *label_live;
> + 
> ++  /* If reg+reg can be used in offsetable memory addresses, the main chunk of
> ++     reload has already used it where appropriate, so there is no use in
> ++     trying to generate it now.  */
> ++  if (double_reg_address_ok && INDEX_REG_CLASS != NO_REGS)
> ++    return;
> ++
> +   /* To avoid wasting too much time later searching for an index register,
> +      determine the minimum and maximum index register numbers.  */
> +-  if (INDEX_REG_CLASS == NO_REGS)
> +-    last_index_reg = -1;
> +-  else if (first_index_reg == -1 && last_index_reg == 0)
> +-    {
> +-      for (r = 0; r < FIRST_PSEUDO_REGISTER; r++)
> +-	if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS], r))
> +-	  {
> +-	    if (first_index_reg == -1)
> +-	      first_index_reg = r;
> +-
> +-	    last_index_reg = r;
> +-	  }
> +-
> +-      /* If no index register is available, we can quit now.  Set LAST_INDEX_REG
> +-	 to -1 so we'll know to quit early the next time we get here.  */
> +-      if (first_index_reg == -1)
> +-	{
> +-	  last_index_reg = -1;
> +-	  return;
> +-	}
> +-    }
> ++  for (r = 0; r < FIRST_PSEUDO_REGISTER; r++)
> ++    if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS], r))
> ++      {
> ++	if (first_index_reg == -1)
> ++	  first_index_reg = r;
> ++
> ++	last_index_reg = r;
> ++      }
> ++
> ++  /* If no index register is available, we can quit now.  */
> ++  if (first_index_reg == -1)
> ++    return;
> + 
> +   /* Set up LABEL_LIVE and EVER_LIVE_AT_START.  The register lifetime
> +      information is a bit fuzzy immediately after reload, but it's
> +@@ -1278,23 +753,20 @@
> +     }
> + 
> +   /* Initialize last_label_ruid, reload_combine_ruid and reg_state.  */
> +-  last_label_ruid = last_jump_ruid = reload_combine_ruid = 0;
> ++  last_label_ruid = reload_combine_ruid = 0;
> +   for (r = 0; r < FIRST_PSEUDO_REGISTER; r++)
> +     {
> +-      reg_state[r].store_ruid = 0;
> +-      reg_state[r].real_store_ruid = 0;
> ++      reg_state[r].store_ruid = reload_combine_ruid;
> +       if (fixed_regs[r])
> + 	reg_state[r].use_index = -1;
> +       else
> + 	reg_state[r].use_index = RELOAD_COMBINE_MAX_USES;
> +     }
> + 
> +-  for (insn = get_last_insn (); insn; insn = prev)
> ++  for (insn = get_last_insn (); insn; insn = PREV_INSN (insn))
> +     {
> +       rtx note;
> + 
> +-      prev = PREV_INSN (insn);
> +-
> +       /* We cannot do our optimization across labels.  Invalidating all the use
> + 	 information we have would be costly, so we just note where the label
> + 	 is and then later disable any optimization that would cross it.  */
> +@@ -1305,17 +777,141 @@
> + 	  if (! fixed_regs[r])
> + 	      reg_state[r].use_index = RELOAD_COMBINE_MAX_USES;
> + 
> +-      if (! NONDEBUG_INSN_P (insn))
> ++      if (! INSN_P (insn))
> + 	continue;
> + 
> +       reload_combine_ruid++;
> + 
> +-      if (control_flow_insn_p (insn))
> +-	last_jump_ruid = reload_combine_ruid;
> +-
> +-      if (reload_combine_recognize_const_pattern (insn)
> +-	  || reload_combine_recognize_pattern (insn))
> +-	continue;
> ++      /* Look for (set (REGX) (CONST_INT))
> ++	 (set (REGX) (PLUS (REGX) (REGY)))
> ++	 ...
> ++	 ... (MEM (REGX)) ...
> ++	 and convert it to
> ++	 (set (REGZ) (CONST_INT))
> ++	 ...
> ++	 ... (MEM (PLUS (REGZ) (REGY)))... .
> ++
> ++	 First, check that we have (set (REGX) (PLUS (REGX) (REGY)))
> ++	 and that we know all uses of REGX before it dies.
> ++	 Also, explicitly check that REGX != REGY; our life information
> ++	 does not yet show whether REGY changes in this insn.  */
> ++      set = single_set (insn);
> ++      if (set != NULL_RTX
> ++	  && REG_P (SET_DEST (set))
> ++	  && (hard_regno_nregs[REGNO (SET_DEST (set))]
> ++			      [GET_MODE (SET_DEST (set))]
> ++	      == 1)
> ++	  && GET_CODE (SET_SRC (set)) == PLUS
> ++	  && REG_P (XEXP (SET_SRC (set), 1))
> ++	  && rtx_equal_p (XEXP (SET_SRC (set), 0), SET_DEST (set))
> ++	  && !rtx_equal_p (XEXP (SET_SRC (set), 1), SET_DEST (set))
> ++	  && last_label_ruid < reg_state[REGNO (SET_DEST (set))].use_ruid)
> ++	{
> ++	  rtx reg = SET_DEST (set);
> ++	  rtx plus = SET_SRC (set);
> ++	  rtx base = XEXP (plus, 1);
> ++	  rtx prev = prev_nonnote_nondebug_insn (insn);
> ++	  rtx prev_set = prev ? single_set (prev) : NULL_RTX;
> ++	  unsigned int regno = REGNO (reg);
> ++	  rtx index_reg = NULL_RTX;
> ++	  rtx reg_sum = NULL_RTX;
> ++
> ++	  /* Now we need to set INDEX_REG to an index register (denoted as
> ++	     REGZ in the illustration above) and REG_SUM to the expression
> ++	     register+register that we want to use to substitute uses of REG
> ++	     (typically in MEMs) with.  First check REG and BASE for being
> ++	     index registers; we can use them even if they are not dead.  */
> ++	  if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS], regno)
> ++	      || TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS],
> ++				    REGNO (base)))
> ++	    {
> ++	      index_reg = reg;
> ++	      reg_sum = plus;
> ++	    }
> ++	  else
> ++	    {
> ++	      /* Otherwise, look for a free index register.  Since we have
> ++		 checked above that neither REG nor BASE are index registers,
> ++		 if we find anything at all, it will be different from these
> ++		 two registers.  */
> ++	      for (i = first_index_reg; i <= last_index_reg; i++)
> ++		{
> ++		  if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS],
> ++					 i)
> ++		      && reg_state[i].use_index == RELOAD_COMBINE_MAX_USES
> ++		      && reg_state[i].store_ruid <= reg_state[regno].use_ruid
> ++		      && hard_regno_nregs[i][GET_MODE (reg)] == 1)
> ++		    {
> ++		      index_reg = gen_rtx_REG (GET_MODE (reg), i);
> ++		      reg_sum = gen_rtx_PLUS (GET_MODE (reg), index_reg, base);
> ++		      break;
> ++		    }
> ++		}
> ++	    }
> ++
> ++	  /* Check that PREV_SET is indeed (set (REGX) (CONST_INT)) and that
> ++	     (REGY), i.e. BASE, is not clobbered before the last use we'll
> ++	     create.  */
> ++	  if (reg_sum
> ++	      && prev_set
> ++	      && CONST_INT_P (SET_SRC (prev_set))
> ++	      && rtx_equal_p (SET_DEST (prev_set), reg)
> ++	      && reg_state[regno].use_index >= 0
> ++	      && (reg_state[REGNO (base)].store_ruid
> ++		  <= reg_state[regno].use_ruid))
> ++	    {
> ++	      int i;
> ++
> ++	      /* Change destination register and, if necessary, the constant
> ++		 value in PREV, the constant loading instruction.  */
> ++	      validate_change (prev, &SET_DEST (prev_set), index_reg, 1);
> ++	      if (reg_state[regno].offset != const0_rtx)
> ++		validate_change (prev,
> ++				 &SET_SRC (prev_set),
> ++				 GEN_INT (INTVAL (SET_SRC (prev_set))
> ++					  + INTVAL (reg_state[regno].offset)),
> ++				 1);
> ++
> ++	      /* Now for every use of REG that we have recorded, replace REG
> ++		 with REG_SUM.  */
> ++	      for (i = reg_state[regno].use_index;
> ++		   i < RELOAD_COMBINE_MAX_USES; i++)
> ++		validate_unshare_change (reg_state[regno].reg_use[i].insn,
> ++				 	 reg_state[regno].reg_use[i].usep,
> ++				 	 /* Each change must have its own
> ++				    	    replacement.  */
> ++				 	 reg_sum, 1);
> ++
> ++	      if (apply_change_group ())
> ++		{
> ++		  /* For every new use of REG_SUM, we have to record the use
> ++		     of BASE therein, i.e. operand 1.  */
> ++		  for (i = reg_state[regno].use_index;
> ++		       i < RELOAD_COMBINE_MAX_USES; i++)
> ++		    reload_combine_note_use
> ++		      (&XEXP (*reg_state[regno].reg_use[i].usep, 1),
> ++		       reg_state[regno].reg_use[i].insn);
> ++
> ++		  if (reg_state[REGNO (base)].use_ruid
> ++		      > reg_state[regno].use_ruid)
> ++		    reg_state[REGNO (base)].use_ruid
> ++		      = reg_state[regno].use_ruid;
> ++
> ++		  /* Delete the reg-reg addition.  */
> ++		  delete_insn (insn);
> ++
> ++		  if (reg_state[regno].offset != const0_rtx)
> ++		    /* Previous REG_EQUIV / REG_EQUAL notes for PREV
> ++		       are now invalid.  */
> ++		    remove_reg_equal_equiv_notes (prev);
> ++
> ++		  reg_state[regno].use_index = RELOAD_COMBINE_MAX_USES;
> ++		  reg_state[REGNO (index_reg)].store_ruid
> ++		    = reload_combine_ruid;
> ++		  continue;
> ++		}
> ++	    }
> ++	}
> + 
> +       note_stores (PATTERN (insn), reload_combine_note_store, NULL);
> + 
> +@@ -1371,8 +967,7 @@
> + 	      reg_state[i].use_index = -1;
> + 	}
> + 
> +-      reload_combine_note_use (&PATTERN (insn), insn,
> +-			       reload_combine_ruid, NULL_RTX);
> ++      reload_combine_note_use (&PATTERN (insn), insn);
> +       for (note = REG_NOTES (insn); note; note = XEXP (note, 1))
> + 	{
> + 	  if (REG_NOTE_KIND (note) == REG_INC
> +@@ -1381,7 +976,6 @@
> + 	      int regno = REGNO (XEXP (note, 0));
> + 
> + 	      reg_state[regno].store_ruid = reload_combine_ruid;
> +-	      reg_state[regno].real_store_ruid = reload_combine_ruid;
> + 	      reg_state[regno].use_index = -1;
> + 	    }
> + 	}
> +@@ -1391,8 +985,8 @@
> + }
> + 
> + /* Check if DST is a register or a subreg of a register; if it is,
> +-   update store_ruid, real_store_ruid and use_index in the reg_state
> +-   structure accordingly.  Called via note_stores from reload_combine.  */
> ++   update reg_state[regno].store_ruid and reg_state[regno].use_index
> ++   accordingly.  Called via note_stores from reload_combine.  */
> + 
> + static void
> + reload_combine_note_store (rtx dst, const_rtx set, void *data ATTRIBUTE_UNUSED)
> +@@ -1416,14 +1010,14 @@
> +   /* note_stores might have stripped a STRICT_LOW_PART, so we have to be
> +      careful with registers / register parts that are not full words.
> +      Similarly for ZERO_EXTRACT.  */
> +-  if (GET_CODE (SET_DEST (set)) == ZERO_EXTRACT
> ++  if (GET_CODE (set) != SET
> ++      || GET_CODE (SET_DEST (set)) == ZERO_EXTRACT
> +       || GET_CODE (SET_DEST (set)) == STRICT_LOW_PART)
> +     {
> +       for (i = hard_regno_nregs[regno][mode] - 1 + regno; i >= regno; i--)
> + 	{
> + 	  reg_state[i].use_index = -1;
> + 	  reg_state[i].store_ruid = reload_combine_ruid;
> +-	  reg_state[i].real_store_ruid = reload_combine_ruid;
> + 	}
> +     }
> +   else
> +@@ -1431,8 +1025,6 @@
> +       for (i = hard_regno_nregs[regno][mode] - 1 + regno; i >= regno; i--)
> + 	{
> + 	  reg_state[i].store_ruid = reload_combine_ruid;
> +-	  if (GET_CODE (set) == SET)
> +-	    reg_state[i].real_store_ruid = reload_combine_ruid;
> + 	  reg_state[i].use_index = RELOAD_COMBINE_MAX_USES;
> + 	}
> +     }
> +@@ -1443,7 +1035,7 @@
> +    *XP is the pattern of INSN, or a part of it.
> +    Called from reload_combine, and recursively by itself.  */
> + static void
> +-reload_combine_note_use (rtx *xp, rtx insn, int ruid, rtx containing_mem)
> ++reload_combine_note_use (rtx *xp, rtx insn)
> + {
> +   rtx x = *xp;
> +   enum rtx_code code = x->code;
> +@@ -1456,7 +1048,7 @@
> +     case SET:
> +       if (REG_P (SET_DEST (x)))
> + 	{
> +-	  reload_combine_note_use (&SET_SRC (x), insn, ruid, NULL_RTX);
> ++	  reload_combine_note_use (&SET_SRC (x), insn);
> + 	  return;
> + 	}
> +       break;
> +@@ -1512,11 +1104,6 @@
> + 	    return;
> + 	  }
> + 
> +-	/* We may be called to update uses in previously seen insns.
> +-	   Don't add uses beyond the last store we saw.  */
> +-	if (ruid < reg_state[regno].store_ruid)
> +-	  return;
> +-
> + 	/* If this register is already used in some unknown fashion, we
> + 	   can't do anything.
> + 	   If we decrement the index from zero to -1, we can't store more
> +@@ -1525,34 +1112,29 @@
> + 	if (use_index < 0)
> + 	  return;
> + 
> +-	if (use_index == RELOAD_COMBINE_MAX_USES - 1)
> ++	if (use_index != RELOAD_COMBINE_MAX_USES - 1)
> ++	  {
> ++	    /* We have found another use for a register that is already
> ++	       used later.  Check if the offsets match; if not, mark the
> ++	       register as used in an unknown fashion.  */
> ++	    if (! rtx_equal_p (offset, reg_state[regno].offset))
> ++	      {
> ++		reg_state[regno].use_index = -1;
> ++		return;
> ++	      }
> ++	  }
> ++	else
> + 	  {
> + 	    /* This is the first use of this register we have seen since we
> + 	       marked it as dead.  */
> + 	    reg_state[regno].offset = offset;
> +-	    reg_state[regno].all_offsets_match = true;
> +-	    reg_state[regno].use_ruid = ruid;
> +-	  }
> +-	else
> +-	  {
> +-	    if (reg_state[regno].use_ruid > ruid)
> +-	      reg_state[regno].use_ruid = ruid;
> +-
> +-	    if (! rtx_equal_p (offset, reg_state[regno].offset))
> +-	      reg_state[regno].all_offsets_match = false;
> +-	  }
> +-
> ++	    reg_state[regno].use_ruid = reload_combine_ruid;
> ++	  }
> + 	reg_state[regno].reg_use[use_index].insn = insn;
> +-	reg_state[regno].reg_use[use_index].ruid = ruid;
> +-	reg_state[regno].reg_use[use_index].containing_mem = containing_mem;
> + 	reg_state[regno].reg_use[use_index].usep = xp;
> + 	return;
> +       }
> + 
> +-    case MEM:
> +-      containing_mem = x;
> +-      break;
> +-
> +     default:
> +       break;
> +     }
> +@@ -1562,12 +1144,11 @@
> +   for (i = GET_RTX_LENGTH (code) - 1; i >= 0; i--)
> +     {
> +       if (fmt[i] == 'e')
> +-	reload_combine_note_use (&XEXP (x, i), insn, ruid, containing_mem);
> ++	reload_combine_note_use (&XEXP (x, i), insn);
> +       else if (fmt[i] == 'E')
> + 	{
> + 	  for (j = XVECLEN (x, i) - 1; j >= 0; j--)
> +-	    reload_combine_note_use (&XVECEXP (x, i, j), insn, ruid,
> +-				     containing_mem);
> ++	    reload_combine_note_use (&XVECEXP (x, i, j), insn);
> + 	}
> +     }
> + }
> +@@ -1615,10 +1196,9 @@
> +    while REG is known to already have value (SYM + offset).
> +    This function tries to change INSN into an add instruction
> +    (set (REG) (plus (REG) (OFF - offset))) using the known value.
> +-   It also updates the information about REG's known value.
> +-   Return true if we made a change.  */
> ++   It also updates the information about REG's known value.  */
> + 
> +-static bool
> ++static void
> + move2add_use_add2_insn (rtx reg, rtx sym, rtx off, rtx insn)
> + {
> +   rtx pat = PATTERN (insn);
> +@@ -1627,7 +1207,6 @@
> +   rtx new_src = gen_int_mode (INTVAL (off) - reg_offset[regno],
> + 			      GET_MODE (reg));
> +   bool speed = optimize_bb_for_speed_p (BLOCK_FOR_INSN (insn));
> +-  bool changed = false;
> + 
> +   /* (set (reg) (plus (reg) (const_int 0))) is not canonical;
> +      use (set (reg) (reg)) instead.
> +@@ -1642,13 +1221,13 @@
> + 	 (reg)), would be discarded.  Maybe we should
> + 	 try a truncMN pattern?  */
> +       if (INTVAL (off) == reg_offset [regno])
> +-	changed = validate_change (insn, &SET_SRC (pat), reg, 0);
> ++	validate_change (insn, &SET_SRC (pat), reg, 0);
> +     }
> +   else if (rtx_cost (new_src, PLUS, speed) < rtx_cost (src, SET, speed)
> + 	   && have_add2_insn (reg, new_src))
> +     {
> +       rtx tem = gen_rtx_PLUS (GET_MODE (reg), reg, new_src);
> +-      changed = validate_change (insn, &SET_SRC (pat), tem, 0);
> ++      validate_change (insn, &SET_SRC (pat), tem, 0);
> +     }
> +   else if (sym == NULL_RTX && GET_MODE (reg) != BImode)
> +     {
> +@@ -1673,9 +1252,8 @@
> + 			     gen_rtx_STRICT_LOW_PART (VOIDmode,
> + 						      narrow_reg),
> + 			     narrow_src);
> +-	      changed = validate_change (insn, &PATTERN (insn),
> +-					 new_set, 0);
> +-	      if (changed)
> ++	      if (validate_change (insn, &PATTERN (insn),
> ++				   new_set, 0))
> + 		break;
> + 	    }
> + 	}
> +@@ -1685,7 +1263,6 @@
> +   reg_mode[regno] = GET_MODE (reg);
> +   reg_symbol_ref[regno] = sym;
> +   reg_offset[regno] = INTVAL (off);
> +-  return changed;
> + }
> + 
> + 
> +@@ -1695,10 +1272,9 @@
> +    value (SYM + offset) and change INSN into an add instruction
> +    (set (REG) (plus (the found register) (OFF - offset))) if such
> +    a register is found.  It also updates the information about
> +-   REG's known value.
> +-   Return true iff we made a change.  */
> ++   REG's known value.  */
> + 
> +-static bool
> ++static void
> + move2add_use_add3_insn (rtx reg, rtx sym, rtx off, rtx insn)
> + {
> +   rtx pat = PATTERN (insn);
> +@@ -1708,7 +1284,6 @@
> +   int min_regno;
> +   bool speed = optimize_bb_for_speed_p (BLOCK_FOR_INSN (insn));
> +   int i;
> +-  bool changed = false;
> + 
> +   for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
> +     if (reg_set_luid[i] > move2add_last_label_luid
> +@@ -1753,25 +1328,20 @@
> + 				      GET_MODE (reg));
> + 	  tem = gen_rtx_PLUS (GET_MODE (reg), tem, new_src);
> + 	}
> +-      if (validate_change (insn, &SET_SRC (pat), tem, 0))
> +-	changed = true;
> ++      validate_change (insn, &SET_SRC (pat), tem, 0);
> +     }
> +   reg_set_luid[regno] = move2add_luid;
> +   reg_base_reg[regno] = -1;
> +   reg_mode[regno] = GET_MODE (reg);
> +   reg_symbol_ref[regno] = sym;
> +   reg_offset[regno] = INTVAL (off);
> +-  return changed;
> + }
> + 
> +-/* Convert move insns with constant inputs to additions if they are cheaper.
> +-   Return true if any changes were made.  */
> +-static bool
> ++static void
> + reload_cse_move2add (rtx first)
> + {
> +   int i;
> +   rtx insn;
> +-  bool changed = false;
> + 
> +   for (i = FIRST_PSEUDO_REGISTER - 1; i >= 0; i--)
> +     {
> +@@ -1832,7 +1402,7 @@
> + 		  && reg_base_reg[regno] < 0
> + 		  && reg_symbol_ref[regno] == NULL_RTX)
> + 		{
> +-		  changed |= move2add_use_add2_insn (reg, NULL_RTX, src, insn);
> ++		  move2add_use_add2_insn (reg, NULL_RTX, src, insn);
> + 		  continue;
> + 		}
> + 
> +@@ -1893,7 +1463,6 @@
> + 			}
> + 		      if (success)
> + 			delete_insn (insn);
> +-		      changed |= success;
> + 		      insn = next;
> + 		      reg_mode[regno] = GET_MODE (reg);
> + 		      reg_offset[regno] =
> +@@ -1939,12 +1508,12 @@
> + 		  && reg_base_reg[regno] < 0
> + 		  && reg_symbol_ref[regno] != NULL_RTX
> + 		  && rtx_equal_p (sym, reg_symbol_ref[regno]))
> +-		changed |= move2add_use_add2_insn (reg, sym, off, insn);
> ++		move2add_use_add2_insn (reg, sym, off, insn);
> + 
> + 	      /* Otherwise, we have to find a register whose value is sum
> + 		 of sym and some constant value.  */
> + 	      else
> +-		changed |= move2add_use_add3_insn (reg, sym, off, insn);
> ++		move2add_use_add3_insn (reg, sym, off, insn);
> + 
> + 	      continue;
> + 	    }
> +@@ -1999,7 +1568,6 @@
> + 	    }
> + 	}
> +     }
> +-  return changed;
> + }
> + 
> + /* SET is a SET or CLOBBER that sets DST.  DATA is the insn which
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch
> new file mode 100644
> index 0000000..b63c9b3
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch
> @@ -0,0 +1,70 @@
> +2010-11-03  Nathan Froyd  <froydnj@codesourcery.com>
> +
> +	Issue #10002
> +
> +	gcc/
> +	* config/arm/arm.c (arm_legitimate_index_p): Split
> +	VALID_NEON_QREG_MODE and VALID_NEON_DREG_MODE cases.  Permit
> +	slightly larger constants in the latter case.
> +	(thumb2_legitimate_index_p): Likewise.
> +
> +=== modified file 'gcc/config/arm/arm.c'
> +--- old/gcc/config/arm/arm.c	2010-11-04 12:49:37 +0000
> ++++ new/gcc/config/arm/arm.c	2010-11-11 11:00:53 +0000
> +@@ -5611,13 +5611,25 @@
> + 	    && INTVAL (index) > -1024
> + 	    && (INTVAL (index) & 3) == 0);
> + 
> +-  if (TARGET_NEON
> +-      && (VALID_NEON_DREG_MODE (mode) || VALID_NEON_QREG_MODE (mode)))
> ++  /* For quad modes, we restrict the constant offset to be slightly less
> ++     than what the instruction format permits.  We do this because for
> ++     quad mode moves, we will actually decompose them into two separate
> ++     double-mode reads or writes.  INDEX must therefore be a valid
> ++     (double-mode) offset and so should INDEX+8.  */
> ++  if (TARGET_NEON && VALID_NEON_QREG_MODE (mode))
> +     return (code == CONST_INT
> + 	    && INTVAL (index) < 1016
> + 	    && INTVAL (index) > -1024
> + 	    && (INTVAL (index) & 3) == 0);
> + 
> ++  /* We have no such constraint on double mode offsets, so we permit the
> ++     full range of the instruction format.  */
> ++  if (TARGET_NEON && VALID_NEON_DREG_MODE (mode))
> ++    return (code == CONST_INT
> ++	    && INTVAL (index) < 1024
> ++	    && INTVAL (index) > -1024
> ++	    && (INTVAL (index) & 3) == 0);
> ++
> +   if (TARGET_REALLY_IWMMXT && VALID_IWMMXT_REG_MODE (mode))
> +     return (code == CONST_INT
> + 	    && INTVAL (index) < 1024
> +@@ -5731,13 +5743,25 @@
> + 		&& (INTVAL (index) & 3) == 0);
> +     }
> + 
> +-  if (TARGET_NEON
> +-      && (VALID_NEON_DREG_MODE (mode) || VALID_NEON_QREG_MODE (mode)))
> ++  /* For quad modes, we restrict the constant offset to be slightly less
> ++     than what the instruction format permits.  We do this because for
> ++     quad mode moves, we will actually decompose them into two separate
> ++     double-mode reads or writes.  INDEX must therefore be a valid
> ++     (double-mode) offset and so should INDEX+8.  */
> ++  if (TARGET_NEON && VALID_NEON_QREG_MODE (mode))
> +     return (code == CONST_INT
> + 	    && INTVAL (index) < 1016
> + 	    && INTVAL (index) > -1024
> + 	    && (INTVAL (index) & 3) == 0);
> + 
> ++  /* We have no such constraint on double mode offsets, so we permit the
> ++     full range of the instruction format.  */
> ++  if (TARGET_NEON && VALID_NEON_DREG_MODE (mode))
> ++    return (code == CONST_INT
> ++	    && INTVAL (index) < 1024
> ++	    && INTVAL (index) > -1024
> ++	    && (INTVAL (index) & 3) == 0);
> ++
> +   if (arm_address_register_rtx_p (index, strict_p)
> +       && (GET_MODE_SIZE (mode) <= 4))
> +     return 1;
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch
> new file mode 100644
> index 0000000..6bc33f2
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch
> @@ -0,0 +1,40 @@
> +2010-10-29  Julian Brown  <julian@codesourcery.com>
> +
> +	Launchpad #629671
> +
> +	gcc/
> +	* config/arm/arm.h (REG_CLASS_CONTENTS): Remove soft frame pointer
> +	from CORE_REGS and GENERAL_REGS classes.
> +	* config/arm/arm.md (*thumb1_movsi_insn): Ignore all parts of final
> +	constraint for register preferencing.
> +
> +=== modified file 'gcc/config/arm/arm.h'
> +--- old/gcc/config/arm/arm.h	2010-11-04 10:45:05 +0000
> ++++ new/gcc/config/arm/arm.h	2010-11-11 11:12:14 +0000
> +@@ -1262,8 +1262,8 @@
> +   { 0x0000DF00, 0x00000000, 0x00000000, 0x00000000 }, /* HI_REGS */	\
> +   { 0x01000000, 0x00000000, 0x00000000, 0x00000000 }, /* CC_REG */	\
> +   { 0x00000000, 0x00000000, 0x00000000, 0x80000000 }, /* VFPCC_REG */	\
> +-  { 0x0200DFFF, 0x00000000, 0x00000000, 0x00000000 }, /* GENERAL_REGS */ \
> +-  { 0x0200FFFF, 0x00000000, 0x00000000, 0x00000000 }, /* CORE_REGS */	\
> ++  { 0x0000DFFF, 0x00000000, 0x00000000, 0x00000000 }, /* GENERAL_REGS */ \
> ++  { 0x0000FFFF, 0x00000000, 0x00000000, 0x00000000 }, /* CORE_REGS */	\
> +   { 0xFAFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x7FFFFFFF }  /* ALL_REGS */	\
> + }
> + 
> +
> +=== modified file 'gcc/config/arm/arm.md'
> +--- old/gcc/config/arm/arm.md	2010-11-04 10:45:05 +0000
> ++++ new/gcc/config/arm/arm.md	2010-11-11 11:12:14 +0000
> +@@ -5160,8 +5160,8 @@
> + })
> + 
> + (define_insn "*thumb1_movsi_insn"
> +-  [(set (match_operand:SI 0 "nonimmediate_operand" "=l,l,l,l,l,>,l, m,*lhk")
> +-	(match_operand:SI 1 "general_operand"      "l, I,J,K,>,l,mi,l,*lhk"))]
> ++  [(set (match_operand:SI 0 "nonimmediate_operand" "=l,l,l,l,l,>,l, m,*l*h*k")
> ++	(match_operand:SI 1 "general_operand"      "l, I,J,K,>,l,mi,l,*l*h*k"))]
> +   "TARGET_THUMB1
> +    && (   register_operand (operands[0], SImode) 
> +        || register_operand (operands[1], SImode))"
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch
> new file mode 100644
> index 0000000..adda68c
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch
> @@ -0,0 +1,30 @@
> +2010-11-3  Chung-Lin Tang  <cltang@codesourcery.com>
> +
> +	Backport from mainline:
> +
> +	2010-11-02  Chung-Lin Tang <cltang@codesourcery.com>
> +
> +	gcc/
> +	* Makefile.in (LIBGCC2_CFLAGS): Add -fno-stack-protector, to
> +	explicitly disable stack protection when building libgcc.
> +	(CRTSTUFF_CFLAGS): Same, for crtbegin/end.
> +
> +--- old/gcc/Makefile.in	2010-11-08 22:08:43 +0000
> ++++ new/gcc/Makefile.in	2010-11-11 11:34:59 +0000
> +@@ -646,6 +646,7 @@
> + LIBGCC2_CFLAGS = -O2 $(LIBGCC2_INCLUDES) $(GCC_CFLAGS) $(TARGET_LIBGCC2_CFLAGS) \
> + 		 $(LIBGCC2_DEBUG_CFLAGS) $(GTHREAD_FLAGS) \
> + 		 -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED \
> ++		 -fno-stack-protector \
> + 		 $(INHIBIT_LIBC_CFLAGS)
> + 
> + # Additional options to use when compiling libgcc2.a.
> +@@ -659,6 +660,7 @@
> + CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
> +   -finhibit-size-directive -fno-inline -fno-exceptions \
> +   -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize \
> ++  -fno-stack-protector \
> +   $(INHIBIT_LIBC_CFLAGS)
> + 
> + # Additional sources to handle exceptions; overridden by targets as needed.
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch
> new file mode 100644
> index 0000000..d66df13
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch
> @@ -0,0 +1,32 @@
> +2010-11-08  Yao Qi  <yao@codesourcery.com>
> +
> +	Backport from mainline:
> +
> +	gcc/
> +	2010-08-02  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	* config/arm/arm.c (arm_rtx_costs_1): Remove second clause from the
> +	if statement which adds extra costs to frame-related
> +	expressions.
> +
> +=== modified file 'gcc/config/arm/arm.c'
> +--- old/gcc/config/arm/arm.c	2010-11-11 11:00:53 +0000
> ++++ new/gcc/config/arm/arm.c	2010-11-11 11:50:33 +0000
> +@@ -6805,12 +6805,10 @@
> + 	 since then they might not be moved outside of loops.  As a compromise
> + 	 we allow integration with ops that have a constant as their second
> + 	 operand.  */
> +-      if ((REG_OR_SUBREG_REG (XEXP (x, 0))
> +-	   && ARM_FRAME_RTX (REG_OR_SUBREG_RTX (XEXP (x, 0)))
> +-	   && GET_CODE (XEXP (x, 1)) != CONST_INT)
> +-	  || (REG_OR_SUBREG_REG (XEXP (x, 0))
> +-	      && ARM_FRAME_RTX (REG_OR_SUBREG_RTX (XEXP (x, 0)))))
> +-	*total = 4;
> ++      if (REG_OR_SUBREG_REG (XEXP (x, 0))
> ++	  && ARM_FRAME_RTX (REG_OR_SUBREG_RTX (XEXP (x, 0)))
> ++	  && GET_CODE (XEXP (x, 1)) != CONST_INT)
> ++	*total = COSTS_N_INSNS (1);
> + 
> +       if (mode == DImode)
> + 	{
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch
> new file mode 100644
> index 0000000..deb749e
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch
> @@ -0,0 +1,209 @@
> +2010-11-24  Maxim Kuvyrkov  <maxim@codesourcery.com>
> +
> +	gcc/
> +	* combine.c (subst, combine_simlify_rtx): Add new argument, use it
> +	to track processing of conditionals.  Update all callers.
> +	(try_combine, simplify_if_then_else): Update.
> +
> +=== modified file 'gcc/combine.c'
> +--- old/gcc/combine.c	2010-11-04 12:39:28 +0000
> ++++ new/gcc/combine.c	2010-11-25 11:11:45 +0000
> +@@ -392,8 +392,8 @@
> + static void undo_all (void);
> + static void undo_commit (void);
> + static rtx *find_split_point (rtx *, rtx);
> +-static rtx subst (rtx, rtx, rtx, int, int);
> +-static rtx combine_simplify_rtx (rtx, enum machine_mode, int);
> ++static rtx subst (rtx, rtx, rtx, int, int, int);
> ++static rtx combine_simplify_rtx (rtx, enum machine_mode, int, int);
> + static rtx simplify_if_then_else (rtx);
> + static rtx simplify_set (rtx);
> + static rtx simplify_logical (rtx);
> +@@ -2944,12 +2944,12 @@
> + 	  if (i1)
> + 	    {
> + 	      subst_low_luid = DF_INSN_LUID (i1);
> +-	      i1src = subst (i1src, pc_rtx, pc_rtx, 0, 0);
> ++	      i1src = subst (i1src, pc_rtx, pc_rtx, 0, 0, 0);
> + 	    }
> + 	  else
> + 	    {
> + 	      subst_low_luid = DF_INSN_LUID (i2);
> +-	      i2src = subst (i2src, pc_rtx, pc_rtx, 0, 0);
> ++	      i2src = subst (i2src, pc_rtx, pc_rtx, 0, 0, 0);
> + 	    }
> + 	}
> + 
> +@@ -2960,7 +2960,7 @@
> + 	 to avoid self-referential rtl.  */
> + 
> +       subst_low_luid = DF_INSN_LUID (i2);
> +-      newpat = subst (PATTERN (i3), i2dest, i2src, 0,
> ++      newpat = subst (PATTERN (i3), i2dest, i2src, 0, 0,
> + 		      ! i1_feeds_i3 && i1dest_in_i1src);
> +       substed_i2 = 1;
> + 
> +@@ -2991,7 +2991,7 @@
> + 
> +       n_occurrences = 0;
> +       subst_low_luid = DF_INSN_LUID (i1);
> +-      newpat = subst (newpat, i1dest, i1src, 0, 0);
> ++      newpat = subst (newpat, i1dest, i1src, 0, 0, 0);
> +       substed_i1 = 1;
> +     }
> + 
> +@@ -3053,7 +3053,7 @@
> + 	  else
> + 	    /* See comment where i2pat is assigned.  */
> + 	    XVECEXP (newpat, 0, --total_sets)
> +-	      = subst (i2pat, i1dest, i1src, 0, 0);
> ++	      = subst (i2pat, i1dest, i1src, 0, 0, 0);
> + 	}
> +     }
> + 
> +@@ -4605,11 +4605,13 @@
> + 
> +    IN_DEST is nonzero if we are processing the SET_DEST of a SET.
> + 
> ++   IN_COND is nonzero if we are on top level of the condition.
> ++
> +    UNIQUE_COPY is nonzero if each substitution must be unique.  We do this
> +    by copying if `n_occurrences' is nonzero.  */
> + 
> + static rtx
> +-subst (rtx x, rtx from, rtx to, int in_dest, int unique_copy)
> ++subst (rtx x, rtx from, rtx to, int in_dest, int in_cond, int unique_copy)
> + {
> +   enum rtx_code code = GET_CODE (x);
> +   enum machine_mode op0_mode = VOIDmode;
> +@@ -4670,7 +4672,7 @@
> +       && GET_CODE (XVECEXP (x, 0, 0)) == SET
> +       && GET_CODE (SET_SRC (XVECEXP (x, 0, 0))) == ASM_OPERANDS)
> +     {
> +-      new_rtx = subst (XVECEXP (x, 0, 0), from, to, 0, unique_copy);
> ++      new_rtx = subst (XVECEXP (x, 0, 0), from, to, 0, 0, unique_copy);
> + 
> +       /* If this substitution failed, this whole thing fails.  */
> +       if (GET_CODE (new_rtx) == CLOBBER
> +@@ -4687,7 +4689,7 @@
> + 	      && GET_CODE (dest) != CC0
> + 	      && GET_CODE (dest) != PC)
> + 	    {
> +-	      new_rtx = subst (dest, from, to, 0, unique_copy);
> ++	      new_rtx = subst (dest, from, to, 0, 0, unique_copy);
> + 
> + 	      /* If this substitution failed, this whole thing fails.  */
> + 	      if (GET_CODE (new_rtx) == CLOBBER
> +@@ -4733,8 +4735,8 @@
> + 		    }
> + 		  else
> + 		    {
> +-		      new_rtx = subst (XVECEXP (x, i, j), from, to, 0,
> +-				   unique_copy);
> ++		      new_rtx = subst (XVECEXP (x, i, j), from, to, 0, 0,
> ++				       unique_copy);
> + 
> + 		      /* If this substitution failed, this whole thing
> + 			 fails.  */
> +@@ -4811,7 +4813,9 @@
> + 				&& (code == SUBREG || code == STRICT_LOW_PART
> + 				    || code == ZERO_EXTRACT))
> + 			       || code == SET)
> +-			      && i == 0), unique_copy);
> ++			      && i == 0),
> ++				 code == IF_THEN_ELSE && i == 0,
> ++				 unique_copy);
> + 
> + 	      /* If we found that we will have to reject this combination,
> + 		 indicate that by returning the CLOBBER ourselves, rather than
> +@@ -4868,7 +4872,7 @@
> +       /* If X is sufficiently simple, don't bother trying to do anything
> + 	 with it.  */
> +       if (code != CONST_INT && code != REG && code != CLOBBER)
> +-	x = combine_simplify_rtx (x, op0_mode, in_dest);
> ++	x = combine_simplify_rtx (x, op0_mode, in_dest, in_cond);
> + 
> +       if (GET_CODE (x) == code)
> + 	break;
> +@@ -4888,10 +4892,12 @@
> +    expression.
> + 
> +    OP0_MODE is the original mode of XEXP (x, 0).  IN_DEST is nonzero
> +-   if we are inside a SET_DEST.  */
> ++   if we are inside a SET_DEST.  IN_COND is nonzero if we are on the top level
> ++   of a condition.  */
> + 
> + static rtx
> +-combine_simplify_rtx (rtx x, enum machine_mode op0_mode, int in_dest)
> ++combine_simplify_rtx (rtx x, enum machine_mode op0_mode, int in_dest,
> ++		      int in_cond)
> + {
> +   enum rtx_code code = GET_CODE (x);
> +   enum machine_mode mode = GET_MODE (x);
> +@@ -4946,8 +4952,8 @@
> + 	     false arms to store-flag values.  Be careful to use copy_rtx
> + 	     here since true_rtx or false_rtx might share RTL with x as a
> + 	     result of the if_then_else_cond call above.  */
> +-	  true_rtx = subst (copy_rtx (true_rtx), pc_rtx, pc_rtx, 0, 0);
> +-	  false_rtx = subst (copy_rtx (false_rtx), pc_rtx, pc_rtx, 0, 0);
> ++	  true_rtx = subst (copy_rtx (true_rtx), pc_rtx, pc_rtx, 0, 0, 0);
> ++	  false_rtx = subst (copy_rtx (false_rtx), pc_rtx, pc_rtx, 0, 0, 0);
> + 
> + 	  /* If true_rtx and false_rtx are not general_operands, an if_then_else
> + 	     is unlikely to be simpler.  */
> +@@ -5291,7 +5297,7 @@
> + 	{
> + 	  /* Try to simplify the expression further.  */
> + 	  rtx tor = simplify_gen_binary (IOR, mode, XEXP (x, 0), XEXP (x, 1));
> +-	  temp = combine_simplify_rtx (tor, mode, in_dest);
> ++	  temp = combine_simplify_rtx (tor, mode, in_dest, 0);
> + 
> + 	  /* If we could, great.  If not, do not go ahead with the IOR
> + 	     replacement, since PLUS appears in many special purpose
> +@@ -5384,7 +5390,16 @@
> + 	     ZERO_EXTRACT is indeed appropriate, it will be placed back by
> + 	     the call to make_compound_operation in the SET case.  */
> + 
> +-	  if (STORE_FLAG_VALUE == 1
> ++	  if (in_cond)
> ++	    /* Don't apply below optimizations if the caller would
> ++	       prefer a comparison rather than a value.
> ++	       E.g., for the condition in an IF_THEN_ELSE most targets need
> ++	       an explicit comparison.  */
> ++	    {
> ++	      ;
> ++	    }
> ++
> ++	  else if (STORE_FLAG_VALUE == 1
> + 	      && new_code == NE && GET_MODE_CLASS (mode) == MODE_INT
> + 	      && op1 == const0_rtx
> + 	      && mode == GET_MODE (op0)
> +@@ -5628,11 +5643,11 @@
> +       if (reg_mentioned_p (from, true_rtx))
> + 	true_rtx = subst (known_cond (copy_rtx (true_rtx), true_code,
> + 				      from, true_val),
> +-		      pc_rtx, pc_rtx, 0, 0);
> ++			  pc_rtx, pc_rtx, 0, 0, 0);
> +       if (reg_mentioned_p (from, false_rtx))
> + 	false_rtx = subst (known_cond (copy_rtx (false_rtx), false_code,
> + 				   from, false_val),
> +-		       pc_rtx, pc_rtx, 0, 0);
> ++			   pc_rtx, pc_rtx, 0, 0, 0);
> + 
> +       SUBST (XEXP (x, 1), swapped ? false_rtx : true_rtx);
> +       SUBST (XEXP (x, 2), swapped ? true_rtx : false_rtx);
> +@@ -5849,11 +5864,11 @@
> + 	{
> + 	  temp = subst (simplify_gen_relational (true_code, m, VOIDmode,
> + 						 cond_op0, cond_op1),
> +-			pc_rtx, pc_rtx, 0, 0);
> ++			pc_rtx, pc_rtx, 0, 0, 0);
> + 	  temp = simplify_gen_binary (MULT, m, temp,
> + 				      simplify_gen_binary (MULT, m, c1,
> + 							   const_true_rtx));
> +-	  temp = subst (temp, pc_rtx, pc_rtx, 0, 0);
> ++	  temp = subst (temp, pc_rtx, pc_rtx, 0, 0, 0);
> + 	  temp = simplify_gen_binary (op, m, gen_lowpart (m, z), temp);
> + 
> + 	  if (extend_op != UNKNOWN)
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch
> new file mode 100644
> index 0000000..94d9666
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch
> @@ -0,0 +1,27 @@
> +2010-11-24  Richard Sandiford  <richard.sandiford@linaro.org>
> +
> +	Launchpad #618684
> +
> +	Backport from mainline:
> +
> +	2010-04-10  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	* reload1.c (eliminate_regs_in_insn): Don't restore an operand
> +	if doing so would replace the entire pattern.
> +
> +=== modified file 'gcc/reload1.c'
> +--- old/gcc/reload1.c	2010-10-04 00:50:43 +0000
> ++++ new/gcc/reload1.c	2010-11-24 13:40:23 +0000
> +@@ -3567,7 +3567,10 @@
> +     {
> +       /* Restore the old body.  */
> +       for (i = 0; i < recog_data.n_operands; i++)
> +-	*recog_data.operand_loc[i] = orig_operand[i];
> ++	/* Restoring a top-level match_parallel would clobber the new_body
> ++	   we installed in the insn.  */
> ++	if (recog_data.operand_loc[i] != &PATTERN (insn))
> ++	  *recog_data.operand_loc[i] = orig_operand[i];
> +       for (i = 0; i < recog_data.n_dups; i++)
> + 	*recog_data.dup_loc[i] = orig_operand[(int) recog_data.dup_num[i]];
> +     }
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch
> new file mode 100644
> index 0000000..cec7f57
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch
> @@ -0,0 +1,1500 @@
> +2010-11-16  Chung-Lin Tang  <cltang@codesourcery.com>
> +
> +	2010-07-21  Richard Henderson  <rth@redhat.com>
> +
> +	gcc/
> +	* config/i386/i386.c (setup_incoming_varargs_64): Emit a simple
> +	comparison for avoiding xmm register saves.  Emit the xmm register
> +	saves explicitly.
> +	* config/i386/i386.md (UNSPEC_SSE_PROLOGUE_SAVE): Remove.
> +	(UNSPEC_SSE_PROLOGUE_SAVE_LOW): Remove.
> +	(sse_prologue_save, sse_prologue_save_insn1, sse_prologue_save_insn):
> +	Remove patterns and the associated splitters.
> +
> +	2010-07-22  Richard Henderson  <rth@redhat.com>
> +
> +	gcc/
> +	PR target/45027
> +	* config/i386/i386.c (setup_incoming_varargs_64): Force the use
> +	of V4SFmode for the SSE saves; increase stack alignment if needed.
> +
> +2010-11-16  Chung-Lin Tang  <cltang@codesourcery.com>
> +
> +	Re-merge, backport from mainline:
> +
> +	2010-07-15  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	gcc/
> +	* postreload.c (last_label_ruid, first_index_reg, last_index_reg):
> +	New static variables.
> +	(reload_combine_recognize_pattern): New static function, broken out
> +	of reload_combine.
> +	(reload_combine): Use it.  Only initialize first_index_reg and
> +	last_index_reg once.
> +
> +	2010-07-17  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	PR target/42235
> +	gcc/
> +	* postreload.c (reload_cse_move2add): Return bool, true if anything.
> +	changed.  All callers changed.
> +	(move2add_use_add2_insn): Likewise.
> +	(move2add_use_add3_insn): Likewise.
> +	(reload_cse_regs): If reload_cse_move2add changed anything, rerun
> +	reload_combine.
> +	(RELOAD_COMBINE_MAX_USES): Bump to 16.
> +	(last_jump_ruid): New static variable.
> +	(struct reg_use): New members CONTAINING_MEM and RUID.
> +	(reg_state): New members ALL_OFFSETS_MATCH and REAL_STORE_RUID.
> +	(reload_combine_split_one_ruid, reload_combine_split_ruids,
> +	reload_combine_purge_insn_uses, reload_combine_closest_single_use
> +	reload_combine_purge_reg_uses_after_ruid,
> +	reload_combine_recognize_const_pattern): New static functions.
> +	(reload_combine_recognize_pattern): Verify that ALL_OFFSETS_MATCH
> +	is true for our reg and that we have available index regs.
> +	(reload_combine_note_use): New args RUID and CONTAINING_MEM.  All
> +	callers changed.  Use them to initialize fields in struct reg_use.
> +	(reload_combine): Initialize last_jump_ruid.  Be careful when to
> +	take PREV_INSN of the scanned insn.  Update REAL_STORE_RUID fields.
> +	Call reload_combine_recognize_const_pattern.
> +	(reload_combine_note_store): Update REAL_STORE_RUID field.
> +
> +	gcc/testsuite/
> +	* gcc.target/arm/pr42235.c: New test.
> +
> +	2010-07-19  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	gcc/
> +	* postreload.c (reload_combine_closest_single_use): Ignore the
> +	number of uses for DEBUG_INSNs.
> +	(fixup_debug_insns): New static function.
> +	(reload_combine_recognize_const_pattern): Use it.  Don't let the
> +	main loop be affected by DEBUG_INSNs.
> +	Really disallow moving adds past a jump insn.
> +	(reload_combine_recognize_pattern): Don't update use_ruid here.
> +	(reload_combine_note_use): Do it here.
> +	(reload_combine): Use control_flow_insn_p rather than JUMP_P.
> +
> +	2010-07-20  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	gcc/
> +	* postreload.c (fixup_debug_insns): Remove arg REGNO.  New args
> +	FROM and TO.  All callers changed.  Don't look for tracked uses,
> +	just scan the RTL for DEBUG_INSNs and substitute.
> +	(reload_combine_recognize_pattern): Call fixup_debug_insns.
> +	(reload_combine): Ignore DEBUG_INSNs.
> +
> +	2010-07-22  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	PR bootstrap/44970
> +	PR middle-end/45009
> +	gcc/
> +	* postreload.c: Include "target.h".
> +	(reload_combine_closest_single_use): Don't take DEBUG_INSNs
> +	into account.
> +	(fixup_debug_insns): Don't copy the rtx.
> +	(reload_combine_recognize_const_pattern): DEBUG_INSNs can't have uses.
> +	Don't copy when replacing.  Call fixup_debug_insns in the case where
> +	we merged one add with another.
> +	(reload_combine_recognize_pattern): Fail if there aren't any uses.
> +	Try harder to determine whether we're picking a valid index register.
> +	Don't set store_ruid for an insn we're going to scan in the
> +	next iteration.
> +	(reload_combine): Remove unused code.
> +	(reload_combine_note_use): When updating use information for
> +	an old insn, ignore a use that occurs after store_ruid.
> +	* Makefile.in (postreload.o): Update dependencies.
> +
> +	2010-07-27  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	gcc/
> +	* postreload.c (reload_combine_recognize_const_pattern): Move test
> +	for limiting the insn movement to the right scope.
> +
> +	2010-07-27  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	gcc/
> +	* postreload.c (try_replace_in_use): New static function.
> +	(reload_combine_recognize_const_pattern): Use it here.  Allow
> +	substituting into a final add insn, and substituting into a memory
> +	reference in an insn that sets the reg.
> +
> +=== modified file 'gcc/Makefile.in'
> +--- old/gcc/Makefile.in	2010-11-11 11:34:59 +0000
> ++++ new/gcc/Makefile.in	2010-11-16 18:05:53 +0000
> +@@ -3157,7 +3157,7 @@
> +    $(RTL_H) $(REAL_H) $(FLAGS_H) $(EXPR_H) $(OPTABS_H) reload.h $(REGS_H) \
> +    hard-reg-set.h insn-config.h $(BASIC_BLOCK_H) $(RECOG_H) output.h \
> +    $(FUNCTION_H) $(TOPLEV_H) cselib.h $(TM_P_H) $(EXCEPT_H) $(TREE_H) $(MACHMODE_H) \
> +-   $(OBSTACK_H) $(TIMEVAR_H) $(TREE_PASS_H) $(DF_H) $(DBGCNT_H)
> ++   $(OBSTACK_H) $(TARGET_H) $(TIMEVAR_H) $(TREE_PASS_H) $(DF_H) $(DBGCNT_H)
> + postreload-gcse.o : postreload-gcse.c $(CONFIG_H) $(SYSTEM_H) coretypes.h \
> +    $(TM_H) $(RTL_H) $(REGS_H) hard-reg-set.h $(FLAGS_H) insn-config.h \
> +    $(RECOG_H) $(EXPR_H) $(BASIC_BLOCK_H) $(FUNCTION_H) output.h $(TOPLEV_H) \
> +
> +=== modified file 'gcc/config/i386/i386.c'
> +--- old/gcc/config/i386/i386.c	2010-09-30 20:24:54 +0000
> ++++ new/gcc/config/i386/i386.c	2010-11-16 18:05:53 +0000
> +@@ -6737,12 +6737,8 @@
> + setup_incoming_varargs_64 (CUMULATIVE_ARGS *cum)
> + {
> +   rtx save_area, mem;
> +-  rtx label;
> +-  rtx label_ref;
> +-  rtx tmp_reg;
> +-  rtx nsse_reg;
> +   alias_set_type set;
> +-  int i;
> ++  int i, max;
> + 
> +   /* GPR size of varargs save area.  */
> +   if (cfun->va_list_gpr_size)
> +@@ -6752,7 +6748,7 @@
> + 
> +   /* FPR size of varargs save area.  We don't need it if we don't pass
> +      anything in SSE registers.  */
> +-  if (cum->sse_nregs && cfun->va_list_fpr_size)
> ++  if (TARGET_SSE && cfun->va_list_fpr_size)
> +     ix86_varargs_fpr_size = X86_64_SSE_REGPARM_MAX * 16;
> +   else
> +     ix86_varargs_fpr_size = 0;
> +@@ -6763,10 +6759,11 @@
> +   save_area = frame_pointer_rtx;
> +   set = get_varargs_alias_set ();
> + 
> +-  for (i = cum->regno;
> +-       i < X86_64_REGPARM_MAX
> +-       && i < cum->regno + cfun->va_list_gpr_size / UNITS_PER_WORD;
> +-       i++)
> ++  max = cum->regno + cfun->va_list_gpr_size / UNITS_PER_WORD;
> ++  if (max > X86_64_REGPARM_MAX)
> ++    max = X86_64_REGPARM_MAX;
> ++
> ++  for (i = cum->regno; i < max; i++)
> +     {
> +       mem = gen_rtx_MEM (Pmode,
> + 			 plus_constant (save_area, i * UNITS_PER_WORD));
> +@@ -6778,62 +6775,42 @@
> + 
> +   if (ix86_varargs_fpr_size)
> +     {
> +-      /* Stack must be aligned to 16byte for FP register save area.  */
> +-      if (crtl->stack_alignment_needed < 128)
> +-	crtl->stack_alignment_needed = 128;
> ++      enum machine_mode smode;
> ++      rtx label, test;
> + 
> +       /* Now emit code to save SSE registers.  The AX parameter contains number
> +-	 of SSE parameter registers used to call this function.  We use
> +-	 sse_prologue_save insn template that produces computed jump across
> +-	 SSE saves.  We need some preparation work to get this working.  */
> ++	 of SSE parameter registers used to call this function, though all we
> ++	 actually check here is the zero/non-zero status.  */
> + 
> +       label = gen_label_rtx ();
> +-      label_ref = gen_rtx_LABEL_REF (Pmode, label);
> +-
> +-      /* Compute address to jump to :
> +-         label - eax*4 + nnamed_sse_arguments*4 Or
> +-         label - eax*5 + nnamed_sse_arguments*5 for AVX.  */
> +-      tmp_reg = gen_reg_rtx (Pmode);
> +-      nsse_reg = gen_reg_rtx (Pmode);
> +-      emit_insn (gen_zero_extendqidi2 (nsse_reg, gen_rtx_REG (QImode, AX_REG)));
> +-      emit_insn (gen_rtx_SET (VOIDmode, tmp_reg,
> +-			      gen_rtx_MULT (Pmode, nsse_reg,
> +-					    GEN_INT (4))));
> +-
> +-      /* vmovaps is one byte longer than movaps.  */
> +-      if (TARGET_AVX)
> +-	emit_insn (gen_rtx_SET (VOIDmode, tmp_reg,
> +-				gen_rtx_PLUS (Pmode, tmp_reg,
> +-					      nsse_reg)));
> +-
> +-      if (cum->sse_regno)
> +-	emit_move_insn
> +-	  (nsse_reg,
> +-	   gen_rtx_CONST (DImode,
> +-			  gen_rtx_PLUS (DImode,
> +-					label_ref,
> +-					GEN_INT (cum->sse_regno
> +-						 * (TARGET_AVX ? 5 : 4)))));
> +-      else
> +-	emit_move_insn (nsse_reg, label_ref);
> +-      emit_insn (gen_subdi3 (nsse_reg, nsse_reg, tmp_reg));
> +-
> +-      /* Compute address of memory block we save into.  We always use pointer
> +-	 pointing 127 bytes after first byte to store - this is needed to keep
> +-	 instruction size limited by 4 bytes (5 bytes for AVX) with one
> +-	 byte displacement.  */
> +-      tmp_reg = gen_reg_rtx (Pmode);
> +-      emit_insn (gen_rtx_SET (VOIDmode, tmp_reg,
> +-			      plus_constant (save_area,
> +-					     ix86_varargs_gpr_size + 127)));
> +-      mem = gen_rtx_MEM (BLKmode, plus_constant (tmp_reg, -127));
> +-      MEM_NOTRAP_P (mem) = 1;
> +-      set_mem_alias_set (mem, set);
> +-      set_mem_align (mem, BITS_PER_WORD);
> +-
> +-      /* And finally do the dirty job!  */
> +-      emit_insn (gen_sse_prologue_save (mem, nsse_reg,
> +-					GEN_INT (cum->sse_regno), label));
> ++      test = gen_rtx_EQ (VOIDmode, gen_rtx_REG (QImode, AX_REG), const0_rtx);
> ++      emit_jump_insn (gen_cbranchqi4 (test, XEXP (test, 0), XEXP (test, 1),
> ++				      label));
> ++
> ++      /* ??? If !TARGET_SSE_TYPELESS_STORES, would we perform better if
> ++	 we used movdqa (i.e. TImode) instead?  Perhaps even better would
> ++	 be if we could determine the real mode of the data, via a hook
> ++	 into pass_stdarg.  Ignore all that for now.  */
> ++      smode = V4SFmode;
> ++      if (crtl->stack_alignment_needed < GET_MODE_ALIGNMENT (smode))
> ++	crtl->stack_alignment_needed = GET_MODE_ALIGNMENT (smode);
> ++
> ++      max = cum->sse_regno + cfun->va_list_fpr_size / 16;
> ++      if (max > X86_64_SSE_REGPARM_MAX)
> ++	max = X86_64_SSE_REGPARM_MAX;
> ++
> ++      for (i = cum->sse_regno; i < max; ++i)
> ++	{
> ++	  mem = plus_constant (save_area, i * 16 + ix86_varargs_gpr_size);
> ++	  mem = gen_rtx_MEM (smode, mem);
> ++	  MEM_NOTRAP_P (mem) = 1;
> ++	  set_mem_alias_set (mem, set);
> ++	  set_mem_align (mem, GET_MODE_ALIGNMENT (smode));
> ++
> ++	  emit_move_insn (mem, gen_rtx_REG (smode, SSE_REGNO (i)));
> ++	}
> ++
> ++      emit_label (label);
> +     }
> + }
> + 
> +
> +=== modified file 'gcc/config/i386/i386.md'
> +--- old/gcc/config/i386/i386.md	2010-10-22 04:56:41 +0000
> ++++ new/gcc/config/i386/i386.md	2010-11-27 15:24:12 +0000
> +@@ -80,7 +80,6 @@
> +    ; Prologue support
> +    (UNSPEC_STACK_ALLOC		11)
> +    (UNSPEC_SET_GOT		12)
> +-   (UNSPEC_SSE_PROLOGUE_SAVE	13)
> +    (UNSPEC_REG_SAVE		14)
> +    (UNSPEC_DEF_CFA		15)
> +    (UNSPEC_SET_RIP		16)
> +@@ -20252,74 +20251,6 @@
> +   { return ASM_SHORT "0x0b0f"; }
> +   [(set_attr "length" "2")])
> + 
> +-(define_expand "sse_prologue_save"
> +-  [(parallel [(set (match_operand:BLK 0 "" "")
> +-		   (unspec:BLK [(reg:DI XMM0_REG)
> +-				(reg:DI XMM1_REG)
> +-				(reg:DI XMM2_REG)
> +-				(reg:DI XMM3_REG)
> +-				(reg:DI XMM4_REG)
> +-				(reg:DI XMM5_REG)
> +-				(reg:DI XMM6_REG)
> +-				(reg:DI XMM7_REG)] UNSPEC_SSE_PROLOGUE_SAVE))
> +-	      (use (match_operand:DI 1 "register_operand" ""))
> +-	      (use (match_operand:DI 2 "immediate_operand" ""))
> +-	      (use (label_ref:DI (match_operand 3 "" "")))])]
> +-  "TARGET_64BIT"
> +-  "")
> +-
> +-(define_insn "*sse_prologue_save_insn"
> +-  [(set (mem:BLK (plus:DI (match_operand:DI 0 "register_operand" "R")
> +-			  (match_operand:DI 4 "const_int_operand" "n")))
> +-	(unspec:BLK [(reg:DI XMM0_REG)
> +-		     (reg:DI XMM1_REG)
> +-		     (reg:DI XMM2_REG)
> +-		     (reg:DI XMM3_REG)
> +-		     (reg:DI XMM4_REG)
> +-		     (reg:DI XMM5_REG)
> +-		     (reg:DI XMM6_REG)
> +-		     (reg:DI XMM7_REG)] UNSPEC_SSE_PROLOGUE_SAVE))
> +-   (use (match_operand:DI 1 "register_operand" "r"))
> +-   (use (match_operand:DI 2 "const_int_operand" "i"))
> +-   (use (label_ref:DI (match_operand 3 "" "X")))]
> +-  "TARGET_64BIT
> +-   && INTVAL (operands[4]) + X86_64_SSE_REGPARM_MAX * 16 - 16 < 128
> +-   && INTVAL (operands[4]) + INTVAL (operands[2]) * 16 >= -128"
> +-{
> +-  int i;
> +-  operands[0] = gen_rtx_MEM (Pmode,
> +-			     gen_rtx_PLUS (Pmode, operands[0], operands[4]));
> +-  /* VEX instruction with a REX prefix will #UD.  */
> +-  if (TARGET_AVX && GET_CODE (XEXP (operands[0], 0)) != PLUS)
> +-    gcc_unreachable ();
> +-
> +-  output_asm_insn ("jmp\t%A1", operands);
> +-  for (i = X86_64_SSE_REGPARM_MAX - 1; i >= INTVAL (operands[2]); i--)
> +-    {
> +-      operands[4] = adjust_address (operands[0], DImode, i*16);
> +-      operands[5] = gen_rtx_REG (TImode, SSE_REGNO (i));
> +-      PUT_MODE (operands[4], TImode);
> +-      if (GET_CODE (XEXP (operands[0], 0)) != PLUS)
> +-        output_asm_insn ("rex", operands);
> +-      output_asm_insn ("%vmovaps\t{%5, %4|%4, %5}", operands);
> +-    }
> +-  (*targetm.asm_out.internal_label) (asm_out_file, "L",
> +-				     CODE_LABEL_NUMBER (operands[3]));
> +-  return "";
> +-}
> +-  [(set_attr "type" "other")
> +-   (set_attr "length_immediate" "0")
> +-   (set_attr "length_address" "0")
> +-   (set (attr "length")
> +-     (if_then_else
> +-       (eq (symbol_ref "TARGET_AVX") (const_int 0))
> +-       (const_string "34")
> +-       (const_string "42")))
> +-   (set_attr "memory" "store")
> +-   (set_attr "modrm" "0")
> +-   (set_attr "prefix" "maybe_vex")
> +-   (set_attr "mode" "DI")])
> +-
> + (define_expand "prefetch"
> +   [(prefetch (match_operand 0 "address_operand" "")
> + 	     (match_operand:SI 1 "const_int_operand" "")
> +
> +=== modified file 'gcc/postreload.c'
> +--- old/gcc/postreload.c	2010-11-08 22:08:43 +0000
> ++++ new/gcc/postreload.c	2010-11-16 18:05:53 +0000
> +@@ -44,6 +44,7 @@
> + #include "toplev.h"
> + #include "except.h"
> + #include "tree.h"
> ++#include "target.h"
> + #include "timevar.h"
> + #include "tree-pass.h"
> + #include "df.h"
> +@@ -56,10 +57,10 @@
> + static int reload_cse_simplify_operands (rtx, rtx);
> + 
> + static void reload_combine (void);
> +-static void reload_combine_note_use (rtx *, rtx);
> ++static void reload_combine_note_use (rtx *, rtx, int, rtx);
> + static void reload_combine_note_store (rtx, const_rtx, void *);
> + 
> +-static void reload_cse_move2add (rtx);
> ++static bool reload_cse_move2add (rtx);
> + static void move2add_note_store (rtx, const_rtx, void *);
> + 
> + /* Call cse / combine like post-reload optimization phases.
> +@@ -67,11 +68,16 @@
> + void
> + reload_cse_regs (rtx first ATTRIBUTE_UNUSED)
> + {
> ++  bool moves_converted;
> +   reload_cse_regs_1 (first);
> +   reload_combine ();
> +-  reload_cse_move2add (first);
> ++  moves_converted = reload_cse_move2add (first);
> +   if (flag_expensive_optimizations)
> +-    reload_cse_regs_1 (first);
> ++    {
> ++      if (moves_converted)
> ++	reload_combine ();
> ++      reload_cse_regs_1 (first);
> ++    }
> + }
> + 
> + /* See whether a single set SET is a noop.  */
> +@@ -660,30 +666,43 @@
> + 
> + /* The maximum number of uses of a register we can keep track of to
> +    replace them with reg+reg addressing.  */
> +-#define RELOAD_COMBINE_MAX_USES 6
> ++#define RELOAD_COMBINE_MAX_USES 16
> + 
> +-/* INSN is the insn where a register has been used, and USEP points to the
> +-   location of the register within the rtl.  */
> +-struct reg_use { rtx insn, *usep; };
> ++/* Describes a recorded use of a register.  */
> ++struct reg_use
> ++{
> ++  /* The insn where a register has been used.  */
> ++  rtx insn;
> ++  /* Points to the memory reference enclosing the use, if any, NULL_RTX
> ++     otherwise.  */
> ++  rtx containing_mem;
> ++  /* Location of the register withing INSN.  */
> ++  rtx *usep;
> ++  /* The reverse uid of the insn.  */
> ++  int ruid;
> ++};
> + 
> + /* If the register is used in some unknown fashion, USE_INDEX is negative.
> +    If it is dead, USE_INDEX is RELOAD_COMBINE_MAX_USES, and STORE_RUID
> +-   indicates where it becomes live again.
> ++   indicates where it is first set or clobbered.
> +    Otherwise, USE_INDEX is the index of the last encountered use of the
> +-   register (which is first among these we have seen since we scan backwards),
> +-   OFFSET contains the constant offset that is added to the register in
> +-   all encountered uses, and USE_RUID indicates the first encountered, i.e.
> +-   last, of these uses.
> ++   register (which is first among these we have seen since we scan backwards).
> ++   USE_RUID indicates the first encountered, i.e. last, of these uses.
> ++   If ALL_OFFSETS_MATCH is true, all encountered uses were inside a PLUS
> ++   with a constant offset; OFFSET contains this constant in that case.
> +    STORE_RUID is always meaningful if we only want to use a value in a
> +    register in a different place: it denotes the next insn in the insn
> +-   stream (i.e. the last encountered) that sets or clobbers the register.  */
> ++   stream (i.e. the last encountered) that sets or clobbers the register.
> ++   REAL_STORE_RUID is similar, but clobbers are ignored when updating it.  */
> + static struct
> +   {
> +     struct reg_use reg_use[RELOAD_COMBINE_MAX_USES];
> ++    rtx offset;
> +     int use_index;
> +-    rtx offset;
> +     int store_ruid;
> ++    int real_store_ruid;
> +     int use_ruid;
> ++    bool all_offsets_match;
> +   } reg_state[FIRST_PSEUDO_REGISTER];
> + 
> + /* Reverse linear uid.  This is increased in reload_combine while scanning
> +@@ -691,42 +710,548 @@
> +    and the store_ruid / use_ruid fields in reg_state.  */
> + static int reload_combine_ruid;
> + 
> ++/* The RUID of the last label we encountered in reload_combine.  */
> ++static int last_label_ruid;
> ++
> ++/* The RUID of the last jump we encountered in reload_combine.  */
> ++static int last_jump_ruid;
> ++
> ++/* The register numbers of the first and last index register.  A value of
> ++   -1 in LAST_INDEX_REG indicates that we've previously computed these
> ++   values and found no suitable index registers.  */
> ++static int first_index_reg = -1;
> ++static int last_index_reg;
> ++
> + #define LABEL_LIVE(LABEL) \
> +   (label_live[CODE_LABEL_NUMBER (LABEL) - min_labelno])
> + 
> ++/* Subroutine of reload_combine_split_ruids, called to fix up a single
> ++   ruid pointed to by *PRUID if it is higher than SPLIT_RUID.  */
> ++
> ++static inline void
> ++reload_combine_split_one_ruid (int *pruid, int split_ruid)
> ++{
> ++  if (*pruid > split_ruid)
> ++    (*pruid)++;
> ++}
> ++
> ++/* Called when we insert a new insn in a position we've already passed in
> ++   the scan.  Examine all our state, increasing all ruids that are higher
> ++   than SPLIT_RUID by one in order to make room for a new insn.  */
> ++
> ++static void
> ++reload_combine_split_ruids (int split_ruid)
> ++{
> ++  unsigned i;
> ++
> ++  reload_combine_split_one_ruid (&reload_combine_ruid, split_ruid);
> ++  reload_combine_split_one_ruid (&last_label_ruid, split_ruid);
> ++  reload_combine_split_one_ruid (&last_jump_ruid, split_ruid);
> ++
> ++  for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
> ++    {
> ++      int j, idx = reg_state[i].use_index;
> ++      reload_combine_split_one_ruid (&reg_state[i].use_ruid, split_ruid);
> ++      reload_combine_split_one_ruid (&reg_state[i].store_ruid, split_ruid);
> ++      reload_combine_split_one_ruid (&reg_state[i].real_store_ruid,
> ++				     split_ruid);
> ++      if (idx < 0)
> ++	continue;
> ++      for (j = idx; j < RELOAD_COMBINE_MAX_USES; j++)
> ++	{
> ++	  reload_combine_split_one_ruid (&reg_state[i].reg_use[j].ruid,
> ++					 split_ruid);
> ++	}
> ++    }
> ++}
> ++
> ++/* Called when we are about to rescan a previously encountered insn with
> ++   reload_combine_note_use after modifying some part of it.  This clears all
> ++   information about uses in that particular insn.  */
> ++
> ++static void
> ++reload_combine_purge_insn_uses (rtx insn)
> ++{
> ++  unsigned i;
> ++
> ++  for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
> ++    {
> ++      int j, k, idx = reg_state[i].use_index;
> ++      if (idx < 0)
> ++	continue;
> ++      j = k = RELOAD_COMBINE_MAX_USES;
> ++      while (j-- > idx)
> ++	{
> ++	  if (reg_state[i].reg_use[j].insn != insn)
> ++	    {
> ++	      k--;
> ++	      if (k != j)
> ++		reg_state[i].reg_use[k] = reg_state[i].reg_use[j];
> ++	    }
> ++	}
> ++      reg_state[i].use_index = k;
> ++    }
> ++}
> ++
> ++/* Called when we need to forget about all uses of REGNO after an insn
> ++   which is identified by RUID.  */
> ++
> ++static void
> ++reload_combine_purge_reg_uses_after_ruid (unsigned regno, int ruid)
> ++{
> ++  int j, k, idx = reg_state[regno].use_index;
> ++  if (idx < 0)
> ++    return;
> ++  j = k = RELOAD_COMBINE_MAX_USES;
> ++  while (j-- > idx)
> ++    {
> ++      if (reg_state[regno].reg_use[j].ruid >= ruid)
> ++	{
> ++	  k--;
> ++	  if (k != j)
> ++	    reg_state[regno].reg_use[k] = reg_state[regno].reg_use[j];
> ++	}
> ++    }
> ++  reg_state[regno].use_index = k;
> ++}
> ++
> ++/* Find the use of REGNO with the ruid that is highest among those
> ++   lower than RUID_LIMIT, and return it if it is the only use of this
> ++   reg in the insn.  Return NULL otherwise.  */
> ++
> ++static struct reg_use *
> ++reload_combine_closest_single_use (unsigned regno, int ruid_limit)
> ++{
> ++  int i, best_ruid = 0;
> ++  int use_idx = reg_state[regno].use_index;
> ++  struct reg_use *retval;
> ++
> ++  if (use_idx < 0)
> ++    return NULL;
> ++  retval = NULL;
> ++  for (i = use_idx; i < RELOAD_COMBINE_MAX_USES; i++)
> ++    {
> ++      struct reg_use *use = reg_state[regno].reg_use + i; 
> ++      int this_ruid = use->ruid;
> ++      if (this_ruid >= ruid_limit)
> ++	continue;
> ++      if (this_ruid > best_ruid)
> ++	{
> ++	  best_ruid = this_ruid;
> ++	  retval = use;
> ++	}
> ++      else if (this_ruid == best_ruid)
> ++	retval = NULL;
> ++    }
> ++  if (last_label_ruid >= best_ruid)
> ++    return NULL;
> ++  return retval;
> ++}
> ++
> ++/* After we've moved an add insn, fix up any debug insns that occur
> ++   between the old location of the add and the new location.  REG is
> ++   the destination register of the add insn; REPLACEMENT is the
> ++   SET_SRC of the add.  FROM and TO specify the range in which we
> ++   should make this change on debug insns.  */
> ++
> ++static void
> ++fixup_debug_insns (rtx reg, rtx replacement, rtx from, rtx to)
> ++{
> ++  rtx insn;
> ++  for (insn = from; insn != to; insn = NEXT_INSN (insn))
> ++    {
> ++      rtx t;
> ++
> ++      if (!DEBUG_INSN_P (insn))
> ++	continue;
> ++      
> ++      t = INSN_VAR_LOCATION_LOC (insn);
> ++      t = simplify_replace_rtx (t, reg, replacement);
> ++      validate_change (insn, &INSN_VAR_LOCATION_LOC (insn), t, 0);
> ++    }
> ++}
> ++
> ++/* Subroutine of reload_combine_recognize_const_pattern.  Try to replace REG
> ++   with SRC in the insn described by USE, taking costs into account.  Return
> ++   true if we made the replacement.  */
> ++
> ++static bool
> ++try_replace_in_use (struct reg_use *use, rtx reg, rtx src)
> ++{
> ++  rtx use_insn = use->insn;
> ++  rtx mem = use->containing_mem;
> ++  bool speed = optimize_bb_for_speed_p (BLOCK_FOR_INSN (use_insn));
> ++
> ++  if (mem != NULL_RTX)
> ++    {
> ++      addr_space_t as = MEM_ADDR_SPACE (mem);
> ++      rtx oldaddr = XEXP (mem, 0);
> ++      rtx newaddr = NULL_RTX;
> ++      int old_cost = address_cost (oldaddr, GET_MODE (mem), as, speed);
> ++      int new_cost;
> ++
> ++      newaddr = simplify_replace_rtx (oldaddr, reg, src);
> ++      if (memory_address_addr_space_p (GET_MODE (mem), newaddr, as))
> ++	{
> ++	  XEXP (mem, 0) = newaddr;
> ++	  new_cost = address_cost (newaddr, GET_MODE (mem), as, speed);
> ++	  XEXP (mem, 0) = oldaddr;
> ++	  if (new_cost <= old_cost
> ++	      && validate_change (use_insn,
> ++				  &XEXP (mem, 0), newaddr, 0))
> ++	    return true;
> ++	}
> ++    }
> ++  else
> ++    {
> ++      rtx new_set = single_set (use_insn);
> ++      if (new_set
> ++	  && REG_P (SET_DEST (new_set))
> ++	  && GET_CODE (SET_SRC (new_set)) == PLUS
> ++	  && REG_P (XEXP (SET_SRC (new_set), 0))
> ++	  && CONSTANT_P (XEXP (SET_SRC (new_set), 1)))
> ++	{
> ++	  rtx new_src;
> ++	  int old_cost = rtx_cost (SET_SRC (new_set), SET, speed);
> ++
> ++	  gcc_assert (rtx_equal_p (XEXP (SET_SRC (new_set), 0), reg));
> ++	  new_src = simplify_replace_rtx (SET_SRC (new_set), reg, src);
> ++
> ++	  if (rtx_cost (new_src, SET, speed) <= old_cost
> ++	      && validate_change (use_insn, &SET_SRC (new_set),
> ++				  new_src, 0))
> ++	    return true;
> ++	}
> ++    }
> ++  return false;
> ++}
> ++
> ++/* Called by reload_combine when scanning INSN.  This function tries to detect
> ++   patterns where a constant is added to a register, and the result is used
> ++   in an address.
> ++   Return true if no further processing is needed on INSN; false if it wasn't
> ++   recognized and should be handled normally.  */
> ++
> ++static bool
> ++reload_combine_recognize_const_pattern (rtx insn)
> ++{
> ++  int from_ruid = reload_combine_ruid;
> ++  rtx set, pat, reg, src, addreg;
> ++  unsigned int regno;
> ++  struct reg_use *use;
> ++  bool must_move_add;
> ++  rtx add_moved_after_insn = NULL_RTX;
> ++  int add_moved_after_ruid = 0;
> ++  int clobbered_regno = -1;
> ++
> ++  set = single_set (insn);
> ++  if (set == NULL_RTX)
> ++    return false;
> ++
> ++  reg = SET_DEST (set);
> ++  src = SET_SRC (set);
> ++  if (!REG_P (reg)
> ++      || hard_regno_nregs[REGNO (reg)][GET_MODE (reg)] != 1
> ++      || GET_MODE (reg) != Pmode
> ++      || reg == stack_pointer_rtx)
> ++    return false;
> ++
> ++  regno = REGNO (reg);
> ++
> ++  /* We look for a REG1 = REG2 + CONSTANT insn, followed by either
> ++     uses of REG1 inside an address, or inside another add insn.  If
> ++     possible and profitable, merge the addition into subsequent
> ++     uses.  */
> ++  if (GET_CODE (src) != PLUS
> ++      || !REG_P (XEXP (src, 0))
> ++      || !CONSTANT_P (XEXP (src, 1)))
> ++    return false;
> ++
> ++  addreg = XEXP (src, 0);
> ++  must_move_add = rtx_equal_p (reg, addreg);
> ++
> ++  pat = PATTERN (insn);
> ++  if (must_move_add && set != pat)
> ++    {
> ++      /* We have to be careful when moving the add; apart from the
> ++	 single_set there may also be clobbers.  Recognize one special
> ++	 case, that of one clobber alongside the set (likely a clobber
> ++	 of the CC register).  */
> ++      gcc_assert (GET_CODE (PATTERN (insn)) == PARALLEL);
> ++      if (XVECLEN (pat, 0) != 2 || XVECEXP (pat, 0, 0) != set
> ++	  || GET_CODE (XVECEXP (pat, 0, 1)) != CLOBBER
> ++	  || !REG_P (XEXP (XVECEXP (pat, 0, 1), 0)))
> ++	return false;
> ++      clobbered_regno = REGNO (XEXP (XVECEXP (pat, 0, 1), 0));
> ++    }
> ++
> ++  do
> ++    {
> ++      use = reload_combine_closest_single_use (regno, from_ruid);
> ++
> ++      if (use)
> ++	/* Start the search for the next use from here.  */
> ++	from_ruid = use->ruid;
> ++
> ++      if (use && GET_MODE (*use->usep) == Pmode)
> ++	{
> ++	  bool delete_add = false;
> ++	  rtx use_insn = use->insn;
> ++	  int use_ruid = use->ruid;
> ++
> ++	  /* Avoid moving the add insn past a jump.  */
> ++	  if (must_move_add && use_ruid <= last_jump_ruid)
> ++	    break;
> ++
> ++	  /* If the add clobbers another hard reg in parallel, don't move
> ++	     it past a real set of this hard reg.  */
> ++	  if (must_move_add && clobbered_regno >= 0
> ++	      && reg_state[clobbered_regno].real_store_ruid >= use_ruid)
> ++	    break;
> ++
> ++	  gcc_assert (reg_state[regno].store_ruid <= use_ruid);
> ++	  /* Avoid moving a use of ADDREG past a point where it is stored.  */
> ++	  if (reg_state[REGNO (addreg)].store_ruid > use_ruid)
> ++	    break;
> ++
> ++	  /* We also must not move the addition past an insn that sets
> ++	     the same register, unless we can combine two add insns.  */
> ++	  if (must_move_add && reg_state[regno].store_ruid == use_ruid)
> ++	    {
> ++	      if (use->containing_mem == NULL_RTX)
> ++		delete_add = true;
> ++	      else
> ++		break;
> ++	    }
> ++
> ++	  if (try_replace_in_use (use, reg, src))
> ++	    {
> ++	      reload_combine_purge_insn_uses (use_insn);
> ++	      reload_combine_note_use (&PATTERN (use_insn), use_insn,
> ++				       use_ruid, NULL_RTX);
> ++
> ++	      if (delete_add)
> ++		{
> ++		  fixup_debug_insns (reg, src, insn, use_insn);
> ++		  delete_insn (insn);
> ++		  return true;
> ++		}
> ++	      if (must_move_add)
> ++		{
> ++		  add_moved_after_insn = use_insn;
> ++		  add_moved_after_ruid = use_ruid;
> ++		}
> ++	      continue;
> ++	    }
> ++	}
> ++      /* If we get here, we couldn't handle this use.  */
> ++      if (must_move_add)
> ++	break;
> ++    }
> ++  while (use);
> ++
> ++  if (!must_move_add || add_moved_after_insn == NULL_RTX)
> ++    /* Process the add normally.  */
> ++    return false;
> ++
> ++  fixup_debug_insns (reg, src, insn, add_moved_after_insn);
> ++
> ++  reorder_insns (insn, insn, add_moved_after_insn);
> ++  reload_combine_purge_reg_uses_after_ruid (regno, add_moved_after_ruid);
> ++  reload_combine_split_ruids (add_moved_after_ruid - 1);
> ++  reload_combine_note_use (&PATTERN (insn), insn,
> ++			   add_moved_after_ruid, NULL_RTX);
> ++  reg_state[regno].store_ruid = add_moved_after_ruid;
> ++
> ++  return true;
> ++}
> ++
> ++/* Called by reload_combine when scanning INSN.  Try to detect a pattern we
> ++   can handle and improve.  Return true if no further processing is needed on
> ++   INSN; false if it wasn't recognized and should be handled normally.  */
> ++
> ++static bool
> ++reload_combine_recognize_pattern (rtx insn)
> ++{
> ++  rtx set, reg, src;
> ++  unsigned int regno;
> ++
> ++  set = single_set (insn);
> ++  if (set == NULL_RTX)
> ++    return false;
> ++
> ++  reg = SET_DEST (set);
> ++  src = SET_SRC (set);
> ++  if (!REG_P (reg)
> ++      || hard_regno_nregs[REGNO (reg)][GET_MODE (reg)] != 1)
> ++    return false;
> ++
> ++  regno = REGNO (reg);
> ++
> ++  /* Look for (set (REGX) (CONST_INT))
> ++     (set (REGX) (PLUS (REGX) (REGY)))
> ++     ...
> ++     ... (MEM (REGX)) ...
> ++     and convert it to
> ++     (set (REGZ) (CONST_INT))
> ++     ...
> ++     ... (MEM (PLUS (REGZ) (REGY)))... .
> ++
> ++     First, check that we have (set (REGX) (PLUS (REGX) (REGY)))
> ++     and that we know all uses of REGX before it dies.
> ++     Also, explicitly check that REGX != REGY; our life information
> ++     does not yet show whether REGY changes in this insn.  */
> ++
> ++  if (GET_CODE (src) == PLUS
> ++      && reg_state[regno].all_offsets_match
> ++      && last_index_reg != -1
> ++      && REG_P (XEXP (src, 1))
> ++      && rtx_equal_p (XEXP (src, 0), reg)
> ++      && !rtx_equal_p (XEXP (src, 1), reg)
> ++      && reg_state[regno].use_index >= 0
> ++      && reg_state[regno].use_index < RELOAD_COMBINE_MAX_USES
> ++      && last_label_ruid < reg_state[regno].use_ruid)
> ++    {
> ++      rtx base = XEXP (src, 1);
> ++      rtx prev = prev_nonnote_insn (insn);
> ++      rtx prev_set = prev ? single_set (prev) : NULL_RTX;
> ++      rtx index_reg = NULL_RTX;
> ++      rtx reg_sum = NULL_RTX;
> ++      int i;
> ++
> ++      /* Now we need to set INDEX_REG to an index register (denoted as
> ++	 REGZ in the illustration above) and REG_SUM to the expression
> ++	 register+register that we want to use to substitute uses of REG
> ++	 (typically in MEMs) with.  First check REG and BASE for being
> ++	 index registers; we can use them even if they are not dead.  */
> ++      if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS], regno)
> ++	  || TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS],
> ++				REGNO (base)))
> ++	{
> ++	  index_reg = reg;
> ++	  reg_sum = src;
> ++	}
> ++      else
> ++	{
> ++	  /* Otherwise, look for a free index register.  Since we have
> ++	     checked above that neither REG nor BASE are index registers,
> ++	     if we find anything at all, it will be different from these
> ++	     two registers.  */
> ++	  for (i = first_index_reg; i <= last_index_reg; i++)
> ++	    {
> ++	      if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS], i)
> ++		  && reg_state[i].use_index == RELOAD_COMBINE_MAX_USES
> ++		  && reg_state[i].store_ruid <= reg_state[regno].use_ruid
> ++		  && (call_used_regs[i] || df_regs_ever_live_p (i))
> ++		  && (!frame_pointer_needed || i != HARD_FRAME_POINTER_REGNUM)
> ++		  && !fixed_regs[i] && !global_regs[i]
> ++		  && hard_regno_nregs[i][GET_MODE (reg)] == 1
> ++		  && targetm.hard_regno_scratch_ok (i))
> ++		{
> ++		  index_reg = gen_rtx_REG (GET_MODE (reg), i);
> ++		  reg_sum = gen_rtx_PLUS (GET_MODE (reg), index_reg, base);
> ++		  break;
> ++		}
> ++	    }
> ++	}
> ++
> ++      /* Check that PREV_SET is indeed (set (REGX) (CONST_INT)) and that
> ++	 (REGY), i.e. BASE, is not clobbered before the last use we'll
> ++	 create.  */
> ++      if (reg_sum
> ++	  && prev_set
> ++	  && CONST_INT_P (SET_SRC (prev_set))
> ++	  && rtx_equal_p (SET_DEST (prev_set), reg)
> ++	  && (reg_state[REGNO (base)].store_ruid
> ++	      <= reg_state[regno].use_ruid))
> ++	{
> ++	  /* Change destination register and, if necessary, the constant
> ++	     value in PREV, the constant loading instruction.  */
> ++	  validate_change (prev, &SET_DEST (prev_set), index_reg, 1);
> ++	  if (reg_state[regno].offset != const0_rtx)
> ++	    validate_change (prev,
> ++			     &SET_SRC (prev_set),
> ++			     GEN_INT (INTVAL (SET_SRC (prev_set))
> ++				      + INTVAL (reg_state[regno].offset)),
> ++			     1);
> ++
> ++	  /* Now for every use of REG that we have recorded, replace REG
> ++	     with REG_SUM.  */
> ++	  for (i = reg_state[regno].use_index;
> ++	       i < RELOAD_COMBINE_MAX_USES; i++)
> ++	    validate_unshare_change (reg_state[regno].reg_use[i].insn,
> ++				     reg_state[regno].reg_use[i].usep,
> ++				     /* Each change must have its own
> ++					replacement.  */
> ++				     reg_sum, 1);
> ++
> ++	  if (apply_change_group ())
> ++	    {
> ++	      struct reg_use *lowest_ruid = NULL;
> ++
> ++	      /* For every new use of REG_SUM, we have to record the use
> ++		 of BASE therein, i.e. operand 1.  */
> ++	      for (i = reg_state[regno].use_index;
> ++		   i < RELOAD_COMBINE_MAX_USES; i++)
> ++		{
> ++		  struct reg_use *use = reg_state[regno].reg_use + i;
> ++		  reload_combine_note_use (&XEXP (*use->usep, 1), use->insn,
> ++					   use->ruid, use->containing_mem);
> ++		  if (lowest_ruid == NULL || use->ruid < lowest_ruid->ruid)
> ++		    lowest_ruid = use;
> ++		}
> ++
> ++	      fixup_debug_insns (reg, reg_sum, insn, lowest_ruid->insn);
> ++
> ++	      /* Delete the reg-reg addition.  */
> ++	      delete_insn (insn);
> ++
> ++	      if (reg_state[regno].offset != const0_rtx)
> ++		/* Previous REG_EQUIV / REG_EQUAL notes for PREV
> ++		   are now invalid.  */
> ++		remove_reg_equal_equiv_notes (prev);
> ++
> ++	      reg_state[regno].use_index = RELOAD_COMBINE_MAX_USES;
> ++	      return true;
> ++	    }
> ++	}
> ++    }
> ++  return false;
> ++}
> ++
> + static void
> + reload_combine (void)
> + {
> +-  rtx insn, set;
> +-  int first_index_reg = -1;
> +-  int last_index_reg = 0;
> ++  rtx insn, prev;
> +   int i;
> +   basic_block bb;
> +   unsigned int r;
> +-  int last_label_ruid;
> +   int min_labelno, n_labels;
> +   HARD_REG_SET ever_live_at_start, *label_live;
> + 
> +-  /* If reg+reg can be used in offsetable memory addresses, the main chunk of
> +-     reload has already used it where appropriate, so there is no use in
> +-     trying to generate it now.  */
> +-  if (double_reg_address_ok && INDEX_REG_CLASS != NO_REGS)
> +-    return;
> +-
> +   /* To avoid wasting too much time later searching for an index register,
> +      determine the minimum and maximum index register numbers.  */
> +-  for (r = 0; r < FIRST_PSEUDO_REGISTER; r++)
> +-    if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS], r))
> +-      {
> +-	if (first_index_reg == -1)
> +-	  first_index_reg = r;
> +-
> +-	last_index_reg = r;
> +-      }
> +-
> +-  /* If no index register is available, we can quit now.  */
> +-  if (first_index_reg == -1)
> +-    return;
> ++  if (INDEX_REG_CLASS == NO_REGS)
> ++    last_index_reg = -1;
> ++  else if (first_index_reg == -1 && last_index_reg == 0)
> ++    {
> ++      for (r = 0; r < FIRST_PSEUDO_REGISTER; r++)
> ++	if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS], r))
> ++	  {
> ++	    if (first_index_reg == -1)
> ++	      first_index_reg = r;
> ++
> ++	    last_index_reg = r;
> ++	  }
> ++
> ++      /* If no index register is available, we can quit now.  Set LAST_INDEX_REG
> ++	 to -1 so we'll know to quit early the next time we get here.  */
> ++      if (first_index_reg == -1)
> ++	{
> ++	  last_index_reg = -1;
> ++	  return;
> ++	}
> ++    }
> + 
> +   /* Set up LABEL_LIVE and EVER_LIVE_AT_START.  The register lifetime
> +      information is a bit fuzzy immediately after reload, but it's
> +@@ -753,20 +1278,23 @@
> +     }
> + 
> +   /* Initialize last_label_ruid, reload_combine_ruid and reg_state.  */
> +-  last_label_ruid = reload_combine_ruid = 0;
> ++  last_label_ruid = last_jump_ruid = reload_combine_ruid = 0;
> +   for (r = 0; r < FIRST_PSEUDO_REGISTER; r++)
> +     {
> +-      reg_state[r].store_ruid = reload_combine_ruid;
> ++      reg_state[r].store_ruid = 0;
> ++      reg_state[r].real_store_ruid = 0;
> +       if (fixed_regs[r])
> + 	reg_state[r].use_index = -1;
> +       else
> + 	reg_state[r].use_index = RELOAD_COMBINE_MAX_USES;
> +     }
> + 
> +-  for (insn = get_last_insn (); insn; insn = PREV_INSN (insn))
> ++  for (insn = get_last_insn (); insn; insn = prev)
> +     {
> +       rtx note;
> + 
> ++      prev = PREV_INSN (insn);
> ++
> +       /* We cannot do our optimization across labels.  Invalidating all the use
> + 	 information we have would be costly, so we just note where the label
> + 	 is and then later disable any optimization that would cross it.  */
> +@@ -777,141 +1305,17 @@
> + 	  if (! fixed_regs[r])
> + 	      reg_state[r].use_index = RELOAD_COMBINE_MAX_USES;
> + 
> +-      if (! INSN_P (insn))
> ++      if (! NONDEBUG_INSN_P (insn))
> + 	continue;
> + 
> +       reload_combine_ruid++;
> + 
> +-      /* Look for (set (REGX) (CONST_INT))
> +-	 (set (REGX) (PLUS (REGX) (REGY)))
> +-	 ...
> +-	 ... (MEM (REGX)) ...
> +-	 and convert it to
> +-	 (set (REGZ) (CONST_INT))
> +-	 ...
> +-	 ... (MEM (PLUS (REGZ) (REGY)))... .
> +-
> +-	 First, check that we have (set (REGX) (PLUS (REGX) (REGY)))
> +-	 and that we know all uses of REGX before it dies.
> +-	 Also, explicitly check that REGX != REGY; our life information
> +-	 does not yet show whether REGY changes in this insn.  */
> +-      set = single_set (insn);
> +-      if (set != NULL_RTX
> +-	  && REG_P (SET_DEST (set))
> +-	  && (hard_regno_nregs[REGNO (SET_DEST (set))]
> +-			      [GET_MODE (SET_DEST (set))]
> +-	      == 1)
> +-	  && GET_CODE (SET_SRC (set)) == PLUS
> +-	  && REG_P (XEXP (SET_SRC (set), 1))
> +-	  && rtx_equal_p (XEXP (SET_SRC (set), 0), SET_DEST (set))
> +-	  && !rtx_equal_p (XEXP (SET_SRC (set), 1), SET_DEST (set))
> +-	  && last_label_ruid < reg_state[REGNO (SET_DEST (set))].use_ruid)
> +-	{
> +-	  rtx reg = SET_DEST (set);
> +-	  rtx plus = SET_SRC (set);
> +-	  rtx base = XEXP (plus, 1);
> +-	  rtx prev = prev_nonnote_nondebug_insn (insn);
> +-	  rtx prev_set = prev ? single_set (prev) : NULL_RTX;
> +-	  unsigned int regno = REGNO (reg);
> +-	  rtx index_reg = NULL_RTX;
> +-	  rtx reg_sum = NULL_RTX;
> +-
> +-	  /* Now we need to set INDEX_REG to an index register (denoted as
> +-	     REGZ in the illustration above) and REG_SUM to the expression
> +-	     register+register that we want to use to substitute uses of REG
> +-	     (typically in MEMs) with.  First check REG and BASE for being
> +-	     index registers; we can use them even if they are not dead.  */
> +-	  if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS], regno)
> +-	      || TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS],
> +-				    REGNO (base)))
> +-	    {
> +-	      index_reg = reg;
> +-	      reg_sum = plus;
> +-	    }
> +-	  else
> +-	    {
> +-	      /* Otherwise, look for a free index register.  Since we have
> +-		 checked above that neither REG nor BASE are index registers,
> +-		 if we find anything at all, it will be different from these
> +-		 two registers.  */
> +-	      for (i = first_index_reg; i <= last_index_reg; i++)
> +-		{
> +-		  if (TEST_HARD_REG_BIT (reg_class_contents[INDEX_REG_CLASS],
> +-					 i)
> +-		      && reg_state[i].use_index == RELOAD_COMBINE_MAX_USES
> +-		      && reg_state[i].store_ruid <= reg_state[regno].use_ruid
> +-		      && hard_regno_nregs[i][GET_MODE (reg)] == 1)
> +-		    {
> +-		      index_reg = gen_rtx_REG (GET_MODE (reg), i);
> +-		      reg_sum = gen_rtx_PLUS (GET_MODE (reg), index_reg, base);
> +-		      break;
> +-		    }
> +-		}
> +-	    }
> +-
> +-	  /* Check that PREV_SET is indeed (set (REGX) (CONST_INT)) and that
> +-	     (REGY), i.e. BASE, is not clobbered before the last use we'll
> +-	     create.  */
> +-	  if (reg_sum
> +-	      && prev_set
> +-	      && CONST_INT_P (SET_SRC (prev_set))
> +-	      && rtx_equal_p (SET_DEST (prev_set), reg)
> +-	      && reg_state[regno].use_index >= 0
> +-	      && (reg_state[REGNO (base)].store_ruid
> +-		  <= reg_state[regno].use_ruid))
> +-	    {
> +-	      int i;
> +-
> +-	      /* Change destination register and, if necessary, the constant
> +-		 value in PREV, the constant loading instruction.  */
> +-	      validate_change (prev, &SET_DEST (prev_set), index_reg, 1);
> +-	      if (reg_state[regno].offset != const0_rtx)
> +-		validate_change (prev,
> +-				 &SET_SRC (prev_set),
> +-				 GEN_INT (INTVAL (SET_SRC (prev_set))
> +-					  + INTVAL (reg_state[regno].offset)),
> +-				 1);
> +-
> +-	      /* Now for every use of REG that we have recorded, replace REG
> +-		 with REG_SUM.  */
> +-	      for (i = reg_state[regno].use_index;
> +-		   i < RELOAD_COMBINE_MAX_USES; i++)
> +-		validate_unshare_change (reg_state[regno].reg_use[i].insn,
> +-				 	 reg_state[regno].reg_use[i].usep,
> +-				 	 /* Each change must have its own
> +-				    	    replacement.  */
> +-				 	 reg_sum, 1);
> +-
> +-	      if (apply_change_group ())
> +-		{
> +-		  /* For every new use of REG_SUM, we have to record the use
> +-		     of BASE therein, i.e. operand 1.  */
> +-		  for (i = reg_state[regno].use_index;
> +-		       i < RELOAD_COMBINE_MAX_USES; i++)
> +-		    reload_combine_note_use
> +-		      (&XEXP (*reg_state[regno].reg_use[i].usep, 1),
> +-		       reg_state[regno].reg_use[i].insn);
> +-
> +-		  if (reg_state[REGNO (base)].use_ruid
> +-		      > reg_state[regno].use_ruid)
> +-		    reg_state[REGNO (base)].use_ruid
> +-		      = reg_state[regno].use_ruid;
> +-
> +-		  /* Delete the reg-reg addition.  */
> +-		  delete_insn (insn);
> +-
> +-		  if (reg_state[regno].offset != const0_rtx)
> +-		    /* Previous REG_EQUIV / REG_EQUAL notes for PREV
> +-		       are now invalid.  */
> +-		    remove_reg_equal_equiv_notes (prev);
> +-
> +-		  reg_state[regno].use_index = RELOAD_COMBINE_MAX_USES;
> +-		  reg_state[REGNO (index_reg)].store_ruid
> +-		    = reload_combine_ruid;
> +-		  continue;
> +-		}
> +-	    }
> +-	}
> ++      if (control_flow_insn_p (insn))
> ++	last_jump_ruid = reload_combine_ruid;
> ++
> ++      if (reload_combine_recognize_const_pattern (insn)
> ++	  || reload_combine_recognize_pattern (insn))
> ++	continue;
> + 
> +       note_stores (PATTERN (insn), reload_combine_note_store, NULL);
> + 
> +@@ -967,7 +1371,8 @@
> + 	      reg_state[i].use_index = -1;
> + 	}
> + 
> +-      reload_combine_note_use (&PATTERN (insn), insn);
> ++      reload_combine_note_use (&PATTERN (insn), insn,
> ++			       reload_combine_ruid, NULL_RTX);
> +       for (note = REG_NOTES (insn); note; note = XEXP (note, 1))
> + 	{
> + 	  if (REG_NOTE_KIND (note) == REG_INC
> +@@ -976,6 +1381,7 @@
> + 	      int regno = REGNO (XEXP (note, 0));
> + 
> + 	      reg_state[regno].store_ruid = reload_combine_ruid;
> ++	      reg_state[regno].real_store_ruid = reload_combine_ruid;
> + 	      reg_state[regno].use_index = -1;
> + 	    }
> + 	}
> +@@ -985,8 +1391,8 @@
> + }
> + 
> + /* Check if DST is a register or a subreg of a register; if it is,
> +-   update reg_state[regno].store_ruid and reg_state[regno].use_index
> +-   accordingly.  Called via note_stores from reload_combine.  */
> ++   update store_ruid, real_store_ruid and use_index in the reg_state
> ++   structure accordingly.  Called via note_stores from reload_combine.  */
> + 
> + static void
> + reload_combine_note_store (rtx dst, const_rtx set, void *data ATTRIBUTE_UNUSED)
> +@@ -1010,14 +1416,14 @@
> +   /* note_stores might have stripped a STRICT_LOW_PART, so we have to be
> +      careful with registers / register parts that are not full words.
> +      Similarly for ZERO_EXTRACT.  */
> +-  if (GET_CODE (set) != SET
> +-      || GET_CODE (SET_DEST (set)) == ZERO_EXTRACT
> ++  if (GET_CODE (SET_DEST (set)) == ZERO_EXTRACT
> +       || GET_CODE (SET_DEST (set)) == STRICT_LOW_PART)
> +     {
> +       for (i = hard_regno_nregs[regno][mode] - 1 + regno; i >= regno; i--)
> + 	{
> + 	  reg_state[i].use_index = -1;
> + 	  reg_state[i].store_ruid = reload_combine_ruid;
> ++	  reg_state[i].real_store_ruid = reload_combine_ruid;
> + 	}
> +     }
> +   else
> +@@ -1025,6 +1431,8 @@
> +       for (i = hard_regno_nregs[regno][mode] - 1 + regno; i >= regno; i--)
> + 	{
> + 	  reg_state[i].store_ruid = reload_combine_ruid;
> ++	  if (GET_CODE (set) == SET)
> ++	    reg_state[i].real_store_ruid = reload_combine_ruid;
> + 	  reg_state[i].use_index = RELOAD_COMBINE_MAX_USES;
> + 	}
> +     }
> +@@ -1035,7 +1443,7 @@
> +    *XP is the pattern of INSN, or a part of it.
> +    Called from reload_combine, and recursively by itself.  */
> + static void
> +-reload_combine_note_use (rtx *xp, rtx insn)
> ++reload_combine_note_use (rtx *xp, rtx insn, int ruid, rtx containing_mem)
> + {
> +   rtx x = *xp;
> +   enum rtx_code code = x->code;
> +@@ -1048,7 +1456,7 @@
> +     case SET:
> +       if (REG_P (SET_DEST (x)))
> + 	{
> +-	  reload_combine_note_use (&SET_SRC (x), insn);
> ++	  reload_combine_note_use (&SET_SRC (x), insn, ruid, NULL_RTX);
> + 	  return;
> + 	}
> +       break;
> +@@ -1104,6 +1512,11 @@
> + 	    return;
> + 	  }
> + 
> ++	/* We may be called to update uses in previously seen insns.
> ++	   Don't add uses beyond the last store we saw.  */
> ++	if (ruid < reg_state[regno].store_ruid)
> ++	  return;
> ++
> + 	/* If this register is already used in some unknown fashion, we
> + 	   can't do anything.
> + 	   If we decrement the index from zero to -1, we can't store more
> +@@ -1112,29 +1525,34 @@
> + 	if (use_index < 0)
> + 	  return;
> + 
> +-	if (use_index != RELOAD_COMBINE_MAX_USES - 1)
> +-	  {
> +-	    /* We have found another use for a register that is already
> +-	       used later.  Check if the offsets match; if not, mark the
> +-	       register as used in an unknown fashion.  */
> +-	    if (! rtx_equal_p (offset, reg_state[regno].offset))
> +-	      {
> +-		reg_state[regno].use_index = -1;
> +-		return;
> +-	      }
> +-	  }
> +-	else
> ++	if (use_index == RELOAD_COMBINE_MAX_USES - 1)
> + 	  {
> + 	    /* This is the first use of this register we have seen since we
> + 	       marked it as dead.  */
> + 	    reg_state[regno].offset = offset;
> +-	    reg_state[regno].use_ruid = reload_combine_ruid;
> +-	  }
> ++	    reg_state[regno].all_offsets_match = true;
> ++	    reg_state[regno].use_ruid = ruid;
> ++	  }
> ++	else
> ++	  {
> ++	    if (reg_state[regno].use_ruid > ruid)
> ++	      reg_state[regno].use_ruid = ruid;
> ++
> ++	    if (! rtx_equal_p (offset, reg_state[regno].offset))
> ++	      reg_state[regno].all_offsets_match = false;
> ++	  }
> ++
> + 	reg_state[regno].reg_use[use_index].insn = insn;
> ++	reg_state[regno].reg_use[use_index].ruid = ruid;
> ++	reg_state[regno].reg_use[use_index].containing_mem = containing_mem;
> + 	reg_state[regno].reg_use[use_index].usep = xp;
> + 	return;
> +       }
> + 
> ++    case MEM:
> ++      containing_mem = x;
> ++      break;
> ++
> +     default:
> +       break;
> +     }
> +@@ -1144,11 +1562,12 @@
> +   for (i = GET_RTX_LENGTH (code) - 1; i >= 0; i--)
> +     {
> +       if (fmt[i] == 'e')
> +-	reload_combine_note_use (&XEXP (x, i), insn);
> ++	reload_combine_note_use (&XEXP (x, i), insn, ruid, containing_mem);
> +       else if (fmt[i] == 'E')
> + 	{
> + 	  for (j = XVECLEN (x, i) - 1; j >= 0; j--)
> +-	    reload_combine_note_use (&XVECEXP (x, i, j), insn);
> ++	    reload_combine_note_use (&XVECEXP (x, i, j), insn, ruid,
> ++				     containing_mem);
> + 	}
> +     }
> + }
> +@@ -1196,9 +1615,10 @@
> +    while REG is known to already have value (SYM + offset).
> +    This function tries to change INSN into an add instruction
> +    (set (REG) (plus (REG) (OFF - offset))) using the known value.
> +-   It also updates the information about REG's known value.  */
> ++   It also updates the information about REG's known value.
> ++   Return true if we made a change.  */
> + 
> +-static void
> ++static bool
> + move2add_use_add2_insn (rtx reg, rtx sym, rtx off, rtx insn)
> + {
> +   rtx pat = PATTERN (insn);
> +@@ -1207,6 +1627,7 @@
> +   rtx new_src = gen_int_mode (INTVAL (off) - reg_offset[regno],
> + 			      GET_MODE (reg));
> +   bool speed = optimize_bb_for_speed_p (BLOCK_FOR_INSN (insn));
> ++  bool changed = false;
> + 
> +   /* (set (reg) (plus (reg) (const_int 0))) is not canonical;
> +      use (set (reg) (reg)) instead.
> +@@ -1221,13 +1642,13 @@
> + 	 (reg)), would be discarded.  Maybe we should
> + 	 try a truncMN pattern?  */
> +       if (INTVAL (off) == reg_offset [regno])
> +-	validate_change (insn, &SET_SRC (pat), reg, 0);
> ++	changed = validate_change (insn, &SET_SRC (pat), reg, 0);
> +     }
> +   else if (rtx_cost (new_src, PLUS, speed) < rtx_cost (src, SET, speed)
> + 	   && have_add2_insn (reg, new_src))
> +     {
> +       rtx tem = gen_rtx_PLUS (GET_MODE (reg), reg, new_src);
> +-      validate_change (insn, &SET_SRC (pat), tem, 0);
> ++      changed = validate_change (insn, &SET_SRC (pat), tem, 0);
> +     }
> +   else if (sym == NULL_RTX && GET_MODE (reg) != BImode)
> +     {
> +@@ -1252,8 +1673,9 @@
> + 			     gen_rtx_STRICT_LOW_PART (VOIDmode,
> + 						      narrow_reg),
> + 			     narrow_src);
> +-	      if (validate_change (insn, &PATTERN (insn),
> +-				   new_set, 0))
> ++	      changed = validate_change (insn, &PATTERN (insn),
> ++					 new_set, 0);
> ++	      if (changed)
> + 		break;
> + 	    }
> + 	}
> +@@ -1263,6 +1685,7 @@
> +   reg_mode[regno] = GET_MODE (reg);
> +   reg_symbol_ref[regno] = sym;
> +   reg_offset[regno] = INTVAL (off);
> ++  return changed;
> + }
> + 
> + 
> +@@ -1272,9 +1695,10 @@
> +    value (SYM + offset) and change INSN into an add instruction
> +    (set (REG) (plus (the found register) (OFF - offset))) if such
> +    a register is found.  It also updates the information about
> +-   REG's known value.  */
> ++   REG's known value.
> ++   Return true iff we made a change.  */
> + 
> +-static void
> ++static bool
> + move2add_use_add3_insn (rtx reg, rtx sym, rtx off, rtx insn)
> + {
> +   rtx pat = PATTERN (insn);
> +@@ -1284,6 +1708,7 @@
> +   int min_regno;
> +   bool speed = optimize_bb_for_speed_p (BLOCK_FOR_INSN (insn));
> +   int i;
> ++  bool changed = false;
> + 
> +   for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
> +     if (reg_set_luid[i] > move2add_last_label_luid
> +@@ -1328,20 +1753,25 @@
> + 				      GET_MODE (reg));
> + 	  tem = gen_rtx_PLUS (GET_MODE (reg), tem, new_src);
> + 	}
> +-      validate_change (insn, &SET_SRC (pat), tem, 0);
> ++      if (validate_change (insn, &SET_SRC (pat), tem, 0))
> ++	changed = true;
> +     }
> +   reg_set_luid[regno] = move2add_luid;
> +   reg_base_reg[regno] = -1;
> +   reg_mode[regno] = GET_MODE (reg);
> +   reg_symbol_ref[regno] = sym;
> +   reg_offset[regno] = INTVAL (off);
> ++  return changed;
> + }
> + 
> +-static void
> ++/* Convert move insns with constant inputs to additions if they are cheaper.
> ++   Return true if any changes were made.  */
> ++static bool
> + reload_cse_move2add (rtx first)
> + {
> +   int i;
> +   rtx insn;
> ++  bool changed = false;
> + 
> +   for (i = FIRST_PSEUDO_REGISTER - 1; i >= 0; i--)
> +     {
> +@@ -1402,7 +1832,7 @@
> + 		  && reg_base_reg[regno] < 0
> + 		  && reg_symbol_ref[regno] == NULL_RTX)
> + 		{
> +-		  move2add_use_add2_insn (reg, NULL_RTX, src, insn);
> ++		  changed |= move2add_use_add2_insn (reg, NULL_RTX, src, insn);
> + 		  continue;
> + 		}
> + 
> +@@ -1463,6 +1893,7 @@
> + 			}
> + 		      if (success)
> + 			delete_insn (insn);
> ++		      changed |= success;
> + 		      insn = next;
> + 		      reg_mode[regno] = GET_MODE (reg);
> + 		      reg_offset[regno] =
> +@@ -1508,12 +1939,12 @@
> + 		  && reg_base_reg[regno] < 0
> + 		  && reg_symbol_ref[regno] != NULL_RTX
> + 		  && rtx_equal_p (sym, reg_symbol_ref[regno]))
> +-		move2add_use_add2_insn (reg, sym, off, insn);
> ++		changed |= move2add_use_add2_insn (reg, sym, off, insn);
> + 
> + 	      /* Otherwise, we have to find a register whose value is sum
> + 		 of sym and some constant value.  */
> + 	      else
> +-		move2add_use_add3_insn (reg, sym, off, insn);
> ++		changed |= move2add_use_add3_insn (reg, sym, off, insn);
> + 
> + 	      continue;
> + 	    }
> +@@ -1568,6 +1999,7 @@
> + 	    }
> + 	}
> +     }
> ++  return changed;
> + }
> + 
> + /* SET is a SET or CLOBBER that sets DST.  DATA is the insn which
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch
> new file mode 100644
> index 0000000..b7a28de
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch
> @@ -0,0 +1,78 @@
> +2010-11-24  Chung-Lin Tang  <cltang@codesourcery.com>
> +
> +	2010-07-08  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
> +
> +	PR bootstrap/44768
> +
> +	* cfgexpand.c (estimated_stack_frame_size): Make self-contained
> +	with respect to current_function_decl. Pass decl of the function.
> +	* tree-inline.h (estimated_stack_frame_size): Adjust prototype.
> +	* ipa-inline.c (compute_inline_parameters): Pass decl to
> +	estimated_stack_frame_size.
> +
> +=== modified file 'gcc/cfgexpand.c'
> +--- old/gcc/cfgexpand.c	2010-10-04 00:50:43 +0000
> ++++ new/gcc/cfgexpand.c	2010-11-24 08:43:48 +0000
> +@@ -1248,8 +1248,8 @@
> +   stack_vars_alloc = stack_vars_num = 0;
> + }
> + 
> +-/* Make a fair guess for the size of the stack frame of the current
> +-   function.  This doesn't have to be exact, the result is only used
> ++/* Make a fair guess for the size of the stack frame of the decl
> ++   passed.  This doesn't have to be exact, the result is only used
> +    in the inline heuristics.  So we don't want to run the full stack
> +    var packing algorithm (which is quadratic in the number of stack
> +    vars).  Instead, we calculate the total size of all stack vars.
> +@@ -1257,11 +1257,14 @@
> +    vars doesn't happen very often.  */
> + 
> + HOST_WIDE_INT
> +-estimated_stack_frame_size (void)
> ++estimated_stack_frame_size (tree decl)
> + {
> +   HOST_WIDE_INT size = 0;
> +   size_t i;
> +   tree t, outer_block = DECL_INITIAL (current_function_decl);
> ++  tree old_cur_fun_decl = current_function_decl;
> ++  current_function_decl = decl;
> ++  push_cfun (DECL_STRUCT_FUNCTION (decl));
> + 
> +   init_vars_expansion ();
> + 
> +@@ -1284,7 +1287,8 @@
> +       size += account_stack_vars ();
> +       fini_vars_expansion ();
> +     }
> +-
> ++  pop_cfun ();
> ++  current_function_decl = old_cur_fun_decl;
> +   return size;
> + }
> + 
> +
> +=== modified file 'gcc/ipa-inline.c'
> +--- old/gcc/ipa-inline.c	2010-06-30 21:30:12 +0000
> ++++ new/gcc/ipa-inline.c	2010-11-24 08:43:48 +0000
> +@@ -1967,7 +1967,7 @@
> + 
> +   /* Estimate the stack size for the function.  But not at -O0
> +      because estimated_stack_frame_size is a quadratic problem.  */
> +-  self_stack_size = optimize ? estimated_stack_frame_size () : 0;
> ++  self_stack_size = optimize ? estimated_stack_frame_size (node->decl) : 0;
> +   inline_summary (node)->estimated_self_stack_size = self_stack_size;
> +   node->global.estimated_stack_size = self_stack_size;
> +   node->global.stack_frame_offset = 0;
> +
> +=== modified file 'gcc/tree-inline.h'
> +--- old/gcc/tree-inline.h	2009-09-14 18:18:58 +0000
> ++++ new/gcc/tree-inline.h	2010-11-24 08:43:48 +0000
> +@@ -187,6 +187,6 @@
> + extern tree remap_type (tree type, copy_body_data *id);
> + extern gimple_seq copy_gimple_seq_and_replace_locals (gimple_seq seq);
> + 
> +-extern HOST_WIDE_INT estimated_stack_frame_size (void);
> ++extern HOST_WIDE_INT estimated_stack_frame_size (tree);
> + 
> + #endif /* GCC_TREE_INLINE_H */
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch
> new file mode 100644
> index 0000000..5495b8d
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch
> @@ -0,0 +1,33 @@
> +2010-11-25  Andrew Stubbs  <ams@codesourcery.com>
> +
> +	Backport from mainline:
> +
> +	2010-10-28  Andrew Stubbs  <ams@codesourcery.com>
> +
> +	gcc/
> +	* config/arm/arm.c (const_ok_for_arm): Support 0xXY00XY00 pattern
> +	constants in thumb2.
> +
> +=== modified file 'gcc/config/arm/arm.c'
> +--- old/gcc/config/arm/arm.c	2010-11-11 11:50:33 +0000
> ++++ new/gcc/config/arm/arm.c	2010-12-10 15:30:47 +0000
> +@@ -2340,11 +2340,17 @@
> +     {
> +       HOST_WIDE_INT v;
> + 
> +-      /* Allow repeated pattern.  */
> ++      /* Allow repeated patterns 0x00XY00XY or 0xXYXYXYXY.  */
> +       v = i & 0xff;
> +       v |= v << 16;
> +       if (i == v || i == (v | (v << 8)))
> + 	return TRUE;
> ++
> ++      /* Allow repeated pattern 0xXY00XY00.  */
> ++      v = i & 0xff00;
> ++      v |= v << 16;
> ++      if (i == v)
> ++	return TRUE;
> +     }
> + 
> +   return FALSE;
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch
> new file mode 100644
> index 0000000..62c4478
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch
> @@ -0,0 +1,23 @@
> +2010-11-24  Maxim Kuvyrkov  <maxim@codesourcery.com>
> +
> +	gcc/
> +	* loop-iv.c (get_biv_step): Workaround loop analysis ICE.
> +
> +=== modified file 'gcc/loop-iv.c'
> +--- old/gcc/loop-iv.c	2009-11-25 10:55:54 +0000
> ++++ new/gcc/loop-iv.c	2010-12-10 15:32:04 +0000
> +@@ -796,6 +796,13 @@
> + 		       outer_step))
> +     return false;
> + 
> ++  /* CSL local: workaround get_biv_step_1() inability to handle DU
> ++     chains originating at sets of subregs.  Such subregs are introduced
> ++     by Tom's extension elimination pass.  For upstream duscussion see
> ++     http://gcc.gnu.org/ml/gcc/2010-11/msg00552.html .  */
> ++  if (!((*inner_mode == *outer_mode) != (*extend != UNKNOWN)))
> ++    return false;
> ++
> +   gcc_assert ((*inner_mode == *outer_mode) != (*extend != UNKNOWN));
> +   gcc_assert (*inner_mode != *outer_mode || *outer_step == const0_rtx);
> + 
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch
> new file mode 100644
> index 0000000..802c381
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch
> @@ -0,0 +1,873 @@
> +2010-11-26  Tom de Vries  <tom@codesourcery.com>
> +
> +	gcc/
> +	* gcc/ee.c: New file.
> +	* gcc/tree-pass.h (pass_ee): Declare.
> +	* gcc/opts.c (decode_options): Set flag_ee at -O2.
> +	* gcc/timevar.def (TV_EE): New timevar.
> +	* gcc/common.opt (fextension-elimination): New option.
> +	* gcc/Makefile.in (ee.o): New rule.
> +	* gcc/passes.c (pass_ee): Add it.
> +	* gcc/testsuite/gcc.dg/extend-4.c: New test.
> +	* gcc/testsuite/gcc.dg/extend-1.c: New test.
> +	* gcc/testsuite/gcc.dg/extend-2.c: New test.
> +	* gcc/testsuite/gcc.dg/extend-2-64.c: New test.
> +	* gcc/testsuite/gcc.dg/extend-3.c: New test.
> +
> +=== modified file 'gcc/Makefile.in'
> +--- old/gcc/Makefile.in	2010-11-16 18:05:53 +0000
> ++++ new/gcc/Makefile.in	2010-12-10 15:33:37 +0000
> +@@ -1194,6 +1194,7 @@
> + 	dse.o \
> + 	dwarf2asm.o \
> + 	dwarf2out.o \
> ++	ee.o \
> + 	ebitmap.o \
> + 	emit-rtl.o \
> + 	et-forest.o \
> +@@ -2965,6 +2966,11 @@
> + web.o : web.c $(CONFIG_H) $(SYSTEM_H) coretypes.h $(TM_H) $(RTL_H) \
> +    hard-reg-set.h $(FLAGS_H) $(BASIC_BLOCK_H) $(FUNCTION_H) output.h $(TOPLEV_H) \
> +    $(DF_H) $(OBSTACK_H) $(TIMEVAR_H) $(TREE_PASS_H)
> ++ee.o : ee.c $(CONFIG_H) $(SYSTEM_H) coretypes.h $(TM_H) $(RTL_H) \
> ++   hard-reg-set.h $(FLAGS_H) $(BASIC_BLOCK_H) $(FUNCTION_H) output.h \
> ++   $(DF_H) $(TIMEVAR_H) tree-pass.h $(RECOG_H) $(EXPR_H) \
> ++   $(REGS_H) $(TREE_H) $(TM_P_H) insn-config.h $(INSN_ATTR_H) $(TOPLEV_H) $(DIAGNOSTIC_CORE_H) \
> ++   $(TARGET_H) $(OPTABS_H) insn-codes.h rtlhooks-def.h $(PARAMS_H) $(CGRAPH_H)
> + gcse.o : gcse.c $(CONFIG_H) $(SYSTEM_H) coretypes.h $(TM_H) $(RTL_H) \
> +    $(REGS_H) hard-reg-set.h $(FLAGS_H) $(REAL_H) insn-config.h $(GGC_H) \
> +    $(RECOG_H) $(EXPR_H) $(BASIC_BLOCK_H) $(FUNCTION_H) output.h $(TOPLEV_H) \
> +
> +=== modified file 'gcc/common.opt'
> +--- old/gcc/common.opt	2010-11-04 12:43:52 +0000
> ++++ new/gcc/common.opt	2010-12-10 15:33:37 +0000
> +@@ -496,6 +496,10 @@
> + Common Report Var(flag_early_inlining) Init(1) Optimization
> + Perform early inlining
> + 
> ++fextension-elimination
> ++Common Report Var(flag_ee) Init(0) Optimization
> ++Perform extension elimination
> ++
> + feliminate-dwarf2-dups
> + Common Report Var(flag_eliminate_dwarf2_dups)
> + Perform DWARF2 duplicate elimination
> +
> +=== added file 'gcc/ee.c'
> +--- old/gcc/ee.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/ee.c	2010-12-10 15:33:37 +0000
> +@@ -0,0 +1,662 @@
> ++/* Redundant extension elimination 
> ++   Copyright (C) 2010 Free Software Foundation, Inc.
> ++   Contributed by Tom de Vries (tom@codesourcery.com)
> ++
> ++This file is part of GCC.
> ++
> ++GCC is free software; you can redistribute it and/or modify it under
> ++the terms of the GNU General Public License as published by the Free
> ++Software Foundation; either version 3, or (at your option) any later
> ++version.
> ++
> ++GCC is distributed in the hope that it will be useful, but WITHOUT ANY
> ++WARRANTY; without even the implied warranty of MERCHANTABILITY or
> ++FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> ++for more details.
> ++
> ++You should have received a copy of the GNU General Public License
> ++along with GCC; see the file COPYING3.  If not see
> ++<http://www.gnu.org/licenses/>.  */
> ++
> ++/*
> ++
> ++  MOTIVATING EXAMPLE
> ++
> ++  The motivating example for this pass is:
> ++
> ++    void f(unsigned char *p, short s, int c, int *z)
> ++    {
> ++      if (c)
> ++        *z = 0;
> ++      *p ^= (unsigned char)s;
> ++    }
> ++
> ++  For MIPS, compilation results in the following insns.
> ++
> ++    (set (reg/v:SI 199)
> ++         (sign_extend:SI (subreg:HI (reg:SI 200) 2)))
> ++
> ++    ...
> ++
> ++    (set (reg:QI 203)
> ++         (subreg:QI (reg/v:SI 199) 3))
> ++
> ++  These insns are the only def and the only use of reg 199, each located in a
> ++  different bb.
> ++
> ++  The sign-extension preserves the lower half of reg 200 and copies them to 
> ++  reg 199, and the subreg use of reg 199 only reads the least significant byte.
> ++  The sign extension is therefore redundant (the extension part, not the copy 
> ++  part), and can safely be replaced with a regcopy from reg 200 to reg 199.
> ++
> ++
> ++  OTHER SIGN/ZERO EXTENSION ELIMINATION PASSES
> ++
> ++  There are other passes which eliminate sign/zero-extension: combine and
> ++  implicit_zee. Both attempt to eliminate extensions by combining them with
> ++  other instructions. The combine pass does this at bb level,
> ++  implicit_zee works at inter-bb level.
> ++
> ++  The combine pass combine an extension with either:
> ++  - all uses of the extension, or 
> ++  - all defs of the operand of the extension.
> ++  The implicit_zee pass only implements the latter.
> ++
> ++  For our motivating example, combine doesn't work since the def and the use of
> ++  reg 199 are in a different bb.
> ++
> ++  Implicit_zee does not work since it only combines an extension with the defs
> ++  of its operand.
> ++
> ++
> ++  INTENDED EFFECT
> ++
> ++  This pass works by removing sign/zero-extensions, or replacing them with
> ++  regcopies. The idea there is that the regcopy might be eliminated by a later
> ++  pass. In case the regcopy cannot be eliminated, it might at least be cheaper
> ++  than the extension.
> ++
> ++
> ++  IMPLEMENTATION
> ++
> ++  The pass scans twice over all instructions.
> ++
> ++  The first scan registers all uses of a reg in the biggest_use array. After
> ++  that first scan, the biggest_use array contains the size in bits of the
> ++  biggest use of each reg.
> ++
> ++  The second scan finds extensions, determines whether they are redundant based
> ++  on the biggest use, and deletes or replaces them.
> ++
> ++  In case that the src and dest reg of the replacement are not of the same size,
> ++  we do not replace with a normal regcopy, but with a truncate or with the copy
> ++  of a paradoxical subreg instead.
> ++
> ++
> ++  LIMITATIONS
> ++
> ++  The scope of the analysis is limited to an extension and its uses. The other
> ++  type of analysis (related to the defs of the operand of an extension) is not
> ++  done.
> ++
> ++  Furthermore, we do the analysis of biggest use per reg. So when determining
> ++  whether an extension is redundant, we take all uses of a the dest reg into
> ++  account, also the ones that are not uses of the extension. This could be
> ++  overcome by calculating the def-use chains and using those for analysis
> ++  instead.
> ++
> ++  Finally, during the analysis each insn is looked at in isolation. There is no
> ++  propagation of information during the analysis.  To overcome this limitation,
> ++  a backward iterative bit-level liveness analysis is needed.  */
> ++
> ++
> ++#include "config.h"
> ++#include "system.h"
> ++#include "coretypes.h"
> ++#include "tm.h"
> ++#include "rtl.h"
> ++#include "tree.h"
> ++#include "tm_p.h"
> ++#include "flags.h"
> ++#include "regs.h"
> ++#include "hard-reg-set.h"
> ++#include "basic-block.h"
> ++#include "insn-config.h"
> ++#include "function.h"
> ++#include "expr.h"
> ++#include "insn-attr.h"
> ++#include "recog.h"
> ++#include "toplev.h"
> ++#include "target.h"
> ++#include "timevar.h"
> ++#include "optabs.h"
> ++#include "insn-codes.h"
> ++#include "rtlhooks-def.h"
> ++#include "output.h"
> ++#include "params.h"
> ++#include "timevar.h"
> ++#include "tree-pass.h"
> ++#include "cgraph.h"
> ++
> ++#define SKIP_REG (-1)
> ++
> ++/* Array to register the biggest use of a reg, in bits.  */
> ++
> ++static int *biggest_use;
> ++
> ++/* Forward declaration.  */
> ++
> ++static void note_use (rtx *x, void *data);
> ++
> ++/* The following two functions are borrowed from trunk/gcc/toplev.c. They can be
> ++   removed for a check-in into gcc trunk.  */
> ++
> ++/* Given X, an unsigned number, return the number of least significant bits
> ++   that are zero.  When X == 0, the result is the word size.  */
> ++
> ++static int
> ++ctz_hwi (unsigned HOST_WIDE_INT x)
> ++{
> ++  return x ? floor_log2 (x & -x) : HOST_BITS_PER_WIDE_INT;
> ++}
> ++
> ++/* Similarly for most significant bits.  */
> ++
> ++static int
> ++clz_hwi (unsigned HOST_WIDE_INT x)
> ++{
> ++  return HOST_BITS_PER_WIDE_INT - 1 - floor_log2(x);
> ++}
> ++
> ++/* Check whether this is a paradoxical subreg. */
> ++
> ++static bool
> ++paradoxical_subreg_p (rtx subreg)
> ++{
> ++  enum machine_mode subreg_mode, reg_mode;
> ++
> ++  if (GET_CODE (subreg) != SUBREG)
> ++    return false;
> ++
> ++  subreg_mode = GET_MODE (subreg);
> ++  reg_mode = GET_MODE (SUBREG_REG (subreg));
> ++
> ++  if (GET_MODE_SIZE (subreg_mode) > GET_MODE_SIZE (reg_mode))
> ++    return true;
> ++
> ++  return false;
> ++}
> ++
> ++/* Get the size and reg number of a REG or SUBREG use.  */
> ++
> ++static bool
> ++reg_use_p (rtx use, int *size, unsigned int *regno)
> ++{
> ++  rtx reg;
> ++      
> ++  if (REG_P (use))
> ++    {
> ++      *regno = REGNO (use);
> ++      *size = GET_MODE_BITSIZE (GET_MODE (use));
> ++      return true;
> ++    }
> ++  else if (GET_CODE (use) == SUBREG)
> ++    {
> ++      reg = SUBREG_REG (use);
> ++
> ++      if (!REG_P (reg))
> ++        return false;
> ++
> ++      *regno = REGNO (reg);
> ++
> ++      if (paradoxical_subreg_p (use))
> ++        *size = GET_MODE_BITSIZE (GET_MODE (reg));
> ++      else
> ++        *size = subreg_lsb (use) + GET_MODE_BITSIZE (GET_MODE (use));
> ++
> ++      return true;
> ++    }
> ++
> ++  return false;
> ++}
> ++
> ++/* Register the use of a reg.  */
> ++
> ++static void
> ++register_use (int size, unsigned int regno)
> ++{
> ++  int *current = &biggest_use[regno];
> ++
> ++  if (*current == SKIP_REG)
> ++    return;
> ++  
> ++  *current = MAX (*current, size);
> ++}
> ++
> ++/* Handle embedded uses.  */
> ++
> ++static void
> ++note_embedded_uses (rtx use, rtx pattern)
> ++{
> ++  const char *format_ptr;
> ++  int i, j;
> ++
> ++  format_ptr = GET_RTX_FORMAT (GET_CODE (use));
> ++  for (i = 0; i < GET_RTX_LENGTH (GET_CODE (use)); i++)
> ++    if (format_ptr[i] == 'e')
> ++      note_use (&XEXP (use, i), pattern);
> ++    else if (format_ptr[i] == 'E')
> ++      for (j = 0; j < XVECLEN (use, i); j++)
> ++        note_use (&XVECEXP (use, i, j), pattern);
> ++}
> ++
> ++/* Get the set that has use as its SRC operand.  */
> ++
> ++static rtx
> ++get_set (rtx use, rtx pattern)
> ++{
> ++  rtx sub;
> ++  int i;
> ++
> ++  if (GET_CODE (pattern) == SET && SET_SRC (pattern) == use)
> ++    return pattern;
> ++
> ++  if (GET_CODE (pattern) == PARALLEL)
> ++    for (i = 0; i < XVECLEN (pattern, 0); ++i)
> ++      {
> ++        sub = XVECEXP (pattern, 0, i);
> ++        if (GET_CODE (sub) == SET && SET_SRC (sub) == use)
> ++          return sub;
> ++      }
> ++  
> ++  return NULL_RTX;
> ++}
> ++
> ++/* Handle a restricted op use. In this context restricted means that a bit in an
> ++   operand influences only the same bit or more significant bits in the result.
> ++   The bitwise ops are a subclass, but PLUS is one as well.  */
> ++
> ++static void
> ++note_restricted_op_use (rtx use, unsigned int nr_operands, rtx pattern)
> ++{
> ++  unsigned int i, smallest;
> ++  int operand_size[2];
> ++  int used_size;
> ++  unsigned int operand_regno[2];
> ++  bool operand_reg[2];
> ++  bool operand_ignore[2];
> ++  rtx set;
> ++
> ++  /* Init operand_reg, operand_size, operand_regno and operand_ignore.  */
> ++  for (i = 0; i < nr_operands; ++i)
> ++    {
> ++      operand_reg[i] = reg_use_p (XEXP (use, i), &operand_size[i],
> ++                                  &operand_regno[i]);
> ++      operand_ignore[i] = false;
> ++    }
> ++
> ++  /* Handle case of reg and-masked with const.  */
> ++  if (GET_CODE (use) == AND && CONST_INT_P (XEXP (use, 1)) && operand_reg[0])
> ++    {
> ++      used_size =
> ++        HOST_BITS_PER_WIDE_INT - clz_hwi (UINTVAL (XEXP (use, 1)));
> ++      operand_size[0] = MIN (operand_size[0], used_size);
> ++    }
> ++
> ++  /* Handle case of reg or-masked with const.  */
> ++  if (GET_CODE (use) == IOR && CONST_INT_P (XEXP (use, 1)) && operand_reg[0])
> ++    {
> ++      used_size =
> ++        HOST_BITS_PER_WIDE_INT - clz_hwi (~UINTVAL (XEXP (use, 1)));
> ++      operand_size[0] = MIN (operand_size[0], used_size);
> ++    }
> ++
> ++  /* Ignore the use of a in 'a = a + b'.  */
> ++  set = get_set (use, pattern);
> ++  if (set != NULL_RTX && REG_P (SET_DEST (set)))
> ++    for (i = 0; i < nr_operands; ++i)
> ++      operand_ignore[i] = (operand_reg[i]
> ++                           && (REGNO (SET_DEST (set)) == operand_regno[i]));
> ++
> ++  /* Handle the case a reg is combined with don't care bits.  */
> ++  if (nr_operands == 2 && operand_reg[0] && operand_reg[1]
> ++      && operand_size[0] != operand_size[1])
> ++    {
> ++      smallest = operand_size[0] > operand_size[1];
> ++
> ++      if (paradoxical_subreg_p (XEXP (use, smallest))
> ++          && !SUBREG_PROMOTED_VAR_P (XEXP (use, smallest)))
> ++        operand_size[1 - smallest] = operand_size[smallest];
> ++    }
> ++
> ++  /* Register the operand use, if necessary.  */
> ++  for (i = 0; i < nr_operands; ++i)
> ++    if (!operand_reg[i])
> ++      note_use (&XEXP (use, i), pattern);
> ++    else if (!operand_ignore[i])
> ++      register_use (operand_size[i], operand_regno[i]);
> ++}
> ++
> ++/* Handle all uses noted by note_uses.  */
> ++
> ++static void
> ++note_use (rtx *x, void *data)
> ++{
> ++  rtx use = *x;
> ++  rtx pattern = (rtx)data;
> ++  int use_size;
> ++  unsigned int use_regno;
> ++
> ++  switch (GET_CODE (use))
> ++    {
> ++    case REG:
> ++    case SUBREG:
> ++      if (!reg_use_p (use, &use_size, &use_regno))
> ++        {
> ++          note_embedded_uses (use, pattern);
> ++          return;
> ++        }
> ++      register_use (use_size, use_regno);
> ++      return;
> ++    case IOR:
> ++    case AND:
> ++    case XOR:
> ++    case PLUS:
> ++    case MINUS:
> ++      note_restricted_op_use (use, 2, pattern);
> ++      return;
> ++    case NOT:
> ++    case NEG:
> ++      note_restricted_op_use (use, 1, pattern);
> ++      return;
> ++    case ASHIFT:
> ++      if (!reg_use_p (XEXP (use, 0), &use_size, &use_regno)
> ++	  || !CONST_INT_P (XEXP (use, 1))
> ++          || INTVAL (XEXP (use, 1)) <= 0
> ++          || paradoxical_subreg_p (XEXP (use, 0)))
> ++        {
> ++          note_embedded_uses (use, pattern);
> ++          return;
> ++        }
> ++      register_use (use_size - INTVAL (XEXP (use, 1)), use_regno);
> ++      return;
> ++    default:
> ++      note_embedded_uses (use, pattern);
> ++      return;
> ++    }
> ++}
> ++
> ++/* Check whether reg is implicitly used.  */
> ++
> ++static bool
> ++implicit_use_p (int regno)
> ++{
> ++#ifdef EPILOGUE_USES
> ++  if (EPILOGUE_USES (regno))
> ++    return true;
> ++#endif
> ++
> ++#ifdef EH_USES
> ++  if (EH_USES (regno))
> ++    return true;
> ++#endif
> ++
> ++  return false;
> ++}
> ++
> ++/* Note the uses of argument registers in a call.  */
> ++
> ++static void
> ++note_call_uses (rtx insn)
> ++{
> ++  rtx link, link_expr;
> ++
> ++  if (!CALL_P (insn))
> ++    return;
> ++
> ++  for (link = CALL_INSN_FUNCTION_USAGE (insn); link; link = XEXP (link, 1))
> ++    {
> ++      link_expr = XEXP (link, 0);
> ++
> ++      if (GET_CODE (link_expr) == USE)
> ++        note_use (&XEXP (link_expr, 0), link);
> ++    }
> ++}
> ++
> ++/* Calculate the biggest use mode for all regs. */
> ++
> ++static void
> ++calculate_biggest_use (void)
> ++{
> ++  int i;
> ++  basic_block bb;
> ++  rtx insn;
> ++
> ++  /* Initialize biggest_use for all regs to 0. If a reg is used implicitly, we
> ++     handle that reg conservatively and set it to SKIP_REG instead.  */
> ++  for (i = 0; i < max_reg_num (); i++)
> ++    biggest_use[i] = ((implicit_use_p (i) || HARD_REGISTER_NUM_P (i))
> ++                      ? SKIP_REG : 0);
> ++
> ++  /* For all insns, call note_use for each use in insn.  */
> ++  FOR_EACH_BB (bb)
> ++    FOR_BB_INSNS (bb, insn)
> ++      {
> ++        if (!NONDEBUG_INSN_P (insn))
> ++          continue;
> ++
> ++        note_uses (&PATTERN (insn), note_use, PATTERN (insn));
> ++
> ++        if (CALL_P (insn))
> ++          note_call_uses (insn);
> ++      }
> ++
> ++  /* Dump the biggest uses found.  */
> ++  if (dump_file)
> ++    for (i = 0; i < max_reg_num (); i++)
> ++      if (biggest_use[i] > 0)
> ++        fprintf (dump_file, "reg %d: size %d\n", i, biggest_use[i]);
> ++}
> ++
> ++/* Check whether this is a sign/zero extension.  */
> ++
> ++static bool
> ++extension_p (rtx insn, rtx *dest, rtx *inner, int *preserved_size)
> ++{
> ++  rtx src, op0;
> ++
> ++  /* Detect set of reg.  */
> ++  if (GET_CODE (PATTERN (insn)) != SET)
> ++    return false;
> ++
> ++  src = SET_SRC (PATTERN (insn));
> ++  *dest = SET_DEST (PATTERN (insn));
> ++          
> ++  if (!REG_P (*dest))
> ++    return false;
> ++
> ++  /* Detect sign or zero extension.  */
> ++  if (GET_CODE (src) == ZERO_EXTEND || GET_CODE (src) == SIGN_EXTEND
> ++      || (GET_CODE (src) == AND && CONST_INT_P (XEXP (src, 1))))
> ++    {
> ++      op0 = XEXP (src, 0);
> ++
> ++      /* Determine amount of least significant bits preserved by operation.  */
> ++      if (GET_CODE (src) == AND)
> ++        *preserved_size = ctz_hwi (~UINTVAL (XEXP (src, 1)));
> ++      else
> ++        *preserved_size = GET_MODE_BITSIZE (GET_MODE (op0));
> ++
> ++      if (GET_CODE (op0) == SUBREG)
> ++        {
> ++          if (subreg_lsb (op0) != 0)
> ++            return false;
> ++      
> ++          *inner = SUBREG_REG (op0);
> ++          return true;
> ++        }
> ++      else if (REG_P (op0))
> ++        {
> ++          *inner = op0;
> ++          return true;
> ++        }
> ++    }
> ++
> ++  return false;
> ++}
> ++
> ++/* Check whether this is a redundant sign/zero extension.  */
> ++
> ++static bool
> ++redundant_extension_p (rtx insn, rtx *dest, rtx *inner)
> ++{
> ++  int biggest_dest_use;
> ++  int preserved_size;
> ++
> ++  if (!extension_p (insn, dest, inner, &preserved_size))
> ++    return false;
> ++
> ++  if (dump_file)
> ++    fprintf (dump_file, "considering extension %u with preserved size %d\n", 
> ++             INSN_UID (insn), preserved_size);
> ++
> ++  biggest_dest_use = biggest_use[REGNO (*dest)];
> ++      
> ++  if (biggest_dest_use == SKIP_REG)
> ++    return false;
> ++
> ++  if (preserved_size < biggest_dest_use)
> ++    return false;
> ++
> ++  if (dump_file)
> ++    fprintf (dump_file, "found superfluous extension %u\n", INSN_UID (insn));
> ++
> ++  return true;
> ++}
> ++
> ++/* Try to remove or replace the redundant extension.  */
> ++
> ++static void
> ++try_remove_or_replace_extension (rtx insn, rtx dest, rtx inner)
> ++{
> ++  rtx cp_src, cp_dest, seq, one;
> ++
> ++  if (GET_MODE_CLASS (GET_MODE (dest)) != GET_MODE_CLASS (GET_MODE (inner)))
> ++    return;
> ++
> ++  /* Check whether replacement is needed.  */
> ++  if (dest != inner)
> ++    {
> ++      start_sequence ();
> ++
> ++      /* Determine the proper replacement operation.  */
> ++      if (GET_MODE (dest) == GET_MODE (inner))
> ++        {
> ++          cp_src = inner;
> ++          cp_dest = dest;
> ++        }
> ++      else if (GET_MODE_SIZE (GET_MODE (dest))
> ++               > GET_MODE_SIZE (GET_MODE (inner)))
> ++        {
> ++          emit_clobber (dest);
> ++          cp_src = inner;
> ++          cp_dest = gen_lowpart_SUBREG (GET_MODE (inner), dest);
> ++        }
> ++      else 
> ++        {
> ++          cp_src = gen_rtx_TRUNCATE (GET_MODE (dest), inner);
> ++          cp_dest = dest;
> ++        }
> ++
> ++      emit_move_insn (cp_dest, cp_src);
> ++
> ++      seq = get_insns ();
> ++      end_sequence ();
> ++
> ++      /* If the replacement is not supported, bail out.  */
> ++      for (one = seq; one != NULL_RTX; one = NEXT_INSN (one))
> ++        if (recog_memoized (one) < 0 && GET_CODE (PATTERN (one)) != CLOBBER)
> ++          return;
> ++
> ++      /* Insert the replacement.  */
> ++      emit_insn_before (seq, insn);
> ++    }
> ++
> ++  /* Note replacement/removal in the dump.  */
> ++  if (dump_file)
> ++    {
> ++      fprintf (dump_file, "superfluous extension %u ", INSN_UID (insn));
> ++      if (dest != inner)
> ++        fprintf (dump_file, "replaced by %u\n", INSN_UID (seq));
> ++      else
> ++        fprintf (dump_file, "removed\n");
> ++    }
> ++
> ++  /* Remove the extension.  */
> ++  delete_insn (insn);  
> ++}
> ++
> ++/* Find redundant extensions and remove or replace them if possible.  */
> ++
> ++static void
> ++remove_redundant_extensions (void)
> ++{
> ++  basic_block bb;
> ++  rtx insn, next, dest, inner;
> ++
> ++  biggest_use = XNEWVEC (int, max_reg_num ());
> ++  calculate_biggest_use ();
> ++
> ++  /* Remove redundant extensions.  */
> ++  FOR_EACH_BB (bb)
> ++    FOR_BB_INSNS_SAFE (bb, insn, next)
> ++      {
> ++        if (!NONDEBUG_INSN_P (insn))
> ++          continue;
> ++
> ++        if (!redundant_extension_p (insn, &dest, &inner))
> ++          continue;
> ++
> ++        try_remove_or_replace_extension (insn, dest, inner);
> ++      }
> ++
> ++  free (biggest_use);
> ++}
> ++
> ++/* Remove redundant extensions.  */
> ++
> ++static unsigned int
> ++rest_of_handle_ee (void)
> ++{
> ++  remove_redundant_extensions ();
> ++  return 0;
> ++}
> ++
> ++/* Run ee pass when flag_ee is set at optimization level > 0.  */
> ++
> ++static bool
> ++gate_handle_ee (void)
> ++{
> ++  return (optimize > 0 && flag_ee);
> ++}
> ++
> ++struct rtl_opt_pass pass_ee =
> ++{
> ++ {
> ++  RTL_PASS,
> ++  "ee",                                 /* name */
> ++  gate_handle_ee,                       /* gate */
> ++  rest_of_handle_ee,                    /* execute */
> ++  NULL,                                 /* sub */
> ++  NULL,                                 /* next */
> ++  0,                                    /* static_pass_number */
> ++  TV_EE,                                /* tv_id */
> ++  0,                                    /* properties_required */
> ++  0,                                    /* properties_provided */
> ++  0,                                    /* properties_destroyed */
> ++  0,                                    /* todo_flags_start */
> ++  TODO_ggc_collect |
> ++  TODO_dump_func |
> ++  TODO_verify_rtl_sharing,              /* todo_flags_finish */
> ++ }
> ++};
> +
> +=== modified file 'gcc/opts.c'
> +--- old/gcc/opts.c	2010-05-17 09:13:28 +0000
> ++++ new/gcc/opts.c	2010-12-10 15:33:37 +0000
> +@@ -907,6 +907,7 @@
> +   flag_tree_switch_conversion = opt2;
> +   flag_ipa_cp = opt2;
> +   flag_ipa_sra = opt2;
> ++  flag_ee = opt2;
> + 
> +   /* Track fields in field-sensitive alias analysis.  */
> +   set_param_value ("max-fields-for-field-sensitive",
> +
> +=== modified file 'gcc/passes.c'
> +--- old/gcc/passes.c	2010-09-01 13:29:58 +0000
> ++++ new/gcc/passes.c	2010-12-10 15:33:37 +0000
> +@@ -974,6 +974,7 @@
> +       NEXT_PASS (pass_lower_subreg);
> +       NEXT_PASS (pass_df_initialize_opt);
> +       NEXT_PASS (pass_cse);
> ++      NEXT_PASS (pass_ee);
> +       NEXT_PASS (pass_rtl_fwprop);
> +       NEXT_PASS (pass_rtl_cprop);
> +       NEXT_PASS (pass_rtl_pre);
> +
> +=== added file 'gcc/testsuite/gcc.dg/extend-1.c'
> +--- old/gcc/testsuite/gcc.dg/extend-1.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.dg/extend-1.c	2010-12-10 15:33:37 +0000
> +@@ -0,0 +1,13 @@
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2 -fdump-rtl-ee" } */
> ++
> ++void f(unsigned char * p, short s, int c, int *z)
> ++{
> ++  if (c)
> ++    *z = 0;
> ++  *p ^= (unsigned char)s;
> ++}
> ++
> ++/* { dg-final { scan-rtl-dump-times "sign_extend:" 0 "ee" { target mips*-*-* } } } */
> ++/* { dg-final { scan-rtl-dump-times "superfluous extension \[0-9\]+ replaced" 1 "ee" { target mips*-*-* } } } */
> ++/* { dg-final { cleanup-rtl-dump "ee" } } */
> +
> +=== added file 'gcc/testsuite/gcc.dg/extend-2-64.c'
> +--- old/gcc/testsuite/gcc.dg/extend-2-64.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.dg/extend-2-64.c	2010-12-10 15:33:37 +0000
> +@@ -0,0 +1,20 @@
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2 -fdump-rtl-ee" } */
> ++/* { dg-require-effective-target mips64 } */
> ++
> ++void f(unsigned char * p, short *s, int c)
> ++{
> ++  short or = 0;
> ++  while (c)
> ++    {
> ++      or = or | s[c];
> ++      c --;
> ++    }
> ++  *p = (unsigned char)or;
> ++}
> ++
> ++/* { dg-final { scan-rtl-dump-times "zero_extend:" 1 "ee" { target mips*-*-* } } } */
> ++/* { dg-final { scan-rtl-dump-times "sign_extend:" 0 "ee" { target mips*-*-* } } } */
> ++/* { dg-final { scan-rtl-dump-times "superfluous extension \[0-9\]+ replaced" 3 "ee" { target mips*-*-* } } } */
> ++/* { dg-final { cleanup-rtl-dump "ee" } } */
> ++
> +
> +=== added file 'gcc/testsuite/gcc.dg/extend-2.c'
> +--- old/gcc/testsuite/gcc.dg/extend-2.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.dg/extend-2.c	2010-12-10 15:33:37 +0000
> +@@ -0,0 +1,20 @@
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2 -fdump-rtl-ee" } */
> ++/* { dg-require-effective-target ilp32 } */
> ++
> ++void f(unsigned char * p, short *s, int c)
> ++{
> ++  short or = 0;
> ++  while (c)
> ++    {
> ++      or = or | s[c];
> ++      c --;
> ++    }
> ++  *p = (unsigned char)or;
> ++}
> ++
> ++/* { dg-final { scan-rtl-dump-times "zero_extend" 0 "ee" { target mips*-*-* } } } */
> ++/* { dg-final { scan-rtl-dump-times "sign_extend" 0 "ee" { target mips*-*-* } } } */
> ++/* { dg-final { scan-rtl-dump-times "superfluous extension \[0-9\]+ replaced" 2 "ee" { target mips*-*-* } } } */
> ++/* { dg-final { cleanup-rtl-dump "ee" } } */
> ++
> +
> +=== added file 'gcc/testsuite/gcc.dg/extend-3.c'
> +--- old/gcc/testsuite/gcc.dg/extend-3.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.dg/extend-3.c	2010-12-10 15:33:37 +0000
> +@@ -0,0 +1,12 @@
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2 -fdump-rtl-ee" } */
> ++
> ++unsigned int f(unsigned char byte)
> ++{
> ++  return byte << 25;
> ++}
> ++
> ++/* { dg-final { scan-rtl-dump-times "zero_extend:" 0 "ee" { target mips*-*-* } } } */
> ++/* { dg-final { scan-rtl-dump "superfluous extension \[0-9\]+ replaced" "ee" { target mips*-*-* } } } */
> ++/* { dg-final { cleanup-rtl-dump "ee" } } */
> ++
> +
> +=== added file 'gcc/testsuite/gcc.dg/extend-4.c'
> +--- old/gcc/testsuite/gcc.dg/extend-4.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.dg/extend-4.c	2010-12-10 15:33:37 +0000
> +@@ -0,0 +1,13 @@
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2 -fdump-rtl-ee" } */
> ++
> ++unsigned char f(unsigned int a)
> ++{
> ++  unsigned int b = a & 0x10ff;
> ++  return b;
> ++}
> ++
> ++/* { dg-final { scan-rtl-dump-times "and:" 0 "ee" { target mips*-*-* } } } */
> ++/* { dg-final { scan-rtl-dump-times "superfluous extension \[0-9\]+ replaced" 1 "ee" { target mips*-*-* } } } */
> ++/* { dg-final { cleanup-rtl-dump "ee" } } */
> ++
> +
> +=== modified file 'gcc/timevar.def'
> +--- old/gcc/timevar.def	2009-11-27 12:43:08 +0000
> ++++ new/gcc/timevar.def	2010-12-10 15:33:37 +0000
> +@@ -162,6 +162,7 @@
> + DEFTIMEVAR (TV_VARCONST              , "varconst")
> + DEFTIMEVAR (TV_LOWER_SUBREG	     , "lower subreg")
> + DEFTIMEVAR (TV_JUMP                  , "jump")
> ++DEFTIMEVAR (TV_EE                    , "extension elimination")
> + DEFTIMEVAR (TV_FWPROP                , "forward prop")
> + DEFTIMEVAR (TV_CSE                   , "CSE")
> + DEFTIMEVAR (TV_DCE                   , "dead code elimination")
> +
> +=== modified file 'gcc/tree-pass.h'
> +--- old/gcc/tree-pass.h	2010-09-01 13:29:58 +0000
> ++++ new/gcc/tree-pass.h	2010-12-10 15:33:37 +0000
> +@@ -468,6 +468,7 @@
> + extern struct rtl_opt_pass pass_initial_value_sets;
> + extern struct rtl_opt_pass pass_unshare_all_rtl;
> + extern struct rtl_opt_pass pass_instantiate_virtual_regs;
> ++extern struct rtl_opt_pass pass_ee;
> + extern struct rtl_opt_pass pass_rtl_fwprop;
> + extern struct rtl_opt_pass pass_rtl_fwprop_addr;
> + extern struct rtl_opt_pass pass_jump2;
> +
> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch
> new file mode 100644
> index 0000000..80eebee
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch
> @@ -0,0 +1,183 @@
> +2010-12-02  Bernd Schmidt  <bernds@codesourcery.com>
> +
> +	Issue #10089
> +
> +	gcc/
> +	* expr.c (store_field): Avoid a direct store if the mode is larger
> +	than the size of the bit field.
> +	* stor-layout.c (layout_decl): If flag_strict_volatile_bitfields,
> +	treat non-volatile bit fields like volatile ones.
> +	* toplev.c (process_options): Disallow combination of
> +	-fstrict-volatile-bitfields and ABI versions less than 2.
> +	* config/arm/arm.c (arm_option_override): Don't enable
> +	flag_strict_volatile_bitfields if the ABI version is less than 2.
> +	* config/h8300/h8300.c (h8300_option_override): Likewise.
> +	* config/rx/rx.c (rx_option_override): Likewise.
> +	* config/m32c/m32c.c (m32c_option_override): Likewise.
> +	* config/sh/sh.c (sh_option_override): Likewise.
> +
> +	gcc/testsuite/
> +	* gcc.target/arm/volatile-bitfields-4.c: New test.
> +	* c-c++-common/abi-bf.c: New test.
> +
> +=== modified file 'gcc/config/arm/arm.c'
> +--- old/gcc/config/arm/arm.c	2010-12-10 15:30:47 +0000
> ++++ new/gcc/config/arm/arm.c	2010-12-10 15:34:19 +0000
> +@@ -1934,7 +1934,8 @@
> +     set_param_value ("gcse-unrestricted-cost", 2);
> + 
> +   /* ARM EABI defaults to strict volatile bitfields.  */
> +-  if (TARGET_AAPCS_BASED && flag_strict_volatile_bitfields < 0)
> ++  if (TARGET_AAPCS_BASED && flag_strict_volatile_bitfields < 0
> ++      && abi_version_at_least(2))
> +     flag_strict_volatile_bitfields = 1;
> + 
> +   /* Register global variables with the garbage collector.  */
> +
> +=== modified file 'gcc/config/h8300/h8300.c'
> +--- old/gcc/config/h8300/h8300.c	2010-11-04 12:43:52 +0000
> ++++ new/gcc/config/h8300/h8300.c	2010-12-10 15:34:19 +0000
> +@@ -405,7 +405,7 @@
> +     }
> + 
> +   /* This target defaults to strict volatile bitfields.  */
> +-  if (flag_strict_volatile_bitfields < 0)
> ++  if (flag_strict_volatile_bitfields < 0 && abi_version_at_least(2))
> +     flag_strict_volatile_bitfields = 1;
> + }
> + 
> +
> +=== modified file 'gcc/config/m32c/m32c.c'
> +--- old/gcc/config/m32c/m32c.c	2010-11-04 12:43:52 +0000
> ++++ new/gcc/config/m32c/m32c.c	2010-12-10 15:34:19 +0000
> +@@ -430,7 +430,7 @@
> +     flag_ivopts = 0;
> + 
> +   /* This target defaults to strict volatile bitfields.  */
> +-  if (flag_strict_volatile_bitfields < 0)
> ++  if (flag_strict_volatile_bitfields < 0 && abi_version_at_least(2))
> +     flag_strict_volatile_bitfields = 1;
> + }
> + 
> +
> +=== modified file 'gcc/config/rx/rx.c'
> +--- old/gcc/config/rx/rx.c	2010-11-04 12:43:52 +0000
> ++++ new/gcc/config/rx/rx.c	2010-12-10 15:34:19 +0000
> +@@ -2191,7 +2191,7 @@
> + rx_option_override (void)
> + {
> +   /* This target defaults to strict volatile bitfields.  */
> +-  if (flag_strict_volatile_bitfields < 0)
> ++  if (flag_strict_volatile_bitfields < 0 && abi_version_at_least(2))
> +     flag_strict_volatile_bitfields = 1;
> + }
> + 
> +
> +=== modified file 'gcc/config/sh/sh.c'
> +--- old/gcc/config/sh/sh.c	2010-11-04 12:43:52 +0000
> ++++ new/gcc/config/sh/sh.c	2010-12-10 15:34:19 +0000
> +@@ -952,7 +952,7 @@
> +     sh_fix_range (sh_fixed_range_str);
> + 
> +   /* This target defaults to strict volatile bitfields.  */
> +-  if (flag_strict_volatile_bitfields < 0)
> ++  if (flag_strict_volatile_bitfields < 0 && abi_version_at_least(2))
> +     flag_strict_volatile_bitfields = 1;
> + }
> + 
> +
> +=== modified file 'gcc/expr.c'
> +--- old/gcc/expr.c	2010-11-04 12:43:52 +0000
> ++++ new/gcc/expr.c	2010-12-10 15:34:19 +0000
> +@@ -5848,6 +5848,8 @@
> + 		|| bitpos % GET_MODE_ALIGNMENT (mode))
> + 	       && SLOW_UNALIGNED_ACCESS (mode, MEM_ALIGN (target)))
> + 	      || (bitpos % BITS_PER_UNIT != 0)))
> ++      || (bitsize >= 0 && mode != BLKmode
> ++	  && GET_MODE_BITSIZE (mode) > bitsize)
> +       /* If the RHS and field are a constant size and the size of the
> + 	 RHS isn't the same size as the bitfield, we must use bitfield
> + 	 operations.  */
> +
> +=== modified file 'gcc/stor-layout.c'
> +--- old/gcc/stor-layout.c	2010-11-26 12:03:32 +0000
> ++++ new/gcc/stor-layout.c	2010-12-10 15:34:19 +0000
> +@@ -621,12 +621,13 @@
> + 	  /* See if we can use an ordinary integer mode for a bit-field.
> + 	     Conditions are: a fixed size that is correct for another mode,
> + 	     occupying a complete byte or bytes on proper boundary,
> +-	     and not volatile or not -fstrict-volatile-bitfields.  */
> ++	     and not -fstrict-volatile-bitfields.  If the latter is set,
> ++	     we unfortunately can't check TREE_THIS_VOLATILE, as a cast
> ++	     may make a volatile object later.  */
> + 	  if (TYPE_SIZE (type) != 0
> + 	      && TREE_CODE (TYPE_SIZE (type)) == INTEGER_CST
> + 	      && GET_MODE_CLASS (TYPE_MODE (type)) == MODE_INT
> +-	      && !(TREE_THIS_VOLATILE (decl)
> +-		   && flag_strict_volatile_bitfields > 0))
> ++	      && flag_strict_volatile_bitfields <= 0)
> + 	    {
> + 	      enum machine_mode xmode
> + 		= mode_for_size_tree (DECL_SIZE (decl), MODE_INT, 1);
> +
> +=== added file 'gcc/testsuite/c-c++-common/abi-bf.c'
> +--- old/gcc/testsuite/c-c++-common/abi-bf.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/c-c++-common/abi-bf.c	2010-12-10 15:34:19 +0000
> +@@ -0,0 +1,3 @@
> ++/* { dg-warning "incompatible" } */
> ++/* { dg-do compile } */
> ++/* { dg-options "-fstrict-volatile-bitfields -fabi-version=1" } */
> +
> +=== added file 'gcc/testsuite/gcc.target/arm/volatile-bitfields-4.c'
> +--- old/gcc/testsuite/gcc.target/arm/volatile-bitfields-4.c	1970-01-01 00:00:00 +0000
> ++++ new/gcc/testsuite/gcc.target/arm/volatile-bitfields-4.c	2010-12-10 15:34:19 +0000
> +@@ -0,0 +1,30 @@
> ++/* { dg-require-effective-target arm_eabi } */
> ++/* { dg-do compile } */
> ++/* { dg-options "-O2" } */
> ++/* { dg-final { scan-assembler-times "ldr\[\\t \]+\[^\n\]*,\[\\t \]*\\\[\[^\n\]*\\\]" 2 } } */
> ++/* { dg-final { scan-assembler-times "str\[\\t \]+\[^\n\]*,\[\\t \]*\\\[\[^\n\]*\\\]" 2 } } */
> ++/* { dg-final { scan-assembler-not "strb" } } */
> ++
> ++struct thing {
> ++  unsigned a: 8;
> ++  unsigned b: 8;
> ++  unsigned c: 8;
> ++  unsigned d: 8;
> ++};
> ++
> ++struct thing2 {
> ++  volatile unsigned a: 8;
> ++  volatile unsigned b: 8;
> ++  volatile unsigned c: 8;
> ++  volatile unsigned d: 8;
> ++};
> ++
> ++void test1(volatile struct thing *t)
> ++{
> ++  t->a = 5;
> ++}
> ++
> ++void test2(struct thing2 *t)
> ++{
> ++  t->a = 5;
> ++}
> +
> +=== modified file 'gcc/toplev.c'
> +--- old/gcc/toplev.c	2010-03-31 01:44:10 +0000
> ++++ new/gcc/toplev.c	2010-12-10 15:34:19 +0000
> +@@ -1851,6 +1851,13 @@
> +     sorry ("Graphite loop optimizations cannot be used");
> + #endif
> + 
> ++  if (flag_strict_volatile_bitfields > 0 && !abi_version_at_least (2))
> ++    {
> ++      warning (0, "-fstrict-volatile-bitfield disabled; "
> ++	       "it is incompatible with ABI versions < 2");
> ++      flag_strict_volatile_bitfields = 0;
> ++    }
> ++
> +   /* Unrolling all loops implies that standard loop unrolling must also
> +      be done.  */
> +   if (flag_unroll_all_loops)
> +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNEwlgMkyGM64RGpERAq80AJ4jxf9uGM4O5jsl0MnSK+AVpnB/qACcCkBl
Qt+smOkpp4x6brrHlvAmsb0=
=nKud
-----END PGP SIGNATURE-----



