Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.10971.1593505562154476205
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 01:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: dhuo@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05U8PaDO010640
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 01:25:51 -0700
Received: from pek-lpggp2 (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 30 Jun 2020
 01:25:19 -0700
Received: by pek-lpggp2 (Postfix, from userid 18189)	id 74DA2724E5C; Tue, 30
 Jun 2020 16:24:44 +0800 (CST)
From: "De Huo" <de.huo@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][zeus][PATCH] perl: Fix CVE-2020-12723
Date: Tue, 30 Jun 2020 16:24:42 +0800
Message-ID: <20200630082442.121295-1-De.Huo@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 05U8PaDO010640
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

gh16947 and gh17743: studying GOSUB may restudy in an inner call
(via a mix of recursion and enframing) something that an outer call
is in the middle of looking at.  Let the outer frame deal with it.

(CVE-2020-12723)

(cherry picked from commit c4033e740bd18d9fbe3456a9db2ec2053cdc5271)

Signed-off-by: De Huo <de.huo@windriver.com>
---
 .../perl/files/CVE-2020-12723.patch           | 306 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |   1 +
 2 files changed, 307 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-12723.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch b/meta=
/recipes-devtools/perl/files/CVE-2020-12723.patch
new file mode 100644
index 0000000000..d476176de0
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
@@ -0,0 +1,306 @@
+From 66bbb51b93253a3f87d11c2695cfb7bdb782184a Mon Sep 17 00:00:00 2001
+From: Hugo van der Sanden <hv@crypt.org>
+Date: Sat, 11 Apr 2020 14:10:24 +0100
+Subject: [PATCH] study_chunk: avoid mutating regexp program within GOSUB
+
+gh16947 and gh17743: studying GOSUB may restudy in an inner call
+(via a mix of recursion and enframing) something that an outer call
+is in the middle of looking at.  Let the outer frame deal with it.
+
+(CVE-2020-12723)
+
+(cherry picked from commit c4033e740bd18d9fbe3456a9db2ec2053cdc5271)
+
+CVE: CVE-2020-12723
+Upstream-Status: Backport [https://github.com/perl/perl5/commit/66bbb51b=
93253a3f87d11c2695cfb7bdb782184a]
+
+Signed-off-by: Hugo van der Sanden <hv@crypt.org>
+Signed-off-by: De Huo <de.huo@windriver.com>
+---
+ embed.fnc  |  2 +-
+ embed.h    |  2 +-
+ proto.h    |  2 +-
+ regcomp.c  | 54 +++++++++++++++++++++++++++++++++++-------------------
+ t/re/pat.t | 26 +++++++++++++++++++++++++-
+ 5 files changed, 63 insertions(+), 23 deletions(-)
+
+diff --git a/embed.fnc b/embed.fnc
+index 45597f6..9268758 100644
+--- a/embed.fnc
++++ b/embed.fnc
+@@ -2480,7 +2480,7 @@ Es	|SSize_t|study_chunk	|NN RExC_state_t *pRExC_st=
ate \
+ 				|NULLOK struct scan_data_t *data \
+                                 |I32 stopparen|U32 recursed_depth \
+ 				|NULLOK regnode_ssc *and_withp \
+-				|U32 flags|U32 depth
++				|U32 flags|U32 depth|bool was_mutate_ok
+ EsR	|SV *	|get_ANYOFM_contents|NN const regnode * n
+ EsRn	|U32	|add_data	|NN RExC_state_t* const pRExC_state \
+ 				|NN const char* const s|const U32 n
+diff --git a/embed.h b/embed.h
+index 75c91f7..8f79424 100644
+--- a/embed.h
++++ b/embed.h
+@@ -1238,7 +1238,7 @@
+ #define ssc_is_cp_posixl_init	S_ssc_is_cp_posixl_init
+ #define ssc_or(a,b,c)		S_ssc_or(aTHX_ a,b,c)
+ #define ssc_union(a,b,c)	S_ssc_union(aTHX_ a,b,c)
+-#define study_chunk(a,b,c,d,e,f,g,h,i,j,k)	S_study_chunk(aTHX_ a,b,c,d,=
e,f,g,h,i,j,k)
++#define study_chunk(a,b,c,d,e,f,g,h,i,j,k,l)	S_study_chunk(aTHX_ a,b,c,=
d,e,f,g,h,i,j,k,l)
+ #  endif
+ #  if defined(PERL_IN_REGCOMP_C) || defined (PERL_IN_DUMP_C)
+ #define _invlist_dump(a,b,c,d)	Perl__invlist_dump(aTHX_ a,b,c,d)
+diff --git a/proto.h b/proto.h
+index 0f8feed..19ba2bd 100644
+--- a/proto.h
++++ b/proto.h
+@@ -5652,7 +5652,7 @@ PERL_STATIC_INLINE void	S_ssc_union(pTHX_ regnode_=
ssc *ssc, SV* const invlist, c
+ #define PERL_ARGS_ASSERT_SSC_UNION	\
+ 	assert(ssc); assert(invlist)
+ #endif
+-STATIC SSize_t	S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regnode *=
*scanp, SSize_t *minlenp, SSize_t *deltap, regnode *last, struct scan_dat=
a_t *data, I32 stopparen, U32 recursed_depth, regnode_ssc *and_withp, U32=
 flags, U32 depth);
