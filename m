Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P8AT7-00080L-M5 for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 13:35:02 +0200
Received: from f053043130.adsl.alicedsl.de ([78.53.43.130]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P8ASb-0002DD-KI for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 11:34:29 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1287443220.3927.61.camel@mattotaupa>
References: <1287405781.3928.22.camel@mattotaupa>
	<AANLkTinTuHWBgzbTcZdnrsSGuGmiqgs2fgPc3koE1fCJ@mail.gmail.com>
	<1287433398.3927.1.camel@mattotaupa>
	<1287443220.3927.61.camel@mattotaupa>
Date: Tue, 19 Oct 2010 13:34:26 +0200
Message-ID: <1287488066.4030.39.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 19 Oct 2010 11:35:02 -0000
X-Groupsio-MsgNum: 25129
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-YmqV6WbNHIOuI7GRBSUq"

--=-YmqV6WbNHIOuI7GRBSUq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 19.10.2010, 01:07 +0200 schrieb Paul Menzel:
> Am Montag, den 18.10.2010, 22:23 +0200 schrieb Paul Menzel:
> > Am Montag, den 18.10.2010, 11:39 -0700 schrieb Khem Raj:
> > > On Mon, Oct 18, 2010 at 5:43 AM, Paul Menzel wrote:
> >=20
> > > > trying to build openjade to test ab83ea [1], task `do_compile` of
> > > > `opensp_1.5.bb` [2] fails with the following error with `minimal`
> > > > (eglibc) for `MACHINE =3D "beagleboard"`.
> > >=20
> > > is it a regression ? did it built ok without this patch ?
> >=20
> > Well, `opensp_1.5.bb` was not changed as far as I can see. So I do not
> > think it is a regression. I will try it anyway.
>=20
> Reverting the patch did not have any effect.
>=20
> I build tested OpenSP with other distributions. It worked with `minimal`
> (libc).
>=20
> It failed for `minimal-uclibc` with the same error.
>=20
> It failed for `angstrom-2008.1` with a different error.
>=20
> 	[=E2=80=A6]
> 	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCXX   --mode=3Dlin=
k arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb  -isystem/oe/buil=
d/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensi=
ve-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -fpermi=
ssive -fvisibility-inlines-hidden  -L/oe/build/angstrom-dev/sysroots/armv7a=
-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/oe/build/angstrom-dev/sysr=
oots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -=
o osx sx.o XmlOutputEventHandler.o sx_inst.o ../lib/libosp.la -lpthread=20
> 	arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-g++=
 -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mth=
umb-interwork -mno-thumb -isystem/oe/build/angstrom-dev/sysroots/armv7a-ang=
strom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-register=
s -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlines-hidden =
-Wl,-rpath-link -Wl,/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-g=
nueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -o .libs/osx sx.o XmlOutputEv=
entHandler.o sx_inst.o  -L/oe/build/angstrom-dev/sysroots/armv7a-angstrom-l=
inux-gnueabi/usr/lib ../lib/.libs/libosp.so /oe/build/angstrom-dev/sysroots=
/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.so -lpthread -Wl,-rpath -W=
l,/usr/lib
> 	/oe/build/angstrom-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstr=
om-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: warni=
ng: libc.so, needed by /oe/build/angstrom-dev/sysroots/i686-linux/usr/armv7=
a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-g=
nueabi/lib/libgcc_s.so, not found (try using -rpath or -rpath-link)
> 	XmlOutputEventHandler.o: In function `OpenSP::XmlOutputEventHandler::fsi=
ToUrl(OpenSP::String<unsigned int> const&, OpenSP::Location const&, OpenSP:=
:String<unsigned int>&)':
> 	/oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/opensp-1.5-r2/=
OpenSP-1.5/sx/XmlOutputEventHandler.cxx:789: undefined reference to `OpenSP=
::InputSource::get(OpenSP::Messenger&)'
> 	collect2: ld returned 1 exit status
> 	make[3]: *** [osx] Error 1
> 	make[3]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angstrom-=
linux-gnueabi/opensp-1.5-r2/OpenSP-1.5/sx'
> 	make[2]: *** [all] Error 2
> 	make[2]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angstrom-=
linux-gnueabi/opensp-1.5-r2/OpenSP-1.5/sx'
> 	make[1]: *** [all-recursive] Error 1
> 	make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angstrom-=
linux-gnueabi/opensp-1.5-r2/OpenSP-1.5'
> 	make: *** [all] Error 2
> 	FATAL: oe_runmake failed
> 	ERROR: Function do_compile failed
>=20
> The BitBake run was interrupted. I will try a clean build to confirm the
> issue for sure.

The issues are still there after a clean build. Only `minimal-libc`
works fine.


Thanks,

Paul

--=-YmqV6WbNHIOuI7GRBSUq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky9gkIACgkQPX1aK2wOHVhsIQCeMlda8vFkab1Sf8p/51d2KkzB
DUIAnRX13Mk2mF/qcaDV1OR8Wu52d+mE
=99My
-----END PGP SIGNATURE-----

--=-YmqV6WbNHIOuI7GRBSUq--
