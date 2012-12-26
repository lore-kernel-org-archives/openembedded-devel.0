Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tnq3P-00042w-9L
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Dec 2012 13:25:56 +0100
Received: by mail-ee0-f44.google.com with SMTP id b47so4149512eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2012 04:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=gIjfLSaLJcbJdYd9rYNwJaXxcHc44X8EfAX/Q2dPXjA=;
	b=MEdCjqeKm7I3t7AMZFcW1jGGiBV8O/sDtmbkER5CxVgtq8+nz3NWvtXvztMAfTqXQt
	MS62P/2lRmc6q+TkDrKb+HNgxPhJeA046F5lbgVYOxM4z0Il4IChAX+DdO/oTV57xY2Y
	d3/srb8rHXsO4TpdWcE2CNf8yGvr4ujU0+W8V2grKYoQ61s13D3ZOwwlVPw0cG7VFpmc
	Xfk6NPg8da6dwaOFwAUntCxiPuKuI+JrN0OSVqz4GgtyzbBhFIcTG86IA24GhpvFgmmy
	EKICJyDFJXlMd0t3Mr4M6EJ18dHxU03rnN2HAw0ZuzwioXHllIeZWkJdpERlAaRW/L9T
	tNOw==
X-Received: by 10.14.194.195 with SMTP id m43mr69869677een.44.1356523854700;
	Wed, 26 Dec 2012 04:10:54 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm52851461eeo.11.2012.12.26.04.10.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Dec 2012 04:10:54 -0800 (PST)
Date: Wed, 26 Dec 2012 13:10:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121226121055.GA8988@jama.palm1.palmone.com>
References: <kb31gs$u4d$1@ger.gmane.org> <3053324.FGHdgGAGGN@helios>
	<20121223194558.GL8988@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20121223194558.GL8988@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Ruby and meta-oe?
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
X-List-Received-Date: Wed, 26 Dec 2012 12:25:57 -0000
X-Groupsio-MsgNum: 42415
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mPYgjWmOFizS0g23"
Content-Disposition: inline

--mPYgjWmOFizS0g23
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 23, 2012 at 08:45:58PM +0100, Martin Jansa wrote:
> On Sun, Dec 23, 2012 at 07:40:51PM +0000, Paul Eggleton wrote:
> > On Saturday 22 December 2012 02:14:07 Koen Kooi wrote:
> > > What's the status on getting ruby recipes into a meta-ruby or meta-oe=
? I
> > > just had to import it into my working branch to build mkvtoolnix whic=
h needs
> > > ruby-native for its buildsystem (don't ask).
> >=20
> > The original author never replied to my suggestion about creating a sep=
arate=20
> > layer. Unless there are objections I'd suggest just creating a meta-rub=
y and=20
> > using the patches from patchwork to add ruby into it.
>=20
> Agreed,

Btw: I'm doing this atm, but that recipe on patchwork didn't even have
LIC_FILES_CHKSUMs.

Koen: feel free to sync it with your tested version in follow-up patch.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mPYgjWmOFizS0g23
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDa6U8ACgkQN1Ujt2V2gBzVhQCffegvGPoGagpN5qJzNEGgE/Ff
27MAn0J1Ed4WkC0debca4UqGxJ0tdRWP
=ejpT
-----END PGP SIGNATURE-----

--mPYgjWmOFizS0g23--
