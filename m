Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PVAUc-0005aN-LL for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 23:15:38 +0100
Received: from f053034057.adsl.alicedsl.de ([78.53.34.57]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PVAUX-0008Vj-Oi for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 22:15:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTin1vqVcKi6aU5v_fHss=Jgp3skygwKNhv_4Xgu0@mail.gmail.com>
References: <1287405781.3928.22.camel@mattotaupa>
	<AANLkTinTuHWBgzbTcZdnrsSGuGmiqgs2fgPc3koE1fCJ@mail.gmail.com>
	<1287433398.3927.1.camel@mattotaupa>
	<1287443220.3927.61.camel@mattotaupa>
	<1287488066.4030.39.camel@mattotaupa>
	<AANLkTin1vqVcKi6aU5v_fHss=Jgp3skygwKNhv_4Xgu0@mail.gmail.com>
Date: Tue, 21 Dec 2010 23:15:32 +0100
Message-ID: <1292969732.3769.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: opensp_1.5: `do_compile` fails with for example `RastEventHandler.cxx:(.text+0x7f0): undefined reference to `OpenSP::Sd::execToInternal(char const*) const'`
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
X-List-Received-Date: Tue, 21 Dec 2010 22:15:38 -0000
X-Groupsio-MsgNum: 27387
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-hBnN9/MI9hLMOknZd4FZ"

--=-hBnN9/MI9hLMOknZd4FZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 21.12.2010, 13:28 -0800 schrieb Steve Sakoman:
> On Tue, Oct 19, 2010 at 4:34 AM, Paul Menzel wrote:
> > Am Dienstag, den 19.10.2010, 01:07 +0200 schrieb Paul Menzel:
> >> Am Montag, den 18.10.2010, 22:23 +0200 schrieb Paul Menzel:
> >> > Am Montag, den 18.10.2010, 11:39 -0700 schrieb Khem Raj:
> >> > > On Mon, Oct 18, 2010 at 5:43 AM, Paul Menzel wrote:
> >> >
> >> > > > trying to build openjade to test ab83ea [1], task `do_compile` o=
f
> >> > > > `opensp_1.5.bb` [2] fails with the following error with `minimal=
`
> >> > > > (eglibc) for `MACHINE =3D "beagleboard"`.
> >> > >
> >> > > is it a regression ? did it built ok without this patch ?
> >> >
> >> > Well, `opensp_1.5.bb` was not changed as far as I can see. So I do n=
ot
> >> > think it is a regression. I will try it anyway.
> >>
> >> Reverting the patch did not have any effect.
> >>
> >> I build tested OpenSP with other distributions. It worked with `minima=
l`
> >> (libc).
> >>
> >> It failed for `minimal-uclibc` with the same error.
> >>
> >> It failed for `angstrom-2008.1` with a different error.
> >>
> >>       [=E2=80=A6]
> >>       /bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCXX   --mo=
de=3Dlink arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a=
8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb  -isystem/=
oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -f=
expensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 =
-fpermissive -fvisibility-inlines-hidden  -L/oe/build/angstrom-dev/sysroots=
/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/oe/build/angstrom-d=
ev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=
=3Dgnu -o osx sx.o XmlOutputEventHandler.o sx_inst.o ../lib/libosp.la -lpth=
read
> >>       arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnu=
eabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsof=
tfp -mthumb-interwork -mno-thumb -isystem/oe/build/angstrom-dev/sysroots/ar=
mv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-=
registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlines=
-hidden -Wl,-rpath-link -Wl,/oe/build/angstrom-dev/sysroots/armv7a-angstrom=
-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -o .libs/osx sx.o Xml=
OutputEventHandler.o sx_inst.o  -L/oe/build/angstrom-dev/sysroots/armv7a-an=
gstrom-linux-gnueabi/usr/lib ../lib/.libs/libosp.so /oe/build/angstrom-dev/=
sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.so -lpthread -Wl,-=
rpath -Wl,/usr/lib
> >>       /oe/build/angstrom-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/ar=
m-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/l=
d: warning: libc.so, needed by /oe/build/angstrom-dev/sysroots/i686-linux/u=
sr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom=
-linux-gnueabi/lib/libgcc_s.so, not found (try using -rpath or -rpath-link)
> >>       XmlOutputEventHandler.o: In function `OpenSP::XmlOutputEventHand=
ler::fsiToUrl(OpenSP::String<unsigned int> const&, OpenSP::Location const&,=
 OpenSP::String<unsigned int>&)':
> >>       /oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/opensp=
-1.5-r2/OpenSP-1.5/sx/XmlOutputEventHandler.cxx:789: undefined reference to=
 `OpenSP::InputSource::get(OpenSP::Messenger&)'
> >>       collect2: ld returned 1 exit status
> >>       make[3]: *** [osx] Error 1
> >>       make[3]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-a=
ngstrom-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5/sx'
> >>       make[2]: *** [all] Error 2
> >>       make[2]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-a=
ngstrom-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5/sx'
> >>       make[1]: *** [all-recursive] Error 1
> >>       make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-a=
ngstrom-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5'
> >>       make: *** [all] Error 2
> >>       FATAL: oe_runmake failed
> >>       ERROR: Function do_compile failed
> >>
> >> The BitBake run was interrupted. I will try a clean build to confirm t=
he
> >> issue for sure.
> >
> > The issues are still there after a clean build. Only `minimal-libc`
> > works fine.
>=20
> Several Gumstix customers are seeing this issue too.  Did you ever
> discover the root cause or even a workaround?

Sorry, I discovered neither the cause nor a workaround.

> Is your build machine a 32 bit or 64 bit distro?  There seems to be
> some anecdotal evidence that it may be 64 bit related.

It is a Xen virtual guest system (i686) running on an AMD64.


Thanks,

Paul

--=-hBnN9/MI9hLMOknZd4FZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0RJv4ACgkQPX1aK2wOHVgLFQCdEMmrFE7YQG3bZt17JX3khXnp
XIgAn2JmTDflDyFUlwmRqx7MOUQQ7zW1
=4P5s
-----END PGP SIGNATURE-----

--=-hBnN9/MI9hLMOknZd4FZ--
