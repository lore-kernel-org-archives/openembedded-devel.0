Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gp1hX-0007fP-J3
	for openembedded-devel@openembedded.org; Tue, 28 Nov 2006 13:04:39 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kASC4Mox021848; Tue, 28 Nov 2006 13:04:23 +0100
Message-ID: <456C25C4.1070609@dominion.kabel.utwente.nl>
Date: Tue, 28 Nov 2006 13:04:20 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1GoL26-00042N-IV@linuxtogo.org>
In-Reply-To: <E1GoL26-00042N-IV@linuxtogo.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Rod Whitby <rwhitby@gmail.com>
Subject: Re: [oe-commits] org.oe.dev gcc-cross 4.1.1: fix libg* architecture bugs, closes #1265
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Nov 2006 12:04:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

koen commit schreef:
> gcc-cross 4.1.1: fix libg* architecture bugs, closes #1265

The cset below only seems to work for machines that explicitly set PACKAGE_ARCH, which
incidentally covers the machines I tested for (they include
tune-{xscale,arm920t,athlonmp}.inc which sets PACKAGE_ARCH). Should we set it for each
machine?

regards,

Koen


> Author: koen@openembedded.org
> Branch: org.openembedded.dev
> Revision: 9a4fb914b7b1a293ffcc388e0301d3158ea42794
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=9a4fb914b7b1a293ffcc388e0301d3158ea42794
> Files:
> 1
> packages/gcc/gcc-cross_4.1.1.bb
> packages/gcc/gcc-package-cross.inc
> Diffs:
> 
> #
> # mt diff -r2152f3464031a4bf3e4bc5c8203b46ebb0e44dff -r9a4fb914b7b1a293ffcc388e0301d3158ea42794
> #
> # 
> # 
> # patch "packages/gcc/gcc-cross_4.1.1.bb"
> #  from [2b2acff444fc9f4457b86aaec676c2c1b286e3dc]
> #    to [b13d88751c7d70eb84a9d3a985deaf96aa744b00]
> # 
> # patch "packages/gcc/gcc-package-cross.inc"
> #  from [931c3b7e5dde55d964d8b16f796850bdf0d49b71]
> #    to [dda998308babfe7138319c581c2969e2bb381fcf]
> # 
> ============================================================
> --- packages/gcc/gcc-cross_4.1.1.bb	2b2acff444fc9f4457b86aaec676c2c1b286e3dc
> +++ packages/gcc/gcc-cross_4.1.1.bb	b13d88751c7d70eb84a9d3a985deaf96aa744b00
> @@ -5,7 +5,7 @@ FILESDIR = "${@os.path.dirname(bb.data.g
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"
>  # NOTE: split PR.  If the main .oe changes something that affects its *build*
>  # remember to increment this one too.
> -PR = "r7"
> +PR = "r8"
>  
>  DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc gmp-native mpfr-native"
>  PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
> ============================================================
> --- packages/gcc/gcc-package-cross.inc	931c3b7e5dde55d964d8b16f796850bdf0d49b71
> +++ packages/gcc/gcc-package-cross.inc	dda998308babfe7138319c581c2969e2bb381fcf
> @@ -6,13 +6,16 @@ INHIBIT_PACKAGE_STRIP = "1"
>  OLD_INHIBIT_PACKAGE_STRIP := "${INHIBIT_PACKAGE_STRIP}"
>  INHIBIT_PACKAGE_STRIP = "1"
>  
> +#we introduce MY_ARCH to get 'armv5te' as arch instead of the misleading 'arm' on armv5te builds
> +MY_ARCH := "${PACKAGE_ARCH}"
> +
>  PACKAGES = "libgcc libgcc-dev libstdc++ libg2c libg2c-dev libgfortran libgfortran-dev"
>  PACKAGES_DYNAMIC = "libgcc* libstdc* libg2c* libgfortran*"
>  
> -PACKAGE_ARCH_libg2c = "${TARGET_ARCH}"
> -PACKAGE_ARCH_libg2c-dev = "${TARGET_ARCH}"
> -PACKAGE_ARCH_libgfortran = "${TARGET_ARCH}"
> -PACKAGE_ARCH_libgfortran-dev = "${TARGET_ARCH}"
> +PACKAGE_ARCH_libg2c = "${MY_ARCH}"
> +PACKAGE_ARCH_libg2c-dev = "${MY_ARCH}"
> +PACKAGE_ARCH_libgfortran = "${MY_ARCH}"
> +PACKAGE_ARCH_libgfortran-dev = "${MY_ARCH}"
>  
>  # Called from within gcc-cross, so libdir is set wrong
>  FILES_libg2c = "${target_libdir}/libg2c.so.*"
> @@ -25,13 +28,13 @@ FILES_libgfortran-dev = "${target_libdir
>  			 ${target_libdir}/libgfortran.so \
>  			 ${target_libdir}/libgfortranbegin.a"
>  
> -PACKAGE_ARCH_libgcc = "${TARGET_ARCH}"
> -PACKAGE_ARCH_libgcc-dev = "${TARGET_ARCH}"
> +PACKAGE_ARCH_libgcc = "${MY_ARCH}"
> +PACKAGE_ARCH_libgcc-dev = "${MY_ARCH}"
>  FILES_libgcc = "${target_base_libdir}/libgcc_s.so.1"
>  FILES_libgcc-dev = "${target_base_libdir}/libgcc_s.so"
>  
> -PACKAGE_ARCH_libstdc++ = "${TARGET_ARCH}"
> -PACKAGE_ARCH_libstdc++-dev = "${TARGET_ARCH}"
> +PACKAGE_ARCH_libstdc++ = "${MY_ARCH}"
> +PACKAGE_ARCH_libstdc++-dev = "${MY_ARCH}"
>  FILES_libstdc++ = "${target_libdir}/libstdc++.so.*"
>  FILES_libstdc++-dev = "${target_includedir}/c++/${PV} \
>  		       ${target_libdir}/libstdc++.so \
> @@ -64,7 +67,7 @@ do_install () {
>  	mkdir -p ${D}${target_libdir}
>  	mv -f ${D}${prefix}/*/lib/libstdc++.so* ${D}${target_libdir}
>  	if [ "${HAS_G2C}" = "yes" ]; then
> -	  mv -f ${D}${prefix}/*/lib/libg2c.so* ${D}${target_libdir}
> +	  mv -f ${D}${prefix}/*/lib/libg2c.so* ${D}${target_libdir} || true
>  	fi
>  	if [ "${HAS_GFORTRAN}" = "yes" ]; then
>  	  mv -f ${D}${prefix}/*/lib/libgfortran*.so* ${D}${target_libdir}
> 
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFbCXEMkyGM64RGpERAoGQAKCRQ5SItggzXvzc733f1Yg6PZEnyACeMvly
AYkzczXtLOfBh4KURhECCAk=
=5VDS
-----END PGP SIGNATURE-----


