Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JqbJN-0007VA-P0
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 23:55:02 +0200
Received: by wa-out-1112.google.com with SMTP id l24so7936649waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 14:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=c3curwHvoL355inEcP/LUFDfgICdYE0DDN4VIQBCP1E=;
	b=xB2h5VboSsz6jCmhdH0JvQ4efPqQDSnN6Qx2WNbgMTxJvk1KkuKWDByly3ozI7quiJwse3eSMcmRZwmo62zBQbc9/vfAehpwWHxsaiKG7Gkocetui4oupCgtqlLNNQVmAX0y9056ogAqKPpHzJriLWknW23yTuqAZqqxUktQl0k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=WBqpJOraU5hh25xT5HDVS6ZkG5MeRwoL5XgjvVVtVqGdRTzPqeL1iA+gFiRImE+30WqHINvG8zRgnshXtpVl/xs4x9Cw/UFFxtkqUAv10qUX9oXZbpgdTdhUNTuJEcP8rxs/4WN3Gnhc6CEu+7Wu/Dn6EPb2OqZoiF5rWVU1z7k=
Received: by 10.114.177.1 with SMTP id z1mr7096649wae.189.1209419674088;
	Mon, 28 Apr 2008 14:54:34 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Mon, 28 Apr 2008 14:54:34 -0700 (PDT)
Message-ID: <19c1b8a90804281454m3e3ea43fv2d84596976c0487@mail.gmail.com>
Date: Mon, 28 Apr 2008 14:54:34 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080428192607.GB28476@deadlock.dhs.org>
MIME-Version: 1.0
References: <20080428192607.GB28476@deadlock.dhs.org>
Subject: Re: problem building meta-toolchain for arm/uclibc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 28 Apr 2008 21:55:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

try running the link step alone manually

/opt/44296fe048e6bdbb2da959e5d681dfdf/etcb/OE/build/angstrom/work/i686-arm-sdk-angstrom-linux-uclibcgnueabi/gcc-cross-sdk-4.1.2-r11/gcc-4.1.2/build.i686-linux.arm-angstrom-linux-uclibcgnueabi/./gcc/xgcc
-B/opt/44296fe048e6bdbb2da959e5d681dfdf/etcb/OE/build/angstrom/work/i686-arm-sdk-angstrom-linux-uclibcgnueabi/gcc-cross-sdk-4.1.2-r11/gcc-4.1.2/build.i686-linux.arm-angstrom-linux-uclibcgnueabi/./gcc/
-B/opt/angstrom/arm/arm-angstrom-linux-uclibcgnueabi/bin/
-B/opt/angstrom/arm/arm-angstrom-linux-uclibcgnueabi/lib/ -isystem
/opt/angstrom/arm/arm-angstrom-linux-uclibcgnueabi/include -isystem
/opt/angstrom/arm/arm-angstrom-linux-uclibcgnueabi/sys-include -O2  -g
-Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -fPIC -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2
-D__GCC_FLOAT_NOT_NEEDED  -shared -nodefaultlibs
-Wl,--soname=libgcc_s.so.1 -Wl,--version-script=libgcc/./libgcc.map -o
./libgcc_s.so.1.tmp  libgcc/./_udivsi3_s.o libgcc/./_divsi3_s.o
libgcc/./_umodsi3_s.o libgcc/./_modsi3_s.o libgcc/./_bb_init_func_s.o
libgcc/./_call_via_rX_s.o libgcc/./_interwork_call_via_rX_s.o
libgcc/./_lshrdi3_s.o libgcc/./_ashrdi3_s.o libgcc/./_ashldi3_s.o
libgcc/./_negdf2_s.o libgcc/./_addsubdf3_s.o libgcc/./_muldivdf3_s.o
libgcc/./_cmpdf2_s.o libgcc/./_unorddf2_s.o libgcc/./_fixdfsi_s.o
libgcc/./_fixunsdfsi_s.o libgcc/./_truncdfsf2_s.o libgcc/./_negsf2_s.o
libgcc/./_addsubsf3_s.o libgcc/./_muldivsf3_s.o libgcc/./_cmpsf2_s.o
libgcc/./_unordsf2_s.o libgcc/./_fixsfsi_s.o libgcc/./_fixunssfsi_s.o
libgcc/./_floatdidf_s.o libgcc/./_floatdisf_s.o
libgcc/./_aeabi_lcmp_s.o libgcc/./_aeabi_ulcmp_s.o
libgcc/./_aeabi_ldivmod_s.o libgcc/./_aeabi_uldivmod_s.o
libgcc/./_dvmd_lnx_s.o libgcc/./_muldi3_s.o libgcc/./_negdi2_s.o
libgcc/./_cmpdi2_s.o libgcc/./_ucmpdi2_s.o libgcc/./_clear_cache_s.o
libgcc/./_enable_execute_stack_s.o libgcc/./_trampoline_s.o
libgcc/./__main_s.o libgcc/./_absvsi2_s.o libgcc/./_absvdi2_s.o
libgcc/./_addvsi3_s.o libgcc/./_addvdi3_s.o libgcc/./_subvsi3_s.o
libgcc/./_subvdi3_s.o libgcc/./_mulvsi3_s.o libgcc/./_mulvdi3_s.o
libgcc/./_negvsi2_s.o libgcc/./_negvdi2_s.o libgcc/./_ctors_s.o
libgcc/./_ffssi2_s.o libgcc/./_ffsdi2_s.o libgcc/./_clz_s.o
libgcc/./_clzsi2_s.o libgcc/./_clzdi2_s.o libgcc/./_ctzsi2_s.o
libgcc/./_ctzdi2_s.o libgcc/./_popcount_tab_s.o
libgcc/./_popcountsi2_s.o libgcc/./_popcountdi2_s.o
libgcc/./_paritysi2_s.o libgcc/./_paritydi2_s.o libgcc/./_powisf2_s.o
libgcc/./_powidf2_s.o libgcc/./_powixf2_s.o libgcc/./_powitf2_s.o
libgcc/./_mulsc3_s.o libgcc/./_muldc3_s.o libgcc/./_mulxc3_s.o
libgcc/./_multc3_s.o libgcc/./_divsc3_s.o libgcc/./_divdc3_s.o
libgcc/./_divxc3_s.o libgcc/./_divtc3_s.o libgcc/./_fixunsxfsi_s.o
libgcc/./_fixsfdi_s.o libgcc/./_fixunssfdi_s.o libgcc/./_fixdfdi_s.o
libgcc/./_fixunsdfdi_s.o libgcc/./_fixxfdi_s.o
libgcc/./_fixunsxfdi_s.o libgcc/./_floatdixf_s.o libgcc/./_fixtfdi_s.o
libgcc/./_fixunstfdi_s.o libgcc/./_floatditf_s.o libgcc/./_divdi3_s.o
libgcc/./_moddi3_s.o libgcc/./_udivdi3_s.o libgcc/./_umoddi3_s.o
libgcc/./_udiv_w_sdiv_s.o libgcc/./_udivmoddi4_s.o libgcc/./bpabi_s.o
libgcc/./unaligned-funcs_s.o libgcc/./unwind-arm_s.o
libgcc/./libunwind_s.o libgcc/./pr-support_s.o libgcc/./unwind-c_s.o
-lc && rm -f ./libgcc_s.so && if [ -f ./libgcc_s.so.1 ]; then mv -f
./libgcc_s.so.1 ./libgcc_s.so.1.backup; else true; fi && mv
./libgcc_s.so.1.tmp ./libgcc_s.so.1 && ln -s libgcc_s.so.1
./libgcc_s.so


