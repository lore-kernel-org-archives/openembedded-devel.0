Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S88Ku-0000SZ-EC
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 11:55:12 +0100
Received: by wera1 with SMTP id a1so2673100wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 03:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=d0q18iJ1y8s9KTOwOGdH+zd21jBlxba5YCiW0jYthzs=;
	b=g6hj0TTQP/RCQe4SlhWf5M/NUmR9tzOEe/72oTlYpL1kNf1ImDG5zyOEVGw/LtxXWf
	X6EBod6fWdq4JoeWBh7shabEjdn1NCV+7MSxBBMyge7/foBwd5BmUJER9+bJgfVzkIOT
	QIrt6/9fqugU6MGNO8Et2R7+MWUF9sKCedu20bYcJGPKJGz9CMy/gWrG7PbemlHkqxRK
	pfcDup7LAA8N6Ex03TUI9eWTGGoaEGmqNBs7MIRb3EZV+AsPo9s/5lncNuD4Uq738E6z
	+Vfq/kBcQvKuZHGrkTzfg2tm6RxvF2yNylSE5LI98t9NHlhJUvvLUWcNJd/xdL1EpPGB
	RTbw==
Received: by 10.216.136.13 with SMTP id v13mr3640312wei.32.1331808386129;
	Thu, 15 Mar 2012 03:46:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm4092265wia.11.2012.03.15.03.46.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 03:46:25 -0700 (PDT)
Date: Thu, 15 Mar 2012 11:46:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20120315104623.GG4973@jama.jama.net>
References: <cover.1331754944.git.Martin.Jansa@gmail.com>
	<7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
	<4F61C710.3030901@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4F61C710.3030901@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-efl][PATCH 1/5] midori: upgrade to 0.4.4
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
X-List-Received-Date: Thu, 15 Mar 2012 10:55:12 -0000
X-Groupsio-MsgNum: 37779
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ahP6B03r4gLOj5uD"
Content-Disposition: inline

--ahP6B03r4gLOj5uD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2012 at 04:40:16AM -0600, Gary Thomas wrote:
> On 2012-03-14 13:59, Martin Jansa wrote:
> > * custom waf to fix dirty vala version was dropped
> > * I've fixed our vala to stop reporting dirty even for valid released t=
arballs
> >    so you can still get dirty version but it's not so common to keep th=
is ugly binary here.
> > * disable PARALLEL_MAKE to improve our chances agains build hangs
> >    (btw fedora is doing the same
> >     http://osdir.com/ml/scm-fedora-commits/2011-11/msg04672.html)
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>=20
> I have a few questions about midori that I'm having trouble with.
> * Where does this come from?  Is there a project web page?  There's
>    no real indication in the recipes that I can find.
> * Who/where can I go to with problems and/or questions?  The version
>    I've been using (0.4.3) isn't very stable and has some "interesting"
>    behaviours I'd like to have addressed.
>=20
> Any pointers happily accepted, thanks

http://www.twotoasts.de/index.php?/pages/midori_summary.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ahP6B03r4gLOj5uD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9hyH8ACgkQN1Ujt2V2gBwedwCgruilmqSKn3YXgDbWK0rAnq0V
TW0AoIyra7yvdruVcYdri+YErE6zr+gU
=zpxp
-----END PGP SIGNATURE-----

--ahP6B03r4gLOj5uD--
