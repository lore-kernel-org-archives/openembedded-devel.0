Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q6kxX-0001Sk-7M
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 16:40:52 +0200
Received: by bwz5 with SMTP id 5so4207902bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 07:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=QXC6opQokDAA+8ygBnv8pkyk0LmjOwuHRnKRLVpiwsw=;
	b=dwxi3eZvd+0B+3bFcr3iF2fvcvAIAT4G6wWOVWGwJ/IgUOxVNjtxAWbPLN1xbNMfGO
	zjT07Vni2quPDKHszANkMVQ1F6QstRX3Uk2zYs4qCxZUrES2+WH7vuFzb6o99HHgBZ+G
	R9NNP5hYrIRtj/pTCAtx2E5IEQf1RhA/YBg4E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FxnC83y8oxFA2427h/ujO+3xHX9SjLfvjiVZwK4eL1H71IWJEHLgwQhgC+Ml8vb7qc
	40dHxJJIWNedx8AkjMAV24VZIYHhP+RJ/p7laxS4Ty+9wIVVOVxiDq4IF4QdEUsYrG2c
	eM17+fh5HkbZsTs9EwmvBCc6FPcF6LDIJwBkk=
Received: by 10.204.188.66 with SMTP id cz2mr2521224bkb.90.1301927926389;
	Mon, 04 Apr 2011 07:38:46 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b6sm3135016bkb.22.2011.04.04.07.38.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2011 07:38:45 -0700 (PDT)
Date: Mon, 4 Apr 2011 16:38:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110404143838.GD11838@jama.jama.net>
References: <4D99D609.8020800@mlbassoc.com>
 <4D99D689.9050705@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4D99D689.9050705@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Master broken?
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
X-List-Received-Date: Mon, 04 Apr 2011 14:40:52 -0000
X-Groupsio-MsgNum: 30897
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline

--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2011 at 08:32:41AM -0600, Gary Thomas wrote:
> On 04/04/2011 08:30 AM, Gary Thomas wrote:
> > I just updated to org.openembedded.dev 556819235f501bf762c8d8cc9f41a1a8=
244b106f
>=20
> To be clear, local.conf includes these settings:
>    DISTRO =3D "angstrom-2008.1"
>    MACHINE =3D "beagleboard"
>    IMAGE_PKGTYPE ?=3D "ipk"
>=20
> > Now I get these errors during the initial parse:
> > $ bitbake xfce-image
> > NOTE: Handling BitBake files: | (0046/7335) [ 0 %]ERROR: global name 'r=
untime_mapping_rename' is not defined while parsing /local/Angstrom_BeagleB=
oard/openembedded
> > /recipes/images/x11-gpe-image.bb
> > NOTE: Handling BitBake files: \ (0053/7335) [ 0 %]ERROR: global name 'r=
untime_mapping_rename' is not defined while parsing
> > /local/Angstrom_BeagleBoard/openembedded/recipes/images/angstrom-gnome-=
image.bb
> > NOTE: Handling BitBake files: \ (0113/7335) [ 1 %]ERROR: global name 'r=
untime_mapping_rename' is not defined while parsing
> > /local/Angstrom_BeagleBoard/openembedded/recipes/images/helloworld-imag=
e.bb
> > ... etc
> >
> > What am I missing?

angstrom-2008.1

http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2011-March/00438=
3.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2Z1+4ACgkQN1Ujt2V2gBwbtACgmzeNyyaP2Y9HiqYlDHKoopNY
bwEAoKYNrkKLaBG0kPhQ4aJ/1Ff8TIwL
=Raqe
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
