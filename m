Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 84CFF6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 18:55:43 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id w144so36607486wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 10:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RmAD1ljbjOzD2pwjhppdzK9ZZnhBRjrIL0WcoTTGwSQ=;
	b=iwDGasrraBqgSIzOhnZiOIRTzcwb3VOK1AAvLsAVOExTLVUjes1A+5YbDWaY4ulveT
	3S0tD28Ni0JGbp3zdh8//okqxY4aQByvGTwWrQBOHGH9JfBnQWTfay5PPzMFFaCc6GEh
	wY0J84KRtvdJvXI6mlWcf3KzHaqNcB6tOs9+Fr1RDGi1piXwklrFavF6QYVnnpW+QhEK
	/8pOmaKEoRKCjJphqoyVesUy/HIjKDhtz4qo4vJxWhxT8nxQWDvt68bWMuUvMS0kpPEr
	x2SEviCvFEWOE3wf4AJqqXL+sh/yl8RT2wZNHymbNxm+AZNOcY/51bDnvcjFoqDsD3Gi
	AOVg==
X-Received: by 10.28.170.133 with SMTP id t127mr678938wme.65.1449773743742;
	Thu, 10 Dec 2015 10:55:43 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pn6sm13618509wjb.15.2015.12.10.10.55.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 10:55:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Dec 2015 19:57:26 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151210185726.GP2246@jama>
References: <5669BE05.7030904@webthatworks.it>
 <20151210183026.GN2246@jama>
MIME-Version: 1.0
In-Reply-To: <20151210183026.GN2246@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5] [meta-ruby] jethro: dependencies on xfce-layer and xfconf probably make qt5 unbuildable without X
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Dec 2015 18:55:45 -0000
X-Groupsio-MsgNum: 58965
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V2tfspbppmK1TQo2"
Content-Disposition: inline

--V2tfspbppmK1TQo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 07:30:26PM +0100, Martin Jansa wrote:
> On Thu, Dec 10, 2015 at 07:01:41PM +0100, Ivan Sergio Borgonovo wrote:
> > I was trying to see if I could build
> > core-image-minimal | meta-toolchain-qt5
> > and I stumbled into
> >=20
> > ERROR: Layer 'ruby-layer' depends on layer 'xfce-layer', but this layer=
=20
> > is not enabled in your configuration
>=20
> Why do you use ruby-layer?
>=20
> meta-qt5 no longer requires ruby-layer, because ruby-native was moved to
> oe-core.
>=20
> Similarly imsettings now doesn't need to be in meta-ruby, because it was
> moved there just because of ruby dependency, so now it can be moved
> back.

See "imsettings: Move from meta-ruby to meta-xfce" in master-next

>=20
> Regards,
>=20
> > that probably is due to
> >=20
> > http://patchwork.openembedded.org/patch/107727/
> >=20
> > I'm willing to try to make it "optimal" and I'm trying to figure out=20
> > what it is all about.
> >=20
> > Any help would be apreciated.
> >=20
> > Most probably whatever imsettings is should be optional rather than a=
=20
> > required.
> >=20
> > Of course problem occurs just with jethro, there is no imsettings in=20
> > fido and I've been able to bake and run images for my board without X.
> >=20
> > thanks
> >=20
> > --=20
> > Ivan Sergio Borgonovo
> > http://www.webthatworks.it
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V2tfspbppmK1TQo2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZpyxUACgkQN1Ujt2V2gBxcYwCgmPvrH8T8sc40cZPiPVolpq3C
IpkAoJDHExua/2ujxctI7WAfDA8bToNE
=M7mB
-----END PGP SIGNATURE-----

--V2tfspbppmK1TQo2--
