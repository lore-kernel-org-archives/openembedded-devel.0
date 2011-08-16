Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QtPRN-0001du-Lg
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 21:36:46 +0200
Received: by yxi19 with SMTP id 19so208846yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 12:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=z2QqBo1+eN8rQEqdMW0U6TVMiZf4Spsf4lVjR+ArQ3I=;
	b=sRfJ44Jv4V43eo/9Ekt+mi5Gy1OZopqDNFuYnCGUcS3PpOvyiZLwgpsYMXxNYunr0P
	HeGDNXSqqIP7jJqMu+r47P7nhp+cDY5VkfkgmcE1xvrwpWGNuH74SyxHc4m8PfFVM7n7
	6QKl6KkJDP35IbDxsw/Hiv3wlV/42/u3aM1LE=
MIME-Version: 1.0
Received: by 10.236.154.199 with SMTP id h47mr322937yhk.162.1313523127504;
	Tue, 16 Aug 2011 12:32:07 -0700 (PDT)
Received: by 10.236.106.100 with HTTP; Tue, 16 Aug 2011 12:32:07 -0700 (PDT)
Date: Tue, 16 Aug 2011 15:32:07 -0400
Message-ID: <CAOd_LFx5+NyXY4cTZ76yfccaFea8_WsFm2t_ZnkLk1xKD9Xzyw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: error building PXA270 target with oe-core/angstrom
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
X-List-Received-Date: Tue, 16 Aug 2011 19:36:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Has anyone build oe-core/angstrom for a PXA270 target recently?  I
tried spitz, and am getting the following:

Thanks,
Cliff

