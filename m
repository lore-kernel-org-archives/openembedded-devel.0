Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id CBCCD6CA88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 17:54:30 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so707149eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 10:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7agdkpBFY0lfvhGYCtdnvYQtDLei8qoepB7pWBAvA6E=;
	b=YtbayYIGtB2eWd0awXXDXPXFa0gYpEwRYMor2Qt09FGt290PrN1XuItWTuSSJY/zct
	OCuCA88iUQHeLVkn1nact0GVozfh2JTHseAKozRDztqY/e0bV06bJ4NiywnNVs1dVRPy
	J2C9qXHqMY1OpiysUNdeXm+SJxozylGaMepZOMF1AP7GWbWT2cbUcG9Kk32VVCkO7fJv
	vKO/n+KSgTcdadqjWBqwAp2D3tTpdGGpEhl2cvXVH57jFeRBOFafFfJ5+xE3UIPNISFJ
	2rniAdrIurUgk+lo3YhT9yVH+g8WqJ4urcJP7eWDcLJLWICr1CNrUDPtuKNhGOXbvAo8
	aX+w==
X-Received: by 10.14.107.68 with SMTP id n44mr3217477eeg.26.1380218071889;
	Thu, 26 Sep 2013 10:54:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm6587614eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 26 Sep 2013 10:54:31 -0700 (PDT)
Date: Thu, 26 Sep 2013 19:54:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130926175437.GA3902@jama>
References: <CAHTvVMe_qJ+k6gDMxnn=A=O3cemKz+cmGpsDWBOSg6VFqEzefA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHTvVMe_qJ+k6gDMxnn=A=O3cemKz+cmGpsDWBOSg6VFqEzefA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl] question about OpenGL ES and Evas
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
X-List-Received-Date: Thu, 26 Sep 2013 17:54:31 -0000
X-Groupsio-MsgNum: 46365
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2013 at 06:26:29PM +0200, Nicolas Aguirre wrote:
> Hi,
>=20
> I'm building an image based on meta-efl.
> I added recipes to build OpenGL ES for my hardware (allwinner sunxi
> based processor with mali gpu) but i'm facing a problem.
> When Evas is build, it will try to find gles includes in sysroot. If
> they are found, it's correctly built with this support. So i need to
> build and install all this stuff before building evas.
> Which is not always the case, when i build an image from scratch for exam=
ple
>=20
> I would like to know wihch is the best practice in this case ?
>=20
> - Add a bbappend to evas in my specific case ?
> - Modify evas recipe upstream : detect opengl in distro feature and
> add a dependency on virtual/gl in this case ?
> - Another solution ?

Combination of above :)

1) it has to be either explicitly enabled or disable, it shouldn't
autodetect it from sysroot (it doesn't detect mesa, otherwise my scripts
would find it already).

2) best way would be PACKAGECONFIG in upstream recipe and default value
can be set from DISTRO_FEATURES

3) people who don't want to enable ES (e.g. with only mesa sw available)
will be able to disable PACKAGECONFIG for that with simple .bbpappend
even when they have opengl in DISTRO_FEATURES

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJEdN0ACgkQN1Ujt2V2gBxCvQCdHYQ542lzeyroKdVXX/xjBihh
LG4AoKel91+eTXQDHK51JbakO5WUeCY2
=cFNF
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
