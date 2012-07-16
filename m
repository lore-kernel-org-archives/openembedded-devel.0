Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqppc-00055Q-UR
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 20:15:40 +0200
Received: by bkcik5 with SMTP id ik5so3794941bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 11:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8svgK5oi7W5nCHdpcspoN+95/vV5QonydDyKcT1zjnE=;
	b=pKS1BtR5Dejaf1kLdTC3uTfcFx/VwOXfsR/2tQgFQejoYEJtESZh2Hq5aGTVVyrCXX
	SX+/S+sVnqzEx3Fp+YWd+LqnL0ZAlBER9hymdlkYO/KZmE3LY1qfJNcGxrADDL9hyAOU
	5+i9W2P87sAotUTDHrSwpTF6wraV3qBPCq5arzZ0vMayrLvHGntVAsgrQtiSe4qJkN5E
	JjRyeqYVrvYrCICJ7/WPnh/KTvyNnfjNOY6sMaI/U1ehvh3nZ/Ml1SsevhwswW4yqS8w
	tKmkrE/VvA+v8QRyTjP8Q3uD+8RSlDf1d+Im0I1aLuxRsbCViCkxZji7s6/iG8MsgDm8
	rHow==
Received: by 10.204.154.141 with SMTP id o13mr5150125bkw.72.1342461862672;
	Mon, 16 Jul 2012 11:04:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g6sm8657232bkg.2.2012.07.16.11.04.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 11:04:21 -0700 (PDT)
Date: Mon, 16 Jul 2012 20:04:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120716180430.GN3729@jama.jama.net>
References: <1342460316-5489-1-git-send-email-raj.khem@gmail.com>
	<1342460316-5489-3-git-send-email-raj.khem@gmail.com>
	<20120716174642.GK3729@jama.jama.net>
	<CAMKF1so4v-Sjm6sgHY4U_d7CwwwGp4DfQc0CSOq75n2kFwYvvA@mail.gmail.com>
	<20120716175819.GM3729@jama.jama.net>
	<CAMKF1sqmBCMU4WgjzVWfukUpxV4enTs_7=bSw+kFhUWUEQ+HeQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqmBCMU4WgjzVWfukUpxV4enTs_7=bSw+kFhUWUEQ+HeQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][meta-oe][PATCH 3/3] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Mon, 16 Jul 2012 18:15:41 -0000
X-Groupsio-MsgNum: 39696
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rzq/nSLlHy1djmXS"
Content-Disposition: inline

--Rzq/nSLlHy1djmXS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 11:00:37AM -0700, Khem Raj wrote:
> On Mon, Jul 16, 2012 at 10:58 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >
> > Yes, but that would require distro config to be updated from
> > ANGSTROM_BLACKLIST_PN to PNBLACKLIST[pn] at the same time this class is
> > moved or duplicate all blacklist entries now and then remove
> > ANGSTROM_BLACKLIST_PN after it's moved..
>=20
> synchronisation can be worked out if you are willing.

Yes, it can and I'm willing to do it.. that's why haven't responded just
with NACK :).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Rzq/nSLlHy1djmXS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAEV64ACgkQN1Ujt2V2gBx49gCdEk6E2XuYY1rixEqmOvEAAOSU
qrgAn3NhtWSbpxjNVV5ULeigLyJa6GGI
=H7rA
-----END PGP SIGNATURE-----

--Rzq/nSLlHy1djmXS--
