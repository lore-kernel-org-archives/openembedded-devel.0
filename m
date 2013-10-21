Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id A30FD6D159
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 11:09:43 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so3370065eaj.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 04:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GSea2/gX6DQrepdeVWi4WZZRX1BBGAOcJwHwAlH608I=;
	b=h3ORT3mM/Slbk70+ZPv3ttJFnPXD9MTo9V6FDCj7CwP9WWpWu5MZk40GUtk5QrQD1E
	C++yAbFqe1W3fbIYtsUt2D7VjABnQqbfnK8GUMl/L+OBlLd6EqdDi3jlK98J0+cKN6ex
	oSxnf2wf0Ip1IDQFBXZ2DtmgCCKMRyVBXpfTVclLm7JJBgEETpHOz89rm0A0rJi4zMaS
	yvPzQfIhJr6sR1tPDk31nYfBjo7mUuRbt5XrbqSGAhlRqKpki5PLXfNRcFtfRs8/aUa6
	AAimxqGwmhnZjV9COPCDsrf1VSjaVaeCHc9UOxWukrrEY+yJK5mWHgzNZpH3tonD7G8K
	B65w==
X-Received: by 10.14.87.3 with SMTP id x3mr1239517eee.121.1382353785095;
	Mon, 21 Oct 2013 04:09:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id z12sm42478448eev.6.2013.10.21.04.09.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Oct 2013 04:09:44 -0700 (PDT)
Date: Mon, 21 Oct 2013 13:09:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131021110946.GD3709@jama>
References: <2478778.XBk41EpSZr@koontz>
	<544da34b-acbf-44ca-8f84-fd993db893f4@email.android.com>
MIME-Version: 1.0
In-Reply-To: <544da34b-acbf-44ca-8f84-fd993db893f4@email.android.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: Regarding layers and their versioning.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Oct 2013 11:09:44 -0000
X-Groupsio-MsgNum: 46836
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BQPnanjtCNWHyqYD"
Content-Disposition: inline

--BQPnanjtCNWHyqYD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2013 at 09:29:27AM +0100, Anders Darander wrote:
>=20
>=20
> "S=F8ren Holm" <sgh@sgh.dk> wrote:
> >Hello
> >
> >What is the best way to manage a private repo with recipes as well as
> >meta-oe,=20
> >meta-core and meta-angstrom.
>=20
> >Currently I have a private repo that has the layers attached as
> >submodules. Is=20
> >that a crazy setup or what?
>=20
> We're doing the same internally at ChargeStorm. One benefit is that we're=
 having our "master" repo keeping track of all the layers that we're using =
and which revision of those layers.=20
>=20
> Other people / projects just use a shell script checking out the desired =
layers. Some people combines layers into one huge repo (though I'd personal=
ly not recommend that approach). (That'd be similar to how Poky is being ma=
naged).=20
>=20
> Yet other people / projects use repo.=20
>=20
> It's up to what you're comfortable with in the end.=20

I was using Makefile to checkout correct set of layers with correct
revisions for SHR before and then changed it to use layerman script
very similar to script used in angstrom-setup-scripts, because
layers.txt is more "declarative" and easier to update than what I had
in Makefile.

For webos-ports project I use the same.

For webos we recently switched from repo with submodules to repository
with similar script (mcf - this time in python). Mostly because repos
with submodules don't work well when replicating from gerrit to github.

I think that biggest advantage of solution with some script, is that
layers are still standalone checkouts, which developers can use as any
other project (easier to submit patches upstream etc).

And the script
can be more clever than git pull --rebase in repo with submodules, e.g.
for jenkins builds I want to automatically update build configuration in
non-interactive way (because jenkins shouldn't ever keep some local
changes), but for local build I want to preserve developer's local.conf
changes and e.g. extra layers added in bblayers.conf etc.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BQPnanjtCNWHyqYD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJlC3oACgkQN1Ujt2V2gBzf2ACgkx9KbnMANIJimLWxdYVaH+M0
ocIAn1fgS+yriM3LtC1XnEJHGgVd/EiI
=fUnb
-----END PGP SIGNATURE-----

--BQPnanjtCNWHyqYD--
