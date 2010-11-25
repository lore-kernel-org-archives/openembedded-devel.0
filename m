Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1PLfYC-0001m0-IV
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 18:24:05 +0100
Received: from meyreuil.atmel.fr (meyreuil [10.159.254.132])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id oAPHKGZO008304;
	Thu, 25 Nov 2010 09:20:17 -0800 (PST)
Received: from [127.0.0.1] ([10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id oAPHMfh18441; 
	Thu, 25 Nov 2010 18:22:41 +0100 (MET)
Message-ID: <4CEE9B60.1030309@atmel.com>
Date: Thu, 25 Nov 2010 18:22:40 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CEE24A8.2090007@atmel.com>
	<4CEE2ADA.7050004@eukrea.com>	<4CEE6A7B.4010603@atmel.com>
	<20101125163139.GQ3274@jama>
In-Reply-To: <20101125163139.GQ3274@jama>
X-MIME-Autoconverted: from 8bit to quoted-printable by sjogate2.atmel.com id
	oAPHKGZO008304
X-SA-Exim-Connect-IP: 204.2.163.5
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Martin Jansa <martin.jansa@gmail.com>,
	=?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: libXext-native fail to compile (x86_64)
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
X-List-Received-Date: Thu, 25 Nov 2010 17:24:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le 25/11/2010 17:31, Martin Jansa :
> On Thu, Nov 25, 2010 at 02:54:03PM +0100, Nicolas Ferre wrote:
>> Le 25/11/2010 10:22, Eric B=E9nard :
>>> Hi Nicolas,
>>>
>>> On 25/11/2010 09:56, Nicolas Ferre wrote:
>>>> While trying to build from scratch the latest .dev branch with:
>>>> - angstrom-2010.x distribution
>>>>
>>>> Build Configuration:
>>>> BB_VERSION        =3D "1.10.0"
>>>> METADATA_BRANCH   =3D "dev_for2010.12"
>>>> METADATA_REVISION =3D "a1bba89"
>>>> TARGET_ARCH       =3D "arm"
>>>> TARGET_OS         =3D "linux-gnueabi"
>>>> MACHINE           =3D "at91sam9m10g45ek"
>>>> DISTRO            =3D "angstrom"
>>>> DISTRO_VERSION    =3D "next"
>>>> TARGET_FPU        =3D "soft"
>>>>
>>>>
>>>> I have the following error with libxext:
>>>> NOTE: package libxext-native-1_1.2.0-r9.0: task do_compile: Failed
>>>>
>>> it seems to build fine for others also on x86_64 host :
>>> http://tinderbox.openembedded.net/packages/1077651/
>>> http://tinderbox.openembedded.net/packages/1087310/
>>
>> Indeed, strange...
>> I tried to clean the recipe and then rebuild without success.
>> Someone has a hint where it can come from?
>=20
> I've tried to reproduce on my 2 x86_64 hosts and both build it still
> fine (both with gcc-4.5, SHR and micro)
>=20
> But same problem was maybe reason here:
> http://bugs.openembedded.org/show_bug.cgi?id=3D5490
> but for him do_install failed.. weird

Well, not my case... I have my tmp and sources while running the building=
 process.

It may be related to my native "ld" that is too old?

For the record, here are my native ld and gcc revisions (comming from "Re=
d Hat Enterprise Linux Client release 5.2 (Tikanga)"):

$ /usr/bin/ld -V
GNU ld version 2.17.50.0.6-6.el5 20061020
  Supported emulations:
   elf_x86_64
   elf_i386
   i386linux

$ gcc -v
Using built-in specs.
Target: x86_64-redhat-linux
Configured with: ../configure --prefix=3D/usr --mandir=3D/usr/share/man -=
-infodir=3D/usr/share/info --enable-shared --enable-threads=3Dposix --ena=
ble-checking=3Drelease --with-system-zlib --enable-__cxa_atexit --disable=
-libunwind-exceptions --enable-libgcj-multifile --enable-languages=3Dc,c+=
+,objc,obj-c++,java,fortran,ada --enable-java-awt=3Dgtk --disable-dssi --=
enable-plugin --with-java-home=3D/usr/lib/jvm/java-1.4.2-gcj-1.4.2.0/jre =
--with-cpu=3Dgeneric --host=3Dx86_64-redhat-linux
Thread model: posix
gcc version 4.1.2 20071124 (Red Hat 4.1.2-42)

Bye,
--=20
Nicolas Ferre



