Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vijay.rathi@gmail.com>) id 1NKsCa-0004Iw-8l
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 12:37:59 +0100
Received: by pwi18 with SMTP id 18so575346pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2009 03:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=hqg4wpCEgHq1s34x8hKqE3AwXuzavCqoLg+SHUDYP94=;
	b=pAMDZohOtKkCo9RhkvlzzQKcJKUmLb5PibdLDk4llKmEGlAChP8Iq4d9kfXUNWQUpZ
	omhxmwVupcgDvPwRFkk8rbdglJc/0RF1JEzHLo1OgrL5EgeDL2uCTNdQU7qUs+VnxKzu
	j9S1neyvronwAQ2DJMTLl2k8MxAkum4ULdmPo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SbxnUFFCJmfnuhMBLTWQh0OyZM9jH/NBkloIZJ1bvjiTtOx+fl525M2Oy9b4MPJqj8
	xrb4U+3nhc/9e1fsWql7PEBW2JMvhlcGxzGpr6337L3eAjFv5s+/9OBKyNAh/40ZOSjF
	Xb8Xle1ZR/XeIXohCvfpDbJYlPRBf89sl//fo=
MIME-Version: 1.0
Received: by 10.141.106.13 with SMTP id i13mr686271rvm.0.1260963365712; Wed, 
	16 Dec 2009 03:36:05 -0800 (PST)
In-Reply-To: <b381e0f80912150646v710aa0ecy4c4526d78f5acde3@mail.gmail.com>
References: <b381e0f80912150646v710aa0ecy4c4526d78f5acde3@mail.gmail.com>
Date: Wed, 16 Dec 2009 17:06:05 +0530
Message-ID: <b381e0f80912160336t7a5a447as34fe2684abcc3649@mail.gmail.com>
From: Vijay Rathi <vijay.rathi@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: vijay.rathi@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Issue with bitbake
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
X-List-Received-Date: Wed, 16 Dec 2009 11:37:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have recently setup the bitbake, OE development tree as per the  wiki for
beagleboard.

While compiling mplayer and virtual/kernel I am facing following issue:

NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to
increase performance.
NOTE: Handling BitBake files: - (6700/6700) [100 %]
NOTE: Parsing finished. 6413 cached, 0 parsed, 287 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 141 of 362 (ID: 186,
/home/dev/OE/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb,
do_qa_configure)
NOTE: Running task 157 of 362 (ID: 323,
/home/dev/OE/openembedded/recipes/libsdl/libsdl-native_1.2.11.bb,
do_compile)
NOTE: Running task 174 of 362 (ID: 103,
/home/dev/OE/openembedded/recipes/linux-libc-headers/
linux-libc-headers_2.6.23.bb, do_patch)
NOTE: Running task 178 of 362 (ID: 347,
/home/dev/OE/openembedded/recipes/gcc/gcc-cross-initial_4.3.1.bb, do_patch)
NOTE: Applying patch 'unifdef.patch'
(recipes/linux-libc-headers/files/unifdef.patch)
NOTE: Applying patch 'gcc43-c++-builtin-redecl.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-c++-builtin-redecl.patch)
NOTE: Applying patch 'gcc43-ia64-libunwind.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-ia64-libunwind.patch)
NOTE: Applying patch 'gcc43-java-nomulti.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-java-nomulti.patch)
NOTE: Running task 179 of 362 (ID: 187,
/home/dev/OE/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb,
do_compile)
NOTE: Running task 180 of 362 (ID: 104,
/home/dev/OE/openembedded/recipes/linux-libc-headers/
linux-libc-headers_2.6.23.bb, do_configure)
NOTE: Applying patch 'gcc43-ppc32-retaddr.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-ppc32-retaddr.patch)
ERROR: function do_compile failed
ERROR: see log in
/home/dev/OE/angstrom-dev/work/i686-linux/libsdl-native-1.2.11-r2/temp/log.do_compile.12862
NOTE: Task failed:
/home/dev/OE/angstrom-dev/work/i686-linux/libsdl-native-1.2.11-r2/temp/log.do_compile.12862
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/dev/OE/openembedded/recipes/libsdl/
libsdl-native_1.2.11.bb do_compile failed
NOTE: Applying patch 'gcc43-pr27898.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-pr27898.patch)
NOTE: Applying patch 'gcc43-pr32139.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-pr32139.patch)
ERROR: Task 323 (/home/dev/OE/openembedded/recipes/libsdl/
libsdl-native_1.2.11.bb, do_compile) failed
NOTE: Waiting for 3 active tasks to finish
NOTE: 1: /home/dev/OE/openembedded/recipes/gcc/gcc-cross-initial_4.3.1.bb,
do_patch (12864)
NOTE: 2: /home/dev/OE/openembedded/recipes/linux-libc-headers/
linux-libc-headers_2.6.23.bb, do_configure (13446)
NOTE: 3: /home/dev/OE/openembedded/recipes/binutils/
binutils-cross_2.18.50.0.7.bb, do_compile (13422)
NOTE: Applying patch 'gcc43-pr33763.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-pr33763.patch)
NOTE: Applying patch 'gcc43-rh330771.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-rh330771.patch)
NOTE: Applying patch 'gcc43-rh341221.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-rh341221.patch)
NOTE: Applying patch 'gcc43-cpp-pragma.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-cpp-pragma.patch)
NOTE: Applying patch 'gcc43-java-debug-iface-type.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-java-debug-iface-type.patch)
NOTE: Applying patch 'gcc43-libgomp-speedup.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-libgomp-speedup.patch)
NOTE: Applying patch 'gcc43-i386-libgomp.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-i386-libgomp.patch)
NOTE: Applying patch 'gcc43-rh251682.patch'
(recipes/gcc/gcc-4.3.1/fedora/gcc43-rh251682.patch)
NOTE: Applying patch 'arm-unbreak-eabi-armv4t.dpatch'
(recipes/gcc/gcc-4.3.1/debian/arm-unbreak-eabi-armv4t.dpatch)
NOTE: Applying patch 'libstdc++-pic.dpatch'
(recipes/gcc/gcc-4.3.1/debian/libstdc++-pic.dpatch)
NOTE: Applying patch 'gcc-ice-hack.dpatch'
(recipes/gcc/gcc-4.3.1/debian/gcc-ice-hack.dpatch)
NOTE: Applying patch 'pr30961.dpatch'
(recipes/gcc/gcc-4.3.1/debian/pr30961.dpatch)
NOTE: Applying patch '100-uclibc-conf.patch'
(recipes/gcc/gcc-4.3.1/100-uclibc-conf.patch)
NOTE: Waiting for 2 active tasks to finish
NOTE: 1: /home/dev/OE/openembedded/recipes/gcc/gcc-cross-initial_4.3.1.bb,
do_patch (12864)
NOTE: 2: /home/dev/OE/openembedded/recipes/binutils/
binutils-cross_2.18.50.0.7.bb, do_compile (13422)
NOTE: Applying patch '103-uclibc-conf-noupstream.patch'
(recipes/gcc/gcc-4.3.1/103-uclibc-conf-noupstream.patch)
NOTE: Applying patch '200-uclibc-locale.patch'
(recipes/gcc/gcc-4.3.1/200-uclibc-locale.patch)
NOTE: Applying patch '203-uclibc-locale-no__x.patch'
(recipes/gcc/gcc-4.3.1/203-uclibc-locale-no__x.patch)
NOTE: Applying patch '204-uclibc-locale-wchar_fix.patch'
(recipes/gcc/gcc-4.3.1/204-uclibc-locale-wchar_fix.patch)
NOTE: Applying patch '205-uclibc-locale-update.patch'
(recipes/gcc/gcc-4.3.1/205-uclibc-locale-update.patch)
NOTE: Applying patch '301-missing-execinfo_h.patch'
(recipes/gcc/gcc-4.3.1/301-missing-execinfo_h.patch)
NOTE: Applying patch '302-c99-snprintf.patch'
(recipes/gcc/gcc-4.3.1/302-c99-snprintf.patch)
NOTE: Applying patch '303-c99-complex-ugly-hack.patch'
(recipes/gcc/gcc-4.3.1/303-c99-complex-ugly-hack.patch)
NOTE: Applying patch '304-index_macro.patch'
(recipes/gcc/gcc-4.3.1/304-index_macro.patch)
NOTE: Applying patch '305-libmudflap-susv3-legacy.patch'
(recipes/gcc/gcc-4.3.1/305-libmudflap-susv3-legacy.patch)
NOTE: Applying patch '306-libstdc++-namespace.patch'
(recipes/gcc/gcc-4.3.1/306-libstdc++-namespace.patch)
NOTE: Applying patch '307-locale_facets.patch'
(recipes/gcc/gcc-4.3.1/307-locale_facets.patch)
NOTE: Applying patch '602-sdk-libstdc++-includes.patch'
(recipes/gcc/gcc-4.3.1/602-sdk-libstdc++-includes.patch)
NOTE: Applying patch '740-sh-pr24836.patch'
(recipes/gcc/gcc-4.3.1/740-sh-pr24836.patch)
NOTE: Applying patch '800-arm-bigendian.patch'
(recipes/gcc/gcc-4.3.1/800-arm-bigendian.patch)
NOTE: Applying patch '904-flatten-switch-stmt-00.patch'
(recipes/gcc/gcc-4.3.1/904-flatten-switch-stmt-00.patch)
NOTE: Applying patch 'arm-nolibfloat.patch'
(recipes/gcc/gcc-4.3.1/arm-nolibfloat.patch)
NOTE: Applying patch 'arm-softfloat.patch'
(recipes/gcc/gcc-4.3.1/arm-softfloat.patch)
NOTE: Applying patch 'arm-thumb.patch'
(recipes/gcc/gcc-4.3.1/arm-thumb.patch)
NOTE: Applying patch 'arm-thumb-cache.patch'
(recipes/gcc/gcc-4.3.1/arm-thumb-cache.patch)
NOTE: Applying patch 'ldflags.patch' (recipes/gcc/gcc-4.3.1/ldflags.patch)
NOTE: Applying patch 'fix-ICE-in-arm_unwind_emit_set.diff'
(recipes/gcc/gcc-4.3.1/fix-ICE-in-arm_unwind_emit_set.diff)
NOTE: Applying patch 'cache-amnesia.patch'
(recipes/gcc/gcc-4.3.1/cache-amnesia.patch)
NOTE: Applying patch 'gfortran-4.3.x.patch'
(recipes/gcc/files/gfortran-4.3.x.patch)
NOTE: Applying patch 'gcc-4.0.2-e300c2c3.patch'
(recipes/gcc/gcc-4.3.1/gcc-4.0.2-e300c2c3.patch)
NOTE: Applying patch 'gcc-arm-frename-registers.patch'
(recipes/gcc/gcc-4.3.1/gcc-arm-frename-registers.patch)
NOTE: Applying patch 'PR-36500-fix-neon.patch'
(recipes/gcc/gcc-4.3.1/gcc-release-branch/PR-36500-fix-neon.patch)
NOTE: Applying patch 'gcc-4.3.1-SYSROOT_CFLAGS_FOR_TARGET.patch'
(recipes/gcc/gcc-4.3.1/gcc-4.3.1-SYSROOT_CFLAGS_FOR_TARGET.patch)
NOTE: Applying patch 'gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch'
(recipes/gcc/gcc-4.3.1/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch)
NOTE: Applying patch 'zecke-xgcc-cpp.patch'
(recipes/gcc/gcc-4.3.1/zecke-xgcc-cpp.patch)
NOTE: Applying patch 'gcc-flags-for-build.patch'
(recipes/gcc/gcc-4.3.1/gcc-flags-for-build.patch)
NOTE: Applying patch 'zecke-no-host-includes.patch'
(recipes/gcc/gcc-4.3.1/zecke-no-host-includes.patch)
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /home/dev/OE/openembedded/recipes/binutils/
binutils-cross_2.18.50.0.7.bb, do_compile (13422)
NOTE: Tasks Summary: Attempted 176 tasks of which 174 didn't need to be
rerun and 1 failed.
ERROR: '/home/dev/OE/openembedded/recipes/libsdl/libsdl-native_1.2.11.bb'
failed

