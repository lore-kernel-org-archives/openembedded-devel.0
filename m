Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFAF7631D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 16:28:11 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so124600880wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lqEN/yzcb9XuP4ghAY0j6OV3O1/dWcAikOqbwu8ZZXQ=;
	b=KUs/nLS+J3hDIxPcCr3oz8oB9kabmYdOmoztb9eGuIHCyfvihZtK+7KVifciHVGCd6
	8vNyICLHoJEELehkGeWQZGVZZPADVqZUA3gMairedX2kOH2d/F7hAxVUFbyXPGRaw4/r
	V/034L37v12F6wUilqS4d7jOy758E8mj+LUvzAlfBc07Zz0tS0UDAs+LgxrZ1wulGiFA
	pFM4OcVeqUm9Oefx29oOYOwE+ByCuFGX+MuRGEdC5M/OaGTyUhLKwvKaBB+mRRB4xdYR
	5akGrwZrVyZByrkVnI3AMSZhX3dFhh/+lS4b0B6UDHTbQvKIZaQJ7+Cx9YVRD6BwoiPi
	xnCg==
X-Received: by 10.194.192.166 with SMTP id hh6mr53990720wjc.127.1438014491431; 
	Mon, 27 Jul 2015 09:28:11 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lm16sm13014179wic.18.2015.07.27.09.28.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 09:28:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Jul 2015 18:28:14 +0200
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20150727162814.GD307@jama>
References: <1430198723-7927-1-git-send-email-b40290@freescale.com>
	<CAP9ODKpqxGuYYWndomz2VdVrKSm6RonyJKR6O_goXWQAg+kkvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpqxGuYYWndomz2VdVrKSm6RonyJKR6O_goXWQAg+kkvA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][fido][PATCH] lmsensors-config: fix a warning about not existant S
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
X-List-Received-Date: Mon, 27 Jul 2015 16:28:12 -0000
X-Groupsio-MsgNum: 56393
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Content-Disposition: inline

--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2015 at 08:00:49AM -0300, Otavio Salvador wrote:
> On Tue, Apr 28, 2015 at 2:25 AM,  <b40290@freescale.com> wrote:
> > From: Chunrong Guo <B40290@freescale.com>
> >
> >   Set the S variable to $WORKDIR to remove the warning about S being no=
t existant
> >   (which is true for this package, since there are no original sources =
for it).
> >
> > Signed-off-by: Chunrong Guo <B40290@freescale.com>
>=20
> This is exactly the same commit:
> addfb0b786c90333a70873bb715d84c97412b3c9 so instead of redoing it, you
> should cherry-pick it.
>=20
> Martin, please cherry-pick addfb0b786c90333a70873bb715d84c97412b3c9
> and 4a4b9d25db86111872c73daaa2116addfb3d26e1

Cherry-picked to fido-next.

>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW2XB4ACgkQN1Ujt2V2gBwPFACgjuMgGdN11ylqIj/DFXr/ca3v
am8AoImOIjsLO8gpBsPXTYw+KBzzUssC
=uirD
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
