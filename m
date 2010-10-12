Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5mZg-0000mX-R7 for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 23:40:07 +0200
Received: from f053038011.adsl.alicedsl.de ([78.53.38.11]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5mZ0-0000aU-SN for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 21:39:15 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1286893616.3731.40.camel@mattotaupa>
References: <1286783755-19145-1-git-send-email-koen@openembedded.org>
	<i9154e$2rk$1@dough.gmane.org>  <1286893616.3731.40.camel@mattotaupa>
Date: Tue, 12 Oct 2010 23:39:13 +0200
Message-ID: <1286919553.13054.13.camel@mattotaupa>
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
Subject: Re: [PATCHv3 1/3] kernel bbclass: split do_compile into do_compile and do_compile_modules
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
X-List-Received-Date: Tue, 12 Oct 2010 21:40:16 -0000
X-Groupsio-MsgNum: 24752
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-PlMO6ykSjz1kGnNuatFj"

--=-PlMO6ykSjz1kGnNuatFj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 12.10.2010, 16:26 +0200 schrieb Paul Menzel:
> Am Dienstag, den 12.10.2010, 10:09 +0200 schrieb Koen Kooi:
> > ping
> >=20
> > On 11-10-10 09:55, Koen Kooi wrote:
> > > This allows recipes to insert a custom task in between building *Imag=
e and modules
> > >=20
> > > Signed-off-by: Koen Kooi <koen@openembedded.org>
> > > ---
> > >  classes/kernel.bbclass |    5 +++++
> > >  1 files changed, 5 insertions(+), 0 deletions(-)
> > >=20
> > > diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> > > index cf6b8cd..83e3f44 100644
> > > --- a/classes/kernel.bbclass
> > > +++ b/classes/kernel.bbclass
> > > @@ -89,12 +89,17 @@ kernel_do_compile() {
> > >  		oe_runmake dep CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
> > >  	fi
> > >  	oe_runmake ${KERNEL_IMAGETYPE} CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_L=
D}"
> > > +}
> > > +
> > > +do_compile_kernelmodules() {
> > > +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> > >  	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> > >  		oe_runmake modules  CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
> > >  	else
> > >  		oenote "no modules to compile"
> > >  	fi
> > >  }
> > > +addtask compile_kernelmodules after do_compile before do_install
> > > =20
> > >  kernel_do_install() {
> > >  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>=20
> I am using `MACHINE =3D "beagleboard"`.
>=20
> I did
>=20
> 	$ bitbake -c clean virtual/kernel
> 	$ bitbake virtual/kernel
>=20
> with your patches applied for `minimal-{libc,eglibc}` and I did not see
> any regressions.
>=20
> The build for `angstrom-2010.x` is still running. `angstrom-2008.1`
> hangs right now, though. Could you test that again, please. I will take
> a look in a few more hours, if the build succeeded.
>=20
> 	NOTE: Running task 892 of 911 (ID: 13, /home/paul/oe/openembedded/recipe=
s/linux)
> 	NOTE: package linux-omap-psp-2.6.32-r90+gitra6bad4464f985fdd3bed72e1b82d=
cbfc004d=E2=80=A6
> 	NOTE: package linux-omap-psp-2.6.32-r90+gitra6bad4464f985fdd3bed72e1b82d=
cbfc004d=E2=80=A6

It finished just fine.

Tested-by: Paul Menzel <paulepanter@users.sourceforge.net>

But you already committed this in 615876 [1] and onwards.

Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D615876f=
e218dc3feb4a3df9e6546a7b1a6376800

--=-PlMO6ykSjz1kGnNuatFj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky01XEACgkQPX1aK2wOHVgxrgCeMxrhvSpAWtSqqxF9tl8TWWrG
oLsAnRlDwfL7VvaKDO5QQHiPemBLpRp2
=IIEU
-----END PGP SIGNATURE-----

--=-PlMO6ykSjz1kGnNuatFj--