I. -I. -I/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/work-shared/gcc-4.5-r40+svnr176640/gcc-4_5-branch/gcc
-I/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/work-shared/gcc-4.5-r40+svnr176640/gcc-4_5-branch/gcc/.
-I/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/work-shared/gcc-4.5-r40+svnr176640/gcc-4_5-branch/gcc/../include
-I/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/work-shared/gcc-4.5-r40+svnr176640/gcc-4_5-branch/gcc/../libcpp/include
-I/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/work-shared/gcc-4.5-r40+svnr176640/gcc-4_5-branch/gcc/../libdecnumber
-I/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/work-shared/gcc-4.5-r40+svnr176640/gcc-4_5-branch/gcc/../libdecnumber/dpd
-I../libdecnumber   -I/usr/include/libelf  -g0
-finhibit-size-directive -fno-inline -fno-exceptions
-fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize
-fno-stack-protector -Dinhibit_libc' >> tmp-libgcc.mvars
| echo CRTSTUFF_T_CFLAGS = '' >> tmp-libgcc.mvars
| echo CRTSTUFF_T_CFLAGS_S = ' -fPIC' >> tmp-libgcc.mvars
| echo TARGET_SYSTEM_ROOT =
'/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/spitz'
>> tmp-libgcc.mvars
| mv tmp-libgcc.mvars libgcc.mvars
| rm -rf libbackend.a
| ar rc libbackend.a insn-attrtab.o insn-automata.o insn-emit.o
insn-extract.o insn-modes.o insn-opinit.o insn-output.o insn-peep.o
insn-preds.o insn-recog.o ggc-page.o alias.o alloc-pool.o
auto-inc-dec.o bb-reorder.o bitmap.o bt-load.o builtins.o
caller-save.o calls.o cfg.o cfganal.o cfgbuild.o cfgcleanup.o
cfgexpand.o cfghooks.o cfglayout.o cfgloop.o cfgloopanal.o
cfgloopmanip.o cfgrtl.o combine.o combine-stack-adj.o convert.o
coverage.o cse.o cselib.o dbxout.o dbgcnt.o dce.o ddg.o debug.o
df-byte-scan.o df-core.o df-problems.o df-scan.o dfp.o diagnostic.o
dojump.o dominance.o domwalk.o double-int.o dse.o dwarf2asm.o
dwarf2out.o ee.o ebitmap.o emit-rtl.o et-forest.o except.o explow.o
expmed.o expr.o final.o fixed-value.o fold-const.o function.o fwprop.o
gcse.o genrtl.o ggc-common.o gimple.o gimple-iterator.o gimple-low.o
gimple-pretty-print.o gimplify.o graph.o graphds.o graphite.o
graphite-blocking.o graphite-clast-to-gimple.o graphite-dependences.o
graphite-interchange.o graphite-poly.o graphite-ppl.o
graphite-scop-detection.o graphite-sese-to-poly.o gtype-desc.o
haifa-sched.o hooks.o ifcvt.o init-regs.o integrate.o intl.o ira.o
ira-build.o ira-costs.o ira-conflicts.o ira-color.o ira-emit.o
ira-lives.o jump.o lambda-code.o lambda-mat.o lambda-trans.o
langhooks.o lcm.o lists.o loop-doloop.o loop-init.o loop-invariant.o
loop-iv.o loop-unroll.o loop-unswitch.o lower-subreg.o lto-cgraph.o
lto-streamer-in.o lto-streamer-out.o lto-section-in.o
lto-section-out.o lto-symtab.o lto-opts.o lto-streamer.o
lto-wpa-fixup.o lto-compress.o mcf.o mode-switching.o modulo-sched.o
omega.o omp-low.o optabs.o options.o opts-common.o opts.o params.o
passes.o plugin.o pointer-set.o postreload-gcse.o postreload.o
predict.o pretty-print.o print-rtl.o print-tree.o profile.o real.o
recog.o reg-stack.o regcprop.o reginfo.o regmove.o regrename.o
regstat.o reload.o reload1.o reorg.o resource.o rtl-error.o rtl.o
rtlanal.o rtlhooks.o sbitmap.o sched-deps.o sched-ebb.o sched-rgn.o
sched-vis.o sdbout.o sel-sched-ir.o sel-sched-dump.o sel-sched.o
sese.o simplify-rtx.o sparseset.o sreal.o stack-ptr-mod.o statistics.o
stmt.o stor-layout.o store-motion.o stringpool.o targhooks.o timevar.o
toplev.o tracer.o tree-affine.o tree-call-cdce.o tree-cfg.o
tree-cfgcleanup.o tree-chrec.o tree-complex.o tree-data-ref.o
tree-dfa.o tree-dump.o tree-eh.o tree-if-conv.o tree-into-ssa.o
tree-iterator.o tree-loop-distribution.o tree-loop-linear.o
tree-nested.o tree-nrv.o tree-object-size.o tree-optimize.o
tree-outof-ssa.o tree-parloops.o tree-phinodes.o tree-predcom.o
tree-pretty-print.o tree-profile.o tree-scalar-evolution.o tree-sra.o
tree-if-switch-conversion.o tree-switch-conversion.o
tree-ssa-address.o tree-ssa-alias.o tree-ssa-ccp.o tree-ssa-coalesce.o
tree-ssa-copy.o tree-ssa-copyrename.o tree-ssa-dce.o tree-ssa-dom.o
tree-ssa-dse.o tree-ssa-forwprop.o tree-ssa-ifcombine.o
tree-ssa-live.o tree-ssa-loop-ch.o tree-ssa-loop-im.o
tree-ssa-loop-ivcanon.o tree-ssa-loop-ivopts.o tree-ssa-loop-manip.o
tree-ssa-loop-niter.o tree-ssa-loop-prefetch.o
tree-ssa-loop-unswitch.o tree-ssa-loop.o tree-ssa-math-opts.o
tree-ssa-operands.o tree-ssa-phiopt.o tree-ssa-phiprop.o
tree-ssa-pre.o tree-ssa-propagate.o tree-ssa-reassoc.o
tree-ssa-sccvn.o tree-ssa-sink.o tree-ssa-structalias.o tree-ssa-ter.o
tree-ssa-threadedge.o tree-ssa-threadupdate.o tree-ssa-uncprop.o
tree-ssa.o tree-ssanames.o tree-stdarg.o tree-tailcall.o
tree-vect-generic.o tree-vect-patterns.o tree-vect-data-refs.o
tree-vect-stmts.o tree-vect-loop.o tree-vect-loop-manip.o
tree-vect-slp.o tree-vectorizer.o tree-vrp.o tree.o value-prof.o
var-tracking.o varasm.o varray.o vec.o version.o vmsdbgout.o web.o
xcoffout.o arm.o  host-linux.o cgraph.o cgraphbuild.o cgraphunit.o
cppdefault.o incpath.o ipa-cp.o ipa-inline.o ipa-prop.o
ipa-pure-const.o ipa-reference.o ipa-struct-reorg.o ipa-type-escape.o
ipa-utils.o ipa.o matrix-reorg.o prefix.o tree-inline.o
tree-nomudflap.o varpool.o
| ranlib  libbackend.a
| gcc  -isystem/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/include
-O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-format-attribute -pedantic -Wno-long-long
-Wno-variadic-macros -Wno-overlength-strings -Wold-style-definition
-Wc++-compat   -DHAVE_CONFIG_H
-L/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/lib
-Wl,-rpath-link,/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/lib
-Wl,-rpath,/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/lib
-Wl,-O1 -o cc1-dummy c-lang.o stub-objc.o attribs.o c-errors.o c-lex.o
c-pragma.o c-decl.o c-typeck.o c-convert.o c-aux-info.o c-common.o
c-opts.o c-format.o c-semantics.o c-ppoutput.o c-cppbuiltin.o
c-objc-common.o c-dump.o c-pch.o c-parser.o arm-c.o c-gimplify.o
tree-mudflap.o c-pretty-print.o c-omp.o \
|         dummy-checksum.o main.o  libbackend.a ../libcpp/libcpp.a
../libdecnumber/libdecnumber.a ../libcpp/libcpp.a
../libiberty/libiberty.a ../libdecnumber/libdecnumber.a    -lmpc
-lmpfr -lgmp -rdynamic -ldl  -L../zlib -lz -lelf
| gcc  -isystem/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/include
-O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-format-attribute -pedantic -Wno-long-long
-Wno-variadic-macros -Wno-overlength-strings -Wold-style-definition
-Wc++-compat   -DHAVE_CONFIG_H
-L/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/lib
-Wl,-rpath-link,/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/lib
-Wl,-rpath,/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/lib
-Wl,-O1 -o lto1 \
|               lto/lto-lang.o lto/lto.o lto/lto-elf.o attribs.o
main.o  libbackend.a ../libcpp/libcpp.a ../libdecnumber/libdecnumber.a
  -lmpc -lmpfr -lgmp -rdynamic -ldl  -L../zlib -lz -lelf
