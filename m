Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFkGy-0006u1-4S
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 12:55:10 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so379714dak.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 04:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TGW/M2BKTg5Am0S+nrgd8khmxvv3v8DYJuba25cIV0Q=;
	b=jKogziBw0tfYMHluNh3T/y3bcliuu+Fsm26bSLxM2tBGMd3rXcTDLI6F27Re1LGz4T
	zkM58Nd6+KXExwPOk05npd5F9Kxt2atv+TMtsy2Y5/zceRlyz6IoDAtmhiRzqkYuaF09
	NAyGzQm8eTLXmWgaTTTJtwVqazEfnyJIKXL1fLHZcaTMND9Y/o8B+VhBdcfLWZxF/4qn
	4z+gvBu4vPBbyBd2oSOGVYxNbIk00GzuUad8YhZBJKslpMwYFgY7YNdLzn4ZR0UTh30C
	MLCyqLk8hchMtc/H3mIpCpaBUQusT3c3/qbSDbU3unU0WSZsFB6a2G/ka8NGoEQEe56y
	pmcg==
X-Received: by 10.68.12.103 with SMTP id x7mr44920312pbb.37.1363174706687;
	Wed, 13 Mar 2013 04:38:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id in5sm20587906pbc.20.2013.03.13.04.38.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 04:38:25 -0700 (PDT)
Date: Wed, 13 Mar 2013 12:38:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313113817.GG3260@jama>
References: <1363101364-9498-1-git-send-email-obi@opendreambox.org>
	<khnima$5nr$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <khnima$5nr$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] layer.conf: add distro-feed-configs to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Wed, 13 Mar 2013 11:55:12 -0000
X-Groupsio-MsgNum: 43518
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MiFvc8Vo6wRSORdP"
Content-Disposition: inline

--MiFvc8Vo6wRSORdP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2013 at 04:47:28PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 12-03-13 16:16, Andreas Oberritter schreef:
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org> --- This patch
> > was sent for the first time about a year ago. Back then, Koen didn't
> > apply it, because "distro-feed-configs does the wrong thing". in his
> > opinion. However, distro-feed-configs persists today and is still getti=
ng
> > used.
>=20
> I vote to delete it and have distros put it in their distro layer.

I vote to apply this patch and later we can delete it (and people moving
it to distro layer won't forget to add it in their layer.conf's
SIGGEN_EXCLUDERECIPES_ABISAFE).

>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFRP04QMkyGM64RGpERApbpAKCWnDZc1FHev5kXNTeTnmLZjUJddQCgi5TF
> 7094ThlWvhgK2tSqncmc5cM=3D
> =3D+in0
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MiFvc8Vo6wRSORdP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAZSkACgkQN1Ujt2V2gBw5OACgnjSQvvW5CrRNuwkBFFKg6iCJ
h/gAoLpbx6fML+kGmDJgv3AOQkETTQQ2
=jdOx
-----END PGP SIGNATURE-----

--MiFvc8Vo6wRSORdP--
