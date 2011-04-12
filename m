Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q9fin-0000Em-Ey for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 17:41:41 +0200
Received: from f053043024.adsl.alicedsl.de ([78.53.43.24]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q9fgt-0003DQ-Hn for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 15:39:44 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110412084218.GA21027@jama.jama.net>
References: <1302596149.4323.18.camel@mattotaupa>
	<20110412084218.GA21027@jama.jama.net>
Date: Tue, 12 Apr 2011 17:39:28 +0200
Message-ID: <1302622768.4323.148.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: gstreamer*, starling: ERROR: Nothing RPROVIDES 'gst-plugin-ivorbis' (but /oe/openembedded/recipes/starling/starling_0.9.bb RDEPENDS on or otherwise requires it)
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
X-List-Received-Date: Tue, 12 Apr 2011 15:41:41 -0000
X-Groupsio-MsgNum: 31133
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9KOQnvu4dNHlK9wNwQu6"

--=-9KOQnvu4dNHlK9wNwQu6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 12.04.2011, 10:42 +0200 schrieb Martin Jansa:
> On Tue, Apr 12, 2011 at 10:15:49AM +0200, Paul Menzel wrote:

> > `e-image` depends on `starling` which has
> >=20
> >         RRECOMMENDS_${PN} =3D "\
> >           gst-plugin-mad \
> >           gst-plugin-modplug \
> >           gst-plugin-ivorbis \
> >           gst-plugin-tcp \
> >         "
> >=20
> > in its recipe. I think commit e6d170ab [1]
> >=20
> >         commit e6d170abad28fcd0e3b8ba831705bed23e3309a4
> >         Author: Martin Jansa <martin.jansa@gmail.com>
> >         Date:   Thu Apr 7 00:12:22 2011 +0000
> >        =20
> >             gst-plugins: define disjunctive PACKAGES_DYNAMIC for each p=
ack base/good/bad/ugly
> >            =20
> >             * adds a bit more bits to keep in sync while changing gst-p=
lugins
> >               version, but not that much (this patch was mostly prepare=
d by script)
> >             * overlap in PACKAGES_DYNAMIC namespace causes notes like t=
his in every build
> >               NOTE: multiple providers are available for runtime gst-pl=
ugin-autodetect (gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-p=
lugins-ugly)
> >               NOTE: consider defining a PREFERRED_PROVIDER entry to mat=
ch gst-plugin-autodetect
> >            =20
> >             Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >             Acked-by: Mike Westerhof <mike@mwester.net>
> >=20
> > is responsible for this regression and has just
> >=20
> >         +PACKAGES_DYNAMIC =3D "\
> >         [=E2=80=A6]
> >         +gst-plugin-ivorbisdec* \
> >         [=E2=80=A6]
> >         "
> >=20
> > in the list. I do not know anything about this plugin and where the
> > error is.
>=20
> I have tried to regenerate PACKAGES_DYNAMIC with nokia900 (hard fp) for b=
ase and bad plugins and still cannot get
> gst-plugin-ivorbis built (still only gst-plugin-ivorbisdec)
>=20
> can you try to remove existing PACKAGES_DYNAMIC and call
> contrib/gstreamer/generate-packages-dynamic-list.sh recipes/gstreamer/gst=
-plugins-bad_*
> contrib/gstreamer/generate-packages-dynamic-list.sh recipes/gstreamer/gst=
-plugins-base_*
>=20
> and check git diff if you have gst-plugin-ivorbis there?

        gst-plugins-base-0.10.32$ ./configure --help
        [=E2=80=A6]
          --disable-ivorbis            disable integer vorbis plug-in: ivor=
bisdec
        [=E2=80=A6]

So it seems to be the same.

> if not, then imho starling should be fixed

I will send a patch, but I am wondering why it worked before.


Thanks,

Paul

--=-9KOQnvu4dNHlK9wNwQu6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2kcjAACgkQPX1aK2wOHViMuwCfU4iRtfsP5jdU5AQgLTD16aVR
IrkAn0JVpIp/y8j5YdbXcBR6/qjOegDQ
=hzna
-----END PGP SIGNATURE-----

--=-9KOQnvu4dNHlK9wNwQu6--