and pass options to generate verbose output. It could be related to binutils.



On Mon, Apr 28, 2008 at 12:26 PM, Sergey 'Jin' Bostandzhyan
<jin@mediatomb.cc> wrote:
> Hi everyone,
>
> I keep struggling with meta-toolchain and I hope to get some input on this.
>
> I'm on oe stable, angstrom-2007.1, ARM9, uclibc, EABI
>
> I start with a clean build: bitbake meta-toolchain
>
> Unfortunately gcc-cross-sdk fails to build:
> NOTE: package gcc-cross-sdk-4.1.2-r11: task do_compile: failed
>
> And here's the most interesting part:
> | /opt/44296fe048e6bdbb2da959e5d681dfdf/etcb/OE/build/angstrom/cross/bin/arm-angstrom-linux-uclibcgnueabi-ld: cannot find libc.so.6
> | collect2: ld returned 1 exit status
> | make[3]: *** [libgcc_s.so] Error 1
>
> Is it looking for libc.so.6 on a uclibc build?
>
> Here is the full log:
> http://www.deadlock.dhs.org/jin/log_do_compile_uclibcgnueabi_gcc_cross_sdk.txt
>
> I started to poke around, looking for differences between the configuration
> options of the sdk and non-sdk versions.
>
> Apart of the directories most things are the same, the only other additonal
> options were in the gcc-cross-sdk (vs. gcc-cross)  configuration:
> --enable-clocale=generic and --disable-nls (the non-sdk gcc-cross did not have
> those).
>
> I also looked at binutils-cross and binutils-cross-sdk, here binutils-cross
> had two more options: --enable-install-libbfd --disable-werror The rest,
> except for the paths was the same.
>
> I also noticed that the sdk variants use the already available tools from
> the cross directory, not sure if that can be related to my problem
> binutils-cross:
> checking for arm-angstrom-linux-uclibcgnueabi-gcc... no
>
> binutils-cross-sdk:
> checking for arm-angstrom-linux-uclibcgnueabi-gcc... arm-angstrom-linux-uclibcgnueabi-gcc
>
> At this point I am sort of stuck, so if anyone has an idea or a clue - I'll
> be happy to hear about it. Thanks!
>
> Kind regards,
> Jin
>
> P.S. I'd submit a bug... but the bugtracker is still down :(
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


