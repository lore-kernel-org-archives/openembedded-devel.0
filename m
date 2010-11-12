Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PH2cX-0003Za-8d
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 00:01:30 +0100
Received: by gyf3 with SMTP id 3so2256283gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 15:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=3SYK/fprwVd1YT946bq8DMzQy9XAYBFXPoHiQ9ycKuc=;
	b=AU7bIUWFO0M+Hu8HetpCsWLMYe1iyyTcS7a3bhnxFoEq5VUO1CB0c4IsZLLrJhb412
	2uehdQGzdPzdEEx788m+Cg03S6Z3kIWjGbll1sbGjNDhkyjfQGUwkd96dk33OtrcEXRk
	lH9Oxcwk9s8ZC8Vu8wp4AkAbhIg6RCNkctxVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=H+GPr8bY3ud63ZXGeKiI3KDC31JBQyjuqz5lnZ9h3oAhYlKOEV6rcFKASzo7o9B/Mq
	T6UM5U/gFIh/9PAEdL/ZWacQVpfOX7PQUQkk0n8DLFjM7O2xlLho2ZJe+Q+X3unzwPgg
	bRAKDOXNk3VQaMLL21yJavl+kWrAso/DtB7fY=
Received: by 10.91.51.19 with SMTP id d19mr3927704agk.183.1289602823302; Fri,
	12 Nov 2010 15:00:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Fri, 12 Nov 2010 15:00:01 -0800 (PST)
In-Reply-To: <4CDDC29D.3050106@crhc.illinois.edu>
References: <4CDDB992.7000603@crhc.illinois.edu>
	<AANLkTikdSDT0+JSSgSEeHrWFC3n6Km0GMuX2umS3OgNu@mail.gmail.com>
	<4CDDC29D.3050106@crhc.illinois.edu>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Nov 2010 15:00:01 -0800
Message-ID: <AANLkTikWOb+P3YpqMRr5c59GjPcDbQV9V74r_HQ0HYUL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-4.5 r166342 PCHFLAGS problem
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
X-List-Received-Date: Fri, 12 Nov 2010 23:01:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 12, 2010 at 2:41 PM, Matt Johnson
<johnso87@crhc.illinois.edu> wrote:
>
>
> On 11/12/2010 04:31 PM, Khem Raj wrote:
>>
>> On Fri, Nov 12, 2010 at 2:02 PM, Matt Johnson
>> <johnso87@crhc.illinois.edu> =C2=A0wrote:
>>
>>>
>>> Hi All,
>>> =C2=A0 =C2=A0I built gcc-cross from x86_64 host to armv7a target using =
gcc 4.5
>>> r166342. =C2=A0I then tried to bitbake gcc (an armv7a-host, armv7a-targ=
et
>>> native
>>> compiler) with the same revision and got build errors on libstdc++:
>>>
>>>
>>
>> hmmm I dont see these issues here. I am using latest gcc in OE and
>> minimal distro with libtool 2.4 which is same like angstrom-2010
>> I wonder if there are some header files extra somewhere on your host
>> system that are interfering libstdc++ configure.
>> what OS do u run on the build machine.
>>
>> -Khem
>>
>>
>
> Kubuntu 10.04, with gcc 4.4.3:
>
> gcc -v
> Using built-in specs.
> Target: x86_64-linux-gnu
> Configured with: ../src/configure -v --with-pkgversion=3D'Ubuntu
> 4.4.3-4ubuntu5' --with-bugurl=3Dfile:///usr/share/doc/gcc-4.4/README.Bugs
> --enable-languages=3Dc,c++,fortran,objc,obj-c++ --prefix=3D/usr --enable-=
shared
> --enable-multiarch --enable-linker-build-id --with-system-zlib
> --libexecdir=3D/usr/lib --without-included-gettext --enable-threads=3Dpos=
ix
> --with-gxx-include-dir=3D/usr/include/c++/4.4 --program-suffix=3D-4.4
> --enable-nls --enable-clocale=3Dgnu --enable-libstdcxx-debug --enable-plu=
gin
> --enable-objc-gc --disable-werror --with-arch-32=3Di486 --with-tune=3Dgen=
eric
> --enable-checking=3Drelease --build=3Dx86_64-linux-gnu --host=3Dx86_64-li=
nux-gnu
> --target=3Dx86_64-linux-gnu
> Thread model: posix
> gcc version 4.4.3 (Ubuntu 4.4.3-4ubuntu5)
>
> My log.do_configure is here: http://pastebin.com/9ZPUB4KJ . =C2=A0The err=
or at
> the top is slightly concerning:

try to find latest build logs from tinderbox and compare. Hmm but I
dont know if tinderbox has logs for successful builds.

>
> =C2=A01.
> =C2=A0 =C2=A0 configure.ac:32: error: Please use exactly Autoconf 2.64 in=
stead
> =C2=A0 =C2=A0 of 2.65.

yeah we should not be reautoconfing gcc

> =C2=A02.
> =C2=A0 =C2=A0 config/override.m4:34: _GCC_AUTOCONF_VERSION_CHECK is expan=
ded from...
> =C2=A03.
> =C2=A0 =C2=A0 configure.ac:32: the top level
> =C2=A04.
> =C2=A0 =C2=A0 autom4te:
>
> /media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/sysroots/x86_64-linu=
x/usr/bin/m4
> =C2=A0 =C2=A0 failed with exit status: 1
>


