Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q5bBc-0008Ix-1l for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 12:02:36 +0200
Received: from f053035217.adsl.alicedsl.de ([78.53.35.217]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q5b9g-0007uP-W6 for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 10:00:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikL73GsmeB8pqSGMPjD972MhjsCOE+reTLKjxk+@mail.gmail.com>
References: <1301600399-32041-1-git-send-email-philippedeswert@gmail.com>
	<1301602980.3988.18.camel@mattotaupa>
	<AANLkTikL73GsmeB8pqSGMPjD972MhjsCOE+reTLKjxk+@mail.gmail.com>
Date: Fri, 01 Apr 2011 12:00:35 +0200
Message-ID: <1301652035.3951.49.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH [1/2]] eio: New recipe for eio
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
X-List-Received-Date: Fri, 01 Apr 2011 10:02:36 -0000
X-Groupsio-MsgNum: 30836
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ncPjFe6OHoI82aAywEnK"

--=-ncPjFe6OHoI82aAywEnK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Philippe,


Am Freitag, den 01.04.2011, 10:25 +0300 schrieb Philippe De Swert:

> Thanks for the review.

No problem.

> On 31 March 2011 23:23, Paul Menzel <paulepanter@users.sourceforge.net> w=
rote:
> > Am Donnerstag, den 31.03.2011, 22:39 +0300 schrieb Philippe De Swert:
> >
> > =C2=BBeio: add initial recipe (svn)=C2=AB  or something like that would=
 be a
> > better commit summary in my opinion.
>=20
> I'll keep that in mind

Additionally =C2=BB[PATCH [1/2]]=C2=AB seems to confuse `git am` to use

	] eio: New recipe for eio

as the commit summary. So only no nested brackets please.

I found one other problem. The license is LGPL 2.1+ and not MIT or BSD
[1].

> >> +
> >> +# Some upgrade path tweaking
> >> +AUTO_LIBNAME_PKGS =3D ""
> >
> > What upgrade patch?
>=20
> Yeah I should have double checked that... Just put it there as all the
> other enlightenment .inc files had it.

Maybe Martin can comment on that.

> >> diff --git a/recipes/efl1/eio_svn.bb b/recipes/efl1/eio_svn.bb
> >> new file mode 100644
> >> index 0000000..6a12dcf
> >> --- /dev/null
> >> +++ b/recipes/efl1/eio_svn.bb
> >> @@ -0,0 +1,13 @@
> >> +require eio.inc
> >> +
> >> +SRCREV =3D "${EFL_SRCREV}"
> >> +PV =3D "0.1.0+svnr${SRCPV}"
> >> +PR =3D "${INC_PR}.0"
> >> +DEFAULT_PREFERENCE =3D "-1"
> >
> > It is the only recipe, so `DP =3D "-1"` should not be useful.
>=20
> Just wanted to be future proof for when the actual versioned recipes come=
.

I think it should be adapted if there is a recipe for a released
version.

Please resend the patch as [PATCH 1/2 v2] after Martin has commented.


Thanks,

Paul


[1] http://trac.enlightenment.org/e/browser/trunk/eio/COPYING?rev=3D57852

--=-ncPjFe6OHoI82aAywEnK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2VokMACgkQPX1aK2wOHVhA+QCfTuHEkH71IQzqrGL58pB+mizb
zkwAnRNa1RlAiqvpWVzoluCL6Yi0v85F
=r60/
-----END PGP SIGNATURE-----

--=-ncPjFe6OHoI82aAywEnK--
