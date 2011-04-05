Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q7E2u-0000mA-Ao for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 23:44:20 +0200
Received: from f053040021.adsl.alicedsl.de ([78.53.40.21]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q7E0y-0004lM-Jo for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 21:42:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTikmAU59dgxEwN7uHnr0DeupZvzKFA@mail.gmail.com>
References: <BANLkTikmAU59dgxEwN7uHnr0DeupZvzKFA@mail.gmail.com>
Date: Tue, 05 Apr 2011 23:42:14 +0200
Message-ID: <1302039734.3933.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: Building Gstreamer from GIT
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
X-List-Received-Date: Tue, 05 Apr 2011 21:44:20 -0000
X-Groupsio-MsgNum: 30965
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Gfjorg7xQ0r0O9KxLcNn"

--=-Gfjorg7xQ0r0O9KxLcNn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Srinredplano,


Am Dienstag, den 05.04.2011, 11:53 -0700 schrieb srinredplano SP:

> I am trying to build Gstreamer from GIT ( using branch 0.10.23 ) .But
> I am not able to run autogen.sh due to missing .git  directory .
>=20
> Can any one let me know why the . git is  getting erased and what I
> should do to stop getting   that erased. (I am verymuch new to Git
> (though I have build Gstreamer using svn)o build Gstreamer using GIt
> Pointers for building Gstreamer using GIT  would be helpful.
>=20
> Here is my recipe http://pastebin.com/tz6dsZmV . Thanks in Advance
>=20
> gstreamer_0.10.30.bb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> require gstreamer.inc
> PR =3D "r1"
>=20
> SRCREV_pn-gstreamer =3D "${AUTOREV}"
>=20
> SRC_URI[archive.md5sum] =3D "de01f73f71d97c5854badd363ca06509"
> SRC_URI[archive.sha256sum] =3D
> "e8ef301be423797ff36a0bb3615930b112b4175634051d19fd655e0ed974532a"

Your mailer mangled your message. Please turn of line wrapping for
sections with code.

> SRC_URI =3D "git://10.121.72.60/git/gstreamer.git;branch=3D0.10.23;protoc=
ol=3Dgit "
>=20
> #SRC_URI =3D "git://anongit.freedesktop.org/gstreamer/common;branch=3D0.1=
0.23;protocol=3Dgit
> "
>=20
>=20
> S =3D ${WORKDIR}/git
>=20
> EXTRA_OECONF +=3D "ac_cv_func_register_printf_function=3Dno"
>=20
> do_configure_prepend() {
>     pushd ${S}
>     tar -xzf ${DL_DIR}/git_10.121.72.60.git.gstreamer.git.tar.gz

What is that for? Where does the archive come from? BitBake takes care
getting a clone/checkout of the repository.

>     ./autogen.sh --noconfigure --nocheck
>=20
>     sed -i -e s:docs::g Makefile.am
>     popd
> }

Please take a look at the existing Git recipes, for example

	$ find recipes/ -name *\_git.bb

and send a patch next time using `git format-patch =E2=80=A6` and `git
send-email` so people can easily deal and test your code.


Thanks,

Paul

--=-Gfjorg7xQ0r0O9KxLcNn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2bjLAACgkQPX1aK2wOHVh6TwCfcQk3IGkvAVByzzETa8kW04hS
p+sAnjCl1mL39WfxhgUsz5S5PB2lZ2vY
=b0i7
-----END PGP SIGNATURE-----

--=-Gfjorg7xQ0r0O9KxLcNn--
