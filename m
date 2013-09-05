Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 62A7661617
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:45:06 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so881935eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 05:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bfCdCeuf0k7Nav/dDh8mT1sipSFBCyh34kwFHiGhmxQ=;
	b=QzsZLEZX1bOtP9XIjqh7GtSbUQvtR0BbkbMoTtrWJqH9FvgLbD9Uau6eHpxL/ViR6x
	I7+wb/0Yl2KPlFBbrIZVAVG4q7pq+pIdstqb5eheLJ8igmW0kWwBWojXqVUC/RG4NPAZ
	DLRJU/7NBzsejGbxpvTLqwh0PjXsuNptHU9bqSr9x+GFzZqBTJr6NGUc5sxx/TeYVyXW
	zZIeFNJTPU0MWKiB19b109l8NnmqE3lE6gUaa0bxuNHVcu6ga/oaS0NwrpSjQLHQ4TU3
	tTf3vGq19+cCfVbKyeSjKR+vJyB7G1OgqaHBXXL+WIzlEfiKdUyjFK8G0OATdM8KyQP/
	tewg==
X-Received: by 10.14.219.198 with SMTP id m46mr13097520eep.41.1378385107600;
	Thu, 05 Sep 2013 05:45:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm48382308eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 05:45:07 -0700 (PDT)
Date: Thu, 5 Sep 2013 14:46:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130905124627.GK11500@jama>
References: <1378382068-24795-1-git-send-email-javier.viguera@digi.com>
	<20130905140917.48edcb06@e6520eb> <52287758.6050506@digi.com>
MIME-Version: 1.0
In-Reply-To: <52287758.6050506@digi.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-webserver] cherokee: fix SRC_URI
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
X-List-Received-Date: Thu, 05 Sep 2013 12:45:06 -0000
X-Groupsio-MsgNum: 46092
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LHvWgpbS7VDUdu2f"
Content-Disposition: inline

--LHvWgpbS7VDUdu2f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2013 at 02:21:44PM +0200, Javier Viguera wrote:
> Hi Eric
>=20
> On 05/09/13 14:09, Eric B=E9nard wrote:
> > in fact the correct URL is now :
> > https://github.com/cherokee/webserver/archive/v1.2.98.tar.gz
> > so I think you can switch to :
> > +SRC_URI =3D "https://github.com/cherokee/webserver/archive/v${PV}.tar.=
gz
>=20
> The problem with the "official" one in github is that it is not the=20
> same. The checksums are different and a basic *diff* verification=20
> between the unpacked packages shows a bunch of differences.

Yes and github tarballs seem to be regenerated on-demand or at least
sometimes, so checksums don't stay the same even if we update them now.

> The one in the OSUOSL is exactly the same (same checksums).
>=20
> Regarding the mirror policies i just don't know. I was bitten by this=20
> problem trying to build cherokee in Dylan branch and tried to find a=20
> mirror. I selected OSUOSL because of its track supporting open source=20
> projects.
>=20
> --=20
> Javier Viguera
> Software Engineer
> Digi International=AE Spain S.A.U.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LHvWgpbS7VDUdu2f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIofSMACgkQN1Ujt2V2gBwndgCfQH43Ho3sHtSbeJ3PCyighWQB
qccAnAzHHlE+wO2sdotmwDBllWe3a0x1
=vnF+
-----END PGP SIGNATURE-----

--LHvWgpbS7VDUdu2f--
