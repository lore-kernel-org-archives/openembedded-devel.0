Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiNtv-0001RU-KL
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 12:21:34 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so1545535wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 03:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EAOjuVzykn3CGyGjb44MrMWu70gXDAoee67+scBtUDs=;
	b=t9YhUOWDRZ9L8fyir6cdCxu9lBvEQ9k5HFhuH4PzW+8NyTq442T6FjR3RX4G10WPSM
	ggk56u4VJZh86GJFBol4dM762VdJlb8YtjiLU8KzQnGwvWWx8nKk2arr6DodJhN4LGRO
	mqrBRV7XYQq4wJ2aUsdrrr4Rfv77Ogdr663nl8GwELRGnKbYDruChiMTleVTCG9Dv1Ox
	F/9xLwgs2r4P13ooqVr+TWf5MUELoF36u/0v0Fub83cAvfoJs9mMP/0eO2XOfYSY2Fdp
	VNbXFxeijGtlOsnF8gxBLR7wzXk2e2mdONGuQnOPxeHeKhiC7r2BHzD6f7f37/Qswsun
	B6gA==
Received: by 10.181.13.75 with SMTP id ew11mr16101018wid.9.1355224015675;
	Tue, 11 Dec 2012 03:06:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s10sm1018014wiw.4.2012.12.11.03.06.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 03:06:55 -0800 (PST)
Date: Tue, 11 Dec 2012 12:07:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121211110709.GA2035@jama.jama.net>
References: <1354318947-12109-1-git-send-email-andrea.adami@gmail.com>
	<CA+chaQfU+Ehchj46abTkNcAnFO5rCCq5xSeY85TSJHigHURQEw@mail.gmail.com>
	<CAAQYJAsR7PHXN1=TP9emD0eaon+7ZC=4erkZoyzOjK=BVvySuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAsR7PHXN1=TP9emD0eaon+7ZC=4erkZoyzOjK=BVvySuA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH] linux-yocto_3.4: initial commit for Zaurus
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
X-List-Received-Date: Tue, 11 Dec 2012 11:21:34 -0000
X-Groupsio-MsgNum: 42082
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2012 at 11:39:37AM +0100, Andrea Adami wrote:
> On Tue, Dec 11, 2012 at 11:22 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Sat, Dec 1, 2012 at 12:42 AM, Andrea Adami <andrea.adami@gmail.com> =
wrote:
> >> * based on linux-yocto-standard cfg fragments
> >> * kernel 3.4 boots though size is too big
> >> * put together pending/submitted patches
> >> * for the moment DEFAULT_PREFERENCE =3D "-1"
> >
> > This bbappend is changing D_P for all machines including qemu* where
> > it's causing downgrade from 3.4 to 3.2 unless P_V is specified.
>=20
> My bad.
> Should I limit it setting specificly DEFAULT_PREFERENCE_spitz =3D "-1"
> and so on for other machines?

Yes that would be better.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDHE90ACgkQN1Ujt2V2gBx2JQCgqcYsUMO25rDKdOoo1X2EDeyX
Ml4An1ul7W8cv+yc55nceNOh0J2/INvH
=itAJ
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
