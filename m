Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T6pdC-00036I-7d
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 23:16:59 +0200
Received: by wgbdr1 with SMTP id dr1so707681wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 14:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FQ+nUIXjv+zin+eXfcfi6lyVf1q/3l8vrwXRv27I4xo=;
	b=SnXnKQpVhBAGbBdYIj3GfQ0PiDzOx4XSstNXwAD5X2qyahb2xhxkU74GkIeGCfj/1e
	ruFuakAvgpI0fm495hkGE++9mX5uxS6bxUqDunYb6BPaLkwp/CHayaKZb6tYvBgFQC4P
	Aht+DFhChIVCV0uVyxkI8Qj3uzEbjK1WV5EjpKM4BrpjKml+bDnRwjHK1GX7Je77Wnsw
	V6uIerTVMMKWsD5NBlRlcn5MFag9KVibTrWJBz+fXvoyEuhXdyMWEQf9Db7AgDATmIgT
	yCtV/Bu4E35NyvS4hyhsipNuR/j+VI3H0naTk6Ofg71B3Xkkv+0ABSi4LC2rU8tkztIR
	zNQw==
Received: by 10.216.241.198 with SMTP id g48mr1694295wer.153.1346274283738;
	Wed, 29 Aug 2012 14:04:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm12067776wib.10.2012.08.29.14.04.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 14:04:40 -0700 (PDT)
Date: Wed, 29 Aug 2012 23:04:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120829210456.GC3287@jama.jama.net>
References: <1346247150-17236-1-git-send-email-ross.burton@intel.com>
	<3DA568F2-7691-4344-904C-7DB6FFBF90B9@gmail.com>
	<CAJTo0LYGOrwT1BwB8gDmGwMr67v8Mhtci8MK_QdHm9AW7EeDFA@mail.gmail.com>
	<CAMKF1srEAmTthOBC6D23uCfO6YW=ZD-BW+mF4UZYwdFbXyKrjg@mail.gmail.com>
	<CAJTo0LZbKRBWdASi54gO7NvemP_Y3vzvk+w8KD+gVFqFadwwgA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZbKRBWdASi54gO7NvemP_Y3vzvk+w8KD+gVFqFadwwgA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] pimlico: remove Poky overrides
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
X-List-Received-Date: Wed, 29 Aug 2012 21:17:00 -0000
X-Groupsio-MsgNum: 40400
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline

--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 29, 2012 at 08:22:08PM +0100, Burton, Ross wrote:
> On 29 August 2012 18:34, Khem Raj <raj.khem@gmail.com> wrote:
> > Patch is fine.
> > it should go into meta-yocto which is integration layer for poky distro
> > so you patch to delete is fine. may be convert it to some sort of PACKA=
GECONFIG
> > which distros can use.
>=20
> I don't want them in Poky. :)  I started by simply deleting them, but
> Martin insisted that he still has users.  They are not using Poky, I
> presume.

No, they are not using Poky, so I'm fine with removing all poky
overrides and poky-only patches from meta-oe.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA+g/gACgkQN1Ujt2V2gBwLuACgppclJ2nSZiCKMaYpNLJAigjT
6F8AnRhg0B+aSpcS5Z8dzecS3PoNmIuZ
=ga/w
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--
