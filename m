Received: from mail-dy0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGHWE-0000wj-5w
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 23:48:18 +0200
Received: by dye36 with SMTP id 36so64169dye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 14:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0W7crJcmF/xJ7n2EC5xyJkwzGnx5ofXPT7BrAq5+suk=;
	b=GTR01uBlBvbalC76xdOIY8qe6JLtcyjzJRtD2BTz+Wk1sxNtGLRdKU+WzRlJT0x/bq
	FiFIcLaCbmFqmECYTrGzsSs0MXpqvMS1Qu1uHXLVBu9hzJVpQCMrP91fUDpleZLRUYCF
	0v1+svTLLuGvjjp3ojorAUSrS+J2ESAV5FEgw=
Received: by 10.223.63.75 with SMTP id a11mr6619272fai.9.1318974146651;
	Tue, 18 Oct 2011 14:42:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r24sm1080036faa.8.2011.10.18.14.42.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 14:42:25 -0700 (PDT)
Date: Tue, 18 Oct 2011 23:42:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018214220.GG556@jama.jama.net>
References: <j7gllt$s0$1@dough.gmane.org> <20111018203818.GD556@jama.jama.net>
	<20111018204954.GA27472@sakrah.homelinux.org>
	<20111018211015.GE556@jama.jama.net>
	<20111018213635.GD27508@sakrah.homelinux.org>
MIME-Version: 1.0
In-Reply-To: <20111018213635.GD27508@sakrah.homelinux.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Patchwork breaking submitters name Was: Patchwork hooks for meta-oe active and working
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
X-List-Received-Date: Tue, 18 Oct 2011 21:48:18 -0000
X-Groupsio-MsgNum: 34885
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline

--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 02:36:35PM -0700, Khem Raj wrote:
> On (18/10/11 23:10), Martin Jansa wrote:
> > On Tue, Oct 18, 2011 at 01:49:54PM -0700, Khem Raj wrote:
> > > On (18/10/11 22:38), Martin Jansa wrote:
> > > > On Mon, Oct 17, 2011 at 09:32:13AM +0200, Koen Kooi wrote:
> > > > > -----BEGIN PGP SIGNED MESSAGE-----
> > > > > Hash: SHA1
> > > > >=20
> > > > > Hi,
> > > > >=20
> > > > > Thanks to Khem the patchwork hooks for meta-oe (and hence meta-ef=
l,
> > > > > meta-gnome and meta-xfce) are active and working.
> > > > > Once the commits hit the OE server the state will get updated aut=
omatically,
> > > > > so the submitter will instantly know when his/her patch has hit t=
he repo.
> > > > >=20
> > > > > regards,
> > > >=20
> > > > There is known and fixed issue with patchwork breaking author name
> > > >=20
> > > > We have an example in patch
> > > > "[meta-oe] lightmediascanner: Add version 0.4.4 (initial recipe)"
> > > > Original e-mail says "Pau Espin Pedrol <pespin.shar at gmail.com>"
> > > > http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-Octobe=
r/035644.html
> > > >=20
> > > > older patchwork instance says only "pespin <pespin.shar at gmail.co=
m>"
> > > > http://patches.openembedded.org/patch/13323/
> > > > newer patchwork instance says also "pespin <pespin.shar at gmail.co=
m>"
> > > > http://patchwork.openembedded.org/patch/13323/
> > > >=20
> > > > Same problem was reported also on LKML
> > > > https://lkml.org/lkml/2011/9/18/128
> > > > And later fixed by Jeremy Kerr
> > > > https://lkml.org/lkml/2011/9/18/149
> > > >=20
> > > > Can we get this upstream fix to our patchwork instance too?
> > >=20
> > > This patch is already applied to the new patchwork instance on
> > > patchwork.openembedded.org however it was only yesterday when it came
> > > into life.
> >=20
> > But still it doesn't work today:
> > http://patchwork.openembedded.org/patch/13437/
> >=20
> > and from Kerr's reply I'm not sure if someone has to fix something in
> > patchwork database or if registered users can fix it in their profile
> > page.. or maybe he fixed only Submitter fields for existing patches in
> > database..
>=20
> yes the user profile for existing users have to be updated which I have
> done for Pau now. So it should be ok. Please re-check the patchwork.

Almost :), there is missing 'l'
=46rom: Pau Espin Pedro
=46rom: Pau Espin Pedrol

Is it possible for registred patchwork user to update it or do we need
to ask you when we found similar issue for someone else?

Thanks!

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6d8rsACgkQN1Ujt2V2gBxYDgCdGR3m86AL7mI49YbFTxbFGLO+
03EAoK5XKQkkXYDUS9SGssKUwwZDbBxf
=u+S9
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--
