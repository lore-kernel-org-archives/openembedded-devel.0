Received: from topaz.fbs.net ([208.82.160.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nik@nikom.net>) id 1P8YhJ-0005dc-Tt
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 15:27:30 +0200
Received: from [192.168.8.236] ([71.43.229.162]) by fbs.net with MailEnable
	ESMTP; Wed, 20 Oct 2010 09:26:36 -0400
References: <4CBEB7E8.5020109@nedap.com>
	<AANLkTikBiKGuQYXCdi_QMirA7_AjQn9b0A0CWtmkMu90@mail.gmail.com>
From: Nik <nik@nikom.net>
X-Mailer: iPhone Mail (8B117)
In-Reply-To: <AANLkTikBiKGuQYXCdi_QMirA7_AjQn9b0A0CWtmkMu90@mail.gmail.com>
Message-Id: <29F88E4E-18CC-4CD2-8A76-5C78ED4EDAC7@nikom.net>
Date: Wed, 20 Oct 2010 09:26:32 -0400
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (iPhone Mail 8B117)
X-SA-Exim-Connect-IP: 208.82.160.44
X-SA-Exim-Mail-From: nik@nikom.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,
	MIME_QP_LONG_LINE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building gcc-cross-initial for armv5te
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
X-List-Received-Date: Wed, 20 Oct 2010 13:27:30 -0000
X-List-Received-Date: Wed, 20 Oct 2010 13:27:30 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

What os are you compiling on?  Can you run the cross compile gcc from the c=
ommand line and get the no input files message?
On Oct 20, 2010, at 7:25 AM, Frans Meulenbroeks <fransmeulenbroeks@gmail.c=
om> wrote:

> 2010/10/20 Jaap de Jong <jaap.dejong@nedap.com>:
>>  building gcc-cross-initial for armv5te fails:
>>=20
>>   ///
>>   | checking for arm-angstrom-linux-gnueabi-ranlib...
>>   arm-angstrom-linux-gnueabi-ranlib
>>   | checking for arm-angstrom-linux-gnueabi-strip...
>>   arm-angstrom-linux-gnueabi-strip
>>   | checking whether ln -s works... yes
>>   | checking for arm-angstrom-linux-gnueabi-gcc...
>>=20
>> /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gc=
c-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-=
linux-gnueabi/./gcc/xgcc
>>=20
>> -B/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/=
gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstro=
m-linux-gnueabi/./gcc/
>>   -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb
>>=20
>> -isystem/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linu=
x-gnueabi/usr/include
>>=20
>> -B/media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-=
angstrom-linux-gnueabi/bin/
>>=20
>> -B/media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-=
angstrom-linux-gnueabi/lib/
>>   -isystem
>>=20
>> /media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-an=
gstrom-linux-gnueabi/include
>>   -isystem
>>=20
>> /media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-an=
gstrom-linux-gnueabi/sys-include
>>=20
>> --sysroot=3D/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-=
linux-gnueabi
>>   | checking for suffix of object files... configure: error: in
>>=20
>> `/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/g=
cc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom=
-linux-gnueabi/arm-angstrom-linux-gnueabi/libgcc':
>>   | configure: error: cannot compute suffix of object files: cannot
>>   compile
>>   | See `config.log' for more details.
>>   | make[1]: *** [configure-target-libgcc] Error 1
>>   | make[1]: Leaving directory
>>=20
>> `/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/g=
cc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom=
-linux-gnueabi'
>>   | make: *** [all] Error 2
>>   | FATAL: oe_runmake failed
>>   NOTE: Task failed:
>>=20
>> /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gc=
c-cross-initial-4.5-r12.0+svnr164562/temp/log.do_compile.1864
>>   ERROR: TaskFailed event exception, aborting
>>   ERROR: Build of
>>=20
>> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cross=
-initial_4.5.bb
>>   do_compile failed
>>   ERROR: Task 6228
>>=20
>> (/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cros=
s-initial_4.5.bb,
>>   do_compile) failed
>>   NOTE: Waiting for 2 active tasks to finish
>>   NOTE: 1:
>>=20
>> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/classpath/cla=
sspath-native_0.98.bb,
>>   do_install (1885)
>>   NOTE: 2:
>>=20
>> virtual:native:/media/OpenEmbedded/unstable/org.openembedded.dev/recipe=
s/xorg-lib/libx11_1.3.99.902.bb,
>>   do_install (1886)
>>   NOTE: Waiting for 1 active tasks to finish
>>   NOTE: 1:
>>=20
>> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/classpath/cla=
sspath-native_0.98.bb,
>>   do_install (1885)
>>   NOTE: Tasks Summary: Attempted 888 tasks of which 888 didn't need to
>>   be rerun and 1 failed.
>>   ERROR:
>>=20
>> '/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cros=
s-initial_4.5.bb'
>>   failed
>>=20
>>=20
>> Checking
>>=20
>> tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svn=
r164562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi/gcc/config.log
>>=20
>> reveals:
>>=20
>>   configure:4791: checking whether compiler driver understands Ada
>>   configure:4814: result: no
>>   configure:4851: checking how to run the C preprocessor
>>   configure:4921: result: gcc -E
>>   configure:4941: gcc -E  conftest.c
>>   configure:4941: $? =3D 0
>>   configure:4955: gcc -E  conftest.c
>>   conftest.c:11: fatal error: ac_nonexistent.h: No such file or directo=
ry
>>   compilation terminated.
>>=20
>>=20
>> Not sure if it has anything to do with it.
>> I can't find ac_nonexistent.h, but perhaps this is intended looking at =
the
>> filename...
>> Any help is appreciated!
>> Jaap
>> _______________________________________________
>=20
> With the testing-next branch things build fine with me
> (ditro slugos, machine nslu2le  and nslu2be)
>=20
> Frans
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