++STATIC SSize_t	S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regnode *=
*scanp, SSize_t *minlenp, SSize_t *deltap, regnode *last, struct scan_dat=
a_t *data, I32 stopparen, U32 recursed_depth, regnode_ssc *and_withp, U32=
 flags, U32 depth, bool was_mutate_ok);
+ #define PERL_ARGS_ASSERT_STUDY_CHUNK	\
+ 	assert(pRExC_state); assert(scanp); assert(minlenp); assert(deltap); a=
ssert(last)
+ #endif
+diff --git a/regcomp.c b/regcomp.c
+index 34afb92..704dc13 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -106,6 +106,7 @@ typedef struct scan_frame {
+     regnode *next_regnode;      /* next node to process when last is re=
ached */
+     U32 prev_recursed_depth;
+     I32 stopparen;              /* what stopparen do we use */
++    bool in_gosub;              /* this or an outer frame is for GOSUB =
*/
+=20
+     struct scan_frame *this_prev_frame; /* this previous frame */
+     struct scan_frame *prev_frame;      /* previous frame */
+@@ -4428,7 +4429,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,
+ 			I32 stopparen,
+                         U32 recursed_depth,
+ 			regnode_ssc *and_withp,
+-			U32 flags, U32 depth)
++			U32 flags, U32 depth, bool was_mutate_ok)
+ 			/* scanp: Start here (read-write). */
+ 			/* deltap: Write maxlen-minlen here. */
+ 			/* last: Stop before this one. */
+@@ -4507,6 +4508,10 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, re=
gnode **scanp,
+                                    node length to get a real minimum (b=
ecause
+                                    the folded version may be shorter) *=
/
+ 	bool unfolded_multi_char =3D FALSE;
++        /* avoid mutating ops if we are anywhere within the recursed or
++         * enframed handling for a GOSUB: the outermost level will hand=
le it.
++         */
++        bool mutate_ok =3D was_mutate_ok && !(frame && frame->in_gosub)=
;
+ 	/* Peephole optimizer: */
+         DEBUG_STUDYDATA("Peep", data, depth, is_inf);
+         DEBUG_PEEP("Peep", scan, depth, flags);
+@@ -4517,7 +4522,8 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,
+          * parsing code, as each (?:..) is handled by a different invoc=
ation of
+          * reg() -- Yves
+          */
+-        JOIN_EXACT(scan,&min_subtract, &unfolded_multi_char, 0);
++        if (mutate_ok)
++            JOIN_EXACT(scan,&min_subtract, &unfolded_multi_char, 0);
+=20
+ 	/* Follow the next-chain of the current node and optimize
+ 	   away all the NOTHINGs from it.  */
+@@ -4567,7 +4573,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,
+             /* DEFINEP study_chunk() recursion */
+             (void)study_chunk(pRExC_state, &scan, &minlen,
+                               &deltanext, next, &data_fake, stopparen,
+-                              recursed_depth, NULL, f, depth+1);
++                              recursed_depth, NULL, f, depth+1, mutate_=
ok);
+=20
+             scan =3D next;
+         } else
+@@ -4635,7 +4641,8 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,
+                     /* recurse study_chunk() for each BRANCH in an alte=
rnation */
+ 		    minnext =3D study_chunk(pRExC_state, &scan, minlenp,
+                                       &deltanext, next, &data_fake, sto=
pparen,
+-                                      recursed_depth, NULL, f, depth+1)=
;
++                                      recursed_depth, NULL, f, depth+1,
++                                      mutate_ok);
+=20
+ 		    if (min1 > minnext)
+ 			min1 =3D minnext;
+@@ -4702,9 +4709,10 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, re=
gnode **scanp,
+ 		    }
+ 		}
+=20
+-                if (PERL_ENABLE_TRIE_OPTIMISATION &&
+-                        OP( startbranch ) =3D=3D BRANCH )
+-                {
++                if (PERL_ENABLE_TRIE_OPTIMISATION
++                    && OP(startbranch) =3D=3D BRANCH
++                    && mutate_ok
++                ) {
+ 		/* demq.
+=20
+                    Assuming this was/is a branch we are dealing with: '=
scan'
+@@ -5159,6 +5167,9 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,
+                 newframe->stopparen =3D stopparen;
+                 newframe->prev_recursed_depth =3D recursed_depth;
+                 newframe->this_prev_frame=3D frame;
++                newframe->in_gosub =3D (
++                    (frame && frame->in_gosub) || OP(scan) =3D=3D GOSUB
++                );
+=20
+                 DEBUG_STUDYDATA("frame-new", data, depth, is_inf);
+                 DEBUG_PEEP("fnew", scan, depth, flags);
+@@ -5316,7 +5327,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,
+=20
+                 /* This temporary node can now be turned into EXACTFU, =
and
+                  * must, as regexec.c doesn't handle it */
+-                if (OP(next) =3D=3D EXACTFU_S_EDGE) {
++                if (OP(next) =3D=3D EXACTFU_S_EDGE && mutate_ok) {
+                     OP(next) =3D EXACTFU;
+                 }
+=20
+@@ -5324,8 +5335,9 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,
+                     &&   isALPHA_A(* STRING(next))
+                     && (         OP(next) =3D=3D EXACTFAA
+                         || (     OP(next) =3D=3D EXACTFU
+-                            && ! HAS_NONLATIN1_SIMPLE_FOLD_CLOSURE(* ST=
RING(next)))))
+-                {
++                            && ! HAS_NONLATIN1_SIMPLE_FOLD_CLOSURE(* ST=
RING(next))))
++                    &&   mutate_ok
++                ) {
+                     /* These differ in just one bit */
+                     U8 mask =3D ~ ('A' ^ 'a');
+=20
+@@ -5412,7 +5424,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,
+                                   (mincount =3D=3D 0
+                                    ? (f & ~SCF_DO_SUBSTR)
+                                    : f)
+-                                  ,depth+1);
++                                  , depth+1, mutate_ok);
+=20
+ 		if (flags & SCF_DO_STCLASS)
+ 		    data->start_class =3D oclass;
+@@ -5478,7 +5490,9 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,
+ 		if (  OP(oscan) =3D=3D CURLYX && data
+ 		      && data->flags & SF_IN_PAR
+ 		      && !(data->flags & SF_HAS_EVAL)
+-		      && !deltanext && minnext =3D=3D 1 ) {
++		      && !deltanext && minnext =3D=3D 1
++                      && mutate_ok
++                ) {
+ 		    /* Try to optimize to CURLYN.  */
+ 		    regnode *nxt =3D NEXTOPER(oscan) + EXTRA_STEP_2ARGS;
+ 		    regnode * const nxt1 =3D nxt;
+@@ -5528,10 +5542,10 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, r=
egnode **scanp,
+ 		      && !(data->flags & SF_HAS_EVAL)
+ 		      && !deltanext	/* atom is fixed width */
+ 		      && minnext !=3D 0	/* CURLYM can't handle zero width */
+-
+                          /* Nor characters whose fold at run-time may b=
e
+                           * multi-character */
+                       && ! (RExC_seen & REG_UNFOLDED_MULTI_SEEN)
++                      && mutate_ok
+ 		) {
+ 		    /* XXXX How to optimize if data =3D=3D 0? */
+ 		    /* Optimize to a simpler form.  */
+@@ -5584,7 +5598,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,
+                         /* recurse study_chunk() on optimised CURLYX =3D=
> CURLYM */
+ 			study_chunk(pRExC_state, &nxt1, minlenp, &deltanext, nxt,
+                                     NULL, stopparen, recursed_depth, NU=
LL, 0,
+-                                    depth+1);
++                                    depth+1, mutate_ok);
+ 		    }
+ 		    else
+ 			oscan->flags =3D 0;
+@@ -5993,7 +6007,8 @@ Perl_re_printf( aTHX_  "LHS=3D%" UVuf " RHS=3D%" U=
Vuf "\n",
+                 /* recurse study_chunk() for lookahead body */
+                 minnext =3D study_chunk(pRExC_state, &nscan, minlenp, &=
deltanext,
+                                       last, &data_fake, stopparen,
+-                                      recursed_depth, NULL, f, depth+1)=
;
++                                      recursed_depth, NULL, f, depth+1,
++                                      mutate_ok);
+                 if (scan->flags) {
+                     if (   deltanext < 0
+                         || deltanext > (I32) U8_MAX
+@@ -6098,7 +6113,7 @@ Perl_re_printf( aTHX_  "LHS=3D%" UVuf " RHS=3D%" U=
Vuf "\n",
+                 *minnextp =3D study_chunk(pRExC_state, &nscan, minnextp=
,
+                                         &deltanext, last, &data_fake,
+                                         stopparen, recursed_depth, NULL=
,
+-                                        f, depth+1);
++                                        f, depth+1, mutate_ok);
+                 if (scan->flags) {
+                     assert(0);  /* This code has never been tested sinc=
e this
+                                    is normally not compiled */
+@@ -6266,7 +6281,8 @@ Perl_re_printf( aTHX_  "LHS=3D%" UVuf " RHS=3D%" U=
Vuf "\n",
+                         /* optimise study_chunk() for TRIE */
+                         minnext =3D study_chunk(pRExC_state, &scan, min=
lenp,
+                             &deltanext, (regnode *)nextbranch, &data_fa=
ke,
+-                            stopparen, recursed_depth, NULL, f, depth+1=
);
++                            stopparen, recursed_depth, NULL, f, depth+1=
,
++                            mutate_ok);
+                     }
+                     if (nextbranch && PL_regkind[OP(nextbranch)]=3D=3DB=
RANCH)
+                         nextbranch=3D regnext((regnode*)nextbranch);
+@@ -8052,7 +8068,7 @@ Perl_re_op_compile(pTHX_ SV ** const patternp, int=
 pat_count,
+             &data, -1, 0, NULL,
+             SCF_DO_SUBSTR | SCF_WHILEM_VISITED_POS | stclass_flag
+                           | (restudied ? SCF_TRIE_DOING_RESTUDY : 0),
+-            0);
++            0, TRUE);
+=20
+=20
+         CHECK_RESTUDY_GOTO_butfirst(LEAVE_with_name("study_chunk"));
+@@ -8181,7 +8197,7 @@ Perl_re_op_compile(pTHX_ SV ** const patternp, int=
 pat_count,
+             SCF_DO_STCLASS_AND|SCF_WHILEM_VISITED_POS|(restudied
+                                                       ? SCF_TRIE_DOING_=
RESTUDY
+                                                       : 0),
+-            0);
++            0, TRUE);
+=20
+         CHECK_RESTUDY_GOTO_butfirst(NOOP);
+=20
+diff --git a/t/re/pat.t b/t/re/pat.t
+index 6a868f4..2869b58 100644
+--- a/t/re/pat.t
++++ b/t/re/pat.t
+@@ -25,7 +25,7 @@ BEGIN {
+ skip_all('no re module') unless defined &DynaLoader::boot_DynaLoader;
+ skip_all_without_unicode_tables();
+=20
+-plan tests =3D> 864;  # Update this when adding/deleting tests.
++plan tests =3D> 873;  # Update this when adding/deleting tests.
+=20
+ run_tests() unless caller;
+=20
+@@ -2115,6 +2115,30 @@ x{0c!}\;\;=C3=AE=C3=A7=C3=BF =00=7F/0f/!=00F=05=00=
=00/;=C3=AE=C3=A7=C3=BF=C3=B9\Q=00=01=00=00x=10=C3=BF=C3=BF=C3=BF=C3=BF=00=
=00=00=C3=B9=00=00=00=7F`x{0c!}=01;=00=00=00=C3=B9\Q
+         like(runperl(prog =3D> "$s", stderr =3D> 1), qr/Unmatched \(/);
+    }
+=20
++    # gh16947: test regexp corruption (GOSUB)
++    {
++        fresh_perl_is(q{
++            'xy' =3D~ /x(?0)|x(?|y|y)/ && print 'ok'
++        }, 'ok', {}, 'gh16947: test regexp corruption (GOSUB)');
++    }
++    # gh16947: test fix doesn't break SUSPEND
++    {
++        fresh_perl_is(q{ 'sx' =3D~ m{ss++}i; print 'ok' },
++                'ok', {}, "gh16947: test fix doesn't break SUSPEND");
++    }
++
++    # gh17743: more regexp corruption via GOSUB
++    {
++        fresh_perl_is(q{
++            "0" =3D~ /((0(?0)|000(?|0000|0000)(?0))|)/; print "ok"
++        }, 'ok', {}, 'gh17743: test regexp corruption (1)');
++
++        fresh_perl_is(q{
++            "000000000000" =3D~ /(0(())(0((?0)())|000(?|\x{ef}\x{bf}\x{=
bd}|\x{ef}\x{bf}\x{bd}))|)/;
++            print "ok"
++        }, 'ok', {}, 'gh17743: test regexp corruption (2)');
++    }
++
+ } # End of sub run_tests
+=20
+ 1;
+--=20
+2.24.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-dev=
tools/perl/perl_5.30.1.bb
index ba9424c876..b9c9944341 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.ta=
r.gz;name=3Dperl \
            file://determinism.patch  \
            file://racefix.patch \
            file://CVE-2020-10543.patch \
+           file://CVE-2020-12723.patch \
            "
 SRC_URI_append_class-native =3D " \
            file://perl-configpm-switch.patch \
--=20
2.24.1

