Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SAf65-0008JM-QB
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 11:18:22 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 5709AA628B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 11:09:21 +0100 (CET)
Date: Thu, 22 Mar 2012 11:09:20 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120322110920.469ecdf2@eb-e6520>
In-Reply-To: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
References: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [RFC][meta-oe][meta-toolchain][PATCH] meta-toolchain: populate with gcc and binutils from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 10:18:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 22 Mar 2012 11:01:39 +0100,
Koen Kooi <koen@dominion.thruhere.net> a =E9crit :

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Acked-by: Eric B=E9nard <eric@eukrea.com>
(but not yet tested)

> ---
>  COPYING.MIT =3D> meta-toolchain/COPYING.MIT          |    0
>  {meta-oe =3D> meta-toolchain}/README                 |    4 ++--
>  .../conf/layer.conf                                |    8 ++++----
>  .../binutils-2.20.1/110-arm-eabi-conf.patch        |    0
>  .../152_arm_branches_to_weak_symbols.patch         |    0
>  .../binutils-2.20.1/200_elflink_%B_fixes.patch     |    0
>  .../201_elflink_improve_noaddneeded_errors.patch   |    0
>  .../202_elflink_noaddneeded_vs_weak.patch          |    0
>  .../binutils-2.20.1/binutils-2.16.1-e300c2c3.patch |    0
>  .../binutils-2.19.1-ld-sysroot.patch               |    0
>  .../binutils-2.20.1/binutils-mips-pie.patch        |    0
>  .../binutils/binutils-2.20.1/binutils-poison.patch |    0
>  .../binutils-uclibc-100-uclibc-conf.patch          |    0
>  ...binutils-uclibc-300-001_ld_makefile_patch.patch |    0
>  ...binutils-uclibc-300-006_better_file_error.patch |    0
>  ...ils-uclibc-300-012_check_ldrunpath_length.patch |    0
>  .../binutils-uclibc-gas-needs-libm.patch           |    0
>  .../binutils-x86_64_i386_biarch.patch              |    0
>  .../binutils-2.20.1/libiberty_path_fix.patch       |    0
>  .../binutils-2.20.1/libtool-2.4-update.patch       |    0
>  .../binutils-2.20.1/libtool-rpath-fix.patch        |    0
>  .../binutils/binutils-cross-canadian.inc           |    0
>  .../binutils/binutils-cross-canadian_2.20.1.bb     |    0
>  .../recipes-devtools/binutils/binutils-cross.inc   |    0
>  .../binutils/binutils-cross_2.20.1.bb              |    0
>  .../binutils/binutils-crosssdk_2.20.1.bb           |    0
>  .../recipes-devtools/binutils/binutils.inc         |    0
>  .../recipes-devtools/binutils/binutils_2.20.1.bb   |    0
>  .../files/canadian-build-modules-configure.patch   |    0
>  .../gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.patch      |    0
>  .../gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.patch      |    0
>  .../gcc/files/gcc-posix-open-fix.patch             |    0
>  .../gcc/files/gcc4-mtune-compat.patch              |    0
>  .../gcc/files/gfortran-4.3.x.patch                 |    0
>  .../recipes-devtools/gcc/files/gfortran.patch      |    0
>  .../gcc/files/pr22133-mingw-path-fixup.patch       |    0
>  .../gcc/files/pr33281-mingw-host-fragment.patch    |    0
>  ...35916-mingw-__USE_MINGW_ACCESS-everywhere.patch |    0
>  .../recipes-devtools/gcc/gcc-4.5.inc               |    0
>  .../gcc/gcc-4.5/100-uclibc-conf.patch              |    0
>  .../gcc/gcc-4.5/602-sdk-libstdc++-includes.patch   |    0
>  .../recipes-devtools/gcc/gcc-4.5/64bithack.patch   |    0
>  .../gcc/gcc-4.5/740-sh-pr24836.patch               |    0
>  .../gcc/gcc-4.5/800-arm-bigendian.patch            |    0
>  .../gcc/gcc-4.5/904-flatten-switch-stmt-00.patch   |    0
>  .../gcc/gcc-4.5/COLLECT_GCC_OPTIONS.patch          |    0
>  .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |    0
>  .../recipes-devtools/gcc/gcc-4.5/Makefile.in.patch |    0
>  ...ismatch-between-conditions-of-an-IT-block.patch |    0
>  .../gcc/gcc-4.5/arm-unbreak-eabi-armv4t.dpatch     |    0
>  .../gcc/gcc-4.5/cache-amnesia.patch                |    0
>  .../gcc/gcc-4.5/disable_relax_pic_calls_flag.patch |    0
>  .../gcc-4.5/fedora/gcc43-c++-builtin-redecl.patch  |    0
>  .../gcc/gcc-4.5/fedora/gcc43-cpp-pragma.patch      |    0
>  .../gcc/gcc-4.5/fedora/gcc43-i386-libgomp.patch    |    0
>  .../gcc/gcc-4.5/fedora/gcc43-ia64-libunwind.patch  |    0
>  .../fedora/gcc43-java-debug-iface-type.patch       |    0
>  .../gcc/gcc-4.5/fedora/gcc43-java-nomulti.patch    |    0
>  .../gcc/gcc-4.5/fedora/gcc43-libgomp-speedup.patch |    0
>  .../gcc/gcc-4.5/fedora/gcc43-ppc32-retaddr.patch   |    0
>  .../gcc/gcc-4.5/fedora/gcc43-pr27898.patch         |    0
>  .../gcc/gcc-4.5/fedora/gcc43-pr32139.patch         |    0
>  .../gcc/gcc-4.5/fedora/gcc43-pr33763.patch         |    0
>  .../gcc/gcc-4.5/fedora/gcc43-rh251682.patch        |    0
>  .../gcc/gcc-4.5/fedora/gcc43-rh330771.patch        |    0
>  .../gcc/gcc-4.5/fedora/gcc43-rh341221.patch        |    0
>  .../gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch   |    0
>  .../gcc/gcc-4.5/fortran-cross-compile-hack.patch   |    0
>  .../gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patch           |    0
>  .../gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch  |    0
>  .../gcc/gcc-4.5/gcc-4.5.0_to_svn_162697.patch.bz2  |  Bin 6957305 -> 695=
7305 bytes
>  .../gcc-4.5/gcc-arm-volatile-bitfield-fix.patch    |    0
>  .../gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch    |    0
>  .../gcc/gcc-4.5/gcc-flags-for-build.patch          |    0
>  .../gcc/gcc-4.5/gcc-ice-hack.dpatch                |    0
>  .../gcc/gcc-4.5/gcc-poison-dir-extend.patch        |    0
>  .../gcc/gcc-4.5/gcc-poison-parameters.patch        |    0
>  .../gcc-4.5/gcc-poison-system-directories.patch    |    0
>  .../gcc/gcc-4.5/gcc-ppc-config-fix.patch           |    0
>  .../gcc/gcc-4.5/gcc-pr43698-arm-rev-instr.patch    |    0
>  .../gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch  |    0
>  .../gcc-uclibc-locale-ctype_touplow_t.patch        |    0
>  .../gcc/gcc-4.5/gcc-with-linker-hash-style.patch   |    0
>  .../gcc-4.5/gcc_revert_base_version_to_4.5.0.patch |    0
>  .../libstdc++-emit-__cxa_end_cleanup-in-text.patch |    0
>  .../gcc/gcc-4.5/libstdc++-pic.dpatch               |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99548.patch |    0
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99549.patch |    0
>  .../gcc/gcc-4.5/mips64-nomultilib.patch            |    0
>  .../gcc/gcc-4.5/more-epilogues.patch               |    0
>  .../gcc/gcc-4.5/optional_libstdc.patch             |    0
>  .../recipes-devtools/gcc/gcc-4.5/pr30961.dpatch    |    0
>  .../recipes-devtools/gcc/gcc-4.5/pr35942.patch     |    0
>  .../gcc/gcc-4.5/sh4-multilib.patch                 |    0
>  .../gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch |    0
>  .../gcc/gcc-4.5/zecke-no-host-includes.patch       |    0
>  .../gcc/gcc-4.5/zecke-xgcc-cpp.patch               |    0
>  .../gcc/gcc-4.6/linaro/fix_linaro_106872.patch     |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106744.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106746.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106747.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106750.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106751.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106753.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106754.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106755.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106814.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106815.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106816.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106817.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106818.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106819.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106820.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106821.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106825.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106826.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106828.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106829.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106830.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106831.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106832.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106833.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106834.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106836.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106839.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106840.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106841.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch    |    0
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch    |    0
>  .../gcc/gcc-4_6-branch-linaro-backports.inc        |    0
>  .../recipes-devtools/gcc/gcc-common-4.6.inc        |    0
>  .../recipes-devtools/gcc/gcc-cross-canadian_4.5.bb |    0
>  .../gcc/gcc-cross-canadian_4.6.bbappend            |    0
>  .../recipes-devtools/gcc/gcc-cross-initial_4.5.bb  |    0
>  .../gcc/gcc-cross-initial_4.6.bbappend             |    0
>  .../gcc/gcc-cross-intermediate_4.5.bb              |    0
>  .../gcc/gcc-cross-intermediate_4.6.bbappend        |    0
>  .../recipes-devtools/gcc/gcc-cross_4.5.bb          |    0
>  .../recipes-devtools/gcc/gcc-cross_4.6.bbappend    |    0
>  .../gcc/gcc-crosssdk-initial_4.5.bb                |    0
>  .../gcc/gcc-crosssdk-initial_4.6.bbappend          |    0
>  .../gcc/gcc-crosssdk-intermediate_4.5.bb           |    0
>  .../gcc/gcc-crosssdk-intermediate_4.6.bbappend     |    0
>  .../recipes-devtools/gcc/gcc-crosssdk_4.5.bb       |    0
>  .../recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend |    0
>  .../recipes-devtools/gcc/gcc-runtime_4.5.bb        |    0
>  .../recipes-devtools/gcc/gcc-runtime_4.6.bbappend  |    0
>  .../recipes-devtools/gcc/gcc_4.5.bb                |    0
>  .../recipes-devtools/gcc/gcc_4.6.bbappend          |    0
>  .../recipes-devtools/gcc/libgcc_4.5.bb             |    0
>  .../recipes-devtools/gcc/libgcc_4.6.bbappend       |    0
>  385 files changed, 6 insertions(+), 6 deletions(-)
>  copy COPYING.MIT =3D> meta-toolchain/COPYING.MIT (100%)
>  copy {meta-oe =3D> meta-toolchain}/README (90%)
>  copy {meta-multimedia =3D> meta-toolchain}/conf/layer.conf (82%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/110-arm-eabi-conf.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/152_arm_branches_to_weak_symbols.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/200_elflink_%B_fixes.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/201_elflink_improve_noaddneeded_errors.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/202_elflink_noaddneeded_vs_weak.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/binutils-2.16.1-e300c2c3.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/binutils-2.19.1-ld-sysroot.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/binutils-mips-pie.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/binutils-poison.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/binutils-uclibc-100-uclibc-conf.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/binutils-uclibc-300-001_ld_makefile_patch.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/binutils-uclibc-300-006_better_file_error.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/binutils-uclibc-300-012_check_ldrunpath_length.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/binutils-uclibc-gas-needs-libm.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/binutils-x86_64_i386_biarch.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/libiberty_path_fix.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/libtool-2.4-update.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-2.=
20.1/libtool-rpath-fix.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-cr=
oss-canadian.inc (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-cr=
oss-canadian_2.20.1.bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-cr=
oss.inc (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-cr=
oss_2.20.1.bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils-cr=
osssdk_2.20.1.bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils.in=
c (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/binutils/binutils_2.=
20.1.bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/files/canadian-b=
uild-modules-configure.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/files/gcc-4.3.3-=
fix-EXTRA_BUILD.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/files/gcc-4.3.x-=
fix-EXTRA_BUILD.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/files/gcc-posix-=
open-fix.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/files/gcc4-mtune=
-compat.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/files/gfortran-4=
.3.x.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/files/gfortran.p=
atch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/files/pr22133-mi=
ngw-path-fixup.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/files/pr33281-mi=
ngw-host-fragment.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/files/pr35916-mi=
ngw-__USE_MINGW_ACCESS-everywhere.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5.inc (100=
%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/100-ucli=
bc-conf.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/602-sdk-=
libstdc++-includes.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/64bithac=
k.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/740-sh-p=
r24836.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/800-arm-=
bigendian.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/904-flat=
ten-switch-stmt-00.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/COLLECT_=
GCC_OPTIONS.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/GPLUSPLU=
S_INCLUDE_DIR_with_sysroot.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/Makefile=
.in.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/arm-lib1=
funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/arm-unbr=
eak-eabi-armv4t.dpatch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/cache-am=
nesia.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/disable_=
relax_pic_calls_flag.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-c++-builtin-redecl.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-cpp-pragma.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-i386-libgomp.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-ia64-libunwind.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-java-debug-iface-type.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-java-nomulti.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-libgomp-speedup.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-ppc32-retaddr.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-pr27898.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-pr32139.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-pr33763.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-rh251682.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-rh330771.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc43-rh341221.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fedora/g=
cc45-no-add-needed.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/fortran-=
cross-compile-hack.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-4.0.=
2-e300c2c3.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-4.3.=
1-ARCH_FLAGS_FOR_TARGET.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-4.5.=
0_to_svn_162697.patch.bz2 (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-arm-=
volatile-bitfield-fix.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-armv=
4-pass-fix-v4bx-to-ld.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-flag=
s-for-build.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-ice-=
hack.dpatch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-pois=
on-dir-extend.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-pois=
on-parameters.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-pois=
on-system-directories.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-ppc-=
config-fix.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-pr43=
698-arm-rev-instr.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-scal=
ar-widening-pr45847.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-ucli=
bc-locale-ctype_touplow_t.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc-with=
-linker-hash-style.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/gcc_reve=
rt_base_version_to_4.5.0.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/libstdc+=
+-emit-__cxa_end_cleanup-in-text.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/libstdc+=
+-pic.dpatch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99297.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99298.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99299.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99300.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99301.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99302.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99303.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99304.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99305.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99306.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99307.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99308.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99310.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99312.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99313.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99314.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99315.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99316.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99318.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99319.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99320.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99321.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99322.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99323.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99324.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99325.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99326.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99327.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99332.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99335.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99336.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99337.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99338.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99339.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99340.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99341.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99342.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99343.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99344.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99345.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99346.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99348.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99349.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99350.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99351.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99352.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99353.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99354.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99355.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99356.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99357.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99358.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99359.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99360.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99361.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99363.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99364.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99365.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99366.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99367.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99368.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99369.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99371.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99372.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99373.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99374.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99375.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99376.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99377.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99378.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99379.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99380.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99381.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99383.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99384.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99385.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99388.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99391.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99392.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99393.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99395.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99396.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99397.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99398.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99402.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99403.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99404.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99405.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99406.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99407.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99408.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99409.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99410.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99411.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99412.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99413.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99415.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99416.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99417.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99418.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99419.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99420.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99421.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99423.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99424.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99425.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99426.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99429.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99432.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99433.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99434.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99435.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99436.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99437.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99439.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99440.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99441.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99442.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99443.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99444.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99449.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99450.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99451.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99452.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99453.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99454.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99455.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99456.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99457.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99464.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99465.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99466.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99468.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99473.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99474.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99475.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99478.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99479.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99480.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99483.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99486.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99487.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99488.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99489.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99494.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99495.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99498.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99502.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99503.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99504.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99506.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99507.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99510.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99511.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99514.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99516.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99519.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99521.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99522.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99523.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99524.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99525.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99528.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99529.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99530.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99531.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99532.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99533.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99534.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99536.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99537.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99540.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99548.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/linaro/g=
cc-4.5-linaro-r99549.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/mips64-n=
omultilib.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/more-epi=
logues.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/optional=
_libstdc.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/pr30961.=
dpatch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/pr35942.=
patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/sh4-mult=
ilib.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/use-defa=
ults.h-and-t-oe-in-B.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/zecke-no=
-host-includes.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.5/zecke-xg=
cc-cpp.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/f=
ix_linaro_106872.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106720.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106733.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106737.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106738.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106739.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106741.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106742.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106744.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106746.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106747.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106750.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106751.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106753.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106754.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106755.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106759.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106762.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106763.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106764.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106766.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106768.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106769.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106770.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106771.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106772.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106773.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106775.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106776.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106777.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106778.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106781.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106782.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106783.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106784.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106785.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106786.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106787.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106789.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106792.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106794.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106796.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106797.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106798.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106799.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106800.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106802.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106803.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106804.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106805.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106806.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106807.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106811.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106814.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106815.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106816.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106817.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106818.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106819.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106820.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106821.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106825.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106826.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106827.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106828.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106829.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106830.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106831.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106832.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106833.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106834.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106836.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106839.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106840.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106841.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106842.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106843.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106844.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106845.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106846.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106848.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106853.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106855.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106860.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106861.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106862.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106863.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106864.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106865.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106869.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106870.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106872.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106873.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106874.patch (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-4_6-branch-l=
inaro-backports.inc (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-common-4.6.i=
nc (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-cross-canadi=
an_4.5.bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-cross-canadi=
an_4.6.bbappend (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-cross-initia=
l_4.5.bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-cross-initia=
l_4.6.bbappend (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-cross-interm=
ediate_4.5.bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-cross-interm=
ediate_4.6.bbappend (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-cross_4.5.bb=
 (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-cross_4.6.bb=
append (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-crosssdk-ini=
tial_4.5.bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-crosssdk-ini=
tial_4.6.bbappend (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-crosssdk-int=
ermediate_4.5.bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-crosssdk-int=
ermediate_4.6.bbappend (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-crosssdk_4.5=
.bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-crosssdk_4.6=
.bbappend (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-runtime_4.5.=
bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc-runtime_4.6.=
bbappend (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc_4.5.bb (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/gcc_4.6.bbappend=
 (100%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/libgcc_4.5.bb (1=
00%)
>  copy {meta-oe =3D> meta-toolchain}/recipes-devtools/gcc/libgcc_4.6.bbapp=
end (100%)
>=20
> diff --git a/COPYING.MIT b/meta-toolchain/COPYING.MIT
> similarity index 100%
> copy from COPYING.MIT
> copy to meta-toolchain/COPYING.MIT
> diff --git a/meta-oe/README b/meta-toolchain/README
> similarity index 90%
> copy from meta-oe/README
> copy to meta-toolchain/README
> index ed14866..198565e 100644
> --- a/meta-oe/README
> +++ b/meta-toolchain/README
> @@ -4,9 +4,9 @@ URI: git://git.openembedded.org/openembedded-core
>  branch: master
>  revision: HEAD
> =20
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][meta-toolchain]' in the subject'
> =20
> -When sending single patches, please use something like 'git send-email -=
1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmeta-oe'
> +When sending single patches, please use something like 'git send-email -=
1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmeta-oe=
][meta-toolchain'
> =20
>  You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-oe/ to share your patches, this is preferred for patch sets co=
nsisting of more than one patch. Other services like gitorious, repo.or.cz =
or self hosted setups are of course accepted as well, 'git fetch <remote>' =
works the same on all of them. We recommend github because it is free, easy=
 to use, has been proven to be reliable and has a really good web GUI.
> =20
> diff --git a/meta-multimedia/conf/layer.conf b/meta-toolchain/conf/layer.=
conf
> similarity index 82%
> copy from meta-multimedia/conf/layer.conf
> copy to meta-toolchain/conf/layer.conf
> index 64a0a44..ca81eb1 100644
> --- a/meta-multimedia/conf/layer.conf
> +++ b/meta-toolchain/conf/layer.conf
> @@ -8,18 +8,18 @@
>  # the recipe contention so the order of directories in BBFILES does=20
>  # not matter.
> =20
> -# We have a conf and classes directory, append to BBPATH
> +# We have a conf directory, append to BBPATH
>  BBPATH .=3D ":${LAYERDIR}"
> =20
>  # We have a recipes directory, add to BBFILES
>  BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bba=
ppend"
> =20
> -BBFILE_COLLECTIONS +=3D "multimedia-layer"
> -BBFILE_PATTERN_multimedia-layer :=3D "^${LAYERDIR}/"
> +BBFILE_COLLECTIONS +=3D "toolchain-layer"
> +BBFILE_PATTERN_toolchain-layer :=3D "^${LAYERDIR}/"
> =20
>  # Define the priority for recipes (.bb files) from this layer,
>  # choosing carefully how this layer interacts with all of the
>  # other layers.
> =20
> -BBFILE_PRIORITY_multimedia-layer =3D "6"
> +BBFILE_PRIORITY_toolchain-layer =3D "6"
> =20
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-ea=
bi-conf.patch b/meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/11=
0-arm-eabi-conf.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-=
conf.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/110-arm-=
eabi-conf.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_br=
anches_to_weak_symbols.patch b/meta-toolchain/recipes-devtools/binutils/bin=
utils-2.20.1/152_arm_branches_to_weak_symbols.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branc=
hes_to_weak_symbols.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/152_arm_=
branches_to_weak_symbols.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflin=
k_%B_fixes.patch b/meta-toolchain/recipes-devtools/binutils/binutils-2.20.1=
/200_elflink_%B_fixes.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%=
B_fixes.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/200_elfl=
ink_%B_fixes.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflin=
k_improve_noaddneeded_errors.patch b/meta-toolchain/recipes-devtools/binuti=
ls/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_i=
mprove_noaddneeded_errors.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/201_elfl=
ink_improve_noaddneeded_errors.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflin=
k_noaddneeded_vs_weak.patch b/meta-toolchain/recipes-devtools/binutils/binu=
tils-2.20.1/202_elflink_noaddneeded_vs_weak.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_n=
oaddneeded_vs_weak.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/202_elfl=
ink_noaddneeded_vs_weak.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-2=
.16.1-e300c2c3.patch b/meta-toolchain/recipes-devtools/binutils/binutils-2.=
20.1/binutils-2.16.1-e300c2c3.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-2.16=
.1-e300c2c3.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/binutils=
-2.16.1-e300c2c3.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-2=
.19.1-ld-sysroot.patch b/meta-toolchain/recipes-devtools/binutils/binutils-=
2.20.1/binutils-2.19.1-ld-sysroot.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-2.19=
.1-ld-sysroot.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/binutils=
-2.19.1-ld-sysroot.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-m=
ips-pie.patch b/meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/bi=
nutils-mips-pie.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-mips=
-pie.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/binutils=
-mips-pie.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-p=
oison.patch b/meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/binu=
tils-poison.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-pois=
on.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/binutils=
-poison.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-u=
clibc-100-uclibc-conf.patch b/meta-toolchain/recipes-devtools/binutils/binu=
tils-2.20.1/binutils-uclibc-100-uclibc-conf.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-ucli=
bc-100-uclibc-conf.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/binutils=
-uclibc-100-uclibc-conf.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-u=
clibc-300-001_ld_makefile_patch.patch b/meta-toolchain/recipes-devtools/bin=
utils/binutils-2.20.1/binutils-uclibc-300-001_ld_makefile_patch.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-ucli=
bc-300-001_ld_makefile_patch.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/binutils=
-uclibc-300-001_ld_makefile_patch.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-u=
clibc-300-006_better_file_error.patch b/meta-toolchain/recipes-devtools/bin=
utils/binutils-2.20.1/binutils-uclibc-300-006_better_file_error.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-ucli=
bc-300-006_better_file_error.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/binutils=
-uclibc-300-006_better_file_error.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-u=
clibc-300-012_check_ldrunpath_length.patch b/meta-toolchain/recipes-devtool=
s/binutils/binutils-2.20.1/binutils-uclibc-300-012_check_ldrunpath_length.p=
atch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-ucli=
bc-300-012_check_ldrunpath_length.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/binutils=
-uclibc-300-012_check_ldrunpath_length.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-u=
clibc-gas-needs-libm.patch b/meta-toolchain/recipes-devtools/binutils/binut=
ils-2.20.1/binutils-uclibc-gas-needs-libm.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-ucli=
bc-gas-needs-libm.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/binutils=
-uclibc-gas-needs-libm.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-x=
86_64_i386_biarch.patch b/meta-toolchain/recipes-devtools/binutils/binutils=
-2.20.1/binutils-x86_64_i386_biarch.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-x86_=
64_i386_biarch.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/binutils=
-x86_64_i386_biarch.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/libiberty_=
path_fix.patch b/meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/l=
ibiberty_path_fix.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/libiberty_pat=
h_fix.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/libibert=
y_path_fix.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/libtool-2.=
4-update.patch b/meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/l=
ibtool-2.4-update.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/libtool-2.4-u=
pdate.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/libtool-=
2.4-update.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/libtool-rp=
ath-fix.patch b/meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/li=
btool-rpath-fix.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-2.20.1/libtool-rpath=
-fix.patch
> copy to meta-toolchain/recipes-devtools/binutils/binutils-2.20.1/libtool-=
rpath-fix.patch
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-cross-canadian.in=
c b/meta-toolchain/recipes-devtools/binutils/binutils-cross-canadian.inc
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-cross-canadian.inc
> copy to meta-toolchain/recipes-devtools/binutils/binutils-cross-canadian.=
inc
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-cross-canadian_2.=
20.1.bb b/meta-toolchain/recipes-devtools/binutils/binutils-cross-canadian_=
2.20.1.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-cross-canadian_2.20.=
1.bb
> copy to meta-toolchain/recipes-devtools/binutils/binutils-cross-canadian_=
2.20.1.bb
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-cross.inc b/meta-=
toolchain/recipes-devtools/binutils/binutils-cross.inc
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-cross.inc
> copy to meta-toolchain/recipes-devtools/binutils/binutils-cross.inc
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb b=
/meta-toolchain/recipes-devtools/binutils/binutils-cross_2.20.1.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb
> copy to meta-toolchain/recipes-devtools/binutils/binutils-cross_2.20.1.bb
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-crosssdk_2.20.1.b=
b b/meta-toolchain/recipes-devtools/binutils/binutils-crosssdk_2.20.1.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils-crosssdk_2.20.1.bb
> copy to meta-toolchain/recipes-devtools/binutils/binutils-crosssdk_2.20.1=
.bb
> diff --git a/meta-oe/recipes-devtools/binutils/binutils.inc b/meta-toolch=
ain/recipes-devtools/binutils/binutils.inc
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils.inc
> copy to meta-toolchain/recipes-devtools/binutils/binutils.inc
> diff --git a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb b/meta-=
toolchain/recipes-devtools/binutils/binutils_2.20.1.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
> copy to meta-toolchain/recipes-devtools/binutils/binutils_2.20.1.bb
> diff --git a/meta-oe/recipes-devtools/gcc/files/canadian-build-modules-co=
nfigure.patch b/meta-toolchain/recipes-devtools/gcc/files/canadian-build-mo=
dules-configure.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/files/canadian-build-modules-confi=
gure.patch
> copy to meta-toolchain/recipes-devtools/gcc/files/canadian-build-modules-=
configure.patch
> diff --git a/meta-oe/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUILD=
.patch b/meta-toolchain/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUIL=
D.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUILD.pa=
tch
> copy to meta-toolchain/recipes-devtools/gcc/files/gcc-4.3.3-fix-EXTRA_BUI=
LD.patch
> diff --git a/meta-oe/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUILD=
.patch b/meta-toolchain/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUIL=
D.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUILD.pa=
tch
> copy to meta-toolchain/recipes-devtools/gcc/files/gcc-4.3.x-fix-EXTRA_BUI=
LD.patch
> diff --git a/meta-oe/recipes-devtools/gcc/files/gcc-posix-open-fix.patch =
b/meta-toolchain/recipes-devtools/gcc/files/gcc-posix-open-fix.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/files/gcc-posix-open-fix.patch
> copy to meta-toolchain/recipes-devtools/gcc/files/gcc-posix-open-fix.patch
> diff --git a/meta-oe/recipes-devtools/gcc/files/gcc4-mtune-compat.patch b=
/meta-toolchain/recipes-devtools/gcc/files/gcc4-mtune-compat.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/files/gcc4-mtune-compat.patch
> copy to meta-toolchain/recipes-devtools/gcc/files/gcc4-mtune-compat.patch
> diff --git a/meta-oe/recipes-devtools/gcc/files/gfortran-4.3.x.patch b/me=
ta-toolchain/recipes-devtools/gcc/files/gfortran-4.3.x.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/files/gfortran-4.3.x.patch
> copy to meta-toolchain/recipes-devtools/gcc/files/gfortran-4.3.x.patch
> diff --git a/meta-oe/recipes-devtools/gcc/files/gfortran.patch b/meta-too=
lchain/recipes-devtools/gcc/files/gfortran.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/files/gfortran.patch
> copy to meta-toolchain/recipes-devtools/gcc/files/gfortran.patch
> diff --git a/meta-oe/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.=
patch b/meta-toolchain/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.=
patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/files/pr22133-mingw-path-fixup.pat=
ch
> copy to meta-toolchain/recipes-devtools/gcc/files/pr22133-mingw-path-fixu=
p.patch
> diff --git a/meta-oe/recipes-devtools/gcc/files/pr33281-mingw-host-fragme=
nt.patch b/meta-toolchain/recipes-devtools/gcc/files/pr33281-mingw-host-fra=
gment.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/files/pr33281-mingw-host-fragment.=
patch
> copy to meta-toolchain/recipes-devtools/gcc/files/pr33281-mingw-host-frag=
ment.patch
> diff --git a/meta-oe/recipes-devtools/gcc/files/pr35916-mingw-__USE_MINGW=
_ACCESS-everywhere.patch b/meta-toolchain/recipes-devtools/gcc/files/pr3591=
6-mingw-__USE_MINGW_ACCESS-everywhere.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/files/pr35916-mingw-__USE_MINGW_AC=
CESS-everywhere.patch
> copy to meta-toolchain/recipes-devtools/gcc/files/pr35916-mingw-__USE_MIN=
GW_ACCESS-everywhere.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-toolchain/re=
cipes-devtools/gcc/gcc-4.5.inc
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5.inc
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5.inc
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/100-uclibc-conf.patch b=
/meta-toolchain/recipes-devtools/gcc/gcc-4.5/100-uclibc-conf.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/100-uclibc-conf.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/100-uclibc-conf.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/602-sdk-libstdc++-inclu=
des.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/602-sdk-libstdc++-i=
ncludes.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/602-sdk-libstdc++-includes=
.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/602-sdk-libstdc++-inc=
ludes.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch b/meta-=
toolchain/recipes-devtools/gcc/gcc-4.5/64bithack.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/64bithack.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/740-sh-pr24836.patch b/=
meta-toolchain/recipes-devtools/gcc/gcc-4.5/740-sh-pr24836.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/740-sh-pr24836.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/740-sh-pr24836.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/800-arm-bigendian.patch=
 b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/800-arm-bigendian.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/800-arm-bigendian.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/800-arm-bigendian.pat=
ch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/904-flatten-switch-stmt=
-00.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/904-flatten-switch-=
stmt-00.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/904-flatten-switch-stmt-00=
.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/904-flatten-switch-st=
mt-00.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/COLLECT_GCC_OPTIONS.pat=
ch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/COLLECT_GCC_OPTIONS.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/COLLECT_GCC_OPTIONS.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/COLLECT_GCC_OPTIONS.p=
atch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_w=
ith_sysroot.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_I=
NCLUDE_DIR_with_sysroot.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_with=
_sysroot.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR=
_with_sysroot.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/Makefile.in.patch b/met=
a-toolchain/recipes-devtools/gcc/gcc-4.5/Makefile.in.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/Makefile.in.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/Makefile.in.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/arm-lib1funcs.as-fix-mi=
smatch-between-conditions-of-an-IT-block.patch b/meta-toolchain/recipes-dev=
tools/gcc/gcc-4.5/arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT=
-block.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/arm-lib1funcs.as-fix-misma=
tch-between-conditions-of-an-IT-block.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/arm-lib1funcs.as-fix-=
mismatch-between-conditions-of-an-IT-block.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/arm-unbreak-eabi-armv4t=
.dpatch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/arm-unbreak-eabi-armv=
4t.dpatch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/arm-unbreak-eabi-armv4t.dp=
atch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/arm-unbreak-eabi-armv=
4t.dpatch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/cache-amnesia.patch b/m=
eta-toolchain/recipes-devtools/gcc/gcc-4.5/cache-amnesia.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/cache-amnesia.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/cache-amnesia.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/disable_relax_pic_calls=
_flag.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/disable_relax_pic=
_calls_flag.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/disable_relax_pic_calls_fl=
ag.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/disable_relax_pic_cal=
ls_flag.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-c++-builti=
n-redecl.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-c=
++-builtin-redecl.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-c++-builtin-r=
edecl.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-c++-buil=
tin-redecl.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-cpp-pragma=
.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-cpp-pragm=
a.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-cpp-pragma.pa=
tch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-cpp-prag=
ma.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-i386-libgo=
mp.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-i386-li=
bgomp.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-i386-libgomp.=
patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-i386-lib=
gomp.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ia64-libun=
wind.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ia64-=
libunwind.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ia64-libunwin=
d.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ia64-lib=
unwind.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-debug=
-iface-type.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc4=
3-java-debug-iface-type.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-debug-if=
ace-type.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-deb=
ug-iface-type.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-nomul=
ti.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-no=
multi.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-nomulti.=
patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-nom=
ulti.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-libgomp-sp=
eedup.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-libg=
omp-speedup.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-libgomp-speed=
up.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-libgomp-=
speedup.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ppc32-reta=
ddr.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ppc32-=
retaddr.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ppc32-retaddr=
.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ppc32-re=
taddr.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr27898.pa=
tch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr27898.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr27898.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr27898.=
patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr32139.pa=
tch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr32139.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr32139.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr32139.=
patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr33763.pa=
tch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr33763.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr33763.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr33763.=
patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh251682.p=
atch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh251682.pa=
tch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh251682.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh251682=
.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh330771.p=
atch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh330771.pa=
tch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh330771.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh330771=
.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh341221.p=
atch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh341221.pa=
tch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh341221.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh341221=
.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-nee=
ded.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add=
-needed.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-needed=
.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-n=
eeded.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/fortran-cross-compile-h=
ack.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/fortran-cross-compi=
le-hack.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/fortran-cross-compile-hack=
.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/fortran-cross-compile=
-hack.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patc=
h b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-4.0.2-e300c2c3.pa=
tch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FO=
R_TARGET.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-4.3.1-ARCH=
_FLAGS_FOR_TARGET.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_T=
ARGET.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_=
FOR_TARGET.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.5.0_to_svn_162697=
.patch.bz2 b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-4.5.0_to_svn_1=
62697.patch.bz2
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-4.5.0_to_svn_162697.pa=
tch.bz2
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-4.5.0_to_svn_1626=
97.patch.bz2
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-arm-volatile-bitfie=
ld-fix.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-arm-volatile=
-bitfield-fix.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-arm-volatile-bitfield-=
fix.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-arm-volatile-bitf=
ield-fix.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-armv4-pass-fix-v4bx=
-to-ld.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-armv4-pass-f=
ix-v4bx-to-ld.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-armv4-pass-fix-v4bx-to=
-ld.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-armv4-pass-fix-v4=
bx-to-ld.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-flags-for-build.pat=
ch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-flags-for-build.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-flags-for-build.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-flags-for-build.p=
atch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ice-hack.dpatch b/m=
eta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-ice-hack.dpatch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ice-hack.dpatch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-ice-hack.dpatch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-dir-extend.p=
atch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-poison-dir-extend.pa=
tch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-dir-extend.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-poison-dir-extend=
.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-parameters.p=
atch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-poison-parameters.pa=
tch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-parameters.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-poison-parameters=
.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-system-direc=
tories.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-poison-syste=
m-directories.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-poison-system-director=
ies.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-poison-system-dir=
ectories.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patc=
h b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.pa=
tch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-pr43698-arm-rev-ins=
tr.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-pr43698-arm-rev-=
instr.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-pr43698-arm-rev-instr.=
patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-pr43698-arm-rev-i=
nstr.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-scalar-widening-pr4=
5847.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-scalar-widenin=
g-pr45847.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-scalar-widening-pr4584=
7.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-scalar-widening-p=
r45847.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-uclibc-locale-ctype=
_touplow_t.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-uclibc-l=
ocale-ctype_touplow_t.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-uclibc-locale-ctype_to=
uplow_t.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-uclibc-locale-cty=
pe_touplow_t.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-with-linker-hash-st=
yle.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-with-linker-has=
h-style.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-with-linker-hash-style=
.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc-with-linker-hash-=
style.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc_revert_base_version=
_to_4.5.0.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc_revert_ba=
se_version_to_4.5.0.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/gcc_revert_base_version_to=
_4.5.0.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/gcc_revert_base_versi=
on_to_4.5.0.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/libstdc++-emit-__cxa_en=
d_cleanup-in-text.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/libst=
dc++-emit-__cxa_end_cleanup-in-text.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/libstdc++-emit-__cxa_end_c=
leanup-in-text.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/libstdc++-emit-__cxa_=
end_cleanup-in-text.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/libstdc++-pic.dpatch b/=
meta-toolchain/recipes-devtools/gcc/gcc-4.5/libstdc++-pic.dpatch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/libstdc++-pic.dpatch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/libstdc++-pic.dpatch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99297.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99297.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r992=
97.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99297.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99298.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99298.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r992=
98.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99298.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99299.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99299.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r992=
99.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99299.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99300.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99300.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
00.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99300.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99301.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99301.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
01.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99301.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99302.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99302.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
02.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99302.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99303.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99303.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
03.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99303.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99304.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99304.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
04.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99304.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99305.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99305.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
05.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99305.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99306.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99306.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
06.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99306.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99307.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99307.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
07.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99307.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99308.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99308.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
08.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99308.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99310.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99310.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
10.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99310.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99312.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99312.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
12.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99312.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99313.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99313.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
13.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99313.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99314.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99314.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
14.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99314.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99315.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99315.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
15.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99315.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99316.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99316.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
16.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99316.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99318.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99318.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
18.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99318.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99319.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99319.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
19.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99319.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99320.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99320.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
20.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99320.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99321.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99321.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
21.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99321.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99322.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99322.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
22.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99322.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99323.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99323.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
23.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99323.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99324.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99324.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
24.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99324.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99325.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99325.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
25.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99325.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99326.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99326.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
26.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99326.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99327.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99327.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
27.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99327.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99332.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99332.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
32.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99332.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99335.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99335.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
35.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99335.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99336.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99336.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
36.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99336.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99337.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99337.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
37.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99337.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99338.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99338.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
38.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99338.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99339.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99339.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
39.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99339.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99340.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99340.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
40.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99340.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99341.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99341.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
41.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99341.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99342.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99342.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
42.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99342.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99343.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99343.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
43.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99343.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99344.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99344.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
44.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99344.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99345.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99345.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
45.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99345.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99346.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99346.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
46.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99346.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99348.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99348.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
48.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99348.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99349.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99349.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
49.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99349.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99350.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99350.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
50.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99350.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99351.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99351.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
51.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99351.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99352.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99352.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
52.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99352.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99353.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99353.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
53.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99353.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99354.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99354.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
54.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99354.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99355.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99355.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
55.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99355.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99356.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99356.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
56.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99356.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99357.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99357.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
57.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99357.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99358.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99358.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
58.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99358.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99359.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99359.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
59.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99359.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99360.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99360.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
60.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99360.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99361.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99361.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
61.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99361.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99363.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99363.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
63.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99363.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99364.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99364.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
64.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99364.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99365.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99365.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
65.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99365.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99366.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99366.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
66.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99366.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99367.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99367.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
67.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99367.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99368.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99368.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
68.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99368.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99369.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99369.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
69.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99369.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99371.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99371.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
71.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99371.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99372.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99372.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
72.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99372.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99373.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99373.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
73.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99373.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99374.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99374.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
74.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99374.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99375.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99375.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
75.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99375.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99376.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99376.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
76.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99376.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99377.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99377.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
77.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99377.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99378.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99378.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
78.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99378.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99379.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99379.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
79.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99379.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99380.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99380.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
80.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99380.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99381.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99381.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
81.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99381.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99383.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99383.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
83.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99383.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99384.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99384.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
84.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99384.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99385.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99385.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
85.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99385.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99388.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99388.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
88.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99388.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99391.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99391.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
91.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99391.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99392.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99392.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
92.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99392.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99393.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99393.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
93.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99393.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99395.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99395.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
95.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99395.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99396.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99396.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
96.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99396.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99397.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99397.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
97.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99397.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99398.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99398.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r993=
98.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99398.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99402.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99402.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
02.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99402.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99403.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99403.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
03.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99403.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99404.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99404.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
04.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99404.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99405.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99405.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
05.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99405.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99406.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99406.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
06.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99406.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99407.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99407.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
07.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99407.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99408.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99408.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
08.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99408.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99409.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99409.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
09.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99409.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99410.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99410.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
10.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99410.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99411.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99411.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
11.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99411.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99412.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99412.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
12.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99412.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99413.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99413.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
13.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99413.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99415.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99415.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
15.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99415.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99416.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99416.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
16.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99416.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99417.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99417.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
17.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99417.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99418.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99418.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
18.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99418.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99419.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99419.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
19.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99419.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99420.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99420.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
20.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99420.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99421.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99421.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
21.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99421.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99423.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99423.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
23.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99423.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99424.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99424.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
24.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99424.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99425.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99425.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
25.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99425.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99426.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99426.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
26.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99426.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99429.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99429.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
29.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99429.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99432.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99432.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
32.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99432.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99433.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99433.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
33.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99433.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99434.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99434.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
34.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99434.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99435.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99435.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
35.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99435.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99436.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99436.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
36.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99436.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99437.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99437.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
37.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99437.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99439.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99439.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
39.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99439.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99440.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99440.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
40.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99440.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99441.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99441.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
41.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99441.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99442.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99442.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
42.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99442.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99443.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99443.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
43.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99443.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99444.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99444.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
44.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99444.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99449.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99449.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
49.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99449.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99450.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99450.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
50.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99450.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99451.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99451.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
51.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99451.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99452.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99452.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
52.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99452.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99453.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99453.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
53.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99453.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99454.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99454.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
54.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99454.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99455.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99455.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
55.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99455.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99456.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99456.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
56.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99456.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99457.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99457.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
57.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99457.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99464.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99464.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
64.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99464.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99465.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99465.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
65.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99465.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99466.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99466.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
66.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99466.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99468.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99468.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
68.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99468.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99473.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99473.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
73.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99473.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99474.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99474.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
74.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99474.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99475.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99475.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
75.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99475.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99478.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99478.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
78.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99478.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99479.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99479.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
79.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99479.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99480.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99480.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
80.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99480.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99483.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99483.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
83.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99483.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99486.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99486.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
86.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99486.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99487.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99487.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
87.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99487.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99488.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99488.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
88.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99488.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99489.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99489.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
89.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99489.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99494.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99494.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
94.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99494.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99495.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99495.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
95.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99495.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99498.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99498.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r994=
98.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99498.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99502.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99502.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
02.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99502.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99503.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99503.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
03.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99503.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99504.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99504.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
04.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99504.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99506.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99506.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
06.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99506.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99507.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99507.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
07.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99507.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99510.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99510.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
10.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99510.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99511.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99511.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
11.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99511.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99514.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99514.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
14.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99514.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99516.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99516.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
16.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99516.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99519.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99519.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
19.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99519.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99521.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99521.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
21.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99521.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99522.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99522.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
22.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99522.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99523.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99523.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
23.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99523.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99524.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99524.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
24.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99524.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99525.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99525.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
25.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99525.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99528.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99528.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
28.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99528.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99529.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99529.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
29.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99529.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99530.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99530.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
30.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99530.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99531.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99531.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
31.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99531.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99532.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99532.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
32.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99532.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99533.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99533.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
33.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99533.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99534.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99534.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
34.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99534.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99536.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99536.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
36.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99536.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99537.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99537.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
37.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99537.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99540.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99540.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
40.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99540.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99548.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99548.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
48.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99548.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99549.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-li=
naro-r99549.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r995=
49.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro=
-r99549.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/mips64-nomultilib.patch=
 b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/mips64-nomultilib.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/mips64-nomultilib.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/mips64-nomultilib.pat=
ch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/more-epilogues.patch b/=
meta-toolchain/recipes-devtools/gcc/gcc-4.5/more-epilogues.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/more-epilogues.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/more-epilogues.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/optional_libstdc.patch =
b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/optional_libstdc.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/optional_libstdc.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/optional_libstdc.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/pr30961.dpatch b/meta-t=
oolchain/recipes-devtools/gcc/gcc-4.5/pr30961.dpatch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/pr30961.dpatch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/pr30961.dpatch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/pr35942.patch b/meta-to=
olchain/recipes-devtools/gcc/gcc-4.5/pr35942.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/pr35942.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/pr35942.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/sh4-multilib.patch b/me=
ta-toolchain/recipes-devtools/gcc/gcc-4.5/sh4-multilib.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/sh4-multilib.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/sh4-multilib.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe=
-in-B.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/use-defaults.h-an=
d-t-oe-in-B.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe-in=
-B.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-=
oe-in-B.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/zecke-no-host-includes.=
patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.5/zecke-no-host-includes.=
patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/zecke-no-host-includes.pat=
ch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/zecke-no-host-include=
s.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/zecke-xgcc-cpp.patch b/=
meta-toolchain/recipes-devtools/gcc/gcc-4.5/zecke-xgcc-cpp.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.5/zecke-xgcc-cpp.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.5/zecke-xgcc-cpp.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_10687=
2.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106=
872.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106872.p=
atch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106=
872.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106720.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106720.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
720.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106720.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106733.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106733.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
733.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106733.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106737.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106737.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
737.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106737.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106738.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106738.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
738.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106738.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106739.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106739.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
739.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106739.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106741.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106741.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
741.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106741.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106742.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106742.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
742.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106742.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106744.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106744.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
744.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106744.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106746.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106746.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
746.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106746.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106747.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106747.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
747.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106747.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106750.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106750.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
750.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106750.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106751.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106751.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
751.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106751.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106753.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106753.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
753.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106753.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106754.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106754.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
754.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106754.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106755.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106755.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
755.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106755.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106759.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106759.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
759.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106759.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106762.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106762.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
762.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106762.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106763.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106763.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
763.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106763.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106764.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106764.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
764.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106764.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106766.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106766.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
766.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106766.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106768.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106768.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
768.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106768.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106769.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106769.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
769.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106769.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106770.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106770.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
770.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106770.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106771.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106771.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
771.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106771.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106772.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106772.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
772.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106772.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106773.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106773.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
773.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106773.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106775.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106775.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
775.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106775.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106776.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106776.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
776.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106776.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106777.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106777.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
777.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106777.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106778.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106778.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
778.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106778.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106781.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106781.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
781.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106781.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106782.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106782.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
782.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106782.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106783.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106783.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
783.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106783.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106784.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106784.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
784.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106784.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106785.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106785.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
785.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106785.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106786.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106786.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
786.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106786.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106787.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106787.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
787.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106787.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106789.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106789.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
789.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106789.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106792.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106792.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
792.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106792.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106794.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106794.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
794.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106794.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106796.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106796.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
796.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106796.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106797.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106797.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
797.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106797.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106798.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106798.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
798.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106798.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106799.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106799.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
799.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106799.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106800.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106800.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
800.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106800.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106802.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106802.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
802.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106802.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106803.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106803.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
803.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106803.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106804.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106804.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
804.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106804.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106805.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106805.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
805.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106805.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106806.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106806.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
806.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106806.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106807.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106807.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
807.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106807.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106811.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106811.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
811.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106811.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106814.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106814.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
814.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106814.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106815.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106815.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
815.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106815.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106816.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106816.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
816.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106816.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106817.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106817.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
817.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106817.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106818.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106818.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
818.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106818.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106819.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106819.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
819.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106819.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106820.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106820.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
820.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106820.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106821.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106821.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
821.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106821.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106825.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106825.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
825.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106825.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106826.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106826.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
826.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106826.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106827.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106827.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
827.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106827.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106828.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106828.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
828.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106828.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106829.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106829.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
829.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106829.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106830.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106830.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
830.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106830.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106831.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106831.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
831.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106831.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106832.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106832.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
832.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106832.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106833.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106833.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
833.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106833.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106834.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106834.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
834.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106834.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106836.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106836.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
836.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106836.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106839.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106839.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
839.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106839.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106840.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106840.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
840.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106840.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106841.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106841.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
841.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106841.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106842.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106842.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
842.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106842.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106843.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106843.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
843.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106843.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106844.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106844.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
844.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106844.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106845.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106845.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
845.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106845.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106846.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106846.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
846.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106846.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106848.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106848.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
848.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106848.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106853.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106853.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
853.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106853.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106855.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106855.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
855.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106855.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106860.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106860.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
860.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106860.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106861.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106861.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
861.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106861.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106862.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106862.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
862.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106862.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106863.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106863.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
863.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106863.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106864.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106864.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
864.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106864.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106865.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106865.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
865.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106865.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106869.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106869.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
869.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106869.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106870.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106870.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
870.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106870.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106872.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106872.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
872.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106872.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106873.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106873.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
873.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106873.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106874.patch b/meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-l=
inaro-r106874.patch
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106=
874.patch
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106874.patch
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports=
.inc b/meta-toolchain/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.=
inc
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> copy to meta-toolchain/recipes-devtools/gcc/gcc-4_6-branch-linaro-backpor=
ts.inc
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc b/meta-toolc=
hain/recipes-devtools/gcc/gcc-common-4.6.inc
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
> copy to meta-toolchain/recipes-devtools/gcc/gcc-common-4.6.inc
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb b/met=
a-toolchain/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
> copy to meta-toolchain/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend=
 b/meta-toolchain/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend
> copy to meta-toolchain/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappe=
nd
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb b/meta=
-toolchain/recipes-devtools/gcc/gcc-cross-initial_4.5.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb
> copy to meta-toolchain/recipes-devtools/gcc/gcc-cross-initial_4.5.bb
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend =
b/meta-toolchain/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend
> copy to meta-toolchain/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb b=
/meta-toolchain/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb
> copy to meta-toolchain/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbap=
pend b/meta-toolchain/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbapp=
end
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbappend
> copy to meta-toolchain/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bb=
append
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb b/meta-toolcha=
in/recipes-devtools/gcc/gcc-cross_4.5.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb
> copy to meta-toolchain/recipes-devtools/gcc/gcc-cross_4.5.bb
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-cross_4.6.bbappend b/meta-t=
oolchain/recipes-devtools/gcc/gcc-cross_4.6.bbappend
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-cross_4.6.bbappend
> copy to meta-toolchain/recipes-devtools/gcc/gcc-cross_4.6.bbappend
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.bb b/m=
eta-toolchain/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.bb
> copy to meta-toolchain/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.bb
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappe=
nd b/meta-toolchain/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend
> copy to meta-toolchain/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbap=
pend
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.b=
b b/meta-toolchain/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
> copy to meta-toolchain/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5=
.bb
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.b=
bappend b/meta-toolchain/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6=
.bbappend
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bbap=
pend
> copy to meta-toolchain/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6=
.bbappend
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.5.bb b/meta-tool=
chain/recipes-devtools/gcc/gcc-crosssdk_4.5.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.5.bb
> copy to meta-toolchain/recipes-devtools/gcc/gcc-crosssdk_4.5.bb
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend b/met=
a-toolchain/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend
> copy to meta-toolchain/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb b/meta-toolc=
hain/recipes-devtools/gcc/gcc-runtime_4.5.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb
> copy to meta-toolchain/recipes-devtools/gcc/gcc-runtime_4.5.bb
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-runtime_4.6.bbappend b/meta=
-toolchain/recipes-devtools/gcc/gcc-runtime_4.6.bbappend
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc-runtime_4.6.bbappend
> copy to meta-toolchain/recipes-devtools/gcc/gcc-runtime_4.6.bbappend
> diff --git a/meta-oe/recipes-devtools/gcc/gcc_4.5.bb b/meta-toolchain/rec=
ipes-devtools/gcc/gcc_4.5.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc_4.5.bb
> copy to meta-toolchain/recipes-devtools/gcc/gcc_4.5.bb
> diff --git a/meta-oe/recipes-devtools/gcc/gcc_4.6.bbappend b/meta-toolcha=
in/recipes-devtools/gcc/gcc_4.6.bbappend
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/gcc_4.6.bbappend
> copy to meta-toolchain/recipes-devtools/gcc/gcc_4.6.bbappend
> diff --git a/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb b/meta-toolchain/=
recipes-devtools/gcc/libgcc_4.5.bb
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/libgcc_4.5.bb
> copy to meta-toolchain/recipes-devtools/gcc/libgcc_4.5.bb
> diff --git a/meta-oe/recipes-devtools/gcc/libgcc_4.6.bbappend b/meta-tool=
chain/recipes-devtools/gcc/libgcc_4.6.bbappend
> similarity index 100%
> copy from meta-oe/recipes-devtools/gcc/libgcc_4.6.bbappend
> copy to meta-toolchain/recipes-devtools/gcc/libgcc_4.6.bbappend




