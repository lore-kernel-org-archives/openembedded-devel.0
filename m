Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6F15277000
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2015 06:27:46 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so6370523wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 23:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b/Unq5yA3QQ8tMui3DSJ6cPvJzV9hWENykefCSzJTec=;
	b=NMZcF2IYtFx9n5xUGl83oGdyW6x46rloZtvIe+yqOkU13mbx9oBnR2KhWpSJGwMp2r
	OQag7Qcfdv7S2nFSjIwbqSYgErXRVnuVVgyRxT8isZ1FmUkPMkRktMAuo8WgQxTZOnXe
	vHGOuBi++1X6sSNxUnGDUZiQUwj3Rioj6HAndoIzozEml2AV0VfdnKB/Ub73Nkak75br
	MFbXLdyFJeJIbYvOjsccKDfGXRtr1yJWKFPG/qYYZhdnnr51TU7gl2uPjtY+E8lFeDKM
	57VYWiONuzleIhybFUcqfasOQ5ZxsIQT7FCiwlEAR3ZlweENey9P3jjOUcrAUbpesP/Y
	ZsvQ==
X-Received: by 10.180.211.47 with SMTP id mz15mr1211681wic.93.1443162466143;
	Thu, 24 Sep 2015 23:27:46 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t7sm1612822wia.9.2015.09.24.23.27.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Sep 2015 23:27:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Sep 2015 08:28:06 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150925062806.GC2397@jama>
References: <5603FD45.5030308@topic.nl>
	<CALbNGRTopGO_K0BqpLaq27EeKhaC63QiE7Yo079PqOP5tQrSXA@mail.gmail.com>
	<5604D920.4030401@topic.nl>
MIME-Version: 1.0
In-Reply-To: <5604D920.4030401@topic.nl>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: "libgudev" fails to build with current master
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
X-List-Received-Date: Fri, 25 Sep 2015 06:27:46 -0000
X-Groupsio-MsgNum: 57546
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline

--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2015 at 07:18:24AM +0200, Mike Looijmans wrote:
> =EF=BB=BFOn 24-09-15 18:45, Andreas M=C3=BCller wrote:
> > On Thu, Sep 24, 2015 at 3:40 PM, Mike Looijmans <mike.looijmans@topic.n=
l> wrote:
> >> | checking for LIBUDEV... no
> >> | configure: error: Package requirements (libudev >=3D 199) were not m=
et:
> >> |
> >> | Requested 'libudev >=3D 199' but version of libudev is 182
> >> |
> >> ...
> >>
> >> ERROR: Task 5548
> >> (/.../meta-oe/meta-oe/recipes-gnome/libgudev/libgudev_230.bb, do_confi=
gure)
> >> failed with exit code '1'
> >>
> >>
> > Which init system are you using - I guess not systemd
>=20
> sysvinit (busybox).
>=20
> I don't even use udev. But some packages think they depend on udev compon=
ents,=20
> so it's virtually impossible to not have udev being built.
>=20
>=20
> I wonder how the init system would affect compilation of a package though.

When you use systemd, you get newer udev version from systemd recipe.

Standalone udev recipe (used together with other init systems) is older ver=
sion
(which includes libgudev), and apparently not good enough for building late=
st
standalone libgudev.

>=20
> M.
>=20
>=20
> Kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> Telefax: +31 (0) 499 33 69 70
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>=20
> Please consider the environment before printing this e-mail
>=20
>=20
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYE6XUACgkQN1Ujt2V2gByPhwCfYY3aEjZOP/Tg74qKzo5skua6
MmMAn2ObTQbA631EnFnIINwPBTt/8MIj
=I6gB
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
