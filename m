Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAyzs-00084x-Rs
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 08:33:17 +0100
Received: by wera1 with SMTP id a1so2444106wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 00:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=G9IGASHLGfk5pIAgJciXlzH/oLWyYCW7ebsXNXcfL/A=;
	b=NmbURO8/d4AnIZ7xJMBHLehdJQfuaBk5APYwpzicLTe/zHJtDZK1Xm3gqX/bfilNGE
	V2+yEuY/X+5bhaH9fkB1p8d5lMIbgZi3UxCiP62c8qoVjr9h/WezBcvcLXZA5uM5ursp
	XxqSBSwcjH9VS2iRHsLkoEnQ4l8/0OYBpfh2svwtbci9n3qbpcFIF9QgMG+bkn9jjekJ
	BfGBxyAKHW5YZOapeYBxUpon8FaiUEnsYZDYmS1MWMtiwUrM3TXF/1PX67hllPUMIlBu
	JEKnIIKxLb+nb73RMUsfuxlYWE7IdQabwJy+Iv4FdmAuolVJf7/OHEnusk5OSPZf3Fp5
	4TEQ==
MIME-Version: 1.0
Received: by 10.180.95.197 with SMTP id dm5mr3912639wib.20.1332487461008;
	Fri, 23 Mar 2012 00:24:21 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm19547359wib.0.2012.03.23.00.24.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 00:24:20 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 08:24:14 +0100
