Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PpOyB-0004QE-ND
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 18:45:47 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PpOx3-0000aA-3l from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 09:44:37 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 15 Feb 2011 09:44:36 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 15 Feb 2011 10:44:35 -0700
Message-ID: <4D5ABB82.7000701@mentor.com>
Date: Tue, 15 Feb 2011 10:44:34 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinQ9DmVt+3G3fh=-0wKKsR6Vr89dSvJUwOB8SAG@mail.gmail.com>
In-Reply-To: <AANLkTinQ9DmVt+3G3fh=-0wKKsR6Vr89dSvJUwOB8SAG@mail.gmail.com>
X-OriginalArrivalTime: 15 Feb 2011 17:44:35.0868 (UTC)
	FILETIME=[02C775C0:01CBCD38]
Subject: Re: gcc-cross-sdk: fail to build with 20110215 OE
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
X-List-Received-Date: Tue, 15 Feb 2011 17:45:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2011 10:26 AM, Otavio Salvador wrote:
> Hello,
>
> I got a build-failure of gcc-cross-sdk using current OE. It fails to
> find libc library on linking.
>
> /bin/sh /home/otavio/hacking/embedded-linux/tmp/work/x86_64-i586-sdk-oe-linux/gcc-cross-sdk-4.5-r31.2+svnr168622/gcc-4_5-branch/libgcc/../mkinstalldirs
> .
> /home/otavio/hacking/embedded-linux/tmp/work/x86_64-i586-sdk-oe-linux/gcc-cross-sdk-4.5-r31.2+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux/./gcc/xgcc
> -B/home/otavio/hacking/embedded-linux/tmp/work/x86_64-i586-sdk-oe-linux/gcc-cross-sdk-4.5-r31.2+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux/./gcc/
> --sysroot=/home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux
> -B/opt/sdk/osnetboot-terminal/i586/i586-oe-linux/bin/
> -B/opt/sdk/osnetboot-terminal/i586/i586-oe-linux/lib/ -isystem
> /opt/sdk/osnetboot-terminal/i586/i586-oe-linux/include -isystem
> /opt/sdk/osnetboot-terminal/i586/i586-oe-linux/sys-include
> --sysroot=/home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux
>    -O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
> -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
> -Wold-style-definition  -isystem ./include  -fPIC -g
> -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED
> -fno-stack-protector  -shared -nodefaultlibs
> -Wl,--soname=libgcc_s.so.1 -Wl,--version-script=libgcc.map -o
> ./libgcc_s.so.1.tmp -g -Os -B./ _muldi3_s.o _negdi2_s.o _lshrdi3_s.o
> _ashldi3_s.o _ashrdi3_s.o _cmpdi2_s.o _ucmpdi2_s.o _clear_cache_s.o
> _enable_execute_stack_s.o _trampoline_s.o __main_s.o _absvsi2_s.o
> _absvdi2_s.o _addvsi3_s.o _addvdi3_s.o _subvsi3_s.o _subvdi3_s.o
> _mulvsi3_s.o _mulvdi3_s.o _negvsi2_s.o _negvdi2_s.o _ctors_s.o
> _ffssi2_s.o _ffsdi2_s.o _clz_s.o _clzsi2_s.o _clzdi2_s.o _ctzsi2_s.o
> _ctzdi2_s.o _popcount_tab_s.o _popcountsi2_s.o _popcountdi2_s.o
> _paritysi2_s.o _paritydi2_s.o _powisf2_s.o _powidf2_s.o _powixf2_s.o
> _powitf2_s.o _mulsc3_s.o _muldc3_s.o _mulxc3_s.o _multc3_s.o
> _divsc3_s.o _divdc3_s.o _divxc3_s.o _divtc3_s.o _bswapsi2_s.o
> _bswapdi2_s.o _fixunssfsi_s.o _fixunsdfsi_s.o _fixunsxfsi_s.o
> _fixsfdi_s.o _fixdfdi_s.o _fixxfdi_s.o _fixunssfdi_s.o _fixunsdfdi_s.o
> _fixunsxfdi_s.o _floatdisf_s.o _floatdidf_s.o _floatdixf_s.o
> _floatundisf_s.o _floatundidf_s.o _floatundixf_s.o _divdi3_s.o
> _moddi3_s.o _udivdi3_s.o _umoddi3_s.o _udiv_w_sdiv_s.o _udivmoddi4_s.o
> addtf3_s.o divtf3_s.o eqtf2_s.o getf2_s.o letf2_s.o multf3_s.o
> negtf2_s.o subtf3_s.o unordtf2_s.o fixtfsi_s.o fixunstfsi_s.o
> floatsitf_s.o floatunsitf_s.o fixtfdi_s.o fixunstfdi_s.o floatditf_s.o
> floatunditf_s.o extendsftf2_s.o extenddftf2_s.o extendxftf2_s.o
> trunctfsf2_s.o trunctfdf2_s.o trunctfxf2_s.o tf-signs_s.o
> unwind-dw2_s.o unwind-dw2-fde-glibc_s.o unwind-sjlj_s.o gthr-gnat_s.o
> unwind-c_s.o emutls_s.o -lc&&  rm -f ./libgcc_s.so&&  if [ -f
> ./libgcc_s.so.1 ]; then mv -f ./libgcc_s.so.1 ./libgcc_s.so.1.backup;
> else true; fi&&  mv ./libgcc_s.so.1.tmp ./libgcc_s.so.1&&  ln -s
> libgcc_s.so.1 ./libgcc_s.so
> /home/otavio/hacking/embedded-linux/tmp/sysroots/x86_64-linux/usr/i586/i586-oe-linux/bin/ld:
> cannot find /lib/libc_nonshared.a
> collect2: ld returned 1 exit status
> make[2]: *** [libgcc_s.so] Error 1
> make[2]: Leaving directory
> `/home/otavio/hacking/embedded-linux/tmp/work/x86_64-i586-sdk-oe-linux/gcc-cross-sdk-4.5-r31.2+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux/i586-oe-linux/libgcc'
> make[1]: *** [all-target-libgcc] Error 2
> make[1]: Leaving directory
> `/home/otavio/hacking/embedded-linux/tmp/work/x86_64-i586-sdk-oe-linux/gcc-cross-sdk-4.5-r31.2+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux'
> make: *** [all] Error 2
>
> Any idea why it fails?

Missing host package, whatever provides libc_nonshared.a on your distro?

-- 
Tom Rini
Mentor Graphics Corporation


