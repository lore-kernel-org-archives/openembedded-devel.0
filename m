Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OUvVD-0001MM-AH
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 07:43:01 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OUvQZ-0003S2-B2
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 09:38:14 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 3 Jul 2010 09:38:06 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1278082654-10070-1-git-send-email-khimov@altell.ru>
	<1278082654-10070-2-git-send-email-khimov@altell.ru>
	<20100703045150.GA17627@gmail.com>
In-Reply-To: <20100703045150.GA17627@gmail.com>
MIME-Version: 1.0
Message-Id: <201007030938.10113.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] tzdata-uclibc: add recipe for uclibc timezone database
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
X-List-Received-Date: Sat, 03 Jul 2010 05:43:01 -0000
X-Groupsio-MsgNum: 20690
Content-Type: multipart/signed; boundary="nextPart1797099.cHJ4v7p7Pn";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1797099.cHJ4v7p7Pn
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 03 =D0=B8=D1=8E=D0=BB=D1=8F 2010=
 08:51:50 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB:
> On (02/07/10 18:57), Roman I Khimov wrote:
> > Recent TZif2 file format contains TZ-like ASCII string at the end that =
is
> > easily extractable and usable with uclibc setup, so this recipe does
> > exactly that based on standard tzdata.
> >
> > Signed-off-by: Roman I Khimov <khimov@altell.ru>
> > ---
> >  recipes/tzdata/tzdata-uclibc_2010j.bb |   16 ++++++++++++++++
> >  1 files changed, 16 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/tzdata/tzdata-uclibc_2010j.bb
> >
> > diff --git a/recipes/tzdata/tzdata-uclibc_2010j.bb
> > b/recipes/tzdata/tzdata-uclibc_2010j.bb new file mode 100644
> > index 0000000..9d0de5d
> > --- /dev/null
> > +++ b/recipes/tzdata/tzdata-uclibc_2010j.bb
> > @@ -0,0 +1,16 @@
> > +require tzdata_${PV}.bb
> > +
> > +do_install_append () {
> > +	rm -f ${D}${sysconfdir}/localtime
> > +	rm -f ${D}${sysconfdir}/timezone
> > +	for i in `find ${D}${datadir}/zoneinfo -type f`; do
> > +		tail -n 1 $i > temp-zone
> > +		# Avoid useless NULL files
> > +		if [ "`cat temp-zone`" !=3D "" ]; then
> > +			mv temp-zone $i
> > +		fi
> > +	done
> > +	cp -pPR ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE}
> > ${D}${sysconfdir}/TZ +}
> > +
> > +CONFFILES_${PN} =3D "${sysconfdir}/TZ"
> > \ No newline at end of file
>=20
> you could have used overrides in the same recipe.
> do_install_append_libc-uclibc () ...

Hmm. Just haven't thought about it this way as uclibc version is very=20
different from standard one, so this separation was intended. Also after=20
http://git.uclibc.org/uClibc/commit/?id=3D87327f43e4ea65d63ceab0985cf814e22=
940579a
it is possible to use standard timezone database in uClibc, so you could wa=
nt=20
to have that for some mixed-libc setup.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1797099.cHJ4v7p7Pn
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkwuzMIACgkQXJ70z+XgVcNgMACeK2Wtz5B6fcApgyjO1lgH3q5N
gfsAoORtw2DToCFRld7TK4d3YIRgpKCC
=nX+Y
-----END PGP SIGNATURE-----

--nextPart1797099.cHJ4v7p7Pn--