Message-Id: <1332487454-14897-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQnIHL9w62SItu99CnSryrL8UABb2wc2XYPW+jaQUUN/HMrWd3nxQdTFGhUhTkwwbzphAaus
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][toolchain-layer][PATCH] toolchain-layer: move binutils and gcc from meta-oe into here
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
X-List-Received-Date: Fri, 23 Mar 2012 07:33:17 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../binutils-2.20.1/110-arm-eabi-conf.patch        |    0
 .../152_arm_branches_to_weak_symbols.patch         |    0
 .../binutils-2.20.1/200_elflink_%B_fixes.patch     |    0
 .../201_elflink_improve_noaddneeded_errors.patch   |    0
 .../202_elflink_noaddneeded_vs_weak.patch          |    0
 .../binutils-2.20.1/binutils-2.16.1-e300c2c3.patch |    0
 .../binutils-2.19.1-ld-sysroot.patch               |    0
 .../binutils-2.20.1/binutils-mips-pie.patch        |    0
 .../binutils/binutils-2.20.1/binutils-poison.patch |    0
 .../binutils-uclibc-100-uclibc-conf.patch          |    0
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |    0
 ...binutils-uclibc-300-006_better_file_error.patch |    0
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |    0
 .../binutils-uclibc-gas-needs-libm.patch           |    0
 .../binutils-x86_64_i386_biarch.patch              |    0
 .../binutils-2.20.1/libiberty_path_fix.patch       |    0
 .../binutils-2.20.1/libtool-2.4-update.patch       |    0
 .../binutils-2.20.1/libtool-rpath-fix.patch        |    0
 .../binutils/binutils-cross-canadian.inc           |    0
 .../binutils/binutils-cross-canadian_2.20.1.bb     |    0
 .../recipes-devtools/binutils/binutils-cross.inc   |    0
 .../binutils/binutils-cross_2.20.1.bb              |    0
 .../binutils/binutils-crosssdk_2.20.1.bb           |    0
 .../recipes-devtools/binutils/binutils.inc         |    0
 .../recipes-devtools/binutils/binutils_2.20.1.bb   |    0
 .../files/canadian-build-modules-configure.patch   |    0
 .../gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch      |    0
 .../gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch      |    0
 .../gcc/files/gcc-posix-open-fix.patch             |    0
 .../gcc/files/gcc4-mtune-compat.patch              |    0
 .../gcc/files/gfortran-4.3.x.patch                 |    0
 .../recipes-devtools/gcc/files/gfortran.patch      |    0
 .../gcc/files/pr22133-mingw-path-fixup.patch       |    0
 .../gcc/files/pr33281-mingw-host-fragment.patch    |    0
 ...35916-mingw-__USE_MINGW_ACCESS-everywhere.patch |    0
 .../recipes-devtools/gcc/gcc-4.5.inc               |    0
 .../gcc/gcc-4.5/100-uclibc-conf.patch              |    0
 .../gcc/gcc-4.5/602-sdk-libstdc++-includes.patch   |    0
 .../recipes-devtools/gcc/gcc-4.5/64bithack.patch   |    0
 .../gcc/gcc-4.5/740-sh-pr24836.patch               |    0
 .../gcc/gcc-4.5/800-arm-bigendian.patch            |    0
 .../gcc/gcc-4.5/904-flatten-switch-stmt-00.patch   |    0
 .../gcc/gcc-4.5/COLLECT_GCC_OPTIONS.patch          |    0
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |    0
 .../recipes-devtools/gcc/gcc-4.5/Makefile.in.patch |    0
 ...ismatch-between-conditions-of-an-IT-block.patch |    0
 .../gcc/gcc-4.5/arm-unbreak-eabi-armv4t.dpatch     |    0
 .../gcc/gcc-4.5/cache-amnesia.patch                |    0
 .../gcc/gcc-4.5/disable_relax_pic_calls_flag.patch |    0
 .../gcc-4.5/fedora/gcc43-c++-builtin-redecl.patch  |    0
 .../gcc/gcc-4.5/fedora/gcc43-cpp-pragma.patch      |    0
 .../gcc/gcc-4.5/fedora/gcc43-i386-libgomp.patch    |    0
 .../gcc/gcc-4.5/fedora/gcc43-ia64-libunwind.patch  |    0
 .../fedora/gcc43-java-debug-iface-type.patch       |    0
 .../gcc/gcc-4.5/fedora/gcc43-java-nomulti.patch    |    0
 .../gcc/gcc-4.5/fedora/gcc43-libgomp-speedup.patch |    0
 .../gcc/gcc-4.5/fedora/gcc43-ppc32-retaddr.patch   |    0
 .../gcc/gcc-4.5/fedora/gcc43-pr27898.patch         |    0
 .../gcc/gcc-4.5/fedora/gcc43-pr32139.patch         |    0
 .../gcc/gcc-4.5/fedora/gcc43-pr33763.patch         |    0
 .../gcc/gcc-4.5/fedora/gcc43-rh251682.patch        |    0
 .../gcc/gcc-4.5/fedora/gcc43-rh330771.patch        |    0
 .../gcc/gcc-4.5/fedora/gcc43-rh341221.patch        |    0
 .../gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch   |    0
 .../gcc/gcc-4.5/fortran-cross-compile-hack.patch   |    0
 .../gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patch           |    0
 .../gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch  |    0
 .../gcc/gcc-4.5/gcc-4.5.0_to_svn_162697.patch.bz2  |  Bin 6957305 -> 6957305 bytes
 .../gcc-4.5/gcc-arm-volatile-bitfield-fix.patch    |    0
 .../gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch    |    0
 .../gcc/gcc-4.5/gcc-flags-for-build.patch          |    0
 .../gcc/gcc-4.5/gcc-ice-hack.dpatch                |    0
 .../gcc/gcc-4.5/gcc-poison-dir-extend.patch        |    0
 .../gcc/gcc-4.5/gcc-poison-parameters.patch        |    0
 .../gcc-4.5/gcc-poison-system-directories.patch    |    0
 .../gcc/gcc-4.5/gcc-ppc-config-fix.patch           |    0
 .../gcc/gcc-4.5/gcc-pr43698-arm-rev-instr.patch    |    0
 .../gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch  |    0
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |    0
 .../gcc/gcc-4.5/gcc-with-linker-hash-style.patch   |    0
 .../gcc-4.5/gcc_revert_base_version_to_4.5.0.patch |    0
 .../libstdc++-emit-__cxa_end_cleanup-in-text.patch |    0
 .../gcc/gcc-4.5/libstdc++-pic.dpatch               |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99548.patch |    0
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99549.patch |    0
 .../gcc/gcc-4.5/mips64-nomultilib.patch            |    0
 .../gcc/gcc-4.5/more-epilogues.patch               |    0
 .../gcc/gcc-4.5/optional_libstdc.patch             |    0
 .../recipes-devtools/gcc/gcc-4.5/pr30961.dpatch    |    0
 .../recipes-devtools/gcc/gcc-4.5/pr35942.patch     |    0
 .../gcc/gcc-4.5/sh4-multilib.patch                 |    0
 .../gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch |    0
 .../gcc/gcc-4.5/zecke-no-host-includes.patch       |    0
 .../gcc/gcc-4.5/zecke-xgcc-cpp.patch               |    0
 .../gcc/gcc-4.6/linaro/fix_linaro_106872.patch     |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106744.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106746.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106747.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106750.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106751.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106753.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106754.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106755.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106814.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106815.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106816.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106817.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106818.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106819.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106820.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106821.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106825.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106826.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106828.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106829.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106830.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106831.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106832.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106833.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106834.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106836.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106839.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106840.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106841.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch    |    0
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch    |    0
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    0
 .../recipes-devtools/gcc/gcc-common-4.6.inc        |    0
 .../recipes-devtools/gcc/gcc-cross-canadian_4.5.bb |    0
 .../gcc/gcc-cross-canadian_4.6.bbappend            |    0
 .../recipes-devtools/gcc/gcc-cross-initial_4.5.bb  |    0
 .../gcc/gcc-cross-initial_4.6.bbappend             |    0
 .../gcc/gcc-cross-intermediate_4.5.bb              |    0
 .../gcc/gcc-cross-intermediate_4.6.bbappend        |    0
 .../recipes-devtools/gcc/gcc-cross_4.5.bb          |    0
 .../recipes-devtools/gcc/gcc-cross_4.6.bbappend    |    0
 .../gcc/gcc-crosssdk-initial_4.5.bb                |    0
 .../gcc/gcc-crosssdk-initial_4.6.bbappend          |    0
 .../gcc/gcc-crosssdk-intermediate_4.5.bb           |    0
 .../gcc/gcc-crosssdk-intermediate_4.6.bbappend     |    0
 .../recipes-devtools/gcc/gcc-crosssdk_4.5.bb       |    0
 .../recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend |    0
 .../recipes-devtools/gcc/gcc-runtime_4.5.bb        |    0
 .../recipes-devtools/gcc/gcc-runtime_4.6.bbappend  |    0
 .../recipes-devtools/gcc/gcc_4.5.bb                |    0
 .../recipes-devtools/gcc/gcc_4.6.bbappend          |    0
 .../recipes-devtools/gcc/libgcc_4.5.bb             |    0
 .../recipes-devtools/gcc/libgcc_4.6.bbappend       |    0
 382 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/binutils-2.16.1-e300c2c3.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/binutils-mips-pie.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/binutils-poison.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-100-uclibc-conf.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-001_ld_makefile_patch.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-006_better_file_error.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-012_check_ldrunpath_length.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-gas-needs-libm.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/binutils-x86_64_i386_biarch.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/libiberty_path_fix.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/libtool-2.4-update.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-2.20.1/libtool-rpath-fix.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-cross-canadian.inc (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-cross-canadian_2.20.1.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-cross.inc (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-cross_2.20.1.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils-crosssdk_2.20.1.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils.inc (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/binutils/binutils_2.20.1.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/files/canadian-build-modules-configure.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/files/gcc-posix-open-fix.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/files/gcc4-mtune-compat.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/files/gfortran-4.3.x.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/files/gfortran.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/files/pr33281-mingw-host-fragment.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/files/pr35916-mingw-__USE_MINGW_ACCESS-everywhere.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5.inc (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/100-uclibc-conf.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/602-sdk-libstdc++-includes.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/64bithack.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/740-sh-pr24836.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/800-arm-bigendian.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/904-flatten-switch-stmt-00.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/COLLECT_GCC_OPTIONS.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/Makefile.in.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/arm-unbreak-eabi-armv4t.dpatch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/cache-amnesia.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/disable_relax_pic_calls_flag.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-c++-builtin-redecl.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-cpp-pragma.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-i386-libgomp.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ia64-libunwind.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-debug-iface-type.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-nomulti.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-libgomp-speedup.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ppc32-retaddr.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr27898.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr32139.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr33763.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh251682.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh330771.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh341221.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/fortran-cross-compile-hack.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-4.5.0_to_svn_162697.patch.bz2 (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-flags-for-build.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-ice-hack.dpatch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-poison-dir-extend.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-poison-parameters.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-poison-system-directories.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-pr43698-arm-rev-instr.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-uclibc-locale-ctype_touplow_t.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc-with-linker-hash-style.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/gcc_revert_base_version_to_4.5.0.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/libstdc++-emit-__cxa_end_cleanup-in-text.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/libstdc++-pic.dpatch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99548.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99549.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/mips64-nomultilib.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/more-epilogues.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/optional_libstdc.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/pr30961.dpatch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/pr35942.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/sh4-multilib.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/zecke-no-host-includes.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.5/zecke-xgcc-cpp.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106872.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106744.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106746.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106747.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106750.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106751.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106753.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106754.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106755.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106814.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106815.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106816.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106817.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106818.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106819.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106820.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106821.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106825.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106826.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106828.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106829.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106830.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106831.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106832.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106833.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106834.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106836.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106839.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106840.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106841.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-common-4.6.inc (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-cross-initial_4.5.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbappend (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-cross_4.5.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-cross_4.6.bbappend (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bbappend (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-crosssdk_4.5.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-runtime_4.5.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc-runtime_4.6.bbappend (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc_4.5.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/gcc_4.6.bbappend (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/libgcc_4.5.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-devtools/gcc/libgcc_4.6.bbappend (100%)

diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-2.16.1-e300c2c3.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-2.16.1-e300c2c3.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-2.16.1-e300c2c3.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-2.16.1-e300c2c3.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-mips-pie.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-mips-pie.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-mips-pie.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-mips-pie.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-poison.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-poison.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-poison.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-poison.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-100-uclibc-conf.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-100-uclibc-conf.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-100-uclibc-conf.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-100-uclibc-conf.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-001_ld_makefile_patch.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-001_ld_makefile_patch.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-001_ld_makefile_patch.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-001_ld_makefile_patch.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-006_better_file_error.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-006_better_file_error.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-006_better_file_error.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-006_better_file_error.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-012_check_ldrunpath_length.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-012_check_ldrunpath_length.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-012_check_ldrunpath_length.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-012_check_ldrunpath_length.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-gas-needs-libm.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-gas-needs-libm.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-gas-needs-libm.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-gas-needs-libm.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-x86_64_i386_biarch.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-x86_64_i386_biarch.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-x86_64_i386_biarch.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/binutils-x86_64_i386_biarch.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/libiberty_path_fix.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/libiberty_path_fix.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/libiberty_path_fix.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/libiberty_path_fix.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/libtool-2.4-update.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/libtool-2.4-update.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/libtool-2.4-update.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/libtool-2.4-update.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/libtool-rpath-fix.patch b/toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/libtool-rpath-fix.patch
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-2.20.1/libtool-rpath-fix.patch
rename to toolchain-layer/recipes-devtools/binutils/binutils-2.20.1/libtool-rpath-fix.patch
diff --git a/meta-oe/recipes-devtools/binutils/binutils-cross-canadian.inc b/toolchain-layer/recipes-devtools/binutils/binutils-cross-canadian.inc
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-cross-canadian.inc
rename to toolchain-layer/recipes-devtools/binutils/binutils-cross-canadian.inc
diff --git a/meta-oe/recipes-devtools/binutils/binutils-cross-canadian_2.20.1.bb b/toolchain-layer/recipes-devtools/binutils/binutils-cross-canadian_2.20.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-cross-canadian_2.20.1.bb
rename to toolchain-layer/recipes-devtools/binutils/binutils-cross-canadian_2.20.1.bb
diff --git a/meta-oe/recipes-devtools/binutils/binutils-cross.inc b/toolchain-layer/recipes-devtools/binutils/binutils-cross.inc
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-cross.inc
rename to toolchain-layer/recipes-devtools/binutils/binutils-cross.inc
diff --git a/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb b/toolchain-layer/recipes-devtools/binutils/binutils-cross_2.20.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb
rename to toolchain-layer/recipes-devtools/binutils/binutils-cross_2.20.1.bb
diff --git a/meta-oe/recipes-devtools/binutils/binutils-crosssdk_2.20.1.bb b/toolchain-layer/recipes-devtools/binutils/binutils-crosssdk_2.20.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils-crosssdk_2.20.1.bb
rename to toolchain-layer/recipes-devtools/binutils/binutils-crosssdk_2.20.1.bb
diff --git a/meta-oe/recipes-devtools/binutils/binutils.inc b/toolchain-layer/recipes-devtools/binutils/binutils.inc
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils.inc
rename to toolchain-layer/recipes-devtools/binutils/binutils.inc
diff --git a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb b/toolchain-layer/recipes-devtools/binutils/binutils_2.20.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
rename to toolchain-layer/recipes-devtools/binutils/binutils_2.20.1.bb
diff --git a/meta-oe/recipes-devtools/gcc/files/canadian-build-modules-configure.patch b/toolchain-layer/recipes-devtools/gcc/files/canadian-build-modules-configure.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/files/canadian-build-modules-configure.patch
rename to toolchain-layer/recipes-devtools/gcc/files/canadian-build-modules-configure.patch
diff --git a/meta-oe/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch b/toolchain-layer/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch
rename to toolchain-layer/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch
diff --git a/meta-oe/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch b/toolchain-layer/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch
rename to toolchain-layer/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch
diff --git a/meta-oe/recipes-devtools/gcc/files/gcc-posix-open-fix.patch b/toolchain-layer/recipes-devtools/gcc/files/gcc-posix-open-fix.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/files/gcc-posix-open-fix.patch
rename to toolchain-layer/recipes-devtools/gcc/files/gcc-posix-open-fix.patch
diff --git a/meta-oe/recipes-devtools/gcc/files/gcc4-mtune-compat.patch b/toolchain-layer/recipes-devtools/gcc/files/gcc4-mtune-compat.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/files/gcc4-mtune-compat.patch
rename to toolchain-layer/recipes-devtools/gcc/files/gcc4-mtune-compat.patch
diff --git a/meta-oe/recipes-devtools/gcc/files/gfortran-4.3.x.patch b/toolchain-layer/recipes-devtools/gcc/files/gfortran-4.3.x.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/files/gfortran-4.3.x.patch
rename to toolchain-layer/recipes-devtools/gcc/files/gfortran-4.3.x.patch
diff --git a/meta-oe/recipes-devtools/gcc/files/gfortran.patch b/toolchain-layer/recipes-devtools/gcc/files/gfortran.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/files/gfortran.patch
rename to toolchain-layer/recipes-devtools/gcc/files/gfortran.patch
diff --git a/meta-oe/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.patch b/toolchain-layer/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.patch
rename to toolchain-layer/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.patch
diff --git a/meta-oe/recipes-devtools/gcc/files/pr33281-mingw-host-fragment.patch b/toolchain-layer/recipes-devtools/gcc/files/pr33281-mingw-host-fragment.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/files/pr33281-mingw-host-fragment.patch
rename to toolchain-layer/recipes-devtools/gcc/files/pr33281-mingw-host-fragment.patch
diff --git a/meta-oe/recipes-devtools/gcc/files/pr35916-mingw-__USE_MINGW_ACCESS-everywhere.patch b/toolchain-layer/recipes-devtools/gcc/files/pr35916-mingw-__USE_MINGW_ACCESS-everywhere.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/files/pr35916-mingw-__USE_MINGW_ACCESS-everywhere.patch
rename to toolchain-layer/recipes-devtools/gcc/files/pr35916-mingw-__USE_MINGW_ACCESS-everywhere.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5.inc
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/100-uclibc-conf.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/100-uclibc-conf.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/100-uclibc-conf.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/100-uclibc-conf.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/602-sdk-libstdc++-includes.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/602-sdk-libstdc++-includes.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/602-sdk-libstdc++-includes.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/602-sdk-libstdc++-includes.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/64bithack.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/64bithack.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/740-sh-pr24836.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/740-sh-pr24836.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/740-sh-pr24836.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/740-sh-pr24836.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/800-arm-bigendian.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/800-arm-bigendian.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/800-arm-bigendian.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/800-arm-bigendian.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/904-flatten-switch-stmt-00.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/904-flatten-switch-stmt-00.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/904-flatten-switch-stmt-00.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/904-flatten-switch-stmt-00.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/COLLECT_GCC_OPTIONS.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/COLLECT_GCC_OPTIONS.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/COLLECT_GCC_OPTIONS.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/Makefile.in.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/Makefile.in.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/Makefile.in.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/Makefile.in.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/arm-unbreak-eabi-armv4t.dpatch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/arm-unbreak-eabi-armv4t.dpatch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/arm-unbreak-eabi-armv4t.dpatch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/arm-unbreak-eabi-armv4t.dpatch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/cache-amnesia.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/cache-amnesia.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/cache-amnesia.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/cache-amnesia.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/disable_relax_pic_calls_flag.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/disable_relax_pic_calls_flag.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/disable_relax_pic_calls_flag.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/disable_relax_pic_calls_flag.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-c++-builtin-redecl.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-c++-builtin-redecl.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-c++-builtin-redecl.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-c++-builtin-redecl.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-cpp-pragma.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-cpp-pragma.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-cpp-pragma.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-cpp-pragma.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-i386-libgomp.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-i386-libgomp.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-i386-libgomp.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-i386-libgomp.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ia64-libunwind.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ia64-libunwind.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ia64-libunwind.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ia64-libunwind.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-debug-iface-type.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-debug-iface-type.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-debug-iface-type.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-debug-iface-type.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-nomulti.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-nomulti.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-nomulti.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-nomulti.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-libgomp-speedup.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-libgomp-speedup.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-libgomp-speedup.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-libgomp-speedup.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ppc32-retaddr.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ppc32-retaddr.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ppc32-retaddr.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ppc32-retaddr.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr27898.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr27898.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr27898.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr27898.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr32139.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr32139.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr32139.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr32139.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr33763.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr33763.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr33763.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr33763.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh251682.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh251682.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh251682.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh251682.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh330771.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh330771.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh330771.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh330771.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh341221.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh341221.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh341221.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh341221.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fortran-cross-compile-hack.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/fortran-cross-compile-hack.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/fortran-cross-compile-hack.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/fortran-cross-compile-hack.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.5.0_to_svn_162697.patch.bz2 b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-4.5.0_to_svn_162697.patch.bz2
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.5.0_to_svn_162697.patch.bz2
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-4.5.0_to_svn_162697.patch.bz2
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-flags-for-build.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-flags-for-build.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-flags-for-build.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-flags-for-build.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ice-hack.dpatch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-ice-hack.dpatch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ice-hack.dpatch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-ice-hack.dpatch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-dir-extend.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-poison-dir-extend.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-dir-extend.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-poison-dir-extend.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-parameters.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-poison-parameters.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-parameters.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-poison-parameters.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-system-directories.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-poison-system-directories.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-system-directories.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-poison-system-directories.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-pr43698-arm-rev-instr.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-pr43698-arm-rev-instr.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-pr43698-arm-rev-instr.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-pr43698-arm-rev-instr.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-uclibc-locale-ctype_touplow_t.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-uclibc-locale-ctype_touplow_t.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-uclibc-locale-ctype_touplow_t.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-uclibc-locale-ctype_touplow_t.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-with-linker-hash-style.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-with-linker-hash-style.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-with-linker-hash-style.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc-with-linker-hash-style.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc_revert_base_version_to_4.5.0.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc_revert_base_version_to_4.5.0.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc_revert_base_version_to_4.5.0.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/gcc_revert_base_version_to_4.5.0.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/libstdc++-emit-__cxa_end_cleanup-in-text.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/libstdc++-emit-__cxa_end_cleanup-in-text.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/libstdc++-emit-__cxa_end_cleanup-in-text.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/libstdc++-emit-__cxa_end_cleanup-in-text.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/libstdc++-pic.dpatch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/libstdc++-pic.dpatch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/libstdc++-pic.dpatch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/libstdc++-pic.dpatch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99548.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99548.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99548.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99548.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99549.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99549.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99549.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99549.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/mips64-nomultilib.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/mips64-nomultilib.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/mips64-nomultilib.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/mips64-nomultilib.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/more-epilogues.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/more-epilogues.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/more-epilogues.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/more-epilogues.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/optional_libstdc.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/optional_libstdc.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/optional_libstdc.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/optional_libstdc.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/pr30961.dpatch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/pr30961.dpatch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/pr30961.dpatch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/pr30961.dpatch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/pr35942.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/pr35942.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/pr35942.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/pr35942.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/sh4-multilib.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/sh4-multilib.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/sh4-multilib.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/sh4-multilib.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/zecke-no-host-includes.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/zecke-no-host-includes.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/zecke-no-host-includes.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/zecke-no-host-includes.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/zecke-xgcc-cpp.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.5/zecke-xgcc-cpp.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.5/zecke-xgcc-cpp.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.5/zecke-xgcc-cpp.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106872.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106872.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106872.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106872.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106744.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106744.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106744.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106744.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106746.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106746.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106746.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106746.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106747.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106747.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106747.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106747.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106750.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106750.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106750.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106750.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106751.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106751.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106751.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106751.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106753.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106753.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106753.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106753.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106754.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106754.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106754.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106754.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106755.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106755.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106755.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106755.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106814.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106814.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106814.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106814.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106815.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106815.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106815.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106815.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106816.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106816.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106816.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106816.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106817.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106817.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106817.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106817.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106818.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106818.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106818.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106818.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106819.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106819.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106819.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106819.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106820.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106820.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106820.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106820.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106821.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106821.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106821.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106821.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106825.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106825.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106825.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106825.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106826.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106826.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106826.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106826.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106828.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106828.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106828.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106828.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106829.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106829.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106829.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106829.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106830.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106830.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106830.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106830.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106831.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106831.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106831.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106831.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106832.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106832.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106832.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106832.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106833.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106833.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106833.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106833.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106834.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106834.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106834.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106834.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106836.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106836.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106836.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106836.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106839.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106839.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106839.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106839.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106840.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106840.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106840.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106840.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106841.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106841.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106841.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106841.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch
rename to toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/toolchain-layer/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
rename to toolchain-layer/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
diff --git a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc b/toolchain-layer/recipes-devtools/gcc/gcc-common-4.6.inc
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
rename to toolchain-layer/recipes-devtools/gcc/gcc-common-4.6.inc
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
rename to toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend
rename to toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross-initial_4.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb
rename to toolchain-layer/recipes-devtools/gcc/gcc-cross-initial_4.5.bb
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend b/toolchain-layer/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend
rename to toolchain-layer/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb
rename to toolchain-layer/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbappend b/toolchain-layer/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbappend
rename to toolchain-layer/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross_4.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb
rename to toolchain-layer/recipes-devtools/gcc/gcc-cross_4.5.bb
diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross_4.6.bbappend b/toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-cross_4.6.bbappend
rename to toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.bb
rename to toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.bb
diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend
rename to toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
rename to toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bbappend b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bbappend
rename to toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk_4.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.5.bb
rename to toolchain-layer/recipes-devtools/gcc/gcc-crosssdk_4.5.bb
diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend
rename to toolchain-layer/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb
rename to toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.5.bb
diff --git a/meta-oe/recipes-devtools/gcc/gcc-runtime_4.6.bbappend b/toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc-runtime_4.6.bbappend
rename to toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/gcc_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc_4.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc_4.5.bb
rename to toolchain-layer/recipes-devtools/gcc/gcc_4.5.bb
diff --git a/meta-oe/recipes-devtools/gcc/gcc_4.6.bbappend b/toolchain-layer/recipes-devtools/gcc/gcc_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/gcc_4.6.bbappend
rename to toolchain-layer/recipes-devtools/gcc/gcc_4.6.bbappend
diff --git a/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/libgcc_4.5.bb
rename to toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
diff --git a/meta-oe/recipes-devtools/gcc/libgcc_4.6.bbappend b/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bbappend
similarity index 100%
rename from meta-oe/recipes-devtools/gcc/libgcc_4.6.bbappend
rename to toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bbappend
-- 
1.7.2.5



