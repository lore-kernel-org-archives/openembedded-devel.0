Received: from mail-qy0-f188.google.com ([209.85.221.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jesmith@kaon.com>) id 1NnCHf-0002GZ-CG
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 15:44:19 +0100
Received: by qyk26 with SMTP id 26so1691644qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Mar 2010 06:41:22 -0800 (PST)
Received: by 10.224.98.140 with SMTP id q12mr2022300qan.287.1267713679074;
	Thu, 04 Mar 2010 06:41:19 -0800 (PST)
Received: from [10.10.0.195] (216-230-77-82.client.cypresscom.net
	[216.230.77.82])
	by mx.google.com with ESMTPS id 8sm220095yxb.43.2010.03.04.06.41.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Mar 2010 06:41:18 -0800 (PST)
From: Joshua Smith <jesmith@kaon.com>
Mime-Version: 1.0 (Apple Message framework v1077)
Date: Thu, 4 Mar 2010 09:41:16 -0500
In-Reply-To: <19c1b8a91003032123t4e402cb0u8db75a6862dca799@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <B22FA4FC-2DB7-49E8-AB09-3FF8FC3D36D9@kaon.com>
	<4CF74675-86F3-45C9-A837-5D5A3489F2A5@kaon.com>
	<19c1b8a91003032123t4e402cb0u8db75a6862dca799@mail.gmail.com>
Message-Id: <0209FF33-B31E-4779-B339-F0D678A6A075@kaon.com>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 209.85.221.188
X-SA-Exim-Mail-From: jesmith@kaon.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,
	MIME_QP_LONG_LINE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Trying and Failing to enable Java with GCC 4.3.3
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
X-List-Received-Date: Thu, 04 Mar 2010 14:44:19 -0000
X-Groupsio-MsgNum: 17328
Content-Type: multipart/mixed; boundary=Apple-Mail-14--503815610

--Apple-Mail-14--503815610
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Oh, sorry about that.  I've attached the do_configure log for gcc_cross.  D=
oesn't look too helpful to me, but what do I know?  If you meant some other=
 configure log, let me know!

In case it helps: before trying to build gcj inside OE, I was trying to bu=
ild a native GCC compiler on the target machine (TouchBook, based on the Be=
agleboard), and I got this same error when I tried configuring with --disab=
le-shared (with --enabled-shared I had other problems).

Thanks.

-Joshua

On Mar 4, 2010, at 12:23 AM, Khem Raj wrote:

> On Wed, Mar 3, 2010 at 9:19 AM, Joshua Smith <jesmith@kaon.com> wrote:
>> Update: I dug around in the log files and I think I have a more root ca=
use of this error.
>>=20
>> configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.
>>=20
>> I've attached the whole log of the failing build.
>>=20
>> Any hints?
>>=20
>> On Mar 3, 2010, at 11:20 AM, Joshua Smith wrote:
>>=20
>>> Hello,
>>>=20
>>> I'm new to OE.  I'm trying to get GCJ compiled for the TouchBook (an A=
RM-based tablet).  After some searching and trial-and-error, I figured out =
that I need to add:
>>>=20
>>> JAVA_arm =3D ",java" to recipies/gcc-4.3.3.inc
>>>=20
>>> But now I'm getting an error when it tries to build gcc-cross-4.3.3:
>>>=20
>>> make[4]: Entering directory `/OE/build/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-=
gnueabi/64/zlib'
>>> make[4]: *** No rule to make target `all'.  Stop.
>>> make[4]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-g=
nueabi/64/zlib'
>>> make[3]: *** [multi-do] Error 1
>>> make[3]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-g=
nueabi/zlib'
>>> make[2]: *** [all-multi] Error 2
>>> make[2]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-g=
nueabi/zlib'
>>> make[1]: *** [all-zlib] Error 2
>>>=20
>>> (I can give you more of the log if it would help, but this is the firs=
t error)
>>>=20
>>> I can see why adding Java would cause GCC to need zlib when maybe it d=
idn't before.  But I don't know what to change to get zlib configured as pa=
rt of the gcc build process.
>=20
> for configure errors its better to post config.log which is generated
> in the build tree. Thats where we can find the cause of error.
> do_compile log wont help.
>=20
>=20
>>>=20
>>> Help?
>>>=20
>>> -Joshua Smith
>>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>=20
>>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




--Apple-Mail-14--503815610
Content-Disposition: attachment;
	filename=log.do_configure.17055
Content-Type: application/octet-stream;
	name="log.do_configure.17055"
Content-Transfer-Encoding: quoted-printable

NOTE: Running /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.=
3.3-r7.1/gcc-4.3.3/configure 		    --build=3Di686-linux 		    --host=3Di686=
-linux 		    --target=3Darm-angstrom-linux-gnueabi 		    --prefix=3D/OE/bui=
ld/tmp/cross/armv7a 		    --exec_prefix=3D/OE/build/tmp/cross/armv7a 		    =
--bindir=3D/OE/build/tmp/cross/armv7a/bin 		    --sbindir=3D/OE/build/tmp/c=
ross/armv7a/bin 		    --libexecdir=3D/OE/build/tmp/cross/armv7a/libexec 		 =
   --datadir=3D/OE/build/tmp/cross/armv7a/share 		    --sysconfdir=3D/OE/bu=
ild/tmp/cross/armv7a/etc 		    --sharedstatedir=3D/OE/build/tmp/cross/armv7=
a/com 		    --localstatedir=3D/OE/build/tmp/cross/armv7a/var 		    --libdir=
=3D/OE/build/tmp/cross/armv7a/lib 		    --includedir=3D/OE/build/tmp/cross/=
armv7a/include 		    --oldincludedir=3D/OE/build/tmp/cross/armv7a/include 	=
	    --infodir=3D/OE/build/tmp/cross/armv7a/share/info 		    --mandir=3D/OE=
/build/tmp/cross/armv7a/share/man 			                 --with-gnu-ld        =
         --enable-shared                 --enable-target-optspace          =
       --enable-languages=3Dc,c++,objc,fortran,java                 --enabl=
e-threads=3Dposix                 --enable-multilib                 --enabl=
e-c99                 --enable-long-long                 --enable-symvers=
=3Dgnu                 --enable-libstdcxx-pch                 --program-pre=
fix=3Darm-angstrom-linux-gnueabi-                   --enable-cheaders=3Dc_s=
td --enable-libssp --disable-bootstrap --disable-libgomp --disable-libmudfl=
ap                                  --with-local-prefix=3D/OE/build/tmp/sta=
ging/armv7a-angstrom-linux-gnueabi/usr 		      --with-gxx-include-dir=3D/OE=
/build/tmp/staging/armv7a-angstrom-linux-gnueabi//usr/include/c++          =
             --with-sysroot=3D/OE/build/tmp/staging/armv7a-angstrom-linux-g=
nueabi                       --with-build-sysroot=3D/OE/build/tmp/staging/a=
rmv7a-angstrom-linux-gnueabi   --enable-cheaders=3Dc_std --disable-libunwin=
d-exceptions --with-mpfr=3D/OE/build/tmp/staging/i686-linux/usr --enable-__=
cxa_atexit 		    ...
configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking target system type... arm-angstrom-linux-gnueabi
checking for a BSD-compatible install... /usr/bin/install -c
checking whether ln works... yes
checking whether ln -s works... yes
checking for i686-linux-gcc... gcc=20
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...=20
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc  accepts -g... yes
checking for gcc  option to accept ANSI C... none needed
checking for i686-linux-g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking for i686-linux-gnatbind... no
checking for gnatbind... no
checking for i686-linux-gnatmake... no
checking for gnatmake... no
checking whether compiler driver understands Ada... no
checking how to compare bootstrapped objects... cmp --ignore-initial=3D16 $=
$f1 $$f2
checking for correct version of gmp.h... yes
checking for correct version of mpfr.h... yes
The following languages will be built: c,c++,fortran,java,objc
*** This configuration is not supported in the following subdirectories:
     target-libobjc target-libada gnattools target-libgomp target-libmudfla=
p
    (Any other directories should still work fine.)
checking for bison... bison -y
checking for bison... bison
checking for gm4... no
checking for gnum4... no
checking for m4... m4
checking for flex... flex
checking for flex... flex
checking for makeinfo... makeinfo
checking for expect... no
checking for runtest... no
checking for ar... (cached) ar
checking for i686-linux-ar... (cached) ar
checking for as... (cached) as
checking for i686-linux-as... (cached) as
checking for i686-linux-dlltool... no
checking for dlltool... no
checking for ld... (cached) ld
checking for i686-linux-ld... (cached) ld
checking for i686-linux-lipo... no
checking for lipo... no
checking for nm... (cached) nm
checking for i686-linux-nm... (cached) nm
checking for ranlib... (cached) ranlib
checking for i686-linux-ranlib... (cached) ranlib
checking for strip... (cached) strip
checking for i686-linux-strip... (cached) strip
checking for i686-linux-windres... no
checking for windres... no
checking for i686-linux-windmc... no
checking for windmc... no
checking for objcopy... (cached) objcopy
checking for i686-linux-objcopy... (cached) objcopy
checking for objdump... (cached) objdump
checking for i686-linux-objdump... (cached) objdump
checking for cc... (cached)  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-=
a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp
checking for gcc... (cached)  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7=
-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp
checking for arm-angstrom-linux-gnueabi-c++... no
checking for arm-angstrom-linux-gnueabi-g++... no
checking for arm-angstrom-linux-gnueabi-cxx... no
checking for arm-angstrom-linux-gnueabi-gxx... no
checking for arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-g=
cc
checking for arm-angstrom-linux-gnueabi-gcj... no
checking for arm-angstrom-linux-gnueabi-gfortran... no
checking for ar... /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bi=
n/ar
checking for as... /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bi=
n/as
checking for dlltool... no
checking for arm-angstrom-linux-gnueabi-dlltool... no
checking for ld... /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bi=
n/ld
checking for lipo... no
checking for arm-angstrom-linux-gnueabi-lipo... no
checking for nm... /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bi=
n/nm
checking for objdump... /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnuea=
bi/bin/objdump
checking for ranlib... /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueab=
i/bin/ranlib
checking for strip... /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi=
/bin/strip
checking for windres... no
checking for arm-angstrom-linux-gnueabi-windres... no
checking for windmc... no
checking for arm-angstrom-linux-gnueabi-windmc... no
checking where to find the target ar... pre-installed in /OE/build/tmp/cros=
s/armv7a/arm-angstrom-linux-gnueabi/bin
checking where to find the target as... pre-installed in /OE/build/tmp/cros=
s/armv7a/arm-angstrom-linux-gnueabi/bin
checking where to find the target cc... just compiled
checking where to find the target c++... just compiled
checking where to find the target c++ for libstdc++... just compiled
checking where to find the target dlltool... pre-installed
checking where to find the target gcc... just compiled
checking where to find the target gcj... just compiled
checking where to find the target gfortran... just compiled
checking where to find the target ld... pre-installed in /OE/build/tmp/cros=
s/armv7a/arm-angstrom-linux-gnueabi/bin
checking where to find the target lipo... pre-installed
checking where to find the target nm... pre-installed in /OE/build/tmp/cros=
s/armv7a/arm-angstrom-linux-gnueabi/bin
checking where to find the target objdump... pre-installed in /OE/build/tmp=
/cross/armv7a/arm-angstrom-linux-gnueabi/bin
checking where to find the target ranlib... pre-installed in /OE/build/tmp/=
cross/armv7a/arm-angstrom-linux-gnueabi/bin
checking where to find the target strip... pre-installed in /OE/build/tmp/c=
ross/armv7a/arm-angstrom-linux-gnueabi/bin
checking where to find the target windres... pre-installed
checking where to find the target windmc... pre-installed
checking whether to enable maintainer-specific portions of Makefiles... no
checking whether -fkeep-inline-functions is supported... yes
configure: creating ./config.status
config.status: creating Makefile

--Apple-Mail-14--503815610--
