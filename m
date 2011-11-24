Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RTYnx-0001Mc-Sc
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 13:53:29 +0100
Received: by wwo1 with SMTP id 1so3141865wwo.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 04:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jyq97Qk301yOwuSjCLtU6W7pu+hHghShm3U4Wl3A6tw=;
	b=iVRCJHHbALHz7VoionyXkuQbYDznDxSo4uHWDw6E7tQtTmTKR+FfmUK2RIa1kcT3Qx
	0RRkDNFJ2yXeqhZdkNAKiCDR1yRuhlGgEMEg8a/R289NKH4A1/rC3OxA2vGtOhVktZ9T
	fo+E8VzCLU+TCnZzyIsfDsmWc+GVWW2KSKOSk=
Received: by 10.180.91.8 with SMTP id ca8mr28114775wib.22.1322138816352;
	Thu, 24 Nov 2011 04:46:56 -0800 (PST)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	fy13sm24050696wbb.18.2011.11.24.04.46.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 04:46:55 -0800 (PST)
Date: Thu, 24 Nov 2011 13:46:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111124124642.GW3565@jama.jama.net>
References: <cover.1322129758.git.Martin.Jansa@gmail.com>
	<CAAQYJAv=z6msRfaR3bj7PfWrm=tuv8opBPjfD9nkpSrwAUgRbQ@mail.gmail.com>
	<CAAQYJAvgLfieUK43nQOKL+H6omoXjuASrwPP4GZFc66bL+WMrg@mail.gmail.com>
	<11302548.rhDq0zLurQ@helios>
MIME-Version: 1.0
In-Reply-To: <11302548.rhDq0zLurQ@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld 4/6] linux-kexecboot: don't disable DEBUG, PRINTK, BUG with CMDLINE_DEBUG not just loglevel=3
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
X-List-Received-Date: Thu, 24 Nov 2011 12:53:30 -0000
X-Groupsio-MsgNum: 35577
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v6gilOcl2gU05R9Q"
Content-Disposition: inline

--v6gilOcl2gU05R9Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2011 at 12:42:56PM +0000, Paul Eggleton wrote:
> On Thursday 24 November 2011 13:38:53 Andrea Adami wrote:
> > On Thu, Nov 24, 2011 at 12:01 PM, Andrea Adami <andrea.adami@gmail.com>
> > wrote:
> > > The weak point is EXTRA_IMAGE_FEATURES =3D "debug-tweaks" , default in
> > > local.conf.
> > Hm.. and what about using  "tools-debug" instead?
>=20
> I realise we've already done it here and elsewhere (e.g. dropbear) but I'=
m not=20
> hugely keen on configuration of individual recipes being dependent on=20
> IMAGE_FEATURES - it's not supposed to be allowed AFAIK.

I'm fine with keeping default CMDLINE_DEBUG set to just loglevel=3D3 and
debug can be set from local.conf or linux-git.inc if needed.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--v6gilOcl2gU05R9Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7OPLIACgkQN1Ujt2V2gBwogACffTwA46z0SEHBivnmLp7E8QAk
gLEAn3UTRDFLP2paaalsYG8++DetgOyU
=SoO4
-----END PGP SIGNATURE-----

--v6gilOcl2gU05R9Q--