../libcpp/libcpp.a   ../libiberty/libiberty.a
../libdecnumber/libdecnumber.a  -lelf
| ../libcpp/libcpp.a(line-map.o): In function `linemap_check_files_exited':
| line-map.c:(.text+0xfa): undefined reference to `fprintf_unlocked'
| ../libcpp/libcpp.a(line-map.o): In function `linemap_add':
| line-map.c:(.text+0x258): undefined reference to `fprintf_unlocked'
| line-map.c:(.text+0x308): undefined reference to `fprintf_unlocked'
| ../libcpp/libcpp.a(symtab.o): In function `ht_dump_statistics':
| symtab.c:(.text+0x1cc): undefined reference to `fprintf_unlocked'
| symtab.c:(.text+0x218): undefined reference to `fprintf_unlocked'
| ../libcpp/libcpp.a(symtab.o):symtab.c:(.text+0x230): more undefined
references to `fprintf_unlocked' follow
| collect2: ld returned 1 exit status
| make[2]: *** [lto1] Error 1
| make[2]: *** Waiting for unfinished jobs....
| ../libcpp/libcpp.a(files.o): In function `validate_pch':
| files.c:(.text+0x1978): undefined reference to `fprintf_unlocked'
| ../libcpp/libcpp.a(line-map.o): In function `linemap_check_files_exited':
| line-map.c:(.text+0xfa): undefined reference to `fprintf_unlocked'
| ../libcpp/libcpp.a(line-map.o): In function `linemap_add':
| line-map.c:(.text+0x258): undefined reference to `fprintf_unlocked'
| line-map.c:(.text+0x308): undefined reference to `fprintf_unlocked'
| ../libcpp/libcpp.a(symtab.o): In function `ht_dump_statistics':
| symtab.c:(.text+0x1cc): undefined reference to `fprintf_unlocked'
| ../libcpp/libcpp.a(symtab.o):symtab.c:(.text+0x218): more undefined
references to `fprintf_unlocked' follow
| collect2: ld returned 1 exit status
| make[2]: *** [cc1-dummy] Error 1
| rm gfdl.pod cpp.pod gcc.pod gcov.pod fsf-funding.pod
| make[2]: Leaving directory
`/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r40+svnr176640/gcc-4_5-branch/build.x86_64-linux.arm-angstrom-linux-gnueabi/gcc'
| make[1]: *** [all-gcc] Error 2
| make[1]: Leaving directory
`/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r40+svnr176640/gcc-4_5-branch/build.x86_64-linux.arm-angstrom-linux-gnueabi'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
| ERROR: Function 'do_compile' failed (see
/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r40+svnr176640/temp/log.do_compile.22340
for further information)
NOTE: package gcc-cross-initial-4.5-r40+svnr176640: task do_compile: Failed

-- 
=================
http://bec-systems.com


