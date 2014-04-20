Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 30C5365DBE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:49:40 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so2921214eek.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0cQjbWKwhPG88Ft8+lP9fch6lmjbrJohTpaJMXU+MnQ=;
	b=eFKwKT117HufhTE04D69RoGJV0XauSCG5pVVi8Tm+zLLrPI5T6CN6eQXP0xiXdAuNH
	AtJDvG7NXsXKmnL7JnZzvxq6qx5TCIa6hnSwinhX2E3ywLELVzWGT1vQizpqsE8FaUeI
	zEMiPP9cSK2vvqV2pGZe5+tAWu//+yS3UMaEgnjSGNQULZ/0KTbjOU5mMzFDXHbUGUQT
	QmwSTv9g2jG4CXefQoy4zVqJjT4YCnil+5nFLael5xBWOPTNm0Ai7ElLIFeHTezFmleH
	8m76KsneotxhEqtZZRNmbkHNltqx3lNHs3xXrZYUn2KbTy5x0AyfDT4dJTJLNtOOqKm3
	PWuw==
X-Received: by 10.15.43.132 with SMTP id x4mr38006528eev.59.1397994581576;
	Sun, 20 Apr 2014 04:49:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h47sm93966356eey.13.2014.04.20.04.49.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:49:40 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:49:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420114945.GG2486@jama>
References: <1397633550-19323-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1397633550-19323-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 0/2] avoid nautilus build by default
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
X-List-Received-Date: Sun, 20 Apr 2014 11:49:41 -0000
X-Groupsio-MsgNum: 49340
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7/IUJOcl5c0tDlVH"
Content-Disposition: inline

--7/IUJOcl5c0tDlVH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2014 at 09:32:28AM +0200, Andreas M=FCller wrote:
> There is no reason why we need to build nautilus when using evince and/or
> gnome-disk-utility.

Both merged, thanks!

>=20
> Andreas M=FCller (2):
>   evince: make nautilus extension a PACKAGECONFIG and disable by default
>   gnome-disk-utility: change PACKAGECONFIG default: remove nautilus
>=20
>  meta-gnome/recipes-gnome/evince/evince_2.32.0.bb                    | 6 =
++++--
>  .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb   | 4 =
++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>=20
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7/IUJOcl5c0tDlVH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTtFkACgkQN1Ujt2V2gBxvOwCfUVQeVGPLVD0I1OzyzbYMeAv4
wK0AnijZVrXx8Z5OuM+3BztH9IEkDz0Z
=PLHv
-----END PGP SIGNATURE-----

--7/IUJOcl5c0tDlVH--
