Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0313E605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 16:55:49 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id s7so1738397lbd.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8ID5Rq/baW8mYLC3qlCZe0+i3lpxBY7PKMdSwy2wLJk=;
	b=kpU8hvKkaKdRd69PTD3wLpv6CrEmp0mAM8GIKAAu6wtPfkmpMKO2oQ/yw5tpQTFH1V
	trUx9lL5myClATeYdbbUHtIQt563kXkhXGnWGI8o231WD0BBQwX4XDyPaBP5vjPxnqZ4
	BhtjrUcSHsWRM6VlQL97DwHXsMgbeKIZMFtS/s5DLDQKIKyztkaXuU0xrP1kvtuwUhtp
	AluIPw3knRgLE86JDbGDEky+LK+mp8qYE6eXVEt4u11THBh9/8tGbTqTGjmcU+7YXKFW
	ebvsRVaqJEZgYPjiQYFOCwMXg6l1DUnbECwzKxh4MpmTxRGvrucwUdA7wANcO2qZKl10
	yAEQ==
X-Received: by 10.112.180.225 with SMTP id dr1mr4133352lbc.51.1399481749863;
	Wed, 07 May 2014 09:55:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	to10sm12691502lbb.11.2014.05.07.09.55.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 09:55:48 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 May 2014 18:56:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Lewis, Nick" <nick.lewis@usa.g4s.com>
Message-ID: <20140507165610.GH30955@jama>
References: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC7@GBTWK10E001.Technology.local>
MIME-Version: 1.0
In-Reply-To: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC7@GBTWK10E001.Technology.local>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Subject: [PATCH] bitbake/fetch2: Fix refetch of local files when they are read only
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
X-List-Received-Date: Wed, 07 May 2014 16:55:53 -0000
X-Groupsio-MsgNum: 49774
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
Content-Disposition: inline

--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 02:16:04PM +0100, Lewis, Nick wrote:
> From 280ff24f597e5cf663c76fa90250cce229c6aac9 Mon Sep 17 00:00:00 2001
> From: Nick Lewis <nick.lewis@usa.g4s.com>
> Date: Wed, 7 May 2014 14:02:25 +0100
> Subject: [PATCH] Fix refetch of local files when they are read only

This belong to bitbake-devel ML

>=20
> Signed-off-by: Nick Lewis <nick.lewis@usa.g4s.com>
> ---
>  bitbake/lib/bb/fetch2/__init__.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__=
init__.py
> index 5a9c72f..f571fc4 100644
> --- a/bitbake/lib/bb/fetch2/__init__.py
> +++ b/bitbake/lib/bb/fetch2/__init__.py
> @@ -1251,7 +1251,7 @@ class FetchMethod(object):
>                          destdir =3D destdir.strip('/')
>                      if destdir !=3D "." and not os.access("%s/%s" % (roo=
tdir, destdir), os.F_OK):
>                          os.makedirs("%s/%s" % (rootdir, destdir))
> -                    cmd =3D 'cp -pPR %s %s/%s/' % (file, rootdir, destdi=
r)
> +                    cmd =3D 'cp -fpPR %s %s/%s/' % (file, rootdir, destd=
ir)
>                      #cmd =3D 'tar -cf - -C "%d" -ps . | tar -xf - -C "%s=
/%s/"' % (file, rootdir, destdir)
>                  else:
>                      # The "destdir" handling was specifically done for F=
ILESPATH
> @@ -1261,7 +1261,7 @@ class FetchMethod(object):
>                      else:
>                         destdir =3D "."
>                      bb.utils.mkdirhier("%s/%s" % (rootdir, destdir))
> -                    cmd =3D 'cp %s %s/%s/' % (file, rootdir, destdir)
> +                    cmd =3D 'cp -f %s %s/%s/' % (file, rootdir, destdir)
>=20
>          if not cmd:
>              return
> --
> 1.9.1
>=20
>=20
> Nick Lewis
> nick.lewis@usa.g4s.com
> +44 1684 277137
> www.g4stechnology.com
> New Challenge House, International Drive, Tewkesbury, Gloucestershire, GL=
20 8UQ, UK
>=20
> =EF=81=90 Please consider the environment before printing this email
>=20
>=20
> The details of this company are as follows:
> G4S Technology Limited, Registered Office: Challenge House, International=
 Drive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 238=
2338.
>=20
> This communication may contain information which is confidential, persona=
l and/or privileged.
>=20
> It is for the exclusive use of the intended recipient(s).
> If you are not the intended recipient(s), please note that any distributi=
on, forwarding, copying or use of this communication or the information in =
it is strictly prohibited.
>=20
> Any personal views expressed in this e-mail are those of the individual s=
ender and the company does not endorse or accept responsibility for them.
>=20
> Prior to taking any action based upon this e-mail message, you should see=
k appropriate confirmation of its authenticity.
>=20
> This e-mail has been scanned for all viruses by MessageLabs.
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNqZaoACgkQN1Ujt2V2gByh8wCgpgg10Ndf9Xkle2Ig5DlX4n+c
hkkAoLV7samyfYMYIewc3LoS0U1nH3xP
=aRI2
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--
