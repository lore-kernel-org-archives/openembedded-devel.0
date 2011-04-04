Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q6fwU-0005jm-7G
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 11:19:26 +0200
Received: by bwz5 with SMTP id 5so3998438bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=j8/qbB+kXBwsiOim0lcNyL1O11WpcFdG4KlrIMVlU38=;
	b=Z0kcn63IPqmK9rq2vnM3z31CAAj5bn6j/zlgw2VCnyzbImMrZ+ljFOhdx64u1AReXD
	tIzTiMZ826mT3lCkC3B5E1RNAEQ5++8rGb0856gitjn37B65u/ZKcAmR047lhn0ebcYS
	kOi7s26vzPBVIjLUwYpSBIbJXL/G8Xz3Ashfw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=LOOsZ2kdibzrAJ2SCNOJas0n3RxAVsXPURVMRgTfV8R8CV/uWk2ks52fQqbxBiA+yr
	gK79z4n5jRdgtQWsRznaTahxGyPsm9LBv1zHJYUxjmsBXiwh+hNVW4wcAoXqKgZzVJqH
	99Pg8mxIQoSR6UJErHMW7ta21i7m6im0TKDEM=
Received: by 10.204.229.193 with SMTP id jj1mr2183773bkb.21.1301908639822;
	Mon, 04 Apr 2011 02:17:19 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm2936325bkl.1.2011.04.04.02.17.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2011 02:17:17 -0700 (PDT)
Date: Mon, 4 Apr 2011 11:17:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110404091715.GC11838@jama.jama.net>
References: <1301600399-32041-1-git-send-email-philippedeswert@gmail.com>
	<1301602980.3988.18.camel@mattotaupa>
	<AANLkTikL73GsmeB8pqSGMPjD972MhjsCOE+reTLKjxk+@mail.gmail.com>
	<1301652035.3951.49.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1301652035.3951.49.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 04 Apr 2011 09:19:26 -0000
X-Groupsio-MsgNum: 30886
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline

--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2011 at 12:00:35PM +0200, Paul Menzel wrote:
> Dear Philippe,
>=20
>=20
> Am Freitag, den 01.04.2011, 10:25 +0300 schrieb Philippe De Swert:
>=20
> > Thanks for the review.
>=20
> No problem.
>=20
> > On 31 March 2011 23:23, Paul Menzel <paulepanter@users.sourceforge.net>=
 wrote:
> > > Am Donnerstag, den 31.03.2011, 22:39 +0300 schrieb Philippe De Swert:
> > >
> > > =BBeio: add initial recipe (svn)=AB  or something like that would be a
> > > better commit summary in my opinion.
> >=20
> > I'll keep that in mind
>=20
> Additionally =BB[PATCH [1/2]]=AB seems to confuse `git am` to use
>=20
> 	] eio: New recipe for eio
>=20
> as the commit summary. So only no nested brackets please.
>=20
> I found one other problem. The license is LGPL 2.1+ and not MIT or BSD
> [1].
>=20
> > >> +
> > >> +# Some upgrade path tweaking
> > >> +AUTO_LIBNAME_PKGS =3D ""
> > >
> > > What upgrade patch?
> >=20
> > Yeah I should have double checked that... Just put it there as all the
> > other enlightenment .inc files had it.
>=20
> Maybe Martin can comment on that.

Don't know if eio will part in next efl release (1.1.0 probably), but
libeio-ver-pre-svn-09 is not nice package name anyways, so I vote to
keep it for future upgrade path :).

>=20
> > >> diff --git a/recipes/efl1/eio_svn.bb b/recipes/efl1/eio_svn.bb
> > >> new file mode 100644
> > >> index 0000000..6a12dcf
> > >> --- /dev/null
> > >> +++ b/recipes/efl1/eio_svn.bb
> > >> @@ -0,0 +1,13 @@
> > >> +require eio.inc
> > >> +
> > >> +SRCREV =3D "${EFL_SRCREV}"
> > >> +PV =3D "0.1.0+svnr${SRCPV}"
> > >> +PR =3D "${INC_PR}.0"
> > >> +DEFAULT_PREFERENCE =3D "-1"
> > >
> > > It is the only recipe, so `DP =3D "-1"` should not be useful.
> >=20
> > Just wanted to be future proof for when the actual versioned recipes co=
me.

Also fine with DP =3D "-1" (even on only one version in this case)=20
in case there will be eio_1.1.0.bb

> I think it should be adapted if there is a recipe for a released
> version.
>=20
> Please resend the patch as [PATCH 1/2 v2] after Martin has commented.

For me, just fix LICENSE and I'm fine with it (just overlooked license
in off-list review).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2ZjJsACgkQN1Ujt2V2gBwiywCgjM765kYmPgUjgy6F6O5iAYMa
S8EAoIu/T2+D8xaF0gUNs3RkXcVSqZoH
=Ni/D
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--
