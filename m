Received: from lider.pardus.org.tr ([193.140.100.216])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <memre@pardus.org.tr>) id 1Q4TrS-0001uk-2N
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 10:01:10 +0200
Received: from memrep11 (unknown [193.140.74.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: memre)
	by lider.pardus.org.tr (Postfix) with ESMTPSA id BA4E2A7ABB5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 10:35:59 +0300 (EEST)
Date: Tue, 29 Mar 2011 10:43:45 +0300
From: Mehmet Emre Atasever <memre@pardus.org.tr>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20110329104345.0c5de48b.memre@pardus.org.tr>
In-Reply-To: <1292969732.3769.5.camel@mattotaupa>
References: <1287405781.3928.22.camel@mattotaupa>
	<AANLkTinTuHWBgzbTcZdnrsSGuGmiqgs2fgPc3koE1fCJ@mail.gmail.com>
	<1287433398.3927.1.camel@mattotaupa>
	<1287443220.3927.61.camel@mattotaupa>
	<1287488066.4030.39.camel@mattotaupa>
	<AANLkTin1vqVcKi6aU5v_fHss=Jgp3skygwKNhv_4Xgu0@mail.gmail.com>
	<1292969732.3769.5.camel@mattotaupa>
Organization: TUBITAK UEKAE
X-Mailer: Sylpheed 3.1.0 (GTK+ 2.22.1; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 29 Mar 2011 08:01:10 -0000
X-Groupsio-MsgNum: 30686
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Tue__29_Mar_2011_10_43_45_+0300_K20SsxheT+kBOq8Q"

--Signature=_Tue__29_Mar_2011_10_43_45_+0300_K20SsxheT+kBOq8Q
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Dec 2010 23:15:32 +0100
Paul Menzel <paulepanter@users.sourceforge.net> wrote:

> Am Dienstag, den 21.12.2010, 13:28 -0800 schrieb Steve Sakoman:
> > On Tue, Oct 19, 2010 at 4:34 AM, Paul Menzel wrote:
> > > Am Dienstag, den 19.10.2010, 01:07 +0200 schrieb Paul Menzel:
> > >> Am Montag, den 18.10.2010, 22:23 +0200 schrieb Paul Menzel:
> > >> > Am Montag, den 18.10.2010, 11:39 -0700 schrieb Khem Raj:
> > >> > > On Mon, Oct 18, 2010 at 5:43 AM, Paul Menzel wrote:
> > >> >
> > >> > > > trying to build openjade to test ab83ea [1], task `do_compile`=
 of
> > >> > > > `opensp_1.5.bb` [2] fails with the following error with `minim=
al`
> > >> > > > (eglibc) for `MACHINE =3D "beagleboard"`.
> > >> > >
> > >> > > is it a regression ? did it built ok without this patch ?
> > >> >
> > >> > Well, `opensp_1.5.bb` was not changed as far as I can see. So I do=
 not
> > >> > think it is a regression. I will try it anyway.
> > >>
> > >> Reverting the patch did not have any effect.
> > >>
> > >> I build tested OpenSP with other distributions. It worked with `mini=
mal`
> > >> (libc).
> > >>
> > >> It failed for `minimal-uclibc` with the same error.
> > >>
> > >> It failed for `angstrom-2008.1` with a different error.
> > >>
> > >>       [=E2=80=A6]
> > >>       /bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCXX   --=
mode=3Dlink arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb  -isyste=
m/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include =
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb=
2 -fpermissive -fvisibility-inlines-hidden  -L/oe/build/angstrom-dev/sysroo=
ts/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/oe/build/angstrom=
-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-styl=
e=3Dgnu -o osx sx.o XmlOutputEventHandler.o sx_inst.o ../lib/libosp.la -lpt=
hread
> > >>       arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-g=
nueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Ds=
oftfp -mthumb-interwork -mno-thumb -isystem/oe/build/angstrom-dev/sysroots/=
armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlin=
es-hidden -Wl,-rpath-link -Wl,/oe/build/angstrom-dev/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -o .libs/osx sx.o X=
mlOutputEventHandler.o sx_inst.o  -L/oe/build/angstrom-dev/sysroots/armv7a-=
angstrom-linux-gnueabi/usr/lib ../lib/.libs/libosp.so /oe/build/angstrom-de=
v/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.so -lpthread -Wl=
,-rpath -Wl,/usr/lib
> > >>       /oe/build/angstrom-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/=
arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin=
/ld: warning: libc.so, needed by /oe/build/angstrom-dev/sysroots/i686-linux=
/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstr=
om-linux-gnueabi/lib/libgcc_s.so, not found (try using -rpath or -rpath-lin=
k)
> > >>       XmlOutputEventHandler.o: In function `OpenSP::XmlOutputEventHa=
ndler::fsiToUrl(OpenSP::String<unsigned int> const&, OpenSP::Location const=
&, OpenSP::String<unsigned int>&)':
> > >>       /oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/open=
sp-1.5-r2/OpenSP-1.5/sx/XmlOutputEventHandler.cxx:789: undefined reference =
to `OpenSP::InputSource::get(OpenSP::Messenger&)'
> > >>       collect2: ld returned 1 exit status
> > >>       make[3]: *** [osx] Error 1
> > >>       make[3]: Leaving directory `/oe/build/angstrom-dev/work/armv7a=
-angstrom-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5/sx'
> > >>       make[2]: *** [all] Error 2
> > >>       make[2]: Leaving directory `/oe/build/angstrom-dev/work/armv7a=
-angstrom-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5/sx'
> > >>       make[1]: *** [all-recursive] Error 1
> > >>       make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a=
-angstrom-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5'
> > >>       make: *** [all] Error 2
> > >>       FATAL: oe_runmake failed
> > >>       ERROR: Function do_compile failed
> > >>
> > >> The BitBake run was interrupted. I will try a clean build to confirm=
 the
> > >> issue for sure.
> > >
> > > The issues are still there after a clean build. Only `minimal-libc`
> > > works fine.
> >=20
> > Several Gumstix customers are seeing this issue too.  Did you ever
> > discover the root cause or even a workaround?
>=20
> Sorry, I discovered neither the cause nor a workaround.
>=20
> > Is your build machine a 32 bit or 64 bit distro?  There seems to be
> > some anecdotal evidence that it may be 64 bit related.
>=20
> It is a Xen virtual guest system (i686) running on an AMD64.
>=20
>=20
> Thanks,
>=20
> Paul

I faced the same problem, it's about CXXFLAGS. export CXXFLAGS as -02, if p=
roblem still happens try export LD=3DCXX.

--=20
~ @memre <Mehmet Emre Atasever>
__EOM

--Signature=_Tue__29_Mar_2011_10_43_45_+0300_K20SsxheT+kBOq8Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2RjbUACgkQPrmXd/4BU6NWbQCgluIMvwZxiIwJPpA+0GkkzXB7
i78AoKRmln5daiOqY03Q9aX2xUUz9rsj
=4JZ6
-----END PGP SIGNATURE-----

--Signature=_Tue__29_Mar_2011_10_43_45_+0300_K20SsxheT+kBOq8Q--
