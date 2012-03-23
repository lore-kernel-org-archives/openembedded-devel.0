Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAz9w-0008R2-9G
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 08:43:40 +0100
Received: by wibhj13 with SMTP id hj13so1494441wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 00:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ECW/s6oIdVh1Rvo7N1byDcDq58Zfm91WyvGAkmnzwkQ=;
	b=CQk+D8FGOLBw8uxsG844+l1OorQk+YOq0ZfQ3eoR95j304+s0MZQk+HOV/x+9GcG9l
	u6ErojmBsX/PmNFCp4XTTEGfdODCuFBAJh3ZxTbU/KamLNMQ+Z4yFgBjvcB53dE2q72L
	DnQ+qgevMuhY3W9bhsZJxnhcxjMirK+virvn05qIjD8iZ1TDM/j+uNx0by+As9L4Obyn
	qR5lV8vSJrkVvrJFuUWLkQjuOWq6EVYa7lKk6mbEz0GHUY1/O8c2+EZisBydYj/hu+1Z
	mt9BKdofaFAQ05pEpMwlCoB5juYlWxXkhBhlB51URTjzxKIRbFtUE2l126/F43pnpbzx
	rn0Q==
Received: by 10.180.101.230 with SMTP id fj6mr4078162wib.13.1332488084632;
	Fri, 23 Mar 2012 00:34:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df3sm11725902wib.1.2012.03.23.00.34.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 00:34:43 -0700 (PDT)
Date: Fri, 23 Mar 2012 08:34:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120323073444.GA3879@jama.jama.net>
References: <1332487454-14897-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1332487454-14897-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][toolchain-layer][PATCH] toolchain-layer: move binutils and gcc from meta-oe into here
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
X-List-Received-Date: Fri, 23 Mar 2012 07:43:40 -0000
X-Groupsio-MsgNum: 37951
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Fri, Mar 23, 2012 at 08:24:14AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
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
>  .../gcc/gcc-4.5/gcc-4.5.0_to_svn_162697.patch.bz2  |  Bin 6957305 -> 6957305 bytes
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
>  382 files changed, 0 insertions(+), 0 deletions(-)

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9sJ5QACgkQN1Ujt2V2gByxigCeItqhLP0fuDjybu5BJJxzhr63
OVsAnA31J7MoB7U1WZcGZOlvdqy1KGOq
=LPym
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
